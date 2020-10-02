Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69534281133
	for <lists+linux-media@lfdr.de>; Fri,  2 Oct 2020 13:30:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726223AbgJBLa1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Oct 2020 07:30:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725953AbgJBLa1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Oct 2020 07:30:27 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CE05C0613D0;
        Fri,  2 Oct 2020 04:30:27 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id u8so1494642ejg.1;
        Fri, 02 Oct 2020 04:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=3Yv1p91kdY6MztMHEbXAX2LIhnqCDycHHWK1s9rlIpk=;
        b=cebDEAs7j0BDWj7XygZm8zBV9UtA+AAQH7jIMa3COVQavNGQ+xmaBn9oMoiStb2f2h
         KWrSq2RIjXarUg9cmmsx6e/IvJprHToa4zB4n03/MjsEDUWHyGrhyxSqnN4QN74MCEWv
         F+qLVD6ryJnlLP8vbzJLsvM8pEx84IxEmpnoZ+bibT8IC2fY5x+WMqpAPumoMtkcL/45
         G/iif/RHXgdKh9DArmcH/vzWsL81H6c2t9CDpNdYmjQRRguBB4YtWane1V8BhhhBxe0I
         Nh4niqMUMOyIDFLfEGby2I/PFheLBfKCxpKk74E4KKaHjYLHDqqOJLGfJFBDuUwVEuK6
         mzHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:subject:to:cc:references:from
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=3Yv1p91kdY6MztMHEbXAX2LIhnqCDycHHWK1s9rlIpk=;
        b=PPiH3M6SlyBgiv/TG43di94Yl2yXokh0tR+ZHizKRv+adTu3uCejQuanao6Whj2t4S
         cMNSuuXvYfxVwn+FiMNIfn6l3vQX0sDSsuZC3fd4xxfHssEezI1pyLkOb++3ucnmxcpM
         QVUhe5WjRhI4KBCZV850/GxS3ZwWr3GFXUC26p/tADjCKz2tQZ/wWi6FuzrnFCvW1dMH
         h0NMOWrTo57SDixOjZ2uF/Jfg5oDeHXNFt0VVqooqN0gqMFJ2w34FEpozm9vXkqvmjH0
         nRTYni6FLBIaHgKmE0I46j1YjxD+aNN6xsHWXzbIISuPln7KG2u7h/Gc3jDJs2Esc7rP
         mSwg==
X-Gm-Message-State: AOAM532wIVe4u+9vWNy84f+GSkGoH1TVkemeDbhZhqDGt7LdSwH5o4m9
        ui0nUvyUZ69yqB6MsxuuZlM=
X-Google-Smtp-Source: ABdhPJxApAPeHRcp+JFrWFCuy4bAcO8RMtt2ySgmt8bQlcWwipN6gyDihDz/j48Bs0NqfRAKqlXWUA==
X-Received: by 2002:a17:906:c7d5:: with SMTP id dc21mr1070990ejb.308.1601638225441;
        Fri, 02 Oct 2020 04:30:25 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7? ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
        by smtp.gmail.com with ESMTPSA id jp3sm968602ejb.125.2020.10.02.04.30.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2020 04:30:24 -0700 (PDT)
Reply-To: christian.koenig@amd.com
Subject: Re: [PATCH v3 2/7] drm/ttm: Add ttm_kmap_obj_to_dma_buf_map() for
 type conversion
To:     Daniel Vetter <daniel@ffwll.ch>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Cc:     Luben Tuikov <luben.tuikov@amd.com>,
        =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
        Dave Airlie <airlied@linux.ie>,
        Nouveau Dev <nouveau@lists.freedesktop.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "Wilson, Chris" <chris@chris-wilson.co.uk>,
        Melissa Wen <melissa.srw@gmail.com>,
        "Anholt, Eric" <eric@anholt.net>, Huang Rui <ray.huang@amd.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Emil Velikov <emil.velikov@collabora.com>,
        Rob Herring <robh@kernel.org>,
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
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        The etnaviv authors <etnaviv@lists.freedesktop.org>,
        Maxime Ripard <mripard@kernel.org>,
        Inki Dae <inki.dae@samsung.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
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
        Thomas Zimmermann <tzimmermann@suse.de>,
        Alex Deucher <alexander.deucher@amd.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>, Lucas Stach <l.stach@pengutronix.de>
References: <20200929151437.19717-1-tzimmermann@suse.de>
 <20200929151437.19717-3-tzimmermann@suse.de>
 <8fad0114-064a-4ed5-c21d-d1b4294de0a1@amd.com>
 <2614314a-81f7-4722-c400-68d90e48e09a@suse.de>
 <8a84f62b-33f3-f44c-52af-c859a0e0d1fb@gmail.com>
 <07972ada-9135-3743-a86b-487f610c509f@suse.de>
 <b569b7e3-68f0-edcc-c8f4-170e9042d348@gmail.com>
 <20200930094712.GW438822@phenom.ffwll.local>
 <8479d0aa-3826-4f37-0109-55daca515793@amd.com>
 <CAKMK7uH0U36NG8w98i0x6HVGeogiwnYDRiKquLW-8znLa7-0yg@mail.gmail.com>
 <20201002095830.GH438822@phenom.ffwll.local>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <f6dcba12-8be8-b867-ac9b-a1ba50567fca@gmail.com>
Date:   Fri, 2 Oct 2020 13:30:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201002095830.GH438822@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 02.10.20 um 11:58 schrieb Daniel Vetter:
> On Wed, Sep 30, 2020 at 02:51:46PM +0200, Daniel Vetter wrote:
>> On Wed, Sep 30, 2020 at 2:34 PM Christian König
>> <christian.koenig@amd.com> wrote:
>>> Am 30.09.20 um 11:47 schrieb Daniel Vetter:
>>>> On Wed, Sep 30, 2020 at 10:34:31AM +0200, Christian König wrote:
>>>>> Am 30.09.20 um 10:19 schrieb Thomas Zimmermann:
>>>>>> Hi
>>>>>>
>>>>>> Am 30.09.20 um 10:05 schrieb Christian König:
>>>>>>> Am 29.09.20 um 19:49 schrieb Thomas Zimmermann:
>>>>>>>> Hi Christian
>>>>>>>>
>>>>>>>> Am 29.09.20 um 17:35 schrieb Christian König:
>>>>>>>>> Am 29.09.20 um 17:14 schrieb Thomas Zimmermann:
>>>>>>>>>> The new helper ttm_kmap_obj_to_dma_buf() extracts address and location
>>>>>>>>>> from and instance of TTM's kmap_obj and initializes struct dma_buf_map
>>>>>>>>>> with these values. Helpful for TTM-based drivers.
>>>>>>>>> We could completely drop that if we use the same structure inside TTM as
>>>>>>>>> well.
>>>>>>>>>
>>>>>>>>> Additional to that which driver is going to use this?
>>>>>>>> As Daniel mentioned, it's in patch 3. The TTM-based drivers will
>>>>>>>> retrieve the pointer via this function.
>>>>>>>>
>>>>>>>> I do want to see all that being more tightly integrated into TTM, but
>>>>>>>> not in this series. This one is about fixing the bochs-on-sparc64
>>>>>>>> problem for good. Patch 7 adds an update to TTM to the DRM TODO list.
>>>>>>> I should have asked which driver you try to fix here :)
>>>>>>>
>>>>>>> In this case just keep the function inside bochs and only fix it there.
>>>>>>>
>>>>>>> All other drivers can be fixed when we generally pump this through TTM.
>>>>>> Did you take a look at patch 3? This function will be used by VRAM
>>>>>> helpers, nouveau, radeon, amdgpu and qxl. If we don't put it here, we
>>>>>> have to duplicate the functionality in each if these drivers. Bochs
>>>>>> itself uses VRAM helpers and doesn't touch the function directly.
>>>>> Ah, ok can we have that then only in the VRAM helpers?
>>>>>
>>>>> Alternative you could go ahead and use dma_buf_map in ttm_bo_kmap_obj
>>>>> directly and drop the hack with the TTM_BO_MAP_IOMEM_MASK.
>>>>>
>>>>> What I want to avoid is to have another conversion function in TTM because
>>>>> what happens here is that we already convert from ttm_bus_placement to
>>>>> ttm_bo_kmap_obj and then to dma_buf_map.
>>>> Hm I'm not really seeing how that helps with a gradual conversion of
>>>> everything over to dma_buf_map and assorted helpers for access? There's
>>>> too many places in ttm drivers where is_iomem and related stuff is used to
>>>> be able to convert it all in one go. An intermediate state with a bunch of
>>>> conversions seems fairly unavoidable to me.
>>> Fair enough. I would just have started bottom up and not top down.
>>>
>>> Anyway feel free to go ahead with this approach as long as we can remove
>>> the new function again when we clean that stuff up for good.
>> Yeah I guess bottom up would make more sense as a refactoring. But the
>> main motivation to land this here is to fix the __mmio vs normal
>> memory confusion in the fbdev emulation helpers for sparc (and
>> anything else that needs this). Hence the top down approach for
>> rolling this out.
> Ok I started reviewing this a bit more in-depth, and I think this is a bit
> too much of a de-tour.
>
> Looking through all the callers of ttm_bo_kmap almost everyone maps the
> entire object. Only vmwgfx uses to map less than that. Also, everyone just
> immediately follows up with converting that full object map into a
> pointer.
>
> So I think what we really want here is:
> - new function
>
> int ttm_bo_vmap(struct ttm_buffer_object *bo, struct dma_buf_map *map);
>
>    _vmap name since that's consistent with both dma_buf functions and
>    what's usually used to implement this. Outside of the ttm world kmap
>    usually just means single-page mappings using kmap() or it's iomem
>    sibling io_mapping_map* so rather confusing name for a function which
>    usually is just used to set up a vmap of the entire buffer.
>
> - a helper which can be used for the drm_gem_object_funcs vmap/vunmap
>    functions for all ttm drivers. We should be able to make this fully
>    generic because a) we now have dma_buf_map and b) drm_gem_object is
>    embedded in the ttm_bo, so we can upcast for everyone who's both a ttm
>    and gem driver.
>
>    This is maybe a good follow-up, since it should allow us to ditch quite
>    a bit of the vram helper code for this more generic stuff. I also might
>    have missed some special-cases here, but from a quick look everything
>    just pins the buffer to the current location and that's it.
>
>    Also this obviously requires Christian's generic ttm_bo_pin rework
>    first.
>
> - roll the above out to drivers.
>
> Christian/Thomas, thoughts on this?

Calling this vmap instead of kmap certainly makes sense.

Not 100% sure about the generic helpers, but it sounds like this should 
indeed look rather clean in the end.

Christian.

>
> I think for the immediate need of rolling this out for vram helpers and
> fbdev code we should be able to do this, but just postpone the driver wide
> roll-out for now.
>
> Cheers, Daniel
>
>> -Daniel
>>
>>> Christian.
>>>
>>>> -Daniel
>>>>
>>>>> Thanks,
>>>>> Christian.
>>>>>
>>>>>> Best regards
>>>>>> Thomas
>>>>>>
>>>>>>> Regards,
>>>>>>> Christian.
>>>>>>>
>>>>>>>> Best regards
>>>>>>>> Thomas
>>>>>>>>
>>>>>>>>> Regards,
>>>>>>>>> Christian.
>>>>>>>>>
>>>>>>>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>>>>>>>> ---
>>>>>>>>>>      include/drm/ttm/ttm_bo_api.h | 24 ++++++++++++++++++++++++
>>>>>>>>>>      include/linux/dma-buf-map.h  | 20 ++++++++++++++++++++
>>>>>>>>>>      2 files changed, 44 insertions(+)
>>>>>>>>>>
>>>>>>>>>> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
>>>>>>>>>> index c96a25d571c8..62d89f05a801 100644
>>>>>>>>>> --- a/include/drm/ttm/ttm_bo_api.h
>>>>>>>>>> +++ b/include/drm/ttm/ttm_bo_api.h
>>>>>>>>>> @@ -34,6 +34,7 @@
>>>>>>>>>>      #include <drm/drm_gem.h>
>>>>>>>>>>      #include <drm/drm_hashtab.h>
>>>>>>>>>>      #include <drm/drm_vma_manager.h>
>>>>>>>>>> +#include <linux/dma-buf-map.h>
>>>>>>>>>>      #include <linux/kref.h>
>>>>>>>>>>      #include <linux/list.h>
>>>>>>>>>>      #include <linux/wait.h>
>>>>>>>>>> @@ -486,6 +487,29 @@ static inline void *ttm_kmap_obj_virtual(struct
>>>>>>>>>> ttm_bo_kmap_obj *map,
>>>>>>>>>>          return map->virtual;
>>>>>>>>>>      }
>>>>>>>>>>      +/**
>>>>>>>>>> + * ttm_kmap_obj_to_dma_buf_map
>>>>>>>>>> + *
>>>>>>>>>> + * @kmap: A struct ttm_bo_kmap_obj returned from ttm_bo_kmap.
>>>>>>>>>> + * @map: Returns the mapping as struct dma_buf_map
>>>>>>>>>> + *
>>>>>>>>>> + * Converts struct ttm_bo_kmap_obj to struct dma_buf_map. If the memory
>>>>>>>>>> + * is not mapped, the returned mapping is initialized to NULL.
>>>>>>>>>> + */
>>>>>>>>>> +static inline void ttm_kmap_obj_to_dma_buf_map(struct ttm_bo_kmap_obj
>>>>>>>>>> *kmap,
>>>>>>>>>> +                           struct dma_buf_map *map)
>>>>>>>>>> +{
>>>>>>>>>> +    bool is_iomem;
>>>>>>>>>> +    void *vaddr = ttm_kmap_obj_virtual(kmap, &is_iomem);
>>>>>>>>>> +
>>>>>>>>>> +    if (!vaddr)
>>>>>>>>>> +        dma_buf_map_clear(map);
>>>>>>>>>> +    else if (is_iomem)
>>>>>>>>>> +        dma_buf_map_set_vaddr_iomem(map, (void __force __iomem *)vaddr);
>>>>>>>>>> +    else
>>>>>>>>>> +        dma_buf_map_set_vaddr(map, vaddr);
>>>>>>>>>> +}
>>>>>>>>>> +
>>>>>>>>>>      /**
>>>>>>>>>>       * ttm_bo_kmap
>>>>>>>>>>       *
>>>>>>>>>> diff --git a/include/linux/dma-buf-map.h b/include/linux/dma-buf-map.h
>>>>>>>>>> index fd1aba545fdf..2e8bbecb5091 100644
>>>>>>>>>> --- a/include/linux/dma-buf-map.h
>>>>>>>>>> +++ b/include/linux/dma-buf-map.h
>>>>>>>>>> @@ -45,6 +45,12 @@
>>>>>>>>>>       *
>>>>>>>>>>       *    dma_buf_map_set_vaddr(&map. 0xdeadbeaf);
>>>>>>>>>>       *
>>>>>>>>>> + * To set an address in I/O memory, use dma_buf_map_set_vaddr_iomem().
>>>>>>>>>> + *
>>>>>>>>>> + * .. code-block:: c
>>>>>>>>>> + *
>>>>>>>>>> + *    dma_buf_map_set_vaddr_iomem(&map. 0xdeadbeaf);
>>>>>>>>>> + *
>>>>>>>>>>       * Test if a mapping is valid with either dma_buf_map_is_set() or
>>>>>>>>>>       * dma_buf_map_is_null().
>>>>>>>>>>       *
>>>>>>>>>> @@ -118,6 +124,20 @@ static inline void dma_buf_map_set_vaddr(struct
>>>>>>>>>> dma_buf_map *map, void *vaddr)
>>>>>>>>>>          map->is_iomem = false;
>>>>>>>>>>      }
>>>>>>>>>>      +/**
>>>>>>>>>> + * dma_buf_map_set_vaddr_iomem - Sets a dma-buf mapping structure to
>>>>>>>>>> an address in I/O memory
>>>>>>>>>> + * @map:        The dma-buf mapping structure
>>>>>>>>>> + * @vaddr_iomem:    An I/O-memory address
>>>>>>>>>> + *
>>>>>>>>>> + * Sets the address and the I/O-memory flag.
>>>>>>>>>> + */
>>>>>>>>>> +static inline void dma_buf_map_set_vaddr_iomem(struct dma_buf_map *map,
>>>>>>>>>> +                           void __iomem *vaddr_iomem)
>>>>>>>>>> +{
>>>>>>>>>> +    map->vaddr_iomem = vaddr_iomem;
>>>>>>>>>> +    map->is_iomem = true;
>>>>>>>>>> +}
>>>>>>>>>> +
>>>>>>>>>>      /**
>>>>>>>>>>       * dma_buf_map_is_equal - Compares two dma-buf mapping structures
>>>>>>>>>> for equality
>>>>>>>>>>       * @lhs:    The dma-buf mapping structure
>>>>>>>>> _______________________________________________
>>>>>>>>> dri-devel mailing list
>>>>>>>>> dri-devel@lists.freedesktop.org
>>>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=02%7C01%7Cchristian.koenig%40amd.com%7C472c3d655a61411deb6708d86525d1b8%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637370560438965013&amp;sdata=HdHOA%2F1VcIX%2F7YtfYTiAqYEvw7Ag%2FS%2BxS5VwJKOv5y0%3D&amp;reserved=0
>>>>>>>> _______________________________________________
>>>>>>>> amd-gfx mailing list
>>>>>>>> amd-gfx@lists.freedesktop.org
>>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=02%7C01%7Cchristian.koenig%40amd.com%7C472c3d655a61411deb6708d86525d1b8%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637370560438965013&amp;sdata=H%2B5HKCsTrksRV2EyEiFGSTyS79jsWCmJimSMoJYusx8%3D&amp;reserved=0
>>>>>>> _______________________________________________
>>>>>>> dri-devel mailing list
>>>>>>> dri-devel@lists.freedesktop.org
>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=02%7C01%7Cchristian.koenig%40amd.com%7C472c3d655a61411deb6708d86525d1b8%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637370560438965013&amp;sdata=HdHOA%2F1VcIX%2F7YtfYTiAqYEvw7Ag%2FS%2BxS5VwJKOv5y0%3D&amp;reserved=0
>>>>>>>
>>>>>> _______________________________________________
>>>>>> amd-gfx mailing list
>>>>>> amd-gfx@lists.freedesktop.org
>>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=02%7C01%7Cchristian.koenig%40amd.com%7C472c3d655a61411deb6708d86525d1b8%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637370560438965013&amp;sdata=H%2B5HKCsTrksRV2EyEiFGSTyS79jsWCmJimSMoJYusx8%3D&amp;reserved=0
>>
>> -- 
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>> http://blog.ffwll.ch

