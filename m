Return-Path: <linux-media+bounces-30129-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 944E6A87C5E
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 11:51:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F724173BC2
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 09:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC647265CBC;
	Mon, 14 Apr 2025 09:50:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A40A126B092;
	Mon, 14 Apr 2025 09:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744624213; cv=none; b=o2iEkPTycqMzTduV3rTq/TbzcV1/BFFzgz8vVxqcAk0TfWmJJfXO5m5Ead6j6laLuyYyKSr6hs+SBayjQCEwrUb8ub17Yc4d+h3GElPw+qacrjd1VMNtvvA6G2I4kxQo41HDkh95e4mpMI9p4dh1K274HwkFXRNeqnwRhBxPc8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744624213; c=relaxed/simple;
	bh=pzAVg/gEqz48XW9Y34vG1o5PUtXkZR8QjIF6M24lUqw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZlO6JNRLTsf4CICViRgHh/tezsblrFxeIQQAbfh8l4L70fRHrMj/AUtQVaty3rVD8/Fxqokpsjcb/IL70DwnhTH7Yi/nutqLkNrzStYeUQ/3YaTHOO8Tgkj/1DlL4k49ZB7PiBQRTEQZIWtZpIXIhlVjoxGnwxfxbH94S8qc5wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 491921007;
	Mon, 14 Apr 2025 02:50:07 -0700 (PDT)
Received: from [10.57.87.24] (unknown [10.57.87.24])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 098953F66E;
	Mon, 14 Apr 2025 02:50:04 -0700 (PDT)
Message-ID: <93a4ec41-3bd8-4485-a4fe-d0def3509b79@arm.com>
Date: Mon, 14 Apr 2025 10:50:02 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/4] drm/panthor: Introduce BO labeling
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
 <20250411150357.3308921-2-adrian.larumbe@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250411150357.3308921-2-adrian.larumbe@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Adrián,

On 11/04/2025 16:03, Adrián Larumbe wrote:
> Add a new character string Panthor BO field, and a function that allows
> setting it from within the driver.
> 
> Driver takes care of freeing the string when it's replaced or no longer
> needed at object destruction time, but allocating it is the responsibility
> of callers.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_gem.c | 39 +++++++++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_gem.h | 17 ++++++++++++
>  2 files changed, 56 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
> index 8244a4e6c2a2..af0ac17f357f 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> @@ -2,6 +2,7 @@
>  /* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
>  /* Copyright 2023 Collabora ltd. */
>  
> +#include <linux/cleanup.h>
>  #include <linux/dma-buf.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/err.h>
> @@ -18,6 +19,14 @@ static void panthor_gem_free_object(struct drm_gem_object *obj)
>  	struct panthor_gem_object *bo = to_panthor_bo(obj);
>  	struct drm_gem_object *vm_root_gem = bo->exclusive_vm_root_gem;
>  
> +	/*
> +	 * Label might have been allocated with kstrdup_const(),
> +	 * we need to take that into account when freeing the memory
> +	 */
> +	kfree_const(bo->label.str);
> +
> +	mutex_destroy(&bo->label.lock);
> +
>  	drm_gem_free_mmap_offset(&bo->base.base);
>  	mutex_destroy(&bo->gpuva_list_lock);
>  	drm_gem_shmem_free(&bo->base);
> @@ -196,6 +205,7 @@ struct drm_gem_object *panthor_gem_create_object(struct drm_device *ddev, size_t
>  	obj->base.map_wc = !ptdev->coherent;
>  	mutex_init(&obj->gpuva_list_lock);
>  	drm_gem_gpuva_set_lock(&obj->base.base, &obj->gpuva_list_lock);
> +	mutex_init(&obj->label.lock);
>  
>  	return &obj->base.base;
>  }
> @@ -247,3 +257,32 @@ panthor_gem_create_with_handle(struct drm_file *file,
>  
>  	return ret;
>  }
> +
> +void
> +panthor_gem_bo_set_label(struct drm_gem_object *obj, const char *label)
> +{
> +	struct panthor_gem_object *bo = to_panthor_bo(obj);
> +	const char *old_label;
> +
> +	scoped_guard(mutex, &bo->label.lock) {
> +		old_label = bo->label.str;
> +		bo->label.str = label;
> +	}
> +
> +	kfree(old_label);

Shouldn't this be kfree_const()? I suspect as things stand we can't
trigger this bug but it's inconsistent.

> +}
> +
> +void
> +panthor_gem_kernel_bo_set_label(struct panthor_kernel_bo *bo, const char *label)
> +{
> +	const char *str;
> +
> +	str = kstrdup_const(label, GFP_KERNEL);
> +	if (!str) {

In the next patch you permit user space to clear the label
(args->size==0) which means label==NULL and AFAICT kstrdup_const() will
return NULL in this case triggering this warning.

Thanks,
Steve

> +		/* Failing to allocate memory for a label isn't a fatal condition */
> +		drm_warn(bo->obj->dev, "Not enough memory to allocate BO label");
> +		return;
> +	}
> +
> +	panthor_gem_bo_set_label(bo->obj, str);
> +}
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
> index 1a363bb814f4..af0d77338860 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.h
> +++ b/drivers/gpu/drm/panthor/panthor_gem.h
> @@ -46,6 +46,20 @@ struct panthor_gem_object {
>  
>  	/** @flags: Combination of drm_panthor_bo_flags flags. */
>  	u32 flags;
> +
> +	/**
> +	 * @label: BO tagging fields. The label can be assigned within the
> +	 * driver itself or through a specific IOCTL.
> +	 */
> +	struct {
> +		/**
> +		 * @label.str: Pointer to NULL-terminated string,
> +		 */
> +		const char *str;
> +
> +		/** @lock.str: Protects access to the @label.str field. */
> +		struct mutex lock;
> +	} label;
>  };
>  
>  /**
> @@ -91,6 +105,9 @@ panthor_gem_create_with_handle(struct drm_file *file,
>  			       struct panthor_vm *exclusive_vm,
>  			       u64 *size, u32 flags, uint32_t *handle);
>  
> +void panthor_gem_bo_set_label(struct drm_gem_object *obj, const char *label);
> +void panthor_gem_kernel_bo_set_label(struct panthor_kernel_bo *bo, const char *label);
> +
>  static inline u64
>  panthor_kernel_bo_gpuva(struct panthor_kernel_bo *bo)
>  {


