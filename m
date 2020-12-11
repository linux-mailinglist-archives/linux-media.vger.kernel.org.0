Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E06722D7357
	for <lists+linux-media@lfdr.de>; Fri, 11 Dec 2020 11:04:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405735AbgLKKDn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Dec 2020 05:03:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394098AbgLKKDc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Dec 2020 05:03:32 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A115AC0613CF
        for <linux-media@vger.kernel.org>; Fri, 11 Dec 2020 02:02:51 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id a6so7035087wmc.2
        for <linux-media@vger.kernel.org>; Fri, 11 Dec 2020 02:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mTuKBk3C/3X76hOG0w8lx61nUDvWBKEJ69TOQ0mlXgA=;
        b=JR/zLRsPiH3O0tRuMUpzppzVpIGdPGfvPucgH2LkrZ5XtZGXvsKVwN576oM5s2qPhQ
         TJX+wLuZXM+Qo0Cqosk7Pf2krN/zHK2QeEK+aBtDcxWs6uAM1MxFdFTxK1j22wNwLYHA
         UIHBLVWVYe0VZHXcFMzZCpNzWbPDL4eyBWn58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mTuKBk3C/3X76hOG0w8lx61nUDvWBKEJ69TOQ0mlXgA=;
        b=PJEmplOU1GxDbWFaaZPYJmRRXnIP1RxhM5rEZI5h/miG6bf6iiHt+CBSIpQN2Pz1xA
         HXjqttf6tDgxe3ujZvfLYogidvP+cUWwSUD83U1+pS1umM32cq9aHU/Y4FAYEAsTx8EK
         c4+m0S+UTXnn0aAuWOKS0qQViu8Zn+0Y2YeZyYi7Wk0OYd6yKHHcEMs5ejYO3p0yXdAr
         IG6n2UawOObj1t/p0ZH82v9BSZxYP1Jr2jdHRUgwogYMXpAIgLU8iIFbssxmmOP1b9jD
         zg+5DTK5KsZOgLKWdIhUC0oIoSmygaP4Atv1EtRb70Z6dmbUpyIwKCk4dX6y+xD19hXY
         WV7g==
X-Gm-Message-State: AOAM531N5w8z6+X4mIXiXopD3/N8tomy5lltG27xRiEYH1ErmUKas4C6
        uVcjGlAYgZaRIA54JfjiKDdArA==
X-Google-Smtp-Source: ABdhPJyTBf0iwScHXvSJGXt8CW6VWiYLkdsBFn4324eyY+JcNiRT9NAicuQZ0tAxgT35YR0E16K1dA==
X-Received: by 2002:a1c:4c0a:: with SMTP id z10mr12459778wmf.95.1607680970334;
        Fri, 11 Dec 2020 02:02:50 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id m21sm13711303wml.13.2020.12.11.02.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 02:02:49 -0800 (PST)
Date:   Fri, 11 Dec 2020 11:02:47 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     daniel@ffwll.ch, christian.koenig@amd.com, airlied@linux.ie,
        sumit.semwal@linaro.org, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, kraxel@redhat.com, hdegoede@redhat.com,
        sean@poorly.run, eric@anholt.net, sam@ravnborg.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH v3 5/8] drm/cma-helper: Provide a vmap function for
 short-term mappings
Message-ID: <20201211100247.GO401619@phenom.ffwll.local>
References: <20201209142527.26415-1-tzimmermann@suse.de>
 <20201209142527.26415-6-tzimmermann@suse.de>
 <20201211094000.GK401619@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201211094000.GK401619@phenom.ffwll.local>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Dec 11, 2020 at 10:40:00AM +0100, Daniel Vetter wrote:
> On Wed, Dec 09, 2020 at 03:25:24PM +0100, Thomas Zimmermann wrote:
> > Implementations of the vmap/vunmap GEM callbacks may perform pinning
> > of the BO and may acquire the associated reservation object's lock.
> > Callers that only require a mapping of the contained memory can thus
> > interfere with other tasks that require exact pinning, such as scanout.
> > This is less of an issue with private CMA buffers, but may happen
> > with imported ones.
> > 
> > Therefore provide the new interface drm_gem_cma_vmap_local(), which only
> > performs the vmap operations. Callers have to hold the reservation lock
> > while the mapping persists.
> > 
> > This patch also connects GEM CMA helpers to the GEM object function with
> > equivalent functionality.
> > 
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > ---
> >  drivers/gpu/drm/drm_gem_cma_helper.c | 35 ++++++++++++++++++++++++++++
> >  drivers/gpu/drm/vc4/vc4_bo.c         | 13 +++++++++++
> >  drivers/gpu/drm/vc4/vc4_drv.h        |  1 +
> >  include/drm/drm_gem_cma_helper.h     |  1 +
> >  4 files changed, 50 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
> > index 7942cf05cd93..40b3e8e3fc42 100644
> > --- a/drivers/gpu/drm/drm_gem_cma_helper.c
> > +++ b/drivers/gpu/drm/drm_gem_cma_helper.c
> > @@ -38,6 +38,7 @@ static const struct drm_gem_object_funcs drm_gem_cma_default_funcs = {
> >  	.print_info = drm_gem_cma_print_info,
> >  	.get_sg_table = drm_gem_cma_get_sg_table,
> >  	.vmap = drm_gem_cma_vmap,
> > +	.vmap_local = drm_gem_cma_vmap_local,
> >  	.mmap = drm_gem_cma_mmap,
> >  	.vm_ops = &drm_gem_cma_vm_ops,
> >  };
> > @@ -471,6 +472,40 @@ int drm_gem_cma_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
> >  }
> >  EXPORT_SYMBOL_GPL(drm_gem_cma_vmap);
> >  
> > +/**
> > + * drm_gem_cma_vmap_local - map a CMA GEM object into the kernel's virtual
> > + *     address space
> > + * @obj: GEM object
> > + * @map: Returns the kernel virtual address of the CMA GEM object's backing
> > + *       store.
> > + *
> > + * This function maps a buffer into the kernel's
> > + * virtual address space. Since the CMA buffers are already mapped into the
> > + * kernel virtual address space this simply returns the cached virtual
> > + * address. Drivers using the CMA helpers should set this as their DRM
> > + * driver's &drm_gem_object_funcs.vmap_local callback.
> > + *
> > + * Returns:
> > + * 0 on success, or a negative error code otherwise.
> > + */
> > +int drm_gem_cma_vmap_local(struct drm_gem_object *obj, struct dma_buf_map *map)
> > +{
> > +	struct drm_gem_cma_object *cma_obj = to_drm_gem_cma_obj(obj);
> > +
> > +	/*
> > +	 * TODO: The code in drm_gem_cma_prime_import_sg_table_vmap()
> > +	 *       establishes this mapping. The correct solution would
> > +	 *       be to call dma_buf_vmap_local() here.
> > +	 *
> > +	 *       If we find a case where we absolutely have to call
> > +	 *       dma_buf_vmap_local(), the code needs to be restructured.
> 
> dma_buf_vmap_local is only relevant for dynamic importers, pinning at
> import time is actually what you get anyway. That's what Christian meant
> with his comments for the ->pin hook. So the TODO here doesn't make sense
> imo, just delete it. We're very far away from making cma dynamic :-)
> 
> > +	 */
> > +	dma_buf_map_set_vaddr(map, cma_obj->vaddr);
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(drm_gem_cma_vmap_local);
> > +
> >  /**
> >   * drm_gem_cma_mmap - memory-map an exported CMA GEM object
> >   * @obj: GEM object
> > diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
> > index dc316cb79e00..ec57326c69c4 100644
> > --- a/drivers/gpu/drm/vc4/vc4_bo.c
> > +++ b/drivers/gpu/drm/vc4/vc4_bo.c
> > @@ -387,6 +387,7 @@ static const struct drm_gem_object_funcs vc4_gem_object_funcs = {
> >  	.export = vc4_prime_export,
> >  	.get_sg_table = drm_gem_cma_get_sg_table,
> >  	.vmap = vc4_prime_vmap,
> > +	.vmap_local = vc4_prime_vmap_local,
> >  	.vm_ops = &vc4_vm_ops,
> >  };
> >  
> > @@ -797,6 +798,18 @@ int vc4_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
> >  	return drm_gem_cma_vmap(obj, map);
> >  }
> >  
> > +int vc4_prime_vmap_local(struct drm_gem_object *obj, struct dma_buf_map *map)
> > +{
> > +	struct vc4_bo *bo = to_vc4_bo(obj);
> > +
> > +	if (bo->validated_shader) {
> 
> This freaks me out. It should be impossible to export a validated shader
> as a dma-buf, and indeed the check exists already.
> 
> All the wrapper functions here are imo pointless. Either we should remove
> them, or replace the if with a BUG_ON here since if that ever happens we
> have a security bug already. I'd go with removing, less code. Maybe throw
> a patch on top?

On 2nd thought, since I asked for the driver parts to be split out in all
the follow-up patches. Maybe best if you do the removal of these wrappers
here first, that gets rid of the vc4 changes in this patch here too.
-Daniel

> 
> Anyway this patch looks good, with the todo deleted:
> 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> 
> > +		DRM_DEBUG("mmaping of shader BOs not allowed.\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	return drm_gem_cma_vmap_local(obj, map);
> > +}
> > +
> >  struct drm_gem_object *
> >  vc4_prime_import_sg_table(struct drm_device *dev,
> >  			  struct dma_buf_attachment *attach,
> > diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
> > index 43a1af110b3e..efb6c47d318f 100644
> > --- a/drivers/gpu/drm/vc4/vc4_drv.h
> > +++ b/drivers/gpu/drm/vc4/vc4_drv.h
> > @@ -812,6 +812,7 @@ struct drm_gem_object *vc4_prime_import_sg_table(struct drm_device *dev,
> >  						 struct dma_buf_attachment *attach,
> >  						 struct sg_table *sgt);
> >  int vc4_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
> > +int vc4_prime_vmap_local(struct drm_gem_object *obj, struct dma_buf_map *map);
> >  int vc4_bo_cache_init(struct drm_device *dev);
> >  int vc4_bo_inc_usecnt(struct vc4_bo *bo);
> >  void vc4_bo_dec_usecnt(struct vc4_bo *bo);
> > diff --git a/include/drm/drm_gem_cma_helper.h b/include/drm/drm_gem_cma_helper.h
> > index 0a9711caa3e8..05122e71bc6d 100644
> > --- a/include/drm/drm_gem_cma_helper.h
> > +++ b/include/drm/drm_gem_cma_helper.h
> > @@ -99,6 +99,7 @@ drm_gem_cma_prime_import_sg_table(struct drm_device *dev,
> >  				  struct dma_buf_attachment *attach,
> >  				  struct sg_table *sgt);
> >  int drm_gem_cma_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
> > +int drm_gem_cma_vmap_local(struct drm_gem_object *obj, struct dma_buf_map *map);
> >  int drm_gem_cma_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
> >  
> >  /**
> > -- 
> > 2.29.2
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
