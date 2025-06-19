Return-Path: <linux-media+bounces-35295-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF77AE04E3
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 14:04:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 765FF3AC7F3
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 12:01:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3658256C81;
	Thu, 19 Jun 2025 11:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bnvj+4Wy"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDEE244676
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 11:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334353; cv=none; b=pxSOMJGfhA8m2WzUKdz01nEe51frkTX46P0fW0849TRZg9eqYaWhiHhiWuhSYUFeLhMaOsOskG5yvOzuATGcLxIP118Ck2nQY3J43TDrOCiUq0jCLeq39icRbF+eQBjvnV2qdL/2DsBnahmO+RaXwuikDu5DgZND2FNRvwM1770=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334353; c=relaxed/simple;
	bh=paH5U///x248HZBYMIcM2alebb6kqsNrTH8A00jVHdo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=X+n1j2oOYou0LanDcnrUbubhq6mrikRvrLuidVqxoVuN0RJiwXwiPOPDjJkgwbFewerT1RgaVsqQs5+8CVtvzAAUBk54w1phkYBWPtPpxWwhW8uqhfZMpsQ97NOX/Zh0pyBuDOXC/8dMR/P0bUQsmf1Ex4FZxEdWV2GRmJ0fy/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bnvj+4Wy; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750334351; x=1781870351;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=paH5U///x248HZBYMIcM2alebb6kqsNrTH8A00jVHdo=;
  b=Bnvj+4Wym73PHn4U0IVMzqMDe4BcDGrwuUSLpzGmC//mFGXKkLn2Duun
   6Ofg/knik3caXCp5vP5RU1lz3XaSLdawW1sXvHeTZWxNW0CjIqms17diN
   yd2K1D8irVsh5XpmyuvQ3o1IzJ/EKWXW8j+5a0OFAnQkfpwjwc0YBs8qO
   z7JFaRrDaQG1rQjwsgcHIdbuYAvslVn9VS+SltitAUrKRWI/PyACrwgyA
   zCYpvTwJHz43VC8HZRw0Xricct8HQyXkEM1uefgAAY0OH9/vooS+Ymw+J
   pVfzOLGdxJcsRP0jl4L/8SFrSwwhrKankQpYEw7XshG0YQQnGfIKpeN/k
   w==;
X-CSE-ConnectionGUID: o4tZ0ynjTpOVMdpp9hV8zw==
X-CSE-MsgGUID: VCDhggFrS0+Dx6mHo1P5cQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="56386459"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="56386459"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:05 -0700
X-CSE-ConnectionGUID: xJhNmv0dSxC2116lqrBaUg==
X-CSE-MsgGUID: YeWPPY30TK2HndvzT/PxRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="154908308"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:58:57 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 10C5612214F;
	Thu, 19 Jun 2025 14:58:37 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSDuf-008AJu-07;
	Thu, 19 Jun 2025 14:58:37 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v10 29/64] media: ccs: Rely on sub-device state locking
Date: Thu, 19 Jun 2025 14:58:01 +0300
Message-Id: <20250619115836.1946016-30-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
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
 drivers/media/i2c/ccs/ccs-core.c | 187 +++++++++++++------------------
 drivers/media/i2c/ccs/ccs.h      |   1 -
 2 files changed, 79 insertions(+), 109 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 0f0588e0c2da..2d2ae568739b 100644
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
@@ -1242,7 +1251,8 @@ static int ccs_get_mbus_formats(struct ccs_sensor *sensor)
 	return 0;
 }
 
-static void ccs_update_blanking(struct ccs_sensor *sensor)
+static void ccs_update_blanking(struct ccs_sensor *sensor,
+				struct v4l2_rect *pa_src)
 {
 	struct v4l2_ctrl *vblank = sensor->vblank;
 	struct v4l2_ctrl *hblank = sensor->hblank;
@@ -1265,21 +1275,26 @@ static void ccs_update_blanking(struct ccs_sensor *sensor)
 
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
 
@@ -1288,15 +1303,15 @@ static int ccs_pll_blanking_update(struct ccs_sensor *sensor)
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
@@ -1801,6 +1816,16 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
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
@@ -1848,22 +1873,20 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
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
 
@@ -1875,23 +1898,30 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
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
@@ -1909,10 +1939,10 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
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
 
@@ -2101,9 +2131,6 @@ static int ccs_enum_mbus_code(struct v4l2_subdev *subdev,
 	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
 	unsigned int i;
 	int idx = -1;
-	int rval = -EINVAL;
-
-	mutex_lock(&sensor->mutex);
 
 	dev_err(&client->dev, "subdev %s, pad %u, index %u\n",
 		subdev->name, code->pad, code->index);
@@ -2155,21 +2182,21 @@ static int ccs_enum_mbus_code(struct v4l2_subdev *subdev,
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
@@ -2180,18 +2207,14 @@ static int ccs_enum_mbus_code(struct v4l2_subdev *subdev,
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
 
@@ -2201,33 +2224,19 @@ static u32 __ccs_get_mbus_code(struct v4l2_subdev *subdev, unsigned int pad)
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
@@ -2251,7 +2260,6 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
 				sensor->scale_m = CCS_LIM(sensor, SCALER_N_MIN);
 				sensor->scaling_mode =
 					CCS_SCALING_MODE_NO_SCALING;
-				sensor->scaler_sink = *comp;
 			} else if (ssd == sensor->binner) {
 				sensor->binning_horizontal = 1;
 				sensor->binning_vertical = 1;
@@ -2266,8 +2274,6 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
 						   CCS_STREAM_PIXEL);
 		fmt->width = comp->width;
 		fmt->height = comp->height;
-		if (which == V4L2_SUBDEV_FORMAT_ACTIVE && ssd == sensor->src)
-			sensor->src_src = *crop;
 		break;
 	default:
 		WARN_ON_ONCE(1);
@@ -2286,7 +2292,7 @@ static int ccs_set_format_source(struct v4l2_subdev *subdev,
 	unsigned int i;
 	int rval;
 
-	rval = __ccs_get_format(subdev, sd_state, fmt);
+	rval = ccs_get_format(subdev, sd_state, fmt);
 	if (rval)
 		return rval;
 
@@ -2421,13 +2427,9 @@ static int ccs_set_format(struct v4l2_subdev *subdev,
 	if (ssd == sensor->src && fmt->pad == CCS_PAD_META)
 		return ccs_get_format(subdev, sd_state, fmt);
 
-	mutex_lock(&sensor->mutex);
-
 	if (ssd == sensor->src && fmt->stream == CCS_STREAM_META) {
 		ccs_set_format_meta(subdev, sd_state, &fmt->format);
 
-		mutex_unlock(&sensor->mutex);
-
 		return 0;
 	}
 
@@ -2438,13 +2440,12 @@ static int ccs_set_format(struct v4l2_subdev *subdev,
 		if (ccs_embedded_data_lines(sensor) && ssd == sensor->src)
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
@@ -2467,8 +2468,6 @@ static int ccs_set_format(struct v4l2_subdev *subdev,
 	crop->height = fmt->format.height;
 	ccs_propagate(subdev, sd_state, fmt->which, V4L2_SEL_TGT_CROP);
 
-	mutex_unlock(&sensor->mutex);
-
 	return 0;
 }
 
@@ -2776,9 +2775,6 @@ static int ccs_set_crop(struct v4l2_subdev *subdev,
 
 	if (ssd != sensor->pixel_array && sel->pad == CCS_PAD_SINK)
 		ccs_propagate(subdev, sd_state, sel->which, V4L2_SEL_TGT_CROP);
-	else if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE &&
-		 ssd == sensor->pixel_array)
-		sensor->pa_src = sel->r;
 
 	return 0;
 }
@@ -2850,8 +2846,6 @@ static int ccs_set_selection(struct v4l2_subdev *subdev,
 	if (ret)
 		return ret;
 
-	mutex_lock(&sensor->mutex);
-
 	sel->r.left = max(0, sel->r.left & ~1);
 	sel->r.top = max(0, sel->r.top & ~1);
 	sel->r.width = CCS_ALIGN_DIM(sel->r.width, sel->flags);
@@ -2873,7 +2867,6 @@ static int ccs_set_selection(struct v4l2_subdev *subdev,
 		ret = -EINVAL;
 	}
 
-	mutex_unlock(&sensor->mutex);
 	return ret;
 }
 
@@ -3256,6 +3249,7 @@ static int ccs_init_subdev(struct ccs_sensor *sensor,
 
 	ssd->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	ssd->sd.entity.function = function;
+	ssd->sd.state_lock = &sensor->mutex;
 	ssd->sensor = sensor;
 
 	ssd->npads = num_pads;
@@ -3295,8 +3289,8 @@ static int ccs_init_subdev(struct ccs_sensor *sensor,
 	return 0;
 }
 
-static int __ccs_init_state(struct v4l2_subdev *sd,
-			    struct v4l2_subdev_state *sd_state)
+static int ccs_init_state(struct v4l2_subdev *sd,
+			  struct v4l2_subdev_state *sd_state)
 {
 	struct ccs_subdev *ssd = to_ccs_subdev(sd);
 	struct ccs_sensor *sensor = ssd->sensor;
@@ -3315,12 +3309,8 @@ static int __ccs_init_state(struct v4l2_subdev *sd,
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
@@ -3333,20 +3323,6 @@ static int __ccs_init_state(struct v4l2_subdev *sd,
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
@@ -3371,25 +3347,20 @@ static int ccs_src_init_state(struct v4l2_subdev *sd,
 	struct ccs_sensor *sensor = ssd->sensor;
 	int rval;
 
-	mutex_lock(&sensor->mutex);
-
 	if (ccs_embedded_data_lines(sensor))
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
 
 	if (ccs_embedded_data_lines(sensor))
 		ccs_set_format_meta(sd, sd_state, NULL);
 
-out:
-	mutex_unlock(&sensor->mutex);
-
 	return rval;
 }
 
diff --git a/drivers/media/i2c/ccs/ccs.h b/drivers/media/i2c/ccs/ccs.h
index 1bc524de3aa2..338209950fcb 100644
--- a/drivers/media/i2c/ccs/ccs.h
+++ b/drivers/media/i2c/ccs/ccs.h
@@ -232,7 +232,6 @@ struct ccs_sensor {
 	u32 mbus_frame_fmts;
 	const struct ccs_csi_data_format *csi_format;
 	const struct ccs_csi_data_format *internal_csi_format;
-	struct v4l2_rect pa_src, scaler_sink, src_src;
 	u32 default_mbus_frame_fmts;
 	int default_pixel_order;
 	struct ccs_data_container sdata, mdata;
-- 
2.39.5


