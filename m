Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12F6935821D
	for <lists+linux-media@lfdr.de>; Thu,  8 Apr 2021 13:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231134AbhDHLko (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Apr 2021 07:40:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229921AbhDHLkn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Apr 2021 07:40:43 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB2EDC061761
        for <linux-media@vger.kernel.org>; Thu,  8 Apr 2021 04:40:31 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id k128so1033798wmk.4
        for <linux-media@vger.kernel.org>; Thu, 08 Apr 2021 04:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=FzJ5ukUAxMTdvYbU0dY36FSLXhgIfuX6wIMsxJm4zCk=;
        b=D6vM216dt5Jl0WDf/SC04ZRKghV1KWZRChfBgm0QtNf9Q5QItQU7F5BdCtI5smfPMW
         UKgJuvdpnNlHwF0e+RzCANvdJ//IQct2iMAlU94kwJIiTkyxmaj6BMYNn6aJ/B/3Lvfo
         GD8YySotn1IwUwmP6vC0plhdhzT2OmFGcIzkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=FzJ5ukUAxMTdvYbU0dY36FSLXhgIfuX6wIMsxJm4zCk=;
        b=VPeW4ZbcJJkgw07arUgBvF98NTFVP1ENHRMQOvFh8jeU5xTHdnsiiySPW2U+JCfja6
         sdlX3cdBgcgKKLH9PF3McXc8jm4c0E7k6OB/opuUDpOMggCbtprpZKIviJC8aF2DKwu+
         /Cvq8GSAIh1RbGDYiHonT/X1OTkJUu+/ke3qGIPB6KgF0d+/zrfhcSaEipYbLxS04h5o
         ehypXZ1j+CIQnuEbgxSLhVcDJY3+mPt/aBbWNmHH/j525FWlVNzMNzdBeJoZl4MRPpZU
         cIpXE21wKww2Q4SmNP6JmhIbaaQ2AlyK+LQyjwh02En6IFo1YjutNMlmwVQI46cHtMb7
         9wKA==
X-Gm-Message-State: AOAM530tVCrQrOBglQeWwPT9QRcHws1kRx03mLCnHH/CIT/oP3oa1oU/
        S0zv2JNhsM9cG1XDMh4kuIqdoA==
X-Google-Smtp-Source: ABdhPJw+0vxFoUCt5nv3uQx94h878yf10vKPhimJ14X7/Thn5YycOgjQ/Blicg9bVBkXY4gCjGs3nw==
X-Received: by 2002:a1c:b689:: with SMTP id g131mr7717312wmf.138.1617882029495;
        Thu, 08 Apr 2021 04:40:29 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id e13sm51100126wrg.72.2021.04.08.04.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 04:40:28 -0700 (PDT)
Date:   Thu, 8 Apr 2021 13:40:26 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     David Stevens <stevensd@chromium.org>
Cc:     Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH] drm/syncobj: use newly allocated stub fences
Message-ID: <YG7rqkzLRBubwtk4@phenom.ffwll.local>
Mail-Followup-To: David Stevens <stevensd@chromium.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20210408093448.3897988-1-stevensd@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210408093448.3897988-1-stevensd@google.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Apr 08, 2021 at 06:34:48PM +0900, David Stevens wrote:
> From: David Stevens <stevensd@chromium.org>
> 
> Allocate a new private stub fence in drm_syncobj_assign_null_handle,
> instead of using a static stub fence.
> 
> When userspace creates a fence with DRM_SYNCOBJ_CREATE_SIGNALED or when
> userspace signals a fence via DRM_IOCTL_SYNCOBJ_SIGNAL, the timestamp
> obtained when the fence is exported and queried with SYNC_IOC_FILE_INFO
> should match when the fence's status was changed from the perspective of
> userspace, which is during the respective ioctl.
> 
> When a static stub fence started being used in by these ioctls, this
> behavior changed. Instead, the timestamp returned by SYNC_IOC_FILE_INFO
> became the first time anything used the static stub fence, which has no
> meaning to userspace.
> 
> Signed-off-by: David Stevens <stevensd@chromium.org>

Is there also an igt patch to enforce this in the drm_syncobj testcases?
Would be really good to have that too.
-Daniel

> ---
>  drivers/dma-buf/dma-fence.c   | 33 ++++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/drm_syncobj.c | 28 ++++++++++++++++++++--------
>  include/linux/dma-fence.h     |  1 +
>  3 files changed, 53 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index d64fc03929be..6081eb962490 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -26,6 +26,11 @@ EXPORT_TRACEPOINT_SYMBOL(dma_fence_signaled);
>  static DEFINE_SPINLOCK(dma_fence_stub_lock);
>  static struct dma_fence dma_fence_stub;
>  
> +struct drm_fence_private_stub {
> +	struct dma_fence base;
> +	spinlock_t lock;
> +};
> +
>  /*
>   * fence context counter: each execution context should have its own
>   * fence context, this allows checking if fences belong to the same
> @@ -123,7 +128,9 @@ static const struct dma_fence_ops dma_fence_stub_ops = {
>  /**
>   * dma_fence_get_stub - return a signaled fence
>   *
> - * Return a stub fence which is already signaled.
> + * Return a stub fence which is already signaled. The fence's
> + * timestamp corresponds to the first time after boot this
> + * function is called.
>   */
>  struct dma_fence *dma_fence_get_stub(void)
>  {
> @@ -141,6 +148,30 @@ struct dma_fence *dma_fence_get_stub(void)
>  }
>  EXPORT_SYMBOL(dma_fence_get_stub);
>  
> +/**
> + * dma_fence_allocate_private_stub - return a private, signaled fence
> + *
> + * Return a newly allocated and signaled stub fence.
> + */
> +struct dma_fence *dma_fence_allocate_private_stub(void)
> +{
> +	struct drm_fence_private_stub *fence;
> +
> +	fence = kzalloc(sizeof(*fence), GFP_KERNEL);
> +	if (fence == NULL)
> +		return ERR_PTR(-ENOMEM);
> +
> +	spin_lock_init(&fence->lock);
> +	dma_fence_init(&fence->base,
> +		       &dma_fence_stub_ops,
> +		       &fence->lock,
> +		       0, 0);
> +	dma_fence_signal(&fence->base);
> +
> +	return &fence->base;
> +}
> +EXPORT_SYMBOL(dma_fence_allocate_private_stub);
> +
>  /**
>   * dma_fence_context_alloc - allocate an array of fence contexts
>   * @num: amount of contexts to allocate
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index 349146049849..c6125e57ae37 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -350,12 +350,15 @@ EXPORT_SYMBOL(drm_syncobj_replace_fence);
>   *
>   * Assign a already signaled stub fence to the sync object.
>   */
> -static void drm_syncobj_assign_null_handle(struct drm_syncobj *syncobj)
> +static int drm_syncobj_assign_null_handle(struct drm_syncobj *syncobj)
>  {
> -	struct dma_fence *fence = dma_fence_get_stub();
> +       struct dma_fence *fence = dma_fence_allocate_private_stub();
> +       if (IS_ERR(fence))
> +	       return PTR_ERR(fence);
>  
> -	drm_syncobj_replace_fence(syncobj, fence);
> -	dma_fence_put(fence);
> +       drm_syncobj_replace_fence(syncobj, fence);
> +       dma_fence_put(fence);
> +       return 0;
>  }
>  
>  /* 5s default for wait submission */
> @@ -469,6 +472,7 @@ EXPORT_SYMBOL(drm_syncobj_free);
>  int drm_syncobj_create(struct drm_syncobj **out_syncobj, uint32_t flags,
>  		       struct dma_fence *fence)
>  {
> +	int ret;
>  	struct drm_syncobj *syncobj;
>  
>  	syncobj = kzalloc(sizeof(struct drm_syncobj), GFP_KERNEL);
> @@ -479,8 +483,13 @@ int drm_syncobj_create(struct drm_syncobj **out_syncobj, uint32_t flags,
>  	INIT_LIST_HEAD(&syncobj->cb_list);
>  	spin_lock_init(&syncobj->lock);
>  
> -	if (flags & DRM_SYNCOBJ_CREATE_SIGNALED)
> -		drm_syncobj_assign_null_handle(syncobj);
> +	if (flags & DRM_SYNCOBJ_CREATE_SIGNALED) {
> +		ret = drm_syncobj_assign_null_handle(syncobj);
> +		if (ret < 0) {
> +			drm_syncobj_put(syncobj);
> +			return ret;
> +		}
> +	}
>  
>  	if (fence)
>  		drm_syncobj_replace_fence(syncobj, fence);
> @@ -1322,8 +1331,11 @@ drm_syncobj_signal_ioctl(struct drm_device *dev, void *data,
>  	if (ret < 0)
>  		return ret;
>  
> -	for (i = 0; i < args->count_handles; i++)
> -		drm_syncobj_assign_null_handle(syncobjs[i]);
> +	for (i = 0; i < args->count_handles; i++) {
> +		ret = drm_syncobj_assign_null_handle(syncobjs[i]);
> +		if (ret < 0)
> +			break;
> +	}
>  
>  	drm_syncobj_array_free(syncobjs, args->count_handles);
>  
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index 9f12efaaa93a..6ffb4b2c6371 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -587,6 +587,7 @@ static inline signed long dma_fence_wait(struct dma_fence *fence, bool intr)
>  }
>  
>  struct dma_fence *dma_fence_get_stub(void);
> +struct dma_fence *dma_fence_allocate_private_stub(void);
>  u64 dma_fence_context_alloc(unsigned num);
>  
>  #define DMA_FENCE_TRACE(f, fmt, args...) \
> -- 
> 2.31.0.208.g409f899ff0-goog
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
