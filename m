Return-Path: <linux-media+bounces-30799-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 434F6A989DA
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 14:34:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 836A416BCF2
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 12:34:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0D2B26B0B6;
	Wed, 23 Apr 2025 12:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LkqLGbir"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FD7266EF8
	for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 12:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745411658; cv=none; b=fvf9UizEoZlW5gXjkcsRilGPuEPSgVBrgTwxRRMcrZq6Bsk5VhsAisIuzZfBvoE3eLO66ljGd6320D7eTy9PL8tKQMn3/xJLpSKLyCRwKXUziIzb/vP8api0xiN+2d25nH52B2Lt5UoAYA++kcflGRMXh1Qxu2fZ3aEZkzwLXnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745411658; c=relaxed/simple;
	bh=x4p7GMBCadXnOLneC1t15Hr2tb2cbcDMXvVibDk+Ng8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WeWiKJVhiOZNGsX4r9tnnJZb/ekkuPRb/tG6fKg2Dc93HH/ubpr7ZdSXnG2DGPaPgcfc25Zdpwx4UlUzXkgpvew5H9wog8KrkUE2lW2rCNyrma/gGvsrixiVVXhhP2GUhorwucatTezbPT3P3roaGwSf8nSW3AUgwTqo+Kj32r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LkqLGbir; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745411656; x=1776947656;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x4p7GMBCadXnOLneC1t15Hr2tb2cbcDMXvVibDk+Ng8=;
  b=LkqLGbiryqIEX8KYo4McwJxUkb80qXNwlil/IY+nA1LtMUsgI7IHwDlI
   RhX7MlyITgpAQ12DalVDRFp1VI7+GIsn1E5KgXi+hNbUUQnXgM9A39Nij
   QJOSmE9XYpLcOt0bzFx54AgRYDcdUTWU7n1BGhd2hmsNx3MUYuGgAU4Nz
   nByqA9+SlZdHtYfTF1p0FM9Z8RwSuRMnd6oCL2iG67rgO07uGL+Z1ihG8
   gIJJYk5himq7M6J4rjklB51AZYrMsJu6xQjc6/wq+i2VnU6RgV14Sb8/o
   B54YJ1U+i1QcvyjVa4PbRTWV/11i9LQbMaIQFfJXQkb9HebzP8CtE8jYI
   g==;
X-CSE-ConnectionGUID: Zd7pJUa0SnmERt/vdcdeXQ==
X-CSE-MsgGUID: yk3nycZdQwe76qG9X4eisA==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="57991789"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="57991789"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 05:34:14 -0700
X-CSE-ConnectionGUID: dgUQSESdQU2opwICoWSfRA==
X-CSE-MsgGUID: 2r+5tiZPSh+0DKzsxb6M0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="133257305"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 05:34:12 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id BAB5D1205A2;
	Wed, 23 Apr 2025 15:34:09 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1u7ZIn-007YVg-2Q;
	Wed, 23 Apr 2025 15:34:09 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	dongcheng.yan@intel.com
Subject: [PATCH v3 04/11] media: ccs-pll: Correct the upper limit of maximum op_pre_pll_clk_div
Date: Wed, 23 Apr 2025 15:33:52 +0300
Message-Id: <20250423123359.1800904-5-sakari.ailus@linux.intel.com>
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

The PLL calculator does a search of the PLL configuration space for all
valid OP pre-PLL clock dividers. The maximum did not take into account the
CCS PLL flag CCS_PLL_FLAG_EXT_IP_PLL_DIVIDER in which case also odd PLL
dividers (other than 1) are valid. Do that now.

Fixes: 4e1e8d240dff ("media: ccs-pll: Add support for extended input PLL clock divider")
Cc: stable@vger.kernel.org
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ccs-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index 266fcd160da6..d985686b0a36 100644
--- a/drivers/media/i2c/ccs-pll.c
+++ b/drivers/media/i2c/ccs-pll.c
@@ -799,7 +799,7 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 		op_lim_fr->min_pre_pll_clk_div, op_lim_fr->max_pre_pll_clk_div);
 	max_op_pre_pll_clk_div =
 		min_t(u16, op_lim_fr->max_pre_pll_clk_div,
-		      clk_div_even(pll->ext_clk_freq_hz /
+		      DIV_ROUND_UP(pll->ext_clk_freq_hz,
 				   op_lim_fr->min_pll_ip_clk_freq_hz));
 	min_op_pre_pll_clk_div =
 		max_t(u16, op_lim_fr->min_pre_pll_clk_div,
-- 
2.39.5


