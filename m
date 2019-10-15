Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA8B8D8417
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2019 00:54:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390101AbfJOWyG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Oct 2019 18:54:06 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:34334 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728043AbfJOWyG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Oct 2019 18:54:06 -0400
Received: by mail-qt1-f194.google.com with SMTP id 3so33251308qta.1;
        Tue, 15 Oct 2019 15:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XtWhutOEtbIJ8b4Dr4yQrl9+OnFF93rLKIJWIWZGfkk=;
        b=CVPBSR1jcGjMsiHvRaj6Bnt9i22C50S0sOp9842RxzLl8ve3Gez3Ec83ml4vV/G7D1
         0XBRGvHUlafe8R+rB80jGf1awOCqb5uBlMX6iMQGsrfo9hlgiFJn0dgA3WtKcesMnbld
         mMjN4uKnn2rdWwVFxEf+vYVXGV2A1jiDH4FVxcURtAFJBth1Ra4UF77b9ZOBDcGrLdnt
         4oFnJh4DyNW82dXGdVtsMCmKbBJ07flry9KDJUGx/tOCH0NO5WiNNVQs3RtO2OnFGN6M
         rOpiXCkPOtsZKBWIqM2a8IiKvDYbgi4yflBJuSo0CvlVWLXWoFPCrZppdk1TgtWvLCnL
         Qx0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XtWhutOEtbIJ8b4Dr4yQrl9+OnFF93rLKIJWIWZGfkk=;
        b=oy933RY+ySbxnijxVU65CjO5upXqLwVO8ykp3Jv39+EqSUJxxl6427nGnvcxfVKO3u
         fqhA6/kS+3NIryMC90ak4FgKC6DlEq7ptQ0CqemIz3xXs3y6TPLGpUJpRZg3tevI5mXv
         UbppwfqRq0Q9JktrmZXAeVPmaZE/yI43ML9DUIfpTRj2ZV4azaf8x+9Cfd86XB7vzYJg
         IwQ64VWeg1lleLWNILbX6tloNlpOPrLoyctPBBaUVRhQgwWfD7svHchAEwF3e+AxJHln
         T+fR0Y5AqAvm5RNoJJdj9P+w5VBF3nFN2n9I+aPBRl60DQUWxurk37arOENl9YT7sDNa
         YlyQ==
X-Gm-Message-State: APjAAAUxgmML7ydtVJFnaZECLW/Xxwn5SZmT2UVkG4mp+z6l8rJo88aq
        VJyP8X8h8QPjQ5vpMsLFojE=
X-Google-Smtp-Source: APXvYqyM5/1+WnynDnDclLUGzwtP0QoK6aNPn+s50ygIXchOF9J65pKxjkqXga3Qlx2P9kSVsxSgeQ==
X-Received: by 2002:ac8:22f1:: with SMTP id g46mr41293314qta.12.1571180044318;
        Tue, 15 Oct 2019 15:54:04 -0700 (PDT)
Received: from archlinux.ic.unicamp.br (wifi-177-220-85-159.wifi.ic.unicamp.br. [177.220.85.159])
        by smtp.gmail.com with ESMTPSA id d25sm5587299qtj.84.2019.10.15.15.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 15:54:03 -0700 (PDT)
From:   "Carlos E. C. Barbosa" <climacobarbosacee@gmail.com>
X-Google-Original-From: "Carlos E. C. Barbosa" <carlosecb@tutanota.com>
To:     Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        lkcamp@lists.libreplanetbr.org
Cc:     "Carlos E.C. Barbosa" <carlosecb@tutanota.com>
Subject: [PATCH] media: vimc: get pixformat info from v4l2_format_info to avoid code repetition
Date:   Tue, 15 Oct 2019 19:52:58 -0300
Message-Id: <20191015225258.6923-1-carlosecb@tutanota.com>
X-Mailer: git-send-email 2.23.0
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

---

Change in v2:
- Change commit message
- Remove struct with mbus code and pointer to v4l2_format_info
- The map and info are directly called when strictly needed

Signed-off-by: Carlos E. C. Barbosa <carlosecb@tutanota.com>
---
 drivers/media/platform/vimc/vimc-capture.c | 14 ++--
 drivers/media/platform/vimc/vimc-common.c  | 78 ++++++----------------
 drivers/media/platform/vimc/vimc-common.h  |  9 +--
 drivers/media/platform/vimc/vimc-debayer.c |  9 ++-
 drivers/media/platform/vimc/vimc-scaler.c  | 39 +++++++++--
 drivers/media/platform/vimc/vimc-sensor.c  | 26 +++++---
 6 files changed, 89 insertions(+), 86 deletions(-)

diff --git a/drivers/media/platform/vimc/vimc-capture.c b/drivers/media/platform/vimc/vimc-capture.c
index 602f80323031..65282d4d8a1e 100644
--- a/drivers/media/platform/vimc/vimc-capture.c
+++ b/drivers/media/platform/vimc/vimc-capture.c
@@ -85,7 +85,8 @@ static int vimc_cap_try_fmt_vid_cap(struct file *file, void *priv,
 				    struct v4l2_format *f)
 {
 	struct v4l2_pix_format *format = &f->fmt.pix;
-	const struct vimc_pix_map *vpix;
+	struct vimc_pix_map *vpix;
+	struct v4l2_format_info *vinfo;
 
 	format->width = clamp_t(u32, format->width, VIMC_FRAME_MIN_WIDTH,
 				VIMC_FRAME_MAX_WIDTH) & ~1;
@@ -99,7 +100,8 @@ static int vimc_cap_try_fmt_vid_cap(struct file *file, void *priv,
 		vpix = vimc_pix_map_by_pixelformat(format->pixelformat);
 	}
 	/* TODO: Add support for custom bytesperline values */
-	format->bytesperline = format->width * vpix->bpp;
+	vinfo = v4l2_format_info(vpix->pixelformat);
+	format->bytesperline = format->width * vinfo->bpp[0];
 	format->sizeimage = format->bytesperline * format->height;
 
 	if (format->field == V4L2_FIELD_ANY)
@@ -159,7 +161,7 @@ static int vimc_cap_enum_fmt_vid_cap(struct file *file, void *priv,
 static int vimc_cap_enum_framesizes(struct file *file, void *fh,
 				    struct v4l2_frmsizeenum *fsize)
 {
-	const struct vimc_pix_map *vpix;
+	struct vimc_pix_map *vpix;
 
 	if (fsize->index)
 		return -EINVAL;
@@ -387,7 +389,8 @@ struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
 				     const char *vcfg_name)
 {
 	struct v4l2_device *v4l2_dev = &vimc->v4l2_dev;
-	const struct vimc_pix_map *vpix;
+	struct vimc_pix_map *vpix;
+	struct v4l2_format_info *vinfo;
 	struct vimc_cap_device *vcap;
 	struct video_device *vdev;
 	struct vb2_queue *q;
@@ -443,7 +446,8 @@ struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
 	/* Set default frame format */
 	vcap->format = fmt_default;
 	vpix = vimc_pix_map_by_pixelformat(vcap->format.pixelformat);
-	vcap->format.bytesperline = vcap->format.width * vpix->bpp;
+	vinfo = v4l2_format_info(vpix->pixelformat);
+	vcap->format.bytesperline = vcap->format.width * vinfo->bpp[0];
 	vcap->format.sizeimage = vcap->format.bytesperline *
 				 vcap->format.height;
 
diff --git a/drivers/media/platform/vimc/vimc-common.c b/drivers/media/platform/vimc/vimc-common.c
index a3120f4f7a90..73feea089921 100644
--- a/drivers/media/platform/vimc/vimc-common.c
+++ b/drivers/media/platform/vimc/vimc-common.c
@@ -14,185 +14,151 @@
  * NOTE: non-bayer formats need to come first (necessary for enum_mbus_code
  * in the scaler)
  */
-static const struct vimc_pix_map vimc_pix_map_list[] = {
+static struct vimc_pix_map vimc_pix_map_list[] = {
 	/* TODO: add all missing formats */
 
 	/* RGB formats */
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
 
-const struct vimc_pix_map *vimc_pix_map_by_index(unsigned int i)
+struct vimc_pix_map *vimc_pix_map_by_index(unsigned int i)
 {
+	struct vimc_pix_map *vpix;
+
 	if (i >= ARRAY_SIZE(vimc_pix_map_list))
 		return NULL;
 
-	return &vimc_pix_map_list[i];
+	vpix = &vimc_pix_map_list[i];
+
+	return vpix;
 }
 EXPORT_SYMBOL_GPL(vimc_pix_map_by_index);
 
-const struct vimc_pix_map *vimc_pix_map_by_code(u32 code)
+struct vimc_pix_map *vimc_pix_map_by_code(u32 code)
 {
+	struct vimc_pix_map *vpix;
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(vimc_pix_map_list); i++) {
-		if (vimc_pix_map_list[i].code == code)
-			return &vimc_pix_map_list[i];
+		if (vimc_pix_map_list[i].code == code) {
+			vpix = &vimc_pix_map_list[i];
+			return vpix;
+		}
 	}
+
 	return NULL;
 }
 EXPORT_SYMBOL_GPL(vimc_pix_map_by_code);
 
-const struct vimc_pix_map *vimc_pix_map_by_pixelformat(u32 pixelformat)
+struct vimc_pix_map *vimc_pix_map_by_pixelformat(u32 pixelformat)
 {
+	struct vimc_pix_map *vpix;
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(vimc_pix_map_list); i++) {
-		if (vimc_pix_map_list[i].pixelformat == pixelformat)
-			return &vimc_pix_map_list[i];
+		if (vimc_pix_map_list[i].pixelformat == pixelformat) {
+			vpix = &vimc_pix_map_list[i];
+			return vpix;
+		}
 	}
+
 	return NULL;
 }
 EXPORT_SYMBOL_GPL(vimc_pix_map_by_pixelformat);
@@ -267,7 +233,7 @@ static int vimc_get_mbus_format(struct media_pad *pad,
 							 struct video_device,
 							 entity);
 		struct vimc_ent_device *ved = video_get_drvdata(vdev);
-		const struct vimc_pix_map *vpix;
+		struct vimc_pix_map *vpix;
 		struct v4l2_pix_format vdev_fmt;
 
 		if (!ved->vdev_get_format)
diff --git a/drivers/media/platform/vimc/vimc-common.h b/drivers/media/platform/vimc/vimc-common.h
index 698db7c07645..a3199595cb45 100644
--- a/drivers/media/platform/vimc/vimc-common.h
+++ b/drivers/media/platform/vimc/vimc-common.h
@@ -76,7 +76,6 @@ struct vimc_platform_data {
  * struct vimc_pix_map - maps media bus code with v4l2 pixel format
  *
  * @code:		media bus format code defined by MEDIA_BUS_FMT_* macros
- * @bbp:		number of bytes each pixel occupies
  * @pixelformat:	pixel format devined by V4L2_PIX_FMT_* macros
  *
  * Struct which matches the MEDIA_BUS_FMT_* codes with the corresponding
@@ -84,9 +83,7 @@ struct vimc_platform_data {
  */
 struct vimc_pix_map {
 	unsigned int code;
-	unsigned int bpp;
 	u32 pixelformat;
-	bool bayer;
 };
 
 /**
@@ -208,21 +205,21 @@ int vimc_pipeline_s_stream(struct media_entity *ent, int enable);
  *
  * @i:			index of the vimc_pix_map struct in vimc_pix_map_list
  */
-const struct vimc_pix_map *vimc_pix_map_by_index(unsigned int i);
+struct vimc_pix_map *vimc_pix_map_by_index(unsigned int i);
 
 /**
  * vimc_pix_map_by_code - get vimc_pix_map struct by media bus code
  *
  * @code:		media bus format code defined by MEDIA_BUS_FMT_* macros
  */
-const struct vimc_pix_map *vimc_pix_map_by_code(u32 code);
+struct vimc_pix_map *vimc_pix_map_by_code(u32 code);
 
 /**
  * vimc_pix_map_by_pixelformat - get vimc_pix_map struct by v4l2 pixel format
  *
  * @pixelformat:	pixel format devined by V4L2_PIX_FMT_* macros
  */
-const struct vimc_pix_map *vimc_pix_map_by_pixelformat(u32 pixelformat);
+struct vimc_pix_map *vimc_pix_map_by_pixelformat(u32 pixelformat);
 
 /**
  * vimc_ent_sd_register - initialize and register a subdev node
diff --git a/drivers/media/platform/vimc/vimc-debayer.c b/drivers/media/platform/vimc/vimc-debayer.c
index feac47d79449..7d1de5b2a838 100644
--- a/drivers/media/platform/vimc/vimc-debayer.c
+++ b/drivers/media/platform/vimc/vimc-debayer.c
@@ -306,7 +306,8 @@ static int vimc_deb_s_stream(struct v4l2_subdev *sd, int enable)
 	struct vimc_deb_device *vdeb = v4l2_get_subdevdata(sd);
 
 	if (enable) {
-		const struct vimc_pix_map *vpix;
+		struct vimc_pix_map *vpix;
+		struct v4l2_format_info *vinfo;
 		unsigned int frame_size;
 
 		if (vdeb->src_frame)
@@ -314,12 +315,14 @@ static int vimc_deb_s_stream(struct v4l2_subdev *sd, int enable)
 
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
index a6a3cc5be872..87c7ab878ea8 100644
--- a/drivers/media/platform/vimc/vimc-scaler.c
+++ b/drivers/media/platform/vimc/vimc-scaler.c
@@ -59,14 +59,31 @@ static int vimc_sca_init_cfg(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int vimc_is_supported(const struct v4l2_format_info *vinfo)
+{
+
+	const u8 *bpp;
+
+	if (!vinfo)
+		return 0;
+
+	bpp = vinfo->bpp;
+
+	return bpp[0] == 1 && !bpp[1] && !bpp[2] && !bpp[3];
+}
+
 static int vimc_sca_enum_mbus_code(struct v4l2_subdev *sd,
 				   struct v4l2_subdev_pad_config *cfg,
 				   struct v4l2_subdev_mbus_code_enum *code)
 {
-	const struct vimc_pix_map *vpix = vimc_pix_map_by_index(code->index);
+	const struct vimc_pix_map *vpix;
+	const struct v4l2_format_info *vinfo;
+
+	vpix = vimc_pix_map_by_index(code->index);
+	vinfo = v4l2_format_info(vpix->pixelformat);
 
 	/* We don't support bayer format */
-	if (!vpix || vpix->bayer)
+	if (!vpix || !vimc_is_supported(vinfo))
 		return -EINVAL;
 
 	code->code = vpix->code;
@@ -79,13 +96,16 @@ static int vimc_sca_enum_frame_size(struct v4l2_subdev *sd,
 				    struct v4l2_subdev_frame_size_enum *fse)
 {
 	const struct vimc_pix_map *vpix;
+	const struct v4l2_format_info *vinfo;
 
 	if (fse->index)
 		return -EINVAL;
 
 	/* Only accept code in the pix map table in non bayer format */
 	vpix = vimc_pix_map_by_code(fse->code);
-	if (!vpix || vpix->bayer)
+	vinfo = v4l2_format_info(vpix->pixelformat);
+
+	if (!vpix || !vimc_is_supported(vinfo))
 		return -EINVAL;
 
 	fse->min_width = VIMC_FRAME_MIN_WIDTH;
@@ -125,10 +145,13 @@ static int vimc_sca_get_fmt(struct v4l2_subdev *sd,
 static void vimc_sca_adjust_sink_fmt(struct v4l2_mbus_framefmt *fmt)
 {
 	const struct vimc_pix_map *vpix;
+	const struct v4l2_format_info *vinfo;
 
-	/* Only accept code in the pix map table in non bayer format */
 	vpix = vimc_pix_map_by_code(fmt->code);
-	if (!vpix || vpix->bayer)
+	vinfo = v4l2_format_info(vpix->pixelformat);
+
+	/* Only accept code in the pix map table in non bayer format */
+	if (!vpix || !vimc_is_supported(vinfo))
 		fmt->code = sink_fmt_default.code;
 
 	fmt->width = clamp_t(u32, fmt->width, VIMC_FRAME_MIN_WIDTH,
@@ -202,7 +225,8 @@ static int vimc_sca_s_stream(struct v4l2_subdev *sd, int enable)
 	struct vimc_sca_device *vsca = v4l2_get_subdevdata(sd);
 
 	if (enable) {
-		const struct vimc_pix_map *vpix;
+		struct vimc_pix_map *vpix;
+		struct v4l2_format_info *vinfo;
 		unsigned int frame_size;
 
 		if (vsca->src_frame)
@@ -210,7 +234,8 @@ static int vimc_sca_s_stream(struct v4l2_subdev *sd, int enable)
 
 		/* Save the bytes per pixel of the sink */
 		vpix = vimc_pix_map_by_code(vsca->sink_fmt.code);
-		vsca->bpp = vpix->bpp;
+		vinfo = v4l2_format_info(vpix->pixelformat);
+		vsca->bpp = vinfo->bpp[0];
 
 		/* Calculate the width in bytes of the src frame */
 		vsca->src_line_size = vsca->sink_fmt.width *
diff --git a/drivers/media/platform/vimc/vimc-sensor.c b/drivers/media/platform/vimc/vimc-sensor.c
index 46dc6a535abe..d247373a8767 100644
--- a/drivers/media/platform/vimc/vimc-sensor.c
+++ b/drivers/media/platform/vimc/vimc-sensor.c
@@ -53,7 +53,9 @@ static int vimc_sen_enum_mbus_code(struct v4l2_subdev *sd,
 				   struct v4l2_subdev_pad_config *cfg,
 				   struct v4l2_subdev_mbus_code_enum *code)
 {
-	const struct vimc_pix_map *vpix = vimc_pix_map_by_index(code->index);
+	const struct vimc_pix_map *vpix;
+
+	vpix = vimc_pix_map_by_index(code->index);
 
 	if (!vpix)
 		return -EINVAL;
@@ -67,7 +69,7 @@ static int vimc_sen_enum_frame_size(struct v4l2_subdev *sd,
 				    struct v4l2_subdev_pad_config *cfg,
 				    struct v4l2_subdev_frame_size_enum *fse)
 {
-	const struct vimc_pix_map *vpix;
+	struct vimc_pix_map *vpix;
 
 	if (fse->index)
 		return -EINVAL;
@@ -101,12 +103,16 @@ static int vimc_sen_get_fmt(struct v4l2_subdev *sd,
 
 static void vimc_sen_tpg_s_format(struct vimc_sen_device *vsen)
 {
-	const struct vimc_pix_map *vpix =
-				vimc_pix_map_by_code(vsen->mbus_format.code);
+	const struct vimc_pix_map *vpix;
+	const struct v4l2_format_info *vinfo;
+
+	vpix = vimc_pix_map_by_code(vsen->mbus_format.code);
+	vinfo = v4l2_format_info(vpix->pixelformat);
 
 	tpg_reset_source(&vsen->tpg, vsen->mbus_format.width,
-			 vsen->mbus_format.height, vsen->mbus_format.field);
-	tpg_s_bytesperline(&vsen->tpg, 0, vsen->mbus_format.width * vpix->bpp);
+			vsen->mbus_format.height, vsen->mbus_format.field);
+	tpg_s_bytesperline(&vsen->tpg, 0,
+			vsen->mbus_format.width * vinfo->bpp[0]);
 	tpg_s_buf_height(&vsen->tpg, vsen->mbus_format.height);
 	tpg_s_fourcc(&vsen->tpg, vpix->pixelformat);
 	/* TODO: add support for V4L2_FIELD_ALTERNATE */
@@ -119,7 +125,7 @@ static void vimc_sen_tpg_s_format(struct vimc_sen_device *vsen)
 
 static void vimc_sen_adjust_fmt(struct v4l2_mbus_framefmt *fmt)
 {
-	const struct vimc_pix_map *vpix;
+	struct vimc_pix_map *vpix;
 
 	/* Only accept code in the pix map table */
 	vpix = vimc_pix_map_by_code(fmt->code);
@@ -199,7 +205,8 @@ static int vimc_sen_s_stream(struct v4l2_subdev *sd, int enable)
 				container_of(sd, struct vimc_sen_device, sd);
 
 	if (enable) {
-		const struct vimc_pix_map *vpix;
+		struct vimc_pix_map *vpix;
+		struct v4l2_format_info *vinfo;
 		unsigned int frame_size;
 
 		if (vsen->kthread_sen)
@@ -208,7 +215,8 @@ static int vimc_sen_s_stream(struct v4l2_subdev *sd, int enable)
 
 		/* Calculate the frame size */
 		vpix = vimc_pix_map_by_code(vsen->mbus_format.code);
-		frame_size = vsen->mbus_format.width * vpix->bpp *
+		vinfo = v4l2_format_info(vpix->pixelformat);
+		frame_size = vsen->mbus_format.width * vinfo->bpp[0] *
 			     vsen->mbus_format.height;
 
 		/*
-- 
2.23.0

