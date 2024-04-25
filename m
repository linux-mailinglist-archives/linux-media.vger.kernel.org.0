Return-Path: <linux-media+bounces-10146-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC4A8B2B4A
	for <lists+linux-media@lfdr.de>; Thu, 25 Apr 2024 23:48:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 361DE1C208DD
	for <lists+linux-media@lfdr.de>; Thu, 25 Apr 2024 21:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AF5E155A37;
	Thu, 25 Apr 2024 21:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RJYdTDk7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C97155A24
	for <linux-media@vger.kernel.org>; Thu, 25 Apr 2024 21:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714081722; cv=none; b=I71Nd9dI2ZYeoX/uquRhq8dsxzDrOz4Ck6BKPL7hRrhIeTz+CKgbZGXVVtS0/a6er9S8cGcTWUK5owz5Fwz/EwWWbI13Ftx6V8D5XRsKQrO8N03IYvldl4nxPlXZAZ/S0+osZArOmgGignyH58v25DPuWaWKQqCQun4n8aZ7MDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714081722; c=relaxed/simple;
	bh=7+NEIbdvMTw+YVo+wmnIbY+l5jcg93nPM6aMzFppkNY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YIUnDfi73a3zJd+hAgWEFNQ4ERHWiv9Ekm8jKDDk5Va8fS9+WUq/17052niOkV5Uyf2oq5tOQ+jddVi448taBrEVhtjtP0UaIwEEtNoUX24rqTJ/61k2fOfu4Tb+60SvIqiG4jbs28CdKn0kh7KiY6u+fWEZM8z9aKk5XZhKDfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RJYdTDk7; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714081719; x=1745617719;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7+NEIbdvMTw+YVo+wmnIbY+l5jcg93nPM6aMzFppkNY=;
  b=RJYdTDk7EAVBT1EnX3gp8YvgUNaGWqBH7OpYG0+g9OhEwzDMV9OHVn10
   00hGg+QW6v8BXDox7h7PcVDe3WHmF3OAHFnqrIeEmKqbQTtb2haAs5Bdg
   74HQRc360ncMOuY2K91E3MquXKrHS71r9pTW5ThNYfaQ/A5WYDufeqqQt
   8i0iVOkOhsm3SS6hLI5/Quahk6HYfX3UK82hxeP3vN90oAbMDDo5/JJ/c
   IYb5nZy9V8X+R123/AMlLyfjIW3PWrtAg6NCVQzUDuCb47f19R4pOQcY7
   mR9vvn2W1270Pl89jyRn62taMD4AWYA/SQax0a9mbCM30XWyo8EDj+rfG
   w==;
X-CSE-ConnectionGUID: SvbdJR6nRsalGHANEH8Ndw==
X-CSE-MsgGUID: sNpz/jeKQ9GJLVnA/pM20Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9655238"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="9655238"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 14:48:38 -0700
X-CSE-ConnectionGUID: 8tsBgHVeTqmCobg7nkXLgg==
X-CSE-MsgGUID: 8gV1o1WDSKiQh5MHHZNEpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="25181831"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 14:48:35 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 13CFC11FC19;
	Fri, 26 Apr 2024 00:48:29 +0300 (EEST)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@intel.com,
	laurent.pinchart@ideasonboard.com,
	andriy.shevchenko@linux.intel.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	claus.stovgaard@gmail.com,
	tomi.valkeinen@ideasonboard.com,
	tfiga@chromium.org,
	senozhatsky@chromium.org,
	andreaskleist@gmail.com,
	bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	hongju.wang@intel.com
Subject: [PATCH v5 07/18] media: intel/ipu6: add IPU6 DMA mapping API and MMU table
Date: Fri, 26 Apr 2024 00:47:58 +0300
Message-Id: <20240425214809.930227-8-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240425214809.930227-1-sakari.ailus@linux.intel.com>
References: <20240425214809.930227-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bingbu Cao <bingbu.cao@intel.com>

The Intel IPU6 has internal microcontrollers (scalar processor, SP) which
are used to execute the firmware. The SPs can access IPU internal memory
and system DRAM mapped to its an internal 32-bit virtual address space.

This patch adds a driver for the IPU MMU and a DMA mapping implementation
using the internal MMU. The system IOMMU may be used besides the IPU MMU.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-dma.c | 502 ++++++++++++++
 drivers/media/pci/intel/ipu6/ipu6-dma.h |  19 +
 drivers/media/pci/intel/ipu6/ipu6-mmu.c | 845 ++++++++++++++++++++++++
 drivers/media/pci/intel/ipu6/ipu6-mmu.h |  73 ++
 4 files changed, 1439 insertions(+)
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-dma.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-dma.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-mmu.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-mmu.h

diff --git a/drivers/media/pci/intel/ipu6/ipu6-dma.c b/drivers/media/pci/intel/ipu6/ipu6-dma.c
new file mode 100644
index 000000000000..92530a1cc90f
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu6-dma.c
@@ -0,0 +1,502 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2013--2024 Intel Corporation
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
+#include "ipu6.h"
+#include "ipu6-bus.h"
+#include "ipu6-dma.h"
+#include "ipu6-mmu.h"
+
+struct vm_info {
+	struct list_head list;
+	struct page **pages;
+	dma_addr_t ipu6_iova;
+	void *vaddr;
+	unsigned long size;
+};
+
+static struct vm_info *get_vm_info(struct ipu6_mmu *mmu, dma_addr_t iova)
+{
+	struct vm_info *info, *save;
+
+	list_for_each_entry_safe(info, save, &mmu->vma_list, list) {
+		if (iova >= info->ipu6_iova &&
+		    iova < (info->ipu6_iova + info->size))
+			return info;
+	}
+
+	return NULL;
+}
+
+static void __dma_clear_buffer(struct page *page, size_t size,
+			       unsigned long attrs)
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
+static struct page **__dma_alloc_buffer(struct device *dev, size_t size,
+					gfp_t gfp, unsigned long attrs)
+{
+	int count = PHYS_PFN(size);
+	int array_size = count * sizeof(struct page *);
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
+		__dma_clear_buffer(pages[i], PAGE_SIZE << order, attrs);
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
+static void __dma_free_buffer(struct device *dev, struct page **pages,
+			      size_t size, unsigned long attrs)
+{
+	int count = PHYS_PFN(size);
+	unsigned int i;
+
+	for (i = 0; i < count && pages[i]; i++) {
+		__dma_clear_buffer(pages[i], PAGE_SIZE, attrs);
+		__free_pages(pages[i], 0);
+	}
+
+	kvfree(pages);
+}
+
+static void ipu6_dma_sync_single_for_cpu(struct device *dev,
+					 dma_addr_t dma_handle,
+					 size_t size,
+					 enum dma_data_direction dir)
+{
+	void *vaddr;
+	u32 offset;
+	struct vm_info *info;
+	struct ipu6_mmu *mmu = to_ipu6_bus_device(dev)->mmu;
+
+	info = get_vm_info(mmu, dma_handle);
+	if (WARN_ON(!info))
+		return;
+
+	offset = dma_handle - info->ipu6_iova;
+	if (WARN_ON(size > (info->size - offset)))
+		return;
+
+	vaddr = info->vaddr + offset;
+	clflush_cache_range(vaddr, size);
+}
+
+static void ipu6_dma_sync_sg_for_cpu(struct device *dev,
+				     struct scatterlist *sglist,
+				     int nents, enum dma_data_direction dir)
+{
+	struct scatterlist *sg;
+	int i;
+
+	for_each_sg(sglist, sg, nents, i)
+		clflush_cache_range(page_to_virt(sg_page(sg)), sg->length);
+}
+
+static void *ipu6_dma_alloc(struct device *dev, size_t size,
+			    dma_addr_t *dma_handle, gfp_t gfp,
+			    unsigned long attrs)
+{
+	struct ipu6_mmu *mmu = to_ipu6_bus_device(dev)->mmu;
+	struct pci_dev *pdev = to_ipu6_bus_device(dev)->isp->pdev;
+	dma_addr_t pci_dma_addr, ipu6_iova;
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
+	pages = __dma_alloc_buffer(dev, size, gfp, attrs);
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
+		ret = ipu6_mmu_map(mmu->dmap->mmu_info,
+				   PFN_PHYS(iova->pfn_lo + i), pci_dma_addr,
+				   PAGE_SIZE);
+		if (ret) {
+			dev_err(dev, "ipu6_mmu_map for pci_dma[%d] %pad failed",
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
+	info->ipu6_iova = *dma_handle;
+	info->size = size;
+	list_add(&info->list, &mmu->vma_list);
+
+	return info->vaddr;
+
+out_unmap:
+	while (i--) {
+		ipu6_iova = PFN_PHYS(iova->pfn_lo + i);
+		pci_dma_addr = ipu6_mmu_iova_to_phys(mmu->dmap->mmu_info,
+						     ipu6_iova);
+		dma_unmap_page_attrs(&pdev->dev, pci_dma_addr, PAGE_SIZE,
+				     DMA_BIDIRECTIONAL, attrs);
+
+		ipu6_mmu_unmap(mmu->dmap->mmu_info, ipu6_iova, PAGE_SIZE);
+	}
+
+	__dma_free_buffer(dev, pages, size, attrs);
+
+out_free_iova:
+	__free_iova(&mmu->dmap->iovad, iova);
+out_kfree:
+	kfree(info);
+
+	return NULL;
+}
+
+static void ipu6_dma_free(struct device *dev, size_t size, void *vaddr,
+			  dma_addr_t dma_handle,
+			  unsigned long attrs)
+{
+	struct ipu6_mmu *mmu = to_ipu6_bus_device(dev)->mmu;
+	struct pci_dev *pdev = to_ipu6_bus_device(dev)->isp->pdev;
+	struct iova *iova = find_iova(&mmu->dmap->iovad, PHYS_PFN(dma_handle));
+	dma_addr_t pci_dma_addr, ipu6_iova;
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
+		ipu6_iova = PFN_PHYS(iova->pfn_lo + i);
+		pci_dma_addr = ipu6_mmu_iova_to_phys(mmu->dmap->mmu_info,
+						     ipu6_iova);
+		dma_unmap_page_attrs(&pdev->dev, pci_dma_addr, PAGE_SIZE,
+				     DMA_BIDIRECTIONAL, attrs);
+	}
+
+	ipu6_mmu_unmap(mmu->dmap->mmu_info, PFN_PHYS(iova->pfn_lo),
+		       PFN_PHYS(iova_size(iova)));
+
+	__dma_free_buffer(dev, pages, size, attrs);
+
+	mmu->tlb_invalidate(mmu);
+
+	__free_iova(&mmu->dmap->iovad, iova);
+
+	kfree(info);
+}
+
+static int ipu6_dma_mmap(struct device *dev, struct vm_area_struct *vma,
+			 void *addr, dma_addr_t iova, size_t size,
+			 unsigned long attrs)
+{
+	struct ipu6_mmu *mmu = to_ipu6_bus_device(dev)->mmu;
+	size_t count = PHYS_PFN(PAGE_ALIGN(size));
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
+static void ipu6_dma_unmap_sg(struct device *dev,
+			      struct scatterlist *sglist,
+			      int nents, enum dma_data_direction dir,
+			      unsigned long attrs)
+{
+	struct pci_dev *pdev = to_ipu6_bus_device(dev)->isp->pdev;
+	struct ipu6_mmu *mmu = to_ipu6_bus_device(dev)->mmu;
+	struct iova *iova = find_iova(&mmu->dmap->iovad,
+				      PHYS_PFN(sg_dma_address(sglist)));
+	int i, npages, count;
+	struct scatterlist *sg;
+	dma_addr_t pci_dma_addr;
+
+	if (!nents)
+		return;
+
+	if (WARN_ON(!iova))
+		return;
+
+	if ((attrs & DMA_ATTR_SKIP_CPU_SYNC) == 0)
+		ipu6_dma_sync_sg_for_cpu(dev, sglist, nents, DMA_BIDIRECTIONAL);
+
+	/* get the nents as orig_nents given by caller */
+	count = 0;
+	npages = iova_size(iova);
+	for_each_sg(sglist, sg, nents, i) {
+		if (sg_dma_len(sg) == 0 ||
+		    sg_dma_address(sg) == DMA_MAPPING_ERROR)
+			break;
+
+		npages -= PHYS_PFN(PAGE_ALIGN(sg_dma_len(sg)));
+		count++;
+		if (npages <= 0)
+			break;
+	}
+
+	/*
+	 * Before IPU6 mmu unmap, return the pci dma address back to sg
+	 * assume the nents is less than orig_nents as the least granule
+	 * is 1 SZ_4K page
+	 */
+	dev_dbg(dev, "trying to unmap concatenated %u ents\n", count);
+	for_each_sg(sglist, sg, count, i) {
+		dev_dbg(dev, "ipu unmap sg[%d] %pad\n", i, &sg_dma_address(sg));
+		pci_dma_addr = ipu6_mmu_iova_to_phys(mmu->dmap->mmu_info,
+						     sg_dma_address(sg));
+		dev_dbg(dev, "return pci_dma_addr %pad back to sg[%d]\n",
+			&pci_dma_addr, i);
+		sg_dma_address(sg) = pci_dma_addr;
+	}
+
+	dev_dbg(dev, "ipu6_mmu_unmap low pfn %lu high pfn %lu\n",
+		iova->pfn_lo, iova->pfn_hi);
+	ipu6_mmu_unmap(mmu->dmap->mmu_info, PFN_PHYS(iova->pfn_lo),
+		       PFN_PHYS(iova_size(iova)));
+
+	mmu->tlb_invalidate(mmu);
+
+	dma_unmap_sg_attrs(&pdev->dev, sglist, nents, dir, attrs);
+
+	__free_iova(&mmu->dmap->iovad, iova);
+}
+
+static int ipu6_dma_map_sg(struct device *dev, struct scatterlist *sglist,
+			   int nents, enum dma_data_direction dir,
+			   unsigned long attrs)
+{
+	struct ipu6_mmu *mmu = to_ipu6_bus_device(dev)->mmu;
+	struct pci_dev *pdev = to_ipu6_bus_device(dev)->isp->pdev;
+	struct scatterlist *sg;
+	struct iova *iova;
+	size_t npages = 0;
+	unsigned long iova_addr;
+	int i, count;
+
+	for_each_sg(sglist, sg, nents, i) {
+		if (sg->offset) {
+			dev_err(dev, "Unsupported non-zero sg[%d].offset %x\n",
+				i, sg->offset);
+			return -EFAULT;
+		}
+	}
+
+	dev_dbg(dev, "pci_dma_map_sg trying to map %d ents\n", nents);
+	count  = dma_map_sg_attrs(&pdev->dev, sglist, nents, dir, attrs);
+	if (count <= 0) {
+		dev_err(dev, "pci_dma_map_sg %d ents failed\n", nents);
+		return 0;
+	}
+
+	dev_dbg(dev, "pci_dma_map_sg %d ents mapped\n", count);
+
+	for_each_sg(sglist, sg, count, i)
+		npages += PHYS_PFN(PAGE_ALIGN(sg_dma_len(sg)));
+
+	iova = alloc_iova(&mmu->dmap->iovad, npages,
+			  PHYS_PFN(dma_get_mask(dev)), 0);
+	if (!iova)
+		return 0;
+
+	dev_dbg(dev, "dmamap: iova low pfn %lu, high pfn %lu\n", iova->pfn_lo,
+		iova->pfn_hi);
+
+	iova_addr = iova->pfn_lo;
+	for_each_sg(sglist, sg, count, i) {
+		int ret;
+
+		dev_dbg(dev, "mapping entry %d: iova 0x%llx phy %pad size %d\n",
+			i, PFN_PHYS(iova_addr), &sg_dma_address(sg),
+			sg_dma_len(sg));
+
+		ret = ipu6_mmu_map(mmu->dmap->mmu_info, PFN_PHYS(iova_addr),
+				   sg_dma_address(sg),
+				   PAGE_ALIGN(sg_dma_len(sg)));
+		if (ret)
+			goto out_fail;
+
+		sg_dma_address(sg) = PFN_PHYS(iova_addr);
+
+		iova_addr += PHYS_PFN(PAGE_ALIGN(sg_dma_len(sg)));
+	}
+
+	if ((attrs & DMA_ATTR_SKIP_CPU_SYNC) == 0)
+		ipu6_dma_sync_sg_for_cpu(dev, sglist, nents, DMA_BIDIRECTIONAL);
+
+	return count;
+
+out_fail:
+	ipu6_dma_unmap_sg(dev, sglist, i, dir, attrs);
+
+	return 0;
+}
+
+/*
+ * Create scatter-list for the already allocated DMA buffer
+ */
+static int ipu6_dma_get_sgtable(struct device *dev, struct sg_table *sgt,
+				void *cpu_addr, dma_addr_t handle, size_t size,
+				unsigned long attrs)
+{
+	struct ipu6_mmu *mmu = to_ipu6_bus_device(dev)->mmu;
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
+	n_pages = PHYS_PFN(PAGE_ALIGN(size));
+
+	ret = sg_alloc_table_from_pages(sgt, info->pages, n_pages, 0, size,
+					GFP_KERNEL);
+	if (ret)
+		dev_warn(dev, "IPU6 get sgt table failed\n");
+
+	return ret;
+}
+
+const struct dma_map_ops ipu6_dma_ops = {
+	.alloc = ipu6_dma_alloc,
+	.free = ipu6_dma_free,
+	.mmap = ipu6_dma_mmap,
+	.map_sg = ipu6_dma_map_sg,
+	.unmap_sg = ipu6_dma_unmap_sg,
+	.sync_single_for_cpu = ipu6_dma_sync_single_for_cpu,
+	.sync_single_for_device = ipu6_dma_sync_single_for_cpu,
+	.sync_sg_for_cpu = ipu6_dma_sync_sg_for_cpu,
+	.sync_sg_for_device = ipu6_dma_sync_sg_for_cpu,
+	.get_sgtable = ipu6_dma_get_sgtable,
+};
diff --git a/drivers/media/pci/intel/ipu6/ipu6-dma.h b/drivers/media/pci/intel/ipu6/ipu6-dma.h
new file mode 100644
index 000000000000..847ea5b7c925
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu6-dma.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (C) 2013--2024 Intel Corporation */
+
+#ifndef IPU6_DMA_H
+#define IPU6_DMA_H
+
+#include <linux/dma-map-ops.h>
+#include <linux/iova.h>
+
+struct ipu6_mmu_info;
+
+struct ipu6_dma_mapping {
+	struct ipu6_mmu_info *mmu_info;
+	struct iova_domain iovad;
+};
+
+extern const struct dma_map_ops ipu6_dma_ops;
+
+#endif /* IPU6_DMA_H */
diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu.c b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
new file mode 100644
index 000000000000..98a4bf9ca267
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
@@ -0,0 +1,845 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2013--2024 Intel Corporation
+ */
+#include <asm/barrier.h>
+
+#include <linux/align.h>
+#include <linux/atomic.h>
+#include <linux/bitops.h>
+#include <linux/bits.h>
+#include <linux/bug.h>
+#include <linux/cacheflush.h>
+#include <linux/dma-mapping.h>
+#include <linux/err.h>
+#include <linux/gfp.h>
+#include <linux/io.h>
+#include <linux/iova.h>
+#include <linux/math.h>
+#include <linux/minmax.h>
+#include <linux/mm.h>
+#include <linux/pfn.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+
+#include "ipu6.h"
+#include "ipu6-dma.h"
+#include "ipu6-mmu.h"
+#include "ipu6-platform-regs.h"
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
+#define ISP_L1PT_PTES           1024
+#define ISP_L2PT_PTES           1024
+
+#define ISP_PADDR_SHIFT		12
+
+#define REG_TLB_INVALIDATE	0x0000
+
+#define REG_L1_PHYS		0x0004	/* 27-bit pfn */
+#define REG_INFO		0x0008
+
+#define TBL_PHYS_ADDR(a)	((phys_addr_t)(a) << ISP_PADDR_SHIFT)
+
+static void tlb_invalidate(struct ipu6_mmu *mmu)
+{
+	unsigned long flags;
+	unsigned int i;
+
+	spin_lock_irqsave(&mmu->ready_lock, flags);
+	if (!mmu->ready) {
+		spin_unlock_irqrestore(&mmu->ready_lock, flags);
+		return;
+	}
+
+	for (i = 0; i < mmu->nr_mmus; i++) {
+		/*
+		 * To avoid the HW bug induced dead lock in some of the IPU6
+		 * MMUs on successive invalidate calls, we need to first do a
+		 * read to the page table base before writing the invalidate
+		 * register. MMUs which need to implement this WA, will have
+		 * the insert_read_before_invalidate flags set as true.
+		 * Disregard the return value of the read.
+		 */
+		if (mmu->mmu_hw[i].insert_read_before_invalidate)
+			readl(mmu->mmu_hw[i].base + REG_L1_PHYS);
+
+		writel(0xffffffff, mmu->mmu_hw[i].base +
+		       REG_TLB_INVALIDATE);
+		/*
+		 * The TLB invalidation is a "single cycle" (IOMMU clock cycles)
+		 * When the actual MMIO write reaches the IPU6 TLB Invalidate
+		 * register, wmb() will force the TLB invalidate out if the CPU
+		 * attempts to update the IOMMU page table (or sooner).
+		 */
+		wmb();
+	}
+	spin_unlock_irqrestore(&mmu->ready_lock, flags);
+}
+
+#ifdef DEBUG
+static void page_table_dump(struct ipu6_mmu_info *mmu_info)
+{
+	u32 l1_idx;
+
+	dev_dbg(mmu_info->dev, "begin IOMMU page table dump\n");
+
+	for (l1_idx = 0; l1_idx < ISP_L1PT_PTES; l1_idx++) {
+		u32 l2_idx;
+		u32 iova = (phys_addr_t)l1_idx << ISP_L1PT_SHIFT;
+
+		if (mmu_info->l1_pt[l1_idx] == mmu_info->dummy_l2_pteval)
+			continue;
+		dev_dbg(mmu_info->dev,
+			"l1 entry %u; iovas 0x%8.8x-0x%8.8x, at %pa\n",
+			l1_idx, iova, iova + ISP_PAGE_SIZE,
+			TBL_PHYS_ADDR(mmu_info->l1_pt[l1_idx]));
+
+		for (l2_idx = 0; l2_idx < ISP_L2PT_PTES; l2_idx++) {
+			u32 *l2_pt = mmu_info->l2_pts[l1_idx];
+			u32 iova2 = iova + (l2_idx << ISP_L2PT_SHIFT);
+
+			if (l2_pt[l2_idx] == mmu_info->dummy_page_pteval)
+				continue;
+
+			dev_dbg(mmu_info->dev,
+				"\tl2 entry %u; iova 0x%8.8x, phys %pa\n",
+				l2_idx, iova2,
+				TBL_PHYS_ADDR(l2_pt[l2_idx]));
+		}
+	}
+
+	dev_dbg(mmu_info->dev, "end IOMMU page table dump\n");
+}
+#endif /* DEBUG */
+
+static dma_addr_t map_single(struct ipu6_mmu_info *mmu_info, void *ptr)
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
+static int get_dummy_page(struct ipu6_mmu_info *mmu_info)
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
+static void free_dummy_page(struct ipu6_mmu_info *mmu_info)
+{
+	dma_unmap_single(mmu_info->dev,
+			 TBL_PHYS_ADDR(mmu_info->dummy_page_pteval),
+			 PAGE_SIZE, DMA_BIDIRECTIONAL);
+	free_page((unsigned long)mmu_info->dummy_page);
+}
+
+static int alloc_dummy_l2_pt(struct ipu6_mmu_info *mmu_info)
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
+static void free_dummy_l2_pt(struct ipu6_mmu_info *mmu_info)
+{
+	dma_unmap_single(mmu_info->dev,
+			 TBL_PHYS_ADDR(mmu_info->dummy_l2_pteval),
+			 PAGE_SIZE, DMA_BIDIRECTIONAL);
+	free_page((unsigned long)mmu_info->dummy_l2_pt);
+}
+
+static u32 *alloc_l1_pt(struct ipu6_mmu_info *mmu_info)
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
+	dev_dbg(mmu_info->dev, "l1 pt %p mapped at %llx\n", pt, dma);
+
+	return pt;
+
+err_free_page:
+	free_page((unsigned long)pt);
+	return NULL;
+}
+
+static u32 *alloc_l2_pt(struct ipu6_mmu_info *mmu_info)
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
+static int l2_map(struct ipu6_mmu_info *mmu_info, unsigned long iova,
+		  phys_addr_t paddr, size_t size)
+{
+	u32 l1_idx = iova >> ISP_L1PT_SHIFT;
+	u32 iova_start = iova;
+	u32 *l2_pt, *l2_virt;
+	unsigned int l2_idx;
+	unsigned long flags;
+	dma_addr_t dma;
+	u32 l1_entry;
+
+	dev_dbg(mmu_info->dev,
+		"mapping l2 page table for l1 index %u (iova %8.8x)\n",
+		l1_idx, (u32)iova);
+
+	spin_lock_irqsave(&mmu_info->lock, flags);
+	l1_entry = mmu_info->l1_pt[l1_idx];
+	if (l1_entry == mmu_info->dummy_l2_pteval) {
+		l2_virt = mmu_info->l2_pts[l1_idx];
+		if (likely(!l2_virt)) {
+			l2_virt = alloc_l2_pt(mmu_info);
+			if (!l2_virt) {
+				spin_unlock_irqrestore(&mmu_info->lock, flags);
+				return -ENOMEM;
+			}
+		}
+
+		dma = map_single(mmu_info, l2_virt);
+		if (!dma) {
+			dev_err(mmu_info->dev, "Failed to map l2pt page\n");
+			free_page((unsigned long)l2_virt);
+			spin_unlock_irqrestore(&mmu_info->lock, flags);
+			return -EINVAL;
+		}
+
+		l1_entry = dma >> ISP_PADDR_SHIFT;
+
+		dev_dbg(mmu_info->dev, "page for l1_idx %u %p allocated\n",
+			l1_idx, l2_virt);
+		mmu_info->l1_pt[l1_idx] = l1_entry;
+		mmu_info->l2_pts[l1_idx] = l2_virt;
+		clflush_cache_range((void *)&mmu_info->l1_pt[l1_idx],
+				    sizeof(mmu_info->l1_pt[l1_idx]));
+	}
+
+	l2_pt = mmu_info->l2_pts[l1_idx];
+
+	dev_dbg(mmu_info->dev, "l2_pt at %p with dma 0x%x\n", l2_pt, l1_entry);
+
+	paddr = ALIGN(paddr, ISP_PAGE_SIZE);
+
+	l2_idx = (iova_start & ISP_L2PT_MASK) >> ISP_L2PT_SHIFT;
+
+	dev_dbg(mmu_info->dev, "l2_idx %u, phys 0x%8.8x\n", l2_idx,
+		l2_pt[l2_idx]);
+	if (l2_pt[l2_idx] != mmu_info->dummy_page_pteval) {
+		spin_unlock_irqrestore(&mmu_info->lock, flags);
+		return -EINVAL;
+	}
+
+	l2_pt[l2_idx] = paddr >> ISP_PADDR_SHIFT;
+
+	clflush_cache_range((void *)&l2_pt[l2_idx], sizeof(l2_pt[l2_idx]));
+	spin_unlock_irqrestore(&mmu_info->lock, flags);
+
+	dev_dbg(mmu_info->dev, "l2 index %u mapped as 0x%8.8x\n", l2_idx,
+		l2_pt[l2_idx]);
+
+	return 0;
+}
+
+static int __ipu6_mmu_map(struct ipu6_mmu_info *mmu_info, unsigned long iova,
+			  phys_addr_t paddr, size_t size)
+{
+	u32 iova_start = round_down(iova, ISP_PAGE_SIZE);
+	u32 iova_end = ALIGN(iova + size, ISP_PAGE_SIZE);
+
+	dev_dbg(mmu_info->dev,
+		"mapping iova 0x%8.8x--0x%8.8x, size %zu at paddr 0x%10.10llx\n",
+		iova_start, iova_end, size, paddr);
+
+	return l2_map(mmu_info, iova_start, paddr, size);
+}
+
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
+static size_t __ipu6_mmu_unmap(struct ipu6_mmu_info *mmu_info,
+			       unsigned long iova, size_t size)
+{
+	return l2_unmap(mmu_info, iova, 0, size);
+}
+
+static int allocate_trash_buffer(struct ipu6_mmu *mmu)
+{
+	unsigned int n_pages = PHYS_PFN(PAGE_ALIGN(IPU6_MMUV2_TRASH_RANGE));
+	struct iova *iova;
+	unsigned int i;
+	dma_addr_t dma;
+	unsigned long iova_addr;
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
+		ret = ipu6_mmu_map(mmu->dmap->mmu_info, PFN_PHYS(iova_addr),
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
+	ipu6_mmu_unmap(mmu->dmap->mmu_info, PFN_PHYS(iova->pfn_lo),
+		       PFN_PHYS(iova_size(iova)));
+	dma_unmap_page(mmu->dmap->mmu_info->dev, mmu->pci_trash_page,
+		       PAGE_SIZE, DMA_BIDIRECTIONAL);
+out_free_iova:
+	__free_iova(&mmu->dmap->iovad, iova);
+	return ret;
+}
+
+int ipu6_mmu_hw_init(struct ipu6_mmu *mmu)
+{
+	struct ipu6_mmu_info *mmu_info;
+	unsigned long flags;
+	unsigned int i;
+
+	mmu_info = mmu->dmap->mmu_info;
+
+	/* Initialise the each MMU HW block */
+	for (i = 0; i < mmu->nr_mmus; i++) {
+		struct ipu6_mmu_hw *mmu_hw = &mmu->mmu_hw[i];
+		unsigned int j;
+		u16 block_addr;
+
+		/* Write page table address per MMU */
+		writel((phys_addr_t)mmu_info->l1_pt_dma,
+		       mmu->mmu_hw[i].base + REG_L1_PHYS);
+
+		/* Set info bits per MMU */
+		writel(mmu->mmu_hw[i].info_bits,
+		       mmu->mmu_hw[i].base + REG_INFO);
+
+		/* Configure MMU TLB stream configuration for L1 */
+		for (j = 0, block_addr = 0; j < mmu_hw->nr_l1streams;
+		     block_addr += mmu->mmu_hw[i].l1_block_sz[j], j++) {
+			if (block_addr > IPU6_MAX_LI_BLOCK_ADDR) {
+				dev_err(mmu->dev, "invalid L1 configuration\n");
+				return -EINVAL;
+			}
+
+			/* Write block start address for each streams */
+			writel(block_addr, mmu_hw->base +
+			       mmu_hw->l1_stream_id_reg_offset + 4 * j);
+		}
+
+		/* Configure MMU TLB stream configuration for L2 */
+		for (j = 0, block_addr = 0; j < mmu_hw->nr_l2streams;
+		     block_addr += mmu->mmu_hw[i].l2_block_sz[j], j++) {
+			if (block_addr > IPU6_MAX_L2_BLOCK_ADDR) {
+				dev_err(mmu->dev, "invalid L2 configuration\n");
+				return -EINVAL;
+			}
+
+			writel(block_addr, mmu_hw->base +
+			       mmu_hw->l2_stream_id_reg_offset + 4 * j);
+		}
+	}
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
+EXPORT_SYMBOL_NS_GPL(ipu6_mmu_hw_init, INTEL_IPU6);
+
+static struct ipu6_mmu_info *ipu6_mmu_alloc(struct ipu6_device *isp)
+{
+	struct ipu6_mmu_info *mmu_info;
+	int ret;
+
+	mmu_info = kzalloc(sizeof(*mmu_info), GFP_KERNEL);
+	if (!mmu_info)
+		return NULL;
+
+	mmu_info->aperture_start = 0;
+	mmu_info->aperture_end = DMA_BIT_MASK(isp->secure_mode ?
+					      IPU6_MMU_ADDR_BITS :
+					      IPU6_MMU_ADDR_BITS_NON_SECURE);
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
+void ipu6_mmu_hw_cleanup(struct ipu6_mmu *mmu)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&mmu->ready_lock, flags);
+	mmu->ready = false;
+	spin_unlock_irqrestore(&mmu->ready_lock, flags);
+}
+EXPORT_SYMBOL_NS_GPL(ipu6_mmu_hw_cleanup, INTEL_IPU6);
+
+static struct ipu6_dma_mapping *alloc_dma_mapping(struct ipu6_device *isp)
+{
+	struct ipu6_dma_mapping *dmap;
+
+	dmap = kzalloc(sizeof(*dmap), GFP_KERNEL);
+	if (!dmap)
+		return NULL;
+
+	dmap->mmu_info = ipu6_mmu_alloc(isp);
+	if (!dmap->mmu_info) {
+		kfree(dmap);
+		return NULL;
+	}
+
+	init_iova_domain(&dmap->iovad, SZ_4K, 1);
+	dmap->mmu_info->dmap = dmap;
+
+	dev_dbg(&isp->pdev->dev, "alloc mapping\n");
+
+	iova_cache_get();
+
+	return dmap;
+}
+
+phys_addr_t ipu6_mmu_iova_to_phys(struct ipu6_mmu_info *mmu_info,
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
+static size_t ipu6_mmu_pgsize(unsigned long pgsize_bitmap,
+			      unsigned long addr_merge, size_t size)
+{
+	unsigned int pgsize_idx;
+	size_t pgsize;
+
+	/* Max page size that still fits into 'size' */
+	pgsize_idx = __fls(size);
+
+	if (likely(addr_merge)) {
+		/* Max page size allowed by address */
+		unsigned int align_pgsize_idx = __ffs(addr_merge);
+
+		pgsize_idx = min(pgsize_idx, align_pgsize_idx);
+	}
+
+	pgsize = (1UL << (pgsize_idx + 1)) - 1;
+	pgsize &= pgsize_bitmap;
+
+	WARN_ON(!pgsize);
+
+	/* pick the biggest page */
+	pgsize_idx = __fls(pgsize);
+	pgsize = 1UL << pgsize_idx;
+
+	return pgsize;
+}
+
+size_t ipu6_mmu_unmap(struct ipu6_mmu_info *mmu_info, unsigned long iova,
+		      size_t size)
+{
+	size_t unmapped_page, unmapped = 0;
+	unsigned int min_pagesz;
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
+		dev_err(NULL, "unaligned: iova 0x%lx size 0x%zx min_pagesz 0x%x\n",
+			iova, size, min_pagesz);
+		return -EINVAL;
+	}
+
+	/*
+	 * Keep iterating until we either unmap 'size' bytes (or more)
+	 * or we hit an area that isn't mapped.
+	 */
+	while (unmapped < size) {
+		size_t pgsize = ipu6_mmu_pgsize(mmu_info->pgsize_bitmap,
+						iova, size - unmapped);
+
+		unmapped_page = __ipu6_mmu_unmap(mmu_info, iova, pgsize);
+		if (!unmapped_page)
+			break;
+
+		dev_dbg(mmu_info->dev, "unmapped: iova 0x%lx size 0x%zx\n",
+			iova, unmapped_page);
+
+		iova += unmapped_page;
+		unmapped += unmapped_page;
+	}
+
+	return unmapped;
+}
+
+int ipu6_mmu_map(struct ipu6_mmu_info *mmu_info, unsigned long iova,
+		 phys_addr_t paddr, size_t size)
+{
+	unsigned long orig_iova = iova;
+	unsigned int min_pagesz;
+	size_t orig_size = size;
+	int ret = 0;
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
+	while (size) {
+		size_t pgsize = ipu6_mmu_pgsize(mmu_info->pgsize_bitmap,
+						iova | paddr, size);
+
+		dev_dbg(mmu_info->dev,
+			"mapping: iova 0x%lx pa %pa pgsize 0x%zx\n",
+			iova, &paddr, pgsize);
+
+		ret = __ipu6_mmu_map(mmu_info, iova, paddr, pgsize);
+		if (ret)
+			break;
+
+		iova += pgsize;
+		paddr += pgsize;
+		size -= pgsize;
+	}
+
+	/* unroll mapping in case something went wrong */
+	if (ret)
+		ipu6_mmu_unmap(mmu_info, orig_iova, orig_size - size);
+
+	return ret;
+}
+
+static void ipu6_mmu_destroy(struct ipu6_mmu *mmu)
+{
+	struct ipu6_dma_mapping *dmap = mmu->dmap;
+	struct ipu6_mmu_info *mmu_info = dmap->mmu_info;
+	struct iova *iova;
+	u32 l1_idx;
+
+	if (mmu->iova_trash_page) {
+		iova = find_iova(&dmap->iovad, PHYS_PFN(mmu->iova_trash_page));
+		if (iova) {
+			/* unmap and free the trash buffer iova */
+			ipu6_mmu_unmap(mmu_info, PFN_PHYS(iova->pfn_lo),
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
+struct ipu6_mmu *ipu6_mmu_init(struct device *dev,
+			       void __iomem *base, int mmid,
+			       const struct ipu6_hw_variants *hw)
+{
+	struct ipu6_device *isp = pci_get_drvdata(to_pci_dev(dev));
+	struct ipu6_mmu_pdata *pdata;
+	struct ipu6_mmu *mmu;
+	unsigned int i;
+
+	if (hw->nr_mmus > IPU6_MMU_MAX_DEVICES)
+		return ERR_PTR(-EINVAL);
+
+	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		return ERR_PTR(-ENOMEM);
+
+	for (i = 0; i < hw->nr_mmus; i++) {
+		struct ipu6_mmu_hw *pdata_mmu = &pdata->mmu_hw[i];
+		const struct ipu6_mmu_hw *src_mmu = &hw->mmu_hw[i];
+
+		if (src_mmu->nr_l1streams > IPU6_MMU_MAX_TLB_L1_STREAMS ||
+		    src_mmu->nr_l2streams > IPU6_MMU_MAX_TLB_L2_STREAMS)
+			return ERR_PTR(-EINVAL);
+
+		*pdata_mmu = *src_mmu;
+		pdata_mmu->base = base + src_mmu->offset;
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
+void ipu6_mmu_cleanup(struct ipu6_mmu *mmu)
+{
+	struct ipu6_dma_mapping *dmap = mmu->dmap;
+
+	ipu6_mmu_destroy(mmu);
+	mmu->dmap = NULL;
+	iova_cache_put();
+	put_iova_domain(&dmap->iovad);
+	kfree(dmap);
+}
diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu.h b/drivers/media/pci/intel/ipu6/ipu6-mmu.h
new file mode 100644
index 000000000000..21cdb0f146eb
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu6-mmu.h
@@ -0,0 +1,73 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (C) 2013--2024 Intel Corporation */
+
+#ifndef IPU6_MMU_H
+#define IPU6_MMU_H
+
+#define ISYS_MMID 1
+#define PSYS_MMID 0
+
+#include <linux/list.h>
+#include <linux/spinlock_types.h>
+#include <linux/types.h>
+
+struct device;
+struct page;
+struct ipu6_hw_variants;
+
+struct ipu6_mmu_info {
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
+	struct ipu6_dma_mapping *dmap;
+};
+
+struct ipu6_mmu {
+	struct list_head node;
+
+	struct ipu6_mmu_hw *mmu_hw;
+	unsigned int nr_mmus;
+	unsigned int mmid;
+
+	phys_addr_t pgtbl;
+	struct device *dev;
+
+	struct ipu6_dma_mapping *dmap;
+	struct list_head vma_list;
+
+	struct page *trash_page;
+	dma_addr_t pci_trash_page; /* IOVA from PCI DMA services (parent) */
+	dma_addr_t iova_trash_page; /* IOVA for IPU6 child nodes to use */
+
+	bool ready;
+	spinlock_t ready_lock;	/* Serialize access to bool ready */
+
+	void (*tlb_invalidate)(struct ipu6_mmu *mmu);
+};
+
+struct ipu6_mmu *ipu6_mmu_init(struct device *dev,
+			       void __iomem *base, int mmid,
+			       const struct ipu6_hw_variants *hw);
+void ipu6_mmu_cleanup(struct ipu6_mmu *mmu);
+int ipu6_mmu_hw_init(struct ipu6_mmu *mmu);
+void ipu6_mmu_hw_cleanup(struct ipu6_mmu *mmu);
+int ipu6_mmu_map(struct ipu6_mmu_info *mmu_info, unsigned long iova,
+		 phys_addr_t paddr, size_t size);
+size_t ipu6_mmu_unmap(struct ipu6_mmu_info *mmu_info, unsigned long iova,
+		      size_t size);
+phys_addr_t ipu6_mmu_iova_to_phys(struct ipu6_mmu_info *mmu_info,
+				  dma_addr_t iova);
+#endif
-- 
2.39.2


