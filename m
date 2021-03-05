Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67B3B32E579
	for <lists+linux-media@lfdr.de>; Fri,  5 Mar 2021 11:00:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbhCEJ7j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Mar 2021 04:59:39 -0500
Received: from mail-bn8nam12on2085.outbound.protection.outlook.com ([40.107.237.85]:35297
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229660AbhCEJ7R (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 5 Mar 2021 04:59:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CGo6cti5qbOcappaGgkXUBns6+GccHdxtx46Oafsu94y01+k7/frvI1Z3JbB5S5ePqbkoqX0QXIAsNmZxcTnYtcZR+gbmPPmtqgpmDAHfCvxqN23FLXVvBqzuBiZAX1ETPrnqRcJcI9i8dT5Z2dQ358BR1g7E2IVleqiHg0piWBo6lOqi356vwAzMHgUuIJ7A5rHPFAXNVxoTvmQB4hmuqMS18KAKdv64jaObB5vPxj6hJ5s14PfTxWj/37AXW9+m/WXCbx9tnV40+PmCTvB2qKGsRfz39l8aMezfoLgsFCMiPNk7hHa5/RT04jz0cg0hyDEdHkUlV9D2pKJ6O70zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GdjHEZ+k0x34y32CRq6uEaPw7wtqBxAvAQLcKp+B3AM=;
 b=CqIvoCrhet9eGD6aIqOXoodeNooN71GedzN32iFaBkQua++xZfYKvo22Hx1dlPTnGfmXN9rxsf6HCMnBJqRe7CiLyM1bwBlJs9o7fGn/GAvHIP25PJ1dyqhz+vXw4eIhpZ3jxwync4WMjm6Lz0Lf8+HWKO8dK6qkk00HvxzG5ObDLqjZlsGImyTqV8flYOEVblACvXKezO2iK57gkvH8suchpwRkyLnCxk6lEAmzBMBrB3C83Wnvn7Yh9Ft2e9sN0nRrPzDYmnrsB7OYGAKv+MY11KJb7URZaNTT1J5i665A0Pp9LYsFCnud3+r12r/f9ibcKfCSsN6ta9sz9Y+SJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GdjHEZ+k0x34y32CRq6uEaPw7wtqBxAvAQLcKp+B3AM=;
 b=zHzkkf4WL22bUXXdkXJzOEu8gaFQgPyYc9H6k+H5r4ykMOo50JJjDUjSsJKc1JiNVH0JFm0fx/99LaGzAP+UYbFvIBy2C0cgcTSvlUhmCAyTcMTkLGkp/c1jfCGxNaxEWxjbz6WKgyYrD4OFwdgxR1fCRVZtMVgbgjh+/ZGcNzM=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=none action=none
 header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3680.namprd12.prod.outlook.com (2603:10b6:208:169::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Fri, 5 Mar
 2021 09:59:13 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3912.023; Fri, 5 Mar 2021
 09:59:13 +0000
Subject: Re: [PATCH v8 1/5] drm: Add a sharable drm page-pool implementation
To:     John Stultz <john.stultz@linaro.org>,
        lkml <linux-kernel@vger.kernel.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Sandeep Patil <sspatil@google.com>,
        Daniel Mentz <danielmentz@google.com>,
        =?UTF-8?Q?=c3=98rjan_Eide?= <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Simon Ser <contact@emersion.fr>,
        James Jones <jajones@nvidia.com>, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org
References: <20210304232011.1479036-1-john.stultz@linaro.org>
 <20210304232011.1479036-2-john.stultz@linaro.org>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <4eb979da-d0d4-33a0-b32e-5709c08fdc15@amd.com>
Date:   Fri, 5 Mar 2021 10:59:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210304232011.1479036-2-john.stultz@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:23ea:890a:84c3:71ab]
X-ClientProxiedBy: AM0PR06CA0110.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::15) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:23ea:890a:84c3:71ab] (2a02:908:1252:fb60:23ea:890a:84c3:71ab) by AM0PR06CA0110.eurprd06.prod.outlook.com (2603:10a6:208:ab::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Fri, 5 Mar 2021 09:59:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b0fae56a-31e2-4bc2-a486-08d8dfbd5409
X-MS-TrafficTypeDiagnostic: MN2PR12MB3680:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3680A4F6C71A6DB7D9047AED83969@MN2PR12MB3680.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F/JU7uwGpa62pCWiZCAS11/i0hKVzXUpz/qkOvVKQ0sdRAFLmEv2vs8qGxkWoIVvB3+zkT2fcvnom16aqlUHuOtdC+kQ8qq9EogsFHugghkQ36Hs0SE2kwAf2cdEzkmuE2lNSB80q2VRXeWWA9G/PbqvsZKeFC6kXdzviEA799yjPv72MJoiVFenRNIakwOcBElqQ50Ev5tFMGLSlNMy7H6TK+yMThjBPiaO4zBkA6LQ1h1TDp45P2M/WbrYih3KpNPAl6woAQqVWvIzs5Uie45eXd9/Zp52XfPIom5JsrDNxf1aw4+TlkI/oLXnJXufBwykQsFxeEeBvfDKqS0vUahDIEKwzOtvmIWDxKNHf09d/b3B/WiVKGX/65WCzb6AHcQ0Js97kBd1lgmGCe/icO6+QpPcesbixu/2Dd1MT7BlMEkILh5JbQcEklUHeadl1ZWNsRO0JTF1qwG1Cyh8oGJoGGzt8qp7p64NHAH178A3kya5eiZi1Pdf+p44c4fk91kfoHxKcFNVWkbrh3Q+vCFF72ly/0wJVWA31NBcTTv5r6e0J9+C7uzKrhSBqori5Mn68i5z75JAfvolW2fp8rTNSvsBuws18bkd9iSlBnk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(396003)(366004)(39860400002)(7416002)(478600001)(2616005)(186003)(8676002)(16526019)(8936002)(36756003)(30864003)(31696002)(5660300002)(6486002)(86362001)(83380400001)(66574015)(52116002)(6666004)(66476007)(31686004)(4326008)(66556008)(66946007)(110136005)(316002)(2906002)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZmdoYTQ3cXpZWFUzc3hDaTRFNklUS3hnWmhLYkM0OFNkaFQwMjJkQTFuM2dT?=
 =?utf-8?B?Q25SNlFKMUNkTlgxZGpORmt5NWhlaVMzakl2S0UrWFZudEFCcWFJQ09GYzJL?=
 =?utf-8?B?TXhXdS9iYU94QWlhVTJXWDAwekFNSTFGWW5VTUJuVklJVWxjenZUWjFKYk5s?=
 =?utf-8?B?MmhqMnBxZEFjalNYbkUxMjZiS3RodFE2cWVxY1VKTUtlWlFGdm8wTnI3bkxt?=
 =?utf-8?B?TlBTR053ckYxTllRT1hFUTZmTGxiYlgveUphZ0VUZXh1a2RwZXhoU1JQOWtv?=
 =?utf-8?B?NldTaVJxRUZIQjRTYlp5SG9kc1lYMFpTamxtblErcDA1NG9aVTBSeXhBVEg1?=
 =?utf-8?B?VUllNDlPdENKM1R1NFVMRUZqOEthZVFtUWs0Qk8yNkNOTVdLbDFIU0pIODM2?=
 =?utf-8?B?TzdjNUtmeVZOYVNnTnFUOGlFbnY0ckRmR01DeEdhOFNDbFB3anBrRWVaZmpC?=
 =?utf-8?B?Z25HYms5WU1kUnFaQmFaUXBwT1psY3NXYkN2OElQdVBCTEw2b3JmTTVoUmVi?=
 =?utf-8?B?em5rSllOWmU2ZVlkRWRoaERNOE5ha1RTNWFXdHNrUGZDL1N5V1BKTFRwNFRx?=
 =?utf-8?B?V0hyTzNGUW9WUmNCVThYSFAwRnFHRTlORG5lSmQ4UjJucDhVMWh3dkpGQmhW?=
 =?utf-8?B?TVZvSUpFT2ZpV3BWM1k2amJZZDFnR0hqNVdFSkp1NHZDQmNDWEJ3ejN1Qi9j?=
 =?utf-8?B?VGxjODNYWVkxdElnU0gvOWxVRUdHR0VtOWg2cFVKSWhhb2FHdm9xTmY2bUlT?=
 =?utf-8?B?NUdUVXdjNkFkeGQ4Q2ZKRGJIN0xjcGxYdEEwd1hLY0hZM0Y5NUZFbXI2UzlN?=
 =?utf-8?B?d3BSQWZndFdoTm56d3pHODM3aGFRMDBPeThwdjNWUHB4MVlRR05QTWdmK0Z4?=
 =?utf-8?B?ZTJNa0pteTRCVnBTMm5ad2VwVmU4R1Jvd1p6UWxWMjh3eXcyVlBlZHQ5ZC9U?=
 =?utf-8?B?dTBDSXBLYXNNbEc1NkIvckpXckVaVndvWENGNkRCdlhEM0JPWHVvMCtGWG1J?=
 =?utf-8?B?dlpxYzl4SGpFL2pEUGhpTjVvcnZhTy82ZGZhR1hZY2ZaZ1c4UjFFS1dCeEVP?=
 =?utf-8?B?SnhQTHFNVmVRelFYMzV6cVVOL2h3ZGEvdUhYZ2VTWTFVQjlVM1Z2L1ovb1Ji?=
 =?utf-8?B?VnZQZkd4aWYvKzFJU2EyUXFDbjh5cjFYbnRUMWQ5NE1Lc0J2SGZDdDFHYWxU?=
 =?utf-8?B?UmhuMm94OHJqNEtXTWl6aUUzaUhLbzRXRi9RQklqY1I2ek4xYWwyUDdVNGlV?=
 =?utf-8?B?RmZHLzZFb0tYRkpwamp3MmNKaFc0OTNyWGs1aEc3dVVZM1hQbUUxZmM0emZM?=
 =?utf-8?B?ZklNZFJ3N3E4RjlXREZUNXBkaEpubVViYStabWUycm85SmI1d0tFb2p6aUhj?=
 =?utf-8?B?c01wQzQ3U0dBd1UxOEJJK01zcFU0czR4SUlQTWdXY2o3RTg1QmFUcFdBV1Bq?=
 =?utf-8?B?NmRkMEZPUEZWTmo5d0pUaUQ2OUFUQ0NHbm5kZjlBc0NHbk5hOHJqR2lVSEJa?=
 =?utf-8?B?Z2x2b2wxREpEcDVVWk1OL0QwOUdiZktWeVdkSFpuRmU0WmxtT21OWjZOQlRX?=
 =?utf-8?B?T0VTUHBaUjQ3RjdNMkFOZDlaNUxjR29tS2ZZMVlvZ0diYXVsRU9QcllJb3hD?=
 =?utf-8?B?c0VqU3lrenpxc0xvNkhHTkxFRkcxNkw0cFVZNkd3aFFvRFVqT3FCRHJZVWFq?=
 =?utf-8?B?bTExM3pRcXNlV1ppUCtZY2lpTEN6NjJmQWZ5dUd5WU9iVDZiQ2o4dXduOSt1?=
 =?utf-8?B?MTk0VGJQZitUV29QamJJbElVS09Bc01IKytNMldpbnlYN3ZtTzZkOEowU3V4?=
 =?utf-8?B?NzRVVUJIenRqOGU0Y1BYczhFMmh0bG9aSW9uNTVhbG53U3lMRU5YcTNZazRJ?=
 =?utf-8?Q?j87x5zwAOfu/N?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0fae56a-31e2-4bc2-a486-08d8dfbd5409
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2021 09:59:13.2411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1zKPOPcUeEr5JgO2M8IJGch/GJecx9P7xJ9gVccEpNptb5XdiGOFpjN5i/9ymnwa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3680
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 05.03.21 um 00:20 schrieb John Stultz:
> This adds a shrinker controlled page pool, extracted
> out of the ttm_pool logic, and abstracted out a bit
> so it can be used by other non-ttm drivers.

In general please keep the kernel doc which is in TTMs pool.

>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Liam Mark <lmark@codeaurora.org>
> Cc: Chris Goldsworthy <cgoldswo@codeaurora.org>
> Cc: Laura Abbott <labbott@kernel.org>
> Cc: Brian Starkey <Brian.Starkey@arm.com>
> Cc: Hridya Valsaraju <hridya@google.com>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Sandeep Patil <sspatil@google.com>
> Cc: Daniel Mentz <danielmentz@google.com>
> Cc: Ørjan Eide <orjan.eide@arm.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Ezequiel Garcia <ezequiel@collabora.com>
> Cc: Simon Ser <contact@emersion.fr>
> Cc: James Jones <jajones@nvidia.com>
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
> v8:
> * Completely rewritten from scratch, using only the
>    ttm_pool logic so it can be dual licensed.
> ---
>   drivers/gpu/drm/Kconfig     |   4 +
>   drivers/gpu/drm/Makefile    |   2 +
>   drivers/gpu/drm/page_pool.c | 214 ++++++++++++++++++++++++++++++++++++
>   include/drm/page_pool.h     |  65 +++++++++++
>   4 files changed, 285 insertions(+)
>   create mode 100644 drivers/gpu/drm/page_pool.c
>   create mode 100644 include/drm/page_pool.h
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index e392a90ca687..7cbcecb8f7df 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -177,6 +177,10 @@ config DRM_DP_CEC
>   	  Note: not all adapters support this feature, and even for those
>   	  that do support this they often do not hook up the CEC pin.
>   
> +config DRM_PAGE_POOL
> +	bool
> +	depends on DRM
> +
>   config DRM_TTM
>   	tristate
>   	depends on DRM && MMU
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 926adef289db..2dc7b2fe3fe5 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -39,6 +39,8 @@ obj-$(CONFIG_DRM_VRAM_HELPER) += drm_vram_helper.o
>   drm_ttm_helper-y := drm_gem_ttm_helper.o
>   obj-$(CONFIG_DRM_TTM_HELPER) += drm_ttm_helper.o
>   
> +drm-$(CONFIG_DRM_PAGE_POOL) += page_pool.o
> +
>   drm_kms_helper-y := drm_bridge_connector.o drm_crtc_helper.o drm_dp_helper.o \
>   		drm_dsc.o drm_probe_helper.o \
>   		drm_plane_helper.o drm_dp_mst_topology.o drm_atomic_helper.o \
> diff --git a/drivers/gpu/drm/page_pool.c b/drivers/gpu/drm/page_pool.c
> new file mode 100644
> index 000000000000..a60b954cfe0f
> --- /dev/null
> +++ b/drivers/gpu/drm/page_pool.c
> @@ -0,0 +1,214 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Sharable page pool implementation
> + *
> + * Extracted from drivers/gpu/drm/ttm/ttm_pool.c
> + * Copyright 2020 Advanced Micro Devices, Inc.
> + * Copyright 2021 Linaro Ltd.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * Authors: Christian König, John Stultz
> + */
> +
> +#include <linux/module.h>
> +#include <linux/highmem.h>
> +#include <linux/shrinker.h>
> +#include <drm/page_pool.h>
> +
> +static unsigned long page_pool_size;
> +
> +MODULE_PARM_DESC(page_pool_size, "Number of pages in the WC/UC/DMA pool");
> +module_param(page_pool_size, ulong, 0644);
> +
> +static atomic_long_t allocated_pages;
> +
> +static struct mutex shrinker_lock;
> +static struct list_head shrinker_list;
> +static struct shrinker mm_shrinker;
> +
> +void drm_page_pool_set_max(unsigned long max)

This function and a whole bunch of other can be static.

And in general I'm not sure if we really need wrappers for functionality 
like this, e.g. it is only used once during startup IIRC.

> +{
> +	if (!page_pool_size)
> +		page_pool_size = max;
> +}
> +
> +unsigned long drm_page_pool_get_max(void)
> +{
> +	return page_pool_size;
> +}
> +
> +unsigned long drm_page_pool_get_total(void)
> +{
> +	return atomic_long_read(&allocated_pages);
> +}
> +
> +unsigned long drm_page_pool_get_size(struct drm_page_pool *pool)
> +{
> +	unsigned long size;
> +
> +	spin_lock(&pool->lock);
> +	size = pool->page_count;
> +	spin_unlock(&pool->lock);
> +	return size;
> +}
> +
> +/* Give pages into a specific pool */
> +void drm_page_pool_add(struct drm_page_pool *pool, struct page *p)
> +{
> +	unsigned int i, num_pages = 1 << pool->order;
> +
> +	for (i = 0; i < num_pages; ++i) {
> +		if (PageHighMem(p))
> +			clear_highpage(p + i);
> +		else
> +			clear_page(page_address(p + i));
> +	}
> +
> +	spin_lock(&pool->lock);
> +	list_add(&p->lru, &pool->pages);
> +	pool->page_count += 1 << pool->order;
> +	spin_unlock(&pool->lock);
> +	atomic_long_add(1 << pool->order, &allocated_pages);
> +}
> +
> +/* Take pages from a specific pool, return NULL when nothing available */
> +struct page *drm_page_pool_remove(struct drm_page_pool *pool)
> +{
> +	struct page *p;
> +
> +	spin_lock(&pool->lock);
> +	p = list_first_entry_or_null(&pool->pages, typeof(*p), lru);
> +	if (p) {
> +		atomic_long_sub(1 << pool->order, &allocated_pages);
> +		pool->page_count -= 1 << pool->order;
> +		list_del(&p->lru);
> +	}
> +	spin_unlock(&pool->lock);
> +
> +	return p;
> +}
> +
> +/* Initialize and add a pool type to the global shrinker list */
> +void drm_page_pool_init(struct drm_page_pool *pool, unsigned int order,
> +			unsigned long (*free_page)(struct drm_page_pool *pool, struct page *p))
> +{
> +	pool->order = order;
> +	spin_lock_init(&pool->lock);
> +	INIT_LIST_HEAD(&pool->pages);
> +	pool->free = free_page;
> +	pool->page_count = 0;
> +
> +	mutex_lock(&shrinker_lock);
> +	list_add_tail(&pool->shrinker_list, &shrinker_list);
> +	mutex_unlock(&shrinker_lock);
> +}
> +
> +/* Remove a pool_type from the global shrinker list and free all pages */
> +void drm_page_pool_fini(struct drm_page_pool *pool)
> +{
> +	struct page *p, *tmp;
> +
> +	mutex_lock(&shrinker_lock);
> +	list_del(&pool->shrinker_list);
> +	mutex_unlock(&shrinker_lock);
> +
> +	list_for_each_entry_safe(p, tmp, &pool->pages, lru)

This is buggy, see the recently committed patch to the TTM page pool on 
drm-misc-next.

> +		pool->free(pool, p);
> +}
> +
> +/* Free pages using the global shrinker list */
> +static unsigned int drm_page_pool_shrink(void)
> +{
> +	struct drm_page_pool *pool;
> +	unsigned int num_freed;
> +	struct page *p;
> +
> +	mutex_lock(&shrinker_lock);
> +	pool = list_first_entry(&shrinker_list, typeof(*pool), shrinker_list);
> +
> +	p = drm_page_pool_remove(pool);
> +
> +	list_move_tail(&pool->shrinker_list, &shrinker_list);
> +	mutex_unlock(&shrinker_lock);
> +
> +	if (p) {
> +		pool->free(pool, p);
> +		num_freed = 1 << pool->order;
> +	} else {
> +		num_freed = 0;
> +	}
> +
> +	return num_freed;

The problem with this approach is that you somehow need to make sure 
that the pool isn't freed while the shrinker is run.

The easiest way to archive that is to add a new helper to the shrinker 
code which just grabs the write side of their semaphore and release it 
again.

With that done the shrinker_lock can also be switched back to a spinlock 
again.

> +}
> +
> +/* As long as pages are available make sure to release at least one */
> +static unsigned long drm_page_pool_shrinker_scan(struct shrinker *shrink,
> +						 struct shrink_control *sc)
> +{
> +	unsigned long num_freed = 0;
> +
> +	do
> +		num_freed += drm_page_pool_shrink();
> +	while (!num_freed && atomic_long_read(&allocated_pages));
> +
> +	return num_freed;

IIRC this also need a "num_pages ? num_pages : SHRINK_EMPTY", but please 
double check with the shrinker code.

> +}
> +
> +/* Return the number of pages available or SHRINK_EMPTY if we have none */
> +static unsigned long drm_page_pool_shrinker_count(struct shrinker *shrink,
> +						  struct shrink_control *sc)
> +{
> +	unsigned long num_pages = atomic_long_read(&allocated_pages);
> +
> +	return num_pages ? num_pages : SHRINK_EMPTY;
> +}
> +
> +/**
> + * drm_page_pool_shrinker_setup - Initialize globals
> + *
> + * @num_pages: default number of pages
> + *
> + * Initialize the global locks and lists for the shrinker.
> + */
> +int drm_page_pool_shrinker_setup(void)

Please call that one _init() and maybe give the pool size as parameter.

> +{
> +	mutex_init(&shrinker_lock);
> +	INIT_LIST_HEAD(&shrinker_list);
> +
> +	mm_shrinker.count_objects = drm_page_pool_shrinker_count;
> +	mm_shrinker.scan_objects = drm_page_pool_shrinker_scan;
> +	mm_shrinker.seeks = 1;
> +	return register_shrinker(&mm_shrinker);
> +}
> +
> +/**
> + * drm_page_pool_shrinker_teardown - Finalize globals
> + *
> + * Unregister the shrinker.
> + */
> +void drm_page_pool_shrinker_teardown(void)

Please call that _fini().

Regards,
Christian.

> +{
> +	unregister_shrinker(&mm_shrinker);
> +	WARN_ON(!list_empty(&shrinker_list));
> +}
> +
> +module_init(drm_page_pool_shrinker_setup);
> +module_exit(drm_page_pool_shrinker_teardown);
> +MODULE_LICENSE("Dual MIT/GPL");
> diff --git a/include/drm/page_pool.h b/include/drm/page_pool.h
> new file mode 100644
> index 000000000000..d8b8a8415629
> --- /dev/null
> +++ b/include/drm/page_pool.h
> @@ -0,0 +1,65 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
> +/*
> + * Extracted from include/drm/ttm/ttm_pool.h
> + * Copyright 2020 Advanced Micro Devices, Inc.
> + * Copyright 2021 Linaro Ltd
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * Authors: Christian König, John Stultz
> + */
> +
> +#ifndef _DRM_PAGE_POOL_H_
> +#define _DRM_PAGE_POOL_H_
> +
> +#include <linux/mmzone.h>
> +#include <linux/llist.h>
> +#include <linux/spinlock.h>
> +
> +/**
> + * drm_page_pool - Page Pool for a certain memory type
> + *
> + * @order: the allocation order our pages have
> + * @pages: the list of pages in the pool
> + * @shrinker_list: our place on the global shrinker list
> + * @lock: protection of the page list
> + * @page_count: number of pages currently in the pool
> + * @free: Function pointer to free the page
> + */
> +struct drm_page_pool {
> +	unsigned int order;
> +	struct list_head pages;
> +	struct list_head shrinker_list;
> +	spinlock_t lock;
> +
> +	unsigned long page_count;
> +	unsigned long (*free)(struct drm_page_pool *pool, struct page *p);
> +};
> +
> +void drm_page_pool_set_max(unsigned long max);
> +unsigned long drm_page_pool_get_max(void);
> +unsigned long drm_page_pool_get_total(void);
> +unsigned long drm_page_pool_get_size(struct drm_page_pool *pool);
> +void drm_page_pool_add(struct drm_page_pool *pool, struct page *p);
> +struct page *drm_page_pool_remove(struct drm_page_pool *pool);
> +void drm_page_pool_init(struct drm_page_pool *pool, unsigned int order,
> +			unsigned long (*free_page)(struct drm_page_pool *pool, struct page *p));
> +void drm_page_pool_fini(struct drm_page_pool *pool);
> +
> +#endif

