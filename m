Return-Path: <linux-media+bounces-30315-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B8832A8B4EF
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 11:14:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1AC6168261
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 09:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F0A8234977;
	Wed, 16 Apr 2025 09:14:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D90B1A83E5;
	Wed, 16 Apr 2025 09:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744794873; cv=none; b=H2Zn7v7GyDAw1zRRFKzpwZUwufBpqLtOmO7Tp1xj+BoX1V00rGI/HoL2bgVlCJth3TiKXBriDymZumBbov7xUWupTmmi4KRhaoZ6ZTqXVUe/lErFxBuJXDh+/ZtbGegOI0Cpql0G0jVom7jDRIpEIo3hxcfBytRuQ6yx7lmiCAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744794873; c=relaxed/simple;
	bh=+mVXJuhbRQMpO4WDhSVzEXTEQOPqJ9oHFrXZumxLXpk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=derQiNKvLdhmCFUVFqr90AVp4UuVbsltYqAhrIho053l9XX/vUMp71XAxHEe72O/REASlZ4vRRUtCuC60YOqW6jHuWjrUO2vxZGJ3LToN+ZRdXb7P4jlpLtFgJda+42l5RnYbJ/NPuMclQ745y6rAOuDIoIPD9ED1x1hey0eQiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B1330152B;
	Wed, 16 Apr 2025 02:14:28 -0700 (PDT)
Received: from [10.57.90.52] (unknown [10.57.90.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 366993F66E;
	Wed, 16 Apr 2025 02:14:26 -0700 (PDT)
Message-ID: <283c18ed-6b28-4e9b-ae59-5a9b522d9f4a@arm.com>
Date: Wed, 16 Apr 2025 10:14:24 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/4] drm/panthor: Introduce BO labeling
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20250411150357.3308921-1-adrian.larumbe@collabora.com>
 <20250411150357.3308921-2-adrian.larumbe@collabora.com>
 <93a4ec41-3bd8-4485-a4fe-d0def3509b79@arm.com>
 <ejq47pilr3phywio3oudfrqbj2a3u2j3irk7uhlwd4pz24ve2c@3pc3cbdlerqk>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <ejq47pilr3phywio3oudfrqbj2a3u2j3irk7uhlwd4pz24ve2c@3pc3cbdlerqk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/04/2025 20:43, Adrián Larumbe wrote:
> Hi Steven,
> 
> On 14.04.2025 10:50, Steven Price wrote:
>> Hi Adrián,
>>
>> On 11/04/2025 16:03, Adrián Larumbe wrote:
>>> Add a new character string Panthor BO field, and a function that allows
>>> setting it from within the driver.
>>>
>>> Driver takes care of freeing the string when it's replaced or no longer
>>> needed at object destruction time, but allocating it is the responsibility
>>> of callers.
>>>
>>> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
>>> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
>>> ---
>>>  drivers/gpu/drm/panthor/panthor_gem.c | 39 +++++++++++++++++++++++++++
>>>  drivers/gpu/drm/panthor/panthor_gem.h | 17 ++++++++++++
>>>  2 files changed, 56 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
>>> index 8244a4e6c2a2..af0ac17f357f 100644
>>> --- a/drivers/gpu/drm/panthor/panthor_gem.c
>>> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
>>> @@ -2,6 +2,7 @@
>>>  /* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
>>>  /* Copyright 2023 Collabora ltd. */
>>>
>>> +#include <linux/cleanup.h>
>>>  #include <linux/dma-buf.h>
>>>  #include <linux/dma-mapping.h>
>>>  #include <linux/err.h>
>>> @@ -18,6 +19,14 @@ static void panthor_gem_free_object(struct drm_gem_object *obj)
>>>  	struct panthor_gem_object *bo = to_panthor_bo(obj);
>>>  	struct drm_gem_object *vm_root_gem = bo->exclusive_vm_root_gem;
>>>
>>> +	/*
>>> +	 * Label might have been allocated with kstrdup_const(),
>>> +	 * we need to take that into account when freeing the memory
>>> +	 */
>>> +	kfree_const(bo->label.str);
>>> +
>>> +	mutex_destroy(&bo->label.lock);
>>> +
>>>  	drm_gem_free_mmap_offset(&bo->base.base);
>>>  	mutex_destroy(&bo->gpuva_list_lock);
>>>  	drm_gem_shmem_free(&bo->base);
>>> @@ -196,6 +205,7 @@ struct drm_gem_object *panthor_gem_create_object(struct drm_device *ddev, size_t
>>>  	obj->base.map_wc = !ptdev->coherent;
>>>  	mutex_init(&obj->gpuva_list_lock);
>>>  	drm_gem_gpuva_set_lock(&obj->base.base, &obj->gpuva_list_lock);
>>> +	mutex_init(&obj->label.lock);
>>>
>>>  	return &obj->base.base;
>>>  }
>>> @@ -247,3 +257,32 @@ panthor_gem_create_with_handle(struct drm_file *file,
>>>
>>>  	return ret;
>>>  }
>>> +
>>> +void
>>> +panthor_gem_bo_set_label(struct drm_gem_object *obj, const char *label)
>>> +{
>>> +	struct panthor_gem_object *bo = to_panthor_bo(obj);
>>> +	const char *old_label;
>>> +
>>> +	scoped_guard(mutex, &bo->label.lock) {
>>> +		old_label = bo->label.str;
>>> +		bo->label.str = label;
>>> +	}
>>> +
>>> +	kfree(old_label);
>>
>> Shouldn't this be kfree_const()? I suspect as things stand we can't
>> trigger this bug but it's inconsistent.
> 
> This could only be called either from the set_label() ioctl, in which case
> old_label could be NULL or a pointer to a string obtained from strdup(); or from
> panthor_gem_kernel_bo_set_label(). In the latter case, it could only ever be
> NULL, since we don't reassign kernel BO labels, so it'd be safe too.

Yeah I thought it probably doesn't cause problems now, but it's a foot
gun for the future.

> However I do agree that it's not consistent, and then in the future perhaps
> relabelling kernel BO's might be justified, so I'll change it to kfree_const().

Thanks!

>>> +}
>>> +
>>> +void
>>> +panthor_gem_kernel_bo_set_label(struct panthor_kernel_bo *bo, const char *label)
>>> +{
>>> +	const char *str;
>>> +
>>> +	str = kstrdup_const(label, GFP_KERNEL);
>>> +	if (!str) {
>>
>> In the next patch you permit user space to clear the label
>> (args->size==0) which means label==NULL and AFAICT kstrdup_const() will
>> return NULL in this case triggering this warning.
> 
> Kernel and UM-exposed BO's should never experience cross-labelling, so in theory
> this scenario ought to be impossible. The only way panthor_gem_kernel_bo_set_label()
> might take NULL in the 'label' argument is that someone called panthor_kernel_bo_create()
> with NULL for its name 'argument'.

You're absolutely correct - I somehow got confused between the kernel
and user paths. It's the user path above which needs to handle NULL (and
does).

> I think as a defensive check, I could do something as follows
> 
> void
> panthor_gem_kernel_bo_set_label(struct panthor_kernel_bo *bo, const char *label)
> {
> 	const char *str;
> 
> 	/* We should never attempt labelling a UM-exposed GEM object */
> 	if (drm_WARN_ON(bo->obj->dev, &bo->obj->handle_count > 0))
> 		return;
> 
> 	if (!label)
> 		return;
> 
>        [...]
> }

I'm happy for you to do nothing here - that was my mistake getting the
two functions muddled. Sorry for the noise. I'm equally happy for the
defensive checks above.

Steve

>> Thanks,
>> Steve
>>
>>> +		/* Failing to allocate memory for a label isn't a fatal condition */
>>> +		drm_warn(bo->obj->dev, "Not enough memory to allocate BO label");
>>> +		return;
>>> +	}
>>> +
>>> +	panthor_gem_bo_set_label(bo->obj, str);
>>> +}
>>> diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
>>> index 1a363bb814f4..af0d77338860 100644
>>> --- a/drivers/gpu/drm/panthor/panthor_gem.h
>>> +++ b/drivers/gpu/drm/panthor/panthor_gem.h
>>> @@ -46,6 +46,20 @@ struct panthor_gem_object {
>>>
>>>  	/** @flags: Combination of drm_panthor_bo_flags flags. */
>>>  	u32 flags;
>>> +
>>> +	/**
>>> +	 * @label: BO tagging fields. The label can be assigned within the
>>> +	 * driver itself or through a specific IOCTL.
>>> +	 */
>>> +	struct {
>>> +		/**
>>> +		 * @label.str: Pointer to NULL-terminated string,
>>> +		 */
>>> +		const char *str;
>>> +
>>> +		/** @lock.str: Protects access to the @label.str field. */
>>> +		struct mutex lock;
>>> +	} label;
>>>  };
>>>
>>>  /**
>>> @@ -91,6 +105,9 @@ panthor_gem_create_with_handle(struct drm_file *file,
>>>  			       struct panthor_vm *exclusive_vm,
>>>  			       u64 *size, u32 flags, uint32_t *handle);
>>>
>>> +void panthor_gem_bo_set_label(struct drm_gem_object *obj, const char *label);
>>> +void panthor_gem_kernel_bo_set_label(struct panthor_kernel_bo *bo, const char *label);
>>> +
>>>  static inline u64
>>>  panthor_kernel_bo_gpuva(struct panthor_kernel_bo *bo)
>>>  {
> 
> Adrian Larumbe


