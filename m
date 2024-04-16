Return-Path: <linux-media+bounces-9585-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC378A74F6
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 21:36:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B2341F22A8F
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 19:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3300113B595;
	Tue, 16 Apr 2024 19:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WRLZho5n"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D689139CF1
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 19:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713296056; cv=none; b=r+7t6VA9DT74dCEAMPsERDGZ51dc3/OFuMegc+rrVT18QhCtQrDZ2BEx8BSivt5FCStfM9LJ7rFbzZQnx1tJ6zZvszoSLb79iP/4KpYo2cGFKrEJhNcvcSesjo/bMlnK+zsyrPzYw7v8Z9ZAVcafaS1VWaFeIQ2aK4gYlbHLJXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713296056; c=relaxed/simple;
	bh=0YhlZU5rZwEn++zG5a19jOJhj4hsfrnf/RYvZxvOo1E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ULfcBE/M53OYagpupyR4KhnCcTb77aML9H0mdmGQdnvTOBT7qYAdEFgnQ8dJnkOc42d8/qgVvDOIsa0UaSy1OIt5FCrfpIh7hKLTL9Am41kyu/2KA3OsINhy63rAtQZrN54+pJWnMFEqv9jvUJJNTa20PrnciaLCfA0r7PM95Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WRLZho5n; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713296055; x=1744832055;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0YhlZU5rZwEn++zG5a19jOJhj4hsfrnf/RYvZxvOo1E=;
  b=WRLZho5nQM9Wx5y43n9xR5kPrKk+eyTQnpJxvDxArTWj3ZJrBANllRg2
   vSgIRUMgy2TrnMQVfmpMi65Pkztk5zbMMONOxn1d5tikfghix87Wzhh/m
   hpF/7+CFrdcj/4LN9OvpoJ1rrqjjlseS2tzMWAjSzTzAxE0PGX6vtODmo
   AVgTidA3srziWNhXuaUuUr396Y+3Ou9UmN4hJ7JCw1ZYB20qSamiVQUJK
   RFyRwTfpgLTPLX7dOopCnddp1/yaHnjf/ioy0i72ZGgGMXXBqAg+AVwl6
   1gQizEkC+NfeN+zoeKkT6caJKIpvZROmnFXAlY3QroVJPfncqCL/SGG3F
   Q==;
X-CSE-ConnectionGUID: 3a75TmqfQA+UGbfoHRaorA==
X-CSE-MsgGUID: 421Te+QISMeRBwvzoRbQ4A==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8929872"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="8929872"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:34:15 -0700
X-CSE-ConnectionGUID: npnETbHnTJCl/k4n3pJD7A==
X-CSE-MsgGUID: flK5u1bHSquxpQ07t3r+SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="22380249"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:34:12 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id DD5231204F9;
	Tue, 16 Apr 2024 22:34:08 +0300 (EEST)
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
Subject: [PATCH v9 34/46] media: ccs: Compute scaling configuration from sub-device state
Date: Tue, 16 Apr 2024 22:33:07 +0300
Message-Id: <20240416193319.778192-35-sakari.ailus@linux.intel.com>
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

Compute scaling configuration from sub-device state instead of storing it
to the driver's device context struct.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 59 ++++++++++++++++++++++----------
 drivers/media/i2c/ccs/ccs.h      |  3 --
 2 files changed, 40 insertions(+), 22 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 08e719d611fb..541faa7d84a6 100644
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
@@ -1186,7 +1218,7 @@ static int ccs_get_mbus_formats(struct ccs_sensor *sensor)
 	/* Figure out which BPP values can be used with which formats. */
 	pll->binning_horizontal = 1;
 	pll->binning_vertical = 1;
-	pll->scale_m = sensor->scale_m;
+	pll->scale_m = CCS_LIM(sensor, SCALER_N_MIN);
 
 	for (i = 0; i < ARRAY_SIZE(ccs_csi_data_formats); i++) {
 		sensor->compressed_min_bpp =
@@ -1935,11 +1967,15 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
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
@@ -2255,7 +2291,6 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
 			  struct v4l2_subdev_state *sd_state, int which,
 			  int target)
 {
-	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
 	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
 	struct v4l2_rect *comp, *crop;
 	struct v4l2_mbus_framefmt *fmt;
@@ -2268,13 +2303,6 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
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
@@ -2653,11 +2681,6 @@ static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
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
@@ -3763,8 +3786,6 @@ static int ccs_probe(struct i2c_client *client)
 	sensor->pixel_array = &sensor->ssds[sensor->ssds_used];
 	sensor->ssds_used++;
 
-	sensor->scale_m = CCS_LIM(sensor, SCALER_N_MIN);
-
 	/* prepare PLL configuration input values */
 	sensor->pll.bus_type = CCS_PLL_BUS_TYPE_CSI2_DPHY;
 	sensor->pll.csi2.lanes = sensor->hwcfg.lanes;
diff --git a/drivers/media/i2c/ccs/ccs.h b/drivers/media/i2c/ccs/ccs.h
index aadbd4302607..1c30fa85bed6 100644
--- a/drivers/media/i2c/ccs/ccs.h
+++ b/drivers/media/i2c/ccs/ccs.h
@@ -237,9 +237,6 @@ struct ccs_sensor {
 	u32 embedded_mbus_code;
 	u8 emb_data_ctrl;
 
-	u8 scale_m;
-	u8 scaling_mode;
-
 	u8 frame_skip;
 	u16 embedded_start; /* embedded data start line */
 	u16 embedded_end;
-- 
2.39.2


