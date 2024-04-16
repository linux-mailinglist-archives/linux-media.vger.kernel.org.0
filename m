Return-Path: <linux-media+bounces-9583-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 329308A74F4
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 21:35:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 557E51C22581
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 19:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9D0013B295;
	Tue, 16 Apr 2024 19:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H9W431rd"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED8E139591
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 19:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713296053; cv=none; b=lVajpWT0+IoX/NcNjTeV9ziS4/EEQQPFhMufwH4emZu0MrRcFspieJ1gGan6+9LgVpkzH2XQ4wWStuG0R2zpbEhaca2q5R02BOUAU1pOhhUHKMJkWDDXIDZwEXdve+abhLC4rCo9SMnPzT4DsUbCzP8YiRFYgLH/ZbTvyeOsb7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713296053; c=relaxed/simple;
	bh=igy0hLuXvCbiKddeOdUh+F08uy8OP3yBt6aZgn81Jx4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PrTHHQNn9seqKEKsNwo+MQJ8JF8kKCRIPUKGmTRsBnLr9M00x2lKHFzxHDwpSQ5CnvjbVnp84ilmJyw7cZ6+N5U9mI1QGEcaJ2aPnku0eutfEDe40fzLNOhXbslz0KDfUallWz1q/6wNzNMCkQi/0/TQP6MEUTsTQVpz5L62xGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H9W431rd; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713296052; x=1744832052;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=igy0hLuXvCbiKddeOdUh+F08uy8OP3yBt6aZgn81Jx4=;
  b=H9W431rdPlOD63iYnKBil7qT6GmJlM7IZkF7qI+5dnHUKQn75KBjLAud
   89aA/oVWEWv6NuHq3CK19Z0xbirwnV0A0YOP9MOBzVqA6ixag1WsO3Jet
   9DT9D7o8DWiPU+o+zygTrUXm7Tajfb85rJSR5R+8wF4dXMovc5cL0ku89
   EXyN0Zv6SfRc+g8/XCfo8OE4JSScVjhIA786TcT9J8mil1maTvB27BPoJ
   cjnOXOpDnM4AqWCsghJkWDPRTlM8LquOdFoyskc27Dz48FaQ+UxWK3C49
   75k2TaLbhe9xceU8BqXQrT6Q7Uf9gliCtAxfOnM7ASyUKy4WHYo7FkXdW
   Q==;
X-CSE-ConnectionGUID: r3hqWCwEQsmY+Wo6ary0Lw==
X-CSE-MsgGUID: WjvyDHsBTb+3luFmbUxAaA==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8929857"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="8929857"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:34:10 -0700
X-CSE-ConnectionGUID: jwZaTDcEQHCY4tl2d7X47g==
X-CSE-MsgGUID: SNY+/kjHS/WVKWsZDii3Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="22380234"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:34:07 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 004C41204F6;
	Tue, 16 Apr 2024 22:34:03 +0300 (EEST)
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
Subject: [PATCH v9 31/46] media: ccs: Remove ccs_get_crop_compose helper
Date: Tue, 16 Apr 2024 22:33:04 +0300
Message-Id: <20240416193319.778192-32-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As it's now easier to obtain the necessary information on crop and compose
rectangles after moving to sub-device state, remove the
ccs_get_crop_compose helper.

Also remove the comp arguments of the compose goodness calculators and
make related local variables and function arguments const where
applicable.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 164 ++++++++++++++-----------------
 1 file changed, 72 insertions(+), 92 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index ba629eafec43..299b5ac6538c 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -2223,24 +2223,6 @@ static int ccs_get_format(struct v4l2_subdev *subdev,
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
@@ -2248,15 +2230,17 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
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
@@ -2270,13 +2254,15 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
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
@@ -2419,7 +2405,7 @@ static int ccs_set_format(struct v4l2_subdev *subdev,
 {
 	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
 	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
-	struct v4l2_rect *crops[CCS_PADS];
+	struct v4l2_rect *crop;
 
 	if (subdev == &sensor->src->sd && fmt->pad == CCS_PAD_META)
 		return ccs_get_format(subdev, sd_state, fmt);
@@ -2461,12 +2447,13 @@ static int ccs_set_format(struct v4l2_subdev *subdev,
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
@@ -2521,26 +2508,23 @@ static int scaling_goodness(struct v4l2_subdev *subdev, int w, int ask_w,
 static void ccs_set_compose_binner(struct v4l2_subdev *subdev,
 				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_selection *sel,
-				   struct v4l2_rect **crops,
-				   struct v4l2_rect *comp)
+				   const struct v4l2_rect *sink_crop)
 {
 	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
 	unsigned int i;
 	unsigned int binh = 1, binv = 1;
-	int best = scaling_goodness(
-		subdev,
-		crops[CCS_PAD_SINK]->width, sel->r.width,
-		crops[CCS_PAD_SINK]->height, sel->r.height, sel->flags);
+	int best = scaling_goodness(subdev, sink_crop->width, sel->r.width,
+				    sink_crop->height, sel->r.height,
+				    sel->flags);
 
 	for (i = 0; i < sensor->nbinning_subtypes; i++) {
-		int this = scaling_goodness(
-			subdev,
-			crops[CCS_PAD_SINK]->width
-			/ sensor->binning_subtypes[i].horizontal,
-			sel->r.width,
-			crops[CCS_PAD_SINK]->height
-			/ sensor->binning_subtypes[i].vertical,
-			sel->r.height, sel->flags);
+		int this = scaling_goodness(subdev,
+					    sink_crop->width
+					    / sensor->binning_subtypes[i].horizontal,
+					    sel->r.width,
+					    sink_crop->height
+					    / sensor->binning_subtypes[i].vertical,
+					    sel->r.height, sel->flags);
 
 		if (this > best) {
 			binh = sensor->binning_subtypes[i].horizontal;
@@ -2553,8 +2537,8 @@ static void ccs_set_compose_binner(struct v4l2_subdev *subdev,
 		sensor->binning_horizontal = binh;
 	}
 
-	sel->r.width = (crops[CCS_PAD_SINK]->width / binh) & ~1;
-	sel->r.height = (crops[CCS_PAD_SINK]->height / binv) & ~1;
+	sel->r.width = (sink_crop->width / binh) & ~1;
+	sel->r.height = (sink_crop->height / binv) & ~1;
 }
 
 /*
@@ -2569,8 +2553,7 @@ static void ccs_set_compose_binner(struct v4l2_subdev *subdev,
 static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
 				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_selection *sel,
-				   struct v4l2_rect **crops,
-				   struct v4l2_rect *comp)
+				   const struct v4l2_rect *sink_crop)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(subdev);
 	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
@@ -2582,17 +2565,12 @@ static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
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
@@ -2623,14 +2601,12 @@ static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
 	}
 
 	for (i = 0; i < ntry; i++) {
-		int this = scaling_goodness(
-			subdev,
-			crops[CCS_PAD_SINK]->width
-			/ try[i] * CCS_LIM(sensor, SCALER_N_MIN),
-			sel->r.width,
-			crops[CCS_PAD_SINK]->height,
-			sel->r.height,
-			sel->flags);
+		int this = scaling_goodness(subdev,
+					    sink_crop->width
+					    / try[i]
+					    * CCS_LIM(sensor, SCALER_N_MIN),
+					    sel->r.width, sink_crop->height,
+					    sel->r.height, sel->flags);
 
 		dev_dbg(&client->dev, "trying factor %u (%u)\n", try[i], i);
 
@@ -2645,12 +2621,10 @@ static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
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
@@ -2662,18 +2636,13 @@ static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
 		}
 	}
 
-	sel->r.width =
-		(crops[CCS_PAD_SINK]->width
-		 / scale_m
-		 * CCS_LIM(sensor, SCALER_N_MIN)) & ~1;
+	sel->r.width = (sink_crop->width / scale_m
+			* CCS_LIM(sensor, SCALER_N_MIN)) & ~1;
 	if (mode == SMIAPP_SCALING_MODE_BOTH)
-		sel->r.height =
-			(crops[CCS_PAD_SINK]->height
-			 / scale_m
-			 * CCS_LIM(sensor, SCALER_N_MIN))
-			& ~1;
+		sel->r.height = (sink_crop->height / scale_m
+				 * CCS_LIM(sensor, SCALER_N_MIN)) & ~1;
 	else
-		sel->r.height = crops[CCS_PAD_SINK]->height;
+		sel->r.height = sink_crop->height;
 
 	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 		sensor->scale_m = scale_m;
@@ -2687,17 +2656,21 @@ static int ccs_set_compose(struct v4l2_subdev *subdev,
 {
 	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
 	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
-	struct v4l2_rect *comp, *crops[CCS_PADS];
+	const struct v4l2_rect *sink_crop;
+	struct v4l2_rect *comp;
 
-	ccs_get_crop_compose(subdev, sd_state, crops, &comp);
+	sink_crop = v4l2_subdev_state_get_crop(sd_state, CCS_PAD_SINK,
+					       CCS_STREAM_PIXEL);
+	comp = v4l2_subdev_state_get_compose(sd_state, ssd->sink_pad,
+					     CCS_STREAM_PIXEL);
 
 	sel->r.top = 0;
 	sel->r.left = 0;
 
 	if (ssd == sensor->binner)
-		ccs_set_compose_binner(subdev, sd_state, sel, crops, comp);
+		ccs_set_compose_binner(subdev, sd_state, sel, sink_crop);
 	else
-		ccs_set_compose_scaler(subdev, sd_state, sel, crops, comp);
+		ccs_set_compose_scaler(subdev, sd_state, sel, sink_crop);
 
 	*comp = sel->r;
 	ccs_propagate(subdev, sd_state, sel->which, V4L2_SEL_TGT_COMPOSE);
@@ -2758,9 +2731,13 @@ static int ccs_set_crop(struct v4l2_subdev *subdev,
 {
 	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
 	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
-	struct v4l2_rect src_size = { 0 }, *crops[CCS_PADS], *comp;
+	struct v4l2_rect src_size = { 0 }, *crop;
+	const struct v4l2_rect *comp;
 
-	ccs_get_crop_compose(subdev, sd_state, crops, &comp);
+	crop = v4l2_subdev_state_get_crop(sd_state, sel->pad,
+					  CCS_STREAM_PIXEL);
+	comp = v4l2_subdev_state_get_compose(sd_state, ssd->sink_pad,
+					     CCS_STREAM_PIXEL);
 
 	if (sel->pad == ssd->sink_pad) {
 		struct v4l2_mbus_framefmt *mfmt =
@@ -2784,7 +2761,7 @@ static int ccs_set_crop(struct v4l2_subdev *subdev,
 	sel->r.left = min_t(int, sel->r.left, src_size.width - sel->r.width);
 	sel->r.top = min_t(int, sel->r.top, src_size.height - sel->r.height);
 
-	*crops[sel->pad] = sel->r;
+	*crop = sel->r;
 
 	if (ssd != sensor->pixel_array && sel->pad == CCS_PAD_SINK)
 		ccs_propagate(subdev, sd_state, sel->which, V4L2_SEL_TGT_CROP);
@@ -2809,14 +2786,17 @@ static int ccs_get_selection(struct v4l2_subdev *subdev,
 {
 	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
 	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
-	struct v4l2_rect *comp, *crops[CCS_PADS];
+	const struct v4l2_rect *crop, *comp;
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
@@ -2838,7 +2818,7 @@ static int ccs_get_selection(struct v4l2_subdev *subdev,
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


