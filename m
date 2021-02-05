Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF1EC310712
	for <lists+linux-media@lfdr.de>; Fri,  5 Feb 2021 09:53:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229752AbhBEIv7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Feb 2021 03:51:59 -0500
Received: from mail-bn8nam11on2075.outbound.protection.outlook.com ([40.107.236.75]:31841
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229618AbhBEIv5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 5 Feb 2021 03:51:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y6Pz6J6rgkR42dypFDsnFFhMdyaJvZJrzVAWOm0d1Z9FdeB/Le7BzWss6dBtuRFvF/grczMIXrFa79rkibsV5gribDR7tdG5/UO7Zata7YHmGITk1f6f7h6K7Fx8E/78bsJB0yUdLUR8MJu8KvooYZVXV8LFBSSG165E8YeNqak8GAg5aeZBJAtlnHhy4m/2fgM72SWCxX7R2FYykxh6tC8M3HC8X7thDn2nuvlVNbH6lOVGxewq7pAJMo/OMznKjpC+9ZVEVdQWu0x/KhwjLhkJTx8Q4UjchWVA1gpKrscJ51+C+4plCgoptcYPOyapkVnAXe6UINQ/QK5syf9Ilw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e+O+WE+wgw/rRrjMA6U0TSX1otQT8BiVNpgkLxI6Po4=;
 b=mwqO+PWCExd9dfgu1YrWpI77tvG2LvI8W8wQPpQss8VpN5S/3djqXkyScKsmlj/mZN2XDoXZMv9ZHs0VR0bO2aP1gUS1YlIF7IAtsI9gx6eLB57HAXT5MMF8syMpRoj/s0YojslGA0jfu9vDNUaSHKvu18VL1FU11BGZYZqBv/to12G0EykxRRyN6bKq/iOIWxFl4+BnPIoyzyZf56dL8MZE0Pk/2Ut0mYdEi2CmQuxVO62Qp/d4rCL89P2bTHjYQrj1GCFBjIrPmgAaSAZWjZsPmFOgrbxqx25SNpywtQ57uxO91YjL6TB8lKBPPmSNXs85BwDxoaMkwDS5QhoB+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e+O+WE+wgw/rRrjMA6U0TSX1otQT8BiVNpgkLxI6Po4=;
 b=4k7x2R2HlmdezC+fXsxZRxb9JuEGMmpXdzj+kXZC0PhsFP2+eTRVt2ZTPK4eCa7d4ysNjA8/nahEq92tEjnik8tB7pqnq78Czqzr2OQuAT2J59spW8ekcRsIRrE+eXO0636eWkPzCWxOwF/gy878oeI3rTX2u0qc/rVCWEM2iIw=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=none action=none
 header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4608.namprd12.prod.outlook.com (2603:10b6:208:fd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.24; Fri, 5 Feb
 2021 08:51:00 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3825.023; Fri, 5 Feb 2021
 08:51:00 +0000
Subject: Re: [RFC][PATCH v6 4/7] drm: ttm_pool: Rework ttm_pool to use
 drm_page_pool
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
 <20210205080621.3102035-5-john.stultz@linaro.org>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <28ba71e1-0101-6cb6-5909-df0c4fc0c4d6@amd.com>
Date:   Fri, 5 Feb 2021 09:50:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210205080621.3102035-5-john.stultz@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR10CA0086.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::39) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by AM0PR10CA0086.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::39) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19 via Frontend Transport; Fri, 5 Feb 2021 08:50:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0980959a-2fe6-4eac-1632-08d8c9b32926
X-MS-TrafficTypeDiagnostic: MN2PR12MB4608:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4608868E601FE228A4060A4F83B29@MN2PR12MB4608.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2VAnDLotcpVEwghTkf/MAR64PYZ2QuZyWeRAjp2lCi58u+Pq8fGJI0Act2KE2bG+BaqUc2rAhXvw18RcD2Q7IGr3uYg7B4diwtt2b4LJE2HJmcKPi8fXr+TzK4v+eFeD8mOvFtfubsKU3XhZXtWnqzWtxNghP/KLSC2qGLZl2KdQwYV2wf4qu8zfmSW5lv1SHTzrCkzIsxmy1TBEiDBsTveZoGsKNbBlg5t72ZZcjer2gvE+iFam6rfbv+5M1M5/9GLmn7dVlozctMQCNZA+zT0PEbLfMxMG6kNPylq3t3j9MGqt6WYmfUQAOA0cibVE0Z6hIJEXBZ8CqSpj8U84/Tk529ODSD2vv0AkV5H6YWsvhCIqgnCoRefVR8cR78DHj6z/poaSCIWcz2RNgbP7YCDJFEZl3y9WZCR8bfm78PRsHoEbRVjMaDqaeCQx+FkvJ8Y6aay95UYdXAMZb54v4fwAOeY0haVhtXMICO17jU/GSyQfREGSAUhGggWgzNnBr7qF88lOsWqw7p5eEQPTpyf93+HwPmf4/S3N/tyxgm5t4owWQwzz3QnodNgKsJyZBGt5bKVytgPhea1XfM3ihLD1oLQHqo3gIy8ZkKbIU/s=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(39860400002)(346002)(136003)(396003)(83380400001)(8936002)(110136005)(8676002)(54906003)(316002)(31686004)(31696002)(5660300002)(66946007)(86362001)(30864003)(66556008)(66476007)(186003)(6666004)(52116002)(16526019)(4326008)(2906002)(7416002)(2616005)(6486002)(36756003)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cGVlV3J1eEMrNGJsRVBqM2dsdHhyQzJ6WTBYQVMxTFY0YmltdGZ2V3FPWVBq?=
 =?utf-8?B?akMvUU4rMVhKcWFwaDhpVm5pd1lBQTg0SXVab0lNUzZDa3R5QytMN1l4dUIv?=
 =?utf-8?B?RUZDZlJRWHdOL0NGREk0Q3QwMHZDNU5naDNlNVFUZ3RIcUhWS1JuOEFURGlW?=
 =?utf-8?B?S3d5Yjl5cDdrNVlhYXJyRFhhZVowWXNxNnFVVElwUy85WHhiaHY1My9qcXlw?=
 =?utf-8?B?bmJZK2JYVklnL1BVWW1ISWJlenIzdTRoaU9KWmxoSHQ5THNHRlVwK1dwdUxW?=
 =?utf-8?B?a0l4eUMreHR2TVkzZnZscTZHSmFRMlBKd1pRNDNvbnY1UEhtaFUrY2FNaFR4?=
 =?utf-8?B?NGdRSDJPY2E0ZHoxSTNUSWwvUWg0YVc3bHpLTnlGckovalM4Z1pIQlR2Wks5?=
 =?utf-8?B?bFV2MmhROStuekJ6NzFKdjZPaC81K2VFbTcxMmhtN3ovekNSUzN5LzRTeUxL?=
 =?utf-8?B?aWdnUlF6ZjJYWGhnSmZtVEhBei83Vm1LYWJUcWtpV1J1NHFYNno5aTZGU2JB?=
 =?utf-8?B?K3psb1ViQzZzSThHVk1ENU9tYkNLL0lXTXRhYnBOSjhWNFVYUmsyOHVVMDFV?=
 =?utf-8?B?S0g4V241WGtpNWsyRmxlODV0R05TMEVxTG42Rkh2dVNUK3RYV2czbTBMcks5?=
 =?utf-8?B?RFhXUGI2WlIrbDRhYjlqVmVxWVVpcDhDUUgycGF3YnJpSTlSVXRwMUNBSy82?=
 =?utf-8?B?d0NrWTFhWE10WXRWL3F6QWhic0pRNVEzRzkveG5IVm1jd0QrN0orNDhjMmNC?=
 =?utf-8?B?LzJKZlkxUEE5b2J1RDh6Tm5UZU9UVHZSS2hLMjg5TjVCV3RoaCtNbVZEUmJQ?=
 =?utf-8?B?NVV4S1B2eHA3SlgvSFFsZUJ6UEhkQVcwZVMrU3R1RzA3cWt5Z3U3ZkdrWGVp?=
 =?utf-8?B?YWIvZFltZDBxVHF4WC9wTS9wVGdmTzc2Vlc4Nm1UUlcxNklUakZPS3dWYm9q?=
 =?utf-8?B?dUR0cVFnNjJVWXlNSGlaSWN2cTFSS1lVNG5hWHJrbUlkMVFlbEZsUGVnWVdZ?=
 =?utf-8?B?WDNPZ21IanRLS1NVY0Znc0swSEIwMlV5NDhna2dPUUtHM0NVNEJlWHF4ak12?=
 =?utf-8?B?M25iOXpOQk5VN0l0U3VZVEZQTW1jTXUwcUwwaGIvR3daaHVoVHdhV25nNTJn?=
 =?utf-8?B?SEg0RjdJd3d0S2tLTkFkUTVGT3dXLzMxWEhSdnVxRjRnc2ozYmwzS3NTdTMz?=
 =?utf-8?B?MktRQi81ekpDRUlQSXVqNXZOQzZ0T2lsbGIyd3lqZmpFYnFUNGVNK1ppYmZa?=
 =?utf-8?B?ZFVqcENKNmZQbzFlNzV1RU04dEtNT3IzTkw1S2Uwd2tUajJXZkVxZGQxSlRx?=
 =?utf-8?B?QUpEV2pkNWx6ZFVINnF6VGxPZ2lEYUxURUJuN054Y0hwOWl1WTZKdkZ2Zmp1?=
 =?utf-8?B?WlFFSEhBNkJGRVBwQ1gvUzRXY0daN1VleTQvRXNjRUY3cVltVXNSeE5YTnN0?=
 =?utf-8?B?OGFWcXJUQkpVd1IyTE5EWjNnMEZzWnlKK01PL0JkclZONjFMalBGZThSNm53?=
 =?utf-8?B?Z1pRM0FPYkp2SFV1UFQ2YUFiUUhjcU1EZ1U3blg3RVdvM1VkTXFFQVZ1aVk4?=
 =?utf-8?B?LzcxS2ptMVBCYlBxOW8ybWdMbHZ2US9VczZ4Rk1xdlN1NWNWUlRpZ0NxZi9X?=
 =?utf-8?B?NnZHWXV3YVVHbzZtS2lpZzlHN3dGdUErNkY3ODZUVTZSQzdyQXVLOFlNM0U4?=
 =?utf-8?B?VzdMck16UEhTVGhjYk9aK1EvVTlheEZCekwzMldXRGJjYTlBdERJOWpidnRi?=
 =?utf-8?B?b3ZTU09KQ1hXQ0pPYzhaRzVDOEpudWdaTlZiZ2pIclZWK2ZjQVRaTkRpVjB2?=
 =?utf-8?B?Wm9HVUdVdVdhdHVtbCtLYkZiaVcrek11UkFva2Z2L01qVnhsTmRmQks5N09Q?=
 =?utf-8?Q?5xbxnk7hZlrjk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0980959a-2fe6-4eac-1632-08d8c9b32926
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 08:51:00.3753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wDrI3YEauqNOiTGc+l1U58ugNkpIkjwtIbMnzbqENmO8v0mzpO3ypncI1+wEdKtM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4608
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 05.02.21 um 09:06 schrieb John Stultz:
> This patch reworks the ttm_pool logic to utilize the recently
> added drm_page_pool code.
>
> Basically all the ttm_pool_type structures are replaced with
> drm_page_pool pointers, and since the drm_page_pool logic has
> its own shrinker, we can remove all of the ttm_pool shrinker
> logic.
>
> NOTE: There is one mismatch in the interfaces I'm not totally
> happy with. The ttm_pool tracks all of its pooled pages across
> a number of different pools, and tries to keep this size under
> the specified page_pool_size value. With the drm_page_pool,
> there may other users, however there is still one global
> shrinker list of pools. So we can't easily reduce the ttm
> pool under the ttm specified size without potentially doing
> a lot of shrinking to other non-ttm pools. So either we can:
>    1) Try to split it so each user of drm_page_pools manages its
>       own pool shrinking.
>    2) Push the max value into the drm_page_pool, and have it
>       manage shrinking to fit under that global max. Then share
>       those size/max values out so the ttm_pool debug output
>       can have more context.
>
> I've taken the second path in this patch set, but wanted to call
> it out so folks could look closely.

Option 3: Move the debugging code into the drm_page_pool as well.

I strong think that will be a hard requirement from Daniel for 
upstreaming this.

Christian.

>
> Thoughts would be greatly appreciated here!
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
>   drivers/gpu/drm/Kconfig        |   1 +
>   drivers/gpu/drm/ttm/ttm_pool.c | 199 +++++++--------------------------
>   include/drm/ttm/ttm_pool.h     |  23 +---
>   3 files changed, 41 insertions(+), 182 deletions(-)
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index d16bf340ed2e..d427abefabfb 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -181,6 +181,7 @@ config DRM_PAGE_POOL
>   config DRM_TTM
>   	tristate
>   	depends on DRM && MMU
> +	select DRM_PAGE_POOL
>   	help
>   	  GPU memory management subsystem for devices with multiple
>   	  GPU memory types. Will be enabled automatically if a device driver
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index eca36678f967..dbbaf55ca5df 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -37,6 +37,7 @@
>   #ifdef CONFIG_X86
>   #include <asm/set_memory.h>
>   #endif
> +#include <drm/page_pool.h>
>   #include <drm/ttm/ttm_pool.h>
>   #include <drm/ttm/ttm_bo_driver.h>
>   #include <drm/ttm/ttm_tt.h>
> @@ -63,15 +64,13 @@ module_param(page_pool_size, ulong, 0644);
>   
>   static atomic_long_t allocated_pages;
>   
> -static struct ttm_pool_type global_write_combined[MAX_ORDER];
> -static struct ttm_pool_type global_uncached[MAX_ORDER];
> +static struct drm_page_pool *global_write_combined[MAX_ORDER];
> +static struct drm_page_pool *global_uncached[MAX_ORDER];
>   
> -static struct ttm_pool_type global_dma32_write_combined[MAX_ORDER];
> -static struct ttm_pool_type global_dma32_uncached[MAX_ORDER];
> +static struct drm_page_pool *global_dma32_write_combined[MAX_ORDER];
> +static struct drm_page_pool *global_dma32_uncached[MAX_ORDER];
>   
>   static struct mutex shrinker_lock;
> -static struct list_head shrinker_list;
> -static struct shrinker mm_shrinker;
>   
>   /* Allocate pages of size 1 << order with the given gfp_flags */
>   static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
> @@ -223,79 +222,26 @@ static void ttm_pool_unmap(struct ttm_pool *pool, dma_addr_t dma_addr,
>   		       DMA_BIDIRECTIONAL);
>   }
>   
> -/* Give pages into a specific pool_type */
> -static void ttm_pool_type_give(struct ttm_pool_type *pt, struct page *p)
> -{
> -	spin_lock(&pt->lock);
> -	list_add(&p->lru, &pt->pages);
> -	spin_unlock(&pt->lock);
> -	atomic_long_add(1 << pt->order, &allocated_pages);
> -}
> -
> -/* Take pages from a specific pool_type, return NULL when nothing available */
> -static struct page *ttm_pool_type_take(struct ttm_pool_type *pt)
> -{
> -	struct page *p;
> -
> -	spin_lock(&pt->lock);
> -	p = list_first_entry_or_null(&pt->pages, typeof(*p), lru);
> -	if (p) {
> -		atomic_long_sub(1 << pt->order, &allocated_pages);
> -		list_del(&p->lru);
> -	}
> -	spin_unlock(&pt->lock);
> -
> -	return p;
> -}
> -
> -/* Initialize and add a pool type to the global shrinker list */
> -static void ttm_pool_type_init(struct ttm_pool_type *pt, struct ttm_pool *pool,
> -			       enum ttm_caching caching, unsigned int order)
> -{
> -	pt->pool = pool;
> -	pt->caching = caching;
> -	pt->order = order;
> -	spin_lock_init(&pt->lock);
> -	INIT_LIST_HEAD(&pt->pages);
> -
> -	mutex_lock(&shrinker_lock);
> -	list_add_tail(&pt->shrinker_list, &shrinker_list);
> -	mutex_unlock(&shrinker_lock);
> -}
> -
> -/* Remove a pool_type from the global shrinker list and free all pages */
> -static void ttm_pool_type_fini(struct ttm_pool_type *pt)
> -{
> -	struct page *p, *tmp;
> -
> -	mutex_lock(&shrinker_lock);
> -	list_del(&pt->shrinker_list);
> -	mutex_unlock(&shrinker_lock);
> -
> -	list_for_each_entry_safe(p, tmp, &pt->pages, lru)
> -		ttm_pool_free_page(p, pt->order);
> -}
> -
>   /* Return the pool_type to use for the given caching and order */
> -static struct ttm_pool_type *ttm_pool_select_type(struct ttm_pool *pool,
> +static struct drm_page_pool *ttm_pool_select_type(struct ttm_pool *pool,
>   						  enum ttm_caching caching,
>   						  unsigned int order)
>   {
>   	if (pool->use_dma_alloc)
> -		return &pool->caching[caching].orders[order];
> +		return pool->caching[caching].orders[order];
>   
>   #ifdef CONFIG_X86
>   	switch (caching) {
>   	case ttm_write_combined:
>   		if (pool->use_dma32)
> -			return &global_dma32_write_combined[order];
> +			return global_dma32_write_combined[order];
>   
> -		return &global_write_combined[order];
> +		return global_write_combined[order];
>   	case ttm_uncached:
>   		if (pool->use_dma32)
> -			return &global_dma32_uncached[order];
> +			return global_dma32_uncached[order];
>   
> -		return &global_uncached[order];
> +		return global_uncached[order];
>   	default:
>   		break;
>   	}
> @@ -304,30 +250,6 @@ static struct ttm_pool_type *ttm_pool_select_type(struct ttm_pool *pool,
>   	return NULL;
>   }
>   
> -/* Free pages using the global shrinker list */
> -static unsigned int ttm_pool_shrink(void)
> -{
> -	struct ttm_pool_type *pt;
> -	unsigned int num_freed;
> -	struct page *p;
> -
> -	mutex_lock(&shrinker_lock);
> -	pt = list_first_entry(&shrinker_list, typeof(*pt), shrinker_list);
> -
> -	p = ttm_pool_type_take(pt);
> -	if (p) {
> -		ttm_pool_free_page(p, pt->order);
> -		num_freed = 1 << pt->order;
> -	} else {
> -		num_freed = 0;
> -	}
> -
> -	list_move_tail(&pt->shrinker_list, &shrinker_list);
> -	mutex_unlock(&shrinker_lock);
> -
> -	return num_freed;
> -}
> -
>   /* Return the allocation order based for a page */
>   static unsigned int ttm_pool_page_order(struct ttm_pool *pool, struct page *p)
>   {
> @@ -377,10 +299,10 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>   	for (order = min(MAX_ORDER - 1UL, __fls(num_pages)); num_pages;
>   	     order = min_t(unsigned int, order, __fls(num_pages))) {
>   		bool apply_caching = false;
> -		struct ttm_pool_type *pt;
> +		struct drm_page_pool *pt;
>   
>   		pt = ttm_pool_select_type(pool, tt->caching, order);
> -		p = pt ? ttm_pool_type_take(pt) : NULL;
> +		p = pt ? drm_page_pool_fetch(pt) : NULL;
>   		if (p) {
>   			apply_caching = true;
>   		} else {
> @@ -462,7 +384,7 @@ void ttm_pool_free(struct ttm_pool *pool, struct ttm_tt *tt)
>   	for (i = 0; i < tt->num_pages; ) {
>   		struct page *p = tt->pages[i];
>   		unsigned int order, num_pages;
> -		struct ttm_pool_type *pt;
> +		struct drm_page_pool *pt;
>   
>   		order = ttm_pool_page_order(pool, p);
>   		num_pages = 1ULL << order;
> @@ -473,15 +395,12 @@ void ttm_pool_free(struct ttm_pool *pool, struct ttm_tt *tt)
>   
>   		pt = ttm_pool_select_type(pool, tt->caching, order);
>   		if (pt)
> -			ttm_pool_type_give(pt, tt->pages[i]);
> +			drm_page_pool_add(pt, tt->pages[i]);
>   		else
>   			ttm_pool_free_page(tt->pages[i], order);
>   
>   		i += num_pages;
>   	}
> -
> -	while (atomic_long_read(&allocated_pages) > page_pool_size)
> -		ttm_pool_shrink();
>   }
>   EXPORT_SYMBOL(ttm_pool_free);
>   
> @@ -508,8 +427,8 @@ void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
>   
>   	for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
>   		for (j = 0; j < MAX_ORDER; ++j)
> -			ttm_pool_type_init(&pool->caching[i].orders[j],
> -					   pool, i, j);
> +			pool->caching[i].orders[j] = drm_page_pool_create(j,
> +							ttm_pool_free_page);
>   }
>   
>   /**
> @@ -526,33 +445,18 @@ void ttm_pool_fini(struct ttm_pool *pool)
>   
>   	for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
>   		for (j = 0; j < MAX_ORDER; ++j)
> -			ttm_pool_type_fini(&pool->caching[i].orders[j]);
> +			drm_page_pool_destroy(pool->caching[i].orders[j]);
>   }
>   
>   #ifdef CONFIG_DEBUG_FS
> -/* Count the number of pages available in a pool_type */
> -static unsigned int ttm_pool_type_count(struct ttm_pool_type *pt)
> -{
> -	unsigned int count = 0;
> -	struct page *p;
> -
> -	spin_lock(&pt->lock);
> -	/* Only used for debugfs, the overhead doesn't matter */
> -	list_for_each_entry(p, &pt->pages, lru)
> -		++count;
> -	spin_unlock(&pt->lock);
> -
> -	return count;
> -}
> -
>   /* Dump information about the different pool types */
> -static void ttm_pool_debugfs_orders(struct ttm_pool_type *pt,
> +static void ttm_pool_debugfs_orders(struct drm_page_pool **pt,
>   				    struct seq_file *m)
>   {
>   	unsigned int i;
>   
>   	for (i = 0; i < MAX_ORDER; ++i)
> -		seq_printf(m, " %8u", ttm_pool_type_count(&pt[i]));
> +		seq_printf(m, " %8u", drm_page_pool_get_size(pt[i]));
>   	seq_puts(m, "\n");
>   }
>   
> @@ -602,7 +506,10 @@ int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m)
>   	}
>   
>   	seq_printf(m, "\ntotal\t: %8lu of %8lu\n",
> -		   atomic_long_read(&allocated_pages), page_pool_size);
> +		   atomic_long_read(&allocated_pages),
> +		   drm_page_pool_get_max());
> +	seq_printf(m, "(%8lu in non-ttm pools)\n", drm_page_pool_get_total() -
> +					atomic_long_read(&allocated_pages));
>   
>   	mutex_unlock(&shrinker_lock);
>   
> @@ -612,28 +519,6 @@ EXPORT_SYMBOL(ttm_pool_debugfs);
>   
>   #endif
>   
> -/* As long as pages are available make sure to release at least one */
> -static unsigned long ttm_pool_shrinker_scan(struct shrinker *shrink,
> -					    struct shrink_control *sc)
> -{
> -	unsigned long num_freed = 0;
> -
> -	do
> -		num_freed += ttm_pool_shrink();
> -	while (!num_freed && atomic_long_read(&allocated_pages));
> -
> -	return num_freed;
> -}
> -
> -/* Return the number of pages available or SHRINK_EMPTY if we have none */
> -static unsigned long ttm_pool_shrinker_count(struct shrinker *shrink,
> -					     struct shrink_control *sc)
> -{
> -	unsigned long num_pages = atomic_long_read(&allocated_pages);
> -
> -	return num_pages ? num_pages : SHRINK_EMPTY;
> -}
> -
>   /**
>    * ttm_pool_mgr_init - Initialize globals
>    *
> @@ -648,24 +533,21 @@ int ttm_pool_mgr_init(unsigned long num_pages)
>   	if (!page_pool_size)
>   		page_pool_size = num_pages;
>   
> +	drm_page_pool_set_max(page_pool_size);
> +
>   	mutex_init(&shrinker_lock);
> -	INIT_LIST_HEAD(&shrinker_list);
>   
>   	for (i = 0; i < MAX_ORDER; ++i) {
> -		ttm_pool_type_init(&global_write_combined[i], NULL,
> -				   ttm_write_combined, i);
> -		ttm_pool_type_init(&global_uncached[i], NULL, ttm_uncached, i);
> -
> -		ttm_pool_type_init(&global_dma32_write_combined[i], NULL,
> -				   ttm_write_combined, i);
> -		ttm_pool_type_init(&global_dma32_uncached[i], NULL,
> -				   ttm_uncached, i);
> +		global_write_combined[i] = drm_page_pool_create(i,
> +							ttm_pool_free_page);
> +		global_uncached[i] = drm_page_pool_create(i,
> +							ttm_pool_free_page);
> +		global_dma32_write_combined[i] = drm_page_pool_create(i,
> +							ttm_pool_free_page);
> +		global_dma32_uncached[i] = drm_page_pool_create(i,
> +							ttm_pool_free_page);
>   	}
> -
> -	mm_shrinker.count_objects = ttm_pool_shrinker_count;
> -	mm_shrinker.scan_objects = ttm_pool_shrinker_scan;
> -	mm_shrinker.seeks = 1;
> -	return register_shrinker(&mm_shrinker);
> +	return 0;
>   }
>   
>   /**
> @@ -678,13 +560,10 @@ void ttm_pool_mgr_fini(void)
>   	unsigned int i;
>   
>   	for (i = 0; i < MAX_ORDER; ++i) {
> -		ttm_pool_type_fini(&global_write_combined[i]);
> -		ttm_pool_type_fini(&global_uncached[i]);
> +		drm_page_pool_destroy(global_write_combined[i]);
> +		drm_page_pool_destroy(global_uncached[i]);
>   
> -		ttm_pool_type_fini(&global_dma32_write_combined[i]);
> -		ttm_pool_type_fini(&global_dma32_uncached[i]);
> +		drm_page_pool_destroy(global_dma32_write_combined[i]);
> +		drm_page_pool_destroy(global_dma32_uncached[i]);
>   	}
> -
> -	unregister_shrinker(&mm_shrinker);
> -	WARN_ON(!list_empty(&shrinker_list));
>   }
> diff --git a/include/drm/ttm/ttm_pool.h b/include/drm/ttm/ttm_pool.h
> index 4321728bdd11..460ab232fd22 100644
> --- a/include/drm/ttm/ttm_pool.h
> +++ b/include/drm/ttm/ttm_pool.h
> @@ -36,27 +36,6 @@ struct ttm_tt;
>   struct ttm_pool;
>   struct ttm_operation_ctx;
>   
> -/**
> - * ttm_pool_type - Pool for a certain memory type
> - *
> - * @pool: the pool we belong to, might be NULL for the global ones
> - * @order: the allocation order our pages have
> - * @caching: the caching type our pages have
> - * @shrinker_list: our place on the global shrinker list
> - * @lock: protection of the page list
> - * @pages: the list of pages in the pool
> - */
> -struct ttm_pool_type {
> -	struct ttm_pool *pool;
> -	unsigned int order;
> -	enum ttm_caching caching;
> -
> -	struct list_head shrinker_list;
> -
> -	spinlock_t lock;
> -	struct list_head pages;
> -};
> -
>   /**
>    * ttm_pool - Pool for all caching and orders
>    *
> @@ -71,7 +50,7 @@ struct ttm_pool {
>   	bool use_dma32;
>   
>   	struct {
> -		struct ttm_pool_type orders[MAX_ORDER];
> +		struct drm_page_pool *orders[MAX_ORDER];
>   	} caching[TTM_NUM_CACHING_TYPES];
>   };
>   

