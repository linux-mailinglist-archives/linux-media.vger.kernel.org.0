Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 263E62EAE93
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 16:36:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728149AbhAEPeG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 10:34:06 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:38064 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728142AbhAEPeG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 10:34:06 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DB07D9E6;
        Tue,  5 Jan 2021 16:29:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609860593;
        bh=+90f5oOY8Y7wm7MLcjLDdl0bmpMpZHDpcLA2Mo7xWWU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=g9aOjhhRwnOr9DwXEgD5hIojXNaAlprCEuAg7QpExKs7jg/uzY/Zb5a8nfAswQVW6
         vtUfVkh7yTeFmU09yb5t9Zl4pyBe65pPnUYD/mac7sxUZP7snqjXJEmVGBCAQITG+E
         Vi/kzWk84Bf2h62XwdM5+3InTEUhanPxcEHfe1Pg=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 27/75] media: imx: capture: Simplify __capture_legacy_try_fmt()
Date:   Tue,  5 Jan 2021 17:28:04 +0200
Message-Id: <20210105152852.5733-28-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The __capture_legacy_try_fmt() function returns two values through
pointer arguments. One is a compose rectangle, which duplicates
informationr returned through the subdev format argument, and can thus
be removed. The other is the imx_media_pixfmt, which can be returned
by value instead.

Simplify the implementation of __capture_legacy_try_fmt() by dropping
the retcc and compose arguments, and returning the imx_media_pixfmt by
value.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx-media-capture.c | 40 ++++++++-----------
 1 file changed, 17 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index 8f3c0da371d3..9a8e1a1400a2 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -251,17 +251,16 @@ static int capture_legacy_enum_fmt_vid_cap(struct file *file, void *fh,
 	return 0;
 }
 
-static int __capture_legacy_try_fmt(struct capture_priv *priv,
-				    struct v4l2_subdev_format *fmt_src,
-				    struct v4l2_pix_format *pixfmt,
-				    const struct imx_media_pixfmt **retcc,
-				    struct v4l2_rect *compose)
+static const struct imx_media_pixfmt *
+__capture_legacy_try_fmt(struct capture_priv *priv,
+			 struct v4l2_subdev_format *fmt_src,
+			 struct v4l2_pix_format *pixfmt)
 {
 	const struct imx_media_pixfmt *cc;
 
 	cc = capture_find_format(fmt_src->format.code, pixfmt->pixelformat);
 	if (WARN_ON(!cc))
-		return -EINVAL;
+		return NULL;
 
 	/* allow IDMAC interweave but enforce field order from source */
 	if (V4L2_FIELD_IS_INTERLACED(pixfmt->field)) {
@@ -279,17 +278,7 @@ static int __capture_legacy_try_fmt(struct capture_priv *priv,
 
 	imx_media_mbus_fmt_to_pix_fmt(pixfmt, &fmt_src->format, cc);
 
-	if (retcc)
-		*retcc = cc;
-
-	if (compose) {
-		compose->left = 0;
-		compose->top = 0;
-		compose->width = fmt_src->format.width;
-		compose->height = fmt_src->format.height;
-	}
-
-	return 0;
+	return cc;
 }
 
 static int capture_legacy_try_fmt_vid_cap(struct file *file, void *fh,
@@ -305,8 +294,10 @@ static int capture_legacy_try_fmt_vid_cap(struct file *file, void *fh,
 	if (ret)
 		return ret;
 
-	return __capture_legacy_try_fmt(priv, &fmt_src, &f->fmt.pix, NULL,
-					NULL);
+	if (!__capture_legacy_try_fmt(priv, &fmt_src, &f->fmt.pix))
+		return -EINVAL;
+
+	return 0;
 }
 
 static int capture_legacy_s_fmt_vid_cap(struct file *file, void *fh,
@@ -314,6 +305,7 @@ static int capture_legacy_s_fmt_vid_cap(struct file *file, void *fh,
 {
 	struct capture_priv *priv = video_drvdata(file);
 	struct v4l2_subdev_format fmt_src;
+	const struct imx_media_pixfmt *cc;
 	int ret;
 
 	if (vb2_is_busy(&priv->q)) {
@@ -327,12 +319,14 @@ static int capture_legacy_s_fmt_vid_cap(struct file *file, void *fh,
 	if (ret)
 		return ret;
 
-	ret = __capture_legacy_try_fmt(priv, &fmt_src, &f->fmt.pix,
-				       &priv->vdev.cc, &priv->vdev.compose);
-	if (ret)
-		return ret;
+	cc = __capture_legacy_try_fmt(priv, &fmt_src, &f->fmt.pix);
+	if (!cc)
+		return -EINVAL;
 
+	priv->vdev.cc = cc;
 	priv->vdev.fmt = f->fmt.pix;
+	priv->vdev.compose.width = fmt_src.format.width;
+	priv->vdev.compose.height = fmt_src.format.height;
 
 	return 0;
 }
-- 
Regards,

Laurent Pinchart

