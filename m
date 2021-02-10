Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED3B5316ED2
	for <lists+linux-media@lfdr.de>; Wed, 10 Feb 2021 19:37:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234266AbhBJSgJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Feb 2021 13:36:09 -0500
Received: from mail-bn7nam10on2082.outbound.protection.outlook.com ([40.107.92.82]:45313
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234417AbhBJSdz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Feb 2021 13:33:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U0pkMxWR8Gw/uchjrJ2VdcSoJkfm3FBil4Xz2obBQRoWpZORPr5MF6IOjrSg58o9XRIxBX1R6C5HfIBzaINaG4NtIL4kld/QLBmAGqpZi50Q6UqwXSZh3Pwd8aTSgE0fj+a/LRaVtEFqtzwt9WOwOqUeXPFMzIVePBOMtAAliMvXu9AaMZE/7AQ/lXYUz/3XyrhiLdRQRAUfOBD9hxP7/u8YXOd8m6LVdIRrzQgFg3kfkZCY9+sIRl8a+CFiw3ykCtnACFfLFy8sHD3lxwg9+nZyPooA5xn4dih5iQU+EOz0MBG4WrOZkod/aqFjPH7ZFnkaPLiVV017rk0ENZ+qyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fMHIhMx+Sdpi6s8Ayg75PiGK3mpumtwYVDELYmx0Y4k=;
 b=IRJL9vAKih3hQwl7iIiv5j5LgNWRw1keLy7UpJYOM4MZ8n7b/JCuwu7ib55cSZZj2j9PfnUHiKBCP+HXFxq+0l7IRQLSiIVgI2v9PsbEpd8kGVSb9FL8I/lzRtdMgCDV8khj5kK2az1fMiXrSDNvW470M9DXVngw6IfaNna2q4L1Xl8mkNcrxsaZ7nM5SXHfCOBoC/yoFuPeLmE6O/dew2HPj2fP2G+VJRjkEVoWD28NdmIJcXFb9wH1Z/kcf+piZ1pIrIhAFnUOEygMPwAGInaeZHKsuXk0JJ41EukqXBtVWQyoENHaUWRbCsfFVcHAGyNIxY2H6IycuuTv0MEimQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fMHIhMx+Sdpi6s8Ayg75PiGK3mpumtwYVDELYmx0Y4k=;
 b=sz2k7x9gTkho7a7Engc8AUiQpadCj/tpwqmLk86ewPUC5VbmLnjADALpjrg+3v/Bb9IjiIAdrjyrhwtZJT9kQeH5HJF/zxWzhp0NM8CcFHAA4vVEsBESk91MuOqMhU9F+yMhsvmIkx3wpencb04YnNaczgxC4ERrG8yI7wiZoCw=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4566.namprd12.prod.outlook.com (2603:10b6:208:26a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Wed, 10 Feb
 2021 18:32:56 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3846.027; Wed, 10 Feb 2021
 18:32:56 +0000
Subject: Re: [RFC][PATCH v6 1/7] drm: Add a sharable drm page-pool
 implementation
To:     Suren Baghdasaryan <surenb@google.com>,
        John Stultz <john.stultz@linaro.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Hridya Valsaraju <hridya@google.com>,
        Sandeep Patil <sspatil@google.com>,
        Daniel Mentz <danielmentz@google.com>,
        =?UTF-8?Q?=c3=98rjan_Eide?= <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Simon Ser <contact@emersion.fr>,
        James Jones <jajones@nvidia.com>,
        linux-media <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>
References: <20210205080621.3102035-1-john.stultz@linaro.org>
 <20210205080621.3102035-2-john.stultz@linaro.org>
 <4471b3b0-603e-6dbb-8064-ff4a95afbba9@amd.com>
 <CALAqxLWZkUFvJX5r2OU2erW4tU3j=+u==VTyzYkt+95LwwVCUA@mail.gmail.com>
 <48225879-2fe1-22ac-daae-c61d52465aea@amd.com>
 <a9dd7f8a-ef30-9eb4-4834-37801d43b96f@amd.com>
 <CAJuCfpE-T4Cs_h6LfrgHE+T_iOVywU2oNzLquYETudOaBMauMQ@mail.gmail.com>
 <c7df099f-27f7-adc6-4e87-9903ac00cbea@amd.com>
 <CAKMK7uFu27RRpwPdNFuhd-Y5R8XiCNosET9BYtCnr3u30UDs0g@mail.gmail.com>
 <CAJuCfpF2Q1qVkv75czc2AFRrp25eNz7hqmeO9Wx8e5VY7PvyJw@mail.gmail.com>
 <YCPaZc0+F+5C7FG4@phenom.ffwll.local>
 <CAJuCfpG+nOwZJcJAXuvv=P=17vWdw2AFT7+WHfpwfmjAfefM2g@mail.gmail.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d085aaf7-8414-3efa-404b-1595abfb6da7@amd.com>
Date:   Wed, 10 Feb 2021 19:32:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAJuCfpG+nOwZJcJAXuvv=P=17vWdw2AFT7+WHfpwfmjAfefM2g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:78b9:aa01:2f51:becf]
X-ClientProxiedBy: AM3PR03CA0075.eurprd03.prod.outlook.com
 (2603:10a6:207:5::33) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:78b9:aa01:2f51:becf] (2a02:908:1252:fb60:78b9:aa01:2f51:becf) by AM3PR03CA0075.eurprd03.prod.outlook.com (2603:10a6:207:5::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25 via Frontend Transport; Wed, 10 Feb 2021 18:32:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3d8c909c-4afc-4427-3159-08d8cdf24890
X-MS-TrafficTypeDiagnostic: MN2PR12MB4566:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4566688C1C1BE7B7F9064E37838D9@MN2PR12MB4566.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nu4DSIZcR54MUd8UCkR2vU56NLqIvj6Anm1SLIzCfLrw2DQqW6e7o+l7md76XHUIbK7Y8ySHECfcfHiNX+APGPkxDN0ZDVM5aMOmGTawp5wcnXMS13zbBBxABfZmVCW29r3/i72VAAVAHdZXTcY8ib5+XZWLnIJZmckyr121YmkYxh2l+A3vNiLcQaLSUSi9o53CpvevDHu2P5kCFQc/jhZk9dg1dDgJDj+6WQyhw667k2TJWfxHPWQ/U62GJV5Fd9oFwhJsNSuwNaV+MowFRkyKiQ7tQoCdcdFOXMutYSPFeoS3j/TggsVGm3z7BrwULNOscNdYfKui67/J0SUb6QdB6au4fxzKd4iuhD132GvwmQWZjRWb0qDZt/18qVxCaX7QF/QQtrFq+3tYSSQeFs3segnP66Vd0NdGDHEppBUBQow8AsFT0oLx/Oll56slXQjwoehBXFiJAiZFgJeyvaEUasLQ76dCA78dp6tPzX8WZ4CcwJKfXztBzFKVKmb3H23niTWNufgs8BYdT1jkSN83BLTKW+On4ju9ZzuJPjOOC0gOoIAcLYgJMor0XADke0JSwMIIIJui2rPtGYw35Nia6xmviHaZp44v2cpP/OE9kIRHWUNZcWUdLSkQyXBRTP8EijdEmAXPTJbPxOi/obKQUbIDGxquMYVR/2XoIptLtuAqQoKw9QnD1nc+pJeDrPhmrDxTLRqUnQdYdnd0W3b7oxLDWBt9ZFayuVH3Bks=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(136003)(396003)(346002)(366004)(2906002)(7416002)(36756003)(86362001)(6486002)(6666004)(31696002)(2616005)(53546011)(186003)(16526019)(83380400001)(66574015)(52116002)(921005)(83080400002)(5660300002)(4326008)(478600001)(110136005)(45080400002)(316002)(966005)(8676002)(8936002)(66476007)(66946007)(31686004)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RXJiaWZ0ZDVLZ01rOVdpdlVyalJNUDVIVzBxd1Q1dlF6QThHM1JYblFBN0cw?=
 =?utf-8?B?Y1RTcm1sbWgzQndpRkhRZ00xa3Jic3VVTDREK2krdGZOdG1xbjV3Z3VWY2Zk?=
 =?utf-8?B?Q0ZmWUw0T0hjWmVtaXZhWUcwcmYwYzNXWjVNQ2ViVjZOYmY0L1hNVERFdWc2?=
 =?utf-8?B?aExkdUdQSVFseFJ1MzgrS2N0Vk05RDVSU3NPMGdMc2o2UVBtVHNod1pud0hS?=
 =?utf-8?B?UFV1T2J3WFcyNU9mOWYvMlp5dWtaS3c5Zm1MSFk5RWxLbzU4Vy9DZVdGb0RD?=
 =?utf-8?B?dVFnZ2ZyZFNEblRWOU13TGFLMzRqSW5SMzN2VWlRSkhnZWhOR1QxeEEySFFZ?=
 =?utf-8?B?S29tWlRYNi9jNzAzakdGYWl2dVV5blVINkhyTFN1clZHWGg0WlhpNjFRcHBl?=
 =?utf-8?B?aWhqNlh4VlJnSXZraExkUjl6OHBFQXE1SHVleEgwdXlTWmdLNklCeFZ1MENw?=
 =?utf-8?B?NnhOUmFlaktnT3gvdXV6TkZkdFpUNjBmS2xuLytiUHRUYU5VMnNmelRPb2du?=
 =?utf-8?B?bkowWnVFZDJWQU1OWm01YStqWGlab2dGblFmdk4rR2JGQit6cWd1S1h6UWFj?=
 =?utf-8?B?MTgxb0Vya2RvakN3cU1XclJ1NURWQkN1czB3WVVkK3dySWxHNVZrZ3NSK2lY?=
 =?utf-8?B?T0NjMzNDMVVENTE1NnpYaDhrWDNoeUl6MWtDaWFzNXBNaS9uZU01U21QUnJM?=
 =?utf-8?B?ZzRpR2RIbUUyRDVkWWFZMnpjbVBtM0xGQkhlSjN5RERvSXd1NFJtSk5KM0dU?=
 =?utf-8?B?bC9kazZtd3FkS2E2WElRSGtSbnViUURFOWQwSDhXY2xpZEhjaGtxeXhDSkJU?=
 =?utf-8?B?UVF3ek15QmlQYzc4MzFmcXMyK2NWRE9INFMrMTEyQzR1U3U3a3pFNWlkSE9Q?=
 =?utf-8?B?VE1qTlpvcVpMc1J0QkE1WG9obzdxKzl0a3U5NmYzTXdQalhBaXJSK2FpMkJ6?=
 =?utf-8?B?ZE9YTmc4YmdVMEFQOTVCNm9uOEo1WllvcTdUOXY1WjBDNjNuVld4SklMOGZT?=
 =?utf-8?B?TmVkK1lucjQ5YktqWDUxVTJtV2dNNHJWeWdObXFidGhJWXZzSSszd1NRalpW?=
 =?utf-8?B?SnZWeUkvV3F4QlVnNm8ybWVXYU0rbVVyandVVi9YZE0weVJMMFM5cS9jdTdZ?=
 =?utf-8?B?c295Wko5YWJtYzZOTXE1amwzZFgwSElHK1R5WnhJeUJuSUMwM3BVMDVYZDVK?=
 =?utf-8?B?VWltM1d0ODFqVHp4VjhrK0pVc0dTZEpLNnVrYVE2Q1c3cGp6aWNQZjJJQnZU?=
 =?utf-8?B?VHJFdkN6UncyZEptVVhnaWNtMm5hTUc2NFl5MTF5bGNVZm1MZDRIcndoQjU0?=
 =?utf-8?B?dmhleVNHWmdZZ3pUSVo4bEVFbG50VWFIRTlNRE5hL0pja2Y2Z3NhSTFIRjRo?=
 =?utf-8?B?clhBM3E1a1JZR3BuR1JVS1g0aURVenZJVnQxVEFtY0xXcER6dzkxdHVla2lF?=
 =?utf-8?B?d2dzZDBEdTUwM3ZOa1dVUHhRQWIrczNhUmhiY2hVQlhVQmxpYkduRDZSNXhV?=
 =?utf-8?B?MVNlelJ0YktqakNsd0FYeGppVDdqY2xGMU5lZXc1c1E4TDFDT3lZRDFwSW5V?=
 =?utf-8?B?cm9LcGNpSE1lTXVrdVV1d0VHcmV3d2cxUDZOdEVMWHRPYXNWQXlOMWxMZ1Y3?=
 =?utf-8?B?WWt0YUtlRzhTY3lLQ1hmS1F0YXFXK1RaTWNoUS9ueWlMeTkzOHVsdUpldXV1?=
 =?utf-8?B?S1ZQS1MxRzhqdkt3Z0gwRUprbDJ2WjJKMmsxeUdBaCthRkljZVdOK0FjcEJD?=
 =?utf-8?B?dEoxUHJKeG8vMGNIdUY4Uy9oOVVpTGNwdnNzS3pMSkNrd21GWEZJY0prNGZY?=
 =?utf-8?B?TzUra3hxQTlseTc4ZmM2eGQzbStkK2RWbGdqMUVlOW5YQXUvb3RtUlgxb1My?=
 =?utf-8?Q?U2Nzr+aCQJjKC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d8c909c-4afc-4427-3159-08d8cdf24890
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2021 18:32:55.9052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JNYzjAq3GS45SroBTeOIUapBX2nsIvrq7dm4hTjvp75/A6wQiT7hv6jy0MDKHFR7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4566
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



Am 10.02.21 um 17:39 schrieb Suren Baghdasaryan:
> On Wed, Feb 10, 2021 at 5:06 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>> On Tue, Feb 09, 2021 at 12:16:51PM -0800, Suren Baghdasaryan wrote:
>>> On Tue, Feb 9, 2021 at 12:03 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>>>> On Tue, Feb 9, 2021 at 6:46 PM Christian König <christian.koenig@amd.com> wrote:
>>>>>
>>>>>
>>>>> Am 09.02.21 um 18:33 schrieb Suren Baghdasaryan:
>>>>>> On Tue, Feb 9, 2021 at 4:57 AM Christian König <christian.koenig@amd.com> wrote:
>>>>>>> Am 09.02.21 um 13:11 schrieb Christian König:
>>>>>>>> [SNIP]
>>>>>>>>>>> +void drm_page_pool_add(struct drm_page_pool *pool, struct page *page)
>>>>>>>>>>> +{
>>>>>>>>>>> +     spin_lock(&pool->lock);
>>>>>>>>>>> +     list_add_tail(&page->lru, &pool->items);
>>>>>>>>>>> +     pool->count++;
>>>>>>>>>>> +     atomic_long_add(1 << pool->order, &total_pages);
>>>>>>>>>>> +     spin_unlock(&pool->lock);
>>>>>>>>>>> +
>>>>>>>>>>> +     mod_node_page_state(page_pgdat(page),
>>>>>>>>>>> NR_KERNEL_MISC_RECLAIMABLE,
>>>>>>>>>>> +                         1 << pool->order);
>>>>>>>>>> Hui what? What should that be good for?
>>>>>>>>> This is a carryover from the ION page pool implementation:
>>>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2Ftree%2Fdrivers%2Fstaging%2Fandroid%2Fion%2Fion_page_pool.c%3Fh%3Dv5.10%23n28&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Cbb7155447ee149a49f3a08d8cde2685d%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637485719618339413%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=IYsJoAd7SUo12V7tS3CCRqNVm569iy%2FtoXQqm2MdC1g%3D&amp;reserved=0
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> My sense is it helps with the vmstat/meminfo accounting so folks can
>>>>>>>>> see the cached pages are shrinkable/freeable. This maybe falls under
>>>>>>>>> other dmabuf accounting/stats discussions, so I'm happy to remove it
>>>>>>>>> for now, or let the drivers using the shared page pool logic handle
>>>>>>>>> the accounting themselves?
>>>>>>> Intentionally separated the discussion for that here.
>>>>>>>
>>>>>>> As far as I can see this is just bluntly incorrect.
>>>>>>>
>>>>>>> Either the page is reclaimable or it is part of our pool and freeable
>>>>>>> through the shrinker, but never ever both.
>>>>>> IIRC the original motivation for counting ION pooled pages as
>>>>>> reclaimable was to include them into /proc/meminfo's MemAvailable
>>>>>> calculations. NR_KERNEL_MISC_RECLAIMABLE defined as "reclaimable
>>>>>> non-slab kernel pages" seems like a good place to account for them but
>>>>>> I might be wrong.
>>>>> Yeah, that's what I see here as well. But exactly that is utterly nonsense.
>>>>>
>>>>> Those pages are not "free" in the sense that get_free_page could return
>>>>> them directly.
>>>> Well on Android that is kinda true, because Android has it's
>>>> oom-killer (way back it was just a shrinker callback, not sure how it
>>>> works now), which just shot down all the background apps. So at least
>>>> some of that (everything used by background apps) is indeed
>>>> reclaimable on Android.
>>>>
>>>> But that doesn't hold on Linux in general, so we can't really do this
>>>> for common code.
>>>>
>>>> Also I had a long meeting with Suren, John and other googles
>>>> yesterday, and the aim is now to try and support all the Android gpu
>>>> memory accounting needs with cgroups. That should work, and it will
>>>> allow Android to handle all the Android-ism in a clean way in upstream
>>>> code. Or that's at least the plan.
>>>>
>>>> I think the only thing we identified that Android still needs on top
>>>> is the dma-buf sysfs stuff, so that shared buffers (which on Android
>>>> are always dma-buf, and always stay around as dma-buf fd throughout
>>>> their lifetime) can be listed/analyzed with full detail.
>>>>
>>>> But aside from this the plan for all the per-process or per-heap
>>>> account, oom-killer integration and everything else is planned to be
>>>> done with cgroups.
>>> Until cgroups are ready we probably will need to add a sysfs node to
>>> report the total dmabuf pool size and I think that would cover our
>>> current accounting need here.
>>> As I mentioned, not including dmabuf pools into MemAvailable would
>>> affect that stat and I'm wondering if pools should be considered as
>>> part of MemAvailable or not. Since MemAvailable includes SReclaimable
>>> I think it makes sense to include them but maybe there are other
>>> considerations that I'm missing?
>> On Android, yes, on upstream, not so much. Because upstream doesn't have
>> the android low memory killer cleanup up all the apps, so effectively we
>> can't reclaim that memory, and we shouldn't report it as such.
>> -Daniel
> Hmm. Sorry, I fail to see why Android's low memory killer makes a
> difference here. In my mind, the pages in the pools are not used but
> kept there in case heaps need them (maybe that's the part I'm wrong?).
> These pages can be freed by the shrinker if memory pressure rises.

And exactly that's the difference. They *can* be freed is not the same 
thing as they *are* free.

> In that sense I think it's very similar to reclaimable slabs which are
> already accounted as part of MemAvailable. So it seems logical to me
> to include unused pages in the pools here as well. What am I missing?

See the shrinkers are there because you need to do some action before 
you can re-use the memory.

In the case of the TTM/DRM pool for example you need to change the 
caching attributes which might cause sleeping for a TLB flush to finish.

By accounting those pages as free you mess up (for example) the handling 
which makes sure that there are enough emergency reserves. I can only 
strongly recommend to not do that.

What you could do is to add a sysfs interface to expose the different 
shrinkers and the amount of pages in them to userspace. Similar to what 
/proc/slabinfo is doing.

Regards,
Christian.

>
>>>> Android (for now) only needs to account overall gpu
>>>> memory since none of it is swappable on android drivers anyway, plus
>>>> no vram, so not much needed.
>>>>
>>>> Cheers, Daniel
>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>>> In the best case this just messes up the accounting, in the worst case
>>>>>>> it can cause memory corruption.
>>>>>>>
>>>>>>> Christian.
>>>>
>>>> --
>>>> Daniel Vetter
>>>> Software Engineer, Intel Corporation
>>>> https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog.ffwll.ch%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Cbb7155447ee149a49f3a08d8cde2685d%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637485719618349407%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=11ENl28PIoSoUx6FhkEK9u4G6yiLc3YhsYsl1DIzsv8%3D&amp;reserved=0
>> --
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>> https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog.ffwll.ch%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Cbb7155447ee149a49f3a08d8cde2685d%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637485719618349407%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=11ENl28PIoSoUx6FhkEK9u4G6yiLc3YhsYsl1DIzsv8%3D&amp;reserved=0

