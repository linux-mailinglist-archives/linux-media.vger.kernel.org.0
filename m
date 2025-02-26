Return-Path: <linux-media+bounces-27043-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6EBA460BF
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 14:26:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BAF31899A0B
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 13:26:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D5E92253A9;
	Wed, 26 Feb 2025 13:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CqhfiggM"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5DE2236FD
	for <linux-media@vger.kernel.org>; Wed, 26 Feb 2025 13:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740576219; cv=none; b=u5AOjC/zVEZSHynsQkAPuIZQ8qPPwmL/qgQ6r2xIjagTXLglSSOsqyuna2cOlVow1Jqfvxvx2W0J/7sdkSZ8pZkIU9lscRmkrVisZPO1QL2wq6IeDtdyAe52IcXBvUBs9bErD+LGBFC07YgRlweQR4hLLhviUfaCoDz/xc7AoVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740576219; c=relaxed/simple;
	bh=gRD0Q1qrn776M7hGqXsnkc6yfrtOKZuxi+e7K6aIybY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=L30A76bl2+Rucp0QU+328jRf8ma0SK7icNNijj2K8HXjP5xeBHdIQWGlL/XVVL5/QiCQvvze2AIj60VCl1KhtZXtSCcZ0uXvwCv5HB+/oE70oYPfHVxQekfDeJs+m8CtvG/ZKOyBXlT6BaEB69IrSRpZofNwMhQHg7f+zR6SuKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CqhfiggM; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740576218; x=1772112218;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gRD0Q1qrn776M7hGqXsnkc6yfrtOKZuxi+e7K6aIybY=;
  b=CqhfiggMWbpC9cT3geCVdlonzUloKWFegE14eXr9ogj7nCSl6hAV08fJ
   v5fmbKZE91zCbn564uxeYGwEDoAt2uKkIwrkFvca5GnVznmpeHpruSehX
   qxcWNZHDGrUWgMADa9lS7UT4Hj+xeQyhhnJ5Z6b3MjC5+GkwUd6UIvURY
   padabq2houAT3a0Pm4KFUnbj2c92Rptpyf6w+SUSCroDc4B8CLn6Yt27k
   zHkbREOqnojdLJSE2kAbZw+BC5pDT8UyRzcMch3cMyaWeFyzz7sgWSv/l
   g4pAEc+98Az9C68KZ3EyP4KkCNgIBFX8Sxum/T5Qwh2aJXtgs8PiPq9Zf
   A==;
X-CSE-ConnectionGUID: +aBS3OrES/mRjEv+3Yn5Pw==
X-CSE-MsgGUID: /BhXOEZaQDuBbvdsO9R2VQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="45331992"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="45331992"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 05:23:33 -0800
X-CSE-ConnectionGUID: Y04ZZBBtQs+PyQ8L7MOKLQ==
X-CSE-MsgGUID: T0A6jNzIS0+0bt6X0pNQ1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117622421"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 05:23:33 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id F2BED1206BB;
	Wed, 26 Feb 2025 15:23:29 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1tnHNp-00AYy0-39;
	Wed, 26 Feb 2025 15:23:29 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: dongcheng.yan@linux.intel.com
Subject: [PATCH 3/7] media: ccs-pll: Check for too high VT PLL multiplier in dual PLL case
Date: Wed, 26 Feb 2025 15:23:15 +0200
Message-Id: <20250226132319.2517656-4-sakari.ailus@linux.intel.com>
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

The check for VT PLL upper limit in dual PLL case was missing. Add it now.

Fixes: 6c7469e46b60 ("media: ccs-pll: Add trivial dual PLL support")
Cc: stable@vger.kernel.org
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs-pll.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index 98ffbdf565f3..9041c020e34b 100644
--- a/drivers/media/i2c/ccs-pll.c
+++ b/drivers/media/i2c/ccs-pll.c
@@ -312,6 +312,11 @@ __ccs_pll_calculate_vt_tree(struct device *dev,
 	dev_dbg(dev, "more_mul2: %u\n", more_mul);
 
 	pll_fr->pll_multiplier = mul * more_mul;
+	if (pll_fr->pll_multiplier > lim_fr->max_pll_multiplier) {
+		dev_dbg(dev, "pll multiplier %u too high\n",
+			pll_fr->pll_multiplier);
+		return -EINVAL;
+	}
 
 	if (pll_fr->pll_multiplier * pll_fr->pll_ip_clk_freq_hz >
 	    lim_fr->max_pll_op_clk_freq_hz)
-- 
2.39.5


