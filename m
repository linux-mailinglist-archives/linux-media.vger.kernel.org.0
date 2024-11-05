Return-Path: <linux-media+bounces-20819-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C077C9BC361
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 03:51:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5C542B219CF
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 02:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2246A44375;
	Tue,  5 Nov 2024 02:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oh7XD5T1"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD5E4CB36
	for <linux-media@vger.kernel.org>; Tue,  5 Nov 2024 02:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730775084; cv=none; b=dURbvhGEBkpGEPqfwGY+8ZOXXyr+ScR8a2dgckfi/mimvxjYe3rJ6wNVYZl535EzYkVAHE9+d9vptAvQtg5+904U5cT2zQJRy7Gu6RHfOzODLpx9sbMqncNYY18G+EcUvvD7rwIqqyktsvZKEYCWa/p60WSV6+g4QkEKT/Xes/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730775084; c=relaxed/simple;
	bh=U7214FvEsMhxlt1ZKiGnAaHa9O4ThNmZ9ZtJCMWa8lA=;
	h=From:To:Cc:Subject:Date:Message-Id; b=dq7VoS3t9i5HLPRkNf/MN+kUTXV0hfWO1t3F8MTXZfKQx4JsAVVmDTWypDNO5UKR1jYla0zlnwf3qNm0d8/FpYJ2BUGfA8fnjyTXjaQvjyvwcDMbL4ni2U1ndAgE1GLR1ufVYZT9yI1/Zj6jp3nVRgGGabCkw73O7bRj2gzum0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oh7XD5T1; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730775082; x=1762311082;
  h=from:to:cc:subject:date:message-id;
  bh=U7214FvEsMhxlt1ZKiGnAaHa9O4ThNmZ9ZtJCMWa8lA=;
  b=Oh7XD5T1+4a7V8FIcdX7t4NyeBeslaAN7Yvg1wHm4YpaR5oQaMotQ4wA
   NCgnrVsT/yywlCHIznnK2bm9tC+sWij+t2si9rjpLExzbUum5szDbY3/D
   /BG3ctSbZ0lnrBmqy9QrR6uiFMTvCujXwAClOLsjXwSEIUacTgOY8OdLo
   dL1h7Ly/P/b+yIMv+IpZ7PmfT7UeVcE32PPAhjWUr2pVmtX1KwRXhGLIi
   esEO2SO4pgWDou+jeStBFsX1eiWQL5ClT2AgZms474cazd9bkTqaiCinM
   qGSmvsofUb4EGK2wshu5P7dxDefTAxaOQvYyfInai5DBjxWgGScxjdUKP
   w==;
X-CSE-ConnectionGUID: JBh0zqFYTrKVzp4TFJkohQ==
X-CSE-MsgGUID: OySWAQzMQCqZ/sBIvh6e6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30663637"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30663637"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 18:51:21 -0800
X-CSE-ConnectionGUID: nZxVjJ7pQe62U6g33carKw==
X-CSE-MsgGUID: pBCWDFirSIWBFYo0R3CVZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; 
   d="scan'208";a="88421931"
Received: from ipu5-build.bj.intel.com ([10.238.232.136])
  by fmviesa004.fm.intel.com with ESMTP; 04 Nov 2024 18:48:08 -0800
From: Bingbu Cao <bingbu.cao@intel.com>
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com
Cc: bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com
Subject: [PATCH v3 1/4] media: ipu6: move the l2_unmap() up before l2_map()
Date: Tue,  5 Nov 2024 10:45:05 +0800
Message-Id: <1730774708-19594-1-git-send-email-bingbu.cao@intel.com>
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
from v1: reword the commit message to make it clear
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


