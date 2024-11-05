Return-Path: <linux-media+bounces-20884-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2859BC7A4
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 09:03:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB35F1C21EF2
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 08:03:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB1871FEFC4;
	Tue,  5 Nov 2024 08:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CDCwwwuX"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABED81D5CD1
	for <linux-media@vger.kernel.org>; Tue,  5 Nov 2024 08:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730793813; cv=none; b=RMYkXLNHIDzKor2/t9N97oKxLgN3p4x23uiG7ZNNGoE0pr+23yrCJU2TZiKXf2Snn2+xPy7ztPVHyogj2TT3IJx3HHDARgmhywSihO7E4kRJGOpKcpvjfGqNEPwa//Ql3q56UNp23249RXUinlAwWofgka/UinlMV5GZMM7p6hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730793813; c=relaxed/simple;
	bh=FcK561kRhrTiPNs5Nc0WRaHIs3BYFyR7agil1/ZHvm0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bY9rhh9LkEBIppfi0iG2aBhdxEPjbwYoAdYJZ2WHRXEBouXPqWHYsq1CTlgCkgd4f6S1sW8lklW9o7/pxr+1Xma9Y1DSZbrWAmUhO6BnL+hLGLMzxnoGvWfeJr3UHkkag0S/S4t7PeOshX4s35+FrTvSKkF071CV6TWoZwD5zeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CDCwwwuX; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730793811; x=1762329811;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FcK561kRhrTiPNs5Nc0WRaHIs3BYFyR7agil1/ZHvm0=;
  b=CDCwwwuXKTJC454JN2/wt/SOAMYcaslMp8Zox6XPcHg3of63rSP8kaQb
   UD0tK6QUQlEbYApDXbhIleBdJRlhTleg5BYDUwYPKU69Ao0jhXrfzjlwM
   T9qPa4jz2dKU3vjorRvlwABIVZqv93HXBCkQC75aA5+udPI/4B2Y5jmlZ
   OHwR0nshpNgAjV3eAYR+HbY67Af0oQODFniBJrImepxxIr1HX+57tjUOd
   eBOj5UEMqCUC2cqcTfrL4ct3yaEvsRKrDpUxAzRwUWu46gGExRfDGAUJh
   v4euDmudl7Ax4Y4oR3rZPWEM3d/8t3e3FQE4Y6znNltFT5NqI+Ntkfgzc
   A==;
X-CSE-ConnectionGUID: zYMJSOcXQx+xl5MM7JC2gQ==
X-CSE-MsgGUID: FboFs0e+QjO0OlX3jxdhwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="41152951"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="41152951"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 00:03:31 -0800
X-CSE-ConnectionGUID: r6f2/R5bR0+LIrH6mtLkjw==
X-CSE-MsgGUID: Z5zeWBRFTIS4I1ufDhV5eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="88683490"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 00:03:30 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6785C11FA28;
	Tue,  5 Nov 2024 10:03:27 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1t8EX9-0026GZ-1G;
	Tue, 05 Nov 2024 10:03:27 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: stanislaw.gruszka@linux.intel.com,
	bingbu.cao@intel.com
Subject: [PATCH 1/1] media: ipu6: Fix DMA and physical address debugging messages for 32-bit
Date: Tue,  5 Nov 2024 10:03:17 +0200
Message-Id: <20241105080317.500735-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix printing DMA and physical address printing on 32-bit platforms, by
using correct types. Also cast DMA_BIT_MASK() result to dma_addr_t to make
Clang happy.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-dma.c |  7 ++++---
 drivers/media/pci/intel/ipu6/ipu6-mmu.c | 25 ++++++++++++++-----------
 2 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-dma.c b/drivers/media/pci/intel/ipu6/ipu6-dma.c
index 92530a1cc90f..801f6bd00a89 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-dma.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-dma.c
@@ -428,11 +428,12 @@ static int ipu6_dma_map_sg(struct device *dev, struct scatterlist *sglist,
 
 	iova_addr = iova->pfn_lo;
 	for_each_sg(sglist, sg, count, i) {
+		phys_addr_t iova_pa;
 		int ret;
 
-		dev_dbg(dev, "mapping entry %d: iova 0x%llx phy %pad size %d\n",
-			i, PFN_PHYS(iova_addr), &sg_dma_address(sg),
-			sg_dma_len(sg));
+		iova_pa = PFN_PHYS(iova_addr);
+		dev_dbg(dev, "mapping entry %d: iova %pap phy %pap size %d\n",
+			i, &iova_pa, &sg_dma_address(sg), sg_dma_len(sg));
 
 		ret = ipu6_mmu_map(mmu->dmap->mmu_info, PFN_PHYS(iova_addr),
 				   sg_dma_address(sg),
diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu.c b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
index c3a20507d6db..873029eb7e92 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-mmu.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
@@ -97,13 +97,15 @@ static void page_table_dump(struct ipu6_mmu_info *mmu_info)
 	for (l1_idx = 0; l1_idx < ISP_L1PT_PTES; l1_idx++) {
 		u32 l2_idx;
 		u32 iova = (phys_addr_t)l1_idx << ISP_L1PT_SHIFT;
+		phys_addr_t l2_phys;
 
 		if (mmu_info->l1_pt[l1_idx] == mmu_info->dummy_l2_pteval)
 			continue;
+
+		l2_phys = TBL_PHYS_ADDR(mmu_info->l1_pt[l1_idx];)
 		dev_dbg(mmu_info->dev,
-			"l1 entry %u; iovas 0x%8.8x-0x%8.8x, at %pa\n",
-			l1_idx, iova, iova + ISP_PAGE_SIZE,
-			TBL_PHYS_ADDR(mmu_info->l1_pt[l1_idx]));
+			"l1 entry %u; iovas 0x%8.8x-0x%8.8x, at %pap\n",
+			l1_idx, iova, iova + ISP_PAGE_SIZE, &l2_phys);
 
 		for (l2_idx = 0; l2_idx < ISP_L2PT_PTES; l2_idx++) {
 			u32 *l2_pt = mmu_info->l2_pts[l1_idx];
@@ -227,7 +229,7 @@ static u32 *alloc_l1_pt(struct ipu6_mmu_info *mmu_info)
 	}
 
 	mmu_info->l1_pt_dma = dma >> ISP_PADDR_SHIFT;
-	dev_dbg(mmu_info->dev, "l1 pt %p mapped at %llx\n", pt, dma);
+	dev_dbg(mmu_info->dev, "l1 pt %p mapped at %pad\n", pt, &dma);
 
 	return pt;
 
@@ -330,8 +332,8 @@ static int __ipu6_mmu_map(struct ipu6_mmu_info *mmu_info, unsigned long iova,
 	u32 iova_end = ALIGN(iova + size, ISP_PAGE_SIZE);
 
 	dev_dbg(mmu_info->dev,
-		"mapping iova 0x%8.8x--0x%8.8x, size %zu at paddr 0x%10.10llx\n",
-		iova_start, iova_end, size, paddr);
+		"mapping iova 0x%8.8x--0x%8.8x, size %zu at paddr %pap\n",
+		iova_start, iova_end, size, &paddr);
 
 	return l2_map(mmu_info, iova_start, paddr, size);
 }
@@ -363,8 +365,8 @@ static size_t l2_unmap(struct ipu6_mmu_info *mmu_info, unsigned long iova,
 		     < iova_start + size && l2_idx < ISP_L2PT_PTES; l2_idx++) {
 		l2_pt = mmu_info->l2_pts[l1_idx];
 		dev_dbg(mmu_info->dev,
-			"unmap l2 index %u with pteval 0x%10.10llx\n",
-			l2_idx, TBL_PHYS_ADDR(l2_pt[l2_idx]));
+			"unmap l2 index %u with pteval 0x%p\n",
+			l2_idx, &l2_pt[l2_idx]);
 		l2_pt[l2_idx] = mmu_info->dummy_page_pteval;
 
 		clflush_cache_range((void *)&l2_pt[l2_idx],
@@ -525,9 +527,10 @@ static struct ipu6_mmu_info *ipu6_mmu_alloc(struct ipu6_device *isp)
 		return NULL;
 
 	mmu_info->aperture_start = 0;
-	mmu_info->aperture_end = DMA_BIT_MASK(isp->secure_mode ?
-					      IPU6_MMU_ADDR_BITS :
-					      IPU6_MMU_ADDR_BITS_NON_SECURE);
+	mmu_info->aperture_end =
+		(dma_addr_t)DMA_BIT_MASK(isp->secure_mode ?
+					 IPU6_MMU_ADDR_BITS :
+					 IPU6_MMU_ADDR_BITS_NON_SECURE);
 	mmu_info->pgsize_bitmap = SZ_4K;
 	mmu_info->dev = &isp->pdev->dev;
 
-- 
2.39.5


