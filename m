Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D69232E698
	for <lists+linux-media@lfdr.de>; Fri,  5 Mar 2021 11:44:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229637AbhCEKoJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Mar 2021 05:44:09 -0500
Received: from mail-bn7nam10on2062.outbound.protection.outlook.com ([40.107.92.62]:53952
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229573AbhCEKny (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 5 Mar 2021 05:43:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ITrlzrsSr0m/yrEoO5IMi5CA7wWpLiCUaObv56lZh0ejI6SH/Pu7EKkDn1/HjzIUVBJnxhvvUxyh6+gCeFDgWUF2R8/kLgAW3lB6FzX0wGrAmG37aDVXsSU+TO7G4A6DIcRZ1pqiSii1BqfOa6dLnb3JXj81hpZQCLSZl+zwwAQRDprUSfdBQkk534TEb9lTvPrU7G2uxXYdNdayYKtWcHywba149e3BWuvHF0gEBuLoYHhSiOYjyy1bezmaCZQNryMaPWtWcb+oiyXo2tyum/3JksAUEYqz8c09nW35WYUReiAOAWwHj/ryWFQydEW6OD2VIyot5rnIpj/gO9YPYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7rMOQEGB3M4n8a+bE+0UbVzL4QKT87XWd7cSyTbjfaE=;
 b=hHh5DgUX6OIPKKMMj1Ua0pJQdFd1xOBiq9VnhadQkRmc2P1fV3Yc3T30rHRhv6xxgJIG77cKXGDD0Hf+X7r9nvYeFw+MPWKsWZrKIIvbeo075HqJqI8fAtHQ8/nCBBMdBDCqkNSbvpGsN6f5Sx5SCg0WmDysGgxcZOsebnPQIE6pYnzFSCDhIzMaQiYL+0MUsdv5I3NlbMJtqUkgw81SXPwiIm8c0qMwTPY8ekno3hQl1jtXrdP/zjbyESdnLdEzA9Jzoddocc++DDtxME2/EIViqkHOn/Hc/7RhHfhLhoIKINvV96uSW9+kOomKo17t7aaShYJCL2QSqCdjVzfaAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7rMOQEGB3M4n8a+bE+0UbVzL4QKT87XWd7cSyTbjfaE=;
 b=uku7aUKQpPxJBpjRgQTNOk/k4toRDIq3xjGiZQvAopXm/SKxtdRwh2d3lj6yMcS0CIEugKiB2JmTaDy9LopEYV+LRJpwjY0s0GquM2KP7tHPNThx/mJNfquzp3wTqaNoubbhv2XSRC+JwwpbRJ9Ea28d8i3+lvhRZCFGyljMlD0=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=none action=none
 header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3694.namprd12.prod.outlook.com (2603:10b6:208:165::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Fri, 5 Mar
 2021 10:43:52 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3912.023; Fri, 5 Mar 2021
 10:43:51 +0000
Subject: Re: [PATCH v8 2/5] drm: ttm_pool: Rework ttm_pool to use
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
References: <20210304232011.1479036-1-john.stultz@linaro.org>
 <20210304232011.1479036-3-john.stultz@linaro.org>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <7a6a962e-dda4-cfbd-4daf-52fad2b902f4@amd.com>
Date:   Fri, 5 Mar 2021 11:43:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210304232011.1479036-3-john.stultz@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:23ea:890a:84c3:71ab]
X-ClientProxiedBy: AM0PR04CA0107.eurprd04.prod.outlook.com
 (2603:10a6:208:be::48) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:23ea:890a:84c3:71ab] (2a02:908:1252:fb60:23ea:890a:84c3:71ab) by AM0PR04CA0107.eurprd04.prod.outlook.com (2603:10a6:208:be::48) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Fri, 5 Mar 2021 10:43:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a01dc955-86a8-4432-5a8e-08d8dfc390ea
X-MS-TrafficTypeDiagnostic: MN2PR12MB3694:
X-Microsoft-Antispam-PRVS: <MN2PR12MB36944C208F3417AD84149D3783969@MN2PR12MB3694.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NTnBo47lDCVsjz2yDdRcxEo0o/CHiWVyV3/ia/zDWLGPe5tolV7tpC8ZktFR9pN2Yd1sclLOQpaHkupI5/ROAJfMRt4GttuVzkEYYcTGNCgk4eSB3CWw8Evg2F8ks4ywYtq6DrmFokH+ow7rybYGed3W9nuIMENz3KowJK207sK1lWYZskk0JgsNksCyWDU0a4mL/ZYkt7ZRmWKoistKUclqYUZI/+XqBXjYjm7ACnpRYUaZNG2xuG1YEYRQdNrzP2vt0UD5vwj/YLWHwl0d44IoDA9kHPjaKJwD9oOb0soCiNucXXzOjLT8LWpOFLNt7MrD9yQrFZmpOFAVal1KBSj2kLMiZDdYyAs4L113x4Z7CJBgcdRCtnVOb87m+aUSSzanMIyRQtPt02pXBp1Hr8WaBMl9ZvPcPthDJSs8w9sWg9n/M40I8K9flxW16YRn8WguTueCU7o73Z2llN99BUzmzjIM429ib+S3rKMv5tBs6AETC38mRplmd6Z881AxDbkxE4pd0DYyFc3h/hcrR/+AontCDcZ+jkZje9rLcZjmxQXFwDATKN4Xk7luboQGDxGSQ37A3uK5PKlhm7S5GVk0XxJOWrFAvyTWX0autcw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(366004)(136003)(39860400002)(376002)(66556008)(8676002)(2906002)(6666004)(8936002)(52116002)(478600001)(86362001)(36756003)(5660300002)(6486002)(31686004)(66946007)(66476007)(30864003)(2616005)(83380400001)(4326008)(7416002)(16526019)(186003)(316002)(54906003)(110136005)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?b0tuYi91K3Y1cnlieVl1TFQxeFZmNStCZ3dvM0J3cHdMNnBCR01wckJHd1Fa?=
 =?utf-8?B?bjBucy9HUDcwckdCN2ZFMFg5M2hkQ0FrOW5WajR2VTRDR2o5YVBNNjF6d0Ft?=
 =?utf-8?B?alhia05RZjhwNERLdmNtRmFCeHpobWRVWktaYW1FNjNSaVB1Z2s1RHV1alVG?=
 =?utf-8?B?ZzBzc0F5TTFuLzZ4MGNOYlpUdHllMjRkNWpmMzFGZ0tOVWtwb3haUlJhYW84?=
 =?utf-8?B?WHBvaTd1bC9iOU4vb21id1FjWVJSOTd6cWpueUlxdUlVMDEzbmJCVnhzVUlO?=
 =?utf-8?B?RTIrTk82RkR2cGFQaXVRdy9xWm4wZFJId2g3emFyV2pwdkpWV2RXdU1QWitq?=
 =?utf-8?B?Yk5YL0o1VEZBKzR1NXhwNHI4UnRvSWhhYXlxZVhNODdmWXVnQUtacFAyQnIx?=
 =?utf-8?B?NzBSeUxyZE1acTJjN2I2RFM4dU5vNEVURUtRTG9vclJzWWdUYVZaQXJVTE5F?=
 =?utf-8?B?WXNnQk5kRnpwNFBsbWtLVUhGbUx0eWpFcklhc0MzWTNjWStYNFVqUFRsUGNq?=
 =?utf-8?B?anRYcDBXek1IT1VxclVQNGMvbk9OL0laaXY1RVFFTlJkeWZWenUxcmwxNnVQ?=
 =?utf-8?B?b0MzT2FsbGlKR3RuOGVmQ0JYVG1qa0lMVTJiL2tuWkpuRXg2blFFZzExZm81?=
 =?utf-8?B?UjJRQklhdTV4cDlpdVhGRTd2QzZPKzFQc2VRSDF2a3dEdzI5d3A5ZDRsOGpS?=
 =?utf-8?B?d3k3VFZxelVWN0FDNWVNRUJraXBZZGlEdjBzY3ZuMmV3WG8zaUFWMzVXTXFS?=
 =?utf-8?B?MmJmUEUrdkxXbGgzVnVPbHdVbXk5d3lwWmFXUWs4S2l1TXV4RzJHanZtdE82?=
 =?utf-8?B?bDdYam03MWtUeWlmVmowWWpIWUNPdVY3TlhqSnkxd1ZVZ1BMcjVqNUNtcXN6?=
 =?utf-8?B?WXlYR2hrZmFVQVQwZ0h6WFdZZTJzejVFcVhlZUJqU0hrK25KQ3o2WENibGZI?=
 =?utf-8?B?dWJxTjlHeDRzNitZUW40RWt1NnN4bElDenh1enhKQXRUL0h3VHpZWTMrVzJ3?=
 =?utf-8?B?SVpTQisyQ3pzS3hISTl6RlRyeURmZU5PYmFlQWxUcE5Kai9xYVgrc0xqUmdo?=
 =?utf-8?B?djIvQXhvcEp6b0RGMEIxRnR2U3JxOGNlKzFlc2pJNUltWU9Iemp2RU4rNHVS?=
 =?utf-8?B?Y3dKY0JIUFhqcTYrR0NnaDJtWk1yUit1dmlrM3ZWKzZVdzZ2Tzk3bGJxS1JR?=
 =?utf-8?B?STdoRHI4dnhBeFMrQkxwZWpnTHI3WDVhMzZycE94V2hyZHhTajd3eWcvUGhh?=
 =?utf-8?B?bGVYaDlrd3ZYMUJvZmQ5UjZBSFRiZkNxQjFGM2V5bHJubDNvbGRKZUdIZVM1?=
 =?utf-8?B?amJXTmpRNEtwSXlYK2NHelN3S1ZjeEJycjRvREpUZkorMUQ4dTFmVWlGUElH?=
 =?utf-8?B?QnFhRC9hekZHRk9FYUcwWFIyS0hEbUVQWGJDaUpQd3RJcXVLTS9EU2VsRmdP?=
 =?utf-8?B?UnE2ZDlVS0VvNUdJREMxRTZNc0xUZEhDSElKNTdvWnNmdVV2djhLY1RKTUdt?=
 =?utf-8?B?WlJ4YjVPUTZtc3o0RGQwWFRWcGxhWGVCeWZmZFVuQ1gvODg2RHhlUVhRVVFs?=
 =?utf-8?B?WFYvWUlmQW1LNzJnRDNrOUk3ODNYN3pWY2l3N3IvSUpKVlh3ckc2NU5xaXdj?=
 =?utf-8?B?cjRXQjdUR0J5d3JLWnh2VnJHeWdjYTZyUlRHZDQ4VDVlZm8wVktzZUFZNTJM?=
 =?utf-8?B?LzA4dldTVWtJWXQ5VWZxcW1MSitlb2p4OUxxUTdxR2NZa0JSOW5lYzBwR01j?=
 =?utf-8?B?WlpRYWREdHlUYjhJMEd1aE5mVUdLek4vcnZtaFBxVVVVczBnTHV3dkVyZHRo?=
 =?utf-8?B?cmUvWkNvY1VHUEdZWGFaTnpXcWYwRnNCTFZqZHNCd2tOUmRVby8rNmlJb0pI?=
 =?utf-8?Q?9Tk24074zs3jP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a01dc955-86a8-4432-5a8e-08d8dfc390ea
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2021 10:43:51.8378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pD7UQS6+AMGo/kdrCbhHVIjwsWW3u/+gO2vmw7za82c4Ple++ZaBukCyiLH0eoXt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3694
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 05.03.21 um 00:20 schrieb John Stultz:
> This patch reworks the ttm_pool logic to utilize the recently
> added drm_page_pool code.
>
> This adds drm_page_pool structures to the ttm_pool_type
> structures, and then removes all the ttm_pool_type shrinker
> logic (as its handled in the drm_page_pool shrinker).
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

That's perfectly fine with me. A global approach for the different page 
pool types is desired anyway as far as I can see.

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
> v7:
> * Major refactoring to use drm_page_pools inside the
>    ttm_pool_type structure. This allows us to use container_of to
>    get the needed context to free a page. This also means less
>    code is changed overall.
> v8:
> * Reworked to use the new cleanly rewritten drm_page_pool logic
> ---
>   drivers/gpu/drm/Kconfig        |   1 +
>   drivers/gpu/drm/ttm/ttm_pool.c | 156 ++++++---------------------------
>   include/drm/ttm/ttm_pool.h     |   6 +-
>   3 files changed, 31 insertions(+), 132 deletions(-)
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 7cbcecb8f7df..a6cbdb63f6c7 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -184,6 +184,7 @@ config DRM_PAGE_POOL
>   config DRM_TTM
>   	tristate
>   	depends on DRM && MMU
> +	select DRM_PAGE_POOL
>   	help
>   	  GPU memory management subsystem for devices with multiple
>   	  GPU memory types. Will be enabled automatically if a device driver
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index 6e27cb1bf48b..f74ea801d7ab 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -39,6 +39,7 @@
>   #include <asm/set_memory.h>
>   #endif
>   
> +#include <drm/page_pool.h>
>   #include <drm/ttm/ttm_pool.h>
>   #include <drm/ttm/ttm_bo_driver.h>
>   #include <drm/ttm/ttm_tt.h>
> @@ -68,8 +69,6 @@ static struct ttm_pool_type global_dma32_write_combined[MAX_ORDER];
>   static struct ttm_pool_type global_dma32_uncached[MAX_ORDER];
>   
>   static struct mutex shrinker_lock;
> -static struct list_head shrinker_list;
> -static struct shrinker mm_shrinker;
>   
>   /* Allocate pages of size 1 << order with the given gfp_flags */
>   static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
> @@ -125,8 +124,9 @@ static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
>   }
>   
>   /* Reset the caching and pages of size 1 << order */
> -static void ttm_pool_free_page(struct ttm_pool *pool, enum ttm_caching caching,
> -			       unsigned int order, struct page *p)
> +static unsigned long ttm_pool_free_page(struct ttm_pool *pool,
> +					enum ttm_caching caching,
> +					unsigned int order, struct page *p)
>   {
>   	unsigned long attr = DMA_ATTR_FORCE_CONTIGUOUS;
>   	struct ttm_pool_dma *dma;
> @@ -142,7 +142,7 @@ static void ttm_pool_free_page(struct ttm_pool *pool, enum ttm_caching caching,
>   
>   	if (!pool || !pool->use_dma_alloc) {
>   		__free_pages(p, order);
> -		return;
> +		return 1UL << order;
>   	}
>   
>   	if (order)
> @@ -153,6 +153,16 @@ static void ttm_pool_free_page(struct ttm_pool *pool, enum ttm_caching caching,
>   	dma_free_attrs(pool->dev, (1UL << order) * PAGE_SIZE, vaddr, dma->addr,
>   		       attr);
>   	kfree(dma);
> +	return 1UL << order;

The returned value is always the same. So you wrapper can do this and we 
don't really need to change the function here.

> +}
> +
> +static unsigned long ttm_subpool_free_page(struct drm_page_pool *subpool,
> +					   struct page *p)

Better call this ttm_pool_free_callback.

> +{
> +	struct ttm_pool_type *pt;
> +
> +	pt = container_of(subpool, struct ttm_pool_type, subpool);
> +	return ttm_pool_free_page(pt->pool, pt->caching, pt->order, p);
>   }
>   
>   /* Apply a new caching to an array of pages */
> @@ -216,40 +226,6 @@ static void ttm_pool_unmap(struct ttm_pool *pool, dma_addr_t dma_addr,
>   		       DMA_BIDIRECTIONAL);
>   }
>   
> -/* Give pages into a specific pool_type */
> -static void ttm_pool_type_give(struct ttm_pool_type *pt, struct page *p)
> -{
> -	unsigned int i, num_pages = 1 << pt->order;
> -
> -	for (i = 0; i < num_pages; ++i) {
> -		if (PageHighMem(p))
> -			clear_highpage(p + i);
> -		else
> -			clear_page(page_address(p + i));
> -	}
> -
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
>   /* Initialize and add a pool type to the global shrinker list */
>   static void ttm_pool_type_init(struct ttm_pool_type *pt, struct ttm_pool *pool,
>   			       enum ttm_caching caching, unsigned int order)
> @@ -257,25 +233,14 @@ static void ttm_pool_type_init(struct ttm_pool_type *pt, struct ttm_pool *pool,
>   	pt->pool = pool;
>   	pt->caching = caching;
>   	pt->order = order;

The order is now duplicated and can probably be dropped from the TTM pool.

> -	spin_lock_init(&pt->lock);
> -	INIT_LIST_HEAD(&pt->pages);
>   
> -	mutex_lock(&shrinker_lock);
> -	list_add_tail(&pt->shrinker_list, &shrinker_list);
> -	mutex_unlock(&shrinker_lock);
> +	drm_page_pool_init(&pt->subpool, order, ttm_subpool_free_page);
>   }
>   
>   /* Remove a pool_type from the global shrinker list and free all pages */
>   static void ttm_pool_type_fini(struct ttm_pool_type *pt)
>   {
> -	struct page *p, *tmp;
> -
> -	mutex_lock(&shrinker_lock);
> -	list_del(&pt->shrinker_list);
> -	mutex_unlock(&shrinker_lock);
> -
> -	list_for_each_entry_safe(p, tmp, &pt->pages, lru)
> -		ttm_pool_free_page(pt->pool, pt->caching, pt->order, p);
> +	drm_page_pool_fini(&pt->subpool);
>   }
>   
>   /* Return the pool_type to use for the given caching and order */
> @@ -306,30 +271,6 @@ static struct ttm_pool_type *ttm_pool_select_type(struct ttm_pool *pool,
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
> -		ttm_pool_free_page(pt->pool, pt->caching, pt->order, p);
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
> @@ -386,7 +327,7 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>   		struct ttm_pool_type *pt;
>   
>   		pt = ttm_pool_select_type(pool, tt->caching, order);
> -		p = pt ? ttm_pool_type_take(pt) : NULL;
> +		p = pt ? drm_page_pool_remove(&pt->subpool) : NULL;
>   		if (p) {
>   			apply_caching = true;
>   		} else {
> @@ -479,16 +420,13 @@ void ttm_pool_free(struct ttm_pool *pool, struct ttm_tt *tt)
>   
>   		pt = ttm_pool_select_type(pool, tt->caching, order);
>   		if (pt)
> -			ttm_pool_type_give(pt, tt->pages[i]);
> +			drm_page_pool_add(&pt->subpool, tt->pages[i]);
>   		else
>   			ttm_pool_free_page(pool, tt->caching, order,
>   					   tt->pages[i]);
>   
>   		i += num_pages;
>   	}
> -
> -	while (atomic_long_read(&allocated_pages) > page_pool_size)
> -		ttm_pool_shrink();

That won't work. You still need to make sure that we shrink the pool to 
be under the maximum.

>   }
>   EXPORT_SYMBOL(ttm_pool_free);
>   
> @@ -537,21 +475,6 @@ void ttm_pool_fini(struct ttm_pool *pool)
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
>   static void ttm_pool_debugfs_orders(struct ttm_pool_type *pt,
>   				    struct seq_file *m)
> @@ -559,7 +482,8 @@ static void ttm_pool_debugfs_orders(struct ttm_pool_type *pt,
>   	unsigned int i;
>   
>   	for (i = 0; i < MAX_ORDER; ++i)
> -		seq_printf(m, " %8u", ttm_pool_type_count(&pt[i]));
> +		seq_printf(m, " %8lu",
> +			   drm_page_pool_get_size(&pt[i].subpool));
>   	seq_puts(m, "\n");
>   }
>   
> @@ -609,7 +533,10 @@ int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m)
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

That won't work. You need to move the debugfs functions into the DRM 
pool as well or otherwise you have two separate shrinker_lock instances 
and the lock protection is not correct any more.

Regards,
Christian.

>   
> @@ -619,28 +546,6 @@ EXPORT_SYMBOL(ttm_pool_debugfs);
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
> @@ -655,8 +560,9 @@ int ttm_pool_mgr_init(unsigned long num_pages)
>   	if (!page_pool_size)
>   		page_pool_size = num_pages;
>   
> +	drm_page_pool_set_max(page_pool_size);
> +
>   	mutex_init(&shrinker_lock);
> -	INIT_LIST_HEAD(&shrinker_list);
>   
>   	for (i = 0; i < MAX_ORDER; ++i) {
>   		ttm_pool_type_init(&global_write_combined[i], NULL,
> @@ -669,10 +575,7 @@ int ttm_pool_mgr_init(unsigned long num_pages)
>   				   ttm_uncached, i);
>   	}
>   
> -	mm_shrinker.count_objects = ttm_pool_shrinker_count;
> -	mm_shrinker.scan_objects = ttm_pool_shrinker_scan;
> -	mm_shrinker.seeks = 1;
> -	return register_shrinker(&mm_shrinker);
> +	return 0;
>   }
>   
>   /**
> @@ -691,7 +594,4 @@ void ttm_pool_mgr_fini(void)
>   		ttm_pool_type_fini(&global_dma32_write_combined[i]);
>   		ttm_pool_type_fini(&global_dma32_uncached[i]);
>   	}
> -
> -	unregister_shrinker(&mm_shrinker);
> -	WARN_ON(!list_empty(&shrinker_list));
>   }
> diff --git a/include/drm/ttm/ttm_pool.h b/include/drm/ttm/ttm_pool.h
> index 4321728bdd11..3d975888ce47 100644
> --- a/include/drm/ttm/ttm_pool.h
> +++ b/include/drm/ttm/ttm_pool.h
> @@ -30,6 +30,7 @@
>   #include <linux/llist.h>
>   #include <linux/spinlock.h>
>   #include <drm/ttm/ttm_caching.h>
> +#include <drm/page_pool.h>
>   
>   struct device;
>   struct ttm_tt;
> @@ -51,10 +52,7 @@ struct ttm_pool_type {
>   	unsigned int order;
>   	enum ttm_caching caching;
>   
> -	struct list_head shrinker_list;
> -
> -	spinlock_t lock;
> -	struct list_head pages;
> +	struct drm_page_pool subpool;
>   };
>   
>   /**

