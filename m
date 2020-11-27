Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E13082C634F
	for <lists+linux-media@lfdr.de>; Fri, 27 Nov 2020 11:38:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729352AbgK0KiT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Nov 2020 05:38:19 -0500
Received: from retiisi.eu ([95.216.213.190]:44890 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728467AbgK0KiJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Nov 2020 05:38:09 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 5D699634C94;
        Fri, 27 Nov 2020 12:37:16 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, mchehab@kernel.org
Subject: [PATCH v2 10/29] smiapp: Switch to CCS limits
Date:   Fri, 27 Nov 2020 12:33:06 +0200
Message-Id: <20201127103325.29814-11-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201127103325.29814-1-sakari.ailus@linux.intel.com>
References: <20201127103325.29814-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the CCS limit definitions instead of the SMIA ones. This allows
accessing CCS capabilities where needed as well as dropping the old SMIA
limits.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/smiapp/Makefile        |   2 +-
 drivers/media/i2c/smiapp/smiapp-core.c   | 255 ++++++++++-------------
 drivers/media/i2c/smiapp/smiapp-limits.c | 118 -----------
 drivers/media/i2c/smiapp/smiapp-limits.h | 114 ----------
 drivers/media/i2c/smiapp/smiapp-quirk.c  |  25 +--
 drivers/media/i2c/smiapp/smiapp-quirk.h  |   3 -
 drivers/media/i2c/smiapp/smiapp.h        |  10 -
 7 files changed, 113 insertions(+), 414 deletions(-)
 delete mode 100644 drivers/media/i2c/smiapp/smiapp-limits.c
 delete mode 100644 drivers/media/i2c/smiapp/smiapp-limits.h

diff --git a/drivers/media/i2c/smiapp/Makefile b/drivers/media/i2c/smiapp/Makefile
index efb643d2acac..a7bf53dd4a63 100644
--- a/drivers/media/i2c/smiapp/Makefile
+++ b/drivers/media/i2c/smiapp/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 smiapp-objs			+= smiapp-core.o smiapp-regs.o \
-				   smiapp-quirk.o smiapp-limits.o ccs-limits.o
+				   smiapp-quirk.o ccs-limits.o
 obj-$(CONFIG_VIDEO_SMIAPP)	+= smiapp.o
 
 ccflags-y += -I $(srctree)/drivers/media/i2c
diff --git a/drivers/media/i2c/smiapp/smiapp-core.c b/drivers/media/i2c/smiapp/smiapp-core.c
index 4b33b9a1d52c..2c1a13507965 100644
--- a/drivers/media/i2c/smiapp/smiapp-core.c
+++ b/drivers/media/i2c/smiapp/smiapp-core.c
@@ -64,45 +64,6 @@ static const struct smiapp_module_ident smiapp_module_idents[] = {
  *
  */
 
-static u32 smiapp_get_limit(struct smiapp_sensor *sensor,
-				 unsigned int limit)
-{
-	if (WARN_ON(limit >= SMIAPP_LIMIT_LAST))
-		return 1;
-
-	return sensor->limits[limit];
-}
-
-#define SMIA_LIM(sensor, limit) \
-	smiapp_get_limit(sensor, SMIAPP_LIMIT_##limit)
-
-static int smiapp_read_all_smia_limits(struct smiapp_sensor *sensor)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
-	unsigned int i;
-	int rval;
-
-	for (i = 0; i < SMIAPP_LIMIT_LAST; i++) {
-		u32 val;
-
-		rval = smiapp_read(
-			sensor, smiapp_reg_limits[i].addr, &val);
-		if (rval)
-			return rval;
-
-		sensor->limits[i] = val;
-
-		dev_dbg(&client->dev, "0x%8.8x \"%s\" = %u, 0x%x\n",
-			smiapp_reg_limits[i].addr,
-			smiapp_reg_limits[i].what, val, val);
-	}
-
-	if (SMIA_LIM(sensor, SCALER_N_MIN) == 0)
-		smiapp_replace_limit(sensor, SMIAPP_LIMIT_SCALER_N_MIN, 16);
-
-	return 0;
-}
-
 static void ccs_assign_limit(void *ptr, unsigned int width, u32 val)
 {
 	switch (width) {
@@ -253,6 +214,9 @@ static int ccs_read_all_limits(struct smiapp_sensor *sensor)
 
 	sensor->ccs_limits = alloc;
 
+	if (CCS_LIM(sensor, SCALER_N_MIN) < 16)
+		ccs_replace_limit(sensor, CCS_L_SCALER_N_MIN, 0, 16);
+
 	return 0;
 
 out_err:
@@ -444,35 +408,35 @@ static int smiapp_pll_try(struct smiapp_sensor *sensor,
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
 	struct smiapp_pll_limits lim = {
-		.min_pre_pll_clk_div = SMIA_LIM(sensor, MIN_PRE_PLL_CLK_DIV),
-		.max_pre_pll_clk_div = SMIA_LIM(sensor, MAX_PRE_PLL_CLK_DIV),
-		.min_pll_ip_freq_hz = SMIA_LIM(sensor, MIN_PLL_IP_FREQ_HZ),
-		.max_pll_ip_freq_hz = SMIA_LIM(sensor, MAX_PLL_IP_FREQ_HZ),
-		.min_pll_multiplier = SMIA_LIM(sensor, MIN_PLL_MULTIPLIER),
-		.max_pll_multiplier = SMIA_LIM(sensor, MAX_PLL_MULTIPLIER),
-		.min_pll_op_freq_hz = SMIA_LIM(sensor, MIN_PLL_OP_FREQ_HZ),
-		.max_pll_op_freq_hz = SMIA_LIM(sensor, MAX_PLL_OP_FREQ_HZ),
-
-		.op.min_sys_clk_div = SMIA_LIM(sensor, MIN_OP_SYS_CLK_DIV),
-		.op.max_sys_clk_div = SMIA_LIM(sensor, MAX_OP_SYS_CLK_DIV),
-		.op.min_pix_clk_div = SMIA_LIM(sensor, MIN_OP_PIX_CLK_DIV),
-		.op.max_pix_clk_div = SMIA_LIM(sensor, MAX_OP_PIX_CLK_DIV),
-		.op.min_sys_clk_freq_hz = SMIA_LIM(sensor, MIN_OP_SYS_CLK_FREQ_HZ),
-		.op.max_sys_clk_freq_hz = SMIA_LIM(sensor, MAX_OP_SYS_CLK_FREQ_HZ),
-		.op.min_pix_clk_freq_hz = SMIA_LIM(sensor, MIN_OP_PIX_CLK_FREQ_HZ),
-		.op.max_pix_clk_freq_hz = SMIA_LIM(sensor, MAX_OP_PIX_CLK_FREQ_HZ),
-
-		.vt.min_sys_clk_div = SMIA_LIM(sensor, MIN_VT_SYS_CLK_DIV),
-		.vt.max_sys_clk_div = SMIA_LIM(sensor, MAX_VT_SYS_CLK_DIV),
-		.vt.min_pix_clk_div = SMIA_LIM(sensor, MIN_VT_PIX_CLK_DIV),
-		.vt.max_pix_clk_div = SMIA_LIM(sensor, MAX_VT_PIX_CLK_DIV),
-		.vt.min_sys_clk_freq_hz = SMIA_LIM(sensor, MIN_VT_SYS_CLK_FREQ_HZ),
-		.vt.max_sys_clk_freq_hz = SMIA_LIM(sensor, MAX_VT_SYS_CLK_FREQ_HZ),
-		.vt.min_pix_clk_freq_hz = SMIA_LIM(sensor, MIN_VT_PIX_CLK_FREQ_HZ),
-		.vt.max_pix_clk_freq_hz = SMIA_LIM(sensor, MAX_VT_PIX_CLK_FREQ_HZ),
-
-		.min_line_length_pck_bin = SMIA_LIM(sensor, MIN_LINE_LENGTH_PCK_BIN),
-		.min_line_length_pck = SMIA_LIM(sensor, MIN_LINE_LENGTH_PCK),
+		.min_pre_pll_clk_div = CCS_LIM(sensor, MIN_PRE_PLL_CLK_DIV),
+		.max_pre_pll_clk_div = CCS_LIM(sensor, MAX_PRE_PLL_CLK_DIV),
+		.min_pll_ip_freq_hz = CCS_LIM(sensor, MIN_PLL_IP_CLK_FREQ_MHZ),
+		.max_pll_ip_freq_hz = CCS_LIM(sensor, MAX_PLL_IP_CLK_FREQ_MHZ),
+		.min_pll_multiplier = CCS_LIM(sensor, MIN_PLL_MULTIPLIER),
+		.max_pll_multiplier = CCS_LIM(sensor, MAX_PLL_MULTIPLIER),
+		.min_pll_op_freq_hz = CCS_LIM(sensor, MIN_PLL_OP_CLK_FREQ_MHZ),
+		.max_pll_op_freq_hz = CCS_LIM(sensor, MAX_PLL_OP_CLK_FREQ_MHZ),
+
+		.op.min_sys_clk_div = CCS_LIM(sensor, MIN_OP_SYS_CLK_DIV),
+		.op.max_sys_clk_div = CCS_LIM(sensor, MAX_OP_SYS_CLK_DIV),
+		.op.min_pix_clk_div = CCS_LIM(sensor, MIN_OP_PIX_CLK_DIV),
+		.op.max_pix_clk_div = CCS_LIM(sensor, MAX_OP_PIX_CLK_DIV),
+		.op.min_sys_clk_freq_hz = CCS_LIM(sensor, MIN_OP_SYS_CLK_FREQ_MHZ),
+		.op.max_sys_clk_freq_hz = CCS_LIM(sensor, MAX_OP_SYS_CLK_FREQ_MHZ),
+		.op.min_pix_clk_freq_hz = CCS_LIM(sensor, MIN_OP_PIX_CLK_FREQ_MHZ),
+		.op.max_pix_clk_freq_hz = CCS_LIM(sensor, MAX_OP_PIX_CLK_FREQ_MHZ),
+
+		.vt.min_sys_clk_div = CCS_LIM(sensor, MIN_VT_SYS_CLK_DIV),
+		.vt.max_sys_clk_div = CCS_LIM(sensor, MAX_VT_SYS_CLK_DIV),
+		.vt.min_pix_clk_div = CCS_LIM(sensor, MIN_VT_PIX_CLK_DIV),
+		.vt.max_pix_clk_div = CCS_LIM(sensor, MAX_VT_PIX_CLK_DIV),
+		.vt.min_sys_clk_freq_hz = CCS_LIM(sensor, MIN_VT_SYS_CLK_FREQ_MHZ),
+		.vt.max_sys_clk_freq_hz = CCS_LIM(sensor, MAX_VT_SYS_CLK_FREQ_MHZ),
+		.vt.min_pix_clk_freq_hz = CCS_LIM(sensor, MIN_VT_PIX_CLK_FREQ_MHZ),
+		.vt.max_pix_clk_freq_hz = CCS_LIM(sensor, MAX_VT_PIX_CLK_FREQ_MHZ),
+
+		.min_line_length_pck_bin = CCS_LIM(sensor, MIN_LINE_LENGTH_PCK_BIN),
+		.min_line_length_pck = CCS_LIM(sensor, MIN_LINE_LENGTH_PCK),
 	};
 
 	return smiapp_pll_calculate(&client->dev, &lim, pll);
@@ -515,7 +479,7 @@ static void __smiapp_update_exposure_limits(struct smiapp_sensor *sensor)
 
 	max = sensor->pixel_array->crop[SMIAPP_PA_PAD_SRC].height
 		+ sensor->vblank->val
-		- SMIA_LIM(sensor, COARSE_INTEGRATION_TIME_MAX_MARGIN);
+		- CCS_LIM(sensor, COARSE_INTEGRATION_TIME_MAX_MARGIN);
 
 	__v4l2_ctrl_modify_range(ctrl, ctrl->minimum, max, ctrl->step, max);
 }
@@ -770,10 +734,10 @@ static int smiapp_init_controls(struct smiapp_sensor *sensor)
 	sensor->analog_gain = v4l2_ctrl_new_std(
 		&sensor->pixel_array->ctrl_handler, &smiapp_ctrl_ops,
 		V4L2_CID_ANALOGUE_GAIN,
-		SMIA_LIM(sensor, ANALOGUE_GAIN_CODE_MIN),
-		SMIA_LIM(sensor, ANALOGUE_GAIN_CODE_MAX),
-		max(SMIA_LIM(sensor, ANALOGUE_GAIN_CODE_STEP), 1U),
-		SMIA_LIM(sensor, ANALOGUE_GAIN_CODE_MIN));
+		CCS_LIM(sensor, ANALOG_GAIN_CODE_MIN),
+		CCS_LIM(sensor, ANALOG_GAIN_CODE_MAX),
+		max(CCS_LIM(sensor, ANALOG_GAIN_CODE_STEP), 1U),
+		CCS_LIM(sensor, ANALOG_GAIN_CODE_MIN));
 
 	/* Exposure limits will be updated soon, use just something here. */
 	sensor->exposure = v4l2_ctrl_new_std(
@@ -1032,21 +996,21 @@ static void smiapp_update_blanking(struct smiapp_sensor *sensor)
 	int min, max;
 
 	if (sensor->binning_vertical > 1 || sensor->binning_horizontal > 1) {
-		min_fll = SMIA_LIM(sensor, MIN_FRAME_LENGTH_LINES_BIN);
-		max_fll = SMIA_LIM(sensor, MAX_FRAME_LENGTH_LINES_BIN);
-		min_llp = SMIA_LIM(sensor, MIN_LINE_LENGTH_PCK_BIN);
-		max_llp = SMIA_LIM(sensor, MAX_LINE_LENGTH_PCK_BIN);
-		min_lbp = SMIA_LIM(sensor, MIN_LINE_BLANKING_PCK_BIN);
+		min_fll = CCS_LIM(sensor, MIN_FRAME_LENGTH_LINES_BIN);
+		max_fll = CCS_LIM(sensor, MAX_FRAME_LENGTH_LINES_BIN);
+		min_llp = CCS_LIM(sensor, MIN_LINE_LENGTH_PCK_BIN);
+		max_llp = CCS_LIM(sensor, MAX_LINE_LENGTH_PCK_BIN);
+		min_lbp = CCS_LIM(sensor, MIN_LINE_BLANKING_PCK_BIN);
 	} else {
-		min_fll = SMIA_LIM(sensor, MIN_FRAME_LENGTH_LINES);
-		max_fll = SMIA_LIM(sensor, MAX_FRAME_LENGTH_LINES);
-		min_llp = SMIA_LIM(sensor, MIN_LINE_LENGTH_PCK);
-		max_llp = SMIA_LIM(sensor, MAX_LINE_LENGTH_PCK);
-		min_lbp = SMIA_LIM(sensor, MIN_LINE_BLANKING_PCK);
+		min_fll = CCS_LIM(sensor, MIN_FRAME_LENGTH_LINES);
+		max_fll = CCS_LIM(sensor, MAX_FRAME_LENGTH_LINES);
+		min_llp = CCS_LIM(sensor, MIN_LINE_LENGTH_PCK);
+		max_llp = CCS_LIM(sensor, MAX_LINE_LENGTH_PCK);
+		min_lbp = CCS_LIM(sensor, MIN_LINE_BLANKING_PCK);
 	}
 
 	min = max_t(int,
-		    SMIA_LIM(sensor, MIN_FRAME_BLANKING_LINES),
+		    CCS_LIM(sensor, MIN_FRAME_BLANKING_LINES),
 		    min_fll -
 		    sensor->pixel_array->crop[SMIAPP_PA_PAD_SRC].height);
 	max = max_fll -	sensor->pixel_array->crop[SMIAPP_PA_PAD_SRC].height;
@@ -1124,8 +1088,8 @@ static int smiapp_read_nvm_page(struct smiapp_sensor *sensor, u32 p, u8 *nvm,
 		return -ENODATA;
 	}
 
-	if (SMIA_LIM(sensor, DATA_TRANSFER_IF_CAPABILITY) &
-	    SMIAPP_DATA_TRANSFER_IF_CAPABILITY_POLL) {
+	if (CCS_LIM(sensor, DATA_TRANSFER_IF_CAPABILITY) &
+	    CCS_DATA_TRANSFER_IF_CAPABILITY_POLLING) {
 		for (i = 1000; i > 0; i--) {
 			if (s & SMIAPP_DATA_TRANSFER_IF_1_STATUS_RD_READY)
 				break;
@@ -1577,8 +1541,8 @@ static int smiapp_start_streaming(struct smiapp_sensor *sensor)
 	 */
 
 	/* Digital crop */
-	if (SMIA_LIM(sensor, DIGITAL_CROP_CAPABILITY)
-	    == SMIAPP_DIGITAL_CROP_CAPABILITY_INPUT_CROP) {
+	if (CCS_LIM(sensor, DIGITAL_CROP_CAPABILITY)
+	    == CCS_DIGITAL_CROP_CAPABILITY_INPUT_CROP) {
 		rval = smiapp_write(
 			sensor, SMIAPP_REG_U16_DIGITAL_CROP_X_OFFSET,
 			sensor->scaler->crop[SMIAPP_PAD_SINK].left);
@@ -1605,8 +1569,8 @@ static int smiapp_start_streaming(struct smiapp_sensor *sensor)
 	}
 
 	/* Scaling */
-	if (SMIA_LIM(sensor, SCALING_CAPABILITY)
-	    != SMIAPP_SCALING_CAPABILITY_NONE) {
+	if (CCS_LIM(sensor, SCALING_CAPABILITY)
+	    != CCS_SCALING_CAPABILITY_NONE) {
 		rval = smiapp_write(sensor, SMIAPP_REG_U16_SCALING_MODE,
 				    sensor->scaling_mode);
 		if (rval < 0)
@@ -1628,9 +1592,9 @@ static int smiapp_start_streaming(struct smiapp_sensor *sensor)
 	if (rval < 0)
 		goto out;
 
-	if ((SMIA_LIM(sensor, FLASH_MODE_CAPABILITY) &
-	     (SMIAPP_FLASH_MODE_CAPABILITY_SINGLE_STROBE |
-	      SMIAPP_FLASH_MODE_CAPABILITY_MULTIPLE_STROBE)) &&
+	if (CCS_LIM(sensor, FLASH_MODE_CAPABILITY) &
+	    (CCS_FLASH_MODE_CAPABILITY_SINGLE_STROBE |
+	     SMIAPP_FLASH_MODE_CAPABILITY_MULTIPLE_STROBE) &&
 	    sensor->hwcfg->strobe_setup != NULL &&
 	    sensor->hwcfg->strobe_setup->trigger != 0) {
 		rval = smiapp_setup_flash_strobe(sensor);
@@ -1876,7 +1840,7 @@ static void smiapp_propagate(struct v4l2_subdev *subdev,
 		if (which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 			if (ssd == sensor->scaler) {
 				sensor->scale_m =
-					SMIA_LIM(sensor, SCALER_N_MIN);
+					CCS_LIM(sensor, SCALER_N_MIN);
 				sensor->scaling_mode =
 					SMIAPP_SCALING_MODE_NONE;
 			} else if (ssd == sensor->binner) {
@@ -1988,12 +1952,12 @@ static int smiapp_set_format(struct v4l2_subdev *subdev,
 
 	fmt->format.width =
 		clamp(fmt->format.width,
-		      SMIA_LIM(sensor, MIN_X_OUTPUT_SIZE),
-		      SMIA_LIM(sensor, MAX_X_OUTPUT_SIZE));
+		      CCS_LIM(sensor, MIN_X_OUTPUT_SIZE),
+		      CCS_LIM(sensor, MAX_X_OUTPUT_SIZE));
 	fmt->format.height =
 		clamp(fmt->format.height,
-		      SMIA_LIM(sensor, MIN_Y_OUTPUT_SIZE),
-		      SMIA_LIM(sensor, MAX_Y_OUTPUT_SIZE));
+		      CCS_LIM(sensor, MIN_Y_OUTPUT_SIZE),
+		      CCS_LIM(sensor, MAX_Y_OUTPUT_SIZE));
 
 	smiapp_get_crop_compose(subdev, cfg, crops, NULL, fmt->which);
 
@@ -2046,7 +2010,7 @@ static int scaling_goodness(struct v4l2_subdev *subdev, int w, int ask_w,
 	val -= abs(w - ask_w);
 	val -= abs(h - ask_h);
 
-	if (w < SMIA_LIM(sensor, MIN_X_OUTPUT_SIZE))
+	if (w < CCS_LIM(sensor, MIN_X_OUTPUT_SIZE))
 		val -= SCALING_GOODNESS_EXTREME;
 
 	dev_dbg(&client->dev, "w %d ask_w %d h %d ask_h %d goodness %d\n",
@@ -2112,7 +2076,7 @@ static void smiapp_set_compose_scaler(struct v4l2_subdev *subdev,
 	struct i2c_client *client = v4l2_get_subdevdata(subdev);
 	struct smiapp_sensor *sensor = to_smiapp_sensor(subdev);
 	u32 min, max, a, b, max_m;
-	u32 scale_m = SMIA_LIM(sensor, SCALER_N_MIN);
+	u32 scale_m = CCS_LIM(sensor, SCALER_N_MIN);
 	int mode = SMIAPP_SCALING_MODE_HORIZONTAL;
 	u32 try[4];
 	u32 ntry = 0;
@@ -2125,19 +2089,19 @@ static void smiapp_set_compose_scaler(struct v4l2_subdev *subdev,
 			      crops[SMIAPP_PAD_SINK]->height);
 
 	a = crops[SMIAPP_PAD_SINK]->width
-		* SMIA_LIM(sensor, SCALER_N_MIN) / sel->r.width;
+		* CCS_LIM(sensor, SCALER_N_MIN) / sel->r.width;
 	b = crops[SMIAPP_PAD_SINK]->height
-		* SMIA_LIM(sensor, SCALER_N_MIN) / sel->r.height;
+		* CCS_LIM(sensor, SCALER_N_MIN) / sel->r.height;
 	max_m = crops[SMIAPP_PAD_SINK]->width
-		* SMIA_LIM(sensor, SCALER_N_MIN)
-		/ SMIA_LIM(sensor, MIN_X_OUTPUT_SIZE);
+		* CCS_LIM(sensor, SCALER_N_MIN)
+		/ CCS_LIM(sensor, MIN_X_OUTPUT_SIZE);
 
-	a = clamp(a, SMIA_LIM(sensor, SCALER_M_MIN),
-		  SMIA_LIM(sensor, SCALER_M_MAX));
-	b = clamp(b, SMIA_LIM(sensor, SCALER_M_MIN),
-		  SMIA_LIM(sensor, SCALER_M_MAX));
-	max_m = clamp(max_m, SMIA_LIM(sensor, SCALER_M_MIN),
-		      SMIA_LIM(sensor, SCALER_M_MAX));
+	a = clamp(a, CCS_LIM(sensor, SCALER_M_MIN),
+		  CCS_LIM(sensor, SCALER_M_MAX));
+	b = clamp(b, CCS_LIM(sensor, SCALER_M_MIN),
+		  CCS_LIM(sensor, SCALER_M_MAX));
+	max_m = clamp(max_m, CCS_LIM(sensor, SCALER_M_MIN),
+		      CCS_LIM(sensor, SCALER_M_MAX));
 
 	dev_dbg(&client->dev, "scaling: a %d b %d max_m %d\n", a, b, max_m);
 
@@ -2163,8 +2127,7 @@ static void smiapp_set_compose_scaler(struct v4l2_subdev *subdev,
 		int this = scaling_goodness(
 			subdev,
 			crops[SMIAPP_PAD_SINK]->width
-			/ try[i]
-			* SMIA_LIM(sensor, SCALER_N_MIN),
+			/ try[i] * CCS_LIM(sensor, SCALER_N_MIN),
 			sel->r.width,
 			crops[SMIAPP_PAD_SINK]->height,
 			sel->r.height,
@@ -2178,18 +2141,18 @@ static void smiapp_set_compose_scaler(struct v4l2_subdev *subdev,
 			best = this;
 		}
 
-		if (SMIA_LIM(sensor, SCALING_CAPABILITY)
-		    == SMIAPP_SCALING_CAPABILITY_HORIZONTAL)
+		if (CCS_LIM(sensor, SCALING_CAPABILITY)
+		    == CCS_SCALING_CAPABILITY_HORIZONTAL)
 			continue;
 
 		this = scaling_goodness(
 			subdev, crops[SMIAPP_PAD_SINK]->width
 			/ try[i]
-			* SMIA_LIM(sensor, SCALER_N_MIN),
+			* CCS_LIM(sensor, SCALER_N_MIN),
 			sel->r.width,
 			crops[SMIAPP_PAD_SINK]->height
 			/ try[i]
-			* SMIA_LIM(sensor, SCALER_N_MIN),
+			* CCS_LIM(sensor, SCALER_N_MIN),
 			sel->r.height,
 			sel->flags);
 
@@ -2203,12 +2166,12 @@ static void smiapp_set_compose_scaler(struct v4l2_subdev *subdev,
 	sel->r.width =
 		(crops[SMIAPP_PAD_SINK]->width
 		 / scale_m
-		 * SMIA_LIM(sensor, SCALER_N_MIN)) & ~1;
+		 * CCS_LIM(sensor, SCALER_N_MIN)) & ~1;
 	if (mode == SMIAPP_SCALING_MODE_BOTH)
 		sel->r.height =
 			(crops[SMIAPP_PAD_SINK]->height
 			 / scale_m
-			 * SMIA_LIM(sensor, SCALER_N_MIN))
+			 * CCS_LIM(sensor, SCALER_N_MIN))
 			& ~1;
 	else
 		sel->r.height = crops[SMIAPP_PAD_SINK]->height;
@@ -2262,10 +2225,9 @@ static int __smiapp_sel_supported(struct v4l2_subdev *subdev,
 		if (ssd == sensor->src
 		    && sel->pad == SMIAPP_PAD_SRC)
 			return 0;
-		if (ssd == sensor->scaler
-		    && sel->pad == SMIAPP_PAD_SINK
-		    && SMIA_LIM(sensor, DIGITAL_CROP_CAPABILITY)
-		    == SMIAPP_DIGITAL_CROP_CAPABILITY_INPUT_CROP)
+		if (ssd == sensor->scaler && sel->pad == SMIAPP_PAD_SINK &&
+		    CCS_LIM(sensor, DIGITAL_CROP_CAPABILITY)
+		    == CCS_DIGITAL_CROP_CAPABILITY_INPUT_CROP)
 			return 0;
 		return -EINVAL;
 	case V4L2_SEL_TGT_NATIVE_SIZE:
@@ -2279,9 +2241,8 @@ static int __smiapp_sel_supported(struct v4l2_subdev *subdev,
 			return -EINVAL;
 		if (ssd == sensor->binner)
 			return 0;
-		if (ssd == sensor->scaler
-		    && SMIA_LIM(sensor, SCALING_CAPABILITY)
-		    != SMIAPP_SCALING_CAPABILITY_NONE)
+		if (ssd == sensor->scaler && CCS_LIM(sensor, SCALING_CAPABILITY)
+		    != CCS_SCALING_CAPABILITY_NONE)
 			return 0;
 		fallthrough;
 	default:
@@ -2345,8 +2306,8 @@ static void smiapp_get_native_size(struct smiapp_subdev *ssd,
 {
 	r->top = 0;
 	r->left = 0;
-	r->width = SMIA_LIM(ssd->sensor, X_ADDR_MAX) + 1;
-	r->height = SMIA_LIM(ssd->sensor, Y_ADDR_MAX) + 1;
+	r->width = CCS_LIM(ssd->sensor, X_ADDR_MAX) + 1;
+	r->height = CCS_LIM(ssd->sensor, Y_ADDR_MAX) + 1;
 }
 
 static int __smiapp_get_selection(struct v4l2_subdev *subdev,
@@ -2431,10 +2392,10 @@ static int smiapp_set_selection(struct v4l2_subdev *subdev,
 	sel->r.height =	SMIAPP_ALIGN_DIM(sel->r.height, sel->flags);
 
 	sel->r.width = max_t(unsigned int,
-			     SMIA_LIM(sensor, MIN_X_OUTPUT_SIZE),
+			     CCS_LIM(sensor, MIN_X_OUTPUT_SIZE),
 			     sel->r.width);
 	sel->r.height = max_t(unsigned int,
-			      SMIA_LIM(sensor, MIN_Y_OUTPUT_SIZE),
+			      CCS_LIM(sensor, MIN_Y_OUTPUT_SIZE),
 			      sel->r.height);
 
 	switch (sel->target) {
@@ -3123,12 +3084,6 @@ static int smiapp_probe(struct i2c_client *client)
 		goto out_power_off;
 	}
 
-	rval = smiapp_read_all_smia_limits(sensor);
-	if (rval) {
-		rval = -ENODEV;
-		goto out_power_off;
-	}
-
 	rval = ccs_read_all_limits(sensor);
 	if (rval)
 		goto out_power_off;
@@ -3163,7 +3118,7 @@ static int smiapp_probe(struct i2c_client *client)
 		goto out_free_ccs_limits;
 	}
 
-	if (SMIA_LIM(sensor, BINNING_CAPABILITY)) {
+	if (CCS_LIM(sensor, BINNING_CAPABILITY)) {
 		u32 val;
 
 		rval = smiapp_read(sensor,
@@ -3200,8 +3155,8 @@ static int smiapp_probe(struct i2c_client *client)
 	}
 
 	if (sensor->minfo.smiapp_version &&
-	    SMIA_LIM(sensor, DATA_TRANSFER_IF_CAPABILITY) &
-	    SMIAPP_DATA_TRANSFER_IF_CAPABILITY_SUPPORTED) {
+	    CCS_LIM(sensor, DATA_TRANSFER_IF_CAPABILITY) &
+	    CCS_DATA_TRANSFER_IF_CAPABILITY_SUPPORTED) {
 		if (device_create_file(&client->dev, &dev_attr_nvm) != 0) {
 			dev_err(&client->dev, "sysfs nvm entry failed\n");
 			rval = -EBUSY;
@@ -3210,22 +3165,22 @@ static int smiapp_probe(struct i2c_client *client)
 	}
 
 	/* We consider this as profile 0 sensor if any of these are zero. */
-	if (!SMIA_LIM(sensor, MIN_OP_SYS_CLK_DIV) ||
-	    !SMIA_LIM(sensor, MAX_OP_SYS_CLK_DIV) ||
-	    !SMIA_LIM(sensor, MIN_OP_PIX_CLK_DIV) ||
-	    !SMIA_LIM(sensor, MAX_OP_PIX_CLK_DIV)) {
+	if (!CCS_LIM(sensor, MIN_OP_SYS_CLK_DIV) ||
+	    !CCS_LIM(sensor, MAX_OP_SYS_CLK_DIV) ||
+	    !CCS_LIM(sensor, MIN_OP_PIX_CLK_DIV) ||
+	    !CCS_LIM(sensor, MAX_OP_PIX_CLK_DIV)) {
 		sensor->minfo.smiapp_profile = SMIAPP_PROFILE_0;
-	} else if (SMIA_LIM(sensor, SCALING_CAPABILITY)
-		   != SMIAPP_SCALING_CAPABILITY_NONE) {
-		if (SMIA_LIM(sensor, SCALING_CAPABILITY)
-		    == SMIAPP_SCALING_CAPABILITY_HORIZONTAL)
+	} else if (CCS_LIM(sensor, SCALING_CAPABILITY)
+		   != CCS_SCALING_CAPABILITY_NONE) {
+		if (CCS_LIM(sensor, SCALING_CAPABILITY)
+		    == CCS_SCALING_CAPABILITY_HORIZONTAL)
 			sensor->minfo.smiapp_profile = SMIAPP_PROFILE_1;
 		else
 			sensor->minfo.smiapp_profile = SMIAPP_PROFILE_2;
 		sensor->scaler = &sensor->ssds[sensor->ssds_used];
 		sensor->ssds_used++;
-	} else if (SMIA_LIM(sensor, DIGITAL_CROP_CAPABILITY)
-		   == SMIAPP_DIGITAL_CROP_CAPABILITY_INPUT_CROP) {
+	} else if (CCS_LIM(sensor, DIGITAL_CROP_CAPABILITY)
+		   == CCS_DIGITAL_CROP_CAPABILITY_INPUT_CROP) {
 		sensor->scaler = &sensor->ssds[sensor->ssds_used];
 		sensor->ssds_used++;
 	}
@@ -3234,13 +3189,13 @@ static int smiapp_probe(struct i2c_client *client)
 	sensor->pixel_array = &sensor->ssds[sensor->ssds_used];
 	sensor->ssds_used++;
 
-	sensor->scale_m = SMIA_LIM(sensor, SCALER_N_MIN);
+	sensor->scale_m = CCS_LIM(sensor, SCALER_N_MIN);
 
 	/* prepare PLL configuration input values */
 	sensor->pll.bus_type = SMIAPP_PLL_BUS_TYPE_CSI2;
 	sensor->pll.csi2.lanes = sensor->hwcfg->lanes;
 	sensor->pll.ext_clk_freq_hz = sensor->hwcfg->ext_clk;
-	sensor->pll.scale_n = SMIA_LIM(sensor, SCALER_N_MIN);
+	sensor->pll.scale_n = CCS_LIM(sensor, SCALER_N_MIN);
 	/* Profile 0 sensors have no separate OP clock branch. */
 	if (sensor->minfo.smiapp_profile == SMIAPP_PROFILE_0)
 		sensor->pll.flags |= SMIAPP_PLL_FLAG_NO_OP_CLOCKS;
diff --git a/drivers/media/i2c/smiapp/smiapp-limits.c b/drivers/media/i2c/smiapp/smiapp-limits.c
deleted file mode 100644
index de5ee5296713..000000000000
--- a/drivers/media/i2c/smiapp/smiapp-limits.c
+++ /dev/null
@@ -1,118 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * drivers/media/i2c/smiapp/smiapp-limits.c
- *
- * Generic driver for SMIA/SMIA++ compliant camera modules
- *
- * Copyright (C) 2011--2012 Nokia Corporation
- * Contact: Sakari Ailus <sakari.ailus@iki.fi>
- */
-
-#include "smiapp.h"
-
-struct smiapp_reg_limits smiapp_reg_limits[] = {
-	{ SMIAPP_REG_U16_ANALOGUE_GAIN_CAPABILITY, "analogue_gain_capability" }, /* 0 */
-	{ SMIAPP_REG_U16_ANALOGUE_GAIN_CODE_MIN, "analogue_gain_code_min" },
-	{ SMIAPP_REG_U16_ANALOGUE_GAIN_CODE_MAX, "analogue_gain_code_max" },
-	{ SMIAPP_REG_U8_THS_ZERO_MIN, "ths_zero_min" },
-	{ SMIAPP_REG_U8_TCLK_TRAIL_MIN, "tclk_trail_min" },
-	{ SMIAPP_REG_U16_INTEGRATION_TIME_CAPABILITY, "integration_time_capability" }, /* 5 */
-	{ SMIAPP_REG_U16_COARSE_INTEGRATION_TIME_MIN, "coarse_integration_time_min" },
-	{ SMIAPP_REG_U16_COARSE_INTEGRATION_TIME_MAX_MARGIN, "coarse_integration_time_max_margin" },
-	{ SMIAPP_REG_U16_FINE_INTEGRATION_TIME_MIN, "fine_integration_time_min" },
-	{ SMIAPP_REG_U16_FINE_INTEGRATION_TIME_MAX_MARGIN, "fine_integration_time_max_margin" },
-	{ SMIAPP_REG_U16_DIGITAL_GAIN_CAPABILITY, "digital_gain_capability" }, /* 10 */
-	{ SMIAPP_REG_U16_DIGITAL_GAIN_MIN, "digital_gain_min" },
-	{ SMIAPP_REG_U16_DIGITAL_GAIN_MAX, "digital_gain_max" },
-	{ SMIAPP_REG_F32_MIN_EXT_CLK_FREQ_HZ, "min_ext_clk_freq_hz" },
-	{ SMIAPP_REG_F32_MAX_EXT_CLK_FREQ_HZ, "max_ext_clk_freq_hz" },
-	{ SMIAPP_REG_U16_MIN_PRE_PLL_CLK_DIV, "min_pre_pll_clk_div" }, /* 15 */
-	{ SMIAPP_REG_U16_MAX_PRE_PLL_CLK_DIV, "max_pre_pll_clk_div" },
-	{ SMIAPP_REG_F32_MIN_PLL_IP_FREQ_HZ, "min_pll_ip_freq_hz" },
-	{ SMIAPP_REG_F32_MAX_PLL_IP_FREQ_HZ, "max_pll_ip_freq_hz" },
-	{ SMIAPP_REG_U16_MIN_PLL_MULTIPLIER, "min_pll_multiplier" },
-	{ SMIAPP_REG_U16_MAX_PLL_MULTIPLIER, "max_pll_multiplier" }, /* 20 */
-	{ SMIAPP_REG_F32_MIN_PLL_OP_FREQ_HZ, "min_pll_op_freq_hz" },
-	{ SMIAPP_REG_F32_MAX_PLL_OP_FREQ_HZ, "max_pll_op_freq_hz" },
-	{ SMIAPP_REG_U16_MIN_VT_SYS_CLK_DIV, "min_vt_sys_clk_div" },
-	{ SMIAPP_REG_U16_MAX_VT_SYS_CLK_DIV, "max_vt_sys_clk_div" },
-	{ SMIAPP_REG_F32_MIN_VT_SYS_CLK_FREQ_HZ, "min_vt_sys_clk_freq_hz" }, /* 25 */
-	{ SMIAPP_REG_F32_MAX_VT_SYS_CLK_FREQ_HZ, "max_vt_sys_clk_freq_hz" },
-	{ SMIAPP_REG_F32_MIN_VT_PIX_CLK_FREQ_HZ, "min_vt_pix_clk_freq_hz" },
-	{ SMIAPP_REG_F32_MAX_VT_PIX_CLK_FREQ_HZ, "max_vt_pix_clk_freq_hz" },
-	{ SMIAPP_REG_U16_MIN_VT_PIX_CLK_DIV, "min_vt_pix_clk_div" },
-	{ SMIAPP_REG_U16_MAX_VT_PIX_CLK_DIV, "max_vt_pix_clk_div" }, /* 30 */
-	{ SMIAPP_REG_U16_MIN_FRAME_LENGTH_LINES, "min_frame_length_lines" },
-	{ SMIAPP_REG_U16_MAX_FRAME_LENGTH_LINES, "max_frame_length_lines" },
-	{ SMIAPP_REG_U16_MIN_LINE_LENGTH_PCK, "min_line_length_pck" },
-	{ SMIAPP_REG_U16_MAX_LINE_LENGTH_PCK, "max_line_length_pck" },
-	{ SMIAPP_REG_U16_MIN_LINE_BLANKING_PCK, "min_line_blanking_pck" }, /* 35 */
-	{ SMIAPP_REG_U16_MIN_FRAME_BLANKING_LINES, "min_frame_blanking_lines" },
-	{ SMIAPP_REG_U8_MIN_LINE_LENGTH_PCK_STEP_SIZE, "min_line_length_pck_step_size" },
-	{ SMIAPP_REG_U16_MIN_OP_SYS_CLK_DIV, "min_op_sys_clk_div" },
-	{ SMIAPP_REG_U16_MAX_OP_SYS_CLK_DIV, "max_op_sys_clk_div" },
-	{ SMIAPP_REG_F32_MIN_OP_SYS_CLK_FREQ_HZ, "min_op_sys_clk_freq_hz" }, /* 40 */
-	{ SMIAPP_REG_F32_MAX_OP_SYS_CLK_FREQ_HZ, "max_op_sys_clk_freq_hz" },
-	{ SMIAPP_REG_U16_MIN_OP_PIX_CLK_DIV, "min_op_pix_clk_div" },
-	{ SMIAPP_REG_U16_MAX_OP_PIX_CLK_DIV, "max_op_pix_clk_div" },
-	{ SMIAPP_REG_F32_MIN_OP_PIX_CLK_FREQ_HZ, "min_op_pix_clk_freq_hz" },
-	{ SMIAPP_REG_F32_MAX_OP_PIX_CLK_FREQ_HZ, "max_op_pix_clk_freq_hz" }, /* 45 */
-	{ SMIAPP_REG_U16_X_ADDR_MIN, "x_addr_min" },
-	{ SMIAPP_REG_U16_Y_ADDR_MIN, "y_addr_min" },
-	{ SMIAPP_REG_U16_X_ADDR_MAX, "x_addr_max" },
-	{ SMIAPP_REG_U16_Y_ADDR_MAX, "y_addr_max" },
-	{ SMIAPP_REG_U16_MIN_X_OUTPUT_SIZE, "min_x_output_size" }, /* 50 */
-	{ SMIAPP_REG_U16_MIN_Y_OUTPUT_SIZE, "min_y_output_size" },
-	{ SMIAPP_REG_U16_MAX_X_OUTPUT_SIZE, "max_x_output_size" },
-	{ SMIAPP_REG_U16_MAX_Y_OUTPUT_SIZE, "max_y_output_size" },
-	{ SMIAPP_REG_U16_MIN_EVEN_INC, "min_even_inc" },
-	{ SMIAPP_REG_U16_MAX_EVEN_INC, "max_even_inc" }, /* 55 */
-	{ SMIAPP_REG_U16_MIN_ODD_INC, "min_odd_inc" },
-	{ SMIAPP_REG_U16_MAX_ODD_INC, "max_odd_inc" },
-	{ SMIAPP_REG_U16_SCALING_CAPABILITY, "scaling_capability" },
-	{ SMIAPP_REG_U16_SCALER_M_MIN, "scaler_m_min" },
-	{ SMIAPP_REG_U16_SCALER_M_MAX, "scaler_m_max" }, /* 60 */
-	{ SMIAPP_REG_U16_SCALER_N_MIN, "scaler_n_min" },
-	{ SMIAPP_REG_U16_SCALER_N_MAX, "scaler_n_max" },
-	{ SMIAPP_REG_U16_SPATIAL_SAMPLING_CAPABILITY, "spatial_sampling_capability" },
-	{ SMIAPP_REG_U8_DIGITAL_CROP_CAPABILITY, "digital_crop_capability" },
-	{ SMIAPP_REG_U16_COMPRESSION_CAPABILITY, "compression_capability" }, /* 65 */
-	{ SMIAPP_REG_U8_FIFO_SUPPORT_CAPABILITY, "fifo_support_capability" },
-	{ SMIAPP_REG_U8_DPHY_CTRL_CAPABILITY, "dphy_ctrl_capability" },
-	{ SMIAPP_REG_U8_CSI_LANE_MODE_CAPABILITY, "csi_lane_mode_capability" },
-	{ SMIAPP_REG_U8_CSI_SIGNALLING_MODE_CAPABILITY, "csi_signalling_mode_capability" },
-	{ SMIAPP_REG_U8_FAST_STANDBY_CAPABILITY, "fast_standby_capability" }, /* 70 */
-	{ SMIAPP_REG_U8_CCI_ADDRESS_CONTROL_CAPABILITY, "cci_address_control_capability" },
-	{ SMIAPP_REG_U32_MAX_PER_LANE_BITRATE_1_LANE_MODE_MBPS, "max_per_lane_bitrate_1_lane_mode_mbps" },
-	{ SMIAPP_REG_U32_MAX_PER_LANE_BITRATE_2_LANE_MODE_MBPS, "max_per_lane_bitrate_2_lane_mode_mbps" },
-	{ SMIAPP_REG_U32_MAX_PER_LANE_BITRATE_3_LANE_MODE_MBPS, "max_per_lane_bitrate_3_lane_mode_mbps" },
-	{ SMIAPP_REG_U32_MAX_PER_LANE_BITRATE_4_LANE_MODE_MBPS, "max_per_lane_bitrate_4_lane_mode_mbps" }, /* 75 */
-	{ SMIAPP_REG_U8_TEMP_SENSOR_CAPABILITY, "temp_sensor_capability" },
-	{ SMIAPP_REG_U16_MIN_FRAME_LENGTH_LINES_BIN, "min_frame_length_lines_bin" },
-	{ SMIAPP_REG_U16_MAX_FRAME_LENGTH_LINES_BIN, "max_frame_length_lines_bin" },
-	{ SMIAPP_REG_U16_MIN_LINE_LENGTH_PCK_BIN, "min_line_length_pck_bin" },
-	{ SMIAPP_REG_U16_MAX_LINE_LENGTH_PCK_BIN, "max_line_length_pck_bin" }, /* 80 */
-	{ SMIAPP_REG_U16_MIN_LINE_BLANKING_PCK_BIN, "min_line_blanking_pck_bin" },
-	{ SMIAPP_REG_U16_FINE_INTEGRATION_TIME_MIN_BIN, "fine_integration_time_min_bin" },
-	{ SMIAPP_REG_U16_FINE_INTEGRATION_TIME_MAX_MARGIN_BIN, "fine_integration_time_max_margin_bin" },
-	{ SMIAPP_REG_U8_BINNING_CAPABILITY, "binning_capability" },
-	{ SMIAPP_REG_U8_BINNING_WEIGHTING_CAPABILITY, "binning_weighting_capability" }, /* 85 */
-	{ SMIAPP_REG_U8_DATA_TRANSFER_IF_CAPABILITY, "data_transfer_if_capability" },
-	{ SMIAPP_REG_U8_SHADING_CORRECTION_CAPABILITY, "shading_correction_capability" },
-	{ SMIAPP_REG_U8_GREEN_IMBALANCE_CAPABILITY, "green_imbalance_capability" },
-	{ SMIAPP_REG_U8_BLACK_LEVEL_CAPABILITY, "black_level_capability" },
-	{ SMIAPP_REG_U8_MODULE_SPECIFIC_CORRECTION_CAPABILITY, "module_specific_correction_capability" }, /* 90 */
-	{ SMIAPP_REG_U16_DEFECT_CORRECTION_CAPABILITY, "defect_correction_capability" },
-	{ SMIAPP_REG_U16_DEFECT_CORRECTION_CAPABILITY_2, "defect_correction_capability_2" },
-	{ SMIAPP_REG_U8_EDOF_CAPABILITY, "edof_capability" },
-	{ SMIAPP_REG_U8_COLOUR_FEEDBACK_CAPABILITY, "colour_feedback_capability" },
-	{ SMIAPP_REG_U8_ESTIMATION_MODE_CAPABILITY, "estimation_mode_capability" }, /* 95 */
-	{ SMIAPP_REG_U8_ESTIMATION_ZONE_CAPABILITY, "estimation_zone_capability" },
-	{ SMIAPP_REG_U16_CAPABILITY_TRDY_MIN, "capability_trdy_min" },
-	{ SMIAPP_REG_U8_FLASH_MODE_CAPABILITY, "flash_mode_capability" },
-	{ SMIAPP_REG_U8_ACTUATOR_CAPABILITY, "actuator_capability" },
-	{ SMIAPP_REG_U8_BRACKETING_LUT_CAPABILITY_1, "bracketing_lut_capability_1" }, /* 100 */
-	{ SMIAPP_REG_U8_BRACKETING_LUT_CAPABILITY_2, "bracketing_lut_capability_2" },
-	{ SMIAPP_REG_U16_ANALOGUE_GAIN_CODE_STEP, "analogue_gain_code_step" },
-	{ 0, NULL },
-};
diff --git a/drivers/media/i2c/smiapp/smiapp-limits.h b/drivers/media/i2c/smiapp/smiapp-limits.h
deleted file mode 100644
index dbac0b4975f9..000000000000
--- a/drivers/media/i2c/smiapp/smiapp-limits.h
+++ /dev/null
@@ -1,114 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * drivers/media/i2c/smiapp/smiapp-limits.h
- *
- * Generic driver for SMIA/SMIA++ compliant camera modules
- *
- * Copyright (C) 2011--2012 Nokia Corporation
- * Contact: Sakari Ailus <sakari.ailus@iki.fi>
- */
-
-#define SMIAPP_LIMIT_ANALOGUE_GAIN_CAPABILITY			0
-#define SMIAPP_LIMIT_ANALOGUE_GAIN_CODE_MIN			1
-#define SMIAPP_LIMIT_ANALOGUE_GAIN_CODE_MAX			2
-#define SMIAPP_LIMIT_THS_ZERO_MIN				3
-#define SMIAPP_LIMIT_TCLK_TRAIL_MIN				4
-#define SMIAPP_LIMIT_INTEGRATION_TIME_CAPABILITY		5
-#define SMIAPP_LIMIT_COARSE_INTEGRATION_TIME_MIN		6
-#define SMIAPP_LIMIT_COARSE_INTEGRATION_TIME_MAX_MARGIN		7
-#define SMIAPP_LIMIT_FINE_INTEGRATION_TIME_MIN			8
-#define SMIAPP_LIMIT_FINE_INTEGRATION_TIME_MAX_MARGIN		9
-#define SMIAPP_LIMIT_DIGITAL_GAIN_CAPABILITY			10
-#define SMIAPP_LIMIT_DIGITAL_GAIN_MIN				11
-#define SMIAPP_LIMIT_DIGITAL_GAIN_MAX				12
-#define SMIAPP_LIMIT_MIN_EXT_CLK_FREQ_HZ			13
-#define SMIAPP_LIMIT_MAX_EXT_CLK_FREQ_HZ			14
-#define SMIAPP_LIMIT_MIN_PRE_PLL_CLK_DIV			15
-#define SMIAPP_LIMIT_MAX_PRE_PLL_CLK_DIV			16
-#define SMIAPP_LIMIT_MIN_PLL_IP_FREQ_HZ				17
-#define SMIAPP_LIMIT_MAX_PLL_IP_FREQ_HZ				18
-#define SMIAPP_LIMIT_MIN_PLL_MULTIPLIER				19
-#define SMIAPP_LIMIT_MAX_PLL_MULTIPLIER				20
-#define SMIAPP_LIMIT_MIN_PLL_OP_FREQ_HZ				21
-#define SMIAPP_LIMIT_MAX_PLL_OP_FREQ_HZ				22
-#define SMIAPP_LIMIT_MIN_VT_SYS_CLK_DIV				23
-#define SMIAPP_LIMIT_MAX_VT_SYS_CLK_DIV				24
-#define SMIAPP_LIMIT_MIN_VT_SYS_CLK_FREQ_HZ			25
-#define SMIAPP_LIMIT_MAX_VT_SYS_CLK_FREQ_HZ			26
-#define SMIAPP_LIMIT_MIN_VT_PIX_CLK_FREQ_HZ			27
-#define SMIAPP_LIMIT_MAX_VT_PIX_CLK_FREQ_HZ			28
-#define SMIAPP_LIMIT_MIN_VT_PIX_CLK_DIV				29
-#define SMIAPP_LIMIT_MAX_VT_PIX_CLK_DIV				30
-#define SMIAPP_LIMIT_MIN_FRAME_LENGTH_LINES			31
-#define SMIAPP_LIMIT_MAX_FRAME_LENGTH_LINES			32
-#define SMIAPP_LIMIT_MIN_LINE_LENGTH_PCK			33
-#define SMIAPP_LIMIT_MAX_LINE_LENGTH_PCK			34
-#define SMIAPP_LIMIT_MIN_LINE_BLANKING_PCK			35
-#define SMIAPP_LIMIT_MIN_FRAME_BLANKING_LINES			36
-#define SMIAPP_LIMIT_MIN_LINE_LENGTH_PCK_STEP_SIZE		37
-#define SMIAPP_LIMIT_MIN_OP_SYS_CLK_DIV				38
-#define SMIAPP_LIMIT_MAX_OP_SYS_CLK_DIV				39
-#define SMIAPP_LIMIT_MIN_OP_SYS_CLK_FREQ_HZ			40
-#define SMIAPP_LIMIT_MAX_OP_SYS_CLK_FREQ_HZ			41
-#define SMIAPP_LIMIT_MIN_OP_PIX_CLK_DIV				42
-#define SMIAPP_LIMIT_MAX_OP_PIX_CLK_DIV				43
-#define SMIAPP_LIMIT_MIN_OP_PIX_CLK_FREQ_HZ			44
-#define SMIAPP_LIMIT_MAX_OP_PIX_CLK_FREQ_HZ			45
-#define SMIAPP_LIMIT_X_ADDR_MIN					46
-#define SMIAPP_LIMIT_Y_ADDR_MIN					47
-#define SMIAPP_LIMIT_X_ADDR_MAX					48
-#define SMIAPP_LIMIT_Y_ADDR_MAX					49
-#define SMIAPP_LIMIT_MIN_X_OUTPUT_SIZE				50
-#define SMIAPP_LIMIT_MIN_Y_OUTPUT_SIZE				51
-#define SMIAPP_LIMIT_MAX_X_OUTPUT_SIZE				52
-#define SMIAPP_LIMIT_MAX_Y_OUTPUT_SIZE				53
-#define SMIAPP_LIMIT_MIN_EVEN_INC				54
-#define SMIAPP_LIMIT_MAX_EVEN_INC				55
-#define SMIAPP_LIMIT_MIN_ODD_INC				56
-#define SMIAPP_LIMIT_MAX_ODD_INC				57
-#define SMIAPP_LIMIT_SCALING_CAPABILITY				58
-#define SMIAPP_LIMIT_SCALER_M_MIN				59
-#define SMIAPP_LIMIT_SCALER_M_MAX				60
-#define SMIAPP_LIMIT_SCALER_N_MIN				61
-#define SMIAPP_LIMIT_SCALER_N_MAX				62
-#define SMIAPP_LIMIT_SPATIAL_SAMPLING_CAPABILITY		63
-#define SMIAPP_LIMIT_DIGITAL_CROP_CAPABILITY			64
-#define SMIAPP_LIMIT_COMPRESSION_CAPABILITY			65
-#define SMIAPP_LIMIT_FIFO_SUPPORT_CAPABILITY			66
-#define SMIAPP_LIMIT_DPHY_CTRL_CAPABILITY			67
-#define SMIAPP_LIMIT_CSI_LANE_MODE_CAPABILITY			68
-#define SMIAPP_LIMIT_CSI_SIGNALLING_MODE_CAPABILITY		69
-#define SMIAPP_LIMIT_FAST_STANDBY_CAPABILITY			70
-#define SMIAPP_LIMIT_CCI_ADDRESS_CONTROL_CAPABILITY		71
-#define SMIAPP_LIMIT_MAX_PER_LANE_BITRATE_1_LANE_MODE_MBPS	72
-#define SMIAPP_LIMIT_MAX_PER_LANE_BITRATE_2_LANE_MODE_MBPS	73
-#define SMIAPP_LIMIT_MAX_PER_LANE_BITRATE_3_LANE_MODE_MBPS	74
-#define SMIAPP_LIMIT_MAX_PER_LANE_BITRATE_4_LANE_MODE_MBPS	75
-#define SMIAPP_LIMIT_TEMP_SENSOR_CAPABILITY			76
-#define SMIAPP_LIMIT_MIN_FRAME_LENGTH_LINES_BIN			77
-#define SMIAPP_LIMIT_MAX_FRAME_LENGTH_LINES_BIN			78
-#define SMIAPP_LIMIT_MIN_LINE_LENGTH_PCK_BIN			79
-#define SMIAPP_LIMIT_MAX_LINE_LENGTH_PCK_BIN			80
-#define SMIAPP_LIMIT_MIN_LINE_BLANKING_PCK_BIN			81
-#define SMIAPP_LIMIT_FINE_INTEGRATION_TIME_MIN_BIN		82
-#define SMIAPP_LIMIT_FINE_INTEGRATION_TIME_MAX_MARGIN_BIN	83
-#define SMIAPP_LIMIT_BINNING_CAPABILITY				84
-#define SMIAPP_LIMIT_BINNING_WEIGHTING_CAPABILITY		85
-#define SMIAPP_LIMIT_DATA_TRANSFER_IF_CAPABILITY		86
-#define SMIAPP_LIMIT_SHADING_CORRECTION_CAPABILITY		87
-#define SMIAPP_LIMIT_GREEN_IMBALANCE_CAPABILITY			88
-#define SMIAPP_LIMIT_BLACK_LEVEL_CAPABILITY			89
-#define SMIAPP_LIMIT_MODULE_SPECIFIC_CORRECTION_CAPABILITY	90
-#define SMIAPP_LIMIT_DEFECT_CORRECTION_CAPABILITY		91
-#define SMIAPP_LIMIT_DEFECT_CORRECTION_CAPABILITY_2		92
-#define SMIAPP_LIMIT_EDOF_CAPABILITY				93
-#define SMIAPP_LIMIT_COLOUR_FEEDBACK_CAPABILITY			94
-#define SMIAPP_LIMIT_ESTIMATION_MODE_CAPABILITY			95
-#define SMIAPP_LIMIT_ESTIMATION_ZONE_CAPABILITY			96
-#define SMIAPP_LIMIT_CAPABILITY_TRDY_MIN			97
-#define SMIAPP_LIMIT_FLASH_MODE_CAPABILITY			98
-#define SMIAPP_LIMIT_ACTUATOR_CAPABILITY			99
-#define SMIAPP_LIMIT_BRACKETING_LUT_CAPABILITY_1		100
-#define SMIAPP_LIMIT_BRACKETING_LUT_CAPABILITY_2		101
-#define SMIAPP_LIMIT_ANALOGUE_GAIN_CODE_STEP			102
-#define SMIAPP_LIMIT_LAST					103
diff --git a/drivers/media/i2c/smiapp/smiapp-quirk.c b/drivers/media/i2c/smiapp/smiapp-quirk.c
index 308ca0b03f5a..24630c7650d2 100644
--- a/drivers/media/i2c/smiapp/smiapp-quirk.c
+++ b/drivers/media/i2c/smiapp/smiapp-quirk.c
@@ -10,6 +10,8 @@
 
 #include <linux/delay.h>
 
+#include "ccs-limits.h"
+
 #include "smiapp.h"
 
 static int smiapp_write_8(struct smiapp_sensor *sensor, u16 reg, u8 val)
@@ -36,17 +38,6 @@ static int smiapp_write_8s(struct smiapp_sensor *sensor,
 	return 0;
 }
 
-void smiapp_replace_limit(struct smiapp_sensor *sensor,
-			  u32 limit, u32 val)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
-
-	dev_dbg(&client->dev, "quirk: 0x%8.8x \"%s\" = %d, 0x%x\n",
-		smiapp_reg_limits[limit].addr,
-		smiapp_reg_limits[limit].what, val, val);
-	sensor->limits[limit] = val;
-}
-
 static int jt8ew9_limits(struct smiapp_sensor *sensor)
 {
 	if (sensor->minfo.revision_number_major < 0x03)
@@ -54,9 +45,8 @@ static int jt8ew9_limits(struct smiapp_sensor *sensor)
 
 	/* Below 24 gain doesn't have effect at all, */
 	/* but ~59 is needed for full dynamic range */
-	smiapp_replace_limit(sensor, SMIAPP_LIMIT_ANALOGUE_GAIN_CODE_MIN, 59);
-	smiapp_replace_limit(
-		sensor, SMIAPP_LIMIT_ANALOGUE_GAIN_CODE_MAX, 6000);
+	ccs_replace_limit(sensor, CCS_L_ANALOG_GAIN_CODE_MIN, 0, 59);
+	ccs_replace_limit(sensor, CCS_L_ANALOG_GAIN_CODE_MAX, 0, 6000);
 
 	return 0;
 }
@@ -126,9 +116,8 @@ const struct smiapp_quirk smiapp_imx125es_quirk = {
 
 static int jt8ev1_limits(struct smiapp_sensor *sensor)
 {
-	smiapp_replace_limit(sensor, SMIAPP_LIMIT_X_ADDR_MAX, 4271);
-	smiapp_replace_limit(sensor,
-			     SMIAPP_LIMIT_MIN_LINE_BLANKING_PCK_BIN, 184);
+	ccs_replace_limit(sensor, CCS_L_X_ADDR_MAX, 0, 4271);
+	ccs_replace_limit(sensor, CCS_L_MIN_LINE_BLANKING_PCK_BIN, 0, 184);
 
 	return 0;
 }
@@ -221,7 +210,7 @@ const struct smiapp_quirk smiapp_jt8ev1_quirk = {
 
 static int tcm8500md_limits(struct smiapp_sensor *sensor)
 {
-	smiapp_replace_limit(sensor, SMIAPP_LIMIT_MIN_PLL_IP_FREQ_HZ, 2700000);
+	ccs_replace_limit(sensor, CCS_L_MIN_PLL_IP_CLK_FREQ_MHZ, 0, 2700000);
 
 	return 0;
 }
diff --git a/drivers/media/i2c/smiapp/smiapp-quirk.h b/drivers/media/i2c/smiapp/smiapp-quirk.h
index 17505be60c1d..8a479f17cd19 100644
--- a/drivers/media/i2c/smiapp/smiapp-quirk.h
+++ b/drivers/media/i2c/smiapp/smiapp-quirk.h
@@ -55,9 +55,6 @@ struct smiapp_reg_8 {
 	u8 val;
 };
 
-void smiapp_replace_limit(struct smiapp_sensor *sensor,
-			  u32 limit, u32 val);
-
 #define SMIAPP_MK_QUIRK_REG_8(_reg, _val) \
 	{				\
 		.reg = (u16)_reg,	\
diff --git a/drivers/media/i2c/smiapp/smiapp.h b/drivers/media/i2c/smiapp/smiapp.h
index 08ca1b3d1b2f..1a67cf485dcc 100644
--- a/drivers/media/i2c/smiapp/smiapp.h
+++ b/drivers/media/i2c/smiapp/smiapp.h
@@ -84,8 +84,6 @@ struct smiapp_hwconfig {
 	struct smiapp_flash_strobe_parms *strobe_setup;
 };
 
-#include "smiapp-limits.h"
-
 struct smiapp_quirk;
 
 #define SMIAPP_MODULE_IDENT_FLAG_REV_LE		(1 << 0)
@@ -167,13 +165,6 @@ struct smiapp_module_info {
 	  .flags = 0,							\
 	  .name = _name, }
 
-struct smiapp_reg_limits {
-	u32 addr;
-	char *what;
-};
-
-extern struct smiapp_reg_limits smiapp_reg_limits[];
-
 struct smiapp_csi_data_format {
 	u32 code;
 	u8 width;
@@ -227,7 +218,6 @@ struct smiapp_sensor {
 	struct regulator *vana;
 	struct clk *ext_clk;
 	struct gpio_desc *xshutdown;
-	u32 limits[SMIAPP_LIMIT_LAST];
 	void *ccs_limits;
 	u8 nbinning_subtypes;
 	struct smiapp_binning_subtype binning_subtypes[SMIAPP_BINNING_SUBTYPES];
-- 
2.27.0

