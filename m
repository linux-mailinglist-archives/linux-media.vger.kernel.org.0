Return-Path: <linux-media+bounces-30802-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A82A989DE
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 14:34:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D12DC7A92E9
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 12:33:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E888E25CC77;
	Wed, 23 Apr 2025 12:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YhJMLzK3"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD1226D4FB
	for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 12:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745411660; cv=none; b=DwkUYKQur/oDeDZOgAsqKkmQrt7Nfd20oVQ7H2QMT1Tm14ElHSb1ZCLkzxXSa+9sMckXgCwFpd8A2laIGCeKkYOaEMVm9JerZVq0WXYUTt64mR9jRUOdmAeOY/JlQPamqfc90QJK/BUv4pKHf1IYaeZfBrFrRafGmfNArTYV0gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745411660; c=relaxed/simple;
	bh=bD83bJUNnvoOTvMKZTFOUtUs2FponD6OND1SpOXgJzM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Nw9Z2UqN+V5xz4W1q/KVR/Sl5JQFFsHvtmoWcyz36CTb+mDo1IlhemMunImNnszOMvj3pNGDvmVAACMNIxw6dCAOyApunDj7ShNHRqfmF9TT/5edM2hTkNXSyojNyVz6Et+aKt6sg1aUVJUjNXSv1m+GwAUZ8Y3GPOJ0/sSygJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YhJMLzK3; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745411660; x=1776947660;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bD83bJUNnvoOTvMKZTFOUtUs2FponD6OND1SpOXgJzM=;
  b=YhJMLzK3yr/u25nFL3BekuyaPieFkESGxf7DwIw4PhWMugdr338wNlI5
   XtUdoo4v1LRcwZxvUFTNlY8InL0lgAyFVx52VbjbrvJ+q84U5MRvdhoGb
   YWezXYkh+ud/LijPXHIsgUcuWOBr0ps6cJGtu9lSF0kUQdrZ0HVH7oq5P
   tCiR1tKJBOaReocl88z5IujpIRLXMCMownfsvq1h3aDF4GwI8WbLybkh5
   EVVgEqVGq1ueYZi8IB/koVvobPEEJj+hOdR1A7RbOxcproXvUivL+fM6q
   RLzumknLjeId4VnClNKc4z1bWULXrlomBiLS6z9G5eoRe1FFZwMk2YqMy
   g==;
X-CSE-ConnectionGUID: ADLULtIHRuyIPyuCbeygqQ==
X-CSE-MsgGUID: qMtTxSM5RN6PWvxNHd+EXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="46704394"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="46704394"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 05:34:18 -0700
X-CSE-ConnectionGUID: 6ruILB6+TrGGBaLDMRhJzg==
X-CSE-MsgGUID: Kii3ALRHTE6AL4t9ozUtnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="132148612"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 05:34:16 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id C28F81209B0;
	Wed, 23 Apr 2025 15:34:09 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1u7ZIn-007YVq-2W;
	Wed, 23 Apr 2025 15:34:09 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	dongcheng.yan@intel.com
Subject: [PATCH v3 06/11] media: ccs-pll: Drop LINK_DECOUPLED flag
Date: Wed, 23 Apr 2025 15:33:54 +0300
Message-Id: <20250423123359.1800904-7-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250423123359.1800904-1-sakari.ailus@linux.intel.com>
References: <20250423123359.1800904-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LINK_DECOUPLED flag isn't used by the PLL calculator other than
printing it. The number of OP/VT lanes are already printed in any case.
Thus drop the flag as it has no function.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ccs-pll.c       | 3 +--
 drivers/media/i2c/ccs-pll.h       | 1 -
 drivers/media/i2c/ccs/ccs-core.c  | 1 -
 drivers/media/i2c/ccs/ccs-quirk.c | 3 +--
 4 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index 66d046d576f7..16eb09462c8b 100644
--- a/drivers/media/i2c/ccs-pll.c
+++ b/drivers/media/i2c/ccs-pll.c
@@ -124,9 +124,8 @@ static void print_pll(struct device *dev, const struct ccs_pll *pll)
 	dev_dbg(dev, "pixel rate on CSI-2 bus:\t%u\n",
 		pll->pixel_rate_csi);
 
-	dev_dbg(dev, "flags%s%s%s%s%s%s%s%s%s\n",
+	dev_dbg(dev, "flags%s%s%s%s%s%s%s%s\n",
 		pll->flags & PLL_FL(LANE_SPEED_MODEL) ? " lane-speed" : "",
-		pll->flags & PLL_FL(LINK_DECOUPLED) ? " link-decoupled" : "",
 		pll->flags & PLL_FL(EXT_IP_PLL_DIVIDER) ?
 		" ext-ip-pll-divider" : "",
 		pll->flags & PLL_FL(FLEXIBLE_OP_PIX_CLK_DIV) ?
diff --git a/drivers/media/i2c/ccs-pll.h b/drivers/media/i2c/ccs-pll.h
index 6eb1b1c68e1e..ee206e5b287b 100644
--- a/drivers/media/i2c/ccs-pll.h
+++ b/drivers/media/i2c/ccs-pll.h
@@ -24,7 +24,6 @@
 #define CCS_PLL_FLAG_NO_OP_CLOCKS				BIT(1)
 /* CCS PLL flags */
 #define CCS_PLL_FLAG_LANE_SPEED_MODEL				BIT(2)
-#define CCS_PLL_FLAG_LINK_DECOUPLED				BIT(3)
 #define CCS_PLL_FLAG_EXT_IP_PLL_DIVIDER				BIT(4)
 #define CCS_PLL_FLAG_FLEXIBLE_OP_PIX_CLK_DIV			BIT(5)
 #define CCS_PLL_FLAG_FIFO_DERATING				BIT(6)
diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 004d28c33287..06e0ba53f2a8 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -3451,7 +3451,6 @@ static int ccs_probe(struct i2c_client *client)
 				CCS_LIM(sensor, NUM_OF_VT_LANES) + 1;
 			sensor->pll.op_lanes =
 				CCS_LIM(sensor, NUM_OF_OP_LANES) + 1;
-			sensor->pll.flags |= CCS_PLL_FLAG_LINK_DECOUPLED;
 		} else {
 			sensor->pll.vt_lanes = sensor->pll.csi2.lanes;
 			sensor->pll.op_lanes = sensor->pll.csi2.lanes;
diff --git a/drivers/media/i2c/ccs/ccs-quirk.c b/drivers/media/i2c/ccs/ccs-quirk.c
index e3d4c7a275bc..e48a4fa1f5dd 100644
--- a/drivers/media/i2c/ccs/ccs-quirk.c
+++ b/drivers/media/i2c/ccs/ccs-quirk.c
@@ -190,8 +190,7 @@ static int jt8ev1_post_streamoff(struct ccs_sensor *sensor)
 
 static int jt8ev1_init(struct ccs_sensor *sensor)
 {
-	sensor->pll.flags |= CCS_PLL_FLAG_LANE_SPEED_MODEL |
-		CCS_PLL_FLAG_LINK_DECOUPLED;
+	sensor->pll.flags |= CCS_PLL_FLAG_LANE_SPEED_MODEL;
 	sensor->pll.vt_lanes = 1;
 	sensor->pll.op_lanes = sensor->pll.csi2.lanes;
 
-- 
2.39.5


