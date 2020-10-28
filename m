Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC9B229D993
	for <lists+linux-media@lfdr.de>; Wed, 28 Oct 2020 23:57:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389933AbgJ1W5z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Oct 2020 18:57:55 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:34999 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389866AbgJ1W51 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Oct 2020 18:57:27 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 295966000C;
        Wed, 28 Oct 2020 22:57:23 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     hugues.fruchet@st.com, tomi.valkeinen@ti.com,
        sam@elite-embedded.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, slongerbeam@gmail.com,
        linux-media@vger.kernel.org
Subject: [RFC 2/3] media: i2c: ov5640: Rework CSI-2 clock tree
Date:   Wed, 28 Oct 2020 23:57:05 +0100
Message-Id: <20201028225706.110078-3-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201028225706.110078-1-jacopo+renesas@jmondi.org>
References: <20201028225706.110078-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Re-work the ov5640_set_mipi_pclk() function to calculate the
SYSCLK function based on the CSI-2 link frequency.

Take into account and more clearly document the clock tree constraints
reported in the PLL diagrams. Most values are still fixed and only tested
with 16bpp YUYV formats with a 2 lanes CSI-2 setup.

Tested by capturing and validating images in all the sensor supported
resolutions except full resolution 2592x1944.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/ov5640.c | 125 ++++++++++++++++++++++---------------
 1 file changed, 75 insertions(+), 50 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 117ac22683ad..236c684ca20b 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -88,6 +88,7 @@
 #define OV5640_REG_POLARITY_CTRL00	0x4740
 #define OV5640_REG_MIPI_CTRL00		0x4800
 #define OV5640_REG_DEBUG_MODE		0x4814
+#define OV5640_REG_PCLK_PERIOD		0x4837
 #define OV5640_REG_ISP_FORMAT_MUX_CTRL	0x501f
 #define OV5640_REG_PRE_ISP_TEST_SET1	0x503d
 #define OV5640_REG_SDE_CTRL0		0x5580
@@ -919,67 +920,88 @@ static unsigned long ov5640_calc_sys_clk(struct ov5640_dev *sensor,
 /*
  * ov5640_set_mipi_pclk() - Calculate the clock tree configuration values
  *			    for the MIPI CSI-2 output.
- *
- * @rate: The requested bandwidth per lane in bytes per second.
- *	  'Bandwidth Per Lane' is calculated as:
- *	  bpl = HTOT * VTOT * FPS * bpp / num_lanes;
- *
- * This function use the requested bandwidth to calculate:
- * - sample_rate = bpl / (bpp / num_lanes);
- *	         = bpl / (PLL_RDIV * BIT_DIV * PCLK_DIV * MIPI_DIV / num_lanes);
- *
- * - mipi_sclk   = bpl / MIPI_DIV / 2; ( / 2 is for CSI-2 DDR)
- *
- * with these fixed parameters:
- *	PLL_RDIV	= 2;
- *	BIT_DIVIDER	= 2; (MIPI_BIT_MODE == 8 ? 2 : 2,5);
- *	PCLK_DIV	= 1;
- *
- * The MIPI clock generation differs for modes that use the scaler and modes
- * that do not. In case the scaler is in use, the MIPI_SCLK generates the MIPI
- * BIT CLk, and thus:
- *
- * - mipi_sclk = bpl / MIPI_DIV / 2;
- *   MIPI_DIV = 1;
- *
- * For modes that do not go through the scaler, the MIPI BIT CLOCK is generated
- * from the pixel clock, and thus:
- *
- * - sample_rate = bpl / (bpp / num_lanes);
- *	         = bpl / (2 * 2 * 1 * MIPI_DIV / num_lanes);
- *		 = bpl / (4 * MIPI_DIV / num_lanes);
- * - MIPI_DIV	 = bpp / (4 * num_lanes);
+ * @rate: The requested bitrate in bits per second.
  *
  * FIXME: this have been tested with 16bpp and 2 lanes setup only.
- * MIPI_DIV is fixed to value 2, but it -might- be changed according to the
- * above formula for setups with 1 lane or image formats with different bpp.
- *
- * FIXME: this deviates from the sensor manual documentation which is quite
- * thin on the MIPI clock tree generation part.
  */
 static int ov5640_set_mipi_pclk(struct ov5640_dev *sensor,
 				unsigned long rate)
 {
-	const struct ov5640_mode_info *mode = sensor->current_mode;
+	u8 bit_div, mipi_div, pclk_div, sclk_div, sclk2x_div, root_div;
 	u8 prediv, mult, sysdiv;
-	u8 mipi_div;
+	unsigned long link_freq;
+	unsigned long sysclk;
+	u8 pclk_period;
 	int ret;

 	/*
-	 * 1280x720 is reported to use 'SUBSAMPLING' only,
-	 * but according to the sensor manual it goes through the
-	 * scaler before subsampling.
+	 * The 'rate' parameter is the bitrate = VTOT * HTOT * FPS * BPP
+	 *
+	 * Adjust it to represent the CSI-2 link frequency and use it to
+	 * update the associated control.
 	 */
-	if (mode->dn_mode == SCALING ||
-	   (mode->id == OV5640_MODE_720P_1280_720))
-		mipi_div = OV5640_MIPI_DIV_SCLK;
+	link_freq = rate / sensor->ep.bus.mipi_csi2.num_data_lanes / 2;
+
+	/*
+	 * - mipi_div - Assumptions not supported by documentation
+	 *
+	 *   The MIPI clock generation differs for modes that use the scaler and
+	 *   modes that do not.
+	 */
+	if (sensor->current_mode->dn_mode == SCALING)
+		mipi_div = 1;
 	else
-		mipi_div = OV5640_MIPI_DIV_PCLK;
+		mipi_div = 2;
+
+	sysclk = link_freq * 2 * mipi_div;
+	ov5640_calc_sys_clk(sensor, sysclk, &prediv, &mult, &sysdiv);
+
+	/*
+	 * Adjust PLL parameters to maintain the MIPI_SCLK-to-PCLK ratio;
+	 *
+	 * - root_div = 2 (fixed)
+	 * - bit_div : MIPI 8-bit = 2
+	 *	       MIPI 10-bit = 2,5
+	 * - pclk_div = 1 (fixed)
+	 * - pll_div  = (2 lanes ? mipi_div : 2 * mipi_div)
+	 *   2 lanes: MIPI_SCLK = (4 or 5) * PCLK
+	 *   1 lanes: MIPI_SCLK = (8 or 10) * PCLK
+	 *
+	 * TODO: support 10-bit formats
+	 * TODO: support 1 lane
+	 */
+	root_div = OV5640_PLL_CTRL3_PLL_ROOT_DIV_2;
+	bit_div =  OV5640_PLL_CTRL0_MIPI_MODE_8BIT;
+	pclk_div = OV5640_PLL_SYS_ROOT_DIVIDER_BYPASS;

-	ov5640_calc_sys_clk(sensor, rate, &prediv, &mult, &sysdiv);
+	/*
+	 * Scaler clock:
+	 * - YUV: PCLK >= 2 * SCLK
+	 * - RAW or JPEG: PCLK >= SCLK
+	 * - sclk2x_div = sclk_div / 2
+	 *
+	 * TODO: add support for RAW and JPEG modes. To maintain the
+	 * SCLK to PCLK ratio, the sclk_div should probably be
+	 * adjusted.
+	 */
+	sclk_div = ilog2(OV5640_SCLK_ROOT_DIV);
+	sclk2x_div = ilog2(OV5640_SCLK2X_ROOT_DIV);
+
+	/*
+	 * This is called pclk period, but it actually represents the
+	 * sample period expressed in ns with 1-bit decimal (0x01=0.5ns).
+	 *
+	 * - pclk = link_freq * 2 * lanes / bpp
+	 *
+	 * TODO: support 1 data lane; support modes with bpp != 16.
+	 */
+	pclk_period = 2000000000UL / (link_freq / 2);

+	/* Program the clock tree registers. */
 	ret = ov5640_mod_reg(sensor, OV5640_REG_SC_PLL_CTRL0,
-			     0x0f, OV5640_PLL_CTRL0_MIPI_MODE_8BIT);
+			     0x0f, bit_div);
+	if (ret)
+		return ret;

 	ret = ov5640_mod_reg(sensor, OV5640_REG_SC_PLL_CTRL1,
 			     0xff, sysdiv << 4 | mipi_div);
@@ -991,12 +1013,16 @@ static int ov5640_set_mipi_pclk(struct ov5640_dev *sensor,
 		return ret;

 	ret = ov5640_mod_reg(sensor, OV5640_REG_SC_PLL_CTRL3,
-			     0x1f, OV5640_PLL_CTRL3_PLL_ROOT_DIV_2 | prediv);
+			     0x1f, root_div | prediv);
+	if (ret)
+		return ret;
+
+	ret = ov5640_mod_reg(sensor, OV5640_REG_SYS_ROOT_DIVIDER, 0x3f,
+			      (pclk_div << 4) | (sclk2x_div << 2) | sclk_div);
 	if (ret)
 		return ret;

-	return ov5640_mod_reg(sensor, OV5640_REG_SYS_ROOT_DIVIDER,
-			      0x30, OV5640_PLL_SYS_ROOT_DIVIDER_BYPASS);
+	return ov5640_write_reg(sensor, OV5640_REG_PCLK_PERIOD, pclk_period);
 }

 static unsigned long ov5640_calc_pclk(struct ov5640_dev *sensor,
@@ -1775,7 +1801,6 @@ static int ov5640_set_mode(struct ov5640_dev *sensor)
 	 */
 	rate = ov5640_calc_pixel_rate(sensor) * 16;
 	if (sensor->ep.bus_type == V4L2_MBUS_CSI2_DPHY) {
-		rate = rate / sensor->ep.bus.mipi_csi2.num_data_lanes;
 		ret = ov5640_set_mipi_pclk(sensor, rate);
 	} else {
 		rate = rate / sensor->ep.bus.parallel.bus_width;
--
2.28.0

