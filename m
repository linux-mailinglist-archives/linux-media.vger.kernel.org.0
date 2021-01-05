Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90AA32EAEB7
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 16:36:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728066AbhAEPgj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 10:36:39 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:38168 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725838AbhAEPgi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 10:36:38 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 54B521BBD;
        Tue,  5 Jan 2021 16:30:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609860604;
        bh=ycyU9C5qQ5w+IGIBp4xnP0rDrTcOjvIb5IlnlG6j/9Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NtP+d3Fj1Na9wDTRq8+fPpP8TEN1ZrQCmbnwIFOSuB+6WkykGhunYPKq6a5pu6Wek
         DRJmpLed50JdE1lu/S9TzlTyrTmx4NNZZqBKUJt8rR8fK1PqVi3hx+aXEsGK6ydNrb
         JH4Bdy8YK8vA/AWig2KcrEmEhVZzEWg/rn81gNL0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 44/75] media: imx: imx7-media-csi: Set the MIPI data type based on the bus code
Date:   Tue,  5 Jan 2021 17:28:21 +0200
Message-Id: <20210105152852.5733-45-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The MIPI CSI-2 data type depends solely on the media bus code on the
sink pad. Deriving it from the pixel format is confusing. Simplify the
code.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 64 +++++++++++++---------
 1 file changed, 39 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 0bdd169c3801..6bc430ea1263 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -482,7 +482,6 @@ static void imx7_csi_configure(struct imx7_csi *csi)
 {
 	struct imx_media_video_dev *vdev = csi->vdev;
 	struct v4l2_pix_format *out_pix = &vdev->fmt;
-	__u32 in_code = csi->format_mbus[IMX7_CSI_PAD_SINK].code;
 	u32 cr1, cr18;
 	int width = out_pix->width;
 
@@ -518,37 +517,52 @@ static void imx7_csi_configure(struct imx7_csi *csi)
 	cr18 &= BIT_MIPI_DATA_FORMAT_MASK;
 	cr18 |= BIT_DATA_FROM_MIPI;
 
-	switch (out_pix->pixelformat) {
-	case V4L2_PIX_FMT_UYVY:
-	case V4L2_PIX_FMT_YUYV:
-		cr18 |= BIT_MIPI_DATA_FORMAT_YUV422_8B;
+	switch (csi->format_mbus[IMX7_CSI_PAD_SINK].code) {
+	case MEDIA_BUS_FMT_Y8_1X8:
+	case MEDIA_BUS_FMT_SBGGR8_1X8:
+	case MEDIA_BUS_FMT_SGBRG8_1X8:
+	case MEDIA_BUS_FMT_SGRBG8_1X8:
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
+		cr18 |= BIT_MIPI_DATA_FORMAT_RAW8;
 		break;
-	case V4L2_PIX_FMT_GREY:
-		if (in_code == MEDIA_BUS_FMT_Y8_1X8)
-			cr18 |= BIT_MIPI_DATA_FORMAT_RAW8;
-		else if (in_code == MEDIA_BUS_FMT_Y10_1X10)
-			cr18 |= BIT_MIPI_DATA_FORMAT_RAW10;
-		else
-			cr18 |= BIT_MIPI_DATA_FORMAT_RAW12;
-		break;
-	case V4L2_PIX_FMT_Y10:
+	case MEDIA_BUS_FMT_Y10_1X10:
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+	case MEDIA_BUS_FMT_SGBRG10_1X10:
+	case MEDIA_BUS_FMT_SGRBG10_1X10:
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
 		cr18 |= BIT_MIPI_DATA_FORMAT_RAW10;
-		cr1 |= BIT_PIXEL_BIT;
 		break;
-	case V4L2_PIX_FMT_Y12:
+	case MEDIA_BUS_FMT_Y12_1X12:
+	case MEDIA_BUS_FMT_SBGGR12_1X12:
+	case MEDIA_BUS_FMT_SGBRG12_1X12:
+	case MEDIA_BUS_FMT_SGRBG12_1X12:
+	case MEDIA_BUS_FMT_SRGGB12_1X12:
 		cr18 |= BIT_MIPI_DATA_FORMAT_RAW12;
-		cr1 |= BIT_PIXEL_BIT;
 		break;
+	case MEDIA_BUS_FMT_Y14_1X14:
+	case MEDIA_BUS_FMT_SBGGR14_1X14:
+	case MEDIA_BUS_FMT_SGBRG14_1X14:
+	case MEDIA_BUS_FMT_SGRBG14_1X14:
+	case MEDIA_BUS_FMT_SRGGB14_1X14:
+		cr18 |= BIT_MIPI_DATA_FORMAT_RAW14;
+		break;
+	/*
+	 * CSI-2 sources are supposed to use the 1X16 formats, but not all of
+	 * them comply. Support both variants.
+	 */
+	case MEDIA_BUS_FMT_UYVY8_2X8:
+	case MEDIA_BUS_FMT_UYVY8_1X16:
+	case MEDIA_BUS_FMT_YUYV8_2X8:
+	case MEDIA_BUS_FMT_YUYV8_1X16:
+		cr18 |= BIT_MIPI_DATA_FORMAT_YUV422_8B;
+		break;
+	}
+
+	switch (out_pix->pixelformat) {
+	case V4L2_PIX_FMT_Y10:
+	case V4L2_PIX_FMT_Y12:
 	case V4L2_PIX_FMT_SBGGR8:
-		cr18 |= BIT_MIPI_DATA_FORMAT_RAW8;
-		break;
 	case V4L2_PIX_FMT_SBGGR16:
-		if (in_code == MEDIA_BUS_FMT_SBGGR10_1X10)
-			cr18 |= BIT_MIPI_DATA_FORMAT_RAW10;
-		else if (in_code == MEDIA_BUS_FMT_SBGGR12_1X12)
-			cr18 |= BIT_MIPI_DATA_FORMAT_RAW12;
-		else if (in_code == MEDIA_BUS_FMT_SBGGR14_1X14)
-			cr18 |= BIT_MIPI_DATA_FORMAT_RAW14;
 		cr1 |= BIT_PIXEL_BIT;
 		break;
 	}
-- 
Regards,

Laurent Pinchart

