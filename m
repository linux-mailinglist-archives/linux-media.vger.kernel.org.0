Return-Path: <linux-media+bounces-27039-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEECA460C0
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 14:26:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 97A7B7AAE19
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 13:25:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8A252222D6;
	Wed, 26 Feb 2025 13:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lKBDyFDL"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BFD21D3F0
	for <linux-media@vger.kernel.org>; Wed, 26 Feb 2025 13:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740576217; cv=none; b=RuL4/yeIcGa5E3FJTR8Jn1yvtOS7bkB/tnRMObHusKIS/Yg2wTNptKU+roKV1Hu6/TeDOPI8ErT6d0wtFpnHyu9VbemSjl9ErbZXfDUONu+Kbxf8xKWVBNwsjib8qa8lqAmR6btTjsfIEvSOUzBFa+AQ5i7ZmqckniTDHqvt77A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740576217; c=relaxed/simple;
	bh=9zy25p+4hDQ9P7lGIKFIAnelGSC5iWCv7n+NE8Wwhbk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mRrBT+TGoBm1zpnJ74qRoxgXKkF74ocvpsaSILGxp+W43FDWpnuUm233BrnZFg4hlRq5juT6dZBV92VOX6Q0B/8fRCgr/lajB5Lc0AFCka5MjM5LFQlD9bgjl/MJrsxW4/viRuKiyD8jj3arbTCxXSES1oIIOa3a3tpvzH7ewOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lKBDyFDL; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740576215; x=1772112215;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9zy25p+4hDQ9P7lGIKFIAnelGSC5iWCv7n+NE8Wwhbk=;
  b=lKBDyFDLmjOubrPkjgA2f+oYpbed5ukFq0WUudYzyVIWLoC3pAJVWsAY
   fx2KBuFgq69+ob0+B0uIvi+lNMcNVrGRK1p2Ulzej61aRLG6iWFEqJZRV
   ur4rjnpUb9UO6i0pI9N71UE5hfl8EJMAwiHx5E7rTmwI3SvSfDUwEPVHv
   BQ5QKBGKPBcHUu3XeVlLPT9fr5mUd2pE/ZhrUKtpujDXdOa5DzCuG1K9l
   9geXk7VkKS+/DpyMJJxb2zNnP29WK4JNlaG7Y41TFymf5f2vxk5Vb+r2R
   /TLvjE1mcFwm8D3uo5h+2P44V6WWpf61fuvOT2raJ9256AVOqXg9SUMDz
   Q==;
X-CSE-ConnectionGUID: LFaPOWH0Rgudsqxf3OC6tw==
X-CSE-MsgGUID: DFsBLRNBRseBbYLm4QNXdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="45331989"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="45331989"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 05:23:33 -0800
X-CSE-ConnectionGUID: +BNKhYoCQlS9jxRkXR1DcQ==
X-CSE-MsgGUID: NngVRci1QkOAZ6S6qKDZvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117622418"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 05:23:33 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id EEDC411F9AC;
	Wed, 26 Feb 2025 15:23:29 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1tnHNp-00AYxv-34;
	Wed, 26 Feb 2025 15:23:29 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: dongcheng.yan@linux.intel.com
Subject: [PATCH 2/7] media: ccs-pll: Start VT pre-PLL multiplier search from correct value
Date: Wed, 26 Feb 2025 15:23:14 +0200
Message-Id: <20250226132319.2517656-3-sakari.ailus@linux.intel.com>
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

The ccs_pll_calculate_vt_tree() function does a search over possible VT
PLL configurations to find the "best" one. If the sensor did not support
odd pre-PLL divisors and the minimum value (with constraints) wasn't 1,
other even values could have errorneously searched (and selected) for the
pre-PLL divisor. Fix this.

Fixes: 415ddd993978 ("media: ccs-pll: Split limits and PLL configuration into front and back parts")
Cc: stable@vger.kernel.org
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs-pll.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index 6f99cb8be02a..98ffbdf565f3 100644
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


