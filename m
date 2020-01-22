Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 347EF144DD2
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2020 09:40:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726077AbgAVIke (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jan 2020 03:40:34 -0500
Received: from mail-qv1-f42.google.com ([209.85.219.42]:39406 "EHLO
        mail-qv1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725868AbgAVIkd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jan 2020 03:40:33 -0500
Received: by mail-qv1-f42.google.com with SMTP id y8so2847139qvk.6;
        Wed, 22 Jan 2020 00:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RUKVI0uRmcOl2MuQwBxJcAnK4Woo8zwrilq0i+PgBow=;
        b=AA68JfEiWzBSj34eOj2uDA7aDitPhm5dotLIIKUGAkKhYr2jlPtaa3X9CERZLfPSbZ
         fgRpWnrp1IKlndQybUXCYGLwnfdFBZSNAHYH5wUape3MCGBeM+THh0sJABFAPHjtK9jo
         AEHlCisV8fFWJLKSnXDWeOuPnLa0hZftx8wrPJP7NffmWIhJ2E5f+/oWMD0a0yGUDD0P
         MylVtgUxSsE5AyQx2lsrJS3Bh5ZPSc+28zbmsg6B06T5VDDgu1EsS+iC1qdYdMBaw4cJ
         8/0SLN32SDQllt4hYxN4r30iq5J7HQXJc9FAw8bBmFyzPDT3z1yCsqA2qDXcnzTCGeA7
         EEQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RUKVI0uRmcOl2MuQwBxJcAnK4Woo8zwrilq0i+PgBow=;
        b=tjodeCKuzLeXu9tXPfddtFDWK5OyAixXg89+zcxBtEBRUoaj8avM1A5iEIi+YsQ1OR
         eV5gZBXEZJzSqkpFdj0e5f9R7QO8NpXT5Qa1p7HcdOdRw5Am1UrkaffeBEcO0yKmJibw
         LlVG+k10WKMiSXWUreG+hD8PNDqtnzuoBeNcdP+ODWX15EuKGHphX5qn9oOu9WtqGhGn
         nQqYsD2tygYg6zjRQ5sTkf2o8RBE7r+DZN77sJXpR5cdxVtJRvzGtkPgVqJKgajvfDca
         /o/e/0gOggoisL1bPEm6iWtJpS8R3pvh58nVHW6hKkW2ujMT+ca7Srzw+uHx5eHt0JIe
         3KaA==
X-Gm-Message-State: APjAAAUt9NHpUKjpSQwrCZE2maC8z8g6c+jQP37HuoccT6ayQiukTMXx
        YwvXKG83d2JJkIOZCEre5EY=
X-Google-Smtp-Source: APXvYqyF9cSDp0lIJ20Pa14wFPwu0JRhy9TPA8O+cdADvdqcjeLSdToeZGTPKtQw5n51c1+7+H/cDQ==
X-Received: by 2002:ad4:47ad:: with SMTP id a13mr9301245qvz.29.1579682432078;
        Wed, 22 Jan 2020 00:40:32 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:481:148e::5])
        by smtp.gmail.com with ESMTPSA id i16sm18472650qkh.120.2020.01.22.00.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2020 00:40:31 -0800 (PST)
From:   "Carlos E. C. Barbosa" <climacobarbosacee@gmail.com>
X-Google-Original-From: "Carlos E. C. Barbosa" <carlosecb@tutanota.com>
To:     Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        lkcamp@lists.libreplanetbr.org
Subject: [PATCH v2] media: vimc: get pixformat info from v4l2_format_info
Date:   Wed, 22 Jan 2020 05:40:25 -0300
Message-Id: <20200122084025.628462-1-carlosecb@tutanota.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Carlos E.C. Barbosa" <carlosecb@tutanota.com>

There is overlapping code over two distinct lists. This repurposes one
of vimc_pix_map for strictly mapping formats and remaps other calls to
the matching v4l2_format_info.

Signed-off-by: Carlos E. C. Barbosa <carlosecb@tutanota.com>
---
Changes in v2:
As advised by Helen Koike and Hans Verkuil, the const qualifiers are not
removed, the bayer flag is kept and the unnecessary changes are not
made.

v4l2-compliance message:
https://pastebin.com/1XF45aCA

---
 drivers/media/platform/vimc/vimc-capture.c | 19 ++++++++++++------
 drivers/media/platform/vimc/vimc-common.c  | 23 ----------------------
 drivers/media/platform/vimc/vimc-common.h  |  2 --
 drivers/media/platform/vimc/vimc-debayer.c |  7 +++++--
 drivers/media/platform/vimc/vimc-scaler.c  | 12 +++++++++--
 drivers/media/platform/vimc/vimc-sensor.c  | 12 ++++++++---
 6 files changed, 37 insertions(+), 38 deletions(-)

diff --git a/drivers/media/platform/vimc/vimc-capture.c b/drivers/media/platform/vimc/vimc-capture.c
index 76c015898cfd..30659e934cfb 100644
--- a/drivers/media/platform/vimc/vimc-capture.c
+++ b/drivers/media/platform/vimc/vimc-capture.c
@@ -86,6 +86,7 @@ static int vimc_cap_try_fmt_vid_cap(struct file *file, void *priv,
 {
 	struct v4l2_pix_format *format = &f->fmt.pix;
 	const struct vimc_pix_map *vpix;
+	const struct v4l2_format_info *vinfo;
 
 	format->width = clamp_t(u32, format->width, VIMC_FRAME_MIN_WIDTH,
 				VIMC_FRAME_MAX_WIDTH) & ~1;
@@ -94,12 +95,13 @@ static int vimc_cap_try_fmt_vid_cap(struct file *file, void *priv,
 
 	/* Don't accept a pixelformat that is not on the table */
 	vpix = vimc_pix_map_by_pixelformat(format->pixelformat);
-	if (!vpix) {
+	if (!vpix)
 		format->pixelformat = fmt_default.pixelformat;
-		vpix = vimc_pix_map_by_pixelformat(format->pixelformat);
-	}
+
+	vinfo = v4l2_format_info(format->pixelformat);
+
 	/* TODO: Add support for custom bytesperline values */
-	format->bytesperline = format->width * vpix->bpp;
+	format->bytesperline = format->width * vinfo->bpp[0];
 	format->sizeimage = format->bytesperline * format->height;
 
 	if (format->field == V4L2_FIELD_ANY)
@@ -166,6 +168,7 @@ static int vimc_cap_enum_framesizes(struct file *file, void *fh,
 
 	/* Only accept code in the pix map table */
 	vpix = vimc_pix_map_by_code(fsize->pixel_format);
+
 	if (!vpix)
 		return -EINVAL;
 
@@ -386,10 +389,11 @@ struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
 				     const char *vcfg_name)
 {
 	struct v4l2_device *v4l2_dev = &vimc->v4l2_dev;
-	const struct vimc_pix_map *vpix;
 	struct vimc_cap_device *vcap;
 	struct video_device *vdev;
 	struct vb2_queue *q;
+	const struct vimc_pix_map *vpix;
+	const struct v4l2_format_info *vinfo;
 	int ret;
 
 	/* Allocate the vimc_cap_device struct */
@@ -434,8 +438,11 @@ struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
 
 	/* Set default frame format */
 	vcap->format = fmt_default;
+
 	vpix = vimc_pix_map_by_pixelformat(vcap->format.pixelformat);
-	vcap->format.bytesperline = vcap->format.width * vpix->bpp;
+	vinfo = v4l2_format_info(vpix->pixelformat);
+
+	vcap->format.bytesperline = vcap->format.width * vinfo->bpp[0];
 	vcap->format.sizeimage = vcap->format.bytesperline *
 				 vcap->format.height;
 
diff --git a/drivers/media/platform/vimc/vimc-common.c b/drivers/media/platform/vimc/vimc-common.c
index 16ce9f3b7c75..8327ada1b461 100644
--- a/drivers/media/platform/vimc/vimc-common.c
+++ b/drivers/media/platform/vimc/vimc-common.c
@@ -21,19 +21,16 @@ static const struct vimc_pix_map vimc_pix_map_list[] = {
 	{
 		.code = MEDIA_BUS_FMT_BGR888_1X24,
 		.pixelformat = V4L2_PIX_FMT_BGR24,
-		.bpp = 3,
 		.bayer = false,
 	},
 	{
 		.code = MEDIA_BUS_FMT_RGB888_1X24,
 		.pixelformat = V4L2_PIX_FMT_RGB24,
-		.bpp = 3,
 		.bayer = false,
 	},
 	{
 		.code = MEDIA_BUS_FMT_ARGB8888_1X32,
 		.pixelformat = V4L2_PIX_FMT_ARGB32,
-		.bpp = 4,
 		.bayer = false,
 	},
 
@@ -41,49 +38,41 @@ static const struct vimc_pix_map vimc_pix_map_list[] = {
 	{
 		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
 		.pixelformat = V4L2_PIX_FMT_SBGGR8,
-		.bpp = 1,
 		.bayer = true,
 	},
 	{
 		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
 		.pixelformat = V4L2_PIX_FMT_SGBRG8,
-		.bpp = 1,
 		.bayer = true,
 	},
 	{
 		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
 		.pixelformat = V4L2_PIX_FMT_SGRBG8,
-		.bpp = 1,
 		.bayer = true,
 	},
 	{
 		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
 		.pixelformat = V4L2_PIX_FMT_SRGGB8,
-		.bpp = 1,
 		.bayer = true,
 	},
 	{
 		.code = MEDIA_BUS_FMT_SBGGR10_1X10,
 		.pixelformat = V4L2_PIX_FMT_SBGGR10,
-		.bpp = 2,
 		.bayer = true,
 	},
 	{
 		.code = MEDIA_BUS_FMT_SGBRG10_1X10,
 		.pixelformat = V4L2_PIX_FMT_SGBRG10,
-		.bpp = 2,
 		.bayer = true,
 	},
 	{
 		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
 		.pixelformat = V4L2_PIX_FMT_SGRBG10,
-		.bpp = 2,
 		.bayer = true,
 	},
 	{
 		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
 		.pixelformat = V4L2_PIX_FMT_SRGGB10,
-		.bpp = 2,
 		.bayer = true,
 	},
 
@@ -91,25 +80,21 @@ static const struct vimc_pix_map vimc_pix_map_list[] = {
 	{
 		.code = MEDIA_BUS_FMT_SBGGR10_ALAW8_1X8,
 		.pixelformat = V4L2_PIX_FMT_SBGGR10ALAW8,
-		.bpp = 1,
 		.bayer = true,
 	},
 	{
 		.code = MEDIA_BUS_FMT_SGBRG10_ALAW8_1X8,
 		.pixelformat = V4L2_PIX_FMT_SGBRG10ALAW8,
-		.bpp = 1,
 		.bayer = true,
 	},
 	{
 		.code = MEDIA_BUS_FMT_SGRBG10_ALAW8_1X8,
 		.pixelformat = V4L2_PIX_FMT_SGRBG10ALAW8,
-		.bpp = 1,
 		.bayer = true,
 	},
 	{
 		.code = MEDIA_BUS_FMT_SRGGB10_ALAW8_1X8,
 		.pixelformat = V4L2_PIX_FMT_SRGGB10ALAW8,
-		.bpp = 1,
 		.bayer = true,
 	},
 
@@ -117,49 +102,41 @@ static const struct vimc_pix_map vimc_pix_map_list[] = {
 	{
 		.code = MEDIA_BUS_FMT_SBGGR10_DPCM8_1X8,
 		.pixelformat = V4L2_PIX_FMT_SBGGR10DPCM8,
-		.bpp = 1,
 		.bayer = true,
 	},
 	{
 		.code = MEDIA_BUS_FMT_SGBRG10_DPCM8_1X8,
 		.pixelformat = V4L2_PIX_FMT_SGBRG10DPCM8,
-		.bpp = 1,
 		.bayer = true,
 	},
 	{
 		.code = MEDIA_BUS_FMT_SGRBG10_DPCM8_1X8,
 		.pixelformat = V4L2_PIX_FMT_SGRBG10DPCM8,
-		.bpp = 1,
 		.bayer = true,
 	},
 	{
 		.code = MEDIA_BUS_FMT_SRGGB10_DPCM8_1X8,
 		.pixelformat = V4L2_PIX_FMT_SRGGB10DPCM8,
-		.bpp = 1,
 		.bayer = true,
 	},
 	{
 		.code = MEDIA_BUS_FMT_SBGGR12_1X12,
 		.pixelformat = V4L2_PIX_FMT_SBGGR12,
-		.bpp = 2,
 		.bayer = true,
 	},
 	{
 		.code = MEDIA_BUS_FMT_SGBRG12_1X12,
 		.pixelformat = V4L2_PIX_FMT_SGBRG12,
-		.bpp = 2,
 		.bayer = true,
 	},
 	{
 		.code = MEDIA_BUS_FMT_SGRBG12_1X12,
 		.pixelformat = V4L2_PIX_FMT_SGRBG12,
-		.bpp = 2,
 		.bayer = true,
 	},
 	{
 		.code = MEDIA_BUS_FMT_SRGGB12_1X12,
 		.pixelformat = V4L2_PIX_FMT_SRGGB12,
-		.bpp = 2,
 		.bayer = true,
 	},
 };
diff --git a/drivers/media/platform/vimc/vimc-common.h b/drivers/media/platform/vimc/vimc-common.h
index 87eb8259c2a8..dd1c45334705 100644
--- a/drivers/media/platform/vimc/vimc-common.h
+++ b/drivers/media/platform/vimc/vimc-common.h
@@ -62,7 +62,6 @@ do {									\
  * struct vimc_pix_map - maps media bus code with v4l2 pixel format
  *
  * @code:		media bus format code defined by MEDIA_BUS_FMT_* macros
- * @bbp:		number of bytes each pixel occupies
  * @pixelformat:	pixel format devined by V4L2_PIX_FMT_* macros
  *
  * Struct which matches the MEDIA_BUS_FMT_* codes with the corresponding
@@ -70,7 +69,6 @@ do {									\
  */
 struct vimc_pix_map {
 	unsigned int code;
-	unsigned int bpp;
 	u32 pixelformat;
 	bool bayer;
 };
diff --git a/drivers/media/platform/vimc/vimc-debayer.c b/drivers/media/platform/vimc/vimc-debayer.c
index 5d1b67d684bb..0df44b8bb7d0 100644
--- a/drivers/media/platform/vimc/vimc-debayer.c
+++ b/drivers/media/platform/vimc/vimc-debayer.c
@@ -304,6 +304,7 @@ static int vimc_deb_s_stream(struct v4l2_subdev *sd, int enable)
 
 	if (enable) {
 		const struct vimc_pix_map *vpix;
+		const struct v4l2_format_info *vinfo;
 		unsigned int frame_size;
 
 		if (vdeb->src_frame)
@@ -311,12 +312,14 @@ static int vimc_deb_s_stream(struct v4l2_subdev *sd, int enable)
 
 		/* Calculate the frame size of the source pad */
 		vpix = vimc_pix_map_by_code(vdeb->src_code);
+		vinfo = v4l2_format_info(vpix->pixelformat);
 		frame_size = vdeb->sink_fmt.width * vdeb->sink_fmt.height *
-				vpix->bpp;
+				vinfo->bpp[0];
 
 		/* Save the bytes per pixel of the sink */
 		vpix = vimc_pix_map_by_code(vdeb->sink_fmt.code);
-		vdeb->sink_bpp = vpix->bpp;
+		vinfo = v4l2_format_info(vpix->pixelformat);
+		vdeb->sink_bpp = vinfo->bpp[0];
 
 		/* Get the corresponding pixel map from the table */
 		vdeb->sink_pix_map =
diff --git a/drivers/media/platform/vimc/vimc-scaler.c b/drivers/media/platform/vimc/vimc-scaler.c
index e2e551bc3ded..9fcca5b1f0b7 100644
--- a/drivers/media/platform/vimc/vimc-scaler.c
+++ b/drivers/media/platform/vimc/vimc-scaler.c
@@ -126,6 +126,7 @@ static int vimc_sca_enum_frame_size(struct v4l2_subdev *sd,
 				    struct v4l2_subdev_frame_size_enum *fse)
 {
 	const struct vimc_pix_map *vpix;
+	const struct v4l2_format_info *vinfo;
 
 	if (fse->index)
 		return -EINVAL;
@@ -134,6 +135,7 @@ static int vimc_sca_enum_frame_size(struct v4l2_subdev *sd,
 	vpix = vimc_pix_map_by_code(fse->code);
 	if (!vpix || vpix->bayer)
 		return -EINVAL;
+	vinfo = v4l2_format_info(vpix->pixelformat);
 
 	fse->min_width = VIMC_FRAME_MIN_WIDTH;
 	fse->min_height = VIMC_FRAME_MIN_HEIGHT;
@@ -177,11 +179,15 @@ static int vimc_sca_get_fmt(struct v4l2_subdev *sd,
 static void vimc_sca_adjust_sink_fmt(struct v4l2_mbus_framefmt *fmt)
 {
 	const struct vimc_pix_map *vpix;
+	const struct v4l2_format_info *vinfo;
 
 	/* Only accept code in the pix map table in non bayer format */
 	vpix = vimc_pix_map_by_code(fmt->code);
-	if (!vpix || vpix->bayer)
+	if (!vpix || vpix->bayer) {
 		fmt->code = sink_fmt_default.code;
+		vpix = vimc_pix_map_by_code(fmt->code);
+	}
+	vinfo = v4l2_format_info(vpix->pixelformat);
 
 	fmt->width = clamp_t(u32, fmt->width, VIMC_FRAME_MIN_WIDTH,
 			     VIMC_FRAME_MAX_WIDTH) & ~1;
@@ -332,6 +338,7 @@ static int vimc_sca_s_stream(struct v4l2_subdev *sd, int enable)
 
 	if (enable) {
 		const struct vimc_pix_map *vpix;
+		const struct v4l2_format_info *vinfo;
 		unsigned int frame_size;
 
 		if (vsca->src_frame)
@@ -339,7 +346,8 @@ static int vimc_sca_s_stream(struct v4l2_subdev *sd, int enable)
 
 		/* Save the bytes per pixel of the sink */
 		vpix = vimc_pix_map_by_code(vsca->sink_fmt.code);
-		vsca->bpp = vpix->bpp;
+		vinfo = v4l2_format_info(vpix->pixelformat);
+		vsca->bpp = vinfo->bpp[0];
 
 		/* Calculate the width in bytes of the src frame */
 		vsca->src_line_size = vsca->crop_rect.width *
diff --git a/drivers/media/platform/vimc/vimc-sensor.c b/drivers/media/platform/vimc/vimc-sensor.c
index 32380f504591..849658d0bade 100644
--- a/drivers/media/platform/vimc/vimc-sensor.c
+++ b/drivers/media/platform/vimc/vimc-sensor.c
@@ -100,12 +100,16 @@ static int vimc_sen_get_fmt(struct v4l2_subdev *sd,
 
 static void vimc_sen_tpg_s_format(struct vimc_sen_device *vsen)
 {
-	const struct vimc_pix_map *vpix =
+	const struct vimc_pix_map *vpix	=
 				vimc_pix_map_by_code(vsen->mbus_format.code);
+	const struct v4l2_format_info *vinfo =
+				v4l2_format_info(vpix->pixelformat);
+
 
 	tpg_reset_source(&vsen->tpg, vsen->mbus_format.width,
 			 vsen->mbus_format.height, vsen->mbus_format.field);
-	tpg_s_bytesperline(&vsen->tpg, 0, vsen->mbus_format.width * vpix->bpp);
+	tpg_s_bytesperline(&vsen->tpg, 0,
+			   vsen->mbus_format.width * vinfo->bpp[0]);
 	tpg_s_buf_height(&vsen->tpg, vsen->mbus_format.height);
 	tpg_s_fourcc(&vsen->tpg, vpix->pixelformat);
 	/* TODO: add support for V4L2_FIELD_ALTERNATE */
@@ -199,11 +203,13 @@ static int vimc_sen_s_stream(struct v4l2_subdev *sd, int enable)
 
 	if (enable) {
 		const struct vimc_pix_map *vpix;
+		const struct v4l2_format_info *vinfo;
 		unsigned int frame_size;
 
 		/* Calculate the frame size */
 		vpix = vimc_pix_map_by_code(vsen->mbus_format.code);
-		frame_size = vsen->mbus_format.width * vpix->bpp *
+		vinfo = v4l2_format_info(vpix->pixelformat);
+		frame_size = vsen->mbus_format.width * vinfo->bpp[0] *
 			     vsen->mbus_format.height;
 
 		/*
-- 
2.25.0

