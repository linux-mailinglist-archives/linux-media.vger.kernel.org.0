Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27C0B272050
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 12:23:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726898AbgIUKVA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 06:21:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726454AbgIUKU6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 06:20:58 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 301E6C0613D3
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:20:52 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id z1so12137790wrt.3
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=WbLdbCFFX9H/4tk9cPHCjm3oFnAaEXbZXA9/HfChnUA=;
        b=WOAHMWOnrWAaxpW+HjgdPUb2Lek9ffD3Khhk3iCttrEAjpwMk+5b0Jtd7cYshFhFGr
         v5qXV1LqDVy3LiaC0byTnDhdXPW9u+vGSb5qqmbcb1ysPBogRJT8vNFN9EWawYHxpQy0
         eyZ/POQwaG8/CCFxE+7tDOpg0wq4yfiArWTkNmIoA/I8P7xGdSkuz92GQ1wdwkpbik4a
         xcw/uAkpipD+GJmktYAka8dPIDZ9//FfbrG7AXK2uKFsAXaYub08YnOprhlzSc7UulfM
         P/F0U6nbRapN1XaGc60W5XpG3W9IbYXulIhQUQy/5Cp+BQcJzsmSQ2+DHKweQAwkhHwj
         rHFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=WbLdbCFFX9H/4tk9cPHCjm3oFnAaEXbZXA9/HfChnUA=;
        b=S9XnLCNvbfIUr7liO4xNUwOs7B9+GCpg2JcR5MDcr/7w7+j3kj5ZKTKrlYf2gFJlIy
         xNPZ4OczBzUWs3ir/Y8i/8nhg/T7hlY6fhacX4DM+RBhXm+idtQrdea5MSfMSAVhDd2d
         bQ2kmXmLeyd7b1/lIX79kudFCrVuGCihI0W8DHwGW0FDIKPQEhwUFTu1hfl0gHOX+cfG
         Nv+nvgWnV3MUp+kXIt4JEP/9LkAybAVc8kqhjGiLhH5QDqXzpuo2Hid7zaSXWG6mKM2J
         Cxs9oEJwtw7oZ13ehLGDC09NoYGcquclm9XZEcTgmnF4dzg3McJFBOtOc24aE85daokC
         hM4A==
X-Gm-Message-State: AOAM533HYuKJeWHhFX6dFuljV8KB5YuEGBeF5kHRPlA0fSX7PvyGQ4l8
        Gzqf2i6k56b5Oi2v6y7o93TPZA==
X-Google-Smtp-Source: ABdhPJwU7haxnxB+0U7u65gtoF/0p6meObcC123E3lmUNE6zdJgB5swqrh/6omxrLHOcw41agcFznA==
X-Received: by 2002:adf:fd90:: with SMTP id d16mr51954940wrr.52.1600683650758;
        Mon, 21 Sep 2020 03:20:50 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id l17sm18804629wme.11.2020.09.21.03.20.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Sep 2020 03:20:50 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, laurent.pinchart@skynet.be,
        mchehab@kernel.org
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC 19/49] staging: media: zoran: move jpg_settings out of zoran_fh
Date:   Mon, 21 Sep 2020 10:19:54 +0000
Message-Id: <1600683624-5863-20-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
References: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We need to get rid of zoran_fh, so move the jpg_settings directly in the
zoran structure.
Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran.h        |   2 -
 drivers/staging/media/zoran/zoran_driver.c | 103 ++++++++++-----------
 2 files changed, 47 insertions(+), 58 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran.h b/drivers/staging/media/zoran/zoran.h
index a529b49888c6..7e6e03563a2a 100644
--- a/drivers/staging/media/zoran/zoran.h
+++ b/drivers/staging/media/zoran/zoran.h
@@ -216,8 +216,6 @@ struct zoran_fh {
 	enum zoran_lock_activity overlay_active;/* feature currently in use? */
 
 	struct zoran_buffer_col buffers;	/* buffers' info */
-
-	struct zoran_jpg_settings jpg_settings;	/* structure with a lot of things to play with */
 };
 
 struct card_info {
diff --git a/drivers/staging/media/zoran/zoran_driver.c b/drivers/staging/media/zoran/zoran_driver.c
index 984f1dde99d2..f0ceda9a3d44 100644
--- a/drivers/staging/media/zoran/zoran_driver.c
+++ b/drivers/staging/media/zoran/zoran_driver.c
@@ -587,9 +587,7 @@ static int zoran_jpg_queue_frame(struct zoran_fh *fh, int num,
 	}
 
 	/* what is the codec mode right now? */
-	if (zr->codec_mode == BUZ_MODE_IDLE) {
-		zr->jpg_settings = fh->jpg_settings;
-	} else if (zr->codec_mode != mode) {
+	if (zr->codec_mode != BUZ_MODE_IDLE && zr->codec_mode != mode) {
 		/* wrong codec mode active - invalid */
 		pci_err(zr->pci_dev, "%s - codec in wrong mode\n", __func__);
 		return -EINVAL;
@@ -751,9 +749,6 @@ static void zoran_open_init_session(struct zoran_fh *fh)
 	fh->overlay_settings.format = zr->overlay_settings.format;
 	fh->overlay_active = ZORAN_FREE;
 
-	/* jpg settings */
-	fh->jpg_settings = zr->jpg_settings;
-
 	/* buffers */
 	memset(&fh->buffers, 0, sizeof(fh->buffers));
 	for (i = 0; i < MAX_FRAME; i++) {
@@ -1237,11 +1232,11 @@ static int zoran_v4l2_buffer_status(struct zoran_fh *fh,
 		}
 
 		/* which fields are these? */
-		if (fh->jpg_settings.TmpDcm != 1)
-			buf->field = fh->jpg_settings.odd_even ?
+		if (zr->jpg_settings.TmpDcm != 1)
+			buf->field = zr->jpg_settings.odd_even ?
 				V4L2_FIELD_TOP : V4L2_FIELD_BOTTOM;
 		else
-			buf->field = fh->jpg_settings.odd_even ?
+			buf->field = zr->jpg_settings.odd_even ?
 				V4L2_FIELD_SEQ_TB : V4L2_FIELD_SEQ_BT;
 
 		break;
@@ -1389,18 +1384,18 @@ static int zoran_enum_fmt_vid_overlay(struct file *file, void *__fh,
 
 static int zoran_g_fmt_vid_out(struct file *file, void *__fh, struct v4l2_format *fmt)
 {
-	struct zoran_fh *fh = __fh;
+	struct zoran *zr = video_drvdata(file);
 
-	fmt->fmt.pix.width = fh->jpg_settings.img_width / fh->jpg_settings.HorDcm;
-	fmt->fmt.pix.height = fh->jpg_settings.img_height * 2 /
-		(fh->jpg_settings.VerDcm * fh->jpg_settings.TmpDcm);
-	fmt->fmt.pix.sizeimage = zoran_v4l2_calc_bufsize(&fh->jpg_settings);
+	fmt->fmt.pix.width = zr->jpg_settings.img_width / zr->jpg_settings.HorDcm;
+	fmt->fmt.pix.height = zr->jpg_settings.img_height * 2 /
+		(zr->jpg_settings.VerDcm * zr->jpg_settings.TmpDcm);
+	fmt->fmt.pix.sizeimage = zoran_v4l2_calc_bufsize(&zr->jpg_settings);
 	fmt->fmt.pix.pixelformat = V4L2_PIX_FMT_MJPEG;
-	if (fh->jpg_settings.TmpDcm == 1)
-		fmt->fmt.pix.field = (fh->jpg_settings.odd_even ?
+	if (zr->jpg_settings.TmpDcm == 1)
+		fmt->fmt.pix.field = (zr->jpg_settings.odd_even ?
 				V4L2_FIELD_SEQ_TB : V4L2_FIELD_SEQ_BT);
 	else
-		fmt->fmt.pix.field = (fh->jpg_settings.odd_even ?
+		fmt->fmt.pix.field = (zr->jpg_settings.odd_even ?
 				V4L2_FIELD_TOP : V4L2_FIELD_BOTTOM);
 	fmt->fmt.pix.bytesperline = 0;
 	fmt->fmt.pix.colorspace = V4L2_COLORSPACE_SMPTE170M;
@@ -1468,15 +1463,14 @@ static int zoran_try_fmt_vid_overlay(struct file *file, void *__fh,
 static int zoran_try_fmt_vid_out(struct file *file, void *__fh,
 				 struct v4l2_format *fmt)
 {
-	struct zoran_fh *fh = __fh;
-	struct zoran *zr = fh->zr;
+	struct zoran *zr = video_drvdata(file);
 	struct zoran_jpg_settings settings;
 	int res = 0;
 
 	if (fmt->fmt.pix.pixelformat != V4L2_PIX_FMT_MJPEG)
 		return -EINVAL;
 
-	settings = fh->jpg_settings;
+	settings = zr->jpg_settings;
 
 	/* we actually need to set 'real' parameters now */
 	if ((fmt->fmt.pix.height * 2) > BUZ_MAX_HEIGHT)
@@ -1484,13 +1478,13 @@ static int zoran_try_fmt_vid_out(struct file *file, void *__fh,
 	else
 		settings.TmpDcm = 2;
 	settings.decimation = 0;
-	if (fmt->fmt.pix.height <= fh->jpg_settings.img_height / 2)
+	if (fmt->fmt.pix.height <= zr->jpg_settings.img_height / 2)
 		settings.VerDcm = 2;
 	else
 		settings.VerDcm = 1;
-	if (fmt->fmt.pix.width <= fh->jpg_settings.img_width / 4)
+	if (fmt->fmt.pix.width <= zr->jpg_settings.img_width / 4)
 		settings.HorDcm = 4;
-	else if (fmt->fmt.pix.width <= fh->jpg_settings.img_width / 2)
+	else if (fmt->fmt.pix.width <= zr->jpg_settings.img_width / 2)
 		settings.HorDcm = 2;
 	else
 		settings.HorDcm = 1;
@@ -1517,10 +1511,10 @@ static int zoran_try_fmt_vid_out(struct file *file, void *__fh,
 	fmt->fmt.pix.height = settings.img_height * 2 /
 		(settings.TmpDcm * settings.VerDcm);
 	if (settings.TmpDcm == 1)
-		fmt->fmt.pix.field = (fh->jpg_settings.odd_even ?
+		fmt->fmt.pix.field = (zr->jpg_settings.odd_even ?
 				V4L2_FIELD_SEQ_TB : V4L2_FIELD_SEQ_BT);
 	else
-		fmt->fmt.pix.field = (fh->jpg_settings.odd_even ?
+		fmt->fmt.pix.field = (zr->jpg_settings.odd_even ?
 				V4L2_FIELD_TOP : V4L2_FIELD_BOTTOM);
 
 	fmt->fmt.pix.sizeimage = zoran_v4l2_calc_bufsize(&settings);
@@ -1594,7 +1588,7 @@ static int zoran_s_fmt_vid_out(struct file *file, void *__fh, struct v4l2_format
 		return res;
 	}
 
-	settings = fh->jpg_settings;
+	settings = zr->jpg_settings;
 
 	/* we actually need to set 'real' parameters now */
 	if (fmt->fmt.pix.height * 2 > BUZ_MAX_HEIGHT)
@@ -1602,13 +1596,13 @@ static int zoran_s_fmt_vid_out(struct file *file, void *__fh, struct v4l2_format
 	else
 		settings.TmpDcm = 2;
 	settings.decimation = 0;
-	if (fmt->fmt.pix.height <= fh->jpg_settings.img_height / 2)
+	if (fmt->fmt.pix.height <= zr->jpg_settings.img_height / 2)
 		settings.VerDcm = 2;
 	else
 		settings.VerDcm = 1;
-	if (fmt->fmt.pix.width <= fh->jpg_settings.img_width / 4)
+	if (fmt->fmt.pix.width <= zr->jpg_settings.img_width / 4)
 		settings.HorDcm = 4;
-	else if (fmt->fmt.pix.width <= fh->jpg_settings.img_width / 2)
+	else if (fmt->fmt.pix.width <= zr->jpg_settings.img_width / 2)
 		settings.HorDcm = 2;
 	else
 		settings.HorDcm = 1;
@@ -1631,19 +1625,19 @@ static int zoran_s_fmt_vid_out(struct file *file, void *__fh, struct v4l2_format
 		return res;
 
 	/* it's ok, so set them */
-	fh->jpg_settings = settings;
+	zr->jpg_settings = settings;
 
 	map_mode_jpg(fh, fmt->type == V4L2_BUF_TYPE_VIDEO_OUTPUT);
-	zr->buffer_size = zoran_v4l2_calc_bufsize(&fh->jpg_settings);
+	zr->buffer_size = zoran_v4l2_calc_bufsize(&zr->jpg_settings);
 
 	/* tell the user what we actually did */
 	fmt->fmt.pix.width = settings.img_width / settings.HorDcm;
 	fmt->fmt.pix.height = settings.img_height * 2 / (settings.TmpDcm * settings.VerDcm);
 	if (settings.TmpDcm == 1)
-		fmt->fmt.pix.field = (fh->jpg_settings.odd_even ?
+		fmt->fmt.pix.field = (zr->jpg_settings.odd_even ?
 				V4L2_FIELD_SEQ_TB : V4L2_FIELD_SEQ_BT);
 	else
-		fmt->fmt.pix.field = (fh->jpg_settings.odd_even ?
+		fmt->fmt.pix.field = (zr->jpg_settings.odd_even ?
 				V4L2_FIELD_TOP : V4L2_FIELD_BOTTOM);
 	fmt->fmt.pix.bytesperline = 0;
 	fmt->fmt.pix.sizeimage = zr->buffer_size;
@@ -1798,7 +1792,7 @@ static int zoran_reqbufs(struct file *file, void *__fh, struct v4l2_requestbuffe
 		/* The next mmap will map the MJPEG buffers */
 		map_mode_jpg(fh, req->type == V4L2_BUF_TYPE_VIDEO_OUTPUT);
 		fh->buffers.num_buffers = req->count;
-		zr->buffer_size = zoran_v4l2_calc_bufsize(&fh->jpg_settings);
+		zr->buffer_size = zoran_v4l2_calc_bufsize(&zr->jpg_settings);
 
 		if (jpg_fbuffer_alloc(fh)) {
 			res = -ENOMEM;
@@ -2162,10 +2156,10 @@ static int zoran_g_selection(struct file *file, void *__fh, struct v4l2_selectio
 
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP:
-		sel->r.top = fh->jpg_settings.img_y;
-		sel->r.left = fh->jpg_settings.img_x;
-		sel->r.width = fh->jpg_settings.img_width;
-		sel->r.height = fh->jpg_settings.img_height;
+		sel->r.top = zr->jpg_settings.img_y;
+		sel->r.left = zr->jpg_settings.img_x;
+		sel->r.width = zr->jpg_settings.img_width;
+		sel->r.height = zr->jpg_settings.img_height;
 		break;
 	case V4L2_SEL_TGT_CROP_DEFAULT:
 		sel->r.top = sel->r.left = 0;
@@ -2202,7 +2196,7 @@ static int zoran_s_selection(struct file *file, void *__fh, struct v4l2_selectio
 		return -EINVAL;
 	}
 
-	settings = fh->jpg_settings;
+	settings = zr->jpg_settings;
 
 	if (fh->buffers.allocated) {
 		pci_err(zr->pci_dev, "VIDIOC_S_SELECTION - cannot change settings while active\n");
@@ -2221,28 +2215,25 @@ static int zoran_s_selection(struct file *file, void *__fh, struct v4l2_selectio
 		return res;
 
 	/* accept */
-	fh->jpg_settings = settings;
+	zr->jpg_settings = settings;
 	return res;
 }
 
 static int zoran_g_jpegcomp(struct file *file, void *__fh, struct v4l2_jpegcompression *params)
 {
-	struct zoran_fh *fh = __fh;
+	struct zoran *zr = video_drvdata(file);
 
 	memset(params, 0, sizeof(*params));
 
-	params->quality = fh->jpg_settings.jpg_comp.quality;
-	params->APPn = fh->jpg_settings.jpg_comp.APPn;
-	memcpy(params->APP_data,
-	       fh->jpg_settings.jpg_comp.APP_data,
-	       fh->jpg_settings.jpg_comp.APP_len);
-	params->APP_len = fh->jpg_settings.jpg_comp.APP_len;
-	memcpy(params->COM_data,
-	       fh->jpg_settings.jpg_comp.COM_data,
-	       fh->jpg_settings.jpg_comp.COM_len);
-	params->COM_len = fh->jpg_settings.jpg_comp.COM_len;
-	params->jpeg_markers =
-	    fh->jpg_settings.jpg_comp.jpeg_markers;
+	params->quality = zr->jpg_settings.jpg_comp.quality;
+	params->APPn = zr->jpg_settings.jpg_comp.APPn;
+	memcpy(params->APP_data, zr->jpg_settings.jpg_comp.APP_data,
+	       zr->jpg_settings.jpg_comp.APP_len);
+	params->APP_len = zr->jpg_settings.jpg_comp.APP_len;
+	memcpy(params->COM_data, zr->jpg_settings.jpg_comp.COM_data,
+	       zr->jpg_settings.jpg_comp.COM_len);
+	params->COM_len = zr->jpg_settings.jpg_comp.COM_len;
+	params->jpeg_markers = zr->jpg_settings.jpg_comp.jpeg_markers;
 
 	return 0;
 }
@@ -2255,7 +2246,7 @@ static int zoran_s_jpegcomp(struct file *file, void *__fh,
 	int res = 0;
 	struct zoran_jpg_settings settings;
 
-	settings = fh->jpg_settings;
+	settings = zr->jpg_settings;
 
 	settings.jpg_comp = *params;
 
@@ -2269,8 +2260,8 @@ static int zoran_s_jpegcomp(struct file *file, void *__fh,
 	if (res)
 		return res;
 	if (!fh->buffers.allocated)
-		zr->buffer_size = zoran_v4l2_calc_bufsize(&fh->jpg_settings);
-	fh->jpg_settings.jpg_comp = settings.jpg_comp;
+		zr->buffer_size = zoran_v4l2_calc_bufsize(&zr->jpg_settings);
+	zr->jpg_settings.jpg_comp = settings.jpg_comp;
 	return res;
 }
 
-- 
2.26.2

