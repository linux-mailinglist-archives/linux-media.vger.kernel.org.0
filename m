Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29FD73079F4
	for <lists+linux-media@lfdr.de>; Thu, 28 Jan 2021 16:42:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231544AbhA1Pk5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jan 2021 10:40:57 -0500
Received: from mail-dm6nam12on2066.outbound.protection.outlook.com ([40.107.243.66]:31520
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229595AbhA1Pkz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jan 2021 10:40:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y4MCwaSNq+PJ7vhhK81tk7YRq6x2GWt3DpbuL6SxpwSBCPmCTtw8t3zUHhKqzfl5Ot7IsXmzsYz5BYlQE+/J1S5tWjezs1mmiahZttKteExG64fBtzGjx7tVRDP0/Zp2Ibzsrl9KIUES4AreqczLgDq0u6sPeD3VC4DWmSpS5V2E2z9yvPUKVVbFPu0PtRWJvrLxDaYEmAJ3K2iVFMlFhnuWWUOYUpeDCcIWnKREp/c7K+avjiEyNMM7PYZ7EL039XJZSAiARTtTc9/Uj6zsMhFRnpRmRWsf+u8HvJFwhMW0OnMLcBBq/e0N5tHl1O1+V7m7sIg9KrJEfj6x79xOCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KHGpylmI9CEXBJztIvpeyvTtGgHmraOvMawPps5uFIA=;
 b=E0z2Qlju4s5D8gSsKjL0mV+yCB69CflDc3c6sHY4rUHRCl/U1B/DkIWMwx8FLVnUjWAHgwIZlWR0iSm+gD5TYiY8Z4bMrurf6iPUvkr5BqcouA7OaPLwozBHbhHlBWWEHF7zBtpVyoVsDC3/i0QFs8We8FIGPrPsQfsspvoH55Wcc99RONcoNXifz1naeiQkWcaG5FVWS174P1CehK8oLajHzQk53GcTlrGNInqfAZOe40KE+sswM12LOiccNt27Zuc18zX+80newsGSVtDY9A0oP7L6P18Q8dOn2b6hTjiE8AbbH/zzpfnn3KD9evrFICoCHe6jhnGPk5m9vL2ACw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KHGpylmI9CEXBJztIvpeyvTtGgHmraOvMawPps5uFIA=;
 b=aX9OLdq2bCoqyQ0B36yvuWxC/GRWnGhzRQvjCSdeW57KkFwupejQ+ek/LWtqE4fh36Ct3aDr2tWOid80VVdFPsTgR4pdQVdd1CVPZFv/TbPiUsHkVsQBfB4zLB0MMBsFc+iNLyXgzVzKYkBx9fHM0zprnKsPG15Yzx7JCvYwIHQ=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4109.namprd12.prod.outlook.com (2603:10b6:208:1d9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Thu, 28 Jan
 2021 15:40:01 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::ec8d:851e:525d:a6ab]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::ec8d:851e:525d:a6ab%8]) with mapi id 15.20.3784.017; Thu, 28 Jan 2021
 15:40:01 +0000
Subject: Re: [Linaro-mm-sig] [PATCH] RFC: dma-fence: Document recoverable page
 fault implications
To:     christian.koenig@amd.com,
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
From:   Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <65b7a61c-b4b9-a210-5a37-0f69d01f667c@amd.com>
Date:   Thu, 28 Jan 2021 10:39:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <c9c8d386-87a1-6678-b5c6-854de210d8d3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [142.117.121.176]
X-ClientProxiedBy: YT1PR01CA0129.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::8) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.117.121.176) by YT1PR01CA0129.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend Transport; Thu, 28 Jan 2021 15:40:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 12e75f8d-d3ba-4465-5db3-08d8c3a2f975
X-MS-TrafficTypeDiagnostic: MN2PR12MB4109:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB41095AA3D0B39847A2C592E592BA9@MN2PR12MB4109.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2Ej7J/UA+MODMlUOZokH6NoxBh1debZ3y1VZNZxok0Y0sUeoUSMbJ8kpk2AdmWC6L/0SRQy4df81P4ZuCqwXlNzoajFslneYUfzhv+a/jpAoQXgieBQ22ZGpWmE2LQoeJkThYTiT7Mu2P4g99wg4EG0HvmXSrZuiBiR79+k31R9/IBKgrtS/lw9Km3COzUDuYn69G2OBp/t9p5l17nf+ww5HG882Tvx9yH9+ogheVh1BKovk8xEHqyHOz90KTD9bs3kycVqut3bf0cZjUjdMA5ay3khXCLl5nNpXcBGFTwS6N+k5ZSfv6efOl4hbJPyWLFmojZoIX7jHVzlBjj2u+PmYPVunTcjUTFqzXECSVNpvD8pUwVI3lhrXX7WzuWOPUxXPlFLoLqJumVmvIGQ4VJNTg5enf6YqMbH+D+59yWkVMlg2LhbEIVXipwy3k9CMnVJ+q3NeJ6m2wzV3E90Xfyzz33FLZgDKAdJEf7T6tlQMzctsr9SdjYT6BPWV+vNtvISS/yz1Jmy6ovXyHY0x1bv0VqiSx/THrBQ89+/STGaylpLFgatkX9AHEFcqymLJZCyPvj7g0xGsGwfW6lg7/xmy8zKqeGmZ/lcqJMmMLH8LG8i6zC9t3kJBHO+v8ufw4IkQn7X6uZYme15+Ekf0uPCm4NqaM5eZaCEU9Xj99j+bSxKuMjbTWj7P4RLg+xJD
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB4948.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(346002)(366004)(376002)(136003)(54906003)(186003)(16526019)(110136005)(31686004)(2906002)(8676002)(83380400001)(16576012)(66946007)(26005)(316002)(4326008)(956004)(8936002)(5660300002)(31696002)(966005)(45080400002)(44832011)(66476007)(66556008)(2616005)(66574015)(478600001)(86362001)(36756003)(52116002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RUlmdTVjWG5lclByNVljRE5TUHQraVd4NTU4SGg2M29lMXdXQkdudUQ2ZlR6?=
 =?utf-8?B?RnpFNHoxSDFVWTdEaUFsbTRLMElLMXEyeU5LaUxSU3FhNldzYlJlQ3hRRFRp?=
 =?utf-8?B?cVJobjNiMUtXSkFwT0JvT0ZYUkgzU2Z2RGpBcGJJc2xUZTk4U1lUbU4vNWYw?=
 =?utf-8?B?dzZGOHRyOFU2WTBNUXJPNUZjSjY4M3pCUHpzMGFWZTZ5RDdqZFMvUlNYeW5Y?=
 =?utf-8?B?VS9nREZGTjFmeFZ2WldZVVR0cUJPeHBtNVZLeDNEUGl4ZWNmSVNnWU1hRFRB?=
 =?utf-8?B?Q2lSOXJvL3Z0aFZ5SVNuWXpnVEhCQ2tpYjdpL21TWE5SUVdHWjVmK0c4RXRt?=
 =?utf-8?B?a0U5cHVpT3hlVjJrQmpLVmtIZVBKRG55THFrQ0krOW1uWXJRWUgrS0M3Qnhi?=
 =?utf-8?B?bTdva0g5SXo4VFVzYlhiTktQcndDZ01sejl3MEdFdXZuUlYrYzFRbThvWjBq?=
 =?utf-8?B?aFN3Y091WTN3RHg1QzEzc3NWT2U4SGJJL1hLb05SS1FFeFk3aWFQNXFaeDNS?=
 =?utf-8?B?aUgxaHI4TDhPNmw3UDN0TytlWllxcGhVTFJxRDdwN3d0MVdQeWNjL2JYL0hL?=
 =?utf-8?B?U3d4dEs1MVp2RFQzS0U1SU1Ocjg4dml2ZnRCYy8xb0VERkE2bDNhQkJoUEox?=
 =?utf-8?B?VVZtSDJQVVZZb203ZTBQRlFzY21Sb0lIa3dzMzNoU1FWcWNvcXYzblUwTUoy?=
 =?utf-8?B?cmJMalJWWC9XZi85T0xSd3c5MExuWUdqbnRiTnJjSFpDOTZwdzFlR3lCeWJs?=
 =?utf-8?B?YkJKQktTVm9WNTVCQ0RKSUVzejdFaFlwRDQ0SVNseStCcGxpOG54MXJJSWg2?=
 =?utf-8?B?L2prYVdjTGFGZ2o2UWd2aXZZTFRzQXQrWEc2cmRKNlZOc0kzVTZtYTQwM29B?=
 =?utf-8?B?bEVKRktMYS9lUHVKNnV0YmovSTNRdmVtekI4c3FYSDBlMDNPOHRvNktSRHdE?=
 =?utf-8?B?MEErUVdKVTViZm1DUmlqamlETEhPb0hCRmkxUGgrT1VuTjMxSXNFdUU2cFpn?=
 =?utf-8?B?eHVHQUxQODR4KzNTZFRLdEZsRi9Cb1NaUUpjZlJiOWtzU1hLTXYvZ0JSbThp?=
 =?utf-8?B?bTkxa1pZOXpOWFNOQWs4TzY1ZUc4RVVmSUFHbitSZHRFd3hzLzRVME5hQ2lj?=
 =?utf-8?B?azNMMStDbXRvZTEvTHpyVDMxSGRpK2hoa3U2VStjcExLTHJzeHA1Z2dlcElD?=
 =?utf-8?B?aXVmalZMc3VIQ0MrbllCNk5vVmI4VERuNnJ5TUtlRlNQQ1c5SFQzV2FqTnFq?=
 =?utf-8?B?bFA5R25JYmh0SDFNc1VPYmNGVmwzcGhxQXRETDZKV3ppZDF0Zms2SlRjZ25R?=
 =?utf-8?B?VXFaSXVTbTZvRXdBbkpsNTFQQVd2Ym9CUmZDOGZ5azJSMThhV2tqa0dpdWha?=
 =?utf-8?B?Vm5sanJVUXp4OTlsWm5RWDIva2V1R1R4VlZobWc1WDRuTS9SZzlBNEFGVjEz?=
 =?utf-8?B?UDVYMXQ5TmJYeTIrWlRKMXNLUWJFak1MVnErenZRPT0=?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12e75f8d-d3ba-4465-5db3-08d8c3a2f975
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 15:40:01.3099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r9bF88Nbund3s0NuAVGfiuxAvjpBbgLLABCR0wrP3qRLrpoLPU35jI9q98Pt329fp2iiDCcvWNzV/LVnNRUqIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4109
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 2021-01-28 um 2:39 a.m. schrieb Christian König:
> Am 27.01.21 um 23:00 schrieb Felix Kuehling:
>> Am 2021-01-27 um 7:16 a.m. schrieb Christian König:
>>> Am 27.01.21 um 13:11 schrieb Maarten Lankhorst:
>>>> Op 27-01-2021 om 01:22 schreef Felix Kuehling:
>>>>> Am 2021-01-21 um 2:40 p.m. schrieb Daniel Vetter:
>>>>>> Recently there was a fairly long thread about recoreable hardware
>>>>>> page
>>>>>> faults, how they can deadlock, and what to do about that.
>>>>>>
>>>>>> While the discussion is still fresh I figured good time to try and
>>>>>> document the conclusions a bit.
>>>>>>
>>>>>> References:
>>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fdri-devel%2F20210107030127.20393-1-Felix.Kuehling%40amd.com%2F&amp;data=04%7C01%7Cfelix.kuehling%40amd.com%7C4e4884be55d74c4dda1408d8c35fd0ab%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637474163592260552%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=y2VzC4vbfMi0ctyerAHfqODZ6tthz1FUDwpMCp0PIrQ%3D&amp;reserved=0
>>>>>>
>>>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>>>> Cc: Thomas Hellström <thomas.hellstrom@intel.com>
>>>>>> Cc: "Christian König" <christian.koenig@amd.com>
>>>>>> Cc: Jerome Glisse <jglisse@redhat.com>
>>>>>> Cc: Felix Kuehling <felix.kuehling@amd.com>
>>>>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>>>>>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
>>>>>> Cc: linux-media@vger.kernel.org
>>>>>> Cc: linaro-mm-sig@lists.linaro.org
>>>>>> -- 
>>>>>> I'll be away next week, but figured I'll type this up quickly for
>>>>>> some
>>>>>> comments and to check whether I got this all roughly right.
>>>>>>
>>>>>> Critique very much wanted on this, so that we can make sure hw which
>>>>>> can't preempt (with pagefaults pending) like gfx10 has a clear
>>>>>> path to
>>>>>> support page faults in upstream. So anything I missed, got wrong or
>>>>>> like that would be good.
>>>>>> -Daniel
>>>>>> ---
>>>>>>    Documentation/driver-api/dma-buf.rst | 66
>>>>>> ++++++++++++++++++++++++++++
>>>>>>    1 file changed, 66 insertions(+)
>>>>>>
>>>>>> diff --git a/Documentation/driver-api/dma-buf.rst
>>>>>> b/Documentation/driver-api/dma-buf.rst
>>>>>> index a2133d69872c..e924c1e4f7a3 100644
>>>>>> --- a/Documentation/driver-api/dma-buf.rst
>>>>>> +++ b/Documentation/driver-api/dma-buf.rst
>>>>>> @@ -257,3 +257,69 @@ fences in the kernel. This means:
>>>>>>      userspace is allowed to use userspace fencing or long running
>>>>>> compute
>>>>>>      workloads. This also means no implicit fencing for shared
>>>>>> buffers in these
>>>>>>      cases.
>>>>>> +
>>>>>> +Recoverable Hardware Page Faults Implications
>>>>>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>>>> +
>>>>>> +Modern hardware supports recoverable page faults, which has a
>>>>>> lot of
>>>>>> +implications for DMA fences.
>>>>>> +
>>>>>> +First, a pending page fault obviously holds up the work that's
>>>>>> running on the
>>>>>> +accelerator and a memory allocation is usually required to resolve
>>>>>> the fault.
>>>>>> +But memory allocations are not allowed to gate completion of DMA
>>>>>> fences, which
>>>>>> +means any workload using recoverable page faults cannot use DMA
>>>>>> fences for
>>>>>> +synchronization. Synchronization fences controlled by userspace
>>>>>> must be used
>>>>>> +instead.
>>>>>> +
>>>>>> +On GPUs this poses a problem, because current desktop compositor
>>>>>> protocols on
>>>>>> +Linus rely on DMA fences, which means without an entirely new
>>>>>> userspace stack
>>>>>> +built on top of userspace fences, they cannot benefit from
>>>>>> recoverable page
>>>>>> +faults. The exception is when page faults are only used as
>>>>>> migration hints and
>>>>>> +never to on-demand fill a memory request. For now this means
>>>>>> recoverable page
>>>>>> +faults on GPUs are limited to pure compute workloads.
>>>>>> +
>>>>>> +Furthermore GPUs usually have shared resources between the 3D
>>>>>> rendering and
>>>>>> +compute side, like compute units or command submission engines. If
>>>>>> both a 3D
>>>>>> +job with a DMA fence and a compute workload using recoverable page
>>>>>> faults are
>>>>>> +pending they could deadlock:
>>>>>> +
>>>>>> +- The 3D workload might need to wait for the compute job to finish
>>>>>> and release
>>>>>> +  hardware resources first.
>>>>>> +
>>>>>> +- The compute workload might be stuck in a page fault, because the
>>>>>> memory
>>>>>> +  allocation is waiting for the DMA fence of the 3D workload to
>>>>>> complete.
>>>>>> +
>>>>>> +There are a few ways to prevent this problem:
>>>>>> +
>>>>>> +- Compute workloads can always be preempted, even when a page
>>>>>> fault is pending
>>>>>> +  and not yet repaired. Not all hardware supports this.
>>>>>> +
>>>>>> +- DMA fence workloads and workloads which need page fault handling
>>>>>> have
>>>>>> +  independent hardware resources to guarantee forward progress.
>>>>>> This could be
>>>>>> +  achieved through e.g. through dedicated engines and minimal
>>>>>> compute unit
>>>>>> +  reservations for DMA fence workloads.
>>>>>> +
>>>>>> +- The reservation approach could be further refined by only
>>>>>> reserving the
>>>>>> +  hardware resources for DMA fence workloads when they are
>>>>>> in-flight. This must
>>>>>> +  cover the time from when the DMA fence is visible to other
>>>>>> threads up to
>>>>>> +  moment when fence is completed through dma_fence_signal().
>>>>>> +
>>>>>> +- As a last resort, if the hardware provides no useful reservation
>>>>>> mechanics,
>>>>>> +  all workloads must be flushed from the GPU when switching
>>>>>> between jobs
>>>>>> +  requiring DMA fences or jobs requiring page fault handling: This
>>>>>> means all DMA
>>>>>> +  fences must complete before a compute job with page fault
>>>>>> handling can be
>>>>>> +  inserted into the scheduler queue. And vice versa, before a DMA
>>>>>> fence can be
>>>>>> +  made visible anywhere in the system, all compute workloads must
>>>>>> be preempted
>>>>>> +  to guarantee all pending GPU page faults are flushed.
>>>>> I thought of another possible workaround:
>>>>>
>>>>>     * Partition the memory. Servicing of page faults will use a
>>>>> separate
>>>>>       memory pool that can always be allocated from without
>>>>> waiting for
>>>>>       fences. This includes memory for page tables and memory for
>>>>>       migrating data to. You may steal memory from other processes
>>>>> that
>>>>>       can page fault, so no fence waiting is necessary. Being able to
>>>>>       steal memory at any time also means there are basically no
>>>>>       out-of-memory situations you need to worry about. Even page
>>>>> tables
>>>>>       (except the root page directory of each process) can be
>>>>> stolen in
>>>>>       the worst case.
>>>> I think 'overcommit' would be a nice way to describe this. But I'm not
>>>> sure how easy this is to implement in practice. You would basically
>>>> need
>>>> to create your own memory manager for this.
>>> Well you would need a completely separate pool for both device as well
>>> as system memory.
>>>
>>> E.g. on boot we say we steal X GB system memory only for HMM.
>> Why? The GPU driver doesn't need to allocate system memory for HMM.
>> Migrations to system memory are handled by the kernel's handle_mm_fault
>> and page allocator and swap logic.
>
> And that one depends on dma_fence completion because you can easily
> need to wait for an MMU notifier callback.

I see, the GFX MMU notifier for userpointers in amdgpu currently waits
for fences. For the KFD MMU notifier I am planning to fix this by
causing GPU page faults instead of preempting the queues. Can we limit
userptrs in amdgpu to engines that can page fault. Basically make it
illegal to attach userptr BOs to graphics CS BO lists, so they can only
be used in user mode command submissions, which can page fault. Then the
GFX MMU notifier could invalidate PTEs and would not have to wait for
fences.


>
> As Maarten wrote when you want to go down this route you need a
> complete separate memory management parallel to the one of the kernel.

Not really. I'm trying to make the GPU memory management more similar to
what the kernel does for system memory.

I understood Maarten's comment as "I'm creating a new memory manager and
not using TTM any more". This is true. The idea is that this portion of
VRAM would be managed more like system memory.

Regards,
  Felix


>
> Regards,
> Christian.
>
>>   It doesn't depend on any fences, so
>> it cannot deadlock with any GPU driver-managed memory. The GPU driver
>> gets involved in the MMU notifier to invalidate device page tables. But
>> that also doesn't need to wait for any fences.
>>
>> And if the kernel runs out of pageable memory, you're in trouble anyway.
>> The OOM killer will step in, nothing new there.
>>
>> Regards,
>>    Felix
>>
>>
>>>> But from a design point of view, definitely a valid solution.
>>> I think the restriction above makes it pretty much unusable.
>>>
>>>> But this looks good, those solutions are definitely the valid
>>>> options we
>>>> can choose from.
>>> It's certainly worth noting, yes. And just to make sure that nobody
>>> has the idea to reserve only device memory.
>>>
>>> Christian.
>>>
>>>> ~Maarten
>>>>
>> _______________________________________________
>> Linaro-mm-sig mailing list
>> Linaro-mm-sig@lists.linaro.org
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.linaro.org%2Fmailman%2Flistinfo%2Flinaro-mm-sig&amp;data=04%7C01%7Cfelix.kuehling%40amd.com%7C4e4884be55d74c4dda1408d8c35fd0ab%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637474163592260552%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=gQj51eDK8OUWoQcbYliY639jOPleRjyLY3Q16nj2PL0%3D&amp;reserved=0
>>
>
