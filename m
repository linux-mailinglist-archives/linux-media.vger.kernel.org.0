Return-Path: <linux-media+bounces-29237-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3853DA78F6F
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 15:08:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC3A616B54F
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 13:08:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E3F5239592;
	Wed,  2 Apr 2025 13:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VbgPI0Iz"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B6D1E531;
	Wed,  2 Apr 2025 13:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743599303; cv=none; b=heeOr0CNimA8ZTZ2R8JsPPbrETYNN5LnSfaNmS24XLyQNq6RdPqF6zuwZN1ODbaMjQp+BLRdaZAb0W+3VLAFUdEswjtO4p0DX6rHzbwJJsLG4kCmrZfgirVSQbDAoCS5Ce7/I5rEzW4I1wZgPVOdjM0ZQnXNBQSCI0DRHobRQrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743599303; c=relaxed/simple;
	bh=ugF+WqKm9kgqQdaTPHY1qJ3Qavy8FobVwb/atnkcQ3M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DsdlWDlnH3HGYPjLHa4Va+cRoXgx164K6cCnS/mdlVlyH0+5tEB74kl/ZjQHJRR7BoDjAD/YQs6+Y3kvKcBJfKtl4hE4QRtwIlLwY5fUgB8vEQqh7eV4PfZ8pPitSOI+a6DpNAew/GUKlsndi+e8UtrrANnHcRF5qDK39E6ouAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=VbgPI0Iz; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743599299;
	bh=ugF+WqKm9kgqQdaTPHY1qJ3Qavy8FobVwb/atnkcQ3M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VbgPI0Iz0ZXGEc5WZYhLXxxncmmn6uWiWt8n/pqo5/TXE4OIu/9Nr3cN7M484OqpD
	 ePUro6b3kpWgUcem0ZWi4GitlEHhoDQaJFh2cKo3ZKluBqWIcrOT8Sxc3aTKqNpJ1o
	 rWS/pYTN2P1jwqZEbsBqgNLCSduUrjCT1Sdo+P0p49ykFFgCB1T2VywT1dRACBYQfA
	 y47+XzRUaWw12pBIgAs6m2XcYtkifFGWAwdM31JPMGAxFYUhYovwqDuFllD+C80/Wa
	 h7q3dcBGmpH4vdUfRO5yhYlHdbMdTQ1Shu9W5fV+Qlcin02UsLWecuLwH/c1TyoId/
	 DmwgUEhNl1fkw==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 85D3117E080B;
	Wed,  2 Apr 2025 15:08:18 +0200 (CEST)
Date: Wed, 2 Apr 2025 15:08:12 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v4 3/4] drm/panthor: Label all kernel BO's
Message-ID: <20250402150812.0595465a@collabora.com>
In-Reply-To: <20250402115432.1469703-4-adrian.larumbe@collabora.com>
References: <20250402115432.1469703-1-adrian.larumbe@collabora.com>
	<20250402115432.1469703-4-adrian.larumbe@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed,  2 Apr 2025 12:54:28 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> Kernel BO's aren't exposed to UM, so labelling them is the responsibility
> of the driver itself. This kind of tagging will prove useful in further
> commits when want to expose these objects through DebugFS.
>=20
> Expand panthor_kernel_bo_create() interface to take a NULL-terminated
> string. No bounds checking is done because all label strings are given
> as statically-allocated literals, but if a more complex kernel BO naming
> scheme with explicit memory allocation and formatting was desired in the
> future, this would have to change.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_fw.c    | 8 +++++---
>  drivers/gpu/drm/panthor/panthor_gem.c   | 3 ++-
>  drivers/gpu/drm/panthor/panthor_gem.h   | 2 +-
>  drivers/gpu/drm/panthor/panthor_heap.c  | 6 ++++--
>  drivers/gpu/drm/panthor/panthor_sched.c | 9 ++++++---
>  5 files changed, 18 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panth=
or/panthor_fw.c
> index 4a9c4afa9ad7..36e60bb2dcc5 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -449,7 +449,8 @@ panthor_fw_alloc_queue_iface_mem(struct panthor_devic=
e *ptdev,
>  				       DRM_PANTHOR_BO_NO_MMAP,
>  				       DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
>  				       DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
> -				       PANTHOR_VM_KERNEL_AUTO_VA);
> +				       PANTHOR_VM_KERNEL_AUTO_VA,
> +				       "Queue FW interface");
>  	if (IS_ERR(mem))
>  		return mem;
> =20
> @@ -481,7 +482,8 @@ panthor_fw_alloc_suspend_buf_mem(struct panthor_devic=
e *ptdev, size_t size)
>  	return panthor_kernel_bo_create(ptdev, panthor_fw_vm(ptdev), size,
>  					DRM_PANTHOR_BO_NO_MMAP,
>  					DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC,
> -					PANTHOR_VM_KERNEL_AUTO_VA);
> +					PANTHOR_VM_KERNEL_AUTO_VA,
> +					"FW suspend buffer");
>  }
> =20
>  static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
> @@ -601,7 +603,7 @@ static int panthor_fw_load_section_entry(struct panth=
or_device *ptdev,
>  		section->mem =3D panthor_kernel_bo_create(ptdev, panthor_fw_vm(ptdev),
>  							section_size,
>  							DRM_PANTHOR_BO_NO_MMAP,
> -							vm_map_flags, va);
> +							vm_map_flags, va, "FW Section");

nit: Let's try to use the caps consistently in the names we assign to
kernel BOs, like, cap on the first word only, or cap on each word, I
don't mind, but pick one and try to stick to it.

>  		if (IS_ERR(section->mem))
>  			return PTR_ERR(section->mem);
> =20
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/pant=
hor/panthor_gem.c
> index 7d017f9d1d52..44d027e6d664 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> @@ -81,7 +81,7 @@ void panthor_kernel_bo_destroy(struct panthor_kernel_bo=
 *bo)
>  struct panthor_kernel_bo *
>  panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm=
 *vm,
>  			 size_t size, u32 bo_flags, u32 vm_map_flags,
> -			 u64 gpu_va)
> +			 u64 gpu_va, const char *name)
>  {
>  	struct drm_gem_shmem_object *obj;
>  	struct panthor_kernel_bo *kbo;
> @@ -105,6 +105,7 @@ panthor_kernel_bo_create(struct panthor_device *ptdev=
, struct panthor_vm *vm,
>  	kbo->obj =3D &obj->base;
>  	bo->flags =3D bo_flags;
> =20
> +	panthor_gem_kernel_bo_set_label(kbo, name);

nit: can we add a blank line here, and remove the one that's after the
bo->flags assignment?

>  	/* The system and GPU MMU page size might differ, which becomes a
>  	 * problem for FW sections that need to be mapped at explicit address
>  	 * since our PAGE_SIZE alignment might cover a VA range that's
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/pant=
hor/panthor_gem.h
> index e18fbc093abd..49daa5088a0d 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.h
> +++ b/drivers/gpu/drm/panthor/panthor_gem.h
> @@ -153,7 +153,7 @@ panthor_kernel_bo_vunmap(struct panthor_kernel_bo *bo)
>  struct panthor_kernel_bo *
>  panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm=
 *vm,
>  			 size_t size, u32 bo_flags, u32 vm_map_flags,
> -			 u64 gpu_va);
> +			 u64 gpu_va, const char *name);
> =20
>  void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo);
> =20
> diff --git a/drivers/gpu/drm/panthor/panthor_heap.c b/drivers/gpu/drm/pan=
thor/panthor_heap.c
> index db0285ce5812..ad122bd37ac2 100644
> --- a/drivers/gpu/drm/panthor/panthor_heap.c
> +++ b/drivers/gpu/drm/panthor/panthor_heap.c
> @@ -147,7 +147,8 @@ static int panthor_alloc_heap_chunk(struct panthor_de=
vice *ptdev,
>  	chunk->bo =3D panthor_kernel_bo_create(ptdev, vm, heap->chunk_size,
>  					     DRM_PANTHOR_BO_NO_MMAP,
>  					     DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC,
> -					     PANTHOR_VM_KERNEL_AUTO_VA);
> +					     PANTHOR_VM_KERNEL_AUTO_VA,
> +					     "Tiler heap chunk");
>  	if (IS_ERR(chunk->bo)) {
>  		ret =3D PTR_ERR(chunk->bo);
>  		goto err_free_chunk;
> @@ -550,7 +551,8 @@ panthor_heap_pool_create(struct panthor_device *ptdev=
, struct panthor_vm *vm)
>  	pool->gpu_contexts =3D panthor_kernel_bo_create(ptdev, vm, bosize,
>  						      DRM_PANTHOR_BO_NO_MMAP,
>  						      DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC,
> -						      PANTHOR_VM_KERNEL_AUTO_VA);
> +						      PANTHOR_VM_KERNEL_AUTO_VA,
> +						      "Heap pool");
>  	if (IS_ERR(pool->gpu_contexts)) {
>  		ret =3D PTR_ERR(pool->gpu_contexts);
>  		goto err_destroy_pool;
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/pa=
nthor/panthor_sched.c
> index 1a276db095ff..a0b8f1ba4ea8 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -3334,7 +3334,8 @@ group_create_queue(struct panthor_group *group,
>  						  DRM_PANTHOR_BO_NO_MMAP,
>  						  DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
>  						  DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
> -						  PANTHOR_VM_KERNEL_AUTO_VA);
> +						  PANTHOR_VM_KERNEL_AUTO_VA,
> +						  "Ring buffer");
>  	if (IS_ERR(queue->ringbuf)) {
>  		ret =3D PTR_ERR(queue->ringbuf);
>  		goto err_free_queue;
> @@ -3364,7 +3365,8 @@ group_create_queue(struct panthor_group *group,
>  					 DRM_PANTHOR_BO_NO_MMAP,
>  					 DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
>  					 DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
> -					 PANTHOR_VM_KERNEL_AUTO_VA);
> +					 PANTHOR_VM_KERNEL_AUTO_VA,
> +					 "fdinfo slots");

I think I'd prefer "Group job stats", just in case we end up dumping
other stuff that's not exposed through fdinfo there.

> =20
>  	if (IS_ERR(queue->profiling.slots)) {
>  		ret =3D PTR_ERR(queue->profiling.slots);
> @@ -3495,7 +3497,8 @@ int panthor_group_create(struct panthor_file *pfile,
>  						   DRM_PANTHOR_BO_NO_MMAP,
>  						   DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
>  						   DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
> -						   PANTHOR_VM_KERNEL_AUTO_VA);
> +						   PANTHOR_VM_KERNEL_AUTO_VA,
> +						   "Group sync objects");
>  	if (IS_ERR(group->syncobjs)) {
>  		ret =3D PTR_ERR(group->syncobjs);
>  		goto err_put_group;


