Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8FCB15BC06
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2020 10:49:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729662AbgBMJth (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Feb 2020 04:49:37 -0500
Received: from retiisi.org.uk ([95.216.213.190]:59670 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729629AbgBMJth (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Feb 2020 04:49:37 -0500
Received: from lanttu.localdomain (unknown [IPv6:2a01:4f9:c010:4572::e1:1001])
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTP id CF00B634C8F
        for <linux-media@vger.kernel.org>; Thu, 13 Feb 2020 11:49:18 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 4/7] smiapp: Turn limit lookup into a function
Date:   Thu, 13 Feb 2020 11:49:31 +0200
Message-Id: <20200213094934.18595-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200213094934.18595-1-sakari.ailus@linux.intel.com>
References: <20200213094934.18595-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of direct array access, turn accessing limit information into a
function. Going forward, more laborate CCS limits will replace most SMIA
limits, and conversion will be less complicated this way.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/smiapp/smiapp-core.c | 193 +++++++++++++------------
 1 file changed, 102 insertions(+), 91 deletions(-)

diff --git a/drivers/media/i2c/smiapp/smiapp-core.c b/drivers/media/i2c/smiapp/smiapp-core.c
index a80d7701b519..26422fb571ec 100644
--- a/drivers/media/i2c/smiapp/smiapp-core.c
+++ b/drivers/media/i2c/smiapp/smiapp-core.c
@@ -57,6 +57,18 @@ static const struct smiapp_module_ident smiapp_module_idents[] = {
  *
  */
 
+static u32 smiapp_get_limit(struct smiapp_sensor *sensor,
+				 unsigned int limit)
+{
+	if (WARN_ON(limit >= SMIAPP_LIMIT_LAST))
+		return 1;
+
+	return sensor->limits[limit];
+}
+
+#define SMIA_LIM(sensor, limit) \
+	smiapp_get_limit(sensor, SMIAPP_LIMIT_##limit)
+
 static int smiapp_read_frame_fmt(struct smiapp_sensor *sensor)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
@@ -240,35 +252,35 @@ static int smiapp_pll_try(struct smiapp_sensor *sensor,
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
 	struct smiapp_pll_limits lim = {
-		.min_pre_pll_clk_div = sensor->limits[SMIAPP_LIMIT_MIN_PRE_PLL_CLK_DIV],
-		.max_pre_pll_clk_div = sensor->limits[SMIAPP_LIMIT_MAX_PRE_PLL_CLK_DIV],
-		.min_pll_ip_freq_hz = sensor->limits[SMIAPP_LIMIT_MIN_PLL_IP_FREQ_HZ],
-		.max_pll_ip_freq_hz = sensor->limits[SMIAPP_LIMIT_MAX_PLL_IP_FREQ_HZ],
-		.min_pll_multiplier = sensor->limits[SMIAPP_LIMIT_MIN_PLL_MULTIPLIER],
-		.max_pll_multiplier = sensor->limits[SMIAPP_LIMIT_MAX_PLL_MULTIPLIER],
-		.min_pll_op_freq_hz = sensor->limits[SMIAPP_LIMIT_MIN_PLL_OP_FREQ_HZ],
-		.max_pll_op_freq_hz = sensor->limits[SMIAPP_LIMIT_MAX_PLL_OP_FREQ_HZ],
-
-		.op.min_sys_clk_div = sensor->limits[SMIAPP_LIMIT_MIN_OP_SYS_CLK_DIV],
-		.op.max_sys_clk_div = sensor->limits[SMIAPP_LIMIT_MAX_OP_SYS_CLK_DIV],
-		.op.min_pix_clk_div = sensor->limits[SMIAPP_LIMIT_MIN_OP_PIX_CLK_DIV],
-		.op.max_pix_clk_div = sensor->limits[SMIAPP_LIMIT_MAX_OP_PIX_CLK_DIV],
-		.op.min_sys_clk_freq_hz = sensor->limits[SMIAPP_LIMIT_MIN_OP_SYS_CLK_FREQ_HZ],
-		.op.max_sys_clk_freq_hz = sensor->limits[SMIAPP_LIMIT_MAX_OP_SYS_CLK_FREQ_HZ],
-		.op.min_pix_clk_freq_hz = sensor->limits[SMIAPP_LIMIT_MIN_OP_PIX_CLK_FREQ_HZ],
-		.op.max_pix_clk_freq_hz = sensor->limits[SMIAPP_LIMIT_MAX_OP_PIX_CLK_FREQ_HZ],
-
-		.vt.min_sys_clk_div = sensor->limits[SMIAPP_LIMIT_MIN_VT_SYS_CLK_DIV],
-		.vt.max_sys_clk_div = sensor->limits[SMIAPP_LIMIT_MAX_VT_SYS_CLK_DIV],
-		.vt.min_pix_clk_div = sensor->limits[SMIAPP_LIMIT_MIN_VT_PIX_CLK_DIV],
-		.vt.max_pix_clk_div = sensor->limits[SMIAPP_LIMIT_MAX_VT_PIX_CLK_DIV],
-		.vt.min_sys_clk_freq_hz = sensor->limits[SMIAPP_LIMIT_MIN_VT_SYS_CLK_FREQ_HZ],
-		.vt.max_sys_clk_freq_hz = sensor->limits[SMIAPP_LIMIT_MAX_VT_SYS_CLK_FREQ_HZ],
-		.vt.min_pix_clk_freq_hz = sensor->limits[SMIAPP_LIMIT_MIN_VT_PIX_CLK_FREQ_HZ],
-		.vt.max_pix_clk_freq_hz = sensor->limits[SMIAPP_LIMIT_MAX_VT_PIX_CLK_FREQ_HZ],
-
-		.min_line_length_pck_bin = sensor->limits[SMIAPP_LIMIT_MIN_LINE_LENGTH_PCK_BIN],
-		.min_line_length_pck = sensor->limits[SMIAPP_LIMIT_MIN_LINE_LENGTH_PCK],
+		.min_pre_pll_clk_div = SMIA_LIM(sensor, MIN_PRE_PLL_CLK_DIV),
+		.max_pre_pll_clk_div = SMIA_LIM(sensor, MAX_PRE_PLL_CLK_DIV),
+		.min_pll_ip_freq_hz = SMIA_LIM(sensor, MIN_PLL_IP_FREQ_HZ),
+		.max_pll_ip_freq_hz = SMIA_LIM(sensor, MAX_PLL_IP_FREQ_HZ),
+		.min_pll_multiplier = SMIA_LIM(sensor, MIN_PLL_MULTIPLIER),
+		.max_pll_multiplier = SMIA_LIM(sensor, MAX_PLL_MULTIPLIER),
+		.min_pll_op_freq_hz = SMIA_LIM(sensor, MIN_PLL_OP_FREQ_HZ),
+		.max_pll_op_freq_hz = SMIA_LIM(sensor, MAX_PLL_OP_FREQ_HZ),
+
+		.op.min_sys_clk_div = SMIA_LIM(sensor, MIN_OP_SYS_CLK_DIV),
+		.op.max_sys_clk_div = SMIA_LIM(sensor, MAX_OP_SYS_CLK_DIV),
+		.op.min_pix_clk_div = SMIA_LIM(sensor, MIN_OP_PIX_CLK_DIV),
+		.op.max_pix_clk_div = SMIA_LIM(sensor, MAX_OP_PIX_CLK_DIV),
+		.op.min_sys_clk_freq_hz = SMIA_LIM(sensor, MIN_OP_SYS_CLK_FREQ_HZ),
+		.op.max_sys_clk_freq_hz = SMIA_LIM(sensor, MAX_OP_SYS_CLK_FREQ_HZ),
+		.op.min_pix_clk_freq_hz = SMIA_LIM(sensor, MIN_OP_PIX_CLK_FREQ_HZ),
+		.op.max_pix_clk_freq_hz = SMIA_LIM(sensor, MAX_OP_PIX_CLK_FREQ_HZ),
+
+		.vt.min_sys_clk_div = SMIA_LIM(sensor, MIN_VT_SYS_CLK_DIV),
+		.vt.max_sys_clk_div = SMIA_LIM(sensor, MAX_VT_SYS_CLK_DIV),
+		.vt.min_pix_clk_div = SMIA_LIM(sensor, MIN_VT_PIX_CLK_DIV),
+		.vt.max_pix_clk_div = SMIA_LIM(sensor, MAX_VT_PIX_CLK_DIV),
+		.vt.min_sys_clk_freq_hz = SMIA_LIM(sensor, MIN_VT_SYS_CLK_FREQ_HZ),
+		.vt.max_sys_clk_freq_hz = SMIA_LIM(sensor, MAX_VT_SYS_CLK_FREQ_HZ),
+		.vt.min_pix_clk_freq_hz = SMIA_LIM(sensor, MIN_VT_PIX_CLK_FREQ_HZ),
+		.vt.max_pix_clk_freq_hz = SMIA_LIM(sensor, MAX_VT_PIX_CLK_FREQ_HZ),
+
+		.min_line_length_pck_bin = SMIA_LIM(sensor, MIN_LINE_LENGTH_PCK_BIN),
+		.min_line_length_pck = SMIA_LIM(sensor, MIN_LINE_LENGTH_PCK),
 	};
 
 	return smiapp_pll_calculate(&client->dev, &lim, pll);
@@ -311,7 +323,7 @@ static void __smiapp_update_exposure_limits(struct smiapp_sensor *sensor)
 
 	max = sensor->pixel_array->crop[SMIAPP_PA_PAD_SRC].height
 		+ sensor->vblank->val
-		- sensor->limits[SMIAPP_LIMIT_COARSE_INTEGRATION_TIME_MAX_MARGIN];
+		- SMIA_LIM(sensor, COARSE_INTEGRATION_TIME_MAX_MARGIN);
 
 	__v4l2_ctrl_modify_range(ctrl, ctrl->minimum, max, ctrl->step, max);
 }
@@ -568,10 +580,10 @@ static int smiapp_init_controls(struct smiapp_sensor *sensor)
 	sensor->analog_gain = v4l2_ctrl_new_std(
 		&sensor->pixel_array->ctrl_handler, &smiapp_ctrl_ops,
 		V4L2_CID_ANALOGUE_GAIN,
-		sensor->limits[SMIAPP_LIMIT_ANALOGUE_GAIN_CODE_MIN],
-		sensor->limits[SMIAPP_LIMIT_ANALOGUE_GAIN_CODE_MAX],
-		max(sensor->limits[SMIAPP_LIMIT_ANALOGUE_GAIN_CODE_STEP], 1U),
-		sensor->limits[SMIAPP_LIMIT_ANALOGUE_GAIN_CODE_MIN]);
+		SMIA_LIM(sensor, ANALOGUE_GAIN_CODE_MIN),
+		SMIA_LIM(sensor, ANALOGUE_GAIN_CODE_MAX),
+		max(SMIA_LIM(sensor, ANALOGUE_GAIN_CODE_STEP), 1U),
+		SMIA_LIM(sensor, ANALOGUE_GAIN_CODE_MIN));
 
 	/* Exposure limits will be updated soon, use just something here. */
 	sensor->exposure = v4l2_ctrl_new_std(
@@ -710,7 +722,7 @@ static int smiapp_get_all_limits(struct smiapp_sensor *sensor)
 			return rval;
 	}
 
-	if (sensor->limits[SMIAPP_LIMIT_SCALER_N_MIN] == 0)
+	if (SMIA_LIM(sensor, SCALER_N_MIN) == 0)
 		smiapp_replace_limit(sensor, SMIAPP_LIMIT_SCALER_N_MIN, 16);
 
 	return 0;
@@ -869,21 +881,21 @@ static void smiapp_update_blanking(struct smiapp_sensor *sensor)
 	int min, max;
 
 	if (sensor->binning_vertical > 1 || sensor->binning_horizontal > 1) {
-		min_fll = sensor->limits[SMIAPP_LIMIT_MIN_FRAME_LENGTH_LINES_BIN];
-		max_fll = sensor->limits[SMIAPP_LIMIT_MAX_FRAME_LENGTH_LINES_BIN];
-		min_llp = sensor->limits[SMIAPP_LIMIT_MIN_LINE_LENGTH_PCK_BIN];
-		max_llp = sensor->limits[SMIAPP_LIMIT_MAX_LINE_LENGTH_PCK_BIN];
-		min_lbp = sensor->limits[SMIAPP_LIMIT_MIN_LINE_BLANKING_PCK_BIN];
+		min_fll = SMIA_LIM(sensor, MIN_FRAME_LENGTH_LINES_BIN);
+		max_fll = SMIA_LIM(sensor, MAX_FRAME_LENGTH_LINES_BIN);
+		min_llp = SMIA_LIM(sensor, MIN_LINE_LENGTH_PCK_BIN);
+		max_llp = SMIA_LIM(sensor, MAX_LINE_LENGTH_PCK_BIN);
+		min_lbp = SMIA_LIM(sensor, MIN_LINE_BLANKING_PCK_BIN);
 	} else {
-		min_fll = sensor->limits[SMIAPP_LIMIT_MIN_FRAME_LENGTH_LINES];
-		max_fll = sensor->limits[SMIAPP_LIMIT_MAX_FRAME_LENGTH_LINES];
-		min_llp = sensor->limits[SMIAPP_LIMIT_MIN_LINE_LENGTH_PCK];
-		max_llp = sensor->limits[SMIAPP_LIMIT_MAX_LINE_LENGTH_PCK];
-		min_lbp = sensor->limits[SMIAPP_LIMIT_MIN_LINE_BLANKING_PCK];
+		min_fll = SMIA_LIM(sensor, MIN_FRAME_LENGTH_LINES);
+		max_fll = SMIA_LIM(sensor, MAX_FRAME_LENGTH_LINES);
+		min_llp = SMIA_LIM(sensor, MIN_LINE_LENGTH_PCK);
+		max_llp = SMIA_LIM(sensor, MAX_LINE_LENGTH_PCK);
+		min_lbp = SMIA_LIM(sensor, MIN_LINE_BLANKING_PCK);
 	}
 
 	min = max_t(int,
-		    sensor->limits[SMIAPP_LIMIT_MIN_FRAME_BLANKING_LINES],
+		    SMIA_LIM(sensor, MIN_FRAME_BLANKING_LINES),
 		    min_fll -
 		    sensor->pixel_array->crop[SMIAPP_PA_PAD_SRC].height);
 	max = max_fll -	sensor->pixel_array->crop[SMIAPP_PA_PAD_SRC].height;
@@ -961,7 +973,7 @@ static int smiapp_read_nvm_page(struct smiapp_sensor *sensor, u32 p, u8 *nvm,
 		return -ENODATA;
 	}
 
-	if (sensor->limits[SMIAPP_LIMIT_DATA_TRANSFER_IF_CAPABILITY] &
+	if (SMIA_LIM(sensor, DATA_TRANSFER_IF_CAPABILITY) &
 	    SMIAPP_DATA_TRANSFER_IF_CAPABILITY_POLL) {
 		for (i = 1000; i > 0; i--) {
 			if (s & SMIAPP_DATA_TRANSFER_IF_1_STATUS_RD_READY)
@@ -1416,7 +1428,7 @@ static int smiapp_start_streaming(struct smiapp_sensor *sensor)
 	 */
 
 	/* Digital crop */
-	if (sensor->limits[SMIAPP_LIMIT_DIGITAL_CROP_CAPABILITY]
+	if (SMIA_LIM(sensor, DIGITAL_CROP_CAPABILITY)
 	    == SMIAPP_DIGITAL_CROP_CAPABILITY_INPUT_CROP) {
 		rval = smiapp_write(
 			sensor, SMIAPP_REG_U16_DIGITAL_CROP_X_OFFSET,
@@ -1444,7 +1456,7 @@ static int smiapp_start_streaming(struct smiapp_sensor *sensor)
 	}
 
 	/* Scaling */
-	if (sensor->limits[SMIAPP_LIMIT_SCALING_CAPABILITY]
+	if (SMIA_LIM(sensor, SCALING_CAPABILITY)
 	    != SMIAPP_SCALING_CAPABILITY_NONE) {
 		rval = smiapp_write(sensor, SMIAPP_REG_U16_SCALING_MODE,
 				    sensor->scaling_mode);
@@ -1467,7 +1479,7 @@ static int smiapp_start_streaming(struct smiapp_sensor *sensor)
 	if (rval < 0)
 		goto out;
 
-	if ((sensor->limits[SMIAPP_LIMIT_FLASH_MODE_CAPABILITY] &
+	if ((SMIA_LIM(sensor, FLASH_MODE_CAPABILITY) &
 	     (SMIAPP_FLASH_MODE_CAPABILITY_SINGLE_STROBE |
 	      SMIAPP_FLASH_MODE_CAPABILITY_MULTIPLE_STROBE)) &&
 	    sensor->hwcfg->strobe_setup != NULL &&
@@ -1715,8 +1727,7 @@ static void smiapp_propagate(struct v4l2_subdev *subdev,
 		if (which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 			if (ssd == sensor->scaler) {
 				sensor->scale_m =
-					sensor->limits[
-						SMIAPP_LIMIT_SCALER_N_MIN];
+					SMIA_LIM(sensor, SCALER_N_MIN);
 				sensor->scaling_mode =
 					SMIAPP_SCALING_MODE_NONE;
 			} else if (ssd == sensor->binner) {
@@ -1828,12 +1839,12 @@ static int smiapp_set_format(struct v4l2_subdev *subdev,
 
 	fmt->format.width =
 		clamp(fmt->format.width,
-		      sensor->limits[SMIAPP_LIMIT_MIN_X_OUTPUT_SIZE],
-		      sensor->limits[SMIAPP_LIMIT_MAX_X_OUTPUT_SIZE]);
+		      SMIA_LIM(sensor, MIN_X_OUTPUT_SIZE),
+		      SMIA_LIM(sensor, MAX_X_OUTPUT_SIZE));
 	fmt->format.height =
 		clamp(fmt->format.height,
-		      sensor->limits[SMIAPP_LIMIT_MIN_Y_OUTPUT_SIZE],
-		      sensor->limits[SMIAPP_LIMIT_MAX_Y_OUTPUT_SIZE]);
+		      SMIA_LIM(sensor, MIN_Y_OUTPUT_SIZE),
+		      SMIA_LIM(sensor, MAX_Y_OUTPUT_SIZE));
 
 	smiapp_get_crop_compose(subdev, cfg, crops, NULL, fmt->which);
 
@@ -1886,7 +1897,7 @@ static int scaling_goodness(struct v4l2_subdev *subdev, int w, int ask_w,
 	val -= abs(w - ask_w);
 	val -= abs(h - ask_h);
 
-	if (w < sensor->limits[SMIAPP_LIMIT_MIN_X_OUTPUT_SIZE])
+	if (w < SMIA_LIM(sensor, MIN_X_OUTPUT_SIZE))
 		val -= SCALING_GOODNESS_EXTREME;
 
 	dev_dbg(&client->dev, "w %d ask_w %d h %d ask_h %d goodness %d\n",
@@ -1952,7 +1963,7 @@ static void smiapp_set_compose_scaler(struct v4l2_subdev *subdev,
 	struct i2c_client *client = v4l2_get_subdevdata(subdev);
 	struct smiapp_sensor *sensor = to_smiapp_sensor(subdev);
 	u32 min, max, a, b, max_m;
-	u32 scale_m = sensor->limits[SMIAPP_LIMIT_SCALER_N_MIN];
+	u32 scale_m = SMIA_LIM(sensor, SCALER_N_MIN);
 	int mode = SMIAPP_SCALING_MODE_HORIZONTAL;
 	u32 try[4];
 	u32 ntry = 0;
@@ -1965,19 +1976,19 @@ static void smiapp_set_compose_scaler(struct v4l2_subdev *subdev,
 			      crops[SMIAPP_PAD_SINK]->height);
 
 	a = crops[SMIAPP_PAD_SINK]->width
-		* sensor->limits[SMIAPP_LIMIT_SCALER_N_MIN] / sel->r.width;
+		* SMIA_LIM(sensor, SCALER_N_MIN) / sel->r.width;
 	b = crops[SMIAPP_PAD_SINK]->height
-		* sensor->limits[SMIAPP_LIMIT_SCALER_N_MIN] / sel->r.height;
+		* SMIA_LIM(sensor, SCALER_N_MIN) / sel->r.height;
 	max_m = crops[SMIAPP_PAD_SINK]->width
-		* sensor->limits[SMIAPP_LIMIT_SCALER_N_MIN]
-		/ sensor->limits[SMIAPP_LIMIT_MIN_X_OUTPUT_SIZE];
+		* SMIA_LIM(sensor, SCALER_N_MIN)
+		/ SMIA_LIM(sensor, MIN_X_OUTPUT_SIZE);
 
-	a = clamp(a, sensor->limits[SMIAPP_LIMIT_SCALER_M_MIN],
-		  sensor->limits[SMIAPP_LIMIT_SCALER_M_MAX]);
-	b = clamp(b, sensor->limits[SMIAPP_LIMIT_SCALER_M_MIN],
-		  sensor->limits[SMIAPP_LIMIT_SCALER_M_MAX]);
-	max_m = clamp(max_m, sensor->limits[SMIAPP_LIMIT_SCALER_M_MIN],
-		      sensor->limits[SMIAPP_LIMIT_SCALER_M_MAX]);
+	a = clamp(a, SMIA_LIM(sensor, SCALER_M_MIN),
+		  SMIA_LIM(sensor, SCALER_M_MAX));
+	b = clamp(b, SMIA_LIM(sensor, SCALER_M_MIN),
+		  SMIA_LIM(sensor, SCALER_M_MAX));
+	max_m = clamp(max_m, SMIA_LIM(sensor, SCALER_M_MIN),
+		      SMIA_LIM(sensor, SCALER_M_MAX));
 
 	dev_dbg(&client->dev, "scaling: a %d b %d max_m %d\n", a, b, max_m);
 
@@ -2004,7 +2015,7 @@ static void smiapp_set_compose_scaler(struct v4l2_subdev *subdev,
 			subdev,
 			crops[SMIAPP_PAD_SINK]->width
 			/ try[i]
-			* sensor->limits[SMIAPP_LIMIT_SCALER_N_MIN],
+			* SMIA_LIM(sensor, SCALER_N_MIN),
 			sel->r.width,
 			crops[SMIAPP_PAD_SINK]->height,
 			sel->r.height,
@@ -2018,18 +2029,18 @@ static void smiapp_set_compose_scaler(struct v4l2_subdev *subdev,
 			best = this;
 		}
 
-		if (sensor->limits[SMIAPP_LIMIT_SCALING_CAPABILITY]
+		if (SMIA_LIM(sensor, SCALING_CAPABILITY)
 		    == SMIAPP_SCALING_CAPABILITY_HORIZONTAL)
 			continue;
 
 		this = scaling_goodness(
 			subdev, crops[SMIAPP_PAD_SINK]->width
 			/ try[i]
-			* sensor->limits[SMIAPP_LIMIT_SCALER_N_MIN],
+			* SMIA_LIM(sensor, SCALER_N_MIN),
 			sel->r.width,
 			crops[SMIAPP_PAD_SINK]->height
 			/ try[i]
-			* sensor->limits[SMIAPP_LIMIT_SCALER_N_MIN],
+			* SMIA_LIM(sensor, SCALER_N_MIN),
 			sel->r.height,
 			sel->flags);
 
@@ -2043,12 +2054,12 @@ static void smiapp_set_compose_scaler(struct v4l2_subdev *subdev,
 	sel->r.width =
 		(crops[SMIAPP_PAD_SINK]->width
 		 / scale_m
-		 * sensor->limits[SMIAPP_LIMIT_SCALER_N_MIN]) & ~1;
+		 * SMIA_LIM(sensor, SCALER_N_MIN)) & ~1;
 	if (mode == SMIAPP_SCALING_MODE_BOTH)
 		sel->r.height =
 			(crops[SMIAPP_PAD_SINK]->height
 			 / scale_m
-			 * sensor->limits[SMIAPP_LIMIT_SCALER_N_MIN])
+			 * SMIA_LIM(sensor, SCALER_N_MIN))
 			& ~1;
 	else
 		sel->r.height = crops[SMIAPP_PAD_SINK]->height;
@@ -2104,7 +2115,7 @@ static int __smiapp_sel_supported(struct v4l2_subdev *subdev,
 			return 0;
 		if (ssd == sensor->scaler
 		    && sel->pad == SMIAPP_PAD_SINK
-		    && sensor->limits[SMIAPP_LIMIT_DIGITAL_CROP_CAPABILITY]
+		    && SMIA_LIM(sensor, DIGITAL_CROP_CAPABILITY)
 		    == SMIAPP_DIGITAL_CROP_CAPABILITY_INPUT_CROP)
 			return 0;
 		return -EINVAL;
@@ -2120,7 +2131,7 @@ static int __smiapp_sel_supported(struct v4l2_subdev *subdev,
 		if (ssd == sensor->binner)
 			return 0;
 		if (ssd == sensor->scaler
-		    && sensor->limits[SMIAPP_LIMIT_SCALING_CAPABILITY]
+		    && SMIA_LIM(sensor, SCALING_CAPABILITY)
 		    != SMIAPP_SCALING_CAPABILITY_NONE)
 			return 0;
 		/* Fall through */
@@ -2185,8 +2196,8 @@ static void smiapp_get_native_size(struct smiapp_subdev *ssd,
 {
 	r->top = 0;
 	r->left = 0;
-	r->width = ssd->sensor->limits[SMIAPP_LIMIT_X_ADDR_MAX] + 1;
-	r->height = ssd->sensor->limits[SMIAPP_LIMIT_Y_ADDR_MAX] + 1;
+	r->width = SMIA_LIM(ssd->sensor, X_ADDR_MAX) + 1;
+	r->height = SMIA_LIM(ssd->sensor, Y_ADDR_MAX) + 1;
 }
 
 static int __smiapp_get_selection(struct v4l2_subdev *subdev,
@@ -2271,10 +2282,10 @@ static int smiapp_set_selection(struct v4l2_subdev *subdev,
 	sel->r.height =	SMIAPP_ALIGN_DIM(sel->r.height, sel->flags);
 
 	sel->r.width = max_t(unsigned int,
-			     sensor->limits[SMIAPP_LIMIT_MIN_X_OUTPUT_SIZE],
+			     SMIA_LIM(sensor, MIN_X_OUTPUT_SIZE),
 			     sel->r.width);
 	sel->r.height = max_t(unsigned int,
-			      sensor->limits[SMIAPP_LIMIT_MIN_Y_OUTPUT_SIZE],
+			      SMIA_LIM(sensor, MIN_Y_OUTPUT_SIZE),
 			      sel->r.height);
 
 	switch (sel->target) {
@@ -2963,7 +2974,7 @@ static int smiapp_probe(struct i2c_client *client)
 		goto out_power_off;
 	}
 
-	if (sensor->limits[SMIAPP_LIMIT_BINNING_CAPABILITY]) {
+	if (SMIA_LIM(sensor, BINNING_CAPABILITY)) {
 		u32 val;
 
 		rval = smiapp_read(sensor,
@@ -3000,7 +3011,7 @@ static int smiapp_probe(struct i2c_client *client)
 	}
 
 	if (sensor->minfo.smiapp_version &&
-	    sensor->limits[SMIAPP_LIMIT_DATA_TRANSFER_IF_CAPABILITY] &
+	    SMIA_LIM(sensor, DATA_TRANSFER_IF_CAPABILITY) &
 	    SMIAPP_DATA_TRANSFER_IF_CAPABILITY_SUPPORTED) {
 		if (device_create_file(&client->dev, &dev_attr_nvm) != 0) {
 			dev_err(&client->dev, "sysfs nvm entry failed\n");
@@ -3010,21 +3021,21 @@ static int smiapp_probe(struct i2c_client *client)
 	}
 
 	/* We consider this as profile 0 sensor if any of these are zero. */
-	if (!sensor->limits[SMIAPP_LIMIT_MIN_OP_SYS_CLK_DIV] ||
-	    !sensor->limits[SMIAPP_LIMIT_MAX_OP_SYS_CLK_DIV] ||
-	    !sensor->limits[SMIAPP_LIMIT_MIN_OP_PIX_CLK_DIV] ||
-	    !sensor->limits[SMIAPP_LIMIT_MAX_OP_PIX_CLK_DIV]) {
+	if (!SMIA_LIM(sensor, MIN_OP_SYS_CLK_DIV) ||
+	    !SMIA_LIM(sensor, MAX_OP_SYS_CLK_DIV) ||
+	    !SMIA_LIM(sensor, MIN_OP_PIX_CLK_DIV) ||
+	    !SMIA_LIM(sensor, MAX_OP_PIX_CLK_DIV)) {
 		sensor->minfo.smiapp_profile = SMIAPP_PROFILE_0;
-	} else if (sensor->limits[SMIAPP_LIMIT_SCALING_CAPABILITY]
+	} else if (SMIA_LIM(sensor, SCALING_CAPABILITY)
 		   != SMIAPP_SCALING_CAPABILITY_NONE) {
-		if (sensor->limits[SMIAPP_LIMIT_SCALING_CAPABILITY]
+		if (SMIA_LIM(sensor, SCALING_CAPABILITY)
 		    == SMIAPP_SCALING_CAPABILITY_HORIZONTAL)
 			sensor->minfo.smiapp_profile = SMIAPP_PROFILE_1;
 		else
 			sensor->minfo.smiapp_profile = SMIAPP_PROFILE_2;
 		sensor->scaler = &sensor->ssds[sensor->ssds_used];
 		sensor->ssds_used++;
-	} else if (sensor->limits[SMIAPP_LIMIT_DIGITAL_CROP_CAPABILITY]
+	} else if (SMIA_LIM(sensor, DIGITAL_CROP_CAPABILITY)
 		   == SMIAPP_DIGITAL_CROP_CAPABILITY_INPUT_CROP) {
 		sensor->scaler = &sensor->ssds[sensor->ssds_used];
 		sensor->ssds_used++;
@@ -3034,13 +3045,13 @@ static int smiapp_probe(struct i2c_client *client)
 	sensor->pixel_array = &sensor->ssds[sensor->ssds_used];
 	sensor->ssds_used++;
 
-	sensor->scale_m = sensor->limits[SMIAPP_LIMIT_SCALER_N_MIN];
+	sensor->scale_m = SMIA_LIM(sensor, SCALER_N_MIN);
 
 	/* prepare PLL configuration input values */
 	sensor->pll.bus_type = SMIAPP_PLL_BUS_TYPE_CSI2;
 	sensor->pll.csi2.lanes = sensor->hwcfg->lanes;
 	sensor->pll.ext_clk_freq_hz = sensor->hwcfg->ext_clk;
-	sensor->pll.scale_n = sensor->limits[SMIAPP_LIMIT_SCALER_N_MIN];
+	sensor->pll.scale_n = SMIA_LIM(sensor, SCALER_N_MIN);
 	/* Profile 0 sensors have no separate OP clock branch. */
 	if (sensor->minfo.smiapp_profile == SMIAPP_PROFILE_0)
 		sensor->pll.flags |= SMIAPP_PLL_FLAG_NO_OP_CLOCKS;
-- 
2.20.1

