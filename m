Return-Path: <linux-media+bounces-30035-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 539DBA8614F
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 17:08:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0CD391B88B6B
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 15:07:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B8C421B9D9;
	Fri, 11 Apr 2025 15:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="Rytqs4x3"
X-Original-To: linux-media@vger.kernel.org
Received: from sender3-pp-f112.zoho.com (sender3-pp-f112.zoho.com [136.143.184.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BDA217668;
	Fri, 11 Apr 2025 15:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744383912; cv=pass; b=rh+rv2LQWvDn+7DWsl0sIozxngnUU1RU6Kf5CScj6yIPJhD5JjVd5FqA4u2ISO4GpK0v66MO+Q3NvsfqyAJabDO/9ZH9yDpfi6io5UUINXIFsPSa9GQ4yhMXh69AkK82mzUy4IuHNYIU+ld5Xl5hRvRjcuOacEgcZEJTJeECiW0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744383912; c=relaxed/simple;
	bh=9YNjAmlBo3VUWqWX5uq+JmjGl3uUnghfJlftwXExn2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t72iWqNGHU8/qFWRRs8icKc8fmoE+mCLbzURSgYn24FNi99XTKvcPdUi0elqSagCgsxmj0sqvaQ1whpq4nPy1TroSFkf5kMpWyhbhqhjGooQ5bWdqQx+1d9S9BZKbtwxVWt3XT2Lr908zFeBCpfIq+3sDsiDgzErDRoMuRYXwPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=Rytqs4x3; arc=pass smtp.client-ip=136.143.184.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1744383870; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=H4H2cyDmK+UMFzYSNOMGsRR/fGep4FYW9UIprBRcHlrNzkZ+ssutkduOunoKnXVBl+TCSXSj0tISLBTKoxDTH5s+UQ7OZBv7EaItX88ACJVK/SUfV9Ez4BvOqgFTgmfLcRK5W8EB5a1Xwd2WtkpdtDll4oD7M4MYU9s+HDPTOD8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744383870; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=IEoN9iJNlLIjoOHl342Ah4nwx/70Dx1X4mBlxVBPFkI=; 
	b=awU3vV7hFExifPv3byHUFdHv6yvCo5RD51AJ5GZMfRJ9BmXEV1pmEkjU3UibDB2HNMu5C+5a0pn+wgihti5QI0LsFtpn9KAS40/iqhQeXpXuIM0XhBAPpRR1CO47OgRstocSP2DmNZNj+P2iUS1i1LZjFIm/rL6tZanNATKx34E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744383870;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=IEoN9iJNlLIjoOHl342Ah4nwx/70Dx1X4mBlxVBPFkI=;
	b=Rytqs4x3GnAmFVB/IRKnHpVfeXw4cpDmJgRUUd+IWJ5BbvQJe+CLkudVOZKZ3Ggl
	6Svp234pfTUw3c0VpJ3ZuxFhkE/9t5hrQgj48ZPcudXBe/lNxEJukriR0KCmA0wQ25n
	Te20aOjEu3hio61Tayb8vY6rBs7tugu9/gHy2ZXY=
Received: by mx.zohomail.com with SMTPS id 1744383869112770.8607781927046;
	Fri, 11 Apr 2025 08:04:29 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: "To : Boris Brezillon" <boris.brezillon@collabora.com>,
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
Subject: [PATCH v7 3/4] drm/panthor: Label all kernel BO's
Date: Fri, 11 Apr 2025 16:03:51 +0100
Message-ID: <20250411150357.3308921-4-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250411150357.3308921-1-adrian.larumbe@collabora.com>
References: <20250411150357.3308921-1-adrian.larumbe@collabora.com>
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
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
---
 drivers/gpu/drm/panthor/panthor_fw.c    | 8 +++++---
 drivers/gpu/drm/panthor/panthor_gem.c   | 4 +++-
 drivers/gpu/drm/panthor/panthor_gem.h   | 2 +-
 drivers/gpu/drm/panthor/panthor_heap.c  | 6 ++++--
 drivers/gpu/drm/panthor/panthor_sched.c | 9 ++++++---
 5 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 0f52766a3120..a7fdc4d8020d 100644
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
index af0ac17f357f..3c5fc854356e 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -82,7 +82,7 @@ void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo)
 struct panthor_kernel_bo *
 panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
 			 size_t size, u32 bo_flags, u32 vm_map_flags,
-			 u64 gpu_va)
+			 u64 gpu_va, const char *name)
 {
 	struct drm_gem_shmem_object *obj;
 	struct panthor_kernel_bo *kbo;
@@ -106,6 +106,8 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
 	kbo->obj = &obj->base;
 	bo->flags = bo_flags;
 
+	panthor_gem_kernel_bo_set_label(kbo, name);
+
 	/* The system and GPU MMU page size might differ, which becomes a
 	 * problem for FW sections that need to be mapped at explicit address
 	 * since our PAGE_SIZE alignment might cover a VA range that's
diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
index beba066b4974..62aea06dbc6d 100644
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
index 3bdf61c14264..d236e9ceade4 100644
--- a/drivers/gpu/drm/panthor/panthor_heap.c
+++ b/drivers/gpu/drm/panthor/panthor_heap.c
@@ -151,7 +151,8 @@ static int panthor_alloc_heap_chunk(struct panthor_heap_pool *pool,
 	chunk->bo = panthor_kernel_bo_create(pool->ptdev, pool->vm, heap->chunk_size,
 					     DRM_PANTHOR_BO_NO_MMAP,
 					     DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC,
-					     PANTHOR_VM_KERNEL_AUTO_VA);
+					     PANTHOR_VM_KERNEL_AUTO_VA,
+					     "Tiler heap chunk");
 	if (IS_ERR(chunk->bo)) {
 		ret = PTR_ERR(chunk->bo);
 		goto err_free_chunk;
@@ -555,7 +556,8 @@ panthor_heap_pool_create(struct panthor_device *ptdev, struct panthor_vm *vm)
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
index 446ec780eb4a..43ee57728de5 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -3332,7 +3332,8 @@ group_create_queue(struct panthor_group *group,
 						  DRM_PANTHOR_BO_NO_MMAP,
 						  DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
 						  DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
-						  PANTHOR_VM_KERNEL_AUTO_VA);
+						  PANTHOR_VM_KERNEL_AUTO_VA,
+						  "CS ring buffer");
 	if (IS_ERR(queue->ringbuf)) {
 		ret = PTR_ERR(queue->ringbuf);
 		goto err_free_queue;
@@ -3362,7 +3363,8 @@ group_create_queue(struct panthor_group *group,
 					 DRM_PANTHOR_BO_NO_MMAP,
 					 DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
 					 DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
-					 PANTHOR_VM_KERNEL_AUTO_VA);
+					 PANTHOR_VM_KERNEL_AUTO_VA,
+					 "Group job stats");
 
 	if (IS_ERR(queue->profiling.slots)) {
 		ret = PTR_ERR(queue->profiling.slots);
@@ -3493,7 +3495,8 @@ int panthor_group_create(struct panthor_file *pfile,
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


