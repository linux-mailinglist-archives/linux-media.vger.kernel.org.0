Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A20245DB1F
	for <lists+linux-media@lfdr.de>; Thu, 25 Nov 2021 14:30:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350014AbhKYNdt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Nov 2021 08:33:49 -0500
Received: from foss.arm.com ([217.140.110.172]:51034 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1347729AbhKYNbs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Nov 2021 08:31:48 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 22A2E1FB;
        Thu, 25 Nov 2021 05:28:37 -0800 (PST)
Received: from [10.57.56.56] (unknown [10.57.56.56])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C3E993F66F;
        Thu, 25 Nov 2021 05:28:34 -0800 (PST)
Message-ID: <85eb9053-0ce4-2514-06dc-58b8910dc5f7@arm.com>
Date:   Thu, 25 Nov 2021 13:28:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] dma_heap: use sg_table.orig_nents in sg_table release
 flow
Content-Language: en-GB
To:     guangming.cao@mediatek.com, Sumit Semwal <sumit.semwal@linaro.org>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@redhat.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        John Stultz <john.stultz@linaro.org>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "open list:DMA-BUF HEAPS FRAMEWORK" <linux-media@vger.kernel.org>,
        "open list:DMA-BUF HEAPS FRAMEWORK" <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA-BUF HEAPS FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>
Cc:     wsd_upstream@mediatek.com
References: <20211125124626.60068-1-guangming.cao@mediatek.com>
From:   Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20211125124626.60068-1-guangming.cao@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2021-11-25 12:46, guangming.cao@mediatek.com wrote:
> From: Guangming <Guangming.Cao@mediatek.com>
> 
> Use (sg_table.orig_nents) rather than (sg_table.nents) to traverse
> sg_table to free sg_table.
> Use (sg_table.nents) maybe will casuse some pages can't be freed.

...and this sort of bug is precisely why we have the 
for_each_sgtable_sg() helper ;)

Robin.

> Signed-off-by: Guangming <Guangming.Cao@mediatek.com>
> ---
>   drivers/dma-buf/heaps/system_heap.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
> index 23a7e74ef966..ce10d4eb674c 100644
> --- a/drivers/dma-buf/heaps/system_heap.c
> +++ b/drivers/dma-buf/heaps/system_heap.c
> @@ -289,7 +289,7 @@ static void system_heap_dma_buf_release(struct dma_buf *dmabuf)
>   	int i;
>   
>   	table = &buffer->sg_table;
> -	for_each_sg(table->sgl, sg, table->nents, i) {
> +	for_each_sg(table->sgl, sg, table->orig_nents, i) {
>   		struct page *page = sg_page(sg);
>   
>   		__free_pages(page, compound_order(page));
> 
