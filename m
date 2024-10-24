Return-Path: <linux-media+bounces-20162-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0889ADD95
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 09:28:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFA06283230
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 07:28:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A10319CC25;
	Thu, 24 Oct 2024 07:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hLRqIpqy"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1774B18BBBA
	for <linux-media@vger.kernel.org>; Thu, 24 Oct 2024 07:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729754889; cv=none; b=k4m9yA3zDxPqL0eKZS22AKZm6Vu5UdvIIF8yDxW+7CJmCMlQQmQy4GPuUBeAC9cS5FZQevqbsfusgHXCDygjgZSeDGTpjay179TqJJZGnUMejAN/88eZ3/GbXpyBSss1WMZqZnQvM1pS0/uAcFlm2vyv8WP6iyQAcwZawSMFGEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729754889; c=relaxed/simple;
	bh=flbnZJoz4+ZPkr8vx2yVXkAbxnPPexVeq7ZZzP4rJ0Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=NA/ur/0WZt+88/2wUMZgx5oA4v1RaZbjgOKrLhnNH0blB/0BKpZ9lkEKHJZvR9AgBrjHdYzXPmVp1sHo7p932ZjUBBo7kN1uTn6VEmqy+qE5ptUpEebEH1uAcGRlb6ph23eqzLmW33AgaLT4Z5vioy+WA74w+QO+TgsHvF22D6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hLRqIpqy; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729754889; x=1761290889;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=flbnZJoz4+ZPkr8vx2yVXkAbxnPPexVeq7ZZzP4rJ0Y=;
  b=hLRqIpqyN9R95gg2bblCFyieN8mnOECpZP2nOrPykK02Vj7yKlpbBLfX
   JmRm9k3UisKOgZUcb6ehHbeDDSvUS85iIoXu74+7ySHtlV/Z5LKiqVMTQ
   Kxjw2894fHZASsvC39U/Qxdiea7aImW6n+HAJlq/IS7X1TbHYnexYXRuU
   GFOldlTvAtFSYpVdpxLsEVvupWo2AAM7fJMAy+SOEIrFm0ufAOCEZYGpM
   7m6hzAFbpUZv0AL81PGOddSlmnTT73T/CufucWO9baf8Uvtjeo0JS/MSM
   TKCWwFCMN6r/n5iBDjBErxmzgoFkmKfASxbnHJnnrmJ+YpozU5aJIrCPS
   A==;
X-CSE-ConnectionGUID: IJ823bpIS3OhlhK1e+Zt/w==
X-CSE-MsgGUID: qeESxqzuSpGI5VKCC5IPFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39913996"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="39913996"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 00:27:59 -0700
X-CSE-ConnectionGUID: ItLX55IjQzSwsVIYOdaTRA==
X-CSE-MsgGUID: 624cNXT+QNCsTLR0hl6VZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; 
   d="scan'208";a="103826746"
Received: from ipu5-build.bj.intel.com ([10.238.232.136])
  by fmviesa002.fm.intel.com with ESMTP; 24 Oct 2024 00:27:56 -0700
From: Bingbu Cao <bingbu.cao@intel.com>
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com
Cc: bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com
Subject: [PATCH 4/4] media: ipu6: remove unused ipu6_mmu_pgsize()
Date: Thu, 24 Oct 2024 15:24:39 +0800
Message-Id: <1729754679-6402-4-git-send-email-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1729754679-6402-1-git-send-email-bingbu.cao@intel.com>
References: <1729754679-6402-1-git-send-email-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

The ipu6_mmu_pgsize() could be removed as driver unload this to
the PCI core driver DMA ops instead of handling in IPU6 driver.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-mmu.c | 28 ----------------------------
 1 file changed, 28 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu.c b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
index d746e42918ae..2d9c6fbd5da2 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-mmu.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
@@ -644,34 +644,6 @@ phys_addr_t ipu6_mmu_iova_to_phys(struct ipu6_mmu_info *mmu_info,
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
 void ipu6_mmu_unmap(struct ipu6_mmu_info *mmu_info, unsigned long iova,
 		    size_t size)
 {
-- 
2.7.4


