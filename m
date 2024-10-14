Return-Path: <linux-media+bounces-19520-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAD799BE51
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 05:47:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 404D21C2215A
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 03:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D39CE61FD7;
	Mon, 14 Oct 2024 03:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lwRoXD2A"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D4920E6
	for <linux-media@vger.kernel.org>; Mon, 14 Oct 2024 03:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728877659; cv=none; b=B3ZUCkDpcEUAFwqVqqH06reaprsoa6pwE6kauot5WQaLxf5vF/e8687PXhTKZYqks/rnbfoorHZgPlrMLg27uwfY90pd8KsfXcgWFdMjWylPhqKln3nwReaxPsO5+jEaKUqhmT/9mmbp8l+/7f9BsrWn2pQ9nM1n/kREuNEwQQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728877659; c=relaxed/simple;
	bh=8MQK+3EF/KaoddyTEmFNqWThNLO7q7O1wNXiW4wNXsg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bd0XGnKPrn/VfxS4nZV7xmneYnIuvTvzax9MiW+hOqEBmxkeaElfyygzRvbEPiJaCmlHsYG9qgGhktwnhmh/dePV24xpDYppua7Ie6roEFVDQYc+ZVo8eUvtnV+mg9vYXvDWMtQcStMEbEanjg3OQIRkLldp2lPQPz9lnKmCtbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lwRoXD2A; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728877657; x=1760413657;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8MQK+3EF/KaoddyTEmFNqWThNLO7q7O1wNXiW4wNXsg=;
  b=lwRoXD2A84PggBT1Lq7zAYopvEFoUdPKHpQd8I7OM59jF7igQKlWcdPr
   Yj9qHxND9MIUB9mHQCn6bD+si9V54TIZru008J6QMHPXS+rh3c8en+Vt3
   7t4Qz41ztj2dZIOn0QYGo2q5MLqh9489s36cTWQBchtF/MMlxO4NUdQXs
   aLwObJSrRs3jvW/MdwmFbWNsQvOIH0Oi+fGquzblJ/Xb7Y7WwaYrb58YD
   w4uZPsaJy2R1/jV+axH6mKRwJ60Qc259LYHzl2JTP4TDGPq7qyzSNj2Vd
   9bnXSWMofdzqvlTUj3knjCVkh4s35Dnd5AmhMymXJPw5gYHfOPxCEKGy/
   Q==;
X-CSE-ConnectionGUID: aYwp/PfZQJ2d194WdhOBnQ==
X-CSE-MsgGUID: eYP1nlwqQ4SqlGjxHoWI9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="53632119"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="53632119"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2024 20:47:36 -0700
X-CSE-ConnectionGUID: DTsh5YWwRB++lgc08Vf0LA==
X-CSE-MsgGUID: iZuu/47UStm/W4JJYpzm/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="77076853"
Received: from vtg-chrome.bj.intel.com ([172.16.127.120])
  by fmviesa006.fm.intel.com with ESMTP; 13 Oct 2024 20:47:33 -0700
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com
Cc: hch@lst.de,
	andriy.shevchenko@linux.intel.com,
	bingbu.cao@linux.intel.com,
	bingbu.cao@intel.com
Subject: [PATCH 1/5] media: ipu6: not override the dma_ops of device in driver
Date: Mon, 14 Oct 2024 11:47:28 +0800
Message-Id: <20241014034732.3109440-1-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bingbu Cao <bingbu.cao@intel.com>

DMA ops are a helper for architectures and not for drivers to override
the DMA implementation.  Driver should not override the DMA
implementation. This patch remove the dma_ops override and expose the
IPU6 DMA mapping APIs.

Fixes: 9163d83573e4 ("media: intel/ipu6: add IPU6 DMA mapping API and MMU table")
Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-bus.c      |   6 -
 drivers/media/pci/intel/ipu6/ipu6-buttress.c |  21 +-
 drivers/media/pci/intel/ipu6/ipu6-cpd.c      |  18 +-
 drivers/media/pci/intel/ipu6/ipu6-dma.c      | 195 +++++++++----------
 drivers/media/pci/intel/ipu6/ipu6-dma.h      |  34 +++-
 drivers/media/pci/intel/ipu6/ipu6-fw-com.c   |  14 +-
 6 files changed, 156 insertions(+), 132 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-bus.c b/drivers/media/pci/intel/ipu6/ipu6-bus.c
index 149ec098cdbf..37d88ddb6ee7 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-bus.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-bus.c
@@ -94,8 +94,6 @@ ipu6_bus_initialize_device(struct pci_dev *pdev, struct device *parent,
 	if (!adev)
 		return ERR_PTR(-ENOMEM);
 
-	adev->dma_mask = DMA_BIT_MASK(isp->secure_mode ? IPU6_MMU_ADDR_BITS :
-				      IPU6_MMU_ADDR_BITS_NON_SECURE);
 	adev->isp = isp;
 	adev->ctrl = ctrl;
 	adev->pdata = pdata;
@@ -106,10 +104,6 @@ ipu6_bus_initialize_device(struct pci_dev *pdev, struct device *parent,
 
 	auxdev->dev.parent = parent;
 	auxdev->dev.release = ipu6_bus_release;
-	auxdev->dev.dma_ops = &ipu6_dma_ops;
-	auxdev->dev.dma_mask = &adev->dma_mask;
-	auxdev->dev.dma_parms = pdev->dev.dma_parms;
-	auxdev->dev.coherent_dma_mask = adev->dma_mask;
 
 	ret = auxiliary_device_init(auxdev);
 	if (ret < 0) {
diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.c b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
index e47f84c30e10..d66db537be4a 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-buttress.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
@@ -24,6 +24,7 @@
 
 #include "ipu6.h"
 #include "ipu6-bus.h"
+#include "ipu6-dma.h"
 #include "ipu6-buttress.h"
 #include "ipu6-platform-buttress-regs.h"
 
@@ -553,6 +554,7 @@ int ipu6_buttress_map_fw_image(struct ipu6_bus_device *sys,
 			       const struct firmware *fw, struct sg_table *sgt)
 {
 	bool is_vmalloc = is_vmalloc_addr(fw->data);
+	struct pci_dev *pdev = sys->isp->pdev;
 	struct page **pages;
 	const void *addr;
 	unsigned long n_pages;
@@ -588,14 +590,20 @@ int ipu6_buttress_map_fw_image(struct ipu6_bus_device *sys,
 		goto out;
 	}
 
-	ret = dma_map_sgtable(&sys->auxdev.dev, sgt, DMA_TO_DEVICE, 0);
-	if (ret < 0) {
-		ret = -ENOMEM;
+	ret = dma_map_sgtable(&pdev->dev, sgt, DMA_TO_DEVICE, 0);
+	if (ret) {
+		sg_free_table(sgt);
+		goto out;
+	}
+
+	ret = ipu6_dma_map_sgtable(sys, sgt, DMA_TO_DEVICE, 0);
+	if (ret) {
+		dma_unmap_sgtable(&pdev->dev, sgt, DMA_TO_DEVICE, 0);
 		sg_free_table(sgt);
 		goto out;
 	}
 
-	dma_sync_sgtable_for_device(&sys->auxdev.dev, sgt, DMA_TO_DEVICE);
+	ipu6_dma_sync_sgtable(sys, sgt);
 
 out:
 	kfree(pages);
@@ -607,7 +615,10 @@ EXPORT_SYMBOL_NS_GPL(ipu6_buttress_map_fw_image, INTEL_IPU6);
 void ipu6_buttress_unmap_fw_image(struct ipu6_bus_device *sys,
 				  struct sg_table *sgt)
 {
-	dma_unmap_sgtable(&sys->auxdev.dev, sgt, DMA_TO_DEVICE, 0);
+	struct pci_dev *pdev = sys->isp->pdev;
+
+	ipu6_dma_unmap_sgtable(sys, sgt, DMA_TO_DEVICE, 0);
+	dma_unmap_sgtable(&pdev->dev, sgt, DMA_TO_DEVICE, 0);
 	sg_free_table(sgt);
 }
 EXPORT_SYMBOL_NS_GPL(ipu6_buttress_unmap_fw_image, INTEL_IPU6);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-cpd.c b/drivers/media/pci/intel/ipu6/ipu6-cpd.c
index 715b21ab4b8e..21c1c128a7ea 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-cpd.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-cpd.c
@@ -15,6 +15,7 @@
 #include "ipu6.h"
 #include "ipu6-bus.h"
 #include "ipu6-cpd.h"
+#include "ipu6-dma.h"
 
 /* 15 entries + header*/
 #define MAX_PKG_DIR_ENT_CNT		16
@@ -162,7 +163,6 @@ int ipu6_cpd_create_pkg_dir(struct ipu6_bus_device *adev, const void *src)
 {
 	dma_addr_t dma_addr_src = sg_dma_address(adev->fw_sgt.sgl);
 	const struct ipu6_cpd_ent *ent, *man_ent, *met_ent;
-	struct device *dev = &adev->auxdev.dev;
 	struct ipu6_device *isp = adev->isp;
 	unsigned int man_sz, met_sz;
 	void *pkg_dir_pos;
@@ -175,8 +175,8 @@ int ipu6_cpd_create_pkg_dir(struct ipu6_bus_device *adev, const void *src)
 	met_sz = met_ent->len;
 
 	adev->pkg_dir_size = PKG_DIR_SIZE + man_sz + met_sz;
-	adev->pkg_dir = dma_alloc_attrs(dev, adev->pkg_dir_size,
-					&adev->pkg_dir_dma_addr, GFP_KERNEL, 0);
+	adev->pkg_dir = ipu6_dma_alloc(adev, adev->pkg_dir_size,
+				       &adev->pkg_dir_dma_addr, GFP_KERNEL, 0);
 	if (!adev->pkg_dir)
 		return -ENOMEM;
 
@@ -198,8 +198,8 @@ int ipu6_cpd_create_pkg_dir(struct ipu6_bus_device *adev, const void *src)
 					 met_ent->len);
 	if (ret) {
 		dev_err(&isp->pdev->dev, "Failed to parse module data\n");
-		dma_free_attrs(dev, adev->pkg_dir_size,
-			       adev->pkg_dir, adev->pkg_dir_dma_addr, 0);
+		ipu6_dma_free(adev, adev->pkg_dir_size,
+			      adev->pkg_dir, adev->pkg_dir_dma_addr, 0);
 		return ret;
 	}
 
@@ -211,8 +211,8 @@ int ipu6_cpd_create_pkg_dir(struct ipu6_bus_device *adev, const void *src)
 	pkg_dir_pos += man_sz;
 	memcpy(pkg_dir_pos, src + met_ent->offset, met_sz);
 
-	dma_sync_single_range_for_device(dev, adev->pkg_dir_dma_addr,
-					 0, adev->pkg_dir_size, DMA_TO_DEVICE);
+	ipu6_dma_sync_single(adev, adev->pkg_dir_dma_addr,
+			     adev->pkg_dir_size);
 
 	return 0;
 }
@@ -220,8 +220,8 @@ EXPORT_SYMBOL_NS_GPL(ipu6_cpd_create_pkg_dir, INTEL_IPU6);
 
 void ipu6_cpd_free_pkg_dir(struct ipu6_bus_device *adev)
 {
-	dma_free_attrs(&adev->auxdev.dev, adev->pkg_dir_size, adev->pkg_dir,
-		       adev->pkg_dir_dma_addr, 0);
+	ipu6_dma_free(adev, adev->pkg_dir_size, adev->pkg_dir,
+		      adev->pkg_dir_dma_addr, 0);
 }
 EXPORT_SYMBOL_NS_GPL(ipu6_cpd_free_pkg_dir, INTEL_IPU6);
 
diff --git a/drivers/media/pci/intel/ipu6/ipu6-dma.c b/drivers/media/pci/intel/ipu6/ipu6-dma.c
index 92530a1cc90f..d03803e58881 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-dma.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-dma.c
@@ -39,8 +39,7 @@ static struct vm_info *get_vm_info(struct ipu6_mmu *mmu, dma_addr_t iova)
 	return NULL;
 }
 
-static void __dma_clear_buffer(struct page *page, size_t size,
-			       unsigned long attrs)
+static void __clear_buffer(struct page *page, size_t size, unsigned long attrs)
 {
 	void *ptr;
 
@@ -56,8 +55,7 @@ static void __dma_clear_buffer(struct page *page, size_t size,
 		clflush_cache_range(ptr, size);
 }
 
-static struct page **__dma_alloc_buffer(struct device *dev, size_t size,
-					gfp_t gfp, unsigned long attrs)
+static struct page **__alloc_buffer(size_t size, gfp_t gfp, unsigned long attrs)
 {
 	int count = PHYS_PFN(size);
 	int array_size = count * sizeof(struct page *);
@@ -86,7 +84,7 @@ static struct page **__dma_alloc_buffer(struct device *dev, size_t size,
 				pages[i + j] = pages[i] + j;
 		}
 
-		__dma_clear_buffer(pages[i], PAGE_SIZE << order, attrs);
+		__clear_buffer(pages[i], PAGE_SIZE << order, attrs);
 		i += 1 << order;
 		count -= 1 << order;
 	}
@@ -100,29 +98,26 @@ static struct page **__dma_alloc_buffer(struct device *dev, size_t size,
 	return NULL;
 }
 
-static void __dma_free_buffer(struct device *dev, struct page **pages,
-			      size_t size, unsigned long attrs)
+static void __free_buffer(struct page **pages, size_t size, unsigned long attrs)
 {
 	int count = PHYS_PFN(size);
 	unsigned int i;
 
 	for (i = 0; i < count && pages[i]; i++) {
-		__dma_clear_buffer(pages[i], PAGE_SIZE, attrs);
+		__clear_buffer(pages[i], PAGE_SIZE, attrs);
 		__free_pages(pages[i], 0);
 	}
 
 	kvfree(pages);
 }
 
-static void ipu6_dma_sync_single_for_cpu(struct device *dev,
-					 dma_addr_t dma_handle,
-					 size_t size,
-					 enum dma_data_direction dir)
+void ipu6_dma_sync_single(struct ipu6_bus_device *sys, dma_addr_t dma_handle,
+			  size_t size)
 {
 	void *vaddr;
 	u32 offset;
 	struct vm_info *info;
-	struct ipu6_mmu *mmu = to_ipu6_bus_device(dev)->mmu;
+	struct ipu6_mmu *mmu = sys->mmu;
 
 	info = get_vm_info(mmu, dma_handle);
 	if (WARN_ON(!info))
@@ -135,10 +130,10 @@ static void ipu6_dma_sync_single_for_cpu(struct device *dev,
 	vaddr = info->vaddr + offset;
 	clflush_cache_range(vaddr, size);
 }
+EXPORT_SYMBOL_NS_GPL(ipu6_dma_sync_single, INTEL_IPU6);
 
-static void ipu6_dma_sync_sg_for_cpu(struct device *dev,
-				     struct scatterlist *sglist,
-				     int nents, enum dma_data_direction dir)
+void ipu6_dma_sync_sg(struct ipu6_bus_device *sys, struct scatterlist *sglist,
+		      int nents)
 {
 	struct scatterlist *sg;
 	int i;
@@ -146,14 +141,22 @@ static void ipu6_dma_sync_sg_for_cpu(struct device *dev,
 	for_each_sg(sglist, sg, nents, i)
 		clflush_cache_range(page_to_virt(sg_page(sg)), sg->length);
 }
+EXPORT_SYMBOL_NS_GPL(ipu6_dma_sync_sg, INTEL_IPU6);
 
-static void *ipu6_dma_alloc(struct device *dev, size_t size,
-			    dma_addr_t *dma_handle, gfp_t gfp,
-			    unsigned long attrs)
+void ipu6_dma_sync_sgtable(struct ipu6_bus_device *sys, struct sg_table *sgt)
 {
-	struct ipu6_mmu *mmu = to_ipu6_bus_device(dev)->mmu;
-	struct pci_dev *pdev = to_ipu6_bus_device(dev)->isp->pdev;
+	ipu6_dma_sync_sg(sys, sgt->sgl, sgt->orig_nents);
+}
+EXPORT_SYMBOL_NS_GPL(ipu6_dma_sync_sgtable, INTEL_IPU6);
+
+void *ipu6_dma_alloc(struct ipu6_bus_device *sys, size_t size,
+		     dma_addr_t *dma_handle, gfp_t gfp,
+		     unsigned long attrs)
+{
+	struct device *dev = &sys->auxdev.dev;
+	struct pci_dev *pdev = sys->isp->pdev;
 	dma_addr_t pci_dma_addr, ipu6_iova;
+	struct ipu6_mmu *mmu = sys->mmu;
 	struct vm_info *info;
 	unsigned long count;
 	struct page **pages;
@@ -173,7 +176,7 @@ static void *ipu6_dma_alloc(struct device *dev, size_t size,
 	if (!iova)
 		goto out_kfree;
 
-	pages = __dma_alloc_buffer(dev, size, gfp, attrs);
+	pages = __alloc_buffer(size, gfp, attrs);
 	if (!pages)
 		goto out_free_iova;
 
@@ -227,7 +230,7 @@ static void *ipu6_dma_alloc(struct device *dev, size_t size,
 		ipu6_mmu_unmap(mmu->dmap->mmu_info, ipu6_iova, PAGE_SIZE);
 	}
 
-	__dma_free_buffer(dev, pages, size, attrs);
+	__free_buffer(pages, size, attrs);
 
 out_free_iova:
 	__free_iova(&mmu->dmap->iovad, iova);
@@ -236,13 +239,13 @@ static void *ipu6_dma_alloc(struct device *dev, size_t size,
 
 	return NULL;
 }
+EXPORT_SYMBOL_NS_GPL(ipu6_dma_alloc, INTEL_IPU6);
 
-static void ipu6_dma_free(struct device *dev, size_t size, void *vaddr,
-			  dma_addr_t dma_handle,
-			  unsigned long attrs)
+void ipu6_dma_free(struct ipu6_bus_device *sys, size_t size, void *vaddr,
+		   dma_addr_t dma_handle, unsigned long attrs)
 {
-	struct ipu6_mmu *mmu = to_ipu6_bus_device(dev)->mmu;
-	struct pci_dev *pdev = to_ipu6_bus_device(dev)->isp->pdev;
+	struct ipu6_mmu *mmu = sys->mmu;
+	struct pci_dev *pdev = sys->isp->pdev;
 	struct iova *iova = find_iova(&mmu->dmap->iovad, PHYS_PFN(dma_handle));
 	dma_addr_t pci_dma_addr, ipu6_iova;
 	struct vm_info *info;
@@ -281,7 +284,7 @@ static void ipu6_dma_free(struct device *dev, size_t size, void *vaddr,
 	ipu6_mmu_unmap(mmu->dmap->mmu_info, PFN_PHYS(iova->pfn_lo),
 		       PFN_PHYS(iova_size(iova)));
 
-	__dma_free_buffer(dev, pages, size, attrs);
+	__free_buffer(pages, size, attrs);
 
 	mmu->tlb_invalidate(mmu);
 
@@ -289,13 +292,14 @@ static void ipu6_dma_free(struct device *dev, size_t size, void *vaddr,
 
 	kfree(info);
 }
+EXPORT_SYMBOL_NS_GPL(ipu6_dma_free, INTEL_IPU6);
 
-static int ipu6_dma_mmap(struct device *dev, struct vm_area_struct *vma,
-			 void *addr, dma_addr_t iova, size_t size,
-			 unsigned long attrs)
+int ipu6_dma_mmap(struct ipu6_bus_device *sys, struct vm_area_struct *vma,
+		  void *addr, dma_addr_t iova, size_t size,
+		  unsigned long attrs)
 {
-	struct ipu6_mmu *mmu = to_ipu6_bus_device(dev)->mmu;
-	size_t count = PHYS_PFN(PAGE_ALIGN(size));
+	struct ipu6_mmu *mmu = sys->mmu;
+	size_t count = PFN_UP(size);
 	struct vm_info *info;
 	size_t i;
 	int ret;
@@ -323,18 +327,17 @@ static int ipu6_dma_mmap(struct device *dev, struct vm_area_struct *vma,
 	return 0;
 }
 
-static void ipu6_dma_unmap_sg(struct device *dev,
-			      struct scatterlist *sglist,
-			      int nents, enum dma_data_direction dir,
-			      unsigned long attrs)
+void ipu6_dma_unmap_sg(struct ipu6_bus_device *sys, struct scatterlist *sglist,
+		       int nents, enum dma_data_direction dir,
+		       unsigned long attrs)
 {
-	struct pci_dev *pdev = to_ipu6_bus_device(dev)->isp->pdev;
-	struct ipu6_mmu *mmu = to_ipu6_bus_device(dev)->mmu;
+	struct device *dev = &sys->auxdev.dev;
+	struct ipu6_mmu *mmu = sys->mmu;
 	struct iova *iova = find_iova(&mmu->dmap->iovad,
 				      PHYS_PFN(sg_dma_address(sglist)));
-	int i, npages, count;
 	struct scatterlist *sg;
 	dma_addr_t pci_dma_addr;
+	unsigned int i;
 
 	if (!nents)
 		return;
@@ -342,31 +345,15 @@ static void ipu6_dma_unmap_sg(struct device *dev,
 	if (WARN_ON(!iova))
 		return;
 
-	if ((attrs & DMA_ATTR_SKIP_CPU_SYNC) == 0)
-		ipu6_dma_sync_sg_for_cpu(dev, sglist, nents, DMA_BIDIRECTIONAL);
-
-	/* get the nents as orig_nents given by caller */
-	count = 0;
-	npages = iova_size(iova);
-	for_each_sg(sglist, sg, nents, i) {
-		if (sg_dma_len(sg) == 0 ||
-		    sg_dma_address(sg) == DMA_MAPPING_ERROR)
-			break;
-
-		npages -= PHYS_PFN(PAGE_ALIGN(sg_dma_len(sg)));
-		count++;
-		if (npages <= 0)
-			break;
-	}
-
 	/*
 	 * Before IPU6 mmu unmap, return the pci dma address back to sg
 	 * assume the nents is less than orig_nents as the least granule
 	 * is 1 SZ_4K page
 	 */
-	dev_dbg(dev, "trying to unmap concatenated %u ents\n", count);
-	for_each_sg(sglist, sg, count, i) {
-		dev_dbg(dev, "ipu unmap sg[%d] %pad\n", i, &sg_dma_address(sg));
+	dev_dbg(dev, "trying to unmap concatenated %u ents\n", nents);
+	for_each_sg(sglist, sg, nents, i) {
+		dev_dbg(dev, "unmap sg[%d] %pad size %u\n", i,
+			&sg_dma_address(sg), sg_dma_len(sg));
 		pci_dma_addr = ipu6_mmu_iova_to_phys(mmu->dmap->mmu_info,
 						     sg_dma_address(sg));
 		dev_dbg(dev, "return pci_dma_addr %pad back to sg[%d]\n",
@@ -380,23 +367,21 @@ static void ipu6_dma_unmap_sg(struct device *dev,
 		       PFN_PHYS(iova_size(iova)));
 
 	mmu->tlb_invalidate(mmu);
-
-	dma_unmap_sg_attrs(&pdev->dev, sglist, nents, dir, attrs);
-
 	__free_iova(&mmu->dmap->iovad, iova);
 }
+EXPORT_SYMBOL_NS_GPL(ipu6_dma_unmap_sg, INTEL_IPU6);
 
-static int ipu6_dma_map_sg(struct device *dev, struct scatterlist *sglist,
-			   int nents, enum dma_data_direction dir,
-			   unsigned long attrs)
+int ipu6_dma_map_sg(struct ipu6_bus_device *sys, struct scatterlist *sglist,
+		    int nents, enum dma_data_direction dir,
+		    unsigned long attrs)
 {
-	struct ipu6_mmu *mmu = to_ipu6_bus_device(dev)->mmu;
-	struct pci_dev *pdev = to_ipu6_bus_device(dev)->isp->pdev;
+	struct device *dev = &sys->auxdev.dev;
+	struct ipu6_mmu *mmu = sys->mmu;
 	struct scatterlist *sg;
 	struct iova *iova;
 	size_t npages = 0;
 	unsigned long iova_addr;
-	int i, count;
+	int i;
 
 	for_each_sg(sglist, sg, nents, i) {
 		if (sg->offset) {
@@ -406,18 +391,12 @@ static int ipu6_dma_map_sg(struct device *dev, struct scatterlist *sglist,
 		}
 	}
 
-	dev_dbg(dev, "pci_dma_map_sg trying to map %d ents\n", nents);
-	count  = dma_map_sg_attrs(&pdev->dev, sglist, nents, dir, attrs);
-	if (count <= 0) {
-		dev_err(dev, "pci_dma_map_sg %d ents failed\n", nents);
-		return 0;
-	}
-
-	dev_dbg(dev, "pci_dma_map_sg %d ents mapped\n", count);
-
-	for_each_sg(sglist, sg, count, i)
+	for_each_sg(sglist, sg, nents, i)
 		npages += PHYS_PFN(PAGE_ALIGN(sg_dma_len(sg)));
 
+	dev_dbg(dev, "dmamap trying to map %d ents %zu pages\n",
+		nents, npages);
+
 	iova = alloc_iova(&mmu->dmap->iovad, npages,
 			  PHYS_PFN(dma_get_mask(dev)), 0);
 	if (!iova)
@@ -427,7 +406,7 @@ static int ipu6_dma_map_sg(struct device *dev, struct scatterlist *sglist,
 		iova->pfn_hi);
 
 	iova_addr = iova->pfn_lo;
-	for_each_sg(sglist, sg, count, i) {
+	for_each_sg(sglist, sg, nents, i) {
 		int ret;
 
 		dev_dbg(dev, "mapping entry %d: iova 0x%llx phy %pad size %d\n",
@@ -445,25 +424,48 @@ static int ipu6_dma_map_sg(struct device *dev, struct scatterlist *sglist,
 		iova_addr += PHYS_PFN(PAGE_ALIGN(sg_dma_len(sg)));
 	}
 
-	if ((attrs & DMA_ATTR_SKIP_CPU_SYNC) == 0)
-		ipu6_dma_sync_sg_for_cpu(dev, sglist, nents, DMA_BIDIRECTIONAL);
+	dev_dbg(dev, "dmamap %d ents %zu pages mapped\n", nents, npages);
 
-	return count;
+	return nents;
 
 out_fail:
-	ipu6_dma_unmap_sg(dev, sglist, i, dir, attrs);
+	ipu6_dma_unmap_sg(sys, sglist, i, dir, attrs);
 
 	return 0;
 }
+EXPORT_SYMBOL_NS_GPL(ipu6_dma_map_sg, INTEL_IPU6);
+
+int ipu6_dma_map_sgtable(struct ipu6_bus_device *sys, struct sg_table *sgt,
+			 enum dma_data_direction dir, unsigned long attrs)
+{
+	int nents;
+
+	nents = ipu6_dma_map_sg(sys, sgt->sgl, sgt->nents, dir, attrs);
+	if (nents < 0)
+		return nents;
+
+	sgt->nents = nents;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(ipu6_dma_map_sgtable, INTEL_IPU6);
+
+void ipu6_dma_unmap_sgtable(struct ipu6_bus_device *sys, struct sg_table *sgt,
+			    enum dma_data_direction dir, unsigned long attrs)
+{
+	ipu6_dma_unmap_sg(sys, sgt->sgl, sgt->nents, dir, attrs);
+}
+EXPORT_SYMBOL_NS_GPL(ipu6_dma_unmap_sgtable, INTEL_IPU6);
 
 /*
  * Create scatter-list for the already allocated DMA buffer
  */
-static int ipu6_dma_get_sgtable(struct device *dev, struct sg_table *sgt,
-				void *cpu_addr, dma_addr_t handle, size_t size,
-				unsigned long attrs)
+int ipu6_dma_get_sgtable(struct ipu6_bus_device *sys, struct sg_table *sgt,
+			 void *cpu_addr, dma_addr_t handle, size_t size,
+			 unsigned long attrs)
 {
-	struct ipu6_mmu *mmu = to_ipu6_bus_device(dev)->mmu;
+	struct device *dev = &sys->auxdev.dev;
+	struct ipu6_mmu *mmu = sys->mmu;
 	struct vm_info *info;
 	int n_pages;
 	int ret = 0;
@@ -483,20 +485,7 @@ static int ipu6_dma_get_sgtable(struct device *dev, struct sg_table *sgt,
 	ret = sg_alloc_table_from_pages(sgt, info->pages, n_pages, 0, size,
 					GFP_KERNEL);
 	if (ret)
-		dev_warn(dev, "IPU6 get sgt table failed\n");
+		dev_warn(dev, "get sgt table failed\n");
 
 	return ret;
 }
-
-const struct dma_map_ops ipu6_dma_ops = {
-	.alloc = ipu6_dma_alloc,
-	.free = ipu6_dma_free,
-	.mmap = ipu6_dma_mmap,
-	.map_sg = ipu6_dma_map_sg,
-	.unmap_sg = ipu6_dma_unmap_sg,
-	.sync_single_for_cpu = ipu6_dma_sync_single_for_cpu,
-	.sync_single_for_device = ipu6_dma_sync_single_for_cpu,
-	.sync_sg_for_cpu = ipu6_dma_sync_sg_for_cpu,
-	.sync_sg_for_device = ipu6_dma_sync_sg_for_cpu,
-	.get_sgtable = ipu6_dma_get_sgtable,
-};
diff --git a/drivers/media/pci/intel/ipu6/ipu6-dma.h b/drivers/media/pci/intel/ipu6/ipu6-dma.h
index 847ea5b7c925..b51244add9e6 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-dma.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-dma.h
@@ -5,7 +5,13 @@
 #define IPU6_DMA_H
 
 #include <linux/dma-map-ops.h>
+#include <linux/dma-mapping.h>
 #include <linux/iova.h>
+#include <linux/iova.h>
+#include <linux/scatterlist.h>
+#include <linux/types.h>
+
+#include "ipu6-bus.h"
 
 struct ipu6_mmu_info;
 
@@ -14,6 +20,30 @@ struct ipu6_dma_mapping {
 	struct iova_domain iovad;
 };
 
-extern const struct dma_map_ops ipu6_dma_ops;
-
+void ipu6_dma_sync_single(struct ipu6_bus_device *sys, dma_addr_t dma_handle,
+			  size_t size);
+void ipu6_dma_sync_sg(struct ipu6_bus_device *sys, struct scatterlist *sglist,
+		      int nents);
+void ipu6_dma_sync_sgtable(struct ipu6_bus_device *sys, struct sg_table *sgt);
+void *ipu6_dma_alloc(struct ipu6_bus_device *sys, size_t size,
+		     dma_addr_t *dma_handle, gfp_t gfp,
+		     unsigned long attrs);
+void ipu6_dma_free(struct ipu6_bus_device *sys, size_t size, void *vaddr,
+		   dma_addr_t dma_handle, unsigned long attrs);
+int ipu6_dma_mmap(struct ipu6_bus_device *sys, struct vm_area_struct *vma,
+		  void *addr, dma_addr_t iova, size_t size,
+		  unsigned long attrs);
+int ipu6_dma_map_sg(struct ipu6_bus_device *sys, struct scatterlist *sglist,
+		    int nents, enum dma_data_direction dir,
+		    unsigned long attrs);
+void ipu6_dma_unmap_sg(struct ipu6_bus_device *sys, struct scatterlist *sglist,
+		       int nents, enum dma_data_direction dir,
+		       unsigned long attrs);
+int ipu6_dma_map_sgtable(struct ipu6_bus_device *sys, struct sg_table *sgt,
+			 enum dma_data_direction dir, unsigned long attrs);
+void ipu6_dma_unmap_sgtable(struct ipu6_bus_device *sys, struct sg_table *sgt,
+			    enum dma_data_direction dir, unsigned long attrs);
+int ipu6_dma_get_sgtable(struct ipu6_bus_device *sys, struct sg_table *sgt,
+			 void *cpu_addr, dma_addr_t handle, size_t size,
+			 unsigned long attrs);
 #endif /* IPU6_DMA_H */
diff --git a/drivers/media/pci/intel/ipu6/ipu6-fw-com.c b/drivers/media/pci/intel/ipu6/ipu6-fw-com.c
index 0b33fe9e703d..7d3d9314cb30 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-fw-com.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-fw-com.c
@@ -12,6 +12,7 @@
 #include <linux/types.h>
 
 #include "ipu6-bus.h"
+#include "ipu6-dma.h"
 #include "ipu6-fw-com.h"
 
 /*
@@ -88,7 +89,6 @@ struct ipu6_fw_com_context {
 	void *dma_buffer;
 	dma_addr_t dma_addr;
 	unsigned int dma_size;
-	unsigned long attrs;
 
 	struct ipu6_fw_sys_queue *input_queue;	/* array of host to SP queues */
 	struct ipu6_fw_sys_queue *output_queue;	/* array of SP to host */
@@ -164,7 +164,6 @@ void *ipu6_fw_com_prepare(struct ipu6_fw_com_cfg *cfg,
 	struct ipu6_fw_com_context *ctx;
 	struct device *dev = &adev->auxdev.dev;
 	size_t sizeall, offset;
-	unsigned long attrs = 0;
 	void *specific_host_addr;
 	unsigned int i;
 
@@ -206,9 +205,8 @@ void *ipu6_fw_com_prepare(struct ipu6_fw_com_cfg *cfg,
 
 	sizeall += sizeinput + sizeoutput;
 
-	ctx->dma_buffer = dma_alloc_attrs(dev, sizeall, &ctx->dma_addr,
-					  GFP_KERNEL, attrs);
-	ctx->attrs = attrs;
+	ctx->dma_buffer = ipu6_dma_alloc(adev, sizeall, &ctx->dma_addr,
+					 GFP_KERNEL, 0);
 	if (!ctx->dma_buffer) {
 		dev_err(dev, "failed to allocate dma memory\n");
 		kfree(ctx);
@@ -239,6 +237,8 @@ void *ipu6_fw_com_prepare(struct ipu6_fw_com_cfg *cfg,
 		memcpy(specific_host_addr, cfg->specific_addr,
 		       cfg->specific_size);
 
+	ipu6_dma_sync_single(adev, ctx->config_vied_addr, sizeall);
+
 	/* initialize input queues */
 	offset += specific_size;
 	res.reg = SYSCOM_QPR_BASE_REG;
@@ -315,8 +315,8 @@ int ipu6_fw_com_release(struct ipu6_fw_com_context *ctx, unsigned int force)
 	if (!force && !ctx->cell_ready(ctx->adev))
 		return -EBUSY;
 
-	dma_free_attrs(&ctx->adev->auxdev.dev, ctx->dma_size,
-		       ctx->dma_buffer, ctx->dma_addr, ctx->attrs);
+	ipu6_dma_free(ctx->adev, ctx->dma_size,
+		      ctx->dma_buffer, ctx->dma_addr, 0);
 	kfree(ctx);
 	return 0;
 }
-- 
2.34.1


