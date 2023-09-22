Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BC917AB166
	for <lists+linux-media@lfdr.de>; Fri, 22 Sep 2023 13:57:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233909AbjIVL5y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Sep 2023 07:57:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233882AbjIVL5w (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Sep 2023 07:57:52 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AA6AFB
        for <linux-media@vger.kernel.org>; Fri, 22 Sep 2023 04:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695383865; x=1726919865;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lx+/1dNTk60Cs3/S7w41jgsY3ojht1pnx7+MXVCVL04=;
  b=T9uyTxF0UrVuy1qL/dpoCVxWqjKduL1Ov5p740bmuMdTDEPUctkIA47w
   efatgft2mdGA6KVtY+GnL77qlJZTlSVUrE/u9tCbakyj/Ed6Yy7wgVkLC
   r7Oeuh/3jFSAQQAjlhBKpnZnkCyJUDKOhZJWp49lotTvlpvhCeIzEzvqq
   FQugzAGRfCpW+iOL+Oe6NdGtXPX9JIgQ2pdSufrr1X+tIvwxSAbtODGW7
   pGMUDPzFjw6fJ8Uvjn7yD+17aI7uqYIGr/3ovg1pgmPglp5AyC/suvmeG
   Oc9hHV2S8DL8kP2juBeaYbOLT5sG/VW0MaShYLElm0vlr6gj34Vkj9zyw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="383558594"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="383558594"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 04:57:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="837714668"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="837714668"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 04:57:42 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id DAF9C11FC30;
        Fri, 22 Sep 2023 14:57:38 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Martin Kepplinger <martink@posteo.de>
Subject: [PATCH v4 06/12] media: ccs: Use sub-device active state
Date:   Fri, 22 Sep 2023 14:57:24 +0300
Message-Id: <20230922115730.251779-7-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230922115730.251779-1-sakari.ailus@linux.intel.com>
References: <20230922115730.251779-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,PDS_OTHER_BAD_TLD,
        RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Make use of sub-device active state. In most cases the effect on need for
acquiring the mutex is non-existent as access to the driver's core data
structure still needs to be serialised.

This still removes a lot of code as the code paths for active and try
state are the same in many cases.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 278 ++++++++++++-------------------
 drivers/media/i2c/ccs/ccs.h      |   4 +-
 2 files changed, 103 insertions(+), 179 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index a4f593866ad6..7c53bbda5b8d 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -508,9 +508,8 @@ static void __ccs_update_exposure_limits(struct ccs_sensor *sensor)
 	struct v4l2_ctrl *ctrl = sensor->exposure;
 	int max;
 
-	max = sensor->pixel_array->crop[CCS_PA_PAD_SRC].height
-		+ sensor->vblank->val
-		- CCS_LIM(sensor, COARSE_INTEGRATION_TIME_MAX_MARGIN);
+	max = sensor->pa_src.height + sensor->vblank->val -
+		CCS_LIM(sensor, COARSE_INTEGRATION_TIME_MAX_MARGIN);
 
 	__v4l2_ctrl_modify_range(ctrl, ctrl->minimum, max, ctrl->step, max);
 }
@@ -728,15 +727,12 @@ static int ccs_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	case V4L2_CID_VBLANK:
 		rval = ccs_write(sensor, FRAME_LENGTH_LINES,
-				 sensor->pixel_array->crop[
-					 CCS_PA_PAD_SRC].height
-				 + ctrl->val);
+				 sensor->pa_src.height + ctrl->val);
 
 		break;
 	case V4L2_CID_HBLANK:
 		rval = ccs_write(sensor, LINE_LENGTH_PCK,
-				 sensor->pixel_array->crop[CCS_PA_PAD_SRC].width
-				 + ctrl->val);
+				 sensor->pa_src.width + ctrl->val);
 
 		break;
 	case V4L2_CID_TEST_PATTERN:
@@ -1214,15 +1210,13 @@ static void ccs_update_blanking(struct ccs_sensor *sensor)
 
 	min = max_t(int,
 		    CCS_LIM(sensor, MIN_FRAME_BLANKING_LINES),
-		    min_fll - sensor->pixel_array->crop[CCS_PA_PAD_SRC].height);
-	max = max_fll -	sensor->pixel_array->crop[CCS_PA_PAD_SRC].height;
+		    min_fll - sensor->pa_src.height);
+	max = max_fll -	sensor->pa_src.height;
 
 	__v4l2_ctrl_modify_range(vblank, min, max, vblank->step, min);
 
-	min = max_t(int,
-		    min_llp - sensor->pixel_array->crop[CCS_PA_PAD_SRC].width,
-		    min_lbp);
-	max = max_llp - sensor->pixel_array->crop[CCS_PA_PAD_SRC].width;
+	min = max_t(int, min_llp - sensor->pa_src.width, min_lbp);
+	max = max_llp - sensor->pa_src.width;
 
 	__v4l2_ctrl_modify_range(hblank, min, max, hblank->step, min);
 
@@ -1246,10 +1240,8 @@ static int ccs_pll_blanking_update(struct ccs_sensor *sensor)
 
 	dev_dbg(&client->dev, "real timeperframe\t100/%d\n",
 		sensor->pll.pixel_rate_pixel_array /
-		((sensor->pixel_array->crop[CCS_PA_PAD_SRC].width
-		  + sensor->hblank->val) *
-		 (sensor->pixel_array->crop[CCS_PA_PAD_SRC].height
-		  + sensor->vblank->val) / 100));
+		((sensor->pa_src.width + sensor->hblank->val) *
+		 (sensor->pa_src.height + sensor->vblank->val) / 100));
 
 	return 0;
 }
@@ -1756,28 +1748,22 @@ static int ccs_start_streaming(struct ccs_sensor *sensor)
 		goto out;
 
 	/* Analog crop start coordinates */
-	rval = ccs_write(sensor, X_ADDR_START,
-			 sensor->pixel_array->crop[CCS_PA_PAD_SRC].left);
+	rval = ccs_write(sensor, X_ADDR_START, sensor->pa_src.left);
 	if (rval < 0)
 		goto out;
 
-	rval = ccs_write(sensor, Y_ADDR_START,
-			 sensor->pixel_array->crop[CCS_PA_PAD_SRC].top);
+	rval = ccs_write(sensor, Y_ADDR_START, sensor->pa_src.top);
 	if (rval < 0)
 		goto out;
 
 	/* Analog crop end coordinates */
-	rval = ccs_write(
-		sensor, X_ADDR_END,
-		sensor->pixel_array->crop[CCS_PA_PAD_SRC].left
-		+ sensor->pixel_array->crop[CCS_PA_PAD_SRC].width - 1);
+	rval = ccs_write(sensor, X_ADDR_END,
+			 sensor->pa_src.left + sensor->pa_src.width - 1);
 	if (rval < 0)
 		goto out;
 
-	rval = ccs_write(
-		sensor, Y_ADDR_END,
-		sensor->pixel_array->crop[CCS_PA_PAD_SRC].top
-		+ sensor->pixel_array->crop[CCS_PA_PAD_SRC].height - 1);
+	rval = ccs_write(sensor, Y_ADDR_END,
+			 sensor->pa_src.top + sensor->pa_src.height - 1);
 	if (rval < 0)
 		goto out;
 
@@ -1789,27 +1775,23 @@ static int ccs_start_streaming(struct ccs_sensor *sensor)
 	/* Digital crop */
 	if (CCS_LIM(sensor, DIGITAL_CROP_CAPABILITY)
 	    == CCS_DIGITAL_CROP_CAPABILITY_INPUT_CROP) {
-		rval = ccs_write(
-			sensor, DIGITAL_CROP_X_OFFSET,
-			sensor->scaler->crop[CCS_PAD_SINK].left);
+		rval = ccs_write(sensor, DIGITAL_CROP_X_OFFSET,
+				 sensor->scaler_sink.left);
 		if (rval < 0)
 			goto out;
 
-		rval = ccs_write(
-			sensor, DIGITAL_CROP_Y_OFFSET,
-			sensor->scaler->crop[CCS_PAD_SINK].top);
+		rval = ccs_write(sensor, DIGITAL_CROP_Y_OFFSET,
+				 sensor->scaler_sink.top);
 		if (rval < 0)
 			goto out;
 
-		rval = ccs_write(
-			sensor, DIGITAL_CROP_IMAGE_WIDTH,
-			sensor->scaler->crop[CCS_PAD_SINK].width);
+		rval = ccs_write(sensor, DIGITAL_CROP_IMAGE_WIDTH,
+				 sensor->scaler_sink.width);
 		if (rval < 0)
 			goto out;
 
-		rval = ccs_write(
-			sensor, DIGITAL_CROP_IMAGE_HEIGHT,
-			sensor->scaler->crop[CCS_PAD_SINK].height);
+		rval = ccs_write(sensor, DIGITAL_CROP_IMAGE_HEIGHT,
+				 sensor->scaler_sink.height);
 		if (rval < 0)
 			goto out;
 	}
@@ -1827,12 +1809,10 @@ static int ccs_start_streaming(struct ccs_sensor *sensor)
 	}
 
 	/* Output size from sensor */
-	rval = ccs_write(sensor, X_OUTPUT_SIZE,
-			 sensor->src->crop[CCS_PAD_SRC].width);
+	rval = ccs_write(sensor, X_OUTPUT_SIZE, sensor->src_src.width);
 	if (rval < 0)
 		goto out;
-	rval = ccs_write(sensor, Y_OUTPUT_SIZE,
-			 sensor->src->crop[CCS_PAD_SRC].height);
+	rval = ccs_write(sensor, Y_OUTPUT_SIZE, sensor->src_src.height);
 	if (rval < 0)
 		goto out;
 
@@ -2053,24 +2033,8 @@ static int __ccs_get_format(struct v4l2_subdev *subdev,
 			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *fmt)
 {
-	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
-
-	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		fmt->format = *v4l2_subdev_get_try_format(subdev, sd_state,
-							  fmt->pad);
-	} else {
-		struct v4l2_rect *r;
-
-		if (fmt->pad == ssd->source_pad)
-			r = &ssd->crop[ssd->source_pad];
-		else
-			r = &ssd->sink_fmt;
-
-		fmt->format.code = __ccs_get_mbus_code(subdev, fmt->pad);
-		fmt->format.width = r->width;
-		fmt->format.height = r->height;
-		fmt->format.field = V4L2_FIELD_NONE;
-	}
+	fmt->format = *v4l2_subdev_get_pad_format(subdev, sd_state, fmt->pad);
+	fmt->format.code = __ccs_get_mbus_code(subdev, fmt->pad);
 
 	return 0;
 }
@@ -2092,28 +2056,18 @@ static int ccs_get_format(struct v4l2_subdev *subdev,
 static void ccs_get_crop_compose(struct v4l2_subdev *subdev,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_rect **crops,
-				 struct v4l2_rect **comps, int which)
+				 struct v4l2_rect **comps)
 {
 	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
 	unsigned int i;
 
-	if (which == V4L2_SUBDEV_FORMAT_ACTIVE) {
-		if (crops)
-			for (i = 0; i < subdev->entity.num_pads; i++)
-				crops[i] = &ssd->crop[i];
-		if (comps)
-			*comps = &ssd->compose;
-	} else {
-		if (crops) {
-			for (i = 0; i < subdev->entity.num_pads; i++)
-				crops[i] = v4l2_subdev_get_try_crop(subdev,
-								    sd_state,
-								    i);
-		}
-		if (comps)
-			*comps = v4l2_subdev_get_try_compose(subdev, sd_state,
-							     CCS_PAD_SINK);
-	}
+	if (crops)
+		for (i = 0; i < subdev->entity.num_pads; i++)
+			crops[i] =
+				v4l2_subdev_get_pad_crop(subdev, sd_state, i);
+	if (comps)
+		*comps = v4l2_subdev_get_pad_compose(subdev, sd_state,
+						     ssd->sink_pad);
 }
 
 /* Changes require propagation only on sink pad. */
@@ -2125,7 +2079,7 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
 	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
 	struct v4l2_rect *comp, *crops[CCS_PADS];
 
-	ccs_get_crop_compose(subdev, sd_state, crops, &comp, which);
+	ccs_get_crop_compose(subdev, sd_state, crops, &comp);
 
 	switch (target) {
 	case V4L2_SEL_TGT_CROP:
@@ -2136,6 +2090,7 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
 				sensor->scale_m = CCS_LIM(sensor, SCALER_N_MIN);
 				sensor->scaling_mode =
 					CCS_SCALING_MODE_NO_SCALING;
+				sensor->scaler_sink = *comp;
 			} else if (ssd == sensor->binner) {
 				sensor->binning_horizontal = 1;
 				sensor->binning_vertical = 1;
@@ -2144,6 +2099,8 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
 		fallthrough;
 	case V4L2_SEL_TGT_COMPOSE:
 		*crops[CCS_PAD_SRC] = *comp;
+		if (which == V4L2_SUBDEV_FORMAT_ACTIVE && ssd == sensor->src)
+			sensor->src_src = *crops[CCS_PAD_SRC];
 		break;
 	default:
 		WARN_ON_ONCE(1);
@@ -2252,14 +2209,12 @@ static int ccs_set_format(struct v4l2_subdev *subdev,
 		      CCS_LIM(sensor, MIN_Y_OUTPUT_SIZE),
 		      CCS_LIM(sensor, MAX_Y_OUTPUT_SIZE));
 
-	ccs_get_crop_compose(subdev, sd_state, crops, NULL, fmt->which);
+	ccs_get_crop_compose(subdev, sd_state, crops, NULL);
 
 	crops[ssd->sink_pad]->left = 0;
 	crops[ssd->sink_pad]->top = 0;
 	crops[ssd->sink_pad]->width = fmt->format.width;
 	crops[ssd->sink_pad]->height = fmt->format.height;
-	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE)
-		ssd->sink_fmt = *crops[ssd->sink_pad];
 	ccs_propagate(subdev, sd_state, fmt->which, V4L2_SEL_TGT_CROP);
 
 	mutex_unlock(&sensor->mutex);
@@ -2482,7 +2437,7 @@ static int ccs_set_compose(struct v4l2_subdev *subdev,
 	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
 	struct v4l2_rect *comp, *crops[CCS_PADS];
 
-	ccs_get_crop_compose(subdev, sd_state, crops, &comp, sel->which);
+	ccs_get_crop_compose(subdev, sd_state, crops, &comp);
 
 	sel->r.top = 0;
 	sel->r.left = 0;
@@ -2501,8 +2456,8 @@ static int ccs_set_compose(struct v4l2_subdev *subdev,
 	return 0;
 }
 
-static int __ccs_sel_supported(struct v4l2_subdev *subdev,
-			       struct v4l2_subdev_selection *sel)
+static int ccs_sel_supported(struct v4l2_subdev *subdev,
+			     struct v4l2_subdev_selection *sel)
 {
 	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
 	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
@@ -2545,33 +2500,18 @@ static int ccs_set_crop(struct v4l2_subdev *subdev,
 {
 	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
 	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
-	struct v4l2_rect *src_size, *crops[CCS_PADS];
-	struct v4l2_rect _r;
+	struct v4l2_rect src_size = { 0 }, *crops[CCS_PADS], *comp;
 
-	ccs_get_crop_compose(subdev, sd_state, crops, NULL, sel->which);
+	ccs_get_crop_compose(subdev, sd_state, crops, &comp);
 
-	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
-		if (sel->pad == ssd->sink_pad)
-			src_size = &ssd->sink_fmt;
-		else
-			src_size = &ssd->compose;
+	if (sel->pad == ssd->sink_pad) {
+		struct v4l2_mbus_framefmt *mfmt =
+			v4l2_subdev_get_pad_format(subdev, sd_state, sel->pad);
+
+		src_size.width = mfmt->width;
+		src_size.height = mfmt->height;
 	} else {
-		if (sel->pad == ssd->sink_pad) {
-			_r.left = 0;
-			_r.top = 0;
-			_r.width = v4l2_subdev_get_try_format(subdev,
-							      sd_state,
-							      sel->pad)
-				->width;
-			_r.height = v4l2_subdev_get_try_format(subdev,
-							       sd_state,
-							       sel->pad)
-				->height;
-			src_size = &_r;
-		} else {
-			src_size = v4l2_subdev_get_try_compose(
-				subdev, sd_state, ssd->sink_pad);
-		}
+		src_size = *comp;
 	}
 
 	if (ssd == sensor->src && sel->pad == CCS_PAD_SRC) {
@@ -2579,16 +2519,19 @@ static int ccs_set_crop(struct v4l2_subdev *subdev,
 		sel->r.top = 0;
 	}
 
-	sel->r.width = min(sel->r.width, src_size->width);
-	sel->r.height = min(sel->r.height, src_size->height);
+	sel->r.width = min(sel->r.width, src_size.width);
+	sel->r.height = min(sel->r.height, src_size.height);
 
-	sel->r.left = min_t(int, sel->r.left, src_size->width - sel->r.width);
-	sel->r.top = min_t(int, sel->r.top, src_size->height - sel->r.height);
+	sel->r.left = min_t(int, sel->r.left, src_size.width - sel->r.width);
+	sel->r.top = min_t(int, sel->r.top, src_size.height - sel->r.height);
 
 	*crops[sel->pad] = sel->r;
 
 	if (ssd != sensor->pixel_array && sel->pad == CCS_PAD_SINK)
 		ccs_propagate(subdev, sd_state, sel->which, V4L2_SEL_TGT_CROP);
+	else if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE &&
+		 ssd == sensor->pixel_array)
+		sensor->pa_src = sel->r;
 
 	return 0;
 }
@@ -2601,44 +2544,36 @@ static void ccs_get_native_size(struct ccs_subdev *ssd, struct v4l2_rect *r)
 	r->height = CCS_LIM(ssd->sensor, Y_ADDR_MAX) + 1;
 }
 
-static int __ccs_get_selection(struct v4l2_subdev *subdev,
-			       struct v4l2_subdev_state *sd_state,
-			       struct v4l2_subdev_selection *sel)
+static int ccs_get_selection(struct v4l2_subdev *subdev,
+			     struct v4l2_subdev_state *sd_state,
+			     struct v4l2_subdev_selection *sel)
 {
 	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
 	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
 	struct v4l2_rect *comp, *crops[CCS_PADS];
-	struct v4l2_rect sink_fmt;
 	int ret;
 
-	ret = __ccs_sel_supported(subdev, sel);
+	ret = ccs_sel_supported(subdev, sel);
 	if (ret)
 		return ret;
 
-	ccs_get_crop_compose(subdev, sd_state, crops, &comp, sel->which);
-
-	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
-		sink_fmt = ssd->sink_fmt;
-	} else {
-		struct v4l2_mbus_framefmt *fmt =
-			v4l2_subdev_get_try_format(subdev, sd_state,
-						   ssd->sink_pad);
-
-		sink_fmt.left = 0;
-		sink_fmt.top = 0;
-		sink_fmt.width = fmt->width;
-		sink_fmt.height = fmt->height;
-	}
+	ccs_get_crop_compose(subdev, sd_state, crops, &comp);
 
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP_BOUNDS:
 	case V4L2_SEL_TGT_NATIVE_SIZE:
-		if (ssd == sensor->pixel_array)
+		if (ssd == sensor->pixel_array) {
 			ccs_get_native_size(ssd, &sel->r);
-		else if (sel->pad == ssd->sink_pad)
-			sel->r = sink_fmt;
-		else
+		} else if (sel->pad == ssd->sink_pad) {
+			struct v4l2_mbus_framefmt *sink_fmt =
+				v4l2_subdev_get_pad_format(subdev, sd_state,
+							   ssd->sink_pad);
+			sel->r.top = sel->r.left = 0;
+			sel->r.width = sink_fmt->width;
+			sel->r.height = sink_fmt->height;
+		} else {
 			sel->r = *comp;
+		}
 		break;
 	case V4L2_SEL_TGT_CROP:
 	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
@@ -2652,20 +2587,6 @@ static int __ccs_get_selection(struct v4l2_subdev *subdev,
 	return 0;
 }
 
-static int ccs_get_selection(struct v4l2_subdev *subdev,
-			     struct v4l2_subdev_state *sd_state,
-			     struct v4l2_subdev_selection *sel)
-{
-	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
-	int rval;
-
-	mutex_lock(&sensor->mutex);
-	rval = __ccs_get_selection(subdev, sd_state, sel);
-	mutex_unlock(&sensor->mutex);
-
-	return rval;
-}
-
 static int ccs_set_selection(struct v4l2_subdev *subdev,
 			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_selection *sel)
@@ -2673,7 +2594,7 @@ static int ccs_set_selection(struct v4l2_subdev *subdev,
 	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
 	int ret;
 
-	ret = __ccs_sel_supported(subdev, sel);
+	ret = ccs_sel_supported(subdev, sel);
 	if (ret)
 		return ret;
 
@@ -2964,10 +2885,14 @@ static int ccs_register_subdev(struct ccs_sensor *sensor,
 		return rval;
 	}
 
+	rval = v4l2_subdev_init_finalize(&ssd->sd);
+	if (rval)
+		goto out_media_entity_cleanup;
+
 	rval = v4l2_device_register_subdev(sensor->src->sd.v4l2_dev, &ssd->sd);
 	if (rval) {
 		dev_err(&client->dev, "v4l2_device_register_subdev failed\n");
-		goto out_media_entity_cleanup;
+		goto out_v4l2_subdev_cleanup;
 	}
 
 	rval = media_create_pad_link(&ssd->sd.entity, source_pad,
@@ -2983,6 +2908,9 @@ static int ccs_register_subdev(struct ccs_sensor *sensor,
 out_v4l2_device_unregister_subdev:
 	v4l2_device_unregister_subdev(&ssd->sd);
 
+out_v4l2_subdev_cleanup:
+	v4l2_subdev_cleanup(&ssd->sd);
+
 out_media_entity_cleanup:
 	media_entity_cleanup(&ssd->sd.entity);
 
@@ -3059,16 +2987,9 @@ static void ccs_create_subdev(struct ccs_sensor *sensor,
 
 	v4l2_i2c_subdev_set_name(&ssd->sd, client, sensor->minfo.name, name);
 
-	ccs_get_native_size(ssd, &ssd->sink_fmt);
-
-	ssd->compose.width = ssd->sink_fmt.width;
-	ssd->compose.height = ssd->sink_fmt.height;
-	ssd->crop[ssd->source_pad] = ssd->compose;
 	ssd->pads[ssd->source_pad].flags = MEDIA_PAD_FL_SOURCE;
-	if (ssd != sensor->pixel_array) {
-		ssd->crop[ssd->sink_pad] = ssd->compose;
+	if (ssd != sensor->pixel_array)
 		ssd->pads[ssd->sink_pad].flags = MEDIA_PAD_FL_SINK;
-	}
 
 	ssd->sd.entity.ops = &ccs_entity_ops;
 
@@ -3090,24 +3011,24 @@ static int ccs_init_cfg(struct v4l2_subdev *sd,
 	mutex_lock(&sensor->mutex);
 
 	for (i = 0; i < ssd->npads; i++) {
-		struct v4l2_mbus_framefmt *try_fmt =
-			v4l2_subdev_get_try_format(sd, sd_state, i);
-		struct v4l2_rect *try_crop =
-			v4l2_subdev_get_try_crop(sd, sd_state, i);
-		struct v4l2_rect *try_comp;
+		struct v4l2_mbus_framefmt *fmt =
+			v4l2_subdev_get_pad_format(sd, sd_state, i);
+		struct v4l2_rect *crop =
+			v4l2_subdev_get_pad_crop(sd, sd_state, i);
+		struct v4l2_rect *comp;
 
-		ccs_get_native_size(ssd, try_crop);
+		ccs_get_native_size(ssd, crop);
 
-		try_fmt->width = try_crop->width;
-		try_fmt->height = try_crop->height;
-		try_fmt->code = sensor->internal_csi_format->code;
-		try_fmt->field = V4L2_FIELD_NONE;
+		fmt->width = crop->width;
+		fmt->height = crop->height;
+		fmt->code = sensor->internal_csi_format->code;
+		fmt->field = V4L2_FIELD_NONE;
 
 		if (ssd == sensor->pixel_array)
 			continue;
 
-		try_comp = v4l2_subdev_get_try_compose(sd, sd_state, i);
-		*try_comp = *try_crop;
+		comp = v4l2_subdev_get_pad_compose(sd, sd_state, i);
+		*comp = *crop;
 	}
 
 	mutex_unlock(&sensor->mutex);
@@ -3632,6 +3553,10 @@ static int ccs_probe(struct i2c_client *client)
 	if (rval < 0)
 		goto out_media_entity_cleanup;
 
+	rval = v4l2_subdev_init_finalize(&sensor->src->sd);
+	if (rval)
+		goto out_media_entity_cleanup;
+
 	rval = ccs_write_msr_regs(sensor);
 	if (rval)
 		goto out_media_entity_cleanup;
@@ -3691,6 +3616,7 @@ static void ccs_remove(struct i2c_client *client)
 
 	for (i = 0; i < sensor->ssds_used; i++) {
 		v4l2_device_unregister_subdev(&sensor->ssds[i].sd);
+		v4l2_subdev_cleanup(subdev);
 		media_entity_cleanup(&sensor->ssds[i].sd.entity);
 	}
 	ccs_cleanup(sensor);
diff --git a/drivers/media/i2c/ccs/ccs.h b/drivers/media/i2c/ccs/ccs.h
index a94c796cea48..9c3587b2fbe7 100644
--- a/drivers/media/i2c/ccs/ccs.h
+++ b/drivers/media/i2c/ccs/ccs.h
@@ -182,9 +182,6 @@ struct ccs_binning_subtype {
 struct ccs_subdev {
 	struct v4l2_subdev sd;
 	struct media_pad pads[CCS_PADS];
-	struct v4l2_rect sink_fmt;
-	struct v4l2_rect crop[CCS_PADS];
-	struct v4l2_rect compose; /* compose on sink */
 	unsigned short sink_pad;
 	unsigned short source_pad;
 	int npads;
@@ -220,6 +217,7 @@ struct ccs_sensor {
 	u32 mbus_frame_fmts;
 	const struct ccs_csi_data_format *csi_format;
 	const struct ccs_csi_data_format *internal_csi_format;
+	struct v4l2_rect pa_src, scaler_sink, src_src;
 	u32 default_mbus_frame_fmts;
 	int default_pixel_order;
 	struct ccs_data_container sdata, mdata;
-- 
2.39.2

