Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC2392790B4
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 20:35:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730130AbgIYSe4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 14:34:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729789AbgIYSe4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 14:34:56 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2D86C0613D3
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:34:55 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id 34so3290407pgo.13
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=eGss8+t6OprF5UmZdfe832aJr+yAfFeel7PXaUvFcKo=;
        b=VAyvilvedlnkS93GVV1oKMBEvjod0xjaY2oW9WS1s6rsneDaTdK+6/6d8t3J0TSLmk
         9KvQHn/LPw06+kBHFE4FYeXLS3H2jwe1Io9FKt3HAeTPm2ueIMnoS06DzDI5EszUrEhF
         cx/pjU/pwSXNsMMeanAfkfhpj3Nu+Dz59mDSPVBEXaBuHmt2qvyi4BsYc6n6gh/mhnKJ
         pxdSBDj8A/ZJSo6YlwB6ixKA+jbhkDQFgyQNncnFZRLl1gWOCJ7OBUzb4cBwb5doZCCH
         YsC/c0++45Zm1D2KvM8+ve8H7i6ktbd9QyvMZXpwrVNfMNjfdIH1BXTq1jJyvUrINGuP
         g74w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=eGss8+t6OprF5UmZdfe832aJr+yAfFeel7PXaUvFcKo=;
        b=BL0Y9XDP9THQcolDVWL+lFXN4aud3HGrN5xZhPd+PzizlHchlWXbuI+egFwFPCS6tU
         ulj0JiGZ/N2aqlbN+/jhFn+BCpXMIHwas4xowBMtPGjxtRwVBRWxm55uBZEKPt9exPaq
         z0XOTKPQOVhBmGYRRhMP4aF/zp6YtiUsil1X9bBajhT7jQyGxTltlMdBSoL3h3ktm6sy
         w/j64LhBw57ktAsdkwfF7FrdfATZGtqkdIRaWVyOGx/cz0Ftjerime7ScuTt+gwMInbA
         D7z4BjUYRURNIlmONLC4G+jok2htFuTcWCw1EvF5N2yC/pQlv8RupHq+2nlh/aFI5pV3
         vRSA==
X-Gm-Message-State: AOAM530MsF+hyY2CIO8DniMfrMd/UzSADRvYc2ZvSpZpVcFFL7UIrgnm
        swBUGpYZjE6RNten00j2TnJlhQ==
X-Google-Smtp-Source: ABdhPJyIeUhoYsAiV5pwMCK+Diqqef8AeIh2gqDMfPUnwkE95WoqoeFZ+v2FX1MubgBx11C/VvlKpA==
X-Received: by 2002:a17:902:9e95:b029:d2:4276:1ddc with SMTP id e21-20020a1709029e95b02900d242761ddcmr702834plq.81.1601058895490;
        Fri, 25 Sep 2020 11:34:55 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id r16sm2554546pjo.19.2020.09.25.11.34.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Sep 2020 11:34:55 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, mchehab@kernel.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC v2 37/47] staging: media: zoran: disable output
Date:   Fri, 25 Sep 2020 18:30:47 +0000
Message-Id: <1601058657-14042-38-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
References: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Zoran is picky about jpeg data it accepts. At least it seems to not support COM and APPn.
So until a way to filter data will be done, disable output.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran_card.c   |  2 ++
 drivers/staging/media/zoran/zoran_driver.c | 20 ++++++++++++--------
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
index fed368ba6fd1..dbdb1c4b0515 100644
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -963,6 +963,8 @@ static int zr36057_init(struct zoran *zr)
 	*zr->video_dev = zoran_template;
 	zr->video_dev->v4l2_dev = &zr->v4l2_dev;
 	zr->video_dev->lock = &zr->lock;
+	zr->video_dev->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_CAPTURE;
+
 	strscpy(zr->video_dev->name, ZR_DEVNAME(zr), sizeof(zr->video_dev->name));
 	/*
 	 * It's not a mem2mem device, but you can both capture and output from one and the same
diff --git a/drivers/staging/media/zoran/zoran_driver.c b/drivers/staging/media/zoran/zoran_driver.c
index e962fc6c1f9f..43f7c0c02876 100644
--- a/drivers/staging/media/zoran/zoran_driver.c
+++ b/drivers/staging/media/zoran/zoran_driver.c
@@ -1082,8 +1082,7 @@ static int zoran_querycap(struct file *file, void *__fh, struct v4l2_capability
 	strscpy(cap->card, ZR_DEVNAME(zr), sizeof(cap->card));
 	strscpy(cap->driver, "zoran", sizeof(cap->driver));
 	snprintf(cap->bus_info, sizeof(cap->bus_info), "PCI:%s", pci_name(zr->pci_dev));
-	cap->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_CAPTURE |
-			   V4L2_CAP_VIDEO_OUTPUT;
+	cap->device_caps = zr->video_dev->device_caps;
 	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
 	return 0;
 }
@@ -2221,6 +2220,11 @@ static int zoran_mmap(struct file *file, struct vm_area_struct *vma)
 	return res;
 }
 
+/*
+ * Output is disabled temporarily
+ * Zoran is picky about jpeg data it accepts. At least it seems to unsupport COM and APPn.
+ * So until a way to filter data will be done, disable output.
+ */
 static const struct v4l2_ioctl_ops zoran_ioctl_ops = {
 	.vidioc_querycap		    = zoran_querycap,
 	.vidioc_s_selection		    = zoran_s_selection,
@@ -2228,9 +2232,9 @@ static const struct v4l2_ioctl_ops zoran_ioctl_ops = {
 	.vidioc_enum_input		    = zoran_enum_input,
 	.vidioc_g_input			    = zoran_g_input,
 	.vidioc_s_input			    = zoran_s_input,
-	.vidioc_enum_output		    = zoran_enum_output,
+/*	.vidioc_enum_output		    = zoran_enum_output,
 	.vidioc_g_output		    = zoran_g_output,
-	.vidioc_s_output		    = zoran_s_output,
+	.vidioc_s_output		    = zoran_s_output,*/
 	.vidioc_g_fbuf			    = zoran_g_fbuf,
 	.vidioc_s_fbuf			    = zoran_s_fbuf,
 	.vidioc_g_std			    = zoran_g_std,
@@ -2244,13 +2248,13 @@ static const struct v4l2_ioctl_ops zoran_ioctl_ops = {
 	.vidioc_streamon		    = zoran_streamon,
 	.vidioc_streamoff		    = zoran_streamoff,
 	.vidioc_enum_fmt_vid_cap	    = zoran_enum_fmt_vid_cap,
-	.vidioc_enum_fmt_vid_out	    = zoran_enum_fmt_vid_out,
+/*	.vidioc_enum_fmt_vid_out	    = zoran_enum_fmt_vid_out,*/
 	.vidioc_g_fmt_vid_cap		    = zoran_g_fmt_vid_cap,
-	.vidioc_g_fmt_vid_out               = zoran_g_fmt_vid_out,
+/*	.vidioc_g_fmt_vid_out               = zoran_g_fmt_vid_out,*/
 	.vidioc_s_fmt_vid_cap		    = zoran_s_fmt_vid_cap,
-	.vidioc_s_fmt_vid_out               = zoran_s_fmt_vid_out,
+/*	.vidioc_s_fmt_vid_out               = zoran_s_fmt_vid_out,*/
 	.vidioc_try_fmt_vid_cap		    = zoran_try_fmt_vid_cap,
-	.vidioc_try_fmt_vid_out		    = zoran_try_fmt_vid_out,
+/*	.vidioc_try_fmt_vid_out		    = zoran_try_fmt_vid_out,*/
 	.vidioc_subscribe_event             = v4l2_ctrl_subscribe_event,
 	.vidioc_unsubscribe_event           = v4l2_event_unsubscribe,
 };
-- 
2.26.2

