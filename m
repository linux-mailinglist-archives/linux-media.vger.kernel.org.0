Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D8B527E8A2
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 14:34:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728340AbgI3Mel (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 08:34:41 -0400
Received: from mail-dm6nam10on2079.outbound.protection.outlook.com ([40.107.93.79]:49569
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727997AbgI3Mek (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 08:34:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GUyjDRs03o3fS2d+iCsNTk52XbkEAjW0ujRpgpm4NpgyB3GiI9zj5ZUWzo3QgsP3a7wq0zzbUkr0L9lvgBAlbwZwbY6qs5Q2IjbcH2V+RTZ2FJBo/up1zhnkgO5Kkp9meSzSEh4k/pZ7OMJJSQGgbp0WC8BLPwzG5L1QWeEr88SMTen/DMO2SJSixEU3yF1MPyi08a/PnI5R3QE6mX3LXlWEShbm4yQoCSpoe1iBixJpKncfb4M66QxW/HIhSlAhhMzgv1GCoJlQW4Cl1zOUXiSXsjOa4ZkKD3xllN/whQCQwPT8wZZEYVhSJslYYfQv0PyMcW01gxyR6YhHgD+2RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6MM+NUl/QvXystjP4gcGoQ2HZT79wiYrMdP9jTNoLMQ=;
 b=OQJ/LpHJwjx48oqYuGdCq/bUwvx34P+QYDB8kaVwud1TJ/myF8Jle9nygxG8ZKhM1mu2j58AHceiWtrNpr9m/p5da1LljVVYR01bNVmPSoNQiKnLZ1no5VQHEGylOUkiHZBSx4WMvoh+nPDwfk3ekmP2F+5RePhcvK7ViSPV+s3WuSZenaSv2L6+7alaG7yY+KL5kiCBZhBNBXH0EVAxr1eL8EURNKVw8yHDpLADISHMeJ4Zf/8XTuniD7nCbN/5Xve0gv8SrtkffgQxKfx6ZG9erFS7qJYWU7Iw+r4RTmJjIjgECuXBdP23bthqtqrARGJOAp9P3AgzCkDhA5hXyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6MM+NUl/QvXystjP4gcGoQ2HZT79wiYrMdP9jTNoLMQ=;
 b=SG0R+FeL5yzKqnC6AfSYUbMN4gslzztmFeK7+tV4DN1hGLKEK7Dh8Ub+OmD8CPwAwyAyctmIgmJCTShzxXdDsfWjrk3BzW8MDE7vUm3Si2LtudX0Ic4/oPJ0MXv9BSto45nEJ3UGWh/CGbGQG8D/uAbuQtHq4EOW8xZx33CTViM=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4690.namprd12.prod.outlook.com (2603:10b6:208:8e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22; Wed, 30 Sep
 2020 12:34:36 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3433.032; Wed, 30 Sep 2020
 12:34:36 +0000
Subject: Re: [PATCH v3 2/7] drm/ttm: Add ttm_kmap_obj_to_dma_buf_map() for
 type conversion
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        airlied@linux.ie, sam@ravnborg.org, alexander.deucher@amd.com,
        kraxel@redhat.com, l.stach@pengutronix.de,
        linux+etnaviv@armlinux.org.uk, christian.gmeiner@gmail.com,
        inki.dae@samsung.com, jy0922.shim@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com,
        kgene@kernel.org, krzk@kernel.org, yuq825@gmail.com,
        bskeggs@redhat.com, robh@kernel.org, tomeu.vizoso@collabora.com,
        steven.price@arm.com, alyssa.rosenzweig@collabora.com,
        hjc@rock-chips.com, heiko@sntech.de, hdegoede@redhat.com,
        sean@poorly.run, eric@anholt.net, oleksandr_andrushchenko@epam.com,
        ray.huang@amd.com, sumit.semwal@linaro.org,
        emil.velikov@collabora.com, luben.tuikov@amd.com, apaneers@amd.com,
        linus.walleij@linaro.org, melissa.srw@gmail.com,
        chris@chris-wilson.co.uk, miaoqinglang@huawei.com,
        linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
        nouveau@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        linaro-mm-sig@lists.linaro.org, linux-rockchip@lists.infradead.org,
        dri-devel@lists.freedesktop.org, spice-devel@lists.freedesktop.org,
        xen-devel@lists.xenproject.org,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
References: <20200929151437.19717-1-tzimmermann@suse.de>
 <20200929151437.19717-3-tzimmermann@suse.de>
 <8fad0114-064a-4ed5-c21d-d1b4294de0a1@amd.com>
 <2614314a-81f7-4722-c400-68d90e48e09a@suse.de>
 <8a84f62b-33f3-f44c-52af-c859a0e0d1fb@gmail.com>
 <07972ada-9135-3743-a86b-487f610c509f@suse.de>
 <b569b7e3-68f0-edcc-c8f4-170e9042d348@gmail.com>
 <20200930094712.GW438822@phenom.ffwll.local>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <8479d0aa-3826-4f37-0109-55daca515793@amd.com>
Date:   Wed, 30 Sep 2020 14:34:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200930094712.GW438822@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: FRYP281CA0009.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::19)
 To MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by FRYP281CA0009.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.17 via Frontend Transport; Wed, 30 Sep 2020 12:34:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: acb83a58-db16-48eb-58af-08d8653d3084
X-MS-TrafficTypeDiagnostic: BL0PR12MB4690:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB46909AB050EA28CB43985C7983330@BL0PR12MB4690.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HGasQQyCz3od76EXrpm7Ocwk0HubtvHNpeelZ/TVcyEUuAHo4AfAZk7j/l0ng47PEZhFHILOkJ1t9heLd4CCB3VSyLmOTaVRlyZLQh9rZESwhntrdE9WQTI9Ipt93qyDvJhM/OymkrYEawQKeslveORWIbpiCPrCnGERWUefEO4UYDGKl+JVS+U67AegAoCQ3Cka+USXs4NSPFDFGebNHhJLiEH6YbfdrR9BW8wfKtRLApdwQtx2YrsHuuOCGNZyVyS34ssq0n6HscXTT11uZtBNEIiwKaAIAxKARph0Lf0CE3hKjhIihy1fp4fM1BXjc8DRFBNM57ZYGmMSRelAzu40w5HiJ+GvqqsxkFuivXInxWzd8FnLnXJ7bKahqYg6fOF2icN4HwZC48wzXPTMz91ZgtgcnFZMp6FbCvVu2doFNeZ57lVUT7no1EzsBxAxzLS2T1MkyF+PywDooZJzRA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(346002)(376002)(396003)(39860400002)(16526019)(186003)(6666004)(2616005)(316002)(8936002)(52116002)(478600001)(45080400002)(66946007)(6486002)(5660300002)(966005)(6916009)(4326008)(2906002)(8676002)(7416002)(31686004)(86362001)(83380400001)(66574015)(31696002)(66476007)(66556008)(7406005)(36756003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: Go+F4xJjH3Eu6rFpPTYagWuv5YPbYXHddlDD2hC0uRbHtrlnGkSPqPKI2l16/iZS0/IL7QYsm+K71wPOF+ic87auzFilf9E9qhCAtaH9sW0TPOGLDnx9J+9HICNlON8Z90J5RiDeQlUz4GnkJd/hH8fVviBtJFACBOuaG4ir2XFTcm9K63CplYcQNQNNtWTTSrPFtGvSm5VgqiiX6fVhH9GcQPHC3qt2hihj8/ol9sfMNaPy2zF0sNzItX6TJoEG0/3vEvKiAbW9kMlhGBH5pWTZYmrG0V1ysjD2DuuuQ91IPDn62JQVF2UWSVpDLh5waCiVEyYrHuNRnQH+C3B94FxuCb5T1PO8kDdy6mMq1RzKJRrWiZEuy/8cWC1Ad4E+pcCA22b9+bWXa2Eb0+cVGQPCUuRcgOtpjmJcdb7cSdrLVrLQZH8UlGvDSwX2PMf75WTwWjBp5c3bNOeZ+JSQkVACja/QDm6iqkd7UJiz1a32k05l1MkdVFnf5DDi4QKAoV59jw8wF2+va+hlpsKE38J0SBxwxXYt8u+VSdesBOT3yovbr24z6So2IV/IROo6EDzTo3yIn6nE0d6LRGMKtEhyybj7rN4gS9Xu7SwFngRZHY6tIMYDCw6ZrMt0krcoKPRQYAQ0nBfnYZ2lEJ4fuhQ2tT0xjrZ9MaXHVNsdMgU5b/jN/Sl8gCjcFybydrsNM49dd4Of/JKL34rGjD7e8Q==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acb83a58-db16-48eb-58af-08d8653d3084
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2020 12:34:35.9732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4TfNRqsaURmaOucoedExQXau2nSxBXSwJPSmEqnqwr/dcl5pHxdqUn9W/GBjXLOR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4690
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 30.09.20 um 11:47 schrieb Daniel Vetter:
> On Wed, Sep 30, 2020 at 10:34:31AM +0200, Christian König wrote:
>> Am 30.09.20 um 10:19 schrieb Thomas Zimmermann:
>>> Hi
>>>
>>> Am 30.09.20 um 10:05 schrieb Christian König:
>>>> Am 29.09.20 um 19:49 schrieb Thomas Zimmermann:
>>>>> Hi Christian
>>>>>
>>>>> Am 29.09.20 um 17:35 schrieb Christian König:
>>>>>> Am 29.09.20 um 17:14 schrieb Thomas Zimmermann:
>>>>>>> The new helper ttm_kmap_obj_to_dma_buf() extracts address and location
>>>>>>> from and instance of TTM's kmap_obj and initializes struct dma_buf_map
>>>>>>> with these values. Helpful for TTM-based drivers.
>>>>>> We could completely drop that if we use the same structure inside TTM as
>>>>>> well.
>>>>>>
>>>>>> Additional to that which driver is going to use this?
>>>>> As Daniel mentioned, it's in patch 3. The TTM-based drivers will
>>>>> retrieve the pointer via this function.
>>>>>
>>>>> I do want to see all that being more tightly integrated into TTM, but
>>>>> not in this series. This one is about fixing the bochs-on-sparc64
>>>>> problem for good. Patch 7 adds an update to TTM to the DRM TODO list.
>>>> I should have asked which driver you try to fix here :)
>>>>
>>>> In this case just keep the function inside bochs and only fix it there.
>>>>
>>>> All other drivers can be fixed when we generally pump this through TTM.
>>> Did you take a look at patch 3? This function will be used by VRAM
>>> helpers, nouveau, radeon, amdgpu and qxl. If we don't put it here, we
>>> have to duplicate the functionality in each if these drivers. Bochs
>>> itself uses VRAM helpers and doesn't touch the function directly.
>> Ah, ok can we have that then only in the VRAM helpers?
>>
>> Alternative you could go ahead and use dma_buf_map in ttm_bo_kmap_obj
>> directly and drop the hack with the TTM_BO_MAP_IOMEM_MASK.
>>
>> What I want to avoid is to have another conversion function in TTM because
>> what happens here is that we already convert from ttm_bus_placement to
>> ttm_bo_kmap_obj and then to dma_buf_map.
> Hm I'm not really seeing how that helps with a gradual conversion of
> everything over to dma_buf_map and assorted helpers for access? There's
> too many places in ttm drivers where is_iomem and related stuff is used to
> be able to convert it all in one go. An intermediate state with a bunch of
> conversions seems fairly unavoidable to me.

Fair enough. I would just have started bottom up and not top down.

Anyway feel free to go ahead with this approach as long as we can remove 
the new function again when we clean that stuff up for good.

Christian.

> -Daniel
>
>> Thanks,
>> Christian.
>>
>>> Best regards
>>> Thomas
>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> Best regards
>>>>> Thomas
>>>>>
>>>>>> Regards,
>>>>>> Christian.
>>>>>>
>>>>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>>>>> ---
>>>>>>>     include/drm/ttm/ttm_bo_api.h | 24 ++++++++++++++++++++++++
>>>>>>>     include/linux/dma-buf-map.h  | 20 ++++++++++++++++++++
>>>>>>>     2 files changed, 44 insertions(+)
>>>>>>>
>>>>>>> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
>>>>>>> index c96a25d571c8..62d89f05a801 100644
>>>>>>> --- a/include/drm/ttm/ttm_bo_api.h
>>>>>>> +++ b/include/drm/ttm/ttm_bo_api.h
>>>>>>> @@ -34,6 +34,7 @@
>>>>>>>     #include <drm/drm_gem.h>
>>>>>>>     #include <drm/drm_hashtab.h>
>>>>>>>     #include <drm/drm_vma_manager.h>
>>>>>>> +#include <linux/dma-buf-map.h>
>>>>>>>     #include <linux/kref.h>
>>>>>>>     #include <linux/list.h>
>>>>>>>     #include <linux/wait.h>
>>>>>>> @@ -486,6 +487,29 @@ static inline void *ttm_kmap_obj_virtual(struct
>>>>>>> ttm_bo_kmap_obj *map,
>>>>>>>         return map->virtual;
>>>>>>>     }
>>>>>>>     +/**
>>>>>>> + * ttm_kmap_obj_to_dma_buf_map
>>>>>>> + *
>>>>>>> + * @kmap: A struct ttm_bo_kmap_obj returned from ttm_bo_kmap.
>>>>>>> + * @map: Returns the mapping as struct dma_buf_map
>>>>>>> + *
>>>>>>> + * Converts struct ttm_bo_kmap_obj to struct dma_buf_map. If the memory
>>>>>>> + * is not mapped, the returned mapping is initialized to NULL.
>>>>>>> + */
>>>>>>> +static inline void ttm_kmap_obj_to_dma_buf_map(struct ttm_bo_kmap_obj
>>>>>>> *kmap,
>>>>>>> +                           struct dma_buf_map *map)
>>>>>>> +{
>>>>>>> +    bool is_iomem;
>>>>>>> +    void *vaddr = ttm_kmap_obj_virtual(kmap, &is_iomem);
>>>>>>> +
>>>>>>> +    if (!vaddr)
>>>>>>> +        dma_buf_map_clear(map);
>>>>>>> +    else if (is_iomem)
>>>>>>> +        dma_buf_map_set_vaddr_iomem(map, (void __force __iomem *)vaddr);
>>>>>>> +    else
>>>>>>> +        dma_buf_map_set_vaddr(map, vaddr);
>>>>>>> +}
>>>>>>> +
>>>>>>>     /**
>>>>>>>      * ttm_bo_kmap
>>>>>>>      *
>>>>>>> diff --git a/include/linux/dma-buf-map.h b/include/linux/dma-buf-map.h
>>>>>>> index fd1aba545fdf..2e8bbecb5091 100644
>>>>>>> --- a/include/linux/dma-buf-map.h
>>>>>>> +++ b/include/linux/dma-buf-map.h
>>>>>>> @@ -45,6 +45,12 @@
>>>>>>>      *
>>>>>>>      *    dma_buf_map_set_vaddr(&map. 0xdeadbeaf);
>>>>>>>      *
>>>>>>> + * To set an address in I/O memory, use dma_buf_map_set_vaddr_iomem().
>>>>>>> + *
>>>>>>> + * .. code-block:: c
>>>>>>> + *
>>>>>>> + *    dma_buf_map_set_vaddr_iomem(&map. 0xdeadbeaf);
>>>>>>> + *
>>>>>>>      * Test if a mapping is valid with either dma_buf_map_is_set() or
>>>>>>>      * dma_buf_map_is_null().
>>>>>>>      *
>>>>>>> @@ -118,6 +124,20 @@ static inline void dma_buf_map_set_vaddr(struct
>>>>>>> dma_buf_map *map, void *vaddr)
>>>>>>>         map->is_iomem = false;
>>>>>>>     }
>>>>>>>     +/**
>>>>>>> + * dma_buf_map_set_vaddr_iomem - Sets a dma-buf mapping structure to
>>>>>>> an address in I/O memory
>>>>>>> + * @map:        The dma-buf mapping structure
>>>>>>> + * @vaddr_iomem:    An I/O-memory address
>>>>>>> + *
>>>>>>> + * Sets the address and the I/O-memory flag.
>>>>>>> + */
>>>>>>> +static inline void dma_buf_map_set_vaddr_iomem(struct dma_buf_map *map,
>>>>>>> +                           void __iomem *vaddr_iomem)
>>>>>>> +{
>>>>>>> +    map->vaddr_iomem = vaddr_iomem;
>>>>>>> +    map->is_iomem = true;
>>>>>>> +}
>>>>>>> +
>>>>>>>     /**
>>>>>>>      * dma_buf_map_is_equal - Compares two dma-buf mapping structures
>>>>>>> for equality
>>>>>>>      * @lhs:    The dma-buf mapping structure
>>>>>> _______________________________________________
>>>>>> dri-devel mailing list
>>>>>> dri-devel@lists.freedesktop.org
>>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=02%7C01%7Cchristian.koenig%40amd.com%7C472c3d655a61411deb6708d86525d1b8%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637370560438965013&amp;sdata=HdHOA%2F1VcIX%2F7YtfYTiAqYEvw7Ag%2FS%2BxS5VwJKOv5y0%3D&amp;reserved=0
>>>>> _______________________________________________
>>>>> amd-gfx mailing list
>>>>> amd-gfx@lists.freedesktop.org
>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=02%7C01%7Cchristian.koenig%40amd.com%7C472c3d655a61411deb6708d86525d1b8%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637370560438965013&amp;sdata=H%2B5HKCsTrksRV2EyEiFGSTyS79jsWCmJimSMoJYusx8%3D&amp;reserved=0
>>>> _______________________________________________
>>>> dri-devel mailing list
>>>> dri-devel@lists.freedesktop.org
>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=02%7C01%7Cchristian.koenig%40amd.com%7C472c3d655a61411deb6708d86525d1b8%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637370560438965013&amp;sdata=HdHOA%2F1VcIX%2F7YtfYTiAqYEvw7Ag%2FS%2BxS5VwJKOv5y0%3D&amp;reserved=0
>>>>
>>> _______________________________________________
>>> amd-gfx mailing list
>>> amd-gfx@lists.freedesktop.org
>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=02%7C01%7Cchristian.koenig%40amd.com%7C472c3d655a61411deb6708d86525d1b8%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637370560438965013&amp;sdata=H%2B5HKCsTrksRV2EyEiFGSTyS79jsWCmJimSMoJYusx8%3D&amp;reserved=0

