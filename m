Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DA66292AC2
	for <lists+linux-media@lfdr.de>; Mon, 19 Oct 2020 17:46:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730379AbgJSPqu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Oct 2020 11:46:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730364AbgJSPqs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Oct 2020 11:46:48 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7A1DC0613D0
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2020 08:46:47 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id s9so248436wro.8
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2020 08:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=HO1NWy71VB/XmKCrtzy6L4ESvVEPBzXrL3scn+Up8bc=;
        b=UC61EvUAH1ghGWvhgPIvwb0tJKvmN85XcCXlrZCX7WhPqQ5Kal9er+D9EGMj6Qy1Mw
         fLsBXywmZ7A82r1QjiPvCD/FrGiVsWYE0GJST415xH593KKFVZRAlHpTMAzkBzgOwrUv
         csDczr2hma4nlAuIXgtB1TgmwV8Q0Ey3gd2fI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=HO1NWy71VB/XmKCrtzy6L4ESvVEPBzXrL3scn+Up8bc=;
        b=LqXRvLfGouaKHnPQ19OaR8NFgbA+tkEuGP2h52OOKVGfeiDel1RAwwSp/30aYB+9o1
         4DtQPtq/7h3t2ZZl6jLcyYTGwau+chvIlTrkPUDm3MwQcOcKwnJV3f/bcITn/CLC4ntR
         IIVXMW3OYdV1iAzHcJ393qDbmre1ux2LFWM4lRsi6P9nTxuh9+gKX2OaaQGGusrcZ/RO
         tHMaS1IytSmVAMFIajaME9Bizm7BK9PpZOcxODJ9ncYZaDh0baQnswD/7pFlgIFsmGu6
         HPBDAK8JemkYX7Q0yQYbTTHuiezLM3Tn0P7jIEoYS81/VcJV2i2iFe/lNz7B7DAjqyYJ
         OuqA==
X-Gm-Message-State: AOAM5328LXyyiv3qtw4hsOew/LWc8MGLiVFeBmhJC+ILUNtjXLwZORqt
        fOOsMaGgIrOsnmFlLnTJZXr1Yg==
X-Google-Smtp-Source: ABdhPJw3AhcfVn5Ol/2itQNrpLAPMvDH8DFfv/LdwaotJFWGF+wLGszDKhZ9OSoAyWYoQMAHgXYlBQ==
X-Received: by 2002:adf:ea4d:: with SMTP id j13mr121871wrn.345.1603122406591;
        Mon, 19 Oct 2020 08:46:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id s11sm138139wrm.56.2020.10.19.08.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 08:46:45 -0700 (PDT)
Date:   Mon, 19 Oct 2020 17:46:42 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org,
        alexander.deucher@amd.com, kraxel@redhat.com,
        l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk,
        christian.gmeiner@gmail.com, inki.dae@samsung.com,
        jy0922.shim@samsung.com, sw0312.kim@samsung.com,
        kyungmin.park@samsung.com, kgene@kernel.org, krzk@kernel.org,
        yuq825@gmail.com, bskeggs@redhat.com, robh@kernel.org,
        tomeu.vizoso@collabora.com, steven.price@arm.com,
        alyssa.rosenzweig@collabora.com, hjc@rock-chips.com,
        heiko@sntech.de, hdegoede@redhat.com, sean@poorly.run,
        eric@anholt.net, oleksandr_andrushchenko@epam.com,
        ray.huang@amd.com, sumit.semwal@linaro.org,
        emil.velikov@collabora.com, luben.tuikov@amd.com, apaneers@amd.com,
        linus.walleij@linaro.org, melissa.srw@gmail.com,
        chris@chris-wilson.co.uk, miaoqinglang@huawei.com,
        linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
        nouveau@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        linaro-mm-sig@lists.linaro.org, linux-rockchip@lists.infradead.org,
        dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org,
        spice-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v4 05/10] drm/ttm: Add vmap/vunmap to TTM and TTM GEM
 helpers
Message-ID: <20201019154642.GF401619@phenom.ffwll.local>
References: <20201015123806.32416-1-tzimmermann@suse.de>
 <20201015123806.32416-6-tzimmermann@suse.de>
 <935d5771-5645-62a6-849c-31e286db1e30@amd.com>
 <87c7c342-88dc-9a36-31f7-dae6edd34626@suse.de>
 <9236f51c-c1fa-dadc-c7cc-d9d0c09251d1@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9236f51c-c1fa-dadc-c7cc-d9d0c09251d1@amd.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 19, 2020 at 11:45:05AM +0200, Christian König wrote:
> Hi Thomas,
> 
> [SNIP]
> > > >    +int ttm_bo_vmap(struct ttm_buffer_object *bo, struct dma_buf_map *map)
> > > > +{
> > > > +    struct ttm_resource *mem = &bo->mem;
> > > > +    int ret;
> > > > +
> > > > +    ret = ttm_mem_io_reserve(bo->bdev, mem);
> > > > +    if (ret)
> > > > +        return ret;
> > > > +
> > > > +    if (mem->bus.is_iomem) {
> > > > +        void __iomem *vaddr_iomem;
> > > > +        unsigned long size = bo->num_pages << PAGE_SHIFT;
> > > Please use uint64_t here and make sure to cast bo->num_pages before
> > > shifting.
> > I thought the rule of thumb is to use u64 in source code. Yet TTM only
> > uses uint*_t types. Is there anything special about TTM?
> 
> My last status is that you can use both and my personal preference is to use
> the uint*_t types because they are part of a higher level standard.

Yeah the only hard rule is that in uapi headers you need to use the __u64
and similar typedefs, to avoid cluttering the namespace for unrelated
stuff in userspace.

In the kernel c99 types are perfectly fine, and I think slowly on the
rise.
-Daniel

> 
> > > We have an unit tests of allocating a 8GB BO and that should work on a
> > > 32bit machine as well :)
> > > 
> > > > +
> > > > +        if (mem->bus.addr)
> > > > +            vaddr_iomem = (void *)(((u8 *)mem->bus.addr));
> > I after reading the patch again, I realized that this is the
> > 'ttm_bo_map_premapped' case and it's missing from _vunmap(). I see two
> > options here: ignore this case in _vunmap(), or do an ioremap()
> > unconditionally. Which one is preferable?
> 
> ioremap would be very very bad, so we should just do nothing.
> 
> Thanks,
> Christian.
> 
> > 
> > Best regards
> > Thomas
> > 
> > > > +        else if (mem->placement & TTM_PL_FLAG_WC)
> > > I've just nuked the TTM_PL_FLAG_WC flag in drm-misc-next. There is a new
> > > mem->bus.caching enum as replacement.
> > > 
> > > > +            vaddr_iomem = ioremap_wc(mem->bus.offset, size);
> > > > +        else
> > > > +            vaddr_iomem = ioremap(mem->bus.offset, size);
> > > > +
> > > > +        if (!vaddr_iomem)
> > > > +            return -ENOMEM;
> > > > +
> > > > +        dma_buf_map_set_vaddr_iomem(map, vaddr_iomem);
> > > > +
> > > > +    } else {
> > > > +        struct ttm_operation_ctx ctx = {
> > > > +            .interruptible = false,
> > > > +            .no_wait_gpu = false
> > > > +        };
> > > > +        struct ttm_tt *ttm = bo->ttm;
> > > > +        pgprot_t prot;
> > > > +        void *vaddr;
> > > > +
> > > > +        BUG_ON(!ttm);
> > > I think we can drop this, populate will just crash badly anyway.
> > > 
> > > > +
> > > > +        ret = ttm_tt_populate(bo->bdev, ttm, &ctx);
> > > > +        if (ret)
> > > > +            return ret;
> > > > +
> > > > +        /*
> > > > +         * We need to use vmap to get the desired page protection
> > > > +         * or to make the buffer object look contiguous.
> > > > +         */
> > > > +        prot = ttm_io_prot(mem->placement, PAGE_KERNEL);
> > > The calling convention has changed on drm-misc-next as well, but should
> > > be trivial to adapt.
> > > 
> > > Regards,
> > > Christian.
> > > 
> > > > +        vaddr = vmap(ttm->pages, bo->num_pages, 0, prot);
> > > > +        if (!vaddr)
> > > > +            return -ENOMEM;
> > > > +
> > > > +        dma_buf_map_set_vaddr(map, vaddr);
> > > > +    }
> > > > +
> > > > +    return 0;
> > > > +}
> > > > +EXPORT_SYMBOL(ttm_bo_vmap);
> > > > +
> > > > +void ttm_bo_vunmap(struct ttm_buffer_object *bo, struct dma_buf_map
> > > > *map)
> > > > +{
> > > > +    if (dma_buf_map_is_null(map))
> > > > +        return;
> > > > +
> > > > +    if (map->is_iomem)
> > > > +        iounmap(map->vaddr_iomem);
> > > > +    else
> > > > +        vunmap(map->vaddr);
> > > > +    dma_buf_map_clear(map);
> > > > +
> > > > +    ttm_mem_io_free(bo->bdev, &bo->mem);
> > > > +}
> > > > +EXPORT_SYMBOL(ttm_bo_vunmap);
> > > > +
> > > >    static int ttm_bo_wait_free_node(struct ttm_buffer_object *bo,
> > > >                     bool dst_use_tt)
> > > >    {
> > > > diff --git a/include/drm/drm_gem_ttm_helper.h
> > > > b/include/drm/drm_gem_ttm_helper.h
> > > > index 118cef76f84f..7c6d874910b8 100644
> > > > --- a/include/drm/drm_gem_ttm_helper.h
> > > > +++ b/include/drm/drm_gem_ttm_helper.h
> > > > @@ -10,11 +10,17 @@
> > > >    #include <drm/ttm/ttm_bo_api.h>
> > > >    #include <drm/ttm/ttm_bo_driver.h>
> > > >    +struct dma_buf_map;
> > > > +
> > > >    #define drm_gem_ttm_of_gem(gem_obj) \
> > > >        container_of(gem_obj, struct ttm_buffer_object, base)
> > > >      void drm_gem_ttm_print_info(struct drm_printer *p, unsigned int
> > > > indent,
> > > >                    const struct drm_gem_object *gem);
> > > > +int drm_gem_ttm_vmap(struct drm_gem_object *gem,
> > > > +             struct dma_buf_map *map);
> > > > +void drm_gem_ttm_vunmap(struct drm_gem_object *gem,
> > > > +            struct dma_buf_map *map);
> > > >    int drm_gem_ttm_mmap(struct drm_gem_object *gem,
> > > >                 struct vm_area_struct *vma);
> > > >    diff --git a/include/drm/ttm/ttm_bo_api.h
> > > > b/include/drm/ttm/ttm_bo_api.h
> > > > index 37102e45e496..2c59a785374c 100644
> > > > --- a/include/drm/ttm/ttm_bo_api.h
> > > > +++ b/include/drm/ttm/ttm_bo_api.h
> > > > @@ -48,6 +48,8 @@ struct ttm_bo_global;
> > > >      struct ttm_bo_device;
> > > >    +struct dma_buf_map;
> > > > +
> > > >    struct drm_mm_node;
> > > >      struct ttm_placement;
> > > > @@ -494,6 +496,32 @@ int ttm_bo_kmap(struct ttm_buffer_object *bo,
> > > > unsigned long start_page,
> > > >     */
> > > >    void ttm_bo_kunmap(struct ttm_bo_kmap_obj *map);
> > > >    +/**
> > > > + * ttm_bo_vmap
> > > > + *
> > > > + * @bo: The buffer object.
> > > > + * @map: pointer to a struct dma_buf_map representing the map.
> > > > + *
> > > > + * Sets up a kernel virtual mapping, using ioremap or vmap to the
> > > > + * data in the buffer object. The parameter @map returns the virtual
> > > > + * address as struct dma_buf_map. Unmap the buffer with ttm_bo_vunmap().
> > > > + *
> > > > + * Returns
> > > > + * -ENOMEM: Out of memory.
> > > > + * -EINVAL: Invalid range.
> > > > + */
> > > > +int ttm_bo_vmap(struct ttm_buffer_object *bo, struct dma_buf_map *map);
> > > > +
> > > > +/**
> > > > + * ttm_bo_vunmap
> > > > + *
> > > > + * @bo: The buffer object.
> > > > + * @map: Object describing the map to unmap.
> > > > + *
> > > > + * Unmaps a kernel map set up by ttm_bo_vmap().
> > > > + */
> > > > +void ttm_bo_vunmap(struct ttm_buffer_object *bo, struct dma_buf_map
> > > > *map);
> > > > +
> > > >    /**
> > > >     * ttm_bo_mmap_obj - mmap memory backed by a ttm buffer object.
> > > >     *
> > > > diff --git a/include/linux/dma-buf-map.h b/include/linux/dma-buf-map.h
> > > > index fd1aba545fdf..2e8bbecb5091 100644
> > > > --- a/include/linux/dma-buf-map.h
> > > > +++ b/include/linux/dma-buf-map.h
> > > > @@ -45,6 +45,12 @@
> > > >     *
> > > >     *    dma_buf_map_set_vaddr(&map. 0xdeadbeaf);
> > > >     *
> > > > + * To set an address in I/O memory, use dma_buf_map_set_vaddr_iomem().
> > > > + *
> > > > + * .. code-block:: c
> > > > + *
> > > > + *    dma_buf_map_set_vaddr_iomem(&map. 0xdeadbeaf);
> > > > + *
> > > >     * Test if a mapping is valid with either dma_buf_map_is_set() or
> > > >     * dma_buf_map_is_null().
> > > >     *
> > > > @@ -118,6 +124,20 @@ static inline void dma_buf_map_set_vaddr(struct
> > > > dma_buf_map *map, void *vaddr)
> > > >        map->is_iomem = false;
> > > >    }
> > > >    +/**
> > > > + * dma_buf_map_set_vaddr_iomem - Sets a dma-buf mapping structure to
> > > > an address in I/O memory
> > > > + * @map:        The dma-buf mapping structure
> > > > + * @vaddr_iomem:    An I/O-memory address
> > > > + *
> > > > + * Sets the address and the I/O-memory flag.
> > > > + */
> > > > +static inline void dma_buf_map_set_vaddr_iomem(struct dma_buf_map *map,
> > > > +                           void __iomem *vaddr_iomem)
> > > > +{
> > > > +    map->vaddr_iomem = vaddr_iomem;
> > > > +    map->is_iomem = true;
> > > > +}
> > > > +
> > > >    /**
> > > >     * dma_buf_map_is_equal - Compares two dma-buf mapping structures
> > > > for equality
> > > >     * @lhs:    The dma-buf mapping structure
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C07bc68af3c6440b5be8d08d8740e9b32%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637386953433558595%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=RlGCmjzyZERvqfnl4kA1bEHez5bkLf3F9OlKi2ybDAM%3D&amp;reserved=0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
