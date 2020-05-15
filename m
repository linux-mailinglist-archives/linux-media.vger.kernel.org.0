Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 267931D565E
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2020 18:43:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726179AbgEOQnQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 May 2020 12:43:16 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:58501 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726144AbgEOQnP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 May 2020 12:43:15 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 657A5240002;
        Fri, 15 May 2020 16:43:11 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     tomi.valkeinen@ti.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Benoit Parrot <bparrot@ti.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        linux-media@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>
Subject: [RFC] media: i2c: ov5640: Rework CSI-2 clock tree
Date:   Fri, 15 May 2020 18:46:17 +0200
Message-Id: <20200515164617.188453-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <ff66ea3a-bd2e-9bd6-894c-bf372de69a31@ti.com>
References: <ff66ea3a-bd2e-9bd6-894c-bf372de69a31@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Re-work the ov5640_set_mipi_pclk() function to use the requested bandwidth per
lane as the desired output of the PLL generated SYSCLK.

Take into account and more clearly document the clock tree constraints reported
in the PLL diagrams. Most values are still fixed to only support 16bpp YUV
formats with a 2 lanes CSI-2 setup.

Tested by capturing and validating images in all sensor supported resolutions
at 15 and 30 FPS. All images are valid but the desired FPS is only achieved
in 30 FPS mode.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

---
Hi Tomi,
  I finally had some time to go test your patch and on top rework a bit the
messy clock calculation function for MIPI CSI-2

With this patch applied I have verified I have the following results:
I have tested YUYV_2X8 mode with the following resultions

176x144 320x240 640x480 720x480 720x576 1024x768 1280x720 1920x1080 2592x1944

I get correct images for all resolutions capturing at 15FPS and 30FPS \o/
(2592x1944 at 15FPS only).

I then tried to measure the accuracy of the clock tree settings by capturing
with yavta and discarding images, to get and FPS estimation and these are the
(improvable) results

2592x1944 @10FPS = 5 FPS
2592x1944 @15FPS = 7.5 FPS

1920x1080 @10FPS = 5 FPS
1920x1080 @15FPS = 7.5 FPS
1920x1080 @30FPS = 30 FPS

1280x720 @10FPS = 5 FPS
1280x720 @15FPS = broken ?
1280x720 @30FPS = 30 FPS

1024x768 @10FPS = 5 FPS
1024x768 @15FPS = 7.5 FPS
1024x768 @30FPS = 30 FPS

720x480 @10FPS = 5 FPS
720x480 @15FPS = 7.5 FPS
720x480 @30FPS = 30 FPS

640x480 @10FPS = 5 FPS
640x480 @15FPS = 7.5 FPS
640x480 @30FPS = 30 FPS
640x480 @60FPS = 45 FPS

320x240 @10FPS = 5 FPS
320x240 @15FPS = 7.5 FPS
320x240 @30FPS = 30 FPS
320x240 @60FPS = 30 FPS

Good news is that the 30FPS mode seems correct, that full resolution works
and that results are consistent.

Bad new is that results are still a bit off :/

Do you think you could this give these a try on your platform ?
FYI I have tested on an IMX6 board

Thank you
   j

---
 drivers/media/i2c/ov5640.c | 117 +++++++++++++++++++++----------------
 1 file changed, 68 insertions(+), 49 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 736b286ebb4b..031a047f1366 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -917,67 +917,87 @@ static unsigned long ov5640_calc_sys_clk(struct ov5640_dev *sensor,
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
  * FIXME: this deviates from the sensor manual documentation which is quite
- * thin on the MIPI clock tree generation part.
+ *	  thin on the MIPI clock tree generation part.
  */
 static int ov5640_set_mipi_pclk(struct ov5640_dev *sensor,
 				unsigned long rate)
 {
-	const struct ov5640_mode_info *mode = sensor->current_mode;
+	u8 bit_div, mipi_div, pclk_div, sclk_div, sclk2x_div, pll_div;
+	u32 lanebandwidth, sysclk;
 	u8 prediv, mult, sysdiv;
-	u8 mipi_div;
 	int ret;

 	/*
-	 * 1280x720 is reported to use 'SUBSAMPLING' only,
-	 * but according to the sensor manual it goes through the
-	 * scaler before subsampling.
+	 * The 'rate' parameter is the bitrate = VTOT * HTOT * FPS * BPP
+	 *
+	 * Adjust it to represent the bandwidth per CSI-2 data lane and
+	 * set the PLL produced SYSCLK to that frequency.
 	 */
-	if (mode->dn_mode == SCALING ||
-	   (mode->id == OV5640_MODE_720P_1280_720))
-		mipi_div = OV5640_MIPI_DIV_SCLK;
+	lanebandwidth = rate / sensor->ep.bus.mipi_csi2.num_data_lanes;
+	ov5640_calc_sys_clk(sensor, lanebandwidth, &prediv, &mult, &sysdiv);
+
+	/*
+	 * Adjust PLL parameters to maintain the MIPI_SCLK-to-PCLK ratio;
+	 *
+	 * - bit_div : MIPI 8-bit = 2
+	 *	       MIPI 10-bit = 2,5
+	 *
+	 * - pll_div = 2 (fixed)
+	 *
+	 * - pclk_div: pclk_div = (1 lane) ? 2 : 1;
+	 *   2 lanes: MIPI_SCLK = (4 or 5) * PCLK
+	 *   1 lanes: MIPI_SCLK = (8 or 10) * PCLK
+	 *
+	 * TODO: support 10-bit formats
+	 * TODO: support 1 lane
+	 */
+	bit_div =  OV5640_PLL_CTRL0_MIPI_MODE_8BIT;
+	pclk_div = OV5640_PLL_SYS_ROOT_DIVIDER_BYPASS;
+	pll_div = OV5640_PLL_CTRL3_PLL_ROOT_DIV_2;
+
+	/*
+	 * - mipi_div - Assumptions not supported by documentation
+	 *
+	 *   The MIPI clock generation differs for modes that use the scaler and
+	 *   modes that do not.
+	 *
+	 *   In case the scaler is in use
+	 *   mipi_div = 1
+	 *
+	 *   If mode uses cropping + sub-sampling
+	 *   mipi_div = 2
+	 *
+	 * FIXME: mipi_div values verified for 16bpp with 2 data lanes
+	 */
+	if (sensor->current_mode->dn_mode == SCALING)
+		mipi_div = 1;
 	else
-		mipi_div = OV5640_MIPI_DIV_PCLK;
+		mipi_div = 2;

-	ov5640_calc_sys_clk(sensor, rate, &prediv, &mult, &sysdiv);
+	/*
+	 * Scaler clock:
+	 * - YUV: SCLK = 1/2 PCLK
+	 *   sclk_div = 2 * pclk_div * mipi_div
+	 * - RAW or JPEG: SCLK = PCLK
+	 *   sclk_div = pclk_div * mipi_div
+	 * - sclk2x_div = sclk_div / 2
+	 *
+	 * TODO: add support for RAW and JPEG modes. To maintain the
+	 * sclk2x_div to sclk_div ratio, the pclk_div should probably be
+	 * adjusted as well to 2 and PCLK recalculated.
+	 */
+	sclk_div = ilog2(2);
+	sclk2x_div = ilog2(1);

+	/* Program the clock tree registers. */
 	ret = ov5640_mod_reg(sensor, OV5640_REG_SC_PLL_CTRL0,
-			     0x0f, OV5640_PLL_CTRL0_MIPI_MODE_8BIT);
+			     0x0f, bit_div);
+	if (ret)
+		return ret;

 	ret = ov5640_mod_reg(sensor, OV5640_REG_SC_PLL_CTRL1,
 			     0xff, sysdiv << 4 | mipi_div);
@@ -989,12 +1009,12 @@ static int ov5640_set_mipi_pclk(struct ov5640_dev *sensor,
 		return ret;

 	ret = ov5640_mod_reg(sensor, OV5640_REG_SC_PLL_CTRL3,
-			     0x1f, OV5640_PLL_CTRL3_PLL_ROOT_DIV_2 | prediv);
+			     0x1f, pll_div | prediv);
 	if (ret)
 		return ret;

-	return ov5640_mod_reg(sensor, OV5640_REG_SYS_ROOT_DIVIDER,
-			      0x30, OV5640_PLL_SYS_ROOT_DIVIDER_BYPASS);
+	return ov5640_mod_reg(sensor, OV5640_REG_SYS_ROOT_DIVIDER, 0x3f,
+			      (pclk_div << 4) | (sclk2x_div << 2) | sclk_div);
 }

 static unsigned long ov5640_calc_pclk(struct ov5640_dev *sensor,
@@ -1840,7 +1860,6 @@ static int ov5640_set_mode(struct ov5640_dev *sensor)
 	 */
 	rate = ov5640_calc_pixel_rate(sensor) * 16;
 	if (sensor->ep.bus_type == V4L2_MBUS_CSI2_DPHY) {
-		rate = rate / sensor->ep.bus.mipi_csi2.num_data_lanes;
 		ret = ov5640_set_mipi_pclk(sensor, rate);
 	} else {
 		rate = rate / sensor->ep.bus.parallel.bus_width;
--
2.26.2

