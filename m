Return-Path: <linux-media+bounces-27042-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AB8A460C9
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 14:26:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2543D7AA8C4
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 13:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D457021D5A9;
	Wed, 26 Feb 2025 13:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VyjRr6GJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAD12236E8
	for <linux-media@vger.kernel.org>; Wed, 26 Feb 2025 13:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740576219; cv=none; b=UQ9gUdBYQZbV7EcpfaxPzmxe39W34JdmrfROgBxjr3jKdgziXHRHbM9pZnP2cdPsMGwwsQflPrQg1jZkF2vAAtZfUyVYPlhx8nV2q+umoQVpCnTuDYmuFMrnUezPwvFJATSv1uQuwNMF4qDVyUhMSy5D0841tFXSbRr5pHMaCEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740576219; c=relaxed/simple;
	bh=ylyl/LYXYbK7Bid0HkXt2z4r0bO318hhaMRx740aMjA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=or7KbW4iIb+jJsG0J3gnT90BNVpKz7kKTJu768bCBrf0m4BcrlvEQvD1BqeDxzNhnnwa+iotxQ9pDMg39KtRL/UCNwuOK3q9oGpf6rG0gAxeapd95NUb/VPLetIjIL0dwcPA+iJcehniYOSh/6Cvdt1jdaWziEF4/hA+h4JsCY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VyjRr6GJ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740576217; x=1772112217;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ylyl/LYXYbK7Bid0HkXt2z4r0bO318hhaMRx740aMjA=;
  b=VyjRr6GJBymbq/jKSZUTjz34vKdmByoIrsXVOP/664Lt3MLYbXRi6sYS
   7BoRLC6LWHwOEOMSTO32+7GVhJV88zir6HGVpyzFb5yh5LiYF+T5DYwmq
   u5NyreAhhOj2owFIrD5d8R4eB31rbL+h1T2vOVaLlR02ASFf1UAbMxnTI
   zvdVlEGGIsY4Thbl7fHVxv12BoRfvvanGDavwwvYh9NepzHlYu+4E2Rpa
   HFRLnOlK3JWQX2opQ32HZhOmbftmNp4zxt+JwoR79q55Up4ScZiGvu9Cm
   6PFPi86eKS70z82ls53+9Izt7OckoC4ZkPyTT/gNa1+gGd3jL5WzDu3HP
   g==;
X-CSE-ConnectionGUID: c1woKxgOR4amSZR68EomjA==
X-CSE-MsgGUID: BjXBWjSeS/qp4tQmgELOFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="41548664"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="41548664"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 05:23:36 -0800
X-CSE-ConnectionGUID: +EVrVS7MQFqGIBR29TN6VQ==
X-CSE-MsgGUID: EMnBCIdcRuOdPxHX6jlUrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="116724120"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 05:23:36 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 0A065120ADE;
	Wed, 26 Feb 2025 15:23:30 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1tnHNq-00AYyF-05;
	Wed, 26 Feb 2025 15:23:30 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: dongcheng.yan@linux.intel.com
Subject: [PATCH 6/7] media: ccs-pll: Add a flag for even PLL multipliers
Date: Wed, 26 Feb 2025 15:23:18 +0200
Message-Id: <20250226132319.2517656-7-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250226132319.2517656-1-sakari.ailus@linux.intel.com>
References: <20250226132319.2517656-1-sakari.ailus@linux.intel.com>
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
 drivers/media/i2c/ccs-pll.c | 13 +++++++++++--
 drivers/media/i2c/ccs-pll.h |  1 +
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index 66281f676707..fa3c577fbc0c 100644
--- a/drivers/media/i2c/ccs-pll.c
+++ b/drivers/media/i2c/ccs-pll.c
@@ -124,7 +124,7 @@ static void print_pll(struct device *dev, struct ccs_pll *pll)
 	dev_dbg(dev, "pixel rate on CSI-2 bus:\t%u\n",
 		pll->pixel_rate_csi);
 
-	dev_dbg(dev, "flags%s%s%s%s%s%s%s%s%s\n",
+	dev_dbg(dev, "flags%s%s%s%s%s%s%s%s%s%s\n",
 		pll->flags & PLL_FL(LANE_SPEED_MODEL) ? " lane-speed" : "",
 		pll->flags & PLL_FL(LINK_DECOUPLED) ? " link-decoupled" : "",
 		pll->flags & PLL_FL(EXT_IP_PLL_DIVIDER) ?
@@ -135,7 +135,8 @@ static void print_pll(struct device *dev, struct ccs_pll *pll)
 		pll->flags & PLL_FL(FIFO_OVERRATING) ? " fifo-overrating" : "",
 		pll->flags & PLL_FL(DUAL_PLL) ? " dual-pll" : "",
 		pll->flags & PLL_FL(OP_SYS_DDR) ? " op-sys-ddr" : "",
-		pll->flags & PLL_FL(OP_PIX_DDR) ? " op-pix-ddr" : "");
+		pll->flags & PLL_FL(OP_PIX_DDR) ? " op-pix-ddr" : "",
+		pll->flags & PLL_FL(EVEN_PLL_MULTIPLIER) ? " even-pll-multiplier" : "");
 }
 
 static u32 op_sys_ddr(u32 flags)
@@ -311,6 +312,10 @@ __ccs_pll_calculate_vt_tree(struct device *dev,
 	more_mul *= DIV_ROUND_UP(lim_fr->min_pll_multiplier, mul * more_mul);
 	dev_dbg(dev, "more_mul2: %u\n", more_mul);
 
+	if (pll->flags & CCS_PLL_FLAG_EVEN_PLL_MULTIPLIER &&
+	    mul & 1 && more_mul & 1)
+		more_mul <<= 1;
+
 	pll_fr->pll_multiplier = mul * more_mul;
 	if (pll_fr->pll_multiplier > lim_fr->max_pll_multiplier) {
 		dev_dbg(dev, "pll multiplier %u too high\n",
@@ -667,6 +672,10 @@ ccs_pll_calculate_op(struct device *dev, const struct ccs_pll_limits *lim,
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
index 6eb1b1c68e1e..fce2bbf84c99 100644
--- a/drivers/media/i2c/ccs-pll.h
+++ b/drivers/media/i2c/ccs-pll.h
@@ -32,6 +32,7 @@
 #define CCS_PLL_FLAG_DUAL_PLL					BIT(8)
 #define CCS_PLL_FLAG_OP_SYS_DDR					BIT(9)
 #define CCS_PLL_FLAG_OP_PIX_DDR					BIT(10)
+#define CCS_PLL_FLAG_EVEN_PLL_MULTIPLIER			BIT(11)
 
 /**
  * struct ccs_pll_branch_fr - CCS PLL configuration (front)
-- 
2.39.5


