Return-Path: <linux-media+bounces-30801-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A61EDA989DC
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 14:34:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5E8F163199
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 12:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F02421C194;
	Wed, 23 Apr 2025 12:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HbVSBX7Y"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BC726A095
	for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 12:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745411659; cv=none; b=psXsHcSjp484dn2PLJxjIOpoGFvhR0O11vGwgXqFESUyxcrodJwYkIATMsrLO6J4UYi3JvEkktuBDh1Qtt21qVtyE5aTEdYx00utL1j/PUsdhCDeEVF2dvRLoxeagmYgJBrnkOai1DvC21QLuV6Sn8AaTVFZsBD73iJnIG1IdO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745411659; c=relaxed/simple;
	bh=SjKcUcoAQoDWZp1HcjvTv8QlYTTV0Gj0gCrT2R86/4s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JTfCjS4BQB7bXQx+qeLBjtRZeOVicbrpoZmLGQnzWO7AFRdqMQdWaSoaf8UxuqX194zFa1Mk2uGBDhnoEeQ0iBSQ/R+SuTARj/POoJPMQSc55MBxlHwpYgEep3vENnQYexlsxwebKUU1u8dU4gFry2E40UGGLA9E1BoT7tFyjNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HbVSBX7Y; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745411658; x=1776947658;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SjKcUcoAQoDWZp1HcjvTv8QlYTTV0Gj0gCrT2R86/4s=;
  b=HbVSBX7YTcXQsrzP0rNLXM8S2oXIkf20xuPITufW6qBvdDZWIGnUze4T
   9pl7oJK0h5Ilgl3sFhOPppkjbtbAxAXfijN+GW/B6Mit/jTHaRL6KHBYZ
   YSIsVspvYuAjQFw9IN9pxBIClVJfop2yi5IqUeifnGmhDR9kThti92lCV
   HHFqNYv9P1iQNoVTfExpN90WGygizHtj0zj4kEKR0/4ajvcJ9BEM0PLdS
   dyqWBH3kxtkxQAjO03HyycJKgEg7FkfQIYQe8JAgmf+q0Iywu/THfW+26
   mfhHM/GxM37N0qgEDfj3oDNAS6A0qtVTkaXzpCOzpgmldWa77CYsP55Fa
   Q==;
X-CSE-ConnectionGUID: nN69eJUdRU2bdchA2Yhmog==
X-CSE-MsgGUID: o5FANKIwTx68NqkwTOUvNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="57991791"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="57991791"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 05:34:14 -0700
X-CSE-ConnectionGUID: ZK8fPOd0RvWC8JYBrYlFmA==
X-CSE-MsgGUID: b3PdSUvWR8uS/smxHLqmsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="133257307"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 05:34:12 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B71D7120202;
	Wed, 23 Apr 2025 15:34:09 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1u7ZIn-007YVZ-2N;
	Wed, 23 Apr 2025 15:34:09 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	dongcheng.yan@intel.com
Subject: [PATCH v3 03/11] media: ccs-pll: Check for too high VT PLL multiplier in dual PLL case
Date: Wed, 23 Apr 2025 15:33:51 +0300
Message-Id: <20250423123359.1800904-4-sakari.ailus@linux.intel.com>
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

The check for VT PLL upper limit in dual PLL case was missing. Add it now.

Fixes: 6c7469e46b60 ("media: ccs-pll: Add trivial dual PLL support")
Cc: stable@vger.kernel.org
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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


