Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56FAB493EE2
	for <lists+linux-media@lfdr.de>; Wed, 19 Jan 2022 18:16:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356351AbiASRQV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Jan 2022 12:16:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345023AbiASRQU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Jan 2022 12:16:20 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E941AC061574
        for <linux-media@vger.kernel.org>; Wed, 19 Jan 2022 09:16:19 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id q141-20020a1ca793000000b00347b48dfb53so7010183wme.0
        for <linux-media@vger.kernel.org>; Wed, 19 Jan 2022 09:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=zzvIrnbRrAe96RAs7QQrQ5fa7VjZfzf+FUBVq9CK8zs=;
        b=eJ7OCeRWjAcHO/MucFGi1b1DZSFqrCuvpzN3+abTm6PVbbL5927sh4qL2qoEAVmSqZ
         0kX1DDWc3wM0c9LG8LQypgc2GA1YrqVtfFY3l3/APx8vBEjQfsibgGJaQtSMx1YV/um8
         ogW8v+RJVBZ368wydisAinreXnx4zJswcWkyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=zzvIrnbRrAe96RAs7QQrQ5fa7VjZfzf+FUBVq9CK8zs=;
        b=Gk97FBcIu8WsUS0YX8jBO1SOLkC12GIj1n6fhX2HtUh2kGTghPCw8hGv7rXkTYwplP
         jFwLqVvAqG/wCcP6VyJHBGeSnGZ9vEsl1pAAcynWyeTHs4M1dMlTV10gqcvAWDUyl5Nc
         fVOYbmkqKzDAI0uiUG+t54OClpnhQjKp/SQ9jS2AkKc3OvAAFYpv42ci8fJSyUu4UKWg
         AwKpqW8o9HGyxh6pUtfrIClYIl06RlWddWqH5BxgjjEoViXdCq+46aQZM1959XwJWeWm
         Q8ynqpcbjyal72TvuStM73DJaRHdemew9deCVX2oJf25R1w9ypbd1BflvMtlxirztOUd
         72Jw==
X-Gm-Message-State: AOAM530+kpGXbNRcr0bz86C49REzbJwqzrYWheSdqgCF0YDegga9TvEf
        4txK5U4M7XjajPq92JGr1EiqxA==
X-Google-Smtp-Source: ABdhPJxCd+stQGSYmFEA3t2+AiPWuPFMridVImogbcjFwJc6gJg/jpxVfs7pmmJuuvEEF3mQuwM8+Q==
X-Received: by 2002:a05:600c:1c9f:: with SMTP id k31mr4553450wms.40.1642612578456;
        Wed, 19 Jan 2022 09:16:18 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id 10sm5587913wmc.44.2022.01.19.09.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 09:16:17 -0800 (PST)
Date:   Wed, 19 Jan 2022 18:16:15 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     sumit.semwal@linaro.org, gustavo@padovan.org,
        daniel.vetter@ffwll.ch, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 1/4] dma-buf: consolidate dma_fence subclass checking
Message-ID: <YehHX7ID/of9kxmE@phenom.ffwll.local>
References: <20220119134339.3102-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220119134339.3102-1-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 19, 2022 at 02:43:36PM +0100, Christian König wrote:
> Consolidate the wrapper functions to check for dma_fence
> subclasses in the dma_fence header.
> 
> This makes it easier to document and also check the different
> requirements for fence containers in the subclasses.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  include/linux/dma-fence-array.h | 15 +------------
>  include/linux/dma-fence-chain.h |  3 +--
>  include/linux/dma-fence.h       | 38 +++++++++++++++++++++++++++++++++
>  3 files changed, 40 insertions(+), 16 deletions(-)
> 
> diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence-array.h
> index 303dd712220f..fec374f69e12 100644
> --- a/include/linux/dma-fence-array.h
> +++ b/include/linux/dma-fence-array.h
> @@ -45,19 +45,6 @@ struct dma_fence_array {
>  	struct irq_work work;
>  };
>  
> -extern const struct dma_fence_ops dma_fence_array_ops;
> -
> -/**
> - * dma_fence_is_array - check if a fence is from the array subsclass
> - * @fence: fence to test
> - *
> - * Return true if it is a dma_fence_array and false otherwise.
> - */
> -static inline bool dma_fence_is_array(struct dma_fence *fence)
> -{
> -	return fence->ops == &dma_fence_array_ops;
> -}
> -
>  /**
>   * to_dma_fence_array - cast a fence to a dma_fence_array
>   * @fence: fence to cast to a dma_fence_array
> @@ -68,7 +55,7 @@ static inline bool dma_fence_is_array(struct dma_fence *fence)
>  static inline struct dma_fence_array *
>  to_dma_fence_array(struct dma_fence *fence)
>  {
> -	if (fence->ops != &dma_fence_array_ops)
> +	if (!fence || !dma_fence_is_array(fence))
>  		return NULL;
>  
>  	return container_of(fence, struct dma_fence_array, base);
> diff --git a/include/linux/dma-fence-chain.h b/include/linux/dma-fence-chain.h
> index 54fe3443fd2c..ee906b659694 100644
> --- a/include/linux/dma-fence-chain.h
> +++ b/include/linux/dma-fence-chain.h
> @@ -49,7 +49,6 @@ struct dma_fence_chain {
>  	spinlock_t lock;
>  };
>  
> -extern const struct dma_fence_ops dma_fence_chain_ops;
>  
>  /**
>   * to_dma_fence_chain - cast a fence to a dma_fence_chain
> @@ -61,7 +60,7 @@ extern const struct dma_fence_ops dma_fence_chain_ops;
>  static inline struct dma_fence_chain *
>  to_dma_fence_chain(struct dma_fence *fence)
>  {
> -	if (!fence || fence->ops != &dma_fence_chain_ops)
> +	if (!fence || !dma_fence_is_chain(fence))
>  		return NULL;
>  
>  	return container_of(fence, struct dma_fence_chain, base);
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index 1ea691753bd3..775cdc0b4f24 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -587,4 +587,42 @@ struct dma_fence *dma_fence_get_stub(void);
>  struct dma_fence *dma_fence_allocate_private_stub(void);
>  u64 dma_fence_context_alloc(unsigned num);
>  
> +extern const struct dma_fence_ops dma_fence_array_ops;
> +extern const struct dma_fence_ops dma_fence_chain_ops;
> +
> +/**
> + * dma_fence_is_array - check if a fence is from the array subclass
> + * @fence: the fence to test
> + *
> + * Return true if it is a dma_fence_array and false otherwise.
> + */
> +static inline bool dma_fence_is_array(struct dma_fence *fence)
> +{
> +	return fence->ops == &dma_fence_array_ops;
> +}
> +
> +/**
> + * dma_fence_is_chain - check if a fence is from the chain subclass
> + * @fence: the fence to test
> + *
> + * Return true if it is a dma_fence_chain and false otherwise.
> + */
> +static inline bool dma_fence_is_chain(struct dma_fence *fence)
> +{
> +	return fence->ops == &dma_fence_chain_ops;
> +}
> +
> +/**
> + * dma_fence_is_container - check if a fence is a container for other fences
> + * @fence: the fence to test
> + *
> + * Return true if this fence is a container for other fences, false otherwise.
> + * This is important since we can't build up large fence structure or otherwise
> + * we run into recursion during operation on those fences.
> + */
> +static inline bool dma_fence_is_container(struct dma_fence *fence)

Code looks all good, but I'm not super enthusiastic about exporting the
ops to drivers and letting them do random nonsense. At least i915 does
pretty enormous amounts of stuff with that instead of having pushed
priority boosting into dma-fence as a proper concept. And maybe a few
other things.

Now i915-gem team having gone off the rails of good upstream conduct is
another thing maybe, but I'd like to not encourage that.

So could we perhaps do this all in header which is entirely private to
drivers/dma-buf, like dma-fence-internal or so? And maybe whack a big
fixme onto the current abuse in drivers (of which __dma_fence_is_chain()
gets a special price for "not how upstream should be done" *sigh*).

Cheers, Daniel

> +{
> +	return dma_fence_is_array(fence) || dma_fence_is_chain(fence);
> +}
> +
>  #endif /* __LINUX_DMA_FENCE_H */
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
