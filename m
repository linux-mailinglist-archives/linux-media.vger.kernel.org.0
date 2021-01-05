Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1624C2EAE87
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 16:33:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728073AbhAEPdZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 10:33:25 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:37698 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728041AbhAEPdZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 10:33:25 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E062C8EF;
        Tue,  5 Jan 2021 16:29:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609860590;
        bh=/bGBFX9K4oXkyxviJeqWo1Zvv/RSQFbX0RACHVfENX8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SIv4rHa6/+eO7EBJokvB9e2fvJfOORtCBqOLWcUNTALOgK8x8dh96qcuXiitnXWm4
         9OpP03sxUrLKSj/ix9FJMLi5vl6uXpygg7qLF8EN75FMPbY/8KPqupyBl4OvaUJB18
         nHEh2SOXEowzKt7rknaFrg4t9jUxbrPT33jO48zQ=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 22/75] media: imx: capture: Remove unneeded variable in __capture_legacy_try_fmt
Date:   Tue,  5 Jan 2021 17:27:59 +0200
Message-Id: <20210105152852.5733-23-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The __capture_legacy_try_fmt() function doesn't need two
imx_media_pixfmt pointer variables. Remove one of them.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx-media-capture.c | 20 +++++++++----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index 70b3d187bbc3..7932b7f0f4f2 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -236,16 +236,16 @@ static int __capture_legacy_try_fmt(struct capture_priv *priv,
 				    const struct imx_media_pixfmt **retcc,
 				    struct v4l2_rect *compose)
 {
-	const struct imx_media_pixfmt *cc, *cc_src;
+	const struct imx_media_pixfmt *cc;
 
-	cc_src = imx_media_find_ipu_format(fmt_src->format.code,
-					   PIXFMT_SEL_YUV_RGB);
-	if (cc_src) {
+	cc = imx_media_find_ipu_format(fmt_src->format.code,
+				       PIXFMT_SEL_YUV_RGB);
+	if (cc) {
 		enum imx_pixfmt_sel fmt_sel;
 		u32 fourcc;
 
-		fmt_sel = (cc_src->cs == IPUV3_COLORSPACE_YUV) ?
-			PIXFMT_SEL_YUV : PIXFMT_SEL_RGB;
+		fmt_sel = (cc->cs == IPUV3_COLORSPACE_YUV)
+			? PIXFMT_SEL_YUV : PIXFMT_SEL_RGB;
 		fourcc = f->fmt.pix.pixelformat;
 
 		cc = imx_media_find_pixel_format(fourcc, fmt_sel);
@@ -254,12 +254,10 @@ static int __capture_legacy_try_fmt(struct capture_priv *priv,
 			cc = imx_media_find_pixel_format(fourcc, fmt_sel);
 		}
 	} else {
-		cc_src = imx_media_find_mbus_format(fmt_src->format.code,
-						    PIXFMT_SEL_ANY);
-		if (WARN_ON(!cc_src))
+		cc = imx_media_find_mbus_format(fmt_src->format.code,
+						PIXFMT_SEL_ANY);
+		if (WARN_ON(!cc))
 			return -EINVAL;
-
-		cc = cc_src;
 	}
 
 	/* allow IDMAC interweave but enforce field order from source */
-- 
Regards,

Laurent Pinchart

