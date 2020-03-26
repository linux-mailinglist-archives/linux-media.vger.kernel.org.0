Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3BD5194B41
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2020 23:08:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727446AbgCZWI6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Mar 2020 18:08:58 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:42046 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726260AbgCZWI5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Mar 2020 18:08:57 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5E6CA2DC;
        Thu, 26 Mar 2020 23:08:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1585260533;
        bh=xwGDcCyyz6kXd8ywtKpy7gFmIfqnDQdjKdT889MvJz4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=u1eRwjjGfgMOqdXRtpVlGXTvegC5emRLn9ztk73MLgYcUru/ZiLfx0QnKw+SAwLAM
         XCT+uyfQ2uOrmL11qvwW0WhQjHpsTroZEAFMdcOgOKUqlCnXzbF3xYkCJjfIsUAvWA
         rmExPF511F7/towOiUL2TRxboOwdP/DDFVJ76sLs=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH v2 04/11] media: imx: utils: Handle Bayer format lookup through a selection flag
Date:   Fri, 27 Mar 2020 00:08:33 +0200
Message-Id: <20200326220840.18540-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200326220840.18540-1-laurent.pinchart@ideasonboard.com>
References: <20200326220840.18540-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The format lookup (and enumeration) functions take a boolean flag to
tell if Bayer formats should be considered. This leads to hard to read
lines such as

	return enum_format(fourcc, NULL, index, cs_sel, true, false);

where the boolean parameters can easily be mixed. To make the code
clearer, add a CS_SEL_BAYER flag that can be passed through the
codespace_sel parameter of the lookup functions to replace the bool
parameter.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx-media-capture.c | 16 ++++---
 drivers/staging/media/imx/imx-media-csi.c     | 15 +++---
 drivers/staging/media/imx/imx-media-utils.c   | 47 ++++++++++---------
 drivers/staging/media/imx/imx-media.h         | 15 +++---
 drivers/staging/media/imx/imx7-media-csi.c    | 13 +++--
 5 files changed, 55 insertions(+), 51 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index d37b776ff86d..93a9ecdf0789 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -91,7 +91,8 @@ static int capture_enum_framesizes(struct file *file, void *fh,
 	};
 	int ret;
 
-	cc = imx_media_find_format(fsize->pixel_format, CS_SEL_ANY, true);
+	cc = imx_media_find_format(fsize->pixel_format,
+				   CS_SEL_ANY | CS_SEL_BAYER);
 	if (!cc)
 		return -EINVAL;
 
@@ -133,7 +134,8 @@ static int capture_enum_frameintervals(struct file *file, void *fh,
 	};
 	int ret;
 
-	cc = imx_media_find_format(fival->pixel_format, CS_SEL_ANY, true);
+	cc = imx_media_find_format(fival->pixel_format,
+				   CS_SEL_ANY | CS_SEL_BAYER);
 	if (!cc)
 		return -EINVAL;
 
@@ -177,7 +179,7 @@ static int capture_enum_fmt_vid_cap(struct file *file, void *fh,
 			return ret;
 	} else {
 		cc_src = imx_media_find_mbus_format(fmt_src.format.code,
-						    CS_SEL_ANY, true);
+						    CS_SEL_ANY | CS_SEL_BAYER);
 		if (WARN_ON(!cc_src))
 			return -EINVAL;
 
@@ -217,14 +219,14 @@ static int __capture_try_fmt_vid_cap(struct capture_priv *priv,
 			CS_SEL_YUV : CS_SEL_RGB;
 		fourcc = f->fmt.pix.pixelformat;
 
-		cc = imx_media_find_format(fourcc, cs_sel, false);
+		cc = imx_media_find_format(fourcc, cs_sel);
 		if (!cc) {
 			imx_media_enum_format(&fourcc, 0, cs_sel);
-			cc = imx_media_find_format(fourcc, cs_sel, false);
+			cc = imx_media_find_format(fourcc, cs_sel);
 		}
 	} else {
 		cc_src = imx_media_find_mbus_format(fmt_src->format.code,
-						    CS_SEL_ANY, true);
+						    CS_SEL_ANY | CS_SEL_BAYER);
 		if (WARN_ON(!cc_src))
 			return -EINVAL;
 
@@ -790,7 +792,7 @@ int imx_media_capture_device_register(struct imx_media_video_dev *vdev)
 	vdev->compose.width = fmt_src.format.width;
 	vdev->compose.height = fmt_src.format.height;
 	vdev->cc = imx_media_find_format(vdev->fmt.fmt.pix.pixelformat,
-					 CS_SEL_ANY, false);
+					 CS_SEL_ANY);
 
 	v4l2_info(sd, "Registered %s as /dev/%s\n", vfd->name,
 		  video_device_node_name(vfd));
diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index e76a6a85baa3..fecbb39c5a85 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -1234,12 +1234,13 @@ static int csi_enum_mbus_code(struct v4l2_subdev *sd,
 	mutex_lock(&priv->lock);
 
 	infmt = __csi_get_fmt(priv, cfg, CSI_SINK_PAD, code->which);
-	incc = imx_media_find_mbus_format(infmt->code, CS_SEL_ANY, true);
+	incc = imx_media_find_mbus_format(infmt->code,
+					  CS_SEL_ANY | CS_SEL_BAYER);
 
 	switch (code->pad) {
 	case CSI_SINK_PAD:
 		ret = imx_media_enum_mbus_format(&code->code, code->index,
-						 CS_SEL_ANY, true);
+						 CS_SEL_ANY | CS_SEL_BAYER);
 		break;
 	case CSI_SRC_PAD_DIRECT:
 	case CSI_SRC_PAD_IDMAC:
@@ -1434,7 +1435,7 @@ static void csi_try_fmt(struct csi_priv *priv,
 	case CSI_SRC_PAD_DIRECT:
 	case CSI_SRC_PAD_IDMAC:
 		incc = imx_media_find_mbus_format(infmt->code,
-						  CS_SEL_ANY, true);
+						  CS_SEL_ANY | CS_SEL_BAYER);
 
 		sdformat->format.width = compose->width;
 		sdformat->format.height = compose->height;
@@ -1470,12 +1471,10 @@ static void csi_try_fmt(struct csi_priv *priv,
 				      MIN_H, MAX_H, H_ALIGN, S_ALIGN);
 
 		*cc = imx_media_find_mbus_format(sdformat->format.code,
-						 CS_SEL_ANY, true);
+						 CS_SEL_ANY | CS_SEL_BAYER);
 		if (!*cc) {
-			imx_media_enum_mbus_format(&code, 0,
-						   CS_SEL_ANY, false);
-			*cc = imx_media_find_mbus_format(code,
-							 CS_SEL_ANY, false);
+			imx_media_enum_mbus_format(&code, 0, CS_SEL_ANY);
+			*cc = imx_media_find_mbus_format(code, CS_SEL_ANY);
 			sdformat->format.code = (*cc)->codes[0];
 		}
 
diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index d0ad42b478a9..ff1dd4f0a8c6 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -214,11 +214,13 @@ static const
 struct imx_media_pixfmt *find_format(u32 fourcc,
 				     u32 code,
 				     enum codespace_sel cs_sel,
-				     bool allow_non_mbus,
-				     bool allow_bayer)
+				     bool allow_non_mbus)
 {
+	bool allow_bayer = cs_sel & CS_SEL_BAYER;
 	unsigned int i;
 
+	cs_sel &= CS_SEL_YUV | CS_SEL_RGB;
+
 	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
 		const struct imx_media_pixfmt *fmt = &pixel_formats[i];
 		enum codespace_sel fmt_cs_sel;
@@ -249,11 +251,13 @@ struct imx_media_pixfmt *find_format(u32 fourcc,
 
 static int enum_format(u32 *fourcc, u32 *code, u32 index,
 		       enum codespace_sel cs_sel,
-		       bool allow_non_mbus,
-		       bool allow_bayer)
+		       bool allow_non_mbus)
 {
+	bool allow_bayer = cs_sel & CS_SEL_BAYER;
 	unsigned int i;
 
+	cs_sel &= CS_SEL_YUV | CS_SEL_RGB;
+
 	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
 		const struct imx_media_pixfmt *fmt = &pixel_formats[i];
 		enum codespace_sel fmt_cs_sel;
@@ -291,30 +295,28 @@ static int enum_format(u32 *fourcc, u32 *code, u32 index,
 }
 
 const struct imx_media_pixfmt *
-imx_media_find_format(u32 fourcc, enum codespace_sel cs_sel, bool allow_bayer)
+imx_media_find_format(u32 fourcc, enum codespace_sel cs_sel)
 {
-	return find_format(fourcc, 0, cs_sel, true, allow_bayer);
+	return find_format(fourcc, 0, cs_sel, true);
 }
 EXPORT_SYMBOL_GPL(imx_media_find_format);
 
 int imx_media_enum_format(u32 *fourcc, u32 index, enum codespace_sel cs_sel)
 {
-	return enum_format(fourcc, NULL, index, cs_sel, true, false);
+	return enum_format(fourcc, NULL, index, cs_sel, true);
 }
 EXPORT_SYMBOL_GPL(imx_media_enum_format);
 
 const struct imx_media_pixfmt *
-imx_media_find_mbus_format(u32 code, enum codespace_sel cs_sel,
-			   bool allow_bayer)
+imx_media_find_mbus_format(u32 code, enum codespace_sel cs_sel)
 {
-	return find_format(0, code, cs_sel, false, allow_bayer);
+	return find_format(0, code, cs_sel, false);
 }
 EXPORT_SYMBOL_GPL(imx_media_find_mbus_format);
 
-int imx_media_enum_mbus_format(u32 *code, u32 index, enum codespace_sel cs_sel,
-			       bool allow_bayer)
+int imx_media_enum_mbus_format(u32 *code, u32 index, enum codespace_sel cs_sel)
 {
-	return enum_format(NULL, code, index, cs_sel, false, allow_bayer);
+	return enum_format(NULL, code, index, cs_sel, false);
 }
 EXPORT_SYMBOL_GPL(imx_media_enum_mbus_format);
 
@@ -402,8 +404,8 @@ int imx_media_init_mbus_fmt(struct v4l2_mbus_framefmt *mbus,
 	mbus->height = height;
 	mbus->field = field;
 	if (code == 0)
-		imx_media_enum_mbus_format(&code, 0, CS_SEL_YUV, false);
-	lcc = imx_media_find_mbus_format(code, CS_SEL_ANY, false);
+		imx_media_enum_mbus_format(&code, 0, CS_SEL_YUV);
+	lcc = imx_media_find_mbus_format(code, CS_SEL_ANY);
 	if (!lcc) {
 		lcc = imx_media_find_ipu_format(code, CS_SEL_ANY);
 		if (!lcc)
@@ -474,7 +476,8 @@ void imx_media_try_colorimetry(struct v4l2_mbus_framefmt *tryfmt,
 	const struct imx_media_pixfmt *cc;
 	bool is_rgb = false;
 
-	cc = imx_media_find_mbus_format(tryfmt->code, CS_SEL_ANY, true);
+	cc = imx_media_find_mbus_format(tryfmt->code,
+					CS_SEL_ANY | CS_SEL_BAYER);
 	if (!cc)
 		cc = imx_media_find_ipu_format(tryfmt->code, CS_SEL_ANY);
 	if (cc && cc->cs == IPUV3_COLORSPACE_RGB)
@@ -528,8 +531,9 @@ int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
 	if (!cc) {
 		cc = imx_media_find_ipu_format(mbus->code, CS_SEL_ANY);
 		if (!cc)
-			cc = imx_media_find_mbus_format(mbus->code, CS_SEL_ANY,
-							true);
+			cc = imx_media_find_mbus_format(mbus->code,
+							CS_SEL_ANY |
+							CS_SEL_BAYER);
 		if (!cc)
 			return -EINVAL;
 	}
@@ -541,8 +545,8 @@ int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
 	if (cc->ipufmt && cc->cs == IPUV3_COLORSPACE_YUV) {
 		u32 code;
 
-		imx_media_enum_mbus_format(&code, 0, CS_SEL_YUV, false);
-		cc = imx_media_find_mbus_format(code, CS_SEL_YUV, false);
+		imx_media_enum_mbus_format(&code, 0, CS_SEL_YUV);
+		cc = imx_media_find_mbus_format(code, CS_SEL_YUV);
 	}
 
 	/* Round up width for minimum burst size */
@@ -593,7 +597,8 @@ int imx_media_ipu_image_to_mbus_fmt(struct v4l2_mbus_framefmt *mbus,
 {
 	const struct imx_media_pixfmt *fmt;
 
-	fmt = imx_media_find_format(image->pix.pixelformat, CS_SEL_ANY, true);
+	fmt = imx_media_find_format(image->pix.pixelformat,
+				    CS_SEL_ANY | CS_SEL_BAYER);
 	if (!fmt)
 		return -EINVAL;
 
diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
index 11861191324a..dc6f8fe7c66c 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -150,20 +150,19 @@ struct imx_media_dev {
 };
 
 enum codespace_sel {
-	CS_SEL_YUV = 0,
-	CS_SEL_RGB,
-	CS_SEL_ANY,
+	CS_SEL_YUV = BIT(0),
+	CS_SEL_RGB = BIT(1),
+	CS_SEL_ANY = CS_SEL_YUV | CS_SEL_RGB,
+	CS_SEL_BAYER = BIT(2),
 };
 
 /* imx-media-utils.c */
 const struct imx_media_pixfmt *
-imx_media_find_format(u32 fourcc, enum codespace_sel cs_sel, bool allow_bayer);
+imx_media_find_format(u32 fourcc, enum codespace_sel cs_sel);
 int imx_media_enum_format(u32 *fourcc, u32 index, enum codespace_sel cs_sel);
 const struct imx_media_pixfmt *
-imx_media_find_mbus_format(u32 code, enum codespace_sel cs_sel,
-			   bool allow_bayer);
-int imx_media_enum_mbus_format(u32 *code, u32 index, enum codespace_sel cs_sel,
-			       bool allow_bayer);
+imx_media_find_mbus_format(u32 code, enum codespace_sel cs_sel);
+int imx_media_enum_mbus_format(u32 *code, u32 index, enum codespace_sel cs_sel);
 const struct imx_media_pixfmt *
 imx_media_find_ipu_format(u32 code, enum codespace_sel cs_sel);
 int imx_media_enum_ipu_format(u32 *code, u32 index, enum codespace_sel cs_sel);
diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index acbdffb77668..0e0f087f40c2 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -959,7 +959,7 @@ static int imx7_csi_enum_mbus_code(struct v4l2_subdev *sd,
 	switch (code->pad) {
 	case IMX7_CSI_PAD_SINK:
 		ret = imx_media_enum_mbus_format(&code->code, code->index,
-						 CS_SEL_ANY, true);
+						 CS_SEL_ANY | CS_SEL_BAYER);
 		break;
 	case IMX7_CSI_PAD_SRC:
 		if (code->index != 0) {
@@ -1019,8 +1019,8 @@ static int imx7_csi_try_fmt(struct imx7_csi *csi,
 
 	switch (sdformat->pad) {
 	case IMX7_CSI_PAD_SRC:
-		in_cc = imx_media_find_mbus_format(in_fmt->code, CS_SEL_ANY,
-						   true);
+		in_cc = imx_media_find_mbus_format(in_fmt->code,
+						   CS_SEL_ANY | CS_SEL_BAYER);
 
 		sdformat->format.width = in_fmt->width;
 		sdformat->format.height = in_fmt->height;
@@ -1035,11 +1035,10 @@ static int imx7_csi_try_fmt(struct imx7_csi *csi,
 		break;
 	case IMX7_CSI_PAD_SINK:
 		*cc = imx_media_find_mbus_format(sdformat->format.code,
-						 CS_SEL_ANY, true);
+						 CS_SEL_ANY | CS_SEL_BAYER);
 		if (!*cc) {
-			imx_media_enum_mbus_format(&code, 0, CS_SEL_ANY, false);
-			*cc = imx_media_find_mbus_format(code, CS_SEL_ANY,
-							 false);
+			imx_media_enum_mbus_format(&code, 0, CS_SEL_ANY);
+			*cc = imx_media_find_mbus_format(code, CS_SEL_ANY);
 			sdformat->format.code = (*cc)->codes[0];
 		}
 
-- 
Regards,

Laurent Pinchart

