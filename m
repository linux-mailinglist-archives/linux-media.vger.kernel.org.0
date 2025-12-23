Return-Path: <linux-media+bounces-49390-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EC58BCD8325
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 06:39:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 662503002521
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 05:39:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4A6D2F5473;
	Tue, 23 Dec 2025 05:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d95WxexP"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26F02F60A1
	for <linux-media@vger.kernel.org>; Tue, 23 Dec 2025 05:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766468340; cv=none; b=HvtoIQAf4CHtyDOO5+ntHht2/z2mfLhj0RYg4bwBopPpRXmWXCu81bjBbPSARR53rV/Vi+HPpms1YxLAqrmUpyvbkpOUcND0EJxhhQTl5MCUvofYH+6hkgRF0tUThBqO1IWzL9s2CrPt1iSYW7N0n/tZIJmez4xdo9+sfVlC8zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766468340; c=relaxed/simple;
	bh=tkrkbJziwV8gWy66PB2uYJ3otO579oyccog6MyYrLGc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rjhnlfSgby0NmxjcRDdkIoRuMEZXnvEl0R3gaCsSrgLgV/RNQWIA8oe0oSw1WWkj/Cw3pNDb4uTfv/MUlAZdt3hJXxBxG4nDA9EHMWL/koL+eRo6T6oY1cEKjsdoamhZr9UJWNlIQml4qmvBNBx05KWlfbd5LAjPdCQJkjvXnT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d95WxexP; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766468338; x=1798004338;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tkrkbJziwV8gWy66PB2uYJ3otO579oyccog6MyYrLGc=;
  b=d95WxexPpoZi/6U9RBkyEN+w0IAWnUA74lxhbhQxgjDy7i+roM43cYQc
   4S+yLA9YyXi5rbD7kRJDrGQYJNuKz+/Li+3Q0y2f2aDrFzfGJ9Ouiq7gT
   s/32W4NfU8nHtGQ8NSiDPBgYIWi+cvjCvCEH0xRUTBLoizm0S6calSKwR
   FqMm0sWo//WP1i4PISUuo/fzqvOOd+JcW+SKyQCY2s5rHJTKAeOiysVDt
   h09pcUpThRSaiqS3hlnD0bDskWx+5SgZsgSdSMBdxxiZXI2sgs+CtLLv0
   zWOsUAO7fz53P3a7Ys0nlIUonExuvw6+ZEarq0Tv/bqVrGJpUyKmJzAXl
   w==;
X-CSE-ConnectionGUID: wxS/zmYJSA+Xe1ajn/EGFg==
X-CSE-MsgGUID: EXN8c/k4QRWFC4b0f/rJxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68255992"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68255992"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 21:38:58 -0800
X-CSE-ConnectionGUID: +/RR6lmfTIeZjTMbnVtfQA==
X-CSE-MsgGUID: 8Otnts2UR3i1l8i46/1fLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="199366586"
Received: from vtg-chrome.bj.intel.com ([172.16.116.150])
  by fmviesa007.fm.intel.com with ESMTP; 22 Dec 2025 21:38:55 -0800
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com
Cc: bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH v3 6/6] media: staging/ipu7: fix the loop number of in l2 table alloc
Date: Tue, 23 Dec 2025 13:38:44 +0800
Message-Id: <20251223053844.3124621-7-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251223053844.3124621-1-bingbu.cao@intel.com>
References: <20251223053844.3124621-1-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bingbu Cao <bingbu.cao@intel.com>

This patch fixes the incorrect loop bound in alloc_l2_pt(). When
initializing L2 page table entries, the loop was incorrectly using
ISP_L1PT_PTES instead of ISP_L2PT_PTES though the ISP_L1PT_PTES is
equal to ISP_L2PT_PTES.

Fixes: 71d81c25683a ("media: staging/ipu7: add IPU7 DMA APIs and MMU mapping")
Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/staging/media/ipu7/ipu7-mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu7/ipu7-mmu.c b/drivers/staging/media/ipu7/ipu7-mmu.c
index ded1986eb8ba..ea35cce4830a 100644
--- a/drivers/staging/media/ipu7/ipu7-mmu.c
+++ b/drivers/staging/media/ipu7/ipu7-mmu.c
@@ -231,7 +231,7 @@ static u32 *alloc_l2_pt(struct ipu7_mmu_info *mmu_info)
 
 	dev_dbg(mmu_info->dev, "alloc_l2: get_zeroed_page() = %p\n", pt);
 
-	for (i = 0; i < ISP_L1PT_PTES; i++)
+	for (i = 0; i < ISP_L2PT_PTES; i++)
 		pt[i] = mmu_info->dummy_page_pteval;
 
 	return pt;
-- 
2.34.1


