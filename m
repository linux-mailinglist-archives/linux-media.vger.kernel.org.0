Return-Path: <linux-media+bounces-30407-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 38147A91464
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 08:54:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87FF35A3011
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 06:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69D8021ABC9;
	Thu, 17 Apr 2025 06:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GJzeSvGT"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3D421931E
	for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 06:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744872858; cv=none; b=Y1u+rbh/gG1mjMXP4bSPVnJlSWuciy7YjsGrZ5d0SULPd/Mdq1rZraEydJ8y0tqrEhFenlt0lWuO422ehw0Uo0VesCbZk0fwHKSYtoW+9Bfwkp4YYIzGrkiQ+eoj68VcJCDZsOBB5OrwSzdrU1XgmVcGiuRdwuw7vPdxXu8gs1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744872858; c=relaxed/simple;
	bh=KKz92r4EwdbnvYK8zmCI+douLrObwePZYzFs3P5Nv9g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RcBkqewugXwfqkWHubOg/Yxr9izW4KscJDwdBzbNiFbI2SVxDEys+aqJwdXhu8miKwJLzc3e6OgZYq2QbcXmaI2xN0dz82F11g42CvBkkK/yPPEQFh+8lmyAPwzwcxSUQ2qGaTgXIdRLUEh7P2rA83HdO/jGFR/MVTFyfxP0rCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GJzeSvGT; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744872857; x=1776408857;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KKz92r4EwdbnvYK8zmCI+douLrObwePZYzFs3P5Nv9g=;
  b=GJzeSvGT7To1B4rFR7Mtj+39WDiovd5NrTco304RZoQkI/NpCnadmpB5
   /3B8U4hXOQmN9lXhqgjxY3yq9bgFvR9D4FFemdkolOi0rXVbV+F5J4291
   jQNVF4EwKBaaqNV9Zb9oFcM6ULv4eM5VWAtbovjBGdipD2cCQsozZN8Fc
   tOn0zPvF5UpvWrzdb1hto8v0CxC+0bmoP/S26iRgKKwPA5gseIpfHu/jz
   3sg5LySkTuO+tCms6Cf/ZyRKq7vejU349CFTEYtGWZWRVCWOyuy6/CNnm
   HRThDeCdOjN/v/wRtIOSQXdHMfQfQvjmmPmwgM5oAeVr4lj9nlEzPyU15
   w==;
X-CSE-ConnectionGUID: QALM4NOySfuxMf4idXyVSQ==
X-CSE-MsgGUID: nTS3NsYAR7inQYB2yTuRPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="71831293"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="71831293"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 23:54:12 -0700
X-CSE-ConnectionGUID: C8Jqt3tsRCyiJvxyaIw6kA==
X-CSE-MsgGUID: sUBCxwZ7TO6wFWVYD/cDGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="131262204"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 23:54:11 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 257A3120704;
	Thu, 17 Apr 2025 09:54:05 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1u5J8P-001J5A-0R;
	Thu, 17 Apr 2025 09:54:05 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	dongcheng.yan@intel.com
Subject: [PATCH v2 07/11] media: ccs-pll: Print missing PLL flags
Date: Thu, 17 Apr 2025 09:53:50 +0300
Message-Id: <20250417065354.311617-8-sakari.ailus@linux.intel.com>
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

Printing the OP_PIX_CLOCK_PER_LANE and NO_OP_CLOCKS CCS PLL flags were
missing, add them now.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
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


