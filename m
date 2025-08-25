Return-Path: <linux-media+bounces-40967-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE1FB33BD9
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 11:55:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 693483B3880
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EEF42D6E6B;
	Mon, 25 Aug 2025 09:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XOljApja"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672A02D7DE2
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 09:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115509; cv=none; b=I2NKpexW5cl8hPuiV+PmS9LYGJ8nulY2wMfH3+niH/hkleD07TKTKq8IBgOmAht9mT+yVmom4YbesEuGhaoS5JtXjQGD6W9gDT0kEowsuzIxY+gVLmLoSTf4FkMs5VHRRb+tZjhM0BIrkZOZql0/s5zWlWequU5nHahG7Tix3OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115509; c=relaxed/simple;
	bh=IsKRVxl1m3QMX/uRX+dUw8fS+VzZGIm7hZlmf9qWc2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ewyONT3wpMDcuOPesdjLd9tn+EKJXDaT4d1+ImZvDOcsHvBQw2mu6Syfb6nJGiKHHce1yZ+9JFV7o+RSVxpJTY0vZT6VgDhU7XpVbwg0lxgkkfbcyMFhStvcBrlOe+60TAHjB8fFp8twMOU07XR+8X6Si5MJ1gMIxKuPYXWQru0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XOljApja; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756115507; x=1787651507;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IsKRVxl1m3QMX/uRX+dUw8fS+VzZGIm7hZlmf9qWc2E=;
  b=XOljApja70GgdjpSGOrp3OKi2Nh91XgwNcCtdZz/9/0Po/PS6QjfAEjo
   K9A+xlewOzLReM8Bg4DWk3JAqdP369YG9neCRbAwI44N1jSdku+0kEWAi
   B7uAXyatH1pb00eNBnGYk+Zkqv04LhzBqVJakpd8Mj8Iu1tGDniwLj+EC
   Sn4wtX7hWq44ASGYmOf3Ird7N+TGyJHyGrTS7C/X+yC04l0//ZiwTVefX
   nGc/N5rigBRSsQ2jXEbRhHdBdcYpB9oEX9zTzMD42tenPNZ8ISGd0C2+q
   ijg6lOgWdAnu8XFIEhx+KvBhPAiLcLUVwq+kEcYaSO7/OIvx2+8/rcbFS
   A==;
X-CSE-ConnectionGUID: 5yzaCxZATMiRY0m9hXkqBg==
X-CSE-MsgGUID: CtUcqb2yQm2yJ+UWFTIE8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="69696115"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="69696115"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:37 -0700
X-CSE-ConnectionGUID: 2dIk6SjvTzqOXKHtecmrmw==
X-CSE-MsgGUID: IcHzqGJVRV2645vPeU0CSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="200195530"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:29 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9118B121FE9;
	Mon, 25 Aug 2025 12:51:08 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uqTr2-00000005afw-2JB3;
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
Subject: [PATCH v11 34/66] media: ccs: Compute scaling configuration from sub-device state
Date: Mon, 25 Aug 2025 12:50:35 +0300
Message-ID: <20250825095107.1332313-35-sakari.ailus@linux.intel.com>
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

Compute scaling configuration from sub-device state instead of storing it
to the driver's device context struct.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 59 ++++++++++++++++++++++----------
 drivers/media/i2c/ccs/ccs.h      |  3 --
 2 files changed, 40 insertions(+), 22 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 1eb63956ef1f..7b451684e1ed 100644
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
@@ -1203,7 +1235,7 @@ static int ccs_get_mbus_formats(struct ccs_sensor *sensor)
 	/* Figure out which BPP values can be used with which formats. */
 	pll->binning_horizontal = 1;
 	pll->binning_vertical = 1;
-	pll->scale_m = sensor->scale_m;
+	pll->scale_m = CCS_LIM(sensor, SCALER_N_MIN);
 
 	for (i = 0; i < ARRAY_SIZE(ccs_csi_data_formats); i++) {
 		sensor->compressed_min_bpp =
@@ -1948,11 +1980,15 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
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
@@ -2261,7 +2297,6 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
 			  struct v4l2_subdev_state *sd_state, int which,
 			  int target)
 {
-	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
 	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
 	struct v4l2_rect *comp, *crop;
 	struct v4l2_mbus_framefmt *fmt;
@@ -2274,13 +2309,6 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
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
@@ -2665,11 +2693,6 @@ static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
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
@@ -3784,8 +3807,6 @@ static int ccs_probe(struct i2c_client *client)
 	sensor->pixel_array = &sensor->ssds[sensor->ssds_used];
 	sensor->ssds_used++;
 
-	sensor->scale_m = CCS_LIM(sensor, SCALER_N_MIN);
-
 	/* prepare PLL configuration input values */
 	sensor->pll.bus_type = CCS_PLL_BUS_TYPE_CSI2_DPHY;
 	sensor->pll.csi2.lanes = sensor->hwcfg.lanes;
diff --git a/drivers/media/i2c/ccs/ccs.h b/drivers/media/i2c/ccs/ccs.h
index 9671883e4885..3fddbe267409 100644
--- a/drivers/media/i2c/ccs/ccs.h
+++ b/drivers/media/i2c/ccs/ccs.h
@@ -238,9 +238,6 @@ struct ccs_sensor {
 
 	u8 emb_data_ctrl;
 
-	u8 scale_m;
-	u8 scaling_mode;
-
 	u8 frame_skip;
 	u16 embedded_start; /* embedded data start line */
 	u16 embedded_end;
-- 
2.47.2


