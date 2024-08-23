Return-Path: <linux-media+bounces-16628-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB1A95C46A
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 06:54:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 928DB28477A
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 04:54:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AF604D8B6;
	Fri, 23 Aug 2024 04:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fTDj7YMy"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D9E47773
	for <linux-media@vger.kernel.org>; Fri, 23 Aug 2024 04:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724388832; cv=none; b=iSJb9ySB9PWlWP0skafqaQVVQYIlzyWlNJqruJqhJYE+DXl1zsyFep+KbHQY1dXgij3Dk3ddtgftE2D47JvXAE+tJ7ScFS/EVtwIzsXzi1g2uZAWnMuA7zc1wHbG+bAX3TVFwFNasPPiY+LtErb7Y8q+mhCdA8HQEjYEPqulYtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724388832; c=relaxed/simple;
	bh=/UKdkTCkXczTLmabTdX8M+Vev8DWpxL2pIJrlm82KkE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PZsPPCXmlSMwvRQVUC7iTRi5jK4twvQn0VYS6B+LTOqiepqbfNElUOH1kYHV9OXuro5aM9eo6m3MYHxdkKv6nasKKNPQv/c/9SZMb0C+MI3/SDz2GtXVQ8U/bzOI7izIPGoe1QdYOWnVjwPYCzHwSoeg571VB6SyxYrBy+b/2Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fTDj7YMy; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724388830; x=1755924830;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/UKdkTCkXczTLmabTdX8M+Vev8DWpxL2pIJrlm82KkE=;
  b=fTDj7YMyxikq43xiIX1MKdaW4q7fhtvlwNORHO7rKr0xWKDZapqxdtI+
   K9GyPQPFVw68UqNCp7GIY4i6VOtBu2dot7iCGoxvZGEUCO+gs+We3OrvS
   OMXTlM0fHeiEPTQHojs53cCt7z7fRdFzcovQ33a8g85v3XUEEjGS0+Zs7
   nY8hxPrFTw8AKWUXPFARxztGM87YgkBn0D7dC1YtUqa2/uxCev7JxgGe3
   XIcxCOvHCQ1GsiWo874NilL/pPhEocfFY2RZweU+cpUrDLLn2FMRWLWpF
   hGK4w04zWR3c4bq9hEP4ndlCdMUZTsgdJGXw/i//TEehFKF91SXYx05Gv
   Q==;
X-CSE-ConnectionGUID: EKdX82VNT3mp6eSdYzupFQ==
X-CSE-MsgGUID: Knl0EAW7QHGFvSIx9PYVug==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="26709255"
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; 
   d="scan'208";a="26709255"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 21:53:47 -0700
X-CSE-ConnectionGUID: exo4ts3vSbO6KqfGYxaoRQ==
X-CSE-MsgGUID: BTvYcWGwQPyiLOVNd7Z2yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; 
   d="scan'208";a="66608949"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 21:53:47 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	daniel@ffwll.ch
Subject: [PATCH v3 2/2] drm/xe: Use dma-fence array for media GT TLB invalidations in PT code
Date: Thu, 22 Aug 2024 21:54:43 -0700
Message-Id: <20240823045443.2132118-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240823045443.2132118-1-matthew.brost@intel.com>
References: <20240823045443.2132118-1-matthew.brost@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Using a chain fence is problematic as these cannot be installed in
timeout drm sync objects. Use a dma-fence-array instead at the cost of
an extra failure point.

Also fixup reserve fence count to include media GT invalidation fence.

v2:
 - Fix reserve fence count (Casey Bowman)
v3:
 - Prealloc dma fence array (CI)

Fixes: 40520283e0fd ("drm/xe: Invalidate media_gt TLBs in PT code")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 34 ++++++++++++++++++++++++----------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 6c6714af3d5d..2e35444a85b0 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -3,7 +3,7 @@
  * Copyright © 2022 Intel Corporation
  */
 
-#include <linux/dma-fence-chain.h>
+#include <linux/dma-fence-array.h>
 
 #include "xe_pt.h"
 
@@ -1629,9 +1629,11 @@ xe_pt_update_ops_rfence_interval(struct xe_vm_pgtable_update_ops *pt_update_ops,
 
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
@@ -1818,6 +1820,7 @@ int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops)
 	struct xe_vm_pgtable_update_ops *pt_update_ops =
 		&vops->pt_update_ops[tile->id];
 	struct xe_vma_op *op;
+	int shift = tile->media_gt ? 1 : 0;
 	int err;
 
 	lockdep_assert_held(&vops->vm->lock);
@@ -1826,7 +1829,7 @@ int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops)
 	xe_pt_update_ops_init(pt_update_ops);
 
 	err = dma_resv_reserve_fences(xe_vm_resv(vops->vm),
-				      tile_to_xe(tile)->info.tile_count);
+				      tile_to_xe(tile)->info.tile_count << shift);
 	if (err)
 		return err;
 
@@ -1983,7 +1986,8 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 		&vops->pt_update_ops[tile->id];
 	struct dma_fence *fence;
 	struct invalidation_fence *ifence = NULL, *mfence = NULL;
-	struct dma_fence_chain *chain_fence = NULL;
+	struct dma_fence **fences = NULL;
+	struct dma_fence_array *cf = NULL;
 	struct xe_range_fence *rfence;
 	struct xe_vma_op *op;
 	int err = 0, i;
@@ -2022,8 +2026,13 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 				err = -ENOMEM;
 				goto free_ifence;
 			}
-			chain_fence = dma_fence_chain_alloc();
-			if (!chain_fence) {
+			fences = kmalloc_array(2, sizeof(*fences), GFP_KERNEL);
+			if (!fences) {
+				err = -ENOMEM;
+				goto free_ifence;
+			}
+			cf = dma_fence_array_alloc(2);
+			if (!cf) {
 				err = -ENOMEM;
 				goto free_ifence;
 			}
@@ -2068,9 +2077,13 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 			invalidation_fence_init(tile->media_gt, mfence, fence,
 						pt_update_ops->start,
 						pt_update_ops->last, vm->usm.asid);
-			dma_fence_chain_init(chain_fence, &ifence->base.base,
-					     &mfence->base.base, 0);
-			fence = &chain_fence->base;
+			fences[0] = &ifence->base.base;
+			fences[1] = &mfence->base.base;
+			dma_fence_array_arm(cf, 2, fences,
+					    vm->composite_fence_ctx,
+					    vm->composite_fence_seqno++,
+					    false);
+			fence = &cf->base;
 		} else {
 			fence = &ifence->base.base;
 		}
@@ -2108,7 +2121,8 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 free_rfence:
 	kfree(rfence);
 free_ifence:
-	dma_fence_chain_free(chain_fence);
+	kfree(cf);
+	kfree(fences);
 	kfree(mfence);
 	kfree(ifence);
 kill_vm_tile1:
-- 
2.34.1


