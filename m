Return-Path: <linux-media+bounces-30399-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8EEA9145C
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 08:54:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 437021907629
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 06:54:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAE28215762;
	Thu, 17 Apr 2025 06:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fJOvSLTw"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B052163B8
	for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 06:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744872854; cv=none; b=BHLl2/JuFdo/+RLTgo3+eZv+weeatZtM/HBj6ypYQDGchF9cXRsU3MhpGeO3RUDYK27Kamz4Kj0hPKLcX9JsSh+vcnDPa6CHJdJllTO/1I/y0pfbnScmvOnmDbXc7RxEteoGbJ2EXpx1AP9E3Mxny+/JH5EckUSVZo9Dd9jhQYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744872854; c=relaxed/simple;
	bh=F9+k68eg/jTspWh3GwcR+JKC+kRlMvEl78BGbtRzq3M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=vEqiOuwKfSm9NXDLf9mUU5DG6T8QV3QPNaKmzqdXcWprOgahiBb6+EI1UTmi7v7pb9fLF2MYkqNT6vVBtaa+UkATaIeerxWEVarLz6imc6sfs4sGZ3vR1mudillTU1E4+045EUdABc33bYpJffldGWo1efQNDG2ECPvnqZO988E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fJOvSLTw; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744872852; x=1776408852;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=F9+k68eg/jTspWh3GwcR+JKC+kRlMvEl78BGbtRzq3M=;
  b=fJOvSLTwXUBl5i/jsb7xcCMfyzbARMaZuzf64zhFm6J2dT1ELnVIY8gN
   Yy5lRAC5w28+iO2xb+lv+jU+Vc/wPjPI64BfjJrQggIWb1bUmgi8DyLkW
   jr6rzCT+IdoZGleMnHYqOSWutGG0ybINVJhacepKmYc9IyFuKhEW2Ldc7
   Ou8DF0jfXXhsnGd/qFfXfDUSgs+CgLkyK/gWYUEoEjki7JmCrvsdD/30R
   EWmlWbd4fslpHzlRjsXJT1UI2OnHthAMtzWqBeIr+nscRORdyyBVoYMc4
   AJEZ1To1eLd4566WCuzMaBOj/gvSuDafJK+pR81U9ICMypiKbT3mt39c5
   w==;
X-CSE-ConnectionGUID: 9kSp6HLZRcGqB1kxKdDXFw==
X-CSE-MsgGUID: 08otw/yRSiqR6uqhiSSTRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="71831266"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="71831266"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 23:54:08 -0700
X-CSE-ConnectionGUID: /YcTkLoEQfyBpGJbMRnaAA==
X-CSE-MsgGUID: zadACsEATBmfl4BRyalaLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="131262179"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 23:54:08 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 162E61203F8;
	Thu, 17 Apr 2025 09:54:05 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1u5J8P-001J4v-0E;
	Thu, 17 Apr 2025 09:54:05 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	dongcheng.yan@intel.com
Subject: [PATCH v2 04/11] media: ccs-pll: Correctly the upper limit of maximum op_pre_pll_clk_div
Date: Thu, 17 Apr 2025 09:53:47 +0300
Message-Id: <20250417065354.311617-5-sakari.ailus@linux.intel.com>
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

The PLL calculator does a search of the PLL configuration space for all
valid OP pre-PLL clock dividers. The maximum did not take into account CCS
PLL flag CCS_PLL_FLAG_EXT_IP_PLL_DIVIDER in which case also odd PLL
dividers (other than 1) are valid. Do that now.

Fixes: 4e1e8d240dff ("media: ccs-pll: Add support for extended input PLL clock divider")
Cc: stable@vger.kernel.org
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
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


