Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 505C927ECF6
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 17:31:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731180AbgI3Pa0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 11:30:26 -0400
Received: from retiisi.org.uk ([95.216.213.190]:44650 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730653AbgI3P3D (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 11:29:03 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 2CC43634C96
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 18:28:47 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 012/100] smiapp: Use CCS registers
Date:   Wed, 30 Sep 2020 18:27:30 +0300
Message-Id: <20200930152858.8471-13-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
References: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Switch to CCS standard registers where they exist. The still relevant SMIA
registers are left as-is and the redundant ones are removed.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/smiapp/smiapp-core.c | 272 +++++++++++--------------
 drivers/media/i2c/smiapp/smiapp.h      |   4 +-
 2 files changed, 118 insertions(+), 158 deletions(-)

diff --git a/drivers/media/i2c/smiapp/smiapp-core.c b/drivers/media/i2c/smiapp/smiapp-core.c
index a54ceef5c5ea..b9faf38d4bba 100644
--- a/drivers/media/i2c/smiapp/smiapp-core.c
+++ b/drivers/media/i2c/smiapp/smiapp-core.c
@@ -28,7 +28,6 @@
 #include <media/v4l2-device.h>
 
 #include "ccs-limits.h"
-#include "ccs-regs.h"
 #include "smiapp.h"
 
 #define SMIAPP_ALIGN_DIM(dim, flags)	\
@@ -357,40 +356,34 @@ static int smiapp_pll_configure(struct smiapp_sensor *sensor)
 	struct smiapp_pll *pll = &sensor->pll;
 	int rval;
 
-	rval = smiapp_write(
-		sensor, SMIAPP_REG_U16_VT_PIX_CLK_DIV, pll->vt.pix_clk_div);
+	rval = ccs_write(sensor, VT_PIX_CLK_DIV, pll->vt.pix_clk_div);
 	if (rval < 0)
 		return rval;
 
-	rval = smiapp_write(
-		sensor, SMIAPP_REG_U16_VT_SYS_CLK_DIV, pll->vt.sys_clk_div);
+	rval = ccs_write(sensor, VT_SYS_CLK_DIV, pll->vt.sys_clk_div);
 	if (rval < 0)
 		return rval;
 
-	rval = smiapp_write(
-		sensor, SMIAPP_REG_U16_PRE_PLL_CLK_DIV, pll->pre_pll_clk_div);
+	rval = ccs_write(sensor, PRE_PLL_CLK_DIV, pll->pre_pll_clk_div);
 	if (rval < 0)
 		return rval;
 
-	rval = smiapp_write(
-		sensor, SMIAPP_REG_U16_PLL_MULTIPLIER, pll->pll_multiplier);
+	rval = ccs_write(sensor, PLL_MULTIPLIER, pll->pll_multiplier);
 	if (rval < 0)
 		return rval;
 
 	/* Lane op clock ratio does not apply here. */
-	rval = smiapp_write(
-		sensor, SMIAPP_REG_U32_REQUESTED_LINK_BIT_RATE_MBPS,
-		DIV_ROUND_UP(pll->op.sys_clk_freq_hz, 1000000 / 256 / 256));
+	rval = ccs_write(sensor, REQUESTED_LINK_RATE,
+			 DIV_ROUND_UP(pll->op.sys_clk_freq_hz,
+				      1000000 / 256 / 256));
 	if (rval < 0 || sensor->minfo.smiapp_profile == SMIAPP_PROFILE_0)
 		return rval;
 
-	rval = smiapp_write(
-		sensor, SMIAPP_REG_U16_OP_PIX_CLK_DIV, pll->op.pix_clk_div);
+	rval = ccs_write(sensor, OP_PIX_CLK_DIV, pll->op.pix_clk_div);
 	if (rval < 0)
 		return rval;
 
-	return smiapp_write(
-		sensor, SMIAPP_REG_U16_OP_SYS_CLK_DIV, pll->op.sys_clk_div);
+	return ccs_write(sensor, OP_SYS_CLK_DIV, pll->op.sys_clk_div);
 }
 
 static int smiapp_pll_try(struct smiapp_sensor *sensor,
@@ -522,10 +515,10 @@ static u32 smiapp_pixel_order(struct smiapp_sensor *sensor)
 
 	if (sensor->hflip) {
 		if (sensor->hflip->val)
-			flip |= SMIAPP_IMAGE_ORIENTATION_HFLIP;
+			flip |= CCS_IMAGE_ORIENTATION_HORIZONTAL_MIRROR;
 
 		if (sensor->vflip->val)
-			flip |= SMIAPP_IMAGE_ORIENTATION_VFLIP;
+			flip |= CCS_IMAGE_ORIENTATION_VERTICAL_FLIP;
 	}
 
 	flip ^= sensor->hvflip_inv_mask;
@@ -585,10 +578,10 @@ static int smiapp_set_ctrl(struct v4l2_ctrl *ctrl)
 			return -EBUSY;
 
 		if (sensor->hflip->val)
-			orient |= SMIAPP_IMAGE_ORIENTATION_HFLIP;
+			orient |= CCS_IMAGE_ORIENTATION_HORIZONTAL_MIRROR;
 
 		if (sensor->vflip->val)
-			orient |= SMIAPP_IMAGE_ORIENTATION_VFLIP;
+			orient |= CCS_IMAGE_ORIENTATION_VERTICAL_FLIP;
 
 		orient ^= sensor->hvflip_inv_mask;
 
@@ -633,60 +626,50 @@ static int smiapp_set_ctrl(struct v4l2_ctrl *ctrl)
 
 	switch (ctrl->id) {
 	case V4L2_CID_ANALOGUE_GAIN:
-		rval = smiapp_write(
-			sensor,
-			SMIAPP_REG_U16_ANALOGUE_GAIN_CODE_GLOBAL, ctrl->val);
+		rval = ccs_write(sensor, ANALOG_GAIN_CODE_GLOBAL, ctrl->val);
 
 		break;
 	case V4L2_CID_EXPOSURE:
-		rval = smiapp_write(
-			sensor,
-			SMIAPP_REG_U16_COARSE_INTEGRATION_TIME, ctrl->val);
+		rval = ccs_write(sensor, COARSE_INTEGRATION_TIME, ctrl->val);
 
 		break;
 	case V4L2_CID_HFLIP:
 	case V4L2_CID_VFLIP:
-		rval = smiapp_write(sensor, SMIAPP_REG_U8_IMAGE_ORIENTATION,
-				    orient);
+		rval = ccs_write(sensor, IMAGE_ORIENTATION, orient);
 
 		break;
 	case V4L2_CID_VBLANK:
-		rval = smiapp_write(
-			sensor, SMIAPP_REG_U16_FRAME_LENGTH_LINES,
-			sensor->pixel_array->crop[SMIAPP_PA_PAD_SRC].height
-			+ ctrl->val);
+		rval = ccs_write(sensor, FRAME_LENGTH_LINES,
+				 sensor->pixel_array->crop[
+					 SMIAPP_PA_PAD_SRC].height
+				 + ctrl->val);
 
 		break;
 	case V4L2_CID_HBLANK:
-		rval = smiapp_write(
-			sensor, SMIAPP_REG_U16_LINE_LENGTH_PCK,
-			sensor->pixel_array->crop[SMIAPP_PA_PAD_SRC].width
-			+ ctrl->val);
+		rval = ccs_write(sensor, LINE_LENGTH_PCK,
+				 sensor->pixel_array->crop[
+					 SMIAPP_PA_PAD_SRC].width
+				 + ctrl->val);
 
 		break;
 	case V4L2_CID_TEST_PATTERN:
-		rval = smiapp_write(
-			sensor, SMIAPP_REG_U16_TEST_PATTERN_MODE, ctrl->val);
+		rval = ccs_write(sensor, TEST_PATTERN_MODE, ctrl->val);
 
 		break;
 	case V4L2_CID_TEST_PATTERN_RED:
-		rval = smiapp_write(
-			sensor, SMIAPP_REG_U16_TEST_DATA_RED, ctrl->val);
+		rval = ccs_write(sensor, TEST_DATA_RED, ctrl->val);
 
 		break;
 	case V4L2_CID_TEST_PATTERN_GREENR:
-		rval = smiapp_write(
-			sensor, SMIAPP_REG_U16_TEST_DATA_GREENR, ctrl->val);
+		rval = ccs_write(sensor, TEST_DATA_GREENR, ctrl->val);
 
 		break;
 	case V4L2_CID_TEST_PATTERN_BLUE:
-		rval = smiapp_write(
-			sensor, SMIAPP_REG_U16_TEST_DATA_BLUE, ctrl->val);
+		rval = ccs_write(sensor, TEST_DATA_BLUE, ctrl->val);
 
 		break;
 	case V4L2_CID_TEST_PATTERN_GREENB:
-		rval = smiapp_write(
-			sensor, SMIAPP_REG_U16_TEST_DATA_GREENB, ctrl->val);
+		rval = ccs_write(sensor, TEST_DATA_GREENB, ctrl->val);
 
 		break;
 	case V4L2_CID_PIXEL_RATE:
@@ -846,8 +829,7 @@ static int smiapp_get_mbus_formats(struct smiapp_sensor *sensor)
 
 	dev_dbg(&client->dev, "data_format_model_type %d\n", type);
 
-	rval = smiapp_read(sensor, SMIAPP_REG_U8_PIXEL_ORDER,
-			   &pixel_order);
+	rval = ccs_read(sensor, PIXEL_ORDER, &pixel_order);
 	if (rval)
 		return rval;
 
@@ -1054,22 +1036,20 @@ static int smiapp_read_nvm_page(struct smiapp_sensor *sensor, u32 p, u8 *nvm,
 
 	*status = 0;
 
-	rval = smiapp_write(sensor,
-			    SMIAPP_REG_U8_DATA_TRANSFER_IF_1_PAGE_SELECT, p);
+	rval = ccs_write(sensor, DATA_TRANSFER_IF_1_PAGE_SELECT, p);
 	if (rval)
 		return rval;
 
-	rval = smiapp_write(sensor, SMIAPP_REG_U8_DATA_TRANSFER_IF_1_CTRL,
-			    SMIAPP_DATA_TRANSFER_IF_1_CTRL_EN);
+	rval = ccs_write(sensor, DATA_TRANSFER_IF_1_CTRL,
+			 CCS_DATA_TRANSFER_IF_1_CTRL_ENABLE);
 	if (rval)
 		return rval;
 
-	rval = smiapp_read(sensor, SMIAPP_REG_U8_DATA_TRANSFER_IF_1_STATUS,
-			   &s);
+	rval = ccs_read(sensor, DATA_TRANSFER_IF_1_STATUS, &s);
 	if (rval)
 		return rval;
 
-	if (s & SMIAPP_DATA_TRANSFER_IF_1_STATUS_EUSAGE) {
+	if (s & CCS_DATA_TRANSFER_IF_1_STATUS_IMPROPER_IF_USAGE) {
 		*status = s;
 		return -ENODATA;
 	}
@@ -1077,14 +1057,10 @@ static int smiapp_read_nvm_page(struct smiapp_sensor *sensor, u32 p, u8 *nvm,
 	if (CCS_LIM(sensor, DATA_TRANSFER_IF_CAPABILITY) &
 	    CCS_DATA_TRANSFER_IF_CAPABILITY_POLLING) {
 		for (i = 1000; i > 0; i--) {
-			if (s & SMIAPP_DATA_TRANSFER_IF_1_STATUS_RD_READY)
+			if (s & CCS_DATA_TRANSFER_IF_1_STATUS_READ_IF_READY)
 				break;
 
-			rval = smiapp_read(
-				sensor,
-				SMIAPP_REG_U8_DATA_TRANSFER_IF_1_STATUS,
-				&s);
-
+			rval = ccs_read(sensor, DATA_TRANSFER_IF_1_STATUS, &s);
 			if (rval)
 				return rval;
 		}
@@ -1093,12 +1069,10 @@ static int smiapp_read_nvm_page(struct smiapp_sensor *sensor, u32 p, u8 *nvm,
 			return -ETIMEDOUT;
 	}
 
-	for (i = 0; i < SMIAPP_NVM_PAGE_SIZE; i++) {
+	for (i = 0; i <= CCS_LIM_DATA_TRANSFER_IF_1_DATA_MAX_P; i++) {
 		u32 v;
 
-		rval = smiapp_read(sensor,
-				   SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_0 + i,
-				   &v);
+		rval = ccs_read(sensor, DATA_TRANSFER_IF_1_DATA(i), &v);
 		if (rval)
 			return rval;
 
@@ -1115,20 +1089,21 @@ static int smiapp_read_nvm(struct smiapp_sensor *sensor, unsigned char *nvm,
 	u32 p;
 	int rval = 0, rval2;
 
-	for (p = 0; p < nvm_size / SMIAPP_NVM_PAGE_SIZE && !rval; p++) {
+	for (p = 0; p < nvm_size / (CCS_LIM_DATA_TRANSFER_IF_1_DATA_MAX_P + 1)
+		     && !rval; p++) {
 		rval = smiapp_read_nvm_page(sensor, p, nvm, &status);
-		nvm += SMIAPP_NVM_PAGE_SIZE;
+		nvm += CCS_LIM_DATA_TRANSFER_IF_1_DATA_MAX_P + 1;
 	}
 
 	if (rval == -ENODATA &&
-	    status & SMIAPP_DATA_TRANSFER_IF_1_STATUS_EUSAGE)
+	    status & CCS_DATA_TRANSFER_IF_1_STATUS_IMPROPER_IF_USAGE)
 		rval = 0;
 
-	rval2 = smiapp_write(sensor, SMIAPP_REG_U8_DATA_TRANSFER_IF_1_CTRL, 0);
+	rval2 = ccs_write(sensor, DATA_TRANSFER_IF_1_CTRL, 0);
 	if (rval < 0)
 		return rval;
 	else
-		return rval2 ?: p * SMIAPP_NVM_PAGE_SIZE;
+		return rval2 ?: p * (CCS_LIM_DATA_TRANSFER_IF_1_DATA_MAX_P + 1);
 }
 
 /*
@@ -1144,16 +1119,15 @@ static int smiapp_change_cci_addr(struct smiapp_sensor *sensor)
 
 	client->addr = sensor->hwcfg->i2c_addr_dfl;
 
-	rval = smiapp_write(sensor,
-			    SMIAPP_REG_U8_CCI_ADDRESS_CONTROL,
-			    sensor->hwcfg->i2c_addr_alt << 1);
+	rval = ccs_write(sensor, CCI_ADDRESS_CTRL,
+			 sensor->hwcfg->i2c_addr_alt << 1);
 	if (rval)
 		return rval;
 
 	client->addr = sensor->hwcfg->i2c_addr_alt;
 
 	/* verify addr change went ok */
-	rval = smiapp_read(sensor, SMIAPP_REG_U8_CCI_ADDRESS_CONTROL, &val);
+	rval = ccs_read(sensor, CCI_ADDRESS_CTRL, &val);
 	if (rval)
 		return rval;
 
@@ -1259,34 +1233,30 @@ static int smiapp_setup_flash_strobe(struct smiapp_sensor *sensor)
 	strobe_width_high_rs = (tmp + strobe_adjustment - 1) /
 				strobe_adjustment;
 
-	rval = smiapp_write(sensor, SMIAPP_REG_U8_FLASH_MODE_RS,
-			    strobe_setup->mode);
+	rval = ccs_write(sensor, FLASH_MODE_RS, strobe_setup->mode);
 	if (rval < 0)
 		goto out;
 
-	rval = smiapp_write(sensor, SMIAPP_REG_U8_FLASH_STROBE_ADJUSTMENT,
-			    strobe_adjustment);
+	rval = ccs_write(sensor, FLASH_STROBE_ADJUSTMENT, strobe_adjustment);
 	if (rval < 0)
 		goto out;
 
-	rval = smiapp_write(
-		sensor, SMIAPP_REG_U16_TFLASH_STROBE_WIDTH_HIGH_RS_CTRL,
-		strobe_width_high_rs);
+	rval = ccs_write(sensor, TFLASH_STROBE_WIDTH_HIGH_RS_CTRL,
+			 strobe_width_high_rs);
 	if (rval < 0)
 		goto out;
 
-	rval = smiapp_write(sensor, SMIAPP_REG_U16_TFLASH_STROBE_DELAY_RS_CTRL,
-			    strobe_setup->strobe_delay);
+	rval = ccs_write(sensor, TFLASH_STROBE_DELAY_RS_CTRL,
+			 strobe_setup->strobe_delay);
 	if (rval < 0)
 		goto out;
 
-	rval = smiapp_write(sensor, SMIAPP_REG_U16_FLASH_STROBE_START_POINT,
-			    strobe_setup->stobe_start_point);
+	rval = ccs_write(sensor, FLASH_STROBE_START_POINT,
+			 strobe_setup->stobe_start_point);
 	if (rval < 0)
 		goto out;
 
-	rval = smiapp_write(sensor, SMIAPP_REG_U8_FLASH_TRIGGER_RS,
-			    strobe_setup->trigger);
+	rval = ccs_write(sensor, FLASH_TRIGGER_RS, strobe_setup->trigger);
 
 out:
 	sensor->hwcfg->strobe_setup->trigger = 0;
@@ -1349,8 +1319,7 @@ static int smiapp_power_on(struct device *dev)
 		}
 	}
 
-	rval = smiapp_write(sensor, SMIAPP_REG_U8_SOFTWARE_RESET,
-			    SMIAPP_SOFTWARE_RESET);
+	rval = ccs_write(sensor, SOFTWARE_RESET, CCS_SOFTWARE_RESET_ON);
 	if (rval < 0) {
 		dev_err(dev, "software reset failed\n");
 		goto out_cci_addr_fail;
@@ -1364,45 +1333,42 @@ static int smiapp_power_on(struct device *dev)
 		}
 	}
 
-	rval = smiapp_write(sensor, SMIAPP_REG_U16_COMPRESSION_MODE,
-			    SMIAPP_COMPRESSION_MODE_SIMPLE_PREDICTOR);
+	rval = ccs_write(sensor, COMPRESSION_MODE,
+			 CCS_COMPRESSION_MODE_DPCM_PCM_SIMPLE);
 	if (rval) {
 		dev_err(dev, "compression mode set failed\n");
 		goto out_cci_addr_fail;
 	}
 
-	rval = smiapp_write(
-		sensor, SMIAPP_REG_U16_EXTCLK_FREQUENCY_MHZ,
-		sensor->hwcfg->ext_clk / (1000000 / (1 << 8)));
+	rval = ccs_write(sensor, EXTCLK_FREQUENCY_MHZ,
+			 sensor->hwcfg->ext_clk / (1000000 / (1 << 8)));
 	if (rval) {
 		dev_err(dev, "extclk frequency set failed\n");
 		goto out_cci_addr_fail;
 	}
 
-	rval = smiapp_write(sensor, SMIAPP_REG_U8_CSI_LANE_MODE,
-			    sensor->hwcfg->lanes - 1);
+	rval = ccs_write(sensor, CSI_LANE_MODE, sensor->hwcfg->lanes - 1);
 	if (rval) {
 		dev_err(dev, "csi lane mode set failed\n");
 		goto out_cci_addr_fail;
 	}
 
-	rval = smiapp_write(sensor, SMIAPP_REG_U8_FAST_STANDBY_CTRL,
-			    SMIAPP_FAST_STANDBY_CTRL_IMMEDIATE);
+	rval = ccs_write(sensor, FAST_STANDBY_CTRL,
+			 CCS_FAST_STANDBY_CTRL_FRAME_TRUNCATION);
 	if (rval) {
 		dev_err(dev, "fast standby set failed\n");
 		goto out_cci_addr_fail;
 	}
 
-	rval = smiapp_write(sensor, SMIAPP_REG_U8_CSI_SIGNALLING_MODE,
-			    sensor->hwcfg->csi_signalling_mode);
+	rval = ccs_write(sensor, CSI_SIGNALING_MODE,
+			 sensor->hwcfg->csi_signalling_mode);
 	if (rval) {
 		dev_err(dev, "csi signalling mode set failed\n");
 		goto out_cci_addr_fail;
 	}
 
 	/* DPHY control done by sensor based on requested link rate */
-	rval = smiapp_write(sensor, SMIAPP_REG_U8_DPHY_CTRL,
-			    SMIAPP_DPHY_CTRL_UI);
+	rval = ccs_write(sensor, PHY_CTRL, CCS_PHY_CTRL_UI);
 	if (rval < 0)
 		goto out_cci_addr_fail;
 
@@ -1439,9 +1405,7 @@ static int smiapp_power_off(struct device *dev)
 	 * will fail. So do a soft reset explicitly here.
 	 */
 	if (sensor->hwcfg->i2c_addr_alt)
-		smiapp_write(sensor,
-			     SMIAPP_REG_U8_SOFTWARE_RESET,
-			     SMIAPP_SOFTWARE_RESET);
+		ccs_write(sensor, SOFTWARE_RESET, CCS_SOFTWARE_RESET_ON);
 
 	gpiod_set_value(sensor->xshutdown, 0);
 	clk_disable_unprepare(sensor->ext_clk);
@@ -1464,9 +1428,9 @@ static int smiapp_start_streaming(struct smiapp_sensor *sensor)
 
 	mutex_lock(&sensor->mutex);
 
-	rval = smiapp_write(sensor, SMIAPP_REG_U16_CSI_DATA_FORMAT,
-			    (sensor->csi_format->width << 8) |
-			    sensor->csi_format->compressed);
+	rval = ccs_write(sensor, CSI_DATA_FORMAT,
+			 (sensor->csi_format->width << 8) |
+			 sensor->csi_format->compressed);
 	if (rval)
 		goto out;
 
@@ -1479,14 +1443,13 @@ static int smiapp_start_streaming(struct smiapp_sensor *sensor)
 			(sensor->binning_horizontal << 4)
 			| sensor->binning_vertical;
 
-		rval = smiapp_write(
-			sensor, SMIAPP_REG_U8_BINNING_TYPE, binning_type);
+		rval = ccs_write(sensor, BINNING_TYPE, binning_type);
 		if (rval < 0)
 			goto out;
 
 		binning_mode = 1;
 	}
-	rval = smiapp_write(sensor, SMIAPP_REG_U8_BINNING_MODE, binning_mode);
+	rval = ccs_write(sensor, BINNING_MODE, binning_mode);
 	if (rval < 0)
 		goto out;
 
@@ -1496,26 +1459,26 @@ static int smiapp_start_streaming(struct smiapp_sensor *sensor)
 		goto out;
 
 	/* Analog crop start coordinates */
-	rval = smiapp_write(sensor, SMIAPP_REG_U16_X_ADDR_START,
-			    sensor->pixel_array->crop[SMIAPP_PA_PAD_SRC].left);
+	rval = ccs_write(sensor, X_ADDR_START,
+			 sensor->pixel_array->crop[SMIAPP_PA_PAD_SRC].left);
 	if (rval < 0)
 		goto out;
 
-	rval = smiapp_write(sensor, SMIAPP_REG_U16_Y_ADDR_START,
-			    sensor->pixel_array->crop[SMIAPP_PA_PAD_SRC].top);
+	rval = ccs_write(sensor, Y_ADDR_START,
+			 sensor->pixel_array->crop[SMIAPP_PA_PAD_SRC].top);
 	if (rval < 0)
 		goto out;
 
 	/* Analog crop end coordinates */
-	rval = smiapp_write(
-		sensor, SMIAPP_REG_U16_X_ADDR_END,
+	rval = ccs_write(
+		sensor, X_ADDR_END,
 		sensor->pixel_array->crop[SMIAPP_PA_PAD_SRC].left
 		+ sensor->pixel_array->crop[SMIAPP_PA_PAD_SRC].width - 1);
 	if (rval < 0)
 		goto out;
 
-	rval = smiapp_write(
-		sensor, SMIAPP_REG_U16_Y_ADDR_END,
+	rval = ccs_write(
+		sensor, Y_ADDR_END,
 		sensor->pixel_array->crop[SMIAPP_PA_PAD_SRC].top
 		+ sensor->pixel_array->crop[SMIAPP_PA_PAD_SRC].height - 1);
 	if (rval < 0)
@@ -1529,26 +1492,26 @@ static int smiapp_start_streaming(struct smiapp_sensor *sensor)
 	/* Digital crop */
 	if (CCS_LIM(sensor, DIGITAL_CROP_CAPABILITY)
 	    == CCS_DIGITAL_CROP_CAPABILITY_INPUT_CROP) {
-		rval = smiapp_write(
-			sensor, SMIAPP_REG_U16_DIGITAL_CROP_X_OFFSET,
+		rval = ccs_write(
+			sensor, DIGITAL_CROP_X_OFFSET,
 			sensor->scaler->crop[SMIAPP_PAD_SINK].left);
 		if (rval < 0)
 			goto out;
 
-		rval = smiapp_write(
-			sensor, SMIAPP_REG_U16_DIGITAL_CROP_Y_OFFSET,
+		rval = ccs_write(
+			sensor, DIGITAL_CROP_Y_OFFSET,
 			sensor->scaler->crop[SMIAPP_PAD_SINK].top);
 		if (rval < 0)
 			goto out;
 
-		rval = smiapp_write(
-			sensor, SMIAPP_REG_U16_DIGITAL_CROP_IMAGE_WIDTH,
+		rval = ccs_write(
+			sensor, DIGITAL_CROP_IMAGE_WIDTH,
 			sensor->scaler->crop[SMIAPP_PAD_SINK].width);
 		if (rval < 0)
 			goto out;
 
-		rval = smiapp_write(
-			sensor, SMIAPP_REG_U16_DIGITAL_CROP_IMAGE_HEIGHT,
+		rval = ccs_write(
+			sensor, DIGITAL_CROP_IMAGE_HEIGHT,
 			sensor->scaler->crop[SMIAPP_PAD_SINK].height);
 		if (rval < 0)
 			goto out;
@@ -1557,24 +1520,22 @@ static int smiapp_start_streaming(struct smiapp_sensor *sensor)
 	/* Scaling */
 	if (CCS_LIM(sensor, SCALING_CAPABILITY)
 	    != CCS_SCALING_CAPABILITY_NONE) {
-		rval = smiapp_write(sensor, SMIAPP_REG_U16_SCALING_MODE,
-				    sensor->scaling_mode);
+		rval = ccs_write(sensor, SCALING_MODE, sensor->scaling_mode);
 		if (rval < 0)
 			goto out;
 
-		rval = smiapp_write(sensor, SMIAPP_REG_U16_SCALE_M,
-				    sensor->scale_m);
+		rval = ccs_write(sensor, SCALE_M, sensor->scale_m);
 		if (rval < 0)
 			goto out;
 	}
 
 	/* Output size from sensor */
-	rval = smiapp_write(sensor, SMIAPP_REG_U16_X_OUTPUT_SIZE,
-			    sensor->src->crop[SMIAPP_PAD_SRC].width);
+	rval = ccs_write(sensor, X_OUTPUT_SIZE,
+			 sensor->src->crop[SMIAPP_PAD_SRC].width);
 	if (rval < 0)
 		goto out;
-	rval = smiapp_write(sensor, SMIAPP_REG_U16_Y_OUTPUT_SIZE,
-			    sensor->src->crop[SMIAPP_PAD_SRC].height);
+	rval = ccs_write(sensor, Y_OUTPUT_SIZE,
+			 sensor->src->crop[SMIAPP_PAD_SRC].height);
 	if (rval < 0)
 		goto out;
 
@@ -1594,8 +1555,7 @@ static int smiapp_start_streaming(struct smiapp_sensor *sensor)
 		goto out;
 	}
 
-	rval = smiapp_write(sensor, SMIAPP_REG_U8_MODE_SELECT,
-			    SMIAPP_MODE_SELECT_STREAMING);
+	rval = ccs_write(sensor, MODE_SELECT, CCS_MODE_SELECT_STREAMING);
 
 out:
 	mutex_unlock(&sensor->mutex);
@@ -1609,8 +1569,7 @@ static int smiapp_stop_streaming(struct smiapp_sensor *sensor)
 	int rval;
 
 	mutex_lock(&sensor->mutex);
-	rval = smiapp_write(sensor, SMIAPP_REG_U8_MODE_SELECT,
-			    SMIAPP_MODE_SELECT_SOFTWARE_STANDBY);
+	rval = ccs_write(sensor, MODE_SELECT, CCS_MODE_SELECT_SOFTWARE_STANDBY);
 	if (rval)
 		goto out;
 
@@ -1828,7 +1787,7 @@ static void smiapp_propagate(struct v4l2_subdev *subdev,
 				sensor->scale_m =
 					CCS_LIM(sensor, SCALER_N_MIN);
 				sensor->scaling_mode =
-					SMIAPP_SCALING_MODE_NONE;
+					CCS_SCALING_MODE_NO_SCALING;
 			} else if (ssd == sensor->binner) {
 				sensor->binning_horizontal = 1;
 				sensor->binning_vertical = 1;
@@ -2063,7 +2022,7 @@ static void smiapp_set_compose_scaler(struct v4l2_subdev *subdev,
 	struct smiapp_sensor *sensor = to_smiapp_sensor(subdev);
 	u32 min, max, a, b, max_m;
 	u32 scale_m = CCS_LIM(sensor, SCALER_N_MIN);
-	int mode = SMIAPP_SCALING_MODE_HORIZONTAL;
+	int mode = CCS_SCALING_MODE_HORIZONTAL;
 	u32 try[4];
 	u32 ntry = 0;
 	unsigned int i;
@@ -2123,7 +2082,7 @@ static void smiapp_set_compose_scaler(struct v4l2_subdev *subdev,
 
 		if (this > best) {
 			scale_m = try[i];
-			mode = SMIAPP_SCALING_MODE_HORIZONTAL;
+			mode = CCS_SCALING_MODE_HORIZONTAL;
 			best = this;
 		}
 
@@ -2494,26 +2453,24 @@ static int smiapp_identify_module(struct smiapp_sensor *sensor)
 		rval = smiapp_read_8only(sensor, SMIAPP_REG_U8_MANUFACTURER_ID,
 					 &minfo->smia_manufacturer_id);
 	if (!rval)
-		rval = smiapp_read_8only(sensor, SMIAPP_REG_U16_MODEL_ID,
+		rval = smiapp_read_8only(sensor, CCS_R_MODULE_MODEL_ID,
 					 &minfo->model_id);
 	if (!rval)
 		rval = smiapp_read_8only(sensor,
-					 SMIAPP_REG_U8_REVISION_NUMBER_MAJOR,
+					 CCS_R_MODULE_REVISION_NUMBER_MAJOR,
 					 &minfo->revision_number_major);
 	if (!rval)
 		rval = smiapp_read_8only(sensor,
-					 SMIAPP_REG_U8_REVISION_NUMBER_MINOR,
+					 CCS_R_MODULE_REVISION_NUMBER_MINOR,
 					 &minfo->revision_number_minor);
 	if (!rval)
-		rval = smiapp_read_8only(sensor,
-					 SMIAPP_REG_U8_MODULE_DATE_YEAR,
+		rval = smiapp_read_8only(sensor, CCS_R_MODULE_DATE_YEAR,
 					 &minfo->module_year);
 	if (!rval)
-		rval = smiapp_read_8only(sensor,
-					 SMIAPP_REG_U8_MODULE_DATE_MONTH,
+		rval = smiapp_read_8only(sensor, CCS_R_MODULE_DATE_MONTH,
 					 &minfo->module_month);
 	if (!rval)
-		rval = smiapp_read_8only(sensor, SMIAPP_REG_U8_MODULE_DATE_DAY,
+		rval = smiapp_read_8only(sensor, CCS_R_MODULE_DATE_DAY,
 					 &minfo->module_day);
 
 	/* Sensor info */
@@ -2522,19 +2479,19 @@ static int smiapp_identify_module(struct smiapp_sensor *sensor)
 				&minfo->sensor_mipi_manufacturer_id);
 	if (!rval && !minfo->sensor_mipi_manufacturer_id)
 		rval = smiapp_read_8only(sensor,
-					 SMIAPP_REG_U8_SENSOR_MANUFACTURER_ID,
+					 CCS_R_SENSOR_MANUFACTURER_ID,
 					 &minfo->sensor_smia_manufacturer_id);
 	if (!rval)
 		rval = smiapp_read_8only(sensor,
-					 SMIAPP_REG_U16_SENSOR_MODEL_ID,
+					 CCS_R_SENSOR_MODEL_ID,
 					 &minfo->sensor_model_id);
 	if (!rval)
 		rval = smiapp_read_8only(sensor,
-					 SMIAPP_REG_U8_SENSOR_REVISION_NUMBER,
+					 CCS_R_SENSOR_REVISION_NUMBER,
 					 &minfo->sensor_revision_number);
 	if (!rval)
 		rval = smiapp_read_8only(sensor,
-					 SMIAPP_REG_U8_SENSOR_FIRMWARE_VERSION,
+					 CCS_R_SENSOR_FIRMWARE_VERSION,
 					 &minfo->sensor_firmware_version);
 
 	/* SMIA */
@@ -2919,7 +2876,7 @@ static struct smiapp_hwconfig *smiapp_get_hwconfig(struct device *dev)
 
 	switch (bus_cfg.bus_type) {
 	case V4L2_MBUS_CSI2_DPHY:
-		hwcfg->csi_signalling_mode = SMIAPP_CSI_SIGNALLING_MODE_CSI2;
+		hwcfg->csi_signalling_mode = CCS_CSI_SIGNALING_MODE_CSI_2_DPHY;
 		hwcfg->lanes = bus_cfg.bus.mipi_csi2.num_data_lanes;
 		break;
 	case V4L2_MBUS_CCP2:
@@ -3095,8 +3052,9 @@ static int smiapp_probe(struct i2c_client *client)
 	 */
 	if (sensor->hwcfg->module_board_orient ==
 	    SMIAPP_MODULE_BOARD_ORIENT_180)
-		sensor->hvflip_inv_mask = SMIAPP_IMAGE_ORIENTATION_HFLIP |
-					  SMIAPP_IMAGE_ORIENTATION_VFLIP;
+		sensor->hvflip_inv_mask =
+			CCS_IMAGE_ORIENTATION_HORIZONTAL_MIRROR |
+			CCS_IMAGE_ORIENTATION_VERTICAL_FLIP;
 
 	rval = smiapp_call_quirk(sensor, limits);
 	if (rval) {
diff --git a/drivers/media/i2c/smiapp/smiapp.h b/drivers/media/i2c/smiapp/smiapp.h
index 1a67cf485dcc..c6e4e05a7522 100644
--- a/drivers/media/i2c/smiapp/smiapp.h
+++ b/drivers/media/i2c/smiapp/smiapp.h
@@ -15,6 +15,8 @@
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-subdev.h>
 
+#include "ccs-regs.h"
+
 #include "smiapp-pll.h"
 #include "smiapp-reg-defs.h"
 #include "smiapp-regs.h"
@@ -220,7 +222,7 @@ struct smiapp_sensor {
 	struct gpio_desc *xshutdown;
 	void *ccs_limits;
 	u8 nbinning_subtypes;
-	struct smiapp_binning_subtype binning_subtypes[SMIAPP_BINNING_SUBTYPES];
+	struct smiapp_binning_subtype binning_subtypes[CCS_LIM_BINNING_SUB_TYPE_MAX_N + 1];
 	u32 mbus_frame_fmts;
 	const struct smiapp_csi_data_format *csi_format;
 	const struct smiapp_csi_data_format *internal_csi_format;
-- 
2.27.0

