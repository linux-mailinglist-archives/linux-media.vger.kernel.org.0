Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEC7D2CEA25
	for <lists+linux-media@lfdr.de>; Fri,  4 Dec 2020 09:49:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728942AbgLDIsL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Dec 2020 03:48:11 -0500
Received: from mail-dm6nam11on2080.outbound.protection.outlook.com ([40.107.223.80]:18017
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727056AbgLDIsL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 4 Dec 2020 03:48:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OoR//BOP0Yhqm9SS2JDiVMzDLJoNpPpABkA2tIb9zzZQbP+nDbqiJ1pg0NI1poiPnuFXAbG8zV6JijNlTI7/Wlpbvf1Dn3sViVkPiG1DkI4DHZy1wrZ7s5SoEOqLlqNkpkCGQCvg1PZDmtuWbTk8JMwA7FZvj3X3B+MgNxDKUszRWPi3RrTQbmf+SVAwCdKY7hnbTc/m8te9KX6nBG2X4dyqGoS4MiDQT6jIuXMFtRN4YkhRngRB2Js/RmTZEp6gNzepAFBG/T0ZxQsThe96O1hr9l0+CFOLNaVRHIdVwhUwlo48HSzCGKjh0qHeG97egtmg11yodIxlK9p30NRmtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=whzmOouSOw0+QdJtckcL2RtVUFHY6wMTRYNLY86IZEQ=;
 b=OZkKzca7kQSTp44ayV72hGCxWCrsw8vY2w5b7Ku3px8XeOoRpQHOo5ABFyyZcbkqu9iKbpfq50xFtqaqcO0PqAIcdcgzB4pybScpm9nuUa+vYr9ttxAjNp55YYgoeps6D8Y/wRItr/LwsV1tMHXOpfUbXYwFvG5o6Auk8CMXbED/rnxZQQZGZchmmX5vRwNNbCprUz92jR/0YOh0urdJSqpURwIORVd1Tz/0v/t6NBTvF2okWgKZBLJeX2wMjxCCtIVgbIPGDKnPcHnOd/woxG38PyB35QKufqe//7k87yV4F81SqtTxD1PZ5zqrINIs1TOvwTWvuQuuYFeUdfhOFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=whzmOouSOw0+QdJtckcL2RtVUFHY6wMTRYNLY86IZEQ=;
 b=UM51nCIjAoBOrwi5M7M/9fcaiII8N0zemI+mQVjNhidRRk3mz3+5Zu8kvhPp88Tp1W5QzGHOdTuQMAcsKSxWZLXg5in4NQlySSQp6jC9+OSjeFVjXSmBOCiHHLQwx9dA6oYDZh5t49S8a7U4MjdWoitNXnz5IUA7bFVNndJdlH4=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2452.namprd12.prod.outlook.com (2603:10b6:207:3f::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Fri, 4 Dec
 2020 08:47:15 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3611.035; Fri, 4 Dec 2020
 08:47:15 +0000
Subject: Re: [PATCH v2 7/7] dma-buf: Write down some rules for vmap usage
To:     Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        hdegoede@redhat.com, airlied@redhat.com,
        linux-media@vger.kernel.org
References: <20201203140259.26580-1-tzimmermann@suse.de>
 <20201203140259.26580-8-tzimmermann@suse.de>
 <20201203152601.GB401619@phenom.ffwll.local>
 <ee2abd93-0dfe-53a3-0038-5edc58c3ec92@suse.de>
 <20201203204129.GC401619@phenom.ffwll.local>
 <a253129d-c0e3-c864-fa0c-111338d25e25@suse.de>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <4fc93de9-cd26-58b0-d398-ac97577ffa92@amd.com>
Date:   Fri, 4 Dec 2020 09:47:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <a253129d-c0e3-c864-fa0c-111338d25e25@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR04CA0126.eurprd04.prod.outlook.com
 (2603:10a6:208:55::31) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by AM0PR04CA0126.eurprd04.prod.outlook.com (2603:10a6:208:55::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18 via Frontend Transport; Fri, 4 Dec 2020 08:47:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0b05452a-f56c-4b03-890b-08d8983132cf
X-MS-TrafficTypeDiagnostic: BL0PR12MB2452:
X-Microsoft-Antispam-PRVS: <BL0PR12MB2452B3784CB2AA1155A3F27D83F10@BL0PR12MB2452.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LMGwNV1n0K4xruMcMleoDV2yzbCx9PyIMhZr3mxIGmXnXK7PS0x3h4GtbvIcNB6YkfVd5fsWVYS5lZvT390gMRf+z2ZnxjuCtI9y/6AikcobIob0K7ImX8e2+9Flv1cwOKzmJPhUxJSN9bmYLBkHB07xkFZHs/WM7lDmD5uI54HRRZX7kGnj59aaew0WTX1yB3bIeMrfjRalxSxAVrwbyi4Ewm3TQ5vVlXDY0tarnfbTwW03U0v0uLRblkMz7MBcwiEL7ETifw18wXYSGZO9/J8ZCQXiqRz8CMgZvIymxhlaTNY8v6L4jJhQImbpkIc5uTN152cIWQZ0fvU8qcNLOY1jXNxog713Yo3IosNbzoxzqbS3X6JE/bBRPLMPE5HT4plgHaaOTbGx0X5kJm2UHZNkDViE6igXVoBlXlD9DWmP5OO/rCCe3zGZrgjPcQ2juFiPWNKQrqEDn94t/MSVSg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(366004)(136003)(39860400002)(86362001)(478600001)(31696002)(52116002)(66574015)(36756003)(83380400001)(66476007)(5660300002)(66946007)(66556008)(6666004)(186003)(110136005)(16526019)(2616005)(8936002)(8676002)(316002)(4326008)(966005)(2906002)(31686004)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VW9pRVJOMGlJK0FqZnBtbThoOWVKc3dFUm9VV3J5VUFJK3BxMC9oZ0wrZFBx?=
 =?utf-8?B?MHVUcHhkaGlaTU9uT2JCNDkzREFOSDN6TS9NQk15NlR4NWxPTUVDaTYvOGph?=
 =?utf-8?B?T3I2Q0paWnoyN0FkUWNsT09EV21QMU1UTTlzdDM3OFZkVTNWRDVWWC9EY0RQ?=
 =?utf-8?B?SitITU9WTHdJcVQ2YWV0RnlhQzZPMGcwT09wRUlRZXIrTGpzamNTaEhid0Ry?=
 =?utf-8?B?VTgzVThzbjlKWnJrZzBabjJyYkdWWTlxeHFtWjhpUFdMdnFpYk5UY2Y0d21M?=
 =?utf-8?B?S3VxSCtlVTgyV3Q1VWwxS1FmL201azIzc0M1Mm9ycy9GUVhtc3F6L0Qxb1Bp?=
 =?utf-8?B?SVRuUGtVbE5YNzVoYTdhMGtPNlQvVzh5RGJXU05sYjNKK0l1bTRLY3FIaVo2?=
 =?utf-8?B?cnpaMTV6Z0NyUkNJTnVJRzdBaXl2UE9WMndQbERGM0gwbDhabHRQdHRFbFJX?=
 =?utf-8?B?bXhscFFkcHBWOG90Y3lsWkprZUEzSW9KTzdyZ2xmbkQ0NTdiZnhEZkN2Nm8r?=
 =?utf-8?B?RnJxcE1uT2Z4NDZSRE8wdllpa0p3dXpvTzZOM09ZM0ZxMEh6V3QxZ09kSnRl?=
 =?utf-8?B?YmkrMVl4S003WHo1SWtkVHNqSGNYNlBtTmEwaFFZTjNKbTM0eDIvZUsxWEl4?=
 =?utf-8?B?ZEpOUURYUWhMc0huUld2YjNsK1ZEZXl6aDg1TlRtWVRPaTdFdCtZckV5VzFt?=
 =?utf-8?B?L1NEU1FmT01SZjl1TFBOYWNzazZDRGt0dXNJbFRrcllqU3BvZkNwbEJPWjRs?=
 =?utf-8?B?V3pMWEVjeHVGc0hlajBjZGtmQW9ZenBjb2RtZ0tXMUlJelRkUU5xNkJXV1J0?=
 =?utf-8?B?bXlEc2hmMC9FZncyeE1WandhU2pxeGxxbUk1N3Y2RXNhK2Fhb1M4M1EvME8v?=
 =?utf-8?B?bGJ0WWdVSVozY2lJTDhDeHNkenRHbTFLdlpwZWxoZzdrM3dIdEFaT3JYbEpw?=
 =?utf-8?B?dXVGUmd6bTVudmVLcWZkczd5MG1MMzRiUUF5dFNVVGZpRWJOQmNGM3lyUlJp?=
 =?utf-8?B?cWJaUHMrYk1BSFpuMGVZY1huT21sR2cyUzV5MTJtUVJENUhGa1lGMWZRdGov?=
 =?utf-8?B?YWt5M3V6WkNEbGxXclRicE9CNUZqWUlDemp5b1l1b1l2Um1UaGdpcE5wRXN4?=
 =?utf-8?B?TVkvKzl2eSs1bVJqZXFrNGx0MzFqVTBFSnMyRmZobVhUNk1URG5odHllRFpH?=
 =?utf-8?B?b25janViYXJ0QU95YU5UN05CSk5HRHV0QVlHeSs5S2dGQzlRdkhwQzVNczdu?=
 =?utf-8?B?QlpUSExoUDdxVzg5QnZ4TjU1RzZWRithZzdRM1pVWG9WK0JSME5RVWhwb0Jx?=
 =?utf-8?B?VkFFakgrcHEzcDE2Z3o4ckNQb3cxTHducWFSVEsvU1JLb0JiejNIMDYxTjhq?=
 =?utf-8?B?NHhvVUVnQ1BHdk1GQVZURW12MExkNzVxSVQ3dGhhRGdCbVlnOEJEWmpoeS9w?=
 =?utf-8?Q?UQOsB0nO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b05452a-f56c-4b03-890b-08d8983132cf
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2020 08:47:15.0673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UQZsYomP3kY9wMOcLQe2R5s0vsvZ2923xbObdVwccwdOfh2Ksq8iGCRLvtuoBApZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2452
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 04.12.20 um 09:32 schrieb Thomas Zimmermann:
> Hi
>
> Am 03.12.20 um 21:41 schrieb Daniel Vetter:
>> On Thu, Dec 03, 2020 at 07:59:04PM +0100, Thomas Zimmermann wrote:
>>> Hi
>>>
>>> Am 03.12.20 um 16:26 schrieb Daniel Vetter:
>>>> On Thu, Dec 03, 2020 at 03:02:59PM +0100, Thomas Zimmermann wrote:
>>>>> Dma-buf's vmap and vunmap callbacks are undocumented and various
>>>>> exporters currently have slightly different semantics for them. Add
>>>>> documentation on how to implement and use these interfaces correctly.
>>>>>
>>>>> v2:
>>>>>     * document vmap semantics in struct dma_buf_ops
>>>>>     * add TODO item for reviewing and maybe fixing dma-buf exporters
>>>>>
>>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>>
>>>> I still don't think this works, we're breaking dma_buf_vmap for 
>>>> everyone
>>>> else here.
>>>
>>> I removed the text on the importer. These notes for callers in the 
>>> docs are
>>> more or less a consequence of the exporter semantics.
>>
>> Callers are importers, so I'm not seeing how that fixes anything.
>>
>>> I thought we at least agreed on the exporter semantics in the other 
>>> thread,
>>> didn't we?
>>>
>>> What I'm trying to do is to write dome some rules for exporters, 
>>> even if not
>>> all exporters follow them.
>>
>> This is a standard interface, everyone needs to follow the same 
>> rules. And
>> if they change, we need to make sure nothing breaks and we're not 
>> creating
>> issues.
>>
>> In the past the rule was the dma_buf_vmap was allowed to take the
>> dma_resv_lock, and that the buffer should be pinned. Now some ttm 
>> drivers
>> didn't ever bother with the pinning, and mostly got away with that 
>> because
>> drm_prime helpers do the pinning by default at attach time, and most 
>> users
>> do call dma_buf_attach.
>>
>> But if you look through dma-buf docs nothing ever said you have to do a
>> dummy attachment before you call dma_buf_vmap, that's just slightly 
>> crappy
>> implementations that didn't blow up yet.
>
> I had a patch for adding pin to radeon's implementation of vmap. [1] 
> Christian told me to not do this; instead just get the lock in the 
> fbdev code. His advise almost seems the opposite of what you're 
> telling me here.

I think what Daniel suggests here is that we need to smoothly transition 
the code from making assumptions to having a straight interface where 
importers explicitly say when stuff is locked and when stuff is pinned.

I've started this with the attach interface by adding a new dynamic 
approach to that, but you probably need to carry on here with that for 
vmap as well.

When that is done we can migrate every exporter over to the new dynamic 
approach.

>
> For the GEM VRAM helpers, that implicit pin in vmap gave me headaches. 
> Because scanouts can only be done from VRAM, which is badly suited for 
> exporting. So I ended up with an implicit pin that pins the buffer to 
> whatever domain it currently is. I got away with it because GEM VRAM 
> BOs are not sharable among devices; fbdev is the only user of that 
> functionality and only pins for short periods of time.
>
> I suspect that fixing TTM-based drivers by adding an implicit pin 
> would result in a similar situation. Whatever domain it ends up 
> pinning, some functionality might not be compatible with that.

Correct, exactly that's the problem.

>
>>
>>> Given the circumstances, we should leave out this patch from the 
>>> patchset.
>>
>> So the defacto rules are already a big mess, but that's not a good 
>> excuse
>> to make it worse.
>>
>> What I had in mind is that we split dma_buf_vmap up into two variants:
>>
>> - The current one, which should guarantee that the buffer is pinned.
>>    Because that's what all current callers wanted, before the fbdev code
>>    started allowing non-pinned buffers.
>
> Can we add an explicit pin operation to dma_buf_vmap() to enforce the 
> semantics?

At least I would be fine with that. For now amdgpu is the only exporter 
who implements the explicit pin/unpin semantics anyway.

Regards,
Christian.

>
> Best regards
> Thomas
>
> [1] https://patchwork.freedesktop.org/patch/400054/?series=83765&rev=1
>
>>
>> - The new one, which allows vmapping with just dma_resv locked, and 
>> should
>>    have some caching in exporters.
>>
>> Breaking code and then adding todos about that is kinda not so cool
>> approach here imo.
>>
>> Also I guess ttm_bo_vmap should have a check that either the buffer is
>> pinned, or dma_resv_lock is held.
>>
>> Cheers, Daniel
>>
>>
>>
>>>
>>> Best regards
>>> Thomas
>>>
>>>>
>>>>> ---
>>>>>    Documentation/gpu/todo.rst | 15 +++++++++++++
>>>>>    include/drm/drm_gem.h      |  4 ++++
>>>>>    include/linux/dma-buf.h    | 45 
>>>>> ++++++++++++++++++++++++++++++++++++++
>>>>>    3 files changed, 64 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
>>>>> index 009d8e6c7e3c..32bb797a84fc 100644
>>>>> --- a/Documentation/gpu/todo.rst
>>>>> +++ b/Documentation/gpu/todo.rst
>>>>> @@ -505,6 +505,21 @@ Contact: Thomas Zimmermann 
>>>>> <tzimmermann@suse.de>, Christian König, Daniel Vette
>>>>>    Level: Intermediate
>>>>> +Enforce rules for dma-buf vmap and pin ops
>>>>> +------------------------------------------
>>>>> +
>>>>> +Exporter implementations of vmap and pin in struct dma_buf_ops 
>>>>> (and consequently
>>>>> +struct drm_gem_object_funcs) use a variety of locking semantics. 
>>>>> Some rely on
>>>>> +the caller holding the dma-buf's reservation lock, some do their 
>>>>> own locking,
>>>>> +some don't require any locking. VRAM helpers even used to pin as 
>>>>> part of vmap.
>>>>> +
>>>>> +We need to review each exporter and enforce the documented rules.
>>>>> +
>>>>> +Contact: Christian König, Daniel Vetter, Thomas Zimmermann 
>>>>> <tzimmermann@suse.de>
>>>>> +
>>>>> +Level: Advanced
>>>>> +
>>>>> +
>>>>>    Core refactorings
>>>>>    =================
>>>>> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
>>>>> index 5e6daa1c982f..1864c6a721b1 100644
>>>>> --- a/include/drm/drm_gem.h
>>>>> +++ b/include/drm/drm_gem.h
>>>>> @@ -138,6 +138,8 @@ struct drm_gem_object_funcs {
>>>>>         * drm_gem_dmabuf_vmap() helper.
>>>>>         *
>>>>>         * This callback is optional.
>>>>> +     *
>>>>> +     * See also struct dma_buf_ops.vmap
>>>>>         */
>>>>>        int (*vmap)(struct drm_gem_object *obj, struct dma_buf_map 
>>>>> *map);
>>>>> @@ -148,6 +150,8 @@ struct drm_gem_object_funcs {
>>>>>         * drm_gem_dmabuf_vunmap() helper.
>>>>>         *
>>>>>         * This callback is optional.
>>>>> +     *
>>>>> +     * See also struct dma_buf_ops.vunmap
>>>>>         */
>>>>>        void (*vunmap)(struct drm_gem_object *obj, struct 
>>>>> dma_buf_map *map);
>>>>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
>>>>> index cf72699cb2bc..dc81fdc01dda 100644
>>>>> --- a/include/linux/dma-buf.h
>>>>> +++ b/include/linux/dma-buf.h
>>>>> @@ -267,7 +267,52 @@ struct dma_buf_ops {
>>>>>         */
>>>>>        int (*mmap)(struct dma_buf *, struct vm_area_struct *vma);
>>>>> +    /**
>>>>> +     * @vmap:
>>>>
>>>> There's already a @vmap and @vunamp kerneldoc at the top comment, that
>>>> needs to be removed.
>>>> -Daniel
>>>>
>>>>> +     *
>>>>> +     * Returns a virtual address for the buffer.
>>>>> +     *
>>>>> +     * Notes to callers:
>>>>> +     *
>>>>> +     * - Callers must hold the struct dma_buf.resv lock before 
>>>>> calling
>>>>> +     *   this interface.
>>>>> +     *
>>>>> +     * - Callers must provide means to prevent the mappings from 
>>>>> going
>>>>> +     *   stale, such as holding the reservation lock or providing a
>>>>> +     *   move-notify callback to the exporter.
>>>>> +     *
>>>>> +     * Notes to implementors:
>>>>> +     *
>>>>> +     * - Implementations must expect pairs of @vmap and @vunmap 
>>>>> to be
>>>>> +     *   called frequently and should optimize for this case.
>>>>> +     *
>>>>> +     * - Implementations should avoid additional operations, such as
>>>>> +     *   pinning.
>>>>> +     *
>>>>> +     * - Implementations may expect the caller to hold the dma-buf's
>>>>> +     *   reservation lock to protect against concurrent calls and
>>>>> +     *   relocation.
>>>>> +     *
>>>>> +     * - Implementations may provide additional guarantees, such 
>>>>> as working
>>>>> +     *   without holding the reservation lock.
>>>>> +     *
>>>>> +     * This callback is optional.
>>>>> +     *
>>>>> +     * Returns:
>>>>> +     *
>>>>> +     * 0 on success or a negative error code on failure.
>>>>> +     */
>>>>>        int (*vmap)(struct dma_buf *dmabuf, struct dma_buf_map *map);
>>>>> +
>>>>> +    /**
>>>>> +     * @vunmap:
>>>>> +     *
>>>>> +     * Releases the address previously returned by @vmap.
>>>>> +     *
>>>>> +     * This callback is optional.
>>>>> +     *
>>>>> +     * See also @vmap()
>>>>> +     */
>>>>>        void (*vunmap)(struct dma_buf *dmabuf, struct dma_buf_map 
>>>>> *map);
>>>>>    };
>>>>> -- 
>>>>> 2.29.2
>>>>>
>>>>
>>>
>>> -- 
>>> Thomas Zimmermann
>>> Graphics Driver Developer
>>> SUSE Software Solutions Germany GmbH
>>> Maxfeldstr. 5, 90409 Nürnberg, Germany
>>> (HRB 36809, AG Nürnberg)
>>> Geschäftsführer: Felix Imendörffer
>>>
>>
>>
>>
>>
>

