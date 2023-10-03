Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 152AA7B6893
	for <lists+linux-media@lfdr.de>; Tue,  3 Oct 2023 14:08:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232222AbjJCMIu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Oct 2023 08:08:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232177AbjJCMIt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Oct 2023 08:08:49 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 318DBBB
        for <linux-media@vger.kernel.org>; Tue,  3 Oct 2023 05:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696334924; x=1727870924;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fktGfw+HsjdV4keozBIEfasQQ0QPYp+WtEV8odPHHeU=;
  b=huZ+fL310vYP9zNZqrvSieZOxzmTJ1svtrjvLKmrpCXe4RujlxtrWroI
   B3F8ZdOd5z8BvpzmY+qGR33NZRit5EHaVHn1YWOIEJEntNFHUI57mwpsD
   cacIO3eAT8+DNY69ObuDzfEfBA7/WMsNOC74UfF193oU968WODjiW1Ab0
   l0VdiDrKTz2WtT3q27S4sjjLythiKZ1g/TxB4rB962HFkv1tgB9YvbBAv
   fJ7H0ZPMxDbAzD0YvbLgywbhB7vnGJOCGts4NCRmUCkt7qBwIUA6oa8MR
   byjQmTK3nYsoUuodPWQFNwaeGQOtUHU1yUAXGLty3GvXryW7Nel0egBgU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="385681589"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; 
   d="scan'208";a="385681589"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 05:08:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="780285970"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; 
   d="scan'208";a="780285970"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 05:08:41 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id DB58C120A56;
        Tue,  3 Oct 2023 15:08:37 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: [PATCH v6 27/28] media: ccs: Remove ccs_get_crop_compose helper
Date:   Tue,  3 Oct 2023 15:08:12 +0300
Message-Id: <20231003120813.77726-18-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231003115237.76828-1-sakari.ailus@linux.intel.com>
References: <20231003115237.76828-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,PDS_OTHER_BAD_TLD,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As it's now easier to obtain the necessary information on crop and compose
rectangles after moving to sub-device state, remove the
ccs_get_crop_compose helper.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 120 ++++++++++++++-----------------
 1 file changed, 53 insertions(+), 67 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 2c8ff7cb63a5..9ebf6063150f 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -2210,25 +2210,6 @@ static int ccs_get_format(struct v4l2_subdev *subdev,
 	return rval;
 }
 
-static void ccs_get_crop_compose(struct v4l2_subdev *subdev,
-				 struct v4l2_subdev_state *sd_state,
-				 struct v4l2_rect **crops,
-				 struct v4l2_rect **comps)
-{
-	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
-	unsigned int i;
-
-	if (crops)
-		for (i = 0; i < subdev->entity.num_pads; i++)
-			crops[i] =
-				v4l2_subdev_get_crop_ptr(subdev, sd_state, i,
-							 CCS_STREAM_PIXEL);
-	if (comps)
-		*comps = v4l2_subdev_get_compose_ptr(subdev, sd_state,
-						     ssd->sink_pad,
-						     CCS_STREAM_PIXEL);
-}
-
 /* Changes require propagation only on sink pad. */
 static void ccs_propagate(struct v4l2_subdev *subdev,
 			  struct v4l2_subdev_state *sd_state, int which,
@@ -2237,9 +2218,14 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
 	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
 	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
 	struct v4l2_rect *comp, *crops[CCS_PADS];
+	unsigned int i;
 
-	ccs_get_crop_compose(subdev, sd_state, crops, &comp);
+	for (i = 0; i < subdev->entity.num_pads; i++)
+		crops[i] = v4l2_subdev_get_crop_ptr(subdev, sd_state, i,
+						    CCS_STREAM_PIXEL);
 
+	comp = v4l2_subdev_get_compose_ptr(subdev, sd_state,
+					   ssd->sink_pad, CCS_STREAM_PIXEL);
 	switch (target) {
 	case V4L2_SEL_TGT_CROP:
 		comp->width = crops[CCS_PAD_SINK]->width;
@@ -2402,7 +2388,7 @@ static int ccs_set_format(struct v4l2_subdev *subdev,
 {
 	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
 	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
-	struct v4l2_rect *crops[CCS_PADS];
+	struct v4l2_rect *crop;
 
 	if (subdev == &sensor->src->sd && fmt->pad == CCS_PAD_META)
 		return ccs_get_format(subdev, sd_state, fmt);
@@ -2443,12 +2429,13 @@ static int ccs_set_format(struct v4l2_subdev *subdev,
 		      CCS_LIM(sensor, MIN_Y_OUTPUT_SIZE),
 		      CCS_LIM(sensor, MAX_Y_OUTPUT_SIZE));
 
-	ccs_get_crop_compose(subdev, sd_state, crops, NULL);
+	crop = v4l2_subdev_get_crop_ptr(subdev, sd_state, ssd->sink_pad,
+					CCS_STREAM_PIXEL);
 
-	crops[ssd->sink_pad]->left = 0;
-	crops[ssd->sink_pad]->top = 0;
-	crops[ssd->sink_pad]->width = fmt->format.width;
-	crops[ssd->sink_pad]->height = fmt->format.height;
+	crop->left = 0;
+	crop->top = 0;
+	crop->width = fmt->format.width;
+	crop->height = fmt->format.height;
 	ccs_propagate(subdev, sd_state, fmt->which, V4L2_SEL_TGT_CROP);
 
 	mutex_unlock(&sensor->mutex);
@@ -2503,24 +2490,23 @@ static int scaling_goodness(struct v4l2_subdev *subdev, int w, int ask_w,
 static void ccs_set_compose_binner(struct v4l2_subdev *subdev,
 				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_selection *sel,
-				   struct v4l2_rect **crops,
+				   struct v4l2_rect *sink_crop,
 				   struct v4l2_rect *comp)
 {
 	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
 	unsigned int i;
 	unsigned int binh = 1, binv = 1;
 	int best = scaling_goodness(
-		subdev,
-		crops[CCS_PAD_SINK]->width, sel->r.width,
-		crops[CCS_PAD_SINK]->height, sel->r.height, sel->flags);
+		subdev,	sink_crop->width, sel->r.width,
+		sink_crop->height, sel->r.height, sel->flags);
 
 	for (i = 0; i < sensor->nbinning_subtypes; i++) {
 		int this = scaling_goodness(
 			subdev,
-			crops[CCS_PAD_SINK]->width
+			sink_crop->width
 			/ sensor->binning_subtypes[i].horizontal,
 			sel->r.width,
-			crops[CCS_PAD_SINK]->height
+			sink_crop->height
 			/ sensor->binning_subtypes[i].vertical,
 			sel->r.height, sel->flags);
 
@@ -2535,8 +2521,8 @@ static void ccs_set_compose_binner(struct v4l2_subdev *subdev,
 		sensor->binning_horizontal = binh;
 	}
 
-	sel->r.width = (crops[CCS_PAD_SINK]->width / binh) & ~1;
-	sel->r.height = (crops[CCS_PAD_SINK]->height / binv) & ~1;
+	sel->r.width = (sink_crop->width / binh) & ~1;
+	sel->r.height = (sink_crop->height / binv) & ~1;
 }
 
 /*
@@ -2551,7 +2537,7 @@ static void ccs_set_compose_binner(struct v4l2_subdev *subdev,
 static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
 				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_selection *sel,
-				   struct v4l2_rect **crops,
+				   struct v4l2_rect *sink_crop,
 				   struct v4l2_rect *comp)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(subdev);
@@ -2564,17 +2550,12 @@ static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
 	unsigned int i;
 	int best = INT_MIN;
 
-	sel->r.width = min_t(unsigned int, sel->r.width,
-			     crops[CCS_PAD_SINK]->width);
-	sel->r.height = min_t(unsigned int, sel->r.height,
-			      crops[CCS_PAD_SINK]->height);
-
-	a = crops[CCS_PAD_SINK]->width
-		* CCS_LIM(sensor, SCALER_N_MIN) / sel->r.width;
-	b = crops[CCS_PAD_SINK]->height
-		* CCS_LIM(sensor, SCALER_N_MIN) / sel->r.height;
-	max_m = crops[CCS_PAD_SINK]->width
-		* CCS_LIM(sensor, SCALER_N_MIN)
+	sel->r.width = min_t(unsigned int, sel->r.width, sink_crop->width);
+	sel->r.height = min_t(unsigned int, sel->r.height, sink_crop->height);
+
+	a = sink_crop->width * CCS_LIM(sensor, SCALER_N_MIN) / sel->r.width;
+	b = sink_crop->height * CCS_LIM(sensor, SCALER_N_MIN) / sel->r.height;
+	max_m = sink_crop->width * CCS_LIM(sensor, SCALER_N_MIN)
 		/ CCS_LIM(sensor, MIN_X_OUTPUT_SIZE);
 
 	a = clamp(a, CCS_LIM(sensor, SCALER_M_MIN),
@@ -2607,10 +2588,10 @@ static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
 	for (i = 0; i < ntry; i++) {
 		int this = scaling_goodness(
 			subdev,
-			crops[CCS_PAD_SINK]->width
+			sink_crop->width
 			/ try[i] * CCS_LIM(sensor, SCALER_N_MIN),
 			sel->r.width,
-			crops[CCS_PAD_SINK]->height,
+			sink_crop->height,
 			sel->r.height,
 			sel->flags);
 
@@ -2627,12 +2608,10 @@ static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
 			continue;
 
 		this = scaling_goodness(
-			subdev, crops[CCS_PAD_SINK]->width
-			/ try[i]
+			subdev, sink_crop->width / try[i]
 			* CCS_LIM(sensor, SCALER_N_MIN),
 			sel->r.width,
-			crops[CCS_PAD_SINK]->height
-			/ try[i]
+			sink_crop->height / try[i]
 			* CCS_LIM(sensor, SCALER_N_MIN),
 			sel->r.height,
 			sel->flags);
@@ -2645,17 +2624,15 @@ static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
 	}
 
 	sel->r.width =
-		(crops[CCS_PAD_SINK]->width
-		 / scale_m
+		(sink_crop->width / scale_m
 		 * CCS_LIM(sensor, SCALER_N_MIN)) & ~1;
 	if (mode == SMIAPP_SCALING_MODE_BOTH)
 		sel->r.height =
-			(crops[CCS_PAD_SINK]->height
-			 / scale_m
+			(sink_crop->height / scale_m
 			 * CCS_LIM(sensor, SCALER_N_MIN))
 			& ~1;
 	else
-		sel->r.height = crops[CCS_PAD_SINK]->height;
+		sel->r.height = sink_crop->height;
 
 	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 		sensor->scale_m = scale_m;
@@ -2669,17 +2646,20 @@ static int ccs_set_compose(struct v4l2_subdev *subdev,
 {
 	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
 	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
-	struct v4l2_rect *comp, *crops[CCS_PADS];
+	struct v4l2_rect *comp, *sink_crop;
 
-	ccs_get_crop_compose(subdev, sd_state, crops, &comp);
+	sink_crop = v4l2_subdev_get_crop_ptr(subdev, sd_state, CCS_PAD_SINK,
+					     CCS_STREAM_PIXEL);
+	comp = v4l2_subdev_get_compose_ptr(subdev, sd_state, ssd->sink_pad,
+					   CCS_STREAM_PIXEL);
 
 	sel->r.top = 0;
 	sel->r.left = 0;
 
 	if (ssd == sensor->binner)
-		ccs_set_compose_binner(subdev, sd_state, sel, crops, comp);
+		ccs_set_compose_binner(subdev, sd_state, sel, sink_crop, comp);
 	else
-		ccs_set_compose_scaler(subdev, sd_state, sel, crops, comp);
+		ccs_set_compose_scaler(subdev, sd_state, sel, sink_crop, comp);
 
 	*comp = sel->r;
 	ccs_propagate(subdev, sd_state, sel->which, V4L2_SEL_TGT_COMPOSE);
@@ -2740,9 +2720,12 @@ static int ccs_set_crop(struct v4l2_subdev *subdev,
 {
 	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
 	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
-	struct v4l2_rect src_size = { 0 }, *crops[CCS_PADS], *comp;
+	struct v4l2_rect src_size = { 0 }, *crop, *comp;
 
-	ccs_get_crop_compose(subdev, sd_state, crops, &comp);
+	crop = v4l2_subdev_get_crop_ptr(subdev, sd_state, sel->pad,
+					CCS_STREAM_PIXEL);
+	comp = v4l2_subdev_get_compose_ptr(subdev, sd_state, ssd->sink_pad,
+					   CCS_STREAM_PIXEL);
 
 	if (sel->pad == ssd->sink_pad) {
 		struct v4l2_mbus_framefmt *mfmt =
@@ -2766,7 +2749,7 @@ static int ccs_set_crop(struct v4l2_subdev *subdev,
 	sel->r.left = min_t(int, sel->r.left, src_size.width - sel->r.width);
 	sel->r.top = min_t(int, sel->r.top, src_size.height - sel->r.height);
 
-	*crops[sel->pad] = sel->r;
+	*crop = sel->r;
 
 	if (ssd != sensor->pixel_array && sel->pad == CCS_PAD_SINK)
 		ccs_propagate(subdev, sd_state, sel->which, V4L2_SEL_TGT_CROP);
@@ -2791,14 +2774,17 @@ static int ccs_get_selection(struct v4l2_subdev *subdev,
 {
 	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
 	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
-	struct v4l2_rect *comp, *crops[CCS_PADS];
+	struct v4l2_rect *crop, *comp;
 	int ret;
 
 	ret = ccs_sel_supported(subdev, sel);
 	if (ret)
 		return ret;
 
-	ccs_get_crop_compose(subdev, sd_state, crops, &comp);
+	crop = v4l2_subdev_get_crop_ptr(subdev, sd_state, sel->pad,
+					CCS_STREAM_PIXEL);
+	comp = v4l2_subdev_get_compose_ptr(subdev, sd_state, ssd->sink_pad,
+					   CCS_STREAM_PIXEL);
 
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP_BOUNDS:
@@ -2820,7 +2806,7 @@ static int ccs_get_selection(struct v4l2_subdev *subdev,
 		break;
 	case V4L2_SEL_TGT_CROP:
 	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
-		sel->r = *crops[sel->pad];
+		sel->r = *crop;
 		break;
 	case V4L2_SEL_TGT_COMPOSE:
 		sel->r = *comp;
-- 
2.39.2

