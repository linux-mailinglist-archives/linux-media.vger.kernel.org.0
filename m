Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDBFD2EAE90
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 16:36:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728139AbhAEPdt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 10:33:49 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:38064 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728116AbhAEPdt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 10:33:49 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B00AD8F7;
        Tue,  5 Jan 2021 16:29:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609860592;
        bh=g+r1E6iyHJ7muqeGyTbJH6sA/TUYxQ9VK0KIg/If/QY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NO+VSFJ0xC+JynKBE0upO+Td78lBSsGfTv1MA0K3o3Nmtq8pyF8jdFMujg/nWEoe3
         BYHaR0A5zDsmuqYOgcVRZwVa5TazqZSZ94RWWDgQ534v/dt7ktWv0fgX34ILqxuqtV
         NXRrt04yafCLXgiWlKxoZ8XKHPIkXDCIeALKg3tM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 25/75] media: imx: capture: Extract format lookup from __capture_legacy_try_fmt
Date:   Tue,  5 Jan 2021 17:28:02 +0200
Message-Id: <20210105152852.5733-26-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Extract the format lookup code from __capture_legacy_try_fmt() to a
separate function, it will be reused when validating the video node
format at stream start time.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx-media-capture.c | 45 ++++++++++---------
 1 file changed, 24 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index 7d23a0e7ee3a..775ebce92c94 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -58,6 +58,27 @@ struct capture_priv {
  * Common Video IOCTLs
  */
 
+static const struct imx_media_pixfmt *capture_find_format(u32 code, u32 fourcc)
+{
+	const struct imx_media_pixfmt *cc;
+
+	cc = imx_media_find_ipu_format(code, PIXFMT_SEL_YUV_RGB);
+	if (cc) {
+		enum imx_pixfmt_sel fmt_sel = cc->cs == IPUV3_COLORSPACE_YUV
+					    ? PIXFMT_SEL_YUV : PIXFMT_SEL_RGB;
+
+		cc = imx_media_find_pixel_format(fourcc, fmt_sel);
+		if (!cc) {
+			imx_media_enum_pixel_formats(&fourcc, 0, fmt_sel, 0);
+			cc = imx_media_find_pixel_format(fourcc, fmt_sel);
+		}
+
+		return cc;
+	}
+
+	return imx_media_find_mbus_format(code, PIXFMT_SEL_ANY);
+}
+
 static int capture_querycap(struct file *file, void *fh,
 			    struct v4l2_capability *cap)
 {
@@ -238,27 +259,9 @@ static int __capture_legacy_try_fmt(struct capture_priv *priv,
 {
 	const struct imx_media_pixfmt *cc;
 
-	cc = imx_media_find_ipu_format(fmt_src->format.code,
-				       PIXFMT_SEL_YUV_RGB);
-	if (cc) {
-		enum imx_pixfmt_sel fmt_sel;
-		u32 fourcc;
-
-		fmt_sel = (cc->cs == IPUV3_COLORSPACE_YUV)
-			? PIXFMT_SEL_YUV : PIXFMT_SEL_RGB;
-		fourcc = pixfmt->pixelformat;
-
-		cc = imx_media_find_pixel_format(fourcc, fmt_sel);
-		if (!cc) {
-			imx_media_enum_pixel_formats(&fourcc, 0, fmt_sel, 0);
-			cc = imx_media_find_pixel_format(fourcc, fmt_sel);
-		}
-	} else {
-		cc = imx_media_find_mbus_format(fmt_src->format.code,
-						PIXFMT_SEL_ANY);
-		if (WARN_ON(!cc))
-			return -EINVAL;
-	}
+	cc = capture_find_format(fmt_src->format.code, pixfmt->pixelformat);
+	if (WARN_ON(!cc))
+		return -EINVAL;
 
 	/* allow IDMAC interweave but enforce field order from source */
 	if (V4L2_FIELD_IS_INTERLACED(pixfmt->field)) {
-- 
Regards,

Laurent Pinchart

