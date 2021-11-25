Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E48C45DC09
	for <lists+linux-media@lfdr.de>; Thu, 25 Nov 2021 15:10:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351754AbhKYONS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Nov 2021 09:13:18 -0500
Received: from foss.arm.com ([217.140.110.172]:51520 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1355362AbhKYOLS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Nov 2021 09:11:18 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 26E6A1FB;
        Thu, 25 Nov 2021 06:08:07 -0800 (PST)
Received: from [10.57.56.56] (unknown [10.57.56.56])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 777393F66F;
        Thu, 25 Nov 2021 06:08:04 -0800 (PST)
Message-ID: <eb6cc56d-cbe0-73d5-d4f5-0aa2b76272a4@arm.com>
Date:   Thu, 25 Nov 2021 14:08:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2] dma_heap: use for_each_sgtable_sg in sg_table release
 flow
Content-Language: en-GB
To:     guangming.cao@mediatek.com
Cc:     Brian.Starkey@arm.com, benjamin.gaignard@linaro.org,
        christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
        john.stultz@linaro.org, labbott@redhat.com,
        linaro-mm-sig@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        lmark@codeaurora.org, matthias.bgg@gmail.com,
        sumit.semwal@linaro.org, wsd_upstream@mediatek.com
References: <85eb9053-0ce4-2514-06dc-58b8910dc5f7@arm.com>
 <20211125134951.62002-1-guangming.cao@mediatek.com>
From:   Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20211125134951.62002-1-guangming.cao@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2021-11-25 13:49, guangming.cao@mediatek.com wrote:
> From: Guangming <Guangming.Cao@mediatek.com>
> 
> Use (for_each_sgtable_sg) rather than (for_each_sg) to traverse
> sg_table to free sg_table.
> Use (for_each_sg) maybe will casuse some pages can't be freed
> when send wrong nents number.

It's still worth spelling out that this is fixing a bug where the 
current code should have been using table->orig_nents - it's just that 
switching to the sgtable helper is the best way to make the fix, since 
it almost entirely removes the possibility of making that (previously 
rather common) mistake.

If it helps, for the change itself:

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

Thanks,
Robin.

> Signed-off-by: Guangming <Guangming.Cao@mediatek.com>
> ---
>   drivers/dma-buf/heaps/system_heap.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
> index 23a7e74ef966..8660508f3684 100644
> --- a/drivers/dma-buf/heaps/system_heap.c
> +++ b/drivers/dma-buf/heaps/system_heap.c
> @@ -289,7 +289,7 @@ static void system_heap_dma_buf_release(struct dma_buf *dmabuf)
>   	int i;
>   
>   	table = &buffer->sg_table;
> -	for_each_sg(table->sgl, sg, table->nents, i) {
> +	for_each_sgtable_sg(table, sg, i) {
>   		struct page *page = sg_page(sg);
>   
>   		__free_pages(page, compound_order(page));
> 
