Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F34E2D40B2
	for <lists+linux-media@lfdr.de>; Wed,  9 Dec 2020 12:09:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730469AbgLILH6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Dec 2020 06:07:58 -0500
Received: from mail-dm6nam11on2043.outbound.protection.outlook.com ([40.107.223.43]:45692
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730323AbgLILH5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 9 Dec 2020 06:07:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H1SmpzatBi2TLRTOSK91JVI3B0GOPJvfX2z9ywAreJzsf2vHitj+cOU6yydLw+euhuOzHMyQxdV0+F7bWXeA2Ye7tnXZ/R3lvTGrVmDoE11/lEu8dqvDNMYdzUqHqo6vSuiHrXyU5YUGgOmJ50ToYvjNIcaE1qHrUERYs8sVXDBrEQa+Okbo0rK1L7iG1eupMGko4uzIgWZIOIz65VJZb4Pklui8YP0cTqDuBTbV055/w5lBbMqOGYib3/Dh7WGcrje+K8q0/ve+I3ZUiYvPTGZ1cRRT3VLfcKLadQT3n+aLTXdyKqX/MiWVOdKaepH6ZoiI+8d5V5498xWSeyjdIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l3F50FaEMOWm4wlSHxPK1gJxVAYo4/DUOEVtFhUP/Sc=;
 b=cYOrotwRqz0RcDsZiKD9kzTkrZd/KBJHtypvl84cU0RPPv7MmvpIPfteyRlTdnBfRsF1v/Y37sl1W1ZSzSEAuHEo14fUB94qLzlusGp4JHZPvPBs1qJLgjXEWnk1E7AoKNY94Pjz+v8zMqWYyUUTqXbSqZHNiLdrdax7eh/60OZxOCGJ+eLJg32520ZkiWjS73huhOdpSc/9ZjCE79GPhtg8kpOfeKaWPjf+Q9Cao+RFAYPd+ecbxN610pEjVESI0pwvUdh+H4FtzGnWld2ZRoOUjAewDY+f65WS2hHi8PcZUkydZRip02Y4qY7cQgqiKYER1mPlN0cfT2bx9eWaLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l3F50FaEMOWm4wlSHxPK1gJxVAYo4/DUOEVtFhUP/Sc=;
 b=YPuXkdOKBzcX1bkxY5q6kVbfkNkbarTq6xCnhqJWorDO0QsCEhqiiRrCTSNMJ7uENnmRgB9O3jQ3vXu6HAq/vR+OANrebF7BUY/P2ivZWn18955xlooH5F7WCpTHQ91rr/wgdzFKXHQoPWaG09vPYEcCePoY2PW+t0QQ1lYg+T0=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4254.namprd12.prod.outlook.com (2603:10b6:208:1d0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Wed, 9 Dec
 2020 11:07:04 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3654.012; Wed, 9 Dec 2020
 11:07:04 +0000
Subject: Re: [PATCH v2 7/7] dma-buf: Write down some rules for vmap usage
To:     Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Dave Airlie <airlied@redhat.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
References: <20201203140259.26580-1-tzimmermann@suse.de>
 <20201203140259.26580-8-tzimmermann@suse.de>
 <20201203152601.GB401619@phenom.ffwll.local>
 <ee2abd93-0dfe-53a3-0038-5edc58c3ec92@suse.de>
 <20201203204129.GC401619@phenom.ffwll.local>
 <a253129d-c0e3-c864-fa0c-111338d25e25@suse.de>
 <4fc93de9-cd26-58b0-d398-ac97577ffa92@amd.com>
 <20201209001321.GF401619@phenom.ffwll.local>
 <8ef5d69a-b5b3-31d0-b011-8860b60f35eb@suse.de>
 <CAKMK7uE-GwdR-=7aDbf3nsrENd167ucgZ+eaeaq+WMcNAiH0YA@mail.gmail.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <346cf850-2728-1e07-4805-cc2cc6fcd765@amd.com>
Date:   Wed, 9 Dec 2020 12:06:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAKMK7uE-GwdR-=7aDbf3nsrENd167ucgZ+eaeaq+WMcNAiH0YA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM9P192CA0005.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::10) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by AM9P192CA0005.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Wed, 9 Dec 2020 11:07:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e612f823-4fa8-4f58-298f-08d89c328f9c
X-MS-TrafficTypeDiagnostic: MN2PR12MB4254:
X-Microsoft-Antispam-PRVS: <MN2PR12MB42542503FDCBB5874592CE2883CC0@MN2PR12MB4254.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r8eWvf8N5OpG+N7sU3x+0qjut6XI42IlulHDUDhj9DyDzjt/xJvuyDfbyIUgejo3k2KEhllcZfGRegoe1v4bhY/n3g1IAcEg20UCrqJxLzzMSym4Bhd0It0tvzgJ96uAM29vurC3GGutzE3WkKfWCbUP/sqcXx9QWptDKpuTF9GifDIGy8zLU2uhzKKb6tPehB3q74g/at5yvqpqQEedJlASmrdjAuoMmwHcBvL8rSuyEEE9aKGVQrQ06qHiLaeaOwiGVVDWuvTb55kZ5X3icucygFGIPzgBLGZuaEsXhb2foy3Yof5wyLYlQ2fglCojuYnpLdspbjg/WnO7sKEnQ2aAPEiTbil4FPExBAgvs9L/JF8slGSyTo4WplcYUD9SF7s33s3t5oIIaEEoydFbAjKyhZ4tQr7KC8THZvfTvwdq/Uju9bEfLENDOk049G/P7bZnPmZZtPNOa0ASw+kK9Z0BtXMkLZxBp75PnmT4h6s=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(366004)(186003)(86362001)(16526019)(31696002)(31686004)(52116002)(6486002)(54906003)(66556008)(36756003)(110136005)(66476007)(4326008)(66946007)(8936002)(34490700003)(8676002)(66574015)(5660300002)(2616005)(2906002)(83380400001)(966005)(6666004)(508600001)(45080400002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZlNPOUdrbmNHZm50Wnk4Q09ZdWduck45THlFNFJXdXkveUVybXFvL0ZPRFlH?=
 =?utf-8?B?MUVMQnpYZXZBMkU2SXJLYjI3VjRhYmFiUVgwZDl0aFp1R0lnSGhLclE2YXMw?=
 =?utf-8?B?OEFDUTJESWhTTldKT1MwMHU0NWxKODdEcGQrcHozVkhmYXJkWmJLalQvTTc5?=
 =?utf-8?B?dGxFdDlkUHlUb3orWUVVOWtRZ0JycEVyaGg5WkZCZDR6SWVKb25nNSt0bEIv?=
 =?utf-8?B?OHFUUGJWT01UWGJVeE04M3JLNm9vdzFuRTVYRklkZndHQVZDUDExSzNINGRx?=
 =?utf-8?B?bGFNUnlqSWxGS01vdTRhQ2xtVzVuWUtmbndQOUZzUi9KR2xxSG1KZWJyaVhO?=
 =?utf-8?B?TlRYSDhsYXRDcnFzaytqL0k0bGp3bEtSdXVXTVFMODNFTTZ3bGs5dU5DMVU3?=
 =?utf-8?B?cmhKdURQTkdwd2lLVDJuMzNzL21WMmpQeTd3THZudGJVeE1aRmFJb2lvclc4?=
 =?utf-8?B?N3JjQk4yN3RmMjExVFNBOHkxTFpmY2syUUZEWHlOKzUvWjV4U2VEZnFKejRz?=
 =?utf-8?B?Tktncm9FQUJKajlqYkNCQWlqaGhDamMyYnZjN1lZNTNsQjlWdGI3aVNhZDll?=
 =?utf-8?B?VzVpSDZCMVV6eXY1RUw0N1Fjak94YlArT0toVTEvZnhoOVJLNXNwck94YVRy?=
 =?utf-8?B?dUo5YU5CTisvMVBydDBXMzAwRU9YalNQVEtQczROQmttMS9xYk1LZjFBNVR3?=
 =?utf-8?B?WUNiaDZKOUZ6YTc1RU0zOXdvS0pkME83N09RWmV6TW04SGpWcnhCNlZ5dGhG?=
 =?utf-8?B?Mk5GcC8vdENJUHpHOXhSQnJnNEdycUpUTHMzUjlEWE9qaWw1R2Q0a3lVLzM3?=
 =?utf-8?B?UnA1dFp3ekd6RVN4TWU2Zk92akZtL1AydWtMTytWOGk3YnJFZXphNEhkOE92?=
 =?utf-8?B?cU90Z1pMMXZtZngyVTZYNkFsa0NZYlRUc0ZkeDJXV2twTzFHTktNVlNvdDR5?=
 =?utf-8?B?MXVwWDRVcm96ak1QWXJrY3NvRCt5M213cCtQWkhHR1lWcFdQcFVZUFo3ak9x?=
 =?utf-8?B?SUlNNGQ5dFhkTFpHMFN6Z0hpT0xBclBDcXhqNzVVRmNzakRRZFpSZldhd1B0?=
 =?utf-8?B?UGU4d3JRWXFHVUxFY3pENnUrVk1YZHlKQWt1b0QvZDJndEFuNUI3ZHRNRVNp?=
 =?utf-8?B?dmNKeFRwYXUwbFBKSEVuMXU1czdVaWNaTC9ZeDVpSlUwNm40T0REUURwT2Jz?=
 =?utf-8?B?ZHR5SE5zTE0yNHphZGhnZWlRT052TW45aUQxMkhEWEdPNW5DVU1TK2JxRE9C?=
 =?utf-8?B?Z3NBakJzUmxDRTBrcjBHVGpCZUdsQkdPWVBkUkFLZE4yZFkyblJTMFpPRkFB?=
 =?utf-8?B?dTJjbE1OcXpqMnkzcFR2bHArbzdUNFhKakZTNVFPT1NONUh5QnJXVXo0TXQr?=
 =?utf-8?B?ejIyVkNKYmk5RWdxV1F0MXBIcWVnWFVjQVNLODNCMlNJeWJuQ0lXRVpQNVc2?=
 =?utf-8?Q?XeWZz6C8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2020 11:07:04.3979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: e612f823-4fa8-4f58-298f-08d89c328f9c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PpxDRAPQdETrcjF0I2g+zNOQdq+0vJC1T3LGRvT3lPWNyCsN4peZ+rNxnURV2BrE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4254
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 09.12.20 um 11:16 schrieb Daniel Vetter:
> [SNIP]
>>>> At least I would be fine with that. For now amdgpu is the only exporter who
>>>> implements the explicit pin/unpin semantics anyway.
>>> Yup, I think that makes sense (if it works). Maybe we could use something
>>> like:
>>>
>>> a) dma_buf pin exists, driver is dynamic. This means dma_buf_vmap needs to
>>> first pin, then call ->vmap. dma_buf_vmap_local otoh can directly call
>>> ->vmap since the exporter relies on either a pin or dma_resv_lock.
>>>
>>> b) dma_buf pin not implement, driver is a legacy pile. dma_buf_vmap will
>>> pin (somewhere at least, or rely on some implicit pin), dma_buf_vmap_local
>>> doesn't work and should fail.
>> I think I read in the dma-buf documentation that pin is supposed to put
>> the BO in a domain that is suitable for scanout. Now I don't really
>> trust this to work. Amdgpu, radeon and nouveau put it into the GTT
>> region. Qxl appears to put it wherever it is.
> Uh that sounds wrong, or at least not the full complexity. ->pin's
> main use right now is to freeze the dma-buf into system memory when
> there's a non-dynamic attachement for a dynamic exporter. There's also
> a dma_buf_pin call in amdgpu, and I think that only works for scanout
> on integrated gpu. Pinning to vram would break sharing for all
> existing dma-buf users.
>
> Christian can you perhaps explain when amdgpu uses dma_buf_pin()?

You guys are writing mails faster than I can answer :)

dma_buf_pin() should be used when the buffer can't move any more and it 
is preferred to bin in a location which is accessible by all devices, 
that usually means system memory.

> My take is the ->pin callback should clarify that it should pin into
> system memory, for legacy (non-dynamic) dma-buf users.

I though I've wrote that on the documentation for the pin callback, but 
looks like I've forgotten to do this.

> And dma_buf_pin() should gain some kerneldoc which then states that "This
> should only be used in limited use cases like scanout and not for
> temporary pin operations." I think the problem with this kerneldoc is
> simply that it tries to document the exporter and importer side of the
> contract in one place and makes a mess of it, plus leaves the actual
> importer side function undocumented. I think the kerneldoc also
> predates the final patch version, and we didn't update it fully.

That's a really good point and I noticed this mess before as well.

How about this: We document the exporter side on the dma-buf function 
table (because the exporter should implement those), and the importer 
side on the dma-buf functions which then uses the exporter functions.

Regards,
Christian.

>>> I think for less transition work fbdev helpers could first try
>>> dma_resv_lock + dma_buf_vmap_local, if that fails, drop the dma_resv_lock
>>> and do the pinning dma_buf_vmap. That way we don't have to convert shmem
>>> helpers over to dma_resv locking, which should help.
>> I have meanwhile made a patchset that updates helpers for cma, shmem and
>> vram with vmap_local; and converts fbdev emulation as well. It needs a
>> bit more testing before being posted.
> Nice, even better!
> -Daniel
>
>> Best regards
>> Thomas
>>
>>> And ttm drivers would do the new clean interface, so at least everyone
>>> using dma_resv today is all fine. Intel's conversion to dma_resv lock is
>>> in-flight, but that needs a conversion to the dynamic interface anyway,
>>> the current code splats. And dynamic brings means explicit pin/unpin
>>> callbacks, so should be good too.
>>> -Daniel
>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> Best regards
>>>>> Thomas
>>>>>
>>>>> [1] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fpatch%2F400054%2F%3Fseries%3D83765%26rev%3D1&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C0a737292d0b643fd671a08d89c2b8d77%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637431058168569423%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=nT89kiTCaZKRORv%2B49%2F2zmW2zV5I6UaArkiKDx%2F4%2Bfw%3D&amp;reserved=0
>>>>>
>>>>>> - The new one, which allows vmapping with just dma_resv locked, and
>>>>>> should
>>>>>>      have some caching in exporters.
>>>>>>
>>>>>> Breaking code and then adding todos about that is kinda not so cool
>>>>>> approach here imo.
>>>>>>
>>>>>> Also I guess ttm_bo_vmap should have a check that either the buffer is
>>>>>> pinned, or dma_resv_lock is held.
>>>>>>
>>>>>> Cheers, Daniel
>>>>>>
>>>>>>
>>>>>>
>>>>>>> Best regards
>>>>>>> Thomas
>>>>>>>
>>>>>>>>> ---
>>>>>>>>>      Documentation/gpu/todo.rst | 15 +++++++++++++
>>>>>>>>>      include/drm/drm_gem.h      |  4 ++++
>>>>>>>>>      include/linux/dma-buf.h    | 45
>>>>>>>>> ++++++++++++++++++++++++++++++++++++++
>>>>>>>>>      3 files changed, 64 insertions(+)
>>>>>>>>>
>>>>>>>>> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
>>>>>>>>> index 009d8e6c7e3c..32bb797a84fc 100644
>>>>>>>>> --- a/Documentation/gpu/todo.rst
>>>>>>>>> +++ b/Documentation/gpu/todo.rst
>>>>>>>>> @@ -505,6 +505,21 @@ Contact: Thomas Zimmermann
>>>>>>>>> <tzimmermann@suse.de>, Christian König, Daniel Vette
>>>>>>>>>      Level: Intermediate
>>>>>>>>> +Enforce rules for dma-buf vmap and pin ops
>>>>>>>>> +------------------------------------------
>>>>>>>>> +
>>>>>>>>> +Exporter implementations of vmap and pin in struct
>>>>>>>>> dma_buf_ops (and consequently
>>>>>>>>> +struct drm_gem_object_funcs) use a variety of locking
>>>>>>>>> semantics. Some rely on
>>>>>>>>> +the caller holding the dma-buf's reservation lock, some
>>>>>>>>> do their own locking,
>>>>>>>>> +some don't require any locking. VRAM helpers even used
>>>>>>>>> to pin as part of vmap.
>>>>>>>>> +
>>>>>>>>> +We need to review each exporter and enforce the documented rules.
>>>>>>>>> +
>>>>>>>>> +Contact: Christian König, Daniel Vetter, Thomas
>>>>>>>>> Zimmermann <tzimmermann@suse.de>
>>>>>>>>> +
>>>>>>>>> +Level: Advanced
>>>>>>>>> +
>>>>>>>>> +
>>>>>>>>>      Core refactorings
>>>>>>>>>      =================
>>>>>>>>> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
>>>>>>>>> index 5e6daa1c982f..1864c6a721b1 100644
>>>>>>>>> --- a/include/drm/drm_gem.h
>>>>>>>>> +++ b/include/drm/drm_gem.h
>>>>>>>>> @@ -138,6 +138,8 @@ struct drm_gem_object_funcs {
>>>>>>>>>           * drm_gem_dmabuf_vmap() helper.
>>>>>>>>>           *
>>>>>>>>>           * This callback is optional.
>>>>>>>>> +     *
>>>>>>>>> +     * See also struct dma_buf_ops.vmap
>>>>>>>>>           */
>>>>>>>>>          int (*vmap)(struct drm_gem_object *obj, struct
>>>>>>>>> dma_buf_map *map);
>>>>>>>>> @@ -148,6 +150,8 @@ struct drm_gem_object_funcs {
>>>>>>>>>           * drm_gem_dmabuf_vunmap() helper.
>>>>>>>>>           *
>>>>>>>>>           * This callback is optional.
>>>>>>>>> +     *
>>>>>>>>> +     * See also struct dma_buf_ops.vunmap
>>>>>>>>>           */
>>>>>>>>>          void (*vunmap)(struct drm_gem_object *obj, struct
>>>>>>>>> dma_buf_map *map);
>>>>>>>>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
>>>>>>>>> index cf72699cb2bc..dc81fdc01dda 100644
>>>>>>>>> --- a/include/linux/dma-buf.h
>>>>>>>>> +++ b/include/linux/dma-buf.h
>>>>>>>>> @@ -267,7 +267,52 @@ struct dma_buf_ops {
>>>>>>>>>           */
>>>>>>>>>          int (*mmap)(struct dma_buf *, struct vm_area_struct *vma);
>>>>>>>>> +    /**
>>>>>>>>> +     * @vmap:
>>>>>>>> There's already a @vmap and @vunamp kerneldoc at the top comment, that
>>>>>>>> needs to be removed.
>>>>>>>> -Daniel
>>>>>>>>
>>>>>>>>> +     *
>>>>>>>>> +     * Returns a virtual address for the buffer.
>>>>>>>>> +     *
>>>>>>>>> +     * Notes to callers:
>>>>>>>>> +     *
>>>>>>>>> +     * - Callers must hold the struct dma_buf.resv lock
>>>>>>>>> before calling
>>>>>>>>> +     *   this interface.
>>>>>>>>> +     *
>>>>>>>>> +     * - Callers must provide means to prevent the
>>>>>>>>> mappings from going
>>>>>>>>> +     *   stale, such as holding the reservation lock or providing a
>>>>>>>>> +     *   move-notify callback to the exporter.
>>>>>>>>> +     *
>>>>>>>>> +     * Notes to implementors:
>>>>>>>>> +     *
>>>>>>>>> +     * - Implementations must expect pairs of @vmap and
>>>>>>>>> @vunmap to be
>>>>>>>>> +     *   called frequently and should optimize for this case.
>>>>>>>>> +     *
>>>>>>>>> +     * - Implementations should avoid additional operations, such as
>>>>>>>>> +     *   pinning.
>>>>>>>>> +     *
>>>>>>>>> +     * - Implementations may expect the caller to hold the dma-buf's
>>>>>>>>> +     *   reservation lock to protect against concurrent calls and
>>>>>>>>> +     *   relocation.
>>>>>>>>> +     *
>>>>>>>>> +     * - Implementations may provide additional
>>>>>>>>> guarantees, such as working
>>>>>>>>> +     *   without holding the reservation lock.
>>>>>>>>> +     *
>>>>>>>>> +     * This callback is optional.
>>>>>>>>> +     *
>>>>>>>>> +     * Returns:
>>>>>>>>> +     *
>>>>>>>>> +     * 0 on success or a negative error code on failure.
>>>>>>>>> +     */
>>>>>>>>>          int (*vmap)(struct dma_buf *dmabuf, struct dma_buf_map *map);
>>>>>>>>> +
>>>>>>>>> +    /**
>>>>>>>>> +     * @vunmap:
>>>>>>>>> +     *
>>>>>>>>> +     * Releases the address previously returned by @vmap.
>>>>>>>>> +     *
>>>>>>>>> +     * This callback is optional.
>>>>>>>>> +     *
>>>>>>>>> +     * See also @vmap()
>>>>>>>>> +     */
>>>>>>>>>          void (*vunmap)(struct dma_buf *dmabuf, struct
>>>>>>>>> dma_buf_map *map);
>>>>>>>>>      };
>>>>>>>>> --
>>>>>>>>> 2.29.2
>>>>>>>>>
>>>>>>> --
>>>>>>> Thomas Zimmermann
>>>>>>> Graphics Driver Developer
>>>>>>> SUSE Software Solutions Germany GmbH
>>>>>>> Maxfeldstr. 5, 90409 Nürnberg, Germany
>>>>>>> (HRB 36809, AG Nürnberg)
>>>>>>> Geschäftsführer: Felix Imendörffer
>>>>>>>
>>>>>>
>>>>>>
>>>>>>
>> --
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Maxfeldstr. 5, 90409 Nürnberg, Germany
>> (HRB 36809, AG Nürnberg)
>> Geschäftsführer: Felix Imendörffer
>>
>

