Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37717194706
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2020 20:06:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728563AbgCZTGB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Mar 2020 15:06:01 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:42453 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728472AbgCZTGA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Mar 2020 15:06:00 -0400
Received: by mail-pl1-f195.google.com with SMTP id e1so2512172plt.9
        for <linux-media@vger.kernel.org>; Thu, 26 Mar 2020 12:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=7mPzpSP6SbB55rI9D/O3yY6A2fh9pgcbD0ddJLfDlX0=;
        b=j1C0hG33QvPMYZjvIjNeykTm1Z1L4prrsGgh3tZxt3kOFS++TXxKUq1rBRbSJtumKd
         xKmO6nfH8fdswDhhE+gBK0F+WrJYAvduVmrhpsPaclqnrHU/lOr+DllWvtAVM+fco46x
         ZI1iZ0cjJT/fCSJG1uzivIKsF7AtfTmfaIkEIc8SUv8PHJR8oLOFyE3cBDQAIWvo2KOh
         ky0ac+WAZ4L/kUT/yirz9sGdEwx/6cheOY+wSBMI4yeyAl4xwgC2NT2yMV2cgA04srWZ
         T2wasTnXFKRQMhfGIdADMueaHzdbIhocAo/buFVDd4vJOqvRN6IDOmea3Yb87Av2/4IC
         Bo7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=7mPzpSP6SbB55rI9D/O3yY6A2fh9pgcbD0ddJLfDlX0=;
        b=XVWaZUSpfHgL6GS3ywKVfMXWk8D8py+b1B5wFnlDadtg+968/GuaVSt0LWn2Bu3/CA
         7R9+hT6Bwo7zz3Z9AmFTLqL8/Z1DvtcbaYezTWYEm956x0CmKv6T2amIwuV6rLZvcuOp
         N8q2fjF/gcQpI897WTogMrHDoUUygDL34Lzcepf7uNVW9KXhQPi0uPMnSjpuFNIvvi/W
         2QxcGs/x/eQ5EdcWcirCFuUDgsWt3Dj3+7ezU9VFM/LhUKf4WA0FSH6yGbvJMvZxMH3k
         9mYUkdJQF4H3yQXzvHJ920E6c4nRNe+G1p6LA3VgwZZigkJaUnWL2iPIUHFeaNXDKyX0
         T/GA==
X-Gm-Message-State: ANhLgQ21JU+1DnpbXiHwqnzEipSYw4xXGXDWapA02NTwf1TYuRp0Q2jO
        hzPPji83msiwJSUHuLHuNHZ9AyBNgeA=
X-Google-Smtp-Source: ADFU+vu9yynu51wr72T3/PS+8YSKramtrp+WC03+vMaJyFcdrkRNNlU6h9KVPABFaNjz0tVXKotBAQ==
X-Received: by 2002:a17:902:b207:: with SMTP id t7mr9769033plr.47.1585249557795;
        Thu, 26 Mar 2020 12:05:57 -0700 (PDT)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id q103sm7414623pjc.1.2020.03.26.12.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 12:05:57 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH 08/10] media: imx: utils: Rename format lookup and enumeration functions
Date:   Thu, 26 Mar 2020 12:05:42 -0700
Message-Id: <20200326190544.16349-9-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200326190544.16349-1-slongerbeam@gmail.com>
References: <20200326190544.16349-1-slongerbeam@gmail.com>
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
index e5e9f750f685..ae7396c0b687 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -224,8 +224,8 @@ static const struct imx_media_pixfmt *find_format(u32 fourcc,
 	return NULL;
 }
 
-static int enum_format(u32 *fourcc, u32 *code, u32 index,
-		       enum codespace_sel cs_sel)
+static int enum_formats(u32 *fourcc, u32 *code, u32 index,
+			enum codespace_sel cs_sel)
 {
 	const struct imx_media_pixfmt *fmt;
 	unsigned int i, j = 0, match_index = 0;
@@ -269,17 +269,18 @@ static int enum_format(u32 *fourcc, u32 *code, u32 index,
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
@@ -288,11 +289,11 @@ imx_media_find_mbus_format(u32 code, enum codespace_sel cs_sel)
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
@@ -344,7 +345,7 @@ imx_media_find_ipu_format(u32 code, enum codespace_sel cs_sel)
 }
 EXPORT_SYMBOL_GPL(imx_media_find_ipu_format);
 
-int imx_media_enum_ipu_format(u32 *code, u32 index, enum codespace_sel cs_sel)
+int imx_media_enum_ipu_formats(u32 *code, u32 index, enum codespace_sel cs_sel)
 {
 	bool accept_yuv = cs_sel & CS_SEL_YUV;
 	bool accept_rgb = cs_sel & CS_SEL_RGB;
@@ -372,7 +373,7 @@ int imx_media_enum_ipu_format(u32 *code, u32 index, enum codespace_sel cs_sel)
 
 	return -EINVAL;
 }
-EXPORT_SYMBOL_GPL(imx_media_enum_ipu_format);
+EXPORT_SYMBOL_GPL(imx_media_enum_ipu_formats);
 
 int imx_media_init_mbus_fmt(struct v4l2_mbus_framefmt *mbus,
 			    u32 width, u32 height, u32 code, u32 field,
@@ -384,7 +385,7 @@ int imx_media_init_mbus_fmt(struct v4l2_mbus_framefmt *mbus,
 	mbus->height = height;
 	mbus->field = field;
 	if (code == 0)
-		imx_media_enum_mbus_format(&code, 0, CS_SEL_YUV);
+		imx_media_enum_mbus_formats(&code, 0, CS_SEL_YUV);
 	lcc = imx_media_find_mbus_format(code, CS_SEL_ANY);
 	if (!lcc) {
 		lcc = imx_media_find_ipu_format(code, CS_SEL_ANY);
@@ -523,7 +524,7 @@ int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
 	if (cc->ipufmt && cc->cs == IPUV3_COLORSPACE_YUV) {
 		u32 code;
 
-		imx_media_enum_mbus_format(&code, 0, CS_SEL_YUV);
+		imx_media_enum_mbus_formats(&code, 0, CS_SEL_YUV);
 		cc = imx_media_find_mbus_format(code, CS_SEL_YUV);
 	}
 
@@ -575,7 +576,7 @@ int imx_media_ipu_image_to_mbus_fmt(struct v4l2_mbus_framefmt *mbus,
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

