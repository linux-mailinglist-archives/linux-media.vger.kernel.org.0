Return-Path: <linux-media+bounces-30804-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B99CDA989E0
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 14:34:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2447B7AB369
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 12:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69D08270546;
	Wed, 23 Apr 2025 12:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="axiMKsbq"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73BD926FA4C
	for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 12:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745411661; cv=none; b=LVRJnltniz3Kf3SKru4+L0oJDQ232XD8g0Oapyt+clczdoKnEIqihYe2cyPJm6YbvubnO+2aPIox6uQydgwKJcVF3yDRyTixP9PGYxshnS4p+Y1uATajtCXVTQjxRw3h9rQIGQvaaYwDW5hdPaQ7ywqNcP1Qa9s4IfoG3ul/pUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745411661; c=relaxed/simple;
	bh=siOWzrgYjO5OPStH9u055IxwELfvwoYS9ek48TUCtEU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XqIRD+9RntYvwzOqzeyvkQRARqnaeMSXc3CjjoHJjM7x5IPTjjYaiLrYW61OuuVeCsRaDYRLf4542U64xNJOjw6WAt8oBHPCb5WuFfaRmn52A40c4mTCzUkNY59U3MCOMvjHehwMlPvHS9hP9gRZUQGN6+HW7SmiHMuHy2rpZno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=axiMKsbq; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745411661; x=1776947661;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=siOWzrgYjO5OPStH9u055IxwELfvwoYS9ek48TUCtEU=;
  b=axiMKsbqNcUqST7mRq8HWMVefVAMWrgpA9jgN9uvmGI5vnZMRJ/k7KIb
   mdi5y191IIN/hGyvZ0SfpIGiTKhQGMGyX5E2n0Ez73DAsLZxtTUtCX/vT
   0eX9J/QWIW1dAtx6GMUGHNUiTeufSX0Zovtm54BMAx6UfFDsdpxDplvpJ
   BJfDM2jTv625rgyyOvnGAqVHbhjImudCa+m3m4KN8cU3z586KkTNxpn67
   /3Pm0kw42v1ypfXJVEizhngd9kSbMgqCfEQQToMNAPIhL4y1Pi9DZENOK
   Ju0MPFDF3ust0CLo1qk/MSWmRbgTqfJYKHXxQwzCdwAyylsQzJHGLXQWz
   A==;
X-CSE-ConnectionGUID: 8Hl/DJJ7RPGT7DsViAuTlg==
X-CSE-MsgGUID: sTq6vSQURmiAZKitvsRwXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="46704397"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="46704397"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 05:34:18 -0700
X-CSE-ConnectionGUID: h27a0DhfQuO/DB8ZtD2drw==
X-CSE-MsgGUID: dB+298NGQZSIU8gEcISmiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="132148617"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 05:34:16 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id C9AD61209FB;
	Wed, 23 Apr 2025 15:34:09 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1u7ZIn-007YVv-2Z;
	Wed, 23 Apr 2025 15:34:09 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	dongcheng.yan@intel.com
Subject: [PATCH v3 07/11] media: ccs-pll: Print missing PLL flags
Date: Wed, 23 Apr 2025 15:33:55 +0300
Message-Id: <20250423123359.1800904-8-sakari.ailus@linux.intel.com>
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

Printing the OP_PIX_CLOCK_PER_LANE and NO_OP_CLOCKS CCS PLL flags is
missing, add them now.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ccs-pll.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index 16eb09462c8b..ebbc5e323244 100644
--- a/drivers/media/i2c/ccs-pll.c
+++ b/drivers/media/i2c/ccs-pll.c
@@ -124,7 +124,9 @@ static void print_pll(struct device *dev, const struct ccs_pll *pll)
 	dev_dbg(dev, "pixel rate on CSI-2 bus:\t%u\n",
 		pll->pixel_rate_csi);
 
-	dev_dbg(dev, "flags%s%s%s%s%s%s%s%s\n",
+	dev_dbg(dev, "flags%s%s%s%s%s%s%s%s%s%s\n",
+		pll->flags & PLL_FL(OP_PIX_CLOCK_PER_LANE) ? " op-pix-clock-per-lane" : "",
+		pll->flags & PLL_FL(NO_OP_CLOCKS) ? " no-op-clocks" : "",
 		pll->flags & PLL_FL(LANE_SPEED_MODEL) ? " lane-speed" : "",
 		pll->flags & PLL_FL(EXT_IP_PLL_DIVIDER) ?
 		" ext-ip-pll-divider" : "",
-- 
2.39.5


