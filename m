Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26DBE3003DF
	for <lists+linux-media@lfdr.de>; Fri, 22 Jan 2021 14:12:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727825AbhAVNLa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Jan 2021 08:11:30 -0500
Received: from mail-dm6nam11on2089.outbound.protection.outlook.com ([40.107.223.89]:50752
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727980AbhAVNLR (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Jan 2021 08:11:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DO+zZvxHxOPrYPGD2nIE8a57nywgvxbl3Egul+POVYRlHk4foPmlSYS04R44fGu0ufBriqyYGokN7x9rPdQ31aNBWnzVrC4qM0BUzVPMdAOBE2gFRHROlodyB9/9z3mwNVgdrfMLmeQjJ/7hRsfdZzE6Nmo7V3PuonXZMdfeE5/Y4J74w2nWKMyLikTZeCyAo7KbiyzGd0f6XoLk/ms/IwW4oTNXNVom4X8zjNmgmjDr4/ltgoxuXKYgHd+2U/Cn+bPArjR5bse3Pn9VVZkuT+BkNvcbk7Ergc/4eWbp+ioJ93C2Gzbv8pbltUEQZ6LmTobM76hgAPaRPflHyHoN5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cRBv5WB/YXndal3FYn/n/7pmE9Iy8f8torjKDWIf52k=;
 b=AQIRfHnjbI6fIOXquQpqp/dVbyVUxMGsqzY7a8COMhsF8XahzSLp9LsaKB6/EUioiaWqllNME0yMflHw0178QHWZ7rxbemSudGwMYUwr0aEp1KAFcSnInbqFQMphs2cRfDHb9+EfUF1NYapUgRWVlMd+gpsYP+Tne3scs9aJunlfwVxUsCDZKRjBwonIs5f5WV/khWKtyQzXrTJm+EHxOEmnJoYMcT+v/0kFH0LaKzSoQbbRi/KEQkxtx/aGQ4/UxOcKsFMVTKB1xrjc46P3KMqwLAauRYejWg0Z9ncDVq9awjNwx30AsuMUmEVHmoaFDFwqoekIyZkNQouLwrcjoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cRBv5WB/YXndal3FYn/n/7pmE9Iy8f8torjKDWIf52k=;
 b=eMFrJnaisaWkp8das8wEh6th7dDUMSxxGGChzvbleKc0L5YT4lBBGtG9Prwmwwa+qrUz2hKgOAHe0gbKwtRo506zTZ9PCvNVQez1ZjYXac9fFsKu3gUMJ41IlguR+dXuwLG6BRj7ensSdQvNmI7w+gJG6LIjU6yGanFQ+OTto8w=
Authentication-Results: lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4518.namprd12.prod.outlook.com (2603:10b6:208:266::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Fri, 22 Jan
 2021 13:10:13 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3784.015; Fri, 22 Jan 2021
 13:10:13 +0000
Subject: Re: [PATCH] RFC: dma-fence: Document recoverable page fault
 implications
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@intel.com>,
        Jerome Glisse <jglisse@redhat.com>,
        Felix Kuehling <felix.kuehling@amd.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20210121194056.1734409-1-daniel.vetter@ffwll.ch>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <38322325-d6c7-cbf9-9361-e2da2fac0451@amd.com>
Date:   Fri, 22 Jan 2021 14:10:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210121194056.1734409-1-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR03CA0083.eurprd03.prod.outlook.com
 (2603:10a6:208:69::24) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by AM0PR03CA0083.eurprd03.prod.outlook.com (2603:10a6:208:69::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11 via Frontend Transport; Fri, 22 Jan 2021 13:10:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 12d9534e-8eb6-4a83-4535-08d8bed70da4
X-MS-TrafficTypeDiagnostic: MN2PR12MB4518:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB45188364C33EC9D51F51BF7083A09@MN2PR12MB4518.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k8foOGYMH0gCkkNfEAFBOc+2L320T0yQVm/svxrGYoav/g3TtOuksmDwXASNWs5bltGrz/TZZhExun0P5iRsHHeDv4U+T3ov43lXLuikwblilnvREMuUoJ5eWNChtSXyF0UgximXRE1psBTesE2eFNZzf8EV5ZH27RLE3rZkOdhepLAoOd/98QTaZucqcl8/UA0jw4OAzJeSNS3rYvM43BLmPQzTXDuQnkTmdj/21qXC9/qoEgWQB7KeuLFHXTrLnC0XmWarqs7GDT7O7xj9/UEUH0C8RLbBpa+R4H6Ri4Zrm1jDdzPzy8wsBPgbPn99wKlwqjYClsOTvm70R/KnSKSCEaH3VkdjuialfNBThbm7qDQvzjDIhadMsXHE9zsqJ5YcHeLeOKRoFeoLfxxe2d0hXkKcdaLVB3xrUNZH7t/vd65MI/55zWbMVxfDIzHqQdt8NOo8n8NRS26NI50hKc4SWG/+nfeHFLtRlrYxKa4RNxTToCUFbNBU1kwiPudqB7ebe2IbBLKvSlG3416OuzL8pnCgX9lmJVxjf1s0Q3R/S8kY1XTErA92iDkeqe3l
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(396003)(346002)(136003)(366004)(8676002)(316002)(6666004)(66556008)(66574015)(66476007)(36756003)(66946007)(186003)(52116002)(5660300002)(31686004)(2616005)(86362001)(16526019)(4326008)(966005)(83380400001)(2906002)(54906003)(6486002)(110136005)(8936002)(45080400002)(478600001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QXVVOU9SVGFzUEJTRkdaaC9GM3N5VlFUQjdFQ2Z5Z0FJcElMRE90VjB3WXl2?=
 =?utf-8?B?dmRlSDBKSjZsVlVxdzA1RVNVank2T0ZvbFhGWUJBNlo1OEhCZmk4RnMxaVBu?=
 =?utf-8?B?OVdMbXJqN1BManJPb09FckdVenBKVHh4MUhkZVZlUmNGRmx3bTdqVFFva0JV?=
 =?utf-8?B?K3ErbVhJZjZqOWxWVlZJeS9pOUhCalM5blpqMGpKUDJSZ0JKcnJybFVzYndX?=
 =?utf-8?B?NGszK3lVVktoZ3NXZ0FwK2FpdGhVM0pRQ1QvbThIMGpNSGNGS1FHblNldlNa?=
 =?utf-8?B?bC9ka2tpNkhueUZ1T2x3S3lodUh2bXVobkpSZnVLWDVVY2Vvc3d2U1A1N0Nz?=
 =?utf-8?B?R0ZEcjlPWCtZaW9tOXhtbkd2N0Q0VHYzRXcvZlhjQ3BTOWU2M1I3c0MrTjNr?=
 =?utf-8?B?R3d6bUdMN3V1YWcvVDhqVGU5THlEcDdGQkVESHBjUmZlRWMwUkx6U3lPZzRT?=
 =?utf-8?B?bXlBTzgxcHZTaW5jb2FSYXQvUUloYmtIdkVWOWhXaUIrWUtkakJwYzN6TWl3?=
 =?utf-8?B?UWdDVVI2K214RlVYdHl2NWI2VUVHSTd5SVplUTBhVHhkaURKYnExemFQamVj?=
 =?utf-8?B?Ymo2OUhuTGxSOHVXOC81M0tpQ25XaGhNNHRvU3dFK29FeUFyd0dndHkxeUtq?=
 =?utf-8?B?OFFsazJGblllT0RLTTd2cVYrSVJsVDFwWVY3bi9OUTUrcXBjcVpkWkdYZHlZ?=
 =?utf-8?B?blRTT3FzQW5BL1gwNFhhSVFpSUdlTXp3eGk3MDJZSmo1OHFxTko3MzF0M1NJ?=
 =?utf-8?B?dHh5UUpqVkI5MG5jL0ZyV001dENXeGFQY3R3dVBBeGFYUFBTU1BRRnp0WXQv?=
 =?utf-8?B?VTNPU1pENU5zRG40OU90ZVNZRkpDWDhWZ3JBNG1ldS85eUdFZWdjL2g2dW1m?=
 =?utf-8?B?ejdvRGdFMVNZUGxwbFd2cmdTVUx2aFJlbEg4ajBOSHYzU29veEZZeHhoZVR0?=
 =?utf-8?B?Nnc4eFR5eGYwaW5KRVMzWU1yUVk1SHBRRVhzOUFHZFdNU3dwblFjVm1CeCtN?=
 =?utf-8?B?V3J0TG9GcURXblFqSFJGMkp0YWlDM20zbkFMREVETDlTMkRZQy8rcFZlRHhN?=
 =?utf-8?B?NEp2THlNSThxSWZReWNlRzlaUVpEOGtNQ0NYeGNVOERWdlZmdTRWRVVlbjVn?=
 =?utf-8?B?czJQL1d3MHNOWlVnZ0pHelZaL1U1SVV6UmVaVjVDS1FreXRmVzRWcHk4QXV5?=
 =?utf-8?B?NlNVVmtEV2c0NSszcHROR0NpT2FEclQzSWNxemE2K0UvU0hFbEpLb1o5VUw1?=
 =?utf-8?B?aVJoRzMwc09WZUlUSTNpQWVralFxRmpRUy9JT2hnSThkS1JWWTQ2ZGl5RzRu?=
 =?utf-8?B?WFM2UXkxdGR0SjhhYUVkcGt6QlFoNVZrNVFtdXp0NjRUSVBjem92NnpNRVVx?=
 =?utf-8?B?MzFZWUQ5R0N3clpJMzV1eFlvaTJ4YzhvS2hadWZUN2tneWFyZEZ5L1Bjd1Fo?=
 =?utf-8?B?dE5KSFlxaldaZENhRVVlTitPdjJROGlYeGM4NEJnSWRndlFPUEpHTmFGWHk4?=
 =?utf-8?Q?ysNe7uwGtHpeVKd9HI/1UUziHYT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12d9534e-8eb6-4a83-4535-08d8bed70da4
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2021 13:10:13.2288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L1V+b9Ih49I/85fCrESx5WJqDFm2w69+ZrRKPWRm21X9gT6+ZhPZti3nZ9gk4hRg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4518
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 21.01.21 um 20:40 schrieb Daniel Vetter:
> Recently there was a fairly long thread about recoreable hardware page
> faults, how they can deadlock, and what to do about that.
>
> While the discussion is still fresh I figured good time to try and
> document the conclusions a bit.
>
> References: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fdri-devel%2F20210107030127.20393-1-Felix.Kuehling%40amd.com%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C94782d99ad7d4e1cc57c08d8be447d74%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637468548672516391%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=AT8QP2r2UczSqCKkPRTJI1cQ0GOGyykgLcMfW8NbD8w%3D&amp;reserved=0
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
>   Documentation/driver-api/dma-buf.rst | 66 ++++++++++++++++++++++++++++
>   1 file changed, 66 insertions(+)
>
> diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-api/dma-buf.rst
> index a2133d69872c..e924c1e4f7a3 100644
> --- a/Documentation/driver-api/dma-buf.rst
> +++ b/Documentation/driver-api/dma-buf.rst
> @@ -257,3 +257,69 @@ fences in the kernel. This means:
>     userspace is allowed to use userspace fencing or long running compute
>     workloads. This also means no implicit fencing for shared buffers in these
>     cases.
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

Up till here it makes perfect sense, but what should this paragraph mean ?

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

Maybe worth noting that it just doesn't work with the implicit 
synchronization we have for existing userspace.

Regards,
Christian.
