Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4A9A28F7D4
	for <lists+linux-media@lfdr.de>; Thu, 15 Oct 2020 19:52:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731429AbgJORwK convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 15 Oct 2020 13:52:10 -0400
Received: from mx2.suse.de ([195.135.220.15]:54374 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726112AbgJORwK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Oct 2020 13:52:10 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 367DEAFAE;
        Thu, 15 Oct 2020 17:52:07 +0000 (UTC)
Date:   Thu, 15 Oct 2020 19:52:04 +0200
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        luben.tuikov@amd.com, airlied@linux.ie,
        nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        chris@chris-wilson.co.uk, melissa.srw@gmail.com, ray.huang@amd.com,
        kraxel@redhat.com, sam@ravnborg.org, emil.velikov@collabora.com,
        linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com,
        lima@lists.freedesktop.org, oleksandr_andrushchenko@epam.com,
        krzk@kernel.org, steven.price@arm.com,
        linux-rockchip@lists.infradead.org, kgene@kernel.org,
        bskeggs@redhat.com, linux+etnaviv@armlinux.org.uk,
        spice-devel@lists.freedesktop.org, alyssa.rosenzweig@collabora.com,
        etnaviv@lists.freedesktop.org, hdegoede@redhat.com,
        xen-devel@lists.xenproject.org,
        virtualization@lists.linux-foundation.org, sean@poorly.run,
        apaneers@amd.com, linux-arm-kernel@lists.infradead.org,
        linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org,
        tomeu.vizoso@collabora.com, sw0312.kim@samsung.com,
        hjc@rock-chips.com, kyungmin.park@samsung.com,
        miaoqinglang@huawei.com, yuq825@gmail.com,
        alexander.deucher@amd.com, linux-media@vger.kernel.org
Subject: Re: [PATCH v4 05/10] drm/ttm: Add vmap/vunmap to TTM and TTM GEM
 helpers
Message-ID: <20201015195204.1745fe7f@linux-uq9g>
In-Reply-To: <20201015164909.GC401619@phenom.ffwll.local>
References: <20201015123806.32416-1-tzimmermann@suse.de>
        <20201015123806.32416-6-tzimmermann@suse.de>
        <935d5771-5645-62a6-849c-31e286db1e30@amd.com>
        <20201015164909.GC401619@phenom.ffwll.local>
Organization: SUSE Software Solutions Germany GmbH
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi

On Thu, 15 Oct 2020 18:49:09 +0200 Daniel Vetter <daniel@ffwll.ch> wrote:

> On Thu, Oct 15, 2020 at 04:08:13PM +0200, Christian König wrote:
> > Am 15.10.20 um 14:38 schrieb Thomas Zimmermann:
> > > The new functions ttm_bo_{vmap,vunmap}() map and unmap a TTM BO in
> > > kernel address space. The mapping's address is returned as struct
> > > dma_buf_map. Each function is a simplified version of TTM's existing
> > > kmap code. Both functions respect the memory's location ani/or
> > > writecombine flags.
> > > 
> > > On top TTM's functions, GEM TTM helpers got drm_gem_ttm_{vmap,vunmap}(),
> > > two helpers that convert a GEM object into the TTM BO and forward the
> > > call to TTM's vmap/vunmap. These helpers can be dropped into the rsp
> > > GEM object callbacks.
> > > 
> > > v4:
> > > 	* drop ttm_kmap_obj_to_dma_buf() in favor of vmap helpers
> > > (Daniel, Christian)
> > 
> > Bunch of minor comments below, but over all look very solid to me.
> 
> Yeah I think just duplicating the ttm bo map stuff for vmap is indeed the
> cleanest. And then we can maybe push the combinatorial monster into
> vmwgfx, which I think is the only user after this series. Or perhaps a
> dedicated set of helpers to map an invidual page (again using the
> dma_buf_map stuff).

From a quick look, I'd say it should be possible to have the same interface
for kmap/kunmap as for vmap/vunmap (i.e., parameters are bo and dma-buf-map).
All mapping state can be deduced from this. And struct ttm_bo_kmap_obj can be
killed off entirely.

Best regards
Thomas

> 
> I'll let Christian with the details, but at a high level this is
> definitely
> 
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> Thanks a lot for doing all this.
> -Daniel
> 
> > 
> > > 
> > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > ---
> > >   drivers/gpu/drm/drm_gem_ttm_helper.c | 38 +++++++++++++++
> > >   drivers/gpu/drm/ttm/ttm_bo_util.c    | 72 ++++++++++++++++++++++++++++
> > >   include/drm/drm_gem_ttm_helper.h     |  6 +++
> > >   include/drm/ttm/ttm_bo_api.h         | 28 +++++++++++
> > >   include/linux/dma-buf-map.h          | 20 ++++++++
> > >   5 files changed, 164 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_gem_ttm_helper.c
> > > b/drivers/gpu/drm/drm_gem_ttm_helper.c index 0e4fb9ba43ad..db4c14d78a30
> > > 100644 --- a/drivers/gpu/drm/drm_gem_ttm_helper.c
> > > +++ b/drivers/gpu/drm/drm_gem_ttm_helper.c
> > > @@ -49,6 +49,44 @@ void drm_gem_ttm_print_info(struct drm_printer *p,
> > > unsigned int indent, }
> > >   EXPORT_SYMBOL(drm_gem_ttm_print_info);
> > > +/**
> > > + * drm_gem_ttm_vmap() - vmap &ttm_buffer_object
> > > + * @gem: GEM object.
> > > + * @map: [out] returns the dma-buf mapping.
> > > + *
> > > + * Maps a GEM object with ttm_bo_vmap(). This function can be used as
> > > + * &drm_gem_object_funcs.vmap callback.
> > > + *
> > > + * Returns:
> > > + * 0 on success, or a negative errno code otherwise.
> > > + */
> > > +int drm_gem_ttm_vmap(struct drm_gem_object *gem,
> > > +		     struct dma_buf_map *map)
> > > +{
> > > +	struct ttm_buffer_object *bo = drm_gem_ttm_of_gem(gem);
> > > +
> > > +	return ttm_bo_vmap(bo, map);
> > > +
> > > +}
> > > +EXPORT_SYMBOL(drm_gem_ttm_vmap);
> > > +
> > > +/**
> > > + * drm_gem_ttm_vunmap() - vunmap &ttm_buffer_object
> > > + * @gem: GEM object.
> > > + * @map: dma-buf mapping.
> > > + *
> > > + * Unmaps a GEM object with ttm_bo_vunmap(). This function can be used
> > > as
> > > + * &drm_gem_object_funcs.vmap callback.
> > > + */
> > > +void drm_gem_ttm_vunmap(struct drm_gem_object *gem,
> > > +			struct dma_buf_map *map)
> > > +{
> > > +	struct ttm_buffer_object *bo = drm_gem_ttm_of_gem(gem);
> > > +
> > > +	ttm_bo_vunmap(bo, map);
> > > +}
> > > +EXPORT_SYMBOL(drm_gem_ttm_vunmap);
> > > +
> > >   /**
> > >    * drm_gem_ttm_mmap() - mmap &ttm_buffer_object
> > >    * @gem: GEM object.
> > > diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c
> > > b/drivers/gpu/drm/ttm/ttm_bo_util.c index bdee4df1f3f2..80c42c774c7d
> > > 100644 --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> > > +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > > @@ -32,6 +32,7 @@
> > >   #include <drm/ttm/ttm_bo_driver.h>
> > >   #include <drm/ttm/ttm_placement.h>
> > >   #include <drm/drm_vma_manager.h>
> > > +#include <linux/dma-buf-map.h>
> > >   #include <linux/io.h>
> > >   #include <linux/highmem.h>
> > >   #include <linux/wait.h>
> > > @@ -526,6 +527,77 @@ void ttm_bo_kunmap(struct ttm_bo_kmap_obj *map)
> > >   }
> > >   EXPORT_SYMBOL(ttm_bo_kunmap);
> > > +int ttm_bo_vmap(struct ttm_buffer_object *bo, struct dma_buf_map *map)
> > > +{
> > > +	struct ttm_resource *mem = &bo->mem;
> > > +	int ret;
> > > +
> > > +	ret = ttm_mem_io_reserve(bo->bdev, mem);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	if (mem->bus.is_iomem) {
> > > +		void __iomem *vaddr_iomem;
> > > +		unsigned long size = bo->num_pages << PAGE_SHIFT;
> > 
> > Please use uint64_t here and make sure to cast bo->num_pages before
> > shifting.
> > 
> > We have an unit tests of allocating a 8GB BO and that should work on a
> > 32bit machine as well :)
> > 
> > > +
> > > +		if (mem->bus.addr)
> > > +			vaddr_iomem = (void *)(((u8 *)mem->bus.addr));
> > > +		else if (mem->placement & TTM_PL_FLAG_WC)
> > 
> > I've just nuked the TTM_PL_FLAG_WC flag in drm-misc-next. There is a new
> > mem->bus.caching enum as replacement.
> > 
> > > +			vaddr_iomem = ioremap_wc(mem->bus.offset,
> > > size);
> > > +		else
> > > +			vaddr_iomem = ioremap(mem->bus.offset, size);
> > > +
> > > +		if (!vaddr_iomem)
> > > +			return -ENOMEM;
> > > +
> > > +		dma_buf_map_set_vaddr_iomem(map, vaddr_iomem);
> > > +
> > > +	} else {
> > > +		struct ttm_operation_ctx ctx = {
> > > +			.interruptible = false,
> > > +			.no_wait_gpu = false
> > > +		};
> > > +		struct ttm_tt *ttm = bo->ttm;
> > > +		pgprot_t prot;
> > > +		void *vaddr;
> > > +
> > > +		BUG_ON(!ttm);
> > 
> > I think we can drop this, populate will just crash badly anyway.
> > 
> > > +
> > > +		ret = ttm_tt_populate(bo->bdev, ttm, &ctx);
> > > +		if (ret)
> > > +			return ret;
> > > +
> > > +		/*
> > > +		 * We need to use vmap to get the desired page
> > > protection
> > > +		 * or to make the buffer object look contiguous.
> > > +		 */
> > > +		prot = ttm_io_prot(mem->placement, PAGE_KERNEL);
> > 
> > The calling convention has changed on drm-misc-next as well, but should be
> > trivial to adapt.
> > 
> > Regards,
> > Christian.
> > 
> > > +		vaddr = vmap(ttm->pages, bo->num_pages, 0, prot);
> > > +		if (!vaddr)
> > > +			return -ENOMEM;
> > > +
> > > +		dma_buf_map_set_vaddr(map, vaddr);
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +EXPORT_SYMBOL(ttm_bo_vmap);
> > > +
> > > +void ttm_bo_vunmap(struct ttm_buffer_object *bo, struct dma_buf_map
> > > *map) +{
> > > +	if (dma_buf_map_is_null(map))
> > > +		return;
> > > +
> > > +	if (map->is_iomem)
> > > +		iounmap(map->vaddr_iomem);
> > > +	else
> > > +		vunmap(map->vaddr);
> > > +	dma_buf_map_clear(map);
> > > +
> > > +	ttm_mem_io_free(bo->bdev, &bo->mem);
> > > +}
> > > +EXPORT_SYMBOL(ttm_bo_vunmap);
> > > +
> > >   static int ttm_bo_wait_free_node(struct ttm_buffer_object *bo,
> > >   				 bool dst_use_tt)
> > >   {
> > > diff --git a/include/drm/drm_gem_ttm_helper.h
> > > b/include/drm/drm_gem_ttm_helper.h index 118cef76f84f..7c6d874910b8
> > > 100644 --- a/include/drm/drm_gem_ttm_helper.h
> > > +++ b/include/drm/drm_gem_ttm_helper.h
> > > @@ -10,11 +10,17 @@
> > >   #include <drm/ttm/ttm_bo_api.h>
> > >   #include <drm/ttm/ttm_bo_driver.h>
> > > +struct dma_buf_map;
> > > +
> > >   #define drm_gem_ttm_of_gem(gem_obj) \
> > >   	container_of(gem_obj, struct ttm_buffer_object, base)
> > >   void drm_gem_ttm_print_info(struct drm_printer *p, unsigned int
> > > indent, const struct drm_gem_object *gem);
> > > +int drm_gem_ttm_vmap(struct drm_gem_object *gem,
> > > +		     struct dma_buf_map *map);
> > > +void drm_gem_ttm_vunmap(struct drm_gem_object *gem,
> > > +			struct dma_buf_map *map);
> > >   int drm_gem_ttm_mmap(struct drm_gem_object *gem,
> > >   		     struct vm_area_struct *vma);
> > > diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
> > > index 37102e45e496..2c59a785374c 100644
> > > --- a/include/drm/ttm/ttm_bo_api.h
> > > +++ b/include/drm/ttm/ttm_bo_api.h
> > > @@ -48,6 +48,8 @@ struct ttm_bo_global;
> > >   struct ttm_bo_device;
> > > +struct dma_buf_map;
> > > +
> > >   struct drm_mm_node;
> > >   struct ttm_placement;
> > > @@ -494,6 +496,32 @@ int ttm_bo_kmap(struct ttm_buffer_object *bo,
> > > unsigned long start_page, */
> > >   void ttm_bo_kunmap(struct ttm_bo_kmap_obj *map);
> > > +/**
> > > + * ttm_bo_vmap
> > > + *
> > > + * @bo: The buffer object.
> > > + * @map: pointer to a struct dma_buf_map representing the map.
> > > + *
> > > + * Sets up a kernel virtual mapping, using ioremap or vmap to the
> > > + * data in the buffer object. The parameter @map returns the virtual
> > > + * address as struct dma_buf_map. Unmap the buffer with
> > > ttm_bo_vunmap().
> > > + *
> > > + * Returns
> > > + * -ENOMEM: Out of memory.
> > > + * -EINVAL: Invalid range.
> > > + */
> > > +int ttm_bo_vmap(struct ttm_buffer_object *bo, struct dma_buf_map *map);
> > > +
> > > +/**
> > > + * ttm_bo_vunmap
> > > + *
> > > + * @bo: The buffer object.
> > > + * @map: Object describing the map to unmap.
> > > + *
> > > + * Unmaps a kernel map set up by ttm_bo_vmap().
> > > + */
> > > +void ttm_bo_vunmap(struct ttm_buffer_object *bo, struct dma_buf_map
> > > *map); +
> > >   /**
> > >    * ttm_bo_mmap_obj - mmap memory backed by a ttm buffer object.
> > >    *
> > > diff --git a/include/linux/dma-buf-map.h b/include/linux/dma-buf-map.h
> > > index fd1aba545fdf..2e8bbecb5091 100644
> > > --- a/include/linux/dma-buf-map.h
> > > +++ b/include/linux/dma-buf-map.h
> > > @@ -45,6 +45,12 @@
> > >    *
> > >    *	dma_buf_map_set_vaddr(&map. 0xdeadbeaf);
> > >    *
> > > + * To set an address in I/O memory, use dma_buf_map_set_vaddr_iomem().
> > > + *
> > > + * .. code-block:: c
> > > + *
> > > + *	dma_buf_map_set_vaddr_iomem(&map. 0xdeadbeaf);
> > > + *
> > >    * Test if a mapping is valid with either dma_buf_map_is_set() or
> > >    * dma_buf_map_is_null().
> > >    *
> > > @@ -118,6 +124,20 @@ static inline void dma_buf_map_set_vaddr(struct
> > > dma_buf_map *map, void *vaddr) map->is_iomem = false;
> > >   }
> > > +/**
> > > + * dma_buf_map_set_vaddr_iomem - Sets a dma-buf mapping structure to
> > > an address in I/O memory
> > > + * @map:		The dma-buf mapping structure
> > > + * @vaddr_iomem:	An I/O-memory address
> > > + *
> > > + * Sets the address and the I/O-memory flag.
> > > + */
> > > +static inline void dma_buf_map_set_vaddr_iomem(struct dma_buf_map *map,
> > > +					       void __iomem
> > > *vaddr_iomem) +{
> > > +	map->vaddr_iomem = vaddr_iomem;
> > > +	map->is_iomem = true;
> > > +}
> > > +
> > >   /**
> > >    * dma_buf_map_is_equal - Compares two dma-buf mapping structures for
> > > equality
> > >    * @lhs:	The dma-buf mapping structure
> > 
> 



-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer
