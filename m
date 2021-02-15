Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76CC631B49E
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:33:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229917AbhBOEce (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:32:34 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45636 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229908AbhBOEca (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:32:30 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0B0B21925;
        Mon, 15 Feb 2021 05:28:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363306;
        bh=CRSJ7I6oVEzCZZz+N3YN8NWPVFaNEl07mkr7p7lhhkM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qKU7jUPiwMgTIugK3qACaQXvpKTJxknPnMa9QTfl212FlbfhrzbNNPFptX7K97NSC
         xgZq0e9zLwfSuYiMreLhdj3FK/gdefAIT1K5il3rcU9by4vcBiTlbJ+zlY02RKvph5
         FBwzLZMVnCGDFOX5Au6H7GrpMSXUGGOKWyTSHpYo=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 21/77] media: imx: capture: Remove unneeded variable in __capture_legacy_try_fmt
Date:   Mon, 15 Feb 2021 06:26:45 +0200
Message-Id: <20210215042741.28850-22-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The __capture_legacy_try_fmt() function doesn't need two
imx_media_pixfmt pointer variables. Remove one of them.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
Reviewed-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/staging/media/imx/imx-media-capture.c | 20 +++++++++----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index d782394f6cd1..1ef358eb3bd8 100644
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

