Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CCFD4972DC
	for <lists+linux-media@lfdr.de>; Sun, 23 Jan 2022 17:09:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238446AbiAWQJ2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 23 Jan 2022 11:09:28 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:42248 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238441AbiAWQJY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 23 Jan 2022 11:09:24 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 121E9D41;
        Sun, 23 Jan 2022 17:09:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1642954162;
        bh=TuRKsjCOnxhsH9BECH3kujEZnN0z3Ze5w0iaGdTsjYo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jaxr3MmNVA7FId5zG6dSQD8bOi6h9VArjpX+NB0HYjArEEs5BHeF06M7KIx9n4XAs
         IsFoJ/xp9+bZYMR5lKgZOAbcbcL2wGthE2EcjXuemS+bsArRJ4XcXFDWp9l/YYu9jh
         TFfbsuxUiHoC70Uj82JbJkSEtsxi2ELMRMBlUEyc=
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
Subject: [PATCH 5/6] media: rockchip: rkisp1: Use mipi-csi2.h
Date:   Sun, 23 Jan 2022 18:08:56 +0200
Message-Id: <20220123160857.24161-6-laurent.pinchart+renesas@ideasonboard.com>
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
 .../platform/rockchip/rkisp1/rkisp1-isp.c     | 34 ++++++++++---------
 .../platform/rockchip/rkisp1/rkisp1-regs.h    | 11 ------
 2 files changed, 18 insertions(+), 27 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index 2a35bf24e54e..4415c7248c2f 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -14,6 +14,8 @@
 #include <linux/pm_runtime.h>
 #include <linux/videodev2.h>
 #include <linux/vmalloc.h>
+
+#include <media/mipi-csi2.h>
 #include <media/v4l2-event.h>
 
 #include "rkisp1-common.h"
@@ -62,112 +64,112 @@ static const struct rkisp1_isp_mbus_info rkisp1_isp_formats[] = {
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_SRGGB10_1X10,
 		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
-		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW10,
+		.mipi_dt	= MIPI_CSI2_DT_RAW10,
 		.bayer_pat	= RKISP1_RAW_RGGB,
 		.bus_width	= 10,
 		.direction	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_SBGGR10_1X10,
 		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
-		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW10,
+		.mipi_dt	= MIPI_CSI2_DT_RAW10,
 		.bayer_pat	= RKISP1_RAW_BGGR,
 		.bus_width	= 10,
 		.direction	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_SGBRG10_1X10,
 		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
-		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW10,
+		.mipi_dt	= MIPI_CSI2_DT_RAW10,
 		.bayer_pat	= RKISP1_RAW_GBRG,
 		.bus_width	= 10,
 		.direction	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_SGRBG10_1X10,
 		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
-		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW10,
+		.mipi_dt	= MIPI_CSI2_DT_RAW10,
 		.bayer_pat	= RKISP1_RAW_GRBG,
 		.bus_width	= 10,
 		.direction	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_SRGGB12_1X12,
 		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
-		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW12,
+		.mipi_dt	= MIPI_CSI2_DT_RAW12,
 		.bayer_pat	= RKISP1_RAW_RGGB,
 		.bus_width	= 12,
 		.direction	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_SBGGR12_1X12,
 		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
-		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW12,
+		.mipi_dt	= MIPI_CSI2_DT_RAW12,
 		.bayer_pat	= RKISP1_RAW_BGGR,
 		.bus_width	= 12,
 		.direction	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_SGBRG12_1X12,
 		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
-		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW12,
+		.mipi_dt	= MIPI_CSI2_DT_RAW12,
 		.bayer_pat	= RKISP1_RAW_GBRG,
 		.bus_width	= 12,
 		.direction	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_SGRBG12_1X12,
 		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
-		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW12,
+		.mipi_dt	= MIPI_CSI2_DT_RAW12,
 		.bayer_pat	= RKISP1_RAW_GRBG,
 		.bus_width	= 12,
 		.direction	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_SRGGB8_1X8,
 		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
-		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW8,
+		.mipi_dt	= MIPI_CSI2_DT_RAW8,
 		.bayer_pat	= RKISP1_RAW_RGGB,
 		.bus_width	= 8,
 		.direction	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_SBGGR8_1X8,
 		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
-		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW8,
+		.mipi_dt	= MIPI_CSI2_DT_RAW8,
 		.bayer_pat	= RKISP1_RAW_BGGR,
 		.bus_width	= 8,
 		.direction	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_SGBRG8_1X8,
 		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
-		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW8,
+		.mipi_dt	= MIPI_CSI2_DT_RAW8,
 		.bayer_pat	= RKISP1_RAW_GBRG,
 		.bus_width	= 8,
 		.direction	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_SGRBG8_1X8,
 		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
-		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW8,
+		.mipi_dt	= MIPI_CSI2_DT_RAW8,
 		.bayer_pat	= RKISP1_RAW_GRBG,
 		.bus_width	= 8,
 		.direction	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_YUYV8_1X16,
 		.pixel_enc	= V4L2_PIXEL_ENC_YUV,
-		.mipi_dt	= RKISP1_CIF_CSI2_DT_YUV422_8b,
+		.mipi_dt	= MIPI_CSI2_DT_YUV422_8B,
 		.yuv_seq	= RKISP1_CIF_ISP_ACQ_PROP_YCBYCR,
 		.bus_width	= 16,
 		.direction	= RKISP1_ISP_SD_SINK,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_YVYU8_1X16,
 		.pixel_enc	= V4L2_PIXEL_ENC_YUV,
-		.mipi_dt	= RKISP1_CIF_CSI2_DT_YUV422_8b,
+		.mipi_dt	= MIPI_CSI2_DT_YUV422_8B,
 		.yuv_seq	= RKISP1_CIF_ISP_ACQ_PROP_YCRYCB,
 		.bus_width	= 16,
 		.direction	= RKISP1_ISP_SD_SINK,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_UYVY8_1X16,
 		.pixel_enc	= V4L2_PIXEL_ENC_YUV,
-		.mipi_dt	= RKISP1_CIF_CSI2_DT_YUV422_8b,
+		.mipi_dt	= MIPI_CSI2_DT_YUV422_8B,
 		.yuv_seq	= RKISP1_CIF_ISP_ACQ_PROP_CBYCRY,
 		.bus_width	= 16,
 		.direction	= RKISP1_ISP_SD_SINK,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_VYUY8_1X16,
 		.pixel_enc	= V4L2_PIXEL_ENC_YUV,
-		.mipi_dt	= RKISP1_CIF_CSI2_DT_YUV422_8b,
+		.mipi_dt	= MIPI_CSI2_DT_YUV422_8B,
 		.yuv_seq	= RKISP1_CIF_ISP_ACQ_PROP_CRYCBY,
 		.bus_width	= 16,
 		.direction	= RKISP1_ISP_SD_SINK,
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
index d326214c7e07..82f8d33d98b3 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
@@ -333,17 +333,6 @@
 /* MIPI_DATA_SEL */
 #define RKISP1_CIF_MIPI_DATA_SEL_VC(a)			(((a) & 0x3) << 6)
 #define RKISP1_CIF_MIPI_DATA_SEL_DT(a)			(((a) & 0x3F) << 0)
-/* MIPI DATA_TYPE */
-#define RKISP1_CIF_CSI2_DT_YUV420_8b			0x18
-#define RKISP1_CIF_CSI2_DT_YUV420_10b			0x19
-#define RKISP1_CIF_CSI2_DT_YUV422_8b			0x1E
-#define RKISP1_CIF_CSI2_DT_YUV422_10b			0x1F
-#define RKISP1_CIF_CSI2_DT_RGB565			0x22
-#define RKISP1_CIF_CSI2_DT_RGB666			0x23
-#define RKISP1_CIF_CSI2_DT_RGB888			0x24
-#define RKISP1_CIF_CSI2_DT_RAW8				0x2A
-#define RKISP1_CIF_CSI2_DT_RAW10			0x2B
-#define RKISP1_CIF_CSI2_DT_RAW12			0x2C
 
 /* MIPI_IMSC, MIPI_RIS, MIPI_MIS, MIPI_ICR, MIPI_ISR */
 #define RKISP1_CIF_MIPI_SYNC_FIFO_OVFLW(a)		(((a) & 0xF) << 0)
-- 
Regards,

Laurent Pinchart

