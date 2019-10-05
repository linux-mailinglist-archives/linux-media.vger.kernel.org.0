Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18551CCCD4
	for <lists+linux-media@lfdr.de>; Sat,  5 Oct 2019 23:11:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725917AbfJEVLo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 5 Oct 2019 17:11:44 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:36147 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725789AbfJEVLn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 5 Oct 2019 17:11:43 -0400
Received: by mail-qt1-f196.google.com with SMTP id o12so13758546qtf.3;
        Sat, 05 Oct 2019 14:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Sc0BKkAHyaJQi1cI/oLAeFC5Q4ApMqyK4Mh+C0apVyc=;
        b=JZlHOlxwY7vblQHwjDqipbzXxnWPgaprueGQrM+besZ6ULJFY/+sW1NnZ1ZaUyaTof
         QCHSA56STn8TnFGbmkmxKnnAMOdC6VXCP9A1W1jBscT5XsmUOarBGrLkdchOnhIz/BmZ
         K3mYgB6qxxySgYhDsUAydhP3RhHoiUTNwEROCBkH/N1kbc86MbsB9Hal9LxDEVHWy9E4
         wUagT1usNnG2bWTi2o4dPYH/8xGmcv0gq0eMKhxiBsE3XlCHs3COVzFKd22YSOiRTARZ
         PGkRSFzg1u1eldTJ9KMBypmG0c3sqPFy3eFjYbo/stKjufqy1FiTUcX61fu5I5iqMMK8
         mSqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Sc0BKkAHyaJQi1cI/oLAeFC5Q4ApMqyK4Mh+C0apVyc=;
        b=NPKDVm2rYECoPQuK5LCV7eyp0l/eBkDX2HU32QvCUeKEjXt5mWYWwhuJGYXKMIu0h0
         YpT7HW9h8/00RBiLJBu6rQC3Vws4IycJGjIGpW6k0jXjhvL38WNxugQczO4k9TdAzBsj
         hollxNyRe/C43o/OZmL2kb8w6Yd/TLngkjvqBnedWSrgiAouDWMGgEl4QjNh4bZFjbuK
         oe9e+8iZIhxKzFkytpZ7WcnGoxVlKKcLgOIosFc8NL43s/9ED6/WgDrgCb6Z99/iJIAE
         sKN1Nm7Emkxs8HTYWQ9Lq+TsWtm8k1qPPQA1yujPEwLQzyCiMe+PZyGZom5WtON8rlT9
         cr1A==
X-Gm-Message-State: APjAAAVewzGZEi4FWBITNXEZmM/tpMYa2ggUuabB5019wQHTMX8PDIJL
        MDhfdf8XEi5db8f9i9XuAWwU39j+4GE=
X-Google-Smtp-Source: APXvYqyy1pBZTq4Uyp/e0bygJyDEipLYw3TJ6BSNVPuhrMaw/CUqb2OcuG2bOrAQB0dudz1KCPci2g==
X-Received: by 2002:ac8:2e94:: with SMTP id h20mr23329627qta.234.1570309902194;
        Sat, 05 Oct 2019 14:11:42 -0700 (PDT)
Received: from archlinux.terracota.local ([177.103.155.130])
        by smtp.gmail.com with ESMTPSA id o28sm4431419qkk.106.2019.10.05.14.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2019 14:11:41 -0700 (PDT)
From:   "Carlos E. C. Barbosa" <climacobarbosacee@gmail.com>
X-Google-Original-From: "Carlos E. C. Barbosa" <carlosecb@tutanota.com>
To:     lkcamp@lists.libreplanetbr.org,
        Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: vimc: get pixformat info from v4l2_format_info to avoid code repetition
Date:   Sat,  5 Oct 2019 18:11:36 -0300
Message-Id: <20191005211136.552305-1-carlosecb@tutanota.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Carlos E.C. Barbosa" <carlosecb@tutanota.com>

As the info found in vim_pix_map members are already available in
v4l2_format_info those were removed and their calls remapped to it.

Signed-off-by: Carlos E. C. Barbosa <carlosecb@tutanota.com>
---
 drivers/media/platform/vimc/vimc-capture.c |  20 ++--
 drivers/media/platform/vimc/vimc-common.c  | 107 +++++++++------------
 drivers/media/platform/vimc/vimc-common.h  |  27 ++++--
 drivers/media/platform/vimc/vimc-debayer.c |   6 +-
 drivers/media/platform/vimc/vimc-scaler.c  |  26 +++--
 drivers/media/platform/vimc/vimc-sensor.c  |  25 ++---
 6 files changed, 105 insertions(+), 106 deletions(-)

diff --git a/drivers/media/platform/vimc/vimc-capture.c b/drivers/media/platform/vimc/vimc-capture.c
index 602f80323031..8be2f81d5da3 100644
--- a/drivers/media/platform/vimc/vimc-capture.c
+++ b/drivers/media/platform/vimc/vimc-capture.c
@@ -85,7 +85,7 @@ static int vimc_cap_try_fmt_vid_cap(struct file *file, void *priv,
 				    struct v4l2_format *f)
 {
 	struct v4l2_pix_format *format = &f->fmt.pix;
-	const struct vimc_pix_map *vpix;
+	struct vimc_pix_map vpix;
 
 	format->width = clamp_t(u32, format->width, VIMC_FRAME_MIN_WIDTH,
 				VIMC_FRAME_MAX_WIDTH) & ~1;
@@ -94,12 +94,12 @@ static int vimc_cap_try_fmt_vid_cap(struct file *file, void *priv,
 
 	/* Don't accept a pixelformat that is not on the table */
 	vpix = vimc_pix_map_by_pixelformat(format->pixelformat);
-	if (!vpix) {
+	if (!vpix.info) {
 		format->pixelformat = fmt_default.pixelformat;
 		vpix = vimc_pix_map_by_pixelformat(format->pixelformat);
 	}
 	/* TODO: Add support for custom bytesperline values */
-	format->bytesperline = format->width * vpix->bpp;
+	format->bytesperline = format->width * vpix.info->bpp[0];
 	format->sizeimage = format->bytesperline * format->height;
 
 	if (format->field == V4L2_FIELD_ANY)
@@ -146,12 +146,12 @@ static int vimc_cap_s_fmt_vid_cap(struct file *file, void *priv,
 static int vimc_cap_enum_fmt_vid_cap(struct file *file, void *priv,
 				     struct v4l2_fmtdesc *f)
 {
-	const struct vimc_pix_map *vpix = vimc_pix_map_by_index(f->index);
+	const struct vimc_pix_map vpix = vimc_pix_map_by_index(f->index);
 
-	if (!vpix)
+	if (!vpix.info)
 		return -EINVAL;
 
-	f->pixelformat = vpix->pixelformat;
+	f->pixelformat = vpix.info->format;
 
 	return 0;
 }
@@ -159,14 +159,14 @@ static int vimc_cap_enum_fmt_vid_cap(struct file *file, void *priv,
 static int vimc_cap_enum_framesizes(struct file *file, void *fh,
 				    struct v4l2_frmsizeenum *fsize)
 {
-	const struct vimc_pix_map *vpix;
+	struct vimc_pix_map vpix;
 
 	if (fsize->index)
 		return -EINVAL;
 
 	/* Only accept code in the pix map table */
 	vpix = vimc_pix_map_by_code(fsize->pixel_format);
-	if (!vpix)
+	if (!vpix.info)
 		return -EINVAL;
 
 	fsize->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
@@ -387,7 +387,7 @@ struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
 				     const char *vcfg_name)
 {
 	struct v4l2_device *v4l2_dev = &vimc->v4l2_dev;
-	const struct vimc_pix_map *vpix;
+	struct vimc_pix_map vpix;
 	struct vimc_cap_device *vcap;
 	struct video_device *vdev;
 	struct vb2_queue *q;
@@ -443,7 +443,7 @@ struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
 	/* Set default frame format */
 	vcap->format = fmt_default;
 	vpix = vimc_pix_map_by_pixelformat(vcap->format.pixelformat);
-	vcap->format.bytesperline = vcap->format.width * vpix->bpp;
+	vcap->format.bytesperline = vcap->format.width * vpix.info->bpp[0];
 	vcap->format.sizeimage = vcap->format.bytesperline *
 				 vcap->format.height;
 
diff --git a/drivers/media/platform/vimc/vimc-common.c b/drivers/media/platform/vimc/vimc-common.c
index a3120f4f7a90..9ea698810e1a 100644
--- a/drivers/media/platform/vimc/vimc-common.c
+++ b/drivers/media/platform/vimc/vimc-common.c
@@ -14,186 +14,167 @@
  * NOTE: non-bayer formats need to come first (necessary for enum_mbus_code
  * in the scaler)
  */
-static const struct vimc_pix_map vimc_pix_map_list[] = {
+static struct vimc_pix_map_fmt vimc_pix_map_fmt_list[] = {
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
+struct vimc_pix_map vimc_pix_map_fmt_info(struct vimc_pix_map_fmt *vfmt)
 {
-	if (i >= ARRAY_SIZE(vimc_pix_map_list))
-		return NULL;
 
-	return &vimc_pix_map_list[i];
+	struct vimc_pix_map vpix = {
+		.code = vfmt->code,
+		.info = v4l2_format_info(vfmt->pixelformat),
+	};
+	return vpix;
+}
+
+struct vimc_pix_map vimc_pix_map_by_index(unsigned int i)
+{
+	struct vimc_pix_map vpix;
+	struct vimc_pix_map_fmt *vfmt;
+
+	if (i >= ARRAY_SIZE(vimc_pix_map_fmt_list))
+		return (struct vimc_pix_map) {};
+
+	vfmt = &vimc_pix_map_fmt_list[i];
+	vpix = vimc_pix_map_fmt_info(vfmt);
+
+	return vpix;
 }
 EXPORT_SYMBOL_GPL(vimc_pix_map_by_index);
 
-const struct vimc_pix_map *vimc_pix_map_by_code(u32 code)
+struct vimc_pix_map vimc_pix_map_by_code(u32 code)
 {
+	struct vimc_pix_map vpix;
+	struct vimc_pix_map_fmt *vfmt;
 	unsigned int i;
 
-	for (i = 0; i < ARRAY_SIZE(vimc_pix_map_list); i++) {
-		if (vimc_pix_map_list[i].code == code)
-			return &vimc_pix_map_list[i];
+	for (i = 0; i < ARRAY_SIZE(vimc_pix_map_fmt_list); i++) {
+		if (vimc_pix_map_fmt_list[i].code == code) {
+			vfmt = &vimc_pix_map_fmt_list[i];
+			vpix = vimc_pix_map_fmt_info(vfmt);
+			return vpix;
+		}
 	}
-	return NULL;
+	return (struct vimc_pix_map) {};
 }
 EXPORT_SYMBOL_GPL(vimc_pix_map_by_code);
 
-const struct vimc_pix_map *vimc_pix_map_by_pixelformat(u32 pixelformat)
+struct vimc_pix_map vimc_pix_map_by_pixelformat(u32 pixelformat)
 {
+	struct vimc_pix_map vpix;
+	struct vimc_pix_map_fmt *vfmt;
 	unsigned int i;
 
-	for (i = 0; i < ARRAY_SIZE(vimc_pix_map_list); i++) {
-		if (vimc_pix_map_list[i].pixelformat == pixelformat)
-			return &vimc_pix_map_list[i];
+	for (i = 0; i < ARRAY_SIZE(vimc_pix_map_fmt_list); i++) {
+		if (vimc_pix_map_fmt_list[i].pixelformat == pixelformat) {
+			vfmt = &vimc_pix_map_fmt_list[i];
+			vpix = vimc_pix_map_fmt_info(vfmt);
+
+			return vpix;
+		}
 	}
-	return NULL;
+	return (struct vimc_pix_map) {};
 }
 EXPORT_SYMBOL_GPL(vimc_pix_map_by_pixelformat);
 
@@ -267,7 +248,7 @@ static int vimc_get_mbus_format(struct media_pad *pad,
 							 struct video_device,
 							 entity);
 		struct vimc_ent_device *ved = video_get_drvdata(vdev);
-		const struct vimc_pix_map *vpix;
+		struct vimc_pix_map vpix;
 		struct v4l2_pix_format vdev_fmt;
 
 		if (!ved->vdev_get_format)
@@ -275,7 +256,7 @@ static int vimc_get_mbus_format(struct media_pad *pad,
 
 		ved->vdev_get_format(ved, &vdev_fmt);
 		vpix = vimc_pix_map_by_pixelformat(vdev_fmt.pixelformat);
-		v4l2_fill_mbus_format(&fmt->format, &vdev_fmt, vpix->code);
+		v4l2_fill_mbus_format(&fmt->format, &vdev_fmt, vpix.code);
 	} else {
 		return -EINVAL;
 	}
diff --git a/drivers/media/platform/vimc/vimc-common.h b/drivers/media/platform/vimc/vimc-common.h
index 698db7c07645..ab847e6a739f 100644
--- a/drivers/media/platform/vimc/vimc-common.h
+++ b/drivers/media/platform/vimc/vimc-common.h
@@ -73,20 +73,31 @@ struct vimc_platform_data {
 };
 
 /**
- * struct vimc_pix_map - maps media bus code with v4l2 pixel format
+ * struct vimc_pix_map_fmt - maps media bus code with v4l2 pixel format
  *
  * @code:		media bus format code defined by MEDIA_BUS_FMT_* macros
- * @bbp:		number of bytes each pixel occupies
  * @pixelformat:	pixel format devined by V4L2_PIX_FMT_* macros
  *
  * Struct which matches the MEDIA_BUS_FMT_* codes with the corresponding
  * V4L2_PIX_FMT_* fourcc pixelformat and its bytes per pixel (bpp)
  */
-struct vimc_pix_map {
+struct vimc_pix_map_fmt {
 	unsigned int code;
-	unsigned int bpp;
 	u32 pixelformat;
-	bool bayer;
+};
+
+/**
+ * struct vimc_pix_map - maps media bus code with v4l2 pixel info
+ *
+ * @code:		media bus format code defined by MEDIA_BUS_FMT_* macros
+ * @info:		pixel info defined by v4l2_format_info function
+ *
+ * Struct which matches the MEDIA_BUS_FMT_* codes with the corresponding
+ * V4L2_PIX_FMT_* fourcc pixelformat and its information
+ */
+struct vimc_pix_map {
+	unsigned int code;
+	const struct v4l2_format_info *info;
 };
 
 /**
@@ -208,21 +219,21 @@ int vimc_pipeline_s_stream(struct media_entity *ent, int enable);
  *
  * @i:			index of the vimc_pix_map struct in vimc_pix_map_list
  */
-const struct vimc_pix_map *vimc_pix_map_by_index(unsigned int i);
+struct vimc_pix_map vimc_pix_map_by_index(unsigned int i);
 
 /**
  * vimc_pix_map_by_code - get vimc_pix_map struct by media bus code
  *
  * @code:		media bus format code defined by MEDIA_BUS_FMT_* macros
  */
-const struct vimc_pix_map *vimc_pix_map_by_code(u32 code);
+struct vimc_pix_map vimc_pix_map_by_code(u32 code);
 
 /**
  * vimc_pix_map_by_pixelformat - get vimc_pix_map struct by v4l2 pixel format
  *
  * @pixelformat:	pixel format devined by V4L2_PIX_FMT_* macros
  */
-const struct vimc_pix_map *vimc_pix_map_by_pixelformat(u32 pixelformat);
+struct vimc_pix_map vimc_pix_map_by_pixelformat(u32 pixelformat);
 
 /**
  * vimc_ent_sd_register - initialize and register a subdev node
diff --git a/drivers/media/platform/vimc/vimc-debayer.c b/drivers/media/platform/vimc/vimc-debayer.c
index feac47d79449..4d658d65af9c 100644
--- a/drivers/media/platform/vimc/vimc-debayer.c
+++ b/drivers/media/platform/vimc/vimc-debayer.c
@@ -306,7 +306,7 @@ static int vimc_deb_s_stream(struct v4l2_subdev *sd, int enable)
 	struct vimc_deb_device *vdeb = v4l2_get_subdevdata(sd);
 
 	if (enable) {
-		const struct vimc_pix_map *vpix;
+		struct vimc_pix_map vpix;
 		unsigned int frame_size;
 
 		if (vdeb->src_frame)
@@ -315,11 +315,11 @@ static int vimc_deb_s_stream(struct v4l2_subdev *sd, int enable)
 		/* Calculate the frame size of the source pad */
 		vpix = vimc_pix_map_by_code(vdeb->src_code);
 		frame_size = vdeb->sink_fmt.width * vdeb->sink_fmt.height *
-				vpix->bpp;
+				vpix.info->bpp[0];
 
 		/* Save the bytes per pixel of the sink */
 		vpix = vimc_pix_map_by_code(vdeb->sink_fmt.code);
-		vdeb->sink_bpp = vpix->bpp;
+		vdeb->sink_bpp = vpix.info->bpp[0];
 
 		/* Get the corresponding pixel map from the table */
 		vdeb->sink_pix_map =
diff --git a/drivers/media/platform/vimc/vimc-scaler.c b/drivers/media/platform/vimc/vimc-scaler.c
index a6a3cc5be872..dd330ccbb88b 100644
--- a/drivers/media/platform/vimc/vimc-scaler.c
+++ b/drivers/media/platform/vimc/vimc-scaler.c
@@ -59,17 +59,23 @@ static int vimc_sca_init_cfg(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int vimc_is_bayer(const struct vimc_pix_map vpix)
+{
+	const u8 *bpp = vpix.info->bpp;
+
+	return bpp[0] == 1 && !bpp[1] && !bpp[2] && !bpp[3];
+}
+
 static int vimc_sca_enum_mbus_code(struct v4l2_subdev *sd,
 				   struct v4l2_subdev_pad_config *cfg,
 				   struct v4l2_subdev_mbus_code_enum *code)
 {
-	const struct vimc_pix_map *vpix = vimc_pix_map_by_index(code->index);
-
+	const struct vimc_pix_map vpix = vimc_pix_map_by_index(code->index);
 	/* We don't support bayer format */
-	if (!vpix || vpix->bayer)
+	if (!vpix.info || vimc_is_bayer(vpix))
 		return -EINVAL;
 
-	code->code = vpix->code;
+	code->code = vpix.code;
 
 	return 0;
 }
@@ -78,14 +84,14 @@ static int vimc_sca_enum_frame_size(struct v4l2_subdev *sd,
 				    struct v4l2_subdev_pad_config *cfg,
 				    struct v4l2_subdev_frame_size_enum *fse)
 {
-	const struct vimc_pix_map *vpix;
+	struct vimc_pix_map vpix;
 
 	if (fse->index)
 		return -EINVAL;
 
 	/* Only accept code in the pix map table in non bayer format */
 	vpix = vimc_pix_map_by_code(fse->code);
-	if (!vpix || vpix->bayer)
+	if (!vpix.info || vimc_is_bayer(vpix))
 		return -EINVAL;
 
 	fse->min_width = VIMC_FRAME_MIN_WIDTH;
@@ -124,11 +130,11 @@ static int vimc_sca_get_fmt(struct v4l2_subdev *sd,
 
 static void vimc_sca_adjust_sink_fmt(struct v4l2_mbus_framefmt *fmt)
 {
-	const struct vimc_pix_map *vpix;
+	struct vimc_pix_map vpix;
 
 	/* Only accept code in the pix map table in non bayer format */
 	vpix = vimc_pix_map_by_code(fmt->code);
-	if (!vpix || vpix->bayer)
+	if (!vpix.info || vimc_is_bayer(vpix))
 		fmt->code = sink_fmt_default.code;
 
 	fmt->width = clamp_t(u32, fmt->width, VIMC_FRAME_MIN_WIDTH,
@@ -202,7 +208,7 @@ static int vimc_sca_s_stream(struct v4l2_subdev *sd, int enable)
 	struct vimc_sca_device *vsca = v4l2_get_subdevdata(sd);
 
 	if (enable) {
-		const struct vimc_pix_map *vpix;
+		struct vimc_pix_map vpix;
 		unsigned int frame_size;
 
 		if (vsca->src_frame)
@@ -210,7 +216,7 @@ static int vimc_sca_s_stream(struct v4l2_subdev *sd, int enable)
 
 		/* Save the bytes per pixel of the sink */
 		vpix = vimc_pix_map_by_code(vsca->sink_fmt.code);
-		vsca->bpp = vpix->bpp;
+		vsca->bpp = vpix.info->bpp[0];
 
 		/* Calculate the width in bytes of the src frame */
 		vsca->src_line_size = vsca->sink_fmt.width *
diff --git a/drivers/media/platform/vimc/vimc-sensor.c b/drivers/media/platform/vimc/vimc-sensor.c
index 46dc6a535abe..a7c422983d45 100644
--- a/drivers/media/platform/vimc/vimc-sensor.c
+++ b/drivers/media/platform/vimc/vimc-sensor.c
@@ -53,12 +53,12 @@ static int vimc_sen_enum_mbus_code(struct v4l2_subdev *sd,
 				   struct v4l2_subdev_pad_config *cfg,
 				   struct v4l2_subdev_mbus_code_enum *code)
 {
-	const struct vimc_pix_map *vpix = vimc_pix_map_by_index(code->index);
+	struct vimc_pix_map vpix = vimc_pix_map_by_index(code->index);
 
-	if (!vpix)
+	if (!vpix.info)
 		return -EINVAL;
 
-	code->code = vpix->code;
+	code->code = vpix.code;
 
 	return 0;
 }
@@ -67,14 +67,14 @@ static int vimc_sen_enum_frame_size(struct v4l2_subdev *sd,
 				    struct v4l2_subdev_pad_config *cfg,
 				    struct v4l2_subdev_frame_size_enum *fse)
 {
-	const struct vimc_pix_map *vpix;
+	struct vimc_pix_map vpix;
 
 	if (fse->index)
 		return -EINVAL;
 
 	/* Only accept code in the pix map table */
 	vpix = vimc_pix_map_by_code(fse->code);
-	if (!vpix)
+	if (!vpix.info)
 		return -EINVAL;
 
 	fse->min_width = VIMC_FRAME_MIN_WIDTH;
@@ -101,14 +101,15 @@ static int vimc_sen_get_fmt(struct v4l2_subdev *sd,
 
 static void vimc_sen_tpg_s_format(struct vimc_sen_device *vsen)
 {
-	const struct vimc_pix_map *vpix =
+	const struct vimc_pix_map vpix =
 				vimc_pix_map_by_code(vsen->mbus_format.code);
 
 	tpg_reset_source(&vsen->tpg, vsen->mbus_format.width,
 			 vsen->mbus_format.height, vsen->mbus_format.field);
-	tpg_s_bytesperline(&vsen->tpg, 0, vsen->mbus_format.width * vpix->bpp);
+	tpg_s_bytesperline(&vsen->tpg, 0, vsen->mbus_format.width
+							* vpix.info->bpp[0]);
 	tpg_s_buf_height(&vsen->tpg, vsen->mbus_format.height);
-	tpg_s_fourcc(&vsen->tpg, vpix->pixelformat);
+	tpg_s_fourcc(&vsen->tpg, vpix.info->format);
 	/* TODO: add support for V4L2_FIELD_ALTERNATE */
 	tpg_s_field(&vsen->tpg, vsen->mbus_format.field, false);
 	tpg_s_colorspace(&vsen->tpg, vsen->mbus_format.colorspace);
@@ -119,11 +120,11 @@ static void vimc_sen_tpg_s_format(struct vimc_sen_device *vsen)
 
 static void vimc_sen_adjust_fmt(struct v4l2_mbus_framefmt *fmt)
 {
-	const struct vimc_pix_map *vpix;
+	struct vimc_pix_map vpix;
 
 	/* Only accept code in the pix map table */
 	vpix = vimc_pix_map_by_code(fmt->code);
-	if (!vpix)
+	if (!vpix.info)
 		fmt->code = fmt_default.code;
 
 	fmt->width = clamp_t(u32, fmt->width, VIMC_FRAME_MIN_WIDTH,
@@ -199,7 +200,7 @@ static int vimc_sen_s_stream(struct v4l2_subdev *sd, int enable)
 				container_of(sd, struct vimc_sen_device, sd);
 
 	if (enable) {
-		const struct vimc_pix_map *vpix;
+		struct vimc_pix_map vpix;
 		unsigned int frame_size;
 
 		if (vsen->kthread_sen)
@@ -208,7 +209,7 @@ static int vimc_sen_s_stream(struct v4l2_subdev *sd, int enable)
 
 		/* Calculate the frame size */
 		vpix = vimc_pix_map_by_code(vsen->mbus_format.code);
-		frame_size = vsen->mbus_format.width * vpix->bpp *
+		frame_size = vsen->mbus_format.width * vpix.info->bpp[0] *
 			     vsen->mbus_format.height;
 
 		/*
-- 
2.23.0

