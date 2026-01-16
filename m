Return-Path: <linux-media+bounces-50869-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CADD301F0
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 12:09:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 662D8300879F
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 11:09:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 094F1155757;
	Fri, 16 Jan 2026 11:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mK9HnL2K"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05AA5348890
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 11:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768561768; cv=none; b=dGYgw9+McyKRkrRCc06MZZzZmJCWTaYtkelAkkwP2djNx5Kz8dQxhG+MSDBV/R1WWNydJC+KejaFMugRZRR2I8HJr3moaK4Di0PTXN93QKtcov6E8vdsz86jftsIMHmKUGjb0/a4OAg8ksuj3MTm+O3i5P+yxpOoYI+tznhwU+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768561768; c=relaxed/simple;
	bh=RSwJjwmYAOY5lEIUo84cqUm61Fy9mXYdTUVXIzTjXDA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=ON6QhdxMXUXAf1t4w0NQZbzJjPuiS1T+llzA6NKjQAE4o6MuqnVX7nd2fKwy3V6E47dXzb6yzewAnSrS7ZfG0/eQleXGKYRNnCgLZDhdF1NJNSjPoTJKDAVfBnajHCXIhKBFKGAJ7EaKgv4n04SxL5PBJHVHdQnscaMqpzohvrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mK9HnL2K; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768561759; x=1800097759;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RSwJjwmYAOY5lEIUo84cqUm61Fy9mXYdTUVXIzTjXDA=;
  b=mK9HnL2KKf+LB4lo5cjcyvZGne5HH3unLVnyX8EFONSLfDqNcrpFrWlV
   8i1REXrujt1m+jtpCb5x8N4XM7GIdP+zNbHvDu5BsVJhF/Oq3/klWDumO
   RaEVn3i1am1YPZYGN4yY0QkWtrax+KxHUHBRWoTm5p0UyFXvcONobEtYx
   sGV5WTOyiZDrIFPJ/paFMsLy5h1TcftMj41BadUBNpS8AqNojZbJCz3yl
   F8uagpWSuGXsztct1vM8yA4jslt52sh6dNRsFjpNY7lsVXwTGBO1Vni/q
   WV/6MGD/sjQDXceC8p7WmjR5S5OBa7Ydxe1x1LCg2+YgbcN/SZznSZwM1
   Q==;
X-CSE-ConnectionGUID: B8DB/qDTTOOq0hYL5GICJw==
X-CSE-MsgGUID: A2EBKh3HTfew92cuEDnzzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="73721737"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="73721737"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 03:09:16 -0800
X-CSE-ConnectionGUID: jelWubIQTMq0ohZQMgqIdQ==
X-CSE-MsgGUID: EOPqN/n3ROeetvXSmao4pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="242763950"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.150])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 03:09:16 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 1FB46121D8E
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 13:09:16 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vghhb-00000000v2g-3u5r
	for linux-media@vger.kernel.org;
	Fri, 16 Jan 2026 13:09:15 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Subject: [PATCH 1/1] media: ccs: Switch to guard and scoped_guard
Date: Fri, 16 Jan 2026 13:09:15 +0200
Message-ID: <20260116110915.219262-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
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
index a99921849d59..73f6cfda7d24 100644
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


