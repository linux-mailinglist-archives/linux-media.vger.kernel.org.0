Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8322540FA71
	for <lists+linux-media@lfdr.de>; Fri, 17 Sep 2021 16:40:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343539AbhIQOlo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Sep 2021 10:41:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242867AbhIQOl1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Sep 2021 10:41:27 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31EDDC061797
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 07:39:35 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id g16so15562287wrb.3
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 07:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=rONnp94F7a6Lw/Ny2EjsCmoV0di2gM6/LbUVHOGlfd0=;
        b=dUD1I07v914rFkrFMs+i+NhM+PtyoilHyl1bXVlNPKlJlZE1YCIxEAexHS9ldrzcDL
         tDJJKkLod8QwkTfCiRQwoaZVNBOS3CA7WkvI4INkGYPkfEIcqoYEaOEx8ljrI3EMWx+c
         Jb2l9UHXbXp4ROUXna5KCWojZDZiW+APlIETI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=rONnp94F7a6Lw/Ny2EjsCmoV0di2gM6/LbUVHOGlfd0=;
        b=HjZpgoHlTaGoAUvgOqM2NFAwIQjzvWKbwTfIxsI3rf4qYyBuCSinxTY/X4pktyNLMW
         LMvvd4zEUJ33EjAFVF/TyJUFPoLqr8mWVUMiDp/efznqvohsbwNjC11xL4W2dfhKwKzI
         kg3JXF8+hsezTXPzuxeSHafHuDtI0vzYjS2dHZJkh6sRtaQJyo7+Q86E3GvPavJmYfa2
         Wr88S0sRUSt8RygXXiGGs8/cxKWnV9oaZ/N1xwHE6wAsKNu/F8fi8hHDBmn4qky0L9QT
         PRII8mtF2OaKwWSu42aq/TwWG4iv44PmO8JSEeYI1YaJUIlMBxJ5Gk7xHfmH5Q6CyjkK
         wDzw==
X-Gm-Message-State: AOAM531VWKsR0lU1w2hzwkyz5YZ6RMxll/6Zeb8EIZirUBZ5Z3NbK3l/
        9EpxPbmnV8p5A4ixAcIx3ybsiA==
X-Google-Smtp-Source: ABdhPJyF4RuufOYUUPIfCz/Wk2FC3WxYXmSstOWulS9PiJ/VeoLBGIGhCGokxOI6E13WRoA7PQ+u1Q==
X-Received: by 2002:adf:fe0e:: with SMTP id n14mr12680874wrr.236.1631889573748;
        Fri, 17 Sep 2021 07:39:33 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id r27sm6948211wrr.70.2021.09.17.07.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 07:39:33 -0700 (PDT)
Date:   Fri, 17 Sep 2021 16:39:31 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        daniel@ffwll.ch
Subject: Re: [PATCH 04/26] dma-buf: use new iterator in dma_resv_get_fences v2
Message-ID: <YUSoo3Vrl9BrEEhV@phenom.ffwll.local>
References: <20210917123513.1106-1-christian.koenig@amd.com>
 <20210917123513.1106-5-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210917123513.1106-5-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Sep 17, 2021 at 02:34:51PM +0200, Christian König wrote:
> This makes the function much simpler since the complex
> retry logic is now handled elsewhere.
> 
> v2: use sizeof(void*) instead
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-resv.c | 112 +++++++++++++------------------------
>  1 file changed, 40 insertions(+), 72 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 406150dea5e4..9b90bd9ac018 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -487,99 +487,67 @@ EXPORT_SYMBOL(dma_resv_copy_fences);
>   * dma_resv_get_fences - Get an object's shared and exclusive
>   * fences without update side lock held
>   * @obj: the reservation object
> - * @pfence_excl: the returned exclusive fence (or NULL)
> - * @pshared_count: the number of shared fences returned
> - * @pshared: the array of shared fence ptrs returned (array is krealloc'd to
> + * @fence_excl: the returned exclusive fence (or NULL)
> + * @shared_count: the number of shared fences returned
> + * @shared: the array of shared fence ptrs returned (array is krealloc'd to
>   * the required size, and must be freed by caller)
>   *
>   * Retrieve all fences from the reservation object. If the pointer for the
>   * exclusive fence is not specified the fence is put into the array of the
>   * shared fences as well. Returns either zero or -ENOMEM.
>   */
> -int dma_resv_get_fences(struct dma_resv *obj, struct dma_fence **pfence_excl,
> -			unsigned int *pshared_count,
> -			struct dma_fence ***pshared)
> +int dma_resv_get_fences(struct dma_resv *obj, struct dma_fence **fence_excl,
> +			unsigned int *shared_count, struct dma_fence ***shared)
>  {
> -	struct dma_fence **shared = NULL;
> -	struct dma_fence *fence_excl;
> -	unsigned int shared_count;
> -	int ret = 1;
> -
> -	do {
> -		struct dma_resv_list *fobj;
> -		unsigned int i, seq;
> -		size_t sz = 0;
> -
> -		shared_count = i = 0;
> -
> -		rcu_read_lock();
> -		seq = read_seqcount_begin(&obj->seq);
> +	struct dma_resv_iter cursor;
> +	struct dma_fence *fence;
>  
> -		fence_excl = dma_resv_excl_fence(obj);
> -		if (fence_excl && !dma_fence_get_rcu(fence_excl))
> -			goto unlock;
> +	*shared_count = 0;
> +	*shared = NULL;
>  
> -		fobj = dma_resv_shared_list(obj);
> -		if (fobj)
> -			sz += sizeof(*shared) * fobj->shared_max;
> +	if (fence_excl)
> +		*fence_excl = NULL;
>  
> -		if (!pfence_excl && fence_excl)
> -			sz += sizeof(*shared);
> +	rcu_read_lock();
> +	dma_resv_iter_begin(&cursor, obj, true);
> +	dma_resv_for_each_fence_unlocked(&cursor, fence) {
>  
> -		if (sz) {
> -			struct dma_fence **nshared;
> +		if (cursor.is_first) {

Yeah with the second one here I definitely think we need a
dma_resv_iter_is_restart() helper. I'm not sure whether that should have
is_first or restart_only semantics, but I guess gcc wont see through the
maze anyway, and hence initializing everything to NULL/0 is required.

Also is_first is a bit confusing naming imo. You mean "is this the first
fence" but readers could equally read this as "is this the first time
we're in the loop", which is rather confusing. Hence why I think an
iter_is_restart() or maybe iter_restarted() naming is a notch clearer.


> +			unsigned int count;
>  
> -			nshared = krealloc(shared, sz,
> -					   GFP_NOWAIT | __GFP_NOWARN);
> -			if (!nshared) {
> -				rcu_read_unlock();
> +			while (*shared_count)
> +				dma_fence_put((*shared)[--(*shared_count)]);
>  
> -				dma_fence_put(fence_excl);
> -				fence_excl = NULL;
> +			if (fence_excl)
> +				dma_fence_put(*fence_excl);
>  
> -				nshared = krealloc(shared, sz, GFP_KERNEL);
> -				if (nshared) {
> -					shared = nshared;
> -					continue;
> -				}
> +			count = cursor.fences ? cursor.fences->shared_count : 0;
> +			count += fence_excl ? 0 : 1;
> +			rcu_read_unlock();
>  
> -				ret = -ENOMEM;
> -				break;
> -			}
> -			shared = nshared;
> -			shared_count = fobj ? fobj->shared_count : 0;
> -			for (i = 0; i < shared_count; ++i) {
> -				shared[i] = rcu_dereference(fobj->shared[i]);
> -				if (!dma_fence_get_rcu(shared[i]))
> -					break;
> +			/* Eventually re-allocate the array */
> +			*shared = krealloc_array(*shared, count,
> +						 sizeof(void *),
> +						 GFP_KERNEL);
> +			if (count && !*shared) {
> +				dma_resv_iter_end(&cursor);
> +				return -ENOMEM;
>  			}
> +			rcu_read_lock();
>  		}
>  
> -		if (i != shared_count || read_seqcount_retry(&obj->seq, seq)) {
> -			while (i--)
> -				dma_fence_put(shared[i]);
> -			dma_fence_put(fence_excl);
> -			goto unlock;
> -		}
> -
> -		ret = 0;
> -unlock:
> -		rcu_read_unlock();
> -	} while (ret);
> -
> -	if (pfence_excl)
> -		*pfence_excl = fence_excl;
> -	else if (fence_excl)
> -		shared[shared_count++] = fence_excl;
> +		if (dma_resv_iter_is_exclusive(&cursor) && fence_excl)
> +			*fence_excl = fence;
> +		else
> +			(*shared)[(*shared_count)++] = fence;
>  
> -	if (!shared_count) {
> -		kfree(shared);
> -		shared = NULL;
> +		/* Don't drop the reference */
> +		fence = NULL;
>  	}
> +	dma_resv_iter_end(&cursor);
> +	rcu_read_unlock();
>  
> -	*pshared_count = shared_count;
> -	*pshared = shared;
> -	return ret;
> +	return 0;
>  }
>  EXPORT_SYMBOL_GPL(dma_resv_get_fences);

With the wrapper I'd like to have:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>  
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
