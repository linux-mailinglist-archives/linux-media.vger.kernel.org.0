Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DF62305149
	for <lists+linux-media@lfdr.de>; Wed, 27 Jan 2021 05:48:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239553AbhA0EqH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 23:46:07 -0500
Received: from mail-mw2nam10on2076.outbound.protection.outlook.com ([40.107.94.76]:12446
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2390311AbhA0AXq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Jan 2021 19:23:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RPrYyaLktj1e+fiT0abDoPLtpuMFNV6caA3W2DszhuOrCp9Mko1xWlLYu9t6zcy9FPacavPrB0LVeSOqecDGiWEl+i3yIYuS42QpmWfG9AXbAFheOiayvvvtwhZFYYAdyTl7lHcf3ifRzyYHZWCGYhoNSrG0uK6dBiuTCaTiZIrkfcDewgDBKBbtZhfRQ2nCdBACCXkgaEii63USgaYMWWC8/4ksJLvDYk5a32alBdE8uw7r0EygvHicXD7EpxeaP8GYsUcqpVcw3uCjZMaKuJefIw6VPhqjc0vjBuUwdaqUHXzgHNWelBsiLgptjejKOcaWc+FGSuPyY11J8bg/aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1l2jpREp67DXQsplm1cWhAIkbPyxz93Yt7Psu9Uf8mg=;
 b=jZVjEXG00gDuf93xzS8o/YhuTBGYtY6MRQM+eO6oO5949CkFa7nGbdE4WcPKHNpCu33ersIVzlCudikXbh0eRJcyjRN3DU2Fm0csnxUQrbzM5vOufUN/1dydCyAdjWgdt5qpDs7ha87itJEoJ8szLUR97Qp3KA8daxEOTKKB/3UG2N8FZ9KacZeVBbsIyzY71T5KMkbkCzCnjEEYo+SBf1wbTqXdzUxjJhPRNAqM4USWgaf+pFuBnH2ZdmqAQaMv42nUQWmCaiVrIMDbjVOFO4XuKZv3y+XMNxGXOjOGCRzlehjl8LSHiwS13bSyiUipQjvdAAO+41Jrcik1LsOOoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1l2jpREp67DXQsplm1cWhAIkbPyxz93Yt7Psu9Uf8mg=;
 b=LjnpwGkyMVztF0v14r1kT3GwVSk8uQbAP89KjHnloty2o5sY0VKSq9uKDT/wWLx3KbX3an5yAmDoOL/8DkhtGxC7siO7NqREttj5OSlCzXB+wZkbk/Gx/9EI8iFohns2hXDZK4H0BrjpEIFjhRAXUBJXRC87Br+j05ZwTgXNqCc=
Authentication-Results: lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4061.namprd12.prod.outlook.com (2603:10b6:208:19a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Wed, 27 Jan
 2021 00:22:52 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::ec8d:851e:525d:a6ab]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::ec8d:851e:525d:a6ab%8]) with mapi id 15.20.3784.017; Wed, 27 Jan 2021
 00:22:52 +0000
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
Message-ID: <6d373177-2645-1d67-9c14-dcad87c4f4d9@amd.com>
Date:   Tue, 26 Jan 2021 19:22:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210121194056.1734409-1-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [142.117.121.176]
X-ClientProxiedBy: YTXPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::21) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.117.121.176) by YTXPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend Transport; Wed, 27 Jan 2021 00:22:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2cf39b5c-803a-4585-5ae8-08d8c259af62
X-MS-TrafficTypeDiagnostic: MN2PR12MB4061:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB40615E60D27A05058BAB11BB92BB9@MN2PR12MB4061.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RATGgqAssN31xCE7B9liZXF3iv6ifvNgindIf29fmUu6DigqQgY9jVCDknneirN2XpG7NmLe3ig/oTTvwvdZR8y0EVaXlec6nqZt4weYNOOQmy1TI7oeNFiSRpve0RBU5ynQnb4VY5rq+1PEQzCVF5P1phhQNmfIP2Mk954nw1qEc0eyb42wNJ8r/HhgNFieiu2FVLpFUysPJVU20e0tBdxp5ch3jm3XbhovKMCOl7y3DVs8kbBKiP25zMgsXWSdUh8HLRZt1nAgeBBD3unz/ZBgrcY7U6DJzQnysyUxG9ixHoI4ybetOHHSzcG2T1xlWhrjWiAM2ugGHprIPGMJxswHOzHbIRjEyoX1/tCr4+yWKnaAfLnnVrYLUH2kI8XC7V5i7puT36Vx7pVM7WBBa2EuijatC2fswpzPFhA1FeOADVtUvjv6iiDdmR+w9Q0k6e7SagKlNNAG77YNUJzMXOfXR4TGCBKXw6WVRkoE74jdXXL2qtncEh0qVpzT19tL5HC23fbw3rIGAj0OSvyxyZSBjAaWF16AUuYAHZCf25JzdVTst1V08EIEzXL5OPdg
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB4948.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(136003)(396003)(376002)(39860400002)(31686004)(26005)(66574015)(2616005)(316002)(44832011)(110136005)(54906003)(2906002)(186003)(86362001)(966005)(16526019)(956004)(8676002)(16576012)(5660300002)(66946007)(66556008)(66476007)(4326008)(31696002)(478600001)(36756003)(6486002)(8936002)(52116002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TEEyTDR4WVpzYm1kSXhhaHFPQkY3eGhHcnQ1YmZDU0psRVZxb0JTRzBrR0oz?=
 =?utf-8?B?alRpcHc0UnAxWU96dlMvVjJwa0N3VGhadE5uT1RxcXVNSjZGdXluRlNKSkJE?=
 =?utf-8?B?UFJwTTBzeW1JZEZHV3dYN1Q2QnRwcjk1UUlxcjFhdUpLMmNJT2pzS3NDQUJj?=
 =?utf-8?B?bCtKOXFYNUZmZ01ZSlBFNFlibXN2bTQxSzZ1TUE3VVRJUEVSd0ZURjF3ZTBp?=
 =?utf-8?B?V0FUeW1rNkY4SlQ4dTVSWTFkVGtkTWhheVp5VTVJSDZIUVdOK2JKb1ZONkpp?=
 =?utf-8?B?Ky83WXcxMWIvcEwxdy83UENLaDdUOXVWZ2tDbE5NTVhET1piZDdHVnV0MzNr?=
 =?utf-8?B?K2c4TU85ZzB5OWJpZm9aYWRISHJxdEFRYXdEVm1MNkgyU0VKUGxrRWp1bjZ6?=
 =?utf-8?B?SWFheGx3bjhVOFBvSGRFbHRxMDluZVFZSVBmY3ZydTdpclVVNk9mSFl5dm1G?=
 =?utf-8?B?c3FOSURhSDZWV3pqczVEcFM3YzFFWml1TEk2UlBzNkxZSUFWUXJ2WnlPL1Rz?=
 =?utf-8?B?d3hzWW5UekhSc1R1RGlEUHprM2c3a2RoOVdWcmhMdzZ6LzVERGY3N2xPMEox?=
 =?utf-8?B?UkdDTkhzcnFkc1EvM2tzOUlRR2UrMmt0Snc1VnhpWS9iTDloODJ3NkxXcDd2?=
 =?utf-8?B?SDZRYmRsdFRCWFRHZE9QOEY2R2VVT0FaVjJTZjhFT0NwNkdBRkg0V2Vjblpm?=
 =?utf-8?B?RmdrVExqRCtiYWg3WHR1UWx5V2N0bzZPZlU5WnUvOWVZRzhlUkZ4NUVDOHFG?=
 =?utf-8?B?RVMzUmh5cXEvNjJOWVpRdHBYL0xsaVlML1NXd2I3c01mdU9OMTdWN2VLV1dr?=
 =?utf-8?B?cFQzc3kyam1taURSaGFSNXFjREd0eVAxMisvNFlQWlNERm5EZHkrTDZUeXRm?=
 =?utf-8?B?S1BrbnJsQjJ4czFSOFhtcFovc01hbHZPYklGWm5TQzB0WTlVNnpJYVRROEVN?=
 =?utf-8?B?dW1Mazl3RSs5WWd6bDNQZDZVU0JOeWtSRjB2MXk5MzVab3ZlbnQ2VUFXU2p2?=
 =?utf-8?B?NnBBeWtEc25nZXNOQWxWSFJpWmlDUVRjZmtRbHhxTHg3STJUcElsc0xPcktv?=
 =?utf-8?B?VFlzMDlYa1hhM2RxQkV2YXdZV21udk1iT2lJdkV4ZmlFNUtwWHRMN1ZUZTRS?=
 =?utf-8?B?eXlEZFVTY1VFZW1nVC9NNCthMHY2bVZYZ0JRMjBjK3phOEp6VTNOZnFtWkZF?=
 =?utf-8?B?VUVsYWZ6S1ZkR21oSHdkcGVVdWlBSzNhOUVzbEV5cFFuUUp2UmkrUGZhK3pV?=
 =?utf-8?B?MDl2QUF5T3pxamk4SmkwemdwTmJCeWVubVc4K0pGSDRRUTNBU202ZnE0QzVz?=
 =?utf-8?B?d3JOZThqQmZiOXBid1VQa2hWN1RKZzBPN0lvL2g4OEk2YmwxWlE3eVdReFhS?=
 =?utf-8?B?QTJEU1hTdjVNeDBtVVNxT1AyTzEvNTYxSFVuNXd4UWF4eXd6Y0xjdWljMFpp?=
 =?utf-8?B?SklQS0NzQlZYVldhRHZ1UU1qYVpzdzZvMUNOcmpnPT0=?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cf39b5c-803a-4585-5ae8-08d8c259af62
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 00:22:52.5262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PsWIwsjmoBBdH/ANwj95JkxA0vxQwt6EsFXOxFqH5gOjfz1YxtZmzLjzIoGwylAKuh/H/SPZkXLeEHA5g3qANQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4061
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 2021-01-21 um 2:40 p.m. schrieb Daniel Vetter:
> Recently there was a fairly long thread about recoreable hardware page
> faults, how they can deadlock, and what to do about that.
>
> While the discussion is still fresh I figured good time to try and
> document the conclusions a bit.
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

I thought of another possible workaround:

  * Partition the memory. Servicing of page faults will use a separate
    memory pool that can always be allocated from without waiting for
    fences. This includes memory for page tables and memory for
    migrating data to. You may steal memory from other processes that
    can page fault, so no fence waiting is necessary. Being able to
    steal memory at any time also means there are basically no
    out-of-memory situations you need to worry about. Even page tables
    (except the root page directory of each process) can be stolen in
    the worst case.

Regards,
  Felix

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
