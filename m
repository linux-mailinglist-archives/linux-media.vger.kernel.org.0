Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3037C30041D
	for <lists+linux-media@lfdr.de>; Fri, 22 Jan 2021 14:26:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727816AbhAVNZc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Jan 2021 08:25:32 -0500
Received: from mail-eopbgr750088.outbound.protection.outlook.com ([40.107.75.88]:61824
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727038AbhAVNZM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Jan 2021 08:25:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B4+hJaIaazwfLrKpVSCcU4iGIRTEE7XBBpZmc53eXla5QPyUiBI09Jgm6pcjFKIc0SQXlYrtI53bJrkAnfQ/dhfa7ANEkKqFJV2GcRyF8kdd6h3GSB0aQhjJZ69dsQ8vbMs2bTFb/EtRltrWqUfv3OzfMRuegwACVLWK71WSi3L4cjhfpl9joN1EGLY2tF7RtkT/f8VNtH2e7ICVsWP70NHkUWSFasFh7zz1Bn4zPDAzjWKeRuJOwjHkjMSeZYpldgZTqjy2tF0YKfOU8zrsIv1WmYvJR7ffwCXhdF4OufJtPd0+WOoBh2K88Y4MY46w2Rfo8x4KNdvVHttuabyxyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=La5/OZe4irSxE2uwpd7YwtrM5wt76nAV4GfeC6TiIgQ=;
 b=m1M9TZ8ng+QfMzKME0MABMhh380Q6FQkz9lsi8sQYBRsuYpNzKU8zBt6JVp7Jofu2EOG9iAVKVdf6X6RgAhELwR8szlent8ssOqPAbmaVLKoZjMjJ1vARr7eeV+rNMKKEUTzIsWGehDT2+NgjcfsY5eWFcvrCyeobe40pFPNl+oSd/NfmqCqI9TezcEIPAAS+sMpyuO3ZxEpt+bIstBEoHTfG3kzWvNva28gYGblBPvBmGZolB6jPuvKAqO9U8YwY+lS3Dv2AOSdIVbWCQ6AO4rQ37Tbo14d9RZFMWA3O+cPnOE1naop5j4rOsFzu/VBxMEGSGSFeuu5VybDl4MCFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=La5/OZe4irSxE2uwpd7YwtrM5wt76nAV4GfeC6TiIgQ=;
 b=LWHIkl7OAUozl5LgOmqqdncHUyHhWyo3kOEscWriT1Vp3y8KpKSRJtAFGGvlZ+kdCGfp2VRX6+mqavI1BkETK3xdwwNpdWeW4wYYLblu/j5PKytj3X6uvAAUR7sug7p52rsjZGlgWi3/0B30cW8JxwccO9ZjkZ190jpZi1pk9dQ=
Authentication-Results: lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4900.namprd12.prod.outlook.com (2603:10b6:208:1c1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Fri, 22 Jan
 2021 13:24:22 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3784.015; Fri, 22 Jan 2021
 13:24:21 +0000
Subject: Re: [PATCH] RFC: dma-fence: Document recoverable page fault
 implications
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@intel.com>,
        Jerome Glisse <jglisse@redhat.com>,
        Felix Kuehling <felix.kuehling@amd.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>
References: <20210121194056.1734409-1-daniel.vetter@ffwll.ch>
 <38322325-d6c7-cbf9-9361-e2da2fac0451@amd.com>
 <CAKMK7uF4w6igeFv9QmZ69u2J0vC0X2-LJQGervA-XpLmAYEDGg@mail.gmail.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <93b1fa50-d667-dfb8-2fe5-e8163df78432@amd.com>
Date:   Fri, 22 Jan 2021 14:24:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAKMK7uF4w6igeFv9QmZ69u2J0vC0X2-LJQGervA-XpLmAYEDGg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR02CA0133.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::30) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by AM0PR02CA0133.eurprd02.prod.outlook.com (2603:10a6:20b:28c::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11 via Frontend Transport; Fri, 22 Jan 2021 13:24:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5d71799e-d9a1-4d2b-193c-08d8bed9076f
X-MS-TrafficTypeDiagnostic: BL0PR12MB4900:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB49002DD83905EFF9225EC2FB83A09@BL0PR12MB4900.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6TD9j5Y7csdSdoGqjdW2I+NLlfeyTOcpA4lryowOToUYip+xADCfs3hwgXCnLK+osaV7hkoBwKvo8h+M6+0JM+tFbwH8sMzDfiQj3XpNT3YdrzWUMHtYRGFPbr9m3aMI6Qrp8S0ytlG+FjOC1Sy23Q/dYJghIFwd1fJZ+OHep/5eEqXgDGPZV+gDjfhGC1LBMMD70Ub0S+eNSizevwgPlXRpM+16/ac4B36c/4d0MFQ0kfDEZdHY7zNnsMC64hnYyTq7ayCXm7nuV0RZ1G0Qp2UmnPYsOd9cqVgfX55+cGpLmygSka3YcVfKKvWP0ge4ZncqQSCxYmV1Xl+Es2Jlc1jHa/1tH09pVHpSD6svHT1Lp9c1dO9TPlCRnjsMDau0dm49gUQxp8cf8v7F23KN1ztSDChMqYTqkcBwPRHz18zyf84MWoIqoxUrby0obZDfP1Fvvta2l59zCE+PIuUq2wtDw5b60EZPO8TXNBPJmuKcGkJ6nl6SNFhveRuH75+JxZhZukeijXtpdtw/S2QfgKGqQBjKgVG6jzooie788UoVToSDuS74eBLCGu1e/tZw
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(136003)(39860400002)(376002)(396003)(86362001)(6486002)(966005)(6666004)(4326008)(2616005)(8936002)(6916009)(478600001)(16526019)(45080400002)(53546011)(186003)(52116002)(54906003)(5660300002)(2906002)(316002)(36756003)(66946007)(66476007)(31696002)(66574015)(66556008)(83380400001)(8676002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Uk90Z204WVJZTWxyS1pYblUzeEgvVC9LS3dJOGF4VHRNMTMyanFyNEtQOXNU?=
 =?utf-8?B?VjYzN3gvYnhpOHlSTS9YMjUvbXlkQUVwb0Jja080UmlXZkdnVlF6SmFyM3Zz?=
 =?utf-8?B?VUNyTldRN1czMXR3b2JCOUlTajJaZGdGcEZJR25RMUVLYlN3RytXd1hiRUxo?=
 =?utf-8?B?Q1Y3N3MyandvblNsT1hLR3p4Y25ZVHpzTUtiOTFGNGFtd3R4MmVSdW5rKzVS?=
 =?utf-8?B?OUdiY1JScElUbjNXa3o2YnVtRy9vL1BxUm12V01nYkNXRDl1VXF0cUNzWTZl?=
 =?utf-8?B?ZU1QVFAvRlcwODVlVTJIczJvT3FQa3VuL2ovQmZDdlFqSUJncGg2M3k3anN0?=
 =?utf-8?B?MDhIL09XdHNNZlVjYjEwKzZ5RDdqN2NUQXFaaTVGMTJEWk4wQzkyYmlqSXRw?=
 =?utf-8?B?Nm5pQTUzeEFITncrOXVPbEFseHVGRlY1ZVJrdW8wRVp0MlVSMkhsNE13OEtt?=
 =?utf-8?B?WFFyYjN0WitOVFZSKzJDTmxTZWxYd3dFajI0MVJGM0JnbWdJV0FHZjY4K0dQ?=
 =?utf-8?B?NDlnMW5JcE5JWkM0VVBtWjJ6ZDYxQ202QnlqN1lCNmYxb2dOWnV3eXBQbTIy?=
 =?utf-8?B?RktPcUVUalYyZlBJQS84K1ZGaXZ0TDJ4T0RyZnd0ZlhrRHdlaS9VUUp4YWxv?=
 =?utf-8?B?QnZGb0ZIUGlNMjBiRHJyZ21uNVZVbnlFZ2JPQ2tEZXhqdXFKRE1vNmova3ho?=
 =?utf-8?B?SERDR3B1UE5IWU9FMld0ZHd5WUUwYmliUlprdHFvMGFqRlYxdzczWmlORGcz?=
 =?utf-8?B?WE1KZStCUFlJL09SVEtqcWNRYlpKQ2o1OExJVDM2cE1OT0FxUzZROHdJdEx3?=
 =?utf-8?B?MnR0K0p2WUlNc2pZK2ZZS25KdzhYWC9aOFdRUk5aOGxTQVdLZ21TYWJqTEEv?=
 =?utf-8?B?Y3Z0d0dCeXNPcHNFSlo3SHpmb3RxWGlEZHJzU2NVcFI4NkJ3VHZ3dW1DSUtJ?=
 =?utf-8?B?MXlpMHVOOWR5SHhUTGZzZHQ1MndJb1crcTVZQmZ5N20rMmtNUUNWNXFQSFhu?=
 =?utf-8?B?Q3V4bFhrK2dEL3J5YXdLcy9TZVhBUFI4QnVJK0NkaGN2UVBENFdFM1BVUEha?=
 =?utf-8?B?WkkxSnBhSkxJanFKcWJoMnFYd1ZsVXg1R0dWYUk4SjlGc0U3dUhUZUd2Tjgy?=
 =?utf-8?B?ZEluMUJWdkI2a0EvTHFsVUsvMXlrdTlGdHJ2N3V6aUFqc2VFNjJHbmJ1UkNC?=
 =?utf-8?B?eG1MN0h6N1BEbE50Y0ZDeW1MZmJuUStOL2pacndyUm9TQkNIbm9PUzhIMFp5?=
 =?utf-8?B?enRBdlhjV2xUNVJoUkNzeS8vOVRvQXIwU2xyWlF4YnlKUmxuQ3hCZEJOVWNK?=
 =?utf-8?B?VGNHaXZmZkNSK1MxZDVUVUM3cGhJc1F3YUdRdHdDWGtCOWp1bmdXUndmQ1Nk?=
 =?utf-8?B?dDJsYnZQREkvRlNpa1lCT1Z2U1NLdUZSY2xiQlRzTjdIK2h4Tk0rTHNtQlor?=
 =?utf-8?B?Z05CL2lHWWhRWHl6M0RUZXpBeCtGVzZIV3ZMcnNLaDd2VTc4RUNUUklXL1pG?=
 =?utf-8?Q?07DglOnDrDfMjOYmElz4em889Vq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d71799e-d9a1-4d2b-193c-08d8bed9076f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2021 13:24:21.7525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NbEyg16lYNpEOmZk+6nXMsIxL3TzQn7xsMsyYO25rrXLhvYPlJ3GZxjTZPIoTeiI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4900
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 22.01.21 um 14:18 schrieb Daniel Vetter:
> On Fri, Jan 22, 2021 at 2:10 PM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 21.01.21 um 20:40 schrieb Daniel Vetter:
>>> Recently there was a fairly long thread about recoreable hardware page
>>> faults, how they can deadlock, and what to do about that.
>>>
>>> While the discussion is still fresh I figured good time to try and
>>> document the conclusions a bit.
>>>
>>> References: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fdri-devel%2F20210107030127.20393-1-Felix.Kuehling%40amd.com%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C25c2b659bc8f47e0bace08d8bed83728%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637469183153437091%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=GlEKsPLRRRO%2BI1JSDpvNeBFbnFacmymxkj8e7QqM5SA%3D&amp;reserved=0
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

One more comment here: You should probably mention that gfx10 is 
referring to AMD GPUs.

>>> support page faults in upstream. So anything I missed, got wrong or
>>> like that would be good.
>>> -Daniel
>>> ---
>>>    Documentation/driver-api/dma-buf.rst | 66 ++++++++++++++++++++++++++++
>>>    1 file changed, 66 insertions(+)
>>>
>>> diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-api/dma-buf.rst
>>> index a2133d69872c..e924c1e4f7a3 100644
>>> --- a/Documentation/driver-api/dma-buf.rst
>>> +++ b/Documentation/driver-api/dma-buf.rst
>>> @@ -257,3 +257,69 @@ fences in the kernel. This means:
>>>      userspace is allowed to use userspace fencing or long running compute
>>>      workloads. This also means no implicit fencing for shared buffers in these
>>>      cases.
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
>> Up till here it makes perfect sense, but what should this paragraph mean ?
> Instead of reserving a few CU at driver load, to guarantee that
> dma-fence workloads can always complete, we only do the reservatation
> while a problematic dma_fence is in the system, and note yet
> signalled. Of course that approach needs to be very careful, to really
> make sure you can't ever deadlock by accident because the dynamic
> reservation at runtime was done a notch too late.
>
> This allows us to use all CUs on pure compute workloads (on servers,
> and on desktop as long as nothing gets rendered).
>
> If that clicks, got ideas for how to improve the text?

Yeah, that makes much more sense.

But if I'm not totally mistaken AMD GPUs can't change the CU config on 
the fly.

I mean you could be in the middle of a compute calculation on the CU 
when a 3d job comes in.

So from my perspective I think we could just drop that.

>>> +- As a last resort, if the hardware provides no useful reservation mechanics,
>>> +  all workloads must be flushed from the GPU when switching between jobs
>>> +  requiring DMA fences or jobs requiring page fault handling: This means all DMA
>>> +  fences must complete before a compute job with page fault handling can be
>>> +  inserted into the scheduler queue. And vice versa, before a DMA fence can be
>>> +  made visible anywhere in the system, all compute workloads must be preempted
>>> +  to guarantee all pending GPU page faults are flushed.
>>> +
>>> +Note that workloads that run on independent hardware like copy engines or other
>>> +GPUs do not have any impact. This allows us to keep using DMA fences internally
>>> +in the kernel even for resolving hardware page faults, e.g. by using copy
>>> +engines to clear or copy memory needed to resolve the page fault.
>>> +
>>> +In some ways this page fault problem is a special case of the `Infinite DMA
>>> +Fences` discussions: Infinite fences from compute workloads are allowed to
>>> +depend on DMA fences, but not the other way around. And not even the page fault
>>> +problem is new, because some other CPU thread in userspace might
>>> +hit a page fault which holds up a userspace fence - supporting page faults on
>>> +GPUs doesn't anything fundamentally new.
>> Maybe worth noting that it just doesn't work with the implicit
>> synchronization we have for existing userspace.
> At the very beginning I covered that already with ".... they cannot
> benefit from recoverable page faults." Should I hammer that home more
> that with implicit sync, it's really not going to happen? The thing
> is, this is just a special case from dma_fence sync, and we also have
> some protocols (I think only android) which use sync_file for that,
> and that also is not going to work. I guess we could do the same trick
> as with timeline fence objects for waiting for the actual dma_fence to
> materialize there. But given how much trouble rolling out timeline
> syncobj was I don't think that'll happen. So maybe just specifically
> include implicitly synced protocols?

A one line reference to the stuff above should be enough.

Alternatively merge this into the stuff above as well.

Regards,
Christian.

> -Daniel

