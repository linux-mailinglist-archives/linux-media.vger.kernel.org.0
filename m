Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81FB9275C03
	for <lists+linux-media@lfdr.de>; Wed, 23 Sep 2020 17:37:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726156AbgIWPhn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Sep 2020 11:37:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726678AbgIWPhm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Sep 2020 11:37:42 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8160CC0613D2
        for <linux-media@vger.kernel.org>; Wed, 23 Sep 2020 08:37:42 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id b79so516187wmb.4
        for <linux-media@vger.kernel.org>; Wed, 23 Sep 2020 08:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=yJrxyrCYTSAaySpzFcKGOiTCkrC8Qj+gA/jwrVsz0KY=;
        b=BXXSr8GmYDsMU6LFltZYqLrnVC43HZ8reSmLD5Oh8RDgk5uSyDGv0QsS9eIMexXXHs
         K07Wf5y5hGwrfOt2Hnr1i21SHv6Xl9Prl6+Xes52ZMKIzFD+U3SmZduvH3N50kmTfg9K
         TfVUe75KKRLeDJbaBLWzKl9t3qsefyRYQd9dQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=yJrxyrCYTSAaySpzFcKGOiTCkrC8Qj+gA/jwrVsz0KY=;
        b=k4Pi06BNHuwr2X7m0Fk5QQnEZpfHa0sGDbg7Epn3dLV0faP/42QkdfGwRWWSIIC9/E
         I7pzP9/8UdzoE3KyMwQisJHfAfzuqHsD3T3GsSoZb2+ieRSa0Yja+wK4rwhEPHRQZ3Gq
         eIi3qPF4YAqiO6mXRecIq98uOLuCHVF76Py1cy41tDJK2NC4FwSkCaiotosLrKocKDzk
         uaZ37MdV4v/zkLE+y3PGlSdcz634jJmfwQds0/UFjoK5IOpn6+y9X0woLuU6U43x4I4V
         Ujpe+9a1ZKQ/hTQK8H4H2DXQCXMKh8+3ox1OpEUA7BggtKP6TtGWuWvWa/GRK9VHhlha
         3TaQ==
X-Gm-Message-State: AOAM530127d63JDokdG0QY5qVVIAN3mh8RTGt/2El23s1hMZv8L/WqZw
        39QLmrfwacNoMBsgG0EKEXPlOA==
X-Google-Smtp-Source: ABdhPJySlshqZ2Ilfkolhu3fme87XBbxHSNa2wxSn6e7yoWWkOCiYEFAD7wOGl1CjNLrhmwDGRCwww==
X-Received: by 2002:a1c:e087:: with SMTP id x129mr158673wmg.160.1600875460911;
        Wed, 23 Sep 2020 08:37:40 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id t16sm168344wrm.57.2020.09.23.08.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 08:37:39 -0700 (PDT)
Date:   Wed, 23 Sep 2020 17:37:37 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>, sumit.semwal@linaro.org,
        afd@ti.com, corbet@lwn.net, benjamin.gaignard@linaro.org,
        lmark@codeaurora.org, labbott@redhat.com, Brian.Starkey@arm.com,
        john.stultz@linaro.org, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, airlied@linux.ie, daniel@ffwll.ch,
        l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk,
        christian.gmeiner@gmail.com, jani.nikula@linux.intel.com,
        joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
        thierry.reding@gmail.com, jonathanh@nvidia.com, pawel@osciak.com,
        m.szyprowski@samsung.com, kyungmin.park@samsung.com,
        tfiga@chromium.org, mchehab@kernel.org, matthew.auld@intel.com,
        robin.murphy@arm.com, thomas.hellstrom@intel.com, sam@ravnborg.org,
        kraxel@redhat.com, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-doc@vger.kernel.org, etnaviv@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dma-buf: Add struct dma-buf-map for storing
 struct dma_buf.vaddr_ptr
Message-ID: <20200923153737.GS438822@phenom.ffwll.local>
References: <20200923123205.30671-1-tzimmermann@suse.de>
 <20200923123205.30671-2-tzimmermann@suse.de>
 <fa595f8a-3360-dc9f-2b85-0cdda28da3e5@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fa595f8a-3360-dc9f-2b85-0cdda28da3e5@amd.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 23, 2020 at 04:27:04PM +0200, Christian König wrote:
> Am 23.09.20 um 14:32 schrieb Thomas Zimmermann:
> > The new type struct dma_buf_map represents a mapping of dma-buf memory
> > into kernel space. It contains a flag, is_iomem, that signals users to
> > access the mapped memory with I/O operations instead of regular loads
> > and stores.
> > 
> > It was assumed that DMA buffer memory can be accessed with regular load
> > and store operations. Some architectures, such as sparc64, require the
> > use of I/O operations to access dma-map buffers that are located in I/O
> > memory. Providing struct dma_buf_map allows drivers to implement this.
> > This was specifically a problem when refreshing the graphics framebuffer
> > on such systems. [1]
> > 
> > As the first step, struct dma_buf stores an instance of struct dma_buf_map
> > internally. Afterwards, dma-buf's vmap and vunmap interfaces are be
> > converted. Finally, affected drivers can be fixed.
> > 
> > [1] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fdri-devel%2F20200725191012.GA434957%40ravnborg.org%2F&amp;data=02%7C01%7Cchristian.koenig%40amd.com%7C54486b9682654f3950b808d85fbcb1d3%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637364611338153209&amp;sdata=%2BZm7t8OcgkIxnY%2FdZSLhSbKC7t1y4VW5lINFKwCQv3A%3D&amp;reserved=0
> 
> Only two nit picks below, apart from that Reviewed-by: Christian König
> <christian.koenig@amd.com>
> 
> > 
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
> > ---
> >   Documentation/driver-api/dma-buf.rst |  3 +
> >   drivers/dma-buf/dma-buf.c            | 14 ++---
> >   include/linux/dma-buf-map.h          | 87 ++++++++++++++++++++++++++++
> >   include/linux/dma-buf.h              |  3 +-
> >   4 files changed, 99 insertions(+), 8 deletions(-)
> >   create mode 100644 include/linux/dma-buf-map.h
> > 
> > diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-api/dma-buf.rst
> > index 13ea0cc0a3fa..3244c600a9a1 100644
> > --- a/Documentation/driver-api/dma-buf.rst
> > +++ b/Documentation/driver-api/dma-buf.rst
> > @@ -115,6 +115,9 @@ Kernel Functions and Structures Reference
> >   .. kernel-doc:: include/linux/dma-buf.h
> >      :internal:

Please add a heading here, maybe "Buffer mapping helpers" or somethig like
that.

> > +.. kernel-doc:: include/linux/dma-buf-map.h
> > +   :internal:
> > +
> >   Reservation Objects
> >   -------------------
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index 58564d82a3a2..5e849ca241a0 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -1207,12 +1207,12 @@ void *dma_buf_vmap(struct dma_buf *dmabuf)
> >   	mutex_lock(&dmabuf->lock);
> >   	if (dmabuf->vmapping_counter) {
> >   		dmabuf->vmapping_counter++;
> > -		BUG_ON(!dmabuf->vmap_ptr);
> > -		ptr = dmabuf->vmap_ptr;
> > +		BUG_ON(dma_buf_map_is_null(&dmabuf->vmap_ptr));
> > +		ptr = dmabuf->vmap_ptr.vaddr;
> >   		goto out_unlock;
> >   	}
> > -	BUG_ON(dmabuf->vmap_ptr);
> > +	BUG_ON(dma_buf_map_is_set(&dmabuf->vmap_ptr));
> >   	ptr = dmabuf->ops->vmap(dmabuf);
> >   	if (WARN_ON_ONCE(IS_ERR(ptr)))
> > @@ -1220,7 +1220,7 @@ void *dma_buf_vmap(struct dma_buf *dmabuf)
> >   	if (!ptr)
> >   		goto out_unlock;
> > -	dmabuf->vmap_ptr = ptr;
> > +	dmabuf->vmap_ptr.vaddr = ptr;
> >   	dmabuf->vmapping_counter = 1;
> >   out_unlock:
> > @@ -1239,15 +1239,15 @@ void dma_buf_vunmap(struct dma_buf *dmabuf, void *vaddr)
> >   	if (WARN_ON(!dmabuf))
> >   		return;
> > -	BUG_ON(!dmabuf->vmap_ptr);
> > +	BUG_ON(dma_buf_map_is_null(&dmabuf->vmap_ptr));
> >   	BUG_ON(dmabuf->vmapping_counter == 0);
> > -	BUG_ON(dmabuf->vmap_ptr != vaddr);
> > +	BUG_ON(!dma_buf_map_is_vaddr(&dmabuf->vmap_ptr, vaddr));
> >   	mutex_lock(&dmabuf->lock);
> >   	if (--dmabuf->vmapping_counter == 0) {
> >   		if (dmabuf->ops->vunmap)
> >   			dmabuf->ops->vunmap(dmabuf, vaddr);
> > -		dmabuf->vmap_ptr = NULL;
> > +		dma_buf_map_clear(&dmabuf->vmap_ptr);
> >   	}
> >   	mutex_unlock(&dmabuf->lock);
> >   }
> > diff --git a/include/linux/dma-buf-map.h b/include/linux/dma-buf-map.h
> > new file mode 100644
> > index 000000000000..d4b1bb3cc4b0
> > --- /dev/null
> > +++ b/include/linux/dma-buf-map.h
> > @@ -0,0 +1,87 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Pointer to dma-buf-mapped memory, plus helpers.
> > + */
> > +
> > +#ifndef __DMA_BUF_MAP_H__
> > +#define __DMA_BUF_MAP_H__
> > +
> > +#include <linux/io.h>
> > +
> > +/**
> > + * struct dma_buf_map - Pointer to vmap'ed dma-buf memory.
> > + * @vaddr_iomem:	The buffer's address if in I/O memory
> > + * @vaddr:		The buffer's address if in system memory
> > + * @is_iomem:		True if the dma-buf memory is located in I/O
> > + *			memory, or false otherwise.
> > + *
> > + * Calling dma-buf's vmap operation returns a pointer to the buffer.
> > + * Depending on the location of the buffer, users may have to access it
> > + * with I/O operations or memory load/store operations. struct dma_buf_map
> > + * stores the buffer address and a flag that signals the required access.

Maybe explain that this can be used in general for abstracting away the
difference between system memory and __iomem for buffer mappings. Or
something like that - it's not exlusively tied to dma-buf, just a
convenient place.

> > + */
> > +struct dma_buf_map {
> > +	union {
> > +		void __iomem *vaddr_iomem;
> > +		void *vaddr;
> > +	};
> > +	bool is_iomem;
> > +};
> > +
> > +/* API transition helper */
> > +static inline bool dma_buf_map_is_vaddr(const struct dma_buf_map *map, const void *vaddr)
> > +{
> > +	return !map->is_iomem && (map->vaddr == vaddr);
> > +}
> > +
> > +/**
> > + * dma_buf_map_is_null - Tests for a dma-buf mapping to be NULL
> > + * @map:	The dma-buf mapping structure
> > + *
> > + * Depending on the state of struct dma_buf_map.is_iomem, tests if the
> > + * mapping is NULL.
> > + *
> > + * Returns:
> > + * True if the mapping is NULL, or false otherwise.
> > + */
> > +static inline bool dma_buf_map_is_null(const struct dma_buf_map *map)
> > +{
> > +	if (map->is_iomem)
> > +		return map->vaddr_iomem == NULL;
> > +	return map->vaddr == NULL;
> 
> This looks like overkill since both pointers are part of the same union.
> 
> I suggest to test only one and add a comment.
> 
> > +}
> > +
> > +/**
> > + * dma_buf_map_is_set - Tests is the dma-buf mapping has been set
> > + * @map:	The dma-buf mapping structure
> > + *
> > + * Depending on the state of struct dma_buf_map.is_iomem, tests if the
> > + * mapping has been set.
> > + *
> > + * Returns:
> > + * True if the mapping is been set, or false otherwise.
> > + */
> > +static inline bool dma_buf_map_is_set(const struct dma_buf_map *map)
> > +{
> > +	return !dma_buf_map_is_null(map);
> > +}
> > +
> > +/**
> > + * dma_buf_map_clear - Clears a dma-buf mapping structure
> > + * @map:	The dma-buf mapping structure
> > + *
> > + * Clears all fields to zero; including struct dma_buf_map.is_iomem. So
> > + * mapping structures that were set to point to I/O memory are reset for
> > + * system memory. Pointers are cleared to NULL. This is the default.
> > + */
> > +static inline void dma_buf_map_clear(struct dma_buf_map *map)
> > +{
> > +	if (map->is_iomem) {
> > +		map->vaddr_iomem = NULL;
> > +		map->is_iomem = false;
> > +	} else {
> > +		map->vaddr = NULL;
> > +	}
> 
> Maybe just use memset() on the structure.

gcc should be able to see through this, and I think the clever code is
maybe a bit too clever. I'd leave it as-is.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> 
> Christian.
> 
> > +}
> > +
> > +#endif /* __DMA_BUF_MAP_H__ */
> > diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> > index 957b398d30e5..fcc2ddfb6d18 100644
> > --- a/include/linux/dma-buf.h
> > +++ b/include/linux/dma-buf.h
> > @@ -13,6 +13,7 @@
> >   #ifndef __DMA_BUF_H__
> >   #define __DMA_BUF_H__
> > +#include <linux/dma-buf-map.h>
> >   #include <linux/file.h>
> >   #include <linux/err.h>
> >   #include <linux/scatterlist.h>
> > @@ -309,7 +310,7 @@ struct dma_buf {
> >   	const struct dma_buf_ops *ops;
> >   	struct mutex lock;
> >   	unsigned vmapping_counter;
> > -	void *vmap_ptr;
> > +	struct dma_buf_map vmap_ptr;
> >   	const char *exp_name;
> >   	const char *name;
> >   	spinlock_t name_lock;
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
