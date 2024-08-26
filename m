Return-Path: <linux-media+bounces-16844-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE88095F735
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 18:54:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F3A31F22714
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 16:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40476198A0F;
	Mon, 26 Aug 2024 16:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ValZpwU7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00309198856
	for <linux-media@vger.kernel.org>; Mon, 26 Aug 2024 16:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724691252; cv=none; b=ED2JXYCda4dUmALdjcTDE6bYLgXPmTAzhYOLKBsAgVg0PzEelSrCir6vbnFQAErufnXNlP/d6MQRKyPc7ntiKvnXfySF4nhR82yZpAt14wo6tBg6VqfYNwpPfCcr4askDvr2po/GrkzV0tCixDj2iY4GE2PLqjQ5ukMxmkg/2PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724691252; c=relaxed/simple;
	bh=Ee5iJgBGQK2gest5+KJ+2ba/nJOgbq5Xij1Wpbg7Q8s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MLZi9wkMJlmNkYz8gObjY925AVRUdtMoVGdptPPKcU6DVJd8+LocWyckQ+0b2D2Yi5ZXmK5QdQXLDjv7CPvrKBmh7pYs1SMuwW8viiWgFVKTmOyE7526dHhNMn2vAGQ6FrBNsHCG8qQnHSXhMhNfXcarRRhPtL80aRm0y5t0Ung=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ValZpwU7; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724691252; x=1756227252;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ee5iJgBGQK2gest5+KJ+2ba/nJOgbq5Xij1Wpbg7Q8s=;
  b=ValZpwU7mL5Mxv6U06HK8bs2hm5HrlYKyUfur7HqPFy3Bsbml3fjshEs
   hJ87xF0j/r7bPfQhmV+PplCnpybi43JPMKFNA5KyWVW+NQvfpW69ZydqP
   mVDRGSpx3nnPeiy5STBVnsrIptGwPCSUGgnAOHb8eoaiItCId/r8wDqUF
   XYFhlj95SiCxPOA63srvEE50y3Ghu0uRcKUZl0qbPn70M40Hejj/aPauu
   x36DCrofDgQ6hA0tzz40CyjNxIMEFpSykCqdfuMy2ndYC8YuG0Uuf5RGr
   +yIMVFaG/BNadPKE++1mieztiAL55ktVOZdiseFxKiuUkiJdnWg2NQq1a
   w==;
X-CSE-ConnectionGUID: j9qo4huNRNW8ImHbz12XHQ==
X-CSE-MsgGUID: dcBF2qPUTWewEhU83jQPbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="26923449"
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; 
   d="scan'208";a="26923449"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 09:54:09 -0700
X-CSE-ConnectionGUID: MYVXFfC5RoSYIizIbEXtag==
X-CSE-MsgGUID: ANoiI7ZHR0iUzxZ/zIzHTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; 
   d="scan'208";a="62563500"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 09:54:08 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com
Subject: [PATCH 2/2] drm/xe: Invalidate media_gt TLBs in PT code
Date: Mon, 26 Aug 2024 09:54:56 -0700
Message-Id: <20240826165456.2491477-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240826165456.2491477-1-matthew.brost@intel.com>
References: <20240826165456.2491477-1-matthew.brost@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Testing on LNL has shown media GT's TLBs need to be invalidated via the
GuC, update PT code appropriately.

v2:
 - Do dma_fence_get before first call of invalidation_fence_init (Himal)
 - No need to check for valid chain fence (Himal)
v3:
 - Use dma-fence-array

Fixes: 3330361543fc ("drm/xe/lnl: Add LNL platform definition")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 117 ++++++++++++++++++++++++++++++-------
 1 file changed, 96 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 579ed31b46db..2e35444a85b0 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -3,6 +3,8 @@
  * Copyright © 2022 Intel Corporation
  */
 
+#include <linux/dma-fence-array.h>
+
 #include "xe_pt.h"
 
 #include "regs/xe_gtt_defs.h"
@@ -1627,9 +1629,11 @@ xe_pt_update_ops_rfence_interval(struct xe_vm_pgtable_update_ops *pt_update_ops,
 
 static int vma_reserve_fences(struct xe_device *xe, struct xe_vma *vma)
 {
+	int shift = xe_device_get_root_tile(xe)->media_gt ? 1 : 0;
+
 	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
 		return dma_resv_reserve_fences(xe_vma_bo(vma)->ttm.base.resv,
-					       xe->info.tile_count);
+					       xe->info.tile_count << shift);
 
 	return 0;
 }
@@ -1816,6 +1820,7 @@ int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops)
 	struct xe_vm_pgtable_update_ops *pt_update_ops =
 		&vops->pt_update_ops[tile->id];
 	struct xe_vma_op *op;
+	int shift = tile->media_gt ? 1 : 0;
 	int err;
 
 	lockdep_assert_held(&vops->vm->lock);
@@ -1824,7 +1829,7 @@ int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops)
 	xe_pt_update_ops_init(pt_update_ops);
 
 	err = dma_resv_reserve_fences(xe_vm_resv(vops->vm),
-				      tile_to_xe(tile)->info.tile_count);
+				      tile_to_xe(tile)->info.tile_count << shift);
 	if (err)
 		return err;
 
@@ -1849,13 +1854,20 @@ int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops)
 
 static void bind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
 			   struct xe_vm_pgtable_update_ops *pt_update_ops,
-			   struct xe_vma *vma, struct dma_fence *fence)
+			   struct xe_vma *vma, struct dma_fence *fence,
+			   struct dma_fence *fence2)
 {
-	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
+	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm) {
 		dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
 				   pt_update_ops->wait_vm_bookkeep ?
 				   DMA_RESV_USAGE_KERNEL :
 				   DMA_RESV_USAGE_BOOKKEEP);
+		if (fence2)
+			dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence2,
+					   pt_update_ops->wait_vm_bookkeep ?
+					   DMA_RESV_USAGE_KERNEL :
+					   DMA_RESV_USAGE_BOOKKEEP);
+	}
 	vma->tile_present |= BIT(tile->id);
 	vma->tile_staged &= ~BIT(tile->id);
 	if (xe_vma_is_userptr(vma)) {
@@ -1875,13 +1887,20 @@ static void bind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
 
 static void unbind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
 			     struct xe_vm_pgtable_update_ops *pt_update_ops,
-			     struct xe_vma *vma, struct dma_fence *fence)
+			     struct xe_vma *vma, struct dma_fence *fence,
+			     struct dma_fence *fence2)
 {
-	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
+	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm) {
 		dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
 				   pt_update_ops->wait_vm_bookkeep ?
 				   DMA_RESV_USAGE_KERNEL :
 				   DMA_RESV_USAGE_BOOKKEEP);
+		if (fence2)
+			dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence2,
+					   pt_update_ops->wait_vm_bookkeep ?
+					   DMA_RESV_USAGE_KERNEL :
+					   DMA_RESV_USAGE_BOOKKEEP);
+	}
 	vma->tile_present &= ~BIT(tile->id);
 	if (!vma->tile_present) {
 		list_del_init(&vma->combined_links.rebind);
@@ -1898,7 +1917,8 @@ static void unbind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
 static void op_commit(struct xe_vm *vm,
 		      struct xe_tile *tile,
 		      struct xe_vm_pgtable_update_ops *pt_update_ops,
-		      struct xe_vma_op *op, struct dma_fence *fence)
+		      struct xe_vma_op *op, struct dma_fence *fence,
+		      struct dma_fence *fence2)
 {
 	xe_vm_assert_held(vm);
 
@@ -1907,26 +1927,28 @@ static void op_commit(struct xe_vm *vm,
 		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
 			break;
 
-		bind_op_commit(vm, tile, pt_update_ops, op->map.vma, fence);
+		bind_op_commit(vm, tile, pt_update_ops, op->map.vma, fence,
+			       fence2);
 		break;
 	case DRM_GPUVA_OP_REMAP:
 		unbind_op_commit(vm, tile, pt_update_ops,
-				 gpuva_to_vma(op->base.remap.unmap->va), fence);
+				 gpuva_to_vma(op->base.remap.unmap->va), fence,
+				 fence2);
 
 		if (op->remap.prev)
 			bind_op_commit(vm, tile, pt_update_ops, op->remap.prev,
-				       fence);
+				       fence, fence2);
 		if (op->remap.next)
 			bind_op_commit(vm, tile, pt_update_ops, op->remap.next,
-				       fence);
+				       fence, fence2);
 		break;
 	case DRM_GPUVA_OP_UNMAP:
 		unbind_op_commit(vm, tile, pt_update_ops,
-				 gpuva_to_vma(op->base.unmap.va), fence);
+				 gpuva_to_vma(op->base.unmap.va), fence, fence2);
 		break;
 	case DRM_GPUVA_OP_PREFETCH:
 		bind_op_commit(vm, tile, pt_update_ops,
-			       gpuva_to_vma(op->base.prefetch.va), fence);
+			       gpuva_to_vma(op->base.prefetch.va), fence, fence2);
 		break;
 	default:
 		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
@@ -1963,7 +1985,9 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 	struct xe_vm_pgtable_update_ops *pt_update_ops =
 		&vops->pt_update_ops[tile->id];
 	struct dma_fence *fence;
-	struct invalidation_fence *ifence = NULL;
+	struct invalidation_fence *ifence = NULL, *mfence = NULL;
+	struct dma_fence **fences = NULL;
+	struct dma_fence_array *cf = NULL;
 	struct xe_range_fence *rfence;
 	struct xe_vma_op *op;
 	int err = 0, i;
@@ -1996,6 +2020,23 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 			err = -ENOMEM;
 			goto kill_vm_tile1;
 		}
+		if (tile->media_gt) {
+			mfence = kzalloc(sizeof(*ifence), GFP_KERNEL);
+			if (!mfence) {
+				err = -ENOMEM;
+				goto free_ifence;
+			}
+			fences = kmalloc_array(2, sizeof(*fences), GFP_KERNEL);
+			if (!fences) {
+				err = -ENOMEM;
+				goto free_ifence;
+			}
+			cf = dma_fence_array_alloc(2);
+			if (!cf) {
+				err = -ENOMEM;
+				goto free_ifence;
+			}
+		}
 	}
 
 	rfence = kzalloc(sizeof(*rfence), GFP_KERNEL);
@@ -2027,19 +2068,50 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 
 	/* tlb invalidation must be done before signaling rebind */
 	if (ifence) {
+		if (mfence)
+			dma_fence_get(fence);
 		invalidation_fence_init(tile->primary_gt, ifence, fence,
 					pt_update_ops->start,
 					pt_update_ops->last, vm->usm.asid);
-		fence = &ifence->base.base;
+		if (mfence) {
+			invalidation_fence_init(tile->media_gt, mfence, fence,
+						pt_update_ops->start,
+						pt_update_ops->last, vm->usm.asid);
+			fences[0] = &ifence->base.base;
+			fences[1] = &mfence->base.base;
+			dma_fence_array_arm(cf, 2, fences,
+					    vm->composite_fence_ctx,
+					    vm->composite_fence_seqno++,
+					    false);
+			fence = &cf->base;
+		} else {
+			fence = &ifence->base.base;
+		}
 	}
 
-	dma_resv_add_fence(xe_vm_resv(vm), fence,
-			   pt_update_ops->wait_vm_bookkeep ?
-			   DMA_RESV_USAGE_KERNEL :
-			   DMA_RESV_USAGE_BOOKKEEP);
+	if (!mfence) {
+		dma_resv_add_fence(xe_vm_resv(vm), fence,
+				   pt_update_ops->wait_vm_bookkeep ?
+				   DMA_RESV_USAGE_KERNEL :
+				   DMA_RESV_USAGE_BOOKKEEP);
 
-	list_for_each_entry(op, &vops->list, link)
-		op_commit(vops->vm, tile, pt_update_ops, op, fence);
+		list_for_each_entry(op, &vops->list, link)
+			op_commit(vops->vm, tile, pt_update_ops, op, fence, NULL);
+	} else {
+		dma_resv_add_fence(xe_vm_resv(vm), &ifence->base.base,
+				   pt_update_ops->wait_vm_bookkeep ?
+				   DMA_RESV_USAGE_KERNEL :
+				   DMA_RESV_USAGE_BOOKKEEP);
+
+		dma_resv_add_fence(xe_vm_resv(vm), &mfence->base.base,
+				   pt_update_ops->wait_vm_bookkeep ?
+				   DMA_RESV_USAGE_KERNEL :
+				   DMA_RESV_USAGE_BOOKKEEP);
+
+		list_for_each_entry(op, &vops->list, link)
+			op_commit(vops->vm, tile, pt_update_ops, op,
+				  &ifence->base.base, &mfence->base.base);
+	}
 
 	if (pt_update_ops->needs_userptr_lock)
 		up_read(&vm->userptr.notifier_lock);
@@ -2049,6 +2121,9 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 free_rfence:
 	kfree(rfence);
 free_ifence:
+	kfree(cf);
+	kfree(fences);
+	kfree(mfence);
 	kfree(ifence);
 kill_vm_tile1:
 	if (err != -EAGAIN && tile->id)
-- 
2.34.1


