Return-Path: <linux-media+bounces-30806-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2F4A989E1
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 14:34:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AFAF216D0EF
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 12:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 376B4270566;
	Wed, 23 Apr 2025 12:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gMdqisrp"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6EF25C819
	for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 12:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745411662; cv=none; b=Svv29qQWzcPf3wKFsxJjwnt8iO6vfv4bAbBlh019oWLtQhvhw4KvPPfiyfv2Dtt9PdkSNhebr1O8WISP7iWJJ3NSdY8n6ytXUaju00nqMBhgh193GxPi4HFJqaBI/o48Q2FcywsxME15fuR803Zy/WL1qUdb41SLDWjereC/BFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745411662; c=relaxed/simple;
	bh=63FCdcH5gDwcLruzhcm595Dtm9ImWM9VMMACWwJXR5A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eO5agADomjhHW0fFi48BRrH/ppQW7Bfvs8zrlUJ7k3BCX5KhYGWzLAyIulN30A2Jg5tsrJpJ2Pv2q5dRCJ2IRQTGj4bwipgCc9E961Qx94Mglvcmz+kvU1Y6Qn3E8+E8B2AUWPA9cayONKSUet05QH4iLn9JqZ5QimHI8LoYpRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gMdqisrp; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745411661; x=1776947661;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=63FCdcH5gDwcLruzhcm595Dtm9ImWM9VMMACWwJXR5A=;
  b=gMdqisrpJJOJbwnJAByaO0k702x/M2O7WOk1gluvOmOo/d8q4ic+z1tc
   W7hEfd/a1KLGB5ML15Q6lH0Smk2oRuAOwz/XGOqWxa64Y+HyT823CkwzR
   YHvlEcwhQzTYawaHAzWsRsOhDjk9Fevu/LdLAuP/4Y0CoKegG76B0Fttq
   n26yB5B7MYYKNrg8907l6M2PwYGmX5G8yASqhR6ge8EANQqTMSvBEaSjP
   lmnVlGLHA9xGf4bF4+T/mKVWKNn56FfgZZ5SYRqKaYmGgcWcp46iOdY7w
   +w61Fr97j+BwkqQKLFNcGRClnQiA6SNCcM6GHUyfevnU4MF/QSOb+9nma
   w==;
X-CSE-ConnectionGUID: sSpDYFqXQMybhNfAUsb5zA==
X-CSE-MsgGUID: uJ/qW9msRBe3zLrakPDypw==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="46704395"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="46704395"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 05:34:18 -0700
X-CSE-ConnectionGUID: XqCSO4s+RUytXDNLnlGagg==
X-CSE-MsgGUID: HHFBIB2YT4O79x2nGMcPlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="132148616"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 05:34:16 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id BE1EC120758;
	Wed, 23 Apr 2025 15:34:09 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1u7ZIn-007YVl-2T;
	Wed, 23 Apr 2025 15:34:09 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	dongcheng.yan@intel.com
Subject: [PATCH v3 05/11] media: ccs-pll: Print a debug message on too high VT PLL OP clock
Date: Wed, 23 Apr 2025 15:33:53 +0300
Message-Id: <20250423123359.1800904-6-sakari.ailus@linux.intel.com>
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

In general the CCS PLL calculator prints debugging information on the
process to ease debugging. This case was not annotated, do that now.

Remove an extra multiplication while at it.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ccs-pll.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index d985686b0a36..66d046d576f7 100644
--- a/drivers/media/i2c/ccs-pll.c
+++ b/drivers/media/i2c/ccs-pll.c
@@ -318,12 +318,13 @@ __ccs_pll_calculate_vt_tree(struct device *dev,
 		return -EINVAL;
 	}
 
-	if (pll_fr->pll_multiplier * pll_fr->pll_ip_clk_freq_hz >
-	    lim_fr->max_pll_op_clk_freq_hz)
-		return -EINVAL;
-
 	pll_fr->pll_op_clk_freq_hz =
 		pll_fr->pll_ip_clk_freq_hz * pll_fr->pll_multiplier;
+	if (pll_fr->pll_op_clk_freq_hz > lim_fr->max_pll_op_clk_freq_hz) {
+		dev_dbg(dev, "too high OP clock %u\n",
+			pll_fr->pll_op_clk_freq_hz);
+		return -EINVAL;
+	}
 
 	vt_div = div * more_mul;
 
-- 
2.39.5


