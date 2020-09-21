Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD99C272063
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 12:23:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727015AbgIUKVP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 06:21:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727005AbgIUKVO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 06:21:14 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2387FC0613D1
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:21:14 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id y15so12017119wmi.0
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Go04h4cBZb8oManNnBUCEv0xT9mbFOVFD/8tb3hzAWA=;
        b=B0KJNIujqWSJKiTDeZnTlqwipUX6r3YfWEvq0cg/FTY1nbvCf44+V12zE/P+TK8yc4
         IYJMTjR653cKibE9xcUEnJXi/bcA6biRg626F6nkeixexu3kBXmM+EaMFJ7ex+L6QatM
         IMdqzflT53PYZViuhqE9bVztQ959JmLH6cbkK6lnMv5ayh0JId6a+5gowWauFiivSiPq
         LQsMn/hJtPZ8+hjrO8OVN6MYO+bZNdCWBU43/2biQSM9VxjIutjMrg2pwXkyWM8nP2e0
         lm0zNJTdizABDmwyy6uVAeNjkv6/+HHrAYJi1/rQMyEkxI713J6IcqvUykAl/OR2KR8c
         /BVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Go04h4cBZb8oManNnBUCEv0xT9mbFOVFD/8tb3hzAWA=;
        b=SGuxGA2iXgZQCUT4jTTkBRj1h/nxskNsIwuKsxOMvuiCMvP93hhcRMeI2G1r+iZRgt
         ZMgly/yaigvisCyhhHQXklbNwpsC8ARP90Hjw0bYSh2UW7rhcjFfdF3rSo70gxFO0khZ
         JLuvwVvQdFC+LXF8Gn7h8jzuBf28QhlxjY0zh9vQe/y8NrqNIzYIau+R+9ALGRJv+3Ey
         eyt/7Mvjj2aBaZJEwnpSKJarnVHpf3mqh1+9HPp97qoeOm4tgGfXBUsWFDkpDGVa06Gz
         d+hCfAjjEtYhe47uqg68LoXfOVnymnDfzCnIMiRc+FeDkurC6lMd/FeYjERFa4MrnEF6
         A13g==
X-Gm-Message-State: AOAM533vaICSoDIZS02zSpCpby2NXUs9tnx/CIshhHDrvRKXB+Fv+ioy
        cQcQQDpA2PQ/ui88N8Pflbl9vA==
X-Google-Smtp-Source: ABdhPJznbbQ885WNgPecxK2K2Os4ZRphFdWauz9bE1BZIsLl7gLHwuQXxk1MFKHFhYL5ZQZwL9U6/w==
X-Received: by 2002:a7b:c0ca:: with SMTP id s10mr29337577wmh.103.1600683672894;
        Mon, 21 Sep 2020 03:21:12 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id l17sm18804629wme.11.2020.09.21.03.21.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Sep 2020 03:21:12 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, laurent.pinchart@skynet.be,
        mchehab@kernel.org
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC 43/49] staging: media: zoran: add vidioc_g_parm
Date:   Mon, 21 Sep 2020 10:20:18 +0000
Message-Id: <1600683624-5863-44-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
References: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Adding vidioc_g_parm made v4l compliance happy.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran_driver.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/staging/media/zoran/zoran_driver.c b/drivers/staging/media/zoran/zoran_driver.c
index 0b4bfc184b57..46bf8b32d57a 100644
--- a/drivers/staging/media/zoran/zoran_driver.c
+++ b/drivers/staging/media/zoran/zoran_driver.c
@@ -2120,6 +2120,14 @@ static int zoran_mmap(struct file *file, struct vm_area_struct *vma)
 	return res;
 }
 
+static int zoran_g_parm(struct file *file, void *priv, struct v4l2_streamparm *parm)
+{
+	if (parm->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		return -EINVAL;
+
+	return 0;
+}
+
 /*
  * Output is disabled temporarily
  * Zoran is picky about jpeg data it accepts. At least it seems to unsupport COM and APPn.
@@ -2127,6 +2135,7 @@ static int zoran_mmap(struct file *file, struct vm_area_struct *vma)
  */
 static const struct v4l2_ioctl_ops zoran_ioctl_ops = {
 	.vidioc_querycap		    = zoran_querycap,
+	.vidioc_g_parm			    = zoran_g_parm,
 	.vidioc_s_selection		    = zoran_s_selection,
 	.vidioc_g_selection		    = zoran_g_selection,
 	.vidioc_enum_input		    = zoran_enum_input,
-- 
2.26.2

