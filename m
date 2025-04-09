Return-Path: <linux-media+bounces-29726-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8945CA8218A
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 12:00:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B33FC16FC87
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 09:58:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DC1825D554;
	Wed,  9 Apr 2025 09:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nza9FCe7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1311F22DFA2
	for <linux-media@vger.kernel.org>; Wed,  9 Apr 2025 09:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744192720; cv=none; b=TrcVATr+vEHgbQ82WrJI1cxgDLdbkW1LFRO2zbUGdkbpO/atSDz3kbKNy0dn0/Edi2d+AFxZI9imcP58i+myVxBcElZHJ1vgF4fs6X2vU2uxYnLE/qyl0trbsmO8jNL5td6Lll8cpIbChzIrE6ugWyqBkQ19ccqp2Ee20BgaF58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744192720; c=relaxed/simple;
	bh=XEY1i3w9jFmzKeXPUo57JIs5oEaURifoQGtzlVh70I4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LR4cMYSsbFXyk/mypF7YafLvHNDEaJvFnTdaKn4Dpyn1x/rPZxDeNQsOgVyldNwtNYRwDjWDFaT6P9UyJHh2D+j7Y0YfJAbt0o3qXRzwof2E7xjSaHdlsCL4zKLAFXTFSWibWNnx1AeYebeM08wWEqHZFnaSLaZuq4xgBftnmtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nza9FCe7; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744192718; x=1775728718;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XEY1i3w9jFmzKeXPUo57JIs5oEaURifoQGtzlVh70I4=;
  b=nza9FCe78b6rTOK08AvQ1PrcSIdOoxpf5w/4+SgmR5Ijqftm6rC7+P67
   JtWHoNbUqGpd2SEOgpEsTM3KKxfNEFGvMi9MyWkcwOXOnt4enpuje6JEM
   cxnEOwVpWGgg7k2oWb5n9cpKuHKw4NSGcWG0XkGWZ1H+Zu++9Cys2NwOq
   eURtb1eWAvThn6wClYSoqPZK4NMMgIsm85hjoStIdgvlJfso6ehG9iSGj
   xgbaGM58pST9qAaEhyHWi4kA6DQhYIHnu0dr04gGhEug5tXWlN5O3oBAu
   lDPXdmkfMqr6GV7CJjbf2UM8fyYSYsTETALwlYHh9ZT59hbaS9K0u+cTe
   A==;
X-CSE-ConnectionGUID: akQU5pwnTASkxg0BLKtGxg==
X-CSE-MsgGUID: FwsiyZRXSLiyUg8UgBmaBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45780912"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="45780912"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 02:58:37 -0700
X-CSE-ConnectionGUID: m1iLk8I/SAWmQUdFGSGx8A==
X-CSE-MsgGUID: eMoXHUMtQXGkEHVJojYu0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="129085193"
Received: from kfilipia-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.254.14])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 02:58:36 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH] media: intel/ipu6: Fix dma mask for non-secure mode
Date: Wed,  9 Apr 2025 11:58:25 +0200
Message-Id: <20250409095825.1014521-1-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We use dma_get_mask() of auxdev device for calculate iova pfn limit.
This is always 32 bit mask as we do not initialize the mask (and we can
not do so, since dev->dev_mask is NULL anyways for auxdev).

Since we need 31 bit mask for non-secure mode create wrapper of
alloc_iova() which use mmu_info->aperture_end. This give us always
the correct mask.

Fixes: daabc5c64703 ("media: ipu6: not override the dma_ops of device in driver")
Cc: stable@vger.kernel.org
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-dma.c |  6 ++----
 drivers/media/pci/intel/ipu6/ipu6-dma.h |  7 -------
 drivers/media/pci/intel/ipu6/ipu6-mmu.c |  3 +--
 drivers/media/pci/intel/ipu6/ipu6-mmu.h | 13 +++++++++++++
 4 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-dma.c b/drivers/media/pci/intel/ipu6/ipu6-dma.c
index b34022bad83b..a1d4ec35f802 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-dma.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-dma.c
@@ -171,8 +171,7 @@ void *ipu6_dma_alloc(struct ipu6_bus_device *sys, size_t size,
 	size = PAGE_ALIGN(size);
 	count = PHYS_PFN(size);
 
-	iova = alloc_iova(&mmu->dmap->iovad, count,
-			  PHYS_PFN(dma_get_mask(dev)), 0);
+	iova = ipu6_alloc_iova(mmu, count);
 	if (!iova)
 		goto out_kfree;
 
@@ -397,8 +396,7 @@ int ipu6_dma_map_sg(struct ipu6_bus_device *sys, struct scatterlist *sglist,
 	dev_dbg(dev, "dmamap trying to map %d ents %zu pages\n",
 		nents, npages);
 
-	iova = alloc_iova(&mmu->dmap->iovad, npages,
-			  PHYS_PFN(dma_get_mask(dev)), 0);
+	iova = ipu6_alloc_iova(mmu, npages);
 	if (!iova)
 		return 0;
 
diff --git a/drivers/media/pci/intel/ipu6/ipu6-dma.h b/drivers/media/pci/intel/ipu6/ipu6-dma.h
index b51244add9e6..0dd7c0556bd2 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-dma.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-dma.h
@@ -6,8 +6,6 @@
 
 #include <linux/dma-map-ops.h>
 #include <linux/dma-mapping.h>
-#include <linux/iova.h>
-#include <linux/iova.h>
 #include <linux/scatterlist.h>
 #include <linux/types.h>
 
@@ -15,11 +13,6 @@
 
 struct ipu6_mmu_info;
 
-struct ipu6_dma_mapping {
-	struct ipu6_mmu_info *mmu_info;
-	struct iova_domain iovad;
-};
-
 void ipu6_dma_sync_single(struct ipu6_bus_device *sys, dma_addr_t dma_handle,
 			  size_t size);
 void ipu6_dma_sync_sg(struct ipu6_bus_device *sys, struct scatterlist *sglist,
diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu.c b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
index 6d1c0b90169d..95eb17855847 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-mmu.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
@@ -421,8 +421,7 @@ static int allocate_trash_buffer(struct ipu6_mmu *mmu)
 	int ret;
 
 	/* Allocate 8MB in iova range */
-	iova = alloc_iova(&mmu->dmap->iovad, n_pages,
-			  PHYS_PFN(mmu->dmap->mmu_info->aperture_end), 0);
+	iova = ipu6_alloc_iova(mmu, n_pages);
 	if (!iova) {
 		dev_err(mmu->dev, "cannot allocate iova range for trash\n");
 		return -ENOMEM;
diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu.h b/drivers/media/pci/intel/ipu6/ipu6-mmu.h
index 8e40b4a66d7d..7f3860796762 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-mmu.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-mmu.h
@@ -7,6 +7,7 @@
 #define ISYS_MMID 1
 #define PSYS_MMID 0
 
+#include <linux/iova.h>
 #include <linux/list.h>
 #include <linux/spinlock_types.h>
 #include <linux/types.h>
@@ -58,6 +59,11 @@ struct ipu6_mmu {
 	void (*tlb_invalidate)(struct ipu6_mmu *mmu);
 };
 
+struct ipu6_dma_mapping {
+	struct ipu6_mmu_info *mmu_info;
+	struct iova_domain iovad;
+};
+
 struct ipu6_mmu *ipu6_mmu_init(struct device *dev,
 			       void __iomem *base, int mmid,
 			       const struct ipu6_hw_variants *hw);
@@ -70,4 +76,11 @@ void ipu6_mmu_unmap(struct ipu6_mmu_info *mmu_info, unsigned long iova,
 		    size_t size);
 phys_addr_t ipu6_mmu_iova_to_phys(struct ipu6_mmu_info *mmu_info,
 				  dma_addr_t iova);
+
+static inline struct iova *ipu_alloc_iova(struct ipu6_mmu *mmu,
+					  unsigned long n_pages)
+{
+	return alloc_iova(&mmu->dmap->iovad, n_pages,
+			  PHYS_PFN(mmu->dmap->mmu_info->aperture_end), 0);
+}
 #endif
-- 
2.34.1


