Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C628B2D0842
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 00:55:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728444AbgLFXz0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Dec 2020 18:55:26 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:60444 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728356AbgLFXz0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 6 Dec 2020 18:55:26 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8DD0445D;
        Mon,  7 Dec 2020 00:54:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1607298840;
        bh=NKakrBP9tbnXV3q7HDffXzjsOWC3zitxb2bC9I3Rswo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QwesSDkJW13aN24c1Jy0A2SmP0gZJPfbk1mVbBp77PERUSIZR99v1D3i1gT/CRsVR
         WvUCrnx8M5WJlaHkNfA5rtfuxoaXQS2uC8mFe7ENurfi5louVZJTiwxNid9p3b2GcW
         f+Y9qXnjJw4hNsOridhJar4zfZEvEovfh9t/PEEc=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v3 03/24] media: ti-vpe: cal: Move format handling to cal.c and expose helpers
Date:   Mon,  7 Dec 2020 01:53:32 +0200
Message-Id: <20201206235353.26968-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201206235353.26968-1-laurent.pinchart@ideasonboard.com>
References: <20201206235353.26968-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The cal_formats array contain the description of all formats supported
by the hardware. It's currently used by the V4L2 video device operations
only, but will be needed by the CAMERARX subdev code too. Move it from
cal-video.c to cal.c and add helper functions to access it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal-video.c | 105 +-----------------
 drivers/media/platform/ti-vpe/cal.c       | 127 ++++++++++++++++++++++
 drivers/media/platform/ti-vpe/cal.h       |   5 +
 3 files changed, 134 insertions(+), 103 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
index f57767e79ca5..355bb365daf0 100644
--- a/drivers/media/platform/ti-vpe/cal-video.c
+++ b/drivers/media/platform/ti-vpe/cal-video.c
@@ -26,107 +26,6 @@
 
 #include "cal.h"
 
-/* ------------------------------------------------------------------
- *	Format Handling
- * ------------------------------------------------------------------
- */
-
-static const struct cal_fmt cal_formats[] = {
-	{
-		.fourcc		= V4L2_PIX_FMT_YUYV,
-		.code		= MEDIA_BUS_FMT_YUYV8_2X8,
-		.bpp		= 16,
-	}, {
-		.fourcc		= V4L2_PIX_FMT_UYVY,
-		.code		= MEDIA_BUS_FMT_UYVY8_2X8,
-		.bpp		= 16,
-	}, {
-		.fourcc		= V4L2_PIX_FMT_YVYU,
-		.code		= MEDIA_BUS_FMT_YVYU8_2X8,
-		.bpp		= 16,
-	}, {
-		.fourcc		= V4L2_PIX_FMT_VYUY,
-		.code		= MEDIA_BUS_FMT_VYUY8_2X8,
-		.bpp		= 16,
-	}, {
-		.fourcc		= V4L2_PIX_FMT_RGB565, /* gggbbbbb rrrrrggg */
-		.code		= MEDIA_BUS_FMT_RGB565_2X8_LE,
-		.bpp		= 16,
-	}, {
-		.fourcc		= V4L2_PIX_FMT_RGB565X, /* rrrrrggg gggbbbbb */
-		.code		= MEDIA_BUS_FMT_RGB565_2X8_BE,
-		.bpp		= 16,
-	}, {
-		.fourcc		= V4L2_PIX_FMT_RGB555, /* gggbbbbb arrrrrgg */
-		.code		= MEDIA_BUS_FMT_RGB555_2X8_PADHI_LE,
-		.bpp		= 16,
-	}, {
-		.fourcc		= V4L2_PIX_FMT_RGB555X, /* arrrrrgg gggbbbbb */
-		.code		= MEDIA_BUS_FMT_RGB555_2X8_PADHI_BE,
-		.bpp		= 16,
-	}, {
-		.fourcc		= V4L2_PIX_FMT_RGB24, /* rgb */
-		.code		= MEDIA_BUS_FMT_RGB888_2X12_LE,
-		.bpp		= 24,
-	}, {
-		.fourcc		= V4L2_PIX_FMT_BGR24, /* bgr */
-		.code		= MEDIA_BUS_FMT_RGB888_2X12_BE,
-		.bpp		= 24,
-	}, {
-		.fourcc		= V4L2_PIX_FMT_RGB32, /* argb */
-		.code		= MEDIA_BUS_FMT_ARGB8888_1X32,
-		.bpp		= 32,
-	}, {
-		.fourcc		= V4L2_PIX_FMT_SBGGR8,
-		.code		= MEDIA_BUS_FMT_SBGGR8_1X8,
-		.bpp		= 8,
-	}, {
-		.fourcc		= V4L2_PIX_FMT_SGBRG8,
-		.code		= MEDIA_BUS_FMT_SGBRG8_1X8,
-		.bpp		= 8,
-	}, {
-		.fourcc		= V4L2_PIX_FMT_SGRBG8,
-		.code		= MEDIA_BUS_FMT_SGRBG8_1X8,
-		.bpp		= 8,
-	}, {
-		.fourcc		= V4L2_PIX_FMT_SRGGB8,
-		.code		= MEDIA_BUS_FMT_SRGGB8_1X8,
-		.bpp		= 8,
-	}, {
-		.fourcc		= V4L2_PIX_FMT_SBGGR10,
-		.code		= MEDIA_BUS_FMT_SBGGR10_1X10,
-		.bpp		= 10,
-	}, {
-		.fourcc		= V4L2_PIX_FMT_SGBRG10,
-		.code		= MEDIA_BUS_FMT_SGBRG10_1X10,
-		.bpp		= 10,
-	}, {
-		.fourcc		= V4L2_PIX_FMT_SGRBG10,
-		.code		= MEDIA_BUS_FMT_SGRBG10_1X10,
-		.bpp		= 10,
-	}, {
-		.fourcc		= V4L2_PIX_FMT_SRGGB10,
-		.code		= MEDIA_BUS_FMT_SRGGB10_1X10,
-		.bpp		= 10,
-	}, {
-		.fourcc		= V4L2_PIX_FMT_SBGGR12,
-		.code		= MEDIA_BUS_FMT_SBGGR12_1X12,
-		.bpp		= 12,
-	}, {
-		.fourcc		= V4L2_PIX_FMT_SGBRG12,
-		.code		= MEDIA_BUS_FMT_SGBRG12_1X12,
-		.bpp		= 12,
-	}, {
-		.fourcc		= V4L2_PIX_FMT_SGRBG12,
-		.code		= MEDIA_BUS_FMT_SGRBG12_1X12,
-		.bpp		= 12,
-	}, {
-		.fourcc		= V4L2_PIX_FMT_SRGGB12,
-		.code		= MEDIA_BUS_FMT_SRGGB12_1X12,
-		.bpp		= 12,
-	},
-};
-
 /*  Print Four-character-code (FOURCC) */
 static char *fourcc_to_str(u32 fmt)
 {
@@ -726,7 +625,7 @@ static int cal_ctx_v4l2_init_formats(struct cal_ctx *ctx)
 	int ret = 0;
 
 	/* Enumerate sub device formats and enable all matching local formats */
-	ctx->active_fmt = devm_kcalloc(ctx->cal->dev, ARRAY_SIZE(cal_formats),
+	ctx->active_fmt = devm_kcalloc(ctx->cal->dev, cal_num_formats,
 				       sizeof(*ctx->active_fmt), GFP_KERNEL);
 	ctx->num_active_fmt = 0;
 
@@ -744,7 +643,7 @@ static int cal_ctx_v4l2_init_formats(struct cal_ctx *ctx)
 			"subdev %s: code: %04x idx: %u\n",
 			ctx->phy->sensor->name, mbus_code.code, j);
 
-		for (k = 0; k < ARRAY_SIZE(cal_formats); k++) {
+		for (k = 0; k < cal_num_formats; k++) {
 			const struct cal_fmt *fmt = &cal_formats[k];
 
 			if (mbus_code.code == fmt->code) {
diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 34a344b7f08a..b9ee535513e8 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -43,6 +43,133 @@ unsigned int cal_debug;
 module_param_named(debug, cal_debug, uint, 0644);
 MODULE_PARM_DESC(debug, "activates debug info");
 
+/* ------------------------------------------------------------------
+ *	Format Handling
+ * ------------------------------------------------------------------
+ */
+
+const struct cal_fmt cal_formats[] = {
+	{
+		.fourcc		= V4L2_PIX_FMT_YUYV,
+		.code		= MEDIA_BUS_FMT_YUYV8_2X8,
+		.bpp		= 16,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_UYVY,
+		.code		= MEDIA_BUS_FMT_UYVY8_2X8,
+		.bpp		= 16,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_YVYU,
+		.code		= MEDIA_BUS_FMT_YVYU8_2X8,
+		.bpp		= 16,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_VYUY,
+		.code		= MEDIA_BUS_FMT_VYUY8_2X8,
+		.bpp		= 16,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_RGB565, /* gggbbbbb rrrrrggg */
+		.code		= MEDIA_BUS_FMT_RGB565_2X8_LE,
+		.bpp		= 16,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_RGB565X, /* rrrrrggg gggbbbbb */
+		.code		= MEDIA_BUS_FMT_RGB565_2X8_BE,
+		.bpp		= 16,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_RGB555, /* gggbbbbb arrrrrgg */
+		.code		= MEDIA_BUS_FMT_RGB555_2X8_PADHI_LE,
+		.bpp		= 16,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_RGB555X, /* arrrrrgg gggbbbbb */
+		.code		= MEDIA_BUS_FMT_RGB555_2X8_PADHI_BE,
+		.bpp		= 16,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_RGB24, /* rgb */
+		.code		= MEDIA_BUS_FMT_RGB888_2X12_LE,
+		.bpp		= 24,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_BGR24, /* bgr */
+		.code		= MEDIA_BUS_FMT_RGB888_2X12_BE,
+		.bpp		= 24,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_RGB32, /* argb */
+		.code		= MEDIA_BUS_FMT_ARGB8888_1X32,
+		.bpp		= 32,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_SBGGR8,
+		.code		= MEDIA_BUS_FMT_SBGGR8_1X8,
+		.bpp		= 8,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_SGBRG8,
+		.code		= MEDIA_BUS_FMT_SGBRG8_1X8,
+		.bpp		= 8,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_SGRBG8,
+		.code		= MEDIA_BUS_FMT_SGRBG8_1X8,
+		.bpp		= 8,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_SRGGB8,
+		.code		= MEDIA_BUS_FMT_SRGGB8_1X8,
+		.bpp		= 8,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_SBGGR10,
+		.code		= MEDIA_BUS_FMT_SBGGR10_1X10,
+		.bpp		= 10,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_SGBRG10,
+		.code		= MEDIA_BUS_FMT_SGBRG10_1X10,
+		.bpp		= 10,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_SGRBG10,
+		.code		= MEDIA_BUS_FMT_SGRBG10_1X10,
+		.bpp		= 10,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_SRGGB10,
+		.code		= MEDIA_BUS_FMT_SRGGB10_1X10,
+		.bpp		= 10,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_SBGGR12,
+		.code		= MEDIA_BUS_FMT_SBGGR12_1X12,
+		.bpp		= 12,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_SGBRG12,
+		.code		= MEDIA_BUS_FMT_SGBRG12_1X12,
+		.bpp		= 12,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_SGRBG12,
+		.code		= MEDIA_BUS_FMT_SGRBG12_1X12,
+		.bpp		= 12,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_SRGGB12,
+		.code		= MEDIA_BUS_FMT_SRGGB12_1X12,
+		.bpp		= 12,
+	},
+};
+
+const unsigned int cal_num_formats = ARRAY_SIZE(cal_formats);
+
+const struct cal_fmt *cal_format_by_fourcc(u32 fourcc)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(cal_formats); ++i) {
+		if (cal_formats[i].fourcc == fourcc)
+			return &cal_formats[i];
+	}
+
+	return NULL;
+}
+
+const struct cal_fmt *cal_format_by_code(u32 code)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(cal_formats); ++i) {
+		if (cal_formats[i].code == code)
+			return &cal_formats[i];
+	}
+
+	return NULL;
+}
+
 /* ------------------------------------------------------------------
  *	Platform Data
  * ------------------------------------------------------------------
diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
index 955dacd878e7..6e6bdf8af3d0 100644
--- a/drivers/media/platform/ti-vpe/cal.h
+++ b/drivers/media/platform/ti-vpe/cal.h
@@ -244,6 +244,11 @@ static inline void cal_set_field(u32 *valp, u32 field, u32 mask)
 	*valp = val;
 }
 
+extern const struct cal_fmt cal_formats[];
+extern const unsigned int cal_num_formats;
+const struct cal_fmt *cal_format_by_fourcc(u32 fourcc);
+const struct cal_fmt *cal_format_by_code(u32 code);
+
 void cal_quickdump_regs(struct cal_dev *cal);
 
 void cal_camerarx_disable(struct cal_camerarx *phy);
-- 
Regards,

Laurent Pinchart

