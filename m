Return-Path: <linux-media+bounces-35299-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AA4AE04D9
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 14:03:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBF6316847C
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 12:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E76C8257AC1;
	Thu, 19 Jun 2025 11:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kOCvTP6O"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97682571B6
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 11:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334355; cv=none; b=dWFt/w9lPzqD5cqtvg5RPwhpJBruJ9WnMERLJc3WhmAeOv3aU+omeOiiz4AZILyZGAUkUtjlJse5C2U4L0ZL2A9RvqZt3pD6ZpNtyUkJBii3+yCASQ65fQ6shNND3nh/l+sqPtlmfp4cgzXGH0ujDm1gzU8kY7Xx845FOAyG6vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334355; c=relaxed/simple;
	bh=WkpEZHg4NaXKOXNE6dRq+y0fCPoqcOcy3byOFkSIL6I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=vGbmMKyT2wG15Bddbu8nYoi/HGRg5k449XXA4DoTI8L92xOOnvbXJ2l5YE11jTOZgepPR3K3PNuXY+8sH+yo4I95eAcqfK32zbOHp0xZoAY7f2DpyEdG2cs83X90FDrsWzpV74SJOCbkhsYP+hpOlhsDIMSe9LVUcIaA1Nkpazo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kOCvTP6O; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750334354; x=1781870354;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WkpEZHg4NaXKOXNE6dRq+y0fCPoqcOcy3byOFkSIL6I=;
  b=kOCvTP6OO+3FJA6nnZkO5z1NPVtcWUWpSO78VuLkdSu9DI8u3561Ww8b
   WIzGglqHNtyKMjEmLvPTw9zJP52FReAgN8Ec7MNY8k7aqfQisNOGQLAfd
   opfLYrD6DZhQbR3AynFBhM7ylvGcCuatHkSC4dHdYRR/5KkOyWrT2xm0l
   4UXFb5sD8LToXIu39iAns6VKmUB1QZKemJNtcW7HgBWMGTz+ZFAqb6eVx
   jmQkNjovsoywV1ajRGZ20QfC1mthKEsxQLenuxLuSZJ5GnkEWLS0lYWn3
   zBjJhDuX3utc1ivlo3EZlU4TPEV/qLXOD2I4Xq9TWaH+ak3Ia1VVkY3Ih
   g==;
X-CSE-ConnectionGUID: A7sL00nJSdSiSg2Zh2om8A==
X-CSE-MsgGUID: Qv66a5StQ4yzVtLTXOrv8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="56386499"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="56386499"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:05 -0700
X-CSE-ConnectionGUID: cFANBX1NTSG9OVVDLlBeQA==
X-CSE-MsgGUID: P8QFF+uFQN6QDJp/jqRFcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="154908327"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:58:58 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 1780B122166;
	Thu, 19 Jun 2025 14:58:37 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSDuf-008AK4-0C;
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
Subject: [PATCH v10 31/64] media: ccs: Compute scaling configuration from sub-device state
Date: Thu, 19 Jun 2025 14:58:03 +0300
Message-Id: <20250619115836.1946016-32-sakari.ailus@linux.intel.com>
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
2.39.5


