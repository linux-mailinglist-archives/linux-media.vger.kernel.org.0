Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30C49286006
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 15:25:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728360AbgJGNZB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 09:25:01 -0400
Received: from mail-eopbgr700048.outbound.protection.outlook.com ([40.107.70.48]:43296
        "EHLO NAM04-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728271AbgJGNZB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 7 Oct 2020 09:25:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T2WoN8X5+RD1vbM77hPkD0vMdasG6qeayZFEZPlUfPxOHHD7lFSM7Mg0OvDQjTtLQ1oTe8eoxCg8QlJmjhnn5iA4fSE9VQ7l3PEoT1Q8gJ73u6G1d5MdyHX1NdHuAtepebLx6kcYz/kUz8DCcTRZlXuFaVz7acr+Jt8woRwdKSCwj7eoMnKChCoCwn+qbMBrqzo/pzw0Dl4wPhi2vD39eS7gJ3I25JEQVxK0JR08pj5gynFxWwdFveUPSOrPbe7pWCzB3/RFBPBDyUF/go4OA8ZTDr2/6tWKXmmBwtLj9TcyZ+Km4lhkIYhAGGONOFwOKVkJt3B7OL1pSJHllRunpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wWI3zJwa2ezYvNP8JGJlZCNI2a3YOk5cUf0/UOiaX54=;
 b=Oew9gstSZQFMRh91zzeBC171yKaDBdvb9vnkbD10W7WYF5XIsiRXrOrp6Qdc5i0Kndks/iZYi9b6vHIWq8hBXroM2bhD96+wAtxs913fzXGHWHqd//noenXt5LJMzi4/pl3l8wGUL8Q3bepUedMbfM0U7WFmvmo5qiJ1UYU8Cy2EfHDvvGpImNB/DMUHA8WCRUZW4dmMZ3Yj4ttID61QXpSoRgFSRv7vYrGF4dxyS7RHSsESLcS3kifTwsINWp0BjydVPaPONxfDYMlf6Z5xL3vVgDvGlyJYqFk0D4CrWgbaur+vOO43snJVoIP9fJ2VXDbuJOfKrwep7TqbaJMq5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wWI3zJwa2ezYvNP8JGJlZCNI2a3YOk5cUf0/UOiaX54=;
 b=qJshi9DWsqyFEwVtrtd1DFVBURAq2676pJBh8hwucv3AKKa+L+zIbHZKT1Ek+F57ZjrPnKFb2APy4QgqoHy26NGUjajfZSrRpzoA3pdRUBmneXtbVUm0hNtjMda2o6qgB7sbvi+uqxpRFkmoGbZe3R3fzF+2HVr2YDbCPtYuFXc=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4110.namprd12.prod.outlook.com (2603:10b6:208:1dd::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21; Wed, 7 Oct
 2020 13:24:53 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3455.022; Wed, 7 Oct 2020
 13:24:53 +0000
Subject: Re: [PATCH v3 2/7] drm/ttm: Add ttm_kmap_obj_to_dma_buf_map() for
 type conversion
To:     Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Luben Tuikov <luben.tuikov@amd.com>,
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
 <5bf40546-8da9-1649-22da-a982f1e8d9c3@suse.de>
 <CAKMK7uEu0vwiG9Uz0_Ysyus0ZAF-1HNxvPZjcG3xZS=gkKgJLw@mail.gmail.com>
 <26ac0446-9e16-1ca1-7407-3d0cd7125e0e@suse.de>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <09d634d0-f20a-e9a9-d8d2-b50e8aaf156f@amd.com>
Date:   Wed, 7 Oct 2020 15:24:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <26ac0446-9e16-1ca1-7407-3d0cd7125e0e@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM3PR07CA0108.eurprd07.prod.outlook.com
 (2603:10a6:207:7::18) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by AM3PR07CA0108.eurprd07.prod.outlook.com (2603:10a6:207:7::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.11 via Frontend Transport; Wed, 7 Oct 2020 13:24:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f7c1e972-30c6-46d3-ad81-08d86ac45ff5
X-MS-TrafficTypeDiagnostic: MN2PR12MB4110:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB41108A13416BDF765190124E830A0@MN2PR12MB4110.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PNXbOPcM1rz71/hjPT5YJfdFGjniOIqMDn1zzWpNlVpCEgin/iQ4YoDO9Sw1uAeB8UPOJZePYABJrLH/NRYZnOHZn0NwmdjgEmzooStQgdk9XwUg2sp0rPP3Sa1mUNpSx+CS6YVqsaIdFDbFDseDd27toKEI1nVBimPygXzg87BOnuSaP9bzHgLb3WZmknsX3YLQjgJr/fhfFvZQSIXdCsaXjhdO+6yaNflRcFXNM88a9w514NTu8upiq0BW7ZPB942IciRWsH0g45AG5M0eFqf0hRJ8Z58mSwMVrXrX005d96Q5+Tcx3ahW1iNJhkAFHDYI8+cz71Lb8PbK5LIJwxO7d8VWQhFQkGtNpl6bCW0EdIuF2lA6xeMTBPhGFiAdEQ4TR8M3LJcxXkUN5oKJ5kq/FySYKTxAz8u7PtzcvnuFcl92PhhjwoiFaB8vx/ZE8bOeld9uo3lQ27OdbOyTlw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(39850400004)(376002)(396003)(31696002)(66556008)(6486002)(66574015)(66476007)(66946007)(83380400001)(110136005)(54906003)(36756003)(31686004)(316002)(53546011)(966005)(7406005)(7416002)(4326008)(83080400001)(86362001)(52116002)(8936002)(2906002)(8676002)(478600001)(30864003)(45080400002)(5660300002)(6666004)(2616005)(16526019)(186003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: FY0lIHvIykfmcEYSA048hzn7cbrKJVZ+798v2+X2FHrAch//tOBywkS6Nh88SrXrzxAfAd7SLnozk1rNNMn5F0vxxDJLUiMzZ16si3TrOFpYHvEBFvALgkLmNoL8U/jRttHaOCnzt2qa8QUVeFLcjewMaktRs0eXHQlyrHawrl5nl5pDRjHvQhKLJm2zAl5Ue0RnhCSH7aSqLy7myAKkNtmsrMh4ad7qqYb7Cz1/hSugABrvKobzMgG6m2TRUZLyabBn/e7rxwvX10TnY10NYPd90VF2DZ/D0m5lQOYq7ikD1xIt0L2Pf17g3JGep8SSRdROu79VwZLNTV11DdLOeu/a6ffP5pRQbbbfMgOkFZWre3f8xhnD2MEBVp8vngGGDOl8eVM5f2KtYtFeiZog+1vnOFV6E4YOy9PbmK9u28kfnZ1DAvb7EhBCEmdKvbH7ZZIFFQxBbZeJ74bYxu8AP+EvqcwocxhB0R6N+SLQ4keH68YOV1QrbLp9OuVExYOnCvQdqz788advBKYLBI/bcorXPIgm3x4lA3tS0i4R3A0fhAcPRPT559bI+SfFjyHK3zEOv64AM8zAlEG49b+zaMetDzvHqPmzXRZS4JRhcLSQG5hKapKGA4HV60G6zYWfYzvykowlOtWtS6VnVbXesYj20l4TodyqKqfITCCNsnwPFPOjq6iwylxeBFRWxUR7LhYGMYMHjyg5Fsd8eFy57g==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7c1e972-30c6-46d3-ad81-08d86ac45ff5
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2020 13:24:53.3383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NGdflGHJrwI1vLmoyVOY2z80IsatzH8y4pl1qpRi/s4Xsa6YOaoPZHfEM78mqTN/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4110
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 07.10.20 um 15:20 schrieb Thomas Zimmermann:
> Hi
>
> Am 07.10.20 um 15:10 schrieb Daniel Vetter:
>> On Wed, Oct 7, 2020 at 2:57 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>>> Hi
>>>
>>> Am 02.10.20 um 11:58 schrieb Daniel Vetter:
>>>> On Wed, Sep 30, 2020 at 02:51:46PM +0200, Daniel Vetter wrote:
>>>>> On Wed, Sep 30, 2020 at 2:34 PM Christian König
>>>>> <christian.koenig@amd.com> wrote:
>>>>>> Am 30.09.20 um 11:47 schrieb Daniel Vetter:
>>>>>>> On Wed, Sep 30, 2020 at 10:34:31AM +0200, Christian König wrote:
>>>>>>>> Am 30.09.20 um 10:19 schrieb Thomas Zimmermann:
>>>>>>>>> Hi
>>>>>>>>>
>>>>>>>>> Am 30.09.20 um 10:05 schrieb Christian König:
>>>>>>>>>> Am 29.09.20 um 19:49 schrieb Thomas Zimmermann:
>>>>>>>>>>> Hi Christian
>>>>>>>>>>>
>>>>>>>>>>> Am 29.09.20 um 17:35 schrieb Christian König:
>>>>>>>>>>>> Am 29.09.20 um 17:14 schrieb Thomas Zimmermann:
>>>>>>>>>>>>> The new helper ttm_kmap_obj_to_dma_buf() extracts address and location
>>>>>>>>>>>>> from and instance of TTM's kmap_obj and initializes struct dma_buf_map
>>>>>>>>>>>>> with these values. Helpful for TTM-based drivers.
>>>>>>>>>>>> We could completely drop that if we use the same structure inside TTM as
>>>>>>>>>>>> well.
>>>>>>>>>>>>
>>>>>>>>>>>> Additional to that which driver is going to use this?
>>>>>>>>>>> As Daniel mentioned, it's in patch 3. The TTM-based drivers will
>>>>>>>>>>> retrieve the pointer via this function.
>>>>>>>>>>>
>>>>>>>>>>> I do want to see all that being more tightly integrated into TTM, but
>>>>>>>>>>> not in this series. This one is about fixing the bochs-on-sparc64
>>>>>>>>>>> problem for good. Patch 7 adds an update to TTM to the DRM TODO list.
>>>>>>>>>> I should have asked which driver you try to fix here :)
>>>>>>>>>>
>>>>>>>>>> In this case just keep the function inside bochs and only fix it there.
>>>>>>>>>>
>>>>>>>>>> All other drivers can be fixed when we generally pump this through TTM.
>>>>>>>>> Did you take a look at patch 3? This function will be used by VRAM
>>>>>>>>> helpers, nouveau, radeon, amdgpu and qxl. If we don't put it here, we
>>>>>>>>> have to duplicate the functionality in each if these drivers. Bochs
>>>>>>>>> itself uses VRAM helpers and doesn't touch the function directly.
>>>>>>>> Ah, ok can we have that then only in the VRAM helpers?
>>>>>>>>
>>>>>>>> Alternative you could go ahead and use dma_buf_map in ttm_bo_kmap_obj
>>>>>>>> directly and drop the hack with the TTM_BO_MAP_IOMEM_MASK.
>>>>>>>>
>>>>>>>> What I want to avoid is to have another conversion function in TTM because
>>>>>>>> what happens here is that we already convert from ttm_bus_placement to
>>>>>>>> ttm_bo_kmap_obj and then to dma_buf_map.
>>>>>>> Hm I'm not really seeing how that helps with a gradual conversion of
>>>>>>> everything over to dma_buf_map and assorted helpers for access? There's
>>>>>>> too many places in ttm drivers where is_iomem and related stuff is used to
>>>>>>> be able to convert it all in one go. An intermediate state with a bunch of
>>>>>>> conversions seems fairly unavoidable to me.
>>>>>> Fair enough. I would just have started bottom up and not top down.
>>>>>>
>>>>>> Anyway feel free to go ahead with this approach as long as we can remove
>>>>>> the new function again when we clean that stuff up for good.
>>>>> Yeah I guess bottom up would make more sense as a refactoring. But the
>>>>> main motivation to land this here is to fix the __mmio vs normal
>>>>> memory confusion in the fbdev emulation helpers for sparc (and
>>>>> anything else that needs this). Hence the top down approach for
>>>>> rolling this out.
>>>> Ok I started reviewing this a bit more in-depth, and I think this is a bit
>>>> too much of a de-tour.
>>>>
>>>> Looking through all the callers of ttm_bo_kmap almost everyone maps the
>>>> entire object. Only vmwgfx uses to map less than that. Also, everyone just
>>>> immediately follows up with converting that full object map into a
>>>> pointer.
>>>>
>>>> So I think what we really want here is:
>>>> - new function
>>>>
>>>> int ttm_bo_vmap(struct ttm_buffer_object *bo, struct dma_buf_map *map);
>>>>
>>>>    _vmap name since that's consistent with both dma_buf functions and
>>>>    what's usually used to implement this. Outside of the ttm world kmap
>>>>    usually just means single-page mappings using kmap() or it's iomem
>>>>    sibling io_mapping_map* so rather confusing name for a function which
>>>>    usually is just used to set up a vmap of the entire buffer.
>>>>
>>>> - a helper which can be used for the drm_gem_object_funcs vmap/vunmap
>>>>    functions for all ttm drivers. We should be able to make this fully
>>>>    generic because a) we now have dma_buf_map and b) drm_gem_object is
>>>>    embedded in the ttm_bo, so we can upcast for everyone who's both a ttm
>>>>    and gem driver.
>>>>
>>>>    This is maybe a good follow-up, since it should allow us to ditch quite
>>>>    a bit of the vram helper code for this more generic stuff. I also might
>>>>    have missed some special-cases here, but from a quick look everything
>>>>    just pins the buffer to the current location and that's it.
>>>>
>>>>    Also this obviously requires Christian's generic ttm_bo_pin rework
>>>>    first.
>>>>
>>>> - roll the above out to drivers.
>>>>
>>>> Christian/Thomas, thoughts on this?
>>> I agree on the goals, but what is the immediate objective here?
>>>
>>> Adding ttm_bo_vmap() does not work out easily, as struct ttm_bo_kmap_obj
>>> is a central part of the internals of TTM. struct ttm_bo_kmap_obj has
>>> more internal state that struct dma_buf_map, so they are not easily
>>> convertible either. What you propose seems to require a reimplementation
>>> of the existing ttm_bo_kmap() code. That is it's own patch series.
>>>
>>> I'd rather go with some variant of the existing patch and add
>>> ttm_bo_vmap() in a follow-up.
>> ttm_bo_vmap would simply wrap what you currently open-code as
>> ttm_bo_kmap + ttm_kmap_obj_to_dma_buf_map. Removing ttm_kmap_obj would
>> be a much later step. Why do you think adding ttm_bo_vmap is not
>> possible?
> The calls to ttm_bo_kmap/_kunmap() require an instance of struct
> ttm_bo_kmap_obj that is stored in each driver's private bo structure
> (e.g., struct drm_gem_vram_object, struct radeon_bo, etc). When I made
> patch 3, I flirted with the idea of unifying the driver's _vmap code in
> a shared helper, but I couldn't find a simple way of doing it. That's
> why it's open-coded in the first place.

Well that makes kind of sense. Keep in mind that ttm_bo_kmap is 
currently way to complicated.

Christian.

>
> Best regards
> Thomas
>
>> -Daniel
>>
>>
>>> Best regards
>>> Thomas
>>>
>>>> I think for the immediate need of rolling this out for vram helpers and
>>>> fbdev code we should be able to do this, but just postpone the driver wide
>>>> roll-out for now.
>>>>
>>>> Cheers, Daniel
>>>>
>>>>> -Daniel
>>>>>
>>>>>> Christian.
>>>>>>
>>>>>>> -Daniel
>>>>>>>
>>>>>>>> Thanks,
>>>>>>>> Christian.
>>>>>>>>
>>>>>>>>> Best regards
>>>>>>>>> Thomas
>>>>>>>>>
>>>>>>>>>> Regards,
>>>>>>>>>> Christian.
>>>>>>>>>>
>>>>>>>>>>> Best regards
>>>>>>>>>>> Thomas
>>>>>>>>>>>
>>>>>>>>>>>> Regards,
>>>>>>>>>>>> Christian.
>>>>>>>>>>>>
>>>>>>>>>>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>>>>>>>>>>> ---
>>>>>>>>>>>>>      include/drm/ttm/ttm_bo_api.h | 24 ++++++++++++++++++++++++
>>>>>>>>>>>>>      include/linux/dma-buf-map.h  | 20 ++++++++++++++++++++
>>>>>>>>>>>>>      2 files changed, 44 insertions(+)
>>>>>>>>>>>>>
>>>>>>>>>>>>> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
>>>>>>>>>>>>> index c96a25d571c8..62d89f05a801 100644
>>>>>>>>>>>>> --- a/include/drm/ttm/ttm_bo_api.h
>>>>>>>>>>>>> +++ b/include/drm/ttm/ttm_bo_api.h
>>>>>>>>>>>>> @@ -34,6 +34,7 @@
>>>>>>>>>>>>>      #include <drm/drm_gem.h>
>>>>>>>>>>>>>      #include <drm/drm_hashtab.h>
>>>>>>>>>>>>>      #include <drm/drm_vma_manager.h>
>>>>>>>>>>>>> +#include <linux/dma-buf-map.h>
>>>>>>>>>>>>>      #include <linux/kref.h>
>>>>>>>>>>>>>      #include <linux/list.h>
>>>>>>>>>>>>>      #include <linux/wait.h>
>>>>>>>>>>>>> @@ -486,6 +487,29 @@ static inline void *ttm_kmap_obj_virtual(struct
>>>>>>>>>>>>> ttm_bo_kmap_obj *map,
>>>>>>>>>>>>>          return map->virtual;
>>>>>>>>>>>>>      }
>>>>>>>>>>>>>      +/**
>>>>>>>>>>>>> + * ttm_kmap_obj_to_dma_buf_map
>>>>>>>>>>>>> + *
>>>>>>>>>>>>> + * @kmap: A struct ttm_bo_kmap_obj returned from ttm_bo_kmap.
>>>>>>>>>>>>> + * @map: Returns the mapping as struct dma_buf_map
>>>>>>>>>>>>> + *
>>>>>>>>>>>>> + * Converts struct ttm_bo_kmap_obj to struct dma_buf_map. If the memory
>>>>>>>>>>>>> + * is not mapped, the returned mapping is initialized to NULL.
>>>>>>>>>>>>> + */
>>>>>>>>>>>>> +static inline void ttm_kmap_obj_to_dma_buf_map(struct ttm_bo_kmap_obj
>>>>>>>>>>>>> *kmap,
>>>>>>>>>>>>> +                           struct dma_buf_map *map)
>>>>>>>>>>>>> +{
>>>>>>>>>>>>> +    bool is_iomem;
>>>>>>>>>>>>> +    void *vaddr = ttm_kmap_obj_virtual(kmap, &is_iomem);
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +    if (!vaddr)
>>>>>>>>>>>>> +        dma_buf_map_clear(map);
>>>>>>>>>>>>> +    else if (is_iomem)
>>>>>>>>>>>>> +        dma_buf_map_set_vaddr_iomem(map, (void __force __iomem *)vaddr);
>>>>>>>>>>>>> +    else
>>>>>>>>>>>>> +        dma_buf_map_set_vaddr(map, vaddr);
>>>>>>>>>>>>> +}
>>>>>>>>>>>>> +
>>>>>>>>>>>>>      /**
>>>>>>>>>>>>>       * ttm_bo_kmap
>>>>>>>>>>>>>       *
>>>>>>>>>>>>> diff --git a/include/linux/dma-buf-map.h b/include/linux/dma-buf-map.h
>>>>>>>>>>>>> index fd1aba545fdf..2e8bbecb5091 100644
>>>>>>>>>>>>> --- a/include/linux/dma-buf-map.h
>>>>>>>>>>>>> +++ b/include/linux/dma-buf-map.h
>>>>>>>>>>>>> @@ -45,6 +45,12 @@
>>>>>>>>>>>>>       *
>>>>>>>>>>>>>       *    dma_buf_map_set_vaddr(&map. 0xdeadbeaf);
>>>>>>>>>>>>>       *
>>>>>>>>>>>>> + * To set an address in I/O memory, use dma_buf_map_set_vaddr_iomem().
>>>>>>>>>>>>> + *
>>>>>>>>>>>>> + * .. code-block:: c
>>>>>>>>>>>>> + *
>>>>>>>>>>>>> + *    dma_buf_map_set_vaddr_iomem(&map. 0xdeadbeaf);
>>>>>>>>>>>>> + *
>>>>>>>>>>>>>       * Test if a mapping is valid with either dma_buf_map_is_set() or
>>>>>>>>>>>>>       * dma_buf_map_is_null().
>>>>>>>>>>>>>       *
>>>>>>>>>>>>> @@ -118,6 +124,20 @@ static inline void dma_buf_map_set_vaddr(struct
>>>>>>>>>>>>> dma_buf_map *map, void *vaddr)
>>>>>>>>>>>>>          map->is_iomem = false;
>>>>>>>>>>>>>      }
>>>>>>>>>>>>>      +/**
>>>>>>>>>>>>> + * dma_buf_map_set_vaddr_iomem - Sets a dma-buf mapping structure to
>>>>>>>>>>>>> an address in I/O memory
>>>>>>>>>>>>> + * @map:        The dma-buf mapping structure
>>>>>>>>>>>>> + * @vaddr_iomem:    An I/O-memory address
>>>>>>>>>>>>> + *
>>>>>>>>>>>>> + * Sets the address and the I/O-memory flag.
>>>>>>>>>>>>> + */
>>>>>>>>>>>>> +static inline void dma_buf_map_set_vaddr_iomem(struct dma_buf_map *map,
>>>>>>>>>>>>> +                           void __iomem *vaddr_iomem)
>>>>>>>>>>>>> +{
>>>>>>>>>>>>> +    map->vaddr_iomem = vaddr_iomem;
>>>>>>>>>>>>> +    map->is_iomem = true;
>>>>>>>>>>>>> +}
>>>>>>>>>>>>> +
>>>>>>>>>>>>>      /**
>>>>>>>>>>>>>       * dma_buf_map_is_equal - Compares two dma-buf mapping structures
>>>>>>>>>>>>> for equality
>>>>>>>>>>>>>       * @lhs:    The dma-buf mapping structure
>>>>>>>>>>>> _______________________________________________
>>>>>>>>>>>> dri-devel mailing list
>>>>>>>>>>>> dri-devel@lists.freedesktop.org
>>>>>>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=02%7C01%7Cchristian.koenig%40amd.com%7C472c3d655a61411deb6708d86525d1b8%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637370560438965013&amp;sdata=HdHOA%2F1VcIX%2F7YtfYTiAqYEvw7Ag%2FS%2BxS5VwJKOv5y0%3D&amp;reserved=0
>>>>>>>>>>> _______________________________________________
>>>>>>>>>>> amd-gfx mailing list
>>>>>>>>>>> amd-gfx@lists.freedesktop.org
>>>>>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=02%7C01%7Cchristian.koenig%40amd.com%7C472c3d655a61411deb6708d86525d1b8%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637370560438965013&amp;sdata=H%2B5HKCsTrksRV2EyEiFGSTyS79jsWCmJimSMoJYusx8%3D&amp;reserved=0
>>>>>>>>>> _______________________________________________
>>>>>>>>>> dri-devel mailing list
>>>>>>>>>> dri-devel@lists.freedesktop.org
>>>>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=02%7C01%7Cchristian.koenig%40amd.com%7C472c3d655a61411deb6708d86525d1b8%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637370560438965013&amp;sdata=HdHOA%2F1VcIX%2F7YtfYTiAqYEvw7Ag%2FS%2BxS5VwJKOv5y0%3D&amp;reserved=0
>>>>>>>>>>
>>>>>>>>> _______________________________________________
>>>>>>>>> amd-gfx mailing list
>>>>>>>>> amd-gfx@lists.freedesktop.org
>>>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=02%7C01%7Cchristian.koenig%40amd.com%7C472c3d655a61411deb6708d86525d1b8%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637370560438965013&amp;sdata=H%2B5HKCsTrksRV2EyEiFGSTyS79jsWCmJimSMoJYusx8%3D&amp;reserved=0
>>>>>
>>>>> --
>>>>> Daniel Vetter
>>>>> Software Engineer, Intel Corporation
>>>>> http://blog.ffwll.ch
>>> --
>>> Thomas Zimmermann
>>> Graphics Driver Developer
>>> SUSE Software Solutions Germany GmbH
>>> Maxfeldstr. 5, 90409 Nürnberg, Germany
>>> (HRB 36809, AG Nürnberg)
>>> Geschäftsführer: Felix Imendörffer
>>>
>>

