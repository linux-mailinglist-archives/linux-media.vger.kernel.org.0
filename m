Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01E43216D7C
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2020 15:10:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726900AbgGGNK5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jul 2020 09:10:57 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:41531 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725944AbgGGNK5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 7 Jul 2020 09:10:57 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id snMVjDAkJBncFsnMZjwRjB; Tue, 07 Jul 2020 15:10:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1594127455; bh=pd3a3+tEKDT43eb/Wrq0L50i+p5wtv9fUZJAnoZ+LG8=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=dc9SnNiqx9PMcKKDrS5v0yHh5kuk7+vKs1m3SicQHhpEPdJuIBpSrDu4uszffwRDU
         LK9ngfO99k0sRJhoqyhQHm+wWRpzS5SYyt7JiWfDTP7MDgiiAnNC9ptpSkGfgMkRm+
         0tCNUq8qYlQFqyR6EuOGQrppbXqq4ras6m5YwkleXIzzpsSMhCqhZT0acjMZjvjHi2
         dGthOMLObGhToGjStTp/LIYwoXVhDjWbwC0IyW0suitjD6XofSuDd18/8YBknzx4+G
         ZOjUhPFDxUKnBVWVz7SdHk4imGgjja0+h6cFPzMEogpOa4JtHgLYluBPPTJ/x9AN4+
         F/L4q6M7wQ8Iw==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Maxime Ripard <mripard@kernel.org>,
        Yong Deng <yong.deng@magewell.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] sunxi-csi: fill in bus_info of media device
Message-ID: <94a6af12-23b5-435c-8604-6eedfb5aa41c@xs4all.nl>
Date:   Tue, 7 Jul 2020 15:10:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfGhYw2tv9W4XA7T76rJJ8rYnySuzTnM3dv7hTuAu/gYuIkpsH6kxzXL3ysYbEjBSSPfPLR30X4VGPHeutuujDxeoUqEC73Ayus+1RW2h/94SPjNuLGz+
 QXu59TAIAbHJ4OG6gXgIRhjOqE6Kk/ennqrnYEYYX5hTlKHT0jR68ya/p0iheB0W+fv5iWRU5MMBK9N6RduuPsR/JTyDxuBTjxaDd21dnYge+5z/NRc5ZYL+
 8OYQ+YVQ/HHAjQGQ53edjg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This fixes a v4l2-compliance warning:

Required ioctls:
                warn: v4l2-test-media.cpp(52): empty bus_info
        test MEDIA_IOC_DEVICE_INFO: OK

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c | 2 ++
 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
index eff34ded6305..5319eb1ab309 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
@@ -191,6 +191,8 @@ static int sun4i_csi_probe(struct platform_device *pdev)
 	strscpy(csi->mdev.model, "Allwinner Video Capture Device",
 		sizeof(csi->mdev.model));
 	csi->mdev.hw_revision = 0;
+	snprintf(csi->mdev.bus_info, sizeof(csi->mdev.bus_info), "platform:%s",
+		 dev_name(csi->dev));
 	media_device_init(&csi->mdev);
 	csi->v4l.mdev = &csi->mdev;

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
index 055eb0b8e396..28e89340fed9 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
@@ -733,6 +733,8 @@ static int sun6i_csi_v4l2_init(struct sun6i_csi *csi)
 	strscpy(csi->media_dev.model, "Allwinner Video Capture Device",
 		sizeof(csi->media_dev.model));
 	csi->media_dev.hw_revision = 0;
+	snprintf(csi->media_dev.bus_info, sizeof(csi->media_dev.bus_info),
+		 "platform:%s", dev_name(csi->dev));

 	media_device_init(&csi->media_dev);
 	v4l2_async_notifier_init(&csi->notifier);
-- 
2.27.0

