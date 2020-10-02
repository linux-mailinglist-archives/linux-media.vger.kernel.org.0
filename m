Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEE462813A3
	for <lists+linux-media@lfdr.de>; Fri,  2 Oct 2020 15:04:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387717AbgJBNEq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Oct 2020 09:04:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726176AbgJBNEq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Oct 2020 09:04:46 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34994C0613D0
        for <linux-media@vger.kernel.org>; Fri,  2 Oct 2020 06:04:46 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id c18so1744634wrm.9
        for <linux-media@vger.kernel.org>; Fri, 02 Oct 2020 06:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=BRdG+Sv9lbvsBV80MeJ5uYgZhZMNFbaqhIia52Zq8gE=;
        b=ld4XU9dC3LDxekGn7GamKDrYPL7jSfU1sRt03W6y6ZG7Aj0ZYozjOKbQG2CqnDAQ+a
         Wm85y42hH9jUGUKeb3Qq0XMhu73F73vVo9TsKURGxDLRrOQhbtc2wTcM+8/StKpZWy9v
         y7aSSQFwbsgDSwiglVqPKSeUy1LEYeYYNmeDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=BRdG+Sv9lbvsBV80MeJ5uYgZhZMNFbaqhIia52Zq8gE=;
        b=pGTEETsW6eB1Yxvty8rUPwqppn06ite7D+KrXFlqMmz8+0FoahBcmlxBg6SdDkQBQn
         lIXGj4lP4lxrDLUOLUwhnosksHq9rmI1TJ8Dg0EObE5AzkjeJKLg2jomxhVUbbYp4EoN
         DahMvhHimjrfNmu5m9un4Xp62kVPZ0CQbde95I9/28m8Weytjo1XXhF10yogr6eO8tz6
         g47UDIcr+1r6/QfkATqYtxvLeOyXoRzoQl/8v/zHsQ4qeXAxA/RX816/uHNossxXHEI9
         WEmrs7V3pNroXr7ataB77vREjg1VH8HvimTotazNqoPfz9SZpXxx4dN+Nfvrrg8AVyx/
         5o/A==
X-Gm-Message-State: AOAM533NKX1u+v8mUDUQmDyeTPGgJAvBwcjDoaqhvDXtrPj6iYdFOHxo
        OcBSPQEYLpMFtGz1RGyx2zW74A==
X-Google-Smtp-Source: ABdhPJyzB9ctK1WKL4a99n8wsCE482hZW17HPxIJTgRxw4A/5rqlGoYgwqEr/r2ZqiiE1CWrWADjIQ==
X-Received: by 2002:adf:e8c3:: with SMTP id k3mr3054113wrn.228.1601643884841;
        Fri, 02 Oct 2020 06:04:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id d13sm1695267wrp.44.2020.10.02.06.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 06:04:43 -0700 (PDT)
Date:   Fri, 2 Oct 2020 15:04:40 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org,
        alexander.deucher@amd.com, christian.koenig@amd.com,
        kraxel@redhat.com, l.stach@pengutronix.de,
        linux+etnaviv@armlinux.org.uk, christian.gmeiner@gmail.com,
        inki.dae@samsung.com, jy0922.shim@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com,
        kgene@kernel.org, krzk@kernel.org, yuq825@gmail.com,
        bskeggs@redhat.com, robh@kernel.org, tomeu.vizoso@collabora.com,
        steven.price@arm.com, alyssa.rosenzweig@collabora.com,
        hjc@rock-chips.com, heiko@sntech.de, hdegoede@redhat.com,
        sean@poorly.run, eric@anholt.net, oleksandr_andrushchenko@epam.com,
        ray.huang@amd.com, sumit.semwal@linaro.org,
        emil.velikov@collabora.com, luben.tuikov@amd.com, apaneers@amd.com,
        linus.walleij@linaro.org, melissa.srw@gmail.com,
        chris@chris-wilson.co.uk, miaoqinglang@huawei.com,
        dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        etnaviv@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
        nouveau@lists.freedesktop.org, spice-devel@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org, xen-devel@lists.xenproject.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v3 4/7] drm/gem: Update internal GEM vmap/vunmap
 interfaces to use struct dma_buf_map
Message-ID: <20201002130440.GK438822@phenom.ffwll.local>
References: <20200929151437.19717-1-tzimmermann@suse.de>
 <20200929151437.19717-5-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200929151437.19717-5-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Sep 29, 2020 at 05:14:34PM +0200, Thomas Zimmermann wrote:
> GEM's vmap and vunmap interfaces now wrap memory pointers in struct
> dma_buf_map.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_client.c   | 18 +++++++++++-------
>  drivers/gpu/drm/drm_gem.c      | 28 ++++++++++++++--------------
>  drivers/gpu/drm/drm_internal.h |  5 +++--
>  drivers/gpu/drm/drm_prime.c    | 14 ++++----------
>  4 files changed, 32 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
> index 495f47d23d87..ac0082bed966 100644
> --- a/drivers/gpu/drm/drm_client.c
> +++ b/drivers/gpu/drm/drm_client.c
> @@ -3,6 +3,7 @@
>   * Copyright 2018 Noralf Trønnes
>   */
>  
> +#include <linux/dma-buf-map.h>
>  #include <linux/list.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> @@ -304,7 +305,8 @@ drm_client_buffer_create(struct drm_client_dev *client, u32 width, u32 height, u
>   */
>  void *drm_client_buffer_vmap(struct drm_client_buffer *buffer)
>  {
> -	void *vaddr;
> +	struct dma_buf_map map;
> +	int ret;
>  
>  	if (buffer->vaddr)
>  		return buffer->vaddr;
> @@ -317,13 +319,13 @@ void *drm_client_buffer_vmap(struct drm_client_buffer *buffer)
>  	 * fd_install step out of the driver backend hooks, to make that
>  	 * final step optional for internal users.
>  	 */
> -	vaddr = drm_gem_vmap(buffer->gem);
> -	if (IS_ERR(vaddr))
> -		return vaddr;
> +	ret = drm_gem_vmap(buffer->gem, &map);
> +	if (ret)
> +		return ERR_PTR(ret);
>  
> -	buffer->vaddr = vaddr;
> +	buffer->vaddr = map.vaddr;
>  
> -	return vaddr;
> +	return map.vaddr;
>  }
>  EXPORT_SYMBOL(drm_client_buffer_vmap);
>  
> @@ -337,7 +339,9 @@ EXPORT_SYMBOL(drm_client_buffer_vmap);
>   */
>  void drm_client_buffer_vunmap(struct drm_client_buffer *buffer)
>  {
> -	drm_gem_vunmap(buffer->gem, buffer->vaddr);
> +	struct dma_buf_map map = DMA_BUF_MAP_INIT_VADDR(buffer->vaddr);
> +
> +	drm_gem_vunmap(buffer->gem, &map);
>  	buffer->vaddr = NULL;
>  }
>  EXPORT_SYMBOL(drm_client_buffer_vunmap);
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 0c4a66dea5c2..f2b2f37d41c4 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -1205,32 +1205,32 @@ void drm_gem_unpin(struct drm_gem_object *obj)
>  		obj->funcs->unpin(obj);
>  }
>  
> -void *drm_gem_vmap(struct drm_gem_object *obj)
> +int drm_gem_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
>  {
> -	struct dma_buf_map map;
>  	int ret;
>  
> -	if (!obj->funcs->vmap) {
> -		return ERR_PTR(-EOPNOTSUPP);
> +	if (!obj->funcs->vmap)
> +		return -EOPNOTSUPP;
>  
> -	ret = obj->funcs->vmap(obj, &map);
> +	ret = obj->funcs->vmap(obj, map);
>  	if (ret)
> -		return ERR_PTR(ret);
> -	else if (dma_buf_map_is_null(&map))
> -		return ERR_PTR(-ENOMEM);
> +		return ret;
> +	else if (dma_buf_map_is_null(map))
> +		return -ENOMEM;
>  
> -	return map.vaddr;
> +	return 0;
>  }
>  
> -void drm_gem_vunmap(struct drm_gem_object *obj, void *vaddr)
> +void drm_gem_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map)
>  {
> -	struct dma_buf_map map = DMA_BUF_MAP_INIT_VADDR(vaddr);
> -
> -	if (!vaddr)
> +	if (dma_buf_map_is_null(map))
>  		return;
>  
>  	if (obj->funcs->vunmap)
> -		obj->funcs->vunmap(obj, &map);
> +		obj->funcs->vunmap(obj, map);
> +
> +	/* Always set the mapping to NULL. Callers may rely on this. */
> +	dma_buf_map_clear(map);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> index b65865c630b0..58832d75a9bd 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -33,6 +33,7 @@
>  
>  struct dentry;
>  struct dma_buf;
> +struct dma_buf_map;
>  struct drm_connector;
>  struct drm_crtc;
>  struct drm_framebuffer;
> @@ -187,8 +188,8 @@ void drm_gem_print_info(struct drm_printer *p, unsigned int indent,
>  
>  int drm_gem_pin(struct drm_gem_object *obj);
>  void drm_gem_unpin(struct drm_gem_object *obj);
> -void *drm_gem_vmap(struct drm_gem_object *obj);
> -void drm_gem_vunmap(struct drm_gem_object *obj, void *vaddr);
> +int drm_gem_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
> +void drm_gem_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map);
>  
>  /* drm_debugfs.c drm_debugfs_crc.c */
>  #if defined(CONFIG_DEBUG_FS)
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 89e2a2496734..cb8fbeeb731b 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -667,21 +667,15 @@ EXPORT_SYMBOL(drm_gem_unmap_dma_buf);
>   *
>   * Sets up a kernel virtual mapping. This can be used as the &dma_buf_ops.vmap
>   * callback. Calls into &drm_gem_object_funcs.vmap for device specific handling.
> + * The kernel virtual address is returned in map.
>   *
> - * Returns the kernel virtual address or NULL on failure.
> + * Returns 0 on success or a negative errno code otherwise.
>   */
>  int drm_gem_dmabuf_vmap(struct dma_buf *dma_buf, struct dma_buf_map *map)
>  {
>  	struct drm_gem_object *obj = dma_buf->priv;
> -	void *vaddr;
>  
> -	vaddr = drm_gem_vmap(obj);
> -	if (IS_ERR(vaddr))
> -		return PTR_ERR(vaddr);
> -
> -	dma_buf_map_set_vaddr(map, vaddr);
> -
> -	return 0;
> +	return drm_gem_vmap(obj, map);
>  }
>  EXPORT_SYMBOL(drm_gem_dmabuf_vmap);
>  
> @@ -697,7 +691,7 @@ void drm_gem_dmabuf_vunmap(struct dma_buf *dma_buf, struct dma_buf_map *map)
>  {
>  	struct drm_gem_object *obj = dma_buf->priv;
>  
> -	drm_gem_vunmap(obj, map->vaddr);
> +	drm_gem_vunmap(obj, map);
>  }
>  EXPORT_SYMBOL(drm_gem_dmabuf_vunmap);

Some of the transitional stuff disappearing!

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>  
> -- 
> 2.28.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
