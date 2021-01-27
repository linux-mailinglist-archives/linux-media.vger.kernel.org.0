Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03E6B3066F5
	for <lists+linux-media@lfdr.de>; Wed, 27 Jan 2021 23:03:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236516AbhA0WBv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jan 2021 17:01:51 -0500
Received: from mail-bn8nam11on2057.outbound.protection.outlook.com ([40.107.236.57]:6433
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236146AbhA0WBr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jan 2021 17:01:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iH6+3uihWs/6I+thxLE0nIywcdrXCpl8vP+jCQh5GmvY/j0uQGc8141+eYAoCPhGvbq033cauMbHCwjiE71IYj1RrbTZbf1BaVrQ5NPC0spZND89krZNyHDTKnRvoI6C/aoT0IVttBDGZwOfpD/YY59nQr2H3tHyG9m+b8sKHgid3nxxwf0bqHE2SywUZA6v2h8sm+VerREKA7A91n6Z9knert0wdVsSz0V2Au5QBDIXCQF6kaZtyjWKLeW0D7fokFLrBdWmyWmEKu6DH0OEHSYi+f640sDzjfZIGo26gLan/LGlB8WS1LwjcAz42WFetWWMR+x2O7pTxfMzI5uIVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3y9iCgzJpzjn+JIdzvzHLVO+dR4Pp96G4zHuuDGpT28=;
 b=ZodJMNWf+Mu85dRgXcomHDt6wlm/olTFZEq/2Z4RL2DKp7SpjYHflCfUazKJ7qPckhMWESY2a8RrtwyfX4lKoRegfLZixp5pmjWvxVr+mMUMxSbHoUZD0E4SGRdzM26uQ2BhrdFfEobeQgazQ5LvOb48E26LaNm/CwmzYxSzFvFpvEuOyx3dDRfdv/2dm5mvOYtfF1MkgSlslJxVGxR8cDJaes37iRn2PsgF1Abpsjtb091vTaABzIx7UAiiQvX82pqdFQjlzoSzp15+97515SBbQ1QyJ4gjMyNpCZI5uN5b5KGF6hoj1Iyaj9WFD7IBAhDT6HFeRgS9BM3Efj3dSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3y9iCgzJpzjn+JIdzvzHLVO+dR4Pp96G4zHuuDGpT28=;
 b=RJ3qMG8Z6IiGUcrVLtaAAUrMAKlBQstWTMawYzsg4uipwuUun0xJUDmED5Nz37UNp0+K3QvKm6O2dudpVV7dvUuTvWEOwQiq4xAM4c8ZHUBXlpxTT3GT7TiFQYRd8mol9IdmlIPvGIVly9RYtdeXFzYnHaVzCM3n7PNUSt4Ub1Q=
Authentication-Results: lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3679.namprd12.prod.outlook.com (2603:10b6:208:159::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.14; Wed, 27 Jan
 2021 22:00:52 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::ec8d:851e:525d:a6ab]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::ec8d:851e:525d:a6ab%8]) with mapi id 15.20.3784.017; Wed, 27 Jan 2021
 22:00:52 +0000
Subject: Re: [PATCH] RFC: dma-fence: Document recoverable page fault
 implications
To:     =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
 <1e38efbc-ec52-e436-21e4-49a0d074b57b@amd.com>
From:   Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <18e7efbd-3d10-5ad1-49c9-7e26f0a27ef2@amd.com>
Date:   Wed, 27 Jan 2021 17:00:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <1e38efbc-ec52-e436-21e4-49a0d074b57b@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [142.117.121.176]
X-ClientProxiedBy: YT1PR01CA0103.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::12) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.117.121.176) by YT1PR01CA0103.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17 via Frontend Transport; Wed, 27 Jan 2021 22:00:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e96a301d-bfee-4ba2-4e35-08d8c30f02df
X-MS-TrafficTypeDiagnostic: MN2PR12MB3679:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB367967032EB51F6D84905BBB92BB9@MN2PR12MB3679.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: evGz7oA81x9v0X1av8SmqDGHl86CPbJ+igSfmrPig/L6Ga81z8zpQVz6g9QQvlK7y3F1ZxpUiRcoR6cXYEx88or3gv5tm4VYWP676UZ7q1pspBQKIj64z6F0+pFu/stq4yX8yRWEBPgnGdatj6TJGxcbrqB6a0SvjqcWSsJ6B7OErTNk/IgULwbpj0roXekH2iM11cjVp2WtvZsVv8csHvY1tt3cOMt7w+RfpNGpMqlMLQGuYVx3T8eHwr9xsFyqH9iv1b9tuhchiL38uPRd/WqCJG/wzpC6HEoKF+ExIYs3ADmaEjvw8B/BNv6bOwo5mp6mWN3LB37QiNMHXM1w+B3nSvzW2qDMBKKpCn4M3uxHr8SlHvsH4q55/6XIc33uLd5cB95rOcBHJYZi/gY6sVzS55jwnfmf6H+Nujg60ivKB2AsI5eb4RA+fHghe0A5hr5EXrhXU6aSdY0rwzPDG1wxR/wUG4PhWg2oPh3vnAOCgXfXBh9FjJNZcVXzBMQkP9vg4u+Miw4zArz2zY9Kt56knxCtdljsZsuT+pYsG1smxGMmp07rTAHfbu+Mf/XLMRfM78ac1GUsJZ91jCzCrWd5Pgc7AiobI7LK8INn1Fg6LTefimhlr4/ibBJ5gEjTaYR2XmNMHiqVhBHwO/r5ruCGvuI2CmmOggA0N5iMQ4jsbY2kSxLmBBCU8KpwW60o
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB4948.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(396003)(376002)(366004)(110136005)(2616005)(26005)(86362001)(31686004)(186003)(16526019)(45080400002)(54906003)(6486002)(66574015)(83380400001)(478600001)(5660300002)(966005)(2906002)(8676002)(31696002)(4326008)(44832011)(316002)(16576012)(8936002)(66556008)(956004)(66476007)(36756003)(52116002)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TFc0bEZXZnRRVU9PbFhvV1AvWGJlNDE4TldtT1Rka0crc1hXZCtZbEFBbkNv?=
 =?utf-8?B?ZzVvWXJVc1loTHVhNnU4RGhZQ0M3Zldkemw4anV5aUZqRk5nQTIwL2NMeDZv?=
 =?utf-8?B?Qi9obFRPMmhVVHZFaGtGeVdET2JUMm9LQWxpWnZpSVhzd0RkLzZ6SWZYbVVu?=
 =?utf-8?B?NjZyY0RyUXpnNVJsL1NxUEpURXlpQUlpRDNsVW9HemZtNGRIcVkwMzlTRW52?=
 =?utf-8?B?dUR2Vjc4VlYrcXNhMzhEOWFHWHBTTCtCUGlDKzNTWHB2dEZCWG9IYjBsMzB6?=
 =?utf-8?B?VUl1RDF6K1d5cnBzVmhOSEZzYmRCdXZ1U2d6TUVZYXRCQlhmNGNnK1JzWWMy?=
 =?utf-8?B?OHVBWE9KaDNXRUQ3Y2Z1NGhzL3pyVzhUeGk2K2J1cmlYVk5vUmUwT0VTOTVJ?=
 =?utf-8?B?TzRPR2E3a0hIOGtoUitDWXlGYXhUOEg1WjFtZE5SV2lPaXNSVXNSSVorYjRz?=
 =?utf-8?B?d2VCZkxBRjgwRVFUOVdrL0M3QWRkRjI2YWw4MUoxbEo3cjJmanJsY2E3Ykh2?=
 =?utf-8?B?RXpTT1plU3VBQlkzVEFzQmRQcEpEZU1KbThPcnRvRHEzQ2Y1K2MwQjZaV1Jm?=
 =?utf-8?B?aVJEOTJNR2tzU3I4ZUFmR1hnT1lUbHJGL2tSNklGZUREcHB2VkovdlJHZ1Rv?=
 =?utf-8?B?ZmNFY3lKL0dEM0F0ZVRNcGQxdFNhdXhqMFQ2VUp4NmpoRHVzc1JIcTFOVkV2?=
 =?utf-8?B?VkIyZnR1dXBCNnA2VFFPVUNyTVdwRXp5L012YlA5YTBaVVVqUzNOam1ON3Bj?=
 =?utf-8?B?aXcyK1BlV042bUF5ZHgraUhEdDFRajA1T3QzN0tFa3huRDlUT252WmJUZnVx?=
 =?utf-8?B?QlYwOThKSUpETmF6cWZmMS8xakNaaERQVzZGdGM4T1ZCc3phakpnenp6YWFG?=
 =?utf-8?B?RHVxS2FHNXE1Q216am1GampnRGhneXBIeERyVGNmNXRBOGp0WDJPRHpBWXls?=
 =?utf-8?B?R2J1UytVbWE1NmJaZ3pMZUMrQXU5ajY1QVNHeUVVcm85ZDRwdUZyVnlwMkNN?=
 =?utf-8?B?b2psWDR0U2VTQk9tRFRlNlpPSWFoS21xY1Iyc0VqNkxFTWZtcFF5MklGNW5R?=
 =?utf-8?B?VTN4THZGZ1VIYWZmVWFHVzhuWmdkRUxyYUtaR3dqb05EMEozeEJNQ0F3MUd2?=
 =?utf-8?B?VEYxWGtnN28vRTlLcHpraUl3cmcyNDczS2F0K1hQSE1nakprRnJlQXZoOVA0?=
 =?utf-8?B?OXFEYk03Vm1pem9LZEV3UDdUN21acTNHeEJ2MTJ4aVA5Z2IyMFIvdWxsK1Vt?=
 =?utf-8?B?bVQ5WFFlZHdhZlk0bmRkNWV6QTJtWVpxN3d3THlPaEd5UmFaT240V0Z3dk5K?=
 =?utf-8?B?ZTB5cnc2b3VGTEZCSVhBZjlDLzF4RGFTaWt1TmtSMW1XOG1jT3ovOG51TE1H?=
 =?utf-8?B?UEpRamppem8zeEZuL1hYcEFveXJnTjdKcEpXTUlaSDZ1d3Y2MFQyVFlRa3ZP?=
 =?utf-8?B?aVdlcWNZaE9xdDNUVCt1UUU1NGtVZUpEQ1JHOHR3PT0=?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e96a301d-bfee-4ba2-4e35-08d8c30f02df
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 22:00:52.7626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vfpfFs8oIpH5y32SlZZuW9HFhjZIm5syvSrpagXMy5TFJF3a38ZWMWxV56IE/2X9wdjzUB+oBS1Q/8qNsJdHZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3679
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 2021-01-27 um 7:16 a.m. schrieb Christian König:
> Am 27.01.21 um 13:11 schrieb Maarten Lankhorst:
>> Op 27-01-2021 om 01:22 schreef Felix Kuehling:
>>> Am 2021-01-21 um 2:40 p.m. schrieb Daniel Vetter:
>>>> Recently there was a fairly long thread about recoreable hardware page
>>>> faults, how they can deadlock, and what to do about that.
>>>>
>>>> While the discussion is still fresh I figured good time to try and
>>>> document the conclusions a bit.
>>>>
>>>> References:
>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fdri-devel%2F20210107030127.20393-1-Felix.Kuehling%40amd.com%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Cbee0aeff80f440bcc52108d8c2bcc11f%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637473463245588199%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=ncr%2Fqv5lw0ONrYxFvfdcFAXAZ%2BXcJJa6UY%2BxGfcKGVM%3D&amp;reserved=0
>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>> Cc: Thomas Hellström <thomas.hellstrom@intel.com>
>>>> Cc: "Christian König" <christian.koenig@amd.com>
>>>> Cc: Jerome Glisse <jglisse@redhat.com>
>>>> Cc: Felix Kuehling <felix.kuehling@amd.com>
>>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>>>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
>>>> Cc: linux-media@vger.kernel.org
>>>> Cc: linaro-mm-sig@lists.linaro.org
>>>> -- 
>>>> I'll be away next week, but figured I'll type this up quickly for some
>>>> comments and to check whether I got this all roughly right.
>>>>
>>>> Critique very much wanted on this, so that we can make sure hw which
>>>> can't preempt (with pagefaults pending) like gfx10 has a clear path to
>>>> support page faults in upstream. So anything I missed, got wrong or
>>>> like that would be good.
>>>> -Daniel
>>>> ---
>>>>   Documentation/driver-api/dma-buf.rst | 66
>>>> ++++++++++++++++++++++++++++
>>>>   1 file changed, 66 insertions(+)
>>>>
>>>> diff --git a/Documentation/driver-api/dma-buf.rst
>>>> b/Documentation/driver-api/dma-buf.rst
>>>> index a2133d69872c..e924c1e4f7a3 100644
>>>> --- a/Documentation/driver-api/dma-buf.rst
>>>> +++ b/Documentation/driver-api/dma-buf.rst
>>>> @@ -257,3 +257,69 @@ fences in the kernel. This means:
>>>>     userspace is allowed to use userspace fencing or long running
>>>> compute
>>>>     workloads. This also means no implicit fencing for shared
>>>> buffers in these
>>>>     cases.
>>>> +
>>>> +Recoverable Hardware Page Faults Implications
>>>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>> +
>>>> +Modern hardware supports recoverable page faults, which has a lot of
>>>> +implications for DMA fences.
>>>> +
>>>> +First, a pending page fault obviously holds up the work that's
>>>> running on the
>>>> +accelerator and a memory allocation is usually required to resolve
>>>> the fault.
>>>> +But memory allocations are not allowed to gate completion of DMA
>>>> fences, which
>>>> +means any workload using recoverable page faults cannot use DMA
>>>> fences for
>>>> +synchronization. Synchronization fences controlled by userspace
>>>> must be used
>>>> +instead.
>>>> +
>>>> +On GPUs this poses a problem, because current desktop compositor
>>>> protocols on
>>>> +Linus rely on DMA fences, which means without an entirely new
>>>> userspace stack
>>>> +built on top of userspace fences, they cannot benefit from
>>>> recoverable page
>>>> +faults. The exception is when page faults are only used as
>>>> migration hints and
>>>> +never to on-demand fill a memory request. For now this means
>>>> recoverable page
>>>> +faults on GPUs are limited to pure compute workloads.
>>>> +
>>>> +Furthermore GPUs usually have shared resources between the 3D
>>>> rendering and
>>>> +compute side, like compute units or command submission engines. If
>>>> both a 3D
>>>> +job with a DMA fence and a compute workload using recoverable page
>>>> faults are
>>>> +pending they could deadlock:
>>>> +
>>>> +- The 3D workload might need to wait for the compute job to finish
>>>> and release
>>>> +  hardware resources first.
>>>> +
>>>> +- The compute workload might be stuck in a page fault, because the
>>>> memory
>>>> +  allocation is waiting for the DMA fence of the 3D workload to
>>>> complete.
>>>> +
>>>> +There are a few ways to prevent this problem:
>>>> +
>>>> +- Compute workloads can always be preempted, even when a page
>>>> fault is pending
>>>> +  and not yet repaired. Not all hardware supports this.
>>>> +
>>>> +- DMA fence workloads and workloads which need page fault handling
>>>> have
>>>> +  independent hardware resources to guarantee forward progress.
>>>> This could be
>>>> +  achieved through e.g. through dedicated engines and minimal
>>>> compute unit
>>>> +  reservations for DMA fence workloads.
>>>> +
>>>> +- The reservation approach could be further refined by only
>>>> reserving the
>>>> +  hardware resources for DMA fence workloads when they are
>>>> in-flight. This must
>>>> +  cover the time from when the DMA fence is visible to other
>>>> threads up to
>>>> +  moment when fence is completed through dma_fence_signal().
>>>> +
>>>> +- As a last resort, if the hardware provides no useful reservation
>>>> mechanics,
>>>> +  all workloads must be flushed from the GPU when switching
>>>> between jobs
>>>> +  requiring DMA fences or jobs requiring page fault handling: This
>>>> means all DMA
>>>> +  fences must complete before a compute job with page fault
>>>> handling can be
>>>> +  inserted into the scheduler queue. And vice versa, before a DMA
>>>> fence can be
>>>> +  made visible anywhere in the system, all compute workloads must
>>>> be preempted
>>>> +  to guarantee all pending GPU page faults are flushed.
>>> I thought of another possible workaround:
>>>
>>>    * Partition the memory. Servicing of page faults will use a separate
>>>      memory pool that can always be allocated from without waiting for
>>>      fences. This includes memory for page tables and memory for
>>>      migrating data to. You may steal memory from other processes that
>>>      can page fault, so no fence waiting is necessary. Being able to
>>>      steal memory at any time also means there are basically no
>>>      out-of-memory situations you need to worry about. Even page tables
>>>      (except the root page directory of each process) can be stolen in
>>>      the worst case.
>> I think 'overcommit' would be a nice way to describe this. But I'm not
>> sure how easy this is to implement in practice. You would basically need
>> to create your own memory manager for this.
>
> Well you would need a completely separate pool for both device as well
> as system memory.
>
> E.g. on boot we say we steal X GB system memory only for HMM.

Why? The GPU driver doesn't need to allocate system memory for HMM.
Migrations to system memory are handled by the kernel's handle_mm_fault
and page allocator and swap logic. It doesn't depend on any fences, so
it cannot deadlock with any GPU driver-managed memory. The GPU driver
gets involved in the MMU notifier to invalidate device page tables. But
that also doesn't need to wait for any fences.

And if the kernel runs out of pageable memory, you're in trouble anyway.
The OOM killer will step in, nothing new there.

Regards,
  Felix


>
>> But from a design point of view, definitely a valid solution.
>
> I think the restriction above makes it pretty much unusable.
>
>> But this looks good, those solutions are definitely the valid options we
>> can choose from.
>
> It's certainly worth noting, yes. And just to make sure that nobody
> has the idea to reserve only device memory.
>
> Christian.
>
>>
>> ~Maarten
>>
>
