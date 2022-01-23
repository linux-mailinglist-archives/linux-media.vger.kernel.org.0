Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 568DF4972DD
	for <lists+linux-media@lfdr.de>; Sun, 23 Jan 2022 17:09:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238457AbiAWQJ3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 23 Jan 2022 11:09:29 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:42268 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238436AbiAWQJZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 23 Jan 2022 11:09:25 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1026C25E;
        Sun, 23 Jan 2022 17:09:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1642954163;
        bh=T+iFp7uvzgCQ0YDPo4+gQB7BP6eBxcoY4JB0H2R7/MU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GLNg5zGbPBiXGzbKM7/FkdqdzqLKCI0EBtzTh7XQMeyz9q3eiFKG8v4G2HZ17f+jw
         U3VEMan9vWlBQpbMc2RmjosauxFM4ljMKedEPGosQcW1hxZCJhsYxZSylLAPjchFXF
         6wGnwNA+G4lTzRdL1VuaWDsBETJe88Y5RgcETeUo=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Maxime Ripard <mripard@kernel.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: [PATCH 6/6] media: xilinx: csi2rxss: Use mipi-csi2.h
Date:   Sun, 23 Jan 2022 18:08:57 +0200
Message-Id: <20220123160857.24161-7-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220123160857.24161-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20220123160857.24161-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Replace the driver-specific definitions of MIPI CSI-2 data types with
macros from mipi-csi2.h.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../media/platform/xilinx/xilinx-csi2rxss.c   | 106 ++++++++----------
 1 file changed, 45 insertions(+), 61 deletions(-)

diff --git a/drivers/media/platform/xilinx/xilinx-csi2rxss.c b/drivers/media/platform/xilinx/xilinx-csi2rxss.c
index b1baf9d7b6ec..051c60cba1e0 100644
--- a/drivers/media/platform/xilinx/xilinx-csi2rxss.c
+++ b/drivers/media/platform/xilinx/xilinx-csi2rxss.c
@@ -18,6 +18,7 @@
 #include <linux/platform_device.h>
 #include <linux/v4l2-subdev.h>
 #include <media/media-entity.h>
+#include <media/mipi-csi2.h>
 #include <media/v4l2-common.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-fwnode.h>
@@ -115,23 +116,6 @@
 #define XCSI_DEFAULT_WIDTH	1920
 #define XCSI_DEFAULT_HEIGHT	1080
 
-/* MIPI CSI-2 Data Types from spec */
-#define XCSI_DT_YUV4228B	0x1e
-#define XCSI_DT_YUV42210B	0x1f
-#define XCSI_DT_RGB444		0x20
-#define XCSI_DT_RGB555		0x21
-#define XCSI_DT_RGB565		0x22
-#define XCSI_DT_RGB666		0x23
-#define XCSI_DT_RGB888		0x24
-#define XCSI_DT_RAW6		0x28
-#define XCSI_DT_RAW7		0x29
-#define XCSI_DT_RAW8		0x2a
-#define XCSI_DT_RAW10		0x2b
-#define XCSI_DT_RAW12		0x2c
-#define XCSI_DT_RAW14		0x2d
-#define XCSI_DT_RAW16		0x2e
-#define XCSI_DT_RAW20		0x2f
-
 #define XCSI_VCX_START		4
 #define XCSI_MAX_VC		4
 #define XCSI_MAX_VCX		16
@@ -183,32 +167,32 @@ static const struct xcsi2rxss_event xcsi2rxss_events[] = {
  * and media bus formats
  */
 static const u32 xcsi2dt_mbus_lut[][2] = {
-	{ XCSI_DT_YUV4228B, MEDIA_BUS_FMT_UYVY8_1X16 },
-	{ XCSI_DT_YUV42210B, MEDIA_BUS_FMT_UYVY10_1X20 },
-	{ XCSI_DT_RGB444, 0 },
-	{ XCSI_DT_RGB555, 0 },
-	{ XCSI_DT_RGB565, 0 },
-	{ XCSI_DT_RGB666, 0 },
-	{ XCSI_DT_RGB888, MEDIA_BUS_FMT_RBG888_1X24 },
-	{ XCSI_DT_RAW6, 0 },
-	{ XCSI_DT_RAW7, 0 },
-	{ XCSI_DT_RAW8, MEDIA_BUS_FMT_SRGGB8_1X8 },
-	{ XCSI_DT_RAW8, MEDIA_BUS_FMT_SBGGR8_1X8 },
-	{ XCSI_DT_RAW8, MEDIA_BUS_FMT_SGBRG8_1X8 },
-	{ XCSI_DT_RAW8, MEDIA_BUS_FMT_SGRBG8_1X8 },
-	{ XCSI_DT_RAW10, MEDIA_BUS_FMT_SRGGB10_1X10 },
-	{ XCSI_DT_RAW10, MEDIA_BUS_FMT_SBGGR10_1X10 },
-	{ XCSI_DT_RAW10, MEDIA_BUS_FMT_SGBRG10_1X10 },
-	{ XCSI_DT_RAW10, MEDIA_BUS_FMT_SGRBG10_1X10 },
-	{ XCSI_DT_RAW12, MEDIA_BUS_FMT_SRGGB12_1X12 },
-	{ XCSI_DT_RAW12, MEDIA_BUS_FMT_SBGGR12_1X12 },
-	{ XCSI_DT_RAW12, MEDIA_BUS_FMT_SGBRG12_1X12 },
-	{ XCSI_DT_RAW12, MEDIA_BUS_FMT_SGRBG12_1X12 },
-	{ XCSI_DT_RAW16, MEDIA_BUS_FMT_SRGGB16_1X16 },
-	{ XCSI_DT_RAW16, MEDIA_BUS_FMT_SBGGR16_1X16 },
-	{ XCSI_DT_RAW16, MEDIA_BUS_FMT_SGBRG16_1X16 },
-	{ XCSI_DT_RAW16, MEDIA_BUS_FMT_SGRBG16_1X16 },
-	{ XCSI_DT_RAW20, 0 },
+	{ MIPI_CSI2_DT_YUV422_8B, MEDIA_BUS_FMT_UYVY8_1X16 },
+	{ MIPI_CSI2_DT_YUV422_10B, MEDIA_BUS_FMT_UYVY10_1X20 },
+	{ MIPI_CSI2_DT_RGB444, 0 },
+	{ MIPI_CSI2_DT_RGB555, 0 },
+	{ MIPI_CSI2_DT_RGB565, 0 },
+	{ MIPI_CSI2_DT_RGB666, 0 },
+	{ MIPI_CSI2_DT_RGB888, MEDIA_BUS_FMT_RBG888_1X24 },
+	{ MIPI_CSI2_DT_RAW6, 0 },
+	{ MIPI_CSI2_DT_RAW7, 0 },
+	{ MIPI_CSI2_DT_RAW8, MEDIA_BUS_FMT_SRGGB8_1X8 },
+	{ MIPI_CSI2_DT_RAW8, MEDIA_BUS_FMT_SBGGR8_1X8 },
+	{ MIPI_CSI2_DT_RAW8, MEDIA_BUS_FMT_SGBRG8_1X8 },
+	{ MIPI_CSI2_DT_RAW8, MEDIA_BUS_FMT_SGRBG8_1X8 },
+	{ MIPI_CSI2_DT_RAW10, MEDIA_BUS_FMT_SRGGB10_1X10 },
+	{ MIPI_CSI2_DT_RAW10, MEDIA_BUS_FMT_SBGGR10_1X10 },
+	{ MIPI_CSI2_DT_RAW10, MEDIA_BUS_FMT_SGBRG10_1X10 },
+	{ MIPI_CSI2_DT_RAW10, MEDIA_BUS_FMT_SGRBG10_1X10 },
+	{ MIPI_CSI2_DT_RAW12, MEDIA_BUS_FMT_SRGGB12_1X12 },
+	{ MIPI_CSI2_DT_RAW12, MEDIA_BUS_FMT_SBGGR12_1X12 },
+	{ MIPI_CSI2_DT_RAW12, MEDIA_BUS_FMT_SGBRG12_1X12 },
+	{ MIPI_CSI2_DT_RAW12, MEDIA_BUS_FMT_SGRBG12_1X12 },
+	{ MIPI_CSI2_DT_RAW16, MEDIA_BUS_FMT_SRGGB16_1X16 },
+	{ MIPI_CSI2_DT_RAW16, MEDIA_BUS_FMT_SBGGR16_1X16 },
+	{ MIPI_CSI2_DT_RAW16, MEDIA_BUS_FMT_SGBRG16_1X16 },
+	{ MIPI_CSI2_DT_RAW16, MEDIA_BUS_FMT_SGRBG16_1X16 },
+	{ MIPI_CSI2_DT_RAW20, 0 },
 };
 
 /**
@@ -791,7 +775,7 @@ static int xcsi2rxss_set_format(struct v4l2_subdev *sd,
 	 * other RAW, YUV422 8/10 or RGB888, set appropriate media bus format.
 	 */
 	dt = xcsi2rxss_get_dt(fmt->format.code);
-	if (dt != xcsi2rxss->datatype && dt != XCSI_DT_RAW8) {
+	if (dt != xcsi2rxss->datatype && dt != MIPI_CSI2_DT_RAW8) {
 		dev_dbg(xcsi2rxss->dev, "Unsupported media bus format");
 		/* set the default format for the data type */
 		fmt->format.code = xcsi2rxss_get_nth_mbus(xcsi2rxss->datatype,
@@ -823,8 +807,8 @@ static int xcsi2rxss_enum_mbus_code(struct v4l2_subdev *sd,
 	/* RAW8 dt packets are available in all DT configurations */
 	if (code->index < 4) {
 		n = code->index;
-		dt = XCSI_DT_RAW8;
-	} else if (state->datatype != XCSI_DT_RAW8) {
+		dt = MIPI_CSI2_DT_RAW8;
+	} else if (state->datatype != MIPI_CSI2_DT_RAW8) {
 		n = code->index - 4;
 		dt = state->datatype;
 	} else {
@@ -895,22 +879,22 @@ static int xcsi2rxss_parse_of(struct xcsi2rxss_state *xcsi2rxss)
 	}
 
 	switch (xcsi2rxss->datatype) {
-	case XCSI_DT_YUV4228B:
-	case XCSI_DT_RGB444:
-	case XCSI_DT_RGB555:
-	case XCSI_DT_RGB565:
-	case XCSI_DT_RGB666:
-	case XCSI_DT_RGB888:
-	case XCSI_DT_RAW6:
-	case XCSI_DT_RAW7:
-	case XCSI_DT_RAW8:
-	case XCSI_DT_RAW10:
-	case XCSI_DT_RAW12:
-	case XCSI_DT_RAW14:
+	case MIPI_CSI2_DT_YUV422_8B:
+	case MIPI_CSI2_DT_RGB444:
+	case MIPI_CSI2_DT_RGB555:
+	case MIPI_CSI2_DT_RGB565:
+	case MIPI_CSI2_DT_RGB666:
+	case MIPI_CSI2_DT_RGB888:
+	case MIPI_CSI2_DT_RAW6:
+	case MIPI_CSI2_DT_RAW7:
+	case MIPI_CSI2_DT_RAW8:
+	case MIPI_CSI2_DT_RAW10:
+	case MIPI_CSI2_DT_RAW12:
+	case MIPI_CSI2_DT_RAW14:
 		break;
-	case XCSI_DT_YUV42210B:
-	case XCSI_DT_RAW16:
-	case XCSI_DT_RAW20:
+	case MIPI_CSI2_DT_YUV422_10B:
+	case MIPI_CSI2_DT_RAW16:
+	case MIPI_CSI2_DT_RAW20:
 		if (!en_csi_v20) {
 			ret = -EINVAL;
 			dev_dbg(dev, "enable csi v2 for this pixel format");
-- 
Regards,

Laurent Pinchart

