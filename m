Return-Path: <linux-media+bounces-30133-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AC4A87CBC
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 12:02:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC4E318954DD
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 10:02:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AF6C25A63F;
	Mon, 14 Apr 2025 10:01:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2CAD257AC8;
	Mon, 14 Apr 2025 10:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744624899; cv=none; b=UrqsKQeb8cP+INIGapoOc9rabVT5WtjOmDkS191NsssmJcMae+/bjTneg2NnB9SR/RojZlHmIzgHn5CE4Yfx7hMYjLzcA6qh/mVhEQdrygPxSfHuC0bFYQo36DSNqGAdFeD4P8KxvCvCPEDclMYRKENucs6VxpbdATcJeDy7sT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744624899; c=relaxed/simple;
	bh=vvzzjW65MnkZ0nxqXIx1qV1sedh5i36fMxRRI/66I4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=exQxVG0bL1w93BHOJ0NAkWBU7TxbZeCfqIRHmRCBofIWJfsRdwMJTOixo/BUQ32qAA7DwgU2EzCrP1YSXTK4/OjTPlveska6NV1Rz9P7BaRGpw1vjGFr0RTiFzaZ9qNdLEUHZ8w6kGFGWO3DBDmEOsVRsCNnLrY9X74kXgz87iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 360EA1007;
	Mon, 14 Apr 2025 03:01:35 -0700 (PDT)
Received: from [10.57.87.24] (unknown [10.57.87.24])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 293E33F694;
	Mon, 14 Apr 2025 03:01:32 -0700 (PDT)
Message-ID: <1da20229-4eca-41a0-b479-320820a27812@arm.com>
Date: Mon, 14 Apr 2025 11:01:32 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/4] drm/panthor: Label all kernel BO's
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 "To : Boris Brezillon" <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20250411150357.3308921-1-adrian.larumbe@collabora.com>
 <20250411150357.3308921-4-adrian.larumbe@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250411150357.3308921-4-adrian.larumbe@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/04/2025 16:03, Adrián Larumbe wrote:
> Kernel BO's aren't exposed to UM, so labelling them is the responsibility
> of the driver itself. This kind of tagging will prove useful in further
> commits when want to expose these objects through DebugFS.
> 
> Expand panthor_kernel_bo_create() interface to take a NULL-terminated

NIT: s/NULL/NUL/

> string. No bounds checking is done because all label strings are given
> as statically-allocated literals, but if a more complex kernel BO naming
> scheme with explicit memory allocation and formatting was desired in the
> future, this would have to change.

I'm not sure I follow why bounds-checking would be an issue for strings
from the kernel. But as you state these are all literals so definitely
not a problem.

> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_fw.c    | 8 +++++---
>  drivers/gpu/drm/panthor/panthor_gem.c   | 4 +++-
>  drivers/gpu/drm/panthor/panthor_gem.h   | 2 +-
>  drivers/gpu/drm/panthor/panthor_heap.c  | 6 ++++--
>  drivers/gpu/drm/panthor/panthor_sched.c | 9 ++++++---
>  5 files changed, 19 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index 0f52766a3120..a7fdc4d8020d 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -449,7 +449,8 @@ panthor_fw_alloc_queue_iface_mem(struct panthor_device *ptdev,
>  				       DRM_PANTHOR_BO_NO_MMAP,
>  				       DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
>  				       DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
> -				       PANTHOR_VM_KERNEL_AUTO_VA);
> +				       PANTHOR_VM_KERNEL_AUTO_VA,
> +				       "Queue FW interface");
>  	if (IS_ERR(mem))
>  		return mem;
>  
> @@ -481,7 +482,8 @@ panthor_fw_alloc_suspend_buf_mem(struct panthor_device *ptdev, size_t size)
>  	return panthor_kernel_bo_create(ptdev, panthor_fw_vm(ptdev), size,
>  					DRM_PANTHOR_BO_NO_MMAP,
>  					DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC,
> -					PANTHOR_VM_KERNEL_AUTO_VA);
> +					PANTHOR_VM_KERNEL_AUTO_VA,
> +					"FW suspend buffer");
>  }
>  
>  static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
> @@ -601,7 +603,7 @@ static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
>  		section->mem = panthor_kernel_bo_create(ptdev, panthor_fw_vm(ptdev),
>  							section_size,
>  							DRM_PANTHOR_BO_NO_MMAP,
> -							vm_map_flags, va);
> +							vm_map_flags, va, "FW section");
>  		if (IS_ERR(section->mem))
>  			return PTR_ERR(section->mem);
>  
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
> index af0ac17f357f..3c5fc854356e 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> @@ -82,7 +82,7 @@ void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo)
>  struct panthor_kernel_bo *
>  panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
>  			 size_t size, u32 bo_flags, u32 vm_map_flags,
> -			 u64 gpu_va)
> +			 u64 gpu_va, const char *name)
>  {
>  	struct drm_gem_shmem_object *obj;
>  	struct panthor_kernel_bo *kbo;
> @@ -106,6 +106,8 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
>  	kbo->obj = &obj->base;
>  	bo->flags = bo_flags;
>  
> +	panthor_gem_kernel_bo_set_label(kbo, name);
> +
>  	/* The system and GPU MMU page size might differ, which becomes a
>  	 * problem for FW sections that need to be mapped at explicit address
>  	 * since our PAGE_SIZE alignment might cover a VA range that's
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
> index beba066b4974..62aea06dbc6d 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.h
> +++ b/drivers/gpu/drm/panthor/panthor_gem.h
> @@ -153,7 +153,7 @@ panthor_kernel_bo_vunmap(struct panthor_kernel_bo *bo)
>  struct panthor_kernel_bo *
>  panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
>  			 size_t size, u32 bo_flags, u32 vm_map_flags,
> -			 u64 gpu_va);
> +			 u64 gpu_va, const char *name);
>  
>  void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo);
>  
> diff --git a/drivers/gpu/drm/panthor/panthor_heap.c b/drivers/gpu/drm/panthor/panthor_heap.c
> index 3bdf61c14264..d236e9ceade4 100644
> --- a/drivers/gpu/drm/panthor/panthor_heap.c
> +++ b/drivers/gpu/drm/panthor/panthor_heap.c
> @@ -151,7 +151,8 @@ static int panthor_alloc_heap_chunk(struct panthor_heap_pool *pool,
>  	chunk->bo = panthor_kernel_bo_create(pool->ptdev, pool->vm, heap->chunk_size,
>  					     DRM_PANTHOR_BO_NO_MMAP,
>  					     DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC,
> -					     PANTHOR_VM_KERNEL_AUTO_VA);
> +					     PANTHOR_VM_KERNEL_AUTO_VA,
> +					     "Tiler heap chunk");
>  	if (IS_ERR(chunk->bo)) {
>  		ret = PTR_ERR(chunk->bo);
>  		goto err_free_chunk;
> @@ -555,7 +556,8 @@ panthor_heap_pool_create(struct panthor_device *ptdev, struct panthor_vm *vm)
>  	pool->gpu_contexts = panthor_kernel_bo_create(ptdev, vm, bosize,
>  						      DRM_PANTHOR_BO_NO_MMAP,
>  						      DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC,
> -						      PANTHOR_VM_KERNEL_AUTO_VA);
> +						      PANTHOR_VM_KERNEL_AUTO_VA,
> +						      "Heap pool");
>  	if (IS_ERR(pool->gpu_contexts)) {
>  		ret = PTR_ERR(pool->gpu_contexts);
>  		goto err_destroy_pool;
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 446ec780eb4a..43ee57728de5 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -3332,7 +3332,8 @@ group_create_queue(struct panthor_group *group,
>  						  DRM_PANTHOR_BO_NO_MMAP,
>  						  DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
>  						  DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
> -						  PANTHOR_VM_KERNEL_AUTO_VA);
> +						  PANTHOR_VM_KERNEL_AUTO_VA,
> +						  "CS ring buffer");
>  	if (IS_ERR(queue->ringbuf)) {
>  		ret = PTR_ERR(queue->ringbuf);
>  		goto err_free_queue;
> @@ -3362,7 +3363,8 @@ group_create_queue(struct panthor_group *group,
>  					 DRM_PANTHOR_BO_NO_MMAP,
>  					 DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
>  					 DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
> -					 PANTHOR_VM_KERNEL_AUTO_VA);
> +					 PANTHOR_VM_KERNEL_AUTO_VA,
> +					 "Group job stats");
>  
>  	if (IS_ERR(queue->profiling.slots)) {
>  		ret = PTR_ERR(queue->profiling.slots);
> @@ -3493,7 +3495,8 @@ int panthor_group_create(struct panthor_file *pfile,
>  						   DRM_PANTHOR_BO_NO_MMAP,
>  						   DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
>  						   DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
> -						   PANTHOR_VM_KERNEL_AUTO_VA);
> +						   PANTHOR_VM_KERNEL_AUTO_VA,
> +						   "Group sync objects");
>  	if (IS_ERR(group->syncobjs)) {
>  		ret = PTR_ERR(group->syncobjs);
>  		goto err_put_group;


