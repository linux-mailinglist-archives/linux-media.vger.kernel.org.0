Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD72B1BEE56
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2020 04:33:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbgD3CdS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Apr 2020 22:33:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726180AbgD3CdS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Apr 2020 22:33:18 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A577C035494;
        Wed, 29 Apr 2020 19:33:17 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id g74so4261873qke.13;
        Wed, 29 Apr 2020 19:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vqofc99P0OupaQcwaLJh/i1Jxs3gG7sJleq7taz/TV4=;
        b=H+Dx9lrg2siB6p5fPpMlnGGSfya0qYuj9n62rRyVgv08+5wCYojEQLU9m5wJDG0pon
         aoaQiOgsODlCmhxTHlDE2uKyfMFcCDELlAJi6ZtQLcYgC4XKeh+Yoko3x8khL1l888hK
         j4lf9W6I1fPQQKlyGz17feqTQFJInbTclIReKWqey3NxvpjpLKY5bEztWF7GfL+uZxAN
         Le1lrOumvlo1OoRyViVOA7qxztoXkFKVWgNMQgaOPucRqXHbs6X2qTvy+fZsvAFJUtD+
         vafKwWItRQV/QRKdVOf69EqaBvHADpr1WlbvBjLjyAPveO0+fvhNRGjDnsaYmDQ+B+nd
         xPkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vqofc99P0OupaQcwaLJh/i1Jxs3gG7sJleq7taz/TV4=;
        b=PO/v3Uj8xEkCX6F6ekYqry7ZAWUapRRzIAu5vdFkzxdSPaCxAbpq610U55wO91Y0Ea
         rw7Es52JzSidyTl7+U0FLbKJ1qfLlau1H5TZF+vAWiSe+6bXdcqThqhrGng69t6P6usC
         QlRDVfF0pdKutI5XahEmgrKpTPDq4wawx4ONjeaAkEL+bh/6aC1GEEnUcPGeq0shlo2B
         Aw4SpwncBW/7fNCT/eiA4NJI77+jHf8LXYzWVeNvYlf0n9xVINucEcPARqk74pQ0LJqC
         7NsIEpHcMN9RDxokC7U2r1FV76ah6YUI/Tu7LH01qptM22MxxsL7BUppdG/siG/5APhL
         sHdA==
X-Gm-Message-State: AGi0PuaZxKd9i8Nakivt2EFv2paUffY+lEFPpDyk9cMyoSruF9XlYtQx
        vjvM3Ytt3/QW/BC2T4hkTd5fDo7QqlU=
X-Google-Smtp-Source: APiQypIJ9JDxXavj7wt09ZeGFBxCJFNaSqwdmLofRPuFe8oMGsrs9MrYD1th1Q91Ud9JAYIVPejIVA==
X-Received: by 2002:a05:620a:3c5:: with SMTP id r5mr1510810qkm.440.1588213996877;
        Wed, 29 Apr 2020 19:33:16 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f0:bf0d:dd6e:428e:9a4:bf9])
        by smtp.gmail.com with ESMTPSA id e16sm964987qtc.92.2020.04.29.19.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 19:33:16 -0700 (PDT)
From:   "Carlos E. C. Barbosa" <barbosa.carlos.ec@gmail.com>
To:     Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     lkcamp@lists.libreplanetbr.org
Subject: [PATCH v5] media: vimc: get pixformat info from v4l2_format_info
Date:   Wed, 29 Apr 2020 23:32:58 -0300
Message-Id: <20200430023258.85404-1-barbosa.carlos.ec@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is overlapping code over two distinct lists. This repurposes
vimc_pix_map for mapping formats and remaps the calls to the matching
v4l2_format_info.

Signed-off-by: Carlos E. C. Barbosa <barbosa.carlos.ec@gmail.com>

---

Changes in v5:
- .bayer member was removed and replaced by v4l2 functions calls

Changes in v4:
- Unused variables were removed

Changes in v3:
- Change declaration order of variables and some minor style changes

Changes in v2:
- Const qualifiers are not removed
- Bayer flag is kept
- Unnecessary changes are not made anymore

v4l2-compliance -m /dev/media0 output:
https://pastebin.com/VQV4vrTW

---
---
 .../media/test-drivers/vimc/vimc-capture.c    | 16 ++++---
 drivers/media/test-drivers/vimc/vimc-common.c | 46 -------------------
 drivers/media/test-drivers/vimc/vimc-common.h |  4 --
 .../media/test-drivers/vimc/vimc-debayer.c    |  7 ++-
 drivers/media/test-drivers/vimc/vimc-scaler.c | 18 ++++++--
 drivers/media/test-drivers/vimc/vimc-sensor.c |  9 +++-
 6 files changed, 35 insertions(+), 65 deletions(-)

diff --git a/drivers/media/test-drivers/vimc/vimc-capture.c b/drivers/media/test-drivers/vimc/vimc-capture.c
index 5315c201314c..3c280a642ec7 100644
--- a/drivers/media/test-drivers/vimc/vimc-capture.c
+++ b/drivers/media/test-drivers/vimc/vimc-capture.c
@@ -85,6 +85,7 @@ static int vimc_cap_try_fmt_vid_cap(struct file *file, void *priv,
 				    struct v4l2_format *f)
 {
 	struct v4l2_pix_format *format = &f->fmt.pix;
+	const struct v4l2_format_info *vinfo;
 	const struct vimc_pix_map *vpix;
 
 	format->width = clamp_t(u32, format->width, VIMC_FRAME_MIN_WIDTH,
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
@@ -386,7 +388,7 @@ static struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
 					    const char *vcfg_name)
 {
 	struct v4l2_device *v4l2_dev = &vimc->v4l2_dev;
-	const struct vimc_pix_map *vpix;
+	const struct v4l2_format_info *vinfo;
 	struct vimc_cap_device *vcap;
 	struct video_device *vdev;
 	struct vb2_queue *q;
@@ -434,8 +436,8 @@ static struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
 
 	/* Set default frame format */
 	vcap->format = fmt_default;
-	vpix = vimc_pix_map_by_pixelformat(vcap->format.pixelformat);
-	vcap->format.bytesperline = vcap->format.width * vpix->bpp;
+	vinfo = v4l2_format_info(vcap->format.pixelformat);
+	vcap->format.bytesperline = vcap->format.width * vinfo->bpp[0];
 	vcap->format.sizeimage = vcap->format.bytesperline *
 				 vcap->format.height;
 
diff --git a/drivers/media/test-drivers/vimc/vimc-common.c b/drivers/media/test-drivers/vimc/vimc-common.c
index c95c17c048f2..00f0e301b4e3 100644
--- a/drivers/media/test-drivers/vimc/vimc-common.c
+++ b/drivers/media/test-drivers/vimc/vimc-common.c
@@ -21,146 +21,100 @@ static const struct vimc_pix_map vimc_pix_map_list[] = {
 	{
 		.code = MEDIA_BUS_FMT_BGR888_1X24,
 		.pixelformat = V4L2_PIX_FMT_BGR24,
-		.bpp = 3,
-		.bayer = false,
 	},
 	{
 		.code = MEDIA_BUS_FMT_RGB888_1X24,
 		.pixelformat = V4L2_PIX_FMT_RGB24,
-		.bpp = 3,
-		.bayer = false,
 	},
 	{
 		.code = MEDIA_BUS_FMT_ARGB8888_1X32,
 		.pixelformat = V4L2_PIX_FMT_ARGB32,
-		.bpp = 4,
-		.bayer = false,
 	},
 
 	/* Bayer formats */
 	{
 		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
 		.pixelformat = V4L2_PIX_FMT_SBGGR8,
-		.bpp = 1,
-		.bayer = true,
 	},
 	{
 		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
 		.pixelformat = V4L2_PIX_FMT_SGBRG8,
-		.bpp = 1,
-		.bayer = true,
 	},
 	{
 		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
 		.pixelformat = V4L2_PIX_FMT_SGRBG8,
-		.bpp = 1,
-		.bayer = true,
 	},
 	{
 		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
 		.pixelformat = V4L2_PIX_FMT_SRGGB8,
-		.bpp = 1,
-		.bayer = true,
 	},
 	{
 		.code = MEDIA_BUS_FMT_SBGGR10_1X10,
 		.pixelformat = V4L2_PIX_FMT_SBGGR10,
-		.bpp = 2,
-		.bayer = true,
 	},
 	{
 		.code = MEDIA_BUS_FMT_SGBRG10_1X10,
 		.pixelformat = V4L2_PIX_FMT_SGBRG10,
-		.bpp = 2,
-		.bayer = true,
 	},
 	{
 		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
 		.pixelformat = V4L2_PIX_FMT_SGRBG10,
-		.bpp = 2,
-		.bayer = true,
 	},
 	{
 		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
 		.pixelformat = V4L2_PIX_FMT_SRGGB10,
-		.bpp = 2,
-		.bayer = true,
 	},
 
 	/* 10bit raw bayer a-law compressed to 8 bits */
 	{
 		.code = MEDIA_BUS_FMT_SBGGR10_ALAW8_1X8,
 		.pixelformat = V4L2_PIX_FMT_SBGGR10ALAW8,
-		.bpp = 1,
-		.bayer = true,
 	},
 	{
 		.code = MEDIA_BUS_FMT_SGBRG10_ALAW8_1X8,
 		.pixelformat = V4L2_PIX_FMT_SGBRG10ALAW8,
-		.bpp = 1,
-		.bayer = true,
 	},
 	{
 		.code = MEDIA_BUS_FMT_SGRBG10_ALAW8_1X8,
 		.pixelformat = V4L2_PIX_FMT_SGRBG10ALAW8,
-		.bpp = 1,
-		.bayer = true,
 	},
 	{
 		.code = MEDIA_BUS_FMT_SRGGB10_ALAW8_1X8,
 		.pixelformat = V4L2_PIX_FMT_SRGGB10ALAW8,
-		.bpp = 1,
-		.bayer = true,
 	},
 
 	/* 10bit raw bayer DPCM compressed to 8 bits */
 	{
 		.code = MEDIA_BUS_FMT_SBGGR10_DPCM8_1X8,
 		.pixelformat = V4L2_PIX_FMT_SBGGR10DPCM8,
-		.bpp = 1,
-		.bayer = true,
 	},
 	{
 		.code = MEDIA_BUS_FMT_SGBRG10_DPCM8_1X8,
 		.pixelformat = V4L2_PIX_FMT_SGBRG10DPCM8,
-		.bpp = 1,
-		.bayer = true,
 	},
 	{
 		.code = MEDIA_BUS_FMT_SGRBG10_DPCM8_1X8,
 		.pixelformat = V4L2_PIX_FMT_SGRBG10DPCM8,
-		.bpp = 1,
-		.bayer = true,
 	},
 	{
 		.code = MEDIA_BUS_FMT_SRGGB10_DPCM8_1X8,
 		.pixelformat = V4L2_PIX_FMT_SRGGB10DPCM8,
-		.bpp = 1,
-		.bayer = true,
 	},
 	{
 		.code = MEDIA_BUS_FMT_SBGGR12_1X12,
 		.pixelformat = V4L2_PIX_FMT_SBGGR12,
-		.bpp = 2,
-		.bayer = true,
 	},
 	{
 		.code = MEDIA_BUS_FMT_SGBRG12_1X12,
 		.pixelformat = V4L2_PIX_FMT_SGBRG12,
-		.bpp = 2,
-		.bayer = true,
 	},
 	{
 		.code = MEDIA_BUS_FMT_SGRBG12_1X12,
 		.pixelformat = V4L2_PIX_FMT_SGRBG12,
-		.bpp = 2,
-		.bayer = true,
 	},
 	{
 		.code = MEDIA_BUS_FMT_SRGGB12_1X12,
 		.pixelformat = V4L2_PIX_FMT_SRGGB12,
-		.bpp = 2,
-		.bayer = true,
 	},
 };
 
diff --git a/drivers/media/test-drivers/vimc/vimc-common.h b/drivers/media/test-drivers/vimc/vimc-common.h
index 487bd020f85c..f412368284df 100644
--- a/drivers/media/test-drivers/vimc/vimc-common.h
+++ b/drivers/media/test-drivers/vimc/vimc-common.h
@@ -62,18 +62,14 @@ do {									\
  * struct vimc_pix_map - maps media bus code with v4l2 pixel format
  *
  * @code:		media bus format code defined by MEDIA_BUS_FMT_* macros
- * @bpp:		number of bytes each pixel occupies
  * @pixelformat:	pixel format defined by V4L2_PIX_FMT_* macros
- * @bayer:		true if this is a bayer format
  *
  * Struct which matches the MEDIA_BUS_FMT_* codes with the corresponding
  * V4L2_PIX_FMT_* fourcc pixelformat and its bytes per pixel (bpp)
  */
 struct vimc_pix_map {
 	unsigned int code;
-	unsigned int bpp;
 	u32 pixelformat;
-	bool bayer;
 };
 
 /**
diff --git a/drivers/media/test-drivers/vimc/vimc-debayer.c b/drivers/media/test-drivers/vimc/vimc-debayer.c
index d10aee9f84c4..2d173d3d43db 100644
--- a/drivers/media/test-drivers/vimc/vimc-debayer.c
+++ b/drivers/media/test-drivers/vimc/vimc-debayer.c
@@ -303,6 +303,7 @@ static int vimc_deb_s_stream(struct v4l2_subdev *sd, int enable)
 	struct vimc_deb_device *vdeb = v4l2_get_subdevdata(sd);
 
 	if (enable) {
+		const struct v4l2_format_info *vinfo;
 		const struct vimc_pix_map *vpix;
 		unsigned int frame_size;
 
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
diff --git a/drivers/media/test-drivers/vimc/vimc-scaler.c b/drivers/media/test-drivers/vimc/vimc-scaler.c
index 465b906b7497..6a42fc794b58 100644
--- a/drivers/media/test-drivers/vimc/vimc-scaler.c
+++ b/drivers/media/test-drivers/vimc/vimc-scaler.c
@@ -111,9 +111,12 @@ static int vimc_sca_enum_mbus_code(struct v4l2_subdev *sd,
 				   struct v4l2_subdev_mbus_code_enum *code)
 {
 	const struct vimc_pix_map *vpix = vimc_pix_map_by_index(code->index);
+	const struct v4l2_format_info *vinfo;
+
+	vinfo = (vpix) ? v4l2_format_info(vpix->pixelformat) : NULL;
 
 	/* We don't support bayer format */
-	if (!vpix || vpix->bayer)
+	if (!vpix || v4l2_is_format_bayer(vinfo))
 		return -EINVAL;
 
 	code->code = vpix->code;
@@ -125,6 +128,7 @@ static int vimc_sca_enum_frame_size(struct v4l2_subdev *sd,
 				    struct v4l2_subdev_pad_config *cfg,
 				    struct v4l2_subdev_frame_size_enum *fse)
 {
+	const struct v4l2_format_info *vinfo;
 	const struct vimc_pix_map *vpix;
 
 	if (fse->index)
@@ -132,7 +136,9 @@ static int vimc_sca_enum_frame_size(struct v4l2_subdev *sd,
 
 	/* Only accept code in the pix map table in non bayer format */
 	vpix = vimc_pix_map_by_code(fse->code);
-	if (!vpix || vpix->bayer)
+	vinfo = (vpix) ? v4l2_format_info(vpix->pixelformat) : NULL;
+
+	if (!vpix || v4l2_is_format_bayer(vinfo))
 		return -EINVAL;
 
 	fse->min_width = VIMC_FRAME_MIN_WIDTH;
@@ -176,11 +182,13 @@ static int vimc_sca_get_fmt(struct v4l2_subdev *sd,
 
 static void vimc_sca_adjust_sink_fmt(struct v4l2_mbus_framefmt *fmt)
 {
+	const struct v4l2_format_info *vinfo;
 	const struct vimc_pix_map *vpix;
 
 	/* Only accept code in the pix map table in non bayer format */
 	vpix = vimc_pix_map_by_code(fmt->code);
-	if (!vpix || vpix->bayer)
+	vinfo = (vpix) ? v4l2_format_info(vpix->pixelformat) : NULL;
+	if (!vpix || v4l2_is_format_bayer(vinfo))
 		fmt->code = sink_fmt_default.code;
 
 	fmt->width = clamp_t(u32, fmt->width, VIMC_FRAME_MIN_WIDTH,
@@ -331,6 +339,7 @@ static int vimc_sca_s_stream(struct v4l2_subdev *sd, int enable)
 	struct vimc_sca_device *vsca = v4l2_get_subdevdata(sd);
 
 	if (enable) {
+		const struct v4l2_format_info *vinfo;
 		const struct vimc_pix_map *vpix;
 		unsigned int frame_size;
 
@@ -339,7 +348,8 @@ static int vimc_sca_s_stream(struct v4l2_subdev *sd, int enable)
 
 		/* Save the bytes per pixel of the sink */
 		vpix = vimc_pix_map_by_code(vsca->sink_fmt.code);
-		vsca->bpp = vpix->bpp;
+		vinfo = v4l2_format_info(vpix->pixelformat);
+		vsca->bpp = vinfo->bpp[0];
 
 		/* Calculate the width in bytes of the src frame */
 		vsca->src_line_size = vsca->crop_rect.width *
diff --git a/drivers/media/test-drivers/vimc/vimc-sensor.c b/drivers/media/test-drivers/vimc/vimc-sensor.c
index 228120b3a6dd..6cdcbb3773db 100644
--- a/drivers/media/test-drivers/vimc/vimc-sensor.c
+++ b/drivers/media/test-drivers/vimc/vimc-sensor.c
@@ -102,10 +102,13 @@ static void vimc_sen_tpg_s_format(struct vimc_sen_device *vsen)
 {
 	const struct vimc_pix_map *vpix =
 				vimc_pix_map_by_code(vsen->mbus_format.code);
+	const struct v4l2_format_info *vinfo =
+				v4l2_format_info(vpix->pixelformat);
 
 	tpg_reset_source(&vsen->tpg, vsen->mbus_format.width,
 			 vsen->mbus_format.height, vsen->mbus_format.field);
-	tpg_s_bytesperline(&vsen->tpg, 0, vsen->mbus_format.width * vpix->bpp);
+	tpg_s_bytesperline(&vsen->tpg, 0, vsen->mbus_format.width *
+							vinfo->bpp[0]);
 	tpg_s_buf_height(&vsen->tpg, vsen->mbus_format.height);
 	tpg_s_fourcc(&vsen->tpg, vpix->pixelformat);
 	/* TODO: add support for V4L2_FIELD_ALTERNATE */
@@ -198,12 +201,14 @@ static int vimc_sen_s_stream(struct v4l2_subdev *sd, int enable)
 				container_of(sd, struct vimc_sen_device, sd);
 
 	if (enable) {
+		const struct v4l2_format_info *vinfo;
 		const struct vimc_pix_map *vpix;
 		unsigned int frame_size;
 
 		/* Calculate the frame size */
 		vpix = vimc_pix_map_by_code(vsen->mbus_format.code);
-		frame_size = vsen->mbus_format.width * vpix->bpp *
+		vinfo = v4l2_format_info(vpix->pixelformat);
+		frame_size = vsen->mbus_format.width * vinfo->bpp[0] *
 			     vsen->mbus_format.height;
 
 		/*
-- 
2.26.2

