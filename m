Return-Path: <linux-media+bounces-35297-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 12017AE04D6
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 14:03:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 119311670C5
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 12:02:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53FD22571DC;
	Thu, 19 Jun 2025 11:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Igaod+qV"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B3D2561AF
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 11:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334353; cv=none; b=o0hXubUOxVvF8mdQzXK8vLfU0WcYrU9bbt3lMcE87MoE/vTA4Zw6B/mKrgyWKBocPSeAdXLfUbiIcsY9vdYIQQQjOUl7IO1DvijR6etGgTZ/L+mr/o1isjJvPWJpgWIGaZDo/SNX7W+IxPlOWfkK8MZthiSA66Nqwr6ccuZyc3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334353; c=relaxed/simple;
	bh=QV5VIQ2BQMpkIUxrc7xvZVhD3jKa+ZfnZyq6k2YrCAg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OYk/hKe03hGa/FPcI3J7rHNp30QHul21hn+kqGcjG3g4UIBdc+Pn5UnKtJPXGwpSYqd0ltFmOxVovD1oDWdTemPiBCD5uuYAnVF4vOhsH2KSlWj9JmkBm7udw2akJwbbeLsJI0AwV5PBskaURKCsCQzKAq6c0bPXHgw7ul3dlO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Igaod+qV; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750334352; x=1781870352;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QV5VIQ2BQMpkIUxrc7xvZVhD3jKa+ZfnZyq6k2YrCAg=;
  b=Igaod+qVWI46wu34neIe1QuDr47kyOOhhE1mvV55eMXFWgd1Syw9bXwo
   yK5gItWx3DUTcNWdLhSHLGjTcWnQmnGgefw3PQO89b0k4J2DxnLptF9/U
   r3Wn3KFQD0mWVJ8LG0oNORTjBocd+e0sw//kxxhWHtQUw+x5o00YIvcZq
   ZHoc3zaK7ZIuKu1TxraaVGPGkv2IK5mfpacilivM6LugqjTbeitMzO9Ey
   odmArvGOAA0K4na/+TbP3N+2lE8yq7hxne/FlHSytCvZ9IX+6gM3R+sAb
   z7YTU14LxNvL283za/eS5EbSEc0xMQ3eVQRdXAXHBmt/2hO1xIoc+qyzY
   A==;
X-CSE-ConnectionGUID: 5e72x6HZQFmBha21P0OqNw==
X-CSE-MsgGUID: DmN07iO4RtiFzoHgnG7zGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="56386471"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="56386471"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:05 -0700
X-CSE-ConnectionGUID: 0rN04ZZaRCmZ9k3DJqNatw==
X-CSE-MsgGUID: OCjZOJu2Qp+K710TPuxdYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="154908311"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:58:57 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 0D83812214D;
	Thu, 19 Jun 2025 14:58:37 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSDuf-008AJp-04;
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
Subject: [PATCH v10 28/64] media: ccs: Remove ccs_get_crop_compose helper
Date: Thu, 19 Jun 2025 14:58:00 +0300
Message-Id: <20250619115836.1946016-29-sakari.ailus@linux.intel.com>
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
2.39.5


