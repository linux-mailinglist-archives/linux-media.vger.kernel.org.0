Return-Path: <linux-media+bounces-30397-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A021A9145A
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 08:54:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A6EE19072BD
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 06:54:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 218EA217F32;
	Thu, 17 Apr 2025 06:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XGu1s3qL"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6FF2153D8
	for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 06:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744872852; cv=none; b=IcdO8OE2p866uOgs8sFll+Dx4/50fNe4QGU1M3KWWvJy+B4pNMca2W52QVKRGEqf7yP3fQ+/75T/rprXr07Z4NnvJCMH6mxkXFgeOCHwS0DV1NTe40ON8j+qmTnePoDkY1c6XFAwSakUr5XVrYc2KIEx2MBdZCOfZ73yI+9lECY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744872852; c=relaxed/simple;
	bh=S2b6wLTroiU7yt0os7dEpVEeDuhJh1dqNBNFEIQ59Kc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IRT+mjJL4tDZxjKeEcQhUoK2D/nsAG9KtgcJ80e2MA4fIInqZcHD28jt1GB67qjXVie8Jhd0BE9FUXJbfvz+fZZfleUCryBBVdSlxa9cwUbXkqosAUOTG0E3D9557sOsjQaWnJU9F3JOp1Ztil2XOx2gYAY557zjrDMRxeV8sbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XGu1s3qL; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744872851; x=1776408851;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=S2b6wLTroiU7yt0os7dEpVEeDuhJh1dqNBNFEIQ59Kc=;
  b=XGu1s3qL0HbF0Aj0Zk8UugwQeBH49S9oJ6xW28oo3k22HqUBFJo3S1Tr
   d08QF2sqmJoe7zGVxUSnkDa3BG/ypXNQIeyaz87Cjc+O/av5EfXwvLKm3
   WyNkKR0afA26kVtAnlLCq6tso31dq1po3vfrsPatR+hDwnJMd5K8G8BlB
   R+iM1q2IqmVOJsaCYcGr1QGKHL8jHQmBNLyFOPywo6Dr7rG4aZW6D1fzL
   oi+hHi57A66q/A/NGyMQBZry3CBjxBv2wIMM2GOk1suXWsJa3YBjV/okj
   bNzfFSUSWzhW5tZaZjDnQ95R1OHFMDpshReuUuyCM08M6kiLCpLs7iHEe
   A==;
X-CSE-ConnectionGUID: MzHHnClwQ32+Y81FPA3tzQ==
X-CSE-MsgGUID: HaMc5VqiRUq3aUubMyKlmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="71831262"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="71831262"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 23:54:08 -0700
X-CSE-ConnectionGUID: XMnDvqn4TGqQeOrBygXhdg==
X-CSE-MsgGUID: h1U65aThR9Sld2E22ykdtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="131262175"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 23:54:08 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 11A911203B9;
	Thu, 17 Apr 2025 09:54:05 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1u5J8P-001J4q-0A;
	Thu, 17 Apr 2025 09:54:05 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	dongcheng.yan@intel.com
Subject: [PATCH v2 03/11] media: ccs-pll: Check for too high VT PLL multiplier in dual PLL case
Date: Thu, 17 Apr 2025 09:53:46 +0300
Message-Id: <20250417065354.311617-4-sakari.ailus@linux.intel.com>
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

The check for VT PLL upper limit in dual PLL case was missing. Add it now.

Fixes: 6c7469e46b60 ("media: ccs-pll: Add trivial dual PLL support")
Cc: stable@vger.kernel.org
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs-pll.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index 2399cd6509b7..266fcd160da6 100644
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


