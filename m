Return-Path: <linux-media+bounces-30402-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6CDA9145F
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 08:54:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 976757AE5A8
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 06:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61B89218EBF;
	Thu, 17 Apr 2025 06:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ns1UnkEt"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9672153CD
	for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 06:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744872855; cv=none; b=MFKEnbgM48bw+ixrmh2526Iim1X983mt6Xzx13mX+0BgYqnjW6wDLr69QtJuA571pa+PtC8K8bVF+cxRgCxfaesG47kwPZ2att5WQkK+zmvXqXvA7pmXc37iPzzbydhDoTtjmadlV5SvUozQvzEGp9+vz4THdSidrHJeIy6Uj5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744872855; c=relaxed/simple;
	bh=OYkUcvdwb0E1KXvYLHs+EHnLJPlFmqsCPx/bv3LT5v0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i0TK5Cy/+YMKUNx/nKbOvgaWa9RGv0X/cEKhWJQqQcODJnqRQWpFdK20eynrpV/6SKKYFABZmO7iOoqjmJPrRqHpKgNDxEo80mmiiyegvYnuLwmfSbAJkBk/MkUIB6HqgVeFIhDFJhMjeSpfEEhbyCS+J+oRAyE+JVP1dQ1G4yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ns1UnkEt; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744872854; x=1776408854;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OYkUcvdwb0E1KXvYLHs+EHnLJPlFmqsCPx/bv3LT5v0=;
  b=ns1UnkEte7driHArI8qNVq9zJgL4nYHv5ducvLBEt+Ayd6L12T/Y/EV2
   56Wd2J0rCCYSd+oM/XxnTqcDhiX9RTSjQH0IV85bdGqOZV0zeKd2hvsbR
   HpvZp1ZtqR3TdAalaqm6n8wYsE+0wHXfUTV2fGqKhmWwgykiD2ClXajS1
   nfoWg8AA+o7mIpcNlxbhiQzpIwXSEWrr+cUYI3BUHUBr2aSPQwIehZmOZ
   jSH/IDl9ZBa9ht9CTKWIw+qsRzP0WEGzl98hmeBeHiNrH+lY7whs7HX5Z
   vBGY3dAxQZzV+frlKEfmMkQ/lWkcv/VO7iQglJPvnZcPmShzu0xB4y1Sl
   g==;
X-CSE-ConnectionGUID: 1M86YEmQQTyzPgn3YIoXIw==
X-CSE-MsgGUID: 61g7XbvvRfqSVvD12EmVCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="71831282"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="71831282"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 23:54:11 -0700
X-CSE-ConnectionGUID: /xIOppPIQiSFFN5Ku4dkgw==
X-CSE-MsgGUID: OQRR6QE9SUWMWcKEJwYgmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="131262194"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 23:54:11 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 1B7951205A3;
	Thu, 17 Apr 2025 09:54:05 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1u5J8P-001J50-0I;
	Thu, 17 Apr 2025 09:54:05 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	dongcheng.yan@intel.com
Subject: [PATCH v2 05/11] media: ccs-pll: Print a debug message on too high VT PLL OP clock
Date: Thu, 17 Apr 2025 09:53:48 +0300
Message-Id: <20250417065354.311617-6-sakari.ailus@linux.intel.com>
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

In general the CCS PLL calculator prints debugging information on the
process to ease debugging. This case was not annotated, do that now.

Remove an extra multiplication while at it.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
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


