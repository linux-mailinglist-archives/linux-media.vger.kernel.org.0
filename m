Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E623532E6B7
	for <lists+linux-media@lfdr.de>; Fri,  5 Mar 2021 11:51:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbhCEKut (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Mar 2021 05:50:49 -0500
Received: from mail-co1nam11on2088.outbound.protection.outlook.com ([40.107.220.88]:50529
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229729AbhCEKua (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 5 Mar 2021 05:50:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AQlE+8iUQ4GSg/tui3nHcxWplnhFBJh+ht1G9zwQWmPNU5888HoV3+cPryFLuUHaQwQvouTvLSshddG2RzD5g2C5hbDhr2BuRdVNIVaYkm7h4AyvNPCnRLZm5NER2j3J05fPU+jQTGN5u/Ntm6Z4Vi0e+h5dr3YpS13dbBav5IAobdUvN38NvnsP/A22XjfhHhN/8NgJxwXLE9coIyvzxlUowzmhNM3BfanRGtJVLYIgBreRI65429MAp76Yw2wQFIIfPu4O9g+YMY0CNWiSOJaQA4KiaTVt+jHXNYYXjdx67ehdMU+kx1RerhOGd/aa2C9mhQksn7hcvSPxUoMb3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EQB202eOeRADJ0qGEaD20HEBv8b9vhMg0j3Y0NhyxFQ=;
 b=Sjc+HH8o1uddxa4ZrsqcWZHvEMjgXjvXGojU1IJ6S8OL+EbzumeF3DMxRhevEiQ7sunDeOblTsLIspy4fsH1EIQSbK74+D4Q4hdZgSxp4YDpJDbH+OShlfE78PzC4ia/gqKDxTH2q4extit6mT/KpY3u4mwtTt7NChpbDH1hbFOhsjr+hoYx5Y/vXySGHcoJz9QXmC4ZA0GwdQ8lvje9ApCcoMARkhFyGF2xAIxcNqwYVE7JPuM5OkqCCOvF2YOuNxc58vAv8U4tCCxZh83SrICQ9bQ9wIZMftix0PEACJTvqShmq7E77cyO+jlruECeEr0nmW7f3YHGbJaLvgOaCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EQB202eOeRADJ0qGEaD20HEBv8b9vhMg0j3Y0NhyxFQ=;
 b=0+utzDd87OyFp4RqhdjT3/yXOyqnFrgMJ7F9lPpqUiiA5koXpsAeerQW9k+/44RaACLYo+2VopIbqtYU38uRB9mNsMTzxakKWBlt1p/uU0tT7ZVLTX4h/wsbyIBQhuq/grmdjDy+yVBc7kcFkmc+IiBnEBTl+d+jCmywvzI8JTg=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=none action=none
 header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4705.namprd12.prod.outlook.com (2603:10b6:208:88::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.25; Fri, 5 Mar
 2021 10:50:24 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3912.023; Fri, 5 Mar 2021
 10:50:24 +0000
Subject: Re: [PATCH v8 3/5] dma-buf: heaps: Add deferred-free-helper library
 code
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
 <20210304232011.1479036-4-john.stultz@linaro.org>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <b52aa41b-b1bb-823f-4569-94e18834ac59@amd.com>
Date:   Fri, 5 Mar 2021 11:50:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210304232011.1479036-4-john.stultz@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:23ea:890a:84c3:71ab]
X-ClientProxiedBy: AM8P192CA0006.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::11) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:23ea:890a:84c3:71ab] (2a02:908:1252:fb60:23ea:890a:84c3:71ab) by AM8P192CA0006.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21b::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Fri, 5 Mar 2021 10:50:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1f107650-9d26-4bba-96aa-08d8dfc47a90
X-MS-TrafficTypeDiagnostic: BL0PR12MB4705:
X-Microsoft-Antispam-PRVS: <BL0PR12MB4705B7A2565D1E2907CC1ED883969@BL0PR12MB4705.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ApW91SOchn5kS0VULV8Lhb9NCb89EzsHQqRL7v2I/PYtwKO6Vf7CBD7fA52f5ElLLB2hxV7c3oyolYLYrKT8mFf+nw6kgjtBuqn0nOh+qPrrLfP+59T4/olCEn1yeoTceMektZNz9MuR0dvg+6Yj/doYlAgDG/DW5VvQYXAT9bO/hmgbaBKtWPSZ9UD/F9YkGztYGig0LBV7PFZfTAk6oO1jVCaqA3NC7qet4vAnovpgb6DQnGEEZIG9O8dTrPkus54x5EVa64XxTKrlBBTc8/yztUqIhBfTuTur7h1O4IpblB/YXV7hNoBbbZmbsCZr05TY+JBk1I8R5QyEDa2wKf7YsRygwOC/GfA1vKcujhoRGqFzxm3n1ydajlAW+/vH5oCdpWwmGJSmOCAfT+XkrqPwBvofmONA1u33GgVTNvoY6K9Qokbnu6l8LUYZ7pYPAAjjdHgIi+jiSayLaGao5oDgVtLSBxV3VEG2pN67PWp5siURr4hO+YuzgcVgQRBdeiZzwUq2mMjziqbpJL7nb0sRXOw0rA42qsjR5fH2i64r1KIENkOEmRyx9dSlnAkq8SXDseAsWbqkW0ZBqni1QFZWydg/iAYPheR5iWc+XjE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(366004)(396003)(39860400002)(376002)(52116002)(6666004)(16526019)(186003)(316002)(54906003)(2616005)(66556008)(5660300002)(66476007)(36756003)(110136005)(66946007)(2906002)(6486002)(478600001)(86362001)(7416002)(8676002)(8936002)(31686004)(4326008)(83380400001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RitNa2RzRWVkdjBHcCtMaXpZeVpTVzZteTFyTzRUQS9EYUtwNDJmQ3RaTzlp?=
 =?utf-8?B?eUE0M09RaHlwY0ZPNStHWW9zWVJoOC83eUw4QzgreHNxRXB4RGEvNjJuZTR0?=
 =?utf-8?B?OUhwdFZNUUpDQnRlc2t3R1lIQ2ZFK2IrQzJjc1RLQnZIeFFWeHZvKzNURk5S?=
 =?utf-8?B?TWxNV3o0VXJaZHUvUHFReFdxWFJtckZ3Sy9naDZMaUFEZ2Z1S01EbkI4M2l3?=
 =?utf-8?B?d0JRSERnd0dFS0RUS010M3ZSeUFvdmxQcGNIUEJhb1dGNEhGekVlMzVLNVhp?=
 =?utf-8?B?TjVWNDZNTmt6NVd6UVltQVVRbzJGTFBuZkFnN293RlZBR2w4OW5DakNEVHdn?=
 =?utf-8?B?S3pvSDA2eTFWME90enFaMWNiQjFRM0tUSS94cWVsZUlOdzREOEMybUVTQ0g5?=
 =?utf-8?B?UGJwMEhGaDBPYjg4MHErOENBdlJ5d1JwemkxNXFXN0tDelRuZTM4TFR2aTNP?=
 =?utf-8?B?WGpNQ0dHUXlWZTFjd2FaeWJJUXNaejlvZzlXQzB3YXVSMnlVcDFzcjJYUnoy?=
 =?utf-8?B?V2JwRmo3QlAxQ0tLM2l5L25xTDB2M1I1Mml5cnRKNWRVWEpTQi9PYXJxWm5X?=
 =?utf-8?B?R2hVUVRwMEVjNzVVMktHOE9mejlVbzZpSjV6SjEyRVVPUGJORjloM056NENV?=
 =?utf-8?B?SFJCeDdpdFFwTzVwYWNEZStFK3FPR0luWHhDTk80Sko2d1NCMWRERUhPaDJY?=
 =?utf-8?B?U1JHL1hJMW5GOWFGM0ExMzhURG1wQ0llYWw2QUVDbEpHbmhCelZiUTlCdkFw?=
 =?utf-8?B?WGc0cDUxMGVuSWs4R09xZnJOcGJHS2xUY055Y084MmhVQnUraWlZUTVhYWJ0?=
 =?utf-8?B?a1Zrc3ZtSG01RVJNTGVWZ1dibklzVmJJLzZ6OTg2Zm1rZUpiMjZOd2ZjUXlE?=
 =?utf-8?B?bzJiY0xpTVRMNm8wSFFERjlnTnZMcGdQZkY3aU1hbkV4cGJUR3pRNDl4UXlZ?=
 =?utf-8?B?Z0NmWU9iMTh3b21zUUJFbnhOUld2aGpxclZ5dnZkMmI4V0NKUzBxdkNrTzNF?=
 =?utf-8?B?MlR3VnJsdCt5Q09uMW1ETDJoZHpkMk5oUXZCQ2dMZWVEOWQ3Unc2TEJ1V1J6?=
 =?utf-8?B?RURsVmFwUE9qQlFoOWw4ay93ZjcwSGxvK1h3RzIvUW4wSjhjMklSRUhSM1dt?=
 =?utf-8?B?RHFkTjVDWXZmVituUmdmeE1rL3VneWxRcG1MTVZrOW45dlp5cGx1ZDJyQWhq?=
 =?utf-8?B?SjJpVnBvbnBNMUppMGVSZnl6aUJzblN6Z3FlaWRaOEV4S0xLNlhXcGtoUnUy?=
 =?utf-8?B?djBsbkt3QXhWL0dCUWp3UnViU1o3dHdzQmJqaElNZlRXMDFMVldrc2JXdW43?=
 =?utf-8?B?ZlFJVUdwUkw2cWdxV3V2VElrU2N6OUZTWUFXc1pXWkxiOUhqdm43d1V4b1dE?=
 =?utf-8?B?Zk56U0pzZTJCbzZqVTQwYnR6cGcxcXg0YS81eG5VMmIvdXZtalhSd0ZUUXpv?=
 =?utf-8?B?d284VGNkeTV1akU1ZlhhVXFYZzNYVUp0VXJwZEpKdk5QZk1zRE0wMVdmYWxW?=
 =?utf-8?B?dFlWM2lrejVGWVRuamRkN2YwZ1drald6T01nOUdvTVg2NFRvS29jaGNES1RU?=
 =?utf-8?B?RUJma0FZRUp5OFN0aUVGaGJwc2ZKMUdxaFZoU2ZyT1EvVHQwVEdMSGN0V3hR?=
 =?utf-8?B?WE9WT2xNaG93eWY1YTFhd0xUV3I5Z1d2M3ozZ3ZZQ1JGRERxNFcvSDJ0aHJ0?=
 =?utf-8?B?VjZqSVlHbmQvSkQvSzJqdExZWEM2b2ZJbDhhdnVZS2pudWxtTGxLNGRFUHFh?=
 =?utf-8?B?TmZYYUhTcHIyN2hoMTFjRktHaEt3bTZJaVRTSVNyZWFRcU1lSkwrcEI1UWVS?=
 =?utf-8?B?dWNkRG5STzNUUEI5L2VvbGZpWnhqaGhad3Ayc2xhTjl1WmxDTHhIY2cxRmtE?=
 =?utf-8?Q?0IFAgukeRXHp0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f107650-9d26-4bba-96aa-08d8dfc47a90
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2021 10:50:23.9123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HXypg2iVs6ttJyiRo0PgFKVB5Ajv7LqhEIRAUnpKtLDM03ono7K9h3uopJFdnC61
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4705
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 05.03.21 um 00:20 schrieb John Stultz:
> This patch provides infrastructure for deferring buffer frees.
>
> This is a feature ION provided which when used with some form
> of a page pool, provides a nice performance boost in an
> allocation microbenchmark. The reason it helps is it allows the
> page-zeroing to be done out of the normal allocation/free path,
> and pushed off to a kthread.

In general that's a nice idea, but to be honest this implementation 
looks broken and rather inefficient.

You should probably rather integrate that into the DRM pool core 
functionality which is currently clearing all freed pages anyway.

I would also use a work item per pool instead of a kthread, that would 
help with data locality.

Regards,
Christian.

>
> As not all heaps will find this useful, its implemented as
> a optional helper library that heaps can utilize.
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
> v2:
> * Fix sleep in atomic issue from using a mutex, by switching
>    to a spinlock as Reported-by: kernel test robot <oliver.sang@intel.com>
> * Cleanup API to use a reason enum for clarity and add some documentation
>    comments as suggested by Suren Baghdasaryan.
> v3:
> * Minor tweaks so it can be built as a module
> * A few small fixups suggested by Daniel Mentz
> v4:
> * Tweak from Daniel Mentz to make sure the shrinker
>    count/freed values are tracked in pages not bytes
> v5:
> * Fix up page count tracking as suggested by Suren Baghdasaryan
> v7:
> * Rework accounting to use nr_pages rather then size, as suggested
>    by Suren Baghdasaryan
> ---
>   drivers/dma-buf/heaps/Kconfig                |   3 +
>   drivers/dma-buf/heaps/Makefile               |   1 +
>   drivers/dma-buf/heaps/deferred-free-helper.c | 138 +++++++++++++++++++
>   drivers/dma-buf/heaps/deferred-free-helper.h |  55 ++++++++
>   4 files changed, 197 insertions(+)
>   create mode 100644 drivers/dma-buf/heaps/deferred-free-helper.c
>   create mode 100644 drivers/dma-buf/heaps/deferred-free-helper.h
>
> diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
> index a5eef06c4226..f7aef8bc7119 100644
> --- a/drivers/dma-buf/heaps/Kconfig
> +++ b/drivers/dma-buf/heaps/Kconfig
> @@ -1,3 +1,6 @@
> +config DMABUF_HEAPS_DEFERRED_FREE
> +	tristate
> +
>   config DMABUF_HEAPS_SYSTEM
>   	bool "DMA-BUF System Heap"
>   	depends on DMABUF_HEAPS
> diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-buf/heaps/Makefile
> index 974467791032..4e7839875615 100644
> --- a/drivers/dma-buf/heaps/Makefile
> +++ b/drivers/dma-buf/heaps/Makefile
> @@ -1,3 +1,4 @@
>   # SPDX-License-Identifier: GPL-2.0
> +obj-$(CONFIG_DMABUF_HEAPS_DEFERRED_FREE) += deferred-free-helper.o
>   obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)	+= system_heap.o
>   obj-$(CONFIG_DMABUF_HEAPS_CMA)		+= cma_heap.o
> diff --git a/drivers/dma-buf/heaps/deferred-free-helper.c b/drivers/dma-buf/heaps/deferred-free-helper.c
> new file mode 100644
> index 000000000000..e19c8b68dfeb
> --- /dev/null
> +++ b/drivers/dma-buf/heaps/deferred-free-helper.c
> @@ -0,0 +1,138 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Deferred dmabuf freeing helper
> + *
> + * Copyright (C) 2020 Linaro, Ltd.
> + *
> + * Based on the ION page pool code
> + * Copyright (C) 2011 Google, Inc.
> + */
> +
> +#include <linux/freezer.h>
> +#include <linux/list.h>
> +#include <linux/slab.h>
> +#include <linux/swap.h>
> +#include <linux/sched/signal.h>
> +
> +#include "deferred-free-helper.h"
> +
> +static LIST_HEAD(free_list);
> +static size_t list_nr_pages;
> +wait_queue_head_t freelist_waitqueue;
> +struct task_struct *freelist_task;
> +static DEFINE_SPINLOCK(free_list_lock);
> +
> +void deferred_free(struct deferred_freelist_item *item,
> +		   void (*free)(struct deferred_freelist_item*,
> +				enum df_reason),
> +		   size_t nr_pages)
> +{
> +	unsigned long flags;
> +
> +	INIT_LIST_HEAD(&item->list);
> +	item->nr_pages = nr_pages;
> +	item->free = free;
> +
> +	spin_lock_irqsave(&free_list_lock, flags);
> +	list_add(&item->list, &free_list);
> +	list_nr_pages += nr_pages;
> +	spin_unlock_irqrestore(&free_list_lock, flags);
> +	wake_up(&freelist_waitqueue);
> +}
> +EXPORT_SYMBOL_GPL(deferred_free);
> +
> +static size_t free_one_item(enum df_reason reason)
> +{
> +	unsigned long flags;
> +	size_t nr_pages;
> +	struct deferred_freelist_item *item;
> +
> +	spin_lock_irqsave(&free_list_lock, flags);
> +	if (list_empty(&free_list)) {
> +		spin_unlock_irqrestore(&free_list_lock, flags);
> +		return 0;
> +	}
> +	item = list_first_entry(&free_list, struct deferred_freelist_item, list);
> +	list_del(&item->list);
> +	nr_pages = item->nr_pages;
> +	list_nr_pages -= nr_pages;
> +	spin_unlock_irqrestore(&free_list_lock, flags);
> +
> +	item->free(item, reason);
> +	return nr_pages;
> +}
> +
> +static unsigned long get_freelist_nr_pages(void)
> +{
> +	unsigned long nr_pages;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&free_list_lock, flags);
> +	nr_pages = list_nr_pages;
> +	spin_unlock_irqrestore(&free_list_lock, flags);
> +	return nr_pages;
> +}
> +
> +static unsigned long freelist_shrink_count(struct shrinker *shrinker,
> +					   struct shrink_control *sc)
> +{
> +	return get_freelist_nr_pages();
> +}
> +
> +static unsigned long freelist_shrink_scan(struct shrinker *shrinker,
> +					  struct shrink_control *sc)
> +{
> +	unsigned long total_freed = 0;
> +
> +	if (sc->nr_to_scan == 0)
> +		return 0;
> +
> +	while (total_freed < sc->nr_to_scan) {
> +		size_t pages_freed = free_one_item(DF_UNDER_PRESSURE);
> +
> +		if (!pages_freed)
> +			break;
> +
> +		total_freed += pages_freed;
> +	}
> +
> +	return total_freed;
> +}
> +
> +static struct shrinker freelist_shrinker = {
> +	.count_objects = freelist_shrink_count,
> +	.scan_objects = freelist_shrink_scan,
> +	.seeks = DEFAULT_SEEKS,
> +	.batch = 0,
> +};
> +
> +static int deferred_free_thread(void *data)
> +{
> +	while (true) {
> +		wait_event_freezable(freelist_waitqueue,
> +				     get_freelist_nr_pages() > 0);
> +
> +		free_one_item(DF_NORMAL);
> +	}
> +
> +	return 0;
> +}
> +
> +static int deferred_freelist_init(void)
> +{
> +	list_nr_pages = 0;
> +
> +	init_waitqueue_head(&freelist_waitqueue);
> +	freelist_task = kthread_run(deferred_free_thread, NULL,
> +				    "%s", "dmabuf-deferred-free-worker");
> +	if (IS_ERR(freelist_task)) {
> +		pr_err("Creating thread for deferred free failed\n");
> +		return -1;
> +	}
> +	sched_set_normal(freelist_task, 19);
> +
> +	return register_shrinker(&freelist_shrinker);
> +}
> +module_init(deferred_freelist_init);
> +MODULE_LICENSE("GPL v2");
> +
> diff --git a/drivers/dma-buf/heaps/deferred-free-helper.h b/drivers/dma-buf/heaps/deferred-free-helper.h
> new file mode 100644
> index 000000000000..11940328ce3f
> --- /dev/null
> +++ b/drivers/dma-buf/heaps/deferred-free-helper.h
> @@ -0,0 +1,55 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef DEFERRED_FREE_HELPER_H
> +#define DEFERRED_FREE_HELPER_H
> +
> +/**
> + * df_reason - enum for reason why item was freed
> + *
> + * This provides a reason for why the free function was called
> + * on the item. This is useful when deferred_free is used in
> + * combination with a pagepool, so under pressure the page can
> + * be immediately freed.
> + *
> + * DF_NORMAL:         Normal deferred free
> + *
> + * DF_UNDER_PRESSURE: Free was called because the system
> + *                    is under memory pressure. Usually
> + *                    from a shrinker. Avoid allocating
> + *                    memory in the free call, as it may
> + *                    fail.
> + */
> +enum df_reason {
> +	DF_NORMAL,
> +	DF_UNDER_PRESSURE,
> +};
> +
> +/**
> + * deferred_freelist_item - item structure for deferred freelist
> + *
> + * This is to be added to the structure for whatever you want to
> + * defer freeing on.
> + *
> + * @nr_pages: number of pages used by item to be freed
> + * @free: function pointer to be called when freeing the item
> + * @list: list entry for the deferred list
> + */
> +struct deferred_freelist_item {
> +	size_t nr_pages;
> +	void (*free)(struct deferred_freelist_item *i,
> +		     enum df_reason reason);
> +	struct list_head list;
> +};
> +
> +/**
> + * deferred_free - call to add item to the deferred free list
> + *
> + * @item: Pointer to deferred_freelist_item field of a structure
> + * @free: Function pointer to the free call
> + * @nr_pages: number of pages to be freed
> + */
> +void deferred_free(struct deferred_freelist_item *item,
> +		   void (*free)(struct deferred_freelist_item *i,
> +				enum df_reason reason),
> +		   size_t nr_pages);
> +#endif

