Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1F693008B4
	for <lists+linux-media@lfdr.de>; Fri, 22 Jan 2021 17:30:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729568AbhAVQaL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Jan 2021 11:30:11 -0500
Received: from mail-co1nam11on2065.outbound.protection.outlook.com ([40.107.220.65]:21345
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729588AbhAVQaC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Jan 2021 11:30:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PuMsoJYonf57PdDJ21gviSVZS0JSoWo5T/uKts6MQdBjB38GNMziADqw/S+IRyJvgBRHOahD+tmWXIwiVXkegIZiPIoH+hPg/NfkUFd7sA8m7zYSQm58+GRQtVr+vlkgf81TKg8PrJzRW4lZjCGDU+ws4NhHpkzuWAKTWbtX0N8nE+XVCVGXs7Z2xmGz97sc7IfhkGC0g4xNfl7VtC4H3d95dVybP735ocbkvaVZ67vykVfppDvrnwIB09ORy2eH1Do5xU1zR36djLwWkkURnhQRz9WlL/rOHnNKruL6PLKyrgbX5W2FIJ5dKKcHSWu5OniCC2FK8OSyxDfWr/UcGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IPRFkgPT/zaXb7KAy2f7Q5GtkLn4OVheUsSqlCkPXZA=;
 b=d/CGUgmYphxyGd78ohpPNJ9Be3tgd1uiqv+DFvS2FXGZEdFbLq+3A9rOyHDvwRD621lWOfIH9lFJyG5Csun7SaCxSFuTkvQYHSMlak9Eeq7AW4iJNW6aZrLTL0bGi9/TCwGF+cbToH0N1zTYj4He0ZmF4Gy5baG9bjLHFYgZhDjGOgx8N+fGycku2oohCpwfEQyKa97UTjOMtpWiOba2Rh96BA/DnA0uuNkYVPCMqnDf08G1sq5Fn0nKGfPMv8k5a1nnbPLMuI8NzQRW8Xh7d1v6ZkUKBhpGap1cdmPpXIklBAHHZBGIjvS6Ihzp1on395zAhyoouPnpkiaA/esvSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IPRFkgPT/zaXb7KAy2f7Q5GtkLn4OVheUsSqlCkPXZA=;
 b=GCi4OauJY10JOhwmYnD9cCdJFBhLe6KbqO5hOL8BfmlGjypKVJ37pkEvPgIwkAoR4nyfUEFklbMRTPKLtZysWJLYDBbwv4cIjxa7NOuJS3sLR0PAGNTedqQcqY9My1JLP+cB3ZWkyaPnmElTxyi3F8iZeET0WdEgeDierbTgf9o=
Authentication-Results: lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4318.namprd12.prod.outlook.com (2603:10b6:208:1d8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 22 Jan
 2021 16:29:08 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::ec8d:851e:525d:a6ab]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::ec8d:851e:525d:a6ab%8]) with mapi id 15.20.3784.013; Fri, 22 Jan 2021
 16:29:08 +0000
Subject: Re: [PATCH] RFC: dma-fence: Document recoverable page fault
 implications
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@intel.com>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Jerome Glisse <jglisse@redhat.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20210121194056.1734409-1-daniel.vetter@ffwll.ch>
From:   Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <3158d27c-c7b7-d7f3-42fa-996ad88a72f2@amd.com>
Date:   Fri, 22 Jan 2021 11:29:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210121194056.1734409-1-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [142.117.121.176]
X-ClientProxiedBy: YT1PR01CA0026.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::39)
 To BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.117.121.176) by YT1PR01CA0026.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::39) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend Transport; Fri, 22 Jan 2021 16:29:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cf7b16d7-084f-4e33-5f7c-08d8bef2d780
X-MS-TrafficTypeDiagnostic: MN2PR12MB4318:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB431862B292460931FAD72FDC92A00@MN2PR12MB4318.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8ngf+BnX36cFq4FtrLL7eQfWAqqSWuonhUWUkHucGMWCUXYwwQmVYrZKp1tHVjznv9XGliIknccWrdWoTm7qiRD975Z5Kakq+hp8xEpGa13HdwSbiBp4yEQFRVGa/RQLcpGOOqosDn4Cix8s/JkEvOW1XBR5Yj6cObiWOAhWrf5A3Y+QHGGkuK5NpgomfDLT+sPhB6YDSlFwdvsjLsVdfU4osUUdTMjmnmcaHKDvsZcGewjXe4sumeO7HI2tCspS8sbjsQFlJ83NQNjZi9UBAgMzCuOgI4Q3dBi4YQJnpete/Ua8gKFeG3yfR1wkZ989qAVPsb1wyhZRRI6ybv+LxHqNWv79IQMBErcTXfGhBqw77PQb1cAWi65KVCg5rAlPfnxqgVwDyqyFhGRXvI2a9bprrMDBhu0aFgyipBV1uQpFUGX9Af46eRGpm8ajbfb7zfwJZfqPmCeKx5k2rAF2jJC/I3NuQuftg6djUFE3U6TojkuVigPeFR1er3lndSnoN97WEa9d3mwSfolaB2R/jlsyg/LZVephibEzWwGnKUuH7S50MVHg4gIXXYr3ZbU5
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB4948.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(376002)(396003)(39860400002)(110136005)(186003)(966005)(956004)(66946007)(5660300002)(86362001)(316002)(31696002)(478600001)(26005)(66476007)(2906002)(31686004)(6486002)(54906003)(66574015)(36756003)(4326008)(16526019)(8676002)(66556008)(83380400001)(52116002)(8936002)(16576012)(44832011)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bDVQZDBuVTVBSkZSQjdKRjBhNWRFbWJQaysyVmVtMER6OWRHNHFSRzJTR1lF?=
 =?utf-8?B?WndTTWxTdUlBcTZtcUlGeVNmeDFKSkd4aEdLNEVCRXlGYU1uRFVweDNROE1s?=
 =?utf-8?B?RlVrTEJ6TTZSZ1I4ZFB6ZDNOWTE4Wk0yREhQczE1bkhqamtIVFlEd1lXeUky?=
 =?utf-8?B?MU1RaitXMW92bWJTVllvTjljWVhJeVUrMms3Mkk4TVJkajJDektLRHdCcWtV?=
 =?utf-8?B?OGxnekxhTUpOQk8zdkx0bURSRzFQVGo1SE5vTU9DeFMxTThkUlp1QWlsZWMy?=
 =?utf-8?B?b0xsVGtXWlJjZ3ZPTEc4UmU3TURpaFhILzBuUWo4cUhCa1g4UFNXK0Rjcm5H?=
 =?utf-8?B?M1UrZzFrdGtLaGVFQW9QSitiQ3p5bUxFd3lzOE9ieW80Z2NabFd6T2NuY0Zx?=
 =?utf-8?B?QVo2YWRRSHllcDRxWlZkNy9GMWhMSTBTdHJmWmN4QjZpcmJIamljSHdiRWVx?=
 =?utf-8?B?cTZnSGE5UWtGRnhWdTFRNDI5VGJqRUFBRW93bmdTQVNUanhFb0dkQzBFREk5?=
 =?utf-8?B?RzlXWHN4Y2NlbDd6bGE0QXd3VzVuVTFZSDVtNmN5aFhZb0tWMVdPRUJPVjdl?=
 =?utf-8?B?aXdZN1phTjg0R3hkeWpRNms2bnNHSWFlcTBSQk1kcEFpcStVbFltME9xYTFp?=
 =?utf-8?B?bU5CN2lMK0cwTWlNU3Fwa1ZGN3JhMi9WUzZKWnloTFBHUTFlRVVYbXhMNUp2?=
 =?utf-8?B?bHpydlgydDdIcnFhbmlQUXdPUEVvL29kcmdvUGVtYlhqc1ZWOHA0ZVJQR0th?=
 =?utf-8?B?ZyttNHY2dW0reTJXbVlMUnMrd2ZkM0REdGhORWlrTzJMM210RDh2UEtrZGFC?=
 =?utf-8?B?Z2dkQi9IRzVXakhrM3V4L0hHMmJrdGMyU0hhQzNHMFRNSUMzWDI3WkpRSHlL?=
 =?utf-8?B?VThkWm1NMWtyc1hpUjJNZUdMNDJlam1vSVRlSXhHa2lZNkVJWTdJbDFEa05J?=
 =?utf-8?B?U1hkWEc0VTNiWElTMU81aG50bHRtWllDd1VBNHZmdnh0d0JiQ09hUnlscHQ4?=
 =?utf-8?B?bmowMHU4akxjU2ZUVlZQVHVENEkybmduQ3U4dThSeTR2TzhaSVVRd1lETmxq?=
 =?utf-8?B?RVFmdERLN0EvRm1sMGFJNnJ5WGgzVjRzVXh1QUdGWjNxSU8rZ1h6dXRQR1JP?=
 =?utf-8?B?T3pGa2owenRKelRPMjVNdUFZMGNzWjlydkJvZEUwS2RWSmluWHpob1dUOFZt?=
 =?utf-8?B?SklFdE51MityRUd3eW40OTNySVZOZGFUVXdINnRmcXlxbjZBY2kwSWdreXVP?=
 =?utf-8?B?enl3Z0c3TzNOYzlpT1BMYkpQUjZhWjNUZjVtTnhWQW1WK3Ayb2NHOWxWcDZQ?=
 =?utf-8?B?OWY3bnFRQ1pHb2pxSEJ4V21jTnloZ2ozVVFTYTRGV01UYlgyODVVMVg4Ui9y?=
 =?utf-8?B?TlFEVHNIQkRvNFdrUEtOdVZjMnEzRWhJUFpudjgySnlMeFQvelJZbE9hMERY?=
 =?utf-8?B?UGREeng0MmpyL1lHeE1idnBkWmlxcnJ1TEczd1RRPT0=?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf7b16d7-084f-4e33-5f7c-08d8bef2d780
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2021 16:29:08.2102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XMr4bMdAiYA5GF+X4vFfx7WNwJNXn6D1gbKBWdJJIeGD3d+Gu27xSnZ9z8gk7ZAFb3spFpdftmkMx+5FU6x79A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4318
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 2021-01-21 um 2:40 p.m. schrieb Daniel Vetter:
> Recently there was a fairly long thread about recoreable hardware page
> faults, how they can deadlock, and what to do about that.
>
> While the discussion is still fresh I figured good time to try and
> document the conclusions a bit.
Thank you Daniel. This is a good summary of our discussion. It's also an
external reference I can point our HW engineers at when they're
wondering about what "real software" does.

Regards,
  Felix


>
> References: https://lore.kernel.org/dri-devel/20210107030127.20393-1-Felix.Kuehling@amd.com/
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@intel.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: Jerome Glisse <jglisse@redhat.com>
> Cc: Felix Kuehling <felix.kuehling@amd.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> --
> I'll be away next week, but figured I'll type this up quickly for some
> comments and to check whether I got this all roughly right.
>
> Critique very much wanted on this, so that we can make sure hw which
> can't preempt (with pagefaults pending) like gfx10 has a clear path to
> support page faults in upstream. So anything I missed, got wrong or
> like that would be good.
> -Daniel
> ---
>  Documentation/driver-api/dma-buf.rst | 66 ++++++++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
>
> diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-api/dma-buf.rst
> index a2133d69872c..e924c1e4f7a3 100644
> --- a/Documentation/driver-api/dma-buf.rst
> +++ b/Documentation/driver-api/dma-buf.rst
> @@ -257,3 +257,69 @@ fences in the kernel. This means:
>    userspace is allowed to use userspace fencing or long running compute
>    workloads. This also means no implicit fencing for shared buffers in these
>    cases.
> +
> +Recoverable Hardware Page Faults Implications
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Modern hardware supports recoverable page faults, which has a lot of
> +implications for DMA fences.
> +
> +First, a pending page fault obviously holds up the work that's running on the
> +accelerator and a memory allocation is usually required to resolve the fault.
> +But memory allocations are not allowed to gate completion of DMA fences, which
> +means any workload using recoverable page faults cannot use DMA fences for
> +synchronization. Synchronization fences controlled by userspace must be used
> +instead.
> +
> +On GPUs this poses a problem, because current desktop compositor protocols on
> +Linus rely on DMA fences, which means without an entirely new userspace stack
> +built on top of userspace fences, they cannot benefit from recoverable page
> +faults. The exception is when page faults are only used as migration hints and
> +never to on-demand fill a memory request. For now this means recoverable page
> +faults on GPUs are limited to pure compute workloads.
> +
> +Furthermore GPUs usually have shared resources between the 3D rendering and
> +compute side, like compute units or command submission engines. If both a 3D
> +job with a DMA fence and a compute workload using recoverable page faults are
> +pending they could deadlock:
> +
> +- The 3D workload might need to wait for the compute job to finish and release
> +  hardware resources first.
> +
> +- The compute workload might be stuck in a page fault, because the memory
> +  allocation is waiting for the DMA fence of the 3D workload to complete.
> +
> +There are a few ways to prevent this problem:
> +
> +- Compute workloads can always be preempted, even when a page fault is pending
> +  and not yet repaired. Not all hardware supports this.
> +
> +- DMA fence workloads and workloads which need page fault handling have
> +  independent hardware resources to guarantee forward progress. This could be
> +  achieved through e.g. through dedicated engines and minimal compute unit
> +  reservations for DMA fence workloads.
> +
> +- The reservation approach could be further refined by only reserving the
> +  hardware resources for DMA fence workloads when they are in-flight. This must
> +  cover the time from when the DMA fence is visible to other threads up to
> +  moment when fence is completed through dma_fence_signal().
> +
> +- As a last resort, if the hardware provides no useful reservation mechanics,
> +  all workloads must be flushed from the GPU when switching between jobs
> +  requiring DMA fences or jobs requiring page fault handling: This means all DMA
> +  fences must complete before a compute job with page fault handling can be
> +  inserted into the scheduler queue. And vice versa, before a DMA fence can be
> +  made visible anywhere in the system, all compute workloads must be preempted
> +  to guarantee all pending GPU page faults are flushed.
> +
> +Note that workloads that run on independent hardware like copy engines or other
> +GPUs do not have any impact. This allows us to keep using DMA fences internally
> +in the kernel even for resolving hardware page faults, e.g. by using copy
> +engines to clear or copy memory needed to resolve the page fault.
> +
> +In some ways this page fault problem is a special case of the `Infinite DMA
> +Fences` discussions: Infinite fences from compute workloads are allowed to
> +depend on DMA fences, but not the other way around. And not even the page fault
> +problem is new, because some other CPU thread in userspace might
> +hit a page fault which holds up a userspace fence - supporting page faults on
> +GPUs doesn't anything fundamentally new.
