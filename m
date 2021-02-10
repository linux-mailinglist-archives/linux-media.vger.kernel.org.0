Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8A41316791
	for <lists+linux-media@lfdr.de>; Wed, 10 Feb 2021 14:11:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231303AbhBJNK6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Feb 2021 08:10:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231148AbhBJNKu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Feb 2021 08:10:50 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CD61C0613D6
        for <linux-media@vger.kernel.org>; Wed, 10 Feb 2021 05:10:08 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id t15so151138wrx.13
        for <linux-media@vger.kernel.org>; Wed, 10 Feb 2021 05:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=iWpF49uMU14UosAzlqwiuNqcUbJ2msT4pOMhzEXf42o=;
        b=TLQvDMdyJuQv+bg7lbkgLu31DaHBHWcxJzQfRZM/sNSAX4Wgt3e2671SIMoZ7Cp/SL
         /2z0y40cdUfQ46Vhb+t42L/I7zOIXoZdcHNwL5LXvGtQW0k1NphtWVn8TGoei+li9qH5
         RiNWOCBswIVy8fUmyMQwnuEY9a/95aRqK/gwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=iWpF49uMU14UosAzlqwiuNqcUbJ2msT4pOMhzEXf42o=;
        b=kvrb3tK+O6M9jMS8jeLC8m8jz2nDgt4zU6Lhnv8DDb2KDdaqjw/rS6TRQl9GKruMtJ
         UzoiaPsUAH4tdmy00DIAfDeXkyXsojXFF10v0c91AbRxXqnBDujMA4Y5GvqbMKXQyAJb
         i0oQHsTlauu2RAct8yXxM0UUI2K3x/4S+tOzC9AX7UB0InEj4E6E4JXRYFXNDWz+oh8t
         mHJD0bqayEa1z08gUhRT9y57L7HD2JCqGaKkQW0A7q4bouGUBzwcUWlttH2JcMcWvsao
         +kLwdTH/oUJZniHVWHE1ovdAuifb8bdK4TJ52aAMtVirDlFY5n9bX7F+mtQsTnCXoJGg
         7Niw==
X-Gm-Message-State: AOAM532bWVxMlOsfcqOxOs91XOvrJ5OJki0mwT1A4Am3q5VXQTE25B4U
        2qpNZfT3ZJrO7F1HFUAJmospKw==
X-Google-Smtp-Source: ABdhPJyNgqJYNeBvHSDQfJEPR/ElqAAJrZui/zdUGShb+Dh4yiyexx3HbrJG83Bc1v/R4mCjOn1lPg==
X-Received: by 2002:a5d:6684:: with SMTP id l4mr3669530wru.111.1612962606385;
        Wed, 10 Feb 2021 05:10:06 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id 16sm2309657wmi.43.2021.02.10.05.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 05:10:05 -0800 (PST)
Date:   Wed, 10 Feb 2021 14:10:03 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     airlied@linux.ie, daniel@ffwll.ch,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        dri-devel@lists.freedesktop.org, linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-tegra@vger.kernel.org, xen-devel@lists.xenproject.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH] drm/gem: Move drm_gem_fb_prepare_fb() to GEM atomic
 helpers
Message-ID: <YCPbK2zFJMzwHim/@phenom.ffwll.local>
References: <20210209102913.6372-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210209102913.6372-1-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Feb 09, 2021 at 11:29:13AM +0100, Thomas Zimmermann wrote:
> The function drm_gem_fb_prepare_fb() is a helper for atomic modesetting,
> but currently located next to framebuffer helpers. Move it to GEM atomic
> helpers, rename it slightly and adopt the drivers. Same for the rsp
> simple-pipe helper.
> 
> Compile-tested with x86-64, aarch64 and arm. The patch is fairly large,
> but there are no functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

If we bikeshed this, I think should also throw in the _helper_ somewhere?
But really I don't have an opinion on this.
-Daniel

> ---
>  drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c     |  4 +-
>  drivers/gpu/drm/drm_gem_atomic_helper.c      | 69 +++++++++++++++++++-
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c | 63 ------------------
>  drivers/gpu/drm/drm_gem_vram_helper.c        |  4 +-
>  drivers/gpu/drm/imx/dcss/dcss-plane.c        |  4 +-
>  drivers/gpu/drm/imx/ipuv3-plane.c            |  4 +-
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c    |  3 +-
>  drivers/gpu/drm/ingenic/ingenic-ipu.c        |  4 +-
>  drivers/gpu/drm/mcde/mcde_display.c          |  4 +-
>  drivers/gpu/drm/mediatek/mtk_drm_plane.c     |  6 +-
>  drivers/gpu/drm/meson/meson_overlay.c        |  8 +--
>  drivers/gpu/drm/meson/meson_plane.c          |  4 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c    |  4 +-
>  drivers/gpu/drm/msm/msm_atomic.c             |  4 +-
>  drivers/gpu/drm/mxsfb/mxsfb_kms.c            |  6 +-
>  drivers/gpu/drm/pl111/pl111_display.c        |  4 +-
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c        |  4 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c  |  3 +-
>  drivers/gpu/drm/stm/ltdc.c                   |  4 +-
>  drivers/gpu/drm/sun4i/sun4i_layer.c          |  4 +-
>  drivers/gpu/drm/sun4i/sun8i_ui_layer.c       |  4 +-
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c       |  4 +-
>  drivers/gpu/drm/tegra/plane.c                |  4 +-
>  drivers/gpu/drm/tidss/tidss_plane.c          |  4 +-
>  drivers/gpu/drm/tiny/hx8357d.c               |  4 +-
>  drivers/gpu/drm/tiny/ili9225.c               |  4 +-
>  drivers/gpu/drm/tiny/ili9341.c               |  4 +-
>  drivers/gpu/drm/tiny/ili9486.c               |  4 +-
>  drivers/gpu/drm/tiny/mi0283qt.c              |  4 +-
>  drivers/gpu/drm/tiny/repaper.c               |  3 +-
>  drivers/gpu/drm/tiny/st7586.c                |  4 +-
>  drivers/gpu/drm/tiny/st7735r.c               |  4 +-
>  drivers/gpu/drm/tve200/tve200_display.c      |  4 +-
>  drivers/gpu/drm/vc4/vc4_plane.c              |  4 +-
>  drivers/gpu/drm/vkms/vkms_plane.c            |  3 +-
>  drivers/gpu/drm/xen/xen_drm_front_kms.c      |  3 +-
>  include/drm/drm_gem_atomic_helper.h          |  8 +++
>  include/drm/drm_gem_framebuffer_helper.h     |  6 +-
>  include/drm/drm_modeset_helper_vtables.h     |  2 +-
>  include/drm/drm_plane.h                      |  4 +-
>  include/drm/drm_simple_kms_helper.h          |  2 +-
>  41 files changed, 152 insertions(+), 141 deletions(-)
> 
> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
> index e54686c31a90..d8f214e0be82 100644
> --- a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
> @@ -9,8 +9,8 @@
>  #include <drm/drm_device.h>
>  #include <drm/drm_fb_cma_helper.h>
>  #include <drm/drm_fourcc.h>
> +#include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_gem_cma_helper.h>
> -#include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_panel.h>
>  #include <drm/drm_simple_kms_helper.h>
>  #include <drm/drm_vblank.h>
> @@ -219,7 +219,7 @@ static const struct drm_simple_display_pipe_funcs aspeed_gfx_funcs = {
>  	.enable		= aspeed_gfx_pipe_enable,
>  	.disable	= aspeed_gfx_pipe_disable,
>  	.update		= aspeed_gfx_pipe_update,
> -	.prepare_fb	= drm_gem_fb_simple_display_pipe_prepare_fb,
> +	.prepare_fb	= drm_gem_simple_display_pipe_prepare_fb,
>  	.enable_vblank	= aspeed_gfx_enable_vblank,
>  	.disable_vblank	= aspeed_gfx_disable_vblank,
>  };
> diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
> index e27762cef360..c656b40656bf 100644
> --- a/drivers/gpu/drm/drm_gem_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
> @@ -1,6 +1,10 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
>  
> +#include <linux/dma-resv.h>
> +
>  #include <drm/drm_atomic_state_helper.h>
> +#include <drm/drm_atomic_uapi.h>
> +#include <drm/drm_gem.h>
>  #include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_simple_kms_helper.h>
> @@ -12,10 +16,69 @@
>   *
>   * The GEM atomic helpers library implements generic atomic-commit
>   * functions for drivers that use GEM objects. Currently, it provides
> - * plane state and framebuffer BO mappings for planes with shadow
> - * buffers.
> + * synchronization helpers, and plane state and framebuffer BO mappings
> + * for planes with shadow buffers.
> + */
> +
> +/*
> + * Plane Helpers
>   */
>  
> +/**
> + * drm_gem_prepare_fb() - Prepare a GEM backed framebuffer
> + * @plane: Plane
> + * @state: Plane state the fence will be attached to
> + *
> + * This function extracts the exclusive fence from &drm_gem_object.resv and
> + * attaches it to plane state for the atomic helper to wait on. This is
> + * necessary to correctly implement implicit synchronization for any buffers
> + * shared as a struct &dma_buf. This function can be used as the
> + * &drm_plane_helper_funcs.prepare_fb callback.
> + *
> + * There is no need for &drm_plane_helper_funcs.cleanup_fb hook for simple
> + * GEM based framebuffer drivers which have their buffers always pinned in
> + * memory.
> + *
> + * See drm_atomic_set_fence_for_plane() for a discussion of implicit and
> + * explicit fencing in atomic modeset updates.
> + */
> +int drm_gem_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
> +{
> +	struct drm_gem_object *obj;
> +	struct dma_fence *fence;
> +
> +	if (!state->fb)
> +		return 0;
> +
> +	obj = drm_gem_fb_get_obj(state->fb, 0);
> +	fence = dma_resv_get_excl_rcu(obj->resv);
> +	drm_atomic_set_fence_for_plane(state, fence);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(drm_gem_prepare_fb);
> +
> +/**
> + * drm_gem_simple_display_pipe_prepare_fb - prepare_fb helper for &drm_simple_display_pipe
> + * @pipe: Simple display pipe
> + * @plane_state: Plane state
> + *
> + * This function uses drm_gem_prepare_fb() to extract the exclusive fence
> + * from &drm_gem_object.resv and attaches it to plane state for the atomic
> + * helper to wait on. This is necessary to correctly implement implicit
> + * synchronization for any buffers shared as a struct &dma_buf. Drivers can use
> + * this as their &drm_simple_display_pipe_funcs.prepare_fb callback.
> + *
> + * See drm_atomic_set_fence_for_plane() for a discussion of implicit and
> + * explicit fencing in atomic modeset updates.
> + */
> +int drm_gem_simple_display_pipe_prepare_fb(struct drm_simple_display_pipe *pipe,
> +					   struct drm_plane_state *plane_state)
> +{
> +	return drm_gem_prepare_fb(&pipe->plane, plane_state);
> +}
> +EXPORT_SYMBOL(drm_gem_simple_display_pipe_prepare_fb);
> +
>  /*
>   * Shadow-buffered Planes
>   */
> @@ -74,7 +137,7 @@ static int drm_gem_prepare_shadow_fb(struct drm_plane *plane, struct drm_plane_s
>  	if (!fb)
>  		return 0;
>  
> -	ret = drm_gem_fb_prepare_fb(plane, plane_state);
> +	ret = drm_gem_prepare_fb(plane, plane_state);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> index 109d11fb4cd4..5ed2067cebb6 100644
> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> @@ -5,13 +5,8 @@
>   * Copyright (C) 2017 Noralf Tr�nnes
>   */
>  
> -#include <linux/dma-buf.h>
> -#include <linux/dma-fence.h>
> -#include <linux/dma-resv.h>
>  #include <linux/slab.h>
>  
> -#include <drm/drm_atomic.h>
> -#include <drm/drm_atomic_uapi.h>
>  #include <drm/drm_damage_helper.h>
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_fourcc.h>
> @@ -19,7 +14,6 @@
>  #include <drm/drm_gem.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_modeset_helper.h>
> -#include <drm/drm_simple_kms_helper.h>
>  
>  #define AFBC_HEADER_SIZE		16
>  #define AFBC_TH_LAYOUT_ALIGNMENT	8
> @@ -432,60 +426,3 @@ int drm_gem_fb_afbc_init(struct drm_device *dev,
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_fb_afbc_init);
> -
> -/**
> - * drm_gem_fb_prepare_fb() - Prepare a GEM backed framebuffer
> - * @plane: Plane
> - * @state: Plane state the fence will be attached to
> - *
> - * This function extracts the exclusive fence from &drm_gem_object.resv and
> - * attaches it to plane state for the atomic helper to wait on. This is
> - * necessary to correctly implement implicit synchronization for any buffers
> - * shared as a struct &dma_buf. This function can be used as the
> - * &drm_plane_helper_funcs.prepare_fb callback.
> - *
> - * There is no need for &drm_plane_helper_funcs.cleanup_fb hook for simple
> - * gem based framebuffer drivers which have their buffers always pinned in
> - * memory.
> - *
> - * See drm_atomic_set_fence_for_plane() for a discussion of implicit and
> - * explicit fencing in atomic modeset updates.
> - */
> -int drm_gem_fb_prepare_fb(struct drm_plane *plane,
> -			  struct drm_plane_state *state)
> -{
> -	struct drm_gem_object *obj;
> -	struct dma_fence *fence;
> -
> -	if (!state->fb)
> -		return 0;
> -
> -	obj = drm_gem_fb_get_obj(state->fb, 0);
> -	fence = dma_resv_get_excl_rcu(obj->resv);
> -	drm_atomic_set_fence_for_plane(state, fence);
> -
> -	return 0;
> -}
> -EXPORT_SYMBOL_GPL(drm_gem_fb_prepare_fb);
> -
> -/**
> - * drm_gem_fb_simple_display_pipe_prepare_fb - prepare_fb helper for
> - *     &drm_simple_display_pipe
> - * @pipe: Simple display pipe
> - * @plane_state: Plane state
> - *
> - * This function uses drm_gem_fb_prepare_fb() to extract the exclusive fence
> - * from &drm_gem_object.resv and attaches it to plane state for the atomic
> - * helper to wait on. This is necessary to correctly implement implicit
> - * synchronization for any buffers shared as a struct &dma_buf. Drivers can use
> - * this as their &drm_simple_display_pipe_funcs.prepare_fb callback.
> - *
> - * See drm_atomic_set_fence_for_plane() for a discussion of implicit and
> - * explicit fencing in atomic modeset updates.
> - */
> -int drm_gem_fb_simple_display_pipe_prepare_fb(struct drm_simple_display_pipe *pipe,
> -					      struct drm_plane_state *plane_state)
> -{
> -	return drm_gem_fb_prepare_fb(&pipe->plane, plane_state);
> -}
> -EXPORT_SYMBOL(drm_gem_fb_simple_display_pipe_prepare_fb);
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
> index 48d4b59d3145..2071ec637df8 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -8,7 +8,7 @@
>  #include <drm/drm_drv.h>
>  #include <drm/drm_file.h>
>  #include <drm/drm_framebuffer.h>
> -#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_gem_ttm_helper.h>
>  #include <drm/drm_gem_vram_helper.h>
>  #include <drm/drm_managed.h>
> @@ -720,7 +720,7 @@ drm_gem_vram_plane_helper_prepare_fb(struct drm_plane *plane,
>  			goto err_drm_gem_vram_unpin;
>  	}
>  
> -	ret = drm_gem_fb_prepare_fb(plane, new_state);
> +	ret = drm_gem_prepare_fb(plane, new_state);
>  	if (ret)
>  		goto err_drm_gem_vram_unpin;
>  
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-plane.c b/drivers/gpu/drm/imx/dcss/dcss-plane.c
> index 03ba88f7f995..092e98fe0cfd 100644
> --- a/drivers/gpu/drm/imx/dcss/dcss-plane.c
> +++ b/drivers/gpu/drm/imx/dcss/dcss-plane.c
> @@ -6,7 +6,7 @@
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_fb_cma_helper.h>
> -#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_gem_cma_helper.h>
>  
>  #include "dcss-dev.h"
> @@ -355,7 +355,7 @@ static void dcss_plane_atomic_disable(struct drm_plane *plane,
>  }
>  
>  static const struct drm_plane_helper_funcs dcss_plane_helper_funcs = {
> -	.prepare_fb = drm_gem_fb_prepare_fb,
> +	.prepare_fb = drm_gem_prepare_fb,
>  	.atomic_check = dcss_plane_atomic_check,
>  	.atomic_update = dcss_plane_atomic_update,
>  	.atomic_disable = dcss_plane_atomic_disable,
> diff --git a/drivers/gpu/drm/imx/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3-plane.c
> index 075508051b5f..0b6d81c4fa77 100644
> --- a/drivers/gpu/drm/imx/ipuv3-plane.c
> +++ b/drivers/gpu/drm/imx/ipuv3-plane.c
> @@ -9,8 +9,8 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_fb_cma_helper.h>
>  #include <drm/drm_fourcc.h>
> +#include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_gem_cma_helper.h>
> -#include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_managed.h>
>  #include <drm/drm_plane_helper.h>
>  
> @@ -704,7 +704,7 @@ static void ipu_plane_atomic_update(struct drm_plane *plane,
>  }
>  
>  static const struct drm_plane_helper_funcs ipu_plane_helper_funcs = {
> -	.prepare_fb = drm_gem_fb_prepare_fb,
> +	.prepare_fb = drm_gem_prepare_fb,
>  	.atomic_check = ipu_plane_atomic_check,
>  	.atomic_disable = ipu_plane_atomic_disable,
>  	.atomic_update = ipu_plane_atomic_update,
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index 7bb31fbee29d..1ca02de60895 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -28,6 +28,7 @@
>  #include <drm/drm_fb_cma_helper.h>
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_fourcc.h>
> +#include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_irq.h>
>  #include <drm/drm_managed.h>
> @@ -780,7 +781,7 @@ static const struct drm_plane_helper_funcs ingenic_drm_plane_helper_funcs = {
>  	.atomic_update		= ingenic_drm_plane_atomic_update,
>  	.atomic_check		= ingenic_drm_plane_atomic_check,
>  	.atomic_disable		= ingenic_drm_plane_atomic_disable,
> -	.prepare_fb		= drm_gem_fb_prepare_fb,
> +	.prepare_fb		= drm_gem_prepare_fb,
>  };
>  
>  static const struct drm_crtc_helper_funcs ingenic_drm_crtc_helper_funcs = {
> diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.c b/drivers/gpu/drm/ingenic/ingenic-ipu.c
> index e52777ef85fd..1b9b5de6b67c 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
> @@ -23,7 +23,7 @@
>  #include <drm/drm_drv.h>
>  #include <drm/drm_fb_cma_helper.h>
>  #include <drm/drm_fourcc.h>
> -#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_plane.h>
>  #include <drm/drm_plane_helper.h>
>  #include <drm/drm_property.h>
> @@ -608,7 +608,7 @@ static const struct drm_plane_helper_funcs ingenic_ipu_plane_helper_funcs = {
>  	.atomic_update		= ingenic_ipu_plane_atomic_update,
>  	.atomic_check		= ingenic_ipu_plane_atomic_check,
>  	.atomic_disable		= ingenic_ipu_plane_atomic_disable,
> -	.prepare_fb		= drm_gem_fb_prepare_fb,
> +	.prepare_fb		= drm_gem_prepare_fb,
>  };
>  
>  static int
> diff --git a/drivers/gpu/drm/mcde/mcde_display.c b/drivers/gpu/drm/mcde/mcde_display.c
> index 7c2e0b865441..dde16ef9650a 100644
> --- a/drivers/gpu/drm/mcde/mcde_display.c
> +++ b/drivers/gpu/drm/mcde/mcde_display.c
> @@ -13,8 +13,8 @@
>  #include <drm/drm_device.h>
>  #include <drm/drm_fb_cma_helper.h>
>  #include <drm/drm_fourcc.h>
> +#include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_gem_cma_helper.h>
> -#include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_mipi_dsi.h>
>  #include <drm/drm_simple_kms_helper.h>
>  #include <drm/drm_bridge.h>
> @@ -1481,7 +1481,7 @@ static struct drm_simple_display_pipe_funcs mcde_display_funcs = {
>  	.update = mcde_display_update,
>  	.enable_vblank = mcde_display_enable_vblank,
>  	.disable_vblank = mcde_display_disable_vblank,
> -	.prepare_fb = drm_gem_fb_simple_display_pipe_prepare_fb,
> +	.prepare_fb = drm_gem_simple_display_pipe_prepare_fb,
>  };
>  
>  int mcde_display_init(struct drm_device *drm)
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> index 92141a19681b..64f7873e9867 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> @@ -6,10 +6,10 @@
>  
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
> -#include <drm/drm_fourcc.h>
>  #include <drm/drm_atomic_uapi.h>
> +#include <drm/drm_fourcc.h>
> +#include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_plane_helper.h>
> -#include <drm/drm_gem_framebuffer_helper.h>
>  
>  #include "mtk_drm_crtc.h"
>  #include "mtk_drm_ddp_comp.h"
> @@ -216,7 +216,7 @@ static void mtk_plane_atomic_update(struct drm_plane *plane,
>  }
>  
>  static const struct drm_plane_helper_funcs mtk_plane_helper_funcs = {
> -	.prepare_fb = drm_gem_fb_prepare_fb,
> +	.prepare_fb = drm_gem_prepare_fb,
>  	.atomic_check = mtk_plane_atomic_check,
>  	.atomic_update = mtk_plane_atomic_update,
>  	.atomic_disable = mtk_plane_atomic_disable,
> diff --git a/drivers/gpu/drm/meson/meson_overlay.c b/drivers/gpu/drm/meson/meson_overlay.c
> index 1ffbbecafa22..0ee2132a990f 100644
> --- a/drivers/gpu/drm/meson/meson_overlay.c
> +++ b/drivers/gpu/drm/meson/meson_overlay.c
> @@ -10,11 +10,11 @@
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_device.h>
> +#include <drm/drm_fb_cma_helper.h>
>  #include <drm/drm_fourcc.h>
> -#include <drm/drm_plane_helper.h>
> +#include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_gem_cma_helper.h>
> -#include <drm/drm_fb_cma_helper.h>
> -#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_plane_helper.h>
>  
>  #include "meson_overlay.h"
>  #include "meson_registers.h"
> @@ -742,7 +742,7 @@ static const struct drm_plane_helper_funcs meson_overlay_helper_funcs = {
>  	.atomic_check	= meson_overlay_atomic_check,
>  	.atomic_disable	= meson_overlay_atomic_disable,
>  	.atomic_update	= meson_overlay_atomic_update,
> -	.prepare_fb	= drm_gem_fb_prepare_fb,
> +	.prepare_fb	= drm_gem_prepare_fb,
>  };
>  
>  static bool meson_overlay_format_mod_supported(struct drm_plane *plane,
> diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meson/meson_plane.c
> index 35338ed18209..24d64c9675ff 100644
> --- a/drivers/gpu/drm/meson/meson_plane.c
> +++ b/drivers/gpu/drm/meson/meson_plane.c
> @@ -16,8 +16,8 @@
>  #include <drm/drm_device.h>
>  #include <drm/drm_fb_cma_helper.h>
>  #include <drm/drm_fourcc.h>
> +#include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_gem_cma_helper.h>
> -#include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_plane_helper.h>
>  
>  #include "meson_plane.h"
> @@ -417,7 +417,7 @@ static const struct drm_plane_helper_funcs meson_plane_helper_funcs = {
>  	.atomic_check	= meson_plane_atomic_check,
>  	.atomic_disable	= meson_plane_atomic_disable,
>  	.atomic_update	= meson_plane_atomic_update,
> -	.prepare_fb	= drm_gem_fb_prepare_fb,
> +	.prepare_fb	= drm_gem_prepare_fb,
>  };
>  
>  static bool meson_plane_format_mod_supported(struct drm_plane *plane,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index bc0231a50132..3e9f9f3dd679 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -13,7 +13,7 @@
>  #include <drm/drm_atomic_uapi.h>
>  #include <drm/drm_damage_helper.h>
>  #include <drm/drm_file.h>
> -#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_gem_atomic_helper.h>
>  
>  #include "msm_drv.h"
>  #include "dpu_kms.h"
> @@ -892,7 +892,7 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
>  	 *       we can use msm_atomic_prepare_fb() instead of doing the
>  	 *       implicit fence and fb prepare by hand here.
>  	 */
> -	drm_gem_fb_prepare_fb(plane, new_state);
> +	drm_gem_prepare_fb(plane, new_state);
>  
>  	if (pstate->aspace) {
>  		ret = msm_framebuffer_prepare(new_state->fb,
> diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
> index 6a326761dc4a..03a113eb6571 100644
> --- a/drivers/gpu/drm/msm/msm_atomic.c
> +++ b/drivers/gpu/drm/msm/msm_atomic.c
> @@ -5,7 +5,7 @@
>   */
>  
>  #include <drm/drm_atomic_uapi.h>
> -#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_vblank.h>
>  
>  #include "msm_atomic_trace.h"
> @@ -22,7 +22,7 @@ int msm_atomic_prepare_fb(struct drm_plane *plane,
>  	if (!new_state->fb)
>  		return 0;
>  
> -	drm_gem_fb_prepare_fb(plane, new_state);
> +	drm_gem_prepare_fb(plane, new_state);
>  
>  	return msm_framebuffer_prepare(new_state->fb, kms->aspace);
>  }
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> index 3e1bb0aefb87..33188dea886d 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> @@ -21,8 +21,8 @@
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_fb_cma_helper.h>
>  #include <drm/drm_fourcc.h>
> +#include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_gem_cma_helper.h>
> -#include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_plane.h>
>  #include <drm/drm_plane_helper.h>
>  #include <drm/drm_vblank.h>
> @@ -495,13 +495,13 @@ static bool mxsfb_format_mod_supported(struct drm_plane *plane,
>  }
>  
>  static const struct drm_plane_helper_funcs mxsfb_plane_primary_helper_funcs = {
> -	.prepare_fb = drm_gem_fb_prepare_fb,
> +	.prepare_fb = drm_gem_prepare_fb,
>  	.atomic_check = mxsfb_plane_atomic_check,
>  	.atomic_update = mxsfb_plane_primary_atomic_update,
>  };
>  
>  static const struct drm_plane_helper_funcs mxsfb_plane_overlay_helper_funcs = {
> -	.prepare_fb = drm_gem_fb_prepare_fb,
> +	.prepare_fb = drm_gem_prepare_fb,
>  	.atomic_check = mxsfb_plane_atomic_check,
>  	.atomic_update = mxsfb_plane_overlay_atomic_update,
>  };
> diff --git a/drivers/gpu/drm/pl111/pl111_display.c b/drivers/gpu/drm/pl111/pl111_display.c
> index 69c02e7c82b7..6fd7f13f1aca 100644
> --- a/drivers/gpu/drm/pl111/pl111_display.c
> +++ b/drivers/gpu/drm/pl111/pl111_display.c
> @@ -17,8 +17,8 @@
>  
>  #include <drm/drm_fb_cma_helper.h>
>  #include <drm/drm_fourcc.h>
> +#include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_gem_cma_helper.h>
> -#include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_vblank.h>
>  
>  #include "pl111_drm.h"
> @@ -440,7 +440,7 @@ static struct drm_simple_display_pipe_funcs pl111_display_funcs = {
>  	.enable = pl111_display_enable,
>  	.disable = pl111_display_disable,
>  	.update = pl111_display_update,
> -	.prepare_fb = drm_gem_fb_simple_display_pipe_prepare_fb,
> +	.prepare_fb = drm_gem_simple_display_pipe_prepare_fb,
>  };
>  
>  static int pl111_clk_div_choose_div(struct clk_hw *hw, unsigned long rate,
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> index 53221d8473c1..964fdaee7c7d 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> @@ -11,8 +11,8 @@
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_fb_cma_helper.h>
>  #include <drm/drm_fourcc.h>
> +#include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_gem_cma_helper.h>
> -#include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_managed.h>
>  #include <drm/drm_plane_helper.h>
>  #include <drm/drm_vblank.h>
> @@ -236,7 +236,7 @@ static int rcar_du_vsp_plane_prepare_fb(struct drm_plane *plane,
>  	if (ret < 0)
>  		return ret;
>  
> -	return drm_gem_fb_prepare_fb(plane, state);
> +	return drm_gem_prepare_fb(plane, state);
>  }
>  
>  void rcar_du_vsp_unmap_fb(struct rcar_du_vsp *vsp, struct drm_framebuffer *fb,
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> index 8d15cabdcb02..45577de18b49 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> @@ -23,6 +23,7 @@
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_flip_work.h>
>  #include <drm/drm_fourcc.h>
> +#include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_plane_helper.h>
>  #include <drm/drm_probe_helper.h>
> @@ -1096,7 +1097,7 @@ static const struct drm_plane_helper_funcs plane_helper_funcs = {
>  	.atomic_disable = vop_plane_atomic_disable,
>  	.atomic_async_check = vop_plane_atomic_async_check,
>  	.atomic_async_update = vop_plane_atomic_async_update,
> -	.prepare_fb = drm_gem_fb_prepare_fb,
> +	.prepare_fb = drm_gem_prepare_fb,
>  };
>  
>  static const struct drm_plane_funcs vop_plane_funcs = {
> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> index 7812094f93d6..73522c6ba3eb 100644
> --- a/drivers/gpu/drm/stm/ltdc.c
> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -26,8 +26,8 @@
>  #include <drm/drm_device.h>
>  #include <drm/drm_fb_cma_helper.h>
>  #include <drm/drm_fourcc.h>
> +#include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_gem_cma_helper.h>
> -#include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_of.h>
>  #include <drm/drm_plane_helper.h>
>  #include <drm/drm_probe_helper.h>
> @@ -911,7 +911,7 @@ static const struct drm_plane_funcs ltdc_plane_funcs = {
>  };
>  
>  static const struct drm_plane_helper_funcs ltdc_plane_helper_funcs = {
> -	.prepare_fb = drm_gem_fb_prepare_fb,
> +	.prepare_fb = drm_gem_prepare_fb,
>  	.atomic_check = ltdc_plane_atomic_check,
>  	.atomic_update = ltdc_plane_atomic_update,
>  	.atomic_disable = ltdc_plane_atomic_disable,
> diff --git a/drivers/gpu/drm/sun4i/sun4i_layer.c b/drivers/gpu/drm/sun4i/sun4i_layer.c
> index acfbfd4463a1..68da94b7c35d 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_layer.c
> @@ -7,7 +7,7 @@
>   */
>  
>  #include <drm/drm_atomic_helper.h>
> -#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_plane_helper.h>
>  
>  #include "sun4i_backend.h"
> @@ -122,7 +122,7 @@ static bool sun4i_layer_format_mod_supported(struct drm_plane *plane,
>  }
>  
>  static const struct drm_plane_helper_funcs sun4i_backend_layer_helper_funcs = {
> -	.prepare_fb	= drm_gem_fb_prepare_fb,
> +	.prepare_fb	= drm_gem_prepare_fb,
>  	.atomic_disable	= sun4i_backend_layer_atomic_disable,
>  	.atomic_update	= sun4i_backend_layer_atomic_update,
>  };
> diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> index 816ad4ce8996..95654c153279 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> @@ -14,8 +14,8 @@
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_fb_cma_helper.h>
>  #include <drm/drm_fourcc.h>
> +#include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_gem_cma_helper.h>
> -#include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_plane_helper.h>
>  #include <drm/drm_probe_helper.h>
>  
> @@ -299,7 +299,7 @@ static void sun8i_ui_layer_atomic_update(struct drm_plane *plane,
>  }
>  
>  static const struct drm_plane_helper_funcs sun8i_ui_layer_helper_funcs = {
> -	.prepare_fb	= drm_gem_fb_prepare_fb,
> +	.prepare_fb	= drm_gem_prepare_fb,
>  	.atomic_check	= sun8i_ui_layer_atomic_check,
>  	.atomic_disable	= sun8i_ui_layer_atomic_disable,
>  	.atomic_update	= sun8i_ui_layer_atomic_update,
> diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> index 8cc294a9969d..4005884dbce4 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> @@ -7,8 +7,8 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_fb_cma_helper.h>
> +#include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_gem_cma_helper.h>
> -#include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_plane_helper.h>
>  #include <drm/drm_probe_helper.h>
>  
> @@ -402,7 +402,7 @@ static void sun8i_vi_layer_atomic_update(struct drm_plane *plane,
>  }
>  
>  static const struct drm_plane_helper_funcs sun8i_vi_layer_helper_funcs = {
> -	.prepare_fb	= drm_gem_fb_prepare_fb,
> +	.prepare_fb	= drm_gem_prepare_fb,
>  	.atomic_check	= sun8i_vi_layer_atomic_check,
>  	.atomic_disable	= sun8i_vi_layer_atomic_disable,
>  	.atomic_update	= sun8i_vi_layer_atomic_update,
> diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/plane.c
> index 539d14935728..ec86a8d060aa 100644
> --- a/drivers/gpu/drm/tegra/plane.c
> +++ b/drivers/gpu/drm/tegra/plane.c
> @@ -8,7 +8,7 @@
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_fourcc.h>
> -#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_plane_helper.h>
>  
>  #include "dc.h"
> @@ -198,7 +198,7 @@ int tegra_plane_prepare_fb(struct drm_plane *plane,
>  	if (!state->fb)
>  		return 0;
>  
> -	drm_gem_fb_prepare_fb(plane, state);
> +	drm_gem_prepare_fb(plane, state);
>  
>  	return tegra_dc_pin(dc, to_tegra_plane_state(state));
>  }
> diff --git a/drivers/gpu/drm/tidss/tidss_plane.c b/drivers/gpu/drm/tidss/tidss_plane.c
> index 35067ae674ea..d39baa66e876 100644
> --- a/drivers/gpu/drm/tidss/tidss_plane.c
> +++ b/drivers/gpu/drm/tidss/tidss_plane.c
> @@ -10,7 +10,7 @@
>  #include <drm/drm_crtc_helper.h>
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_fb_cma_helper.h>
> -#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_gem_atomic_helper.h>
>  
>  #include "tidss_crtc.h"
>  #include "tidss_dispc.h"
> @@ -151,7 +151,7 @@ static void drm_plane_destroy(struct drm_plane *plane)
>  }
>  
>  static const struct drm_plane_helper_funcs tidss_plane_helper_funcs = {
> -	.prepare_fb = drm_gem_fb_prepare_fb,
> +	.prepare_fb = drm_gem_prepare_fb,
>  	.atomic_check = tidss_plane_atomic_check,
>  	.atomic_update = tidss_plane_atomic_update,
>  	.atomic_disable = tidss_plane_atomic_disable,
> diff --git a/drivers/gpu/drm/tiny/hx8357d.c b/drivers/gpu/drm/tiny/hx8357d.c
> index c6525cd02bc2..3e2c2868a363 100644
> --- a/drivers/gpu/drm/tiny/hx8357d.c
> +++ b/drivers/gpu/drm/tiny/hx8357d.c
> @@ -19,8 +19,8 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_fb_helper.h>
> +#include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_gem_cma_helper.h>
> -#include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_managed.h>
>  #include <drm/drm_mipi_dbi.h>
>  #include <drm/drm_modeset_helper.h>
> @@ -184,7 +184,7 @@ static const struct drm_simple_display_pipe_funcs hx8357d_pipe_funcs = {
>  	.enable = yx240qv29_enable,
>  	.disable = mipi_dbi_pipe_disable,
>  	.update = mipi_dbi_pipe_update,
> -	.prepare_fb = drm_gem_fb_simple_display_pipe_prepare_fb,
> +	.prepare_fb = drm_gem_simple_display_pipe_prepare_fb,
>  };
>  
>  static const struct drm_display_mode yx350hv15_mode = {
> diff --git a/drivers/gpu/drm/tiny/ili9225.c b/drivers/gpu/drm/tiny/ili9225.c
> index 8e98962db5a2..6b87df19eec1 100644
> --- a/drivers/gpu/drm/tiny/ili9225.c
> +++ b/drivers/gpu/drm/tiny/ili9225.c
> @@ -22,8 +22,8 @@
>  #include <drm/drm_fb_cma_helper.h>
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_fourcc.h>
> +#include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_gem_cma_helper.h>
> -#include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_managed.h>
>  #include <drm/drm_mipi_dbi.h>
>  #include <drm/drm_rect.h>
> @@ -328,7 +328,7 @@ static const struct drm_simple_display_pipe_funcs ili9225_pipe_funcs = {
>  	.enable		= ili9225_pipe_enable,
>  	.disable	= ili9225_pipe_disable,
>  	.update		= ili9225_pipe_update,
> -	.prepare_fb	= drm_gem_fb_simple_display_pipe_prepare_fb,
> +	.prepare_fb	= drm_gem_simple_display_pipe_prepare_fb,
>  };
>  
>  static const struct drm_display_mode ili9225_mode = {
> diff --git a/drivers/gpu/drm/tiny/ili9341.c b/drivers/gpu/drm/tiny/ili9341.c
> index 6ce97f0698eb..a97f3f70e4a6 100644
> --- a/drivers/gpu/drm/tiny/ili9341.c
> +++ b/drivers/gpu/drm/tiny/ili9341.c
> @@ -18,8 +18,8 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_fb_helper.h>
> +#include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_gem_cma_helper.h>
> -#include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_managed.h>
>  #include <drm/drm_mipi_dbi.h>
>  #include <drm/drm_modeset_helper.h>
> @@ -140,7 +140,7 @@ static const struct drm_simple_display_pipe_funcs ili9341_pipe_funcs = {
>  	.enable = yx240qv29_enable,
>  	.disable = mipi_dbi_pipe_disable,
>  	.update = mipi_dbi_pipe_update,
> -	.prepare_fb = drm_gem_fb_simple_display_pipe_prepare_fb,
> +	.prepare_fb = drm_gem_simple_display_pipe_prepare_fb,
>  };
>  
>  static const struct drm_display_mode yx240qv29_mode = {
> diff --git a/drivers/gpu/drm/tiny/ili9486.c b/drivers/gpu/drm/tiny/ili9486.c
> index d7ce40eb166a..6422a7f67079 100644
> --- a/drivers/gpu/drm/tiny/ili9486.c
> +++ b/drivers/gpu/drm/tiny/ili9486.c
> @@ -17,8 +17,8 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_fb_helper.h>
> +#include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_gem_cma_helper.h>
> -#include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_managed.h>
>  #include <drm/drm_mipi_dbi.h>
>  #include <drm/drm_modeset_helper.h>
> @@ -153,7 +153,7 @@ static const struct drm_simple_display_pipe_funcs waveshare_pipe_funcs = {
>  	.enable = waveshare_enable,
>  	.disable = mipi_dbi_pipe_disable,
>  	.update = mipi_dbi_pipe_update,
> -	.prepare_fb = drm_gem_fb_simple_display_pipe_prepare_fb,
> +	.prepare_fb = drm_gem_simple_display_pipe_prepare_fb,
>  };
>  
>  static const struct drm_display_mode waveshare_mode = {
> diff --git a/drivers/gpu/drm/tiny/mi0283qt.c b/drivers/gpu/drm/tiny/mi0283qt.c
> index ff77f983f803..dc76fe53aa72 100644
> --- a/drivers/gpu/drm/tiny/mi0283qt.c
> +++ b/drivers/gpu/drm/tiny/mi0283qt.c
> @@ -16,8 +16,8 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_fb_helper.h>
> +#include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_gem_cma_helper.h>
> -#include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_managed.h>
>  #include <drm/drm_mipi_dbi.h>
>  #include <drm/drm_modeset_helper.h>
> @@ -144,7 +144,7 @@ static const struct drm_simple_display_pipe_funcs mi0283qt_pipe_funcs = {
>  	.enable = mi0283qt_enable,
>  	.disable = mipi_dbi_pipe_disable,
>  	.update = mipi_dbi_pipe_update,
> -	.prepare_fb = drm_gem_fb_simple_display_pipe_prepare_fb,
> +	.prepare_fb = drm_gem_simple_display_pipe_prepare_fb,
>  };
>  
>  static const struct drm_display_mode mi0283qt_mode = {
> diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
> index 11c602fc9897..2cee07a2e00b 100644
> --- a/drivers/gpu/drm/tiny/repaper.c
> +++ b/drivers/gpu/drm/tiny/repaper.c
> @@ -29,6 +29,7 @@
>  #include <drm/drm_fb_cma_helper.h>
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_format_helper.h>
> +#include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_gem_cma_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_managed.h>
> @@ -860,7 +861,7 @@ static const struct drm_simple_display_pipe_funcs repaper_pipe_funcs = {
>  	.enable = repaper_pipe_enable,
>  	.disable = repaper_pipe_disable,
>  	.update = repaper_pipe_update,
> -	.prepare_fb = drm_gem_fb_simple_display_pipe_prepare_fb,
> +	.prepare_fb = drm_gem_simple_display_pipe_prepare_fb,
>  };
>  
>  static int repaper_connector_get_modes(struct drm_connector *connector)
> diff --git a/drivers/gpu/drm/tiny/st7586.c b/drivers/gpu/drm/tiny/st7586.c
> index ff5cf60f4bd7..7d216fe9267f 100644
> --- a/drivers/gpu/drm/tiny/st7586.c
> +++ b/drivers/gpu/drm/tiny/st7586.c
> @@ -19,8 +19,8 @@
>  #include <drm/drm_fb_cma_helper.h>
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_format_helper.h>
> +#include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_gem_cma_helper.h>
> -#include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_managed.h>
>  #include <drm/drm_mipi_dbi.h>
>  #include <drm/drm_rect.h>
> @@ -268,7 +268,7 @@ static const struct drm_simple_display_pipe_funcs st7586_pipe_funcs = {
>  	.enable		= st7586_pipe_enable,
>  	.disable	= st7586_pipe_disable,
>  	.update		= st7586_pipe_update,
> -	.prepare_fb	= drm_gem_fb_simple_display_pipe_prepare_fb,
> +	.prepare_fb	= drm_gem_simple_display_pipe_prepare_fb,
>  };
>  
>  static const struct drm_display_mode st7586_mode = {
> diff --git a/drivers/gpu/drm/tiny/st7735r.c b/drivers/gpu/drm/tiny/st7735r.c
> index faaba0a033ea..df8872d62cdd 100644
> --- a/drivers/gpu/drm/tiny/st7735r.c
> +++ b/drivers/gpu/drm/tiny/st7735r.c
> @@ -19,8 +19,8 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_fb_helper.h>
> +#include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_gem_cma_helper.h>
> -#include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_managed.h>
>  #include <drm/drm_mipi_dbi.h>
>  
> @@ -136,7 +136,7 @@ static const struct drm_simple_display_pipe_funcs st7735r_pipe_funcs = {
>  	.enable		= st7735r_pipe_enable,
>  	.disable	= mipi_dbi_pipe_disable,
>  	.update		= mipi_dbi_pipe_update,
> -	.prepare_fb	= drm_gem_fb_simple_display_pipe_prepare_fb,
> +	.prepare_fb	= drm_gem_simple_display_pipe_prepare_fb,
>  };
>  
>  static const struct st7735r_cfg jd_t18003_t01_cfg = {
> diff --git a/drivers/gpu/drm/tve200/tve200_display.c b/drivers/gpu/drm/tve200/tve200_display.c
> index cb0e837d3dba..50e1fb71869f 100644
> --- a/drivers/gpu/drm/tve200/tve200_display.c
> +++ b/drivers/gpu/drm/tve200/tve200_display.c
> @@ -17,8 +17,8 @@
>  
>  #include <drm/drm_fb_cma_helper.h>
>  #include <drm/drm_fourcc.h>
> +#include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_gem_cma_helper.h>
> -#include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_panel.h>
>  #include <drm/drm_vblank.h>
>  
> @@ -316,7 +316,7 @@ static const struct drm_simple_display_pipe_funcs tve200_display_funcs = {
>  	.enable = tve200_display_enable,
>  	.disable = tve200_display_disable,
>  	.update = tve200_display_update,
> -	.prepare_fb = drm_gem_fb_simple_display_pipe_prepare_fb,
> +	.prepare_fb = drm_gem_simple_display_pipe_prepare_fb,
>  	.enable_vblank = tve200_display_enable_vblank,
>  	.disable_vblank = tve200_display_disable_vblank,
>  };
> diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
> index 7322169c0682..a65e980078f3 100644
> --- a/drivers/gpu/drm/vc4/vc4_plane.c
> +++ b/drivers/gpu/drm/vc4/vc4_plane.c
> @@ -20,7 +20,7 @@
>  #include <drm/drm_atomic_uapi.h>
>  #include <drm/drm_fb_cma_helper.h>
>  #include <drm/drm_fourcc.h>
> -#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_plane_helper.h>
>  
>  #include "uapi/drm/vc4_drm.h"
> @@ -1250,7 +1250,7 @@ static int vc4_prepare_fb(struct drm_plane *plane,
>  
>  	bo = to_vc4_bo(&drm_fb_cma_get_gem_obj(state->fb, 0)->base);
>  
> -	drm_gem_fb_prepare_fb(plane, state);
> +	drm_gem_prepare_fb(plane, state);
>  
>  	if (plane->state->fb == state->fb)
>  		return 0;
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> index 0824327cc860..e3fd8cd1f3f1 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -5,6 +5,7 @@
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_fourcc.h>
> +#include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_plane_helper.h>
>  #include <drm/drm_gem_shmem_helper.h>
> @@ -159,7 +160,7 @@ static int vkms_prepare_fb(struct drm_plane *plane,
>  	if (ret)
>  		DRM_ERROR("vmap failed: %d\n", ret);
>  
> -	return drm_gem_fb_prepare_fb(plane, state);
> +	return drm_gem_prepare_fb(plane, state);
>  }
>  
>  static void vkms_cleanup_fb(struct drm_plane *plane,
> diff --git a/drivers/gpu/drm/xen/xen_drm_front_kms.c b/drivers/gpu/drm/xen/xen_drm_front_kms.c
> index ef11b1e4de39..371202ebe900 100644
> --- a/drivers/gpu/drm/xen/xen_drm_front_kms.c
> +++ b/drivers/gpu/drm/xen/xen_drm_front_kms.c
> @@ -13,6 +13,7 @@
>  #include <drm/drm_drv.h>
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_gem.h>
> +#include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_vblank.h>
> @@ -301,7 +302,7 @@ static const struct drm_simple_display_pipe_funcs display_funcs = {
>  	.mode_valid = display_mode_valid,
>  	.enable = display_enable,
>  	.disable = display_disable,
> -	.prepare_fb = drm_gem_fb_simple_display_pipe_prepare_fb,
> +	.prepare_fb = drm_gem_simple_display_pipe_prepare_fb,
>  	.check = display_check,
>  	.update = display_update,
>  };
> diff --git a/include/drm/drm_gem_atomic_helper.h b/include/drm/drm_gem_atomic_helper.h
> index 08b96ccea325..91e73d23fea8 100644
> --- a/include/drm/drm_gem_atomic_helper.h
> +++ b/include/drm/drm_gem_atomic_helper.h
> @@ -9,6 +9,14 @@
>  
>  struct drm_simple_display_pipe;
>  
> +/*
> + * Plane Helpers
> + */
> +
> +int drm_gem_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state);
> +int drm_gem_simple_display_pipe_prepare_fb(struct drm_simple_display_pipe *pipe,
> +					   struct drm_plane_state *plane_state);
> +
>  /*
>   * Helpers for planes with shadow buffers
>   */
> diff --git a/include/drm/drm_gem_framebuffer_helper.h b/include/drm/drm_gem_framebuffer_helper.h
> index 6b013154911d..495d174d9989 100644
> --- a/include/drm/drm_gem_framebuffer_helper.h
> +++ b/include/drm/drm_gem_framebuffer_helper.h
> @@ -9,9 +9,11 @@ struct drm_framebuffer;
>  struct drm_framebuffer_funcs;
>  struct drm_gem_object;
>  struct drm_mode_fb_cmd2;
> +#if 0
>  struct drm_plane;
>  struct drm_plane_state;
>  struct drm_simple_display_pipe;
> +#endif
>  
>  #define AFBC_VENDOR_AND_TYPE_MASK	GENMASK_ULL(63, 52)
>  
> @@ -44,8 +46,4 @@ int drm_gem_fb_afbc_init(struct drm_device *dev,
>  			 const struct drm_mode_fb_cmd2 *mode_cmd,
>  			 struct drm_afbc_framebuffer *afbc_fb);
>  
> -int drm_gem_fb_prepare_fb(struct drm_plane *plane,
> -			  struct drm_plane_state *state);
> -int drm_gem_fb_simple_display_pipe_prepare_fb(struct drm_simple_display_pipe *pipe,
> -					      struct drm_plane_state *plane_state);
>  #endif
> diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
> index eb706342861d..8d41d3734153 100644
> --- a/include/drm/drm_modeset_helper_vtables.h
> +++ b/include/drm/drm_modeset_helper_vtables.h
> @@ -1179,7 +1179,7 @@ struct drm_plane_helper_funcs {
>  	 * members in the plane structure.
>  	 *
>  	 * Drivers which always have their buffers pinned should use
> -	 * drm_gem_fb_prepare_fb() for this hook.
> +	 * drm_gem_prepare_fb() for this hook.
>  	 *
>  	 * The helpers will call @cleanup_fb with matching arguments for every
>  	 * successful call to this hook.
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index 95ab14a4336a..be08b6b1fde0 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -79,8 +79,8 @@ struct drm_plane_state {
>  	 * preserved.
>  	 *
>  	 * Drivers should store any implicit fence in this from their
> -	 * &drm_plane_helper_funcs.prepare_fb callback. See drm_gem_fb_prepare_fb()
> -	 * and drm_gem_fb_simple_display_pipe_prepare_fb() for suitable helpers.
> +	 * &drm_plane_helper_funcs.prepare_fb callback. See drm_gem_prepare_fb()
> +	 * and drm_gem_simple_display_pipe_prepare_fb() for suitable helpers.
>  	 */
>  	struct dma_fence *fence;
>  
> diff --git a/include/drm/drm_simple_kms_helper.h b/include/drm/drm_simple_kms_helper.h
> index 40b34573249f..ef9944e9c5fc 100644
> --- a/include/drm/drm_simple_kms_helper.h
> +++ b/include/drm/drm_simple_kms_helper.h
> @@ -117,7 +117,7 @@ struct drm_simple_display_pipe_funcs {
>  	 * more details.
>  	 *
>  	 * Drivers which always have their buffers pinned should use
> -	 * drm_gem_fb_simple_display_pipe_prepare_fb() for this hook.
> +	 * drm_gem_simple_display_pipe_prepare_fb() for this hook.
>  	 */
>  	int (*prepare_fb)(struct drm_simple_display_pipe *pipe,
>  			  struct drm_plane_state *plane_state);
> -- 
> 2.30.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
