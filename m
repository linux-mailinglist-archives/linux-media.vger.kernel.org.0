Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65AD32801A0
	for <lists+linux-media@lfdr.de>; Thu,  1 Oct 2020 16:49:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732410AbgJAOt0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Oct 2020 10:49:26 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:58134 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732147AbgJAOtZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 1 Oct 2020 10:49:25 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1601563764; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=2kvF58kigGFmHtXjNh7v0zXrE9xY+Y5LVaWwGb72IkM=;
 b=lDtQ+zhKX2CfEXw7m6pDlYf1/qhBQYGGBjuLRk/FON0qJzTVbXlxBZrpd/f4vE12XB24k4CP
 CFXcdyN79XRQvPDEVm5R1KVkneoLNSTusf6/u17q/LxCM0nphy9s6EfarW5RFlTw/jqrhCUv
 TmtJJa5am2wWTjn1dyT/krZgNtM=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5f75ec6c0ae65af4a26951ae (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 01 Oct 2020 14:49:16
 GMT
Sender: cgoldswo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9ADE3C433FE; Thu,  1 Oct 2020 14:49:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: cgoldswo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2F37BC433CA;
        Thu,  1 Oct 2020 14:49:14 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Thu, 01 Oct 2020 07:49:14 -0700
From:   Chris Goldsworthy <cgoldswo@codeaurora.org>
To:     John Stultz <john.stultz@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Sandeep Patil <sspatil@google.com>,
        =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Simon Ser <contact@emersion.fr>,
        James Jones <jajones@nvidia.com>, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [RFC][PATCH 5/6] dma-buf: system_heap: Add pagepool support to
 system heap
In-Reply-To: <1e109a138c86be7b06e20cb30a243fc7@codeaurora.org>
References: <20200926042453.67517-1-john.stultz@linaro.org>
 <20200926042453.67517-6-john.stultz@linaro.org>
 <1e109a138c86be7b06e20cb30a243fc7@codeaurora.org>
Message-ID: <ef00c83a9be572a1f9319b818de71266@codeaurora.org>
X-Sender: cgoldswo@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2020-09-29 21:46, Chris Goldsworthy wrote:
> On 2020-09-25 21:24, John Stultz wrote:
>> Reuse/abuse the pagepool code from the network code to speed
>> up allocation performance.
>> 
>> This is similar to the ION pagepool usage, but tries to
>> utilize generic code instead of a custom implementation.
>> 
>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
>> Cc: Liam Mark <lmark@codeaurora.org>
>> Cc: Laura Abbott <labbott@kernel.org>
>> Cc: Brian Starkey <Brian.Starkey@arm.com>
>> Cc: Hridya Valsaraju <hridya@google.com>
>> Cc: Suren Baghdasaryan <surenb@google.com>
>> Cc: Sandeep Patil <sspatil@google.com>
>> Cc: Ørjan Eide <orjan.eide@arm.com>
>> Cc: Robin Murphy <robin.murphy@arm.com>
>> Cc: Ezequiel Garcia <ezequiel@collabora.com>
>> Cc: Simon Ser <contact@emersion.fr>
>> Cc: James Jones <jajones@nvidia.com>
>> Cc: linux-media@vger.kernel.org
>> Cc: dri-devel@lists.freedesktop.org
>> Signed-off-by: John Stultz <john.stultz@linaro.org>
>> ---
>>  drivers/dma-buf/heaps/Kconfig       |  1 +
>>  drivers/dma-buf/heaps/system_heap.c | 32 
>> +++++++++++++++++++++++++----
>>  2 files changed, 29 insertions(+), 4 deletions(-)
>> 
>> diff --git a/drivers/dma-buf/heaps/Kconfig 
>> b/drivers/dma-buf/heaps/Kconfig
>> index a5eef06c4226..f13cde4321b1 100644
>> --- a/drivers/dma-buf/heaps/Kconfig
>> +++ b/drivers/dma-buf/heaps/Kconfig
>> @@ -1,6 +1,7 @@
>>  config DMABUF_HEAPS_SYSTEM
>>  	bool "DMA-BUF System Heap"
>>  	depends on DMABUF_HEAPS
>> +	select PAGE_POOL
>>  	help
>>  	  Choose this option to enable the system dmabuf heap. The system 
>> heap
>>  	  is backed by pages from the buddy allocator. If in doubt, say Y.
>> diff --git a/drivers/dma-buf/heaps/system_heap.c
>> b/drivers/dma-buf/heaps/system_heap.c
>> index 882a632e9bb7..9f57b4c8ae69 100644
>> --- a/drivers/dma-buf/heaps/system_heap.c
>> +++ b/drivers/dma-buf/heaps/system_heap.c
>> @@ -20,6 +20,7 @@
>>  #include <linux/scatterlist.h>
>>  #include <linux/slab.h>
>>  #include <linux/vmalloc.h>
>> +#include <net/page_pool.h>
>> 
>>  struct dma_heap *sys_heap;
>> 
>> @@ -46,6 +47,7 @@ struct dma_heap_attachment {
>>  static gfp_t order_flags[] = {HIGH_ORDER_GFP, LOW_ORDER_GFP, 
>> LOW_ORDER_GFP};
>>  static const unsigned int orders[] = {8, 4, 0};
>>  #define NUM_ORDERS ARRAY_SIZE(orders)
>> +struct page_pool *pools[NUM_ORDERS];
>> 
>>  static struct sg_table *dup_sg_table(struct sg_table *table)
>>  {
>> @@ -264,13 +266,17 @@ static void system_heap_dma_buf_release(struct
>> dma_buf *dmabuf)
>>  	struct system_heap_buffer *buffer = dmabuf->priv;
>>  	struct sg_table *table;
>>  	struct scatterlist *sg;
>> -	int i;
>> +	int i, j;
>> 
>>  	table = &buffer->sg_table;
>>  	for_each_sg(table->sgl, sg, table->nents, i) {
>>  		struct page *page = sg_page(sg);
>> 
>> -		__free_pages(page, compound_order(page));
>> +		for (j = 0; j < NUM_ORDERS; j++) {
>> +			if (compound_order(page) == orders[j])
>> +				break;
>> +		}
>> +		page_pool_put_full_page(pools[j], page, false);
>>  	}
>>  	sg_free_table(table);
>>  	kfree(buffer);
>> @@ -300,8 +306,7 @@ static struct page
>> *alloc_largest_available(unsigned long size,
>>  			continue;
>>  		if (max_order < orders[i])
>>  			continue;
>> -
>> -		page = alloc_pages(order_flags[i], orders[i]);
>> +		page = page_pool_alloc_pages(pools[i], order_flags[i]);
>>  		if (!page)
>>  			continue;
>>  		return page;
>> @@ -406,6 +411,25 @@ static const struct dma_heap_ops system_heap_ops 
>> = {
>>  static int system_heap_create(void)
>>  {
>>  	struct dma_heap_export_info exp_info;
>> +	int i;
>> +
>> +	for (i = 0; i < NUM_ORDERS; i++) {
>> +		struct page_pool_params pp;
>> +
>> +		memset(&pp, 0, sizeof(pp));
>> +		pp.order = orders[i];
>> +		pp.dma_dir = DMA_BIDIRECTIONAL;

Hey John,

Correct me if I'm wrong, but I think that in order for pp.dma_dir to be 
used in either page_pool_alloc_pages() or page_pool_put_full_page(), we 
need to at least have PP_FLAG_DMA_MAP set (to have 
page_pool_dma_sync_for_device() called, PP_FLAG_DMA_SYNC_DEV should also 
be set I think).  I think you'd also need to to have pp->dev set.  Are 
we setting dma_dir with the intention of doing the necessary CMOs before 
we start using the page?

Thanks,

Chris.

>> +		pools[i] = page_pool_create(&pp);
>> +
>> +		if (IS_ERR(pools[i])) {
>> +			int j;
>> +
>> +			pr_err("%s: page pool creation failed!\n", __func__);
>> +			for (j = 0; j < i; j++)
>> +				page_pool_destroy(pools[j]);
>> +			return PTR_ERR(pools[i]);
>> +		}
>> +	}
>> 
>>  	exp_info.name = "system";
>>  	exp_info.ops = &system_heap_ops;
> 
> This is cool, I didn't know about this pooling code under /net/core.
> Nice and compact.

-- 
The Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
