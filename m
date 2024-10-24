Return-Path: <linux-media+bounces-20161-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 015DB9ADD94
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 09:28:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 787391F21D51
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 07:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F4B4197A7F;
	Thu, 24 Oct 2024 07:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GCiNEpM7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A758166F14
	for <linux-media@vger.kernel.org>; Thu, 24 Oct 2024 07:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729754888; cv=none; b=shrIJ5BstA3cJyEt3mFR1TFshkGuKIk6lJnDOsQ9P1tSW1w9mRxq0c6lQPTMhilUlYBjlAANZiig7PdMxFxZxba8aj4bQlv4c56GlgKheUJfNEUSdhhm3frqrIWNjGtOGro4v/q/RZqM94hKwX1ckXdue2aIrjLvp1P/xCH68/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729754888; c=relaxed/simple;
	bh=qBnt9agVmzFcipNsdMc0yoEhzAnQMrB0WlPk43NEI2Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=ukVqGc0qWFSkssXUvUIJzi+YlgOgQnFVPDduq9eQHszQPCgNycvhFCCW2HxghpNFe5j0n2+zn7KGUM27Bic6Lrzc6uHrFS5w8ZUwUhZfyqbbNwNkN5kAF6rSimHodr7nwL9OWNMkoOdePuTMT/dF9pHvjGDu+zp07a8Ct+MSe7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GCiNEpM7; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729754886; x=1761290886;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=qBnt9agVmzFcipNsdMc0yoEhzAnQMrB0WlPk43NEI2Q=;
  b=GCiNEpM7lbAx2Do4mTZyOcBPPLv63NEy1uF7eTOc42CT4UunLKBEywX/
   dZAWt8sisATCz1RbII0qGOUMklTPf9FO4Cs5dFGcefP5u0hVwo5U5flpr
   8kvgwVTWKzDUOxp27Lhx3fMohLMeuW+nna4ezeHrfxMwXwzTvPm1BfqMX
   2M9RVERVkCWSqJbHILTmZaOgOvglGL8VKWqMJ0jTSMlovxk/1NRRATlza
   Lgz9LpzniAAf2ESw7B5LYjnWOpffHVk824XrpmFfxvxFDh35TiS9h71fV
   C3OQPjxtwG3HL0J6DIC1/0xAx9eXn1PkTKNSreL2/onIwURQvwG+/SgtA
   A==;
X-CSE-ConnectionGUID: 0HNFFKvGRJ+ExOxmR8SwFg==
X-CSE-MsgGUID: 0kRPJXjIShyzO5Ry3JW25g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39913994"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="39913994"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 00:27:59 -0700
X-CSE-ConnectionGUID: xHItnWmAT0uNJYGWg2OIyA==
X-CSE-MsgGUID: aMUxyskzSSucXOWV/wAUSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; 
   d="scan'208";a="103826735"
Received: from ipu5-build.bj.intel.com ([10.238.232.136])
  by fmviesa002.fm.intel.com with ESMTP; 24 Oct 2024 00:27:52 -0700
From: Bingbu Cao <bingbu.cao@intel.com>
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com
Cc: bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com
Subject: [PATCH 2/4] media: ipu6: optimize the IPU6 MMU mapping flow
Date: Thu, 24 Oct 2024 15:24:37 +0800
Message-Id: <1729754679-6402-2-git-send-email-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1729754679-6402-1-git-send-email-bingbu.cao@intel.com>
References: <1729754679-6402-1-git-send-email-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

ipu6_mmu_map() operated on a per-page basis, it leads frequent
spin_lock/unlock() and clflush_cache_range() for each page, it
will cause inefficiencies especially when handling dma-bufs
with large number of pages. However, the pages are likely concentrated
pages by IOMMU DMA driver, IPU MMU driver can map the concentrated
pages into less entries in l1 table.

This change enhances ipu6_mmu_map() with batching process multiple
contiguous pages. It significantly reduces calls for spin_lock/unlock
and clflush_cache_range() and improve the performance.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
Signed-off-by: Jianhui Dai <jianhui.j.dai@intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-mmu.c | 144 +++++++++++++++-----------------
 1 file changed, 69 insertions(+), 75 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu.c b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
index 9ea6789bca5e..e957ccb4691d 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-mmu.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
@@ -295,72 +295,90 @@ static size_t l2_unmap(struct ipu6_mmu_info *mmu_info, unsigned long iova,
 static int l2_map(struct ipu6_mmu_info *mmu_info, unsigned long iova,
 		  phys_addr_t paddr, size_t size)
 {
-	u32 l1_idx = iova >> ISP_L1PT_SHIFT;
-	u32 iova_start = iova;
+	struct device *dev = mmu_info->dev;
+	unsigned int l2_entries;
 	u32 *l2_pt, *l2_virt;
 	unsigned int l2_idx;
 	unsigned long flags;
+	size_t mapped = 0;
 	dma_addr_t dma;
 	u32 l1_entry;
-
-	dev_dbg(mmu_info->dev,
-		"mapping l2 page table for l1 index %u (iova %8.8x)\n",
-		l1_idx, (u32)iova);
+	u32 l1_idx;
+	int err = 0;
 
 	spin_lock_irqsave(&mmu_info->lock, flags);
-	l1_entry = mmu_info->l1_pt[l1_idx];
-	if (l1_entry == mmu_info->dummy_l2_pteval) {
-		l2_virt = mmu_info->l2_pts[l1_idx];
-		if (likely(!l2_virt)) {
-			l2_virt = alloc_l2_pt(mmu_info);
-			if (!l2_virt) {
-				spin_unlock_irqrestore(&mmu_info->lock, flags);
-				return -ENOMEM;
-			}
-		}
-
-		dma = map_single(mmu_info, l2_virt);
-		if (!dma) {
-			dev_err(mmu_info->dev, "Failed to map l2pt page\n");
-			free_page((unsigned long)l2_virt);
-			spin_unlock_irqrestore(&mmu_info->lock, flags);
-			return -EINVAL;
-		}
-
-		l1_entry = dma >> ISP_PADDR_SHIFT;
-
-		dev_dbg(mmu_info->dev, "page for l1_idx %u %p allocated\n",
-			l1_idx, l2_virt);
-		mmu_info->l1_pt[l1_idx] = l1_entry;
-		mmu_info->l2_pts[l1_idx] = l2_virt;
-		clflush_cache_range((void *)&mmu_info->l1_pt[l1_idx],
-				    sizeof(mmu_info->l1_pt[l1_idx]));
-	}
-
-	l2_pt = mmu_info->l2_pts[l1_idx];
-
-	dev_dbg(mmu_info->dev, "l2_pt at %p with dma 0x%x\n", l2_pt, l1_entry);
 
 	paddr = ALIGN(paddr, ISP_PAGE_SIZE);
+	for (l1_idx = iova >> ISP_L1PT_SHIFT;
+	     size > 0 && l1_idx < ISP_L1PT_PTES; l1_idx++) {
+		dev_dbg(dev,
+			"mapping l2 page table for l1 index %u (iova %8.8x)\n",
+			l1_idx, (u32)iova);
 
-	l2_idx = (iova_start & ISP_L2PT_MASK) >> ISP_L2PT_SHIFT;
+		l1_entry = mmu_info->l1_pt[l1_idx];
+		if (l1_entry == mmu_info->dummy_l2_pteval) {
+			l2_virt = mmu_info->l2_pts[l1_idx];
+			if (likely(!l2_virt)) {
+				l2_virt = alloc_l2_pt(mmu_info);
+				if (!l2_virt) {
+					err = -ENOMEM;
+					goto error;
+				}
+			}
 
-	dev_dbg(mmu_info->dev, "l2_idx %u, phys 0x%8.8x\n", l2_idx,
-		l2_pt[l2_idx]);
-	if (l2_pt[l2_idx] != mmu_info->dummy_page_pteval) {
-		spin_unlock_irqrestore(&mmu_info->lock, flags);
-		return -EINVAL;
+			dma = map_single(mmu_info, l2_virt);
+			if (!dma) {
+				dev_err(dev, "Failed to map l2pt page\n");
+				free_page((unsigned long)l2_virt);
+				err = -EINVAL;
+				goto error;
+			}
+
+			l1_entry = dma >> ISP_PADDR_SHIFT;
+
+			dev_dbg(dev, "page for l1_idx %u %p allocated\n",
+				l1_idx, l2_virt);
+			mmu_info->l1_pt[l1_idx] = l1_entry;
+			mmu_info->l2_pts[l1_idx] = l2_virt;
+
+			clflush_cache_range(&mmu_info->l1_pt[l1_idx],
+					    sizeof(mmu_info->l1_pt[l1_idx]));
+		}
+
+		l2_pt = mmu_info->l2_pts[l1_idx];
+		l2_entries = 0;
+
+		for (l2_idx = (iova & ISP_L2PT_MASK) >> ISP_L2PT_SHIFT;
+		     size > 0 && l2_idx < ISP_L2PT_PTES; l2_idx++) {
+			l2_pt[l2_idx] = paddr >> ISP_PADDR_SHIFT;
+
+			dev_dbg(dev, "l2 index %u mapped as 0x%8.8x\n", l2_idx,
+				l2_pt[l2_idx]);
+
+			iova += ISP_PAGE_SIZE;
+			paddr += ISP_PAGE_SIZE;
+			mapped += ISP_PAGE_SIZE;
+			size -= ISP_PAGE_SIZE;
+
+			l2_entries++;
+		}
+
+		WARN_ON_ONCE(!l2_entries);
+		clflush_cache_range(&l2_pt[l2_idx - l2_entries],
+				    sizeof(l2_pt[0]) * l2_entries);
 	}
 
-	l2_pt[l2_idx] = paddr >> ISP_PADDR_SHIFT;
-
-	clflush_cache_range((void *)&l2_pt[l2_idx], sizeof(l2_pt[l2_idx]));
 	spin_unlock_irqrestore(&mmu_info->lock, flags);
 
-	dev_dbg(mmu_info->dev, "l2 index %u mapped as 0x%8.8x\n", l2_idx,
-		l2_pt[l2_idx]);
-
 	return 0;
+
+error:
+	spin_unlock_irqrestore(&mmu_info->lock, flags);
+	/* unroll mapping in case something went wrong */
+	if (mapped)
+		l2_unmap(mmu_info, iova - mapped, paddr - mapped, mapped);
+
+	return err;
 }
 
 static int __ipu6_mmu_map(struct ipu6_mmu_info *mmu_info, unsigned long iova,
@@ -692,10 +710,7 @@ size_t ipu6_mmu_unmap(struct ipu6_mmu_info *mmu_info, unsigned long iova,
 int ipu6_mmu_map(struct ipu6_mmu_info *mmu_info, unsigned long iova,
 		 phys_addr_t paddr, size_t size)
 {
-	unsigned long orig_iova = iova;
 	unsigned int min_pagesz;
-	size_t orig_size = size;
-	int ret = 0;
 
 	if (mmu_info->pgsize_bitmap == 0UL)
 		return -ENODEV;
@@ -718,28 +733,7 @@ int ipu6_mmu_map(struct ipu6_mmu_info *mmu_info, unsigned long iova,
 	dev_dbg(mmu_info->dev, "map: iova 0x%lx pa %pa size 0x%zx\n",
 		iova, &paddr, size);
 
-	while (size) {
-		size_t pgsize = ipu6_mmu_pgsize(mmu_info->pgsize_bitmap,
-						iova | paddr, size);
-
-		dev_dbg(mmu_info->dev,
-			"mapping: iova 0x%lx pa %pa pgsize 0x%zx\n",
-			iova, &paddr, pgsize);
-
-		ret = __ipu6_mmu_map(mmu_info, iova, paddr, pgsize);
-		if (ret)
-			break;
-
-		iova += pgsize;
-		paddr += pgsize;
-		size -= pgsize;
-	}
-
-	/* unroll mapping in case something went wrong */
-	if (ret)
-		ipu6_mmu_unmap(mmu_info, orig_iova, orig_size - size);
-
-	return ret;
+	return __ipu6_mmu_map(mmu_info, iova, paddr, size);
 }
 
 static void ipu6_mmu_destroy(struct ipu6_mmu *mmu)
-- 
2.7.4


