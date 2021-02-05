Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 790623106AE
	for <lists+linux-media@lfdr.de>; Fri,  5 Feb 2021 09:30:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbhBEI3m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Feb 2021 03:29:42 -0500
Received: from mail-mw2nam08on2046.outbound.protection.outlook.com ([40.107.101.46]:59580
        "EHLO NAM04-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229492AbhBEI3k (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 5 Feb 2021 03:29:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gaSdwLpVxQZVb6ptEcXHBuFaQBoObnYNkRw/8Z4bE0ahRi7jnvF947TofScnkwwiHT0f8BCsJuoHSdRxRe4IVawLsCf2T+LIVm2p5eQjNdNU1AK7UQZij/baQlLiQof/Td1H+Z4hRlQ00jvEV1l3OZJRfwfB0oJvTLoMe8JNZxRTUuQu+m9uzfsZbSQM3YAClMaOeOViQicctXIVhlFbBSCFHlRAe6U0KNIDcUp8emnh2naghzB4jNzPkas0OYmp3ZWXkifEkryqXjuJiu2NnHz3/e5CjCLUpGE5ooN4n5cuWuk9ZWs9Sm0uI5miPznNcYk51F23acrY/Y1U7wHRoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QzINmfy8dPo2ojH3jon8BRNtk7Db/nPHGeuPcQm8H0Y=;
 b=TN4RJTt1QDSXuyR48dWFNiwqs16WAcmAErC+tZmiL12FV7dIW60Rb+owxhzZF4qfzD+dO/lqmyOSNglYhAbGK7X3j8unyLu18JrnfqQh70FxFXv1AvPSM0DPx1ol8IuOXz2hQ5sINKjy+U7KhQVF8vvYczdmqy/ZF7YkyhUte0zBFLenlSaXnrE2j6c3IU/PjehR3pw6p1WI1+IuB3f6O0hcidLV1DbdLByVrGY6YOdCiHTe/LvPiAVQOcK8U6nrjSkD+Uw+h7un8pdb7sCX4z0Jqphp9oPSBCY8WojwbOdNF213Co/2OJD1Ghkwwqoz8ngMDnTsnp45FTwW11tn1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QzINmfy8dPo2ojH3jon8BRNtk7Db/nPHGeuPcQm8H0Y=;
 b=FRzda2g/Y0sxFC0SHMWbZtklJ/COWHECPbGXx0b35PuHbJKrDRa9TP5H/qz03WIYr4iKvo8GiLToObl3KfgEZkJHlGbNwdvg6XTwVrTxfa5LrbjLErL8LTRy71G9uDDVMDkrcPutZuYKi/tahY71uxoHUKJYf8V3OUWgdPT3nvA=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=none action=none
 header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2579.namprd12.prod.outlook.com (2603:10b6:207:4d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.24; Fri, 5 Feb
 2021 08:28:46 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3825.023; Fri, 5 Feb 2021
 08:28:46 +0000
Subject: Re: [RFC][PATCH v6 3/7] drm: ttm_pool: Rework ttm_pool_free_page to
 allow us to use it as a function pointer
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
 <20210205080621.3102035-4-john.stultz@linaro.org>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <8a4cacb7-3042-53c7-02fe-de18cc49fc0e@amd.com>
Date:   Fri, 5 Feb 2021 09:28:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210205080621.3102035-4-john.stultz@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR06CA0106.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::47) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by AM0PR06CA0106.eurprd06.prod.outlook.com (2603:10a6:208:fa::47) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20 via Frontend Transport; Fri, 5 Feb 2021 08:28:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8a9fdd33-e6e3-41dc-bbf5-08d8c9b00e2b
X-MS-TrafficTypeDiagnostic: BL0PR12MB2579:
X-Microsoft-Antispam-PRVS: <BL0PR12MB25797888A5FAA4303B00716E83B29@BL0PR12MB2579.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vSYazm+AQ/0On5BHguGWNX6BUAXq0x/76vHw9L8qaOB2rtaRoyGDyFufVYh/gmxVGEE3m/sXFRAtgaSsyVPlpp/FRzMm6MUfZFZHuKMQa0qVUVhSbvn9fOfZThba0NnS2iEFTV641ronut7/KVWLaC8BpQEnbq8BvBGpGtrpjvdHbTSMQFKrF6MwXmslc+lKzNr66m8cZw5XtukeObpgynIBg15YoMDJ7xa4xo53cztUc66CjQv0svPdZWOgXc2UwXQ27R4IQlO71QxBPsJrQ9nJ/yenOh/5oc1Ych54x9sOMZW0qwGnYqxKi/BTeJYq4W1lLhIl1FsyGF11Snm/Usn12gRo49iKlXI3PjlcdDvAYY3wJGbK81vk+VztbWdYWkxxY3IWJuuf1jwiqVAOeB1HrNTVZp3BtiY7yROf5Zx9bIUM3jcE8fbgD7PrT5VBSWDsfxUusC8T6NfU3JGQjgL20Z0OJ1Dv0YAdRcIBhhUaS0GFRE2BSVPU2thdM+TC/2fFmjl2zB2tDXGXjLW4QSXSJI+BCkG+hurmJmLHFuxEnC6UJ2tzBvmPx0qmhfeiLBad1HgyzRAKy/gPz478hu1U5exCxrn0F0SslBSJuXY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(396003)(346002)(136003)(376002)(66556008)(66946007)(36756003)(6486002)(7416002)(86362001)(186003)(16526019)(6666004)(478600001)(2616005)(4326008)(2906002)(31686004)(110136005)(83380400001)(54906003)(66476007)(5660300002)(8676002)(316002)(52116002)(8936002)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?U2hDQ2ZmTm5vcGZFd0pPOElyb1dIbnJUTytLdHBBTm5nelRYcXVUai8wV3BP?=
 =?utf-8?B?M1RaVzhyQUZqSzh6NFVhTFBGclhoSGJ6cWRpM2Y1clFTWFhqaTJFbmczSUh2?=
 =?utf-8?B?MWxwbTR4L2IvVHdmTTVySmpBcTBUV2ZYS0pEaVhWTXFSNVczR1UvdUNFRGZs?=
 =?utf-8?B?bTRucTFGamZrb2I5dE9ZZU5zVzk2Y0Z5MHhSL1lsdUJ3bFlTUStPVWFza0RF?=
 =?utf-8?B?Z2pqUy9xWHJPdkM5RlNlMkphM3lWbUlMblcyUnYwMjdjN1AyZXp6SURSUlVk?=
 =?utf-8?B?SFJndXRqSTJtLzBlMGI1ZkJuZEEyQ0tqREtCcU5yZ3A3K1V2T2p2S2lBTjQ2?=
 =?utf-8?B?OWZUN1F4aldZaHhLakFCV2h3MmRnaGtwWmVKcmZYMlJqbm1aMnVVVGZaa21n?=
 =?utf-8?B?cng2aDFaQjkxUVhjcW93UnprMkVtU3ozYW5RYjlNenRQQ2lkeFpJSVBkZVIw?=
 =?utf-8?B?ajAzLzV3SzJrdzhSNlV1cS9OZXVJaEFSTzg1am1MU0J0NmJsZlRXQm5nNlpo?=
 =?utf-8?B?c1NBanJXanZGUDd6VGlMZjZhS2FTOXhRemdqWkg0anpnc3VqWmpPR1JSRGRP?=
 =?utf-8?B?YzFPSGFjZW14OEVXR0xxM2RkbzF1RWtUM0lQTHQxbUZFQ3hIMTNRdTBSQi9W?=
 =?utf-8?B?YnBrTTZ4Yy9IemJ0czJDREJNc3oyR29WYXlqb1dNRFFUOXAxSHBLeW4yaXlq?=
 =?utf-8?B?ZmxNVTJvOEErL1FPeHVFUEYwaHBkT0RZeW93dTVVeEJrb1Baelg1SXNXNUlv?=
 =?utf-8?B?MCtTNXh4NExzc01LVk10M2JQdUg3b1QwRVB5RDJHR0hWN0VmNlowQStRUng3?=
 =?utf-8?B?RzJDWDJuWjZsaDB3TU9ESVZESE9LOUFkcjVVUU12Qy8xWnhnWjN3Z0VFNmU5?=
 =?utf-8?B?U1FpMDZYMVV2aVFhdDZSaGErZFlVWUpyN1FtWmdKYk5EM1V3UjBmYTY5S0o4?=
 =?utf-8?B?OG5aTmxZaUtTdkJ1RTFKdmdOZTBnMHdsaDAzUEZHbVR3MTVWb1YxT0lpT1Ur?=
 =?utf-8?B?ZmFrR1lia0dac0VDaEQzZnl4TTZPcEZBcDZYVS9IUFpvNThuU0dJZDZTK1FU?=
 =?utf-8?B?akloWkRWcjMvTHVDVWE3MzRHb2l5ZzRSZldhS1NWampReDNaY1ZJbUlCUkVv?=
 =?utf-8?B?YnZHRERLbDRGd2VsTU5idmVoTFQzcURKWG1Ddkg2NnR0aklKNWVvdkY1UXdp?=
 =?utf-8?B?Y3N0VjM4ZkZlanFodG9WUFhacGQwUEZmaXBETUFpYXQ4dVhZZHNzbUpGMjg3?=
 =?utf-8?B?RFYxakJaNFcyb05IcHhqVHFhUEVmT0tHeitBYjMzdWhTQXRRbW5YNUZjYzhE?=
 =?utf-8?B?VGd3bW5iUnNtQkVBWWQzbWo3alhUZEE3WFU0WkVOendPOHp3WW14MHhXVnFk?=
 =?utf-8?B?SEpNUGF2RTVtRkdGMnNoa08wUkdkWmlQYW9MeXpaKzJkb1dYMVM1R3VRQUpm?=
 =?utf-8?B?OXltTGxkeVl6Skp4RG1FY3RDejgwUDdGNjNmVU94RnpiTE5HYXk3MGxQUmZD?=
 =?utf-8?B?bXQyVmM0RHVYRjA5ZUgyQUJnMXQrK2lnWS9XaGJFUHNUWEkzNThacVl3d21U?=
 =?utf-8?B?ODU5akRtbkZ5dmNrRFoyQ0hlYWd4QXJLczNBYmQxdDlFUDFvZXdMWTlRSm5E?=
 =?utf-8?B?cWJaTWc2OEtvUHhXRUNKWWhZaG1YZE54S05ERUV5eHRIa3F5K3VvMExoRWtJ?=
 =?utf-8?B?UWRYM0hEbTZtYVdBRFE4S1AwNVB4clIzQkhSSm9VaVBVenJwejB1ZFJRMTc5?=
 =?utf-8?B?aHJxbCs1RXlzbHFhSXJLV1RHd1U2dllTeUVIRFNMc0liTzBIV09NU1BwMEF3?=
 =?utf-8?B?U0FYQ0tkQVlXQ0hlZmR2YzdTMFVwajZhTkZUSHVUK3EwU0ZSZnl4OXpaV0tz?=
 =?utf-8?Q?GFbdPHKag4I9B?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a9fdd33-e6e3-41dc-bbf5-08d8c9b00e2b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 08:28:46.4737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XslRLQjy+h+YdUKGSKtTQKuhs/4qpOz5lTOquBhC544IJr9qTTxzXW/LJPFY+0pj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2579
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 05.02.21 um 09:06 schrieb John Stultz:
> This refactors ttm_pool_free_page(), and by adding extra entries
> to ttm_pool_page_dat, we then use it for all allocations, which
> allows us to simplify the arguments needed to be passed to
> ttm_pool_free_page().

This is a clear NAK since the peer page data is just a workaround for 
the DMA-API hack to grab pages from there.

Adding this to all pages would increase the memory footprint drastically.

christian.

>
> This is critical for allowing the free function to be called
> by the sharable drm_page_pool logic.
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
>   drivers/gpu/drm/ttm/ttm_pool.c | 60 ++++++++++++++++++----------------
>   1 file changed, 32 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index c0274e256be3..eca36678f967 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -44,10 +44,14 @@
>   /**
>    * struct ttm_pool_page_dat - Helper object for coherent DMA mappings
>    *
> + * @pool: ttm_pool pointer the page was allocated by
> + * @caching: the caching value the allocated page was configured for
>    * @addr: original DMA address returned for the mapping
>    * @vaddr: original vaddr return for the mapping and order in the lower bits
>    */
>   struct ttm_pool_page_dat {
> +	struct ttm_pool *pool;
> +	enum ttm_caching caching;
>   	dma_addr_t addr;
>   	unsigned long vaddr;
>   };
> @@ -71,13 +75,20 @@ static struct shrinker mm_shrinker;
>   
>   /* Allocate pages of size 1 << order with the given gfp_flags */
>   static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
> -					unsigned int order)
> +					unsigned int order, enum ttm_caching caching)
>   {
>   	unsigned long attr = DMA_ATTR_FORCE_CONTIGUOUS;
>   	struct ttm_pool_page_dat *dat;
>   	struct page *p;
>   	void *vaddr;
>   
> +	dat = kmalloc(sizeof(*dat), GFP_KERNEL);
> +	if (!dat)
> +		return NULL;
> +
> +	dat->pool = pool;
> +	dat->caching = caching;
> +
>   	/* Don't set the __GFP_COMP flag for higher order allocations.
>   	 * Mapping pages directly into an userspace process and calling
>   	 * put_page() on a TTM allocated page is illegal.
> @@ -88,15 +99,13 @@ static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
>   
>   	if (!pool->use_dma_alloc) {
>   		p = alloc_pages(gfp_flags, order);
> -		if (p)
> -			p->private = order;
> +		if (!p)
> +			goto error_free;
> +		dat->vaddr = order;
> +		p->private = (unsigned long)dat;
>   		return p;
>   	}
>   
> -	dat = kmalloc(sizeof(*dat), GFP_KERNEL);
> -	if (!dat)
> -		return NULL;
> -
>   	if (order)
>   		attr |= DMA_ATTR_NO_WARN;
>   
> @@ -123,34 +132,34 @@ static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
>   }
>   
>   /* Reset the caching and pages of size 1 << order */
> -static void ttm_pool_free_page(struct ttm_pool *pool, enum ttm_caching caching,
> -			       unsigned int order, struct page *p)
> +static int ttm_pool_free_page(struct page *p, unsigned int order)
>   {
>   	unsigned long attr = DMA_ATTR_FORCE_CONTIGUOUS;
> -	struct ttm_pool_page_dat *dat;
> +	struct ttm_pool_page_dat *dat = (void *)p->private;
>   	void *vaddr;
>   
>   #ifdef CONFIG_X86
>   	/* We don't care that set_pages_wb is inefficient here. This is only
>   	 * used when we have to shrink and CPU overhead is irrelevant then.
>   	 */
> -	if (caching != ttm_cached && !PageHighMem(p))
> +	if (dat->caching != ttm_cached && !PageHighMem(p))
>   		set_pages_wb(p, 1 << order);
>   #endif
>   
> -	if (!pool || !pool->use_dma_alloc) {
> +	if (!dat->pool || !dat->pool->use_dma_alloc) {
>   		__free_pages(p, order);
> -		return;
> +		goto out;
>   	}
>   
>   	if (order)
>   		attr |= DMA_ATTR_NO_WARN;
>   
> -	dat = (void *)p->private;
>   	vaddr = (void *)(dat->vaddr & PAGE_MASK);
> -	dma_free_attrs(pool->dev, (1UL << order) * PAGE_SIZE, vaddr, dat->addr,
> +	dma_free_attrs(dat->pool->dev, (1UL << order) * PAGE_SIZE, vaddr, dat->addr,
>   		       attr);
> +out:
>   	kfree(dat);
> +	return 1 << order;
>   }
>   
>   /* Apply a new caching to an array of pages */
> @@ -264,7 +273,7 @@ static void ttm_pool_type_fini(struct ttm_pool_type *pt)
>   	mutex_unlock(&shrinker_lock);
>   
>   	list_for_each_entry_safe(p, tmp, &pt->pages, lru)
> -		ttm_pool_free_page(pt->pool, pt->caching, pt->order, p);
> +		ttm_pool_free_page(p, pt->order);
>   }
>   
>   /* Return the pool_type to use for the given caching and order */
> @@ -307,7 +316,7 @@ static unsigned int ttm_pool_shrink(void)
>   
>   	p = ttm_pool_type_take(pt);
>   	if (p) {
> -		ttm_pool_free_page(pt->pool, pt->caching, pt->order, p);
> +		ttm_pool_free_page(p, pt->order);
>   		num_freed = 1 << pt->order;
>   	} else {
>   		num_freed = 0;
> @@ -322,13 +331,9 @@ static unsigned int ttm_pool_shrink(void)
>   /* Return the allocation order based for a page */
>   static unsigned int ttm_pool_page_order(struct ttm_pool *pool, struct page *p)
>   {
> -	if (pool->use_dma_alloc) {
> -		struct ttm_pool_page_dat *dat = (void *)p->private;
> -
> -		return dat->vaddr & ~PAGE_MASK;
> -	}
> +	struct ttm_pool_page_dat *dat = (void *)p->private;
>   
> -	return p->private;
> +	return dat->vaddr & ~PAGE_MASK;
>   }
>   
>   /**
> @@ -379,7 +384,7 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>   		if (p) {
>   			apply_caching = true;
>   		} else {
> -			p = ttm_pool_alloc_page(pool, gfp_flags, order);
> +			p = ttm_pool_alloc_page(pool, gfp_flags, order, tt->caching);
>   			if (p && PageHighMem(p))
>   				apply_caching = true;
>   		}
> @@ -428,13 +433,13 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>   	ttm_mem_global_free_page(&ttm_mem_glob, p, (1 << order) * PAGE_SIZE);
>   
>   error_free_page:
> -	ttm_pool_free_page(pool, tt->caching, order, p);
> +	ttm_pool_free_page(p, order);
>   
>   error_free_all:
>   	num_pages = tt->num_pages - num_pages;
>   	for (i = 0; i < num_pages; ) {
>   		order = ttm_pool_page_order(pool, tt->pages[i]);
> -		ttm_pool_free_page(pool, tt->caching, order, tt->pages[i]);
> +		ttm_pool_free_page(tt->pages[i], order);
>   		i += 1 << order;
>   	}
>   
> @@ -470,8 +475,7 @@ void ttm_pool_free(struct ttm_pool *pool, struct ttm_tt *tt)
>   		if (pt)
>   			ttm_pool_type_give(pt, tt->pages[i]);
>   		else
> -			ttm_pool_free_page(pool, tt->caching, order,
> -					   tt->pages[i]);
> +			ttm_pool_free_page(tt->pages[i], order);
>   
>   		i += num_pages;
>   	}

