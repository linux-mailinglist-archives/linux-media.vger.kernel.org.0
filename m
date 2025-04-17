Return-Path: <linux-media+bounces-30403-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB49A91460
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 08:54:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCEA93A7076
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 06:54:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8E532192FE;
	Thu, 17 Apr 2025 06:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="egzajGwE"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC58721859D
	for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 06:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744872856; cv=none; b=nGlB4TlOcbYr9VKbVmrgckg0ejEoD2YkJxJO3hXCLmiwoUxHwtZGkG5LwrLE/4vRxL+jiDo1uS1dyADwB5GZDBK812YAMI3E2poF9R3HwR2RFP1sqlJxV2qKPvMYyDPMm4rA8HkZa/Q7djXNR6hr4zxRgwH/LPfCcuslXQfEE/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744872856; c=relaxed/simple;
	bh=BYn/HpT3X8qAhCAZdYSZib4XyPjgdRPm3+bPggapFi0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=a/GxHiXe6BpwgZrruXIcvcOb+ySbb8XPp+U1pg6P3T4h+c6ukz5afxPcS0f8mCa+jfb7c96A1xdEow1Rnbhsxdx/vPTirbse8wokyvh6z972SrK+jW61i+zlcrNlx2KKiQNDKhoB4ac6LueQP0/zUSjxPdy5mPpgN9/v5/kLRpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=egzajGwE; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744872855; x=1776408855;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BYn/HpT3X8qAhCAZdYSZib4XyPjgdRPm3+bPggapFi0=;
  b=egzajGwEhs9uPc6/HDGMSRtU26crpNcv6MHuUMf/Lrir6yTlr0w+t/5E
   CECDCGTQj0um+HvzqmRYfaL1hqX+cHeLVCkLgg/q1iStPE0Y1xrbFUPeV
   stpEh7F8eZCR/OUQS0KasRw78SP0ehOh/fUFFE55ZdT7dOoS6ASQKgHrG
   Rt950OSwyHPsMbwfayRoFrPjQ0dYUPXOPOAmTX2vbemp3d3BFxnupensr
   cNS8hWIkVwMHPNxzB2xfF0gnRJ6tX3oFnk8gW39OJDIBWhaONBSdEx0Lb
   4RAI1qNng2roIhnY5D1HuEdobdn6P3jGiBsFkBqV5DaXe+yJeuIIq3ZdX
   A==;
X-CSE-ConnectionGUID: jdhwrE03Thujddyqfs3uPA==
X-CSE-MsgGUID: ftOA5L3MSAiNKnzTEkchAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="71831284"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="71831284"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 23:54:12 -0700
X-CSE-ConnectionGUID: fWoF3GQXTUmpTehko0hHRA==
X-CSE-MsgGUID: w05UDRF/SompS9KkGM6LcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="131262196"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 23:54:11 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 29E7B12071B;
	Thu, 17 Apr 2025 09:54:05 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1u5J8P-001J5F-0U;
	Thu, 17 Apr 2025 09:54:05 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	dongcheng.yan@intel.com
Subject: [PATCH v2 08/11] media: ccs-pll: Add a flag for even PLL multipliers
Date: Thu, 17 Apr 2025 09:53:51 +0300
Message-Id: <20250417065354.311617-9-sakari.ailus@linux.intel.com>
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

Some devices (not entirely CCS compliant) only support even PLL
multipliers. Add support for this through a PLL flag.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs-pll.c | 11 ++++++++++-
 drivers/media/i2c/ccs-pll.h |  1 +
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index ebbc5e323244..3f8153fb4af0 100644
--- a/drivers/media/i2c/ccs-pll.c
+++ b/drivers/media/i2c/ccs-pll.c
@@ -124,9 +124,10 @@ static void print_pll(struct device *dev, const struct ccs_pll *pll)
 	dev_dbg(dev, "pixel rate on CSI-2 bus:\t%u\n",
 		pll->pixel_rate_csi);
 
-	dev_dbg(dev, "flags%s%s%s%s%s%s%s%s%s%s\n",
+	dev_dbg(dev, "flags%s%s%s%s%s%s%s%s%s%s%s\n",
 		pll->flags & PLL_FL(OP_PIX_CLOCK_PER_LANE) ? " op-pix-clock-per-lane" : "",
 		pll->flags & PLL_FL(NO_OP_CLOCKS) ? " no-op-clocks" : "",
+		pll->flags & PLL_FL(EVEN_PLL_MULTIPLIER) ? " even-pll-multiplier" : "",
 		pll->flags & PLL_FL(LANE_SPEED_MODEL) ? " lane-speed" : "",
 		pll->flags & PLL_FL(EXT_IP_PLL_DIVIDER) ?
 		" ext-ip-pll-divider" : "",
@@ -312,6 +313,10 @@ __ccs_pll_calculate_vt_tree(struct device *dev,
 	more_mul *= DIV_ROUND_UP(lim_fr->min_pll_multiplier, mul * more_mul);
 	dev_dbg(dev, "more_mul2: %u\n", more_mul);
 
+	if (pll->flags & CCS_PLL_FLAG_EVEN_PLL_MULTIPLIER &&
+	    mul & 1 && more_mul & 1)
+		more_mul <<= 1;
+
 	pll_fr->pll_multiplier = mul * more_mul;
 	if (pll_fr->pll_multiplier > lim_fr->max_pll_multiplier) {
 		dev_dbg(dev, "pll multiplier %u too high\n",
@@ -668,6 +673,10 @@ ccs_pll_calculate_op(struct device *dev, const struct ccs_pll_limits *lim,
 	if (!is_one_or_even(i))
 		i <<= 1;
 
+	if (pll->flags & CCS_PLL_FLAG_EVEN_PLL_MULTIPLIER &&
+	    mul & 1 && i & 1)
+		i <<= 1;
+
 	dev_dbg(dev, "final more_mul: %u\n", i);
 	if (i > more_mul_max) {
 		dev_dbg(dev, "final more_mul is bad, max %u\n", more_mul_max);
diff --git a/drivers/media/i2c/ccs-pll.h b/drivers/media/i2c/ccs-pll.h
index ee206e5b287b..e8297db45460 100644
--- a/drivers/media/i2c/ccs-pll.h
+++ b/drivers/media/i2c/ccs-pll.h
@@ -31,6 +31,7 @@
 #define CCS_PLL_FLAG_DUAL_PLL					BIT(8)
 #define CCS_PLL_FLAG_OP_SYS_DDR					BIT(9)
 #define CCS_PLL_FLAG_OP_PIX_DDR					BIT(10)
+#define CCS_PLL_FLAG_EVEN_PLL_MULTIPLIER			BIT(11)
 
 /**
  * struct ccs_pll_branch_fr - CCS PLL configuration (front)
-- 
2.39.5


