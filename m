Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D47BE3EAB05
	for <lists+linux-media@lfdr.de>; Thu, 12 Aug 2021 21:29:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232860AbhHLT3y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Aug 2021 15:29:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229950AbhHLT3x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Aug 2021 15:29:53 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9BEDC061756
        for <linux-media@vger.kernel.org>; Thu, 12 Aug 2021 12:29:25 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id u15so5305145wmj.1
        for <linux-media@vger.kernel.org>; Thu, 12 Aug 2021 12:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=PwnarB9Hsk8rWLa1EFppI8N3ZwQbA79XO0sGP5n+o4s=;
        b=EQWz/z0WbgSIqJOdreuC2j9GpACsC/fidpu4zh3rmKelAUnrJtNvISKSCDnFMFkB/3
         ZG1CpvXl6JpEZJGzqNCWlzeMoVX0WvtvyhPZtKLYB6bwCWQUqB+aO4pYd/MMQiIrxpEa
         YtGOgnRWSiLhvP6Ixjplj6glIRYt/vCrSJ0/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=PwnarB9Hsk8rWLa1EFppI8N3ZwQbA79XO0sGP5n+o4s=;
        b=Ep95WYHhuocuTME6xAByMp9M5Cbq0D5x3BMokqt9g5xrTe5qhbJbKXN6qI0LsBrSTB
         t6QlFvNKGpB+nQ/u06u9lwElmKUXE8/1b1WPBlQgcqfENJoss4HyrI3iPntndlWBCdmz
         0Wgij3958GCjxuFA+hUMLMIsG0ACx5fdpGEvZ8QGFat2ZpdxgRk1F15BOk6RrO2x66XE
         ZoDScCakqV6dfsCc4xSauBPyBucriXXjnKewl/8tiPCaSGsWRCclFloGmBGbDj1sZIJe
         zQkcBYO4GmYubyzA+kNsOzvbStK+0dTVtJ8Keai1FXC4pZfS6EQYXSASHjIZnfqVmLOQ
         KRSw==
X-Gm-Message-State: AOAM532ULM1r0mULdfCG/xDc8iwOna4Itklg6bDsmoMqd/7PNUZ4r4pk
        JSHXNclfV9EO7rDsBzYRh9uWEQ==
X-Google-Smtp-Source: ABdhPJzFa0sPdX8nnl+3cilN+tka6w0zCwZ32CKFR4AhNGnNzC9nxs9m6cRvPlNkytR2CeqyZxpdnA==
X-Received: by 2002:a7b:c112:: with SMTP id w18mr121651wmi.60.1628796564531;
        Thu, 12 Aug 2021 12:29:24 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id i8sm6403254wma.7.2021.08.12.12.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Aug 2021 12:29:24 -0700 (PDT)
Date:   Thu, 12 Aug 2021 21:29:22 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v5 13/20] drm/gem: Delete gem array fencing helpers
Message-ID: <YRV2ki1DbxwKqGFt@phenom.ffwll.local>
References: <20210805104705.862416-1-daniel.vetter@ffwll.ch>
 <20210805104705.862416-14-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210805104705.862416-14-daniel.vetter@ffwll.ch>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Aug 05, 2021 at 12:46:58PM +0200, Daniel Vetter wrote:
> Integrated into the scheduler now and all users converted over.
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

Some acks would be great here.
-Daniel

> ---
>  drivers/gpu/drm/drm_gem.c | 96 ---------------------------------------
>  include/drm/drm_gem.h     |  5 --
>  2 files changed, 101 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 09c820045859..37e2e2820f08 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -1272,99 +1272,3 @@ drm_gem_unlock_reservations(struct drm_gem_object **objs, int count,
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
> -	int ret;
> -	struct dma_fence **fences;
> -	unsigned int i, fence_count;
> -
> -	if (!write) {
> -		struct dma_fence *fence =
> -			dma_resv_get_excl_unlocked(obj->resv);
> -
> -		return drm_gem_fence_array_add(fence_array, fence);
> -	}
> -
> -	ret = dma_resv_get_fences(obj->resv, NULL,
> -						&fence_count, &fences);
> -	if (ret || !fence_count)
> -		return ret;
> -
> -	for (i = 0; i < fence_count; i++) {
> -		ret = drm_gem_fence_array_add(fence_array, fences[i]);
> -		if (ret)
> -			break;
> -	}
> -
> -	for (; i < fence_count; i++)
> -		dma_fence_put(fences[i]);
> -	kfree(fences);
> -	return ret;
> -}
> -EXPORT_SYMBOL(drm_gem_fence_array_add_implicit);
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index 35e7f44c2a75..e55a767188af 100644
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
> 2.32.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
