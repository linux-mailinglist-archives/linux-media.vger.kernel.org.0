Return-Path: <linux-media+bounces-20287-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EE29AF964
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 07:56:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 965AE282A56
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 05:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE2291925BF;
	Fri, 25 Oct 2024 05:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TRYAJ1MY"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F294918E056
	for <linux-media@vger.kernel.org>; Fri, 25 Oct 2024 05:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729835749; cv=none; b=BSyqdozlWf9P+YPESR+X20McGc71lHMPLcLQnSbfnaAKMat+TIUNivKZd5cIBPAQoPzbXDcnyH8rg4289ot1+T3cf07L06YjVkLTfAdspUcfVA8leCtlWORd11eoC0R0qrCN6xY8qzSOVm+QDkfWri/ucs0xhxVGsQ1YGNDh/0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729835749; c=relaxed/simple;
	bh=Cyv1W6tiOtJKqysfJe7QQFMNPRiI39lCw6wI7AqDfAc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=uyDl/xQy/H8FHSF8D+a7GGdSrE71th9TdXZzQ2Ctpv2asGTfRD0zhFZCDPgUL3Y/+TP8YKMP8yLQIvlTxPVy9b176ro78kluS8Ka6gYi2f3HuT6nOFvQNLZv3jd3oujaAu9+1wShycyYo7yzU589vr3HBsp0OyTxZPCcmbXhmUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TRYAJ1MY; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729835747; x=1761371747;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Cyv1W6tiOtJKqysfJe7QQFMNPRiI39lCw6wI7AqDfAc=;
  b=TRYAJ1MYOo0Ee2HO+DSYzHszidi9eFH0kEQqOmM/fvANJyhL/20m4Kfb
   oueztEwooNqkQAisDJUHte7QNjy5StMdzzqLX9LG9LxV29Fp3RAKwp6II
   NgdGdV3XXFhyTH2azjl1+HJif8iu8kthH3VZznM3Z9VesZzFBxqdGLUL5
   6oA79wY0rjGqe6p0B3SwZ7c5/aggNXcpD/ox1heB41vBxIkukpPXyWSVg
   8vvx9pQpd4y7wG/YpZYBkt6/M6BzuoQ7j7IsAtDC9MWgYZVs4bHFzzzaM
   DlqvNyTmDtY6/TBeczDMlj7AoscbBZIvm1H2N7AyoCOwHRfvC5gifWsw+
   Q==;
X-CSE-ConnectionGUID: xB+xPZzxQ6KYrXW819YAGg==
X-CSE-MsgGUID: sUr6YEd0R+Cv/iip6/MZuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29434822"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29434822"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 22:55:46 -0700
X-CSE-ConnectionGUID: rXYsh1GVRs6YRT/aBq+A2Q==
X-CSE-MsgGUID: Ig87gNCkT566h3gLNL7Jgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="81651371"
Received: from ipu5-build.bj.intel.com ([10.238.232.136])
  by orviesa008.jf.intel.com with ESMTP; 24 Oct 2024 22:55:44 -0700
From: Bingbu Cao <bingbu.cao@intel.com>
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com
Cc: bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com
Subject: [PATCH v2 3/3] media: ipu6: optimize the IPU6 MMU unmapping flow
Date: Fri, 25 Oct 2024 13:52:32 +0800
Message-Id: <1729835552-14825-3-git-send-email-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1729835552-14825-1-git-send-email-bingbu.cao@intel.com>
References: <1729835552-14825-1-git-send-email-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

The MMU mapping flow is optimized for improve the performance, the
unmapping flow could also be optimized to follow same flow.

This patch changes the ipu6_mmu_unmap() as a void function and also
remove ipu6_mmu_pgsize() as driver unload this to the PCI core
driver DMA ops instead of handling in driver.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
v2: squash the ipu6_mmu_pgsize() removal into this patchset
---
 drivers/media/pci/intel/ipu6/ipu6-mmu.c | 125 +++++++++++---------------------
 drivers/media/pci/intel/ipu6/ipu6-mmu.h |   4 +-
 2 files changed, 45 insertions(+), 84 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu.c b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
index e957ccb4691d..2d9c6fbd5da2 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-mmu.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
@@ -252,44 +252,51 @@ static u32 *alloc_l2_pt(struct ipu6_mmu_info *mmu_info)
 	return pt;
 }
 
-static size_t l2_unmap(struct ipu6_mmu_info *mmu_info, unsigned long iova,
-		       phys_addr_t dummy, size_t size)
+static void l2_unmap(struct ipu6_mmu_info *mmu_info, unsigned long iova,
+		     phys_addr_t dummy, size_t size)
 {
-	u32 l1_idx = iova >> ISP_L1PT_SHIFT;
-	u32 iova_start = iova;
+	unsigned int l2_entries;
 	unsigned int l2_idx;
-	size_t unmapped = 0;
 	unsigned long flags;
+	u32 l1_idx;
 	u32 *l2_pt;
 
-	dev_dbg(mmu_info->dev, "unmapping l2 page table for l1 index %u (iova 0x%8.8lx)\n",
-		l1_idx, iova);
-
 	spin_lock_irqsave(&mmu_info->lock, flags);
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
+	for (l1_idx = iova >> ISP_L1PT_SHIFT;
+	     size > 0 && l1_idx < ISP_L1PT_PTES; l1_idx++) {
 		dev_dbg(mmu_info->dev,
-			"unmap l2 index %u with pteval 0x%10.10llx\n",
-			l2_idx, TBL_PHYS_ADDR(l2_pt[l2_idx]));
-		l2_pt[l2_idx] = mmu_info->dummy_page_pteval;
+			"unmapping l2 pgtable (l1 index %u (iova 0x%8.8lx))\n",
+			l1_idx, iova);
 
-		clflush_cache_range((void *)&l2_pt[l2_idx],
-				    sizeof(l2_pt[l2_idx]));
-		unmapped++;
+		if (mmu_info->l1_pt[l1_idx] == mmu_info->dummy_l2_pteval) {
+			dev_err(mmu_info->dev,
+				"unmap not mapped iova 0x%8.8lx l1 index %u\n",
+				iova, l1_idx);
+			continue;
+		}
+		l2_pt = mmu_info->l2_pts[l1_idx];
+
+		l2_entries = 0;
+		for (l2_idx = (iova & ISP_L2PT_MASK) >> ISP_L2PT_SHIFT;
+		     size > 0 && l2_idx < ISP_L2PT_PTES; l2_idx++) {
+			dev_dbg(mmu_info->dev,
+				"unmap l2 index %u with pteval 0x%10.10llx\n",
+				l2_idx, TBL_PHYS_ADDR(l2_pt[l2_idx]));
+			l2_pt[l2_idx] = mmu_info->dummy_page_pteval;
+
+			iova += ISP_PAGE_SIZE;
+			size -= ISP_PAGE_SIZE;
+
+			l2_entries++;
+		}
+
+		WARN_ON_ONCE(!l2_entries);
+		clflush_cache_range(&l2_pt[l2_idx - l2_entries],
+				    sizeof(l2_pt[0]) * l2_entries);
 	}
+
+	WARN_ON_ONCE(size);
 	spin_unlock_irqrestore(&mmu_info->lock, flags);
-
-	return unmapped << ISP_PAGE_SHIFT;
 }
 
 static int l2_map(struct ipu6_mmu_info *mmu_info, unsigned long iova,
@@ -394,8 +401,8 @@ static int __ipu6_mmu_map(struct ipu6_mmu_info *mmu_info, unsigned long iova,
 	return l2_map(mmu_info, iova_start, paddr, size);
 }
 
-static size_t __ipu6_mmu_unmap(struct ipu6_mmu_info *mmu_info,
-			       unsigned long iova, size_t size)
+static void __ipu6_mmu_unmap(struct ipu6_mmu_info *mmu_info,
+			     unsigned long iova, size_t size)
 {
 	return l2_unmap(mmu_info, iova, 0, size);
 }
@@ -637,40 +644,13 @@ phys_addr_t ipu6_mmu_iova_to_phys(struct ipu6_mmu_info *mmu_info,
 	return phy_addr;
 }
 
-static size_t ipu6_mmu_pgsize(unsigned long pgsize_bitmap,
-			      unsigned long addr_merge, size_t size)
+void ipu6_mmu_unmap(struct ipu6_mmu_info *mmu_info, unsigned long iova,
+		    size_t size)
 {
-	unsigned int pgsize_idx;
-	size_t pgsize;
-
-	/* Max page size that still fits into 'size' */
-	pgsize_idx = __fls(size);
-
-	if (likely(addr_merge)) {
-		/* Max page size allowed by address */
-		unsigned int align_pgsize_idx = __ffs(addr_merge);
-
-		pgsize_idx = min(pgsize_idx, align_pgsize_idx);
-	}
-
-	pgsize = (1UL << (pgsize_idx + 1)) - 1;
-	pgsize &= pgsize_bitmap;
-
-	WARN_ON(!pgsize);
-
-	/* pick the biggest page */
-	pgsize_idx = __fls(pgsize);
-	pgsize = 1UL << pgsize_idx;
-
-	return pgsize;
-}
-
-size_t ipu6_mmu_unmap(struct ipu6_mmu_info *mmu_info, unsigned long iova,
-		      size_t size)
-{
-	size_t unmapped_page, unmapped = 0;
 	unsigned int min_pagesz;
 
+	dev_dbg(mmu_info->dev, "unmapping iova 0x%lx size 0x%zx\n", iova, size);
+
 	/* find out the minimum page size supported */
 	min_pagesz = 1 << __ffs(mmu_info->pgsize_bitmap);
 
@@ -682,29 +662,10 @@ size_t ipu6_mmu_unmap(struct ipu6_mmu_info *mmu_info, unsigned long iova,
 	if (!IS_ALIGNED(iova | size, min_pagesz)) {
 		dev_err(NULL, "unaligned: iova 0x%lx size 0x%zx min_pagesz 0x%x\n",
 			iova, size, min_pagesz);
-		return -EINVAL;
+		return;
 	}
 
-	/*
-	 * Keep iterating until we either unmap 'size' bytes (or more)
-	 * or we hit an area that isn't mapped.
-	 */
-	while (unmapped < size) {
-		size_t pgsize = ipu6_mmu_pgsize(mmu_info->pgsize_bitmap,
-						iova, size - unmapped);
-
-		unmapped_page = __ipu6_mmu_unmap(mmu_info, iova, pgsize);
-		if (!unmapped_page)
-			break;
-
-		dev_dbg(mmu_info->dev, "unmapped: iova 0x%lx size 0x%zx\n",
-			iova, unmapped_page);
-
-		iova += unmapped_page;
-		unmapped += unmapped_page;
-	}
-
-	return unmapped;
+	return __ipu6_mmu_unmap(mmu_info, iova, size);
 }
 
 int ipu6_mmu_map(struct ipu6_mmu_info *mmu_info, unsigned long iova,
diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu.h b/drivers/media/pci/intel/ipu6/ipu6-mmu.h
index 21cdb0f146eb..8e40b4a66d7d 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-mmu.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-mmu.h
@@ -66,8 +66,8 @@ int ipu6_mmu_hw_init(struct ipu6_mmu *mmu);
 void ipu6_mmu_hw_cleanup(struct ipu6_mmu *mmu);
 int ipu6_mmu_map(struct ipu6_mmu_info *mmu_info, unsigned long iova,
 		 phys_addr_t paddr, size_t size);
-size_t ipu6_mmu_unmap(struct ipu6_mmu_info *mmu_info, unsigned long iova,
-		      size_t size);
+void ipu6_mmu_unmap(struct ipu6_mmu_info *mmu_info, unsigned long iova,
+		    size_t size);
 phys_addr_t ipu6_mmu_iova_to_phys(struct ipu6_mmu_info *mmu_info,
 				  dma_addr_t iova);
 #endif
-- 
2.7.4


