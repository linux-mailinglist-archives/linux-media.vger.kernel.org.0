Return-Path: <linux-media+bounces-40960-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 64715B33BF0
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 11:56:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADA0A1885970
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 825FC2DC32A;
	Mon, 25 Aug 2025 09:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dSsGWiYD"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A180E2DA74A
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 09:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115507; cv=none; b=t5cNRu3Rnt2YABVB8H7Jys2HOX3+5At8KxcvTK8LFqLDmJSzzCOTEVq4VjZ5W2kvPHQhDLgRVQRJ738PO+7iXqIM15Id0XeIkOh9+7rcIcaF1nv2BuZw+81mCSzyTRW8GGxuhOvgE7w081GRcfNbDCFUtztw4mHwji4+Fen/X4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115507; c=relaxed/simple;
	bh=aCZoQI/gyR9dIDg+y2TJ/dn9xw2jg02A7X8qIm73+AA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FZsJNpz5mFRh9JwRE+dB/MDyVYKcq3/rsxVHhYg1JDovbzwylz3IfaJbFqFfPFgqD0Ah1Cgs3sN9v6/HwLi+0eFUMCasvCnkitLZerKKopPbp7nbK3WuuYjx/W1M0n8yFVvb+J9vp+nyD1PEFPlrY4XQmjhYNb8ndH6BP6zdjbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dSsGWiYD; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756115506; x=1787651506;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aCZoQI/gyR9dIDg+y2TJ/dn9xw2jg02A7X8qIm73+AA=;
  b=dSsGWiYDiMROhAVOKmaE3wyW+nRHXaTiUksmDYdi50Wxdqmo0NAOJ0w1
   De5/oHlnthXTGqVUktBnf7anc7hNh9e1PDF2HKzHRExVKmu3aSsOR8nIx
   Ud8I+4aKQVgFW3Of1gadJ4Sx4HWuP7HHZai/Zq2OCYKbgs41SAgLtHiCY
   lUn3Nsqf7SMOSOyhfPnrbkkwAAEHtmdi8/RUJcdIDYbu04IjywUF8GURb
   olmLCdiRRSd08Bs63MPZbFuCOMrvXaicJucFHMJpcPXZOnay27CghLVWs
   feYNhtvqH7GaNnk2zJ6mEuSyN3ty/LKJ9OK7gGi2u5gi7Wsfo821ZzPQC
   g==;
X-CSE-ConnectionGUID: EqMUabkiRiWcuSvxy3qhuA==
X-CSE-MsgGUID: 7cfF/vf+Q+GjFzneHslc/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="69696103"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="69696103"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:37 -0700
X-CSE-ConnectionGUID: 0pfjXFGtQ3et5eowK3F3bw==
X-CSE-MsgGUID: 1UyaVX/xSxKBEoJ518Dzfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="200195521"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:28 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 837A3121FE3;
	Mon, 25 Aug 2025 12:51:08 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uqTr2-00000005afh-24Xr;
	Mon, 25 Aug 2025 12:51:08 +0300
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
Subject: [PATCH v11 31/66] media: ccs: Remove ccs_get_crop_compose helper
Date: Mon, 25 Aug 2025 12:50:32 +0300
Message-ID: <20250825095107.1332313-32-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
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
 drivers/media/i2c/ccs/ccs-core.c | 164 ++++++++++++++-----------------
 1 file changed, 72 insertions(+), 92 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 5c53651f82df..0f0588e0c2da 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -2228,24 +2228,6 @@ static int ccs_get_format(struct v4l2_subdev *subdev,
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
@@ -2253,15 +2235,17 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
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
@@ -2275,13 +2259,15 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
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
@@ -2430,7 +2416,7 @@ static int ccs_set_format(struct v4l2_subdev *subdev,
 {
 	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
 	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
-	struct v4l2_rect *crops[CCS_PADS];
+	struct v4l2_rect *crop;
 
 	if (ssd == sensor->src && fmt->pad == CCS_PAD_META)
 		return ccs_get_format(subdev, sd_state, fmt);
@@ -2472,12 +2458,13 @@ static int ccs_set_format(struct v4l2_subdev *subdev,
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
@@ -2532,26 +2519,23 @@ static int scaling_goodness(struct v4l2_subdev *subdev, int w, int ask_w,
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
@@ -2564,8 +2548,8 @@ static void ccs_set_compose_binner(struct v4l2_subdev *subdev,
 		sensor->binning_horizontal = binh;
 	}
 
-	sel->r.width = (crops[CCS_PAD_SINK]->width / binh) & ~1;
-	sel->r.height = (crops[CCS_PAD_SINK]->height / binv) & ~1;
+	sel->r.width = (sink_crop->width / binh) & ~1;
+	sel->r.height = (sink_crop->height / binv) & ~1;
 }
 
 /*
@@ -2580,8 +2564,7 @@ static void ccs_set_compose_binner(struct v4l2_subdev *subdev,
 static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
 				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_selection *sel,
-				   struct v4l2_rect **crops,
-				   struct v4l2_rect *comp)
+				   const struct v4l2_rect *sink_crop)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(subdev);
 	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
@@ -2593,17 +2576,12 @@ static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
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
@@ -2634,14 +2612,12 @@ static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
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
 
@@ -2656,12 +2632,10 @@ static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
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
@@ -2673,18 +2647,13 @@ static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
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
@@ -2698,17 +2667,21 @@ static int ccs_set_compose(struct v4l2_subdev *subdev,
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
@@ -2769,9 +2742,13 @@ static int ccs_set_crop(struct v4l2_subdev *subdev,
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
@@ -2795,7 +2772,7 @@ static int ccs_set_crop(struct v4l2_subdev *subdev,
 	sel->r.left = min_t(int, sel->r.left, src_size.width - sel->r.width);
 	sel->r.top = min_t(int, sel->r.top, src_size.height - sel->r.height);
 
-	*crops[sel->pad] = sel->r;
+	*crop = sel->r;
 
 	if (ssd != sensor->pixel_array && sel->pad == CCS_PAD_SINK)
 		ccs_propagate(subdev, sd_state, sel->which, V4L2_SEL_TGT_CROP);
@@ -2820,14 +2797,17 @@ static int ccs_get_selection(struct v4l2_subdev *subdev,
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
@@ -2849,7 +2829,7 @@ static int ccs_get_selection(struct v4l2_subdev *subdev,
 		break;
 	case V4L2_SEL_TGT_CROP:
 	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
-		sel->r = *crops[sel->pad];
+		sel->r = *crop;
 		break;
 	case V4L2_SEL_TGT_COMPOSE:
 		sel->r = *comp;
-- 
2.47.2


