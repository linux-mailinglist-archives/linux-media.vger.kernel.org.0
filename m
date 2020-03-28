Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 655C4196A04
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2020 00:10:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727801AbgC1XK0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 28 Mar 2020 19:10:26 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:50648 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727725AbgC1XK0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 28 Mar 2020 19:10:26 -0400
Received: by mail-pj1-f66.google.com with SMTP id v13so5732745pjb.0
        for <linux-media@vger.kernel.org>; Sat, 28 Mar 2020 16:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=cux4DklEFWIT57sTLXAkS/5MG6rGPZDIgDkQLle/cxY=;
        b=C0z6xjWEWxwDkkoF0KH/uddY687WN93P/tq9cdOHd0d0gSTCdyHcdzwQoYb9RV1pO2
         wCyyXNuK10aZiBuuwIXHjfKp9a550wPszjBUDwpH+wQ21zZNO0VbIK4mmveFFkhHygYd
         7E8L/Cf4odsjJzQQf1/PU1kVnQyutmADiqXX9l9hvtA2o9HEc1/WX9g0e1KkVnNa6dM/
         Yo6vBlFBy8chOT43z9hmpCRe0ebNIS0oGQI2D73CaEUzDHhiDF5TMr7KpFLjhRxEPq/p
         enjHRlTnRf5qQI1OspAhIwfh2BofcVyvuQHlWC9VkaFean35l2gQ5O98rhplaU1MQukY
         etZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=cux4DklEFWIT57sTLXAkS/5MG6rGPZDIgDkQLle/cxY=;
        b=b2d5IiIWkNfK+ii3kBBR4a2K3CmmCJx8KPb4BUwXhn/6zKX1REtHZ/nmpqHWbHqxE7
         A8YbdA3UgxB0qWNb3AG7qQCHtCAabmKBgL1/1ysTJa3dc/WGoGA2cL/reTngI51uj7zV
         ml1B3nrVL/9JKH58bcSF4PA/MEhVTM3ruKB58gi7dkoLrJ+ciFx+hvST7zx6h2TDk8NZ
         uK8Y8AQW/Ez3shqNvMZdPr0RKpfz35kkalM82n7TNovhb3wlkZYk4E2dc/DH7HH15c39
         56+osdxqlxxaYdzxNBSk0xrxFcc7i/coR56v0HtUPjmI7AHdozQIT4Ut+jAIoA/uIhm+
         9A0Q==
X-Gm-Message-State: ANhLgQ3FSAVP2WPEwZvCOzG5wZgP8jPU3L0S598TGuHIryua8WI3mpYF
        56Yx7Qs7ESZJce+Wju8+EVCZt+L4GGo=
X-Google-Smtp-Source: ADFU+vuEyfhjEy7EjNUkM+2DVLZP5jb2x1g14gmXMgX91p385Ie1+maOCeiCGIqbi6GxWQjzF+MLCg==
X-Received: by 2002:a17:902:561:: with SMTP id 88mr6022309plf.78.1585437021956;
        Sat, 28 Mar 2020 16:10:21 -0700 (PDT)
Received: from mappy.nv.charter.com ([2600:6c4e:200:e053:3081:8132:c81a:db99])
        by smtp.gmail.com with ESMTPSA id w74sm3978602pfd.112.2020.03.28.16.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2020 16:10:21 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH v2 08/10] media: imx: utils: Rename format lookup and enumeration functions
Date:   Sat, 28 Mar 2020 16:10:00 -0700
Message-Id: <20200328231002.649-9-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200328231002.649-1-slongerbeam@gmail.com>
References: <20200328231002.649-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Rename the format lookup and enumeration functions according to their
usage:

- Rename imx_media_(find|enum)_format() to *_pixel_format() to
  explicitly state on what formats the functions operate. This aligns
  the naming scheme with the media bus and IPU format functions that
  already end with *_mbus_format() and *_ipu_formats().

- Rename all enumeration functions to pluralize 'formats' at the end, as
  they enumerate multiple formats.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx-ic-prp.c        |  8 ++---
 drivers/staging/media/imx/imx-ic-prpencvf.c   |  8 ++---
 drivers/staging/media/imx/imx-media-capture.c | 16 +++++-----
 .../staging/media/imx/imx-media-csc-scaler.c  |  3 +-
 drivers/staging/media/imx/imx-media-csi.c     | 15 +++++----
 drivers/staging/media/imx/imx-media-utils.c   | 31 ++++++++++---------
 drivers/staging/media/imx/imx-media-vdic.c    |  6 ++--
 drivers/staging/media/imx/imx-media.h         | 11 ++++---
 drivers/staging/media/imx/imx7-media-csi.c    |  6 ++--
 9 files changed, 54 insertions(+), 50 deletions(-)

diff --git a/drivers/staging/media/imx/imx-ic-prp.c b/drivers/staging/media/imx/imx-ic-prp.c
index 9c1f723972e4..50471541f4bc 100644
--- a/drivers/staging/media/imx/imx-ic-prp.c
+++ b/drivers/staging/media/imx/imx-ic-prp.c
@@ -106,8 +106,8 @@ static int prp_enum_mbus_code(struct v4l2_subdev *sd,
 
 	switch (code->pad) {
 	case PRP_SINK_PAD:
-		ret = imx_media_enum_ipu_format(&code->code, code->index,
-						CS_SEL_YUV_RGB);
+		ret = imx_media_enum_ipu_formats(&code->code, code->index,
+						 CS_SEL_YUV_RGB);
 		break;
 	case PRP_SRC_PAD_PRPENC:
 	case PRP_SRC_PAD_PRPVF:
@@ -182,7 +182,7 @@ static int prp_set_fmt(struct v4l2_subdev *sd,
 		cc = imx_media_find_ipu_format(sdformat->format.code,
 					       CS_SEL_YUV_RGB);
 		if (!cc) {
-			imx_media_enum_ipu_format(&code, 0, CS_SEL_YUV);
+			imx_media_enum_ipu_formats(&code, 0, CS_SEL_YUV);
 			cc = imx_media_find_ipu_format(code, CS_SEL_YUV);
 			sdformat->format.code = cc->codes[0];
 		}
@@ -438,7 +438,7 @@ static int prp_registered(struct v4l2_subdev *sd)
 	priv->frame_interval.denominator = 30;
 
 	/* set a default mbus format  */
-	imx_media_enum_ipu_format(&code, 0, CS_SEL_YUV);
+	imx_media_enum_ipu_formats(&code, 0, CS_SEL_YUV);
 	return imx_media_init_mbus_fmt(&priv->format_mbus, 640, 480, code,
 				       V4L2_FIELD_NONE, NULL);
 }
diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/staging/media/imx/imx-ic-prpencvf.c
index 5a22cdc7378a..003ace29ccaf 100644
--- a/drivers/staging/media/imx/imx-ic-prpencvf.c
+++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
@@ -850,8 +850,8 @@ static int prp_enum_mbus_code(struct v4l2_subdev *sd,
 	if (code->pad >= PRPENCVF_NUM_PADS)
 		return -EINVAL;
 
-	return imx_media_enum_ipu_format(&code->code, code->index,
-					 CS_SEL_YUV_RGB);
+	return imx_media_enum_ipu_formats(&code->code, code->index,
+					  CS_SEL_YUV_RGB);
 }
 
 static int prp_get_fmt(struct v4l2_subdev *sd,
@@ -890,7 +890,7 @@ static void prp_try_fmt(struct prp_priv *priv,
 	if (!*cc) {
 		u32 code;
 
-		imx_media_enum_ipu_format(&code, 0, CS_SEL_YUV);
+		imx_media_enum_ipu_formats(&code, 0, CS_SEL_YUV);
 		*cc = imx_media_find_ipu_format(code, CS_SEL_YUV);
 		sdformat->format.code = (*cc)->codes[0];
 	}
@@ -1249,7 +1249,7 @@ static int prp_registered(struct v4l2_subdev *sd)
 	u32 code;
 
 	/* set a default mbus format  */
-	imx_media_enum_ipu_format(&code, 0, CS_SEL_YUV);
+	imx_media_enum_ipu_formats(&code, 0, CS_SEL_YUV);
 	for (i = 0; i < PRPENCVF_NUM_PADS; i++) {
 		ret = imx_media_init_mbus_fmt(&priv->format_mbus[i],
 					      640, 480, code, V4L2_FIELD_NONE,
diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index d60b49ec4fa4..1ff992eb4d96 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -91,7 +91,7 @@ static int capture_enum_framesizes(struct file *file, void *fh,
 	};
 	int ret;
 
-	cc = imx_media_find_format(fsize->pixel_format, CS_SEL_ANY);
+	cc = imx_media_find_pixel_format(fsize->pixel_format, CS_SEL_ANY);
 	if (!cc)
 		return -EINVAL;
 
@@ -133,7 +133,7 @@ static int capture_enum_frameintervals(struct file *file, void *fh,
 	};
 	int ret;
 
-	cc = imx_media_find_format(fival->pixel_format, CS_SEL_ANY);
+	cc = imx_media_find_pixel_format(fival->pixel_format, CS_SEL_ANY);
 	if (!cc)
 		return -EINVAL;
 
@@ -172,7 +172,7 @@ static int capture_enum_fmt_vid_cap(struct file *file, void *fh,
 		u32 cs_sel = (cc_src->cs == IPUV3_COLORSPACE_YUV) ?
 			CS_SEL_YUV : CS_SEL_RGB;
 
-		ret = imx_media_enum_format(&fourcc, f->index, cs_sel);
+		ret = imx_media_enum_pixel_formats(&fourcc, f->index, cs_sel);
 		if (ret)
 			return ret;
 	} else {
@@ -217,10 +217,10 @@ static int __capture_try_fmt_vid_cap(struct capture_priv *priv,
 			CS_SEL_YUV : CS_SEL_RGB;
 		fourcc = f->fmt.pix.pixelformat;
 
-		cc = imx_media_find_format(fourcc, cs_sel);
+		cc = imx_media_find_pixel_format(fourcc, cs_sel);
 		if (!cc) {
-			imx_media_enum_format(&fourcc, 0, cs_sel);
-			cc = imx_media_find_format(fourcc, cs_sel);
+			imx_media_enum_pixel_formats(&fourcc, 0, cs_sel);
+			cc = imx_media_find_pixel_format(fourcc, cs_sel);
 		}
 	} else {
 		cc_src = imx_media_find_mbus_format(fmt_src->format.code,
@@ -789,8 +789,8 @@ int imx_media_capture_device_register(struct imx_media_video_dev *vdev)
 				      &fmt_src.format, NULL);
 	vdev->compose.width = fmt_src.format.width;
 	vdev->compose.height = fmt_src.format.height;
-	vdev->cc = imx_media_find_format(vdev->fmt.fmt.pix.pixelformat,
-					 CS_SEL_ANY);
+	vdev->cc = imx_media_find_pixel_format(vdev->fmt.fmt.pix.pixelformat,
+					       CS_SEL_ANY);
 
 	v4l2_info(sd, "Registered %s as /dev/%s\n", vfd->name,
 		  video_device_node_name(vfd));
diff --git a/drivers/staging/media/imx/imx-media-csc-scaler.c b/drivers/staging/media/imx/imx-media-csc-scaler.c
index 3e1c88938e7d..0aa2493cfc47 100644
--- a/drivers/staging/media/imx/imx-media-csc-scaler.c
+++ b/drivers/staging/media/imx/imx-media-csc-scaler.c
@@ -164,7 +164,8 @@ static int ipu_csc_scaler_enum_fmt(struct file *file, void *fh,
 	u32 fourcc;
 	int ret;
 
-	ret = imx_media_enum_format(&fourcc, f->index, CS_SEL_YUV_RGB);
+	ret = imx_media_enum_pixel_formats(&fourcc, f->index,
+					   CS_SEL_YUV_RGB);
 	if (ret)
 		return ret;
 
diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index 298294b95293..caab4d0cd5ce 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -1238,8 +1238,8 @@ static int csi_enum_mbus_code(struct v4l2_subdev *sd,
 
 	switch (code->pad) {
 	case CSI_SINK_PAD:
-		ret = imx_media_enum_mbus_format(&code->code, code->index,
-						 CS_SEL_ANY);
+		ret = imx_media_enum_mbus_formats(&code->code, code->index,
+						  CS_SEL_ANY);
 		break;
 	case CSI_SRC_PAD_DIRECT:
 	case CSI_SRC_PAD_IDMAC:
@@ -1258,9 +1258,8 @@ static int csi_enum_mbus_code(struct v4l2_subdev *sd,
 		} else {
 			u32 cs_sel = (incc->cs == IPUV3_COLORSPACE_YUV) ?
 				CS_SEL_YUV : CS_SEL_RGB;
-			ret = imx_media_enum_ipu_format(&code->code,
-							code->index,
-							cs_sel);
+			ret = imx_media_enum_ipu_formats(&code->code,
+							 code->index, cs_sel);
 		}
 		break;
 	default:
@@ -1448,7 +1447,7 @@ static void csi_try_fmt(struct csi_priv *priv,
 			*cc = imx_media_find_ipu_format(sdformat->format.code,
 							cs_sel);
 			if (!*cc) {
-				imx_media_enum_ipu_format(&code, 0, cs_sel);
+				imx_media_enum_ipu_formats(&code, 0, cs_sel);
 				*cc = imx_media_find_ipu_format(code, cs_sel);
 				sdformat->format.code = (*cc)->codes[0];
 			}
@@ -1471,7 +1470,7 @@ static void csi_try_fmt(struct csi_priv *priv,
 		*cc = imx_media_find_mbus_format(sdformat->format.code,
 						 CS_SEL_ANY);
 		if (!*cc) {
-			imx_media_enum_mbus_format(&code, 0, CS_SEL_ANY);
+			imx_media_enum_mbus_formats(&code, 0, CS_SEL_ANY);
 			*cc = imx_media_find_mbus_format(code, CS_SEL_ANY);
 			sdformat->format.code = (*cc)->codes[0];
 		}
@@ -1758,7 +1757,7 @@ static int csi_registered(struct v4l2_subdev *sd)
 	for (i = 0; i < CSI_NUM_PADS; i++) {
 		code = 0;
 		if (i != CSI_SINK_PAD)
-			imx_media_enum_ipu_format(&code, 0, CS_SEL_YUV);
+			imx_media_enum_ipu_formats(&code, 0, CS_SEL_YUV);
 
 		/* set a default mbus format  */
 		ret = imx_media_init_mbus_fmt(&priv->format_mbus[i],
diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index 33c874668ad4..5198af5d17d6 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -225,8 +225,8 @@ static const struct imx_media_pixfmt *find_format(u32 fourcc,
 	return NULL;
 }
 
-static int enum_format(u32 *fourcc, u32 *code, u32 index,
-		       enum codespace_sel cs_sel)
+static int enum_formats(u32 *fourcc, u32 *code, u32 index,
+			enum codespace_sel cs_sel)
 {
 	unsigned int i;
 
@@ -266,17 +266,18 @@ static int enum_format(u32 *fourcc, u32 *code, u32 index,
 }
 
 const struct imx_media_pixfmt *
-imx_media_find_format(u32 fourcc, enum codespace_sel cs_sel)
+imx_media_find_pixel_format(u32 fourcc, enum codespace_sel cs_sel)
 {
 	return find_format(fourcc, 0, cs_sel);
 }
-EXPORT_SYMBOL_GPL(imx_media_find_format);
+EXPORT_SYMBOL_GPL(imx_media_find_pixel_format);
 
-int imx_media_enum_format(u32 *fourcc, u32 index, enum codespace_sel cs_sel)
+int imx_media_enum_pixel_formats(u32 *fourcc, u32 index,
+				 enum codespace_sel cs_sel)
 {
-	return enum_format(fourcc, NULL, index, cs_sel);
+	return enum_formats(fourcc, NULL, index, cs_sel);
 }
-EXPORT_SYMBOL_GPL(imx_media_enum_format);
+EXPORT_SYMBOL_GPL(imx_media_enum_pixel_formats);
 
 const struct imx_media_pixfmt *
 imx_media_find_mbus_format(u32 code, enum codespace_sel cs_sel)
@@ -285,11 +286,11 @@ imx_media_find_mbus_format(u32 code, enum codespace_sel cs_sel)
 }
 EXPORT_SYMBOL_GPL(imx_media_find_mbus_format);
 
-int imx_media_enum_mbus_format(u32 *code, u32 index, enum codespace_sel cs_sel)
+int imx_media_enum_mbus_formats(u32 *code, u32 index, enum codespace_sel cs_sel)
 {
-	return enum_format(NULL, code, index, cs_sel);
+	return enum_formats(NULL, code, index, cs_sel);
 }
-EXPORT_SYMBOL_GPL(imx_media_enum_mbus_format);
+EXPORT_SYMBOL_GPL(imx_media_enum_mbus_formats);
 
 /* -----------------------------------------------------------------------------
  * IPU Formats Lookup and Enumeration
@@ -342,7 +343,7 @@ imx_media_find_ipu_format(u32 code, enum codespace_sel cs_sel)
 }
 EXPORT_SYMBOL_GPL(imx_media_find_ipu_format);
 
-int imx_media_enum_ipu_format(u32 *code, u32 index, enum codespace_sel cs_sel)
+int imx_media_enum_ipu_formats(u32 *code, u32 index, enum codespace_sel cs_sel)
 {
 	bool accept_yuv = cs_sel & CS_SEL_YUV;
 	bool accept_rgb = cs_sel & CS_SEL_RGB;
@@ -371,7 +372,7 @@ int imx_media_enum_ipu_format(u32 *code, u32 index, enum codespace_sel cs_sel)
 
 	return -EINVAL;
 }
-EXPORT_SYMBOL_GPL(imx_media_enum_ipu_format);
+EXPORT_SYMBOL_GPL(imx_media_enum_ipu_formats);
 
 int imx_media_init_mbus_fmt(struct v4l2_mbus_framefmt *mbus,
 			    u32 width, u32 height, u32 code, u32 field,
@@ -383,7 +384,7 @@ int imx_media_init_mbus_fmt(struct v4l2_mbus_framefmt *mbus,
 	mbus->height = height;
 	mbus->field = field;
 	if (code == 0)
-		imx_media_enum_mbus_format(&code, 0, CS_SEL_YUV);
+		imx_media_enum_mbus_formats(&code, 0, CS_SEL_YUV);
 	lcc = imx_media_find_mbus_format(code, CS_SEL_ANY);
 	if (!lcc) {
 		lcc = imx_media_find_ipu_format(code, CS_SEL_ANY);
@@ -522,7 +523,7 @@ int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
 	if (cc->ipufmt && cc->cs == IPUV3_COLORSPACE_YUV) {
 		u32 code;
 
-		imx_media_enum_mbus_format(&code, 0, CS_SEL_YUV);
+		imx_media_enum_mbus_formats(&code, 0, CS_SEL_YUV);
 		cc = imx_media_find_mbus_format(code, CS_SEL_YUV);
 	}
 
@@ -574,7 +575,7 @@ int imx_media_ipu_image_to_mbus_fmt(struct v4l2_mbus_framefmt *mbus,
 {
 	const struct imx_media_pixfmt *fmt;
 
-	fmt = imx_media_find_format(image->pix.pixelformat, CS_SEL_ANY);
+	fmt = imx_media_find_pixel_format(image->pix.pixelformat, CS_SEL_ANY);
 	if (!fmt)
 		return -EINVAL;
 
diff --git a/drivers/staging/media/imx/imx-media-vdic.c b/drivers/staging/media/imx/imx-media-vdic.c
index 0d83c2c41606..9dbf63796806 100644
--- a/drivers/staging/media/imx/imx-media-vdic.c
+++ b/drivers/staging/media/imx/imx-media-vdic.c
@@ -548,7 +548,7 @@ static int vdic_enum_mbus_code(struct v4l2_subdev *sd,
 	if (code->pad >= VDIC_NUM_PADS)
 		return -EINVAL;
 
-	return imx_media_enum_ipu_format(&code->code, code->index, CS_SEL_YUV);
+	return imx_media_enum_ipu_formats(&code->code, code->index, CS_SEL_YUV);
 }
 
 static int vdic_get_fmt(struct v4l2_subdev *sd,
@@ -587,7 +587,7 @@ static void vdic_try_fmt(struct vdic_priv *priv,
 	if (!*cc) {
 		u32 code;
 
-		imx_media_enum_ipu_format(&code, 0, CS_SEL_YUV);
+		imx_media_enum_ipu_formats(&code, 0, CS_SEL_YUV);
 		*cc = imx_media_find_ipu_format(code, CS_SEL_YUV);
 		sdformat->format.code = (*cc)->codes[0];
 	}
@@ -850,7 +850,7 @@ static int vdic_registered(struct v4l2_subdev *sd)
 	for (i = 0; i < VDIC_NUM_PADS; i++) {
 		code = 0;
 		if (i != VDIC_SINK_PAD_IDMAC)
-			imx_media_enum_ipu_format(&code, 0, CS_SEL_YUV);
+			imx_media_enum_ipu_formats(&code, 0, CS_SEL_YUV);
 
 		/* set a default mbus format  */
 		ret = imx_media_init_mbus_fmt(&priv->format_mbus[i],
diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
index 917b4db02985..67983a26e5ff 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -159,14 +159,17 @@ enum codespace_sel {
 
 /* imx-media-utils.c */
 const struct imx_media_pixfmt *
-imx_media_find_format(u32 fourcc, enum codespace_sel cs_sel);
-int imx_media_enum_format(u32 *fourcc, u32 index, enum codespace_sel cs_sel);
+imx_media_find_pixel_format(u32 fourcc, enum codespace_sel cs_sel);
+int imx_media_enum_pixel_formats(u32 *fourcc, u32 index,
+				 enum codespace_sel cs_sel);
 const struct imx_media_pixfmt *
 imx_media_find_mbus_format(u32 code, enum codespace_sel cs_sel);
-int imx_media_enum_mbus_format(u32 *code, u32 index, enum codespace_sel cs_sel);
+int imx_media_enum_mbus_formats(u32 *code, u32 index,
+				enum codespace_sel cs_sel);
 const struct imx_media_pixfmt *
 imx_media_find_ipu_format(u32 code, enum codespace_sel cs_sel);
-int imx_media_enum_ipu_format(u32 *code, u32 index, enum codespace_sel cs_sel);
+int imx_media_enum_ipu_formats(u32 *code, u32 index, enum codespace_sel cs_sel);
+
 int imx_media_init_mbus_fmt(struct v4l2_mbus_framefmt *mbus,
 			    u32 width, u32 height, u32 code, u32 field,
 			    const struct imx_media_pixfmt **cc);
diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index a469dc76a787..df4dd41b23de 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -958,8 +958,8 @@ static int imx7_csi_enum_mbus_code(struct v4l2_subdev *sd,
 
 	switch (code->pad) {
 	case IMX7_CSI_PAD_SINK:
-		ret = imx_media_enum_mbus_format(&code->code, code->index,
-						 CS_SEL_ANY);
+		ret = imx_media_enum_mbus_formats(&code->code, code->index,
+						  CS_SEL_ANY);
 		break;
 	case IMX7_CSI_PAD_SRC:
 		if (code->index != 0) {
@@ -1036,7 +1036,7 @@ static int imx7_csi_try_fmt(struct imx7_csi *csi,
 		*cc = imx_media_find_mbus_format(sdformat->format.code,
 						 CS_SEL_ANY);
 		if (!*cc) {
-			imx_media_enum_mbus_format(&code, 0, CS_SEL_ANY);
+			imx_media_enum_mbus_formats(&code, 0, CS_SEL_ANY);
 			*cc = imx_media_find_mbus_format(code, CS_SEL_ANY);
 			sdformat->format.code = (*cc)->codes[0];
 		}
-- 
2.17.1

