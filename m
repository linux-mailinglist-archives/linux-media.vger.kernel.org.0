Return-Path: <linux-media+bounces-18501-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 198BD9843F9
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 12:47:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FCFD1F21BE5
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 10:47:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9181E1A3A9B;
	Tue, 24 Sep 2024 10:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="hgJ7b4MU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131341A3A92
	for <linux-media@vger.kernel.org>; Tue, 24 Sep 2024 10:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727174844; cv=none; b=ejYLmWPDTL5hPhlnBCD0MtFHcEJKFRDVvfQRmgjAHBrUirPF1pz4lp0BmhnbTNcoCvMuLePa78pXUDJYM0D3LghGXbt3BEh1HscF5jfkwnb2SL1rNx7W1SgY0EslBtsVAoadjBvlIpqd5udTreFYSJ6fSqX0K/ablKRmwaOq2a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727174844; c=relaxed/simple;
	bh=lLywnkEBTEBB7fEQSwF2RVLmS+5/nYoXLvgvKqXvt3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dVkN8VqfdK4+jZfw2IzyE6UH+enSBEGKT+qg4Gcfx/THOKpji8P6u12E8bT010/aLzeOOe3lUod4eXgMEkEE0boqwTK5+95v6H0hy1ARgpXdRa1V/lmDEWeXdqtPSAHaCLZ+mR4rttwIMxSz5qn7oKLBUACvRulyxK4ZPprTXAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=hgJ7b4MU; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a8a897bd4f1so806218866b.3
        for <linux-media@vger.kernel.org>; Tue, 24 Sep 2024 03:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1727174840; x=1727779640; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b9AAZawLb6FaRJnOrXyKiH/jOlbBCezL8WJNXf16Qig=;
        b=hgJ7b4MUqvlvbjUPyuYtLeIbo1PJ62qQY4g6Z08Ts7Ajjm0+C9PsHtG5HzMkXP3gMw
         IYTTkS48P3+2lqcvZG495GdNl22QiysCO6Jt/5MQ7ggdllHf8L9pKc4kFeqWFH2J7jnk
         cSJjlHpFba0XmsIo3cEX14dL6aqSzjsQt0N/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727174840; x=1727779640;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b9AAZawLb6FaRJnOrXyKiH/jOlbBCezL8WJNXf16Qig=;
        b=NUs5IJS6F53PISlAK0GwFjTik/NWzgmGJvYQnomM4Nny4gJ+d6TrJZy02WZSqyeqKq
         q33+9p2VdIB9imiNIRA4K6gpGseQ4yDJ/dYScX1XnM7vTDM3UF2SSJtkZWy3qCQuApgz
         a4ArLMDwXim8LQO5EIiKyTRiwZkWZkAncIUr/oFTVNKtRv5KX1JPgieS8sgo2GGgF1fR
         zAHzRDhem1g3tJ8jD7E+cc/tzlYRG6L4S4mGgP/7Ws9K/pQXSWDxcohg2CSf3lcfpoOU
         VvQrtQnCgaA+5TWuskWB9H9x6G1Gv0zQ2qchFGbVuaXppF6rdyvjarYQVOATF+GbgCSe
         Fsfg==
X-Forwarded-Encrypted: i=1; AJvYcCXdYRoEsDgwS4MR2slEg//nwVE+ocwthzLhohVto+OKC/9y/G9kN+Hzn5UGH4i+B06k4d4gbrOVxjHVHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxXnAHzYDGipu86E/YpJ60qJgK/uW43EIew+avGIxPemyPG7oZ
	CNpi71UlgcYDojj3zggvTmkjjk2MSZCoF1IDm80L13Dj2qBVaLhlAe74RWR6TcM=
X-Google-Smtp-Source: AGHT+IF0W+3rb+Ngl+ZJbRG42J4AQJXxigROwpY5FCSbwoWAG3Z/e/Carit9idFj1WPL1j8KnzOx5A==
X-Received: by 2002:a17:907:7e8b:b0:a86:789f:c756 with SMTP id a640c23a62f3a-a90d50fd4aamr1610614066b.53.1727174840220;
        Tue, 24 Sep 2024 03:47:20 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93930f8440sm68735266b.182.2024.09.24.03.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 03:47:19 -0700 (PDT)
Date: Tue, 24 Sep 2024 12:47:18 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: sumit.semwal@linaro.org, daniel@ffwll.ch, tursulin@ursulin.net,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 2/2] dma-buf/dma-fence: add wrappers for driver and
 timeline name
Message-ID: <ZvKYtr9G12F6QNV0@phenom.ffwll.local>
References: <20240918115513.2716-1-christian.koenig@amd.com>
 <20240918115513.2716-2-christian.koenig@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240918115513.2716-2-christian.koenig@amd.com>
X-Operating-System: Linux phenom 6.10.6-amd64 

On Wed, Sep 18, 2024 at 01:55:13PM +0200, Christian König wrote:
> As discussed with Sima we want dma_fence objects to be able to outlive
> their backend ops. Because of this timeline and driver name shouldn't
> be queried any more after the fence has signaled.
> 
> Add wrappers around the two queries and only return an empty string
> if the fence was already signaled. There is still an obvious race
> between signaling and querying the values, but that can only be
> closed if we rework the locking as well.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-fence.c                 | 39 ++++++++++++++++++---
>  drivers/dma-buf/sync_file.c                 |  8 ++---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h   |  2 +-
>  drivers/gpu/drm/i915/gt/intel_gt_requests.c |  4 +--
>  drivers/gpu/drm/i915/i915_request.c         |  2 +-
>  drivers/gpu/drm/i915/i915_sw_fence.c        |  4 +--
>  include/linux/dma-fence.h                   |  2 ++
>  include/trace/events/dma_fence.h            |  4 +--
>  8 files changed, 49 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 0393a9bba3a8..d82f6c9ac018 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -538,8 +538,8 @@ void dma_fence_release(struct kref *kref)
>  	if (WARN(!list_empty(&fence->cb_list) &&
>  		 !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags),
>  		 "Fence %s:%s:%llx:%llx released with pending signals!\n",
> -		 fence->ops->get_driver_name(fence),
> -		 fence->ops->get_timeline_name(fence),
> +		 dma_fence_driver_name(fence),
> +		 dma_fence_timeline_name(fence),
>  		 fence->context, fence->seqno)) {
>  		unsigned long flags;
>  
> @@ -973,6 +973,37 @@ void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
>  }
>  EXPORT_SYMBOL(dma_fence_set_deadline);
>  
> +/**
> + * dma_fence_driver_name - return the driver name for a fence
> + * @fence:	the fence to query the driver name on
> + *
> + * Returns the driver name or empty string if the fence is already signaled.
> + */
> +const char *dma_fence_driver_name(struct dma_fence *fence)
> +{

I think a /* FIXME: blatantly racy, but better than nothig */ here and
below would be good, just to make sure we don't forget. With that:

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>



> +	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> +		return "";
> +
> +	return fence->ops->get_driver_name(fence);
> +}
> +EXPORT_SYMBOL(dma_fence_driver_name);
> +
> +/**
> + * dma_fence_timeline_name - return the name of the fence context
> + * @fence:	the fence to query the context on
> + *
> + * Returns the name of the context this fence belongs to or empty string if the
> + * fence is already signaled.
> + */
> +const char *dma_fence_timeline_name(struct dma_fence *fence)
> +{
> +	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> +		return "";
> +
> +	return fence->ops->get_timeline_name(fence);
> +}
> +EXPORT_SYMBOL(dma_fence_timeline_name);
> +
>  /**
>   * dma_fence_describe - Dump fence description into seq_file
>   * @fence: the fence to describe
> @@ -983,8 +1014,8 @@ EXPORT_SYMBOL(dma_fence_set_deadline);
>  void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq)
>  {
>  	seq_printf(seq, "%s %s seq %llu %ssignalled\n",
> -		   fence->ops->get_driver_name(fence),
> -		   fence->ops->get_timeline_name(fence), fence->seqno,
> +		   dma_fence_driver_name(fence),
> +		   dma_fence_timeline_name(fence), fence->seqno,
>  		   dma_fence_is_signaled(fence) ? "" : "un");
>  }
>  EXPORT_SYMBOL(dma_fence_describe);
> diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
> index d9b1c1b2a72b..212df4b849fe 100644
> --- a/drivers/dma-buf/sync_file.c
> +++ b/drivers/dma-buf/sync_file.c
> @@ -137,8 +137,8 @@ char *sync_file_get_name(struct sync_file *sync_file, char *buf, int len)
>  		struct dma_fence *fence = sync_file->fence;
>  
>  		snprintf(buf, len, "%s-%s%llu-%lld",
> -			 fence->ops->get_driver_name(fence),
> -			 fence->ops->get_timeline_name(fence),
> +			 dma_fence_driver_name(fence),
> +			 dma_fence_timeline_name(fence),
>  			 fence->context,
>  			 fence->seqno);
>  	}
> @@ -262,9 +262,9 @@ static long sync_file_ioctl_merge(struct sync_file *sync_file,
>  static int sync_fill_fence_info(struct dma_fence *fence,
>  				 struct sync_fence_info *info)
>  {
> -	strscpy(info->obj_name, fence->ops->get_timeline_name(fence),
> +	strscpy(info->obj_name, dma_fence_timeline_name(fence),
>  		sizeof(info->obj_name));
> -	strscpy(info->driver_name, fence->ops->get_driver_name(fence),
> +	strscpy(info->driver_name, dma_fence_driver_name(fence),
>  		sizeof(info->driver_name));
>  
>  	info->status = dma_fence_get_status(fence);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> index 383fce40d4dd..224a40e03b36 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> @@ -33,7 +33,7 @@
>  #define TRACE_INCLUDE_FILE amdgpu_trace
>  
>  #define AMDGPU_JOB_GET_TIMELINE_NAME(job) \
> -	 job->base.s_fence->finished.ops->get_timeline_name(&job->base.s_fence->finished)
> +	dma_fence_timeline_name(&job->base.s_fence->finished)
>  
>  TRACE_EVENT(amdgpu_device_rreg,
>  	    TP_PROTO(unsigned did, uint32_t reg, uint32_t value),
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_requests.c b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
> index d1a382dfaa1d..ae3557ed6c1e 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_requests.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
> @@ -252,8 +252,8 @@ void intel_gt_watchdog_work(struct work_struct *work)
>  			struct dma_fence *f = &rq->fence;
>  
>  			pr_notice("Fence expiration time out i915-%s:%s:%llx!\n",
> -				  f->ops->get_driver_name(f),
> -				  f->ops->get_timeline_name(f),
> +				  dma_fence_driver_name(f),
> +				  dma_fence_timeline_name(f),
>  				  f->seqno);
>  			i915_request_cancel(rq, -EINTR);
>  		}
> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> index 519e096c607c..aaec28fd4864 100644
> --- a/drivers/gpu/drm/i915/i915_request.c
> +++ b/drivers/gpu/drm/i915/i915_request.c
> @@ -2184,7 +2184,7 @@ void i915_request_show(struct drm_printer *m,
>  		       const char *prefix,
>  		       int indent)
>  {
> -	const char *name = rq->fence.ops->get_timeline_name((struct dma_fence *)&rq->fence);
> +	const char *name = dma_fence_timeline_name((struct dma_fence *)&rq->fence);
>  	char buf[80] = "";
>  	int x = 0;
>  
> diff --git a/drivers/gpu/drm/i915/i915_sw_fence.c b/drivers/gpu/drm/i915/i915_sw_fence.c
> index 8a9aad523eec..b805ce8b8ab8 100644
> --- a/drivers/gpu/drm/i915/i915_sw_fence.c
> +++ b/drivers/gpu/drm/i915/i915_sw_fence.c
> @@ -435,8 +435,8 @@ static void timer_i915_sw_fence_wake(struct timer_list *t)
>  		return;
>  
>  	pr_notice("Asynchronous wait on fence %s:%s:%llx timed out (hint:%ps)\n",
> -		  cb->dma->ops->get_driver_name(cb->dma),
> -		  cb->dma->ops->get_timeline_name(cb->dma),
> +		  dma_fence_driver_name(cb->dma),
> +		  dma_fence_timeline_name(cb->dma),
>  		  cb->dma->seqno,
>  		  i915_sw_fence_debug_hint(fence));
>  
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index cf91cae6e30f..4b0634e42a36 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -264,6 +264,8 @@ void dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
>  
>  void dma_fence_release(struct kref *kref);
>  void dma_fence_free(struct dma_fence *fence);
> +const char *dma_fence_driver_name(struct dma_fence *fence);
> +const char *dma_fence_timeline_name(struct dma_fence *fence);
>  void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq);
>  
>  /**
> diff --git a/include/trace/events/dma_fence.h b/include/trace/events/dma_fence.h
> index a4de3df8500b..84c83074ee81 100644
> --- a/include/trace/events/dma_fence.h
> +++ b/include/trace/events/dma_fence.h
> @@ -16,8 +16,8 @@ DECLARE_EVENT_CLASS(dma_fence,
>  	TP_ARGS(fence),
>  
>  	TP_STRUCT__entry(
> -		__string(driver, fence->ops->get_driver_name(fence))
> -		__string(timeline, fence->ops->get_timeline_name(fence))
> +		__string(driver, dma_fence_driver_name(fence))
> +		__string(timeline, dma_fence_timeline_name(fence))
>  		__field(unsigned int, context)
>  		__field(unsigned int, seqno)
>  	),
> -- 
> 2.34.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

