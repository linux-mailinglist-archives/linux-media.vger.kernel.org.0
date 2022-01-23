Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 608944972D8
	for <lists+linux-media@lfdr.de>; Sun, 23 Jan 2022 17:09:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229718AbiAWQJ1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 23 Jan 2022 11:09:27 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:42268 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238438AbiAWQJX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 23 Jan 2022 11:09:23 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1DCC41802;
        Sun, 23 Jan 2022 17:09:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1642954161;
        bh=8zXSTyo0w55cNX/5DUjqv0l5yDmNrCvW4YAycplnZcY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UszM4l8qBG7Ryz7J5jYwm1k4JlNDhsV6Pwu0dCYEo8Ek19TGXBHLeJB1hS13QJmYQ
         R6kpkKJPVp/MSHqqYizqyHgTke0uDs0fCn9kmwRK2UCngJ1+DlEHh/JHBaL9N4epf8
         KNjCwZ4ehvTvjJCksRXCjSyScj7OaSt+whJo7Mo0=
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
Subject: [PATCH 4/6] media: rcar-csi2: Use mipi-csi2.h
Date:   Sun, 23 Jan 2022 18:08:55 +0200
Message-Id: <20220123160857.24161-5-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220123160857.24161-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20220123160857.24161-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Replace the hardcoded MIPI CSI-2 data types with macros from
mipi-csi2.h.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/rcar-vin/rcar-csi2.c | 57 +++++++++++++++++----
 1 file changed, 46 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index 8c939cb3073d..93df9a5e3d80 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -17,6 +17,7 @@
 #include <linux/reset.h>
 #include <linux/sys_soc.h>
 
+#include <media/mipi-csi2.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
@@ -412,17 +413,51 @@ struct rcar_csi2_format {
 };
 
 static const struct rcar_csi2_format rcar_csi2_formats[] = {
-	{ .code = MEDIA_BUS_FMT_RGB888_1X24,	.datatype = 0x24, .bpp = 24 },
-	{ .code = MEDIA_BUS_FMT_UYVY8_1X16,	.datatype = 0x1e, .bpp = 16 },
-	{ .code = MEDIA_BUS_FMT_YUYV8_1X16,	.datatype = 0x1e, .bpp = 16 },
-	{ .code = MEDIA_BUS_FMT_UYVY8_2X8,	.datatype = 0x1e, .bpp = 16 },
-	{ .code = MEDIA_BUS_FMT_YUYV10_2X10,	.datatype = 0x1e, .bpp = 20 },
-	{ .code = MEDIA_BUS_FMT_Y10_1X10,	.datatype = 0x2b, .bpp = 10 },
-	{ .code = MEDIA_BUS_FMT_SBGGR8_1X8,     .datatype = 0x2a, .bpp = 8 },
-	{ .code = MEDIA_BUS_FMT_SGBRG8_1X8,     .datatype = 0x2a, .bpp = 8 },
-	{ .code = MEDIA_BUS_FMT_SGRBG8_1X8,     .datatype = 0x2a, .bpp = 8 },
-	{ .code = MEDIA_BUS_FMT_SRGGB8_1X8,     .datatype = 0x2a, .bpp = 8 },
-	{ .code = MEDIA_BUS_FMT_Y8_1X8,		.datatype = 0x2a, .bpp = 8 },
+	{
+		.code = MEDIA_BUS_FMT_RGB888_1X24,
+		.datatype = MIPI_CSI2_DT_RGB888,
+		.bpp = 24,
+	}, {
+		.code = MEDIA_BUS_FMT_UYVY8_1X16,
+		.datatype = MIPI_CSI2_DT_YUV422_8B,
+		.bpp = 16,
+	}, {
+		.code = MEDIA_BUS_FMT_YUYV8_1X16,
+		.datatype = MIPI_CSI2_DT_YUV422_8B,
+		.bpp = 16,
+	}, {
+		.code = MEDIA_BUS_FMT_UYVY8_2X8,
+		.datatype = MIPI_CSI2_DT_YUV422_8B,
+		.bpp = 16,
+	}, {
+		.code = MEDIA_BUS_FMT_YUYV10_2X10,
+		.datatype = MIPI_CSI2_DT_YUV422_8B,
+		.bpp = 20,
+	}, {
+		.code = MEDIA_BUS_FMT_Y10_1X10,
+		.datatype = MIPI_CSI2_DT_RAW10,
+		.bpp = 10,
+	}, {
+		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
+		.datatype = MIPI_CSI2_DT_RAW8,
+		.bpp = 8,
+	}, {
+		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
+		.datatype = MIPI_CSI2_DT_RAW8,
+		.bpp = 8,
+	}, {
+		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
+		.datatype = MIPI_CSI2_DT_RAW8,
+		.bpp = 8,
+	}, {
+		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
+		.datatype = MIPI_CSI2_DT_RAW8,
+		.bpp = 8,
+	}, {
+		.code = MEDIA_BUS_FMT_Y8_1X8,
+		.datatype = MIPI_CSI2_DT_RAW8,
+		.bpp = 8,
+	},
 };
 
 static const struct rcar_csi2_format *rcsi2_code_to_fmt(unsigned int code)
-- 
Regards,

Laurent Pinchart

