Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 123112902E5
	for <lists+linux-media@lfdr.de>; Fri, 16 Oct 2020 12:39:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395416AbgJPKjh convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 16 Oct 2020 06:39:37 -0400
Received: from mx2.suse.de ([195.135.220.15]:47686 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2394467AbgJPKjh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Oct 2020 06:39:37 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 6C254AB5C;
        Fri, 16 Oct 2020 10:39:34 +0000 (UTC)
Date:   Fri, 16 Oct 2020 12:39:31 +0200
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     luben.tuikov@amd.com, airlied@linux.ie,
        nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        chris@chris-wilson.co.uk, melissa.srw@gmail.com, ray.huang@amd.com,
        kraxel@redhat.com, emil.velikov@collabora.com,
        linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com,
        lima@lists.freedesktop.org, oleksandr_andrushchenko@epam.com,
        krzk@kernel.org, steven.price@arm.com,
        linux-rockchip@lists.infradead.org, kgene@kernel.org,
        alyssa.rosenzweig@collabora.com, linux+etnaviv@armlinux.org.uk,
        spice-devel@lists.freedesktop.org, bskeggs@redhat.com,
        etnaviv@lists.freedesktop.org, hdegoede@redhat.com,
        xen-devel@lists.xenproject.org,
        virtualization@lists.linux-foundation.org, sean@poorly.run,
        apaneers@amd.com, linux-arm-kernel@lists.infradead.org,
        linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org,
        tomeu.vizoso@collabora.com, sw0312.kim@samsung.com,
        hjc@rock-chips.com, kyungmin.park@samsung.com,
        miaoqinglang@huawei.com, yuq825@gmail.com,
        alexander.deucher@amd.com, linux-media@vger.kernel.org,
        christian.koenig@amd.com
Subject: Re: [PATCH v4 09/10] dma-buf-map: Add memcpy and pointer-increment
 interfaces
Message-ID: <20201016123931.10dd3930@linux-uq9g>
In-Reply-To: <20201016100854.GA1042954@ravnborg.org>
References: <20201015123806.32416-1-tzimmermann@suse.de>
        <20201015123806.32416-10-tzimmermann@suse.de>
        <20201016100854.GA1042954@ravnborg.org>
Organization: SUSE Software Solutions Germany GmbH
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sam

On Fri, 16 Oct 2020 12:08:54 +0200 Sam Ravnborg <sam@ravnborg.org> wrote:

> Hi Thomas.
> 
> On Thu, Oct 15, 2020 at 02:38:05PM +0200, Thomas Zimmermann wrote:
> > To do framebuffer updates, one needs memcpy from system memory and a
> > pointer-increment function. Add both interfaces with documentation.
> > 
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> Looks good.
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

Thanks. If you have the time, may I ask you to test this patchset on the
bochs/sparc64 system that failed with the original code?

Best regards
Thomas

> 
> > ---
> >  include/linux/dma-buf-map.h | 72 +++++++++++++++++++++++++++++++------
> >  1 file changed, 62 insertions(+), 10 deletions(-)
> > 
> > diff --git a/include/linux/dma-buf-map.h b/include/linux/dma-buf-map.h
> > index 2e8bbecb5091..6ca0f304dda2 100644
> > --- a/include/linux/dma-buf-map.h
> > +++ b/include/linux/dma-buf-map.h
> > @@ -32,6 +32,14 @@
> >   * accessing the buffer. Use the returned instance and the helper
> > functions
> >   * to access the buffer's memory in the correct way.
> >   *
> > + * The type :c:type:`struct dma_buf_map <dma_buf_map>` and its helpers
> > are
> > + * actually independent from the dma-buf infrastructure. When sharing
> > buffers
> > + * among devices, drivers have to know the location of the memory to
> > access
> > + * the buffers in a safe way. :c:type:`struct dma_buf_map <dma_buf_map>`
> > + * solves this problem for dma-buf and its users. If other drivers or
> > + * sub-systems require similar functionality, the type could be
> > generalized
> > + * and moved to a more prominent header file.
> > + *
> >   * Open-coding access to :c:type:`struct dma_buf_map <dma_buf_map>` is
> >   * considered bad style. Rather then accessing its fields directly, use
> > one
> >   * of the provided helper functions, or implement your own. For example,
> > @@ -51,6 +59,14 @@
> >   *
> >   *	dma_buf_map_set_vaddr_iomem(&map. 0xdeadbeaf);
> >   *
> > + * Instances of struct dma_buf_map do not have to be cleaned up, but
> > + * can be cleared to NULL with dma_buf_map_clear(). Cleared mappings
> > + * always refer to system memory.
> > + *
> > + * .. code-block:: c
> > + *
> > + *	dma_buf_map_clear(&map);
> > + *
> >   * Test if a mapping is valid with either dma_buf_map_is_set() or
> >   * dma_buf_map_is_null().
> >   *
> > @@ -73,17 +89,19 @@
> >   *	if (dma_buf_map_is_equal(&sys_map, &io_map))
> >   *		// always false
> >   *
> > - * Instances of struct dma_buf_map do not have to be cleaned up, but
> > - * can be cleared to NULL with dma_buf_map_clear(). Cleared mappings
> > - * always refer to system memory.
> > + * A set up instance of struct dma_buf_map can be used to access or
> > manipulate
> > + * the buffer memory. Depending on the location of the memory, the
> > provided
> > + * helpers will pick the correct operations. Data can be copied into the
> > memory
> > + * with dma_buf_map_memcpy_to(). The address can be manipulated with
> > + * dma_buf_map_incr().
> >   *
> > - * The type :c:type:`struct dma_buf_map <dma_buf_map>` and its helpers
> > are
> > - * actually independent from the dma-buf infrastructure. When sharing
> > buffers
> > - * among devices, drivers have to know the location of the memory to
> > access
> > - * the buffers in a safe way. :c:type:`struct dma_buf_map <dma_buf_map>`
> > - * solves this problem for dma-buf and its users. If other drivers or
> > - * sub-systems require similar functionality, the type could be
> > generalized
> > - * and moved to a more prominent header file.
> > + * .. code-block:: c
> > + *
> > + *	const void *src = ...; // source buffer
> > + *	size_t len = ...; // length of src
> > + *
> > + *	dma_buf_map_memcpy_to(&map, src, len);
> > + *	dma_buf_map_incr(&map, len); // go to first byte after the
> > memcpy */
> >  
> >  /**
> > @@ -210,4 +228,38 @@ static inline void dma_buf_map_clear(struct
> > dma_buf_map *map) }
> >  }
> >  
> > +/**
> > + * dma_buf_map_memcpy_to - Memcpy into dma-buf mapping
> > + * @dst:	The dma-buf mapping structure
> > + * @src:	The source buffer
> > + * @len:	The number of byte in src
> > + *
> > + * Copies data into a dma-buf mapping. The source buffer is in system
> > + * memory. Depending on the buffer's location, the helper picks the
> > correct
> > + * method of accessing the memory.
> > + */
> > +static inline void dma_buf_map_memcpy_to(struct dma_buf_map *dst, const
> > void *src, size_t len) +{
> > +	if (dst->is_iomem)
> > +		memcpy_toio(dst->vaddr_iomem, src, len);
> > +	else
> > +		memcpy(dst->vaddr, src, len);
> > +}
> > +
> > +/**
> > + * dma_buf_map_incr - Increments the address stored in a dma-buf mapping
> > + * @map:	The dma-buf mapping structure
> > + * @incr:	The number of bytes to increment
> > + *
> > + * Increments the address stored in a dma-buf mapping. Depending on the
> > + * buffer's location, the correct value will be updated.
> > + */
> > +static inline void dma_buf_map_incr(struct dma_buf_map *map, size_t incr)
> > +{
> > +	if (map->is_iomem)
> > +		map->vaddr_iomem += incr;
> > +	else
> > +		map->vaddr += incr;
> > +}
> > +
> >  #endif /* __DMA_BUF_MAP_H__ */
> > -- 
> > 2.28.0
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer
