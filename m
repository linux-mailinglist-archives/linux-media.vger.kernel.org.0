Return-Path: <linux-media+bounces-50885-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B3AD3127F
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 13:35:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D855430550F7
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 12:35:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 549831E0E14;
	Fri, 16 Jan 2026 12:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZflmrNuT"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DAD1F5834
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 12:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768566926; cv=none; b=toPSYPQDYzpaKHs+dRfjnAYI8x5TrfQk8YvYkBxTAM56UQ9Z88573l9stpF0PsaLnbXfZcc6a9u/859BOSe/FunCKWj0q3s3JY37kmIKDOfN/hHYRXuUYwRTD2THjqpeRv0ifLVY4kQsnxGCJlEj45oXuocQRkAhAp+waD/2huE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768566926; c=relaxed/simple;
	bh=+FEPbRqu73BzUUsUynls1ZqY/Oqm3Tloq7YyNG/AjPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nDpOttK7UZppZDjqRkQjIierl3T/m+3Wjo/IKLGf1hqKUeNC6dCSA7ayEtRoTic96yiy9czv6i8YjHgN57AGcnMtpfdOPN8DOksAlr3rqq6IwGQxvBJ+QGxgVlSQ58QChZcNXz3ulGocjc3LLsshlnbe2slpF9xWNLtWZEw9cZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZflmrNuT; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768566919; x=1800102919;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+FEPbRqu73BzUUsUynls1ZqY/Oqm3Tloq7YyNG/AjPQ=;
  b=ZflmrNuT32JsAkkLbnoqzNo7CAvxnvQL83CoVQyKViwCz7i9Qob9tP3j
   Z/7SYG9O/UFeQU2zKKbXJAHGJ7NU7D6lo52dBPyDFWktDC1Na7gv6SYJM
   L8X+kmLA9E6yCQlZW5RbdmoTN3ljdAkNTSgcI90UjP/G9ui/kCmRS//On
   Huim8C4abBL+9PjBxuHIIfD6//aEWLpWpieYE9YHILg2olswfqjfWz1P/
   YjK62uGhcNyv/Fu70I3Q3lSr2PLANiiuzG3qbRliFdjG4Ez889G/voIny
   wcfxg8P4zIndJfJ9vSHE5cXNp6Dq7SnHHNv+vLiNYGpeR94hPZ8rPj81q
   Q==;
X-CSE-ConnectionGUID: h93Gsxa+RHiIncanL0Iz9g==
X-CSE-MsgGUID: 8okw9fHtRQGrzb5Kfn3CPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="81327478"
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="81327478"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 04:35:16 -0800
X-CSE-ConnectionGUID: JVnGmjPpRYih60BaTh3vag==
X-CSE-MsgGUID: GjaHPsZSQTqTlQleMF759g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="205511885"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.150])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 04:35:15 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 12D0D11FB01;
	Fri, 16 Jan 2026 14:35:15 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vgj2o-00000000vUC-3nd6;
	Fri, 16 Jan 2026 14:35:14 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	laurent.pinchart@ideasonboard.com,
	jai.luthra@ideasonboard.com
Subject: [PATCH v2 1/8] media: ccs: Remove ccs_get_crop_compose helper
Date: Fri, 16 Jan 2026 14:35:07 +0200
Message-ID: <20260116123514.220949-2-sakari.ailus@linux.intel.com>
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

As it's now easier to obtain the necessary information on crop and compose
rectangles after moving to sub-device state, remove the
ccs_get_crop_compose helper.

Also remove the comp arguments of the compose goodness calculators and
make related local variables and function arguments const where
applicable.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 161 ++++++++++++++-----------------
 1 file changed, 71 insertions(+), 90 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index bc832f5ccd29..5d931e1fb46d 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -2091,24 +2091,6 @@ static int ccs_get_format(struct v4l2_subdev *subdev,
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
@@ -2116,15 +2098,17 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
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
@@ -2138,13 +2122,15 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
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
@@ -2210,7 +2196,7 @@ static int ccs_set_format(struct v4l2_subdev *subdev,
 {
 	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
 	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
-	struct v4l2_rect *crops[CCS_PADS];
+	struct v4l2_rect *crop;
 
 	mutex_lock(&sensor->mutex);
 
@@ -2239,12 +2225,13 @@ static int ccs_set_format(struct v4l2_subdev *subdev,
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
@@ -2299,26 +2286,23 @@ static int scaling_goodness(struct v4l2_subdev *subdev, int w, int ask_w,
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
@@ -2331,8 +2315,8 @@ static void ccs_set_compose_binner(struct v4l2_subdev *subdev,
 		sensor->binning_horizontal = binh;
 	}
 
-	sel->r.width = (crops[CCS_PAD_SINK]->width / binh) & ~1;
-	sel->r.height = (crops[CCS_PAD_SINK]->height / binv) & ~1;
+	sel->r.width = (sink_crop->width / binh) & ~1;
+	sel->r.height = (sink_crop->height / binv) & ~1;
 }
 
 /*
@@ -2347,8 +2331,7 @@ static void ccs_set_compose_binner(struct v4l2_subdev *subdev,
 static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
 				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_selection *sel,
-				   struct v4l2_rect **crops,
-				   struct v4l2_rect *comp)
+				   const struct v4l2_rect *sink_crop)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(subdev);
 	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
@@ -2360,16 +2343,12 @@ static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
 	unsigned int i;
 	int best = INT_MIN;
 
-	sel->r.width = min_t(unsigned int, sel->r.width,
-			     crops[CCS_PAD_SINK]->width);
-	sel->r.height = min_t(unsigned int, sel->r.height,
-			      crops[CCS_PAD_SINK]->height);
+	sel->r.width = min_t(unsigned int, sel->r.width, sink_crop->width);
+	sel->r.height = min_t(unsigned int, sel->r.height, sink_crop->height);
 
-	a = crops[CCS_PAD_SINK]->width
-		* CCS_LIM(sensor, SCALER_N_MIN) / sel->r.width;
-	b = crops[CCS_PAD_SINK]->height
-		* CCS_LIM(sensor, SCALER_N_MIN) / sel->r.height;
-	max_m = crops[CCS_PAD_SINK]->width
+	a = sink_crop->width * CCS_LIM(sensor, SCALER_N_MIN) / sel->r.width;
+	b = sink_crop->height * CCS_LIM(sensor, SCALER_N_MIN) / sel->r.height;
+	max_m = sink_crop->width
 		* CCS_LIM(sensor, SCALER_N_MIN)
 		/ (CCS_LIM(sensor, MIN_X_OUTPUT_SIZE) ?: 1);
 
@@ -2401,14 +2380,12 @@ static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
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
 
@@ -2423,12 +2400,10 @@ static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
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
@@ -2440,18 +2415,13 @@ static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
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
@@ -2465,17 +2435,21 @@ static int ccs_set_compose(struct v4l2_subdev *subdev,
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
@@ -2530,9 +2504,13 @@ static int ccs_set_crop(struct v4l2_subdev *subdev,
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
@@ -2555,7 +2533,7 @@ static int ccs_set_crop(struct v4l2_subdev *subdev,
 	sel->r.left = min_t(int, sel->r.left, src_size.width - sel->r.width);
 	sel->r.top = min_t(int, sel->r.top, src_size.height - sel->r.height);
 
-	*crops[sel->pad] = sel->r;
+	*crop = sel->r;
 
 	if (ssd != sensor->pixel_array && sel->pad == CCS_PAD_SINK)
 		ccs_propagate(subdev, sd_state, sel->which, V4L2_SEL_TGT_CROP);
@@ -2580,14 +2558,17 @@ static int ccs_get_selection(struct v4l2_subdev *subdev,
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
@@ -2607,7 +2588,7 @@ static int ccs_get_selection(struct v4l2_subdev *subdev,
 		break;
 	case V4L2_SEL_TGT_CROP:
 	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
-		sel->r = *crops[sel->pad];
+		sel->r = *crop;
 		break;
 	case V4L2_SEL_TGT_COMPOSE:
 		sel->r = *comp;
-- 
2.47.3


