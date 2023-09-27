Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE3F57B0A73
	for <lists+linux-media@lfdr.de>; Wed, 27 Sep 2023 18:35:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231528AbjI0Qf7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Sep 2023 12:35:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231567AbjI0Qf6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Sep 2023 12:35:58 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1669DF5
        for <linux-media@vger.kernel.org>; Wed, 27 Sep 2023 09:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695832556; x=1727368556;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iYaOIs03bBd1WWCozKb9MbX1bBUHnpvpzQgGxWvq4pk=;
  b=J65d/2jtEUqN/2Y410cpGjU9br3km7i+MWSarBX9LvLfqdcbblG7CeNa
   hItlC832lt5xDv2zOyZV8TIiIWZFaigqkdG+cene+8fSTkZzB+gYBf/8T
   UGAXR0Ho98M+f+boAKDf3ygJnWXKzRCFh6u5JLWCjFmCnSepiLEOmVlw0
   zznPN+AkIzeeGW4HowPFQOeyIH6hgaO5FP/fA+PPcEPcxbQ42MLJ2jjSY
   tpFehvYjb74AxispP70ODKuxC3IqHlaM/Iqqh399PzPk6Vm0wf45t9gwA
   VGlp8p62+pDfoyj3sHdT9yz86QGlHMuL38lbc5qsIkEUtop92jw8OtCtE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="448363237"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="448363237"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 09:33:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="872955413"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="872955413"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 09:33:37 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 844CD12035C;
        Wed, 27 Sep 2023 19:33:32 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: [PATCH v5 24/26] media: ccs: Remove ccs_get_crop_compose helper
Date:   Wed, 27 Sep 2023 19:32:10 +0300
Message-Id: <20230927163212.402025-25-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230927163212.402025-1-sakari.ailus@linux.intel.com>
References: <20230927163212.402025-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,PDS_OTHER_BAD_TLD,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
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
index 302b2142a2e7..7ae191b7cec5 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -2219,25 +2219,6 @@ static int ccs_get_format(struct v4l2_subdev *subdev,
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
@@ -2246,9 +2227,14 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
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
@@ -2411,7 +2397,7 @@ static int ccs_set_format(struct v4l2_subdev *subdev,
 {
 	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
 	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
-	struct v4l2_rect *crops[CCS_PADS];
+	struct v4l2_rect *crop;
 
 	if (subdev == &sensor->src->sd && fmt->pad == CCS_PAD_META)
 		return ccs_get_format(subdev, sd_state, fmt);
@@ -2452,12 +2438,13 @@ static int ccs_set_format(struct v4l2_subdev *subdev,
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
@@ -2512,24 +2499,23 @@ static int scaling_goodness(struct v4l2_subdev *subdev, int w, int ask_w,
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
 
@@ -2544,8 +2530,8 @@ static void ccs_set_compose_binner(struct v4l2_subdev *subdev,
 		sensor->binning_horizontal = binh;
 	}
 
-	sel->r.width = (crops[CCS_PAD_SINK]->width / binh) & ~1;
-	sel->r.height = (crops[CCS_PAD_SINK]->height / binv) & ~1;
+	sel->r.width = (sink_crop->width / binh) & ~1;
+	sel->r.height = (sink_crop->height / binv) & ~1;
 }
 
 /*
@@ -2560,7 +2546,7 @@ static void ccs_set_compose_binner(struct v4l2_subdev *subdev,
 static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
 				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_selection *sel,
-				   struct v4l2_rect **crops,
+				   struct v4l2_rect *sink_crop,
 				   struct v4l2_rect *comp)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(subdev);
@@ -2573,17 +2559,12 @@ static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
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
@@ -2616,10 +2597,10 @@ static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
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
 
@@ -2636,12 +2617,10 @@ static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
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
@@ -2654,17 +2633,15 @@ static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
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
@@ -2678,17 +2655,20 @@ static int ccs_set_compose(struct v4l2_subdev *subdev,
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
@@ -2749,9 +2729,12 @@ static int ccs_set_crop(struct v4l2_subdev *subdev,
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
@@ -2775,7 +2758,7 @@ static int ccs_set_crop(struct v4l2_subdev *subdev,
 	sel->r.left = min_t(int, sel->r.left, src_size.width - sel->r.width);
 	sel->r.top = min_t(int, sel->r.top, src_size.height - sel->r.height);
 
-	*crops[sel->pad] = sel->r;
+	*crop = sel->r;
 
 	if (ssd != sensor->pixel_array && sel->pad == CCS_PAD_SINK)
 		ccs_propagate(subdev, sd_state, sel->which, V4L2_SEL_TGT_CROP);
@@ -2800,14 +2783,17 @@ static int ccs_get_selection(struct v4l2_subdev *subdev,
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
@@ -2829,7 +2815,7 @@ static int ccs_get_selection(struct v4l2_subdev *subdev,
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

