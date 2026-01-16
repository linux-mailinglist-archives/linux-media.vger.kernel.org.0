Return-Path: <linux-media+bounces-50882-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB67D3126A
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 13:35:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4AE0303A09D
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 12:35:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65B1F20E030;
	Fri, 16 Jan 2026 12:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TXOR9v+y"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706231D6DB5
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 12:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768566919; cv=none; b=GQcRqoDRrh5I6CgOuJFrUyOtTRv4yk/PV9UZzg/4BDXYhdjnqf+sn4+0HcyT884okMwQ8v+xy+5aoEvoP8uh+u/8tob+9UvsiHUZ1Ser3Y8Cuw/QWKMrOsb25vB0QJXgvQIklsJbK9Rzu9sI9hZRBtVX75o2LbKSi5QST4c9Kok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768566919; c=relaxed/simple;
	bh=1Uy0jD/lB+yQydWariUVlZW5+ZJJfCt7pKK0n7kv2j8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LrJjXYxQUyGfCRcIdvwLk2Ygu9Fgir3fbPDqcz/ibRk4Iqw1Rn+lmAJ8gZ73r8DqJzd3/9w6b64IwoB6oehXt6nhfoPBJL0sAvxZpYmHNjJGAitvU5pRz9sNfqgAQLVJn/b5+aYclIPKSkYILWva8ZMoLAGu6gChx8pTKDdOcpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TXOR9v+y; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768566918; x=1800102918;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1Uy0jD/lB+yQydWariUVlZW5+ZJJfCt7pKK0n7kv2j8=;
  b=TXOR9v+yt5jxLiBvZNLDY/j7WVB42kBcoFd8vlMJfljjwxv+rhy89u1n
   7KOPKG9yCQ7h9vsh2+XEwZ4XnIAFoZHJsaVFgBF4FCTbJuocSAx26CsZu
   vrCZJI94629c2Hd7elMqyMuEewOWa251kG6afcvMNSKe6A6mU8U10LG4E
   UgVFZ5O87XKahFisWH+ZaBRBeDQrp7WJc8cQKG/yr+Pe0YNRFKzTHbtkQ
   mfHTqiqUn5l6ajM3BwgppAWUXoFlkW4RoB6mIGF0sWqgM4LRe6KVW6ePP
   ofBMdkwiZQo7hx0uRCaNrKOubzdQhMkjOjpF2wRS2PoYcUgqDbV/aqAi1
   w==;
X-CSE-ConnectionGUID: H4zvwtWCRVa9NjHnGOcbLQ==
X-CSE-MsgGUID: rLw92+idTniKXuzOgwQSjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="81327472"
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="81327472"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 04:35:16 -0800
X-CSE-ConnectionGUID: BEQvJLFlT12UML8UnPex8g==
X-CSE-MsgGUID: 3hK25oXaRzi6X5MyHYQB4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="205511882"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.150])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 04:35:14 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 18D8E120819;
	Fri, 16 Jan 2026 14:35:15 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vgj2o-00000000vUO-3ydN;
	Fri, 16 Jan 2026 14:35:14 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	laurent.pinchart@ideasonboard.com,
	jai.luthra@ideasonboard.com
Subject: [PATCH v2 4/8] media: ccs: Compute binning configuration from sub-device state
Date: Fri, 16 Jan 2026 14:35:10 +0200
Message-ID: <20260116123514.220949-5-sakari.ailus@linux.intel.com>
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

Calculate binning configuration from sub-device state so the state related
configuration can be removed from the driver's device context struct.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 56 +++++++++++++++++++-------------
 drivers/media/i2c/ccs/ccs.h      |  3 --
 2 files changed, 33 insertions(+), 26 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 81f81cb2c354..6d2b5eb50659 100644
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
@@ -2122,9 +2141,6 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
 				sensor->scale_m = CCS_LIM(sensor, SCALER_N_MIN);
 				sensor->scaling_mode =
 					CCS_SCALING_MODE_NO_SCALING;
-			} else if (ssd == sensor->binner) {
-				sensor->binning_horizontal = 1;
-				sensor->binning_vertical = 1;
 			}
 		}
 		fallthrough;
@@ -2310,10 +2326,6 @@ static void ccs_set_compose_binner(struct v4l2_subdev *subdev,
 			best = this;
 		}
 	}
-	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
-		sensor->binning_vertical = binv;
-		sensor->binning_horizontal = binh;
-	}
 
 	sel->r.width = (sink_crop->width / binh) & ~1;
 	sel->r.height = (sink_crop->height / binv) & ~1;
@@ -3400,8 +3412,6 @@ static int ccs_probe(struct i2c_client *client)
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


