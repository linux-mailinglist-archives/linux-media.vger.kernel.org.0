Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B705119FA43
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 18:39:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729505AbgDFQjY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 12:39:24 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:41489 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729490AbgDFQjY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 12:39:24 -0400
Received: by mail-pl1-f193.google.com with SMTP id d24so6138577pll.8
        for <linux-media@vger.kernel.org>; Mon, 06 Apr 2020 09:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=AKrZA2cO7dLcMEKtJ9CUzdT7mCOdHAuzOm7Fc9teqrA=;
        b=ibyukD0FtWfh2aO6DBknOznOBUtMAhSaL19FX64SNdV/vL14DstZAnZDXGEhYNceF+
         5HIcsLCGcfmqaxy5IR322RIbwq22sRhDSGdVwtVhiZ3S1LM7zGsg4WpZHN4zAs+6VnhG
         vtqm66eUKnRsxIH9awCQbaAf/GxsoUlhItWBmMnbsxlNYNkNbeqei/QmQ1kk6FSDD4Xa
         xkEm3tLqaCQVOf03K+xVLpwCVlyfwGZb9i1oWYkNJtkVJF+KkPirQregGXX65GFz7Ejr
         qP/m3Khhhmrc3eDzMmtw7UBwSGrztJCODkQzzyfHKLnHPARCR3lftsg8WpfeDqYlqKZ0
         nw4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=AKrZA2cO7dLcMEKtJ9CUzdT7mCOdHAuzOm7Fc9teqrA=;
        b=lStyOiYeaIBQx4VgnxUSPAq9MmCcGeEclzcBrOGbYGJJvlIx6tC/7hWma41Jhwx0FD
         Gdmxx3+Ll6K+i2YM5HiWpECsvhp8gWVgX/BN2Ge6BjgwblTraQaMzCJcGdRP7LjNnmb0
         2rHF1AzkRiv33ilBsOTpPNuSCgeb8OTElbfghqlbcJ1gfzptzxwoPam3CEQREUIlDjFm
         QZLUzhJ8JImR2lfatFV8Dt4CfgKBHbDkXbG284GIw0yhfNCV9ll1Og1cpOwyzDtJfABN
         U7xEz8KAwqNTwTTSx5WmEq/JakStWWvdRb4fzp2ZHinn5gVW33RTtvXHnTeZuJnm0Sg9
         eVyQ==
X-Gm-Message-State: AGi0PuZzfGXY1ZY7W78oALlIm/6yz/xjST8f8dBcuTJvBL5lvkcQVDFA
        +OwGM2ROAWR3ZfhLvZk0FI5Ie03ia1w=
X-Google-Smtp-Source: APiQypJAmftquOG54VrtmKYTAgN3mj9Vve+4pD+sSfUZwJqPh0UPW0ktT+gt1oIHq/knYRp4gOmEVg==
X-Received: by 2002:a17:902:704a:: with SMTP id h10mr13960628plt.235.1586191160635;
        Mon, 06 Apr 2020 09:39:20 -0700 (PDT)
Received: from mappy.world.mentorg.com (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id w29sm11165131pge.25.2020.04.06.09.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 09:39:19 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v7 06/11] media: imx: utils: Rename pixel format selection enumeration
Date:   Mon,  6 Apr 2020 09:39:00 -0700
Message-Id: <20200406163905.24475-7-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200406163905.24475-1-slongerbeam@gmail.com>
References: <20200406163905.24475-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

After the introduction of the CS_SEL_BAYER flag, the "codespace"
pixel format selection enumeration wording no longer makes sense
(and even before, when selecting between YUV or RGB formats,
"codespace" was a misuse of the term).

Rename

- 'enum codespace_sel' to 'enum imx_pixfmt_sel'
- CS_SEL_* to PIXFMT_SEL_*
- local vars named cs_sel to fmt_sel or just sel

No functional changes.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx-ic-prp.c        | 12 +--
 drivers/staging/media/imx/imx-ic-prpencvf.c   | 12 +--
 drivers/staging/media/imx/imx-media-capture.c | 34 ++++----
 .../staging/media/imx/imx-media-csc-scaler.c  |  2 +-
 drivers/staging/media/imx/imx-media-csi.c     | 35 ++++----
 drivers/staging/media/imx/imx-media-utils.c   | 87 ++++++++++---------
 drivers/staging/media/imx/imx-media-vdic.c    | 12 +--
 drivers/staging/media/imx/imx-media.h         | 28 +++---
 drivers/staging/media/imx/imx7-media-csi.c    | 13 +--
 9 files changed, 128 insertions(+), 107 deletions(-)

diff --git a/drivers/staging/media/imx/imx-ic-prp.c b/drivers/staging/media/imx/imx-ic-prp.c
index 722a6e2c1923..acad59b42423 100644
--- a/drivers/staging/media/imx/imx-ic-prp.c
+++ b/drivers/staging/media/imx/imx-ic-prp.c
@@ -107,7 +107,7 @@ static int prp_enum_mbus_code(struct v4l2_subdev *sd,
 	switch (code->pad) {
 	case PRP_SINK_PAD:
 		ret = imx_media_enum_ipu_format(&code->code, code->index,
-						CS_SEL_YUV_RGB);
+						PIXFMT_SEL_YUV_RGB);
 		break;
 	case PRP_SRC_PAD_PRPENC:
 	case PRP_SRC_PAD_PRPVF:
@@ -180,10 +180,12 @@ static int prp_set_fmt(struct v4l2_subdev *sd,
 				      MIN_H, MAX_H, H_ALIGN, S_ALIGN);
 
 		cc = imx_media_find_ipu_format(sdformat->format.code,
-					       CS_SEL_YUV_RGB);
+					       PIXFMT_SEL_YUV_RGB);
 		if (!cc) {
-			imx_media_enum_ipu_format(&code, 0, CS_SEL_YUV_RGB);
-			cc = imx_media_find_ipu_format(code, CS_SEL_YUV_RGB);
+			imx_media_enum_ipu_format(&code, 0,
+						  PIXFMT_SEL_YUV_RGB);
+			cc = imx_media_find_ipu_format(code,
+						       PIXFMT_SEL_YUV_RGB);
 			sdformat->format.code = cc->codes[0];
 		}
 
@@ -438,7 +440,7 @@ static int prp_registered(struct v4l2_subdev *sd)
 	priv->frame_interval.denominator = 30;
 
 	/* set a default mbus format  */
-	imx_media_enum_ipu_format(&code, 0, CS_SEL_YUV);
+	imx_media_enum_ipu_format(&code, 0, PIXFMT_SEL_YUV);
 	return imx_media_init_mbus_fmt(&priv->format_mbus, 640, 480, code,
 				       V4L2_FIELD_NONE, NULL);
 }
diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/staging/media/imx/imx-ic-prpencvf.c
index 8a91b2167837..7035c15176fd 100644
--- a/drivers/staging/media/imx/imx-ic-prpencvf.c
+++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
@@ -851,7 +851,7 @@ static int prp_enum_mbus_code(struct v4l2_subdev *sd,
 		return -EINVAL;
 
 	return imx_media_enum_ipu_format(&code->code, code->index,
-					 CS_SEL_YUV_RGB);
+					 PIXFMT_SEL_YUV_RGB);
 }
 
 static int prp_get_fmt(struct v4l2_subdev *sd,
@@ -886,12 +886,14 @@ static void prp_try_fmt(struct prp_priv *priv,
 {
 	struct v4l2_mbus_framefmt *infmt;
 
-	*cc = imx_media_find_ipu_format(sdformat->format.code, CS_SEL_YUV_RGB);
+	*cc = imx_media_find_ipu_format(sdformat->format.code,
+					PIXFMT_SEL_YUV_RGB);
 	if (!*cc) {
 		u32 code;
 
-		imx_media_enum_ipu_format(&code, 0, CS_SEL_YUV_RGB);
-		*cc = imx_media_find_ipu_format(code, CS_SEL_YUV_RGB);
+		imx_media_enum_ipu_format(&code, 0, PIXFMT_SEL_YUV_RGB);
+		*cc = imx_media_find_ipu_format(code, PIXFMT_SEL_YUV_RGB);
+
 		sdformat->format.code = (*cc)->codes[0];
 	}
 
@@ -1249,7 +1251,7 @@ static int prp_registered(struct v4l2_subdev *sd)
 	u32 code;
 
 	/* set a default mbus format  */
-	imx_media_enum_ipu_format(&code, 0, CS_SEL_YUV);
+	imx_media_enum_ipu_format(&code, 0, PIXFMT_SEL_YUV);
 	for (i = 0; i < PRPENCVF_NUM_PADS; i++) {
 		ret = imx_media_init_mbus_fmt(&priv->format_mbus[i],
 					      640, 480, code, V4L2_FIELD_NONE,
diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index 970f54960cac..a7211ccc21e1 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -91,7 +91,7 @@ static int capture_enum_framesizes(struct file *file, void *fh,
 	};
 	int ret;
 
-	cc = imx_media_find_format(fsize->pixel_format, CS_SEL_ANY);
+	cc = imx_media_find_format(fsize->pixel_format, PIXFMT_SEL_ANY);
 	if (!cc)
 		return -EINVAL;
 
@@ -133,7 +133,7 @@ static int capture_enum_frameintervals(struct file *file, void *fh,
 	};
 	int ret;
 
-	cc = imx_media_find_format(fival->pixel_format, CS_SEL_ANY);
+	cc = imx_media_find_format(fival->pixel_format, PIXFMT_SEL_ANY);
 	if (!cc)
 		return -EINVAL;
 
@@ -168,17 +168,18 @@ static int capture_enum_fmt_vid_cap(struct file *file, void *fh,
 	}
 
 	cc_src = imx_media_find_ipu_format(fmt_src.format.code,
-					   CS_SEL_YUV_RGB);
+					   PIXFMT_SEL_YUV_RGB);
 	if (cc_src) {
-		u32 cs_sel = (cc_src->cs == IPUV3_COLORSPACE_YUV) ?
-			CS_SEL_YUV : CS_SEL_RGB;
+		enum imx_pixfmt_sel fmt_sel =
+			(cc_src->cs == IPUV3_COLORSPACE_YUV) ?
+			PIXFMT_SEL_YUV : PIXFMT_SEL_RGB;
 
-		ret = imx_media_enum_format(&fourcc, f->index, cs_sel);
+		ret = imx_media_enum_format(&fourcc, f->index, fmt_sel);
 		if (ret)
 			return ret;
 	} else {
 		cc_src = imx_media_find_mbus_format(fmt_src.format.code,
-						    CS_SEL_ANY);
+						    PIXFMT_SEL_ANY);
 		if (WARN_ON(!cc_src))
 			return -EINVAL;
 
@@ -211,22 +212,23 @@ static int __capture_try_fmt_vid_cap(struct capture_priv *priv,
 	const struct imx_media_pixfmt *cc, *cc_src;
 
 	cc_src = imx_media_find_ipu_format(fmt_src->format.code,
-					   CS_SEL_YUV_RGB);
+					   PIXFMT_SEL_YUV_RGB);
 	if (cc_src) {
-		u32 fourcc, cs_sel;
+		enum imx_pixfmt_sel fmt_sel;
+		u32 fourcc;
 
-		cs_sel = (cc_src->cs == IPUV3_COLORSPACE_YUV) ?
-			CS_SEL_YUV : CS_SEL_RGB;
+		fmt_sel = (cc_src->cs == IPUV3_COLORSPACE_YUV) ?
+			PIXFMT_SEL_YUV : PIXFMT_SEL_RGB;
 		fourcc = f->fmt.pix.pixelformat;
 
-		cc = imx_media_find_format(fourcc, cs_sel);
+		cc = imx_media_find_format(fourcc, fmt_sel);
 		if (!cc) {
-			imx_media_enum_format(&fourcc, 0, cs_sel);
-			cc = imx_media_find_format(fourcc, cs_sel);
+			imx_media_enum_format(&fourcc, 0, fmt_sel);
+			cc = imx_media_find_format(fourcc, fmt_sel);
 		}
 	} else {
 		cc_src = imx_media_find_mbus_format(fmt_src->format.code,
-						    CS_SEL_ANY);
+						    PIXFMT_SEL_ANY);
 		if (WARN_ON(!cc_src))
 			return -EINVAL;
 
@@ -792,7 +794,7 @@ int imx_media_capture_device_register(struct imx_media_video_dev *vdev)
 	vdev->compose.width = fmt_src.format.width;
 	vdev->compose.height = fmt_src.format.height;
 	vdev->cc = imx_media_find_format(vdev->fmt.fmt.pix.pixelformat,
-					 CS_SEL_ANY);
+					 PIXFMT_SEL_ANY);
 
 	v4l2_info(sd, "Registered %s as /dev/%s\n", vfd->name,
 		  video_device_node_name(vfd));
diff --git a/drivers/staging/media/imx/imx-media-csc-scaler.c b/drivers/staging/media/imx/imx-media-csc-scaler.c
index 3e1c88938e7d..ddb70da56853 100644
--- a/drivers/staging/media/imx/imx-media-csc-scaler.c
+++ b/drivers/staging/media/imx/imx-media-csc-scaler.c
@@ -164,7 +164,7 @@ static int ipu_csc_scaler_enum_fmt(struct file *file, void *fh,
 	u32 fourcc;
 	int ret;
 
-	ret = imx_media_enum_format(&fourcc, f->index, CS_SEL_YUV_RGB);
+	ret = imx_media_enum_format(&fourcc, f->index, PIXFMT_SEL_YUV_RGB);
 	if (ret)
 		return ret;
 
diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index 0877717db3f4..df427fcfb0ec 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -1234,12 +1234,12 @@ static int csi_enum_mbus_code(struct v4l2_subdev *sd,
 	mutex_lock(&priv->lock);
 
 	infmt = __csi_get_fmt(priv, cfg, CSI_SINK_PAD, code->which);
-	incc = imx_media_find_mbus_format(infmt->code, CS_SEL_ANY);
+	incc = imx_media_find_mbus_format(infmt->code, PIXFMT_SEL_ANY);
 
 	switch (code->pad) {
 	case CSI_SINK_PAD:
 		ret = imx_media_enum_mbus_format(&code->code, code->index,
-						 CS_SEL_ANY);
+						 PIXFMT_SEL_ANY);
 		break;
 	case CSI_SRC_PAD_DIRECT:
 	case CSI_SRC_PAD_IDMAC:
@@ -1256,11 +1256,13 @@ static int csi_enum_mbus_code(struct v4l2_subdev *sd,
 			}
 			code->code = infmt->code;
 		} else {
-			u32 cs_sel = (incc->cs == IPUV3_COLORSPACE_YUV) ?
-				CS_SEL_YUV : CS_SEL_RGB;
+			enum imx_pixfmt_sel fmt_sel =
+				(incc->cs == IPUV3_COLORSPACE_YUV) ?
+				PIXFMT_SEL_YUV : PIXFMT_SEL_RGB;
+
 			ret = imx_media_enum_ipu_format(&code->code,
 							code->index,
-							cs_sel);
+							fmt_sel);
 		}
 		break;
 	default:
@@ -1433,7 +1435,7 @@ static void csi_try_fmt(struct csi_priv *priv,
 	switch (sdformat->pad) {
 	case CSI_SRC_PAD_DIRECT:
 	case CSI_SRC_PAD_IDMAC:
-		incc = imx_media_find_mbus_format(infmt->code, CS_SEL_ANY);
+		incc = imx_media_find_mbus_format(infmt->code, PIXFMT_SEL_ANY);
 
 		sdformat->format.width = compose->width;
 		sdformat->format.height = compose->height;
@@ -1442,14 +1444,15 @@ static void csi_try_fmt(struct csi_priv *priv,
 			sdformat->format.code = infmt->code;
 			*cc = incc;
 		} else {
-			u32 cs_sel = (incc->cs == IPUV3_COLORSPACE_YUV) ?
-				CS_SEL_YUV : CS_SEL_RGB;
+			enum imx_pixfmt_sel fmt_sel =
+				(incc->cs == IPUV3_COLORSPACE_YUV) ?
+				PIXFMT_SEL_YUV : PIXFMT_SEL_RGB;
 
 			*cc = imx_media_find_ipu_format(sdformat->format.code,
-							cs_sel);
+							fmt_sel);
 			if (!*cc) {
-				imx_media_enum_ipu_format(&code, 0, cs_sel);
-				*cc = imx_media_find_ipu_format(code, cs_sel);
+				imx_media_enum_ipu_format(&code, 0, fmt_sel);
+				*cc = imx_media_find_ipu_format(code, fmt_sel);
 				sdformat->format.code = (*cc)->codes[0];
 			}
 		}
@@ -1469,10 +1472,12 @@ static void csi_try_fmt(struct csi_priv *priv,
 				      MIN_H, MAX_H, H_ALIGN, S_ALIGN);
 
 		*cc = imx_media_find_mbus_format(sdformat->format.code,
-						 CS_SEL_ANY);
+						 PIXFMT_SEL_ANY);
 		if (!*cc) {
-			imx_media_enum_mbus_format(&code, 0, CS_SEL_YUV_RGB);
-			*cc = imx_media_find_mbus_format(code, CS_SEL_YUV_RGB);
+			imx_media_enum_mbus_format(&code, 0,
+						   PIXFMT_SEL_YUV_RGB);
+			*cc = imx_media_find_mbus_format(code,
+							 PIXFMT_SEL_YUV_RGB);
 			sdformat->format.code = (*cc)->codes[0];
 		}
 
@@ -1758,7 +1763,7 @@ static int csi_registered(struct v4l2_subdev *sd)
 	for (i = 0; i < CSI_NUM_PADS; i++) {
 		code = 0;
 		if (i != CSI_SINK_PAD)
-			imx_media_enum_ipu_format(&code, 0, CS_SEL_YUV);
+			imx_media_enum_ipu_format(&code, 0, PIXFMT_SEL_YUV);
 
 		/* set a default mbus format  */
 		ret = imx_media_init_mbus_fmt(&priv->format_mbus[i],
diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index 852badd55bd1..32acece14a6f 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -212,21 +212,21 @@ static const struct imx_media_pixfmt ipu_rgb_formats[] = {
 
 static const struct imx_media_pixfmt *find_format(u32 fourcc,
 						  u32 code,
-						  enum codespace_sel cs_sel,
+						  enum imx_pixfmt_sel fmt_sel,
 						  bool allow_non_mbus)
 {
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
 		const struct imx_media_pixfmt *fmt = &pixel_formats[i];
-		enum codespace_sel fmt_cs_sel;
+		enum imx_pixfmt_sel sel;
 		unsigned int j;
 
-		fmt_cs_sel = fmt->bayer ? CS_SEL_BAYER :
+		sel = fmt->bayer ? PIXFMT_SEL_BAYER :
 			((fmt->cs == IPUV3_COLORSPACE_YUV) ?
-			 CS_SEL_YUV : CS_SEL_RGB);
+			 PIXFMT_SEL_YUV : PIXFMT_SEL_RGB);
 
-		if (!(fmt_cs_sel & cs_sel) ||
+		if (!(fmt_sel & sel) ||
 		    (!allow_non_mbus && !fmt->codes[0]))
 			continue;
 
@@ -246,21 +246,21 @@ static const struct imx_media_pixfmt *find_format(u32 fourcc,
 }
 
 static int enum_format(u32 *fourcc, u32 *code, u32 index,
-		       enum codespace_sel cs_sel,
+		       enum imx_pixfmt_sel fmt_sel,
 		       bool allow_non_mbus)
 {
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
 		const struct imx_media_pixfmt *fmt = &pixel_formats[i];
-		enum codespace_sel fmt_cs_sel;
+		enum imx_pixfmt_sel sel;
 		unsigned int j;
 
-		fmt_cs_sel = fmt->bayer ? CS_SEL_BAYER :
+		sel = fmt->bayer ? PIXFMT_SEL_BAYER :
 			((fmt->cs == IPUV3_COLORSPACE_YUV) ?
-			 CS_SEL_YUV : CS_SEL_RGB);
+			 PIXFMT_SEL_YUV : PIXFMT_SEL_RGB);
 
-		if (!(fmt_cs_sel & cs_sel) ||
+		if (!(fmt_sel & sel) ||
 		    (!allow_non_mbus && !fmt->codes[0]))
 			continue;
 
@@ -288,50 +288,51 @@ static int enum_format(u32 *fourcc, u32 *code, u32 index,
 }
 
 const struct imx_media_pixfmt *
-imx_media_find_format(u32 fourcc, enum codespace_sel cs_sel)
+imx_media_find_format(u32 fourcc, enum imx_pixfmt_sel fmt_sel)
 {
-	return find_format(fourcc, 0, cs_sel, true);
+	return find_format(fourcc, 0, fmt_sel, true);
 }
 EXPORT_SYMBOL_GPL(imx_media_find_format);
 
-int imx_media_enum_format(u32 *fourcc, u32 index, enum codespace_sel cs_sel)
+int imx_media_enum_format(u32 *fourcc, u32 index, enum imx_pixfmt_sel fmt_sel)
 {
-	return enum_format(fourcc, NULL, index, cs_sel, true);
+	return enum_format(fourcc, NULL, index, fmt_sel, true);
 }
 EXPORT_SYMBOL_GPL(imx_media_enum_format);
 
 const struct imx_media_pixfmt *
-imx_media_find_mbus_format(u32 code, enum codespace_sel cs_sel)
+imx_media_find_mbus_format(u32 code, enum imx_pixfmt_sel fmt_sel)
 {
-	return find_format(0, code, cs_sel, false);
+	return find_format(0, code, fmt_sel, false);
 }
 EXPORT_SYMBOL_GPL(imx_media_find_mbus_format);
 
-int imx_media_enum_mbus_format(u32 *code, u32 index, enum codespace_sel cs_sel)
+int imx_media_enum_mbus_format(u32 *code, u32 index,
+			       enum imx_pixfmt_sel fmt_sel)
 {
-	return enum_format(NULL, code, index, cs_sel, false);
+	return enum_format(NULL, code, index, fmt_sel, false);
 }
 EXPORT_SYMBOL_GPL(imx_media_enum_mbus_format);
 
 const struct imx_media_pixfmt *
-imx_media_find_ipu_format(u32 code, enum codespace_sel cs_sel)
+imx_media_find_ipu_format(u32 code, enum imx_pixfmt_sel fmt_sel)
 {
 	const struct imx_media_pixfmt *array, *fmt, *ret = NULL;
 	u32 array_size;
 	int i, j;
 
-	cs_sel &= ~CS_SEL_BAYER;
+	fmt_sel &= ~PIXFMT_SEL_BAYER;
 
-	switch (cs_sel) {
-	case CS_SEL_YUV:
+	switch (fmt_sel) {
+	case PIXFMT_SEL_YUV:
 		array_size = NUM_IPU_YUV_FORMATS;
 		array = ipu_yuv_formats;
 		break;
-	case CS_SEL_RGB:
+	case PIXFMT_SEL_RGB:
 		array_size = NUM_IPU_RGB_FORMATS;
 		array = ipu_rgb_formats;
 		break;
-	case CS_SEL_YUV_RGB:
+	case PIXFMT_SEL_YUV_RGB:
 		array_size = NUM_IPU_YUV_FORMATS + NUM_IPU_RGB_FORMATS;
 		array = ipu_yuv_formats;
 		break;
@@ -340,7 +341,7 @@ imx_media_find_ipu_format(u32 code, enum codespace_sel cs_sel)
 	}
 
 	for (i = 0; i < array_size; i++) {
-		if (cs_sel == CS_SEL_YUV_RGB && i >= NUM_IPU_YUV_FORMATS)
+		if (fmt_sel == PIXFMT_SEL_YUV_RGB && i >= NUM_IPU_YUV_FORMATS)
 			fmt = &ipu_rgb_formats[i - NUM_IPU_YUV_FORMATS];
 		else
 			fmt = &array[i];
@@ -358,22 +359,23 @@ imx_media_find_ipu_format(u32 code, enum codespace_sel cs_sel)
 }
 EXPORT_SYMBOL_GPL(imx_media_find_ipu_format);
 
-int imx_media_enum_ipu_format(u32 *code, u32 index, enum codespace_sel cs_sel)
+int imx_media_enum_ipu_format(u32 *code, u32 index,
+			      enum imx_pixfmt_sel fmt_sel)
 {
-	cs_sel &= ~CS_SEL_BAYER;
+	fmt_sel &= ~PIXFMT_SEL_BAYER;
 
-	switch (cs_sel) {
-	case CS_SEL_YUV:
+	switch (fmt_sel) {
+	case PIXFMT_SEL_YUV:
 		if (index >= NUM_IPU_YUV_FORMATS)
 			return -EINVAL;
 		*code = ipu_yuv_formats[index].codes[0];
 		break;
-	case CS_SEL_RGB:
+	case PIXFMT_SEL_RGB:
 		if (index >= NUM_IPU_RGB_FORMATS)
 			return -EINVAL;
 		*code = ipu_rgb_formats[index].codes[0];
 		break;
-	case CS_SEL_YUV_RGB:
+	case PIXFMT_SEL_YUV_RGB:
 		if (index >= NUM_IPU_YUV_FORMATS + NUM_IPU_RGB_FORMATS)
 			return -EINVAL;
 		if (index >= NUM_IPU_YUV_FORMATS) {
@@ -401,10 +403,10 @@ int imx_media_init_mbus_fmt(struct v4l2_mbus_framefmt *mbus,
 	mbus->height = height;
 	mbus->field = field;
 	if (code == 0)
-		imx_media_enum_mbus_format(&code, 0, CS_SEL_YUV);
-	lcc = imx_media_find_mbus_format(code, CS_SEL_ANY);
+		imx_media_enum_mbus_format(&code, 0, PIXFMT_SEL_YUV);
+	lcc = imx_media_find_mbus_format(code, PIXFMT_SEL_ANY);
 	if (!lcc) {
-		lcc = imx_media_find_ipu_format(code, CS_SEL_YUV_RGB);
+		lcc = imx_media_find_ipu_format(code, PIXFMT_SEL_YUV_RGB);
 		if (!lcc)
 			return -EINVAL;
 	}
@@ -473,9 +475,11 @@ void imx_media_try_colorimetry(struct v4l2_mbus_framefmt *tryfmt,
 	const struct imx_media_pixfmt *cc;
 	bool is_rgb = false;
 
-	cc = imx_media_find_mbus_format(tryfmt->code, CS_SEL_ANY);
+	cc = imx_media_find_mbus_format(tryfmt->code, PIXFMT_SEL_ANY);
 	if (!cc)
-		cc = imx_media_find_ipu_format(tryfmt->code, CS_SEL_YUV_RGB);
+		cc = imx_media_find_ipu_format(tryfmt->code,
+					       PIXFMT_SEL_YUV_RGB);
+
 	if (cc && cc->cs == IPUV3_COLORSPACE_RGB)
 		is_rgb = true;
 
@@ -525,10 +529,11 @@ int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
 	u32 stride;
 
 	if (!cc) {
-		cc = imx_media_find_ipu_format(mbus->code, CS_SEL_YUV_RGB);
+		cc = imx_media_find_ipu_format(mbus->code,
+					       PIXFMT_SEL_YUV_RGB);
 		if (!cc)
 			cc = imx_media_find_mbus_format(mbus->code,
-							CS_SEL_ANY);
+							PIXFMT_SEL_ANY);
 		if (!cc)
 			return -EINVAL;
 	}
@@ -540,8 +545,8 @@ int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
 	if (cc->ipufmt && cc->cs == IPUV3_COLORSPACE_YUV) {
 		u32 code;
 
-		imx_media_enum_mbus_format(&code, 0, CS_SEL_YUV);
-		cc = imx_media_find_mbus_format(code, CS_SEL_YUV);
+		imx_media_enum_mbus_format(&code, 0, PIXFMT_SEL_YUV);
+		cc = imx_media_find_mbus_format(code, PIXFMT_SEL_YUV);
 	}
 
 	/* Round up width for minimum burst size */
@@ -592,7 +597,7 @@ int imx_media_ipu_image_to_mbus_fmt(struct v4l2_mbus_framefmt *mbus,
 {
 	const struct imx_media_pixfmt *fmt;
 
-	fmt = imx_media_find_format(image->pix.pixelformat, CS_SEL_ANY);
+	fmt = imx_media_find_format(image->pix.pixelformat, PIXFMT_SEL_ANY);
 	if (!fmt)
 		return -EINVAL;
 
diff --git a/drivers/staging/media/imx/imx-media-vdic.c b/drivers/staging/media/imx/imx-media-vdic.c
index 0d83c2c41606..9807d578ce89 100644
--- a/drivers/staging/media/imx/imx-media-vdic.c
+++ b/drivers/staging/media/imx/imx-media-vdic.c
@@ -548,7 +548,8 @@ static int vdic_enum_mbus_code(struct v4l2_subdev *sd,
 	if (code->pad >= VDIC_NUM_PADS)
 		return -EINVAL;
 
-	return imx_media_enum_ipu_format(&code->code, code->index, CS_SEL_YUV);
+	return imx_media_enum_ipu_format(&code->code, code->index,
+					 PIXFMT_SEL_YUV);
 }
 
 static int vdic_get_fmt(struct v4l2_subdev *sd,
@@ -583,12 +584,13 @@ static void vdic_try_fmt(struct vdic_priv *priv,
 {
 	struct v4l2_mbus_framefmt *infmt;
 
-	*cc = imx_media_find_ipu_format(sdformat->format.code, CS_SEL_YUV);
+	*cc = imx_media_find_ipu_format(sdformat->format.code,
+					PIXFMT_SEL_YUV);
 	if (!*cc) {
 		u32 code;
 
-		imx_media_enum_ipu_format(&code, 0, CS_SEL_YUV);
-		*cc = imx_media_find_ipu_format(code, CS_SEL_YUV);
+		imx_media_enum_ipu_format(&code, 0, PIXFMT_SEL_YUV);
+		*cc = imx_media_find_ipu_format(code, PIXFMT_SEL_YUV);
 		sdformat->format.code = (*cc)->codes[0];
 	}
 
@@ -850,7 +852,7 @@ static int vdic_registered(struct v4l2_subdev *sd)
 	for (i = 0; i < VDIC_NUM_PADS; i++) {
 		code = 0;
 		if (i != VDIC_SINK_PAD_IDMAC)
-			imx_media_enum_ipu_format(&code, 0, CS_SEL_YUV);
+			imx_media_enum_ipu_format(&code, 0, PIXFMT_SEL_YUV);
 
 		/* set a default mbus format  */
 		ret = imx_media_init_mbus_fmt(&priv->format_mbus[i],
diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
index 652673a703cd..ac7c521d8148 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -79,6 +79,14 @@ struct imx_media_pixfmt {
 	bool    ipufmt;  /* is one of the IPU internal formats */
 };
 
+enum imx_pixfmt_sel {
+	PIXFMT_SEL_YUV   = BIT(0), /* select YUV formats */
+	PIXFMT_SEL_RGB   = BIT(1), /* select RGB formats */
+	PIXFMT_SEL_BAYER = BIT(2), /* select BAYER formats */
+	PIXFMT_SEL_YUV_RGB = PIXFMT_SEL_YUV | PIXFMT_SEL_RGB,
+	PIXFMT_SEL_ANY = PIXFMT_SEL_YUV | PIXFMT_SEL_RGB | PIXFMT_SEL_BAYER,
+};
+
 struct imx_media_buffer {
 	struct vb2_v4l2_buffer vbuf; /* v4l buffer must be first */
 	struct list_head  list;
@@ -149,24 +157,16 @@ struct imx_media_dev {
 	struct v4l2_subdev *sync_sd[2][NUM_IPU_SUBDEVS];
 };
 
-enum codespace_sel {
-	CS_SEL_YUV = BIT(0),
-	CS_SEL_RGB = BIT(1),
-	CS_SEL_BAYER = BIT(2),
-	CS_SEL_YUV_RGB = CS_SEL_YUV | CS_SEL_RGB,
-	CS_SEL_ANY = CS_SEL_YUV | CS_SEL_RGB | CS_SEL_BAYER,
-};
-
 /* imx-media-utils.c */
 const struct imx_media_pixfmt *
-imx_media_find_format(u32 fourcc, enum codespace_sel cs_sel);
-int imx_media_enum_format(u32 *fourcc, u32 index, enum codespace_sel cs_sel);
+imx_media_find_format(u32 fourcc, enum imx_pixfmt_sel sel);
+int imx_media_enum_format(u32 *fourcc, u32 index, enum imx_pixfmt_sel sel);
 const struct imx_media_pixfmt *
-imx_media_find_mbus_format(u32 code, enum codespace_sel cs_sel);
-int imx_media_enum_mbus_format(u32 *code, u32 index, enum codespace_sel cs_sel);
+imx_media_find_mbus_format(u32 code, enum imx_pixfmt_sel sel);
+int imx_media_enum_mbus_format(u32 *code, u32 index, enum imx_pixfmt_sel sel);
 const struct imx_media_pixfmt *
-imx_media_find_ipu_format(u32 code, enum codespace_sel cs_sel);
-int imx_media_enum_ipu_format(u32 *code, u32 index, enum codespace_sel cs_sel);
+imx_media_find_ipu_format(u32 code, enum imx_pixfmt_sel sel);
+int imx_media_enum_ipu_format(u32 *code, u32 index, enum imx_pixfmt_sel sel);
 int imx_media_init_mbus_fmt(struct v4l2_mbus_framefmt *mbus,
 			    u32 width, u32 height, u32 code, u32 field,
 			    const struct imx_media_pixfmt **cc);
diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index b8818ee99e24..73169605e5e0 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -959,7 +959,7 @@ static int imx7_csi_enum_mbus_code(struct v4l2_subdev *sd,
 	switch (code->pad) {
 	case IMX7_CSI_PAD_SINK:
 		ret = imx_media_enum_mbus_format(&code->code, code->index,
-						 CS_SEL_ANY);
+						 PIXFMT_SEL_ANY);
 		break;
 	case IMX7_CSI_PAD_SRC:
 		if (code->index != 0) {
@@ -1019,7 +1019,8 @@ static int imx7_csi_try_fmt(struct imx7_csi *csi,
 
 	switch (sdformat->pad) {
 	case IMX7_CSI_PAD_SRC:
-		in_cc = imx_media_find_mbus_format(in_fmt->code, CS_SEL_ANY);
+		in_cc = imx_media_find_mbus_format(in_fmt->code,
+						   PIXFMT_SEL_ANY);
 
 		sdformat->format.width = in_fmt->width;
 		sdformat->format.height = in_fmt->height;
@@ -1034,10 +1035,12 @@ static int imx7_csi_try_fmt(struct imx7_csi *csi,
 		break;
 	case IMX7_CSI_PAD_SINK:
 		*cc = imx_media_find_mbus_format(sdformat->format.code,
-						 CS_SEL_ANY);
+						 PIXFMT_SEL_ANY);
 		if (!*cc) {
-			imx_media_enum_mbus_format(&code, 0, CS_SEL_YUV_RGB);
-			*cc = imx_media_find_mbus_format(code, CS_SEL_YUV_RGB);
+			imx_media_enum_mbus_format(&code, 0,
+						   PIXFMT_SEL_YUV_RGB);
+			*cc = imx_media_find_mbus_format(code,
+							 PIXFMT_SEL_YUV_RGB);
 			sdformat->format.code = (*cc)->codes[0];
 		}
 
-- 
2.17.1

