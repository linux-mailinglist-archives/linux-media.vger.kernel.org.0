Return-Path: <linux-media+bounces-20285-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 195D79AF962
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 07:55:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE6321F23174
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 05:55:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82057190686;
	Fri, 25 Oct 2024 05:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P2CD2BVj"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A7A176AAD
	for <linux-media@vger.kernel.org>; Fri, 25 Oct 2024 05:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729835746; cv=none; b=Ex++v6G2Ub+PcCJ04IWIMlH9rOKyn3834bb+3OW01fr9xqCXE01QUPShIAts3XT63XdWdCivVcVO1zZlw45QonvrkAOalbc2lbUL0zikkNml+aRmfZfqs8jFdsDD8xYQ7zcsaZHkU/eyU71zpeyunZqW6fQ5VSBGIZm+GV9FglA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729835746; c=relaxed/simple;
	bh=sDyoh2abmr+4TS4Q6WzwHULhlNUvrL81epyGUucy4yU=;
	h=From:To:Cc:Subject:Date:Message-Id; b=AphHFbUvr2ihfx4bgYQeSOvRraGFhdCV/slkVbNv1pdITSWiKiUaN4B9hLdyhzv1Nx4MnpPy5YUiab1kEr4ig3/NXNLV0PfRezakUg/OgtfuUutVQPF9koDXhudNd0HlrVfSvck6rLwMh7bJrUCqLJK0PSu+FYowv8tfbX/LewQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P2CD2BVj; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729835744; x=1761371744;
  h=from:to:cc:subject:date:message-id;
  bh=sDyoh2abmr+4TS4Q6WzwHULhlNUvrL81epyGUucy4yU=;
  b=P2CD2BVjO0IbArcj16oWPRxY/PlecbbN1fDbnsF7UtqaSdF5YRgf6bkt
   jCg9kAishxpGtUZqVD2cbTNGC0FCPyeVw5ruExhPh8QsLuo05q/ot/KXG
   qI4oQMztsZ05GpMeE6D0tIDLJorKUWzRZNP9vC2xfpy6ML9NSTQzeu+LQ
   Ib+f1tfCWPm4QkkDr4LK7MiYjEWx7y7OQJVUDsjl+J5kP55ItxU4QJVAL
   jqKGBd3SiZmurj9EQ5Hl6C6Hkoqt6/WB/rkHJivkrVHEUafgiLpnug9VJ
   l/+oK4tYocyb+PZMlWfJEJfq0qBNlPedLJjN/tcW4GAKEc2q4fwCz58aK
   w==;
X-CSE-ConnectionGUID: aRRRemBnSVCOEwJIpPqrBg==
X-CSE-MsgGUID: MHrEVyHCTlGibkmvNqqLSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29434818"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29434818"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 22:55:42 -0700
X-CSE-ConnectionGUID: tUvzjMgCQn6aYxJQZL1qQQ==
X-CSE-MsgGUID: P4ibiiWuTQCxCSbdqiG58A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="81651361"
Received: from ipu5-build.bj.intel.com ([10.238.232.136])
  by orviesa008.jf.intel.com with ESMTP; 24 Oct 2024 22:55:40 -0700
From: Bingbu Cao <bingbu.cao@intel.com>
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com
Cc: bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com
Subject: [PATCH v2 1/3] media: ipu6: move the l2_unmap() up before l2_map()
Date: Fri, 25 Oct 2024 13:52:30 +0800
Message-Id: <1729835552-14825-1-git-send-email-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

l2_map() and l2_unmap() are better to be grouped together.
l2_unmap() will soon be called from l2_map() for mapping
optimization.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
Signed-off-by: Jianhui Dai <jianhui.j.dai@intel.com>
---
v2: reword the commit message to make it clear
---
 drivers/media/pci/intel/ipu6/ipu6-mmu.c | 80 ++++++++++++++++-----------------
 1 file changed, 40 insertions(+), 40 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu.c b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
index c3a20507d6db..9ea6789bca5e 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-mmu.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
@@ -252,6 +252,46 @@ static u32 *alloc_l2_pt(struct ipu6_mmu_info *mmu_info)
 	return pt;
 }
 
+static size_t l2_unmap(struct ipu6_mmu_info *mmu_info, unsigned long iova,
+		       phys_addr_t dummy, size_t size)
+{
+	u32 l1_idx = iova >> ISP_L1PT_SHIFT;
+	u32 iova_start = iova;
+	unsigned int l2_idx;
+	size_t unmapped = 0;
+	unsigned long flags;
+	u32 *l2_pt;
+
+	dev_dbg(mmu_info->dev, "unmapping l2 page table for l1 index %u (iova 0x%8.8lx)\n",
+		l1_idx, iova);
+
+	spin_lock_irqsave(&mmu_info->lock, flags);
+	if (mmu_info->l1_pt[l1_idx] == mmu_info->dummy_l2_pteval) {
+		spin_unlock_irqrestore(&mmu_info->lock, flags);
+		dev_err(mmu_info->dev,
+			"unmap iova 0x%8.8lx l1 idx %u which was not mapped\n",
+			iova, l1_idx);
+		return 0;
+	}
+
+	for (l2_idx = (iova_start & ISP_L2PT_MASK) >> ISP_L2PT_SHIFT;
+	     (iova_start & ISP_L1PT_MASK) + (l2_idx << ISP_PAGE_SHIFT)
+		     < iova_start + size && l2_idx < ISP_L2PT_PTES; l2_idx++) {
+		l2_pt = mmu_info->l2_pts[l1_idx];
+		dev_dbg(mmu_info->dev,
+			"unmap l2 index %u with pteval 0x%10.10llx\n",
+			l2_idx, TBL_PHYS_ADDR(l2_pt[l2_idx]));
+		l2_pt[l2_idx] = mmu_info->dummy_page_pteval;
+
+		clflush_cache_range((void *)&l2_pt[l2_idx],
+				    sizeof(l2_pt[l2_idx]));
+		unmapped++;
+	}
+	spin_unlock_irqrestore(&mmu_info->lock, flags);
+
+	return unmapped << ISP_PAGE_SHIFT;
+}
+
 static int l2_map(struct ipu6_mmu_info *mmu_info, unsigned long iova,
 		  phys_addr_t paddr, size_t size)
 {
@@ -336,46 +376,6 @@ static int __ipu6_mmu_map(struct ipu6_mmu_info *mmu_info, unsigned long iova,
 	return l2_map(mmu_info, iova_start, paddr, size);
 }
 
-static size_t l2_unmap(struct ipu6_mmu_info *mmu_info, unsigned long iova,
-		       phys_addr_t dummy, size_t size)
-{
-	u32 l1_idx = iova >> ISP_L1PT_SHIFT;
-	u32 iova_start = iova;
-	unsigned int l2_idx;
-	size_t unmapped = 0;
-	unsigned long flags;
-	u32 *l2_pt;
-
-	dev_dbg(mmu_info->dev, "unmapping l2 page table for l1 index %u (iova 0x%8.8lx)\n",
-		l1_idx, iova);
-
-	spin_lock_irqsave(&mmu_info->lock, flags);
-	if (mmu_info->l1_pt[l1_idx] == mmu_info->dummy_l2_pteval) {
-		spin_unlock_irqrestore(&mmu_info->lock, flags);
-		dev_err(mmu_info->dev,
-			"unmap iova 0x%8.8lx l1 idx %u which was not mapped\n",
-			iova, l1_idx);
-		return 0;
-	}
-
-	for (l2_idx = (iova_start & ISP_L2PT_MASK) >> ISP_L2PT_SHIFT;
-	     (iova_start & ISP_L1PT_MASK) + (l2_idx << ISP_PAGE_SHIFT)
-		     < iova_start + size && l2_idx < ISP_L2PT_PTES; l2_idx++) {
-		l2_pt = mmu_info->l2_pts[l1_idx];
-		dev_dbg(mmu_info->dev,
-			"unmap l2 index %u with pteval 0x%10.10llx\n",
-			l2_idx, TBL_PHYS_ADDR(l2_pt[l2_idx]));
-		l2_pt[l2_idx] = mmu_info->dummy_page_pteval;
-
-		clflush_cache_range((void *)&l2_pt[l2_idx],
-				    sizeof(l2_pt[l2_idx]));
-		unmapped++;
-	}
-	spin_unlock_irqrestore(&mmu_info->lock, flags);
-
-	return unmapped << ISP_PAGE_SHIFT;
-}
-
 static size_t __ipu6_mmu_unmap(struct ipu6_mmu_info *mmu_info,
 			       unsigned long iova, size_t size)
 {
-- 
2.7.4


