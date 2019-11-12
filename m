Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D90CAF934F
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2019 15:52:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727659AbfKLOwY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Nov 2019 09:52:24 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:43606 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727164AbfKLOu6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Nov 2019 09:50:58 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xACEoskZ052192;
        Tue, 12 Nov 2019 08:50:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573570254;
        bh=HGUos+luy2mHX2awq1qkiRaaCxsuIOrx5Abo8eh8ShI=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=rPFNKKKIi4j2ZsYC5jPLputGVXUTVxCF0Tqs5i9EDRNsBedyEYnHsGsUTjoFNaVGH
         9xXhj3/vdVtHGeHFre9ToKqeTmEZVzlNM4k8UboAgO273Q89l9fmADQ+Uigr1RRM8e
         /iNQssboxCsjd/i0jB3XMp7IO9bGA3vS55MnxCK8=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xACEosCr070395;
        Tue, 12 Nov 2019 08:50:54 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 12
 Nov 2019 08:50:54 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 12 Nov 2019 08:50:36 -0600
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xACEoket068428;
        Tue, 12 Nov 2019 08:50:54 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [RESEND Patch v3 09/20] media: ti-vpe: cal: Fix ths_term/ths_settle parameters
Date:   Tue, 12 Nov 2019 08:53:36 -0600
Message-ID: <20191112145347.23519-10-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191112145347.23519-1-bparrot@ti.com>
References: <20191112145347.23519-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The current method to calculate the ddr clk period is wrong.
Therefore the ths_term calculation is incorrect.
Also it was wrongly assumed that the ths_settle parameter
was based on the control clock instead of the pixel clock.

Since the DPHY can tolerate quite a bit a of variation,
capture was still mostly working with the 2 tested modes
when the pixel clock was close to the control clock
(i.e. 96 Mhz). But it would quickly stops working when
using different modes or when customers used different
sensors altogether.

Calculating the DDRClk period needs to take into account
the pixel bit width and the number of active data lanes.

Based on the latest technical reference manual these
parameters should now be calculated as follows:

THS_TERM: Programmed value = floor(20 ns/DDRClk period)
THS_SETTLE: Programmed value = floor(105 ns/DDRClk period) + 4

Also originally 'depth' was used to represent the number of
bits a pixel would use once stored in memory (i.e. the
container size). To accurately calculate the THS_* parameters
we need to use the actual number of bits per pixels coming
in from the sensor. So we are renaming 'depth' to 'bpp' (bits
per pixels) and update the format table to show the actual
number of bits per pixel being received.

The "container" size will be derived from the "bpp" value.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 98 +++++++++++++----------------
 1 file changed, 44 insertions(+), 54 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 3b04aff6c778..51edc7bc3135 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -73,8 +73,6 @@ static const struct v4l2_fract
 #define CAL_NUM_INPUT 1
 #define CAL_NUM_CONTEXT 2
 
-#define bytes_per_line(pixel, bpp) (ALIGN(pixel * bpp, 16))
-
 #define reg_read(dev, offset) ioread32(dev->base + offset)
 #define reg_write(dev, offset, val) iowrite32(val, dev->base + offset)
 
@@ -93,102 +91,103 @@ static const struct v4l2_fract
 struct cal_fmt {
 	u32	fourcc;
 	u32	code;
-	u8	depth;
+	/* Bits per pixel */
+	u8	bpp;
 };
 
 static struct cal_fmt cal_formats[] = {
 	{
 		.fourcc		= V4L2_PIX_FMT_YUYV,
 		.code		= MEDIA_BUS_FMT_YUYV8_2X8,
-		.depth		= 16,
+		.bpp		= 16,
 	}, {
 		.fourcc		= V4L2_PIX_FMT_UYVY,
 		.code		= MEDIA_BUS_FMT_UYVY8_2X8,
-		.depth		= 16,
+		.bpp		= 16,
 	}, {
 		.fourcc		= V4L2_PIX_FMT_YVYU,
 		.code		= MEDIA_BUS_FMT_YVYU8_2X8,
-		.depth		= 16,
+		.bpp		= 16,
 	}, {
 		.fourcc		= V4L2_PIX_FMT_VYUY,
 		.code		= MEDIA_BUS_FMT_VYUY8_2X8,
-		.depth		= 16,
+		.bpp		= 16,
 	}, {
 		.fourcc		= V4L2_PIX_FMT_RGB565, /* gggbbbbb rrrrrggg */
 		.code		= MEDIA_BUS_FMT_RGB565_2X8_LE,
-		.depth		= 16,
+		.bpp		= 16,
 	}, {
 		.fourcc		= V4L2_PIX_FMT_RGB565X, /* rrrrrggg gggbbbbb */
 		.code		= MEDIA_BUS_FMT_RGB565_2X8_BE,
-		.depth		= 16,
+		.bpp		= 16,
 	}, {
 		.fourcc		= V4L2_PIX_FMT_RGB555, /* gggbbbbb arrrrrgg */
 		.code		= MEDIA_BUS_FMT_RGB555_2X8_PADHI_LE,
-		.depth		= 16,
+		.bpp		= 16,
 	}, {
 		.fourcc		= V4L2_PIX_FMT_RGB555X, /* arrrrrgg gggbbbbb */
 		.code		= MEDIA_BUS_FMT_RGB555_2X8_PADHI_BE,
-		.depth		= 16,
+		.bpp		= 16,
 	}, {
 		.fourcc		= V4L2_PIX_FMT_RGB24, /* rgb */
 		.code		= MEDIA_BUS_FMT_RGB888_2X12_LE,
-		.depth		= 24,
+		.bpp		= 24,
 	}, {
 		.fourcc		= V4L2_PIX_FMT_BGR24, /* bgr */
 		.code		= MEDIA_BUS_FMT_RGB888_2X12_BE,
-		.depth		= 24,
+		.bpp		= 24,
 	}, {
 		.fourcc		= V4L2_PIX_FMT_RGB32, /* argb */
 		.code		= MEDIA_BUS_FMT_ARGB8888_1X32,
-		.depth		= 32,
+		.bpp		= 32,
 	}, {
 		.fourcc		= V4L2_PIX_FMT_SBGGR8,
 		.code		= MEDIA_BUS_FMT_SBGGR8_1X8,
-		.depth		= 8,
+		.bpp		= 8,
 	}, {
 		.fourcc		= V4L2_PIX_FMT_SGBRG8,
 		.code		= MEDIA_BUS_FMT_SGBRG8_1X8,
-		.depth		= 8,
+		.bpp		= 8,
 	}, {
 		.fourcc		= V4L2_PIX_FMT_SGRBG8,
 		.code		= MEDIA_BUS_FMT_SGRBG8_1X8,
-		.depth		= 8,
+		.bpp		= 8,
 	}, {
 		.fourcc		= V4L2_PIX_FMT_SRGGB8,
 		.code		= MEDIA_BUS_FMT_SRGGB8_1X8,
-		.depth		= 8,
+		.bpp		= 8,
 	}, {
 		.fourcc		= V4L2_PIX_FMT_SBGGR10,
 		.code		= MEDIA_BUS_FMT_SBGGR10_1X10,
-		.depth		= 16,
+		.bpp		= 10,
 	}, {
 		.fourcc		= V4L2_PIX_FMT_SGBRG10,
 		.code		= MEDIA_BUS_FMT_SGBRG10_1X10,
-		.depth		= 16,
+		.bpp		= 10,
 	}, {
 		.fourcc		= V4L2_PIX_FMT_SGRBG10,
 		.code		= MEDIA_BUS_FMT_SGRBG10_1X10,
-		.depth		= 16,
+		.bpp		= 10,
 	}, {
 		.fourcc		= V4L2_PIX_FMT_SRGGB10,
 		.code		= MEDIA_BUS_FMT_SRGGB10_1X10,
-		.depth		= 16,
+		.bpp		= 10,
 	}, {
 		.fourcc		= V4L2_PIX_FMT_SBGGR12,
 		.code		= MEDIA_BUS_FMT_SBGGR12_1X12,
-		.depth		= 16,
+		.bpp		= 12,
 	}, {
 		.fourcc		= V4L2_PIX_FMT_SGBRG12,
 		.code		= MEDIA_BUS_FMT_SGBRG12_1X12,
-		.depth		= 16,
+		.bpp		= 12,
 	}, {
 		.fourcc		= V4L2_PIX_FMT_SGRBG12,
 		.code		= MEDIA_BUS_FMT_SGRBG12_1X12,
-		.depth		= 16,
+		.bpp		= 12,
 	}, {
 		.fourcc		= V4L2_PIX_FMT_SRGGB12,
 		.code		= MEDIA_BUS_FMT_SRGGB12_1X12,
-		.depth		= 16,
+		.bpp		= 12,
 	},
 };
 
@@ -870,41 +869,28 @@ static void cal_wr_dma_addr(struct cal_ctx *ctx, unsigned int dmaaddr)
 #define TCLK_TERM	0
 #define TCLK_MISS	1
 #define TCLK_SETTLE	14
-#define THS_SETTLE	15
 
 static void csi2_phy_config(struct cal_ctx *ctx)
 {
 	unsigned int reg0, reg1;
 	unsigned int ths_term, ths_settle;
-	unsigned int ddrclkperiod_us;
+	unsigned int csi2_ddrclk_khz;
+	struct v4l2_fwnode_bus_mipi_csi2 *mipi_csi2 =
+			&ctx->endpoint.bus.mipi_csi2;
+	u32 num_lanes = mipi_csi2->num_data_lanes;
 
-	/*
-	 * THS_TERM: Programmed value = floor(20 ns/DDRClk period) - 2.
-	 */
-	ddrclkperiod_us = ctx->external_rate / 2000000;
-	ddrclkperiod_us = 1000000 / ddrclkperiod_us;
-	ctx_dbg(1, ctx, "ddrclkperiod_us: %d\n", ddrclkperiod_us);
+	/* DPHY timing configuration */
+	/* CSI-2 is DDR and we only count used lanes. */
+	csi2_ddrclk_khz = ctx->external_rate / 1000
+		/ (2 * num_lanes) * ctx->fmt->bpp;
+	ctx_dbg(1, ctx, "csi2_ddrclk_khz: %d\n", csi2_ddrclk_khz);
 
-	ths_term = 20000 / ddrclkperiod_us;
-	ths_term = (ths_term >= 2) ? ths_term - 2 : ths_term;
+	/* THS_TERM: Programmed value = floor(20 ns/DDRClk period) */
+	ths_term = 20 * csi2_ddrclk_khz / 1000000;
 	ctx_dbg(1, ctx, "ths_term: %d (0x%02x)\n", ths_term, ths_term);
 
-	/*
-	 * THS_SETTLE: Programmed value = floor(176.3 ns/CtrlClk period) - 1.
-	 *	Since CtrlClk is fixed at 96Mhz then we get
-	 *	ths_settle = floor(176.3 / 10.416) - 1 = 15
-	 * If we ever switch to a dynamic clock then this code might be useful
-	 *
-	 * unsigned int ctrlclkperiod_us;
-	 * ctrlclkperiod_us = 96000000 / 1000000;
-	 * ctrlclkperiod_us = 1000000 / ctrlclkperiod_us;
-	 * ctx_dbg(1, ctx, "ctrlclkperiod_us: %d\n", ctrlclkperiod_us);
-
-	 * ths_settle = 176300  / ctrlclkperiod_us;
-	 * ths_settle = (ths_settle > 1) ? ths_settle - 1 : ths_settle;
-	 */
-
-	ths_settle = THS_SETTLE;
+	/* THS_SETTLE: Programmed value = floor(105 ns/DDRClk period) + 4 */
+	ths_settle = (105 * csi2_ddrclk_khz / 1000000) + 4;
 	ctx_dbg(1, ctx, "ths_settle: %d (0x%02x)\n", ths_settle, ths_settle);
 
 	reg0 = reg_read(ctx->cc, CAL_CSI2_PHY_REG0);
@@ -1116,6 +1102,8 @@ static int cal_calc_format_size(struct cal_ctx *ctx,
 				const struct cal_fmt *fmt,
 				struct v4l2_format *f)
 {
+	u32 bpl;
+
 	if (!fmt) {
 		ctx_dbg(3, ctx, "No cal_fmt provided!\n");
 		return -EINVAL;
@@ -1123,8 +1111,10 @@ static int cal_calc_format_size(struct cal_ctx *ctx,
 
 	v4l_bound_align_image(&f->fmt.pix.width, 48, MAX_WIDTH, 2,
 			      &f->fmt.pix.height, 32, MAX_HEIGHT, 0, 0);
-	f->fmt.pix.bytesperline = bytes_per_line(f->fmt.pix.width,
-						 fmt->depth >> 3);
+
+	bpl = (f->fmt.pix.width * ALIGN(fmt->bpp, 8)) >> 3;
+	f->fmt.pix.bytesperline = ALIGN(bpl, 16);
+
 	f->fmt.pix.sizeimage = f->fmt.pix.height *
 			       f->fmt.pix.bytesperline;
 
-- 
2.17.1

