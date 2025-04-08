Return-Path: <linux-media+bounces-29696-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 04725A81889
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 00:29:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD6291B81C51
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 22:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06AD3258CE2;
	Tue,  8 Apr 2025 22:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="YovV7t5n"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595BD257448;
	Tue,  8 Apr 2025 22:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151123; cv=pass; b=QL6zpCc9RRO4m9txprtDk95k8ZhjpOE1yB2ulheFCjZHgxBi5bdWHB0aEaFh6j6Sv00AGW9tP6esVbTJOkOwRNrltGgyy7d8Hu0EKiaE2DA3a33K2t6gQbfJsayhNr1BV8WNZ3NF6NZgK7RyLSj2ytb+pLbj3BTDhL9P0iXz2dQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151123; c=relaxed/simple;
	bh=ERn3BZjIrPlrYdoWqnRDucU/jQ/LV7iTFlk3C988xgQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VDwoJd5ijXB9iuITLk24SFbisYuZBxCTCIRikgf2tc608TCWvlFF9nQEWzKhVjYET4bvA40YHBtjvuJNdhKOVACeFTN8s/+Q09MRYIjOCJKNlUKtqcg5onQs4Js3sEMGQ1NCr/c2qdZd7IHUz0JncBFzbo3I+6JjTisgGVkPyj0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=YovV7t5n; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1744151091; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=k4cSiDSEEdEg/b+tek0yipQWgLfdkiIXPJCBTBmCAe2R3XePXG7/BGoh4G7ypwy0rTiuZ3HHWtyMnB+Kj2GQU1Eow1IDlzoI+lxEg8ZbjkruY3t3mqXPej6+havAQElQZzP/MO4IISEdHgSuXQ1u1Awpc9I06rx0gIubsmg+L1g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744151091; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ZpMc6L1z6n4rJKNDcJ4CojYrBbZbnvM3GJpwcaAounk=; 
	b=g0P1ccb2r8D4fc08Ouw9+TOU+hssDhojcilpgWr1eSLJOz9S9zTdS7dwse2EWwZQrDBv7WBEmJSjGbblPiFtvZp95sq1oeIEYYKnX/eAAJM93y9y1k2Wlyfjjdpwl+sM4TLUfYLHEr6CsQQ6dJuf63E8XEHJovmGZXH3qUyaBQs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744151091;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ZpMc6L1z6n4rJKNDcJ4CojYrBbZbnvM3GJpwcaAounk=;
	b=YovV7t5nhvJ82dL1so7biJnmk4HnrJ56GmNRJejpbMDdL/rZa8Vh2WHxMA31i3Vn
	/Or0gn7jVRNAwo4nNKLCx3Qu5S8dpDG0AY+ftQjEFMzKPJJrWRQN5J+/LoBzAu5Kx+f
	6hFV5wCFHMKoN0TVtGeN9CtCz37G0KNv3WaDbB14=
Received: by mx.zohomail.com with SMTPS id 174415108977195.94203470063167;
	Tue, 8 Apr 2025 15:24:49 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: kernel@collabora.com,
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH v5 3/4] drm/panthor: Label all kernel BO's
Date: Tue,  8 Apr 2025 23:24:23 +0100
Message-ID: <20250408222427.1214330-4-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250408222427.1214330-1-adrian.larumbe@collabora.com>
References: <20250408222427.1214330-1-adrian.larumbe@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Kernel BO's aren't exposed to UM, so labelling them is the responsibility
of the driver itself. This kind of tagging will prove useful in further
commits when want to expose these objects through DebugFS.

Expand panthor_kernel_bo_create() interface to take a NULL-terminated
string. No bounds checking is done because all label strings are given
as statically-allocated literals, but if a more complex kernel BO naming
scheme with explicit memory allocation and formatting was desired in the
future, this would have to change.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_fw.c    | 8 +++++---
 drivers/gpu/drm/panthor/panthor_gem.c   | 4 +++-
 drivers/gpu/drm/panthor/panthor_gem.h   | 2 +-
 drivers/gpu/drm/panthor/panthor_heap.c  | 6 ++++--
 drivers/gpu/drm/panthor/panthor_sched.c | 9 ++++++---
 5 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 4a9c4afa9ad7..07daa7785f87 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -449,7 +449,8 @@ panthor_fw_alloc_queue_iface_mem(struct panthor_device *ptdev,
 				       DRM_PANTHOR_BO_NO_MMAP,
 				       DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
 				       DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
-				       PANTHOR_VM_KERNEL_AUTO_VA);
+				       PANTHOR_VM_KERNEL_AUTO_VA,
+				       "Queue FW interface");
 	if (IS_ERR(mem))
 		return mem;
 
@@ -481,7 +482,8 @@ panthor_fw_alloc_suspend_buf_mem(struct panthor_device *ptdev, size_t size)
 	return panthor_kernel_bo_create(ptdev, panthor_fw_vm(ptdev), size,
 					DRM_PANTHOR_BO_NO_MMAP,
 					DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC,
-					PANTHOR_VM_KERNEL_AUTO_VA);
+					PANTHOR_VM_KERNEL_AUTO_VA,
+					"FW suspend buffer");
 }
 
 static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
@@ -601,7 +603,7 @@ static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
 		section->mem = panthor_kernel_bo_create(ptdev, panthor_fw_vm(ptdev),
 							section_size,
 							DRM_PANTHOR_BO_NO_MMAP,
-							vm_map_flags, va);
+							vm_map_flags, va, "FW section");
 		if (IS_ERR(section->mem))
 			return PTR_ERR(section->mem);
 
diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index 7d017f9d1d52..742192c42f58 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -81,7 +81,7 @@ void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo)
 struct panthor_kernel_bo *
 panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
 			 size_t size, u32 bo_flags, u32 vm_map_flags,
-			 u64 gpu_va)
+			 u64 gpu_va, const char *name)
 {
 	struct drm_gem_shmem_object *obj;
 	struct panthor_kernel_bo *kbo;
@@ -105,6 +105,8 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
 	kbo->obj = &obj->base;
 	bo->flags = bo_flags;
 
+	panthor_gem_kernel_bo_set_label(kbo, name);
+
 	/* The system and GPU MMU page size might differ, which becomes a
 	 * problem for FW sections that need to be mapped at explicit address
 	 * since our PAGE_SIZE alignment might cover a VA range that's
diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
index e18fbc093abd..49daa5088a0d 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.h
+++ b/drivers/gpu/drm/panthor/panthor_gem.h
@@ -153,7 +153,7 @@ panthor_kernel_bo_vunmap(struct panthor_kernel_bo *bo)
 struct panthor_kernel_bo *
 panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
 			 size_t size, u32 bo_flags, u32 vm_map_flags,
-			 u64 gpu_va);
+			 u64 gpu_va, const char *name);
 
 void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo);
 
diff --git a/drivers/gpu/drm/panthor/panthor_heap.c b/drivers/gpu/drm/panthor/panthor_heap.c
index db0285ce5812..ad122bd37ac2 100644
--- a/drivers/gpu/drm/panthor/panthor_heap.c
+++ b/drivers/gpu/drm/panthor/panthor_heap.c
@@ -147,7 +147,8 @@ static int panthor_alloc_heap_chunk(struct panthor_device *ptdev,
 	chunk->bo = panthor_kernel_bo_create(ptdev, vm, heap->chunk_size,
 					     DRM_PANTHOR_BO_NO_MMAP,
 					     DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC,
-					     PANTHOR_VM_KERNEL_AUTO_VA);
+					     PANTHOR_VM_KERNEL_AUTO_VA,
+					     "Tiler heap chunk");
 	if (IS_ERR(chunk->bo)) {
 		ret = PTR_ERR(chunk->bo);
 		goto err_free_chunk;
@@ -550,7 +551,8 @@ panthor_heap_pool_create(struct panthor_device *ptdev, struct panthor_vm *vm)
 	pool->gpu_contexts = panthor_kernel_bo_create(ptdev, vm, bosize,
 						      DRM_PANTHOR_BO_NO_MMAP,
 						      DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC,
-						      PANTHOR_VM_KERNEL_AUTO_VA);
+						      PANTHOR_VM_KERNEL_AUTO_VA,
+						      "Heap pool");
 	if (IS_ERR(pool->gpu_contexts)) {
 		ret = PTR_ERR(pool->gpu_contexts);
 		goto err_destroy_pool;
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 1a276db095ff..432a8993a0cb 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -3334,7 +3334,8 @@ group_create_queue(struct panthor_group *group,
 						  DRM_PANTHOR_BO_NO_MMAP,
 						  DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
 						  DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
-						  PANTHOR_VM_KERNEL_AUTO_VA);
+						  PANTHOR_VM_KERNEL_AUTO_VA,
+						  "Ring buffer");
 	if (IS_ERR(queue->ringbuf)) {
 		ret = PTR_ERR(queue->ringbuf);
 		goto err_free_queue;
@@ -3364,7 +3365,8 @@ group_create_queue(struct panthor_group *group,
 					 DRM_PANTHOR_BO_NO_MMAP,
 					 DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
 					 DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
-					 PANTHOR_VM_KERNEL_AUTO_VA);
+					 PANTHOR_VM_KERNEL_AUTO_VA,
+					 "Group job stats");
 
 	if (IS_ERR(queue->profiling.slots)) {
 		ret = PTR_ERR(queue->profiling.slots);
@@ -3495,7 +3497,8 @@ int panthor_group_create(struct panthor_file *pfile,
 						   DRM_PANTHOR_BO_NO_MMAP,
 						   DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
 						   DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
-						   PANTHOR_VM_KERNEL_AUTO_VA);
+						   PANTHOR_VM_KERNEL_AUTO_VA,
+						   "Group sync objects");
 	if (IS_ERR(group->syncobjs)) {
 		ret = PTR_ERR(group->syncobjs);
 		goto err_put_group;
-- 
2.48.1


