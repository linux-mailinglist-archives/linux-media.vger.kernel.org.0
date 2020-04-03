Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FDD619DFF7
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2020 22:59:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728532AbgDCU7A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Apr 2020 16:59:00 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:45414 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727907AbgDCU67 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Apr 2020 16:58:59 -0400
Received: by mail-pf1-f196.google.com with SMTP id r14so4140781pfl.12
        for <linux-media@vger.kernel.org>; Fri, 03 Apr 2020 13:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=KWLjZLkdn9uShtuCD76k/Y8x7rqQlaZ1EXmeUaNzKX0=;
        b=oNloUESrDMJr+bJy62Qj+UnIkZ3/cupxpta1ZyHpAW8zrJrvIQY65EZMKq+kT2QNuA
         YmJprTQ89GQ9MlejTpTbLnQDb/P+mzk3OqG0Z5TX11jLCEX2hAkJjdFYB9OjXYws4J0b
         BxvK9/dY9ZlGfLmTg5bT7xHoOHPAwzyY0X90M5CgzluZuTxtQXMhOLQWmIMl60B9/UU+
         VSsGjvflFVm46HDvPpiyeYSkM4hpRcUQFfJvceOaeKISwG7EDh+9sIUax+2KSdqpe3lF
         wnSxB/SuEo2LvCNyyDf+s/LZaVOw9XoCC3EHmMwxy0rRFeUXEg3IqE4yJqHjYE9mT3DB
         cnHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=KWLjZLkdn9uShtuCD76k/Y8x7rqQlaZ1EXmeUaNzKX0=;
        b=bx+3wOZ3ZGg1KFdQpnlrakEAuiWhTAOOnC5h2G04ufZO7EhRoxqe/2wGgocTEPunKK
         Ao1SXCE2YhLefMuR5ND0DsqzT/MHD5vgz+gdh775w+8LNN36ODCaLiqQ6Fcpm1lI26TW
         qyzARgyCSetPN0yslKuFSmcDckui/6wipETGqYX2V+U3QYLIrGO88Zi9zxZjad3DbW8k
         WUVVe/t3Ss074J6N+iPdIdhXdaQc3tFetHDxym3GfRY2X19UTIdh7zbV17awABOEAbG8
         ZnnsdCTOFT6uqUZiUuam3F42UCTAAg2hq6YoB162HKHVCutPyQoEnRJCZnUFfTWxH8Hb
         bqSg==
X-Gm-Message-State: AGi0PuacRi0PzdK9XhWoz5KhVwjAIMZ501Dddvt2GrsVZhyKbvcCkeBg
        PZDTPDam1GgiXhlUj6wWI8yAKwGh4uM=
X-Google-Smtp-Source: APiQypI6U9bchBMwyuuBIrvw834qXwn9/A+eFEUeNtA8tk+BklNZotLIku5txvwOJUeAnZkCiy00fw==
X-Received: by 2002:a63:e942:: with SMTP id q2mr9893296pgj.34.1585947537864;
        Fri, 03 Apr 2020 13:58:57 -0700 (PDT)
Received: from mappy.world.mentorg.com (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id s39sm6521266pjb.10.2020.04.03.13.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2020 13:58:57 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v5 09/12] media: imx: utils: Rename format lookup and enumeration functions
Date:   Fri,  3 Apr 2020 13:58:36 -0700
Message-Id: <20200403205839.4531-10-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200403205839.4531-1-slongerbeam@gmail.com>
References: <20200403205839.4531-1-slongerbeam@gmail.com>
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
 drivers/staging/media/imx/imx-ic-prp.c        |  9 +++--
 drivers/staging/media/imx/imx-ic-prpencvf.c   |  9 +++--
 drivers/staging/media/imx/imx-media-capture.c | 16 ++++----
 .../staging/media/imx/imx-media-csc-scaler.c  |  3 +-
 drivers/staging/media/imx/imx-media-csi.c     | 16 ++++----
 drivers/staging/media/imx/imx-media-utils.c   | 40 ++++++++++---------
 drivers/staging/media/imx/imx-media-vdic.c    |  8 ++--
 drivers/staging/media/imx/imx-media.h         | 11 +++--
 drivers/staging/media/imx/imx7-media-csi.c    |  6 +--
 9 files changed, 64 insertions(+), 54 deletions(-)

diff --git a/drivers/staging/media/imx/imx-ic-prp.c b/drivers/staging/media/imx/imx-ic-prp.c
index 5b0571285939..f7c9e00897be 100644
--- a/drivers/staging/media/imx/imx-ic-prp.c
+++ b/drivers/staging/media/imx/imx-ic-prp.c
@@ -106,8 +106,8 @@ static int prp_enum_mbus_code(struct v4l2_subdev *sd,
 
 	switch (code->pad) {
 	case PRP_SINK_PAD:
-		ret = imx_media_enum_ipu_format(&code->code, code->index,
-						PIXFMT_SEL_YUV_RGB);
+		ret = imx_media_enum_ipu_formats(&code->code, code->index,
+						 PIXFMT_SEL_YUV_RGB);
 		break;
 	case PRP_SRC_PAD_PRPENC:
 	case PRP_SRC_PAD_PRPVF:
@@ -182,7 +182,7 @@ static int prp_set_fmt(struct v4l2_subdev *sd,
 		cc = imx_media_find_ipu_format(sdformat->format.code,
 					       PIXFMT_SEL_YUV_RGB);
 		if (!cc) {
-			imx_media_enum_ipu_format(&code, 0, PIXFMT_SEL_YUV);
+			imx_media_enum_ipu_formats(&code, 0, PIXFMT_SEL_YUV);
 			cc = imx_media_find_ipu_format(code, PIXFMT_SEL_YUV);
 			sdformat->format.code = cc->codes[0];
 		}
@@ -438,7 +438,8 @@ static int prp_registered(struct v4l2_subdev *sd)
 	priv->frame_interval.denominator = 30;
 
 	/* set a default mbus format  */
-	imx_media_enum_ipu_format(&code, 0, PIXFMT_SEL_YUV);
+	imx_media_enum_ipu_formats(&code, 0, PIXFMT_SEL_YUV);
+
 	return imx_media_init_mbus_fmt(&priv->format_mbus, 640, 480, code,
 				       V4L2_FIELD_NONE, NULL);
 }
diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/staging/media/imx/imx-ic-prpencvf.c
index adf8f9c9130c..9a09cec67829 100644
--- a/drivers/staging/media/imx/imx-ic-prpencvf.c
+++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
@@ -850,8 +850,8 @@ static int prp_enum_mbus_code(struct v4l2_subdev *sd,
 	if (code->pad >= PRPENCVF_NUM_PADS)
 		return -EINVAL;
 
-	return imx_media_enum_ipu_format(&code->code, code->index,
-					 PIXFMT_SEL_YUV_RGB);
+	return imx_media_enum_ipu_formats(&code->code, code->index,
+					  PIXFMT_SEL_YUV_RGB);
 }
 
 static int prp_get_fmt(struct v4l2_subdev *sd,
@@ -891,7 +891,7 @@ static void prp_try_fmt(struct prp_priv *priv,
 	if (!*cc) {
 		u32 code;
 
-		imx_media_enum_ipu_format(&code, 0, PIXFMT_SEL_YUV);
+		imx_media_enum_ipu_formats(&code, 0, PIXFMT_SEL_YUV);
 		*cc = imx_media_find_ipu_format(code, PIXFMT_SEL_YUV);
 		sdformat->format.code = (*cc)->codes[0];
 	}
@@ -1250,7 +1250,8 @@ static int prp_registered(struct v4l2_subdev *sd)
 	u32 code;
 
 	/* set a default mbus format  */
-	imx_media_enum_ipu_format(&code, 0, PIXFMT_SEL_YUV);
+	imx_media_enum_ipu_formats(&code, 0, PIXFMT_SEL_YUV);
+
 	for (i = 0; i < PRPENCVF_NUM_PADS; i++) {
 		ret = imx_media_init_mbus_fmt(&priv->format_mbus[i],
 					      640, 480, code, V4L2_FIELD_NONE,
diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index 32d5b05097a9..6ac9e37a7249 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -91,7 +91,7 @@ static int capture_enum_framesizes(struct file *file, void *fh,
 	};
 	int ret;
 
-	cc = imx_media_find_format(fsize->pixel_format, PIXFMT_SEL_ANY);
+	cc = imx_media_find_pixel_format(fsize->pixel_format, PIXFMT_SEL_ANY);
 	if (!cc)
 		return -EINVAL;
 
@@ -133,7 +133,7 @@ static int capture_enum_frameintervals(struct file *file, void *fh,
 	};
 	int ret;
 
-	cc = imx_media_find_format(fival->pixel_format, PIXFMT_SEL_ANY);
+	cc = imx_media_find_pixel_format(fival->pixel_format, PIXFMT_SEL_ANY);
 	if (!cc)
 		return -EINVAL;
 
@@ -174,7 +174,7 @@ static int capture_enum_fmt_vid_cap(struct file *file, void *fh,
 			(cc_src->cs == IPUV3_COLORSPACE_YUV) ?
 			PIXFMT_SEL_YUV : PIXFMT_SEL_RGB;
 
-		ret = imx_media_enum_format(&fourcc, f->index, fmt_sel);
+		ret = imx_media_enum_pixel_formats(&fourcc, f->index, fmt_sel);
 		if (ret)
 			return ret;
 	} else {
@@ -221,10 +221,10 @@ static int __capture_try_fmt_vid_cap(struct capture_priv *priv,
 			PIXFMT_SEL_YUV : PIXFMT_SEL_RGB;
 		fourcc = f->fmt.pix.pixelformat;
 
-		cc = imx_media_find_format(fourcc, fmt_sel);
+		cc = imx_media_find_pixel_format(fourcc, fmt_sel);
 		if (!cc) {
-			imx_media_enum_format(&fourcc, 0, fmt_sel);
-			cc = imx_media_find_format(fourcc, fmt_sel);
+			imx_media_enum_pixel_formats(&fourcc, 0, fmt_sel);
+			cc = imx_media_find_pixel_format(fourcc, fmt_sel);
 		}
 	} else {
 		cc_src = imx_media_find_mbus_format(fmt_src->format.code,
@@ -793,8 +793,8 @@ int imx_media_capture_device_register(struct imx_media_video_dev *vdev)
 				      &fmt_src.format, NULL);
 	vdev->compose.width = fmt_src.format.width;
 	vdev->compose.height = fmt_src.format.height;
-	vdev->cc = imx_media_find_format(vdev->fmt.fmt.pix.pixelformat,
-					 PIXFMT_SEL_ANY);
+	vdev->cc = imx_media_find_pixel_format(vdev->fmt.fmt.pix.pixelformat,
+					       PIXFMT_SEL_ANY);
 
 	v4l2_info(sd, "Registered %s as /dev/%s\n", vfd->name,
 		  video_device_node_name(vfd));
diff --git a/drivers/staging/media/imx/imx-media-csc-scaler.c b/drivers/staging/media/imx/imx-media-csc-scaler.c
index ddb70da56853..489b6c1529f3 100644
--- a/drivers/staging/media/imx/imx-media-csc-scaler.c
+++ b/drivers/staging/media/imx/imx-media-csc-scaler.c
@@ -164,7 +164,8 @@ static int ipu_csc_scaler_enum_fmt(struct file *file, void *fh,
 	u32 fourcc;
 	int ret;
 
-	ret = imx_media_enum_format(&fourcc, f->index, PIXFMT_SEL_YUV_RGB);
+	ret = imx_media_enum_pixel_formats(&fourcc, f->index,
+					   PIXFMT_SEL_YUV_RGB);
 	if (ret)
 		return ret;
 
diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index 7a8bb28d7eab..75a7daf309bd 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -1238,8 +1238,8 @@ static int csi_enum_mbus_code(struct v4l2_subdev *sd,
 
 	switch (code->pad) {
 	case CSI_SINK_PAD:
-		ret = imx_media_enum_mbus_format(&code->code, code->index,
-						 PIXFMT_SEL_ANY);
+		ret = imx_media_enum_mbus_formats(&code->code, code->index,
+						  PIXFMT_SEL_ANY);
 		break;
 	case CSI_SRC_PAD_DIRECT:
 	case CSI_SRC_PAD_IDMAC:
@@ -1260,9 +1260,9 @@ static int csi_enum_mbus_code(struct v4l2_subdev *sd,
 				(incc->cs == IPUV3_COLORSPACE_YUV) ?
 				PIXFMT_SEL_YUV : PIXFMT_SEL_RGB;
 
-			ret = imx_media_enum_ipu_format(&code->code,
-							code->index,
-							fmt_sel);
+			ret = imx_media_enum_ipu_formats(&code->code,
+							 code->index,
+							 fmt_sel);
 		}
 		break;
 	default:
@@ -1451,7 +1451,7 @@ static void csi_try_fmt(struct csi_priv *priv,
 			*cc = imx_media_find_ipu_format(sdformat->format.code,
 							fmt_sel);
 			if (!*cc) {
-				imx_media_enum_ipu_format(&code, 0, fmt_sel);
+				imx_media_enum_ipu_formats(&code, 0, fmt_sel);
 				*cc = imx_media_find_ipu_format(code, fmt_sel);
 				sdformat->format.code = (*cc)->codes[0];
 			}
@@ -1474,7 +1474,7 @@ static void csi_try_fmt(struct csi_priv *priv,
 		*cc = imx_media_find_mbus_format(sdformat->format.code,
 						 PIXFMT_SEL_ANY);
 		if (!*cc) {
-			imx_media_enum_mbus_format(&code, 0, PIXFMT_SEL_ANY);
+			imx_media_enum_mbus_formats(&code, 0, PIXFMT_SEL_ANY);
 			*cc = imx_media_find_mbus_format(code, PIXFMT_SEL_ANY);
 			sdformat->format.code = (*cc)->codes[0];
 		}
@@ -1761,7 +1761,7 @@ static int csi_registered(struct v4l2_subdev *sd)
 	for (i = 0; i < CSI_NUM_PADS; i++) {
 		code = 0;
 		if (i != CSI_SINK_PAD)
-			imx_media_enum_ipu_format(&code, 0, PIXFMT_SEL_YUV);
+			imx_media_enum_ipu_formats(&code, 0, PIXFMT_SEL_YUV);
 
 		/* set a default mbus format  */
 		ret = imx_media_init_mbus_fmt(&priv->format_mbus[i],
diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index d9be04c68cc4..b8481b286ebb 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -238,8 +238,8 @@ static const struct imx_media_pixfmt *find_format(u32 fourcc,
 	return NULL;
 }
 
-static int enum_format(u32 *fourcc, u32 *code, u32 index,
-		       enum imx_pixfmt_sel fmt_sel)
+static int enum_formats(u32 *fourcc, u32 *code, u32 index,
+			enum imx_pixfmt_sel fmt_sel)
 {
 	bool sel_ipu = fmt_sel & PIXFMT_SEL_IPU;
 	unsigned int i;
@@ -285,17 +285,18 @@ static int enum_format(u32 *fourcc, u32 *code, u32 index,
 }
 
 const struct imx_media_pixfmt *
-imx_media_find_format(u32 fourcc, enum imx_pixfmt_sel fmt_sel)
+imx_media_find_pixel_format(u32 fourcc, enum imx_pixfmt_sel fmt_sel)
 {
 	return find_format(fourcc, 0, fmt_sel);
 }
-EXPORT_SYMBOL_GPL(imx_media_find_format);
+EXPORT_SYMBOL_GPL(imx_media_find_pixel_format);
 
-int imx_media_enum_format(u32 *fourcc, u32 index, enum imx_pixfmt_sel fmt_sel)
+int imx_media_enum_pixel_formats(u32 *fourcc, u32 index,
+				 enum imx_pixfmt_sel fmt_sel)
 {
-	return enum_format(fourcc, NULL, index, fmt_sel);
+	return enum_formats(fourcc, NULL, index, fmt_sel);
 }
-EXPORT_SYMBOL_GPL(imx_media_enum_format);
+EXPORT_SYMBOL_GPL(imx_media_enum_pixel_formats);
 
 const struct imx_media_pixfmt *
 imx_media_find_mbus_format(u32 code, enum imx_pixfmt_sel fmt_sel)
@@ -304,12 +305,12 @@ imx_media_find_mbus_format(u32 code, enum imx_pixfmt_sel fmt_sel)
 }
 EXPORT_SYMBOL_GPL(imx_media_find_mbus_format);
 
-int imx_media_enum_mbus_format(u32 *code, u32 index,
-			       enum imx_pixfmt_sel fmt_sel)
+int imx_media_enum_mbus_formats(u32 *code, u32 index,
+				enum imx_pixfmt_sel fmt_sel)
 {
-	return enum_format(NULL, code, index, fmt_sel);
+	return enum_formats(NULL, code, index, fmt_sel);
 }
-EXPORT_SYMBOL_GPL(imx_media_enum_mbus_format);
+EXPORT_SYMBOL_GPL(imx_media_enum_mbus_formats);
 
 const struct imx_media_pixfmt *
 imx_media_find_ipu_format(u32 code, enum imx_pixfmt_sel fmt_sel)
@@ -318,12 +319,12 @@ imx_media_find_ipu_format(u32 code, enum imx_pixfmt_sel fmt_sel)
 }
 EXPORT_SYMBOL_GPL(imx_media_find_ipu_format);
 
-int imx_media_enum_ipu_format(u32 *code, u32 index,
-			      enum imx_pixfmt_sel fmt_sel)
+int imx_media_enum_ipu_formats(u32 *code, u32 index,
+			       enum imx_pixfmt_sel fmt_sel)
 {
-	return enum_format(NULL, code, index, fmt_sel | PIXFMT_SEL_IPU);
+	return enum_formats(NULL, code, index, fmt_sel | PIXFMT_SEL_IPU);
 }
-EXPORT_SYMBOL_GPL(imx_media_enum_ipu_format);
+EXPORT_SYMBOL_GPL(imx_media_enum_ipu_formats);
 
 int imx_media_init_mbus_fmt(struct v4l2_mbus_framefmt *mbus,
 			    u32 width, u32 height, u32 code, u32 field,
@@ -334,8 +335,10 @@ int imx_media_init_mbus_fmt(struct v4l2_mbus_framefmt *mbus,
 	mbus->width = width;
 	mbus->height = height;
 	mbus->field = field;
+
 	if (code == 0)
-		imx_media_enum_mbus_format(&code, 0, PIXFMT_SEL_YUV);
+		imx_media_enum_mbus_formats(&code, 0, PIXFMT_SEL_YUV);
+
 	lcc = imx_media_find_mbus_format(code, PIXFMT_SEL_ANY);
 	if (!lcc) {
 		lcc = imx_media_find_ipu_format(code, PIXFMT_SEL_ANY);
@@ -474,7 +477,7 @@ int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
 	if (cc->ipufmt && cc->cs == IPUV3_COLORSPACE_YUV) {
 		u32 code;
 
-		imx_media_enum_mbus_format(&code, 0, PIXFMT_SEL_YUV);
+		imx_media_enum_mbus_formats(&code, 0, PIXFMT_SEL_YUV);
 		cc = imx_media_find_mbus_format(code, PIXFMT_SEL_YUV);
 	}
 
@@ -526,7 +529,8 @@ int imx_media_ipu_image_to_mbus_fmt(struct v4l2_mbus_framefmt *mbus,
 {
 	const struct imx_media_pixfmt *fmt;
 
-	fmt = imx_media_find_format(image->pix.pixelformat, PIXFMT_SEL_ANY);
+	fmt = imx_media_find_pixel_format(image->pix.pixelformat,
+					  PIXFMT_SEL_ANY);
 	if (!fmt || !fmt->codes || !fmt->codes[0])
 		return -EINVAL;
 
diff --git a/drivers/staging/media/imx/imx-media-vdic.c b/drivers/staging/media/imx/imx-media-vdic.c
index 9807d578ce89..303b5407fb64 100644
--- a/drivers/staging/media/imx/imx-media-vdic.c
+++ b/drivers/staging/media/imx/imx-media-vdic.c
@@ -548,8 +548,8 @@ static int vdic_enum_mbus_code(struct v4l2_subdev *sd,
 	if (code->pad >= VDIC_NUM_PADS)
 		return -EINVAL;
 
-	return imx_media_enum_ipu_format(&code->code, code->index,
-					 PIXFMT_SEL_YUV);
+	return imx_media_enum_ipu_formats(&code->code, code->index,
+					  PIXFMT_SEL_YUV);
 }
 
 static int vdic_get_fmt(struct v4l2_subdev *sd,
@@ -589,7 +589,7 @@ static void vdic_try_fmt(struct vdic_priv *priv,
 	if (!*cc) {
 		u32 code;
 
-		imx_media_enum_ipu_format(&code, 0, PIXFMT_SEL_YUV);
+		imx_media_enum_ipu_formats(&code, 0, PIXFMT_SEL_YUV);
 		*cc = imx_media_find_ipu_format(code, PIXFMT_SEL_YUV);
 		sdformat->format.code = (*cc)->codes[0];
 	}
@@ -852,7 +852,7 @@ static int vdic_registered(struct v4l2_subdev *sd)
 	for (i = 0; i < VDIC_NUM_PADS; i++) {
 		code = 0;
 		if (i != VDIC_SINK_PAD_IDMAC)
-			imx_media_enum_ipu_format(&code, 0, PIXFMT_SEL_YUV);
+			imx_media_enum_ipu_formats(&code, 0, PIXFMT_SEL_YUV);
 
 		/* set a default mbus format  */
 		ret = imx_media_init_mbus_fmt(&priv->format_mbus[i],
diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
index 459ec15bcdaf..24a993b3216b 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -165,14 +165,17 @@ struct imx_media_dev {
 
 /* imx-media-utils.c */
 const struct imx_media_pixfmt *
-imx_media_find_format(u32 fourcc, enum imx_pixfmt_sel sel);
-int imx_media_enum_format(u32 *fourcc, u32 index, enum imx_pixfmt_sel sel);
+imx_media_find_pixel_format(u32 fourcc, enum imx_pixfmt_sel sel);
+int imx_media_enum_pixel_formats(u32 *fourcc, u32 index,
+				 enum imx_pixfmt_sel sel);
 const struct imx_media_pixfmt *
 imx_media_find_mbus_format(u32 code, enum imx_pixfmt_sel sel);
-int imx_media_enum_mbus_format(u32 *code, u32 index, enum imx_pixfmt_sel sel);
+int imx_media_enum_mbus_formats(u32 *code, u32 index,
+				enum imx_pixfmt_sel sel);
 const struct imx_media_pixfmt *
 imx_media_find_ipu_format(u32 code, enum imx_pixfmt_sel sel);
-int imx_media_enum_ipu_format(u32 *code, u32 index, enum imx_pixfmt_sel sel);
+int imx_media_enum_ipu_formats(u32 *code, u32 index,
+			       enum imx_pixfmt_sel sel);
 int imx_media_init_mbus_fmt(struct v4l2_mbus_framefmt *mbus,
 			    u32 width, u32 height, u32 code, u32 field,
 			    const struct imx_media_pixfmt **cc);
diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index bffc0d7588b1..d87e6612ae48 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -958,8 +958,8 @@ static int imx7_csi_enum_mbus_code(struct v4l2_subdev *sd,
 
 	switch (code->pad) {
 	case IMX7_CSI_PAD_SINK:
-		ret = imx_media_enum_mbus_format(&code->code, code->index,
-						 PIXFMT_SEL_ANY);
+		ret = imx_media_enum_mbus_formats(&code->code, code->index,
+						  PIXFMT_SEL_ANY);
 		break;
 	case IMX7_CSI_PAD_SRC:
 		if (code->index != 0) {
@@ -1037,7 +1037,7 @@ static int imx7_csi_try_fmt(struct imx7_csi *csi,
 		*cc = imx_media_find_mbus_format(sdformat->format.code,
 						 PIXFMT_SEL_ANY);
 		if (!*cc) {
-			imx_media_enum_mbus_format(&code, 0, PIXFMT_SEL_ANY);
+			imx_media_enum_mbus_formats(&code, 0, PIXFMT_SEL_ANY);
 			*cc = imx_media_find_mbus_format(code, PIXFMT_SEL_ANY);
 			sdformat->format.code = (*cc)->codes[0];
 		}
-- 
2.17.1

