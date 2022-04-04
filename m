Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A55174F15A5
	for <lists+linux-media@lfdr.de>; Mon,  4 Apr 2022 15:16:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350339AbiDDNSE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Apr 2022 09:18:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350206AbiDDNRs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Apr 2022 09:17:48 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 028B03CA78
        for <linux-media@vger.kernel.org>; Mon,  4 Apr 2022 06:15:52 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id k2so3799472edj.9
        for <linux-media@vger.kernel.org>; Mon, 04 Apr 2022 06:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=e61u/Rj10PyAVoeSur3oRsXcVJaSV8AdUmE92CJGoKQ=;
        b=HKBE8gVWICPF7qNRCEmA43fR0NRltdik4eQVwFrxJxBprutGVsO+fM5N9XyArxcPEy
         PuBEUQyeEfncKFJwUQe+0GIx2gI6vB3ZSXMfAIrA+2fBDc7QHHCb7PA0UKC2ws/Bkyc/
         1spnSjrrdDpvpBJGXhuokkVOWNlt5tDyN237k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=e61u/Rj10PyAVoeSur3oRsXcVJaSV8AdUmE92CJGoKQ=;
        b=CdA1nB6/8iyLvP22pHQSAjBRc9mP7Skmpx09Iu14A5+EiSHJ48SQubcyN5a9E1Z8Eg
         2a7sccVO3qfb+GH9r+VEc0sT/Ek1zp5cT/ANmlNLQPjiuwPX1Jl+aY3U9LcbmEdZlpKa
         CDJJKA09cGmX44elb+8MPqnAUe5UERTY3yYRgak8aCAP8G7JcTTlhHBayNfG4a5nkKOt
         XRiap2jCHk8k1vZ0Rdx3YVq7v7gWaRtCq+138FYSzlkxbu1OM5Tp3gNI7kR1evFzNRsj
         3Jfiixr3CPKNqfmLPASI047VnKXD09N92ZeTFi5o99SGV/Whg7zQrDpKE8136Ly+8aTu
         Fezw==
X-Gm-Message-State: AOAM531swAsqJ18gXFZDbAygjB5UfyMG+dBgHd6aa/pLJirdW963RfHj
        3qI/5F2gyDfH9IzP50zOb0Nq0A==
X-Google-Smtp-Source: ABdhPJwetqXSOPzrs5uLpbEKMUuPL/AWkbxb9URzD/9fEBDPmvIgfQeHiIK5eM9V3hD1COpE/EBqLw==
X-Received: by 2002:a05:6402:3693:b0:41c:dd5a:e8ca with SMTP id ej19-20020a056402369300b0041cdd5ae8camr662958edb.225.1649078150565;
        Mon, 04 Apr 2022 06:15:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id b12-20020a170906038c00b006e4e48969d2sm3665065eja.88.2022.04.04.06.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 06:15:50 -0700 (PDT)
Date:   Mon, 4 Apr 2022 15:15:48 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 2/4] drm/gem: Delete gem array fencing helpers
Message-ID: <YkrvhG/ODfshvX+y@phenom.ffwll.local>
References: <20220331204651.2699107-1-daniel.vetter@ffwll.ch>
 <20220331204651.2699107-3-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220331204651.2699107-3-daniel.vetter@ffwll.ch>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Mar 31, 2022 at 10:46:49PM +0200, Daniel Vetter wrote:
> Integrated into the scheduler now and all users converted over.
> 
> v2: Rebased over changes from König.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org

Anyone up for an ack for this one here?

Thanks, Daniel

> ---
>  drivers/gpu/drm/drm_gem.c | 80 ---------------------------------------
>  include/drm/drm_gem.h     |  5 ---
>  2 files changed, 85 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 56fb87885146..133dfae06fab 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -1273,83 +1273,3 @@ drm_gem_unlock_reservations(struct drm_gem_object **objs, int count,
>  	ww_acquire_fini(acquire_ctx);
>  }
>  EXPORT_SYMBOL(drm_gem_unlock_reservations);
> -
> -/**
> - * drm_gem_fence_array_add - Adds the fence to an array of fences to be
> - * waited on, deduplicating fences from the same context.
> - *
> - * @fence_array: array of dma_fence * for the job to block on.
> - * @fence: the dma_fence to add to the list of dependencies.
> - *
> - * This functions consumes the reference for @fence both on success and error
> - * cases.
> - *
> - * Returns:
> - * 0 on success, or an error on failing to expand the array.
> - */
> -int drm_gem_fence_array_add(struct xarray *fence_array,
> -			    struct dma_fence *fence)
> -{
> -	struct dma_fence *entry;
> -	unsigned long index;
> -	u32 id = 0;
> -	int ret;
> -
> -	if (!fence)
> -		return 0;
> -
> -	/* Deduplicate if we already depend on a fence from the same context.
> -	 * This lets the size of the array of deps scale with the number of
> -	 * engines involved, rather than the number of BOs.
> -	 */
> -	xa_for_each(fence_array, index, entry) {
> -		if (entry->context != fence->context)
> -			continue;
> -
> -		if (dma_fence_is_later(fence, entry)) {
> -			dma_fence_put(entry);
> -			xa_store(fence_array, index, fence, GFP_KERNEL);
> -		} else {
> -			dma_fence_put(fence);
> -		}
> -		return 0;
> -	}
> -
> -	ret = xa_alloc(fence_array, &id, fence, xa_limit_32b, GFP_KERNEL);
> -	if (ret != 0)
> -		dma_fence_put(fence);
> -
> -	return ret;
> -}
> -EXPORT_SYMBOL(drm_gem_fence_array_add);
> -
> -/**
> - * drm_gem_fence_array_add_implicit - Adds the implicit dependencies tracked
> - * in the GEM object's reservation object to an array of dma_fences for use in
> - * scheduling a rendering job.
> - *
> - * This should be called after drm_gem_lock_reservations() on your array of
> - * GEM objects used in the job but before updating the reservations with your
> - * own fences.
> - *
> - * @fence_array: array of dma_fence * for the job to block on.
> - * @obj: the gem object to add new dependencies from.
> - * @write: whether the job might write the object (so we need to depend on
> - * shared fences in the reservation object).
> - */
> -int drm_gem_fence_array_add_implicit(struct xarray *fence_array,
> -				     struct drm_gem_object *obj,
> -				     bool write)
> -{
> -	struct dma_resv_iter cursor;
> -	struct dma_fence *fence;
> -	int ret = 0;
> -
> -	dma_resv_for_each_fence(&cursor, obj->resv, write, fence) {
> -		ret = drm_gem_fence_array_add(fence_array, fence);
> -		if (ret)
> -			break;
> -	}
> -	return ret;
> -}
> -EXPORT_SYMBOL(drm_gem_fence_array_add_implicit);
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index e2941cee14b6..9d7c61a122dc 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -407,11 +407,6 @@ int drm_gem_lock_reservations(struct drm_gem_object **objs, int count,
>  			      struct ww_acquire_ctx *acquire_ctx);
>  void drm_gem_unlock_reservations(struct drm_gem_object **objs, int count,
>  				 struct ww_acquire_ctx *acquire_ctx);
> -int drm_gem_fence_array_add(struct xarray *fence_array,
> -			    struct dma_fence *fence);
> -int drm_gem_fence_array_add_implicit(struct xarray *fence_array,
> -				     struct drm_gem_object *obj,
> -				     bool write);
>  int drm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
>  			    u32 handle, u64 *offset);
>  
> -- 
> 2.34.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
