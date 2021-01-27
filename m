Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66DE9305B1C
	for <lists+linux-media@lfdr.de>; Wed, 27 Jan 2021 13:21:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343499AbhA0MUL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jan 2021 07:20:11 -0500
Received: from mail-dm6nam12on2047.outbound.protection.outlook.com ([40.107.243.47]:50145
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237728AbhA0MSA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jan 2021 07:18:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gr21VHq2gLulouXdrqg+OmVFKmcOW0SG3U3eFkHQq700VbJyinS8x9CilqDixnlcx+rlfFvAmaWWnJX0GAlv7DS6Qdrl8xS5WXe9Y0GK6nrnHBtFJ+oZ5uFRme0scw9onBJO7hJz6fnlcK+LWQJF8LW/WikDipknBzYaZ8qIMKTF36f3XowcDVWlvQCsVvztpjA6wn0IRhgi3f7P4aOOpRI1pS8/AgiK+YgSO6w38AX7NogsYPmAmlnqkuE4BirCLNeyG7uKSNaq5mKaT1m0VXdvSYJPgOmvdS1RhhoKBIVapT+tY2/UAyeR8KV25RqBJU1VXUWqyiENc3EeeZFDXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CH9EUimzbRVaKuZzPFMKSYS9I4avZ7HOsSUIyEVhu4M=;
 b=YYtK9IQE9OC7eab+TL1/docx7umd35RV6mNzto/ny7enmZ/7LNv+MAuXxneQ7tJAHbfdykcXHA6rGeyU3yt04mF2M6lu5Xe78n9/PA5VduoNSeqaTodHBHlAderd7unjMyCF+hF1KD7EUCBG87N++p+t+2gIF4GlxTVm4rlfBZlmbss23ABTvg4hOKYh4o9slPZRJC+KPum3LHxPencsQiArJKxhMMnqvkFQlFoXmbTZMD1LQOP1GVoWTQd1qnCu9KrzbTys9xYSpiVs1t7HCaFZhNTidw2rA/8+3Swx1md5rOZ51j+PQNNa7aEKuA3JvTrsVKRyLVbXPB9MeEZLtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CH9EUimzbRVaKuZzPFMKSYS9I4avZ7HOsSUIyEVhu4M=;
 b=2pWEx0BgUscDqfJOGUNiK/xptfgAU7vJER1PAkjwYbtbjhC5SoUrg7YGSw0rr9wjDMdzM6mx34u93bPkgUquuBSyGYsXrQww2H1zuWIHSqLT3+0ChP+TK+uTrk9Gb850OECdndKry5xBxjRlj5PPwRNH+0vWYW5CmnIKcJeddEw=
Authentication-Results: lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4095.namprd12.prod.outlook.com (2603:10b6:208:1d1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.15; Wed, 27 Jan
 2021 12:17:06 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3784.019; Wed, 27 Jan 2021
 12:17:06 +0000
Subject: Re: [PATCH] RFC: dma-fence: Document recoverable page fault
 implications
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Felix Kuehling <felix.kuehling@amd.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>
Cc:     =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@intel.com>,
        Jerome Glisse <jglisse@redhat.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20210121194056.1734409-1-daniel.vetter@ffwll.ch>
 <6d373177-2645-1d67-9c14-dcad87c4f4d9@amd.com>
 <68740fcf-530e-b929-1c98-5810fc97ed23@linux.intel.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <1e38efbc-ec52-e436-21e4-49a0d074b57b@amd.com>
Date:   Wed, 27 Jan 2021 13:16:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <68740fcf-530e-b929-1c98-5810fc97ed23@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM4PR0302CA0018.eurprd03.prod.outlook.com
 (2603:10a6:205:2::31) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by AM4PR0302CA0018.eurprd03.prod.outlook.com (2603:10a6:205:2::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend Transport; Wed, 27 Jan 2021 12:17:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 999c0e0f-9f42-4218-6e91-08d8c2bd7678
X-MS-TrafficTypeDiagnostic: MN2PR12MB4095:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB40950AE5A269592419622FC283BB9@MN2PR12MB4095.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dsgsQcJjSvLdb7qX4pcWMz9QsfKjWdQ4gU008H1FKYgZt57h9uX9/iWEJuyquQ8fJeHGhSmB1lPFZFzhMa65JhGvlwTIuTKIUoyfnaqgKqzPFjjK9oi5WY4HgOUqdyNBM+IDSVR3/U+Ohf9e2ZCrzLvwY0XgJ0n4KjVDRwlyX3QGtvGuMZs+18aTVZyV3dSRsg0BUcOpeSUmhvt5nh1KqwKHL+JuP05vvAyAO5KNwbE/P9S4+kG9HWNE+P1NxbbFs3b74HWyP9YHhKRUGgwc5uznhGilQuqIE6vieGMyg2XDahnWrJj/1GL0N7XyfN0V5+FDqUobwdSGGP1jAK9vxkIipRdh50AkTY/toUdFUby0fnS8XaM+CdrfyJAjsHwm0piXm651AjM2L4qR/pBe2aMFTcG614WQMkJ2NKSmpzY9dyBVdKwcUGPXf9ppgGdIoah+5OeGoNWVv6K39zBgzOzsBcNGLlzZ1BaQFA7LlFIlupOUxJDCsqGI+bFUqCX66Y7QVgCye3QcFuA/Lhd0FKEZi9tJsEnxyWw9NIUqK9BIT1oLBwCjCpqxO61X7chXnFQcNU4jaMtw5G0M22XlJ6IbWA5Rnx3hTlYlqyV7GrQNO06tgfN7NudcbFrQ4dXVeEoPeSOx6ydSYviLeUMpVxyvs11Ab5UdkyYjXGP1FbTU3w20r1g3F+AqvjI9d585
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(376002)(396003)(136003)(366004)(8936002)(16526019)(110136005)(6666004)(52116002)(316002)(5660300002)(186003)(45080400002)(2906002)(31686004)(86362001)(31696002)(66574015)(478600001)(54906003)(4326008)(83380400001)(2616005)(66946007)(66476007)(66556008)(6486002)(8676002)(36756003)(966005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZlNxMmRRN0N4RDR1SzFoelh5eWpqTHhYQ3JOWkozc0xWUEQ3YnRLM2ZTVWpU?=
 =?utf-8?B?VzY4dEpuMzNBbnoyMGtTZVU5TXUwZFBKb1lWYVFQbnMzUytmZnZyYVBQRzhU?=
 =?utf-8?B?dU9HTjVyUmdJNTgrWkxaSHZ0bVBaelJGNmRuQy9iZy9XMmphakRQZWUwanp3?=
 =?utf-8?B?SG5wRS8yWE1WeGtOSjhNUFdsK0ZuRWMzLzFPaDl5amhXVzNCMXBjOUF2SC9I?=
 =?utf-8?B?Qmd0VW44QkxMWlhCWk5XRFFxZ2VReGhGOXg1YzY4QW4wMlBXellZK2xLdHE0?=
 =?utf-8?B?Y2g3UlZCWXNxcXFleWRBeTMxelprNG5HU3cySkQvT3VkbExxWVFwQk9RZU92?=
 =?utf-8?B?b0NlWkVISTgxVkMvTFhHUi9rbkkyQ0wzYnVMTzVwZzZHWWZaRGRhcXNLb3k5?=
 =?utf-8?B?RE5iQ24vc1NZNFJ5YjhVV1QzSEY1cWhmUnd4a2prVmVuak5rTE9qVWIxQUg1?=
 =?utf-8?B?SXl1WVNMenRHZjRBeW5WbGVmeTJzOURDSU1pNlpoWnFFeVRURUZjejJqUjJh?=
 =?utf-8?B?Yzh5YXRPYVZwU0pjU0c3Mys1Ly9lYWxmeU8yRmZBNkdVVkdGL0kvcGtzL2VP?=
 =?utf-8?B?NUZxNCtSUzdqampERkc3N0Q1Yzl0ZzFZSmRCaXhHSXlBZkd1Mk9XazVMa3ZW?=
 =?utf-8?B?OTNENzZaOHNERmE2Y2VmWEY1WHVaQThuVTRwRnh1dVNyWHFnY2VIZFdBbi9p?=
 =?utf-8?B?bUJDVVZEalJQeTFqVllkS3BGNndjYlZWczNkM3NVK00yNWJuTWF5dDljMzBo?=
 =?utf-8?B?T2RZdHBaZXptNlJueExtTnA2YTAxS0xuWXNrMjluOXFENTlMNU4yWkk2SVFm?=
 =?utf-8?B?UUlYSi9NczJYVlhLWDFTaDE5ZVpJb2JZeG1HaWVLRXc1UHJHUUhXWUlNWmJF?=
 =?utf-8?B?QTM3Z21JeVR3ZU4rZEF5Skt1V1FDaTNtWDJBZTJOZiswSS8vMlBqNkVhbDg5?=
 =?utf-8?B?WjVPRU9raGdmcDNjVzdUb2N4ZHlkS20vVVFBcWN1djBLMWN3a0tHcmhXeTRC?=
 =?utf-8?B?L3Y1RHp5YklTaFllNHNsRU9QS1lTN2ZjUGtRUVVjNmFiUDkxcUEwM3hJcFYx?=
 =?utf-8?B?SHBKYUpGd1FRRDhRYnFLOThlM2QzaDJ5b1JtOWJ5WmZ3OG1jWW1xdzg3RUlI?=
 =?utf-8?B?UU9yZy9mbldYM21JZWp2TU9MMVN1d1llQnFjSHFhUFEzM3Fka0xBaHA3TU5T?=
 =?utf-8?B?c0dzZjc3dVR0ellvTFVuR2pQK0Y1ZlhiV2VocHNUeWMrbVFldzFXNzV4ZWNv?=
 =?utf-8?B?TTgxa0krRCs5ZjI1Qkd1My9kQ1ljUllIYUZ6V0o0QzRQbUxNTnhKOUh6NWFy?=
 =?utf-8?B?U1RPNEtMNTZYVzJIWS9sRWpwNmZsRjZFVm1oTnJVdDBwQlhFdlVKU0RuMTRl?=
 =?utf-8?B?ajlIN29FWGF6dVQ5bFRlSFduK2xBRUt0MHV4MFhxdW44M1lSOFFISWlaNWMz?=
 =?utf-8?B?V0JhMzFyNVhVeUVMNXFmS1VlODBpdmc3WElMZWhCSGxWa2dDZ2tMdkw0ZGdj?=
 =?utf-8?B?T00zczBWYjhma2dRN002TlZTQk9oQXp2SnVOSG9tMFo4OG9nTlNKUlBJNWVR?=
 =?utf-8?B?eU55UT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 999c0e0f-9f42-4218-6e91-08d8c2bd7678
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 12:17:06.6296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ND7YPA1wrzyQyU1kf6pQxSNV7gZ+wNqnxbY3E6oGBchmgFXPYUEYa+VmeeqA2I5w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4095
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 27.01.21 um 13:11 schrieb Maarten Lankhorst:
> Op 27-01-2021 om 01:22 schreef Felix Kuehling:
>> Am 2021-01-21 um 2:40 p.m. schrieb Daniel Vetter:
>>> Recently there was a fairly long thread about recoreable hardware page
>>> faults, how they can deadlock, and what to do about that.
>>>
>>> While the discussion is still fresh I figured good time to try and
>>> document the conclusions a bit.
>>>
>>> References: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fdri-devel%2F20210107030127.20393-1-Felix.Kuehling%40amd.com%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Cbee0aeff80f440bcc52108d8c2bcc11f%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637473463245588199%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=ncr%2Fqv5lw0ONrYxFvfdcFAXAZ%2BXcJJa6UY%2BxGfcKGVM%3D&amp;reserved=0
>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>> Cc: Thomas Hellström <thomas.hellstrom@intel.com>
>>> Cc: "Christian König" <christian.koenig@amd.com>
>>> Cc: Jerome Glisse <jglisse@redhat.com>
>>> Cc: Felix Kuehling <felix.kuehling@amd.com>
>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
>>> Cc: linux-media@vger.kernel.org
>>> Cc: linaro-mm-sig@lists.linaro.org
>>> --
>>> I'll be away next week, but figured I'll type this up quickly for some
>>> comments and to check whether I got this all roughly right.
>>>
>>> Critique very much wanted on this, so that we can make sure hw which
>>> can't preempt (with pagefaults pending) like gfx10 has a clear path to
>>> support page faults in upstream. So anything I missed, got wrong or
>>> like that would be good.
>>> -Daniel
>>> ---
>>>   Documentation/driver-api/dma-buf.rst | 66 ++++++++++++++++++++++++++++
>>>   1 file changed, 66 insertions(+)
>>>
>>> diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-api/dma-buf.rst
>>> index a2133d69872c..e924c1e4f7a3 100644
>>> --- a/Documentation/driver-api/dma-buf.rst
>>> +++ b/Documentation/driver-api/dma-buf.rst
>>> @@ -257,3 +257,69 @@ fences in the kernel. This means:
>>>     userspace is allowed to use userspace fencing or long running compute
>>>     workloads. This also means no implicit fencing for shared buffers in these
>>>     cases.
>>> +
>>> +Recoverable Hardware Page Faults Implications
>>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>> +
>>> +Modern hardware supports recoverable page faults, which has a lot of
>>> +implications for DMA fences.
>>> +
>>> +First, a pending page fault obviously holds up the work that's running on the
>>> +accelerator and a memory allocation is usually required to resolve the fault.
>>> +But memory allocations are not allowed to gate completion of DMA fences, which
>>> +means any workload using recoverable page faults cannot use DMA fences for
>>> +synchronization. Synchronization fences controlled by userspace must be used
>>> +instead.
>>> +
>>> +On GPUs this poses a problem, because current desktop compositor protocols on
>>> +Linus rely on DMA fences, which means without an entirely new userspace stack
>>> +built on top of userspace fences, they cannot benefit from recoverable page
>>> +faults. The exception is when page faults are only used as migration hints and
>>> +never to on-demand fill a memory request. For now this means recoverable page
>>> +faults on GPUs are limited to pure compute workloads.
>>> +
>>> +Furthermore GPUs usually have shared resources between the 3D rendering and
>>> +compute side, like compute units or command submission engines. If both a 3D
>>> +job with a DMA fence and a compute workload using recoverable page faults are
>>> +pending they could deadlock:
>>> +
>>> +- The 3D workload might need to wait for the compute job to finish and release
>>> +  hardware resources first.
>>> +
>>> +- The compute workload might be stuck in a page fault, because the memory
>>> +  allocation is waiting for the DMA fence of the 3D workload to complete.
>>> +
>>> +There are a few ways to prevent this problem:
>>> +
>>> +- Compute workloads can always be preempted, even when a page fault is pending
>>> +  and not yet repaired. Not all hardware supports this.
>>> +
>>> +- DMA fence workloads and workloads which need page fault handling have
>>> +  independent hardware resources to guarantee forward progress. This could be
>>> +  achieved through e.g. through dedicated engines and minimal compute unit
>>> +  reservations for DMA fence workloads.
>>> +
>>> +- The reservation approach could be further refined by only reserving the
>>> +  hardware resources for DMA fence workloads when they are in-flight. This must
>>> +  cover the time from when the DMA fence is visible to other threads up to
>>> +  moment when fence is completed through dma_fence_signal().
>>> +
>>> +- As a last resort, if the hardware provides no useful reservation mechanics,
>>> +  all workloads must be flushed from the GPU when switching between jobs
>>> +  requiring DMA fences or jobs requiring page fault handling: This means all DMA
>>> +  fences must complete before a compute job with page fault handling can be
>>> +  inserted into the scheduler queue. And vice versa, before a DMA fence can be
>>> +  made visible anywhere in the system, all compute workloads must be preempted
>>> +  to guarantee all pending GPU page faults are flushed.
>> I thought of another possible workaround:
>>
>>    * Partition the memory. Servicing of page faults will use a separate
>>      memory pool that can always be allocated from without waiting for
>>      fences. This includes memory for page tables and memory for
>>      migrating data to. You may steal memory from other processes that
>>      can page fault, so no fence waiting is necessary. Being able to
>>      steal memory at any time also means there are basically no
>>      out-of-memory situations you need to worry about. Even page tables
>>      (except the root page directory of each process) can be stolen in
>>      the worst case.
> I think 'overcommit' would be a nice way to describe this. But I'm not
> sure how easy this is to implement in practice. You would basically need
> to create your own memory manager for this.

Well you would need a completely separate pool for both device as well 
as system memory.

E.g. on boot we say we steal X GB system memory only for HMM.

> But from a design point of view, definitely a valid solution.

I think the restriction above makes it pretty much unusable.

> But this looks good, those solutions are definitely the valid options we
> can choose from.

It's certainly worth noting, yes. And just to make sure that nobody has 
the idea to reserve only device memory.

Christian.

>
> ~Maarten
>

