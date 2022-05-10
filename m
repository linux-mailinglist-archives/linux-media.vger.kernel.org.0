Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15F81521494
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 14:00:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241510AbiEJMEK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 08:04:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241507AbiEJMEJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 08:04:09 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C9265131E
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 05:00:11 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1B75418D4;
        Tue, 10 May 2022 13:59:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1652183988;
        bh=3wfwAYCjwSBDY3gwY+uNhWpFjwm2U/VoRqE0aSgR5tI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NHqk/mR2RvjK9zj2yfBnzb+9EWGl6cnmsFb3O6u9KaNinKMIWUq9YkQ5ZeOP/eXEK
         lXkgB5ZylxKfUiqRH2H+5FacAjIhP0qk4Nw16068lfygHpmLZvYj1Rg42q7L9q3MJh
         dR74Kr/rn+ZWgBWJljkVQJpfMmXO2HdRtMHhdA68=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>,
        kernel@pengutronix.de
Subject: [PATCH 45/50] staging: media: imx: imx7-media-csi: Fix list of supported formats
Date:   Tue, 10 May 2022 14:58:54 +0300
Message-Id: <20220510115859.19777-46-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220510115859.19777-1-laurent.pinchart@ideasonboard.com>
References: <20220510115859.19777-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The list of supported formats comes from helpers shared with the i.MX6
IPUv3 and is incorrect in multiple regards:

- 10-, 12- and 14-bit Bayer formats are stored in memory as SBGGR10,
  SBGGR12 and SBGGR14 respectively (plus components permutations), not
  SBGGR16. Same thing for greyscale formats.
- 16-bit RAW formats are not supported by the hardware.

Fix the supported formats table.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 106 ++++++++++++---------
 1 file changed, 61 insertions(+), 45 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 0fb5e0c03396..1bb60f245861 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -846,56 +846,64 @@ static const struct imx7_csi_pixfmt pixel_formats[] = {
 		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_SRGGB8_1X8),
 		.bpp    = 8,
 	}, {
-		.fourcc = V4L2_PIX_FMT_SBGGR16,
-		.codes  = IMX_BUS_FMTS(
-			MEDIA_BUS_FMT_SBGGR10_1X10,
-			MEDIA_BUS_FMT_SBGGR12_1X12,
-			MEDIA_BUS_FMT_SBGGR14_1X14,
-			MEDIA_BUS_FMT_SBGGR16_1X16
-		),
-		.bpp    = 16,
-	}, {
-		.fourcc = V4L2_PIX_FMT_SGBRG16,
-		.codes  = IMX_BUS_FMTS(
-			MEDIA_BUS_FMT_SGBRG10_1X10,
-			MEDIA_BUS_FMT_SGBRG12_1X12,
-			MEDIA_BUS_FMT_SGBRG14_1X14,
-			MEDIA_BUS_FMT_SGBRG16_1X16
-		),
-		.bpp    = 16,
-	}, {
-		.fourcc = V4L2_PIX_FMT_SGRBG16,
-		.codes  = IMX_BUS_FMTS(
-			MEDIA_BUS_FMT_SGRBG10_1X10,
-			MEDIA_BUS_FMT_SGRBG12_1X12,
-			MEDIA_BUS_FMT_SGRBG14_1X14,
-			MEDIA_BUS_FMT_SGRBG16_1X16
-		),
-		.bpp    = 16,
-	}, {
-		.fourcc = V4L2_PIX_FMT_SRGGB16,
-		.codes  = IMX_BUS_FMTS(
-			MEDIA_BUS_FMT_SRGGB10_1X10,
-			MEDIA_BUS_FMT_SRGGB12_1X12,
-			MEDIA_BUS_FMT_SRGGB14_1X14,
-			MEDIA_BUS_FMT_SRGGB16_1X16
-		),
+		.fourcc = V4L2_PIX_FMT_SBGGR10,
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_SBGGR10_1X10),
+		.bpp    = 16,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGBRG10,
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_SGBRG10_1X10),
+		.bpp    = 16,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGRBG10,
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_SGRBG10_1X10),
+		.bpp    = 16,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SRGGB10,
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_SRGGB10_1X10),
+		.bpp    = 16,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SBGGR12,
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_SBGGR12_1X12),
+		.bpp    = 16,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGBRG12,
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_SGBRG12_1X12),
+		.bpp    = 16,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGRBG12,
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_SGRBG12_1X12),
+		.bpp    = 16,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SRGGB12,
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_SRGGB12_1X12),
+		.bpp    = 16,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SBGGR14,
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_SBGGR14_1X14),
+		.bpp    = 16,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGBRG14,
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_SGBRG14_1X14),
+		.bpp    = 16,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGRBG14,
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_SGRBG14_1X14),
+		.bpp    = 16,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SRGGB14,
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_SRGGB14_1X14),
 		.bpp    = 16,
 	}, {
 		.fourcc = V4L2_PIX_FMT_GREY,
-		.codes = IMX_BUS_FMTS(
-			MEDIA_BUS_FMT_Y8_1X8,
-			MEDIA_BUS_FMT_Y10_1X10,
-			MEDIA_BUS_FMT_Y12_1X12
-		),
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_Y8_1X8),
 		.bpp    = 8,
 	}, {
 		.fourcc = V4L2_PIX_FMT_Y10,
-		.codes = IMX_BUS_FMTS(MEDIA_BUS_FMT_Y10_1X10),
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_Y10_1X10),
 		.bpp    = 16,
 	}, {
 		.fourcc = V4L2_PIX_FMT_Y12,
-		.codes = IMX_BUS_FMTS(MEDIA_BUS_FMT_Y12_1X12),
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_Y12_1X12),
 		.bpp    = 16,
 	},
 };
@@ -2015,10 +2023,18 @@ static int imx7_csi_pad_link_validate(struct v4l2_subdev *sd,
 	case V4L2_PIX_FMT_SGBRG8:
 	case V4L2_PIX_FMT_SGRBG8:
 	case V4L2_PIX_FMT_SRGGB8:
-	case V4L2_PIX_FMT_SBGGR16:
-	case V4L2_PIX_FMT_SGBRG16:
-	case V4L2_PIX_FMT_SGRBG16:
-	case V4L2_PIX_FMT_SRGGB16:
+	case V4L2_PIX_FMT_SBGGR10:
+	case V4L2_PIX_FMT_SGBRG10:
+	case V4L2_PIX_FMT_SGRBG10:
+	case V4L2_PIX_FMT_SRGGB10:
+	case V4L2_PIX_FMT_SBGGR12:
+	case V4L2_PIX_FMT_SGBRG12:
+	case V4L2_PIX_FMT_SGRBG12:
+	case V4L2_PIX_FMT_SRGGB12:
+	case V4L2_PIX_FMT_SBGGR14:
+	case V4L2_PIX_FMT_SGBRG14:
+	case V4L2_PIX_FMT_SGRBG14:
+	case V4L2_PIX_FMT_SRGGB14:
 		break;
 
 	default:
-- 
Regards,

Laurent Pinchart

