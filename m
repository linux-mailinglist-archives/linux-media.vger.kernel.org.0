Return-Path: <linux-media+bounces-30807-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF68A989E2
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 14:34:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC47416E0FF
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 12:34:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E41C1270569;
	Wed, 23 Apr 2025 12:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XxPm0hTr"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1A6268FEB
	for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 12:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745411663; cv=none; b=XiBNrndf+LaucfzAY1235rQ3gQ6B7nx+wOkFwv1/q+8c1OgTniwqt7kaqWprmDoBKmAgkJSRCg/u7i2wlJgIm+9CqobP1kNxyXjdUy4hBJyqpN/7977zmCUS272Fj2WK8MvDkKa27hGLvkaWn8JIKXKUBhfHhs8hqh+s+heOGlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745411663; c=relaxed/simple;
	bh=yeJpz2Wr/0E1fPTzvXqC4lwnadfp2E7mfNjj147gV6c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mWE4ynROsDPtxeYvqEX6ZYCAEGL5rbp4T8WngJIdURJKvFzJ+WWTg9wNETE/FWEQzn0mJ/hOna+Y8Rf9I8SvtsLjyLMhNeQDNANJ/EMYFxp0QesPokSCCN25e5yio6Z/VcQxPns1784kz/ll0/scOGI2SgOUQjB1l/SWuCwEdCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XxPm0hTr; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745411663; x=1776947663;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yeJpz2Wr/0E1fPTzvXqC4lwnadfp2E7mfNjj147gV6c=;
  b=XxPm0hTr5dUNzMwg+ezPFeww+cuvyGq/eMYWU54fq7r5FC7dKtso+UyZ
   1TPcsKDfxZtlGE4IFFb/aFfQsvZx+cOo2H0n442fiXlc++V1pM46JwNNg
   IkIa/MRWxRIs3XVHF8XW5v8NgTaeWcfISoPSSpW2RrF1AG9oESc5GBTzO
   sYsOEblnh33oipJ5BzzLMOIkgBA6MlArqP/wyggb166dLv4PwxkwdJRqZ
   oqmOpncBemxIEpuWyfaHQRrmcAxOXUD31qHiF65P9+RB2B7laMQO5xoX3
   8IFwcjsMDzfCRh+hc1tjE061Q0QUrRSvwZKbCug8eQqnRWf093FgkGdYx
   g==;
X-CSE-ConnectionGUID: 0AJuEOYvQmuWE26FMCmu/Q==
X-CSE-MsgGUID: XLMe04BmRyqnbeohFsdA/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="46704401"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="46704401"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 05:34:18 -0700
X-CSE-ConnectionGUID: kuFNAnymTCShZvdSDstKGg==
X-CSE-MsgGUID: JrylycSfRzOA6N+B56bndQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="132148621"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 05:34:16 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D5C1D1227D6;
	Wed, 23 Apr 2025 15:34:09 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1u7ZIn-007YW6-2k;
	Wed, 23 Apr 2025 15:34:09 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	dongcheng.yan@intel.com
Subject: [PATCH v3 09/11] media: ccs-pll: Better validate VT PLL branch
Date: Wed, 23 Apr 2025 15:33:57 +0300
Message-Id: <20250423123359.1800904-10-sakari.ailus@linux.intel.com>
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

Check that the VT PLL dividers are actually found, don't trust they always
are even though they should be.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ccs-pll.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index f4be4e9f6777..8de8158a413b 100644
--- a/drivers/media/i2c/ccs-pll.c
+++ b/drivers/media/i2c/ccs-pll.c
@@ -449,7 +449,7 @@ static int ccs_pll_calculate_vt_tree(struct device *dev,
 	return -EINVAL;
 }
 
-static void
+static int
 ccs_pll_calculate_vt(struct device *dev, const struct ccs_pll_limits *lim,
 		     const struct ccs_pll_branch_limits_bk *op_lim_bk,
 		     struct ccs_pll *pll, struct ccs_pll_branch_fr *pll_fr,
@@ -572,6 +572,8 @@ ccs_pll_calculate_vt(struct device *dev, const struct ccs_pll_limits *lim,
 		if (best_pix_div < SHRT_MAX >> 1)
 			break;
 	}
+	if (best_pix_div == SHRT_MAX >> 1)
+		return -EINVAL;
 
 	pll->vt_bk.sys_clk_div = DIV_ROUND_UP(vt_div, best_pix_div);
 	pll->vt_bk.pix_clk_div = best_pix_div;
@@ -584,6 +586,8 @@ ccs_pll_calculate_vt(struct device *dev, const struct ccs_pll_limits *lim,
 out_calc_pixel_rate:
 	pll->pixel_rate_pixel_array =
 		pll->vt_bk.pix_clk_freq_hz * pll->vt_lanes;
+
+	return 0;
 }
 
 /*
@@ -863,8 +867,10 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
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


