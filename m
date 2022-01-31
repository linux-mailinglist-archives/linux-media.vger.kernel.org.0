Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83ED74A495D
	for <lists+linux-media@lfdr.de>; Mon, 31 Jan 2022 15:32:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236916AbiAaOcZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Jan 2022 09:32:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236914AbiAaOcY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Jan 2022 09:32:24 -0500
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F1C6C061714
        for <linux-media@vger.kernel.org>; Mon, 31 Jan 2022 06:32:24 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id DA7CEFF803;
        Mon, 31 Jan 2022 14:32:19 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        Eugen.Hristev@microchip.com, jbrunet@baylibre.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH 06/21] media: ov5640: Rework CSI-2 clock tree
Date:   Mon, 31 Jan 2022 15:32:30 +0100
Message-Id: <20220131143245.128089-7-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220131143245.128089-1-jacopo@jmondi.org>
References: <20220131143245.128089-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Re-work the ov5640_set_mipi_pclk() function to calculate the
PLL configuration using the pixel_rate and link_freq values set at
s_fmt time.

Rework the DVP clock mode settings to calculate the pixel clock
internally and remove the assumption on the 16bpp format.

Tested in MIPI CSI-2 mode with 2 data lanes with:
- all the sensor supported resolutions in UYVY and RGB565 formats.
- resolutions >= 1280x720 in RAW Bayer format.
- resolutions < 1280x720 in RGB888 format.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>

---

Not tested with JPEG.
Not tested with 1 data lane.
Not tested in DVP mode.

If I get come Tested-by: tags for the above use cases, it would be
great.
---
 drivers/media/i2c/ov5640.c | 175 ++++++++++++++++++++-----------------
 1 file changed, 94 insertions(+), 81 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 457f76030163..acc636500907 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -29,6 +29,8 @@
 #define OV5640_XCLK_MIN  6000000
 #define OV5640_XCLK_MAX 54000000
 
+#define OV5640_LINK_RATE_MAX	490000000U
+
 #define OV5640_DEFAULT_SLAVE_ID 0x3c
 
 #define OV5640_REG_SYS_RESET02		0x3002
@@ -88,6 +90,7 @@
 #define OV5640_REG_POLARITY_CTRL00	0x4740
 #define OV5640_REG_MIPI_CTRL00		0x4800
 #define OV5640_REG_DEBUG_MODE		0x4814
+#define OV5640_REG_PCLK_PERIOD		0x4837
 #define OV5640_REG_ISP_FORMAT_MUX_CTRL	0x501f
 #define OV5640_REG_PRE_ISP_TEST_SET1	0x503d
 #define OV5640_REG_SDE_CTRL0		0x5580
@@ -1035,69 +1038,80 @@ static unsigned long ov5640_calc_sys_clk(struct ov5640_dev *sensor,
  * ov5640_set_mipi_pclk() - Calculate the clock tree configuration values
  *			    for the MIPI CSI-2 output.
  *
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
+ * FIXME: tested with 2 lanes only.
  */
-static int ov5640_set_mipi_pclk(struct ov5640_dev *sensor,
-				unsigned long rate)
+static int ov5640_set_mipi_pclk(struct ov5640_dev *sensor)
 {
-	const struct ov5640_mode_info *mode = sensor->current_mode;
+	u8 bit_div, mipi_div, pclk_div, sclk_div, sclk2x_div, root_div;
+	struct v4l2_mbus_framefmt *fmt = &sensor->fmt;
 	u8 prediv, mult, sysdiv;
-	u8 mipi_div;
+	unsigned long sysclk;
+	unsigned long sample_rate;
+	u8 pclk_period;
+	s64 link_freq;
 	int ret;
 
+	/* Use the link frequency computed at s_fmt time. */
+	link_freq = ov5640_csi2_link_freqs[sensor->ctrls.link_freq->cur.val];
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
+	 * TODO: test with 1 data lane
+	 */
+	root_div = OV5640_PLL_CTRL3_PLL_ROOT_DIV_2;
+	bit_div =  OV5640_PLL_CTRL0_MIPI_MODE_8BIT;
+	pclk_div = OV5640_PLL_SYS_ROOT_DIVIDER_BYPASS;
 
-	ret = ov5640_mod_reg(sensor, OV5640_REG_SC_PLL_CTRL1,
-			     0xff, sysdiv << 4 | mipi_div);
+	/*
+	 * Scaler clock:
+	 * - YUV: PCLK >= 2 * SCLK
+	 * - RAW or JPEG: PCLK >= SCLK
+	 * - sclk2x_div = sclk_div / 2
+	 *
+	 * TODO: test with JPEG.
+	 */
+	sclk_div = ilog2(OV5640_SCLK_ROOT_DIV);
+	sclk2x_div = ilog2(OV5640_SCLK2X_ROOT_DIV);
+
+	/*
+	 * Set the sample period expressed in ns with 1-bit decimal
+	 * (0x01=0.5ns).
+	 */
+	sample_rate = ov5640_pixel_rates[sensor->current_mode->pixel_rate]
+		    * (ov5640_code_to_bpp(fmt->code) / 8);
+	pclk_period = 2000000000U / sample_rate;
+
+	/* Program the clock tree registers. */
+	ret = ov5640_mod_reg(sensor, OV5640_REG_SC_PLL_CTRL0, 0x0f, bit_div);
+	if (ret)
+		return ret;
+
+	ret = ov5640_mod_reg(sensor, OV5640_REG_SC_PLL_CTRL1, 0xff,
+			     sysdiv << 4 | mipi_div);
 	if (ret)
 		return ret;
 
@@ -1105,13 +1119,27 @@ static int ov5640_set_mipi_pclk(struct ov5640_dev *sensor,
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
+static u64 ov5640_calc_pixel_rate(struct ov5640_dev *sensor)
+{
+	u64 rate;
+
+	rate = sensor->current_mode->vtot * sensor->current_mode->htot;
+	rate *= ov5640_framerates[sensor->current_fr];
+
+	return rate;
 }
 
 static unsigned long ov5640_calc_pclk(struct ov5640_dev *sensor,
@@ -1131,11 +1159,16 @@ static unsigned long ov5640_calc_pclk(struct ov5640_dev *sensor,
 	return _rate / *pll_rdiv / *bit_div / *pclk_div;
 }
 
-static int ov5640_set_dvp_pclk(struct ov5640_dev *sensor, unsigned long rate)
+static int ov5640_set_dvp_pclk(struct ov5640_dev *sensor)
 {
 	u8 prediv, mult, sysdiv, pll_rdiv, bit_div, pclk_div;
+	u64 rate;
 	int ret;
 
+	rate = ov5640_calc_pixel_rate(sensor);
+	rate *= ov5640_code_to_bpp(sensor->fmt.code);
+	do_div(rate, sensor->ep.bus.parallel.bus_width);
+
 	ov5640_calc_pclk(sensor, rate, &prediv, &mult, &sysdiv, &pll_rdiv,
 			 &bit_div, &pclk_div);
 
@@ -1660,16 +1693,6 @@ ov5640_find_mode(struct ov5640_dev *sensor, enum ov5640_frame_rate fr,
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
@@ -1851,7 +1874,6 @@ static int ov5640_set_mode(struct ov5640_dev *sensor)
 	enum ov5640_downsize_mode dn_mode, orig_dn_mode;
 	bool auto_gain = sensor->ctrls.auto_gain->val == 1;
 	bool auto_exp =  sensor->ctrls.auto_exp->val == V4L2_EXPOSURE_AUTO;
-	unsigned long rate;
 	int ret;
 
 	dn_mode = mode->dn_mode;
@@ -1870,19 +1892,10 @@ static int ov5640_set_mode(struct ov5640_dev *sensor)
 			goto restore_auto_gain;
 	}
 
-	/*
-	 * All the formats we support have 16 bits per pixel, seems to require
-	 * the same rate than YUV, so we can just use 16 bpp all the time.
-	 */
-	rate = ov5640_calc_pixel_rate(sensor) * 16;
-	if (ov5640_is_mipi(sensor)) {
-		rate = rate / sensor->ep.bus.mipi_csi2.num_data_lanes;
-		ret = ov5640_set_mipi_pclk(sensor, rate);
-	} else {
-		rate = rate / sensor->ep.bus.parallel.bus_width;
-		ret = ov5640_set_dvp_pclk(sensor, rate);
-	}
-
+	if (ov5640_is_mipi(sensor))
+		ret = ov5640_set_mipi_pclk(sensor);
+	else
+		ret = ov5640_set_dvp_pclk(sensor);
 	if (ret < 0)
 		return 0;
 
-- 
2.35.0

