Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20F2131B49F
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:33:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230128AbhBOEcs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:32:48 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45318 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229908AbhBOEcg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:32:36 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B87BB1928;
        Mon, 15 Feb 2021 05:28:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363307;
        bh=xEvqP1/+st0bo1+tbimhdD1oKAqyj5rw5KhVd1RVlVs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mdzznWPGCv4dAARv1/ULtEmtHdz4BEKvfPvX19waymvNmUMGEogLwB4XHEW4QIxM1
         6xGe9zgbfSNS/6Vtf0TD5S4seczbW6wZyvaHHPpiH9pkzVjIOosPoD9WROsdjWGGQ1
         bo4b+PDIBaepY6a7DJjJrJNIzg0l7kvqgFkgGPV0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 22/77] media: imx: capture: Pass v4l2_pix_format to __capture_legacy_try_fmt()
Date:   Mon, 15 Feb 2021 06:26:46 +0200
Message-Id: <20210215042741.28850-23-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The __capture_legacy_try_fmt() function only needs the v4l2_pix_format
embedded in the v4l2_format argument it receives. Pass it the
v4l2_pix_format directly, allowing on caller to allocate a smaller
structure on the stack.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
Reviewed-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/staging/media/imx/imx-media-capture.c | 25 ++++++++++---------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index 1ef358eb3bd8..954f053497f9 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -232,7 +232,7 @@ static int capture_legacy_enum_fmt_vid_cap(struct file *file, void *fh,
 
 static int __capture_legacy_try_fmt(struct capture_priv *priv,
 				    struct v4l2_subdev_format *fmt_src,
-				    struct v4l2_format *f,
+				    struct v4l2_pix_format *pixfmt,
 				    const struct imx_media_pixfmt **retcc,
 				    struct v4l2_rect *compose)
 {
@@ -246,7 +246,7 @@ static int __capture_legacy_try_fmt(struct capture_priv *priv,
 
 		fmt_sel = (cc->cs == IPUV3_COLORSPACE_YUV)
 			? PIXFMT_SEL_YUV : PIXFMT_SEL_RGB;
-		fourcc = f->fmt.pix.pixelformat;
+		fourcc = pixfmt->pixelformat;
 
 		cc = imx_media_find_pixel_format(fourcc, fmt_sel);
 		if (!cc) {
@@ -261,7 +261,7 @@ static int __capture_legacy_try_fmt(struct capture_priv *priv,
 	}
 
 	/* allow IDMAC interweave but enforce field order from source */
-	if (V4L2_FIELD_IS_INTERLACED(f->fmt.pix.field)) {
+	if (V4L2_FIELD_IS_INTERLACED(pixfmt->field)) {
 		switch (fmt_src->format.field) {
 		case V4L2_FIELD_SEQ_TB:
 			fmt_src->format.field = V4L2_FIELD_INTERLACED_TB;
@@ -274,7 +274,7 @@ static int __capture_legacy_try_fmt(struct capture_priv *priv,
 		}
 	}
 
-	imx_media_mbus_fmt_to_pix_fmt(&f->fmt.pix, &fmt_src->format, cc);
+	imx_media_mbus_fmt_to_pix_fmt(pixfmt, &fmt_src->format, cc);
 
 	if (retcc)
 		*retcc = cc;
@@ -302,7 +302,8 @@ static int capture_legacy_try_fmt_vid_cap(struct file *file, void *fh,
 	if (ret)
 		return ret;
 
-	return __capture_legacy_try_fmt(priv, &fmt_src, f, NULL, NULL);
+	return __capture_legacy_try_fmt(priv, &fmt_src, &f->fmt.pix, NULL,
+					NULL);
 }
 
 static int capture_legacy_s_fmt_vid_cap(struct file *file, void *fh,
@@ -323,8 +324,8 @@ static int capture_legacy_s_fmt_vid_cap(struct file *file, void *fh,
 	if (ret)
 		return ret;
 
-	ret = __capture_legacy_try_fmt(priv, &fmt_src, f, &priv->vdev.cc,
-				       &priv->vdev.compose);
+	ret = __capture_legacy_try_fmt(priv, &fmt_src, &f->fmt.pix,
+				       &priv->vdev.cc, &priv->vdev.compose);
 	if (ret)
 		return ret;
 
@@ -534,7 +535,7 @@ static int capture_validate_fmt(struct capture_priv *priv)
 	struct v4l2_subdev_format fmt_src;
 	const struct imx_media_pixfmt *cc;
 	struct v4l2_rect compose;
-	struct v4l2_format f;
+	struct v4l2_pix_format pixfmt;
 	int ret;
 
 	fmt_src.pad = priv->src_sd_pad;
@@ -543,14 +544,14 @@ static int capture_validate_fmt(struct capture_priv *priv)
 	if (ret)
 		return ret;
 
-	v4l2_fill_pix_format(&f.fmt.pix, &fmt_src.format);
+	v4l2_fill_pix_format(&pixfmt, &fmt_src.format);
 
-	ret = __capture_legacy_try_fmt(priv, &fmt_src, &f, &cc, &compose);
+	ret = __capture_legacy_try_fmt(priv, &fmt_src, &pixfmt, &cc, &compose);
 	if (ret)
 		return ret;
 
-	return (priv->vdev.fmt.width != f.fmt.pix.width ||
-		priv->vdev.fmt.height != f.fmt.pix.height ||
+	return (priv->vdev.fmt.width != pixfmt.width ||
+		priv->vdev.fmt.height != pixfmt.height ||
 		priv->vdev.cc->cs != cc->cs ||
 		priv->vdev.compose.width != compose.width ||
 		priv->vdev.compose.height != compose.height) ? -EINVAL : 0;
-- 
Regards,

Laurent Pinchart

