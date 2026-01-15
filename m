Return-Path: <linux-media+bounces-50783-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7961FD24978
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 13:46:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 75E3B301996A
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 12:46:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57D02399014;
	Thu, 15 Jan 2026 12:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bwPr+1Ow"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970A839A80C
	for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 12:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768481181; cv=none; b=o42YsXEvoBiM4IvjoEXiDmPUkuotsh4OVYig1o2DTDGOc5DoPNr/FeaDE+85hfSDs/3kj9X5Qe2PPEDk7CONJIhxX1kdKA0biA+EPoMHWZyB5ujriPg/CDn5h1k4Ur9RihMXMW6bfAq70lEy/YzjdY6el/ZrRc35YOOtMQsD86Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768481181; c=relaxed/simple;
	bh=MRUGISS8FOv1UwrxjGD68RYmDXxyjqrpOecVa3SVh6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VB9Yc1Tk3Z4GFAzDOHrwxRtc4iAqKeLKcFecC+ckSljo6danntorhYm56WQfP1J2rW2TYZ3tpVEW15Og0LJ4BF6WeRV2vGhktMxqdWawiNH57pgyHYCrzio3ECj9EyLbFteWf1XRIhUf3A428G3t3LIi013YfVSawIhFTZbjNFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bwPr+1Ow; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768481179; x=1800017179;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MRUGISS8FOv1UwrxjGD68RYmDXxyjqrpOecVa3SVh6E=;
  b=bwPr+1OwP29Z+9Me5itvOdVMFkHCvBqa/i8cTCOmqRPwDKmp0LiMf9sl
   4im9WUDJ5x6X8nWpAMGqQpq1jeW1/mePFtahkXTAIKf1/pfTOcpu07uQh
   +pigMOfiYHYpC8ou4wp/0gM02Tcxoxz8RHT/VQBwk5bsfADfbnt4DHf+s
   mBqpFBXevAZJk1YBEffg6KpQBVsULeuNvVLGfsAdNBfsUzmIbSeRrZ7XE
   CZR4R1bcnfgcxiQtYzwnB2KCFif0SvL5i6pdQsInxtldWk+xEE1ezfZu8
   pLmT8M/BhRfWnI854qDWD1BmbxXO0ZqH/EBp94KwH9WKsFimusjOfUIei
   Q==;
X-CSE-ConnectionGUID: RWymfLEYSg6wXIKfJ+P9Cw==
X-CSE-MsgGUID: LMCzkQQZTrWKtK5vklWHlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="80428300"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="80428300"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 04:46:17 -0800
X-CSE-ConnectionGUID: 1E1/+tnVS0alF5saQODNMg==
X-CSE-MsgGUID: MxD5Li+CT5SCDebLEoUjnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="204980444"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.213])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 04:46:15 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id F19E7121D86;
	Thu, 15 Jan 2026 14:46:12 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vgMjs-00000000UMK-3VzW;
	Thu, 15 Jan 2026 14:46:12 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	laurent.pinchart@ideasonboard.com,
	jai.luthra@ideasonboard.com
Subject: [PATCH 4/7] media: ccs: Compute scaling configuration from sub-device state
Date: Thu, 15 Jan 2026 14:46:09 +0200
Message-ID: <20260115124612.116663-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260115124612.116663-1-sakari.ailus@linux.intel.com>
References: <20260115124612.116663-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Compute scaling configuration from sub-device state instead of storing it
to the driver's device context struct.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 59 ++++++++++++++++++++++----------
 drivers/media/i2c/ccs/ccs.h      |  3 --
 2 files changed, 40 insertions(+), 22 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 63d590da3c34..e60a8aff5454 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -531,19 +531,51 @@ ccs_get_binning(struct ccs_sensor *sensor, u8 *binning_mode, u8 *binh, u8 *binv)
 	*binv = sink_crop->height / sink_comp->height;
 }
 
+static void ccs_get_scaling(struct ccs_sensor *sensor, u8 *scaling_mode,
+			    u8 *scale_m)
+{
+	struct v4l2_subdev_state *state =
+		v4l2_subdev_get_locked_active_state(&sensor->scaler->sd);
+	const struct v4l2_rect *sink_crop =
+		v4l2_subdev_state_get_crop(state, CCS_PAD_SINK,
+					   CCS_STREAM_PIXEL);
+	const struct v4l2_rect *sink_comp =
+		v4l2_subdev_state_get_compose(state, CCS_PAD_SINK,
+					      CCS_STREAM_PIXEL);
+
+	*scale_m = sink_crop->width * CCS_LIM(sensor, SCALER_N_MIN) /
+		sink_comp->width;
+
+	if (!scaling_mode)
+		return;
+
+	if (sink_crop->width == sink_comp->width)
+		*scaling_mode = CCS_SCALING_MODE_NO_SCALING;
+	else if (sink_crop->height == sink_comp->height)
+		*scaling_mode = CCS_SCALING_MODE_HORIZONTAL;
+	else
+		*scaling_mode = SMIAPP_SCALING_MODE_BOTH;
+}
+
 static int ccs_pll_update(struct ccs_sensor *sensor)
 {
 	struct ccs_pll *pll = &sensor->pll;
 	u8 binh, binv;
+	u8 scale_m;
 	int rval;
 
 	ccs_get_binning(sensor, NULL, &binh, &binv);
 
+	if (sensor->scaler)
+		ccs_get_scaling(sensor, NULL, &scale_m);
+	else
+		scale_m = CCS_LIM(sensor, SCALER_N_MIN);
+
 	pll->binning_horizontal = binh;
 	pll->binning_vertical = binv;
 	pll->link_freq =
 		sensor->link_freq->qmenu_int[sensor->link_freq->val];
-	pll->scale_m = sensor->scale_m;
+	pll->scale_m = scale_m;
 	pll->bits_per_pixel = sensor->csi_format->compressed;
 
 	rval = ccs_pll_try(sensor, pll);
@@ -1184,7 +1216,7 @@ static int ccs_get_mbus_formats(struct ccs_sensor *sensor)
 	/* Figure out which BPP values can be used with which formats. */
 	pll->binning_horizontal = 1;
 	pll->binning_vertical = 1;
-	pll->scale_m = sensor->scale_m;
+	pll->scale_m = CCS_LIM(sensor, SCALER_N_MIN);
 
 	for (i = 0; i < ARRAY_SIZE(ccs_csi_data_formats); i++) {
 		sensor->compressed_min_bpp =
@@ -1929,11 +1961,15 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
 	/* Scaling */
 	if (CCS_LIM(sensor, SCALING_CAPABILITY)
 	    != CCS_SCALING_CAPABILITY_NONE) {
-		rval = ccs_write(sensor, SCALING_MODE, sensor->scaling_mode);
+		u8 scaling_mode, scale_m;
+
+		ccs_get_scaling(sensor, &scaling_mode, &scale_m);
+
+		rval = ccs_write(sensor, SCALING_MODE, scaling_mode);
 		if (rval < 0)
 			goto err_pm_put;
 
-		rval = ccs_write(sensor, SCALE_M, sensor->scale_m);
+		rval = ccs_write(sensor, SCALE_M, scale_m);
 		if (rval < 0)
 			goto err_pm_put;
 	}
@@ -2124,7 +2160,6 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
 			  struct v4l2_subdev_state *sd_state, int which,
 			  int target)
 {
-	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
 	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
 	struct v4l2_rect *comp, *crop;
 	struct v4l2_mbus_framefmt *fmt;
@@ -2137,13 +2172,6 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
 						  CCS_STREAM_PIXEL);
 		comp->width = crop->width;
 		comp->height = crop->height;
-		if (which == V4L2_SUBDEV_FORMAT_ACTIVE) {
-			if (ssd == sensor->scaler) {
-				sensor->scale_m = CCS_LIM(sensor, SCALER_N_MIN);
-				sensor->scaling_mode =
-					CCS_SCALING_MODE_NO_SCALING;
-			}
-		}
 		fallthrough;
 	case V4L2_SEL_TGT_COMPOSE:
 		crop = v4l2_subdev_state_get_crop(sd_state, CCS_PAD_SRC,
@@ -2435,11 +2463,6 @@ static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
 				 * CCS_LIM(sensor, SCALER_N_MIN)) & ~1;
 	else
 		sel->r.height = sink_crop->height;
-
-	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
-		sensor->scale_m = scale_m;
-		sensor->scaling_mode = mode;
-	}
 }
 /* We're only called on source pads. This function sets scaling. */
 static int ccs_set_compose(struct v4l2_subdev *subdev,
@@ -3451,8 +3474,6 @@ static int ccs_probe(struct i2c_client *client)
 	sensor->pixel_array = &sensor->ssds[sensor->ssds_used];
 	sensor->ssds_used++;
 
-	sensor->scale_m = CCS_LIM(sensor, SCALER_N_MIN);
-
 	/* prepare PLL configuration input values */
 	switch (sensor->hwcfg.csi_signalling_mode) {
 	case CCS_CSI_SIGNALING_MODE_CSI_2_CPHY:
diff --git a/drivers/media/i2c/ccs/ccs.h b/drivers/media/i2c/ccs/ccs.h
index 62a4900686f8..51915321ef44 100644
--- a/drivers/media/i2c/ccs/ccs.h
+++ b/drivers/media/i2c/ccs/ccs.h
@@ -229,9 +229,6 @@ struct ccs_sensor {
 	int default_pixel_order;
 	struct ccs_data_container sdata, mdata;
 
-	u8 scale_m;
-	u8 scaling_mode;
-
 	u8 frame_skip;
 	u16 embedded_start; /* embedded data start line */
 	u16 embedded_end;
-- 
2.47.3


