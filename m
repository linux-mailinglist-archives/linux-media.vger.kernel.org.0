Return-Path: <linux-media+bounces-30405-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 337E6A91462
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 08:54:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 61C361907429
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 06:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18B5621A431;
	Thu, 17 Apr 2025 06:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i6MuiYC4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C61218ADC
	for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 06:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744872857; cv=none; b=e04JCBVqJ+5JaZcI0cpH7RgTWBz9A+UEJ0ODFTjLGqHtylFhoXmEN/MNxQ3cDmlm1MgBlkW6y7AUrlzkLTmrtRsnHkmdLV0r26yy9UGlIPLke5GCg+B2zax3NSAfs+JjQw8Impi1mKV6R2YgXatuhsebnh00HTZL2rYKUba33sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744872857; c=relaxed/simple;
	bh=oT8lrJXjUDjaL+mQZOYcVlZLbtQFYK5IGM/1aEzP0i8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UUSVFEPYw4/zbH7JmXGxHtM1BmMV8EFdQqLH6NXPLdZ6DOMFIr1hWYoZpOVx4OqJ6YyBVodG8VENpraz5d9bX5WkRto+RR3yZm3JtbX5ChhzaKxlMmi8tP2HbvTAXeAuZbygArNzY1OqyjQJm7M0aXGP94rKn8jOh+ZTguTPHwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i6MuiYC4; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744872856; x=1776408856;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oT8lrJXjUDjaL+mQZOYcVlZLbtQFYK5IGM/1aEzP0i8=;
  b=i6MuiYC4hE+nOH8y9A7XjTB+kirpMZchtiPyimGPLnHFi09ACadI4tZ/
   1hpcENDYy1yxttF4EHLjwOod3IwCwqAGxVkJAI6gXuD4gayt+uzx0zT2R
   YagSv/yisRVeTsSHu2oMQn8ofQoqfjFESo345Cf54c7F/Eo/LWSq+fskc
   uMlArReTSllmBMYnNSjHJ7t9gvyWTsfbQbCNITI1aPBM8oLpaflATBaRN
   8txEGcaju+tueUQ1b3JntKbFv/si18qAROUmyrPEz+g9jSW/A+gdVGf4D
   t98UMiopoDn2+gi7/7dqaTvHuXEoX0dfYW+kA3k31BM8qOqRdvRTyJeq1
   g==;
X-CSE-ConnectionGUID: 5gqBFqkfTsG0ZyQezUYKAA==
X-CSE-MsgGUID: +ui1ZvtWTLahpiJiCwGA9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="71831289"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="71831289"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 23:54:12 -0700
X-CSE-ConnectionGUID: Qddw6o5WTcK+vRiSFVYncg==
X-CSE-MsgGUID: jffXft+LRtS7/ppxa609GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="131262200"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 23:54:11 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 326F3120819;
	Thu, 17 Apr 2025 09:54:05 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1u5J8P-001J5P-0c;
	Thu, 17 Apr 2025 09:54:05 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	dongcheng.yan@intel.com
Subject: [PATCH v2 10/11] media: ccs-pll: Print PLL calculator flags in the beginning
Date: Thu, 17 Apr 2025 09:53:53 +0300
Message-Id: <20250417065354.311617-11-sakari.ailus@linux.intel.com>
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

Print the PLL calculator flags right away when the PLL calculator is
called. Previously this was done only in a successful case and that didn't
really help solving a problem when one happened.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs-pll.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index fc6f8aff5fd8..8e01be4b0785 100644
--- a/drivers/media/i2c/ccs-pll.c
+++ b/drivers/media/i2c/ccs-pll.c
@@ -123,8 +123,11 @@ static void print_pll(struct device *dev, const struct ccs_pll *pll)
 		pll->pixel_rate_pixel_array);
 	dev_dbg(dev, "pixel rate on CSI-2 bus:\t%u\n",
 		pll->pixel_rate_csi);
+}
 
-	dev_dbg(dev, "flags%s%s%s%s%s%s%s%s%s%s%s\n",
+static void print_pll_flags(struct device *dev, struct ccs_pll *pll)
+{
+	dev_dbg(dev, "PLL flags%s%s%s%s%s%s%s%s%s%s%s\n",
 		pll->flags & PLL_FL(OP_PIX_CLOCK_PER_LANE) ? " op-pix-clock-per-lane" : "",
 		pll->flags & PLL_FL(NO_OP_CLOCKS) ? " no-op-clocks" : "",
 		pll->flags & PLL_FL(EVEN_PLL_MULTIPLIER) ? " even-pll-multiplier" : "",
@@ -738,6 +741,8 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 	u32 i;
 	int rval = -EINVAL;
 
+	print_pll_flags(dev, pll);
+
 	if (!(pll->flags & CCS_PLL_FLAG_LANE_SPEED_MODEL)) {
 		pll->op_lanes = 1;
 		pll->vt_lanes = 1;
-- 
2.39.5


