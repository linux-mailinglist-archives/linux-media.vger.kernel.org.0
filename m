Return-Path: <linux-media+bounces-27612-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F23A4FE0A
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 12:54:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1297E7A57E4
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 11:53:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A787D241CA3;
	Wed,  5 Mar 2025 11:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DnGeV9Ik"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D241F5413
	for <linux-media@vger.kernel.org>; Wed,  5 Mar 2025 11:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741175633; cv=none; b=MkSvwOuPx7tsWht72DAp6zS8XiYu+egOYX5lJ4UTU+NY/tO4Fi6f9W4cneNsjiJIddLzt7Jqg0Ya5Zh9HhGgsLxc87Vt+NG3QDnEkSP2R0ZnVn71hz9tbaf1uIdfpwxHdjHGSuU9xo2yHvYplbNT9ShaUldWtDvKS5G0KsFjMG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741175633; c=relaxed/simple;
	bh=wowSgOVmCrBZGAr81PxnpW7gytnPVpn5IWEha01z4Go=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rbaL8eozbrjfjUmCaksx4i9lwdAzaphvQYiSeg4/HTjW909VJpIGXk+k2OJi2N8hT2MOc9kctcIjVzeGrQU1ElpA4hZad9AcJ8NNUjp7cEVQ1sC0le+ZigQQ2qkm+5QfiRVAJCFXvE6dgHoWKAWM1gwJR+SdM6m2HBrW2unJT+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DnGeV9Ik; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741175631; x=1772711631;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wowSgOVmCrBZGAr81PxnpW7gytnPVpn5IWEha01z4Go=;
  b=DnGeV9IkoXhUGf0Ed1wHvJj7+JvRu/sCLemUb9HRvQKvROVfEFp5AJ0r
   uof9WkkXbqS5YsDxtx1j/X/y+29nLRnuozPNxlR/+YJJww26w6hSPzOlQ
   xGMy0eC+PmKH5RYWBkQwNrubfy0aLJa005dz+Aj0nX6o13IpetYDjlZS4
   cGsdAaEZ0sQr05Y40PD9H070550469T7rITr3V6EV1SUGOjw84XtW3iUL
   AqnUBdpumWvSysqHPbJsQ+9AvvbGGWJcbO21X8AUatf8d3zt+aST+5tif
   5qA58xpQ23ZC44E1GhdnaDczLPqOeIk73rLxsxV23eJCEiJdNLW/HbZNF
   g==;
X-CSE-ConnectionGUID: BxokMuP7S/2F696lLyxIJw==
X-CSE-MsgGUID: PL0NheXKSU6ziacV6nQeQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="41997102"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="41997102"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 03:53:49 -0800
X-CSE-ConnectionGUID: nOAPaZzASSCjdVUKEzKQag==
X-CSE-MsgGUID: y+pBOS+GT26xxwwAas0X4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="123872755"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 03:53:48 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 603AB12034A;
	Wed,  5 Mar 2025 13:53:45 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1tpnJp-00GPLz-0t;
	Wed, 05 Mar 2025 13:53:45 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: David Heidelberg <david@ixit.cz>
Subject: [PATCH 1/1] media: ccs-pll: Print PLL calculator flags in the beginning
Date: Wed,  5 Mar 2025 13:53:35 +0200
Message-Id: <20250305115335.3910699-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
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
index 49cc4491ebdd..cf06414f8faa 100644
--- a/drivers/media/i2c/ccs-pll.c
+++ b/drivers/media/i2c/ccs-pll.c
@@ -123,8 +123,11 @@ static void print_pll(struct device *dev, struct ccs_pll *pll)
 		pll->pixel_rate_pixel_array);
 	dev_dbg(dev, "pixel rate on CSI-2 bus:\t%u\n",
 		pll->pixel_rate_csi);
+}
 
-	dev_dbg(dev, "flags%s%s%s%s%s%s%s%s%s%s\n",
+static void print_pll_flags(struct device *dev, struct ccs_pll *pll)
+{
+	dev_dbg(dev, "PLL flags%s%s%s%s%s%s%s%s%s%s\n",
 		pll->flags & PLL_FL(LANE_SPEED_MODEL) ? " lane-speed" : "",
 		pll->flags & PLL_FL(LINK_DECOUPLED) ? " link-decoupled" : "",
 		pll->flags & PLL_FL(EXT_IP_PLL_DIVIDER) ?
@@ -737,6 +740,8 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 	u32 i;
 	int rval = -EINVAL;
 
+	print_pll_flags(dev, pll);
+
 	if (!(pll->flags & CCS_PLL_FLAG_LANE_SPEED_MODEL)) {
 		pll->op_lanes = 1;
 		pll->vt_lanes = 1;
-- 
2.39.5


