Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A307B45DE70
	for <lists+linux-media@lfdr.de>; Thu, 25 Nov 2021 17:13:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239939AbhKYQQz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Nov 2021 11:16:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236912AbhKYQOz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Nov 2021 11:14:55 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67C64C061748
        for <linux-media@vger.kernel.org>; Thu, 25 Nov 2021 07:59:57 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id u18so12642485wrg.5
        for <linux-media@vger.kernel.org>; Thu, 25 Nov 2021 07:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=x0f7TyhCyQOlbMzxvokkT1IDB1t8o4k6EuBMauIRzMo=;
        b=ZNxhEKp36LI7WbqzSGWIjAxZYfSBP7NRppZw0kR7RrHAIZNkkoxA1AKdYHG4VsF3tQ
         nd/wYHSvH4K4EqETGKuQfgNJQMxUk3cNuZ9u/4ovaKYZHsUPTfwqfecDI+lLirPfSFat
         Xwaw3BiDMHk6vfmsAxCklSm8QgXJgkBVdmcuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=x0f7TyhCyQOlbMzxvokkT1IDB1t8o4k6EuBMauIRzMo=;
        b=8Q/SIh0Ua3KaJzuTiFMqbtOvoTYU885haqL92nMje2T4jcm0g7EPQwmDUr6s/DX+Nn
         MqHFHyniBFUL9H/zAZjOgyrIDjTtrj6V4C7zO9YZKbCj9m1HI5zuU+xVTB8x82Aj5mwa
         a8r5CS89T67MRs9BD9RHIiiluWDzobmepvLNJBdIWId94MA+BxUL7yypFRfhy39O0NuD
         Lqa69mqITVmHHV97XfisuxY+GTVb14Lr4LuQa8tvVRRfksb1HLp4777znw680+u6XqIO
         C3r81MwjsfVfb2fPixb+nD2swAj5LuJnmf5wVdwN96ME1NZDNVQr05hkqzcl2Pl4ofhH
         3LVw==
X-Gm-Message-State: AOAM532Ot5W5CbkfAWl86z1TVGZNP1A0nvAkaN/frh3krrSGh5XJBEVu
        AUfZbg/Zgz4/Gj/XXBD1eZpSQg==
X-Google-Smtp-Source: ABdhPJytYFDJHPBsz8eB6XL8F7LOuQqnhmREZpGS6+MkDLsSQPsT/q95AG0UKtsOA3EDqk53fMjAxQ==
X-Received: by 2002:a5d:6e85:: with SMTP id k5mr7684803wrz.545.1637855996036;
        Thu, 25 Nov 2021 07:59:56 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id z11sm3236854wrt.58.2021.11.25.07.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 07:59:55 -0800 (PST)
Date:   Thu, 25 Nov 2021 16:59:53 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     sumit.semwal@linaro.org, daniel@ffwll.ch,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 22/26] dma-buf: add enum dma_resv_usage
Message-ID: <YZ+y+Uwo809qtvs5@phenom.ffwll.local>
References: <20211123142111.3885-1-christian.koenig@amd.com>
 <20211123142111.3885-23-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211123142111.3885-23-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 23, 2021 at 03:21:07PM +0100, Christian K�nig wrote:
> This change adds the dma_resv_usage enum and allows us to specify why a
> dma_resv object is queried for its containing fences.
> 
> Additional to that a dma_resv_usage_rw() helper function is added to aid
> retrieving the fences for a read or write userspace submission.
> 
> This is then deployed to the different query functions of the dma_resv
> object and all of their users.
> 
> Signed-off-by: Christian K�nig <christian.koenig@amd.com>

Just a few comments on the kenreldoc while I scroll through.

>  EXPORT_SYMBOL(ib_umem_dmabuf_map_pages);
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index 062571c04bca..37552935bca6 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -49,6 +49,86 @@ extern struct ww_class reservation_ww_class;
>  
>  struct dma_resv_list;
>  
> +/**
> + * enum dma_resv_usage - how the fences from a dma_resv obj are used
> + *
> + * This enum describes the different use cases for a dma_resv object and
> + * controls which fences are returned when queried.
> + *
> + * An important fact is that there is the order KERNEL<WRITE<READ<OTHER and
> + * when the dma_resv object is asked for fences for one use case the fences
> + * for the lower use case are returned as well.

Might be good to replicate this to all functions that take a
dma_resv_usage flag, and then also add a "See enum dma_resv_usage for more
information." so we get a clickable hyperlink too.

> + *
> + * For example when asking for WRITE fences then the KERNEL fences are returned
> + * as well. Similar when asked for READ fences then both WRITE and KERNEL
> + * fences are returned as well.
> + */
> +enum dma_resv_usage {
> +	/**
> +	 * @DMA_RESV_USAGE_KERNEL: For in kernel memory management only.
> +	 *
> +	 * This should only be used for things like copying or clearing memory
> +	 * with a DMA hardware engine for the purpose of kernel memory
> +	 * management.
> +	 *
> +         * Drivers *always* need to wait for those fences before accessing the
> +	 * resource protected by the dma_resv object. The only exception for
> +	 * that is when the resource is known to be locked down in place by
> +	 * pinning it previously.

Should dma_buf_pin also do the wait for kernel fences? I think that would
also ba e bit clearer semantics in the dma-buf patch which does these
waits for us.

Or should dma_buf_pin be pipelined and it's up to callers to wait? For kms
that's definitely the semantics we want, but it's a bit playing with fire
situation, so maybe dma-buf should get the more idiot proof semantics?

> +	 */
> +	DMA_RESV_USAGE_KERNEL,
> +
> +	/**
> +	 * @DMA_RESV_USAGE_WRITE: Implicit write synchronization.
> +	 *
> +	 * This should only be used for userspace command submissions which add
> +	 * an implicit write dependency.
> +	 */
> +	DMA_RESV_USAGE_WRITE,
> +
> +	/**
> +	 * @DMA_RESV_USAGE_READ: Implicit read synchronization.
> +	 *
> +	 * This should only be used for userspace command submissions which add
> +	 * an implicit read dependency.
> +	 */
> +	DMA_RESV_USAGE_READ,
> +
> +	/**
> +	 * @DMA_RESV_USAGE_OTHER: No implicit sync.
> +	 *
> +	 * This should be used for operations which don't want to add an
> +	 * implicit dependency at all, but still have a dependency on memory
> +	 * management.
> +	 *
> +	 * This might include things like preemption fences as well as device
> +	 * page table updates or even userspace command submissions.

I think we should highlight a bit more that for explicitly synchronized
userspace like vk OTHER is the normal case. So really not an exception.
Ofc aside from amdkgf there's currently no driver doing this, but really
we should have lots of them ...


> +	 *
> +	 * The kernel memory management *always* need to wait for those fences
> +	 * before moving or freeing the resource protected by the dma_resv
> +	 * object.
> +	 */
> +	DMA_RESV_USAGE_OTHER
> +};
> +
> +/**
> + * dma_resv_usage_rw - helper for implicit sync
> + * @write: true if we create a new implicit sync write
> + *
> + * This returns the implicit synchronization usage for write or read accesses.

Pls add "See enum dma_resv_usage for more details." or so. Never hurts to
be plentiful with links :-)

> + */
> +static inline enum dma_resv_usage dma_resv_usage_rw(bool write)
> +{
> +	/* This looks confusing at first sight, but is indeed correct.
> +	 *
> +	 * The rational is that new write operations needs to wait for the
> +	 * existing read and write operations to finish.
> +	 * But a new read operation only needs to wait for the existing write
> +	 * operations to finish.
> +	 */
> +	return write ? DMA_RESV_USAGE_READ : DMA_RESV_USAGE_WRITE;
> +}
> +
>  /**
>   * struct dma_resv - a reservation object manages fences for a buffer
>   *
> @@ -147,8 +227,8 @@ struct dma_resv_iter {
>  	/** @obj: The dma_resv object we iterate over */
>  	struct dma_resv *obj;
>  
> -	/** @all_fences: If all fences should be returned */
> -	bool all_fences;
> +	/** @usage: Controls which fences are returned */
> +	enum dma_resv_usage usage;
>  
>  	/** @fence: the currently handled fence */
>  	struct dma_fence *fence;
> @@ -178,14 +258,14 @@ struct dma_fence *dma_resv_iter_next(struct dma_resv_iter *cursor);
>   * dma_resv_iter_begin - initialize a dma_resv_iter object
>   * @cursor: The dma_resv_iter object to initialize
>   * @obj: The dma_resv object which we want to iterate over
> - * @all_fences: If all fences should be returned or just the exclusive one
> + * @usage: controls which fences to return

Please add the blurb here I mentioned above. Maybe adjust the text to use
the neatly highlighted @usage.

>   */
>  static inline void dma_resv_iter_begin(struct dma_resv_iter *cursor,
>  				       struct dma_resv *obj,
> -				       bool all_fences)
> +				       enum dma_resv_usage usage)
>  {
>  	cursor->obj = obj;
> -	cursor->all_fences = all_fences;
> +	cursor->usage = usage;
>  	cursor->fence = NULL;
>  }
>  
> @@ -242,7 +322,7 @@ static inline bool dma_resv_iter_is_restarted(struct dma_resv_iter *cursor)
>   * dma_resv_for_each_fence - fence iterator
>   * @cursor: a struct dma_resv_iter pointer
>   * @obj: a dma_resv object pointer
> - * @all_fences: true if all fences should be returned
> + * @usage: controls which fences to return
>   * @fence: the current fence
>   *

Same, another place that needs the @usage clarification.

>   * Iterate over the fences in a struct dma_resv object while holding the
> @@ -251,8 +331,8 @@ static inline bool dma_resv_iter_is_restarted(struct dma_resv_iter *cursor)
>   * valid as long as the lock is held and so no extra reference to the fence is
>   * taken.
>   */
> -#define dma_resv_for_each_fence(cursor, obj, all_fences, fence)	\
> -	for (dma_resv_iter_begin(cursor, obj, all_fences),	\
> +#define dma_resv_for_each_fence(cursor, obj, usage, fence)	\
> +	for (dma_resv_iter_begin(cursor, obj, usage),	\
>  	     fence = dma_resv_iter_first(cursor); fence;	\
>  	     fence = dma_resv_iter_next(cursor))
>  
> @@ -421,14 +501,14 @@ void dma_resv_replace_fences(struct dma_resv *obj, uint64_t context,
>  void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence);
>  void dma_resv_prune(struct dma_resv *obj);
>  void dma_resv_prune_unlocked(struct dma_resv *obj);
> -int dma_resv_get_fences(struct dma_resv *obj, bool write,
> +int dma_resv_get_fences(struct dma_resv *obj, enum dma_resv_usage usage,
>  			unsigned int *num_fences, struct dma_fence ***fences);
> -int dma_resv_get_singleton(struct dma_resv *obj, bool write,
> +int dma_resv_get_singleton(struct dma_resv *obj, enum dma_resv_usage usage,
>  			   struct dma_fence **fence);
>  int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src);
> -long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool intr,
> -			   unsigned long timeout);
> -bool dma_resv_test_signaled(struct dma_resv *obj, bool test_all);
> +long dma_resv_wait_timeout(struct dma_resv *obj, enum dma_resv_usage usage,
> +			   bool intr, unsigned long timeout);
> +bool dma_resv_test_signaled(struct dma_resv *obj, enum dma_resv_usage usage);
>  void dma_resv_describe(struct dma_resv *obj, struct seq_file *seq);

I took endless amounts of discussions, but I think we're arriving at
something really neat and tiny here now finally. Both semantics, and how
drivers use them.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
