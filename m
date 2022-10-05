Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADEE35F5A5E
	for <lists+linux-media@lfdr.de>; Wed,  5 Oct 2022 21:07:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230131AbiJETHA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Oct 2022 15:07:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231361AbiJETG5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Oct 2022 15:06:57 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ED277FFB6
        for <linux-media@vger.kernel.org>; Wed,  5 Oct 2022 12:06:51 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 34322FF812;
        Wed,  5 Oct 2022 19:06:44 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     =?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org
Subject: [PATCH 04/10] media: ar0521: Rework PLL computation
Date:   Wed,  5 Oct 2022 21:06:07 +0200
Message-Id: <20221005190613.394277-5-jacopo@jmondi.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221005190613.394277-1-jacopo@jmondi.org>
References: <20221005190613.394277-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rework the PLL computation procedure to take into account the currently
configured format bpp and the number of data lanes.

Comment the PLL configuration procedure with information provided by the
sensor chip manual and remove the hardcoded divider from the pixel clock
calculation.

The PLL configuration procedure has been verified by forcing a pixel
rate of 414 MHz and verify that the effective output pixel rate matches
the expected 60 frames per second.

Do not modify the default pixel rate for the moment as it will be made
configurable through V4L2_CID_LINK_FREQ in subsequent patches.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ar0521.c | 113 +++++++++++++++++++++++++++----------
 1 file changed, 84 insertions(+), 29 deletions(-)

diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
index 2b19ba898ce8..21649aecf442 100644
--- a/drivers/media/i2c/ar0521.c
+++ b/drivers/media/i2c/ar0521.c
@@ -23,7 +23,7 @@
 #define AR0521_PLL_MIN		 (320 * 1000 * 1000)
 #define AR0521_PLL_MAX		(1280 * 1000 * 1000)
 
-/* Effective pixel clocks, the registers may be DDR */
+/* Effective pixel sample rate on the pixel array. */
 #define AR0521_PIXEL_CLOCK_RATE	 (184 * 1000 * 1000)
 #define AR0521_PIXEL_CLOCK_MIN	 (168 * 1000 * 1000)
 #define AR0521_PIXEL_CLOCK_MAX	 (414 * 1000 * 1000)
@@ -125,10 +125,14 @@ struct ar0521_dev {
 	unsigned int lane_count;
 	u16 total_width;
 	u16 total_height;
-	u16 pll_pre;
-	u16 pll_mult;
-	u16 pll_pre2;
-	u16 pll_mult2;
+	struct {
+		u16 pre;
+		u16 mult;
+		u16 pre2;
+		u16 mult2;
+		u16 vt_pix;
+	} pll;
+
 	bool streaming;
 };
 
@@ -153,6 +157,16 @@ static u32 div64_round_up(u64 v, u32 d)
 	return div_u64(v + d - 1, d);
 }
 
+static int ar0521_code_to_bpp(struct ar0521_dev *sensor)
+{
+	switch (sensor->fmt.code) {
+	case MEDIA_BUS_FMT_SGRBG8_1X8:
+		return 8;
+	}
+
+	return -EINVAL;
+}
+
 /* Data must be BE16, the first value is the register address */
 static int ar0521_write_regs(struct ar0521_dev *sensor, const __be16 *data,
 			     unsigned int count)
@@ -273,8 +287,7 @@ static int ar0521_set_gains(struct ar0521_dev *sensor)
 	return ar0521_write_regs(sensor, regs, ARRAY_SIZE(regs));
 }
 
-static u32 calc_pll(struct ar0521_dev *sensor, int num, u32 freq, u16 *pre_ptr,
-		    u16 *mult_ptr)
+static u32 calc_pll(struct ar0521_dev *sensor, u32 freq, u16 *pre_ptr, u16 *mult_ptr)
 {
 	u16 pre = 1, mult = 1, new_pre;
 	u32 pll = AR0521_PLL_MAX + 1;
@@ -309,37 +322,79 @@ static u32 calc_pll(struct ar0521_dev *sensor, int num, u32 freq, u16 *pre_ptr,
 	return pll;
 }
 
-#define DIV 4
 static void ar0521_calc_mode(struct ar0521_dev *sensor)
 {
-	unsigned int speed_mod = 4 / sensor->lane_count; /* 1 with 4 DDR lanes */
-	u16 total_width = max(sensor->fmt.width + AR0521_WIDTH_BLANKING_MIN,
-			      AR0521_TOTAL_WIDTH_MIN);
-	u16 total_height = sensor->fmt.height + AR0521_HEIGHT_BLANKING_MIN;
-
-	/* Calculate approximate pixel clock first */
-	u64 pix_clk = AR0521_PIXEL_CLOCK_RATE;
-
-	/* PLL1 drives pixel clock - dual rate */
-	pix_clk = calc_pll(sensor, 1, pix_clk * (DIV / 2), &sensor->pll_pre,
-			   &sensor->pll_mult);
-	pix_clk = div64_round(pix_clk, (DIV / 2));
-	calc_pll(sensor, 2, pix_clk * (DIV / 2) * speed_mod, &sensor->pll_pre2,
-		 &sensor->pll_mult2);
-
-	sensor->total_width = total_width;
-	sensor->total_height = total_height;
+	unsigned int pixel_clock;
+	u16 pre, mult;
+	u32 vco;
+	int bpp;
+
+	/*
+	 * PLL1 and PLL2 are computed equally even if the application note
+	 * suggests a slower PLL1 clock. Maintain pll1 and pll2 divider and
+	 * multipler separated to later specialize the calculation procedure.
+	 *
+	 * PLL1:
+	 * - mclk -> / pre_div1 * pre_mul1 = VCO1 = COUNTER_CLOCK
+	 *
+	 * PLL2:
+	 * - mclk -> / pre_div * pre_mul = VCO
+	 *
+	 *   VCO -> / vt_pix = PIXEL_CLOCK
+	 *   VCO -> / vt_pix / 2 = WORD_CLOCK
+	 *   VCO -> / op_sys = SERIAL_CLOCK
+	 *
+	 * With:
+	 * - vt_pix = bpp / 2
+	 * - WORD_CLOCK = PIXEL_CLOCK / 2
+	 * - SERIAL_CLOCK = MIPI data rate (Mbps / lane) = WORD_CLOCK * bpp
+	 *   NOTE: this implies the MIPI clock is divided internally by 2
+	 *         to account for DDR.
+	 *
+	 * As op_sys_div is fixed to 1:
+	 *
+	 * SERIAL_CLOCK = VCO
+	 * VCO = 2 * MIPI_CLK
+	 * VCO = PIXEL_CLOCK * bpp / 2
+	 *
+	 * In the clock tree:
+	 * MIPI_CLK = PIXEL_CLOCK * bpp / 2 / 2
+	 *
+	 * Generic pixel_rate to bus clock frequencey equation:
+	 * MIPI_CLK = V4L2_CID_PIXEL_RATE * bpp / lanes / 2
+	 *
+	 * From which we derive the PIXEL_CLOCK to use in the clock tree:
+	 * PIXEL_CLOCK = V4L2_CID_PIXEL_RATE * 2 / lanes
+	 *
+	 * Documented clock ranges:
+	 *   WORD_CLOCK = (35MHz - 120 MHz)
+	 *   PIXEL_CLOCK = (84MHz - 207MHz)
+	 *   VCO = (320MHz - 1280MHz)
+	 *
+	 * TODO: in case we have less data lanes we have to reduce the desired
+	 * VCO not to exceed the limits specified by the datasheet and
+	 * consequentially reduce the obtained pixel clock.
+	 */
+	pixel_clock = AR0521_PIXEL_CLOCK_RATE * 2 / sensor->lane_count;
+	bpp = ar0521_code_to_bpp(sensor);
+	sensor->pll.vt_pix = bpp / 2;
+	vco = pixel_clock * sensor->pll.vt_pix;
+
+	calc_pll(sensor, vco, &pre, &mult);
+
+	sensor->pll.pre = sensor->pll.pre2 = pre;
+	sensor->pll.mult = sensor->pll.mult2 = mult;
 }
 
 static int ar0521_write_mode(struct ar0521_dev *sensor)
 {
 	__be16 pll_regs[] = {
 		be(AR0521_REG_VT_PIX_CLK_DIV),
-		/* 0x300 */ be(4), /* vt_pix_clk_div = number of bits / 2 */
+		/* 0x300 */ be(sensor->pll.vt_pix), /* vt_pix_clk_div = bpp / 2 */
 		/* 0x302 */ be(1), /* vt_sys_clk_div */
-		/* 0x304 */ be((sensor->pll_pre2 << 8) | sensor->pll_pre),
-		/* 0x306 */ be((sensor->pll_mult2 << 8) | sensor->pll_mult),
-		/* 0x308 */ be(8), /* op_pix_clk_div = 2 * vt_pix_clk_div */
+		/* 0x304 */ be((sensor->pll.pre2 << 8) | sensor->pll.pre),
+		/* 0x306 */ be((sensor->pll.mult2 << 8) | sensor->pll.mult),
+		/* 0x308 */ be(sensor->pll.vt_pix * 2), /* op_pix_clk_div = 2 * vt_pix_clk_div */
 		/* 0x30A */ be(1)  /* op_sys_clk_div */
 	};
 	int ret;
-- 
2.37.3

