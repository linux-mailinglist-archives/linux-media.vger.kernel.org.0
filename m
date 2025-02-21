Return-Path: <linux-media+bounces-26542-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDF2A3EDA6
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 08:53:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6BD3D188B0E2
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 07:53:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEE1F1FF608;
	Fri, 21 Feb 2025 07:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MjFh7G3y"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153FE1FF7AE
	for <linux-media@vger.kernel.org>; Fri, 21 Feb 2025 07:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740124391; cv=none; b=YOZQGg9p0vpocQJSLH1+pHFGgbQgmsGCVKMLRpm+cOyZqagZ5xMs4jKjQoNVue/L4/oqBPXG1Y3XzHKGmIzUeM2Dajq2IrI5LW9rnfHGzlrrauP+jSO0fCvPB66iUlF4TICz0OTix2arBu6OabqR/wTgG19RmRYzPkVTazUZcuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740124391; c=relaxed/simple;
	bh=1A+99TIELU5w7GOXvzg2SyM0wDPG9Qi+ff332pFP//Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CxJ9yZMeGTbNOMmIGmmXvWoWoI93uHOx4WZEc52rSf168HYY2sM0JovTcGO2/SxZKQleTWHoM8ugRc89O/gI8++zCIQcpAv3f0miw5qI1bshcJSZDLWaTUUPKzKi2eDbPY6EqITwuj+tViCCZmni/Rwc5hcjw1scLI9519OfvHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MjFh7G3y; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740124388; x=1771660388;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1A+99TIELU5w7GOXvzg2SyM0wDPG9Qi+ff332pFP//Y=;
  b=MjFh7G3yTKNQX0+LvL8su5BlrexxrCll9q/9AxzvOTa5eFKr/RNROMx7
   axWMl9pCkgZ829BwEN3GHB/gqc9GKJqsEPtmGVHXjNIu/emmT1PY/VR45
   B65RUn1CA+I+mc/nYG/Lzu7onQZ55nkgxOMh5bzA9fx+euW5imfqdjVkB
   aFryUebvCpPCUk1rq9JXPI7qy/TtISULeBtvrXXzQ/59gfjw4Mc5tdK7e
   IcjRA70bI8xEfFTpabutWZq+SOwT0r11ukYpuvhMQuTeZI6xXxa/YRsfJ
   qxui4ix7ZCJLrFfZBOo1Os2+ySde+sPvE2iCR87EfsNkm74wIMIZLy952
   w==;
X-CSE-ConnectionGUID: quVU57hAQaiEaVJF/YdMzQ==
X-CSE-MsgGUID: xdjJ1azzRPuGLKXft5/EEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="51552530"
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; 
   d="scan'208";a="51552530"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 23:53:06 -0800
X-CSE-ConnectionGUID: sLWHokmwQeSYtIIp8qWzow==
X-CSE-MsgGUID: Rgrwg+BQSzS0IvE70avlgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; 
   d="scan'208";a="115829633"
Received: from vtg-chrome.bj.intel.com ([172.16.127.120])
  by fmviesa010.fm.intel.com with ESMTP; 20 Feb 2025 23:53:03 -0800
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	hdegoede@redhat.com
Cc: hans@hansg.org,
	stanislaw.gruszka@linux.intel.com,
	jerry.w.hu@intel.com,
	tian.shu.qiu@intel.com,
	daxing.li@intel.com,
	hao.yao@intel.com,
	bingbu.cao@linux.intel.com,
	bingbu.cao@intel.com
Subject: [RFC PATCH 3/7] media: ipu7: add IPU7 DMA APIs and MMU mapping
Date: Fri, 21 Feb 2025 15:52:48 +0800
Message-Id: <20250221075252.3347582-4-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250221075252.3347582-1-bingbu.cao@intel.com>
References: <20250221075252.3347582-1-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bingbu Cao <bingbu.cao@intel.com>

The Intel IPU7 has internal microproccessor which runs the firmware
The microprocessor access system DRAM by its internal 32-bit virtual
address space. Driver should setup the MMU table and expose the DMA
APIs for memory buffer mapping.

This patch adds the IPU MMU and a DMA mapping implementation to setup
the internal MMU hardware.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/pci/intel/ipu7/ipu7-dma.c | 509 ++++++++++++++
 drivers/media/pci/intel/ipu7/ipu7-dma.h |  50 ++
 drivers/media/pci/intel/ipu7/ipu7-mmu.c | 853 ++++++++++++++++++++++++
 drivers/media/pci/intel/ipu7/ipu7-mmu.h | 414 ++++++++++++
 4 files changed, 1826 insertions(+)
 create mode 100644 drivers/media/pci/intel/ipu7/ipu7-dma.c
 create mode 100644 drivers/media/pci/intel/ipu7/ipu7-dma.h
 create mode 100644 drivers/media/pci/intel/ipu7/ipu7-mmu.c
 create mode 100644 drivers/media/pci/intel/ipu7/ipu7-mmu.h

diff --git a/drivers/media/pci/intel/ipu7/ipu7-dma.c b/drivers/media/pci/intel/ipu7/ipu7-dma.c
new file mode 100644
index 000000000000..59d93ed6d1ae
--- /dev/null
+++ b/drivers/media/pci/intel/ipu7/ipu7-dma.c
@@ -0,0 +1,509 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2013 - 2024 Intel Corporation
+ */
+
+#include <linux/cacheflush.h>
+#include <linux/dma-mapping.h>
+#include <linux/iova.h>
+#include <linux/list.h>
+#include <linux/mm.h>
+#include <linux/vmalloc.h>
+#include <linux/scatterlist.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+
+#include "ipu7.h"
+#include "ipu7-bus.h"
+#include "ipu7-dma.h"
+#include "ipu7-mmu.h"
+
+struct vm_info {
+	struct list_head list;
+	struct page **pages;
+	dma_addr_t ipu7_iova;
+	void *vaddr;
+	unsigned long size;
+};
+
+static struct vm_info *get_vm_info(struct ipu7_mmu *mmu, dma_addr_t iova)
+{
+	struct vm_info *info, *save;
+
+	list_for_each_entry_safe(info, save, &mmu->vma_list, list) {
+		if (iova >= info->ipu7_iova &&
+		    iova < (info->ipu7_iova + info->size))
+			return info;
+	}
+
+	return NULL;
+}
+
+static void __clear_buffer(struct page *page, size_t size, unsigned long attrs)
+{
+	void *ptr;
+
+	if (!page)
+		return;
+	/*
+	 * Ensure that the allocated pages are zeroed, and that any data
+	 * lurking in the kernel direct-mapped region is invalidated.
+	 */
+	ptr = page_address(page);
+	memset(ptr, 0, size);
+	if ((attrs & DMA_ATTR_SKIP_CPU_SYNC) == 0)
+		clflush_cache_range(ptr, size);
+}
+
+static struct page **__alloc_buffer(size_t size, gfp_t gfp, unsigned long attrs)
+{
+	unsigned int count = PHYS_PFN(size);
+	unsigned int array_size = count * sizeof(struct page *);
+	struct page **pages;
+	int i = 0;
+
+	pages = kvzalloc(array_size, GFP_KERNEL);
+	if (!pages)
+		return NULL;
+
+	gfp |= __GFP_NOWARN;
+
+	while (count) {
+		int j, order = __fls(count);
+
+		pages[i] = alloc_pages(gfp, order);
+		while (!pages[i] && order)
+			pages[i] = alloc_pages(gfp, --order);
+		if (!pages[i])
+			goto error;
+
+		if (order) {
+			split_page(pages[i], order);
+			j = 1 << order;
+			while (j--)
+				pages[i + j] = pages[i] + j;
+		}
+
+		__clear_buffer(pages[i], PAGE_SIZE << order, attrs);
+		i += 1 << order;
+		count -= 1 << order;
+	}
+
+	return pages;
+error:
+	while (i--)
+		if (pages[i])
+			__free_pages(pages[i], 0);
+	kvfree(pages);
+	return NULL;
+}
+
+static void __free_buffer(struct page **pages, size_t size, unsigned long attrs)
+{
+	unsigned int count = PHYS_PFN(size);
+	unsigned int i;
+
+	for (i = 0; i < count && pages[i]; i++) {
+		__clear_buffer(pages[i], PAGE_SIZE, attrs);
+		__free_pages(pages[i], 0);
+	}
+
+	kvfree(pages);
+}
+
+void ipu7_dma_sync_single(struct ipu7_bus_device *sys, dma_addr_t dma_handle,
+			  size_t size)
+{
+	void *vaddr;
+	u32 offset;
+	struct vm_info *info;
+	struct ipu7_mmu *mmu = sys->mmu;
+
+	info = get_vm_info(mmu, dma_handle);
+	if (WARN_ON(!info))
+		return;
+
+	offset = dma_handle - info->ipu7_iova;
+	if (WARN_ON(size > (info->size - offset)))
+		return;
+
+	vaddr = info->vaddr + offset;
+	clflush_cache_range(vaddr, size);
+}
+EXPORT_SYMBOL_NS_GPL(ipu7_dma_sync_single, "INTEL_IPU7");
+
+void ipu7_dma_sync_sg(struct ipu7_bus_device *sys, struct scatterlist *sglist,
+		      unsigned int nents)
+{
+	struct scatterlist *sg;
+	int i;
+
+	for_each_sg(sglist, sg, nents, i)
+		clflush_cache_range(sg_virt(sg), sg->length);
+}
+EXPORT_SYMBOL_NS_GPL(ipu7_dma_sync_sg, "INTEL_IPU7");
+
+void ipu7_dma_sync_sgtable(struct ipu7_bus_device *sys, struct sg_table *sgt)
+{
+	ipu7_dma_sync_sg(sys, sgt->sgl, sgt->orig_nents);
+}
+EXPORT_SYMBOL_NS_GPL(ipu7_dma_sync_sgtable, "INTEL_IPU7");
+
+void *ipu7_dma_alloc(struct ipu7_bus_device *sys, size_t size,
+		     dma_addr_t *dma_handle, gfp_t gfp,
+		     unsigned long attrs)
+{
+	struct device *dev = &sys->auxdev.dev;
+	struct pci_dev *pdev = sys->isp->pdev;
+	dma_addr_t pci_dma_addr, ipu7_iova;
+	struct ipu7_mmu *mmu = sys->mmu;
+	struct vm_info *info;
+	unsigned long count;
+	struct page **pages;
+	struct iova *iova;
+	unsigned int i;
+	int ret;
+
+	info = kzalloc(sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return NULL;
+
+	size = PAGE_ALIGN(size);
+	count = PHYS_PFN(size);
+
+	iova = alloc_iova(&mmu->dmap->iovad, count,
+			  PHYS_PFN(dma_get_mask(dev)), 0);
+	if (!iova)
+		goto out_kfree;
+
+	pages = __alloc_buffer(size, gfp, attrs);
+	if (!pages)
+		goto out_free_iova;
+
+	dev_dbg(dev, "dma_alloc: size %zu iova low pfn %lu, high pfn %lu\n",
+		size, iova->pfn_lo, iova->pfn_hi);
+	for (i = 0; iova->pfn_lo + i <= iova->pfn_hi; i++) {
+		pci_dma_addr = dma_map_page_attrs(&pdev->dev, pages[i], 0,
+						  PAGE_SIZE, DMA_BIDIRECTIONAL,
+						  attrs);
+		dev_dbg(dev, "dma_alloc: mapped pci_dma_addr %pad\n",
+			&pci_dma_addr);
+		if (dma_mapping_error(&pdev->dev, pci_dma_addr)) {
+			dev_err(dev, "pci_dma_mapping for page[%d] failed", i);
+			goto out_unmap;
+		}
+
+		ret = ipu7_mmu_map(mmu->dmap->mmu_info,
+				   PFN_PHYS(iova->pfn_lo + i), pci_dma_addr,
+				   PAGE_SIZE);
+		if (ret) {
+			dev_err(dev, "ipu7_mmu_map for pci_dma[%d] %pad failed",
+				i, &pci_dma_addr);
+			dma_unmap_page_attrs(&pdev->dev, pci_dma_addr,
+					     PAGE_SIZE, DMA_BIDIRECTIONAL,
+					     attrs);
+			goto out_unmap;
+		}
+	}
+
+	info->vaddr = vmap(pages, count, VM_USERMAP, PAGE_KERNEL);
+	if (!info->vaddr)
+		goto out_unmap;
+
+	*dma_handle = PFN_PHYS(iova->pfn_lo);
+
+	info->pages = pages;
+	info->ipu7_iova = *dma_handle;
+	info->size = size;
+	list_add(&info->list, &mmu->vma_list);
+
+	return info->vaddr;
+
+out_unmap:
+	while (i--) {
+		ipu7_iova = PFN_PHYS(iova->pfn_lo + i);
+		pci_dma_addr = ipu7_mmu_iova_to_phys(mmu->dmap->mmu_info,
+						     ipu7_iova);
+		dma_unmap_page_attrs(&pdev->dev, pci_dma_addr, PAGE_SIZE,
+				     DMA_BIDIRECTIONAL, attrs);
+
+		ipu7_mmu_unmap(mmu->dmap->mmu_info, ipu7_iova, PAGE_SIZE);
+	}
+
+	__free_buffer(pages, size, attrs);
+
+out_free_iova:
+	__free_iova(&mmu->dmap->iovad, iova);
+out_kfree:
+	kfree(info);
+
+	return NULL;
+}
+EXPORT_SYMBOL_NS_GPL(ipu7_dma_alloc, "INTEL_IPU7");
+
+void ipu7_dma_free(struct ipu7_bus_device *sys, size_t size, void *vaddr,
+		   dma_addr_t dma_handle, unsigned long attrs)
+{
+	struct ipu7_mmu *mmu = sys->mmu;
+	struct pci_dev *pdev = sys->isp->pdev;
+	struct iova *iova = find_iova(&mmu->dmap->iovad, PHYS_PFN(dma_handle));
+	dma_addr_t pci_dma_addr, ipu7_iova;
+	struct vm_info *info;
+	struct page **pages;
+	unsigned int i;
+
+	if (WARN_ON(!iova))
+		return;
+
+	info = get_vm_info(mmu, dma_handle);
+	if (WARN_ON(!info))
+		return;
+
+	if (WARN_ON(!info->vaddr))
+		return;
+
+	if (WARN_ON(!info->pages))
+		return;
+
+	list_del(&info->list);
+
+	size = PAGE_ALIGN(size);
+
+	pages = info->pages;
+
+	vunmap(vaddr);
+
+	for (i = 0; i < PHYS_PFN(size); i++) {
+		ipu7_iova = PFN_PHYS(iova->pfn_lo + i);
+		pci_dma_addr = ipu7_mmu_iova_to_phys(mmu->dmap->mmu_info,
+						     ipu7_iova);
+		dma_unmap_page_attrs(&pdev->dev, pci_dma_addr, PAGE_SIZE,
+				     DMA_BIDIRECTIONAL, attrs);
+	}
+
+	ipu7_mmu_unmap(mmu->dmap->mmu_info, PFN_PHYS(iova->pfn_lo),
+		       PFN_PHYS(iova_size(iova)));
+
+	__free_buffer(pages, size, attrs);
+
+	mmu->tlb_invalidate(mmu);
+
+	__free_iova(&mmu->dmap->iovad, iova);
+
+	kfree(info);
+}
+EXPORT_SYMBOL_NS_GPL(ipu7_dma_free, "INTEL_IPU7");
+
+int ipu7_dma_mmap(struct ipu7_bus_device *sys, struct vm_area_struct *vma,
+		  void *addr, dma_addr_t iova, size_t size,
+		  unsigned long attrs)
+{
+	struct ipu7_mmu *mmu = sys->mmu;
+	size_t count = PFN_UP(size);
+	struct vm_info *info;
+	size_t i;
+	int ret;
+
+	info = get_vm_info(mmu, iova);
+	if (!info)
+		return -EFAULT;
+
+	if (!info->vaddr)
+		return -EFAULT;
+
+	if (vma->vm_start & ~PAGE_MASK)
+		return -EINVAL;
+
+	if (size > info->size)
+		return -EFAULT;
+
+	for (i = 0; i < count; i++) {
+		ret = vm_insert_page(vma, vma->vm_start + PFN_PHYS(i),
+				     info->pages[i]);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+void ipu7_dma_unmap_sg(struct ipu7_bus_device *sys, struct scatterlist *sglist,
+		       int nents, enum dma_data_direction dir,
+		       unsigned long attrs)
+{
+	struct device *dev = &sys->auxdev.dev;
+	struct ipu7_mmu *mmu = sys->mmu;
+	struct iova *iova = find_iova(&mmu->dmap->iovad,
+				      PHYS_PFN(sg_dma_address(sglist)));
+	struct scatterlist *sg;
+	dma_addr_t pci_dma_addr;
+	unsigned int i;
+
+	if (!nents)
+		return;
+
+	if (WARN_ON(!iova))
+		return;
+
+	/*
+	 * Before IPU7 mmu unmap, return the pci dma address back to sg
+	 * assume the nents is less than orig_nents as the least granule
+	 * is 1 SZ_4K page
+	 */
+	dev_dbg(dev, "trying to unmap concatenated %u ents\n", nents);
+	for_each_sg(sglist, sg, nents, i) {
+		dev_dbg(dev, "unmap sg[%d] %pad size %u\n", i,
+			&sg_dma_address(sg), sg_dma_len(sg));
+		pci_dma_addr = ipu7_mmu_iova_to_phys(mmu->dmap->mmu_info,
+						     sg_dma_address(sg));
+		dev_dbg(dev, "return pci_dma_addr %pad back to sg[%d]\n",
+			&pci_dma_addr, i);
+		sg_dma_address(sg) = pci_dma_addr;
+	}
+
+	dev_dbg(dev, "ipu7_mmu_unmap low pfn %lu high pfn %lu\n",
+		iova->pfn_lo, iova->pfn_hi);
+	ipu7_mmu_unmap(mmu->dmap->mmu_info, PFN_PHYS(iova->pfn_lo),
+		       PFN_PHYS(iova_size(iova)));
+
+	mmu->tlb_invalidate(mmu);
+	__free_iova(&mmu->dmap->iovad, iova);
+}
+EXPORT_SYMBOL_NS_GPL(ipu7_dma_unmap_sg, "INTEL_IPU7");
+
+int ipu7_dma_map_sg(struct ipu7_bus_device *sys, struct scatterlist *sglist,
+		    int nents, enum dma_data_direction dir,
+		    unsigned long attrs)
+{
+	struct device *dev = &sys->auxdev.dev;
+	struct ipu7_mmu *mmu = sys->mmu;
+	struct scatterlist *sg;
+	struct iova *iova;
+	size_t npages = 0;
+	unsigned long iova_addr;
+	int i;
+
+	for_each_sg(sglist, sg, nents, i) {
+		if (sg->offset) {
+			dev_err(dev, "Unsupported non-zero sg[%d].offset %x\n",
+				i, sg->offset);
+			return -EFAULT;
+		}
+	}
+
+	for_each_sg(sglist, sg, nents, i)
+		npages += PFN_UP(sg_dma_len(sg));
+
+	dev_dbg(dev, "dmamap trying to map %d ents %zu pages\n",
+		nents, npages);
+
+	if (attrs & DMA_ATTR_RESERVE_REGION) {
+		/*
+		 * Reserve iova with size aligned to IPU_FW_CODE_REGION_SIZE.
+		 * Only apply for non-secure mode.
+		 */
+		unsigned long lo, hi;
+
+		lo = iova_pfn(&mmu->dmap->iovad, IPU_FW_CODE_REGION_START);
+		hi = iova_pfn(&mmu->dmap->iovad, IPU_FW_CODE_REGION_END) - 1;
+		iova = reserve_iova(&mmu->dmap->iovad, lo, hi);
+		if (!iova) {
+			dev_err(dev, "Reserve iova[%lx:%lx] failed.\n", lo, hi);
+			return -ENOMEM;
+		}
+		dev_dbg(dev, "iova[%lx:%lx] reserved for FW code.\n", lo, hi);
+	} else {
+		iova = alloc_iova(&mmu->dmap->iovad, npages,
+				  PHYS_PFN(dma_get_mask(dev)), 0);
+		if (!iova)
+			return 0;
+	}
+
+	dev_dbg(dev, "dmamap: iova low pfn %lu, high pfn %lu\n", iova->pfn_lo,
+		iova->pfn_hi);
+
+	iova_addr = iova->pfn_lo;
+	for_each_sg(sglist, sg, nents, i) {
+		phys_addr_t iova_pa;
+		int ret;
+
+		iova_pa = PFN_PHYS(iova_addr);
+		dev_dbg(dev, "mapping entry %d: iova %pap phy %pap size %d\n",
+			i, &iova_pa, &sg_dma_address(sg), sg_dma_len(sg));
+
+		ret = ipu7_mmu_map(mmu->dmap->mmu_info, PFN_PHYS(iova_addr),
+				   sg_dma_address(sg),
+				   PAGE_ALIGN(sg_dma_len(sg)));
+		if (ret)
+			goto out_fail;
+
+		sg_dma_address(sg) = PFN_PHYS(iova_addr);
+
+		iova_addr += PFN_UP(sg_dma_len(sg));
+	}
+
+	dev_dbg(dev, "dmamap %d ents %zu pages mapped\n", nents, npages);
+
+	return nents;
+
+out_fail:
+	ipu7_dma_unmap_sg(sys, sglist, i, dir, attrs);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(ipu7_dma_map_sg, "INTEL_IPU7");
+
+int ipu7_dma_map_sgtable(struct ipu7_bus_device *sys, struct sg_table *sgt,
+			 enum dma_data_direction dir, unsigned long attrs)
+{
+	int nents;
+
+	nents = ipu7_dma_map_sg(sys, sgt->sgl, sgt->nents, dir, attrs);
+	if (nents < 0)
+		return nents;
+
+	sgt->nents = nents;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(ipu7_dma_map_sgtable, "INTEL_IPU7");
+
+void ipu7_dma_unmap_sgtable(struct ipu7_bus_device *sys, struct sg_table *sgt,
+			    enum dma_data_direction dir, unsigned long attrs)
+{
+	ipu7_dma_unmap_sg(sys, sgt->sgl, sgt->nents, dir, attrs);
+}
+EXPORT_SYMBOL_NS_GPL(ipu7_dma_unmap_sgtable, "INTEL_IPU7");
+
+/*
+ * Create scatter-list for the already allocated DMA buffer
+ */
+int ipu7_dma_get_sgtable(struct ipu7_bus_device *sys, struct sg_table *sgt,
+			 void *cpu_addr, dma_addr_t handle, size_t size,
+			 unsigned long attrs)
+{
+	struct device *dev = &sys->auxdev.dev;
+	struct ipu7_mmu *mmu = sys->mmu;
+	struct vm_info *info;
+	int n_pages;
+	int ret = 0;
+
+	info = get_vm_info(mmu, handle);
+	if (!info)
+		return -EFAULT;
+
+	if (!info->vaddr)
+		return -EFAULT;
+
+	if (WARN_ON(!info->pages))
+		return -ENOMEM;
+
+	n_pages = PFN_UP(size);
+
+	ret = sg_alloc_table_from_pages(sgt, info->pages, n_pages, 0, size,
+					GFP_KERNEL);
+	if (ret)
+		dev_warn(dev, "get sgt table failed\n");
+
+	return ret;
+}
diff --git a/drivers/media/pci/intel/ipu7/ipu7-dma.h b/drivers/media/pci/intel/ipu7/ipu7-dma.h
new file mode 100644
index 000000000000..069a09d68140
--- /dev/null
+++ b/drivers/media/pci/intel/ipu7/ipu7-dma.h
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (C) 2013--2024 Intel Corporation */
+
+#ifndef IPU7_DMA_H
+#define IPU7_DMA_H
+
+#include <linux/dma-map-ops.h>
+#include <linux/dma-mapping.h>
+#include <linux/iova.h>
+#include <linux/iova.h>
+#include <linux/scatterlist.h>
+#include <linux/types.h>
+
+#include "ipu7-bus.h"
+
+#define DMA_ATTR_RESERVE_REGION		BIT(31)
+struct ipu7_mmu_info;
+
+struct ipu7_dma_mapping {
+	struct ipu7_mmu_info *mmu_info;
+	struct iova_domain iovad;
+};
+
+void ipu7_dma_sync_single(struct ipu7_bus_device *sys, dma_addr_t dma_handle,
+			  size_t size);
+void ipu7_dma_sync_sg(struct ipu7_bus_device *sys, struct scatterlist *sglist,
+		      unsigned int nents);
+void ipu7_dma_sync_sgtable(struct ipu7_bus_device *sys, struct sg_table *sgt);
+void *ipu7_dma_alloc(struct ipu7_bus_device *sys, size_t size,
+		     dma_addr_t *dma_handle, gfp_t gfp,
+		     unsigned long attrs);
+void ipu7_dma_free(struct ipu7_bus_device *sys, size_t size, void *vaddr,
+		   dma_addr_t dma_handle, unsigned long attrs);
+int ipu7_dma_mmap(struct ipu7_bus_device *sys, struct vm_area_struct *vma,
+		  void *addr, dma_addr_t iova, size_t size,
+		  unsigned long attrs);
+int ipu7_dma_map_sg(struct ipu7_bus_device *sys, struct scatterlist *sglist,
+		    int nents, enum dma_data_direction dir,
+		    unsigned long attrs);
+void ipu7_dma_unmap_sg(struct ipu7_bus_device *sys, struct scatterlist *sglist,
+		       int nents, enum dma_data_direction dir,
+		       unsigned long attrs);
+int ipu7_dma_map_sgtable(struct ipu7_bus_device *sys, struct sg_table *sgt,
+			 enum dma_data_direction dir, unsigned long attrs);
+void ipu7_dma_unmap_sgtable(struct ipu7_bus_device *sys, struct sg_table *sgt,
+			    enum dma_data_direction dir, unsigned long attrs);
+int ipu7_dma_get_sgtable(struct ipu7_bus_device *sys, struct sg_table *sgt,
+			 void *cpu_addr, dma_addr_t handle, size_t size,
+			 unsigned long attrs);
+#endif /* IPU7_DMA_H */
diff --git a/drivers/media/pci/intel/ipu7/ipu7-mmu.c b/drivers/media/pci/intel/ipu7/ipu7-mmu.c
new file mode 100644
index 000000000000..a10ef1c00672
--- /dev/null
+++ b/drivers/media/pci/intel/ipu7/ipu7-mmu.c
@@ -0,0 +1,853 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2013 - 2024 Intel Corporation
+ */
+
+#include <asm/barrier.h>
+
+#include <linux/align.h>
+#include <linux/atomic.h>
+#include <linux/bitops.h>
+#include <linux/bits.h>
+#include <linux/bug.h>
+#include <linux/cacheflush.h>
+#include <linux/device.h>
+#include <linux/dma-mapping.h>
+#include <linux/err.h>
+#include <linux/gfp.h>
+#include <linux/iopoll.h>
+#include <linux/iova.h>
+#include <linux/math.h>
+#include <linux/minmax.h>
+#include <linux/pci.h>
+#include <linux/pfn.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+#include <linux/vmalloc.h>
+
+#include "ipu7.h"
+#include "ipu7-dma.h"
+#include "ipu7-mmu.h"
+#include "ipu7-platform-regs.h"
+
+#define ISP_PAGE_SHIFT		12
+#define ISP_PAGE_SIZE		BIT(ISP_PAGE_SHIFT)
+#define ISP_PAGE_MASK		(~(ISP_PAGE_SIZE - 1))
+
+#define ISP_L1PT_SHIFT		22
+#define ISP_L1PT_MASK		(~((1U << ISP_L1PT_SHIFT) - 1))
+
+#define ISP_L2PT_SHIFT		12
+#define ISP_L2PT_MASK		(~(ISP_L1PT_MASK | (~(ISP_PAGE_MASK))))
+
+#define ISP_L1PT_PTES		1024
+#define ISP_L2PT_PTES		1024
+
+#define ISP_PADDR_SHIFT		12
+
+#define REG_L1_PHYS		0x0004	/* 27-bit pfn */
+#define REG_INFO		0x0008
+
+#define TBL_PHYS_ADDR(a)	((phys_addr_t)(a) << ISP_PADDR_SHIFT)
+
+#define MMU_TLB_INVALIDATE_TIMEOUT	2000
+
+static __maybe_unused void mmu_irq_handler(struct ipu7_mmu *mmu)
+{
+	unsigned int i;
+	u32 irq_cause;
+
+	for (i = 0; i < mmu->nr_mmus; i++) {
+		irq_cause = readl(mmu->mmu_hw[i].base + MMU_REG_IRQ_CAUSE);
+		pr_info("mmu %s irq_cause = 0x%x", mmu->mmu_hw[i].name,
+			irq_cause);
+		writel(0x1ffff, mmu->mmu_hw[i].base + MMU_REG_IRQ_CLEAR);
+	}
+}
+
+static void tlb_invalidate(struct ipu7_mmu *mmu)
+{
+	unsigned long flags;
+	unsigned int i;
+	int ret;
+	u32 val;
+
+	spin_lock_irqsave(&mmu->ready_lock, flags);
+	if (!mmu->ready) {
+		spin_unlock_irqrestore(&mmu->ready_lock, flags);
+		return;
+	}
+
+	for (i = 0; i < mmu->nr_mmus; i++) {
+		writel(0xffffffff, mmu->mmu_hw[i].base +
+		       MMU_REG_INVALIDATE_0);
+
+		/* Need check with HW, use l1streams or l2streams */
+		if (mmu->mmu_hw[i].nr_l2streams > 32)
+			writel(0xffffffff, mmu->mmu_hw[i].base +
+			       MMU_REG_INVALIDATE_1);
+
+		/*
+		 * The TLB invalidation is a "single cycle" (IOMMU clock cycles)
+		 * When the actual MMIO write reaches the IPU TLB Invalidate
+		 * register, wmb() will force the TLB invalidate out if the CPU
+		 * attempts to update the IOMMU page table (or sooner).
+		 */
+		wmb();
+
+		/* wait invalidation done */
+		ret = readl_poll_timeout_atomic(mmu->mmu_hw[i].base +
+						MMU_REG_INVALIDATION_STATUS,
+						val, !(val & 0x1), 500,
+						MMU_TLB_INVALIDATE_TIMEOUT);
+		if (ret)
+			dev_err(mmu->dev, "MMU[%u] TLB invalidate failed\n", i);
+	}
+
+	spin_unlock_irqrestore(&mmu->ready_lock, flags);
+}
+
+static dma_addr_t map_single(struct ipu7_mmu_info *mmu_info, void *ptr)
+{
+	dma_addr_t dma;
+
+	dma = dma_map_single(mmu_info->dev, ptr, PAGE_SIZE, DMA_BIDIRECTIONAL);
+	if (dma_mapping_error(mmu_info->dev, dma))
+		return 0;
+
+	return dma;
+}
+
+static int get_dummy_page(struct ipu7_mmu_info *mmu_info)
+{
+	void *pt = (void *)get_zeroed_page(GFP_ATOMIC | GFP_DMA32);
+	dma_addr_t dma;
+
+	if (!pt)
+		return -ENOMEM;
+
+	dev_dbg(mmu_info->dev, "dummy_page: get_zeroed_page() == %p\n", pt);
+
+	dma = map_single(mmu_info, pt);
+	if (!dma) {
+		dev_err(mmu_info->dev, "Failed to map dummy page\n");
+		goto err_free_page;
+	}
+
+	mmu_info->dummy_page = pt;
+	mmu_info->dummy_page_pteval = dma >> ISP_PAGE_SHIFT;
+
+	return 0;
+
+err_free_page:
+	free_page((unsigned long)pt);
+	return -ENOMEM;
+}
+
+static void free_dummy_page(struct ipu7_mmu_info *mmu_info)
+{
+	dma_unmap_single(mmu_info->dev,
+			 TBL_PHYS_ADDR(mmu_info->dummy_page_pteval),
+			 PAGE_SIZE, DMA_BIDIRECTIONAL);
+	free_page((unsigned long)mmu_info->dummy_page);
+}
+
+static int alloc_dummy_l2_pt(struct ipu7_mmu_info *mmu_info)
+{
+	u32 *pt = (u32 *)get_zeroed_page(GFP_ATOMIC | GFP_DMA32);
+	dma_addr_t dma;
+	unsigned int i;
+
+	if (!pt)
+		return -ENOMEM;
+
+	dev_dbg(mmu_info->dev, "dummy_l2: get_zeroed_page() = %p\n", pt);
+
+	dma = map_single(mmu_info, pt);
+	if (!dma) {
+		dev_err(mmu_info->dev, "Failed to map l2pt page\n");
+		goto err_free_page;
+	}
+
+	for (i = 0; i < ISP_L2PT_PTES; i++)
+		pt[i] = mmu_info->dummy_page_pteval;
+
+	mmu_info->dummy_l2_pt = pt;
+	mmu_info->dummy_l2_pteval = dma >> ISP_PAGE_SHIFT;
+
+	return 0;
+
+err_free_page:
+	free_page((unsigned long)pt);
+	return -ENOMEM;
+}
+
+static void free_dummy_l2_pt(struct ipu7_mmu_info *mmu_info)
+{
+	dma_unmap_single(mmu_info->dev,
+			 TBL_PHYS_ADDR(mmu_info->dummy_l2_pteval),
+			 PAGE_SIZE, DMA_BIDIRECTIONAL);
+	free_page((unsigned long)mmu_info->dummy_l2_pt);
+}
+
+static u32 *alloc_l1_pt(struct ipu7_mmu_info *mmu_info)
+{
+	u32 *pt = (u32 *)get_zeroed_page(GFP_ATOMIC | GFP_DMA32);
+	dma_addr_t dma;
+	unsigned int i;
+
+	if (!pt)
+		return NULL;
+
+	dev_dbg(mmu_info->dev, "alloc_l1: get_zeroed_page() = %p\n", pt);
+
+	for (i = 0; i < ISP_L1PT_PTES; i++)
+		pt[i] = mmu_info->dummy_l2_pteval;
+
+	dma = map_single(mmu_info, pt);
+	if (!dma) {
+		dev_err(mmu_info->dev, "Failed to map l1pt page\n");
+		goto err_free_page;
+	}
+
+	mmu_info->l1_pt_dma = dma >> ISP_PADDR_SHIFT;
+	dev_dbg(mmu_info->dev, "l1 pt %p mapped at %pad\n", pt, &dma);
+
+	return pt;
+
+err_free_page:
+	free_page((unsigned long)pt);
+	return NULL;
+}
+
+static u32 *alloc_l2_pt(struct ipu7_mmu_info *mmu_info)
+{
+	u32 *pt = (u32 *)get_zeroed_page(GFP_ATOMIC | GFP_DMA32);
+	unsigned int i;
+
+	if (!pt)
+		return NULL;
+
+	dev_dbg(mmu_info->dev, "alloc_l2: get_zeroed_page() = %p\n", pt);
+
+	for (i = 0; i < ISP_L1PT_PTES; i++)
+		pt[i] = mmu_info->dummy_page_pteval;
+
+	return pt;
+}
+
+static void l2_unmap(struct ipu7_mmu_info *mmu_info, unsigned long iova,
+		     phys_addr_t dummy, size_t size)
+{
+	unsigned int l2_entries;
+	unsigned int l2_idx;
+	unsigned long flags;
+	u32 l1_idx;
+	u32 *l2_pt;
+
+	spin_lock_irqsave(&mmu_info->lock, flags);
+	for (l1_idx = iova >> ISP_L1PT_SHIFT;
+	     size > 0 && l1_idx < ISP_L1PT_PTES; l1_idx++) {
+		dev_dbg(mmu_info->dev,
+			"unmapping l2 pgtable (l1 index %u (iova 0x%8.8lx))\n",
+			l1_idx, iova);
+
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
+			phys_addr_t pteval = TBL_PHYS_ADDR(l2_pt[l2_idx]);
+
+			dev_dbg(mmu_info->dev,
+				"unmap l2 index %u with pteval 0x%p\n",
+				l2_idx, &pteval);
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
+	}
+
+	WARN_ON_ONCE(size);
+	spin_unlock_irqrestore(&mmu_info->lock, flags);
+}
+
+static int l2_map(struct ipu7_mmu_info *mmu_info, unsigned long iova,
+		  phys_addr_t paddr, size_t size)
+{
+	struct device *dev = mmu_info->dev;
+	unsigned int l2_entries;
+	u32 *l2_pt, *l2_virt;
+	unsigned int l2_idx;
+	unsigned long flags;
+	size_t mapped = 0;
+	dma_addr_t dma;
+	u32 l1_entry;
+	u32 l1_idx;
+	int err = 0;
+
+	spin_lock_irqsave(&mmu_info->lock, flags);
+
+	paddr = ALIGN(paddr, ISP_PAGE_SIZE);
+	for (l1_idx = iova >> ISP_L1PT_SHIFT;
+	     size > 0 && l1_idx < ISP_L1PT_PTES; l1_idx++) {
+		dev_dbg(dev,
+			"mapping l2 page table for l1 index %u (iova %8.8x)\n",
+			l1_idx, (u32)iova);
+
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
+
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
+	}
+
+	spin_unlock_irqrestore(&mmu_info->lock, flags);
+
+	return 0;
+
+error:
+	spin_unlock_irqrestore(&mmu_info->lock, flags);
+	/* unroll mapping in case something went wrong */
+	if (mapped)
+		l2_unmap(mmu_info, iova - mapped, paddr - mapped, mapped);
+
+	return err;
+}
+
+static int __ipu7_mmu_map(struct ipu7_mmu_info *mmu_info, unsigned long iova,
+			  phys_addr_t paddr, size_t size)
+{
+	u32 iova_start = round_down(iova, ISP_PAGE_SIZE);
+	u32 iova_end = ALIGN(iova + size, ISP_PAGE_SIZE);
+
+	dev_dbg(mmu_info->dev,
+		"mapping iova 0x%8.8x--0x%8.8x, size %zu at paddr %pap\n",
+		iova_start, iova_end, size, &paddr);
+
+	return l2_map(mmu_info, iova_start, paddr, size);
+}
+
+static void __ipu7_mmu_unmap(struct ipu7_mmu_info *mmu_info,
+			     unsigned long iova, size_t size)
+{
+	l2_unmap(mmu_info, iova, 0, size);
+}
+
+static int allocate_trash_buffer(struct ipu7_mmu *mmu)
+{
+	unsigned int n_pages = PFN_UP(IPU_MMUV2_TRASH_RANGE);
+	unsigned long iova_addr;
+	struct iova *iova;
+	unsigned int i;
+	dma_addr_t dma;
+	int ret;
+
+	/* Allocate 8MB in iova range */
+	iova = alloc_iova(&mmu->dmap->iovad, n_pages,
+			  PHYS_PFN(mmu->dmap->mmu_info->aperture_end), 0);
+	if (!iova) {
+		dev_err(mmu->dev, "cannot allocate iova range for trash\n");
+		return -ENOMEM;
+	}
+
+	dma = dma_map_page(mmu->dmap->mmu_info->dev, mmu->trash_page, 0,
+			   PAGE_SIZE, DMA_BIDIRECTIONAL);
+	if (dma_mapping_error(mmu->dmap->mmu_info->dev, dma)) {
+		dev_err(mmu->dmap->mmu_info->dev, "Failed to map trash page\n");
+		ret = -ENOMEM;
+		goto out_free_iova;
+	}
+
+	mmu->pci_trash_page = dma;
+
+	/*
+	 * Map the 8MB iova address range to the same physical trash page
+	 * mmu->trash_page which is already reserved at the probe
+	 */
+	iova_addr = iova->pfn_lo;
+	for (i = 0; i < n_pages; i++) {
+		ret = ipu7_mmu_map(mmu->dmap->mmu_info, PFN_PHYS(iova_addr),
+				   mmu->pci_trash_page, PAGE_SIZE);
+		if (ret) {
+			dev_err(mmu->dev,
+				"mapping trash buffer range failed\n");
+			goto out_unmap;
+		}
+
+		iova_addr++;
+	}
+
+	mmu->iova_trash_page = PFN_PHYS(iova->pfn_lo);
+	dev_dbg(mmu->dev, "iova trash buffer for MMUID: %d is %u\n",
+		mmu->mmid, (unsigned int)mmu->iova_trash_page);
+	return 0;
+
+out_unmap:
+	ipu7_mmu_unmap(mmu->dmap->mmu_info, PFN_PHYS(iova->pfn_lo),
+		       PFN_PHYS(iova_size(iova)));
+	dma_unmap_page(mmu->dmap->mmu_info->dev, mmu->pci_trash_page,
+		       PAGE_SIZE, DMA_BIDIRECTIONAL);
+out_free_iova:
+	__free_iova(&mmu->dmap->iovad, iova);
+	return ret;
+}
+
+static void __mmu_at_init(struct ipu7_mmu *mmu)
+{
+	struct ipu7_mmu_info *mmu_info;
+	unsigned int i;
+
+	mmu_info = mmu->dmap->mmu_info;
+	for (i = 0; i < mmu->nr_mmus; i++) {
+		struct ipu7_mmu_hw *mmu_hw = &mmu->mmu_hw[i];
+		unsigned int j;
+
+		/* Write page table address per MMU */
+		writel((phys_addr_t)mmu_info->l1_pt_dma,
+		       mmu_hw->base + MMU_REG_PAGE_TABLE_BASE_ADDR);
+		dev_dbg(mmu->dev, "mmu %s base was set as %x\n", mmu_hw->name,
+			readl(mmu_hw->base + MMU_REG_PAGE_TABLE_BASE_ADDR));
+
+		/* Set info bits and axi_refill per MMU */
+		writel(mmu_hw->info_bits,
+		       mmu_hw->base + MMU_REG_USER_INFO_BITS);
+		writel(mmu_hw->refill, mmu_hw->base + MMU_REG_AXI_REFILL_IF_ID);
+		writel(mmu_hw->collapse_en_bitmap,
+		       mmu_hw->base + MMU_REG_COLLAPSE_ENABLE_BITMAP);
+
+		dev_dbg(mmu->dev, "mmu %s info_bits was set as %x\n",
+			mmu_hw->name,
+			readl(mmu_hw->base + MMU_REG_USER_INFO_BITS));
+
+		if (mmu_hw->at_sp_arb_cfg)
+			writel(mmu_hw->at_sp_arb_cfg,
+			       mmu_hw->base + MMU_REG_AT_SP_ARB_CFG);
+
+		/* default irq configuration */
+		writel(0x3ff, mmu_hw->base + MMU_REG_IRQ_MASK);
+		writel(0x3ff, mmu_hw->base + MMU_REG_IRQ_ENABLE);
+
+		/* Configure MMU TLB stream configuration for L1/L2 */
+		for (j = 0; j < mmu_hw->nr_l1streams; j++) {
+			writel(mmu_hw->l1_block_sz[j], mmu_hw->base +
+			       mmu_hw->l1_block + 4 * j);
+		}
+
+		for (j = 0; j < mmu_hw->nr_l2streams; j++) {
+			writel(mmu_hw->l2_block_sz[j], mmu_hw->base +
+			       mmu_hw->l2_block + 4 * j);
+		}
+
+		for (j = 0; j < mmu_hw->uao_p_num; j++) {
+			if (!mmu_hw->uao_p2tlb[j])
+				continue;
+			writel(mmu_hw->uao_p2tlb[j], mmu_hw->uao_base + 4 * j);
+		}
+	}
+}
+
+static void __mmu_zlx_init(struct ipu7_mmu *mmu)
+{
+	unsigned int i;
+
+	dev_dbg(mmu->dev, "mmu zlx init\n");
+
+	for (i = 0; i < mmu->nr_mmus; i++) {
+		struct ipu7_mmu_hw *mmu_hw = &mmu->mmu_hw[i];
+		unsigned int j;
+
+		dev_dbg(mmu->dev, "mmu %s zlx init\n", mmu_hw->name);
+		for (j = 0; j < IPU_ZLX_POOL_NUM; j++) {
+			if (!mmu_hw->zlx_axi_pool[j])
+				continue;
+			writel(mmu_hw->zlx_axi_pool[j],
+			       mmu_hw->zlx_base + ZLX_REG_AXI_POOL + j * 0x4);
+		}
+
+		for (j = 0; j < mmu_hw->zlx_nr; j++) {
+			if (!mmu_hw->zlx_conf[j])
+				continue;
+
+			writel(mmu_hw->zlx_conf[j],
+			       mmu_hw->zlx_base + ZLX_REG_CONF + j * 0x8);
+		}
+
+		for (j = 0; j < mmu_hw->zlx_nr; j++) {
+			if (!mmu_hw->zlx_en[j])
+				continue;
+
+			writel(mmu_hw->zlx_en[j],
+			       mmu_hw->zlx_base + ZLX_REG_EN + j * 0x8);
+		}
+	}
+}
+
+int ipu7_mmu_hw_init(struct ipu7_mmu *mmu)
+{
+	unsigned long flags;
+
+	dev_dbg(mmu->dev, "IPU mmu hardware init\n");
+
+	/* Initialise the each MMU and ZLX */
+	__mmu_at_init(mmu);
+	__mmu_zlx_init(mmu);
+
+	if (!mmu->trash_page) {
+		int ret;
+
+		mmu->trash_page = alloc_page(GFP_KERNEL);
+		if (!mmu->trash_page) {
+			dev_err(mmu->dev, "insufficient memory for trash buffer\n");
+			return -ENOMEM;
+		}
+
+		ret = allocate_trash_buffer(mmu);
+		if (ret) {
+			__free_page(mmu->trash_page);
+			mmu->trash_page = NULL;
+			dev_err(mmu->dev, "trash buffer allocation failed\n");
+			return ret;
+		}
+	}
+
+	spin_lock_irqsave(&mmu->ready_lock, flags);
+	mmu->ready = true;
+	spin_unlock_irqrestore(&mmu->ready_lock, flags);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(ipu7_mmu_hw_init, "INTEL_IPU7");
+
+static struct ipu7_mmu_info *ipu7_mmu_alloc(struct ipu7_device *isp)
+{
+	struct ipu7_mmu_info *mmu_info;
+	int ret;
+
+	mmu_info = kzalloc(sizeof(*mmu_info), GFP_KERNEL);
+	if (!mmu_info)
+		return NULL;
+
+	if (isp->secure_mode) {
+		mmu_info->aperture_start = IPU_FW_CODE_REGION_END;
+		mmu_info->aperture_end =
+			(dma_addr_t)DMA_BIT_MASK(IPU_MMU_ADDR_BITS);
+	} else {
+		mmu_info->aperture_start = IPU_FW_CODE_REGION_START;
+		mmu_info->aperture_end =
+			(dma_addr_t)DMA_BIT_MASK(IPU_MMU_ADDR_BITS_NON_SECURE);
+	}
+
+	mmu_info->pgsize_bitmap = SZ_4K;
+	mmu_info->dev = &isp->pdev->dev;
+
+	ret = get_dummy_page(mmu_info);
+	if (ret)
+		goto err_free_info;
+
+	ret = alloc_dummy_l2_pt(mmu_info);
+	if (ret)
+		goto err_free_dummy_page;
+
+	mmu_info->l2_pts = vzalloc(ISP_L2PT_PTES * sizeof(*mmu_info->l2_pts));
+	if (!mmu_info->l2_pts)
+		goto err_free_dummy_l2_pt;
+
+	/*
+	 * We always map the L1 page table (a single page as well as
+	 * the L2 page tables).
+	 */
+	mmu_info->l1_pt = alloc_l1_pt(mmu_info);
+	if (!mmu_info->l1_pt)
+		goto err_free_l2_pts;
+
+	spin_lock_init(&mmu_info->lock);
+
+	dev_dbg(mmu_info->dev, "domain initialised\n");
+
+	return mmu_info;
+
+err_free_l2_pts:
+	vfree(mmu_info->l2_pts);
+err_free_dummy_l2_pt:
+	free_dummy_l2_pt(mmu_info);
+err_free_dummy_page:
+	free_dummy_page(mmu_info);
+err_free_info:
+	kfree(mmu_info);
+
+	return NULL;
+}
+
+void ipu7_mmu_hw_cleanup(struct ipu7_mmu *mmu)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&mmu->ready_lock, flags);
+	mmu->ready = false;
+	spin_unlock_irqrestore(&mmu->ready_lock, flags);
+}
+EXPORT_SYMBOL_NS_GPL(ipu7_mmu_hw_cleanup, "INTEL_IPU7");
+
+static struct ipu7_dma_mapping *alloc_dma_mapping(struct ipu7_device *isp)
+{
+	struct ipu7_dma_mapping *dmap;
+	unsigned long base_pfn;
+
+	dmap = kzalloc(sizeof(*dmap), GFP_KERNEL);
+	if (!dmap)
+		return NULL;
+
+	dmap->mmu_info = ipu7_mmu_alloc(isp);
+	if (!dmap->mmu_info) {
+		kfree(dmap);
+		return NULL;
+	}
+
+	/* 0~64M is forbidden for uctile controller */
+	base_pfn = max_t(unsigned long, 1,
+			 PFN_DOWN(dmap->mmu_info->aperture_start));
+	init_iova_domain(&dmap->iovad, SZ_4K, base_pfn);
+	dmap->mmu_info->dmap = dmap;
+
+	dev_dbg(&isp->pdev->dev, "alloc mapping\n");
+
+	iova_cache_get();
+
+	return dmap;
+}
+
+phys_addr_t ipu7_mmu_iova_to_phys(struct ipu7_mmu_info *mmu_info,
+				  dma_addr_t iova)
+{
+	phys_addr_t phy_addr;
+	unsigned long flags;
+	u32 *l2_pt;
+
+	spin_lock_irqsave(&mmu_info->lock, flags);
+	l2_pt = mmu_info->l2_pts[iova >> ISP_L1PT_SHIFT];
+	phy_addr = (phys_addr_t)l2_pt[(iova & ISP_L2PT_MASK) >> ISP_L2PT_SHIFT];
+	phy_addr <<= ISP_PAGE_SHIFT;
+	spin_unlock_irqrestore(&mmu_info->lock, flags);
+
+	return phy_addr;
+}
+
+void ipu7_mmu_unmap(struct ipu7_mmu_info *mmu_info, unsigned long iova,
+		    size_t size)
+{
+	unsigned int min_pagesz;
+
+	dev_dbg(mmu_info->dev, "unmapping iova 0x%lx size 0x%zx\n", iova, size);
+
+	/* find out the minimum page size supported */
+	min_pagesz = 1 << __ffs(mmu_info->pgsize_bitmap);
+
+	/*
+	 * The virtual address and the size of the mapping must be
+	 * aligned (at least) to the size of the smallest page supported
+	 * by the hardware
+	 */
+	if (!IS_ALIGNED(iova | size, min_pagesz)) {
+		dev_err(mmu_info->dev,
+			"unaligned: iova 0x%lx size 0x%zx min_pagesz 0x%x\n",
+			iova, size, min_pagesz);
+		return;
+	}
+
+	__ipu7_mmu_unmap(mmu_info, iova, size);
+}
+
+int ipu7_mmu_map(struct ipu7_mmu_info *mmu_info, unsigned long iova,
+		 phys_addr_t paddr, size_t size)
+{
+	unsigned int min_pagesz;
+
+	if (mmu_info->pgsize_bitmap == 0UL)
+		return -ENODEV;
+
+	/* find out the minimum page size supported */
+	min_pagesz = 1 << __ffs(mmu_info->pgsize_bitmap);
+
+	/*
+	 * both the virtual address and the physical one, as well as
+	 * the size of the mapping, must be aligned (at least) to the
+	 * size of the smallest page supported by the hardware
+	 */
+	if (!IS_ALIGNED(iova | paddr | size, min_pagesz)) {
+		dev_err(mmu_info->dev,
+			"unaligned: iova %lx pa %pa size %zx min_pagesz %x\n",
+			iova, &paddr, size, min_pagesz);
+		return -EINVAL;
+	}
+
+	dev_dbg(mmu_info->dev, "map: iova 0x%lx pa %pa size 0x%zx\n",
+		iova, &paddr, size);
+
+	return __ipu7_mmu_map(mmu_info, iova, paddr, size);
+}
+
+static void ipu7_mmu_destroy(struct ipu7_mmu *mmu)
+{
+	struct ipu7_dma_mapping *dmap = mmu->dmap;
+	struct ipu7_mmu_info *mmu_info = dmap->mmu_info;
+	struct iova *iova;
+	u32 l1_idx;
+
+	if (mmu->iova_trash_page) {
+		iova = find_iova(&dmap->iovad, PHYS_PFN(mmu->iova_trash_page));
+		if (iova) {
+			/* unmap and free the trash buffer iova */
+			ipu7_mmu_unmap(mmu_info, PFN_PHYS(iova->pfn_lo),
+				       PFN_PHYS(iova_size(iova)));
+			__free_iova(&dmap->iovad, iova);
+		} else {
+			dev_err(mmu->dev, "trash buffer iova not found.\n");
+		}
+
+		mmu->iova_trash_page = 0;
+		dma_unmap_page(mmu_info->dev, mmu->pci_trash_page,
+			       PAGE_SIZE, DMA_BIDIRECTIONAL);
+		mmu->pci_trash_page = 0;
+		__free_page(mmu->trash_page);
+	}
+
+	for (l1_idx = 0; l1_idx < ISP_L1PT_PTES; l1_idx++) {
+		if (mmu_info->l1_pt[l1_idx] != mmu_info->dummy_l2_pteval) {
+			dma_unmap_single(mmu_info->dev,
+					 TBL_PHYS_ADDR(mmu_info->l1_pt[l1_idx]),
+					 PAGE_SIZE, DMA_BIDIRECTIONAL);
+			free_page((unsigned long)mmu_info->l2_pts[l1_idx]);
+		}
+	}
+
+	vfree(mmu_info->l2_pts);
+	free_dummy_page(mmu_info);
+	dma_unmap_single(mmu_info->dev, TBL_PHYS_ADDR(mmu_info->l1_pt_dma),
+			 PAGE_SIZE, DMA_BIDIRECTIONAL);
+	free_page((unsigned long)mmu_info->dummy_l2_pt);
+	free_page((unsigned long)mmu_info->l1_pt);
+	kfree(mmu_info);
+}
+
+struct ipu7_mmu *ipu7_mmu_init(struct device *dev,
+			       void __iomem *base, int mmid,
+			       const struct ipu7_hw_variants *hw)
+{
+	struct ipu7_device *isp = pci_get_drvdata(to_pci_dev(dev));
+	struct ipu7_mmu_pdata *pdata;
+	struct ipu7_mmu *mmu;
+	unsigned int i;
+
+	if (hw->nr_mmus > IPU_MMU_MAX_NUM)
+		return ERR_PTR(-EINVAL);
+
+	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		return ERR_PTR(-ENOMEM);
+
+	for (i = 0; i < hw->nr_mmus; i++) {
+		struct ipu7_mmu_hw *pdata_mmu = &pdata->mmu_hw[i];
+		const struct ipu7_mmu_hw *src_mmu = &hw->mmu_hw[i];
+
+		if (src_mmu->nr_l1streams > IPU_MMU_MAX_TLB_L1_STREAMS ||
+		    src_mmu->nr_l2streams > IPU_MMU_MAX_TLB_L2_STREAMS)
+			return ERR_PTR(-EINVAL);
+
+		*pdata_mmu = *src_mmu;
+		pdata_mmu->base = base + src_mmu->offset;
+		pdata_mmu->zlx_base = base + src_mmu->zlx_offset;
+		pdata_mmu->uao_base = base + src_mmu->uao_offset;
+	}
+
+	mmu = devm_kzalloc(dev, sizeof(*mmu), GFP_KERNEL);
+	if (!mmu)
+		return ERR_PTR(-ENOMEM);
+
+	mmu->mmid = mmid;
+	mmu->mmu_hw = pdata->mmu_hw;
+	mmu->nr_mmus = hw->nr_mmus;
+	mmu->tlb_invalidate = tlb_invalidate;
+	mmu->ready = false;
+	INIT_LIST_HEAD(&mmu->vma_list);
+	spin_lock_init(&mmu->ready_lock);
+
+	mmu->dmap = alloc_dma_mapping(isp);
+	if (!mmu->dmap) {
+		dev_err(dev, "can't alloc dma mapping\n");
+		return ERR_PTR(-ENOMEM);
+	}
+
+	return mmu;
+}
+
+void ipu7_mmu_cleanup(struct ipu7_mmu *mmu)
+{
+	struct ipu7_dma_mapping *dmap = mmu->dmap;
+
+	ipu7_mmu_destroy(mmu);
+	mmu->dmap = NULL;
+	iova_cache_put();
+	put_iova_domain(&dmap->iovad);
+	kfree(dmap);
+}
diff --git a/drivers/media/pci/intel/ipu7/ipu7-mmu.h b/drivers/media/pci/intel/ipu7/ipu7-mmu.h
new file mode 100644
index 000000000000..da95342622ce
--- /dev/null
+++ b/drivers/media/pci/intel/ipu7/ipu7-mmu.h
@@ -0,0 +1,414 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2013 - 2024 Intel Corporation
+ */
+
+#ifndef IPU7_MMU_H
+#define IPU7_MMU_H
+
+#include <linux/dma-mapping.h>
+#include <linux/list.h>
+#include <linux/spinlock_types.h>
+#include <linux/types.h>
+
+struct device;
+struct page;
+struct ipu7_hw_variants;
+struct ipu7_mmu;
+struct ipu7_mmu_info;
+
+#define ISYS_MMID 1
+#define PSYS_MMID 0
+
+/* IPU7 for LNL */
+/* IS MMU Cmd RD */
+#define IPU7_IS_MMU_FW_RD_OFFSET		0x274000
+#define IPU7_IS_MMU_FW_RD_STREAM_NUM		3
+#define IPU7_IS_MMU_FW_RD_L1_BLOCKNR_REG	0x54
+#define IPU7_IS_MMU_FW_RD_L2_BLOCKNR_REG	0x60
+
+/* IS MMU Cmd WR */
+#define IPU7_IS_MMU_FW_WR_OFFSET		0x275000
+#define IPU7_IS_MMU_FW_WR_STREAM_NUM		3
+#define IPU7_IS_MMU_FW_WR_L1_BLOCKNR_REG	0x54
+#define IPU7_IS_MMU_FW_WR_L2_BLOCKNR_REG	0x60
+
+/* IS MMU Data WR Snoop */
+#define IPU7_IS_MMU_M0_OFFSET			0x276000
+#define IPU7_IS_MMU_M0_STREAM_NUM		8
+#define IPU7_IS_MMU_M0_L1_BLOCKNR_REG		0x54
+#define IPU7_IS_MMU_M0_L2_BLOCKNR_REG		0x74
+
+/* IS MMU Data WR ISOC */
+#define IPU7_IS_MMU_M1_OFFSET			0x277000
+#define IPU7_IS_MMU_M1_STREAM_NUM		16
+#define IPU7_IS_MMU_M1_L1_BLOCKNR_REG		0x54
+#define IPU7_IS_MMU_M1_L2_BLOCKNR_REG		0x94
+
+/* PS MMU FW RD */
+#define IPU7_PS_MMU_FW_RD_OFFSET		0x148000
+#define IPU7_PS_MMU_FW_RD_STREAM_NUM		20
+#define IPU7_PS_MMU_FW_RD_L1_BLOCKNR_REG	0x54
+#define IPU7_PS_MMU_FW_RD_L2_BLOCKNR_REG	0xa4
+
+/* PS MMU FW WR */
+#define IPU7_PS_MMU_FW_WR_OFFSET		0x149000
+#define IPU7_PS_MMU_FW_WR_STREAM_NUM		10
+#define IPU7_PS_MMU_FW_WR_L1_BLOCKNR_REG	0x54
+#define IPU7_PS_MMU_FW_WR_L2_BLOCKNR_REG	0x7c
+
+/* PS MMU FW Data RD VC0 */
+#define IPU7_PS_MMU_SRT_RD_OFFSET		0x14a000
+#define IPU7_PS_MMU_SRT_RD_STREAM_NUM		40
+#define IPU7_PS_MMU_SRT_RD_L1_BLOCKNR_REG	0x54
+#define IPU7_PS_MMU_SRT_RD_L2_BLOCKNR_REG	0xf4
+
+/* PS MMU FW Data WR VC0 */
+#define IPU7_PS_MMU_SRT_WR_OFFSET		0x14b000
+#define IPU7_PS_MMU_SRT_WR_STREAM_NUM		40
+#define IPU7_PS_MMU_SRT_WR_L1_BLOCKNR_REG	0x54
+#define IPU7_PS_MMU_SRT_WR_L2_BLOCKNR_REG	0xf4
+
+/* IS UAO UC RD */
+#define IPU7_IS_UAO_UC_RD_OFFSET		0x27c000
+#define IPU7_IS_UAO_UC_RD_PLANENUM		4
+
+/* IS UAO UC WR */
+#define IPU7_IS_UAO_UC_WR_OFFSET		0x27d000
+#define IPU7_IS_UAO_UC_WR_PLANENUM		4
+
+/* IS UAO M0 WR */
+#define IPU7_IS_UAO_M0_WR_OFFSET		0x27e000
+#define IPU7_IS_UAO_M0_WR_PLANENUM		8
+
+/* IS UAO M1 WR */
+#define IPU7_IS_UAO_M1_WR_OFFSET		0x27f000
+#define IPU7_IS_UAO_M1_WR_PLANENUM		16
+
+/* PS UAO FW RD */
+#define IPU7_PS_UAO_FW_RD_OFFSET		0x156000
+#define IPU7_PS_UAO_FW_RD_PLANENUM		20
+
+/* PS UAO FW WR */
+#define IPU7_PS_UAO_FW_WR_OFFSET		0x157000
+#define IPU7_PS_UAO_FW_WR_PLANENUM		16
+
+/* PS UAO SRT RD */
+#define IPU7_PS_UAO_SRT_RD_OFFSET		0x154000
+#define IPU7_PS_UAO_SRT_RD_PLANENUM		40
+
+/* PS UAO SRT WR */
+#define IPU7_PS_UAO_SRT_WR_OFFSET		0x155000
+#define IPU7_PS_UAO_SRT_WR_PLANENUM		40
+
+#define IPU7_IS_ZLX_UC_RD_OFFSET		0x278000
+#define IPU7_IS_ZLX_UC_WR_OFFSET		0x279000
+#define IPU7_IS_ZLX_M0_OFFSET			0x27a000
+#define IPU7_IS_ZLX_M1_OFFSET			0x27b000
+#define IPU7_IS_ZLX_UC_RD_NUM			4
+#define IPU7_IS_ZLX_UC_WR_NUM			4
+#define IPU7_IS_ZLX_M0_NUM			8
+#define IPU7_IS_ZLX_M1_NUM			16
+
+#define IPU7_PS_ZLX_DATA_RD_OFFSET		0x14e000
+#define IPU7_PS_ZLX_DATA_WR_OFFSET		0x14f000
+#define IPU7_PS_ZLX_FW_RD_OFFSET		0x150000
+#define IPU7_PS_ZLX_FW_WR_OFFSET		0x151000
+#define IPU7_PS_ZLX_DATA_RD_NUM			32
+#define IPU7_PS_ZLX_DATA_WR_NUM			32
+#define IPU7_PS_ZLX_FW_RD_NUM			16
+#define IPU7_PS_ZLX_FW_WR_NUM			10
+
+/* IPU7P5 for PTL */
+/* IS MMU Cmd RD */
+#define IPU7P5_IS_MMU_FW_RD_OFFSET		0x274000
+#define IPU7P5_IS_MMU_FW_RD_STREAM_NUM		3
+#define IPU7P5_IS_MMU_FW_RD_L1_BLOCKNR_REG	0x54
+#define IPU7P5_IS_MMU_FW_RD_L2_BLOCKNR_REG	0x60
+
+/* IS MMU Cmd WR */
+#define IPU7P5_IS_MMU_FW_WR_OFFSET		0x275000
+#define IPU7P5_IS_MMU_FW_WR_STREAM_NUM		3
+#define IPU7P5_IS_MMU_FW_WR_L1_BLOCKNR_REG	0x54
+#define IPU7P5_IS_MMU_FW_WR_L2_BLOCKNR_REG	0x60
+
+/* IS MMU Data WR Snoop */
+#define IPU7P5_IS_MMU_M0_OFFSET			0x276000
+#define IPU7P5_IS_MMU_M0_STREAM_NUM		16
+#define IPU7P5_IS_MMU_M0_L1_BLOCKNR_REG		0x54
+#define IPU7P5_IS_MMU_M0_L2_BLOCKNR_REG		0x94
+
+/* IS MMU Data WR ISOC */
+#define IPU7P5_IS_MMU_M1_OFFSET			0x277000
+#define IPU7P5_IS_MMU_M1_STREAM_NUM		16
+#define IPU7P5_IS_MMU_M1_L1_BLOCKNR_REG		0x54
+#define IPU7P5_IS_MMU_M1_L2_BLOCKNR_REG		0x94
+
+/* PS MMU FW RD */
+#define IPU7P5_PS_MMU_FW_RD_OFFSET		0x148000
+#define IPU7P5_PS_MMU_FW_RD_STREAM_NUM		16
+#define IPU7P5_PS_MMU_FW_RD_L1_BLOCKNR_REG	0x54
+#define IPU7P5_PS_MMU_FW_RD_L2_BLOCKNR_REG	0x94
+
+/* PS MMU FW WR */
+#define IPU7P5_PS_MMU_FW_WR_OFFSET		0x149000
+#define IPU7P5_PS_MMU_FW_WR_STREAM_NUM		10
+#define IPU7P5_PS_MMU_FW_WR_L1_BLOCKNR_REG	0x54
+#define IPU7P5_PS_MMU_FW_WR_L2_BLOCKNR_REG	0x7c
+
+/* PS MMU FW Data RD VC0 */
+#define IPU7P5_PS_MMU_SRT_RD_OFFSET		0x14a000
+#define IPU7P5_PS_MMU_SRT_RD_STREAM_NUM		22
+#define IPU7P5_PS_MMU_SRT_RD_L1_BLOCKNR_REG	0x54
+#define IPU7P5_PS_MMU_SRT_RD_L2_BLOCKNR_REG	0xac
+
+/* PS MMU FW Data WR VC0 */
+#define IPU7P5_PS_MMU_SRT_WR_OFFSET		0x14b000
+#define IPU7P5_PS_MMU_SRT_WR_STREAM_NUM		32
+#define IPU7P5_PS_MMU_SRT_WR_L1_BLOCKNR_REG	0x54
+#define IPU7P5_PS_MMU_SRT_WR_L2_BLOCKNR_REG	0xd4
+
+/* IS UAO UC RD */
+#define IPU7P5_IS_UAO_UC_RD_OFFSET		0x27c000
+#define IPU7P5_IS_UAO_UC_RD_PLANENUM		4
+
+/* IS UAO UC WR */
+#define IPU7P5_IS_UAO_UC_WR_OFFSET		0x27d000
+#define IPU7P5_IS_UAO_UC_WR_PLANENUM		4
+
+/* IS UAO M0 WR */
+#define IPU7P5_IS_UAO_M0_WR_OFFSET		0x27e000
+#define IPU7P5_IS_UAO_M0_WR_PLANENUM		16
+
+/* IS UAO M1 WR */
+#define IPU7P5_IS_UAO_M1_WR_OFFSET		0x27f000
+#define IPU7P5_IS_UAO_M1_WR_PLANENUM		16
+
+/* PS UAO FW RD */
+#define IPU7P5_PS_UAO_FW_RD_OFFSET		0x156000
+#define IPU7P5_PS_UAO_FW_RD_PLANENUM		16
+
+/* PS UAO FW WR */
+#define IPU7P5_PS_UAO_FW_WR_OFFSET		0x157000
+#define IPU7P5_PS_UAO_FW_WR_PLANENUM		10
+
+/* PS UAO SRT RD */
+#define IPU7P5_PS_UAO_SRT_RD_OFFSET		0x154000
+#define IPU7P5_PS_UAO_SRT_RD_PLANENUM		22
+
+/* PS UAO SRT WR */
+#define IPU7P5_PS_UAO_SRT_WR_OFFSET		0x155000
+#define IPU7P5_PS_UAO_SRT_WR_PLANENUM		32
+
+#define IPU7P5_IS_ZLX_UC_RD_OFFSET		0x278000
+#define IPU7P5_IS_ZLX_UC_WR_OFFSET		0x279000
+#define IPU7P5_IS_ZLX_M0_OFFSET			0x27a000
+#define IPU7P5_IS_ZLX_M1_OFFSET			0x27b000
+#define IPU7P5_IS_ZLX_UC_RD_NUM			4
+#define IPU7P5_IS_ZLX_UC_WR_NUM			4
+#define IPU7P5_IS_ZLX_M0_NUM			16
+#define IPU7P5_IS_ZLX_M1_NUM			16
+
+#define IPU7P5_PS_ZLX_DATA_RD_OFFSET		0x14e000
+#define IPU7P5_PS_ZLX_DATA_WR_OFFSET		0x14f000
+#define IPU7P5_PS_ZLX_FW_RD_OFFSET		0x150000
+#define IPU7P5_PS_ZLX_FW_WR_OFFSET		0x151000
+#define IPU7P5_PS_ZLX_DATA_RD_NUM		22
+#define IPU7P5_PS_ZLX_DATA_WR_NUM		32
+#define IPU7P5_PS_ZLX_FW_RD_NUM			16
+#define IPU7P5_PS_ZLX_FW_WR_NUM			10
+
+/* IS MMU Cmd RD */
+#define IPU8_IS_MMU_FW_RD_OFFSET		0x270000
+#define IPU8_IS_MMU_FW_RD_STREAM_NUM		3
+#define IPU8_IS_MMU_FW_RD_L1_BLOCKNR_REG	0x54
+#define IPU8_IS_MMU_FW_RD_L2_BLOCKNR_REG	0x60
+
+/* IS MMU Cmd WR */
+#define IPU8_IS_MMU_FW_WR_OFFSET		0x271000
+#define IPU8_IS_MMU_FW_WR_STREAM_NUM		3
+#define IPU8_IS_MMU_FW_WR_L1_BLOCKNR_REG	0x54
+#define IPU8_IS_MMU_FW_WR_L2_BLOCKNR_REG	0x60
+
+/* IS MMU Data WR Snoop */
+#define IPU8_IS_MMU_M0_OFFSET			0x272000
+#define IPU8_IS_MMU_M0_STREAM_NUM		16
+#define IPU8_IS_MMU_M0_L1_BLOCKNR_REG		0x54
+#define IPU8_IS_MMU_M0_L2_BLOCKNR_REG		0x94
+
+/* IS MMU Data WR ISOC */
+#define IPU8_IS_MMU_M1_OFFSET			0x273000
+#define IPU8_IS_MMU_M1_STREAM_NUM		16
+#define IPU8_IS_MMU_M1_L1_BLOCKNR_REG		0x54
+#define IPU8_IS_MMU_M1_L2_BLOCKNR_REG		0x94
+
+/* IS MMU UPIPE ISOC */
+#define IPU8_IS_MMU_UPIPE_OFFSET		0x274000
+#define IPU8_IS_MMU_UPIPE_STREAM_NUM		6
+#define IPU8_IS_MMU_UPIPE_L1_BLOCKNR_REG	0x54
+#define IPU8_IS_MMU_UPIPE_L2_BLOCKNR_REG	0x6c
+
+/* PS MMU FW RD */
+#define IPU8_PS_MMU_FW_RD_OFFSET		0x148000
+#define IPU8_PS_MMU_FW_RD_STREAM_NUM		12
+#define IPU8_PS_MMU_FW_RD_L1_BLOCKNR_REG	0x54
+#define IPU8_PS_MMU_FW_RD_L2_BLOCKNR_REG	0x84
+
+/* PS MMU FW WR */
+#define IPU8_PS_MMU_FW_WR_OFFSET		0x149000
+#define IPU8_PS_MMU_FW_WR_STREAM_NUM		8
+#define IPU8_PS_MMU_FW_WR_L1_BLOCKNR_REG	0x54
+#define IPU8_PS_MMU_FW_WR_L2_BLOCKNR_REG	0x74
+
+/* PS MMU FW Data RD VC0 */
+#define IPU8_PS_MMU_SRT_RD_OFFSET		0x14a000
+#define IPU8_PS_MMU_SRT_RD_STREAM_NUM		26
+#define IPU8_PS_MMU_SRT_RD_L1_BLOCKNR_REG	0x54
+#define IPU8_PS_MMU_SRT_RD_L2_BLOCKNR_REG	0xbc
+
+/* PS MMU FW Data WR VC0 */
+#define IPU8_PS_MMU_SRT_WR_OFFSET		0x14b000
+#define IPU8_PS_MMU_SRT_WR_STREAM_NUM		26
+#define IPU8_PS_MMU_SRT_WR_L1_BLOCKNR_REG	0x54
+#define IPU8_PS_MMU_SRT_WR_L2_BLOCKNR_REG	0xbc
+
+/* IS UAO UC RD */
+#define IPU8_IS_UAO_UC_RD_OFFSET		0x27a000
+#define IPU8_IS_UAO_UC_RD_PLANENUM		4
+
+/* IS UAO UC WR */
+#define IPU8_IS_UAO_UC_WR_OFFSET		0x27b000
+#define IPU8_IS_UAO_UC_WR_PLANENUM		4
+
+/* IS UAO M0 WR */
+#define IPU8_IS_UAO_M0_WR_OFFSET		0x27c000
+#define IPU8_IS_UAO_M0_WR_PLANENUM		16
+
+/* IS UAO M1 WR */
+#define IPU8_IS_UAO_M1_WR_OFFSET		0x27d000
+#define IPU8_IS_UAO_M1_WR_PLANENUM		16
+
+/* IS UAO UPIPE */
+#define IPU8_IS_UAO_UPIPE_OFFSET		0x27e000
+#define IPU8_IS_UAO_UPIPE_PLANENUM		6
+
+/* PS UAO FW RD */
+#define IPU8_PS_UAO_FW_RD_OFFSET		0x156000
+#define IPU8_PS_UAO_FW_RD_PLANENUM		12
+
+/* PS UAO FW WR */
+#define IPU8_PS_UAO_FW_WR_OFFSET		0x157000
+#define IPU8_PS_UAO_FW_WR_PLANENUM		8
+
+/* PS UAO SRT RD */
+#define IPU8_PS_UAO_SRT_RD_OFFSET		0x154000
+#define IPU8_PS_UAO_SRT_RD_PLANENUM		26
+
+/* PS UAO SRT WR */
+#define IPU8_PS_UAO_SRT_WR_OFFSET		0x155000
+#define IPU8_PS_UAO_SRT_WR_PLANENUM		26
+
+#define IPU8_IS_ZLX_UC_RD_OFFSET		0x275000
+#define IPU8_IS_ZLX_UC_WR_OFFSET		0x276000
+#define IPU8_IS_ZLX_M0_OFFSET			0x277000
+#define IPU8_IS_ZLX_M1_OFFSET			0x278000
+#define IPU8_IS_ZLX_UPIPE_OFFSET		0x279000
+#define IPU8_IS_ZLX_UC_RD_NUM			4
+#define IPU8_IS_ZLX_UC_WR_NUM			4
+#define IPU8_IS_ZLX_M0_NUM			16
+#define IPU8_IS_ZLX_M1_NUM			16
+#define IPU8_IS_ZLX_UPIPE_NUM			6
+
+#define IPU8_PS_ZLX_DATA_RD_OFFSET		0x14e000
+#define IPU8_PS_ZLX_DATA_WR_OFFSET		0x14f000
+#define IPU8_PS_ZLX_FW_RD_OFFSET		0x150000
+#define IPU8_PS_ZLX_FW_WR_OFFSET		0x151000
+#define IPU8_PS_ZLX_DATA_RD_NUM			26
+#define IPU8_PS_ZLX_DATA_WR_NUM			26
+#define IPU8_PS_ZLX_FW_RD_NUM			12
+#define IPU8_PS_ZLX_FW_WR_NUM			8
+
+#define MMU_REG_INVALIDATE_0			0x00
+#define MMU_REG_INVALIDATE_1			0x04
+#define MMU_REG_PAGE_TABLE_BASE_ADDR		0x08
+#define MMU_REG_USER_INFO_BITS			0x0c
+#define MMU_REG_AXI_REFILL_IF_ID		0x10
+#define MMU_REG_PW_EN_BITMAP			0x14
+#define MMU_REG_COLLAPSE_ENABLE_BITMAP		0x18
+#define MMU_REG_GENERAL_REG			0x1c
+#define MMU_REG_AT_SP_ARB_CFG			0x20
+#define MMU_REG_INVALIDATION_STATUS		0x24
+#define MMU_REG_IRQ_LEVEL_NO_PULSE		0x28
+#define MMU_REG_IRQ_MASK			0x2c
+#define MMU_REG_IRQ_ENABLE			0x30
+#define MMU_REG_IRQ_EDGE			0x34
+#define MMU_REG_IRQ_CLEAR			0x38
+#define MMU_REG_IRQ_CAUSE			0x3c
+#define MMU_REG_CG_CTRL_BITS			0x40
+#define MMU_REG_RD_FIFOS_STATUS			0x44
+#define MMU_REG_WR_FIFOS_STATUS			0x48
+#define MMU_REG_COMMON_FIFOS_STATUS		0x4c
+#define MMU_REG_FSM_STATUS			0x50
+
+#define ZLX_REG_AXI_POOL			0x0
+#define ZLX_REG_EN				0x20
+#define ZLX_REG_CONF				0x24
+#define ZLX_REG_CG_CTRL				0x900
+#define ZLX_REG_FORCE_BYPASS			0x904
+
+struct ipu7_mmu_info {
+	struct device *dev;
+
+	u32 *l1_pt;
+	u32 l1_pt_dma;
+	u32 **l2_pts;
+
+	u32 *dummy_l2_pt;
+	u32 dummy_l2_pteval;
+	void *dummy_page;
+	u32 dummy_page_pteval;
+
+	dma_addr_t aperture_start;
+	dma_addr_t aperture_end;
+	unsigned long pgsize_bitmap;
+
+	spinlock_t lock;	/* Serialize access to users */
+	struct ipu7_dma_mapping *dmap;
+};
+
+struct ipu7_mmu {
+	struct list_head node;
+
+	struct ipu7_mmu_hw *mmu_hw;
+	unsigned int nr_mmus;
+	unsigned int mmid;
+
+	phys_addr_t pgtbl;
+	struct device *dev;
+
+	struct ipu7_dma_mapping *dmap;
+	struct list_head vma_list;
+
+	struct page *trash_page;
+	dma_addr_t pci_trash_page; /* IOVA from PCI DMA services (parent) */
+	dma_addr_t iova_trash_page; /* IOVA for IPU child nodes to use */
+
+	bool ready;
+	spinlock_t ready_lock;	/* Serialize access to bool ready */
+
+	void (*tlb_invalidate)(struct ipu7_mmu *mmu);
+};
+
+struct ipu7_mmu *ipu7_mmu_init(struct device *dev,
+			       void __iomem *base, int mmid,
+			       const struct ipu7_hw_variants *hw);
+void ipu7_mmu_cleanup(struct ipu7_mmu *mmu);
+int ipu7_mmu_hw_init(struct ipu7_mmu *mmu);
+void ipu7_mmu_hw_cleanup(struct ipu7_mmu *mmu);
+int ipu7_mmu_map(struct ipu7_mmu_info *mmu_info, unsigned long iova,
+		 phys_addr_t paddr, size_t size);
+void ipu7_mmu_unmap(struct ipu7_mmu_info *mmu_info, unsigned long iova,
+		    size_t size);
+phys_addr_t ipu7_mmu_iova_to_phys(struct ipu7_mmu_info *mmu_info,
+				  dma_addr_t iova);
+#endif
-- 
2.34.1


