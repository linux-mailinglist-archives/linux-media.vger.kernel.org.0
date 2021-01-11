Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EE042F1BC9
	for <lists+linux-media@lfdr.de>; Mon, 11 Jan 2021 18:07:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730357AbhAKRHI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jan 2021 12:07:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727753AbhAKRHI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jan 2021 12:07:08 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F549C061786
        for <linux-media@vger.kernel.org>; Mon, 11 Jan 2021 09:06:27 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id 91so513295wrj.7
        for <linux-media@vger.kernel.org>; Mon, 11 Jan 2021 09:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=p7Uc2OyCpbZc27r6+RhlQios2u1l6dYrQyaRRy//21k=;
        b=kuotTnsOzNzbbq3i4nOilnPGqxJC4JBrJeu+7gf3kPgh40xQZWqDosulRpinytv8op
         TTL/t4wkczzGW71GV/L28Dg0id7cqSdsvZbAOTxpr7v0PTUsbHHCb0DHjRigdiOpDuku
         oiFMysSetGPniYcfzDCXrOR0tVdsXrhgUU7a4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=p7Uc2OyCpbZc27r6+RhlQios2u1l6dYrQyaRRy//21k=;
        b=EtgcGzHSTa2wNf0L/w34M0mrUh/pXytUixyjQdTgaTLkgi+lMsFTNl8yBRpEO2BSSc
         k6tinC8DCFA/E6Njva74v9BSh9LhZtDET0aYkC5pGFdDuwi8zRmEmA40E9mgj+aYFOES
         bb3446uP3DIT7Ng0QBInRsmcWDO/Y+bLE2RCKvBqfXGg4fA78Ccw9hjeQHG7f0pSmn/Q
         msQf5pQ57cQ3G1sbD9xcB3vti9BAmClv6WHcqmAq4/FN6rC1LwqcM6RViaLMX7R3LsEJ
         XT6PZyGakaVzA4P2Jqtk6ZUl+2dikU78PqylBMTyhiJqDK+HkxbQjgOZtM8f8M7mnPZb
         UhzQ==
X-Gm-Message-State: AOAM532l448vx/869h9VlhbZ9UC67mJ+CrwSERK8aMctyHPEdsvrohB+
        dGAGza1RikIR+Zl+NZbtqy55gQ==
X-Google-Smtp-Source: ABdhPJyegMlvqCqOihCDnGvYO+RAtSicUNBZxCpbQB3gvjm2ZoKp8GO/MFPQDu1494yGCJmdOUhrwg==
X-Received: by 2002:adf:b1ca:: with SMTP id r10mr122544wra.252.1610384786298;
        Mon, 11 Jan 2021 09:06:26 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id r20sm326591wrg.66.2021.01.11.09.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 09:06:25 -0800 (PST)
Date:   Mon, 11 Jan 2021 18:06:23 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     sumit.semwal@linaro.org, christian.koenig@amd.com,
        airlied@redhat.com, daniel@ffwll.ch,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        kraxel@redhat.com, hdegoede@redhat.com, sean@poorly.run,
        eric@anholt.net, sam@ravnborg.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH v4 11/13] drm/vboxvideo: Use drm_gem_vram_vmap_local() in
 cursor update
Message-ID: <X/yFj9zIdW52UKk4@phenom.ffwll.local>
References: <20210108094340.15290-1-tzimmermann@suse.de>
 <20210108094340.15290-12-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210108094340.15290-12-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jan 08, 2021 at 10:43:38AM +0100, Thomas Zimmermann wrote:
> Cursor updates in vboxvideo require a short-term mapping of the
> source BO. Use drm_gem_vram_vmap_local() and avoid the pinning
> operations.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

All these drivers patches break the dma_resv_lock vs
dma_fence_begin/end_signalling nesting rules, so this doesn't work.

Generally this is what the prepare/cleanup_fb hooks are for, that's where
mappings (including vmaps) are meant to be set up, permanently.

I'm kinda not clear on why we need all these changes, I thought the
locking problem is just in the fb helper paths, because it's outside of
the atomic path and could conflict with an atomic update at the same time?
So only that one should get the vmap_local treatment, everything else
should keep the normal vmap treatment.
-Daniel
> ---
>  drivers/gpu/drm/vboxvideo/vbox_mode.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vboxvideo/vbox_mode.c
> index dbc0dd53c69e..215b37c78c10 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
> @@ -381,7 +381,8 @@ static void vbox_cursor_atomic_update(struct drm_plane *plane,
>  		container_of(plane->dev, struct vbox_private, ddev);
>  	struct vbox_crtc *vbox_crtc = to_vbox_crtc(plane->state->crtc);
>  	struct drm_framebuffer *fb = plane->state->fb;
> -	struct drm_gem_vram_object *gbo = drm_gem_vram_of_gem(fb->obj[0]);
> +	struct drm_gem_object *obj = fb->obj[0];
> +	struct drm_gem_vram_object *gbo = drm_gem_vram_of_gem(obj);
>  	u32 width = plane->state->crtc_w;
>  	u32 height = plane->state->crtc_h;
>  	size_t data_size, mask_size;
> @@ -401,11 +402,12 @@ static void vbox_cursor_atomic_update(struct drm_plane *plane,
>  
>  	vbox_crtc->cursor_enabled = true;
>  
> -	ret = drm_gem_vram_vmap(gbo, &map);
> +	ret = dma_resv_lock(obj->resv, NULL);
> +	if (ret)
> +		return;
> +	ret = drm_gem_vram_vmap_local(gbo, &map);
>  	if (ret) {
> -		/*
> -		 * BUG: we should have pinned the BO in prepare_fb().
> -		 */
> +		dma_resv_unlock(obj->resv);
>  		mutex_unlock(&vbox->hw_mutex);
>  		DRM_WARN("Could not map cursor bo, skipping update\n");
>  		return;
> @@ -421,7 +423,8 @@ static void vbox_cursor_atomic_update(struct drm_plane *plane,
>  	data_size = width * height * 4 + mask_size;
>  
>  	copy_cursor_image(src, vbox->cursor_data, width, height, mask_size);
> -	drm_gem_vram_vunmap(gbo, &map);
> +	drm_gem_vram_vunmap_local(gbo, &map);
> +	dma_resv_unlock(obj->resv);
>  
>  	flags = VBOX_MOUSE_POINTER_VISIBLE | VBOX_MOUSE_POINTER_SHAPE |
>  		VBOX_MOUSE_POINTER_ALPHA;
> -- 
> 2.29.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
