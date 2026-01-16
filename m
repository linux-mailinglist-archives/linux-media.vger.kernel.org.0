Return-Path: <linux-media+bounces-50883-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C89D31264
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 13:35:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D5A09304A8C2
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 12:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B7EC1C3BEB;
	Fri, 16 Jan 2026 12:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nBEv8wQk"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403FC19C566
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 12:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768566920; cv=none; b=GTAhvTIuB1KNX30ktoatWVMwMO5FQzOuVmP1xCyiLSEj/fIlHoCRur5OnC5huGXA9lhCG2iEEbd4NdRWE9xqtB6bPAb/xuh8OLTxCNYdjF1LieNRa9VfOo2NR67UYb1P0ahsgg8EW7GQh1bruizajlkxiF5oEhU5VhNsZ9VWy2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768566920; c=relaxed/simple;
	bh=zMR/WQA+LoBSkBZJrwjWJSU37wYT/lraFYiHnQ+M3aU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C6SM+vJCqhUu6rMbWMoyt6lL6N9mgzdsrBQEv3okqqpCCfh31aSVHAcQ6lVJAGOsSV7OYyT6oucXKhhbkQVfmLf7FMhxD4gB3Yqk7G/rWntVt1ULvoSjGJdqeZ+i3amYxqmpMG3T1w12Ake9mkJc8+ulDfFI5QRlxJ3WiyMH0E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nBEv8wQk; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768566919; x=1800102919;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zMR/WQA+LoBSkBZJrwjWJSU37wYT/lraFYiHnQ+M3aU=;
  b=nBEv8wQkwwg42fXAVSUablH7Z/m3ce5+ggiRdTXJ0PbLwIxYzR1D0d2e
   a2lfuEp63MiQmOkD+LF7PXZuvoNgahetJkCiOmd/rgOUV2HU0WWeiN6WZ
   YSDU//sdgcZ5xmr8ti3U2lOCUuDHs+2jwjTGmPk+Kl2IjTjiOLaSqLOA5
   zgCx4lTTFxV/O1rDcKqhqKTd+TV0IW8L4rPPInA18sfoJ8gwB2XDcHURg
   U/Y79N80oktOIBZmN0AAI7q7p/3YnsWGVj5pfcpFjU/MtfEnzurvf3Kln
   AORPlfz0C/4WnI70UtJeJtOpbDEg8Z1plBnotYoU2EXAmt4wHK4KlOV9M
   A==;
X-CSE-ConnectionGUID: a5jWDQy/SyyWXwzXln6rog==
X-CSE-MsgGUID: vItnTwzoTO6FX4qyGqnChA==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="81327475"
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="81327475"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 04:35:16 -0800
X-CSE-ConnectionGUID: zYAfK8rqTI+ZzBmUs9yjHw==
X-CSE-MsgGUID: DB+rc1EuTiGWtIMB4oTeSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="205511883"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.150])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 04:35:15 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 122D611F726;
	Fri, 16 Jan 2026 14:35:15 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vgj2o-00000000vUG-3rJ4;
	Fri, 16 Jan 2026 14:35:14 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	laurent.pinchart@ideasonboard.com,
	jai.luthra@ideasonboard.com
Subject: [PATCH v2 2/8] media: ccs: Rely on sub-device state locking
Date: Fri, 16 Jan 2026 14:35:08 +0200
Message-ID: <20260116123514.220949-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260116123514.220949-1-sakari.ailus@linux.intel.com>
References: <20260116123514.220949-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rely on sub-device state locking to serialise access to driver's data
structures. The driver-provided mutex is used as the state lock for all
driver sub-devices.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 146 +++++++++++++++----------------
 drivers/media/i2c/ccs/ccs.h      |   1 -
 2 files changed, 70 insertions(+), 77 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 5d931e1fb46d..a08f06149097 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -541,12 +541,13 @@ static int ccs_pll_update(struct ccs_sensor *sensor)
  *
  */
 
-static void __ccs_update_exposure_limits(struct ccs_sensor *sensor)
+static void __ccs_update_exposure_limits(struct ccs_sensor *sensor,
+					 const struct v4l2_rect *pa_src)
 {
 	struct v4l2_ctrl *ctrl = sensor->exposure;
 	int max;
 
-	max = sensor->pa_src.height + sensor->vblank->val -
+	max = pa_src->height + sensor->vblank->val -
 		CCS_LIM(sensor, COARSE_INTEGRATION_TIME_MAX_MARGIN);
 
 	__v4l2_ctrl_modify_range(ctrl, ctrl->minimum, max, ctrl->step, max);
@@ -649,12 +650,20 @@ static int ccs_set_ctrl(struct v4l2_ctrl *ctrl)
 		container_of(ctrl->handler, struct ccs_subdev, ctrl_handler)
 			->sensor;
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
+	struct v4l2_subdev_state *state;
+	const struct v4l2_rect *pa_src = NULL;
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
@@ -673,7 +682,7 @@ static int ccs_set_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_VBLANK:
 		exposure = sensor->exposure->val;
 
-		__ccs_update_exposure_limits(sensor);
+		__ccs_update_exposure_limits(sensor, pa_src);
 
 		if (exposure > sensor->exposure->maximum) {
 			sensor->exposure->val =	sensor->exposure->maximum;
@@ -765,12 +774,12 @@ static int ccs_set_ctrl(struct v4l2_ctrl *ctrl)
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
@@ -1223,7 +1232,8 @@ static int ccs_get_mbus_formats(struct ccs_sensor *sensor)
 	return 0;
 }
 
-static void ccs_update_blanking(struct ccs_sensor *sensor)
+static void ccs_update_blanking(struct ccs_sensor *sensor,
+				const struct v4l2_rect *pa_src)
 {
 	struct v4l2_ctrl *vblank = sensor->vblank;
 	struct v4l2_ctrl *hblank = sensor->hblank;
@@ -1246,21 +1256,26 @@ static void ccs_update_blanking(struct ccs_sensor *sensor)
 
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
+	const struct v4l2_rect *pa_src =
+		v4l2_subdev_state_get_crop(state, CCS_PA_PAD_SRC,
+					   CCS_STREAM_PIXEL);
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
 	int rval;
 
@@ -1269,15 +1284,15 @@ static int ccs_pll_blanking_update(struct ccs_sensor *sensor)
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
@@ -1782,6 +1797,16 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
 			      u64 streams_mask)
 {
 	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
+	struct v4l2_subdev_state *pa_state =
+		v4l2_subdev_get_locked_active_state(&sensor->pixel_array->sd);
+	struct v4l2_subdev_state *src_state =
+		v4l2_subdev_get_locked_active_state(&sensor->src->sd);
+	const struct v4l2_rect *pa_src =
+		v4l2_subdev_state_get_crop(pa_state, CCS_PA_PAD_SRC,
+					   CCS_STREAM_PIXEL);
+	const struct v4l2_rect *src_src =
+		v4l2_subdev_state_get_crop(src_state, CCS_PAD_SRC,
+					   CCS_STREAM_PIXEL);
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
 	unsigned int binning_mode;
 	int rval;
@@ -1829,22 +1854,20 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
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
 
@@ -1856,23 +1879,30 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
 	/* Digital crop */
 	if (CCS_LIM(sensor, DIGITAL_CROP_CAPABILITY)
 	    == CCS_DIGITAL_CROP_CAPABILITY_INPUT_CROP) {
+		struct v4l2_subdev_state *scaler_state =
+			v4l2_subdev_get_locked_active_state(&sensor->scaler->sd);
+		const struct v4l2_rect *scaler_sink =
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
@@ -1890,10 +1920,10 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
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
 
@@ -2022,20 +2052,17 @@ static int ccs_enum_mbus_code(struct v4l2_subdev *subdev,
 	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
 	unsigned int i;
 	int idx = -1;
-	int rval = -EINVAL;
-
-	mutex_lock(&sensor->mutex);
 
 	dev_err(&client->dev, "subdev %s, pad %u, index %u\n",
 		subdev->name, code->pad, code->index);
 
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
@@ -2046,18 +2073,14 @@ static int ccs_enum_mbus_code(struct v4l2_subdev *subdev,
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
 
@@ -2067,28 +2090,14 @@ static u32 __ccs_get_mbus_code(struct v4l2_subdev *subdev, unsigned int pad)
 		return sensor->internal_csi_format->code;
 }
 
-static int __ccs_get_format(struct v4l2_subdev *subdev,
-			    struct v4l2_subdev_state *sd_state,
-			    struct v4l2_subdev_format *fmt)
-{
-	fmt->format = *v4l2_subdev_state_get_format(sd_state, fmt->pad);
-	fmt->format.code = __ccs_get_mbus_code(subdev, fmt->pad);
-
-	return 0;
-}
-
 static int ccs_get_format(struct v4l2_subdev *subdev,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
-	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
-	int rval;
-
-	mutex_lock(&sensor->mutex);
-	rval = __ccs_get_format(subdev, sd_state, fmt);
-	mutex_unlock(&sensor->mutex);
+	fmt->format = *v4l2_subdev_state_get_format(sd_state, fmt->pad);
+	fmt->format.code = ccs_get_mbus_code(subdev, fmt->pad);
 
-	return rval;
+	return 0;
 }
 
 /* Changes require propagation only on sink pad. */
@@ -2114,7 +2123,6 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
 				sensor->scale_m = CCS_LIM(sensor, SCALER_N_MIN);
 				sensor->scaling_mode =
 					CCS_SCALING_MODE_NO_SCALING;
-				sensor->scaler_sink = *comp;
 			} else if (ssd == sensor->binner) {
 				sensor->binning_horizontal = 1;
 				sensor->binning_vertical = 1;
@@ -2129,8 +2137,6 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
 						   CCS_STREAM_PIXEL);
 		fmt->width = comp->width;
 		fmt->height = comp->height;
-		if (which == V4L2_SUBDEV_FORMAT_ACTIVE && ssd == sensor->src)
-			sensor->src_src = *crop;
 		break;
 	default:
 		WARN_ON_ONCE(1);
@@ -2149,7 +2155,7 @@ static int ccs_set_format_source(struct v4l2_subdev *subdev,
 	unsigned int i;
 	int rval;
 
-	rval = __ccs_get_format(subdev, sd_state, fmt);
+	rval = ccs_get_format(subdev, sd_state, fmt);
 	if (rval)
 		return rval;
 
@@ -2198,20 +2204,17 @@ static int ccs_set_format(struct v4l2_subdev *subdev,
 	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
 	struct v4l2_rect *crop;
 
-	mutex_lock(&sensor->mutex);
-
 	if (fmt->pad == ssd->source_pad) {
 		int rval;
 
 		rval = ccs_set_format_source(subdev, sd_state, fmt);
 
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
@@ -2234,8 +2237,6 @@ static int ccs_set_format(struct v4l2_subdev *subdev,
 	crop->height = fmt->format.height;
 	ccs_propagate(subdev, sd_state, fmt->which, V4L2_SEL_TGT_CROP);
 
-	mutex_unlock(&sensor->mutex);
-
 	return 0;
 }
 
@@ -2537,9 +2538,6 @@ static int ccs_set_crop(struct v4l2_subdev *subdev,
 
 	if (ssd != sensor->pixel_array && sel->pad == CCS_PAD_SINK)
 		ccs_propagate(subdev, sd_state, sel->which, V4L2_SEL_TGT_CROP);
-	else if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE &&
-		 ssd == sensor->pixel_array)
-		sensor->pa_src = sel->r;
 
 	return 0;
 }
@@ -2609,8 +2607,6 @@ static int ccs_set_selection(struct v4l2_subdev *subdev,
 	if (ret)
 		return ret;
 
-	mutex_lock(&sensor->mutex);
-
 	sel->r.left = max(0, sel->r.left & ~1);
 	sel->r.top = max(0, sel->r.top & ~1);
 	sel->r.width = CCS_ALIGN_DIM(sel->r.width, sel->flags);
@@ -2632,7 +2628,6 @@ static int ccs_set_selection(struct v4l2_subdev *subdev,
 		ret = -EINVAL;
 	}
 
-	mutex_unlock(&sensor->mutex);
 	return ret;
 }
 
@@ -3002,6 +2997,7 @@ static int ccs_init_subdev(struct ccs_sensor *sensor,
 
 	ssd->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	ssd->sd.entity.function = function;
+	ssd->sd.state_lock = &sensor->mutex;
 	ssd->sensor = sensor;
 
 	ssd->npads = num_pads;
@@ -3059,10 +3055,8 @@ static int ccs_init_state(struct v4l2_subdev *sd,
 	fmt->field = V4L2_FIELD_NONE;
 
 	if (ssd == sensor->pixel_array) {
-		if (is_active)
-			sensor->pa_src = *crop;
-
 		mutex_unlock(&sensor->mutex);
+
 		return 0;
 	}
 
diff --git a/drivers/media/i2c/ccs/ccs.h b/drivers/media/i2c/ccs/ccs.h
index 0bdb8cd3accb..e885063c89f0 100644
--- a/drivers/media/i2c/ccs/ccs.h
+++ b/drivers/media/i2c/ccs/ccs.h
@@ -225,7 +225,6 @@ struct ccs_sensor {
 	u32 mbus_frame_fmts;
 	const struct ccs_csi_data_format *csi_format;
 	const struct ccs_csi_data_format *internal_csi_format;
-	struct v4l2_rect pa_src, scaler_sink, src_src;
 	u32 default_mbus_frame_fmts;
 	int default_pixel_order;
 	struct ccs_data_container sdata, mdata;
-- 
2.47.3


