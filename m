Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E85F831B4A2
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:33:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230137AbhBOEdS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:33:18 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45636 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230134AbhBOEdJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:33:09 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 12846192E;
        Mon, 15 Feb 2021 05:28:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363310;
        bh=orp3L1o+sZAIgRtckY7DMxw2z5eXs9psvMIShP4XYR8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uufpg08nQv9u4BS+S+AOulfYrVZ5ZgRKZG8O2KsuQmOgi+K2pYtmrdzPvkYqOekhy
         tdXlJ/jk62o527UiVYpHBEVHn/jJXRLclgg7YtsXXwAiLBL6OrAGV2TUPxpzwnsRNo
         lmcXPY1dLGYrwIH6wmhgbuO2PexUx2tac75/aoj0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 25/77] media: imx: capture: Simplify capture_validate_fmt() implementation
Date:   Mon, 15 Feb 2021 06:26:49 +0200
Message-Id: <20210215042741.28850-26-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

capture_validate_fmt() delegates the media bus format to pixel format
conversion to __capture_legacy_try_fmt(). It turns out that this can be
simplified quite a lot:

- The format lookup from media bus code can be performed by the recently
  added capture_find_format() function instead of receiving the
  information from a side effect of __capture_legacy_try_fmt().

- The validation of the pixel format size isn't needed, as they
  duplicate the validation of the compose rectangle. The pixel format
  size is directly derived from the size of the incoming stream, which
  is stored in the compose rectangle. If the compose rectangle is valid,
  the pixel format size will be valid too.

By removing the validation of the pixel format size and using
capture_find_format() to lookup the format, we can stop using
__capture_legacy_try_fmt() and simplify capture_validate_fmt().

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 drivers/staging/media/imx/imx-media-capture.c | 30 ++++++++++++-------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index 6350acd0dba9..ed4e51b93dc5 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -537,27 +537,35 @@ static int capture_validate_fmt(struct capture_priv *priv)
 {
 	struct v4l2_subdev_format fmt_src;
 	const struct imx_media_pixfmt *cc;
-	struct v4l2_rect compose;
-	struct v4l2_pix_format pixfmt;
 	int ret;
 
+	/* Retrieve the media bus format on the source subdev. */
 	fmt_src.pad = priv->src_sd_pad;
 	fmt_src.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 	ret = v4l2_subdev_call(priv->src_sd, pad, get_fmt, NULL, &fmt_src);
 	if (ret)
 		return ret;
 
-	v4l2_fill_pix_format(&pixfmt, &fmt_src.format);
+	/*
+	 * Verify that the media bus size matches the size set on the video
+	 * node. It is sufficient to check the compose rectangle size without
+	 * checking the rounded size from vdev.fmt, as the rounded size is
+	 * derived directly from the compose rectangle size, and will thus
+	 * always match if the compose rectangle matches.
+	 */
+	if (priv->vdev.compose.width != fmt_src.format.width ||
+	    priv->vdev.compose.height != fmt_src.format.height)
+		return -EPIPE;
 
-	ret = __capture_legacy_try_fmt(priv, &fmt_src, &pixfmt, &cc, &compose);
-	if (ret)
-		return ret;
+	/*
+	 * Verify that the media bus code is compatible with the pixel format
+	 * set on the video node.
+	 */
+	cc = capture_find_format(fmt_src.format.code, 0);
+	if (!cc || priv->vdev.cc->cs != cc->cs)
+		return -EPIPE;
 
-	return (priv->vdev.fmt.width != pixfmt.width ||
-		priv->vdev.fmt.height != pixfmt.height ||
-		priv->vdev.cc->cs != cc->cs ||
-		priv->vdev.compose.width != compose.width ||
-		priv->vdev.compose.height != compose.height) ? -EPIPE : 0;
+	return 0;
 }
 
 static int capture_start_streaming(struct vb2_queue *vq, unsigned int count)
-- 
Regards,

Laurent Pinchart

