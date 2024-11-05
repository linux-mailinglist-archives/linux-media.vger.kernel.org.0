Return-Path: <linux-media+bounces-20821-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A578B9BC365
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 03:52:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36E6A1F22D20
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 02:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2331F487BF;
	Tue,  5 Nov 2024 02:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B/16fqpa"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803E14A0A
	for <linux-media@vger.kernel.org>; Tue,  5 Nov 2024 02:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730775128; cv=none; b=n+p8k25wQK0Jzwlgenv7XJ8Y5HuGxm9BHzSedhTS+t5AF9z7oxp8Nzoq5C3K4HmC1l7dZiiSELjzqHcfml9ylzObZloRFfsJ9wowq+CPHOOUUEnEI/dpemAelMCxa32y4z3Vq5Z2gMcflG8Xthw8qmnaeyFzxi/ozKblQo+Km6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730775128; c=relaxed/simple;
	bh=tPZPp7jQ68l0rXYUCXWF0zjJHEODxjImMjjjbVmDYvg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=QLfLwhg5q6AjL5DD9Jv7jzAU7hUxlFN3uy2CDUP5Z27uCO2ntfVGjp8kBRF6sNzCfYOjlbTaRFtKZYTl1Jna+nxSn5F87JAN+3tSKaEnhj705p7seFaW9+JHsi7FuwF67VeKYaESQEu7ZIl0stJ7JldACjq95hZfxkb8TzKUWO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B/16fqpa; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730775126; x=1762311126;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=tPZPp7jQ68l0rXYUCXWF0zjJHEODxjImMjjjbVmDYvg=;
  b=B/16fqpasSYuFCSqH3oPQjeM9uWJLmYzfKc9TmGJUDElXTK9DD4n1f4E
   Gt2lkemB+CR3CDJtaT5wY8V35dpPLwsVlqDesIIoi7mSN+SHJHZuxtUGo
   DsvLFxxNABsMIPS4+9V+QISR1arcXB9xa3JziuEF9u1mDzjjm2bUBENOk
   +k4pYHHTlZ3GMkp2uxmNmm4o8Q1LCGxJqcsB62zDNsK7izHhCi5FZ/nzF
   xC937HwTLoq1/YjUKOiq+LW834UWBMlczNhWGb2BMDvocQ/BXJ7ZXOI6d
   BecXjavNAC8huGHMdKo1JLmFzWCMwdm/c5D0eMk9UqYrRJVUQLVIoAIh0
   Q==;
X-CSE-ConnectionGUID: ZC82zLYvSSeB5xgxpNYU7g==
X-CSE-MsgGUID: HJortBRzQ4Ky12ifEIos+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30663690"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30663690"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 18:52:06 -0800
X-CSE-ConnectionGUID: KzxmXlmfR+ioLnH6jwPiVg==
X-CSE-MsgGUID: NghProbQRm+DiKeAhrPLlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; 
   d="scan'208";a="88422020"
Received: from ipu5-build.bj.intel.com ([10.238.232.136])
  by fmviesa004.fm.intel.com with ESMTP; 04 Nov 2024 18:48:13 -0800
From: Bingbu Cao <bingbu.cao@intel.com>
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com
Cc: bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com
Subject: [PATCH v3 3/4] media: ipu6: optimize the IPU6 MMU unmapping flow
Date: Tue,  5 Nov 2024 10:45:07 +0800
Message-Id: <1730774708-19594-3-git-send-email-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1730774708-19594-1-git-send-email-bingbu.cao@intel.com>
References: <1730774708-19594-1-git-send-email-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

The MMU mapping flow is optimized for improve the performance, the
unmapping flow could also be optimized to follow same flow.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
v3: separate patch which make the unmap() as void
v2: squash the ipu6_mmu_pgsize() removal into this patchset
---
 drivers/media/pci/intel/ipu6/ipu6-mmu.c | 114 +++++++++++---------------------
 1 file changed, 38 insertions(+), 76 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu.c b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
index e957ccb4691d..a8e087188ebb 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-mmu.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
@@ -255,41 +255,49 @@ static u32 *alloc_l2_pt(struct ipu6_mmu_info *mmu_info)
 static size_t l2_unmap(struct ipu6_mmu_info *mmu_info, unsigned long iova,
 		       phys_addr_t dummy, size_t size)
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
+	return l2_entries << ISP_PAGE_SHIFT;
 }
 
 static int l2_map(struct ipu6_mmu_info *mmu_info, unsigned long iova,
@@ -637,40 +645,13 @@ phys_addr_t ipu6_mmu_iova_to_phys(struct ipu6_mmu_info *mmu_info,
 	return phy_addr;
 }
 
-static size_t ipu6_mmu_pgsize(unsigned long pgsize_bitmap,
-			      unsigned long addr_merge, size_t size)
-{
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
 size_t ipu6_mmu_unmap(struct ipu6_mmu_info *mmu_info, unsigned long iova,
 		      size_t size)
 {
-	size_t unmapped_page, unmapped = 0;
 	unsigned int min_pagesz;
 
+	dev_dbg(mmu_info->dev, "unmapping iova 0x%lx size 0x%zx\n", iova, size);
+
 	/* find out the minimum page size supported */
 	min_pagesz = 1 << __ffs(mmu_info->pgsize_bitmap);
 
@@ -682,29 +663,10 @@ size_t ipu6_mmu_unmap(struct ipu6_mmu_info *mmu_info, unsigned long iova,
 	if (!IS_ALIGNED(iova | size, min_pagesz)) {
 		dev_err(NULL, "unaligned: iova 0x%lx size 0x%zx min_pagesz 0x%x\n",
 			iova, size, min_pagesz);
-		return -EINVAL;
+		return 0;
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
-- 
2.7.4


