Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A144286141
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 16:31:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728053AbgJGObJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 10:31:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728623AbgJGObI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 10:31:08 -0400
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com [IPv6:2607:f8b0:4864:20::c44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55532C061755
        for <linux-media@vger.kernel.org>; Wed,  7 Oct 2020 07:31:08 -0700 (PDT)
Received: by mail-oo1-xc44.google.com with SMTP id z1so673709ooj.3
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2020 07:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=NbLfbOo6rBgplKLLXUM/j+UjD/0nZV6znJNM3tEznfE=;
        b=NTYqZ7f5B5Gq+gYWGOBHXox72i8QP8xJnVDXz/XMzy4PD5+aheXfQ9douo1x8qBJaA
         t3MCm6+mQ2l2Te5LxUMufA52jrfxXGUuS3Ub9jWGPX7BUN7lOtXCgszdLolU9WucZHoq
         TGkYA7/fPKQfpc9yG3h/xdIDNv02YJCEcWu2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=NbLfbOo6rBgplKLLXUM/j+UjD/0nZV6znJNM3tEznfE=;
        b=U4DQTiUiF0DxoHHr47hNfAscKsLCnfAYAJ+njl1ZyIF4OZ6PtmgYwHW9qdXmJp6zrM
         wMD4xS74hWOqdg3mb7u0t/WP9iKbllXofOIz5tLSvbO64CqZ55/8qZhoS4N60bjwQxkn
         a6Eeya7vshJDA80han1HBG4A1mZNnVfxuR35J+vGhqMr/NJuTzq8q70r6WAteoykE14e
         LMV48DtAS6O0P72ldjFNmg5ug09xj1rcCdixcVU2HLR04DYRJ/eEb9PEVexJkJYf6H7j
         f/2QXpRluRle/dNooqU0kVCANWkJGUcLq6zzhRmie856MBYJxN0b7w9w3+7wh92J+nR3
         ie8Q==
X-Gm-Message-State: AOAM530XVqI3M0iJapBtz+3oGGHMAZUeZGJfbbizNOrrDE4nrxsA6WR6
        C9balCYZ+D+blE0IOOlilER3Ck7yhRbC8qo5CoPiGQ==
X-Google-Smtp-Source: ABdhPJzZpewR2804aqDvAhxBrbs0NiPUuiLxDsRE6uB5xKlkNmt5x5H5vW7ze9MuHc5XJfLaMcC98vFOmMc7laRKCrA=
X-Received: by 2002:a4a:e592:: with SMTP id o18mr2238606oov.28.1602081067392;
 Wed, 07 Oct 2020 07:31:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200929151437.19717-1-tzimmermann@suse.de> <20200929151437.19717-3-tzimmermann@suse.de>
 <8fad0114-064a-4ed5-c21d-d1b4294de0a1@amd.com> <2614314a-81f7-4722-c400-68d90e48e09a@suse.de>
 <8a84f62b-33f3-f44c-52af-c859a0e0d1fb@gmail.com> <07972ada-9135-3743-a86b-487f610c509f@suse.de>
 <b569b7e3-68f0-edcc-c8f4-170e9042d348@gmail.com> <20200930094712.GW438822@phenom.ffwll.local>
 <8479d0aa-3826-4f37-0109-55daca515793@amd.com> <CAKMK7uH0U36NG8w98i0x6HVGeogiwnYDRiKquLW-8znLa7-0yg@mail.gmail.com>
 <20201002095830.GH438822@phenom.ffwll.local> <5bf40546-8da9-1649-22da-a982f1e8d9c3@suse.de>
 <CAKMK7uEu0vwiG9Uz0_Ysyus0ZAF-1HNxvPZjcG3xZS=gkKgJLw@mail.gmail.com>
 <26ac0446-9e16-1ca1-7407-3d0cd7125e0e@suse.de> <09d634d0-f20a-e9a9-d8d2-b50e8aaf156f@amd.com>
In-Reply-To: <09d634d0-f20a-e9a9-d8d2-b50e8aaf156f@amd.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Wed, 7 Oct 2020 16:30:56 +0200
Message-ID: <CAKMK7uEPn=q1J50koveE+b49r=SE0eh5nTrxWOVRN2grdyNPTA@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] drm/ttm: Add ttm_kmap_obj_to_dma_buf_map() for
 type conversion
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        Luben Tuikov <luben.tuikov@amd.com>,
        Dave Airlie <airlied@linux.ie>,
        Nouveau Dev <nouveau@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "Wilson, Chris" <chris@chris-wilson.co.uk>,
        Melissa Wen <melissa.srw@gmail.com>,
        Huang Rui <ray.huang@amd.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Emil Velikov <emil.velikov@collabora.com>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        lima@lists.freedesktop.org,
        Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Steven Price <steven.price@arm.com>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Kukjin Kim <kgene@kernel.org>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        "open list:DRM DRIVER FOR QXL VIRTUAL GPU" 
        <spice-devel@lists.freedesktop.org>,
        Ben Skeggs <bskeggs@redhat.com>,
        The etnaviv authors <etnaviv@lists.freedesktop.org>,
        Hans de Goede <hdegoede@redhat.com>,
        "moderated list:DRM DRIVERS FOR XEN" <xen-devel@lists.xenproject.org>,
        "open list:VIRTIO CORE, NET..." 
        <virtualization@lists.linux-foundation.org>,
        Sean Paul <sean@poorly.run>, apaneers@amd.com,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Sandy Huang <hjc@rock-chips.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Qinglang Miao <miaoqinglang@huawei.com>,
        Qiang Yu <yuq825@gmail.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 7, 2020 at 3:25 PM Christian K=C3=B6nig <christian.koenig@amd.c=
om> wrote:
>
> Am 07.10.20 um 15:20 schrieb Thomas Zimmermann:
> > Hi
> >
> > Am 07.10.20 um 15:10 schrieb Daniel Vetter:
> >> On Wed, Oct 7, 2020 at 2:57 PM Thomas Zimmermann <tzimmermann@suse.de>=
 wrote:
> >>> Hi
> >>>
> >>> Am 02.10.20 um 11:58 schrieb Daniel Vetter:
> >>>> On Wed, Sep 30, 2020 at 02:51:46PM +0200, Daniel Vetter wrote:
> >>>>> On Wed, Sep 30, 2020 at 2:34 PM Christian K=C3=B6nig
> >>>>> <christian.koenig@amd.com> wrote:
> >>>>>> Am 30.09.20 um 11:47 schrieb Daniel Vetter:
> >>>>>>> On Wed, Sep 30, 2020 at 10:34:31AM +0200, Christian K=C3=B6nig wr=
ote:
> >>>>>>>> Am 30.09.20 um 10:19 schrieb Thomas Zimmermann:
> >>>>>>>>> Hi
> >>>>>>>>>
> >>>>>>>>> Am 30.09.20 um 10:05 schrieb Christian K=C3=B6nig:
> >>>>>>>>>> Am 29.09.20 um 19:49 schrieb Thomas Zimmermann:
> >>>>>>>>>>> Hi Christian
> >>>>>>>>>>>
> >>>>>>>>>>> Am 29.09.20 um 17:35 schrieb Christian K=C3=B6nig:
> >>>>>>>>>>>> Am 29.09.20 um 17:14 schrieb Thomas Zimmermann:
> >>>>>>>>>>>>> The new helper ttm_kmap_obj_to_dma_buf() extracts address a=
nd location
> >>>>>>>>>>>>> from and instance of TTM's kmap_obj and initializes struct =
dma_buf_map
> >>>>>>>>>>>>> with these values. Helpful for TTM-based drivers.
> >>>>>>>>>>>> We could completely drop that if we use the same structure i=
nside TTM as
> >>>>>>>>>>>> well.
> >>>>>>>>>>>>
> >>>>>>>>>>>> Additional to that which driver is going to use this?
> >>>>>>>>>>> As Daniel mentioned, it's in patch 3. The TTM-based drivers w=
ill
> >>>>>>>>>>> retrieve the pointer via this function.
> >>>>>>>>>>>
> >>>>>>>>>>> I do want to see all that being more tightly integrated into =
TTM, but
> >>>>>>>>>>> not in this series. This one is about fixing the bochs-on-spa=
rc64
> >>>>>>>>>>> problem for good. Patch 7 adds an update to TTM to the DRM TO=
DO list.
> >>>>>>>>>> I should have asked which driver you try to fix here :)
> >>>>>>>>>>
> >>>>>>>>>> In this case just keep the function inside bochs and only fix =
it there.
> >>>>>>>>>>
> >>>>>>>>>> All other drivers can be fixed when we generally pump this thr=
ough TTM.
> >>>>>>>>> Did you take a look at patch 3? This function will be used by V=
RAM
> >>>>>>>>> helpers, nouveau, radeon, amdgpu and qxl. If we don't put it he=
re, we
> >>>>>>>>> have to duplicate the functionality in each if these drivers. B=
ochs
> >>>>>>>>> itself uses VRAM helpers and doesn't touch the function directl=
y.
> >>>>>>>> Ah, ok can we have that then only in the VRAM helpers?
> >>>>>>>>
> >>>>>>>> Alternative you could go ahead and use dma_buf_map in ttm_bo_kma=
p_obj
> >>>>>>>> directly and drop the hack with the TTM_BO_MAP_IOMEM_MASK.
> >>>>>>>>
> >>>>>>>> What I want to avoid is to have another conversion function in T=
TM because
> >>>>>>>> what happens here is that we already convert from ttm_bus_placem=
ent to
> >>>>>>>> ttm_bo_kmap_obj and then to dma_buf_map.
> >>>>>>> Hm I'm not really seeing how that helps with a gradual conversion=
 of
> >>>>>>> everything over to dma_buf_map and assorted helpers for access? T=
here's
> >>>>>>> too many places in ttm drivers where is_iomem and related stuff i=
s used to
> >>>>>>> be able to convert it all in one go. An intermediate state with a=
 bunch of
> >>>>>>> conversions seems fairly unavoidable to me.
> >>>>>> Fair enough. I would just have started bottom up and not top down.
> >>>>>>
> >>>>>> Anyway feel free to go ahead with this approach as long as we can =
remove
> >>>>>> the new function again when we clean that stuff up for good.
> >>>>> Yeah I guess bottom up would make more sense as a refactoring. But =
the
> >>>>> main motivation to land this here is to fix the __mmio vs normal
> >>>>> memory confusion in the fbdev emulation helpers for sparc (and
> >>>>> anything else that needs this). Hence the top down approach for
> >>>>> rolling this out.
> >>>> Ok I started reviewing this a bit more in-depth, and I think this is=
 a bit
> >>>> too much of a de-tour.
> >>>>
> >>>> Looking through all the callers of ttm_bo_kmap almost everyone maps =
the
> >>>> entire object. Only vmwgfx uses to map less than that. Also, everyon=
e just
> >>>> immediately follows up with converting that full object map into a
> >>>> pointer.
> >>>>
> >>>> So I think what we really want here is:
> >>>> - new function
> >>>>
> >>>> int ttm_bo_vmap(struct ttm_buffer_object *bo, struct dma_buf_map *ma=
p);
> >>>>
> >>>>    _vmap name since that's consistent with both dma_buf functions an=
d
> >>>>    what's usually used to implement this. Outside of the ttm world k=
map
> >>>>    usually just means single-page mappings using kmap() or it's iome=
m
> >>>>    sibling io_mapping_map* so rather confusing name for a function w=
hich
> >>>>    usually is just used to set up a vmap of the entire buffer.
> >>>>
> >>>> - a helper which can be used for the drm_gem_object_funcs vmap/vunma=
p
> >>>>    functions for all ttm drivers. We should be able to make this ful=
ly
> >>>>    generic because a) we now have dma_buf_map and b) drm_gem_object =
is
> >>>>    embedded in the ttm_bo, so we can upcast for everyone who's both =
a ttm
> >>>>    and gem driver.
> >>>>
> >>>>    This is maybe a good follow-up, since it should allow us to ditch=
 quite
> >>>>    a bit of the vram helper code for this more generic stuff. I also=
 might
> >>>>    have missed some special-cases here, but from a quick look everyt=
hing
> >>>>    just pins the buffer to the current location and that's it.
> >>>>
> >>>>    Also this obviously requires Christian's generic ttm_bo_pin rewor=
k
> >>>>    first.
> >>>>
> >>>> - roll the above out to drivers.
> >>>>
> >>>> Christian/Thomas, thoughts on this?
> >>> I agree on the goals, but what is the immediate objective here?
> >>>
> >>> Adding ttm_bo_vmap() does not work out easily, as struct ttm_bo_kmap_=
obj
> >>> is a central part of the internals of TTM. struct ttm_bo_kmap_obj has
> >>> more internal state that struct dma_buf_map, so they are not easily
> >>> convertible either. What you propose seems to require a reimplementat=
ion
> >>> of the existing ttm_bo_kmap() code. That is it's own patch series.
> >>>
> >>> I'd rather go with some variant of the existing patch and add
> >>> ttm_bo_vmap() in a follow-up.
> >> ttm_bo_vmap would simply wrap what you currently open-code as
> >> ttm_bo_kmap + ttm_kmap_obj_to_dma_buf_map. Removing ttm_kmap_obj would
> >> be a much later step. Why do you think adding ttm_bo_vmap is not
> >> possible?
> > The calls to ttm_bo_kmap/_kunmap() require an instance of struct
> > ttm_bo_kmap_obj that is stored in each driver's private bo structure
> > (e.g., struct drm_gem_vram_object, struct radeon_bo, etc). When I made
> > patch 3, I flirted with the idea of unifying the driver's _vmap code in
> > a shared helper, but I couldn't find a simple way of doing it. That's
> > why it's open-coded in the first place.

Yeah we'd need a ttm_bo_vunmap I guess to make this work. Which
shouldn't be more than a few lines, but maybe too much to do in this
series.

> Well that makes kind of sense. Keep in mind that ttm_bo_kmap is
> currently way to complicated.

Yeah, simplifying this into a ttm_bo_vmap on one side, and a simple
1-page kmap helper on the other should help a lot.
-Daniel

>
> Christian.
>
> >
> > Best regards
> > Thomas
> >
> >> -Daniel
> >>
> >>
> >>> Best regards
> >>> Thomas
> >>>
> >>>> I think for the immediate need of rolling this out for vram helpers =
and
> >>>> fbdev code we should be able to do this, but just postpone the drive=
r wide
> >>>> roll-out for now.
> >>>>
> >>>> Cheers, Daniel
> >>>>
> >>>>> -Daniel
> >>>>>
> >>>>>> Christian.
> >>>>>>
> >>>>>>> -Daniel
> >>>>>>>
> >>>>>>>> Thanks,
> >>>>>>>> Christian.
> >>>>>>>>
> >>>>>>>>> Best regards
> >>>>>>>>> Thomas
> >>>>>>>>>
> >>>>>>>>>> Regards,
> >>>>>>>>>> Christian.
> >>>>>>>>>>
> >>>>>>>>>>> Best regards
> >>>>>>>>>>> Thomas
> >>>>>>>>>>>
> >>>>>>>>>>>> Regards,
> >>>>>>>>>>>> Christian.
> >>>>>>>>>>>>
> >>>>>>>>>>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >>>>>>>>>>>>> ---
> >>>>>>>>>>>>>      include/drm/ttm/ttm_bo_api.h | 24 ++++++++++++++++++++=
++++
> >>>>>>>>>>>>>      include/linux/dma-buf-map.h  | 20 ++++++++++++++++++++
> >>>>>>>>>>>>>      2 files changed, 44 insertions(+)
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm=
/ttm_bo_api.h
> >>>>>>>>>>>>> index c96a25d571c8..62d89f05a801 100644
> >>>>>>>>>>>>> --- a/include/drm/ttm/ttm_bo_api.h
> >>>>>>>>>>>>> +++ b/include/drm/ttm/ttm_bo_api.h
> >>>>>>>>>>>>> @@ -34,6 +34,7 @@
> >>>>>>>>>>>>>      #include <drm/drm_gem.h>
> >>>>>>>>>>>>>      #include <drm/drm_hashtab.h>
> >>>>>>>>>>>>>      #include <drm/drm_vma_manager.h>
> >>>>>>>>>>>>> +#include <linux/dma-buf-map.h>
> >>>>>>>>>>>>>      #include <linux/kref.h>
> >>>>>>>>>>>>>      #include <linux/list.h>
> >>>>>>>>>>>>>      #include <linux/wait.h>
> >>>>>>>>>>>>> @@ -486,6 +487,29 @@ static inline void *ttm_kmap_obj_virtu=
al(struct
> >>>>>>>>>>>>> ttm_bo_kmap_obj *map,
> >>>>>>>>>>>>>          return map->virtual;
> >>>>>>>>>>>>>      }
> >>>>>>>>>>>>>      +/**
> >>>>>>>>>>>>> + * ttm_kmap_obj_to_dma_buf_map
> >>>>>>>>>>>>> + *
> >>>>>>>>>>>>> + * @kmap: A struct ttm_bo_kmap_obj returned from ttm_bo_km=
ap.
> >>>>>>>>>>>>> + * @map: Returns the mapping as struct dma_buf_map
> >>>>>>>>>>>>> + *
> >>>>>>>>>>>>> + * Converts struct ttm_bo_kmap_obj to struct dma_buf_map. =
If the memory
> >>>>>>>>>>>>> + * is not mapped, the returned mapping is initialized to N=
ULL.
> >>>>>>>>>>>>> + */
> >>>>>>>>>>>>> +static inline void ttm_kmap_obj_to_dma_buf_map(struct ttm_=
bo_kmap_obj
> >>>>>>>>>>>>> *kmap,
> >>>>>>>>>>>>> +                           struct dma_buf_map *map)
> >>>>>>>>>>>>> +{
> >>>>>>>>>>>>> +    bool is_iomem;
> >>>>>>>>>>>>> +    void *vaddr =3D ttm_kmap_obj_virtual(kmap, &is_iomem);
> >>>>>>>>>>>>> +
> >>>>>>>>>>>>> +    if (!vaddr)
> >>>>>>>>>>>>> +        dma_buf_map_clear(map);
> >>>>>>>>>>>>> +    else if (is_iomem)
> >>>>>>>>>>>>> +        dma_buf_map_set_vaddr_iomem(map, (void __force __i=
omem *)vaddr);
> >>>>>>>>>>>>> +    else
> >>>>>>>>>>>>> +        dma_buf_map_set_vaddr(map, vaddr);
> >>>>>>>>>>>>> +}
> >>>>>>>>>>>>> +
> >>>>>>>>>>>>>      /**
> >>>>>>>>>>>>>       * ttm_bo_kmap
> >>>>>>>>>>>>>       *
> >>>>>>>>>>>>> diff --git a/include/linux/dma-buf-map.h b/include/linux/dm=
a-buf-map.h
> >>>>>>>>>>>>> index fd1aba545fdf..2e8bbecb5091 100644
> >>>>>>>>>>>>> --- a/include/linux/dma-buf-map.h
> >>>>>>>>>>>>> +++ b/include/linux/dma-buf-map.h
> >>>>>>>>>>>>> @@ -45,6 +45,12 @@
> >>>>>>>>>>>>>       *
> >>>>>>>>>>>>>       *    dma_buf_map_set_vaddr(&map. 0xdeadbeaf);
> >>>>>>>>>>>>>       *
> >>>>>>>>>>>>> + * To set an address in I/O memory, use dma_buf_map_set_va=
ddr_iomem().
> >>>>>>>>>>>>> + *
> >>>>>>>>>>>>> + * .. code-block:: c
> >>>>>>>>>>>>> + *
> >>>>>>>>>>>>> + *    dma_buf_map_set_vaddr_iomem(&map. 0xdeadbeaf);
> >>>>>>>>>>>>> + *
> >>>>>>>>>>>>>       * Test if a mapping is valid with either dma_buf_map_=
is_set() or
> >>>>>>>>>>>>>       * dma_buf_map_is_null().
> >>>>>>>>>>>>>       *
> >>>>>>>>>>>>> @@ -118,6 +124,20 @@ static inline void dma_buf_map_set_vad=
dr(struct
> >>>>>>>>>>>>> dma_buf_map *map, void *vaddr)
> >>>>>>>>>>>>>          map->is_iomem =3D false;
> >>>>>>>>>>>>>      }
> >>>>>>>>>>>>>      +/**
> >>>>>>>>>>>>> + * dma_buf_map_set_vaddr_iomem - Sets a dma-buf mapping st=
ructure to
> >>>>>>>>>>>>> an address in I/O memory
> >>>>>>>>>>>>> + * @map:        The dma-buf mapping structure
> >>>>>>>>>>>>> + * @vaddr_iomem:    An I/O-memory address
> >>>>>>>>>>>>> + *
> >>>>>>>>>>>>> + * Sets the address and the I/O-memory flag.
> >>>>>>>>>>>>> + */
> >>>>>>>>>>>>> +static inline void dma_buf_map_set_vaddr_iomem(struct dma_=
buf_map *map,
> >>>>>>>>>>>>> +                           void __iomem *vaddr_iomem)
> >>>>>>>>>>>>> +{
> >>>>>>>>>>>>> +    map->vaddr_iomem =3D vaddr_iomem;
> >>>>>>>>>>>>> +    map->is_iomem =3D true;
> >>>>>>>>>>>>> +}
> >>>>>>>>>>>>> +
> >>>>>>>>>>>>>      /**
> >>>>>>>>>>>>>       * dma_buf_map_is_equal - Compares two dma-buf mapping=
 structures
> >>>>>>>>>>>>> for equality
> >>>>>>>>>>>>>       * @lhs:    The dma-buf mapping structure
> >>>>>>>>>>>> _______________________________________________
> >>>>>>>>>>>> dri-devel mailing list
> >>>>>>>>>>>> dri-devel@lists.freedesktop.org
> >>>>>>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%=
3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=3D0=
2%7C01%7Cchristian.koenig%40amd.com%7C472c3d655a61411deb6708d86525d1b8%7C3d=
d8961fe4884e608e11a82d994e183d%7C0%7C0%7C637370560438965013&amp;sdata=3DHdH=
OA%2F1VcIX%2F7YtfYTiAqYEvw7Ag%2FS%2BxS5VwJKOv5y0%3D&amp;reserved=3D0
> >>>>>>>>>>> _______________________________________________
> >>>>>>>>>>> amd-gfx mailing list
> >>>>>>>>>>> amd-gfx@lists.freedesktop.org
> >>>>>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3=
A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=3D02%7=
C01%7Cchristian.koenig%40amd.com%7C472c3d655a61411deb6708d86525d1b8%7C3dd89=
61fe4884e608e11a82d994e183d%7C0%7C0%7C637370560438965013&amp;sdata=3DH%2B5H=
KCsTrksRV2EyEiFGSTyS79jsWCmJimSMoJYusx8%3D&amp;reserved=3D0
> >>>>>>>>>> _______________________________________________
> >>>>>>>>>> dri-devel mailing list
> >>>>>>>>>> dri-devel@lists.freedesktop.org
> >>>>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A=
%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=3D02%=
7C01%7Cchristian.koenig%40amd.com%7C472c3d655a61411deb6708d86525d1b8%7C3dd8=
961fe4884e608e11a82d994e183d%7C0%7C0%7C637370560438965013&amp;sdata=3DHdHOA=
%2F1VcIX%2F7YtfYTiAqYEvw7Ag%2FS%2BxS5VwJKOv5y0%3D&amp;reserved=3D0
> >>>>>>>>>>
> >>>>>>>>> _______________________________________________
> >>>>>>>>> amd-gfx mailing list
> >>>>>>>>> amd-gfx@lists.freedesktop.org
> >>>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=3D02%7C0=
1%7Cchristian.koenig%40amd.com%7C472c3d655a61411deb6708d86525d1b8%7C3dd8961=
fe4884e608e11a82d994e183d%7C0%7C0%7C637370560438965013&amp;sdata=3DH%2B5HKC=
sTrksRV2EyEiFGSTyS79jsWCmJimSMoJYusx8%3D&amp;reserved=3D0
> >>>>>
> >>>>> --
> >>>>> Daniel Vetter
> >>>>> Software Engineer, Intel Corporation
> >>>>> http://blog.ffwll.ch
> >>> --
> >>> Thomas Zimmermann
> >>> Graphics Driver Developer
> >>> SUSE Software Solutions Germany GmbH
> >>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> >>> (HRB 36809, AG N=C3=BCrnberg)
> >>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
> >>>
> >>
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
