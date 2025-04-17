Return-Path: <linux-media+bounces-30400-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DF1A9145D
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 08:54:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5436116F255
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 06:54:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 445152163A4;
	Thu, 17 Apr 2025 06:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WLfR7vSf"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228AA217F33
	for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 06:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744872854; cv=none; b=PDGMe8Z9p0Xvfx1+3uEH0btSlLJHH4yYs7oP/L0woR/JoIgrrFqxyKGezDR2n5O4Tk5SbIDK1HOc7YXzvk/IVxChks7JEFD+TZ+Xq0OeK0nI/HbljK3Im3m0gHNBWXkLniA2PLdXc+Io0nOH/b3gmYQcJ48nGr6bIiaFM+WmPQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744872854; c=relaxed/simple;
	bh=jJ7Ziq82am3xEjQdn2xYwO2zHe4W/zJ/7TnEix+zFMw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I/Hwi77nqczyhTsH3WSVlJ/oQKSunNOMA+6A40B7GFo7ZBWjd6zKPxs6DrNCRT/4obIXFd9KBh0qC6f13rZcBbVpEYk4d9/cvgnKuHc7kqbHb2i9/5R2wL52l6tleLZwIe9fRqfZwGYyISui9vqYa1SJQFCO4l6h5OeeROydKyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WLfR7vSf; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744872853; x=1776408853;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jJ7Ziq82am3xEjQdn2xYwO2zHe4W/zJ/7TnEix+zFMw=;
  b=WLfR7vSfvNXk4nXW7zq81a/vx0gUar6H3GrrLOJkik39KjILzUf+hV3i
   OZ08JxURwUbfjgiZhuwfAVMwEZ1smZCQ0VeCOFXE0vInQKIXy9klIpmwY
   kn2qHQ+Ham0DCnolG3SjrFExop0TunMkdWcWuij/GROWTOhtCJhoNlJkp
   r9kOMGhPjCx3I4sPQFpzgGUek95cWmbmO2Jmp9e1WpNrokCgFpMFZDNAs
   wxLs4vT1WkNK4dXZ3MFiGD4MQ1AtJdAUEbN5rgCMgnXo3XybnyFh09DOJ
   hQO4IkThuogWvcbGjlBAR4iBJzR0/j5QQD6MWeP3NxtqcbbXVRVqnioxS
   Q==;
X-CSE-ConnectionGUID: x1RRfspCRCWQjUAXAXRKIw==
X-CSE-MsgGUID: zz1jnmkQQDWfQyenMdH9Hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="71831278"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="71831278"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 23:54:11 -0700
X-CSE-ConnectionGUID: rVeq3LLfSrSeRaqrpQvnTg==
X-CSE-MsgGUID: c80ha8tcR5Cy2ks1vjzGNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="131262192"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 23:54:11 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 213BF1206A4;
	Thu, 17 Apr 2025 09:54:05 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1u5J8P-001J55-0M;
	Thu, 17 Apr 2025 09:54:05 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	dongcheng.yan@intel.com
Subject: [PATCH v2 06/11] media: ccs-pll: Drop LINK_DECOUPLED flag
Date: Thu, 17 Apr 2025 09:53:49 +0300
Message-Id: <20250417065354.311617-7-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250417065354.311617-1-sakari.ailus@linux.intel.com>
References: <20250417065354.311617-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LINK_DECOUPLED flag wasn't used by the PLL calculator other than
printing it. The number of OP/VT lanes are already printed in any case.
Thus drop the flag as it has no function.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
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


