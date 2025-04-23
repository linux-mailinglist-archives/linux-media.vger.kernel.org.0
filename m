Return-Path: <linux-media+bounces-30798-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B289EA989D9
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 14:34:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2B2CD7A8366
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 12:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22D1B26D4C4;
	Wed, 23 Apr 2025 12:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TO+lXc4U"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E586B264638
	for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 12:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745411657; cv=none; b=YZHvtW0VUqGVoZThavZtkjVpnApDxGp9LIlo358W27AMFWtpPnoNTLkUY6WX+pFqgx3Fl8atWdNbDG6Tu1pU8oWFIfQSfplDLMf1njJ+7Cvhwgl+P3z1qW4uiCJOfPSfx6l/rqS+PQaxrBqwjKF09VmEaOJZgvp4SoC/Y3Z47zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745411657; c=relaxed/simple;
	bh=DGqYbDR3H/TGaQNaSs6bvd1u1tXEMHeBNeklghTpcxQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JBiP/SNGo2qCLK3WeJ2+F1biNPf2Tw1o8qz1GpYuDFo0pY1CQJZag/nJKwi1ly+TtAp4IVNo4TRn61ztYjm2YDij0I/DCfyQk/m0g9IymaVFJTzVy8AkdA7Hb3J7Ln1SZ+B0EoYCtfycNAu8obPR3ONFJkdcvWObVCp2cxdINMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TO+lXc4U; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745411656; x=1776947656;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DGqYbDR3H/TGaQNaSs6bvd1u1tXEMHeBNeklghTpcxQ=;
  b=TO+lXc4U0F4kbggspF3m4Ha+aq/6+CNtZ/H3CDb+3nd3CNd3Brs6GW2T
   mPhCAY2Evdn/v4wJ6GxwUFZHUwbCQihHlazZP1lWC0+Y2/746sqqq7MGh
   q2paHdSIaUMXbXcUqoqB7C3ypoVrRLVEmvYtB8UBas4DP+Ri0xANMCIfH
   0M/xdZLj8yUGZfdO/it2yIA0DdhmyEc9omjCSi72J9ZO/Kwz1yh7PGyFc
   iHFv1fiFvvAHgj7gtVD9zvTl4nNJpXc8gSSbUnjIrNQ3Ku9ycQXPgOyZ4
   AUbpIbV9wpJQ2Ju+7EusCOCu2sI2TY4LQM/2SxFE6PpDLA1lzXPrIbW9Z
   w==;
X-CSE-ConnectionGUID: UHM7O5/NSDCLi9Ebh/lMXg==
X-CSE-MsgGUID: ioCZ2nGxRC6SSp41i2FW6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="57991787"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="57991787"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 05:34:14 -0700
X-CSE-ConnectionGUID: lRYozMAFR1GkhN12gj3lgw==
X-CSE-MsgGUID: 4smeyjnMRECZvwZ2a7qxqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="133257303"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 05:34:12 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B3F9311FC44;
	Wed, 23 Apr 2025 15:34:09 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1u7ZIn-007YVV-2I;
	Wed, 23 Apr 2025 15:34:09 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	dongcheng.yan@intel.com
Subject: [PATCH v3 02/11] media: ccs-pll: Start VT pre-PLL multiplier search from correct value
Date: Wed, 23 Apr 2025 15:33:50 +0300
Message-Id: <20250423123359.1800904-3-sakari.ailus@linux.intel.com>
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

The ccs_pll_calculate_vt_tree() function does a search over possible VT
PLL configurations to find the "best" one. If the sensor does not support
odd pre-PLL divisors and the minimum value (with constraints) isn't 1,
other odd values could be errorneously searched (and selected) for the
pre-PLL divisor. Fix this.

Fixes: 415ddd993978 ("media: ccs-pll: Split limits and PLL configuration into front and back parts")
Cc: stable@vger.kernel.org
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ccs-pll.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index e516ed23e899..2399cd6509b7 100644
--- a/drivers/media/i2c/ccs-pll.c
+++ b/drivers/media/i2c/ccs-pll.c
@@ -397,6 +397,8 @@ static int ccs_pll_calculate_vt_tree(struct device *dev,
 	min_pre_pll_clk_div = max_t(u16, min_pre_pll_clk_div,
 				    pll->ext_clk_freq_hz /
 				    lim_fr->max_pll_ip_clk_freq_hz);
+	if (!(pll->flags & CCS_PLL_FLAG_EXT_IP_PLL_DIVIDER))
+		min_pre_pll_clk_div = clk_div_even(min_pre_pll_clk_div);
 
 	dev_dbg(dev, "vt min/max_pre_pll_clk_div: %u,%u\n",
 		min_pre_pll_clk_div, max_pre_pll_clk_div);
-- 
2.39.5


