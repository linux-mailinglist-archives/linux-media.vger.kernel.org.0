Return-Path: <linux-media+bounces-30401-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 023E7A9145E
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 08:54:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81DBA19072BC
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 06:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27CC81DDA0C;
	Thu, 17 Apr 2025 06:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FRXmk4kE"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB2621771F
	for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 06:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744872855; cv=none; b=BDX78V6P2P08VGV7FjZcabaYgdq2plMkBJnRpBp+wzTIxXbrIvOh148bV/Ty74FVXdSZoNXrqSyhZqAO2cThXY4lXcmWG/IdVgNVpOi1sR1MadONnvaUZ3Stt9qC+sN5F8rKDPCY/dyrHV7QUgl69Vfwh/ge/GEspBy+aiC3HjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744872855; c=relaxed/simple;
	bh=rUh1/pngwDbC0KfJpdGGi1p3DGOeij7otIKM3sKj998=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QhQF3tavDauWnKGGKRsI4InzerHJk0ZAiMbaZr8P10m6s9Dnzs0uVNPLnN8b2IyG2kOASUZon3GAFLFW+yfTcmmcumIUo0+MgyKcssV9uOJJ7OGX8QFPqMZbSNArHvoej5dsviTSlSz5zC9hxmsAZWjcuXo/gIjeQNh5pW3jzzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FRXmk4kE; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744872852; x=1776408852;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rUh1/pngwDbC0KfJpdGGi1p3DGOeij7otIKM3sKj998=;
  b=FRXmk4kE4x1AY9TNvqlLroENgsS5LeTM9+FHNlmhJLVOtkAn4XIvFxcr
   ikbLG6QJndA66E0bUDURsxwHsBVZ9U5qvouLIdo7qLkxcxteshMqk6ItU
   l6xS0NW+EaQQefya/VHPLwcJJ8gK0y0rPMaSvnPiD9MT0Jpon0x77HVxW
   rSfvsB87XpnBzyseBg6XNh2rstAYaGQF4xV7OJxf8zd/sFRUZh2CixprA
   30cByBDTKm5yYndbQSUMgSKVWi433Rcr56Iwafq6GuLP2EYc6ERuiOZuc
   Mlvy5k+2dAKvXiOwrSpFi8+9ZB8KDUSALmoQW+quB1zfwbc7la3fZspwm
   A==;
X-CSE-ConnectionGUID: GtaPnlHfRuKpDldmzJfM9w==
X-CSE-MsgGUID: UmKngpeYQgyPjQR5VG0rqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="71831268"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="71831268"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 23:54:08 -0700
X-CSE-ConnectionGUID: Tvb9MtomT5im5gNPsrDjUA==
X-CSE-MsgGUID: Ejo5nnuwSW6jmiYW89OuWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="131262181"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 23:54:08 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 06E5911F9D0;
	Thu, 17 Apr 2025 09:54:05 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1u5J8O-001J4g-3D;
	Thu, 17 Apr 2025 09:54:05 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	dongcheng.yan@intel.com
Subject: [PATCH v2 01/11] media: ccs-pll: Start OP pre-PLL multiplier search from correct value
Date: Thu, 17 Apr 2025 09:53:44 +0300
Message-Id: <20250417065354.311617-2-sakari.ailus@linux.intel.com>
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

The ccs_pll_calculate() function does a search over possible PLL
configurations to find the "best" one. If the sensor did not support odd
pre-PLL divisors and the minimum value (with constraints) wasn't 1, other
even values could have errorneously searched (and selected) for the
pre-PLL divisor. Fix this.

Fixes: 415ddd993978 ("media: ccs-pll: Split limits and PLL configuration into front and back parts")
Cc: stable@vger.kernel.org
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs-pll.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index 34ccda666524..e516ed23e899 100644
--- a/drivers/media/i2c/ccs-pll.c
+++ b/drivers/media/i2c/ccs-pll.c
@@ -815,6 +815,8 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 			      one_or_more(
 				      DIV_ROUND_UP(op_lim_fr->max_pll_op_clk_freq_hz,
 						   pll->ext_clk_freq_hz))));
+	if (!(pll->flags & CCS_PLL_FLAG_EXT_IP_PLL_DIVIDER))
+		min_op_pre_pll_clk_div = clk_div_even(min_op_pre_pll_clk_div);
 	dev_dbg(dev, "pll_op check: min / max op_pre_pll_clk_div: %u / %u\n",
 		min_op_pre_pll_clk_div, max_op_pre_pll_clk_div);
 
-- 
2.39.5


