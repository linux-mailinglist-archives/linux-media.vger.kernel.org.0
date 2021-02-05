Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 419A13106FE
	for <lists+linux-media@lfdr.de>; Fri,  5 Feb 2021 09:49:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229683AbhBEIr7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Feb 2021 03:47:59 -0500
Received: from mail-mw2nam12on2067.outbound.protection.outlook.com ([40.107.244.67]:56480
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229651AbhBEIr5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 5 Feb 2021 03:47:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VE20xaYq5Kz1w5oxaMvxP9A0oS9CK+p8kruHevjhcZyskfSSmrbLcMjx7934SdnAvkhx5JQGtmApwvhuFGw8VUE3YFFJrw9PedmbUSYdeyFDj6b8rUDMXcRQhj7dpZf40sfW8kTwbEqIohzfMJqmmf+PAmeiYpSzHww7lCvUPygtEpvMwIfOf5vxVVESViGZK9WRYDWM846FtloHjg01yGf7aIDGUf0S+NkLMucUF7DZvD+b84k6912Sdplu8FQ4vRAoCfRpwXVd5wUmwc7q7mF3EBpXtau2irSvW83vFXOk0IDvMdvbvnABAtFrPoOgAYT5EQfPq+zDRJADS9B/qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PVnwuWvSaJi7gKWNowvjs6bBtf98dxvM09LldPsbdFM=;
 b=ifVmW4XXH4CHiPP0L6/pEaxU+1tf5eTmRoLZh0fPP354DFEqh0TJ9Cc/jthU+BrGMfFBcfDFiTLV5MVKOu8OV4FaVRUqeEqD1fJdhSeC+Bk3y3a0XXl6z8OrJJ3QYvAAfXUUmFWD4UNBDoV9ARE7qintyKAA1UO8WkqasykVuOSMNRlNfV4zLA75BxFV5mFA7pbCB+yl1GNAqOhIjkAKxlx4Be21tbDm01Yj2+yMb0vexqAoC8JujqHEg1CE7Jq3fa9JtTw7hgnTO2uB+nrDg8eioUP93k3FJiHaDShteMt2YacqndYt062hoGtTncHg3QT7dl2MowtEThYNBPz+ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PVnwuWvSaJi7gKWNowvjs6bBtf98dxvM09LldPsbdFM=;
 b=4cgzdVQ7P1B3d8O6MZ1aa4MvLQXJWjHgmkcwrZ4mqgnL58kVdaXiAev7TB48H9xccxWREPFhcYd8l9QH9cnCKk8eb33qixKiXk8Obz3u71BSe36SDedEB1WMwfI/HbEIkN2eo6S58aaJ239Kvl9J4S4aRaGdDCbT2CAMi9Msd84=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=none action=none
 header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2419.namprd12.prod.outlook.com (2603:10b6:207:44::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Fri, 5 Feb
 2021 08:47:01 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3825.023; Fri, 5 Feb 2021
 08:47:01 +0000
Subject: Re: [RFC][PATCH v6 1/7] drm: Add a sharable drm page-pool
 implementation
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
References: <20210205080621.3102035-1-john.stultz@linaro.org>
 <20210205080621.3102035-2-john.stultz@linaro.org>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <4471b3b0-603e-6dbb-8064-ff4a95afbba9@amd.com>
Date:   Fri, 5 Feb 2021 09:46:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210205080621.3102035-2-john.stultz@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR02CA0018.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::31) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by AM0PR02CA0018.eurprd02.prod.outlook.com (2603:10a6:208:3e::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19 via Frontend Transport; Fri, 5 Feb 2021 08:46:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 354ff368-24c6-42c4-41c8-08d8c9b29af4
X-MS-TrafficTypeDiagnostic: BL0PR12MB2419:
X-Microsoft-Antispam-PRVS: <BL0PR12MB241949DF191D0078E06BEBA883B29@BL0PR12MB2419.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +Momtrf1jpZhr9sXMolKl8LqowZ9I9r4kScZQsl+10fuDY0zfL0AmsEH/6ud583pqMp5YCLtXusGetzToSbOGjBlYUklwGsEVEJnuLIrSvM3a5hC7Cw3FJ5pZqDg0kVB/NbGWaZCN9mPTTXY+KrBGYeolS8+tdJjt7TbIGf215WfyEsOy0fIPAuN1fn9b+/NRTFXvIWMjS81FYVCHP0n+NYb1iX7XqWElW52W0+2X2XFFfjfcy+xPO5K/yicKO6iiZ3ieWJY/7D6xQxgv8yyJwCnGqP3JW23z/3F5rLjRWk9h9NYAVxjqkNhGoNnFpdIVRcnpDvDFK91Q/PPmPCvjL+uI+5rj+x/OX1Dhu5b2StieTNJpio5LIKk7BRnfsGeKJ+5dLEWwiDHX6/ekPjyT027U+8yWaYSqKHN1CZGncZSwSnzbNqabI8o35h5zEjqeSJ2F3NPuwMtBL8U9M+nM/wuF6M/CjOdflq3o/uLSpE26+AB3ztVsgGtuKGnZ0yDLKY3seG55iyTtD08WzCb1Mp2uJ0nOPRL811RVRq4edIa2lzJsTKuHcRjsdEeSoMd9lY1xS/XjNLB097V1rwt9JXHqPhzzI8CQscRe9n8WRE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(366004)(376002)(39860400002)(6666004)(4326008)(8676002)(31686004)(16526019)(83380400001)(478600001)(86362001)(316002)(186003)(36756003)(66946007)(30864003)(110136005)(54906003)(66574015)(66476007)(52116002)(2906002)(6486002)(2616005)(31696002)(5660300002)(8936002)(66556008)(7416002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?U1B5bm1lYWFLenpBa2NuY2JERDljUWkxVnRucEEwSERWeFhIQ1JjNFBoU1pD?=
 =?utf-8?B?b1FoSmxuTHRNZC9mamZoSml5TzhYMWZsQ3FOdGlHa01hUEdaN1pWZnpFOE9T?=
 =?utf-8?B?RWpJbzRFdzIvbitwbDVwL1lnRzF0RWNucW9NMUd6dWs4SlRvV0psNiswSkRr?=
 =?utf-8?B?NHRQVDFvTWJzNWJJM2ZNeVFKVXU3MzVqWVZEdDZHRjhqbEdzVXducDlIUjFX?=
 =?utf-8?B?SGg2UUZqOWxmY2NBMnk3SHZLVFNHa1hTcGwycUdFWStnMU4xQTRLN2I3d2dh?=
 =?utf-8?B?TVVRVURwMTN0RkFxZVd6dENyU2w2MFZ2bDZFeW9pWGMxSFViTUJTSmkwTWd3?=
 =?utf-8?B?VFZ4SFVqN3hJUldtSmJHUkQrZS82UW1mY2NEaCsyZnZnMHhHbVdxQk5Ecm9O?=
 =?utf-8?B?NzYzcGc5OE1UMHlNZFd6dkpnUHF5VUx4L3BnbFdqQ3hxczhRWXF3KzNKRVQr?=
 =?utf-8?B?TGFsVDZWT09QeHlheFJFQVA5amlXOE40bXBrajFxK2dOeFkrUG5aTXoyeG5U?=
 =?utf-8?B?TlZEVzdqclFwRmdrSXh0RFhSSVg3TlI1SkpMc1BISmsrVkNLdjl1aHlWUW9t?=
 =?utf-8?B?MXBJWjZrM1V6M2ZvYWpPblR4bXpCd3VBVGFLQXR2UHRlMGVTZVhnRUtZMHRL?=
 =?utf-8?B?dUlJN2ZHL1NQeFd3VUd1RDMxR3ZUWFBFK2lNMzByL05YYUtRNVgwQWdnQThL?=
 =?utf-8?B?SVFVRWphQlZsUWZWb0MzQTIrdUNhMnpHdjlPNWhJamdoak9hVVBpMDIzNHBy?=
 =?utf-8?B?NkRrMFhQRVlkamZvcjUwZ0RtU29YeEU5UmkrMVUyYStOMzhMUFVQN3VNNFM1?=
 =?utf-8?B?K0FudG5yM0JXTTQ4YUVTWWZYby8yS0IxWWh3aktKMjVxaU1UeGRXWnBKVGlH?=
 =?utf-8?B?eG9zTjA3cmVLTmlpUGdsS2luNXA2SDVBODMyM2h6Tk5iVllnSFgrTGpPV20y?=
 =?utf-8?B?KzNiam1tY0dRMnNLU2hybS9lL0FwY3EyYklxWTZ3MWxPcWRKWFlTSEpWQmt5?=
 =?utf-8?B?Wkc4ZnpGaEhtc3FvSmhCTkVXcFFjZkJua2dnTWh3UitmLzFpSk9La3BvbnVY?=
 =?utf-8?B?N3Evc0hWL0ZUWjA4K1JDUTRHRi9SR2w5VGxLMHd5M2dRWjdscFArbUowSXha?=
 =?utf-8?B?cHJaQkpXeEozNjVBcVk2Y2JVMU1BdFJ2enlMTzBkMlAvaWVFRnN4TFo4cVAr?=
 =?utf-8?B?Nk1yemhtNWhRenVsYXFHdk9BY1hGVy9zVlRzeXhEM1FOWEdxdW1jeXNsR0RU?=
 =?utf-8?B?SlNMeTV6TlZQQVZybVRFVnNEbk0yMkxzME5FenVQKzRHekNRNnZBRFBGcGtE?=
 =?utf-8?B?LzgvVGFUelkyWjBkS016TURZYUpQNUNkSGJid2twSVlkNHBuWEVRdHF2cFM2?=
 =?utf-8?B?UnRDd2hYMUhQRVE4NnY4aUJ2SUtSWnFtK01uM0N3Y1FOcmtkK0J1U2pYcWo4?=
 =?utf-8?B?OVA3UjF6RWRFak0xU09MYlQxVXJVODY2L0JXVEtUQXZVU25ZeWtPcTFwUk1j?=
 =?utf-8?B?SjRtNTNzM0wycFl6dHovUGxnK01KNkRPenpmamFTbDloS1NKR3p3VXZkVzMy?=
 =?utf-8?B?MTU2azdobnBRWExFaGY1WjhWTnk2OEc4aUZVTWdobkxPSXd2T3VQVWJPOERD?=
 =?utf-8?B?UmtrVEdVY3VMWW0xdWJFMGgzaVRJa3gybjFURDNjNGk4bDZhMUpLSjFKNnRK?=
 =?utf-8?B?TjlxekRyRzhnckovbHNQT3NrN1BTTks1VDByellCYll6dG90ZWs5VW5pMWN6?=
 =?utf-8?B?WWtTVlRyS1dlUWt2VmkydndjR1ZGS0t1U0JabmprZG55VkRNRWF5aitLdUNp?=
 =?utf-8?B?Q3ArQ1pQamk0dWxhUDBYVGw0Ui90dEhxVHltM08yVURtYi9pVkdid01pS0pL?=
 =?utf-8?Q?PxmbTRmtMZu8O?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 354ff368-24c6-42c4-41c8-08d8c9b29af4
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 08:47:01.7393
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rDAdN3Qm2WkgUXbW+p5KocSClCUw/0yGnfGZ3UZdlwIWBPlrXOFWicgCPP/78xg3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2419
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 05.02.21 um 09:06 schrieb John Stultz:
> This adds a shrinker controlled page pool, closely
> following the ttm_pool logic, which is abstracted out
> a bit so it can be used by other non-ttm drivers.
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
>   drivers/gpu/drm/Kconfig     |   4 +
>   drivers/gpu/drm/Makefile    |   1 +
>   drivers/gpu/drm/page_pool.c | 220 ++++++++++++++++++++++++++++++++++++
>   include/drm/page_pool.h     |  54 +++++++++
>   4 files changed, 279 insertions(+)
>   create mode 100644 drivers/gpu/drm/page_pool.c
>   create mode 100644 include/drm/page_pool.h
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 0973f408d75f..d16bf340ed2e 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -174,6 +174,10 @@ config DRM_DP_CEC
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
> index fefaff4c832d..877e0111ed34 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -32,6 +32,7 @@ drm-$(CONFIG_AGP) += drm_agpsupport.o
>   drm-$(CONFIG_PCI) += drm_pci.o
>   drm-$(CONFIG_DEBUG_FS) += drm_debugfs.o drm_debugfs_crc.o
>   drm-$(CONFIG_DRM_LOAD_EDID_FIRMWARE) += drm_edid_load.o
> +drm-$(CONFIG_DRM_PAGE_POOL) += page_pool.o
>   
>   drm_vram_helper-y := drm_gem_vram_helper.o
>   obj-$(CONFIG_DRM_VRAM_HELPER) += drm_vram_helper.o
> diff --git a/drivers/gpu/drm/page_pool.c b/drivers/gpu/drm/page_pool.c
> new file mode 100644
> index 000000000000..2139f86e6ca7
> --- /dev/null
> +++ b/drivers/gpu/drm/page_pool.c
> @@ -0,0 +1,220 @@
> +// SPDX-License-Identifier: GPL-2.0

Please use a BSD/MIT compatible license if you want to copy this from 
the TTM code.

> +/*
> + * DRM page pool system
> + *
> + * Copyright (C) 2020 Linaro Ltd.
> + *
> + * Based on the ION page pool code
> + * Copyright (C) 2011 Google, Inc.
> + * As well as the ttm_pool code
> + * Copyright (C) 2020 Advanced Micro Devices, Inc.
> + */
> +
> +#include <linux/freezer.h>
> +#include <linux/list.h>
> +#include <linux/slab.h>
> +#include <linux/swap.h>
> +#include <linux/sched/signal.h>
> +#include <drm/page_pool.h>
> +
> +static LIST_HEAD(pool_list);
> +static DEFINE_MUTEX(pool_list_lock);
> +static atomic_long_t total_pages;
> +static unsigned long page_pool_max;
> +MODULE_PARM_DESC(page_pool_max, "Number of pages in the WC/UC/DMA pool");
> +module_param(page_pool_max, ulong, 0644);
> +
> +void drm_page_pool_set_max(unsigned long max)
> +{
> +	/* only write once */
> +	if (!page_pool_max)
> +		page_pool_max = max;
> +}
> +
> +unsigned long drm_page_pool_get_max(void)
> +{
> +	return page_pool_max;
> +}
> +
> +unsigned long drm_page_pool_get_total(void)
> +{
> +	return atomic_long_read(&total_pages);
> +}
> +
> +int drm_page_pool_get_size(struct drm_page_pool *pool)
> +{
> +	int ret;
> +
> +	spin_lock(&pool->lock);
> +	ret = pool->count;
> +	spin_unlock(&pool->lock);

Maybe use an atomic for the count instead?

> +	return ret;
> +}
> +
> +static inline unsigned int drm_page_pool_free_pages(struct drm_page_pool *pool,
> +						    struct page *page)
> +{
> +	return pool->free(page, pool->order);
> +}
> +
> +static int drm_page_pool_shrink_one(void);
> +
> +void drm_page_pool_add(struct drm_page_pool *pool, struct page *page)
> +{
> +	spin_lock(&pool->lock);
> +	list_add_tail(&page->lru, &pool->items);
> +	pool->count++;
> +	atomic_long_add(1 << pool->order, &total_pages);
> +	spin_unlock(&pool->lock);
> +
> +	mod_node_page_state(page_pgdat(page), NR_KERNEL_MISC_RECLAIMABLE,
> +			    1 << pool->order);

Hui what? What should that be good for?

> +
> +	/* make sure we don't grow too large */
> +	while (page_pool_max && atomic_long_read(&total_pages) > page_pool_max)
> +		drm_page_pool_shrink_one();
> +}
> +EXPORT_SYMBOL_GPL(drm_page_pool_add);
> +
> +static struct page *drm_page_pool_remove(struct drm_page_pool *pool)
> +{
> +	struct page *page;
> +
> +	if (!pool->count)
> +		return NULL;

Better use list_first_entry_or_null instead of checking the count.

This way you can also pull the lock into the function.

> +
> +	page = list_first_entry(&pool->items, struct page, lru);
> +	pool->count--;
> +	atomic_long_sub(1 << pool->order, &total_pages);
> +
> +	list_del(&page->lru);
> +	mod_node_page_state(page_pgdat(page), NR_KERNEL_MISC_RECLAIMABLE,
> +			    -(1 << pool->order));
> +	return page;
> +}
> +
> +struct page *drm_page_pool_fetch(struct drm_page_pool *pool)
> +{
> +	struct page *page = NULL;
> +
> +	if (!pool) {
> +		WARN_ON(!pool);
> +		return NULL;
> +	}
> +
> +	spin_lock(&pool->lock);
> +	page = drm_page_pool_remove(pool);
> +	spin_unlock(&pool->lock);
> +
> +	return page;
> +}
> +EXPORT_SYMBOL_GPL(drm_page_pool_fetch);
> +
> +struct drm_page_pool *drm_page_pool_create(unsigned int order,
> +					   int (*free_page)(struct page *p, unsigned int order))
> +{
> +	struct drm_page_pool *pool = kmalloc(sizeof(*pool), GFP_KERNEL);

Why not making this an embedded object? We should not see much dynamic 
pool creation.

> +
> +	if (!pool)
> +		return NULL;
> +
> +	pool->count = 0;
> +	INIT_LIST_HEAD(&pool->items);
> +	pool->order = order;
> +	pool->free = free_page;
> +	spin_lock_init(&pool->lock);
> +	INIT_LIST_HEAD(&pool->list);
> +
> +	mutex_lock(&pool_list_lock);
> +	list_add(&pool->list, &pool_list);
> +	mutex_unlock(&pool_list_lock);
> +
> +	return pool;
> +}
> +EXPORT_SYMBOL_GPL(drm_page_pool_create);
> +
> +void drm_page_pool_destroy(struct drm_page_pool *pool)
> +{
> +	struct page *page;
> +
> +	/* Remove us from the pool list */
> +	mutex_lock(&pool_list_lock);
> +	list_del(&pool->list);
> +	mutex_unlock(&pool_list_lock);
> +
> +	/* Free any remaining pages in the pool */
> +	spin_lock(&pool->lock);

Locking should be unnecessary when the pool is destroyed anyway.

> +	while (pool->count) {
> +		page = drm_page_pool_remove(pool);
> +		spin_unlock(&pool->lock);
> +		drm_page_pool_free_pages(pool, page);
> +		spin_lock(&pool->lock);
> +	}
> +	spin_unlock(&pool->lock);
> +
> +	kfree(pool);
> +}
> +EXPORT_SYMBOL_GPL(drm_page_pool_destroy);
> +
> +static int drm_page_pool_shrink_one(void)
> +{
> +	struct drm_page_pool *pool;
> +	struct page *page;
> +	int nr_freed = 0;
> +
> +	mutex_lock(&pool_list_lock);
> +	pool = list_first_entry(&pool_list, typeof(*pool), list);
> +
> +	spin_lock(&pool->lock);
> +	page = drm_page_pool_remove(pool);
> +	spin_unlock(&pool->lock);
> +
> +	if (page)
> +		nr_freed = drm_page_pool_free_pages(pool, page);
> +
> +	list_move_tail(&pool->list, &pool_list);

Better to move this up, directly after the list_first_entry().

> +	mutex_unlock(&pool_list_lock);
> +
> +	return nr_freed;
> +}
> +
> +static unsigned long drm_page_pool_shrink_count(struct shrinker *shrinker,
> +						struct shrink_control *sc)
> +{
> +	unsigned long count =  atomic_long_read(&total_pages);
> +
> +	return count ? count : SHRINK_EMPTY;
> +}
> +
> +static unsigned long drm_page_pool_shrink_scan(struct shrinker *shrinker,
> +					       struct shrink_control *sc)
> +{
> +	int to_scan = sc->nr_to_scan;
> +	int nr_total = 0;
> +
> +	if (to_scan == 0)
> +		return 0;
> +
> +	do {
> +		int nr_freed = drm_page_pool_shrink_one();
> +
> +		to_scan -= nr_freed;
> +		nr_total += nr_freed;
> +	} while (to_scan >= 0 && atomic_long_read(&total_pages));
> +
> +	return nr_total;
> +}
> +
> +static struct shrinker pool_shrinker = {
> +	.count_objects = drm_page_pool_shrink_count,
> +	.scan_objects = drm_page_pool_shrink_scan,
> +	.seeks = 1,
> +	.batch = 0,
> +};
> +
> +int drm_page_pool_init_shrinker(void)
> +{
> +	return register_shrinker(&pool_shrinker);
> +}
> +module_init(drm_page_pool_init_shrinker);
> +MODULE_LICENSE("GPL v2");
> diff --git a/include/drm/page_pool.h b/include/drm/page_pool.h
> new file mode 100644
> index 000000000000..47e240b2bc69
> --- /dev/null
> +++ b/include/drm/page_pool.h
> @@ -0,0 +1,54 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
> +/*
> + * Copyright 2020 Advanced Micro Devices, Inc.
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
> + * Authors: Christian König
> + */
> +
> +#ifndef _DRM_PAGE_POOL_H_
> +#define _DRM_PAGE_POOL_H_
> +
> +#include <linux/mmzone.h>
> +#include <linux/llist.h>
> +#include <linux/spinlock.h>
> +
> +struct drm_page_pool {
> +	int count;
> +	struct list_head items;
> +
> +	int order;
> +	int (*free)(struct page *p, unsigned int order);
> +
> +	spinlock_t lock;
> +	struct list_head list;
> +};
> +
> +void drm_page_pool_set_max(unsigned long max);
> +unsigned long drm_page_pool_get_max(void);
> +unsigned long drm_page_pool_get_total(void);
> +int drm_page_pool_get_size(struct drm_page_pool *pool);
> +struct page *drm_page_pool_fetch(struct drm_page_pool *pool);
> +void drm_page_pool_add(struct drm_page_pool *pool, struct page *page);
> +struct drm_page_pool *drm_page_pool_create(unsigned int order,
> +					   int (*free_page)(struct page *p, unsigned int order));
> +void drm_page_pool_destroy(struct drm_page_pool *pool);
> +
> +#endif

