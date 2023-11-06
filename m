Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF6397E216E
	for <lists+linux-media@lfdr.de>; Mon,  6 Nov 2023 13:26:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231777AbjKFM0d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Nov 2023 07:26:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231767AbjKFM03 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Nov 2023 07:26:29 -0500
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5312DEA
        for <linux-media@vger.kernel.org>; Mon,  6 Nov 2023 04:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699273585; x=1730809585;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/kFdek5Z2px7+2fFV/+odlvsNs7x4nXf8MvCWSJFcOc=;
  b=HPWjvnKrOHWOpAiP3+afUdy6infs3tzuMOArfFnpGKaqPDMCXnqbjhyn
   /snPtppczZBtbGWdLYnn8tCXNBWecuPdnnvt8DpYhsKZu1mj6uI6TP0qM
   uN9wGbdzq4LpEmAAZCzwBWJENK8iMqd3+j0POeHoJLwSPNGrBi321Ck9E
   9+U6384xgd4tZnDtYTjTW7nGBsuKdrGwKrxX4kJMLzlZDhvlj73sbFpOh
   rWRzjsx1MQdS7rtmqJ0zZVNlEucV4kvOr3WN2uFSsNKDwQFZgF1rlaVqt
   7IfmHmHILVUhTbJN0O2WtZSmOsHSLX3i5BM8dxk8CfWdCkzC5ipVD63jA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="369469725"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="369469725"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 04:26:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="879427763"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="879427763"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 04:26:21 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 8D27A11FB8D;
        Mon,  6 Nov 2023 14:26:18 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>,
        Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v7 26/31] media: ccs: Rely on sub-device state locking
Date:   Mon,  6 Nov 2023 14:25:34 +0200
Message-Id: <20231106122539.1268265-27-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231106122539.1268265-1-sakari.ailus@linux.intel.com>
References: <20231106122539.1268265-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_PDS_OTHER_BAD_TLD,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rely on sub-device state locking to serialise access to driver's data
structures. The driver-provided mutex is used as the state lock for all
driver sub-devices.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 192 +++++++++++++------------------
 drivers/media/i2c/ccs/ccs.h      |   1 -
 2 files changed, 81 insertions(+), 112 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index e7548d56124b..1d1a157aec09 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -531,12 +531,13 @@ static int ccs_pll_update(struct ccs_sensor *sensor)
  *
  */
 
-static void __ccs_update_exposure_limits(struct ccs_sensor *sensor)
+static void __ccs_update_exposure_limits(struct ccs_sensor *sensor,
+					 struct v4l2_rect *pa_src)
 {
 	struct v4l2_ctrl *ctrl = sensor->exposure;
 	int max;
 
-	max = sensor->pa_src.height + sensor->vblank->val -
+	max = pa_src->height + sensor->vblank->val -
 		CCS_LIM(sensor, COARSE_INTEGRATION_TIME_MAX_MARGIN);
 
 	__v4l2_ctrl_modify_range(ctrl, ctrl->minimum, max, ctrl->step, max);
@@ -639,12 +640,20 @@ static int ccs_set_ctrl(struct v4l2_ctrl *ctrl)
 		container_of(ctrl->handler, struct ccs_subdev, ctrl_handler)
 			->sensor;
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
+	struct v4l2_subdev_state *state;
+	struct v4l2_rect *pa_src;
 	int pm_status;
 	u32 orient = 0;
 	unsigned int i;
 	int exposure;
 	int rval;
 
+	if (ctrl->id == V4L2_CID_VBLANK || ctrl->id == V4L2_CID_HBLANK) {
+		state = v4l2_subdev_get_locked_active_state(&sensor->pixel_array->sd);
+		pa_src = v4l2_subdev_state_get_crop(state, CCS_PA_PAD_SRC,
+						    CCS_STREAM_PIXEL);
+	}
+
 	switch (ctrl->id) {
 	case V4L2_CID_HFLIP:
 	case V4L2_CID_VFLIP:
@@ -663,7 +672,7 @@ static int ccs_set_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_VBLANK:
 		exposure = sensor->exposure->val;
 
-		__ccs_update_exposure_limits(sensor);
+		__ccs_update_exposure_limits(sensor, pa_src);
 
 		if (exposure > sensor->exposure->maximum) {
 			sensor->exposure->val =	sensor->exposure->maximum;
@@ -755,12 +764,12 @@ static int ccs_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	case V4L2_CID_VBLANK:
 		rval = ccs_write(sensor, FRAME_LENGTH_LINES,
-				 sensor->pa_src.height + ctrl->val);
+				 pa_src->height + ctrl->val);
 
 		break;
 	case V4L2_CID_HBLANK:
 		rval = ccs_write(sensor, LINE_LENGTH_PCK,
-				 sensor->pa_src.width + ctrl->val);
+				 pa_src->width + ctrl->val);
 
 		break;
 	case V4L2_CID_TEST_PATTERN:
@@ -1215,7 +1224,8 @@ static int ccs_get_mbus_formats(struct ccs_sensor *sensor)
 	return 0;
 }
 
-static void ccs_update_blanking(struct ccs_sensor *sensor)
+static void ccs_update_blanking(struct ccs_sensor *sensor,
+				struct v4l2_rect *pa_src)
 {
 	struct v4l2_ctrl *vblank = sensor->vblank;
 	struct v4l2_ctrl *hblank = sensor->hblank;
@@ -1238,21 +1248,26 @@ static void ccs_update_blanking(struct ccs_sensor *sensor)
 
 	min = max_t(int,
 		    CCS_LIM(sensor, MIN_FRAME_BLANKING_LINES),
-		    min_fll - sensor->pa_src.height);
-	max = max_fll -	sensor->pa_src.height;
+		    min_fll - pa_src->height);
+	max = max_fll -	pa_src->height;
 
 	__v4l2_ctrl_modify_range(vblank, min, max, vblank->step, min);
 
-	min = max_t(int, min_llp - sensor->pa_src.width, min_lbp);
-	max = max_llp - sensor->pa_src.width;
+	min = max_t(int, min_llp - pa_src->width, min_lbp);
+	max = max_llp - pa_src->width;
 
 	__v4l2_ctrl_modify_range(hblank, min, max, hblank->step, min);
 
-	__ccs_update_exposure_limits(sensor);
+	__ccs_update_exposure_limits(sensor, pa_src);
 }
 
 static int ccs_pll_blanking_update(struct ccs_sensor *sensor)
 {
+	struct v4l2_subdev_state *state =
+		v4l2_subdev_get_locked_active_state(&sensor->pixel_array->sd);
+	struct v4l2_rect *pa_src =
+		v4l2_subdev_state_get_crop(state, CCS_PA_PAD_SRC,
+					   CCS_STREAM_PIXEL);
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
 	int rval;
 
@@ -1261,15 +1276,15 @@ static int ccs_pll_blanking_update(struct ccs_sensor *sensor)
 		return rval;
 
 	/* Output from pixel array, including blanking */
-	ccs_update_blanking(sensor);
+	ccs_update_blanking(sensor, pa_src);
 
 	dev_dbg(&client->dev, "vblank\t\t%d\n", sensor->vblank->val);
 	dev_dbg(&client->dev, "hblank\t\t%d\n", sensor->hblank->val);
 
 	dev_dbg(&client->dev, "real timeperframe\t100/%d\n",
 		sensor->pll.pixel_rate_pixel_array /
-		((sensor->pa_src.width + sensor->hblank->val) *
-		 (sensor->pa_src.height + sensor->vblank->val) / 100));
+		((pa_src->width + sensor->hblank->val) *
+		 (pa_src->height + sensor->vblank->val) / 100));
 
 	return 0;
 }
@@ -1775,6 +1790,16 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
 			      u64 streams_mask)
 {
 	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
+	struct v4l2_subdev_state *pa_state =
+		v4l2_subdev_get_locked_active_state(&sensor->pixel_array->sd);
+	struct v4l2_subdev_state *src_state =
+		v4l2_subdev_get_locked_active_state(&sensor->src->sd);
+	struct v4l2_rect *pa_src =
+		v4l2_subdev_state_get_crop(pa_state, CCS_PA_PAD_SRC,
+					   CCS_STREAM_PIXEL);
+	struct v4l2_rect *src_src =
+		v4l2_subdev_state_get_crop(src_state, CCS_PAD_SRC,
+					   CCS_STREAM_PIXEL);
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
 	unsigned int binning_mode;
 	int rval;
@@ -1822,22 +1847,20 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
 		goto err_pm_put;
 
 	/* Analog crop start coordinates */
-	rval = ccs_write(sensor, X_ADDR_START, sensor->pa_src.left);
+	rval = ccs_write(sensor, X_ADDR_START, pa_src->left);
 	if (rval < 0)
 		goto err_pm_put;
 
-	rval = ccs_write(sensor, Y_ADDR_START, sensor->pa_src.top);
+	rval = ccs_write(sensor, Y_ADDR_START, pa_src->top);
 	if (rval < 0)
 		goto err_pm_put;
 
 	/* Analog crop end coordinates */
-	rval = ccs_write(sensor, X_ADDR_END,
-			 sensor->pa_src.left + sensor->pa_src.width - 1);
+	rval = ccs_write(sensor, X_ADDR_END, pa_src->left + pa_src->width - 1);
 	if (rval < 0)
 		goto err_pm_put;
 
-	rval = ccs_write(sensor, Y_ADDR_END,
-			 sensor->pa_src.top + sensor->pa_src.height - 1);
+	rval = ccs_write(sensor, Y_ADDR_END, pa_src->top + pa_src->height - 1);
 	if (rval < 0)
 		goto err_pm_put;
 
@@ -1849,23 +1872,30 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
 	/* Digital crop */
 	if (CCS_LIM(sensor, DIGITAL_CROP_CAPABILITY)
 	    == CCS_DIGITAL_CROP_CAPABILITY_INPUT_CROP) {
+		struct v4l2_subdev_state *scaler_state =
+			v4l2_subdev_get_locked_active_state(&sensor->scaler->sd);
+		struct v4l2_rect *scaler_sink =
+			v4l2_subdev_state_get_crop(scaler_state,
+						   sensor->scaler->sink_pad,
+						   CCS_STREAM_PIXEL);
+
 		rval = ccs_write(sensor, DIGITAL_CROP_X_OFFSET,
-				 sensor->scaler_sink.left);
+				 scaler_sink->left);
 		if (rval < 0)
 			goto err_pm_put;
 
 		rval = ccs_write(sensor, DIGITAL_CROP_Y_OFFSET,
-				 sensor->scaler_sink.top);
+				 scaler_sink->top);
 		if (rval < 0)
 			goto err_pm_put;
 
 		rval = ccs_write(sensor, DIGITAL_CROP_IMAGE_WIDTH,
-				 sensor->scaler_sink.width);
+				 scaler_sink->width);
 		if (rval < 0)
 			goto err_pm_put;
 
 		rval = ccs_write(sensor, DIGITAL_CROP_IMAGE_HEIGHT,
-				 sensor->scaler_sink.height);
+				 scaler_sink->height);
 		if (rval < 0)
 			goto err_pm_put;
 	}
@@ -1883,10 +1913,10 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
 	}
 
 	/* Output size from sensor */
-	rval = ccs_write(sensor, X_OUTPUT_SIZE, sensor->src_src.width);
+	rval = ccs_write(sensor, X_OUTPUT_SIZE, src_src->width);
 	if (rval < 0)
 		goto err_pm_put;
-	rval = ccs_write(sensor, Y_OUTPUT_SIZE, sensor->src_src.height);
+	rval = ccs_write(sensor, Y_OUTPUT_SIZE, src_src->height);
 	if (rval < 0)
 		goto err_pm_put;
 
@@ -2075,9 +2105,6 @@ static int ccs_enum_mbus_code(struct v4l2_subdev *subdev,
 	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
 	unsigned int i;
 	int idx = -1;
-	int rval = -EINVAL;
-
-	mutex_lock(&sensor->mutex);
 
 	dev_err(&client->dev, "subdev %s, pad %u, index %u\n",
 		subdev->name, code->pad, code->index);
@@ -2085,12 +2112,11 @@ static int ccs_enum_mbus_code(struct v4l2_subdev *subdev,
 	if (subdev == &sensor->src->sd) {
 		if (code->pad == CCS_PAD_META) {
 			if (code->index)
-				goto out;
+				return -EINVAL;
 
 			code->code = MEDIA_BUS_FMT_CCS_EMBEDDED;
 
-			rval = 0;
-			goto out;
+			return 0;
 		}
 		if (code->stream == CCS_STREAM_META) {
 			struct v4l2_mbus_framefmt *pix_fmt =
@@ -2137,21 +2163,21 @@ static int ccs_enum_mbus_code(struct v4l2_subdev *subdev,
 			}
 
 			if (WARN_ON(i > ARRAY_SIZE(codes)) || code->index >= i)
-				goto out;
+				return -EINVAL;
 
 			code->code = codes[code->index];
-			rval = 0;
-			goto out;
+
+			return 0;
 		}
 	}
 
 	if (subdev != &sensor->src->sd || code->pad != CCS_PAD_SRC) {
 		if (code->index)
-			goto out;
+			return -EINVAL;
 
 		code->code = sensor->internal_csi_format->code;
-		rval = 0;
-		goto out;
+
+		return 0;
 	}
 
 	for (i = 0; i < ARRAY_SIZE(ccs_csi_data_formats); i++) {
@@ -2162,18 +2188,14 @@ static int ccs_enum_mbus_code(struct v4l2_subdev *subdev,
 			code->code = ccs_csi_data_formats[i].code;
 			dev_err(&client->dev, "found index %u, i %u, code %x\n",
 				code->index, i, code->code);
-			rval = 0;
-			break;
+			return 0;
 		}
 	}
 
-out:
-	mutex_unlock(&sensor->mutex);
-
-	return rval;
+	return -EINVAL;
 }
 
-static u32 __ccs_get_mbus_code(struct v4l2_subdev *subdev, unsigned int pad)
+static u32 ccs_get_mbus_code(struct v4l2_subdev *subdev, unsigned int pad)
 {
 	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
 
@@ -2183,33 +2205,19 @@ static u32 __ccs_get_mbus_code(struct v4l2_subdev *subdev, unsigned int pad)
 		return sensor->internal_csi_format->code;
 }
 
-static int __ccs_get_format(struct v4l2_subdev *subdev,
-			    struct v4l2_subdev_state *sd_state,
-			    struct v4l2_subdev_format *fmt)
+static int ccs_get_format(struct v4l2_subdev *subdev,
+			  struct v4l2_subdev_state *sd_state,
+			  struct v4l2_subdev_format *fmt)
 {
 	fmt->format = *v4l2_subdev_state_get_format(sd_state, fmt->pad,
 						    fmt->stream);
 
 	if (fmt->pad != CCS_PAD_META && fmt->stream != CCS_STREAM_META)
-		fmt->format.code = __ccs_get_mbus_code(subdev, fmt->pad);
+		fmt->format.code = ccs_get_mbus_code(subdev, fmt->pad);
 
 	return 0;
 }
 
-static int ccs_get_format(struct v4l2_subdev *subdev,
-			  struct v4l2_subdev_state *sd_state,
-			  struct v4l2_subdev_format *fmt)
-{
-	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
-	int rval;
-
-	mutex_lock(&sensor->mutex);
-	rval = __ccs_get_format(subdev, sd_state, fmt);
-	mutex_unlock(&sensor->mutex);
-
-	return rval;
-}
-
 /* Changes require propagation only on sink pad. */
 static void ccs_propagate(struct v4l2_subdev *subdev,
 			  struct v4l2_subdev_state *sd_state, int which,
@@ -2233,7 +2241,6 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
 				sensor->scale_m = CCS_LIM(sensor, SCALER_N_MIN);
 				sensor->scaling_mode =
 					CCS_SCALING_MODE_NO_SCALING;
-				sensor->scaler_sink = *comp;
 			} else if (ssd == sensor->binner) {
 				sensor->binning_horizontal = 1;
 				sensor->binning_vertical = 1;
@@ -2248,8 +2255,6 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
 						   CCS_STREAM_PIXEL);
 		fmt->width = comp->width;
 		fmt->height = comp->height;
-		if (which == V4L2_SUBDEV_FORMAT_ACTIVE && ssd == sensor->src)
-			sensor->src_src = *crop;
 		break;
 	default:
 		WARN_ON_ONCE(1);
@@ -2268,7 +2273,7 @@ static int ccs_set_format_source(struct v4l2_subdev *subdev,
 	unsigned int i;
 	int rval;
 
-	rval = __ccs_get_format(subdev, sd_state, fmt);
+	rval = ccs_get_format(subdev, sd_state, fmt);
 	if (rval)
 		return rval;
 
@@ -2395,13 +2400,9 @@ static int ccs_set_format(struct v4l2_subdev *subdev,
 	if (subdev == &sensor->src->sd && fmt->pad == CCS_PAD_META)
 		return ccs_get_format(subdev, sd_state, fmt);
 
-	mutex_lock(&sensor->mutex);
-
 	if (subdev == &sensor->src->sd && fmt->stream == CCS_STREAM_META) {
 		ccs_set_format_meta(subdev, sd_state, &fmt->format);
 
-		mutex_unlock(&sensor->mutex);
-
 		return 0;
 	}
 
@@ -2412,13 +2413,12 @@ static int ccs_set_format(struct v4l2_subdev *subdev,
 		if (sensor->embedded_start != sensor->embedded_end)
 			ccs_set_format_meta(subdev, sd_state, NULL);
 
-		mutex_unlock(&sensor->mutex);
-
 		return rval;
 	}
 
 	/* Sink pad. Width and height are changeable here. */
-	fmt->format.code = __ccs_get_mbus_code(subdev, fmt->pad);
+	fmt->format.code = ccs_get_mbus_code(subdev, fmt->pad);
+
 	fmt->format.width &= ~1;
 	fmt->format.height &= ~1;
 	fmt->format.field = V4L2_FIELD_NONE;
@@ -2441,8 +2441,6 @@ static int ccs_set_format(struct v4l2_subdev *subdev,
 	crop->height = fmt->format.height;
 	ccs_propagate(subdev, sd_state, fmt->which, V4L2_SEL_TGT_CROP);
 
-	mutex_unlock(&sensor->mutex);
-
 	return 0;
 }
 
@@ -2756,9 +2754,6 @@ static int ccs_set_crop(struct v4l2_subdev *subdev,
 
 	if (ssd != sensor->pixel_array && sel->pad == CCS_PAD_SINK)
 		ccs_propagate(subdev, sd_state, sel->which, V4L2_SEL_TGT_CROP);
-	else if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE &&
-		 ssd == sensor->pixel_array)
-		sensor->pa_src = sel->r;
 
 	return 0;
 }
@@ -2830,8 +2825,6 @@ static int ccs_set_selection(struct v4l2_subdev *subdev,
 	if (ret)
 		return ret;
 
-	mutex_lock(&sensor->mutex);
-
 	sel->r.left = max(0, sel->r.left & ~1);
 	sel->r.top = max(0, sel->r.top & ~1);
 	sel->r.width = CCS_ALIGN_DIM(sel->r.width, sel->flags);
@@ -2853,7 +2846,6 @@ static int ccs_set_selection(struct v4l2_subdev *subdev,
 		ret = -EINVAL;
 	}
 
-	mutex_unlock(&sensor->mutex);
 	return ret;
 }
 
@@ -3240,6 +3232,7 @@ static int ccs_init_subdev(struct ccs_sensor *sensor,
 
 	ssd->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	ssd->sd.entity.function = function;
+	ssd->sd.state_lock = &sensor->mutex;
 	ssd->sensor = sensor;
 
 	ssd->npads = num_pads;
@@ -3279,8 +3272,8 @@ static int ccs_init_subdev(struct ccs_sensor *sensor,
 	return 0;
 }
 
-static int __ccs_init_cfg(struct v4l2_subdev *sd,
-			  struct v4l2_subdev_state *sd_state)
+static int ccs_init_cfg(struct v4l2_subdev *sd,
+			struct v4l2_subdev_state *sd_state)
 {
 	struct ccs_subdev *ssd = to_ccs_subdev(sd);
 	struct ccs_sensor *sensor = ssd->sensor;
@@ -3299,12 +3292,8 @@ static int __ccs_init_cfg(struct v4l2_subdev *sd,
 	fmt->code = sensor->internal_csi_format->code;
 	fmt->field = V4L2_FIELD_NONE;
 
-	if (ssd == sensor->pixel_array) {
-		if (is_active)
-			sensor->pa_src = *crop;
-
+	if (ssd == sensor->pixel_array)
 		return 0;
-	}
 
 	fmt = v4l2_subdev_state_get_format(sd_state, CCS_PAD_SRC,
 					   CCS_STREAM_PIXEL);
@@ -3317,20 +3306,6 @@ static int __ccs_init_cfg(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int ccs_init_cfg(struct v4l2_subdev *sd,
-			struct v4l2_subdev_state *sd_state)
-{
-	struct ccs_subdev *ssd = to_ccs_subdev(sd);
-	struct ccs_sensor *sensor = ssd->sensor;
-	int rval;
-
-	mutex_lock(&sensor->mutex);
-	rval = __ccs_init_cfg(sd, sd_state);
-	mutex_unlock(&sensor->mutex);
-
-	return rval;
-}
-
 static int ccs_src_init_cfg(struct v4l2_subdev *sd,
 			    struct v4l2_subdev_state *sd_state)
 {
@@ -3355,25 +3330,20 @@ static int ccs_src_init_cfg(struct v4l2_subdev *sd,
 	struct ccs_sensor *sensor = ssd->sensor;
 	int rval;
 
-	mutex_lock(&sensor->mutex);
-
 	if (sensor->embedded_start != sensor->embedded_end)
 		routing.num_routes++;
 
 	rval = v4l2_subdev_set_routing(sd, sd_state, &routing);
 	if (rval)
-		goto out;
+		return 0;
 
-	rval = __ccs_init_cfg(sd, sd_state);
+	rval = ccs_init_cfg(sd, sd_state);
 	if (rval)
-		goto out;
+		return 0;
 
 	if (sensor->embedded_start != sensor->embedded_end)
 		ccs_set_format_meta(sd, sd_state, NULL);
 
-out:
-	mutex_unlock(&sensor->mutex);
-
 	return rval;
 }
 
diff --git a/drivers/media/i2c/ccs/ccs.h b/drivers/media/i2c/ccs/ccs.h
index 5e561cc91717..47c77f3284c8 100644
--- a/drivers/media/i2c/ccs/ccs.h
+++ b/drivers/media/i2c/ccs/ccs.h
@@ -228,7 +228,6 @@ struct ccs_sensor {
 	u32 mbus_frame_fmts;
 	const struct ccs_csi_data_format *csi_format;
 	const struct ccs_csi_data_format *internal_csi_format;
-	struct v4l2_rect pa_src, scaler_sink, src_src;
 	u32 default_mbus_frame_fmts;
 	int default_pixel_order;
 	struct ccs_data_container sdata, mdata;
-- 
2.39.2

