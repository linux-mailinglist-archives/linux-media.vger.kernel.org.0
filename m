Return-Path: <linux-media+bounces-6963-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8257B87A386
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 08:27:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D62B1B218C9
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 07:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EA9A1755A;
	Wed, 13 Mar 2024 07:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SUvodsWj"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C3121A0A
	for <linux-media@vger.kernel.org>; Wed, 13 Mar 2024 07:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710314765; cv=none; b=CKR+Iher00anYqvvJ1vxBy6zoYIJgcCqr2ey+hUgxYhrkglUscL6gvcbTKZMDR9Z1+/wDBUUafEqjhrlm21Bns9HcGLXfLMmmtF4xbzQkIplXnSOeuQNc1GaZYCiy0zaREfZOj9zPxdMbbUiWOdcIXbmSfNpmc5KZYtno6SWWTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710314765; c=relaxed/simple;
	bh=YPLXrJapKdse6qVk/BYWFmGzR+8rRrWSB4CqP1TFauA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=A/AYToJmQr3vkKfunjNHCWxhbkCU6Q7/7vniiOvnDJReRf9354egTth/lszytc+KKgbrQP+RZv3GlnBzLFb634GX409VVvY2M68HHHGnq/9f29p1XuegVerETB6d/YoAi4gfejyBXptV29X2TnRWcWOYgfs/ibPDq3/redvWM68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SUvodsWj; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710314764; x=1741850764;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YPLXrJapKdse6qVk/BYWFmGzR+8rRrWSB4CqP1TFauA=;
  b=SUvodsWjsnw5YW2kkKSTJXwW47gel4idR4sZIJkVIeVJVo7TFeQGDXC2
   aiLxBRzzjmVlkVUJMUItddvIyvkrclOtUKbE+ovzXVf33N+NonwK9sWvA
   bCOC7wAmyVYXzQWREFBeXBOZ6sxR4Sz0k9sCIAzrwpbX13Q+GGiMkfKnt
   lMFYM/cyCUr5hvqLhhsAvVS51PsCXi145Gaz0HHII21DwX53GlsCdvs67
   iPh0+v5NzJm1MRl570nFua0GNk5/M738u89+PZqHyF1NL4Cl0dJrBDXly
   HswG9i7JCm/urDxYrnKiBbwj2Z+bCXtUzbukGhvOdCca8FKISSp6MFZXs
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="4909276"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="4909276"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 00:26:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="16542316"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 00:25:59 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 888A21201C3;
	Wed, 13 Mar 2024 09:25:55 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com,
	hongju.wang@intel.com,
	hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v8 26/38] media: ccs: Rely on sub-device state locking
Date: Wed, 13 Mar 2024 09:25:04 +0200
Message-Id: <20240313072516.241106-27-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
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
 drivers/media/i2c/ccs/ccs-core.c | 192 +++++++++++++------------------
 drivers/media/i2c/ccs/ccs.h      |   1 -
 2 files changed, 81 insertions(+), 112 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 6c7eb4f04070..a8c48abd2e30 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -541,12 +541,13 @@ static int ccs_pll_update(struct ccs_sensor *sensor)
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
@@ -649,12 +650,20 @@ static int ccs_set_ctrl(struct v4l2_ctrl *ctrl)
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
@@ -1225,7 +1234,8 @@ static int ccs_get_mbus_formats(struct ccs_sensor *sensor)
 	return 0;
 }
 
-static void ccs_update_blanking(struct ccs_sensor *sensor)
+static void ccs_update_blanking(struct ccs_sensor *sensor,
+				struct v4l2_rect *pa_src)
 {
 	struct v4l2_ctrl *vblank = sensor->vblank;
 	struct v4l2_ctrl *hblank = sensor->hblank;
@@ -1248,21 +1258,26 @@ static void ccs_update_blanking(struct ccs_sensor *sensor)
 
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
 
@@ -1271,15 +1286,15 @@ static int ccs_pll_blanking_update(struct ccs_sensor *sensor)
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
@@ -1787,6 +1802,16 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
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
@@ -1834,22 +1859,20 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
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
 
@@ -1861,23 +1884,30 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
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
@@ -1895,10 +1925,10 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
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
 
@@ -2087,9 +2117,6 @@ static int ccs_enum_mbus_code(struct v4l2_subdev *subdev,
 	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
 	unsigned int i;
 	int idx = -1;
-	int rval = -EINVAL;
-
-	mutex_lock(&sensor->mutex);
 
 	dev_err(&client->dev, "subdev %s, pad %u, index %u\n",
 		subdev->name, code->pad, code->index);
@@ -2097,12 +2124,11 @@ static int ccs_enum_mbus_code(struct v4l2_subdev *subdev,
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
@@ -2149,21 +2175,21 @@ static int ccs_enum_mbus_code(struct v4l2_subdev *subdev,
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
@@ -2174,18 +2200,14 @@ static int ccs_enum_mbus_code(struct v4l2_subdev *subdev,
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
 
@@ -2195,33 +2217,19 @@ static u32 __ccs_get_mbus_code(struct v4l2_subdev *subdev, unsigned int pad)
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
@@ -2245,7 +2253,6 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
 				sensor->scale_m = CCS_LIM(sensor, SCALER_N_MIN);
 				sensor->scaling_mode =
 					CCS_SCALING_MODE_NO_SCALING;
-				sensor->scaler_sink = *comp;
 			} else if (ssd == sensor->binner) {
 				sensor->binning_horizontal = 1;
 				sensor->binning_vertical = 1;
@@ -2260,8 +2267,6 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
 						   CCS_STREAM_PIXEL);
 		fmt->width = comp->width;
 		fmt->height = comp->height;
-		if (which == V4L2_SUBDEV_FORMAT_ACTIVE && ssd == sensor->src)
-			sensor->src_src = *crop;
 		break;
 	default:
 		WARN_ON_ONCE(1);
@@ -2280,7 +2285,7 @@ static int ccs_set_format_source(struct v4l2_subdev *subdev,
 	unsigned int i;
 	int rval;
 
-	rval = __ccs_get_format(subdev, sd_state, fmt);
+	rval = ccs_get_format(subdev, sd_state, fmt);
 	if (rval)
 		return rval;
 
@@ -2407,13 +2412,9 @@ static int ccs_set_format(struct v4l2_subdev *subdev,
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
 
@@ -2424,13 +2425,12 @@ static int ccs_set_format(struct v4l2_subdev *subdev,
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
@@ -2453,8 +2453,6 @@ static int ccs_set_format(struct v4l2_subdev *subdev,
 	crop->height = fmt->format.height;
 	ccs_propagate(subdev, sd_state, fmt->which, V4L2_SEL_TGT_CROP);
 
-	mutex_unlock(&sensor->mutex);
-
 	return 0;
 }
 
@@ -2768,9 +2766,6 @@ static int ccs_set_crop(struct v4l2_subdev *subdev,
 
 	if (ssd != sensor->pixel_array && sel->pad == CCS_PAD_SINK)
 		ccs_propagate(subdev, sd_state, sel->which, V4L2_SEL_TGT_CROP);
-	else if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE &&
-		 ssd == sensor->pixel_array)
-		sensor->pa_src = sel->r;
 
 	return 0;
 }
@@ -2842,8 +2837,6 @@ static int ccs_set_selection(struct v4l2_subdev *subdev,
 	if (ret)
 		return ret;
 
-	mutex_lock(&sensor->mutex);
-
 	sel->r.left = max(0, sel->r.left & ~1);
 	sel->r.top = max(0, sel->r.top & ~1);
 	sel->r.width = CCS_ALIGN_DIM(sel->r.width, sel->flags);
@@ -2865,7 +2858,6 @@ static int ccs_set_selection(struct v4l2_subdev *subdev,
 		ret = -EINVAL;
 	}
 
-	mutex_unlock(&sensor->mutex);
 	return ret;
 }
 
@@ -3244,6 +3236,7 @@ static int ccs_init_subdev(struct ccs_sensor *sensor,
 
 	ssd->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	ssd->sd.entity.function = function;
+	ssd->sd.state_lock = &sensor->mutex;
 	ssd->sensor = sensor;
 
 	ssd->npads = num_pads;
@@ -3283,8 +3276,8 @@ static int ccs_init_subdev(struct ccs_sensor *sensor,
 	return 0;
 }
 
-static int __ccs_init_state(struct v4l2_subdev *sd,
-			    struct v4l2_subdev_state *sd_state)
+static int ccs_init_state(struct v4l2_subdev *sd,
+			  struct v4l2_subdev_state *sd_state)
 {
 	struct ccs_subdev *ssd = to_ccs_subdev(sd);
 	struct ccs_sensor *sensor = ssd->sensor;
@@ -3303,12 +3296,8 @@ static int __ccs_init_state(struct v4l2_subdev *sd,
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
@@ -3321,20 +3310,6 @@ static int __ccs_init_state(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int ccs_init_state(struct v4l2_subdev *sd,
-			  struct v4l2_subdev_state *sd_state)
-{
-	struct ccs_subdev *ssd = to_ccs_subdev(sd);
-	struct ccs_sensor *sensor = ssd->sensor;
-	int rval;
-
-	mutex_lock(&sensor->mutex);
-	rval = __ccs_init_state(sd, sd_state);
-	mutex_unlock(&sensor->mutex);
-
-	return rval;
-}
-
 static int ccs_src_init_state(struct v4l2_subdev *sd,
 			      struct v4l2_subdev_state *sd_state)
 {
@@ -3359,25 +3334,20 @@ static int ccs_src_init_state(struct v4l2_subdev *sd,
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
 
-	rval = __ccs_init_state(sd, sd_state);
+	rval = ccs_init_state(sd, sd_state);
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
index 207d33de3eee..a2a461cda338 100644
--- a/drivers/media/i2c/ccs/ccs.h
+++ b/drivers/media/i2c/ccs/ccs.h
@@ -230,7 +230,6 @@ struct ccs_sensor {
 	u32 mbus_frame_fmts;
 	const struct ccs_csi_data_format *csi_format;
 	const struct ccs_csi_data_format *internal_csi_format;
-	struct v4l2_rect pa_src, scaler_sink, src_src;
 	u32 default_mbus_frame_fmts;
 	int default_pixel_order;
 	struct ccs_data_container sdata, mdata;
-- 
2.39.2


