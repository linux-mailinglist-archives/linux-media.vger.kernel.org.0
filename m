Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F03F307A13
	for <lists+linux-media@lfdr.de>; Thu, 28 Jan 2021 16:52:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231210AbhA1Pwe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jan 2021 10:52:34 -0500
Received: from mail-dm6nam12on2067.outbound.protection.outlook.com ([40.107.243.67]:50593
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231204AbhA1Pwc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jan 2021 10:52:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EnNDrftnqM8q+b/SIjNvsyXzpNoDB/sEe+Ctd31rSKSSdOpAAwjB6bWKuI5hzIKgQInPLI9ZK873pooaKAVaHVUW87TnyVARKfNM+1csBo0pXVYEtVa7l00WMoOpbvRQC7OuiwqchB9c95CPgo8qU3jdvaSBTMRyeVDL8ObKiPpDnL770xGFXGEnPxrPlvsy9nrjPC+pdi/G/b0SlkObPlkuj9kp9LeDFf7rlhOB0ZlzdZ47UuziQJoPL903k87mMHGdQmeiwu7mxiyqssV7OJXlSIEtxRXCuTbaU4mC0Zw2nXnYGKB+FzwjWc1uFiGTxi8HozmTTD8R8rYit6BQ6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6YGUdpB46iYQO/O9eu++i+D7oar6n4WR1pI/yUXhcw0=;
 b=nwAV5Exeo6vqXsapxKBoyzcLwXvuhE6z1RW7/g/KR6kBA5eme/4fCqHVOhT838kTbz3ioo8s0K4ucOQpMxBVBHEZqsxSHcw7sTrw36jXJvgrQ3xcUSS1mTANDEMHZmU96bHBHou7ydyplLyQlkLn3ArB1b+NjCh3DCIUuKzCN8iMTrKgM9CmRNsnSlKPDekywMjGxfKISny0bbI3jIyobDyWcTVzdTty+76g7efgp18Pkw/TBaeo/r7hj0/6AQkrabVUGjEJAofl0oqPCnPUb+7iKOq+dimD4l264ac4QGZ9/P/XntBerOFn0FDDZc2cBHT2OJ0AOJVV2cfJI+Y9+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6YGUdpB46iYQO/O9eu++i+D7oar6n4WR1pI/yUXhcw0=;
 b=x2G2I0ad//xZrFGJ8v6iwEzFiC3uQPOOQvg+a1chYUDvEwA9XV9nj2o978KQjNbzQ7nj443unbVqi+SswszhzLxutzJYRspAZRH4rgusiOexJno21iI3P8R9V2CABDLtSVP6gzHTwFK7Lid9bI7bXLOt3ufGUw+yxCvrNwltb1U=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4357.namprd12.prod.outlook.com (2603:10b6:208:262::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Thu, 28 Jan
 2021 15:47:03 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3784.019; Thu, 28 Jan 2021
 15:47:03 +0000
Subject: Re: [Linaro-mm-sig] [PATCH] RFC: dma-fence: Document recoverable page
 fault implications
To:     Felix Kuehling <felix.kuehling@amd.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>
Cc:     linaro-mm-sig@lists.linaro.org, Jerome Glisse <jglisse@redhat.com>,
        =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@intel.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        linux-media@vger.kernel.org
References: <20210121194056.1734409-1-daniel.vetter@ffwll.ch>
 <6d373177-2645-1d67-9c14-dcad87c4f4d9@amd.com>
 <68740fcf-530e-b929-1c98-5810fc97ed23@linux.intel.com>
 <1e38efbc-ec52-e436-21e4-49a0d074b57b@amd.com>
 <18e7efbd-3d10-5ad1-49c9-7e26f0a27ef2@amd.com>
 <c9c8d386-87a1-6678-b5c6-854de210d8d3@gmail.com>
 <65b7a61c-b4b9-a210-5a37-0f69d01f667c@amd.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d838b9a2-b728-5a69-ee61-1e1ee7cfa714@amd.com>
Date:   Thu, 28 Jan 2021 16:46:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <65b7a61c-b4b9-a210-5a37-0f69d01f667c@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM3PR04CA0144.eurprd04.prod.outlook.com (2603:10a6:207::28)
 To MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by AM3PR04CA0144.eurprd04.prod.outlook.com (2603:10a6:207::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend Transport; Thu, 28 Jan 2021 15:47:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 45d0ccb9-e853-47f4-c44c-08d8c3a3f529
X-MS-TrafficTypeDiagnostic: MN2PR12MB4357:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB43570965518183DC275C891D83BA9@MN2PR12MB4357.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qeoARvnhkew/Mql3yT8WA6X3ku3NdgUyvd/HUNviImUzJ0eLjDjKJpc4OWAqDL9OxwcSHTfRUbdT4Bf0l9GGegw13DanGrMwx1k9g72thHJNslpg7zTdy/EQpzEwWnQyGBNUzcCAUb8Yn8PdvPKA0Nbl+th1YF/FuP+e0hb5cv5ByUPJb1aOWaop6+4Ytvg5pb5g2VvrxJB55b1O7n9zMFQoVPf7kVLo7lHA7+qRcpaDcn7J/0GeEXrvfzifvAA5ebwjBPvm8OxDAI0oOT7Z1B0iVt/NyzRqNGBIEIrrYCfb++6djEcd9svWIOmU36HO7aHZANNFnSmOfIozxwwmYu2U5cCeQTAKy4EiPqO1by/VxLE/9FB4xwIwjvXFnxnTIUjoYc5dlA+k3UZT6cFWb1MKC1tVhHQ5adFANLd8dGEFiSx9P+sTyQf55AgsYbwWzO//V27KCT0jo/azPX7krPrUqSXKCUQBJFKNygpVLrZLSNlOxjWXEH+mZaDlLm6LDxEj8ji4P8lpyOth5q6Y+UPZZWUwlqmS86X2BsHHiYiNrEI4gpGkr+3Nq+Z4XNrABKDgLwwYqmudmx6T5p4foa0IvbBpwHFeFKFkjWNLS11wYeA7Vj0EeV58NDQHL+mSeVuaal4oaJVTDKSEDEPg93mPilL6JKk05cRIJTO6MHVbKZdhj8COH3GoXwOMVsMF
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(366004)(136003)(39860400002)(346002)(2906002)(8676002)(86362001)(30864003)(45080400002)(54906003)(110136005)(4326008)(5660300002)(966005)(31696002)(478600001)(6666004)(52116002)(66574015)(2616005)(316002)(36756003)(6486002)(186003)(16526019)(66556008)(31686004)(8936002)(83380400001)(66476007)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RlYzOFI4WjhKZUF4elJSZUVGK1NpTWc1SUx4aGZDQ3IwYUt3YXVGTWRseVp5?=
 =?utf-8?B?VndkZ3BjN0d3TmxOZWp3MmJTbmtHaW9YbFRNZ2tHYjVWZmtsY1AycTdwcSt6?=
 =?utf-8?B?NlhJQmlwUU13VlJUUlZ5RjV1N2NSeEtDc1c3czZxV2hnN0Q5RGtORXkvbjdO?=
 =?utf-8?B?MTQvSm5UY1VtUmhHbVB4VjFleFVkSDVDOG40Z2VVd1NlcVVld25YU3JQN3E1?=
 =?utf-8?B?VWR3c1BpQTdYckpDa0JyY2lZRi9iTlJtM2lFUlp3TXAvQkdvTzR4VE8yeW40?=
 =?utf-8?B?UXBJNitsM0RFdWZKY3lueHYxQjB0RldmS3l4UkhlY2JIeFJ0WmpKODJVOU9v?=
 =?utf-8?B?NjVBZm9aMkw1MU5mR3RUR1o3NjA5bWlPdXY1OHlWSXlqUWFnNnppN21BLzNC?=
 =?utf-8?B?MXM0TlJyc2JsNGFpUlZTK1hqS0NWVlpiTDZNalRhd3RLRm41Rzl2d0MxK1Ir?=
 =?utf-8?B?WEdHa3VuNjNhcTRHeCtrRjA3NXhxRHZJeFZEbFdZODhuQWVsVllvMWtRYVJE?=
 =?utf-8?B?dVQyRVhsek55NHE0eGJZRk1vRUNLWmVGOS8vbEczMjYyRzYrRFdWQ29PbWMv?=
 =?utf-8?B?UGVidXZnM3dXOFBiQ0xqU1dmWVdRS0NXLzNXUGptQTl5L0RDdzhVYXBZVEQ1?=
 =?utf-8?B?eGxjTXZvUUs1ZHhJRm9ja01ZdlFSVUEzRVF6NXV4VjlIT01TcHZJbmtOS1p3?=
 =?utf-8?B?eUh6Y2s1WHVkYkROMGo5TlJKVVpRNlFOK1ZFVHl4ait0N3YzYUtVdU5MYXg5?=
 =?utf-8?B?SmFMc2JJRzZtcTRJVDVDNXBYR0dNS3FadDRKV01hRHp0R3hDTWxrNGNKY1Q5?=
 =?utf-8?B?VVN0SkZheG9PUXp3TVJ2V0FlN2NFTEdlNXl1cEg2YUpRWWhyUFBjcEdVSE1q?=
 =?utf-8?B?cmU2YjU3eXQzZE80NlkzV1pwQVpYS3VMMGNhL1AwWEhpZ1pjbUlUUm9qOTZZ?=
 =?utf-8?B?eVhBSjByV2prVlhYeGVGaHFKWVV6UGZTZThWWnhxRGEyYWZGYmNDQlN1bjIr?=
 =?utf-8?B?bkVHVFVKZmRqVGZpY0ZOUXZXY2tVLzNGbzI5Z1MrRVpXQUY3MGFVRW03Y3Nq?=
 =?utf-8?B?Tmhab2ZONFNJY3UwVWdQbXBRRkU1eHdUS1N1L2xGak1Sc0c3ZDJQeW96M2pn?=
 =?utf-8?B?cmxlTGlheG9QTDFrQnVOVm55WWcxc3RZbVNwUGJtcjRtTGlhWEdHM2w0bkZ3?=
 =?utf-8?B?VUtGc1lGVG14ajZIVUNpVWM0NVcycDBlWHY2T0pjYlZFWmpsekpLK3ZLVVBF?=
 =?utf-8?B?akRRRFVrOTJScGg4c1hLSU5iYXdmclBGeFJVem90aG5jTG53OEJkMXJaMSt5?=
 =?utf-8?B?K2h2Mk1MRjUvcXlJMXFqSytoaWZKZHF4L0oyREVtWHM1OEJWWnBOYVNzUk90?=
 =?utf-8?B?TlhvZ0JFWStndVpNbGVGTS80UkQ0VURpZm5JSkIzUGl6Z0FCaitMZ1pUb2F3?=
 =?utf-8?B?bGI1aVZjQTFRYUZpSXVidmxHVVFhdXd1eUh2bDlIejN0dEFHOFZRVGtiWU5u?=
 =?utf-8?Q?vbsBvo4hjLaXIq1OA0kjEczxxPo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45d0ccb9-e853-47f4-c44c-08d8c3a3f529
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 15:47:03.8432
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eOvPXibaq2dS2hWW/C5N3NAAsYb3qsnSkQNY4ZmRodGkcqSLsQXTKkTDkXqoR1yf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4357
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 28.01.21 um 16:39 schrieb Felix Kuehling:
> Am 2021-01-28 um 2:39 a.m. schrieb Christian König:
>> Am 27.01.21 um 23:00 schrieb Felix Kuehling:
>>> Am 2021-01-27 um 7:16 a.m. schrieb Christian König:
>>>> Am 27.01.21 um 13:11 schrieb Maarten Lankhorst:
>>>>> Op 27-01-2021 om 01:22 schreef Felix Kuehling:
>>>>>> Am 2021-01-21 um 2:40 p.m. schrieb Daniel Vetter:
>>>>>>> Recently there was a fairly long thread about recoreable hardware
>>>>>>> page
>>>>>>> faults, how they can deadlock, and what to do about that.
>>>>>>>
>>>>>>> While the discussion is still fresh I figured good time to try and
>>>>>>> document the conclusions a bit.
>>>>>>>
>>>>>>> References:
>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fdri-devel%2F20210107030127.20393-1-Felix.Kuehling%40amd.com%2F&amp;data=04%7C01%7Cfelix.kuehling%40amd.com%7C4e4884be55d74c4dda1408d8c35fd0ab%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637474163592260552%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=y2VzC4vbfMi0ctyerAHfqODZ6tthz1FUDwpMCp0PIrQ%3D&amp;reserved=0
>>>>>>>
>>>>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>>>>> Cc: Thomas Hellström <thomas.hellstrom@intel.com>
>>>>>>> Cc: "Christian König" <christian.koenig@amd.com>
>>>>>>> Cc: Jerome Glisse <jglisse@redhat.com>
>>>>>>> Cc: Felix Kuehling <felix.kuehling@amd.com>
>>>>>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>>>>>>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
>>>>>>> Cc: linux-media@vger.kernel.org
>>>>>>> Cc: linaro-mm-sig@lists.linaro.org
>>>>>>> -- 
>>>>>>> I'll be away next week, but figured I'll type this up quickly for
>>>>>>> some
>>>>>>> comments and to check whether I got this all roughly right.
>>>>>>>
>>>>>>> Critique very much wanted on this, so that we can make sure hw which
>>>>>>> can't preempt (with pagefaults pending) like gfx10 has a clear
>>>>>>> path to
>>>>>>> support page faults in upstream. So anything I missed, got wrong or
>>>>>>> like that would be good.
>>>>>>> -Daniel
>>>>>>> ---
>>>>>>>     Documentation/driver-api/dma-buf.rst | 66
>>>>>>> ++++++++++++++++++++++++++++
>>>>>>>     1 file changed, 66 insertions(+)
>>>>>>>
>>>>>>> diff --git a/Documentation/driver-api/dma-buf.rst
>>>>>>> b/Documentation/driver-api/dma-buf.rst
>>>>>>> index a2133d69872c..e924c1e4f7a3 100644
>>>>>>> --- a/Documentation/driver-api/dma-buf.rst
>>>>>>> +++ b/Documentation/driver-api/dma-buf.rst
>>>>>>> @@ -257,3 +257,69 @@ fences in the kernel. This means:
>>>>>>>       userspace is allowed to use userspace fencing or long running
>>>>>>> compute
>>>>>>>       workloads. This also means no implicit fencing for shared
>>>>>>> buffers in these
>>>>>>>       cases.
>>>>>>> +
>>>>>>> +Recoverable Hardware Page Faults Implications
>>>>>>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>>>>> +
>>>>>>> +Modern hardware supports recoverable page faults, which has a
>>>>>>> lot of
>>>>>>> +implications for DMA fences.
>>>>>>> +
>>>>>>> +First, a pending page fault obviously holds up the work that's
>>>>>>> running on the
>>>>>>> +accelerator and a memory allocation is usually required to resolve
>>>>>>> the fault.
>>>>>>> +But memory allocations are not allowed to gate completion of DMA
>>>>>>> fences, which
>>>>>>> +means any workload using recoverable page faults cannot use DMA
>>>>>>> fences for
>>>>>>> +synchronization. Synchronization fences controlled by userspace
>>>>>>> must be used
>>>>>>> +instead.
>>>>>>> +
>>>>>>> +On GPUs this poses a problem, because current desktop compositor
>>>>>>> protocols on
>>>>>>> +Linus rely on DMA fences, which means without an entirely new
>>>>>>> userspace stack
>>>>>>> +built on top of userspace fences, they cannot benefit from
>>>>>>> recoverable page
>>>>>>> +faults. The exception is when page faults are only used as
>>>>>>> migration hints and
>>>>>>> +never to on-demand fill a memory request. For now this means
>>>>>>> recoverable page
>>>>>>> +faults on GPUs are limited to pure compute workloads.
>>>>>>> +
>>>>>>> +Furthermore GPUs usually have shared resources between the 3D
>>>>>>> rendering and
>>>>>>> +compute side, like compute units or command submission engines. If
>>>>>>> both a 3D
>>>>>>> +job with a DMA fence and a compute workload using recoverable page
>>>>>>> faults are
>>>>>>> +pending they could deadlock:
>>>>>>> +
>>>>>>> +- The 3D workload might need to wait for the compute job to finish
>>>>>>> and release
>>>>>>> +  hardware resources first.
>>>>>>> +
>>>>>>> +- The compute workload might be stuck in a page fault, because the
>>>>>>> memory
>>>>>>> +  allocation is waiting for the DMA fence of the 3D workload to
>>>>>>> complete.
>>>>>>> +
>>>>>>> +There are a few ways to prevent this problem:
>>>>>>> +
>>>>>>> +- Compute workloads can always be preempted, even when a page
>>>>>>> fault is pending
>>>>>>> +  and not yet repaired. Not all hardware supports this.
>>>>>>> +
>>>>>>> +- DMA fence workloads and workloads which need page fault handling
>>>>>>> have
>>>>>>> +  independent hardware resources to guarantee forward progress.
>>>>>>> This could be
>>>>>>> +  achieved through e.g. through dedicated engines and minimal
>>>>>>> compute unit
>>>>>>> +  reservations for DMA fence workloads.
>>>>>>> +
>>>>>>> +- The reservation approach could be further refined by only
>>>>>>> reserving the
>>>>>>> +  hardware resources for DMA fence workloads when they are
>>>>>>> in-flight. This must
>>>>>>> +  cover the time from when the DMA fence is visible to other
>>>>>>> threads up to
>>>>>>> +  moment when fence is completed through dma_fence_signal().
>>>>>>> +
>>>>>>> +- As a last resort, if the hardware provides no useful reservation
>>>>>>> mechanics,
>>>>>>> +  all workloads must be flushed from the GPU when switching
>>>>>>> between jobs
>>>>>>> +  requiring DMA fences or jobs requiring page fault handling: This
>>>>>>> means all DMA
>>>>>>> +  fences must complete before a compute job with page fault
>>>>>>> handling can be
>>>>>>> +  inserted into the scheduler queue. And vice versa, before a DMA
>>>>>>> fence can be
>>>>>>> +  made visible anywhere in the system, all compute workloads must
>>>>>>> be preempted
>>>>>>> +  to guarantee all pending GPU page faults are flushed.
>>>>>> I thought of another possible workaround:
>>>>>>
>>>>>>      * Partition the memory. Servicing of page faults will use a
>>>>>> separate
>>>>>>        memory pool that can always be allocated from without
>>>>>> waiting for
>>>>>>        fences. This includes memory for page tables and memory for
>>>>>>        migrating data to. You may steal memory from other processes
>>>>>> that
>>>>>>        can page fault, so no fence waiting is necessary. Being able to
>>>>>>        steal memory at any time also means there are basically no
>>>>>>        out-of-memory situations you need to worry about. Even page
>>>>>> tables
>>>>>>        (except the root page directory of each process) can be
>>>>>> stolen in
>>>>>>        the worst case.
>>>>> I think 'overcommit' would be a nice way to describe this. But I'm not
>>>>> sure how easy this is to implement in practice. You would basically
>>>>> need
>>>>> to create your own memory manager for this.
>>>> Well you would need a completely separate pool for both device as well
>>>> as system memory.
>>>>
>>>> E.g. on boot we say we steal X GB system memory only for HMM.
>>> Why? The GPU driver doesn't need to allocate system memory for HMM.
>>> Migrations to system memory are handled by the kernel's handle_mm_fault
>>> and page allocator and swap logic.
>> And that one depends on dma_fence completion because you can easily
>> need to wait for an MMU notifier callback.
> I see, the GFX MMU notifier for userpointers in amdgpu currently waits
> for fences. For the KFD MMU notifier I am planning to fix this by
> causing GPU page faults instead of preempting the queues. Can we limit
> userptrs in amdgpu to engines that can page fault. Basically make it
> illegal to attach userptr BOs to graphics CS BO lists, so they can only
> be used in user mode command submissions, which can page fault. Then the
> GFX MMU notifier could invalidate PTEs and would not have to wait for
> fences.

It's not only the MMU notifier, the TTM shrinker I'm adding needs to 
wait for dma_fences as well.

And apart from that we can't limit userptrs since they are part of the 
UAPI and Vulkan/OpenGL.

>> As Maarten wrote when you want to go down this route you need a
>> complete separate memory management parallel to the one of the kernel.
> Not really. I'm trying to make the GPU memory management more similar to
> what the kernel does for system memory.
>
> I understood Maarten's comment as "I'm creating a new memory manager and
> not using TTM any more". This is true. The idea is that this portion of
> VRAM would be managed more like system memory.

I don't think that will fly. We can have the backing store which TTM 
uses for allocation shared with HMM.

But essentially both TTM allocations needs to be able to put pressure on 
HMM allocations as well as the other way around.

Regards,
Christian.

>
> Regards,
>    Felix
>
>
>> Regards,
>> Christian.
>>
>>>    It doesn't depend on any fences, so
>>> it cannot deadlock with any GPU driver-managed memory. The GPU driver
>>> gets involved in the MMU notifier to invalidate device page tables. But
>>> that also doesn't need to wait for any fences.
>>>
>>> And if the kernel runs out of pageable memory, you're in trouble anyway.
>>> The OOM killer will step in, nothing new there.
>>>
>>> Regards,
>>>     Felix
>>>
>>>
>>>>> But from a design point of view, definitely a valid solution.
>>>> I think the restriction above makes it pretty much unusable.
>>>>
>>>>> But this looks good, those solutions are definitely the valid
>>>>> options we
>>>>> can choose from.
>>>> It's certainly worth noting, yes. And just to make sure that nobody
>>>> has the idea to reserve only device memory.
>>>>
>>>> Christian.
>>>>
>>>>> ~Maarten
>>>>>
>>> _______________________________________________
>>> Linaro-mm-sig mailing list
>>> Linaro-mm-sig@lists.linaro.org
>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.linaro.org%2Fmailman%2Flistinfo%2Flinaro-mm-sig&amp;data=04%7C01%7Cfelix.kuehling%40amd.com%7C4e4884be55d74c4dda1408d8c35fd0ab%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637474163592260552%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=gQj51eDK8OUWoQcbYliY639jOPleRjyLY3Q16nj2PL0%3D&amp;reserved=0
>>>

