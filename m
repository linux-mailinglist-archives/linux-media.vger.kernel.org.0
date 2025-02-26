Return-Path: <linux-media+bounces-27045-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E1FA460C1
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 14:26:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29C3217A640
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 13:26:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43A032236E8;
	Wed, 26 Feb 2025 13:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bk7o/Mua"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0360F220688
	for <linux-media@vger.kernel.org>; Wed, 26 Feb 2025 13:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740576221; cv=none; b=Ftexd8EupxTPDQfEHvYDBUgKTuh7lxZe+rOc4zMB4etsGEXtfVzWsfZLREj2SV0ZlPOY79MxC7qorImFpIm2jWucILn4O7gxkDJ1v00NEV4VdPrpog3geO71wZeOBWBe5PnW4zApH1mdcSNv6CtPQv+z3hLRWLdFqUVerdlc5X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740576221; c=relaxed/simple;
	bh=Ufj67YEDAo4iOHGgR/6Q+aCdh5Ntmo/Q4dag2go2WXI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Z7JRwTE/whDTGvcW0gsM98zgU4lEyrxCuOiw1uEnrX/qAkMgtPMx9aZzKz8eUm+b+4wUThxoANH7MAIS1D5WG5dHKZrkE5zePP1ebRENCoXq/z143/PYM5vzhG2mL5IlK6XQlTajopnLn00FNVyHUlai4f4kTK1ozc4x50JIopQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bk7o/Mua; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740576220; x=1772112220;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ufj67YEDAo4iOHGgR/6Q+aCdh5Ntmo/Q4dag2go2WXI=;
  b=bk7o/MuaKJ2AnfJCdwR8MyEiFGDJi6LQAPdtVkclYqJoUypxw5g2QTta
   quOMlBl8VQiC/oa4PtIw+Q28MfQ8sFFMdJWKC1xIhL5bi1LCpUqeq1ZGd
   DGIEDKSpZTH3yuQW8b5rgV3Rdm5RV+4mQGRnoKYybvoc9JYsQHd1om6+p
   r5GBMlakhGA6jA6Z3DUVQYjosWOiWbBKqRuoLAnbjEo/M4l6XX5VkQ04I
   qdN3MeIotJ9TwjJaVPTnEgodFCFEzM6UD93gNbD8GpWkpeLMYcosX6OPO
   wBPsaqsGK6+rP+ZnGeB3SBeaXpeNjH2DOmVhPZjcvJqZ9gUHx9fz/aVDl
   w==;
X-CSE-ConnectionGUID: 1i+oambGQBK8DoYMA9OYng==
X-CSE-MsgGUID: gsLOKdRiTOCyEgMIo+pefg==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="41548667"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="41548667"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 05:23:36 -0800
X-CSE-ConnectionGUID: dAeVA9MISGmOmQ+uhza/8A==
X-CSE-MsgGUID: LXQN9du8S8KqJo/7fbqGHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="116724122"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 05:23:36 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 0CD3A120BCA;
	Wed, 26 Feb 2025 15:23:30 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1tnHNq-00AYyK-08;
	Wed, 26 Feb 2025 15:23:30 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: dongcheng.yan@linux.intel.com
Subject: [PATCH 7/7] media: ccs-pll: Better validate VT PLL branch
Date: Wed, 26 Feb 2025 15:23:19 +0200
Message-Id: <20250226132319.2517656-8-sakari.ailus@linux.intel.com>
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

Check that the VT PLL dividers are actually found, don't trust they always
are even though they should be.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs-pll.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index fa3c577fbc0c..49cc4491ebdd 100644
--- a/drivers/media/i2c/ccs-pll.c
+++ b/drivers/media/i2c/ccs-pll.c
@@ -448,7 +448,7 @@ static int ccs_pll_calculate_vt_tree(struct device *dev,
 	return -EINVAL;
 }
 
-static void
+static int
 ccs_pll_calculate_vt(struct device *dev, const struct ccs_pll_limits *lim,
 		     const struct ccs_pll_branch_limits_bk *op_lim_bk,
 		     struct ccs_pll *pll, struct ccs_pll_branch_fr *pll_fr,
@@ -571,6 +571,8 @@ ccs_pll_calculate_vt(struct device *dev, const struct ccs_pll_limits *lim,
 		if (best_pix_div < SHRT_MAX >> 1)
 			break;
 	}
+	if (best_pix_div == SHRT_MAX >> 1)
+		return -EINVAL;
 
 	pll->vt_bk.sys_clk_div = DIV_ROUND_UP(vt_div, best_pix_div);
 	pll->vt_bk.pix_clk_div = best_pix_div;
@@ -583,6 +585,8 @@ ccs_pll_calculate_vt(struct device *dev, const struct ccs_pll_limits *lim,
 out_calc_pixel_rate:
 	pll->pixel_rate_pixel_array =
 		pll->vt_bk.pix_clk_freq_hz * pll->vt_lanes;
+
+	return 0;
 }
 
 /*
@@ -862,8 +866,10 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 		if (pll->flags & CCS_PLL_FLAG_DUAL_PLL)
 			break;
 
-		ccs_pll_calculate_vt(dev, lim, op_lim_bk, pll, op_pll_fr,
-				     op_pll_bk, cphy, phy_const);
+		rval = ccs_pll_calculate_vt(dev, lim, op_lim_bk, pll, op_pll_fr,
+					    op_pll_bk, cphy, phy_const);
+		if (rval)
+			continue;
 
 		rval = check_bk_bounds(dev, lim, pll, PLL_VT);
 		if (rval)
-- 
2.39.5


