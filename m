Return-Path: <linux-media+bounces-50881-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A42D3125F
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 13:35:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2F4D73045DB0
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 12:35:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E38291519AC;
	Fri, 16 Jan 2026 12:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nB/sFrpv"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D1E1A704B
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 12:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768566919; cv=none; b=oKGgJLTjse/bSX/i178nnKccx6UMoiLyOqilDe2CP3NgQHS5K7olmZRsKsJUNARawBZ4cOXfA5+7EDfN/FEw1mKxW5UVooygI133zlKhtEYjE5mwArU682C3aHnDAU1nGVplblRHYJQqqxyLJy3y7MaJREZAPSXNV5H1BHqbkAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768566919; c=relaxed/simple;
	bh=6wC7zp0nKpV2ZPbngFpVTnnMNTvDMVQPf9guxa5P4SI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=khbpyXDKC9lbwA1wtwY+IPIIl61yMFFt9BdxibzGUtrfcghn5Hq+MDhzLGrq59dqa12RLVSISrFWq6tGWJATtDtC3Q07C/O4iL74LyQesMdwVPEQS0ogfi32e02ClkIilg6Kov2sGRCLybmiZckV+uutDoS70+7mI8427RgVsUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nB/sFrpv; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768566918; x=1800102918;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6wC7zp0nKpV2ZPbngFpVTnnMNTvDMVQPf9guxa5P4SI=;
  b=nB/sFrpv+R5V4DFDsI+2RibA2opeWEynwtpbvZEaBRCtMjoL3nyVx1+o
   7uuJ4Che/BexyPo8uJ0nz2ki8NKelfp4a50aT6Z78cSkbc+yhU0GIOVDH
   BdO0uyuqSEwhWMle2BSeJ9tpTjIc4Y2L7drOMz7qEBOPiOjsWLQBxK5Or
   oyN/hg6qeQ42J/L9t+2DkCWCAb7TzS7P3xugdLzBs+51no3GWCMflIWA0
   17TvfStAX6ACpgx/BwrgtvpGIQypeO+7TAL2swWCZwVKvaVlIOAO57aDX
   XElEJQUSCclhzAFnfMppZ3Q46qidc85ykUMnwuqPzX+dIKJ0ph2MAt7HQ
   Q==;
X-CSE-ConnectionGUID: X/Mv2evcQ7W4GMviby8zvw==
X-CSE-MsgGUID: p277Lk5vRs6h+kcokfxkFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="81327469"
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="81327469"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 04:35:16 -0800
X-CSE-ConnectionGUID: rK3VMxSTSVuEtAzuEGB4Nw==
X-CSE-MsgGUID: Pg2Y8fEkQAWmaPQwwztA3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="205511884"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.150])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 04:35:15 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 14CC1120280;
	Fri, 16 Jan 2026 14:35:15 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vgj2o-00000000vUK-3v7E;
	Fri, 16 Jan 2026 14:35:14 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	laurent.pinchart@ideasonboard.com,
	jai.luthra@ideasonboard.com
Subject: [PATCH v2 3/8] media: ccs: Switch to guard and scoped_guard
Date: Fri, 16 Jan 2026 14:35:09 +0200
Message-ID: <20260116123514.220949-4-sakari.ailus@linux.intel.com>
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

Replace the use of mutex_{,un}lock() by guard() and scoped_guard() where
it makes sense (i.e. everywhere).

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index a08f06149097..81f81cb2c354 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -2006,9 +2006,8 @@ static int ccs_pre_streamon(struct v4l2_subdev *subdev, u32 flags)
 		}
 	}
 
-	mutex_lock(&sensor->mutex);
-	rval = ccs_pm_get_init(sensor);
-	mutex_unlock(&sensor->mutex);
+	scoped_guard(mutex, &sensor->mutex)
+		rval = ccs_pm_get_init(sensor);
 	if (rval)
 		return rval;
 
@@ -3045,7 +3044,7 @@ static int ccs_init_state(struct v4l2_subdev *sd,
 		v4l2_subdev_state_get_crop(sd_state, pad);
 	bool is_active = !sd->active_state || sd->active_state == sd_state;
 
-	mutex_lock(&sensor->mutex);
+	guard(mutex)(&sensor->mutex);
 
 	ccs_get_native_size(ssd, crop);
 
@@ -3054,11 +3053,8 @@ static int ccs_init_state(struct v4l2_subdev *sd,
 	fmt->code = sensor->internal_csi_format->code;
 	fmt->field = V4L2_FIELD_NONE;
 
-	if (ssd == sensor->pixel_array) {
-		mutex_unlock(&sensor->mutex);
-
+	if (ssd == sensor->pixel_array)
 		return 0;
-	}
 
 	fmt = v4l2_subdev_state_get_format(sd_state, CCS_PAD_SRC);
 	fmt->code = ssd == sensor->src ?
@@ -3067,8 +3063,6 @@ static int ccs_init_state(struct v4l2_subdev *sd,
 
 	ccs_propagate(sd, sd_state, is_active, V4L2_SEL_TGT_CROP);
 
-	mutex_unlock(&sensor->mutex);
-
 	return 0;
 }
 
@@ -3553,9 +3547,8 @@ static int ccs_probe(struct i2c_client *client)
 		goto out_cleanup;
 	}
 
-	mutex_lock(&sensor->mutex);
-	rval = ccs_pll_blanking_update(sensor);
-	mutex_unlock(&sensor->mutex);
+	scoped_guard(mutex, &sensor->mutex)
+		rval = ccs_pll_blanking_update(sensor);
 	if (rval) {
 		dev_err(&client->dev, "update mode failed\n");
 		goto out_cleanup;
-- 
2.47.3


