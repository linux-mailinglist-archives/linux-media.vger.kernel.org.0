Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 580EB194B46
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2020 23:09:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727505AbgCZWJC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Mar 2020 18:09:02 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:42046 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727547AbgCZWJC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Mar 2020 18:09:02 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7D52218B1;
        Thu, 26 Mar 2020 23:08:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1585260535;
        bh=+IzZa7KCXfrh0piaRdwdLhE95lIUxxsyMg5y5Oe6c3w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oBbj8iX7jP0HV0O9dDzk7d/bZq/rRbeHt+8LgYdBOcL+X3iE1Xi+a6yB3bS3o2te0
         Y4/ZDn1DnBoXZ7B1BX8GZ7YKqpRo23RMfUeWw2cffKsMZVBguUSFmnN2Dswg7PguAB
         K8PMWPmBPmy9HuDpCI4rhQNfFzbqKPJVPo68XET0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH v2 08/11] media: imx: utils: Rename format lookup and enumeration functions
Date:   Fri, 27 Mar 2020 00:08:37 +0200
Message-Id: <20200326220840.18540-9-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200326220840.18540-1-laurent.pinchart@ideasonboard.com>
References: <20200326220840.18540-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

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
 drivers/staging/media/imx/imx-ic-prpencvf.c   |  6 ++--
 drivers/staging/media/imx/imx-media-capture.c | 20 +++++------
 .../staging/media/imx/imx-media-csc-scaler.c  |  2 +-
 drivers/staging/media/imx/imx-media-csi.c     | 15 ++++-----
 drivers/staging/media/imx/imx-media-utils.c   | 33 ++++++++++---------
 drivers/staging/media/imx/imx-media-vdic.c    |  6 ++--
 drivers/staging/media/imx/imx-media.h         | 11 ++++---
 drivers/staging/media/imx/imx7-media-csi.c    |  6 ++--
 9 files changed, 55 insertions(+), 52 deletions(-)

diff --git a/drivers/staging/media/imx/imx-ic-prp.c b/drivers/staging/media/imx/imx-ic-prp.c
index 2a4f77e83ed3..ce10004ca01b 100644
--- a/drivers/staging/media/imx/imx-ic-prp.c
+++ b/drivers/staging/media/imx/imx-ic-prp.c
@@ -106,8 +106,8 @@ static int prp_enum_mbus_code(struct v4l2_subdev *sd,
 
 	switch (code->pad) {
 	case PRP_SINK_PAD:
-		ret = imx_media_enum_ipu_format(&code->code, code->index,
-						CS_SEL_ANY);
+		ret = imx_media_enum_ipu_formats(&code->code, code->index,
+						 CS_SEL_ANY);
 		break;
 	case PRP_SRC_PAD_PRPENC:
 	case PRP_SRC_PAD_PRPVF:
@@ -182,7 +182,7 @@ static int prp_set_fmt(struct v4l2_subdev *sd,
 		cc = imx_media_find_ipu_format(sdformat->format.code,
 					       CS_SEL_ANY);
 		if (!cc) {
-			imx_media_enum_ipu_format(&code, 0, CS_SEL_ANY);
+			imx_media_enum_ipu_formats(&code, 0, CS_SEL_ANY);
 			cc = imx_media_find_ipu_format(code, CS_SEL_ANY);
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
index 09c4e3f33807..ec814acc3485 100644
--- a/drivers/staging/media/imx/imx-ic-prpencvf.c
+++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
@@ -850,7 +850,7 @@ static int prp_enum_mbus_code(struct v4l2_subdev *sd,
 	if (code->pad >= PRPENCVF_NUM_PADS)
 		return -EINVAL;
 
-	return imx_media_enum_ipu_format(&code->code, code->index, CS_SEL_ANY);
+	return imx_media_enum_ipu_formats(&code->code, code->index, CS_SEL_ANY);
 }
 
 static int prp_get_fmt(struct v4l2_subdev *sd,
@@ -889,7 +889,7 @@ static void prp_try_fmt(struct prp_priv *priv,
 	if (!*cc) {
 		u32 code;
 
-		imx_media_enum_ipu_format(&code, 0, CS_SEL_ANY);
+		imx_media_enum_ipu_formats(&code, 0, CS_SEL_ANY);
 		*cc = imx_media_find_ipu_format(code, CS_SEL_ANY);
 		sdformat->format.code = (*cc)->codes[0];
 	}
@@ -1248,7 +1248,7 @@ static int prp_registered(struct v4l2_subdev *sd)
 	u32 code;
 
 	/* set a default mbus format  */
-	imx_media_enum_ipu_format(&code, 0, CS_SEL_YUV);
+	imx_media_enum_ipu_formats(&code, 0, CS_SEL_YUV);
 	for (i = 0; i < PRPENCVF_NUM_PADS; i++) {
 		ret = imx_media_init_mbus_fmt(&priv->format_mbus[i],
 					      640, 480, code, V4L2_FIELD_NONE,
diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index 93a9ecdf0789..1b3f783f3f72 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -91,8 +91,8 @@ static int capture_enum_framesizes(struct file *file, void *fh,
 	};
 	int ret;
 
-	cc = imx_media_find_format(fsize->pixel_format,
-				   CS_SEL_ANY | CS_SEL_BAYER);
+	cc = imx_media_find_pixel_format(fsize->pixel_format,
+					 CS_SEL_ANY | CS_SEL_BAYER);
 	if (!cc)
 		return -EINVAL;
 
@@ -134,8 +134,8 @@ static int capture_enum_frameintervals(struct file *file, void *fh,
 	};
 	int ret;
 
-	cc = imx_media_find_format(fival->pixel_format,
-				   CS_SEL_ANY | CS_SEL_BAYER);
+	cc = imx_media_find_pixel_format(fival->pixel_format,
+					 CS_SEL_ANY | CS_SEL_BAYER);
 	if (!cc)
 		return -EINVAL;
 
@@ -174,7 +174,7 @@ static int capture_enum_fmt_vid_cap(struct file *file, void *fh,
 		u32 cs_sel = (cc_src->cs == IPUV3_COLORSPACE_YUV) ?
 			CS_SEL_YUV : CS_SEL_RGB;
 
-		ret = imx_media_enum_format(&fourcc, f->index, cs_sel);
+		ret = imx_media_enum_pixel_formats(&fourcc, f->index, cs_sel);
 		if (ret)
 			return ret;
 	} else {
@@ -219,10 +219,10 @@ static int __capture_try_fmt_vid_cap(struct capture_priv *priv,
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
@@ -791,8 +791,8 @@ int imx_media_capture_device_register(struct imx_media_video_dev *vdev)
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
index 2cc77f6e84b6..d8904a78228d 100644
--- a/drivers/staging/media/imx/imx-media-csc-scaler.c
+++ b/drivers/staging/media/imx/imx-media-csc-scaler.c
@@ -164,7 +164,7 @@ static int ipu_csc_scaler_enum_fmt(struct file *file, void *fh,
 	u32 fourcc;
 	int ret;
 
-	ret = imx_media_enum_format(&fourcc, f->index, CS_SEL_ANY);
+	ret = imx_media_enum_pixel_formats(&fourcc, f->index, CS_SEL_ANY);
 	if (ret)
 		return ret;
 
diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index fecbb39c5a85..b90413850474 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -1239,8 +1239,8 @@ static int csi_enum_mbus_code(struct v4l2_subdev *sd,
 
 	switch (code->pad) {
 	case CSI_SINK_PAD:
-		ret = imx_media_enum_mbus_format(&code->code, code->index,
-						 CS_SEL_ANY | CS_SEL_BAYER);
+		ret = imx_media_enum_mbus_formats(&code->code, code->index,
+						  CS_SEL_ANY | CS_SEL_BAYER);
 		break;
 	case CSI_SRC_PAD_DIRECT:
 	case CSI_SRC_PAD_IDMAC:
@@ -1259,9 +1259,8 @@ static int csi_enum_mbus_code(struct v4l2_subdev *sd,
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
@@ -1450,7 +1449,7 @@ static void csi_try_fmt(struct csi_priv *priv,
 			*cc = imx_media_find_ipu_format(sdformat->format.code,
 							cs_sel);
 			if (!*cc) {
-				imx_media_enum_ipu_format(&code, 0, cs_sel);
+				imx_media_enum_ipu_formats(&code, 0, cs_sel);
 				*cc = imx_media_find_ipu_format(code, cs_sel);
 				sdformat->format.code = (*cc)->codes[0];
 			}
@@ -1473,7 +1472,7 @@ static void csi_try_fmt(struct csi_priv *priv,
 		*cc = imx_media_find_mbus_format(sdformat->format.code,
 						 CS_SEL_ANY | CS_SEL_BAYER);
 		if (!*cc) {
-			imx_media_enum_mbus_format(&code, 0, CS_SEL_ANY);
+			imx_media_enum_mbus_formats(&code, 0, CS_SEL_ANY);
 			*cc = imx_media_find_mbus_format(code, CS_SEL_ANY);
 			sdformat->format.code = (*cc)->codes[0];
 		}
@@ -1760,7 +1759,7 @@ static int csi_registered(struct v4l2_subdev *sd)
 	for (i = 0; i < CSI_NUM_PADS; i++) {
 		code = 0;
 		if (i != CSI_SINK_PAD)
-			imx_media_enum_ipu_format(&code, 0, CS_SEL_YUV);
+			imx_media_enum_ipu_formats(&code, 0, CS_SEL_YUV);
 
 		/* set a default mbus format  */
 		ret = imx_media_init_mbus_fmt(&priv->format_mbus[i],
diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index cbf441716cab..5c096f631236 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -231,8 +231,8 @@ struct imx_media_pixfmt *find_format(u32 fourcc,
 	return NULL;
 }
 
-static int enum_format(u32 *fourcc, u32 *code, u32 index,
-		       enum codespace_sel cs_sel)
+static int enum_formats(u32 *fourcc, u32 *code, u32 index,
+			enum codespace_sel cs_sel)
 {
 	bool allow_bayer = cs_sel & CS_SEL_BAYER;
 	unsigned int i;
@@ -276,17 +276,18 @@ static int enum_format(u32 *fourcc, u32 *code, u32 index,
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
@@ -295,11 +296,11 @@ imx_media_find_mbus_format(u32 code, enum codespace_sel cs_sel)
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
@@ -351,7 +352,7 @@ imx_media_find_ipu_format(u32 code, enum codespace_sel cs_sel)
 }
 EXPORT_SYMBOL_GPL(imx_media_find_ipu_format);
 
-int imx_media_enum_ipu_format(u32 *code, u32 index, enum codespace_sel cs_sel)
+int imx_media_enum_ipu_formats(u32 *code, u32 index, enum codespace_sel cs_sel)
 {
 	bool accept_yuv = cs_sel & CS_SEL_YUV;
 	bool accept_rgb = cs_sel & CS_SEL_RGB;
@@ -375,7 +376,7 @@ int imx_media_enum_ipu_format(u32 *code, u32 index, enum codespace_sel cs_sel)
 
 	return -EINVAL;
 }
-EXPORT_SYMBOL_GPL(imx_media_enum_ipu_format);
+EXPORT_SYMBOL_GPL(imx_media_enum_ipu_formats);
 
 int imx_media_init_mbus_fmt(struct v4l2_mbus_framefmt *mbus,
 			    u32 width, u32 height, u32 code, u32 field,
@@ -387,7 +388,7 @@ int imx_media_init_mbus_fmt(struct v4l2_mbus_framefmt *mbus,
 	mbus->height = height;
 	mbus->field = field;
 	if (code == 0)
-		imx_media_enum_mbus_format(&code, 0, CS_SEL_YUV);
+		imx_media_enum_mbus_formats(&code, 0, CS_SEL_YUV);
 	lcc = imx_media_find_mbus_format(code, CS_SEL_ANY);
 	if (!lcc) {
 		lcc = imx_media_find_ipu_format(code, CS_SEL_ANY);
@@ -528,7 +529,7 @@ int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
 	if (cc->ipufmt && cc->cs == IPUV3_COLORSPACE_YUV) {
 		u32 code;
 
-		imx_media_enum_mbus_format(&code, 0, CS_SEL_YUV);
+		imx_media_enum_mbus_formats(&code, 0, CS_SEL_YUV);
 		cc = imx_media_find_mbus_format(code, CS_SEL_YUV);
 	}
 
@@ -580,8 +581,8 @@ int imx_media_ipu_image_to_mbus_fmt(struct v4l2_mbus_framefmt *mbus,
 {
 	const struct imx_media_pixfmt *fmt;
 
-	fmt = imx_media_find_format(image->pix.pixelformat,
-				    CS_SEL_ANY | CS_SEL_BAYER);
+	fmt = imx_media_find_pixel_format(image->pix.pixelformat,
+					  CS_SEL_ANY | CS_SEL_BAYER);
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
index 9cedc27a6b4a..cd80f1c59a5c 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -158,14 +158,17 @@ enum codespace_sel {
 
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
index 0e0f087f40c2..e60a4345b0b6 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -958,8 +958,8 @@ static int imx7_csi_enum_mbus_code(struct v4l2_subdev *sd,
 
 	switch (code->pad) {
 	case IMX7_CSI_PAD_SINK:
-		ret = imx_media_enum_mbus_format(&code->code, code->index,
-						 CS_SEL_ANY | CS_SEL_BAYER);
+		ret = imx_media_enum_mbus_formats(&code->code, code->index,
+						  CS_SEL_ANY | CS_SEL_BAYER);
 		break;
 	case IMX7_CSI_PAD_SRC:
 		if (code->index != 0) {
@@ -1037,7 +1037,7 @@ static int imx7_csi_try_fmt(struct imx7_csi *csi,
 		*cc = imx_media_find_mbus_format(sdformat->format.code,
 						 CS_SEL_ANY | CS_SEL_BAYER);
 		if (!*cc) {
-			imx_media_enum_mbus_format(&code, 0, CS_SEL_ANY);
+			imx_media_enum_mbus_formats(&code, 0, CS_SEL_ANY);
 			*cc = imx_media_find_mbus_format(code, CS_SEL_ANY);
 			sdformat->format.code = (*cc)->codes[0];
 		}
-- 
Regards,

Laurent Pinchart

