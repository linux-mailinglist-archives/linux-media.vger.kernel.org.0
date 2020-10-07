Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00E29285FD4
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 15:10:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728375AbgJGNK4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 09:10:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728177AbgJGNKz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 09:10:55 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4370CC061755
        for <linux-media@vger.kernel.org>; Wed,  7 Oct 2020 06:10:54 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id q21so2100940ota.8
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2020 06:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=VsnMtwduK/eaPh8sh7OsPT0FyDBA9ykxTycTmfoK7FE=;
        b=XQw1QLYfR9qfW8B6CzTH9HNbjUoNQ7c7owK49oNl3ZGAyaYgsZRW8NsymAZNFvWa6v
         Pu2B9/m31WiqNmGwbeYXwkQZ64u4W7gA0XbGls83scZYTIzLPHrVLDuVDkcKBiYS2P+J
         IUNoJl08qFhoGCgQeLpdMq8KOGzN/FBJiPLz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=VsnMtwduK/eaPh8sh7OsPT0FyDBA9ykxTycTmfoK7FE=;
        b=Bfl1EIyhiEQhF3QDWkkJmBMiTzP2ocx7T6bKEr7y/Su4D89n2b9UaWHsfUaDfbcjVj
         ysfUA175gSUxveoouWZaaMJAfVRTgKLzqxQ5c3cmINBEYJ7j18hl6uvKne/BiAWV6XNv
         vj3gj5thUCSzeQye7qPiu+Cc+lLI1mIRsgnmaGlNO7HXUnV5H+WP65HATvRlwVmJdMBw
         69ossF6TCSYypJx8FPm3k+S2tSVUSO1wBFzXwCLqWRF9HVlekfeT5hx3LVEadyS8hgR8
         lAP/CEENKlKJrdrtEmk5ZFW/AKCRh9ZiWbyO9DM2daxL5kE7kpI1+iniaSoIUDyaRQWZ
         Qbrg==
X-Gm-Message-State: AOAM533wIEn5qTKTv1Yqx0/53o/n6heWDXBGQ67SMoZIerYLyYVUjAdG
        fmP+LKsU3YnkyLYjqnLmW1EuomfOMDDmbDkiiOGVLw==
X-Google-Smtp-Source: ABdhPJz2fU3vfrmM8BVWXG8zDyJNA8JBNVY8njvMFhcKMWXmRriQUSCDo6MUx7uQxHr2lmvyhiUCEX/nBDzmPgvF+Z4=
X-Received: by 2002:a05:6830:1e56:: with SMTP id e22mr1739852otj.303.1602076253502;
 Wed, 07 Oct 2020 06:10:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200929151437.19717-1-tzimmermann@suse.de> <20200929151437.19717-3-tzimmermann@suse.de>
 <8fad0114-064a-4ed5-c21d-d1b4294de0a1@amd.com> <2614314a-81f7-4722-c400-68d90e48e09a@suse.de>
 <8a84f62b-33f3-f44c-52af-c859a0e0d1fb@gmail.com> <07972ada-9135-3743-a86b-487f610c509f@suse.de>
 <b569b7e3-68f0-edcc-c8f4-170e9042d348@gmail.com> <20200930094712.GW438822@phenom.ffwll.local>
 <8479d0aa-3826-4f37-0109-55daca515793@amd.com> <CAKMK7uH0U36NG8w98i0x6HVGeogiwnYDRiKquLW-8znLa7-0yg@mail.gmail.com>
 <20201002095830.GH438822@phenom.ffwll.local> <5bf40546-8da9-1649-22da-a982f1e8d9c3@suse.de>
In-Reply-To: <5bf40546-8da9-1649-22da-a982f1e8d9c3@suse.de>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Wed, 7 Oct 2020 15:10:41 +0200
Message-ID: <CAKMK7uEu0vwiG9Uz0_Ysyus0ZAF-1HNxvPZjcG3xZS=gkKgJLw@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] drm/ttm: Add ttm_kmap_obj_to_dma_buf_map() for
 type conversion
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
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
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        lima@lists.freedesktop.org,
        Nouveau Dev <nouveau@lists.freedesktop.org>,
        The etnaviv authors <etnaviv@lists.freedesktop.org>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        "open list:VIRTIO CORE, NET..." 
        <virtualization@lists.linux-foundation.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:DRM DRIVER FOR QXL VIRTUAL GPU" 
        <spice-devel@lists.freedesktop.org>,
        "moderated list:DRM DRIVERS FOR XEN" <xen-devel@lists.xenproject.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 7, 2020 at 2:57 PM Thomas Zimmermann <tzimmermann@suse.de> wrot=
e:
>
> Hi
>
> Am 02.10.20 um 11:58 schrieb Daniel Vetter:
> > On Wed, Sep 30, 2020 at 02:51:46PM +0200, Daniel Vetter wrote:
> >> On Wed, Sep 30, 2020 at 2:34 PM Christian K=C3=B6nig
> >> <christian.koenig@amd.com> wrote:
> >>>
> >>> Am 30.09.20 um 11:47 schrieb Daniel Vetter:
> >>>> On Wed, Sep 30, 2020 at 10:34:31AM +0200, Christian K=C3=B6nig wrote=
:
> >>>>> Am 30.09.20 um 10:19 schrieb Thomas Zimmermann:
> >>>>>> Hi
> >>>>>>
> >>>>>> Am 30.09.20 um 10:05 schrieb Christian K=C3=B6nig:
> >>>>>>> Am 29.09.20 um 19:49 schrieb Thomas Zimmermann:
> >>>>>>>> Hi Christian
> >>>>>>>>
> >>>>>>>> Am 29.09.20 um 17:35 schrieb Christian K=C3=B6nig:
> >>>>>>>>> Am 29.09.20 um 17:14 schrieb Thomas Zimmermann:
> >>>>>>>>>> The new helper ttm_kmap_obj_to_dma_buf() extracts address and =
location
> >>>>>>>>>> from and instance of TTM's kmap_obj and initializes struct dma=
_buf_map
> >>>>>>>>>> with these values. Helpful for TTM-based drivers.
> >>>>>>>>> We could completely drop that if we use the same structure insi=
de TTM as
> >>>>>>>>> well.
> >>>>>>>>>
> >>>>>>>>> Additional to that which driver is going to use this?
> >>>>>>>> As Daniel mentioned, it's in patch 3. The TTM-based drivers will
> >>>>>>>> retrieve the pointer via this function.
> >>>>>>>>
> >>>>>>>> I do want to see all that being more tightly integrated into TTM=
, but
> >>>>>>>> not in this series. This one is about fixing the bochs-on-sparc6=
4
> >>>>>>>> problem for good. Patch 7 adds an update to TTM to the DRM TODO =
list.
> >>>>>>> I should have asked which driver you try to fix here :)
> >>>>>>>
> >>>>>>> In this case just keep the function inside bochs and only fix it =
there.
> >>>>>>>
> >>>>>>> All other drivers can be fixed when we generally pump this throug=
h TTM.
> >>>>>> Did you take a look at patch 3? This function will be used by VRAM
> >>>>>> helpers, nouveau, radeon, amdgpu and qxl. If we don't put it here,=
 we
> >>>>>> have to duplicate the functionality in each if these drivers. Boch=
s
> >>>>>> itself uses VRAM helpers and doesn't touch the function directly.
> >>>>> Ah, ok can we have that then only in the VRAM helpers?
> >>>>>
> >>>>> Alternative you could go ahead and use dma_buf_map in ttm_bo_kmap_o=
bj
> >>>>> directly and drop the hack with the TTM_BO_MAP_IOMEM_MASK.
> >>>>>
> >>>>> What I want to avoid is to have another conversion function in TTM =
because
> >>>>> what happens here is that we already convert from ttm_bus_placement=
 to
> >>>>> ttm_bo_kmap_obj and then to dma_buf_map.
> >>>> Hm I'm not really seeing how that helps with a gradual conversion of
> >>>> everything over to dma_buf_map and assorted helpers for access? Ther=
e's
> >>>> too many places in ttm drivers where is_iomem and related stuff is u=
sed to
> >>>> be able to convert it all in one go. An intermediate state with a bu=
nch of
> >>>> conversions seems fairly unavoidable to me.
> >>>
> >>> Fair enough. I would just have started bottom up and not top down.
> >>>
> >>> Anyway feel free to go ahead with this approach as long as we can rem=
ove
> >>> the new function again when we clean that stuff up for good.
> >>
> >> Yeah I guess bottom up would make more sense as a refactoring. But the
> >> main motivation to land this here is to fix the __mmio vs normal
> >> memory confusion in the fbdev emulation helpers for sparc (and
> >> anything else that needs this). Hence the top down approach for
> >> rolling this out.
> >
> > Ok I started reviewing this a bit more in-depth, and I think this is a =
bit
> > too much of a de-tour.
> >
> > Looking through all the callers of ttm_bo_kmap almost everyone maps the
> > entire object. Only vmwgfx uses to map less than that. Also, everyone j=
ust
> > immediately follows up with converting that full object map into a
> > pointer.
> >
> > So I think what we really want here is:
> > - new function
> >
> > int ttm_bo_vmap(struct ttm_buffer_object *bo, struct dma_buf_map *map);
> >
> >   _vmap name since that's consistent with both dma_buf functions and
> >   what's usually used to implement this. Outside of the ttm world kmap
> >   usually just means single-page mappings using kmap() or it's iomem
> >   sibling io_mapping_map* so rather confusing name for a function which
> >   usually is just used to set up a vmap of the entire buffer.
> >
> > - a helper which can be used for the drm_gem_object_funcs vmap/vunmap
> >   functions for all ttm drivers. We should be able to make this fully
> >   generic because a) we now have dma_buf_map and b) drm_gem_object is
> >   embedded in the ttm_bo, so we can upcast for everyone who's both a tt=
m
> >   and gem driver.
> >
> >   This is maybe a good follow-up, since it should allow us to ditch qui=
te
> >   a bit of the vram helper code for this more generic stuff. I also mig=
ht
> >   have missed some special-cases here, but from a quick look everything
> >   just pins the buffer to the current location and that's it.
> >
> >   Also this obviously requires Christian's generic ttm_bo_pin rework
> >   first.
> >
> > - roll the above out to drivers.
> >
> > Christian/Thomas, thoughts on this?
>
> I agree on the goals, but what is the immediate objective here?
>
> Adding ttm_bo_vmap() does not work out easily, as struct ttm_bo_kmap_obj
> is a central part of the internals of TTM. struct ttm_bo_kmap_obj has
> more internal state that struct dma_buf_map, so they are not easily
> convertible either. What you propose seems to require a reimplementation
> of the existing ttm_bo_kmap() code. That is it's own patch series.
>
> I'd rather go with some variant of the existing patch and add
> ttm_bo_vmap() in a follow-up.

ttm_bo_vmap would simply wrap what you currently open-code as
ttm_bo_kmap + ttm_kmap_obj_to_dma_buf_map. Removing ttm_kmap_obj would
be a much later step. Why do you think adding ttm_bo_vmap is not
possible?
-Daniel


> Best regards
> Thomas
>
> >
> > I think for the immediate need of rolling this out for vram helpers and
> > fbdev code we should be able to do this, but just postpone the driver w=
ide
> > roll-out for now.
> >
> > Cheers, Daniel
> >
> >> -Daniel
> >>
> >>>
> >>> Christian.
> >>>
> >>>> -Daniel
> >>>>
> >>>>> Thanks,
> >>>>> Christian.
> >>>>>
> >>>>>> Best regards
> >>>>>> Thomas
> >>>>>>
> >>>>>>> Regards,
> >>>>>>> Christian.
> >>>>>>>
> >>>>>>>> Best regards
> >>>>>>>> Thomas
> >>>>>>>>
> >>>>>>>>> Regards,
> >>>>>>>>> Christian.
> >>>>>>>>>
> >>>>>>>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >>>>>>>>>> ---
> >>>>>>>>>>     include/drm/ttm/ttm_bo_api.h | 24 ++++++++++++++++++++++++
> >>>>>>>>>>     include/linux/dma-buf-map.h  | 20 ++++++++++++++++++++
> >>>>>>>>>>     2 files changed, 44 insertions(+)
> >>>>>>>>>>
> >>>>>>>>>> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/tt=
m_bo_api.h
> >>>>>>>>>> index c96a25d571c8..62d89f05a801 100644
> >>>>>>>>>> --- a/include/drm/ttm/ttm_bo_api.h
> >>>>>>>>>> +++ b/include/drm/ttm/ttm_bo_api.h
> >>>>>>>>>> @@ -34,6 +34,7 @@
> >>>>>>>>>>     #include <drm/drm_gem.h>
> >>>>>>>>>>     #include <drm/drm_hashtab.h>
> >>>>>>>>>>     #include <drm/drm_vma_manager.h>
> >>>>>>>>>> +#include <linux/dma-buf-map.h>
> >>>>>>>>>>     #include <linux/kref.h>
> >>>>>>>>>>     #include <linux/list.h>
> >>>>>>>>>>     #include <linux/wait.h>
> >>>>>>>>>> @@ -486,6 +487,29 @@ static inline void *ttm_kmap_obj_virtual(=
struct
> >>>>>>>>>> ttm_bo_kmap_obj *map,
> >>>>>>>>>>         return map->virtual;
> >>>>>>>>>>     }
> >>>>>>>>>>     +/**
> >>>>>>>>>> + * ttm_kmap_obj_to_dma_buf_map
> >>>>>>>>>> + *
> >>>>>>>>>> + * @kmap: A struct ttm_bo_kmap_obj returned from ttm_bo_kmap.
> >>>>>>>>>> + * @map: Returns the mapping as struct dma_buf_map
> >>>>>>>>>> + *
> >>>>>>>>>> + * Converts struct ttm_bo_kmap_obj to struct dma_buf_map. If =
the memory
> >>>>>>>>>> + * is not mapped, the returned mapping is initialized to NULL=
.
> >>>>>>>>>> + */
> >>>>>>>>>> +static inline void ttm_kmap_obj_to_dma_buf_map(struct ttm_bo_=
kmap_obj
> >>>>>>>>>> *kmap,
> >>>>>>>>>> +                           struct dma_buf_map *map)
> >>>>>>>>>> +{
> >>>>>>>>>> +    bool is_iomem;
> >>>>>>>>>> +    void *vaddr =3D ttm_kmap_obj_virtual(kmap, &is_iomem);
> >>>>>>>>>> +
> >>>>>>>>>> +    if (!vaddr)
> >>>>>>>>>> +        dma_buf_map_clear(map);
> >>>>>>>>>> +    else if (is_iomem)
> >>>>>>>>>> +        dma_buf_map_set_vaddr_iomem(map, (void __force __iome=
m *)vaddr);
> >>>>>>>>>> +    else
> >>>>>>>>>> +        dma_buf_map_set_vaddr(map, vaddr);
> >>>>>>>>>> +}
> >>>>>>>>>> +
> >>>>>>>>>>     /**
> >>>>>>>>>>      * ttm_bo_kmap
> >>>>>>>>>>      *
> >>>>>>>>>> diff --git a/include/linux/dma-buf-map.h b/include/linux/dma-b=
uf-map.h
> >>>>>>>>>> index fd1aba545fdf..2e8bbecb5091 100644
> >>>>>>>>>> --- a/include/linux/dma-buf-map.h
> >>>>>>>>>> +++ b/include/linux/dma-buf-map.h
> >>>>>>>>>> @@ -45,6 +45,12 @@
> >>>>>>>>>>      *
> >>>>>>>>>>      *    dma_buf_map_set_vaddr(&map. 0xdeadbeaf);
> >>>>>>>>>>      *
> >>>>>>>>>> + * To set an address in I/O memory, use dma_buf_map_set_vaddr=
_iomem().
> >>>>>>>>>> + *
> >>>>>>>>>> + * .. code-block:: c
> >>>>>>>>>> + *
> >>>>>>>>>> + *    dma_buf_map_set_vaddr_iomem(&map. 0xdeadbeaf);
> >>>>>>>>>> + *
> >>>>>>>>>>      * Test if a mapping is valid with either dma_buf_map_is_s=
et() or
> >>>>>>>>>>      * dma_buf_map_is_null().
> >>>>>>>>>>      *
> >>>>>>>>>> @@ -118,6 +124,20 @@ static inline void dma_buf_map_set_vaddr(=
struct
> >>>>>>>>>> dma_buf_map *map, void *vaddr)
> >>>>>>>>>>         map->is_iomem =3D false;
> >>>>>>>>>>     }
> >>>>>>>>>>     +/**
> >>>>>>>>>> + * dma_buf_map_set_vaddr_iomem - Sets a dma-buf mapping struc=
ture to
> >>>>>>>>>> an address in I/O memory
> >>>>>>>>>> + * @map:        The dma-buf mapping structure
> >>>>>>>>>> + * @vaddr_iomem:    An I/O-memory address
> >>>>>>>>>> + *
> >>>>>>>>>> + * Sets the address and the I/O-memory flag.
> >>>>>>>>>> + */
> >>>>>>>>>> +static inline void dma_buf_map_set_vaddr_iomem(struct dma_buf=
_map *map,
> >>>>>>>>>> +                           void __iomem *vaddr_iomem)
> >>>>>>>>>> +{
> >>>>>>>>>> +    map->vaddr_iomem =3D vaddr_iomem;
> >>>>>>>>>> +    map->is_iomem =3D true;
> >>>>>>>>>> +}
> >>>>>>>>>> +
> >>>>>>>>>>     /**
> >>>>>>>>>>      * dma_buf_map_is_equal - Compares two dma-buf mapping str=
uctures
> >>>>>>>>>> for equality
> >>>>>>>>>>      * @lhs:    The dma-buf mapping structure
> >>>>>>>>> _______________________________________________
> >>>>>>>>> dri-devel mailing list
> >>>>>>>>> dri-devel@lists.freedesktop.org
> >>>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=3D02%7=
C01%7Cchristian.koenig%40amd.com%7C472c3d655a61411deb6708d86525d1b8%7C3dd89=
61fe4884e608e11a82d994e183d%7C0%7C0%7C637370560438965013&amp;sdata=3DHdHOA%=
2F1VcIX%2F7YtfYTiAqYEvw7Ag%2FS%2BxS5VwJKOv5y0%3D&amp;reserved=3D0
> >>>>>>>> _______________________________________________
> >>>>>>>> amd-gfx mailing list
> >>>>>>>> amd-gfx@lists.freedesktop.org
> >>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=3D02%7C01=
%7Cchristian.koenig%40amd.com%7C472c3d655a61411deb6708d86525d1b8%7C3dd8961f=
e4884e608e11a82d994e183d%7C0%7C0%7C637370560438965013&amp;sdata=3DH%2B5HKCs=
TrksRV2EyEiFGSTyS79jsWCmJimSMoJYusx8%3D&amp;reserved=3D0
> >>>>>>> _______________________________________________
> >>>>>>> dri-devel mailing list
> >>>>>>> dri-devel@lists.freedesktop.org
> >>>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=3D02%7C0=
1%7Cchristian.koenig%40amd.com%7C472c3d655a61411deb6708d86525d1b8%7C3dd8961=
fe4884e608e11a82d994e183d%7C0%7C0%7C637370560438965013&amp;sdata=3DHdHOA%2F=
1VcIX%2F7YtfYTiAqYEvw7Ag%2FS%2BxS5VwJKOv5y0%3D&amp;reserved=3D0
> >>>>>>>
> >>>>>> _______________________________________________
> >>>>>> amd-gfx mailing list
> >>>>>> amd-gfx@lists.freedesktop.org
> >>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=3D02%7C01%7=
Cchristian.koenig%40amd.com%7C472c3d655a61411deb6708d86525d1b8%7C3dd8961fe4=
884e608e11a82d994e183d%7C0%7C0%7C637370560438965013&amp;sdata=3DH%2B5HKCsTr=
ksRV2EyEiFGSTyS79jsWCmJimSMoJYusx8%3D&amp;reserved=3D0
> >>>
> >>
> >>
> >> --
> >> Daniel Vetter
> >> Software Engineer, Intel Corporation
> >> http://blog.ffwll.ch
> >
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
