Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 484B24972DA
	for <lists+linux-media@lfdr.de>; Sun, 23 Jan 2022 17:09:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238451AbiAWQJZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 23 Jan 2022 11:09:25 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:42248 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234211AbiAWQJX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 23 Jan 2022 11:09:23 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2AABF1253;
        Sun, 23 Jan 2022 17:09:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1642954160;
        bh=3geSuoEz6g+fTciggs4nXwS8/gLrJ4EqA6eox6uSlLg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YjqVuEhBKqsOdZkebLJrEzUIU6CK1n68nea6o7rGW2rG3A60q8k1oqKa4v/nK4/Y4
         lKo4eaCKrt9Lhq6cWRG7xP0ZOH8gK0BCa92nheoEGwqtwmDspOhhDWU9enNJjVBWb2
         BfegWCOyN7a6lIxObQht4vjjnEHmjQe9n7FJ33l4=
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
Subject: [PATCH 3/6] media: rcar-isp: Use mipi-csi2.h
Date:   Sun, 23 Jan 2022 18:08:54 +0200
Message-Id: <20220123160857.24161-4-laurent.pinchart+renesas@ideasonboard.com>
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
 drivers/media/platform/rcar-isp.c | 32 +++++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/rcar-isp.c b/drivers/media/platform/rcar-isp.c
index 2ffab30bc011..10b3474f93a4 100644
--- a/drivers/media/platform/rcar-isp.c
+++ b/drivers/media/platform/rcar-isp.c
@@ -17,6 +17,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 
+#include <media/mipi-csi2.h>
 #include <media/v4l2-subdev.h>
 
 #define ISPINPUTSEL0_REG				0x0008
@@ -51,12 +52,31 @@ struct rcar_isp_format {
 };
 
 static const struct rcar_isp_format rcar_isp_formats[] = {
-	{ .code = MEDIA_BUS_FMT_RGB888_1X24,	.datatype = 0x24, .procmode = 0x15 },
-	{ .code = MEDIA_BUS_FMT_Y10_1X10,	.datatype = 0x2b, .procmode = 0x10 },
-	{ .code = MEDIA_BUS_FMT_UYVY8_1X16,	.datatype = 0x1e, .procmode = 0x0c },
-	{ .code = MEDIA_BUS_FMT_YUYV8_1X16,	.datatype = 0x1e, .procmode = 0x0c },
-	{ .code = MEDIA_BUS_FMT_UYVY8_2X8,	.datatype = 0x1e, .procmode = 0x0c },
-	{ .code = MEDIA_BUS_FMT_YUYV10_2X10,	.datatype = 0x1e, .procmode = 0x0c },
+	{
+		.code = MEDIA_BUS_FMT_RGB888_1X24,
+		.datatype = MIPI_CSI2_DT_RGB888,
+		.procmode = 0x15
+	}, {
+		.code = MEDIA_BUS_FMT_Y10_1X10,
+		.datatype = MIPI_CSI2_DT_RAW10,
+		.procmode = 0x10,
+	}, {
+		.code = MEDIA_BUS_FMT_UYVY8_1X16,
+		.datatype = MIPI_CSI2_DT_YUV422_8B,
+		.procmode = 0x0c,
+	}, {
+		.code = MEDIA_BUS_FMT_YUYV8_1X16,
+		.datatype = MIPI_CSI2_DT_YUV422_8B,
+		.procmode = 0x0c,
+	}, {
+		.code = MEDIA_BUS_FMT_UYVY8_2X8,
+		.datatype = MIPI_CSI2_DT_YUV422_8B,
+		.procmode = 0x0c,
+	}, {
+		.code = MEDIA_BUS_FMT_YUYV10_2X10,
+		.datatype = MIPI_CSI2_DT_YUV422_8B,
+		.procmode = 0x0c,
+	},
 };
 
 static const struct rcar_isp_format *risp_code_to_fmt(unsigned int code)
-- 
Regards,

Laurent Pinchart

