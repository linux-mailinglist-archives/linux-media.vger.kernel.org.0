Return-Path: <linux-media+bounces-40965-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E13EB33BF4
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 11:56:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA8D01886ECE
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:55:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ED922DCC06;
	Mon, 25 Aug 2025 09:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PCIBcdTo"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F412DC320
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 09:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115509; cv=none; b=gSLbsjp8tkCVlPvZ5KtCp55+GHiBugXSiOyKeC16MCv1xeonDO6qw14FdtS4xJASz0tFqZ7fsKVxi0h7Bwa3OU0+iAV5oSB5Pba/CYtT8QsSHZ551QaHD1r3cV6Qtqvyf/3nJoTWdxFSjCJPvEycc/UfTRRu08hA30zsyeD1tRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115509; c=relaxed/simple;
	bh=hCWyZCZhkdYl0i27EIlj5gUC0Z40yBYA3js+FgJl110=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ldDY7iuWLWfo/QRxUxBPYL/m3Xm99JgIwtpyHhFGxarSNJU8vM1G/b+92dMEZsGh0W/FU5WVl4i+gWMWdkb/ZOWMZDkeVu2PMbHFSJ2V5X3GfiaFobyTqejgPrL4ucvTIaPoSDwAdX3jeAn5osJrZo7kamLqhQ/dIbR+GsH+TU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PCIBcdTo; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756115508; x=1787651508;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hCWyZCZhkdYl0i27EIlj5gUC0Z40yBYA3js+FgJl110=;
  b=PCIBcdToWiClXHBCAxzE2xE4BKxL26zw81hQpgB2JUgRifkFXr99vz2R
   cXl/S9zcfiGOZKRwO/6jZ7WeEeWOtPNLnpFvVbryoRHVojR0AkRl86u/S
   m3B3z+Bgd9v8CiN8/ewTkuDMoH4N8T/P9CPdjzXXCMlpCAUQIj2fN9vJ0
   4MFs0cvqe4/zKQ7MmS3C+0G22BCH2aamlTj+QrNjo3jLRcDcHCb3L0yrW
   /v+A2xX+t1KEI2ONENdIBk4EVfsgWkc16wYyPl5KVEQpig23D6/9UrCHd
   rJXnL/gVopsGnFRdNTFEmc4HdphLLLyfvuv5qbLA/jGDbCseAtdnuSSvL
   w==;
X-CSE-ConnectionGUID: k3RkqzErTvGiMCrOxC8oaw==
X-CSE-MsgGUID: bztKrFRgSYCV+wmComC5jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="69696129"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="69696129"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:37 -0700
X-CSE-ConnectionGUID: lq98tOJFQEihqx1pi/JnwA==
X-CSE-MsgGUID: N4mmGA6sQ4+Tc+mJmIetsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="200195537"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:29 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 8C2A6121FE6;
	Mon, 25 Aug 2025 12:51:08 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uqTr2-00000005afs-2DZG;
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
Subject: [PATCH v11 33/66] media: ccs: Compute binning configuration from sub-device state
Date: Mon, 25 Aug 2025 12:50:34 +0300
Message-ID: <20250825095107.1332313-34-sakari.ailus@linux.intel.com>
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

Calculate binning configuration from sub-device state so the state related
configuration can be removed from the driver's device context struct.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 56 +++++++++++++++++++-------------
 drivers/media/i2c/ccs/ccs.h      |  3 --
 2 files changed, 33 insertions(+), 26 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 2d2ae568739b..1eb63956ef1f 100644
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
@@ -1258,8 +1281,11 @@ static void ccs_update_blanking(struct ccs_sensor *sensor,
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
@@ -1827,7 +1853,7 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
 		v4l2_subdev_state_get_crop(src_state, CCS_PAD_SRC,
 					   CCS_STREAM_PIXEL);
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
-	unsigned int binning_mode;
+	u8 binning_mode, binh, binv;
 	int rval;
 
 	if (pad != CCS_PAD_SRC)
@@ -1849,19 +1875,12 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
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
@@ -2260,9 +2279,6 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
 				sensor->scale_m = CCS_LIM(sensor, SCALER_N_MIN);
 				sensor->scaling_mode =
 					CCS_SCALING_MODE_NO_SCALING;
-			} else if (ssd == sensor->binner) {
-				sensor->binning_horizontal = 1;
-				sensor->binning_vertical = 1;
 			}
 		}
 		fallthrough;
@@ -2542,10 +2558,6 @@ static void ccs_set_compose_binner(struct v4l2_subdev *subdev,
 			best = this;
 		}
 	}
-	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
-		sensor->binning_vertical = binv;
-		sensor->binning_horizontal = binh;
-	}
 
 	sel->r.width = (sink_crop->width / binh) & ~1;
 	sel->r.height = (sink_crop->height / binv) & ~1;
@@ -3736,8 +3748,6 @@ static int ccs_probe(struct i2c_client *client)
 				sensor->binning_subtypes[i].vertical);
 		}
 	}
-	sensor->binning_horizontal = 1;
-	sensor->binning_vertical = 1;
 
 	if (device_create_file(&client->dev, &dev_attr_ident) != 0) {
 		dev_err(&client->dev, "sysfs ident entry creation failed\n");
diff --git a/drivers/media/i2c/ccs/ccs.h b/drivers/media/i2c/ccs/ccs.h
index 338209950fcb..9671883e4885 100644
--- a/drivers/media/i2c/ccs/ccs.h
+++ b/drivers/media/i2c/ccs/ccs.h
@@ -238,9 +238,6 @@ struct ccs_sensor {
 
 	u8 emb_data_ctrl;
 
-	u8 binning_horizontal;
-	u8 binning_vertical;
-
 	u8 scale_m;
 	u8 scaling_mode;
 
-- 
2.47.2


