Return-Path: <linux-media+bounces-27041-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF80DA460BE
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 14:26:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F121F17A90D
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 13:26:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DD3E21E0BD;
	Wed, 26 Feb 2025 13:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hlRqcyfg"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700D921D5A9
	for <linux-media@vger.kernel.org>; Wed, 26 Feb 2025 13:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740576218; cv=none; b=GUEdH5GzblI/AneOeMuSOutr7eKE3miESRQsL3gnYegkiehHUg8OqT4uEzv6jazndo0uxAm3BukNKakZ9k2ALC5RJSHWalsaGhq4RhezlVcGuPHFZc43xZs+vozaAmW/oZ730GFG+5KQTBWdxwfLgyjKEqE9HT9keZv68CesRNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740576218; c=relaxed/simple;
	bh=awEl+aT1ZWUaFkTkmy8XLmueUXXqs2xiQMrMb5ubq5E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sKcchcs7YhTXyco6UYtDhMx6qbqC81GQ9i8jpdSYiesegr5XD0qmSYFBtYyDS6mmxJsQsw7jU3DBUib41gznp6TEfm9FBDxYDtmJwqlA+VCBBA3nrZ/YsEU6hwyoAWq/ZluA18TZL94bSgM225xlMnK2zOgdSeccI+nuVyKmXGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hlRqcyfg; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740576217; x=1772112217;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=awEl+aT1ZWUaFkTkmy8XLmueUXXqs2xiQMrMb5ubq5E=;
  b=hlRqcyfg3iEw8gdgefeWCc/2HAT3nCt8zwknkyGZ7y7a0QkX7bOM3nVw
   O050n1TNV83n+mFFLX50j6Q5O79wdhZc7WgIr3lgr8bt/Oo8yqm9lNj3I
   6lRWyOXv5XqvTqWDOWBrN//MvDWgeaomz0kudoXjrO8Ti/PMV7wdgpAVu
   /VVi9nVS4/KlQhfVQhZbO7fvluRGmIE+6dsp191Ii8KgIbCq3qoPE6PKk
   7fE/5gF2YK4yVTSe4lnGdLgSkY86IGTSDNXCjOwfKeg61phMz2+Wk+H60
   Y/lBkcUvf0nP/k3Dg5fZgco5Pc3shmRpB5Oa0OouWQuRckAYYw2X7P/8X
   g==;
X-CSE-ConnectionGUID: b02CFzKoR12BdlomU6SO4Q==
X-CSE-MsgGUID: G9ufjP69SU2zeoWIwTiFdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="45331991"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="45331991"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 05:23:33 -0800
X-CSE-ConnectionGUID: eVNanJnnQjSLN7CuAzpiYQ==
X-CSE-MsgGUID: 0mXQ51JhQ4eyHgmwtD/BEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117622420"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 05:23:33 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E7FE311F99F;
	Wed, 26 Feb 2025 15:23:29 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1tnHNp-00AYxp-2y;
	Wed, 26 Feb 2025 15:23:29 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: dongcheng.yan@linux.intel.com
Subject: [PATCH 1/7] media: ccs-pll: Start OP pre-PLL multiplier search from correct value
Date: Wed, 26 Feb 2025 15:23:13 +0200
Message-Id: <20250226132319.2517656-2-sakari.ailus@linux.intel.com>
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

The ccs_pll_calculate() function does a search over possible PLL
configurations to find the "best" one. If the sensor did not support odd
pre-PLL divisors and the minimum value (with constraints) wasn't 1, other even
values could have errorneously searched (and selected) for the pre-PLL
divisor. Fix this.

Fixes: 415ddd993978 ("media: ccs-pll: Split limits and PLL configuration into front and back parts")
Cc: stable@vger.kernel.org
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs-pll.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index cf8858cb13d4..6f99cb8be02a 100644
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


