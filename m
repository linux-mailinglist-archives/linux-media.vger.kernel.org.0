Return-Path: <linux-media+bounces-30398-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B488A9145B
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 08:54:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D52B5A2BC3
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 06:54:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC4DE21517F;
	Thu, 17 Apr 2025 06:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VjR1HNQg"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D751215762
	for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 06:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744872853; cv=none; b=YikDiSllStTNJATGSPFKvvEovsUZtyQeQVf92YOjJaU71977NGHe5KmppsgPeabAcHh82zaj/whcHAUb7mqr30AzB3aJjPnCS5xo2mT4E/VfxBKzDIXwY9/HRAdxyPK0+61e8Svlruar3gwaSALSDWewz/vyWRzarW29jm8EVoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744872853; c=relaxed/simple;
	bh=cpQqd78ijnvmn8Q2iSJEK9SHFso7+6a/a8jk/4fRHFw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gLAk0eqRQEUfCuleOh5GlsvgVgW+7Re/OTipZzVMfk6OqCunwxbTf4XVkT4OkDnQrSS8dD0xe9MNiH+3xe/GE2gNTbI9QjR/kI1g1ac+Klxtw/DSsulcneDUgf1u33ZM+1JHwG5H6xEzBcG28K26UdDpR3PHyZ/aZIcGF/l8UlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VjR1HNQg; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744872851; x=1776408851;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cpQqd78ijnvmn8Q2iSJEK9SHFso7+6a/a8jk/4fRHFw=;
  b=VjR1HNQgHENNBrAJC324yZwognvM+ye/mGfajrtZbVUmh5EqF/+0oKiQ
   5kosSP+wvNXlG8BGeO15kO5Bs4y1PbhRrol46w7XaN6STO65eVqiMdI//
   /0E+c0RE55U+ghFhQ3zdMozuyFUUi83ewbcNYw9rmOrNXm2gi+v1P+mLF
   VTO78FCU8yu09NMe7mjcuI2+Vi0aVrUAtkUjSGFT9/8CnItOxAs5DcVzl
   Q6uRrQTbTzgQCgjp4z1g+FFkcLs/OsyXomEIHdutH1pKHHIm1aMP4cjDM
   DAO7kSiUYpoLlbI5F716tn5e1n5xkLBOSG5C7BFSc5ovRhMk6vHFZZaWW
   A==;
X-CSE-ConnectionGUID: 6kKII2ewSLuXZVaHJYjpYQ==
X-CSE-MsgGUID: xcUNw5IxQ7uK3VBWPpYTZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="71831264"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="71831264"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 23:54:08 -0700
X-CSE-ConnectionGUID: mHYkqHiOR3ejIINoRzZLzw==
X-CSE-MsgGUID: eOdc3b79SIKU/Qm4xtqKAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="131262178"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 23:54:08 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 0CD611202AB;
	Thu, 17 Apr 2025 09:54:05 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1u5J8P-001J4l-05;
	Thu, 17 Apr 2025 09:54:05 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	dongcheng.yan@intel.com
Subject: [PATCH v2 02/11] media: ccs-pll: Start VT pre-PLL multiplier search from correct value
Date: Thu, 17 Apr 2025 09:53:45 +0300
Message-Id: <20250417065354.311617-3-sakari.ailus@linux.intel.com>
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


