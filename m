Return-Path: <linux-media+bounces-45618-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EE346C0BCAE
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 05:49:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B0F23BC305
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 04:48:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8584F2D5C8E;
	Mon, 27 Oct 2025 04:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HvssLFmS"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227D12D5C91
	for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 04:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761540525; cv=none; b=RUPibYyknUKl+WTNHDMSX0efiN91Tbx26Syh950XQTRIm5Hkr5PMH5w5FyKy8aDRJ7xGHoamkfKcLaUksCG6MLdTJ6ScDvoybqJwIv9Ems6V3tnk5pC9WfNKSlF7w+18bV68FZL+Qz5jt60rcH/+AHcgKxLqKW8dY3hTv1n4zUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761540525; c=relaxed/simple;
	bh=I7H7AuRKEC2QkrkaG+3cE8TaPNLxAKSidq6xlMRC1Vs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EO+jkFRLIyGE/NbB5ADwKZRcCku7jN5B5UeniRigJuhrBXIMJegV5Pbk7cIhNXGROJVi6bzdhncWjv7jjbiYnWOoBpRIuP7JKEqxNNHgh6NAJ9CHTGYxPGzlKLXbOy47/Gc/OK2a/L6twiV9AvgBoHWV4z1nIXB+FfFIO4B3isI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HvssLFmS; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761540523; x=1793076523;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=I7H7AuRKEC2QkrkaG+3cE8TaPNLxAKSidq6xlMRC1Vs=;
  b=HvssLFmSi0M5eAQl6xcbZXY4nW3sYfUV8gpXI9+zveOaDWSp6Ze+7u7r
   cSrQs51Z7w3oyeTuTnXbrbKfgjz9vnJbS7y9hzlpr0Fua5qY1OxdO8spc
   DKNVtFWcBaDz1zrFapQpr3wpAEoH+fmnAi8/jFu1Jw0hddrGuIPgh10+d
   SiWt9Jw971Qt1WJ37ch8QxYXDuBgCh5I22GLjAj+pQ6BSmIkieQaroJZZ
   INO+wYMbS+Ctx18OMjVEl4rGIysjIj0ouvpfC033YaUTkVVbfd0hCTeSd
   HRUqxr7UcGSTjgpIAyiZc11JFrZwxpLYwl4v2E42R6yCmnyg1jAui8FUA
   A==;
X-CSE-ConnectionGUID: fq1CQ+CLRoOcs/2VAdqJCw==
X-CSE-MsgGUID: EgkeDwIjTZWV6kQ5kuLRzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63521072"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="63521072"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 21:48:37 -0700
X-CSE-ConnectionGUID: 20p6lxu5QUO4VMxbLb0jpQ==
X-CSE-MsgGUID: yGlKQ65YSqCwEnkFyjnR/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="188992996"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 21:48:38 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [RFC v2 7/8] drm/xe/bo: Create new dma_addr array for dmabuf BOs associated with VFs
Date: Sun, 26 Oct 2025 21:44:19 -0700
Message-ID: <20251027044712.1676175-8-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251027044712.1676175-1-vivek.kasireddy@intel.com>
References: <20251027044712.1676175-1-vivek.kasireddy@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

For BOs of type ttm_bo_type_sg, that are backed by PCI BAR addresses
associated with a VF, we need to adjust and translate these addresses
to VRAM addresses to make the BOs usable by the PF. Otherwise, the
BOs (i.e, PCI BAR addresses) are only accessible by the CPU and not
by the GPU.

In order to do the above, we first need to identify if the addresses
associated with an imported BO (type ttm_bo_type_sg) belong to System
RAM or a VF or other PCI devices. After we confirm that they belong to
a VF, we convert the BAR addresses to DPAs and create a new dma_addr
array (of type drm_pagemap_dma_addr) and populate it with the new
addresses along with the segment sizes.

Note that, all the above is only done if we are able to map the
dmabuf via the IOV interconnect. If not, we fallback to the legacy
mapping route using the sg table.

v2:
- Use dma_addr array instead of sg table to store translated addresses
  (Matt)

v3:
- Remove the usage of iommu_iova_to_phys() as the imported BO would no
  longer contain IOVAs and would instead have BAR addresses.

v4:
- Take a reference on the VF's backing object in VRAM (Michal)
- Create a new type for storing dma data

v5:
- Replace DRM_INTERCONNECT_DRIVER with XE_INTERCONNECT_VRAM during
  address encoding (Matt, Thomas)
- Drop is_devmem_external and instead rely on bo->dma_data.dma_addr
  to check for imported VRAM BOs (Matt)
- Add a check to prevent malicious VF from accessing other VF's
  addresses (Thomas)
- Fallback to legacy (map_dma_buf) mapping method if mapping via
  interconnect fails
- Pass XE_PAGE_SIZE as the last parameter to xe_bo_addr (Matt)

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c             | 162 +++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_bo_types.h       |   6 +
 drivers/gpu/drm/xe/xe_sriov_pf_types.h |  19 +++
 3 files changed, 175 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 4410e28dee54..49fc8f66e8aa 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -21,11 +21,13 @@
 
 #include <trace/events/gpu_mem.h>
 
+#include "regs/xe_bars.h"
 #include "xe_device.h"
 #include "xe_dma_buf.h"
 #include "xe_drm_client.h"
 #include "xe_ggtt.h"
 #include "xe_gt.h"
+#include "xe_gt_sriov_pf_config.h"
 #include "xe_map.h"
 #include "xe_migrate.h"
 #include "xe_pm.h"
@@ -34,6 +36,7 @@
 #include "xe_res_cursor.h"
 #include "xe_shrinker.h"
 #include "xe_sriov_vf_ccs.h"
+#include "xe_sriov_pf_helpers.h"
 #include "xe_trace_bo.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_vm.h"
@@ -346,6 +349,7 @@ struct xe_ttm_tt {
 	struct ttm_tt ttm;
 	struct sg_table sgt;
 	struct sg_table *sg;
+	struct dma_buf_ranges *ranges;
 	/** @purgeable: Whether the content of the pages of @ttm is purgeable. */
 	bool purgeable;
 };
@@ -679,6 +683,103 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
 	return ret;
 }
 
+static struct pci_dev *xe_find_vf_dev(struct xe_device *xe,
+				      phys_addr_t phys)
+{
+	struct pci_dev *pdev, *pf_pdev = to_pci_dev(xe->drm.dev);
+	resource_size_t io_start, io_size;
+
+	list_for_each_entry(pdev, &pf_pdev->bus->devices, bus_list) {
+		if (pdev->is_physfn)
+			continue;
+
+		io_start = pci_resource_start(pdev, LMEM_BAR);
+		io_size = pci_resource_len(pdev, LMEM_BAR);
+
+		if (phys >= io_start &&
+		    phys < (io_start + io_size - PAGE_SIZE))
+			return pdev;
+	}
+
+	return NULL;
+}
+
+static int xe_bo_translate_io_addr_to_dpa(struct dma_buf_ranges *ranges,
+					  struct ttm_buffer_object *ttm_bo)
+{
+	struct xe_bo *lmem_obj = NULL, *bo = ttm_to_xe_bo(ttm_bo);
+	struct dma_buf_attachment *attach = ttm_bo->base.import_attach;
+	struct xe_device *xe = xe_bo_device(bo);
+	struct xe_gt *gt = xe_root_mmio_gt(xe);
+	struct drm_pagemap_addr *dma_addr;
+	resource_size_t io_start;
+	unsigned long i, offset;
+	struct pci_dev *vf_pdev;
+	struct range *range;
+	dma_addr_t addr;
+	int vfid, ret;
+	void *entry;
+
+	if (!IS_SRIOV_PF(xe))
+		return -EINVAL;
+
+	dma_addr = kmalloc_array(ranges->nranges, sizeof(*dma_addr),
+				 GFP_KERNEL);
+	if (!dma_addr)
+		return -ENOMEM;
+
+	xa_for_each(&ranges->ranges, i, entry) {
+		range = entry;
+		if (page_is_ram(PFN_DOWN(range->start))) {
+			ret = -EINVAL;
+			goto err_xlat;
+		}
+
+		vf_pdev = xe_find_vf_dev(xe, range->start);
+		if (!vf_pdev) {
+			ret = -EINVAL;
+			goto err_xlat;
+		}
+
+
+		/*
+		 * The below check prevents a malicious VF from accessing
+		 * another VF's addresses.
+		 */
+		vfid = pci_iov_vf_id(vf_pdev);
+		if (vfid < 0 ||
+		    vfid != pci_iov_vf_id(to_pci_dev(attach->ic_match->dev))) {
+			ret = -EPERM;
+			goto err_xlat;
+		}
+
+		if (!lmem_obj) {
+			lmem_obj = xe_gt_sriov_pf_config_get_lmem_obj(gt,
+								      vfid + 1);
+			if (!lmem_obj) {
+				ret = -EINVAL;
+				goto err_xlat;
+			}
+		}
+
+		io_start = pci_resource_start(vf_pdev, LMEM_BAR);
+		offset = range->start - io_start;
+		addr = xe_bo_addr(lmem_obj, offset, XE_PAGE_SIZE);
+
+		dma_addr[i] = drm_pagemap_addr_encode(addr,
+						XE_INTERCONNECT_VRAM,
+						get_order(range_len(range)),
+						DMA_BIDIRECTIONAL);
+	}
+
+	bo->dma_data.dma_addr = dma_addr;
+	return 0;
+err_xlat:
+	kfree(dma_addr);
+	xe_bo_put(lmem_obj);
+	return ret;
+}
+
 /*
  * The dma-buf map_attachment() / unmap_attachment() is hooked up here.
  * Note that unmapping the attachment is deferred to the next
@@ -692,11 +793,15 @@ static int xe_bo_move_dmabuf(struct ttm_buffer_object *ttm_bo,
 			     struct ttm_resource *new_res)
 {
 	struct dma_buf_attachment *attach = ttm_bo->base.import_attach;
+	struct dma_buf_interconnect_match *ic_match = attach->ic_match;
 	struct xe_ttm_tt *xe_tt = container_of(ttm_bo->ttm, struct xe_ttm_tt,
 					       ttm);
 	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
 	bool device_unplugged = drm_dev_is_unplugged(&xe->drm);
-	struct sg_table *sg;
+	struct dma_buf_ranges *ranges;
+	struct sg_table *sg = NULL;
+	bool allow_ic = false;
+	int ret = 0;
 
 	xe_assert(xe, attach);
 	xe_assert(xe, ttm_bo->ttm);
@@ -716,10 +821,32 @@ static int xe_bo_move_dmabuf(struct ttm_buffer_object *ttm_bo,
 		dma_buf_unmap_attachment(attach, ttm_bo->sg, DMA_BIDIRECTIONAL);
 		ttm_bo->sg = NULL;
 	}
+	if (xe_tt->ranges) {
+		dma_buf_unmap_interconnect(attach, xe_tt->ranges);
+		xe_tt->ranges = NULL;
+	}
 
-	sg = dma_buf_map_attachment(attach, DMA_BIDIRECTIONAL);
-	if (IS_ERR(sg))
-		return PTR_ERR(sg);
+	if (attach->allow_ic && ic_match &&
+	    ic_match->type == iov_interconnect) {
+		allow_ic = true;
+
+		ranges = dma_buf_map_interconnect(attach);
+		if (IS_ERR(ranges)) {
+			allow_ic = false;
+		} else {
+			if (xe_bo_translate_io_addr_to_dpa(ranges, ttm_bo)) {
+				dma_buf_unmap_interconnect(attach, ranges);
+				allow_ic = false;
+			}
+			xe_tt->ranges = ranges;
+		}
+		attach->allow_ic = allow_ic;
+	}
+	if (!allow_ic) {
+		sg = dma_buf_map_attachment(attach, DMA_BIDIRECTIONAL);
+		if (IS_ERR(sg))
+			return PTR_ERR(sg);
+	}
 
 	ttm_bo->sg = sg;
 	xe_tt->sg = sg;
@@ -727,7 +854,7 @@ static int xe_bo_move_dmabuf(struct ttm_buffer_object *ttm_bo,
 out:
 	ttm_bo_move_null(ttm_bo, new_res);
 
-	return 0;
+	return ret;
 }
 
 /**
@@ -1537,6 +1664,7 @@ static void xe_ttm_bo_release_notify(struct ttm_buffer_object *ttm_bo)
 static void xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object *ttm_bo)
 {
 	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
+	struct xe_ttm_tt *xe_tt;
 
 	if (!xe_bo_is_xe_bo(ttm_bo))
 		return;
@@ -1544,18 +1672,28 @@ static void xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object *ttm_bo)
 	if (IS_VF_CCS_READY(ttm_to_xe_device(ttm_bo->bdev)))
 		xe_sriov_vf_ccs_detach_bo(bo);
 
+	xe_tt = container_of(ttm_bo->ttm, struct xe_ttm_tt, ttm);
 	/*
 	 * Object is idle and about to be destroyed. Release the
 	 * dma-buf attachment.
 	 */
-	if (ttm_bo->type == ttm_bo_type_sg && ttm_bo->sg) {
-		struct xe_ttm_tt *xe_tt = container_of(ttm_bo->ttm,
-						       struct xe_ttm_tt, ttm);
+	if (ttm_bo->type == ttm_bo_type_sg) {
+		if (ttm_bo->sg) {
+			dma_buf_unmap_attachment(ttm_bo->base.import_attach,
+						 ttm_bo->sg, DMA_BIDIRECTIONAL);
+			ttm_bo->sg = NULL;
+			xe_tt->sg = NULL;
+		}
+		if (xe_tt->ranges) {
+			dma_buf_unmap_interconnect(ttm_bo->base.import_attach,
+						   xe_tt->ranges);
+			xe_tt->ranges = NULL;
+		}
 
-		dma_buf_unmap_attachment(ttm_bo->base.import_attach, ttm_bo->sg,
-					 DMA_BIDIRECTIONAL);
-		ttm_bo->sg = NULL;
-		xe_tt->sg = NULL;
+		if (bo->dma_data.dma_addr) {
+			xe_bo_put(bo->dma_data.lmem_obj);
+			kfree(bo->dma_data.dma_addr);
+		}
 	}
 }
 
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index d4fe3c8dca5b..525e46608341 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -108,6 +108,12 @@ struct xe_bo {
 	 * from default
 	 */
 	u64 min_align;
+
+	/**
+	 * @dma_data: DMA related data for an imported dmabuf BO that is VRAM
+	 * based.
+	 */
+	struct xe_sriov_dma_data dma_data;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
index 956a88f9f213..6d5f923f7fc4 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
@@ -11,6 +11,8 @@
 
 #include "xe_sriov_pf_service_types.h"
 
+struct xe_bo;
+
 /**
  * struct xe_sriov_metadata - per-VF device level metadata
  */
@@ -42,4 +44,21 @@ struct xe_device_pf {
 	struct xe_sriov_metadata *vfs;
 };
 
+/**
+ * struct xe_sriov_dma_data - DMA related data for LMEM based imported dmabuf
+ * BOs that are associated with a sriov VF.
+ *
+ * The data in this structure is valid only if driver is running in the
+ * @XE_SRIOV_MODE_PF mode.
+ */
+struct xe_sriov_dma_data {
+	/**
+	 * @dma_addr: An array to store DMA addresses (DPAs) for imported
+	 * dmabuf BOs that are LMEM based.
+	 */
+	struct drm_pagemap_addr *dma_addr;
+
+	/** @lmem_obj: Ref taken on the LMEM obj that backs a VF's quota */
+	struct xe_bo *lmem_obj;
+};
 #endif
-- 
2.50.1


