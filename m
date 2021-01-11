Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 176342F1B93
	for <lists+linux-media@lfdr.de>; Mon, 11 Jan 2021 17:55:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389157AbhAKQy0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jan 2021 11:54:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387574AbhAKQy0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jan 2021 11:54:26 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4BE0C061794
        for <linux-media@vger.kernel.org>; Mon, 11 Jan 2021 08:53:45 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id a6so413397wmc.2
        for <linux-media@vger.kernel.org>; Mon, 11 Jan 2021 08:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BKC0evkXZWcyXdGHOdDWdLxv+2YIG23jjrv2ITmXGIQ=;
        b=f2cIISkhKkxD+6ziwoDlFIC/KnEne4zqVI9ATW8WxcwU7HfEthL+03Wj3lkxUchqS3
         /WGreq/q3CYEM1yc7ykmE2LcR8/EDk3++qTMvmg2dDKFRxjFyuVKdjbu82HfncPHeu2C
         4Mqi+7z550gOUOI+aHrTfXZ2RuzUNOGr1tf3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BKC0evkXZWcyXdGHOdDWdLxv+2YIG23jjrv2ITmXGIQ=;
        b=FG6uigPnGAij6oWP1JXvE/fczFG6eBkprsju8Ht+jhL+E9RQxq2t777R71tjuuzxgX
         7GcGYJgyxEPILGLXg4ZOxdeAUvFtKWz55qrV1m5Hr/ZDTApfieQFecIi6RyjcIsiA9qk
         vjrwOhvqm2YjtI8r6zcPchoRMqgc6ypmC0tQN674b7i2KHIGPJGslva42V7bx1/anTMF
         OEk2CfANevI12FaC4VapwezS5VQ2JULE986L+1q143LRXGdz0gxPSXnh3UsrGKHElDPI
         sCUCmsdI57d9z/XsYsqOCcKVZK1edcfEqQzBwKbG1c+I6bDQF7vEBWha/TjzFMGHIOLK
         DW9g==
X-Gm-Message-State: AOAM531oZyV1koxjKqCti0wTG6ug15Rlhu41CfHOT4SU88Pkx/wp/GPS
        F5TvXjm0U5LzwTgOHe5uFKpViA==
X-Google-Smtp-Source: ABdhPJyVeudWNsRG/VKpD0MFuEfV8F2YrsSfFQ/sscFBJ0jdG0Vu75xdwPKdNjqVKbdnVXqp/usYtQ==
X-Received: by 2002:a1c:2182:: with SMTP id h124mr545791wmh.25.1610384024539;
        Mon, 11 Jan 2021 08:53:44 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id u83sm440737wmu.12.2021.01.11.08.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 08:53:43 -0800 (PST)
Date:   Mon, 11 Jan 2021 17:53:41 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     sumit.semwal@linaro.org, christian.koenig@amd.com,
        airlied@redhat.com, daniel@ffwll.ch,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        kraxel@redhat.com, hdegoede@redhat.com, sean@poorly.run,
        eric@anholt.net, sam@ravnborg.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH v4 05/13] drm/mgag200: Use drm_gem_shmem_vmap_local() in
 damage handling
Message-ID: <X/yClQZQ0B5AMfEP@phenom.ffwll.local>
References: <20210108094340.15290-1-tzimmermann@suse.de>
 <20210108094340.15290-6-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210108094340.15290-6-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jan 08, 2021 at 10:43:32AM +0100, Thomas Zimmermann wrote:
> Damage handling in mgag200 requires a short-term mapping of the source
> BO. Use drm_gem_shmem_vmap_local().
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/mgag200/mgag200_mode.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
> index 1dfc42170059..a33e28d4c5e9 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> @@ -1552,22 +1552,32 @@ mgag200_handle_damage(struct mga_device *mdev, struct drm_framebuffer *fb,
>  		      struct drm_rect *clip)
>  {
>  	struct drm_device *dev = &mdev->base;
> +	struct drm_gem_object *obj = fb->obj[0];
>  	struct dma_buf_map map;
>  	void *vmap;
>  	int ret;
>  
> -	ret = drm_gem_shmem_vmap(fb->obj[0], &map);
> +	ret = dma_resv_lock(obj->resv, NULL);
>  	if (drm_WARN_ON(dev, ret))
> -		return; /* BUG: SHMEM BO should always be vmapped */
> +		return;
> +	ret = drm_gem_shmem_vmap_local(obj, &map);
> +	if (drm_WARN_ON(dev, ret))
> +		goto err_dma_resv_unlock; /* BUG: SHMEM BO should always be vmapped */
>  	vmap = map.vaddr; /* TODO: Use mapping abstraction properly */
>  
>  	drm_fb_memcpy_dstclip(mdev->vram, vmap, fb, clip);
>  
> -	drm_gem_shmem_vunmap(fb->obj[0], &map);
> +	drm_gem_shmem_vunmap_local(obj, &map);
> +	dma_resv_unlock(obj->resv);
>  
>  	/* Always scanout image at VRAM offset 0 */
>  	mgag200_set_startadd(mdev, (u32)0);
>  	mgag200_set_offset(mdev, fb);
> +
> +	return;
> +
> +err_dma_resv_unlock:
> +	dma_resv_unlock(obj->resv);
>  }
>  
>  static void
> -- 
> 2.29.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
