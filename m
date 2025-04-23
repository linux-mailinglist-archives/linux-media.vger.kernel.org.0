Return-Path: <linux-media+bounces-30800-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBCCA989DB
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 14:34:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B117716C79C
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 12:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AE2726F464;
	Wed, 23 Apr 2025 12:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OTSGLGYk"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529B7268C7F
	for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 12:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745411658; cv=none; b=dVJhXmMVy3blS16DqYCqzHf9yj1jLxKWWtgsT3ZQnKpDXYKKtwjrZXvGsHwhIn7VErCw6MaA2qnnVOLOgvytXbQAqBemvtT5K6Op/3cA5ZBxyQeS51tEr6cLOhiyMvRVv/5f0gkVmcgCEhlfpiwvDzc9YiOxU7uW+3K4ehYhsto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745411658; c=relaxed/simple;
	bh=HatnutykjgJs7n5R7SG4Tt/4W750L3tKOJcqfRfD1Qo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YMlo1aHI6SQWLauIM/NAy4h7gzdBZVaoi9XYFljgKZtypFkWZBImJ2wOCI4b7AgH8dhj/pELSrzUE9uydFPK4xPVSdIB4mp8XvEyYXNHgaKEIMhaSAsEu7gfOC67u0SXTuuhbZ59sQyDm4EaFHFqJjS5I26DPWJcJMZxMZ6Rxac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OTSGLGYk; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745411658; x=1776947658;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HatnutykjgJs7n5R7SG4Tt/4W750L3tKOJcqfRfD1Qo=;
  b=OTSGLGYkwpdmiFu89ZbV7A9J149uOyXtTmY2KYHrBufERn1HxqAbmeVs
   eJGoY4eFf0srJw942YppdkgrBv4rS+57idTywAOJvzaJ2VvjHDRzOMpaR
   ZcbP4slhYd39rJEqLOb3uPjHgU+GH/JGVUtebu49yupvUxaHBz6EEEvlS
   owIGdqszC0E+IWNTUKe1V6fgc7pjQchL4s6zJMejoeIdF3WgSGkO9At78
   eS2Mv324sIfa5voYTferZMuBozIBC48PBs6t6NCujfVDDEKAfgHKczmH7
   xZZapc57DAh53toMXzyEPcMiMxLobi5diVxO3PMzuMY4vhNxQGKQAy+8d
   w==;
X-CSE-ConnectionGUID: 69Y50MOPSQuzJxe4OFoe+g==
X-CSE-MsgGUID: d4p6OikWRvKzrUpq8bOFWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="46704392"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="46704392"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 05:34:17 -0700
X-CSE-ConnectionGUID: U4RUrPz7Q4SHU2vCDrGEWQ==
X-CSE-MsgGUID: 46KUw1vwQzGuUbmK80nFvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="132148609"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 05:34:15 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D0C0112260E;
	Wed, 23 Apr 2025 15:34:09 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1u7ZIn-007YW1-2f;
	Wed, 23 Apr 2025 15:34:09 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	dongcheng.yan@intel.com
Subject: [PATCH v3 08/11] media: ccs-pll: Add a flag for even PLL multipliers
Date: Wed, 23 Apr 2025 15:33:56 +0300
Message-Id: <20250423123359.1800904-9-sakari.ailus@linux.intel.com>
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

Some devices (not entirely CCS compliant) only support even PLL
multipliers. Add support for this through a PLL flag.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs-pll.c | 11 ++++++++++-
 drivers/media/i2c/ccs-pll.h |  1 +
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index ebbc5e323244..f4be4e9f6777 100644
--- a/drivers/media/i2c/ccs-pll.c
+++ b/drivers/media/i2c/ccs-pll.c
@@ -124,9 +124,10 @@ static void print_pll(struct device *dev, const struct ccs_pll *pll)
 	dev_dbg(dev, "pixel rate on CSI-2 bus:\t%u\n",
 		pll->pixel_rate_csi);
 
-	dev_dbg(dev, "flags%s%s%s%s%s%s%s%s%s%s\n",
+	dev_dbg(dev, "flags%s%s%s%s%s%s%s%s%s%s%s\n",
 		pll->flags & PLL_FL(OP_PIX_CLOCK_PER_LANE) ? " op-pix-clock-per-lane" : "",
 		pll->flags & PLL_FL(NO_OP_CLOCKS) ? " no-op-clocks" : "",
+		pll->flags & PLL_FL(EVEN_PLL_MULTIPLIER) ? " even-pll-multiplier" : "",
 		pll->flags & PLL_FL(LANE_SPEED_MODEL) ? " lane-speed" : "",
 		pll->flags & PLL_FL(EXT_IP_PLL_DIVIDER) ?
 		" ext-ip-pll-divider" : "",
@@ -312,6 +313,10 @@ __ccs_pll_calculate_vt_tree(struct device *dev,
 	more_mul *= DIV_ROUND_UP(lim_fr->min_pll_multiplier, mul * more_mul);
 	dev_dbg(dev, "more_mul2: %u\n", more_mul);
 
+	if (pll->flags & CCS_PLL_FLAG_EVEN_PLL_MULTIPLIER &&
+	    (mul & 1) && (more_mul & 1))
+		more_mul <<= 1;
+
 	pll_fr->pll_multiplier = mul * more_mul;
 	if (pll_fr->pll_multiplier > lim_fr->max_pll_multiplier) {
 		dev_dbg(dev, "pll multiplier %u too high\n",
@@ -668,6 +673,10 @@ ccs_pll_calculate_op(struct device *dev, const struct ccs_pll_limits *lim,
 	if (!is_one_or_even(i))
 		i <<= 1;
 
+	if (pll->flags & CCS_PLL_FLAG_EVEN_PLL_MULTIPLIER &&
+	    mul & 1 && i & 1)
+		i <<= 1;
+
 	dev_dbg(dev, "final more_mul: %u\n", i);
 	if (i > more_mul_max) {
 		dev_dbg(dev, "final more_mul is bad, max %u\n", more_mul_max);
diff --git a/drivers/media/i2c/ccs-pll.h b/drivers/media/i2c/ccs-pll.h
index ee206e5b287b..754eb5f52cc4 100644
--- a/drivers/media/i2c/ccs-pll.h
+++ b/drivers/media/i2c/ccs-pll.h
@@ -22,6 +22,7 @@
 /* op pix clock is for all lanes in total normally */
 #define CCS_PLL_FLAG_OP_PIX_CLOCK_PER_LANE			BIT(0)
 #define CCS_PLL_FLAG_NO_OP_CLOCKS				BIT(1)
+#define CCS_PLL_FLAG_EVEN_PLL_MULTIPLIER			BIT(3)
 /* CCS PLL flags */
 #define CCS_PLL_FLAG_LANE_SPEED_MODEL				BIT(2)
 #define CCS_PLL_FLAG_EXT_IP_PLL_DIVIDER				BIT(4)
-- 
2.39.5


