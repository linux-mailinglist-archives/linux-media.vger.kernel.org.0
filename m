Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1C1130DE72
	for <lists+linux-media@lfdr.de>; Wed,  3 Feb 2021 16:43:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234534AbhBCPmR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Feb 2021 10:42:17 -0500
Received: from mail-dm6nam12on2058.outbound.protection.outlook.com ([40.107.243.58]:18309
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234568AbhBCPlm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 3 Feb 2021 10:41:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aD58U6zuTbpUMFt26f9dCF3IRzDViL0dQTb/2or2YWZ9/2PDB4yG2NUUkA4w3mlddtEvCQxIhYz5jURfUNdgYZcru6mMlEgn8L0+G5RZJxCopA5zBPUsjxJUvO29MVJePsdlWPe/0dsRVeWr/YsK/llpAIKcIe8PBxbAFs0WqXFBs4PhZELXRej5dp2amxZuTV8H36TwmA/NwKLejlkwg5fmzINeeSMjUg4e73wZfMxm/vjwAc3P88/dimp0wwV6vB5ItNr7ZXLCvLaiu/2M4zD8BSX11aoI02MiH248lw/Iuqa9oVBV+nTBczoHTGMK3Tdv4exCvuuI0hPVZHjx/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=80uSnHz5yTihufOdJyxekWd2luIYtnOZf/QeM0L3T7s=;
 b=bNJkhUo40oJGMhChsJBBytmSPwoL+iBS2ljC2W/6XDUi6xmtj5MZgQLBJF7d3B6M4w4+CDbAjvlXsP4kkKLlo73tKm01WRfNnTmBuJn+ddgAROv8dpeRfWYYDVjCZdM24gxL8F/exS1Pb3YGB37B4F/f67dFChtIN35WZ4dVq/8LMicb3THmD9M3XJmPyq6ixh571TeTk9mCna2x8qglnf4TEQJ7ofeTCU0GCDc93Fo9dRU0TG++ddJMuFck1/kK+yOFIcxfe3Qs4Hn96D8j+NtTg44aq/D2eJ+bKG/40rLm57MWRQW5WX0o72guzLMFZ1kfxl6AT/ntn5HmBGeqcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=80uSnHz5yTihufOdJyxekWd2luIYtnOZf/QeM0L3T7s=;
 b=07Wbq9HMvYSCczYsLOdeM8xru/sC8CztH5phlfOWOHc1b/Mcpn+S46+KkTL5PRTeCwch2rDvaKKijBDgzm/iaS6s2niKZFMWN1D63x8B/4UeaLYfi/6oUlEu2AhULvH/mhGPfcl/WUKrgo3psiZeJlhMKk/q0+HWnTtfIPqCP4o=
Authentication-Results: lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4962.namprd12.prod.outlook.com (2603:10b6:208:17e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.22; Wed, 3 Feb
 2021 15:40:44 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3805.024; Wed, 3 Feb 2021
 15:40:44 +0000
Subject: Re: [PATCH] dma-fence: Document recoverable page fault implications
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Dave Airlie <airlied@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@intel.com>,
        Jerome Glisse <jglisse@redhat.com>,
        Felix Kuehling <felix.kuehling@amd.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20210203152921.2429937-1-daniel.vetter@ffwll.ch>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <8e28d123-e7ea-aade-dd7f-af0eb2999ce6@amd.com>
Date:   Wed, 3 Feb 2021 16:40:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210203152921.2429937-1-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR10CA0012.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::22) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by AM0PR10CA0012.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20 via Frontend Transport; Wed, 3 Feb 2021 15:40:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4f2f877a-e12a-4d18-7b8a-08d8c85a118b
X-MS-TrafficTypeDiagnostic: BL0PR12MB4962:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB4962B76032D20C006800B5BB83B49@BL0PR12MB4962.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H642dU/OFTAuU5ceoMWPOX85Wqgf9aJkXk8QsVJNydOGtR3fk0MP6SBWk/MHWNKa1SgSM71Ynfuk1r0s4Cwe0hMXtlWQMv1UTQt+eyUEfLd82vmL9KBlwDjPfN9Z0LPQ4W/Na+Zve0B1aVmExA3DhiGoCT3EvavRmLQfKjniJsKCj3OWRz6yhPWAu7N03O6YukLSQ6B0PqZkZmwqjCVcSPjUvd4tUuWLNnqwuFtY2xBnoFvKZtKE4JhcaN8OV3JMe76kCE1fli1EIQsjTnB9vkZP5OD9n3MOiQZQueOsxeMfxt79irNtjojsyOuep/Ocha7hQTriQQHDiVm7wok7iOwZ1cPFlXEBn4G2U04WXrMvdJsOI0D1yLEg/twK3D2I65QMGPMnh/6LyynVdfQNBb8J7iTYfNYdd1tdjtBmMnlvD7jte9t5+W1OIdDdm9Q7s5PS4dWr6MWTTjfHPNpOOPdSUyMJYFdL5gRhxxXqOUcsxfPaT7RyxkmC3NKvMYGFMVt3gPHvgcZ2qWPiqOBr6oozmDRGrfhsX4T3rSy0B1AGOqrQt+2aAz7LIeNeEeioZqUIC3KJNdoKfU8zindiUf++7zW5XWjPPQ/yGBSYlnoZhTEsHFrIFdDDpdCEwAURaBmgYHIKNh83Y7M1GXSyBwWDQ/WXjEEXp3Cb1x9nddQ93VBrKKw3kp6aJumnWWgf
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(366004)(376002)(396003)(136003)(83380400001)(2616005)(478600001)(66574015)(966005)(54906003)(5660300002)(4326008)(16526019)(7416002)(110136005)(66946007)(316002)(31696002)(86362001)(36756003)(6666004)(66476007)(66556008)(6486002)(8676002)(45080400002)(52116002)(8936002)(186003)(31686004)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZzVDa3kzMnNCR01LZEt2TllvNHd6Z2FyeWNiQ21EQVBNU0lVUjVGcW9USDFO?=
 =?utf-8?B?ZTUwWU1DL2IyeStjdXdLbkVkSGluMlFQMFVxNDF4SHhNNnFMcnVrdEFPS1c1?=
 =?utf-8?B?T0JOQmtFUktQUHpmOWJZMy9TMW9kalJENDdBK0tOZXE5RytwL1NhOVQwZERy?=
 =?utf-8?B?SmNVVXJoTVlFUTFxbzVUYW16alVRZ21vb0RwTkF5cU92bHBJZllKb0xjdTE5?=
 =?utf-8?B?OGpYMWh5YkRoQ0ZUSVNDSlVNOC9YV2xWQkMrdmxXeC83R2dEQk5zaXlha0dn?=
 =?utf-8?B?NVhqb2Y5L0ZiMEt4UlNrMW1CTk9vVGdpeUtHejAxRzFVM2JpOG1aV01Ma05t?=
 =?utf-8?B?V2psWDkzN2tHYkdGa1ZiN1F5enlUOVZ5Nm0wTnlwUGxxVW9Xb1FhZVhtT3c3?=
 =?utf-8?B?S21xQWRlWEVIUmx3dFdMNENuNXZaS2gxNDdFeGNpMDdNSHV6cjV3QzhXUVcr?=
 =?utf-8?B?cVp1akN3aWhlR1B3dkhlK0J3OXl3aGIyR0ErRDgvb3VCcGxmU085VDMxcmpu?=
 =?utf-8?B?eldjcEIwWm1HRDRualF0K20xZ3ZUdVJiYUtLQlJjc3NucDRVSDd6TWRXWnNj?=
 =?utf-8?B?MDByZ3VwTlNuNElINUZqNzdRbHI2WGhOVXJCZzJaTFBZS3VTdU5UUlIwSGxo?=
 =?utf-8?B?V3kzaWIyWi8wTUI5a0FDL2FSV2dWTHo4S1JSZnBQK3QwbmE3UG5nYzhZbGlL?=
 =?utf-8?B?RjZTYWZCRlZ4MUN2Tjl0K0YrYnVPcTB3TlVhelBROUIvdGhtMXVlcmdoV2VK?=
 =?utf-8?B?NDd2RmFvblhmaTFrdzBpVE5DdTV5b3JGZHpSUGpIc1pMNWg3MmRmMDZuUXZX?=
 =?utf-8?B?d0xGd29nM3FGcTgyL2xXSHp0aHhZTXREazlST1dOb0NPR1ZzSWF5RkROZStl?=
 =?utf-8?B?NEkraVM3U3Y0MlRVeWlkcGYwK2hvcG9pNGpDZDJ5QTk3NzNFTUdoRXpZZ0ls?=
 =?utf-8?B?ZmdXSjZXSEpsMnV0VVFham0rY0prcTdudFl0YnZRMnlCZGRlR1JNTG9BNldX?=
 =?utf-8?B?YmMwWWIwZDVTeDZ0djgrY2ovZnRpTVlaTU41dkZraEZLYkRJRlRxdDRXR1dX?=
 =?utf-8?B?Wmk0cWpzVVh2YXNRSE9odWJEays4R25TZEJzaWtHZDhXcW1POVQ2QVBhVzN2?=
 =?utf-8?B?OTlXa0NDT0VtL3pWZGs4VlFnMW9weWJMTldGS1pmb1BIeURZTjRpRjFtUkhV?=
 =?utf-8?B?VnR5Mm1ERHJCRk5IRFo2TmEzVWc0SzJ6NzUwY1U5c2N4THRWN1MwaWsveFBR?=
 =?utf-8?B?M0I3Nmc2UU5yZDc5cC9xbGFmSEg0YXEydzVObmVkS2lxOEwzaUJHTzVjYVZK?=
 =?utf-8?B?RkhXSUpXSlR3MHVndDUwb1Jtb2N5M1RBRVRmRWZtL0UwbDcyRDUyaGhSb3py?=
 =?utf-8?B?Ulh6STJRVEt2WHBoUTFOYXpFUkVoVGhFdXc1bWt6VG9aSi9RUmVWVTcwWHZi?=
 =?utf-8?B?MzdJRkcvRnhjN0s4dndhOXZCWkZObDA5Z1pDRnl5NGJORHNEcjJJNWw4Y0E1?=
 =?utf-8?B?TC9jZ3RDMDFmQ2hOOW5lSk8xdDh5UldPS3FpN2d5UXQwWmx3RXBiOFcyLzZL?=
 =?utf-8?B?dHFIMURiZ2F0T1k3dTJYY0VpMmMwWWxKWVVSSCtobG9GQy9lUFVwY2FYb0lx?=
 =?utf-8?B?VkhMZUhIekZhTlBSK1RqcmF2S2N4SklzWVZCS1BReWpFWGdaUWtiUDZaVVV5?=
 =?utf-8?B?aFpSS21IQXFmTXljRnVnRXNlR1NScDdZdmltVVpSNmo4VjM4cG94RC9mUmp5?=
 =?utf-8?B?LzNTeXZBQnRsdVM1cldTTmdDRXhZNFdIWTE1Tlowa0JSYmJwVC82ekpYSHhD?=
 =?utf-8?B?OUl1dTU0eVo5U254bGJXVG5MdTRrNUM0R1Z6RitWMUN5VHNTV1NSQTR5dVBz?=
 =?utf-8?Q?9bdMkIeH0F2dw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f2f877a-e12a-4d18-7b8a-08d8c85a118b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2021 15:40:44.4118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qcI2Z3WldtmaJH1Jxc9aFrWxPSc3LZmIx3Nj3iLrtDr3UqBee/oo6uyYknPN18kb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4962
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 03.02.21 um 16:29 schrieb Daniel Vetter:
> Recently there was a fairly long thread about recoreable hardware page
> faults, how they can deadlock, and what to do about that.
>
> While the discussion is still fresh I figured good time to try and
> document the conclusions a bit. This documentation section explains
> what's the potential problem, and the remedies we've discussed,
> roughly ordered from best to worst.
>
> v2: Linus -> Linux typoe (Dave)
>
> v3:
> - Make it clear drivers only need to implement one option (Christian)
> - Make it clearer that implicit sync is out the window with exclusive
>    fences (Christian)
> - Add the fairly theoretical option of segementing the memory (either
>    statically or through dynamic checks at runtime for which piece of
>    memory is managed how) and explain why it's not a great idea (Felix)
>
> References: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fdri-devel%2F20210107030127.20393-1-Felix.Kuehling%40amd.com%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C767e1096b9554ab5b6dd08d8c8587f0f%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637479629728871138%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=Fth2y8c3LuNbweQGrsS7VjYESGlshu6DfQyikiWBwyQ%3D&amp;reserved=0
> Cc: Dave Airlie <airlied@gmail.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@intel.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: Jerome Glisse <jglisse@redhat.com>
> Cc: Felix Kuehling <felix.kuehling@amd.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org

Reviewed-by: Christian König <christian.koenig@amd.com>

I still haven't fully given up on supporting implicit sync with user 
fences, but it is really an eeek, let's try very hard to avoid that, 
problem.

Christian

> ---
>   Documentation/driver-api/dma-buf.rst | 76 ++++++++++++++++++++++++++++
>   1 file changed, 76 insertions(+)
>
> diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-api/dma-buf.rst
> index a2133d69872c..7f37ec30d9fd 100644
> --- a/Documentation/driver-api/dma-buf.rst
> +++ b/Documentation/driver-api/dma-buf.rst
> @@ -257,3 +257,79 @@ fences in the kernel. This means:
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
> +Linux rely on DMA fences, which means without an entirely new userspace stack
> +built on top of userspace fences, they cannot benefit from recoverable page
> +faults. Specifically this means implicit synchronization will not be possible.
> +The exception is when page faults are only used as migration hints and never to
> +on-demand fill a memory request. For now this means recoverable page
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
> +There are a few options to prevent this problem, one of which drivers need to
> +ensure:
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
> +- Only a fairly theoretical option would be to untangle these dependencies when
> +  allocating memory to repair hardware page faults, either through separate
> +  memory blocks or runtime tracking of the full dependency graph of all DMA
> +  fences. This results very wide impact on the kernel, since resolving the page
> +  on the CPU side can itself involve a page fault. It is much more feasible and
> +  robust to limit the impact of handling hardware page faults to the specific
> +  driver.
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

