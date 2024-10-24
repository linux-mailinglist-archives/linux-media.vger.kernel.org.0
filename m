Return-Path: <linux-media+bounces-20164-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0169ADD98
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 09:28:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 241D4B2350A
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 07:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B50721A01D8;
	Thu, 24 Oct 2024 07:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kvZCe25P"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16984198A30
	for <linux-media@vger.kernel.org>; Thu, 24 Oct 2024 07:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729754892; cv=none; b=EpCA9wRVFxTVMcnB405f5TBzoHkMDKXcnyc0Vqz+IQIPyQDmZ3ZuJNNRPpubpAIPBcb5/Da/8G/2R0VP3IeTWpkbmMwIlJRjAnrQEkZm9dGKSh4WutzAdCAU2a2hra7g6E8GxjmQzjZbxcZyB3LKi3SrSKlgy67C5Fmdfxz+2pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729754892; c=relaxed/simple;
	bh=Dv4YaQ6bEdJOMxKQrTsyBAiq0FkBprY/Seza0jFThRc=;
	h=From:To:Cc:Subject:Date:Message-Id; b=l1tGExBn4ueCzRWZLKefVOtRCv2VmZc98TuI/mDtDBLDqRSmkM4cf+aUOcin8OBDOqNQHj84FOb1iH44Zw71Qqon4CQCWV5Jqq/teGvxkGXKzHb1N1QlQhcVQgW23znv+r2KOGozpELv3XO1ryHgld2YDyT7sFob3kSakKqPA20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kvZCe25P; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729754890; x=1761290890;
  h=from:to:cc:subject:date:message-id;
  bh=Dv4YaQ6bEdJOMxKQrTsyBAiq0FkBprY/Seza0jFThRc=;
  b=kvZCe25PYgA6PC4/d/xAf7BYeNq+ABAjoPTdhbMd2rk/gpvgifFV+4DD
   jD7xNmsDh2hYFZCk09YCV70/SOAihrXNhXeL2L9aBiDZtx9GINUrxdMUa
   +VGA6tZjkXxaBfhfGwaxchOCxz+N7kyYoCbStCx8KWYtEBDz5fYFRSEWr
   QfcQjafqlLCbteGUyhHT+b9m/812oy+Qes2/xi8xfpgvIrMikXrb+O12R
   vPkHBg2pZBqXPBPgc6UvuoRMEDJuoj4j2mu6Is30KWOpYzv6Vb4rxiwOt
   8xDQ+0r45VMsTEpnSqTpWp1C4O4Qf+hFV59b54TxhfUhVJ5jIurnmleG6
   g==;
X-CSE-ConnectionGUID: qgPva+eCSKCiUpj9whBooA==
X-CSE-MsgGUID: jHGKZ2VDSsmUfGSC7VQmxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39913993"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="39913993"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 00:27:59 -0700
X-CSE-ConnectionGUID: Au/rDXliT16MBeayGQ8hhw==
X-CSE-MsgGUID: YkdGlBZ6T36lGt913Q6QBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; 
   d="scan'208";a="103826729"
Received: from ipu5-build.bj.intel.com ([10.238.232.136])
  by fmviesa002.fm.intel.com with ESMTP; 24 Oct 2024 00:27:51 -0700
From: Bingbu Cao <bingbu.cao@intel.com>
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com
Cc: bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com
Subject: [PATCH 1/4] media: ipu6: move the l2_unmap() up before l2_map()
Date: Thu, 24 Oct 2024 15:24:36 +0800
Message-Id: <1729754679-6402-1-git-send-email-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

l2_map() and l2_unmap() are better to be grouped together, and
l2_unmap() could also be called in l2_map() for error handling.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
Signed-off-by: Jianhui Dai <jianhui.j.dai@intel.com>
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


