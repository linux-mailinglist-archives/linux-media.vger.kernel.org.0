Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAE9C27D2FE
	for <lists+linux-media@lfdr.de>; Tue, 29 Sep 2020 17:44:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728364AbgI2Poy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Sep 2020 11:44:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725765AbgI2Poy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Sep 2020 11:44:54 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63E00C0613D1
        for <linux-media@vger.kernel.org>; Tue, 29 Sep 2020 08:44:52 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id w16so5954161oia.2
        for <linux-media@vger.kernel.org>; Tue, 29 Sep 2020 08:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=GmccwYPvbTQr0lao9qdmlRwawj+lCQ+1QXiD0l/qUKM=;
        b=AvEKgyz1Mpr2Csbf03wB2afEPAxC22ZTlvhljJHzAj0BPTuqlRxgWwE7USW2AGrgho
         ezvaYXvQ9JzEwZhGwBXpfXwg4JSFE6mfLDimgQVZ8LU8sqJCEZTJqkkhRJp36tavL2Vl
         rlVv65YZ1m1v7DUXijKWB3ytuAGyfIIO5Qvwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=GmccwYPvbTQr0lao9qdmlRwawj+lCQ+1QXiD0l/qUKM=;
        b=RpCSV6Aa/H02sJoi/LtVgHUiyMk8coRJPerPB9a2UViWt+o25xU2H342T5b3BPHPCM
         JZ71jzRo1UGGjjI459PVFugpR+F87fkB4lEsuLveOlVS2DsafCFV7P047sSG2erxJerj
         vXnzJ6N9KyN9sNeAtT2YWTqHin24VhBmQdutB2kCLTYEO+HCL4aQsqqABfYG/kOBOjyv
         JX7Uo0ZouJMt1SnotdUwryLZvL19zqyjfG9bAefLxXR7PSrrkjZ7PqfnJFQ20ibLajgB
         P4NV0z9HeI0tttDwGhrs2Xh7Kwu5FK1VkLWLNjHCRU+jiTP4xxCLio1K3kDoAV7zs/Ka
         SDUw==
X-Gm-Message-State: AOAM532cHfZqRyBEMn6GQDll5DdaDRRXRX5jnw1kvNdMkkVau6HPfHlg
        9l6DqHj2oMLTpfr4QDouNr+GOmsNpH5mCffgIa7oFA==
X-Google-Smtp-Source: ABdhPJwP35vw5lT9neuydp7mvKwzDwhzvDxYO3obIhsVbbLOYCkSBjKqS3WXQ9gvZ6vnjTejVq7QMotIsIsxGWeL23s=
X-Received: by 2002:aca:6083:: with SMTP id u125mr3023784oib.14.1601394291599;
 Tue, 29 Sep 2020 08:44:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200929151437.19717-1-tzimmermann@suse.de> <20200929151437.19717-3-tzimmermann@suse.de>
 <8fad0114-064a-4ed5-c21d-d1b4294de0a1@amd.com>
In-Reply-To: <8fad0114-064a-4ed5-c21d-d1b4294de0a1@amd.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Tue, 29 Sep 2020 17:44:40 +0200
Message-ID: <CAKMK7uF8fYXzW3NUqR8Qkp8Z1Dk7xfwgXfUi7UdA5Cf++1HnOQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] drm/ttm: Add ttm_kmap_obj_to_dma_buf_map() for
 type conversion
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Dave Airlie <airlied@linux.ie>,
        Sam Ravnborg <sam@ravnborg.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Qiang Yu <yuq825@gmail.com>, Ben Skeggs <bskeggs@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Steven Price <steven.price@arm.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Sandy Huang <hjc@rock-chips.com>,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Hans de Goede <hdegoede@redhat.com>,
        Sean Paul <sean@poorly.run>, "Anholt, Eric" <eric@anholt.net>,
        Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
        Huang Rui <ray.huang@amd.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Emil Velikov <emil.velikov@collabora.com>,
        Luben Tuikov <luben.tuikov@amd.com>, apaneers@amd.com,
        Linus Walleij <linus.walleij@linaro.org>,
        Melissa Wen <melissa.srw@gmail.com>,
        "Wilson, Chris" <chris@chris-wilson.co.uk>,
        Qinglang Miao <miaoqinglang@huawei.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        "open list:VIRTIO CORE, NET..." 
        <virtualization@lists.linux-foundation.org>,
        The etnaviv authors <etnaviv@lists.freedesktop.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        lima@lists.freedesktop.org,
        Nouveau Dev <nouveau@lists.freedesktop.org>,
        "open list:DRM DRIVER FOR QXL VIRTUAL GPU" 
        <spice-devel@lists.freedesktop.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        "moderated list:DRM DRIVERS FOR XEN" <xen-devel@lists.xenproject.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Sep 29, 2020 at 5:35 PM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 29.09.20 um 17:14 schrieb Thomas Zimmermann:
> > The new helper ttm_kmap_obj_to_dma_buf() extracts address and location
> > from and instance of TTM's kmap_obj and initializes struct dma_buf_map
> > with these values. Helpful for TTM-based drivers.
>
> We could completely drop that if we use the same structure inside TTM as
> well.

> Additional to that which driver is going to use this?

Patch 3 in this series.

I also think this makes sense for gradual conversion:
1. add this helper
2. convert over all users of vmap, this should get rid of is_iomem
flags (and will probably result in a pile of small additions to
dma-buf-map.h)
3. push the struct dma_buf_map down into ttm drivers

Cheers, Daniel

> Regards,
> Christian.
>
> >
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > ---
> >   include/drm/ttm/ttm_bo_api.h | 24 ++++++++++++++++++++++++
> >   include/linux/dma-buf-map.h  | 20 ++++++++++++++++++++
> >   2 files changed, 44 insertions(+)
> >
> > diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.=
h
> > index c96a25d571c8..62d89f05a801 100644
> > --- a/include/drm/ttm/ttm_bo_api.h
> > +++ b/include/drm/ttm/ttm_bo_api.h
> > @@ -34,6 +34,7 @@
> >   #include <drm/drm_gem.h>
> >   #include <drm/drm_hashtab.h>
> >   #include <drm/drm_vma_manager.h>
> > +#include <linux/dma-buf-map.h>
> >   #include <linux/kref.h>
> >   #include <linux/list.h>
> >   #include <linux/wait.h>
> > @@ -486,6 +487,29 @@ static inline void *ttm_kmap_obj_virtual(struct tt=
m_bo_kmap_obj *map,
> >       return map->virtual;
> >   }
> >
> > +/**
> > + * ttm_kmap_obj_to_dma_buf_map
> > + *
> > + * @kmap: A struct ttm_bo_kmap_obj returned from ttm_bo_kmap.
> > + * @map: Returns the mapping as struct dma_buf_map
> > + *
> > + * Converts struct ttm_bo_kmap_obj to struct dma_buf_map. If the memor=
y
> > + * is not mapped, the returned mapping is initialized to NULL.
> > + */
> > +static inline void ttm_kmap_obj_to_dma_buf_map(struct ttm_bo_kmap_obj =
*kmap,
> > +                                            struct dma_buf_map *map)
> > +{
> > +     bool is_iomem;
> > +     void *vaddr =3D ttm_kmap_obj_virtual(kmap, &is_iomem);
> > +
> > +     if (!vaddr)
> > +             dma_buf_map_clear(map);
> > +     else if (is_iomem)
> > +             dma_buf_map_set_vaddr_iomem(map, (void __force __iomem *)=
vaddr);
> > +     else
> > +             dma_buf_map_set_vaddr(map, vaddr);
> > +}
> > +
> >   /**
> >    * ttm_bo_kmap
> >    *
> > diff --git a/include/linux/dma-buf-map.h b/include/linux/dma-buf-map.h
> > index fd1aba545fdf..2e8bbecb5091 100644
> > --- a/include/linux/dma-buf-map.h
> > +++ b/include/linux/dma-buf-map.h
> > @@ -45,6 +45,12 @@
> >    *
> >    *  dma_buf_map_set_vaddr(&map. 0xdeadbeaf);
> >    *
> > + * To set an address in I/O memory, use dma_buf_map_set_vaddr_iomem().
> > + *
> > + * .. code-block:: c
> > + *
> > + *   dma_buf_map_set_vaddr_iomem(&map. 0xdeadbeaf);
> > + *
> >    * Test if a mapping is valid with either dma_buf_map_is_set() or
> >    * dma_buf_map_is_null().
> >    *
> > @@ -118,6 +124,20 @@ static inline void dma_buf_map_set_vaddr(struct dm=
a_buf_map *map, void *vaddr)
> >       map->is_iomem =3D false;
> >   }
> >
> > +/**
> > + * dma_buf_map_set_vaddr_iomem - Sets a dma-buf mapping structure to a=
n address in I/O memory
> > + * @map:             The dma-buf mapping structure
> > + * @vaddr_iomem:     An I/O-memory address
> > + *
> > + * Sets the address and the I/O-memory flag.
> > + */
> > +static inline void dma_buf_map_set_vaddr_iomem(struct dma_buf_map *map=
,
> > +                                            void __iomem *vaddr_iomem)
> > +{
> > +     map->vaddr_iomem =3D vaddr_iomem;
> > +     map->is_iomem =3D true;
> > +}
> > +
> >   /**
> >    * dma_buf_map_is_equal - Compares two dma-buf mapping structures for=
 equality
> >    * @lhs:    The dma-buf mapping structure
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
