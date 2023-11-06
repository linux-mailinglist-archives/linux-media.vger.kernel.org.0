Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4A767E216C
	for <lists+linux-media@lfdr.de>; Mon,  6 Nov 2023 13:26:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231743AbjKFM03 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Nov 2023 07:26:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231778AbjKFM01 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Nov 2023 07:26:27 -0500
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4442E184
        for <linux-media@vger.kernel.org>; Mon,  6 Nov 2023 04:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699273583; x=1730809583;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9gkdiEXZhP823Yf5e2M4+lfJDbudgh9+r4O+oNh47o8=;
  b=Yolg/LZj+VIeSLZmq5kITARRcTDU/p2U1QzvIEKRLjRN2aFKQIoZCmhJ
   4KZqnvfxsDnmnFaz7UA5SW3xsbN5deAAKSNdgwUGBLSJcDz+VmszsKVSC
   WQCJloPEgX96mC59Ll8ueptDxsIOCOhRwGkQKKBfJBi2k00cHjXbULfeO
   NLgP/BjeXTTXSoLmkbgjReZF7bsGGWMLrJ8fIItw2+uSHGFWVRLemiXH3
   Y8g7urI1M+XX9fYE6lx9YHABRmrJoV2Q2k7VKBkimUhl4G42iAPWrXrcA
   u2IS8aVopjmT8hX0XUPmIBiSnSpfvjInTOQgrZhzZygCP8kYv5+3HRePX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="369469714"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="369469714"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 04:26:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="879427759"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="879427759"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 04:26:20 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 7D0281203CE;
        Mon,  6 Nov 2023 14:26:16 +0200 (EET)
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
Subject: [PATCH v7 25/31] media: ccs: Remove ccs_get_crop_compose helper
Date:   Mon,  6 Nov 2023 14:25:33 +0200
Message-Id: <20231106122539.1268265-26-sakari.ailus@linux.intel.com>
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

As it's now easier to obtain the necessary information on crop and compose
rectangles after moving to sub-device state, remove the
ccs_get_crop_compose helper.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 130 ++++++++++++++-----------------
 1 file changed, 58 insertions(+), 72 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index d0ddce321a33..e7548d56124b 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -2210,24 +2210,6 @@ static int ccs_get_format(struct v4l2_subdev *subdev,
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
-				v4l2_subdev_state_get_crop(sd_state, i,
-							   CCS_STREAM_PIXEL);
-	if (comps)
-		*comps = v4l2_subdev_state_get_compose(sd_state, ssd->sink_pad,
-						       CCS_STREAM_PIXEL);
-}
-
 /* Changes require propagation only on sink pad. */
 static void ccs_propagate(struct v4l2_subdev *subdev,
 			  struct v4l2_subdev_state *sd_state, int which,
@@ -2235,15 +2217,17 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
 {
 	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
 	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
-	struct v4l2_rect *comp, *crops[CCS_PADS];
+	struct v4l2_rect *comp, *crop;
 	struct v4l2_mbus_framefmt *fmt;
 
-	ccs_get_crop_compose(subdev, sd_state, crops, &comp);
-
+	comp = v4l2_subdev_state_get_compose(sd_state, ssd->sink_pad,
+					     CCS_STREAM_PIXEL);
 	switch (target) {
 	case V4L2_SEL_TGT_CROP:
-		comp->width = crops[CCS_PAD_SINK]->width;
-		comp->height = crops[CCS_PAD_SINK]->height;
+		crop = v4l2_subdev_state_get_crop(sd_state, CCS_PAD_SINK,
+						  CCS_STREAM_PIXEL);
+		comp->width = crop->width;
+		comp->height = crop->height;
 		if (which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 			if (ssd == sensor->scaler) {
 				sensor->scale_m = CCS_LIM(sensor, SCALER_N_MIN);
@@ -2257,13 +2241,15 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
 		}
 		fallthrough;
 	case V4L2_SEL_TGT_COMPOSE:
-		*crops[CCS_PAD_SRC] = *comp;
+		crop = v4l2_subdev_state_get_crop(sd_state, CCS_PAD_SRC,
+						  CCS_STREAM_PIXEL);
+		*crop = *comp;
 		fmt = v4l2_subdev_state_get_format(sd_state, CCS_PAD_SRC,
 						   CCS_STREAM_PIXEL);
 		fmt->width = comp->width;
 		fmt->height = comp->height;
 		if (which == V4L2_SUBDEV_FORMAT_ACTIVE && ssd == sensor->src)
-			sensor->src_src = *crops[CCS_PAD_SRC];
+			sensor->src_src = *crop;
 		break;
 	default:
 		WARN_ON_ONCE(1);
@@ -2404,7 +2390,7 @@ static int ccs_set_format(struct v4l2_subdev *subdev,
 {
 	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
 	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
-	struct v4l2_rect *crops[CCS_PADS];
+	struct v4l2_rect *crop;
 
 	if (subdev == &sensor->src->sd && fmt->pad == CCS_PAD_META)
 		return ccs_get_format(subdev, sd_state, fmt);
@@ -2446,12 +2432,13 @@ static int ccs_set_format(struct v4l2_subdev *subdev,
 		      CCS_LIM(sensor, MIN_Y_OUTPUT_SIZE),
 		      CCS_LIM(sensor, MAX_Y_OUTPUT_SIZE));
 
-	ccs_get_crop_compose(subdev, sd_state, crops, NULL);
+	crop = v4l2_subdev_state_get_crop(sd_state, ssd->sink_pad,
+					  CCS_STREAM_PIXEL);
 
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
@@ -2506,24 +2493,23 @@ static int scaling_goodness(struct v4l2_subdev *subdev, int w, int ask_w,
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
 
@@ -2538,8 +2524,8 @@ static void ccs_set_compose_binner(struct v4l2_subdev *subdev,
 		sensor->binning_horizontal = binh;
 	}
 
-	sel->r.width = (crops[CCS_PAD_SINK]->width / binh) & ~1;
-	sel->r.height = (crops[CCS_PAD_SINK]->height / binv) & ~1;
+	sel->r.width = (sink_crop->width / binh) & ~1;
+	sel->r.height = (sink_crop->height / binv) & ~1;
 }
 
 /*
@@ -2554,7 +2540,7 @@ static void ccs_set_compose_binner(struct v4l2_subdev *subdev,
 static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
 				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_selection *sel,
-				   struct v4l2_rect **crops,
+				   struct v4l2_rect *sink_crop,
 				   struct v4l2_rect *comp)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(subdev);
@@ -2567,17 +2553,12 @@ static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
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
@@ -2610,10 +2591,10 @@ static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
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
 
@@ -2630,12 +2611,10 @@ static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
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
@@ -2648,17 +2627,15 @@ static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
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
@@ -2672,17 +2649,20 @@ static int ccs_set_compose(struct v4l2_subdev *subdev,
 {
 	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
 	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
-	struct v4l2_rect *comp, *crops[CCS_PADS];
+	struct v4l2_rect *comp, *sink_crop;
 
-	ccs_get_crop_compose(subdev, sd_state, crops, &comp);
+	sink_crop = v4l2_subdev_state_get_crop(sd_state, CCS_PAD_SINK,
+					       CCS_STREAM_PIXEL);
+	comp = v4l2_subdev_state_get_compose(sd_state, ssd->sink_pad,
+					     CCS_STREAM_PIXEL);
 
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
@@ -2743,9 +2723,12 @@ static int ccs_set_crop(struct v4l2_subdev *subdev,
 {
 	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
 	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
-	struct v4l2_rect src_size = { 0 }, *crops[CCS_PADS], *comp;
+	struct v4l2_rect src_size = { 0 }, *crop, *comp;
 
-	ccs_get_crop_compose(subdev, sd_state, crops, &comp);
+	crop = v4l2_subdev_state_get_crop(sd_state, sel->pad,
+					  CCS_STREAM_PIXEL);
+	comp = v4l2_subdev_state_get_compose(sd_state, ssd->sink_pad,
+					     CCS_STREAM_PIXEL);
 
 	if (sel->pad == ssd->sink_pad) {
 		struct v4l2_mbus_framefmt *mfmt =
@@ -2769,7 +2752,7 @@ static int ccs_set_crop(struct v4l2_subdev *subdev,
 	sel->r.left = min_t(int, sel->r.left, src_size.width - sel->r.width);
 	sel->r.top = min_t(int, sel->r.top, src_size.height - sel->r.height);
 
-	*crops[sel->pad] = sel->r;
+	*crop = sel->r;
 
 	if (ssd != sensor->pixel_array && sel->pad == CCS_PAD_SINK)
 		ccs_propagate(subdev, sd_state, sel->which, V4L2_SEL_TGT_CROP);
@@ -2794,14 +2777,17 @@ static int ccs_get_selection(struct v4l2_subdev *subdev,
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
+	crop = v4l2_subdev_state_get_crop(sd_state, sel->pad,
+					  CCS_STREAM_PIXEL);
+	comp = v4l2_subdev_state_get_compose(sd_state, ssd->sink_pad,
+					     CCS_STREAM_PIXEL);
 
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP_BOUNDS:
@@ -2823,7 +2809,7 @@ static int ccs_get_selection(struct v4l2_subdev *subdev,
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

