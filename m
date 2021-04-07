Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E6CD356E36
	for <lists+linux-media@lfdr.de>; Wed,  7 Apr 2021 16:12:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343942AbhDGOMN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Apr 2021 10:12:13 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:34287 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234168AbhDGOML (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 7 Apr 2021 10:12:11 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id U8uTlSN3QMxedU8uWlIjtd; Wed, 07 Apr 2021 16:12:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1617804720; bh=Xx5kbZ9xpKm/0KgyCLD8S8JRZ8Q8d2Cjm/dXc0bmx88=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=a1lyi849PDejn+dQcTqMjq6j8n8Uf47uBo7Yj0lc7BiP9E06E5g7QLKMHJkm5xfuv
         ooOKVMNWvmJmw/g5mQWvW25WpxrcNybEU/AaFq+/QYZ45rNSFZEeYXHqkn6ZojBybZ
         d+uk/76QZLw5jigJP2Yjv/i+7NnAZx4VTPHwC97sXJl0YfZ9dHZt353hKaFzZa554v
         /j5+bo/a8ueDMo6CMdj6b5iSJ6iJU0W0OjNQDhsiAGk+Jcxt0jkSjytFwVjOy71FvW
         gOnXVOMV4k9XnqFjVru1ki3wYc3g3+9LtBSa7Dqcm9uh5Sfr+zegP8GRjYoToCuj+R
         jVb3K8pZKj7Aw==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] cobalt: drop static for sd_fmt
Message-ID: <ed6cecc3-14e0-2cbc-8722-b1baa814ffe3@xs4all.nl>
Date:   Wed, 7 Apr 2021 16:11:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfLl2zXgLtQmfUleuRQQH7t9HxU1UJ6hMojTleN1FPqf2LXh2pjcU1ovHn89fDRdMlKqf+NIn2uOwBQyys+VgpMDJ6RX6oNC2qENfnvkThUTiNvmB34Kd
 k4+WAAMdNcrARwegbETqJd08C59yiwCbNoB8mD+jD0RALKe85scQHk4drqizKeIf2Sb8Eu5j+Y+kGQYQ4a0Deg5lcVS8FWCBIDs=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The struct v4l2_subdev_format sd_fmt cannot be static since it can be
written back by the subdev. Just have it on the stack.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/pci/cobalt/cobalt-driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/cobalt/cobalt-driver.c b/drivers/media/pci/cobalt/cobalt-driver.c
index 9c754e01c186..839503e654f4 100644
--- a/drivers/media/pci/cobalt/cobalt-driver.c
+++ b/drivers/media/pci/cobalt/cobalt-driver.c
@@ -572,7 +572,7 @@ static int cobalt_subdevs_hsma_init(struct cobalt *cobalt)
 		.addr = 0x20,
 		.platform_data = &adv7842_pdata,
 	};
-	static struct v4l2_subdev_format sd_fmt = {
+	struct v4l2_subdev_format sd_fmt = {
 		.pad = ADV7842_PAD_SOURCE,
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 		.format.code = MEDIA_BUS_FMT_YUYV8_1X16,
-- 
2.30.2

