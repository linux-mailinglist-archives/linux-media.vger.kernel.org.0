Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD96727206E
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 12:23:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbgIUKVj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 06:21:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727029AbgIUKVS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 06:21:18 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC50AC0613CF
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:21:17 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id a17so12111839wrn.6
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=RIxqrjQzxmUx/C1l9QN0BxpXdxp1TQXVDUqwtk+yQg0=;
        b=WzyPNmX2N6lGDLueSv/Dd9pbNEM61dj6yDxgkEftcUB5YxQdfw9BUboU1XrvPU/VEB
         mXN19NlYobOb2LCgz4qd8ogID8bM2Gp+jssDpbM3tlEPXKJGz5vowuIJ9eO4eaNpCIuo
         Be8vh2fcJchmuhEE5/i47NGAeTVMdz35h01BEFAetiQ4Md4CUJGq9EK2iEpb74p1xe15
         RnTRTrjCxdbF/X3Hbu7DHW41FE1BfO11hjd+Bz6SyDs1rU3gW2wcDT/ww42Sl4xxhveB
         WRQzA08eozi665ypWwfQRQK1uRJLmVu2HxCRpjpSFNZ1IiiafkgWsjld1X7gU+jwj2dW
         MVYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=RIxqrjQzxmUx/C1l9QN0BxpXdxp1TQXVDUqwtk+yQg0=;
        b=AqswTBYtqRIhnE3BZTvEHiyakKfdnrCxNYmjncp0vfTgbhv8/OiaN5aIcEYHZp/zqW
         pN5IUCWpiXE2LIGN3PvRkrnTYg/JyqmMvyfl7x1Ef/7n+AdWPQtjEiLxRxueEVXa8QkK
         HyQcEKgJT0a0LHggqrsO/bm8UnMhPOVf/C1f458ojYJq8qSHfQTfEi0Pq+Bas9rWLyEo
         znCGNDSba7tcEB+SHLdLwrUJDuP48xg12K1h6dZxrOOFQasewlO2Dj03eABChvkqil+e
         TWHEL1b685nxS7fF9h6DUEEqpAtYiSx0rRNaETMRoClgtFzhWZ1wcW+o4JZLoIVrbDYX
         OD8Q==
X-Gm-Message-State: AOAM532fIajbmWNpwWggKsWycx3lRVAgW4bzickgzSCrNDa93hl0d+EW
        Z143iE1MUp/mpQbNVmdJGfkjLQ==
X-Google-Smtp-Source: ABdhPJyvum4Tk1XTQ5wzxOPoCoiJUJN8cULOoE6NPn8uIjvz4mHVGpfVrzTq26Dandr2et7c0pUeOg==
X-Received: by 2002:adf:f586:: with SMTP id f6mr51499931wro.299.1600683676695;
        Mon, 21 Sep 2020 03:21:16 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id l17sm18804629wme.11.2020.09.21.03.21.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Sep 2020 03:21:16 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, laurent.pinchart@skynet.be,
        mchehab@kernel.org
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC 47/49] staging: media: zoran: remove deprecated .vidioc_g_jpegcomp
Date:   Mon, 21 Sep 2020 10:20:22 +0000
Message-Id: <1600683624-5863-48-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
References: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patchs removed the deprecated .vidioc_g_jpegcomp and replace it
with corresponding v4l2_ctrl_ops code.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran_card.c   | 22 ++++++++++
 drivers/staging/media/zoran/zoran_driver.c | 48 ----------------------
 2 files changed, 22 insertions(+), 48 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
index e4688891d307..ca998f0000c2 100644
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -1056,6 +1056,25 @@ static void zoran_subdev_notify(struct v4l2_subdev *sd, unsigned int cmd, void *
 		GPIO(zr, 7, 1);
 }
 
+static int zoran_video_set_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct zoran *zr = container_of(ctrl->handler, struct zoran, hdl);
+
+	switch (ctrl->id) {
+	case V4L2_CID_JPEG_COMPRESSION_QUALITY:
+		zr->jpg_settings.jpg_comp.quality = ctrl->val;
+		return zoran_check_jpg_settings(zr, &zr->jpg_settings, 0);
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct v4l2_ctrl_ops zoran_video_ctrl_ops = {
+	.s_ctrl = zoran_video_set_ctrl,
+};
+
 /*
  *   Scan for a Buz card (actually for the PCI controller ZR36057),
  *   request the irq and map the io memory
@@ -1096,6 +1115,9 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (v4l2_ctrl_handler_init(&zr->hdl, 10))
 		goto zr_unreg;
 	zr->v4l2_dev.ctrl_handler = &zr->hdl;
+	v4l2_ctrl_new_std(&zr->hdl, &zoran_video_ctrl_ops,
+			  V4L2_CID_JPEG_COMPRESSION_QUALITY, 0,
+			  100, 1, 50);
 	spin_lock_init(&zr->spinlock);
 	mutex_init(&zr->lock);
 	if (pci_enable_device(pdev))
diff --git a/drivers/staging/media/zoran/zoran_driver.c b/drivers/staging/media/zoran/zoran_driver.c
index 4299578c9bb5..8c23bb4f6b71 100644
--- a/drivers/staging/media/zoran/zoran_driver.c
+++ b/drivers/staging/media/zoran/zoran_driver.c
@@ -1833,52 +1833,6 @@ static int zoran_s_selection(struct file *file, void *__fh, struct v4l2_selectio
 	return res;
 }
 
-static int zoran_g_jpegcomp(struct file *file, void *__fh, struct v4l2_jpegcompression *params)
-{
-	struct zoran *zr = video_drvdata(file);
-
-	memset(params, 0, sizeof(*params));
-
-	params->quality = zr->jpg_settings.jpg_comp.quality;
-	params->APPn = zr->jpg_settings.jpg_comp.APPn;
-	memcpy(params->APP_data, zr->jpg_settings.jpg_comp.APP_data,
-	       zr->jpg_settings.jpg_comp.APP_len);
-	params->APP_len = zr->jpg_settings.jpg_comp.APP_len;
-	memcpy(params->COM_data, zr->jpg_settings.jpg_comp.COM_data,
-	       zr->jpg_settings.jpg_comp.COM_len);
-	params->COM_len = zr->jpg_settings.jpg_comp.COM_len;
-	params->jpeg_markers = zr->jpg_settings.jpg_comp.jpeg_markers;
-
-	return 0;
-}
-
-static int zoran_s_jpegcomp(struct file *file, void *__fh,
-			    const struct v4l2_jpegcompression *params)
-{
-	struct zoran_fh *fh = __fh;
-	struct zoran *zr = fh->zr;
-	int res = 0;
-	struct zoran_jpg_settings settings;
-
-	settings = zr->jpg_settings;
-
-	settings.jpg_comp = *params;
-
-	if (fh->buffers.active != ZORAN_FREE) {
-		pci_warn(zr->pci_dev, "VIDIOC_S_JPEGCOMP called while in playback/capture mode\n");
-		res = -EBUSY;
-		return res;
-	}
-
-	res = zoran_check_jpg_settings(zr, &settings, 0);
-	if (res)
-		return res;
-	if (!fh->buffers.allocated)
-		zr->buffer_size = zoran_v4l2_calc_bufsize(&zr->jpg_settings);
-	zr->jpg_settings.jpg_comp = settings.jpg_comp;
-	return res;
-}
-
 static __poll_t zoran_poll(struct file *file, poll_table  *wait)
 {
 	struct zoran_fh *fh = file->private_data;
@@ -2159,8 +2113,6 @@ static const struct v4l2_ioctl_ops zoran_ioctl_ops = {
 	.vidioc_s_output		    = zoran_s_output,*/
 	.vidioc_g_std			    = zoran_g_std,
 	.vidioc_s_std			    = zoran_s_std,
-	.vidioc_g_jpegcomp		    = zoran_g_jpegcomp,
-	.vidioc_s_jpegcomp		    = zoran_s_jpegcomp,
 	.vidioc_reqbufs			    = zoran_reqbufs,
 	.vidioc_querybuf		    = zoran_querybuf,
 	.vidioc_qbuf			    = zoran_qbuf,
-- 
2.26.2

