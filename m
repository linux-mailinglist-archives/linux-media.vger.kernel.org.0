Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CB2D526388
	for <lists+linux-media@lfdr.de>; Fri, 13 May 2022 16:15:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242190AbiEMOOi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 May 2022 10:14:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240798AbiEMOOc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 May 2022 10:14:32 -0400
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [IPv6:2001:4b98:dc4:8::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C413DE0D4
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 07:14:30 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 86687100016;
        Fri, 13 May 2022 14:14:28 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     sakari.ailus@iki.fi, mchehab@kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH v7 07/28] media: ov5640: Rework CSI-2 clock tree
Date:   Fri, 13 May 2022 16:13:55 +0200
Message-Id: <20220513141416.120552-8-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220513141416.120552-1-jacopo@jmondi.org>
References: <20220513141416.120552-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Re-work the ov5640_set_mipi_pclk() function to calculate the
PLL configuration using the pixel_rate and link_freq values set at
s_fmt time.

Rework the DVP clock mode settings to calculate the pixel clock
internally and remove the assumption on the 16bpp format.

Tested in MIPI CSI-2 mode with 1 and 2 data lanes with:
- all the sensor supported resolutions in UYVY, RGB565 and MJPEG formats.
- resolutions >= 1280x720 in RAW Bayer format.
- resolutions < 1280x720 in RGB888 format.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

[Rework pclk_period and link_freq computation]
Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
---
 drivers/media/i2c/ov5640.c | 196 ++++++++++++++++++-------------------
 1 file changed, 96 insertions(+), 100 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 3aac84aea5ea..5447820e67f2 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -90,6 +90,7 @@
 #define OV5640_REG_POLARITY_CTRL00	0x4740
 #define OV5640_REG_MIPI_CTRL00		0x4800
 #define OV5640_REG_DEBUG_MODE		0x4814
+#define OV5640_REG_PCLK_PERIOD		0x4837
 #define OV5640_REG_ISP_FORMAT_MUX_CTRL	0x501f
 #define OV5640_REG_PRE_ISP_TEST_SET1	0x503d
 #define OV5640_REG_SDE_CTRL0		0x5580
@@ -926,20 +927,10 @@ static int ov5640_mod_reg(struct ov5640_dev *sensor, u16 reg,
  *                                +-----+-----+
  *                                       +------------> PCLK
  *
- * This is deviating from the datasheet at least for the register
- * 0x3108, since it's said here that the PCLK would be clocked from
- * the PLL.
- *
- * There seems to be also (unverified) constraints:
+ * There seems to be also constraints:
  *  - the PLL pre-divider output rate should be in the 4-27MHz range
  *  - the PLL multiplier output rate should be in the 500-1000MHz range
  *  - PCLK >= SCLK * 2 in YUV, >= SCLK in Raw or JPEG
- *
- * In the two latter cases, these constraints are met since our
- * factors are hardcoded. If we were to change that, we would need to
- * take this into account. The only varying parts are the PLL
- * multiplier and the system clock divider, which are shared between
- * all these clocks so won't cause any issue.
  */
 
 /*
@@ -958,13 +949,6 @@ static int ov5640_mod_reg(struct ov5640_dev *sensor, u16 reg,
 #define OV5640_SYSDIV_MIN	1
 #define OV5640_SYSDIV_MAX	16
 
-/*
- * Hardcode these values for scaler and non-scaler modes.
- * FIXME: to be re-calcualted for 1 data lanes setups
- */
-#define OV5640_MIPI_DIV_PCLK	2
-#define OV5640_MIPI_DIV_SCLK	1
-
 /*
  * This is supposed to be ranging from 1 to 2, but the value is always
  * set to 2 in the vendor kernels.
@@ -1074,70 +1058,83 @@ static unsigned long ov5640_calc_sys_clk(struct ov5640_dev *sensor,
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
- *
- * FIXME: this have been tested with 16bpp and 2 lanes setup only.
- * MIPI_DIV is fixed to value 2, but it -might- be changed according to the
- * above formula for setups with 1 lane or image formats with different bpp.
- *
- * FIXME: this deviates from the sensor manual documentation which is quite
- * thin on the MIPI clock tree generation part.
  */
-static int ov5640_set_mipi_pclk(struct ov5640_dev *sensor,
-				unsigned long rate)
+static int ov5640_set_mipi_pclk(struct ov5640_dev *sensor)
 {
-	const struct ov5640_mode_info *mode = sensor->current_mode;
+	u8 bit_div, mipi_div, pclk_div, sclk_div, sclk2x_div, root_div;
 	u8 prediv, mult, sysdiv;
-	u8 mipi_div;
+	unsigned long link_freq;
+	unsigned long sysclk;
+	u8 pclk_period;
+	u32 sample_rate;
+	u32 num_lanes;
 	int ret;
 
+	/* Use the link freq computed at ov5640_update_pixel_rate() time. */
+	link_freq = sensor->current_link_freq;
+
 	/*
-	 * 1280x720 is reported to use 'SUBSAMPLING' only,
-	 * but according to the sensor manual it goes through the
-	 * scaler before subsampling.
+	 * - mipi_div - Additional divider for the MIPI lane clock.
+	 *
+	 * Higher link frequencies would make sysclk > 1GHz.
+	 * Keep the sysclk low and do not divide in the MIPI domain.
 	 */
-	if (mode->dn_mode == SCALING ||
-	   (mode->id == OV5640_MODE_720P_1280_720))
-		mipi_div = OV5640_MIPI_DIV_SCLK;
+	if (link_freq > OV5640_LINK_RATE_MAX)
+		mipi_div = 1;
 	else
-		mipi_div = OV5640_MIPI_DIV_PCLK;
+		mipi_div = 2;
 
-	ov5640_calc_sys_clk(sensor, rate, &prediv, &mult, &sysdiv);
+	sysclk = link_freq * mipi_div;
+	ov5640_calc_sys_clk(sensor, sysclk, &prediv, &mult, &sysdiv);
 
-	ret = ov5640_mod_reg(sensor, OV5640_REG_SC_PLL_CTRL0,
-			     0x0f, OV5640_PLL_CTRL0_MIPI_MODE_8BIT);
+	/*
+	 * Adjust PLL parameters to maintain the MIPI_SCLK-to-PCLK ratio.
+	 *
+	 * - root_div = 2 (fixed)
+	 * - bit_div : MIPI 8-bit = 2; MIPI 10-bit = 2.5
+	 * - pclk_div = 1 (fixed)
+	 * - p_div  = (2 lanes ? mipi_div : 2 * mipi_div)
+	 *
+	 * This results in the following MIPI_SCLK depending on the number
+	 * of lanes:
+	 *
+	 * - 2 lanes: MIPI_SCLK = (4 or 5) * PCLK
+	 * - 1 lanes: MIPI_SCLK = (8 or 10) * PCLK
+	 */
+	root_div = OV5640_PLL_CTRL3_PLL_ROOT_DIV_2;
+	bit_div =  OV5640_PLL_CTRL0_MIPI_MODE_8BIT;
+	pclk_div = ilog2(OV5640_PCLK_ROOT_DIV);
 
-	ret = ov5640_mod_reg(sensor, OV5640_REG_SC_PLL_CTRL1,
-			     0xff, sysdiv << 4 | mipi_div);
+	/*
+	 * Scaler clock:
+	 * - YUV: PCLK >= 2 * SCLK
+	 * - RAW or JPEG: PCLK >= SCLK
+	 * - sclk2x_div = sclk_div / 2
+	 */
+	sclk_div = ilog2(OV5640_SCLK_ROOT_DIV);
+	sclk2x_div = ilog2(OV5640_SCLK2X_ROOT_DIV);
+
+	/*
+	 * Set the pixel clock period expressed in ns with 1-bit decimal
+	 * (0x01=0.5ns).
+	 *
+	 * The register is very briefly documented. In the OV5645 datasheet it
+	 * is described as (2 * pclk period), and from testing it seems the
+	 * actual definition is 2 * 8-bit sample period.
+	 *
+	 * 2 * sample_period = (mipi_clk * 2 * num_lanes / bpp) * (bpp / 8) / 2
+	 */
+	num_lanes = sensor->ep.bus.mipi_csi2.num_data_lanes;
+	sample_rate = (link_freq * mipi_div * num_lanes * 2) / 16;
+	pclk_period = 2000000000UL / sample_rate;
+
+	/* Program the clock tree registers. */
+	ret = ov5640_mod_reg(sensor, OV5640_REG_SC_PLL_CTRL0, 0x0f, bit_div);
+	if (ret)
+		return ret;
+
+	ret = ov5640_mod_reg(sensor, OV5640_REG_SC_PLL_CTRL1, 0xff,
+			     (sysdiv << 4) | mipi_div);
 	if (ret)
 		return ret;
 
@@ -1145,13 +1142,27 @@ static int ov5640_set_mipi_pclk(struct ov5640_dev *sensor,
 	if (ret)
 		return ret;
 
-	ret = ov5640_mod_reg(sensor, OV5640_REG_SC_PLL_CTRL3,
-			     0x1f, OV5640_PLL_CTRL3_PLL_ROOT_DIV_2 | prediv);
+	ret = ov5640_mod_reg(sensor, OV5640_REG_SC_PLL_CTRL3, 0x1f,
+			     root_div | prediv);
 	if (ret)
 		return ret;
 
-	return ov5640_mod_reg(sensor, OV5640_REG_SYS_ROOT_DIVIDER,
-			      0x30, OV5640_PLL_SYS_ROOT_DIVIDER_BYPASS);
+	ret = ov5640_mod_reg(sensor, OV5640_REG_SYS_ROOT_DIVIDER, 0x3f,
+			     (pclk_div << 4) | (sclk2x_div << 2) | sclk_div);
+	if (ret)
+		return ret;
+
+	return ov5640_write_reg(sensor, OV5640_REG_PCLK_PERIOD, pclk_period);
+}
+
+static u32 ov5640_calc_pixel_rate(struct ov5640_dev *sensor)
+{
+	u32 rate;
+
+	rate = sensor->current_mode->vtot * sensor->current_mode->htot;
+	rate *= ov5640_framerates[sensor->current_fr];
+
+	return rate;
 }
 
 static unsigned long ov5640_calc_pclk(struct ov5640_dev *sensor,
@@ -1171,11 +1182,16 @@ static unsigned long ov5640_calc_pclk(struct ov5640_dev *sensor,
 	return _rate / *pll_rdiv / *bit_div / *pclk_div;
 }
 
-static int ov5640_set_dvp_pclk(struct ov5640_dev *sensor, unsigned long rate)
+static int ov5640_set_dvp_pclk(struct ov5640_dev *sensor)
 {
 	u8 prediv, mult, sysdiv, pll_rdiv, bit_div, pclk_div;
+	u32 rate;
 	int ret;
 
+	rate = ov5640_calc_pixel_rate(sensor);
+	rate *= ov5640_code_to_bpp(sensor->fmt.code);
+	rate /= sensor->ep.bus.parallel.bus_width;
+
 	ov5640_calc_pclk(sensor, rate, &prediv, &mult, &sysdiv, &pll_rdiv,
 			 &bit_div, &pclk_div);
 
@@ -1700,16 +1716,6 @@ ov5640_find_mode(struct ov5640_dev *sensor, enum ov5640_frame_rate fr,
 	return mode;
 }
 
-static u64 ov5640_calc_pixel_rate(struct ov5640_dev *sensor)
-{
-	u64 rate;
-
-	rate = sensor->current_mode->vtot * sensor->current_mode->htot;
-	rate *= ov5640_framerates[sensor->current_fr];
-
-	return rate;
-}
-
 /*
  * sensor changes between scaling and subsampling, go through
  * exposure calculation
@@ -1891,7 +1897,6 @@ static int ov5640_set_mode(struct ov5640_dev *sensor)
 	enum ov5640_downsize_mode dn_mode, orig_dn_mode;
 	bool auto_gain = sensor->ctrls.auto_gain->val == 1;
 	bool auto_exp =  sensor->ctrls.auto_exp->val == V4L2_EXPOSURE_AUTO;
-	unsigned long rate;
 	int ret;
 
 	dn_mode = mode->dn_mode;
@@ -1910,19 +1915,10 @@ static int ov5640_set_mode(struct ov5640_dev *sensor)
 			goto restore_auto_gain;
 	}
 
-	/*
-	 * All the formats we support have 16 bits per pixel, seems to require
-	 * the same rate than YUV, so we can just use 16 bpp all the time.
-	 */
-	rate = ov5640_calc_pixel_rate(sensor) * 16;
-	if (ov5640_is_csi2(sensor)) {
-		rate = rate / sensor->ep.bus.mipi_csi2.num_data_lanes;
-		ret = ov5640_set_mipi_pclk(sensor, rate);
-	} else {
-		rate = rate / sensor->ep.bus.parallel.bus_width;
-		ret = ov5640_set_dvp_pclk(sensor, rate);
-	}
-
+	if (ov5640_is_csi2(sensor))
+		ret = ov5640_set_mipi_pclk(sensor);
+	else
+		ret = ov5640_set_dvp_pclk(sensor);
 	if (ret < 0)
 		return 0;
 
-- 
2.35.1

