Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A862C47D87F
	for <lists+linux-media@lfdr.de>; Wed, 22 Dec 2021 22:05:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230063AbhLVVFu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Dec 2021 16:05:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229600AbhLVVFt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Dec 2021 16:05:49 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EBC8C061574
        for <linux-media@vger.kernel.org>; Wed, 22 Dec 2021 13:05:49 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id f5so13406162edq.6
        for <linux-media@vger.kernel.org>; Wed, 22 Dec 2021 13:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=IQ8ss5cLkN0OPC63IPdBeU3liG7P/Ww64z/LebsIY2w=;
        b=jOAFEbuBAhj/reb9IQTIUNL+eVriPEapr96s9Pcjc8dBjFsapOITkfRryqtSr8GJqg
         qW8h7sFiaY16oLLhjNKiIQKkSM/bI1XMZJ04Cie4CYLGobuvnju/nMu6cr7NI0Zmz7rk
         4ZK3+roGl3rxTOtfUcZcrgQ5ZAxykXjXUr4dE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=IQ8ss5cLkN0OPC63IPdBeU3liG7P/Ww64z/LebsIY2w=;
        b=qrbr++ptePc5BgpOeg5xdOJsvc+5HfvSxp3lX/vAG/QGTKt8582+vy4NPMTOygL3io
         8xw+HavR3twhBNaGXL3X4VCDmHQhmZpvvYvCW1kB5Cg/J4P3wXT4JhAE8u+14kQ2PPfc
         6q1p/O6+E4Ujo3f9pI7LMjJq81gWa/94h7dsneeDzTDhHN0dkjVsSJMD3bjYF/UtuLU3
         YSl5IEBEzxqD8406JMXUPgyBafWhTO8e5wrg0c69o6QxmfNSnUnEDhOFulqiU5Si8xjg
         CeTJA4L7cVl8j0iv0BSN3mmviL2wPkJaCpNjDYronn3fEYBIMwNUlcr4JxKjYACGwSQP
         PnAg==
X-Gm-Message-State: AOAM532DWRwuwfsH7hVDBbWq/2KwqHgaPkJYi2ck21baUFoNG4+3VXiR
        0Bli5+x97wqJExVcfJLAgJzN1w==
X-Google-Smtp-Source: ABdhPJy16fia4p0Y93NWGi3JF1DLRQj6DXz7tKsGUA5K+83EAZceIlpmfFearrRDhArZk+srL2QzXg==
X-Received: by 2002:a05:6402:518c:: with SMTP id q12mr4542433edd.312.1640207147443;
        Wed, 22 Dec 2021 13:05:47 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id o1sm1274867edv.2.2021.12.22.13.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 13:05:47 -0800 (PST)
Date:   Wed, 22 Dec 2021 22:05:45 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 01/24] dma-buf: add dma_resv_replace_fences
Message-ID: <YcOTKYkEcu7MG2sY@phenom.ffwll.local>
References: <20211207123411.167006-1-christian.koenig@amd.com>
 <20211207123411.167006-2-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211207123411.167006-2-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Dec 07, 2021 at 01:33:48PM +0100, Christian König wrote:
> This function allows to replace fences from the shared fence list when
> we can gurantee that the operation represented by the original fence has
> finished or no accesses to the resources protected by the dma_resv
> object any more when the new fence finishes.
> 
> Then use this function in the amdkfd code when BOs are unmapped from the
> process.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-resv.c                    | 43 ++++++++++++++++
>  .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 49 +++----------------
>  include/linux/dma-resv.h                      |  2 +
>  3 files changed, 52 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 4deea75c0b9c..a688dbded3d3 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -284,6 +284,49 @@ void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence)
>  }
>  EXPORT_SYMBOL(dma_resv_add_shared_fence);
>  
> +/**
> + * dma_resv_replace_fences - replace fences in the dma_resv obj
> + * @obj: the reservation object
> + * @context: the context of the fences to replace
> + * @replacement: the new fence to use instead
> + *
> + * Replace fences with a specified context with a new fence. Only valid if the
> + * operation represented by the original fences is completed or has no longer
> + * access to the resources protected by the dma_resv object when the new fence
> + * completes.
> + */
> +void dma_resv_replace_fences(struct dma_resv *obj, uint64_t context,
> +			     struct dma_fence *replacement)
> +{
> +	struct dma_resv_list *list;
> +	struct dma_fence *old;
> +	unsigned int i;
> +
> +	dma_resv_assert_held(obj);
> +
> +	write_seqcount_begin(&obj->seq);
> +
> +	old = dma_resv_excl_fence(obj);
> +	if (old->context == context) {
> +		RCU_INIT_POINTER(obj->fence_excl, dma_fence_get(replacement));
> +		dma_fence_put(old);
> +	}
> +
> +	list = dma_resv_shared_list(obj);
> +	for (i = 0; list && i < list->shared_count; ++i) {
> +		old = rcu_dereference_protected(list->shared[i],
> +						dma_resv_held(obj));
> +		if (old->context != context)
> +			continue;
> +
> +		rcu_assign_pointer(list->shared[i], dma_fence_get(replacement));
> +		dma_fence_put(old);

Since the fences are all guaranteed to be from the same context, maybe we
should have a WARN_ON(__dma_fence_is_later()); here just to be safe?

With that added:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +	}
> +
> +	write_seqcount_end(&obj->seq);
> +}
> +EXPORT_SYMBOL(dma_resv_replace_fences);
> +
>  /**
>   * dma_resv_add_excl_fence - Add an exclusive fence.
>   * @obj: the reservation object
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index 71acd577803e..b558ef0f8c4a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -236,53 +236,18 @@ void amdgpu_amdkfd_release_notify(struct amdgpu_bo *bo)
>  static int amdgpu_amdkfd_remove_eviction_fence(struct amdgpu_bo *bo,
>  					struct amdgpu_amdkfd_fence *ef)
>  {
> -	struct dma_resv *resv = bo->tbo.base.resv;
> -	struct dma_resv_list *old, *new;
> -	unsigned int i, j, k;
> +	struct dma_fence *replacement;
>  
>  	if (!ef)
>  		return -EINVAL;
>  
> -	old = dma_resv_shared_list(resv);
> -	if (!old)
> -		return 0;
> -
> -	new = kmalloc(struct_size(new, shared, old->shared_max), GFP_KERNEL);
> -	if (!new)
> -		return -ENOMEM;
> -
> -	/* Go through all the shared fences in the resevation object and sort
> -	 * the interesting ones to the end of the list.
> +	/* TODO: Instead of block before we should use the fence of the page
> +	 * table update and TLB flush here directly.
>  	 */
> -	for (i = 0, j = old->shared_count, k = 0; i < old->shared_count; ++i) {
> -		struct dma_fence *f;
> -
> -		f = rcu_dereference_protected(old->shared[i],
> -					      dma_resv_held(resv));
> -
> -		if (f->context == ef->base.context)
> -			RCU_INIT_POINTER(new->shared[--j], f);
> -		else
> -			RCU_INIT_POINTER(new->shared[k++], f);
> -	}
> -	new->shared_max = old->shared_max;
> -	new->shared_count = k;
> -
> -	/* Install the new fence list, seqcount provides the barriers */
> -	write_seqcount_begin(&resv->seq);
> -	RCU_INIT_POINTER(resv->fence, new);
> -	write_seqcount_end(&resv->seq);
> -
> -	/* Drop the references to the removed fences or move them to ef_list */
> -	for (i = j; i < old->shared_count; ++i) {
> -		struct dma_fence *f;
> -
> -		f = rcu_dereference_protected(new->shared[i],
> -					      dma_resv_held(resv));
> -		dma_fence_put(f);
> -	}
> -	kfree_rcu(old, rcu);
> -
> +	replacement = dma_fence_get_stub();
> +	dma_resv_replace_fences(bo->tbo.base.resv, ef->base.context,
> +				replacement);
> +	dma_fence_put(replacement);
>  	return 0;
>  }
>  
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index eebf04325b34..e0be34265eae 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -457,6 +457,8 @@ void dma_resv_init(struct dma_resv *obj);
>  void dma_resv_fini(struct dma_resv *obj);
>  int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences);
>  void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence);
> +void dma_resv_replace_fences(struct dma_resv *obj, uint64_t context,
> +			     struct dma_fence *fence);
>  void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence);
>  int dma_resv_get_fences(struct dma_resv *obj, struct dma_fence **pfence_excl,
>  			unsigned *pshared_count, struct dma_fence ***pshared);
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
