Return-Path: <linux-media+bounces-50785-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4F3D2497F
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 13:46:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 208323021E6E
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 12:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D194A39B4A8;
	Thu, 15 Jan 2026 12:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XolrkT++"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7C439A805
	for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 12:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768481185; cv=none; b=uvvb1SVm/eiNXIXhWhdFwRWLjGXcXiplXpVZMgpCyVjrmveIaKdC2tDPm521w/QzSRdNNGaxhECx8s+Ov8afJwj60zkk747Y12XlaBhMNMmtPh6NQoB+gqP0rYVbph4MeJ7DiwSpDP8Ts6Cag5C3LxHJjwRdF7NWOzjTqtiMJtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768481185; c=relaxed/simple;
	bh=niHIkNizw61ZsG2UECrabItqv38qEGz+yGpjn2lQVMs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FgPwd+Mor9dqVTs6lDL/mWMIIsu2zMBHxO3+vMkBZompZLTxmxLHT0foVvXEJwgzj6LOzQAV0NndREdjTHtOfyfIUylXsqlHwoYog3N3b60RwF6IQMyZJWNr9X1k7SHWJFaE1bqivh6GypI8+cCbYWEIXH68YmAHvZjh6BlK2Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XolrkT++; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768481182; x=1800017182;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=niHIkNizw61ZsG2UECrabItqv38qEGz+yGpjn2lQVMs=;
  b=XolrkT++JbZ3ScwLRlJwIxHCgrijO6UMMTN7iQtfgUPJqK/Hf4i3x2UR
   86B6u90FMI+h2BumJpHmGwGP9cziojKal3z8fd+jDGYx2raz4hPKC2uhT
   c5uWuVtzADBduMIUGiB7WYQ+b/0HQlKoGbGGo636tbt4ZnuZABbe9slqN
   bB3NJU22uDa69g4HycFp9xTMvy0fx6xvjW2/icJp6SzP/CFNadmy64dCg
   qj+TPXRdLqfj3VVZypt9JyOs2xhzAtqSTxBf7eh5qZaP6ug0CRuS8SkWx
   ImRqQjA1MqUYPp10o2q8n7urDkaSDo1MFWqkTD3gJb4DBIc0OETD7LiFf
   Q==;
X-CSE-ConnectionGUID: jTlrf49YSduvs4jc3txSaA==
X-CSE-MsgGUID: crFW/k3MTBaY/ICGTBe2EA==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="80428309"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="80428309"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 04:46:18 -0800
X-CSE-ConnectionGUID: 6A8D1QRJRba2A2h7rnBG5g==
X-CSE-MsgGUID: WY1xhjx/RHq+1dSGu1u8nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="204980448"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.213])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 04:46:15 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id EE9C3121D85;
	Thu, 15 Jan 2026 14:46:12 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vgMjs-00000000UMG-3SOZ;
	Thu, 15 Jan 2026 14:46:12 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	laurent.pinchart@ideasonboard.com,
	jai.luthra@ideasonboard.com
Subject: [PATCH 3/7] media: ccs: Compute binning configuration from sub-device state
Date: Thu, 15 Jan 2026 14:46:08 +0200
Message-ID: <20260115124612.116663-4-sakari.ailus@linux.intel.com>
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

Calculate binning configuration from sub-device state so the state related
configuration can be removed from the driver's device context struct.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 56 +++++++++++++++++++-------------
 drivers/media/i2c/ccs/ccs.h      |  3 --
 2 files changed, 33 insertions(+), 26 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index b02bd2700f14..63d590da3c34 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -511,13 +511,36 @@ static int ccs_pll_try(struct ccs_sensor *sensor, struct ccs_pll *pll)
 	return ccs_pll_calculate(&client->dev, &lim, pll);
 }
 
+static void
+ccs_get_binning(struct ccs_sensor *sensor, u8 *binning_mode, u8 *binh, u8 *binv)
+{
+	struct v4l2_subdev_state *state =
+		v4l2_subdev_get_locked_active_state(&sensor->binner->sd);
+	const struct v4l2_rect *sink_crop =
+		v4l2_subdev_state_get_crop(state, CCS_PAD_SINK,
+					   CCS_STREAM_PIXEL);
+	const struct v4l2_rect *sink_comp =
+		v4l2_subdev_state_get_compose(state, CCS_PAD_SINK,
+					      CCS_STREAM_PIXEL);
+
+	if (binning_mode)
+		*binning_mode =	sink_crop->width == sink_comp->width &&
+				sink_crop->height == sink_comp->height ? 0 : 1;
+
+	*binh = sink_crop->width / sink_comp->width;
+	*binv = sink_crop->height / sink_comp->height;
+}
+
 static int ccs_pll_update(struct ccs_sensor *sensor)
 {
 	struct ccs_pll *pll = &sensor->pll;
+	u8 binh, binv;
 	int rval;
 
-	pll->binning_horizontal = sensor->binning_horizontal;
-	pll->binning_vertical = sensor->binning_vertical;
+	ccs_get_binning(sensor, NULL, &binh, &binv);
+
+	pll->binning_horizontal = binh;
+	pll->binning_vertical = binv;
 	pll->link_freq =
 		sensor->link_freq->qmenu_int[sensor->link_freq->val];
 	pll->scale_m = sensor->scale_m;
@@ -1239,8 +1262,11 @@ static void ccs_update_blanking(struct ccs_sensor *sensor,
 	struct v4l2_ctrl *hblank = sensor->hblank;
 	u16 min_fll, max_fll, min_llp, max_llp, min_lbp;
 	int min, max;
+	u8 binh, binv;
+
+	ccs_get_binning(sensor, NULL, &binh, &binv);
 
-	if (sensor->binning_vertical > 1 || sensor->binning_horizontal > 1) {
+	if (binv > 1 || binh > 1) {
 		min_fll = CCS_LIM(sensor, MIN_FRAME_LENGTH_LINES_BIN);
 		max_fll = CCS_LIM(sensor, MAX_FRAME_LENGTH_LINES_BIN);
 		min_llp = CCS_LIM(sensor, MIN_LINE_LENGTH_PCK_BIN);
@@ -1808,7 +1834,7 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
 		v4l2_subdev_state_get_crop(src_state, CCS_PAD_SRC,
 					   CCS_STREAM_PIXEL);
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
-	unsigned int binning_mode;
+	u8 binning_mode, binh, binv;
 	int rval;
 
 	if (pad != CCS_PAD_SRC)
@@ -1830,19 +1856,12 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
 		goto err_pm_put;
 
 	/* Binning configuration */
-	if (sensor->binning_horizontal == 1 &&
-	    sensor->binning_vertical == 1) {
-		binning_mode = 0;
-	} else {
-		u8 binning_type =
-			(sensor->binning_horizontal << 4)
-			| sensor->binning_vertical;
+	ccs_get_binning(sensor,	&binning_mode, &binh, &binv);
 
-		rval = ccs_write(sensor, BINNING_TYPE, binning_type);
+	if (binning_mode) {
+		rval = ccs_write(sensor, BINNING_TYPE, (binh << 4) | binv);
 		if (rval < 0)
 			goto err_pm_put;
-
-		binning_mode = 1;
 	}
 	rval = ccs_write(sensor, BINNING_MODE, binning_mode);
 	if (rval < 0)
@@ -2123,9 +2142,6 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
 				sensor->scale_m = CCS_LIM(sensor, SCALER_N_MIN);
 				sensor->scaling_mode =
 					CCS_SCALING_MODE_NO_SCALING;
-			} else if (ssd == sensor->binner) {
-				sensor->binning_horizontal = 1;
-				sensor->binning_vertical = 1;
 			}
 		}
 		fallthrough;
@@ -2311,10 +2327,6 @@ static void ccs_set_compose_binner(struct v4l2_subdev *subdev,
 			best = this;
 		}
 	}
-	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
-		sensor->binning_vertical = binv;
-		sensor->binning_horizontal = binh;
-	}
 
 	sel->r.width = (sink_crop->width / binh) & ~1;
 	sel->r.height = (sink_crop->height / binv) & ~1;
@@ -3403,8 +3415,6 @@ static int ccs_probe(struct i2c_client *client)
 				sensor->binning_subtypes[i].vertical);
 		}
 	}
-	sensor->binning_horizontal = 1;
-	sensor->binning_vertical = 1;
 
 	if (device_create_file(&client->dev, &dev_attr_ident) != 0) {
 		dev_err(&client->dev, "sysfs ident entry creation failed\n");
diff --git a/drivers/media/i2c/ccs/ccs.h b/drivers/media/i2c/ccs/ccs.h
index e885063c89f0..62a4900686f8 100644
--- a/drivers/media/i2c/ccs/ccs.h
+++ b/drivers/media/i2c/ccs/ccs.h
@@ -229,9 +229,6 @@ struct ccs_sensor {
 	int default_pixel_order;
 	struct ccs_data_container sdata, mdata;
 
-	u8 binning_horizontal;
-	u8 binning_vertical;
-
 	u8 scale_m;
 	u8 scaling_mode;
 
-- 
2.47.3


