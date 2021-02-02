Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4756530C825
	for <lists+linux-media@lfdr.de>; Tue,  2 Feb 2021 18:44:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237792AbhBBRm5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Feb 2021 12:42:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234089AbhBBOMQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Feb 2021 09:12:16 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9655FC061573
        for <linux-media@vger.kernel.org>; Tue,  2 Feb 2021 06:11:34 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id j11so1779078wmi.3
        for <linux-media@vger.kernel.org>; Tue, 02 Feb 2021 06:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=nNUotO5RGkqjnMAKfih0mDKNZwfN8WA2MKXbQdWQwII=;
        b=gXHqLI0koSbEE8gy/dWeNdoPMKa6qwjJp/K27iGcTda8+4K1udNDzYV4UCHXqvfiEe
         8STPzP5aLZCDibLuuyYZMusSRgXxr8fwj9vs4vYfcQREMnrUvG2HXxacNrVXl9hst3Ld
         nWRrHi9f242PVwqKR5XMY0Ms7ad4a0HJtIpb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=nNUotO5RGkqjnMAKfih0mDKNZwfN8WA2MKXbQdWQwII=;
        b=EZTGShjbg9E/FlienCFwWTkKWTLUb5//KBRhLC29lhAOe4kUKix/9EaFiLPFXVu8SW
         WXtWxOKmlwHPCPimoy1UhWGSemsl5cjVE6xkEUjYK4V+rlZGMiBZxGHZSATYjTQsi87X
         39Cd8QDqaIx/O4r1W55FK3VbCSbnN+1v/kFkAnIrcW5NDr42llkhsGfscuOnEz1Zlhbc
         ZXM+aKPvkC4OIFlsb6eGtY/nl9dh2XTSZmA49OLFnJHVO3VPJmvnwQYwUtWa1MU6nYqi
         jfdbhEHW4nWSZOMLU5qiHxEaQAxtSVeNuvIRa0mK2RpB+hMCVs+YrshrfB7+5SLOtrAG
         soig==
X-Gm-Message-State: AOAM533ci4PWJao6CgoRmRP3xlxXfutvU5FPzjAf4ECajZq7LUkS7PSm
        b4eFb/V4TsHen0gWc9o0sAfVvA==
X-Google-Smtp-Source: ABdhPJyKbCZyvz/F7BjnngYPMyYGLYOF0G/H26ZKHIgPG3MddYAgM4IDB8oQ1Wh+DC6w7Sd+YiS7JQ==
X-Received: by 2002:a1c:2c89:: with SMTP id s131mr3841413wms.176.1612275093141;
        Tue, 02 Feb 2021 06:11:33 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id u10sm3201892wmj.40.2021.02.02.06.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Feb 2021 06:11:32 -0800 (PST)
Date:   Tue, 2 Feb 2021 15:11:30 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Daniel Vetter <daniel@ffwll.ch>, sam@ravnborg.org,
        dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
        linaro-mm-sig@lists.linaro.org, hdegoede@redhat.com,
        kraxel@redhat.com, airlied@redhat.com,
        virtualization@lists.linux-foundation.org, sean@poorly.run,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v4 04/13] drm/shmem-helper: Provide a vmap function for
 short-term mappings
Message-ID: <YBldkhUXF+SFPaSy@phenom.ffwll.local>
References: <20210108094340.15290-1-tzimmermann@suse.de>
 <20210108094340.15290-5-tzimmermann@suse.de>
 <X/yB3LC79f/zWTwG@phenom.ffwll.local>
 <006b7d47-e7dd-8fa6-6cf1-eff194d7b30f@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <006b7d47-e7dd-8fa6-6cf1-eff194d7b30f@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 27, 2021 at 01:08:05PM +0100, Thomas Zimmermann wrote:
> Hi
> 
> Am 11.01.21 um 17:50 schrieb Daniel Vetter:
> > On Fri, Jan 08, 2021 at 10:43:31AM +0100, Thomas Zimmermann wrote:
> > > Implementations of the vmap/vunmap GEM callbacks may perform pinning
> > > of the BO and may acquire the associated reservation object's lock.
> > > Callers that only require a mapping of the contained memory can thus
> > > interfere with other tasks that require exact pinning, such as scanout.
> > > This is less of an issue with private SHMEM buffers, but may happen
> > > with imported ones.
> > > 
> > > Therefore provide the new interfaces drm_gem_shmem_vmap_local() and
> > > drm_gem_shmem_vunmap_local(), which only perform the vmap/vunmap
> > > operations. Callers have to hold the reservation lock while the mapping
> > > persists.
> > > 
> > > This patch also connects GEM SHMEM helpers to GEM object functions with
> > > equivalent functionality.
> > > 
> > > v4:
> > > 	* call dma_buf_{vmap,vunmap}_local() where necessary (Daniel)
> > > 	* move driver changes into separate patches (Daniel)
> > > 
> > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > ---
> > >   drivers/gpu/drm/drm_gem_shmem_helper.c | 90 +++++++++++++++++++++++---
> > >   include/drm/drm_gem_shmem_helper.h     |  2 +
> > >   2 files changed, 84 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> > > index 9825c378dfa6..298832b2b43b 100644
> > > --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> > > +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> > > @@ -32,6 +32,8 @@ static const struct drm_gem_object_funcs drm_gem_shmem_funcs = {
> > >   	.get_sg_table = drm_gem_shmem_get_sg_table,
> > >   	.vmap = drm_gem_shmem_vmap,
> > >   	.vunmap = drm_gem_shmem_vunmap,
> > > +	.vmap_local = drm_gem_shmem_vmap_local,
> > > +	.vunmap_local = drm_gem_shmem_vunmap_local,
> > >   	.mmap = drm_gem_shmem_mmap,
> > >   };
> > > @@ -261,7 +263,8 @@ void drm_gem_shmem_unpin(struct drm_gem_object *obj)
> > >   }
> > >   EXPORT_SYMBOL(drm_gem_shmem_unpin);
> > > -static int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem, struct dma_buf_map *map)
> > > +static int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem, struct dma_buf_map *map,
> > > +				     bool local)
> > 
> > This is a bit spaghetti and also has the problem that we're not changing
> > shmem->vmap_use_count under different locks, depending upon which path
> > we're taking.
> > 
> > I think the cleanest would be if we pull the if (import_attach) case out
> > of the _locked() version completely, for all cases, and also outside of
> > the shmem->vmap_lock. This means no caching of vmaps in the shmem layer
> > anymore for imported buffers, but this is no longer a problem: We cache
> > them in the exporters instead (I think at least, if not maybe need to fix
> > that where it's expensive).
> 
> There's no vmap refcounting in amdgpu AFAICT. So importing pages from there
> into an SHMEM object has the potential of breaking. IIRC same fro radeon and
> nouveau.

As long as the pinning is refcounted I think it should be fine, it's just
that if you have multiple vmaps (e.g. 2 udl devices plugged in) we'll set
up 2 vmaps. Which is a point pointless, but not really harmful. At least
on 64bit where there's enough virtual address space.

> So I'm somewhat reluctant to making this change. I guess I'll look elsewhere
> first to fix some of the locking issues (e.g., my recent ast cursor
> patches).

If this would break for amdgpu/radeon/nouveau then we already have a bug,
since 2 udl devices can provoke this issue already as-is. So I don't think
this should be a blocker.
-Daniel

> 
> Best regards
> Thomas
> 
> > 
> > Other option would be to unly pull it out for the _vmap_local case, but
> > that's a bit ugly because no longer symmetrical in the various paths.
> > 
> > >   {
> > >   	struct drm_gem_object *obj = &shmem->base;
> > >   	int ret = 0;
> > > @@ -272,7 +275,10 @@ static int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem, struct
> > >   	}
> > >   	if (obj->import_attach) {
> > > -		ret = dma_buf_vmap(obj->import_attach->dmabuf, map);
> > > +		if (local)
> > > +			ret = dma_buf_vmap_local(obj->import_attach->dmabuf, map);
> > > +		else
> > > +			ret = dma_buf_vmap(obj->import_attach->dmabuf, map);
> > >   		if (!ret) {
> > >   			if (WARN_ON(map->is_iomem)) {
> > >   				ret = -EIO;
> > > @@ -313,7 +319,7 @@ static int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem, struct
> > >   	return ret;
> > >   }
> > > -/*
> > > +/**
> > >    * drm_gem_shmem_vmap - Create a virtual mapping for a shmem GEM object
> > >    * @shmem: shmem GEM object
> > >    * @map: Returns the kernel virtual address of the SHMEM GEM object's backing
> > > @@ -339,15 +345,53 @@ int drm_gem_shmem_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
> > >   	ret = mutex_lock_interruptible(&shmem->vmap_lock);
> > >   	if (ret)
> > >   		return ret;
> > > -	ret = drm_gem_shmem_vmap_locked(shmem, map);
> > > +	ret = drm_gem_shmem_vmap_locked(shmem, map, false);
> > >   	mutex_unlock(&shmem->vmap_lock);
> > >   	return ret;
> > >   }
> > >   EXPORT_SYMBOL(drm_gem_shmem_vmap);
> > > +/**
> > > + * drm_gem_shmem_vmap_local - Create a virtual mapping for a shmem GEM object
> > > + * @shmem: shmem GEM object
> > > + * @map: Returns the kernel virtual address of the SHMEM GEM object's backing
> > > + *       store.
> > > + *
> > > + * This function makes sure that a contiguous kernel virtual address mapping
> > > + * exists for the buffer backing the shmem GEM object.
> > > + *
> > > + * The function is called with the BO's reservation object locked. Callers must
> > > + * hold the lock until after unmapping the buffer.
> > > + *
> > > + * This function can be used to implement &drm_gem_object_funcs.vmap_local. But
> > > + * it can also be called by drivers directly, in which case it will hide the
> > > + * differences between dma-buf imported and natively allocated objects.
> > 
> > So for the other callbacks I tried to make sure we have different entry
> > points for this, since it's not really the same thing and because of the
> > locking mess we have with dma_resv_lock vs various pre-existing local
> > locking scheme, it's easy to get a mess.
> > 
> > I think the super clean version here would be to also export just the
> > internal stuff for the ->v(un)map_local hooks, but that's maybe a bit too
> > much boilerplate for no real gain.
> > -Daniel
> > 
> > > + *
> > > + * Acquired mappings should be cleaned up by calling drm_gem_shmem_vunmap_local().
> > > + *
> > > + * Returns:
> > > + * 0 on success or a negative error code on failure.
> > > + */
> > > +int drm_gem_shmem_vmap_local(struct drm_gem_object *obj, struct dma_buf_map *map)
> > > +{
> > > +	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
> > > +	int ret;
> > > +
> > > +	dma_resv_assert_held(obj->resv);
> > > +
> > > +	ret = mutex_lock_interruptible(&shmem->vmap_lock);
> > > +	if (ret)
> > > +		return ret;
> > > +	ret = drm_gem_shmem_vmap_locked(shmem, map, true);
> > > +	mutex_unlock(&shmem->vmap_lock);
> > > +
> > > +	return ret;
> > > +}
> > > +EXPORT_SYMBOL(drm_gem_shmem_vmap_local);
> > > +
> > >   static void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem,
> > > -					struct dma_buf_map *map)
> > > +					struct dma_buf_map *map, bool local)
> > >   {
> > >   	struct drm_gem_object *obj = &shmem->base;
> > > @@ -358,7 +402,10 @@ static void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem,
> > >   		return;
> > >   	if (obj->import_attach)
> > > -		dma_buf_vunmap(obj->import_attach->dmabuf, map);
> > > +		if (local)
> > > +			dma_buf_vunmap_local(obj->import_attach->dmabuf, map);
> > > +		else
> > > +			dma_buf_vunmap(obj->import_attach->dmabuf, map);
> > >   	else
> > >   		vunmap(shmem->vaddr);
> > > @@ -366,7 +413,7 @@ static void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem,
> > >   	drm_gem_shmem_put_pages(shmem);
> > >   }
> > > -/*
> > > +/**
> > >    * drm_gem_shmem_vunmap - Unmap a virtual mapping fo a shmem GEM object
> > >    * @shmem: shmem GEM object
> > >    * @map: Kernel virtual address where the SHMEM GEM object was mapped
> > > @@ -384,11 +431,38 @@ void drm_gem_shmem_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map)
> > >   	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
> > >   	mutex_lock(&shmem->vmap_lock);
> > > -	drm_gem_shmem_vunmap_locked(shmem, map);
> > > +	drm_gem_shmem_vunmap_locked(shmem, map, false);
> > >   	mutex_unlock(&shmem->vmap_lock);
> > >   }
> > >   EXPORT_SYMBOL(drm_gem_shmem_vunmap);
> > > +/**
> > > + * drm_gem_shmem_vunmap_local - Unmap a virtual mapping fo a shmem GEM object
> > > + * @shmem: shmem GEM object
> > > + * @map: Kernel virtual address where the SHMEM GEM object was mapped
> > > + *
> > > + * This function cleans up a kernel virtual address mapping acquired by
> > > + * drm_gem_shmem_vmap_local(). The mapping is only removed when the use count
> > > + * drops to zero.
> > > + *
> > > + * The function is called with the BO's reservation object locked.
> > > + *
> > > + * This function can be used to implement &drm_gem_object_funcs.vmap_local.
> > > + * But it can also be called by drivers directly, in which case it will hide
> > > + * the differences between dma-buf imported and natively allocated objects.
> > > + */
> > > +void drm_gem_shmem_vunmap_local(struct drm_gem_object *obj, struct dma_buf_map *map)
> > > +{
> > > +	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
> > > +
> > > +	dma_resv_assert_held(obj->resv);
> > > +
> > > +	mutex_lock(&shmem->vmap_lock);
> > > +	drm_gem_shmem_vunmap_locked(shmem, map, true);
> > > +	mutex_unlock(&shmem->vmap_lock);
> > > +}
> > > +EXPORT_SYMBOL(drm_gem_shmem_vunmap_local);
> > > +
> > >   struct drm_gem_shmem_object *
> > >   drm_gem_shmem_create_with_handle(struct drm_file *file_priv,
> > >   				 struct drm_device *dev, size_t size,
> > > diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
> > > index 434328d8a0d9..3f59bdf749aa 100644
> > > --- a/include/drm/drm_gem_shmem_helper.h
> > > +++ b/include/drm/drm_gem_shmem_helper.h
> > > @@ -114,7 +114,9 @@ void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem);
> > >   int drm_gem_shmem_pin(struct drm_gem_object *obj);
> > >   void drm_gem_shmem_unpin(struct drm_gem_object *obj);
> > >   int drm_gem_shmem_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
> > > +int drm_gem_shmem_vmap_local(struct drm_gem_object *obj, struct dma_buf_map *map);
> > >   void drm_gem_shmem_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map);
> > > +void drm_gem_shmem_vunmap_local(struct drm_gem_object *obj, struct dma_buf_map *map);
> > >   int drm_gem_shmem_madvise(struct drm_gem_object *obj, int madv);
> > > -- 
> > > 2.29.2
> > > 
> > 
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 Nürnberg, Germany
> (HRB 36809, AG Nürnberg)
> Geschäftsführer: Felix Imendörffer
> 




-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
