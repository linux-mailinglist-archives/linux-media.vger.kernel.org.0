Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84C5547D8AE
	for <lists+linux-media@lfdr.de>; Wed, 22 Dec 2021 22:26:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238303AbhLVV0O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Dec 2021 16:26:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230115AbhLVV0O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Dec 2021 16:26:14 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1BCCC061574
        for <linux-media@vger.kernel.org>; Wed, 22 Dec 2021 13:26:13 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id z29so13562916edl.7
        for <linux-media@vger.kernel.org>; Wed, 22 Dec 2021 13:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=6cVibGdO5hAUXCTCOcNwOdP47+qzwpAZ5IqmBGy0IdA=;
        b=jvi7yUGvvAdGFvf4Bl8V27vfWhNPGIszgKEXl+wjVce+XuhEwE+ah1muFRxuNGwvil
         vUhkCqoHzCCg+urmGcgO+kxnUuYYFAGOMgzuHGZY3tqRjWUaHt70frbuMquh1OpShNkn
         ak2Mo/yd1Nd9BVZir5M+H7eSbb93wbJs8PVAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=6cVibGdO5hAUXCTCOcNwOdP47+qzwpAZ5IqmBGy0IdA=;
        b=VXyN5/dN0JvhrsNcW0DaIC4ZDhoDh6BLZgj9A/EQxetMPwXdEGgUnZON+I37idWRFp
         dlc5RsIhsA8/ZgO2dhYPNoYvj/zfVfgK7keHsDOahkiLhLAvpwtLone6MZWzyqf24nJS
         3+VIAoFhA2GsGylHG4dqCmheNJyHLN6054C6KY7GVujUftqXpFzsSZjirbGAaepoC9kW
         7A1XEPpUB22WCk/fAscZYVwvU3mw/rYgcSpwBJxAY3oC9ljx230nEKSJtV1KDXLnFblh
         dSj2UDEToRughwbyhIZKDAeiGo23RiLik6J/9EHarSoH+HimgYte8YznhQD0HSsPuaBa
         x30w==
X-Gm-Message-State: AOAM533rvvS3Vt5GEW2a6ybpiO7pQLta7GvXEUTAwhjIhPoFxa7KM3dd
        EKOTYx2M9wsXkpJ/82mWrurADw==
X-Google-Smtp-Source: ABdhPJzimkUU7nhWNHF88UJ9LpVSHepK6xdcZRE7dyzOm7BKRhSMxLEKLpUABOmFA0mrLiC0wpacsw==
X-Received: by 2002:a17:906:4f8c:: with SMTP id o12mr3930986eju.16.1640208372262;
        Wed, 22 Dec 2021 13:26:12 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id gn15sm1050425ejc.184.2021.12.22.13.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 13:26:11 -0800 (PST)
Date:   Wed, 22 Dec 2021 22:26:10 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 06/24] drm/etnaviv: stop using dma_resv_excl_fence
Message-ID: <YcOX8r8tMj4HD8o6@phenom.ffwll.local>
References: <20211207123411.167006-1-christian.koenig@amd.com>
 <20211207123411.167006-7-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211207123411.167006-7-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Dec 07, 2021 at 01:33:53PM +0100, Christian König wrote:
> We can get the excl fence together with the shared ones as well.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Pls cc driver maintainers.

dim add-missing-cc

is your friend if you're lazy can even combine that with git rebase -x.
Same for all the other driver patches, some acks/testing would be good to
avoid fallout (we had a bit much of that with all these I think).

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gem.h        |  1 -
>  drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 14 +++++---------
>  drivers/gpu/drm/etnaviv/etnaviv_sched.c      | 10 ----------
>  3 files changed, 5 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.h b/drivers/gpu/drm/etnaviv/etnaviv_gem.h
> index 98e60df882b6..f596d743baa3 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.h
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.h
> @@ -80,7 +80,6 @@ struct etnaviv_gem_submit_bo {
>  	u64 va;
>  	struct etnaviv_gem_object *obj;
>  	struct etnaviv_vram_mapping *mapping;
> -	struct dma_fence *excl;
>  	unsigned int nr_shared;
>  	struct dma_fence **shared;
>  };
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> index 64c90ff348f2..4286dc93fdaa 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> @@ -188,15 +188,11 @@ static int submit_fence_sync(struct etnaviv_gem_submit *submit)
>  		if (submit->flags & ETNA_SUBMIT_NO_IMPLICIT)
>  			continue;
>  
> -		if (bo->flags & ETNA_SUBMIT_BO_WRITE) {
> -			ret = dma_resv_get_fences(robj, true, &bo->nr_shared,
> -						  &bo->shared);
> -			if (ret)
> -				return ret;
> -		} else {
> -			bo->excl = dma_fence_get(dma_resv_excl_fence(robj));
> -		}
> -
> +		ret = dma_resv_get_fences(robj,
> +					  !!(bo->flags & ETNA_SUBMIT_BO_WRITE),

Afaik the cast to bool !! here is overkill, compiler will do that for you
or something like that. With that dropped:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>


> +					  &bo->nr_shared, &bo->shared);
> +		if (ret)
> +			return ret;
>  	}
>  
>  	return ret;
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> index 180bb633d5c5..8c038a363d15 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> @@ -39,16 +39,6 @@ etnaviv_sched_dependency(struct drm_sched_job *sched_job,
>  		struct etnaviv_gem_submit_bo *bo = &submit->bos[i];
>  		int j;
>  
> -		if (bo->excl) {
> -			fence = bo->excl;
> -			bo->excl = NULL;
> -
> -			if (!dma_fence_is_signaled(fence))
> -				return fence;
> -
> -			dma_fence_put(fence);
> -		}
> -
>  		for (j = 0; j < bo->nr_shared; j++) {
>  			if (!bo->shared[j])
>  				continue;
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
