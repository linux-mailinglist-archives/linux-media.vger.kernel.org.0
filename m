Return-Path: <linux-media+bounces-30803-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C82CA989DD
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 14:34:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8994C1B66DEB
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 12:34:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C43426FA7E;
	Wed, 23 Apr 2025 12:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HW2N58bV"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559DC26F450
	for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 12:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745411660; cv=none; b=sHT2DzDXeyFLTXgNbhYOpJzOomtgVjZqkHT1753r2mm4FHR20vGFYRsRjrQKN7gvKCYaRBzMgj7vQdvmmXvquW8httPY1S1XApHv96iRoPOGLaRD+sj7BSK0+bTF+/PzVi9qrWnaxkMBdWGGF7JjgKe911fCi5EctZjW4weuP1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745411660; c=relaxed/simple;
	bh=pWDQct2as6cW5qqRC7JQR7E6YJSYK8ZYor9gzeqUFh4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LcNxzp1U7cesylwxCS3L0YN7uiq+du7Fetg134Ot9KM9JNhw42PrrzEXTanGUOK3RBFIn1eWyXf2lZIdX+sFE9HjMtTijQvcusZ97MXAVpAsfjGbP3lNXh+IblysPafG9hiQAvAZVjFWI4PnxrI66AiBkxxyrCoz5ttzx1sn5xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HW2N58bV; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745411659; x=1776947659;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pWDQct2as6cW5qqRC7JQR7E6YJSYK8ZYor9gzeqUFh4=;
  b=HW2N58bVO2NU7LbsBJwVRR2dPANKq2NJue4zV65UE9KfDoXXcwtuuhoZ
   tkUIZPvHgSRyryY0p0hBSy9DwBGd8iHTy4tKuMvDpC73zUuP3f1lPnbbU
   Xfp8ONGZsm7IGJxbfWxku6faNSrQQIT7DllrEB2j01IRiTtTd2LYp2kMo
   Mrfp7tMOyUCGjhMMyPRUAjD+3ii/S2DimobZhd4vYvPJ/RmHonepRa+g/
   /nGxPoOPsDbB6sG98cpyGnnisBCf5RWMxdbkKVmg4YAtlnPqgddOI0FC9
   cOLQvoW7ADtXLIJixxDCFWVfyrYMtCTMh/mYUw3ewUr0d2JF09CN+zJ7I
   g==;
X-CSE-ConnectionGUID: H3vfhJhMQ8Sx2v4uRQpRfQ==
X-CSE-MsgGUID: 6oAInAcSTA+UHgzHsg/EpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="57991793"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="57991793"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 05:34:14 -0700
X-CSE-ConnectionGUID: bpm/BJWHSbSfBl9Bw9PWXA==
X-CSE-MsgGUID: a7vBz0jbQW6ZN1YeN45zOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="133257311"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 05:34:12 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B383A11FB1F;
	Wed, 23 Apr 2025 15:34:09 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1u7ZIn-007YVR-2D;
	Wed, 23 Apr 2025 15:34:09 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	dongcheng.yan@intel.com
Subject: [PATCH v3 01/11] media: ccs-pll: Start OP pre-PLL multiplier search from correct value
Date: Wed, 23 Apr 2025 15:33:49 +0300
Message-Id: <20250423123359.1800904-2-sakari.ailus@linux.intel.com>
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

The ccs_pll_calculate() function does a search over possible PLL
configurations to find the "best" one. If the sensor does not support odd
pre-PLL divisors and the minimum value (with constraints) isn't 1, other
odd values could be errorneously searched (and selected) for the pre-PLL
divisor. Fix this.

Fixes: 415ddd993978 ("media: ccs-pll: Split limits and PLL configuration into front and back parts")
Cc: stable@vger.kernel.org
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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


