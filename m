Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2588310953
	for <lists+linux-media@lfdr.de>; Fri,  5 Feb 2021 11:43:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231366AbhBEKlp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Feb 2021 05:41:45 -0500
Received: from mail-mw2nam12on2046.outbound.protection.outlook.com ([40.107.244.46]:15649
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231546AbhBEKhF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 5 Feb 2021 05:37:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RBLEx6B2VZKcA9oyzI3cIH13uK29bHCfLUeWKyA6LlmKGGEwxF/yHBlLyNi2QIn+LQYWMEgZAqOnYxzEfXh6oA9Q6CkzFRnFYBSzOad10FKQEOwvh42Q/hLzbuDIwmMIPTpkjoDrVz066UbJCcIsg1mUeNZUaAUGOUqgV6zuaIVHD1AkPiW7SqLo4ON/iyIlgsSRx/tZ467rA61iZiZu8WMKpSRAYbd4iRe9HZxH8tohfiyBle/jhCfP3v1z9qbp0JBd16GdshNl6SIlDQDm/qAzIqH1zEE5PbaewPXYqX5v345OYbnaOZcG/5+FOYbdn33ivvO1wI0kgDWakHhSkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jjtMvA23UpP9595/61adkwqEcNI/T/ErIEX68PTmikQ=;
 b=JyfgbPX2/V6H/kPsi5MhFv/z5mcOXjMV5bfLm8UVJCtPE3ZLtM094kYE4A7hTIgnD2IFza8vpZvXSA39bu+4sSha2fk071+0npbJUyJ53zYMpca+YeleY78OnkUH+/R9lLlvVnlDb/WtKYjVZ/QemykCoyW2JzoexCb6C6p/VmNIrYF24YrpVlW23vYpCBdztZYvRjCiA7E9ekeLr/W27skDeBO8ROfe5M+VaIJfqXI/3iA5K8ZazSCNshdMzuKUQ9gCcbD4EXZ2+BOKmNxRxoZRenmUt/rM7/yaZAMot8gbcztMH6Gdev1SZwbSqPOVTg5exFadzL2uU4ateBQUnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jjtMvA23UpP9595/61adkwqEcNI/T/ErIEX68PTmikQ=;
 b=fasUYsFrobiDGSVOozV5f/JY14GUg+CW+00o4j0/lE55YCwH5p7C0kuu+afIyu9k2ESiHbZky6GuokJigWd1HURrbZK3PUjhlNYXmUJKogmenol1XYZlr+V3lYb08VxQT+BqOHjveKx8F1z99krnuWGFW+5P/cFNAYh2FtYkTvs=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=none action=none
 header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4898.namprd12.prod.outlook.com (2603:10b6:208:1c7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17; Fri, 5 Feb
 2021 10:36:10 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3825.023; Fri, 5 Feb 2021
 10:36:10 +0000
Subject: Re: [RFC][PATCH v6 0/7] Generic page pool & deferred freeing for
 system dmabuf heap
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
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <0864e2a8-3a44-e7db-828f-abdac7c64471@amd.com>
Date:   Fri, 5 Feb 2021 11:36:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210205080621.3102035-1-john.stultz@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM9P195CA0030.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::35) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by AM9P195CA0030.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.21 via Frontend Transport; Fri, 5 Feb 2021 10:36:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 281f19d8-414e-4f1d-8aee-08d8c9c1da17
X-MS-TrafficTypeDiagnostic: BL0PR12MB4898:
X-Microsoft-Antispam-PRVS: <BL0PR12MB4898FD111BA1336ADA40D09583B29@BL0PR12MB4898.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: juBsqG6hgm0EgaBSjX1fojEMJ39dQYBil5ObRyBUJH4X56W+NRZcIyqVojmbr2VrFk1FUYuGfL9nGO1Fic2tLeRYYM67Lns5WKIaD8Ki2Sb6PP4D1oBjsTuP92ZC8QsuoiKRFDfgilHkx0Fh3y3L6FxzfZj1cxAEOy6cuUe1hhQEAq5ZS9bkmJrALXobNmYdq+o7pU6G/OSioqMW70aZjaHKSyRrEjcWbHz8CR/hoxX3ucycsmjhEHMpf3yaRlCs9Wju2U/h+JhlPZR69DT5UES3mtEfBpNbfkdk03eiMKnUaGAiep8ZewupJPncpT1jiBJKakCH2Ip3PQrQkQ3zSS5pGvnp9/mhR1GvCaXiaNL17o7+ytp79YmFnESe5luuHQtX4hn9SUrEFLBybzuuaA5Ntxx1lPKaYRaX4u+kiJc7Z+1Fv4++qXBs/r2kmvk985s5rhivrk/CEPd65acaZybQbFtXLy9f6Yji3OF74btS7NUaB6q/gFO9+pu1zhEDW2zavyXpUauPh87z9G1vPhsoyRv3iy5uNWC4qKh4hJmY7NmUNmCVjoEkfsksHzP+wbVXsfwJuFiVQdeSFtwo5saMHmplWiU58ZS8hWQCmMRaJ+5TGrlLPDcPXZzYbzmVuwl0KtmHTVTw8RMILRcap2SZT/wJDTv8Eku1kAY47078eHkfbYXhek68QjMnW/CzxUrPuF49ZTLrmpPW88nH/g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(366004)(346002)(39860400002)(136003)(16526019)(186003)(6486002)(6666004)(8676002)(86362001)(2906002)(7416002)(31696002)(31686004)(83380400001)(966005)(5660300002)(2616005)(478600001)(8936002)(36756003)(45080400002)(66556008)(54906003)(66946007)(110136005)(316002)(52116002)(66476007)(4326008)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?enV6SktXZ3ZIbllhUi82amxnNzNJQlc1UXp2VGFFSmhFdnJaM3lOY1d1NzY5?=
 =?utf-8?B?OFhsbENrdzJkQmxjMWNCOTZ4OEZKSkg5SkROckpuNUdHLy9pZ2plQXlTOElv?=
 =?utf-8?B?QVRkOXFrc3RoZnVXajlIYnZFRjZxcW1VVktuMExWU0N0cHA4blFnVnU2N3NI?=
 =?utf-8?B?STd2UlFhL3EvVGZ1akF0QmduRHZuMXFUVGNmeHpLUTlPQXNoVE1hWEtwbTU0?=
 =?utf-8?B?NnhlVHY0M3h6U0tzRFBlemVQd0ZKckp1ODNnVXRoOTdQYVlibEI4U3B0MDA3?=
 =?utf-8?B?ZEVDUVhXOTFoSnF0cXR1OXE5b3lNU09SVmpIWjZLVjRnQ3dRRTBuM3VRVkhi?=
 =?utf-8?B?SDVKK1lPdWFwNmJhMmM0Y1prSTN0L3VWMnZqaHFpV2dpeW9uT2l6S3RrSCt4?=
 =?utf-8?B?TzFROEMvaDdTTVdYZjdldVJkcnhpZG9kK3pSVllpSmtjZ2pMcFk1WjM1THhP?=
 =?utf-8?B?NUhVVkpXWWlTT1BRZkN2YXFneFhQelVUN2JmV25tM1d5K1BGZWlJR2tuVHVF?=
 =?utf-8?B?TTN0UWZUT05iT21rQlBxREZzSW9Va3JFZHJ4cFBocGNEZEVUbGYrZzhKOXRH?=
 =?utf-8?B?bHh0ckJXWG54cTBYSmoyOHdqanNxZkYxL2NMSVFLdktsZUMrWWZLMWNKUy9q?=
 =?utf-8?B?TjdGY0E4S2poUnRZdmJNeXdqR1UxL0hFelp5OGV5V3lyVmF6cWMyZ0ZlNTBq?=
 =?utf-8?B?RU1OeGNMakFtN25OUTVlWHFUQ0RKTDZoQi9iNzgyNlBDa2xxTnFPK2dWdlZk?=
 =?utf-8?B?NXllWGRveDVjYmJoVzJSVXlkMGtaT1Y1RzV4NWtFQURaME1NKzE5VkdsaEVZ?=
 =?utf-8?B?c2J4dHE1clFJQSt0QmM1UHZPNFUvLzlpZ1k1Q1FieGRyVUE5R1JwOWxHVkVY?=
 =?utf-8?B?aGhHZWVQOHFIMHkwRmo4MFkvUzNNS21WRmJqa1dWRWtwTGRyVjRZM1lyV1Zu?=
 =?utf-8?B?VjRtWmpMS1ZlWllhYityZWRlUGtXV3BVLzlmdXU2dnFwWC9rbjRVdmZ0VUNT?=
 =?utf-8?B?YVgzd0FGVjZzZUZ0TXUxQzhXSGhiU25nbzdzREdWd1d1Tmx0Y254ZmVMc0ZL?=
 =?utf-8?B?Q1NlcjN5cVBYN2d3UzFQZUR6d002c0ZCeFZHeVNpQmVsS0FLNEVjNnhzaWlH?=
 =?utf-8?B?UVNWSExxT20wbW51YkdBeFc2SmRGR2VweEdZWWhKVkg4RmNOVDJ3Z0QzekRZ?=
 =?utf-8?B?U1VFVWNONzBadkE4aWlwaEhSb3c1KzZMZW12a1JBZ0l6UC9FdmxOZ2x3LytZ?=
 =?utf-8?B?cytmcXZ6aGtJaUNMQUVpcVV3K0YvMXRYcGlIQmdaRnpxSStWZEdzU3IvYzMy?=
 =?utf-8?B?Z3Fzc0hvVi9rS0lMQ08xbElSdjh3eGVaQXUwNVFBSkI5MHJkVkdNMU00T3hJ?=
 =?utf-8?B?ZXQyUnNNWExPaERGdHNsYlZieWJ6R2hFWVBkanptQjAvNzltOXpJbDhtQ1o2?=
 =?utf-8?B?Y1NEbWcwOFJjSTBMVHBCa0F2N0thTGN4TGwwdUNhZmdxbzlwaVlOaVRyTUYz?=
 =?utf-8?B?ZVJiZjREYjVDTG1CeGRhTTlWNURWV0o2ZlI0UENad1M1K2s4SzhrV2hJZ0hi?=
 =?utf-8?B?ZXdKdTZ5dWlkMFA2cUVYaDRZaUJRYkxuR1FxVnhjNzRxRjRnV1J6S3FVL3pl?=
 =?utf-8?B?MW5YaVA4TUJnTlFpcGxscjRLVjhlOXZjNGlvUDEyaWlNaXF6cXFDa0RXUm5x?=
 =?utf-8?B?OEZ1YlZKSisyWkthajZFQVJkZGNyVHNyKzB4NkV6d2ZNQUphVlUwUG9RbUNI?=
 =?utf-8?B?LzRuRjV5bDBHanZqYzJTU2gzbURpSFBoSlRibHg5SU9Xc0tNcmYvakRpSjRL?=
 =?utf-8?B?RVlKZldXSkJES2VNd2VYQ25SdENxYXlqNHliL0pUMlZhcXVPL29FdFV4YlIz?=
 =?utf-8?Q?1hyakYX6Sn3yG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 281f19d8-414e-4f1d-8aee-08d8c9c1da17
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 10:36:10.0770
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cMN98aisSn71wtx0kzYhwTXEC0jg/0Z8jePAmQP65KWwuPRkhBdIXC2a9PDgQNLx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4898
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 05.02.21 um 09:06 schrieb John Stultz:
> This series is starting to get long, so I figured I'd add a
> short cover letter for context.
>
> The point of this series is trying to add both deferred-freeing
> logic as well as a page pool to the DMA-BUF system heap.
>
> This is desired, as the combination of deferred freeing along
> with the page pool allows us to offload page-zeroing out of
> the allocation hot path. This was done originally with ION
> and this patch series allows the DMA-BUF system heap to match
> ION's system heap allocation performance in a simple
> microbenchmark [1] (ION re-added to the kernel for comparision,
> running on an x86 vm image):
>
> ./dmabuf-heap-bench -i 0 1 system
> Testing dmabuf system vs ion heaptype 0 (flags: 0x1)
> ---------------------------------------------
> dmabuf heap: alloc 4096 bytes 5000 times in 86572223 ns          17314 ns/call
> ion heap:    alloc 4096 bytes 5000 times in 97442526 ns          19488 ns/call
> dmabuf heap: alloc 1048576 bytes 5000 times in 196635057 ns      39327 ns/call
> ion heap:    alloc 1048576 bytes 5000 times in 357323629 ns      71464 ns/call
> dmabuf heap: alloc 8388608 bytes 5000 times in 3165445534 ns     633089 ns/call
> ion heap:    alloc 8388608 bytes 5000 times in 3699591271 ns     739918 ns/call
> dmabuf heap: alloc 33554432 bytes 5000 times in 13327402517 ns   2665480 ns/call
> ion heap:    alloc 33554432 bytes 5000 times in 15292352796 ns   3058470 ns/call
>
> Daniel didn't like earlier attempts to re-use the network
> page-pool code to achieve this, and suggested the ttm_pool be
> used instead. This required pulling the fairly tightly knit
> ttm_pool logic apart, but after many failed attmempts I think
> I found a workable abstraction to split out shared logic.
>
> So this series contains a new generic drm_page_pool helper
> library, converts the ttm_pool to use it, and then adds the
> dmabuf deferred freeing and adds support to the dmabuf system
> heap to use both deferred freeing and the new drm_page_pool.
>
> Input would be greatly appreciated. Testing as well, as I don't
> have any development hardware that utilizes the ttm pool.

We can easily do the testing and the general idea sounds solid to me.

I see three major things we need to clean up here.
1. The licensing, you are moving from BSD/MIT to GPL2.
2. Don't add any new overhead to the TTM pool, especially allocating a 
private object per page is a no-go.
3. What are you doing with the reclaim stuff and why?
4. Keeping the documentation would be nice to have.

Regards,
Christian.

>
> thanks
> -john
>
> [1] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fandroid.googlesource.com%2Fplatform%2Fsystem%2Fmemory%2Flibdmabufheap%2F%2B%2Frefs%2Fheads%2Fmaster%2Ftests%2Fdmabuf_heap_bench.c&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C2dc4d6cb3ee246558b9e08d8c9acef9a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637481091933715561%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=oMgVsrdlwS%2BqZuuatjTiWDzMU9SiUW5eRar5xwT%2BHYQ%3D&amp;reserved=0
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
>
> John Stultz (7):
>    drm: Add a sharable drm page-pool implementation
>    drm: ttm_pool: Rename the ttm_pool_dma structure to ttm_pool_page_dat
>    drm: ttm_pool: Rework ttm_pool_free_page to allow us to use it as a
>      function pointer
>    drm: ttm_pool: Rework ttm_pool to use drm_page_pool
>    dma-buf: heaps: Add deferred-free-helper library code
>    dma-buf: system_heap: Add drm pagepool support to system heap
>    dma-buf: system_heap: Add deferred freeing to the system heap
>
>   drivers/dma-buf/heaps/Kconfig                |   5 +
>   drivers/dma-buf/heaps/Makefile               |   1 +
>   drivers/dma-buf/heaps/deferred-free-helper.c | 145 ++++++++++
>   drivers/dma-buf/heaps/deferred-free-helper.h |  55 ++++
>   drivers/dma-buf/heaps/system_heap.c          |  77 ++++-
>   drivers/gpu/drm/Kconfig                      |   5 +
>   drivers/gpu/drm/Makefile                     |   1 +
>   drivers/gpu/drm/page_pool.c                  | 220 +++++++++++++++
>   drivers/gpu/drm/ttm/ttm_pool.c               | 278 ++++++-------------
>   include/drm/page_pool.h                      |  54 ++++
>   include/drm/ttm/ttm_pool.h                   |  23 +-
>   11 files changed, 639 insertions(+), 225 deletions(-)
>   create mode 100644 drivers/dma-buf/heaps/deferred-free-helper.c
>   create mode 100644 drivers/dma-buf/heaps/deferred-free-helper.h
>   create mode 100644 drivers/gpu/drm/page_pool.c
>   create mode 100644 include/drm/page_pool.h
>

