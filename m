Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 385492FF4C6
	for <lists+linux-media@lfdr.de>; Thu, 21 Jan 2021 20:40:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726494AbhAUTko (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jan 2021 14:40:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60615 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726438AbhAUSs2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jan 2021 13:48:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611254820;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=S+Ku3Ce/RlpmoJYQD8InrfxdVWhR01oEy0SQfdERl30=;
        b=RodjjkWh5QjIWNaOJGHLuuGEgxepza+CW/tWEFKBqBnI+oxw369WvowP4ibHRmBYN8k3Nt
        qBLLJ78Z27+ER+EMV2MM41ryRdQaSoloLUZtzx1ovQoLqGUf41WplIOPReS+a8dd7BZdwx
        0HxGvu6sJYRgmLOYR799eBlsxLDNaq0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-Zy5nkR7ONPqf5PZD0-wpbQ-1; Thu, 21 Jan 2021 13:46:56 -0500
X-MC-Unique: Zy5nkR7ONPqf5PZD0-wpbQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32ABC192AB71;
        Thu, 21 Jan 2021 18:46:54 +0000 (UTC)
Received: from [10.36.115.70] (ovpn-115-70.ams2.redhat.com [10.36.115.70])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 635AA5D749;
        Thu, 21 Jan 2021 18:46:50 +0000 (UTC)
Subject: Re: [PATCH v4 1/4] mm: cma: introduce gfp flag in cma_alloc instead
 of no_warn
To:     Minchan Kim <minchan@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-mm <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>,
        hyesoo.yu@samsung.com, mhocko@suse.com, surenb@google.com,
        pullip.cho@samsung.com, joaodias@google.com, hridya@google.com,
        john.stultz@linaro.org, sumit.semwal@linaro.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        hch@infradead.org, robh+dt@kernel.org,
        linaro-mm-sig@lists.linaro.org
References: <20210121175502.274391-1-minchan@kernel.org>
 <20210121175502.274391-2-minchan@kernel.org>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <a8906f32-cc15-928c-2638-76cee4b7054d@redhat.com>
Date:   Thu, 21 Jan 2021 19:46:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210121175502.274391-2-minchan@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 21.01.21 18:54, Minchan Kim wrote:
> The upcoming patch will introduce __GFP_NORETRY semantic
> in alloc_contig_range which is a failfast mode of the API.
> Instead of adding a additional parameter for gfp, replace
> no_warn with gfp flag.
> 
> To keep old behaviors, it follows the rule below.
> 
>   no_warn 			gfp_flags
> 
>   false         		GFP_KERNEL
>   true          		GFP_KERNEL|__GFP_NOWARN
>   gfp & __GFP_NOWARN		GFP_KERNEL | (gfp & __GFP_NOWARN)
> 
> Reviewed-by: Suren Baghdasaryan <surenb@google.com>
> Signed-off-by: Minchan Kim <minchan@kernel.org>
> ---
>  drivers/dma-buf/heaps/cma_heap.c |  2 +-
>  drivers/s390/char/vmcp.c         |  2 +-
>  include/linux/cma.h              |  2 +-
>  kernel/dma/contiguous.c          |  3 ++-
>  mm/cma.c                         | 12 ++++++------
>  mm/cma_debug.c                   |  2 +-
>  mm/hugetlb.c                     |  6 ++++--
>  mm/secretmem.c                   |  3 ++-
>  8 files changed, 18 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
> index 364fc2f3e499..0afc1907887a 100644
> --- a/drivers/dma-buf/heaps/cma_heap.c
> +++ b/drivers/dma-buf/heaps/cma_heap.c
> @@ -298,7 +298,7 @@ static int cma_heap_allocate(struct dma_heap *heap,
>  	if (align > CONFIG_CMA_ALIGNMENT)
>  		align = CONFIG_CMA_ALIGNMENT;
>  
> -	cma_pages = cma_alloc(cma_heap->cma, pagecount, align, false);
> +	cma_pages = cma_alloc(cma_heap->cma, pagecount, align, GFP_KERNEL);
>  	if (!cma_pages)
>  		goto free_buffer;
>  
> diff --git a/drivers/s390/char/vmcp.c b/drivers/s390/char/vmcp.c
> index 9e066281e2d0..78f9adf56456 100644
> --- a/drivers/s390/char/vmcp.c
> +++ b/drivers/s390/char/vmcp.c
> @@ -70,7 +70,7 @@ static void vmcp_response_alloc(struct vmcp_session *session)
>  	 * anymore the system won't work anyway.
>  	 */
>  	if (order > 2)
> -		page = cma_alloc(vmcp_cma, nr_pages, 0, false);
> +		page = cma_alloc(vmcp_cma, nr_pages, 0, GFP_KERNEL);
>  	if (page) {
>  		session->response = (char *)page_to_phys(page);
>  		session->cma_alloc = 1;
> diff --git a/include/linux/cma.h b/include/linux/cma.h
> index 217999c8a762..d6c02d08ddbc 100644
> --- a/include/linux/cma.h
> +++ b/include/linux/cma.h
> @@ -45,7 +45,7 @@ extern int cma_init_reserved_mem(phys_addr_t base, phys_addr_t size,
>  					const char *name,
>  					struct cma **res_cma);
>  extern struct page *cma_alloc(struct cma *cma, size_t count, unsigned int align,
> -			      bool no_warn);
> +			      gfp_t gfp_mask);
>  extern bool cma_release(struct cma *cma, const struct page *pages, unsigned int count);
>  
>  extern int cma_for_each_area(int (*it)(struct cma *cma, void *data), void *data);
> diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
> index 3d63d91cba5c..552ed531c018 100644
> --- a/kernel/dma/contiguous.c
> +++ b/kernel/dma/contiguous.c
> @@ -260,7 +260,8 @@ struct page *dma_alloc_from_contiguous(struct device *dev, size_t count,
>  	if (align > CONFIG_CMA_ALIGNMENT)
>  		align = CONFIG_CMA_ALIGNMENT;
>  
> -	return cma_alloc(dev_get_cma_area(dev), count, align, no_warn);
> +	return cma_alloc(dev_get_cma_area(dev), count, align, GFP_KERNEL |
> +			(no_warn ? __GFP_NOWARN : 0));
>  }
>  
>  /**
> diff --git a/mm/cma.c b/mm/cma.c
> index 0ba69cd16aeb..d50627686fec 100644
> --- a/mm/cma.c
> +++ b/mm/cma.c
> @@ -419,13 +419,13 @@ static inline void cma_debug_show_areas(struct cma *cma) { }
>   * @cma:   Contiguous memory region for which the allocation is performed.
>   * @count: Requested number of pages.
>   * @align: Requested alignment of pages (in PAGE_SIZE order).
> - * @no_warn: Avoid printing message about failed allocation
> + * @gfp_mask: GFP mask to use during the cma allocation.
>   *
>   * This function allocates part of contiguous memory on specific
>   * contiguous memory area.
>   */
>  struct page *cma_alloc(struct cma *cma, size_t count, unsigned int align,
> -		       bool no_warn)
> +		       gfp_t gfp_mask)
>  {
>  	unsigned long mask, offset;
>  	unsigned long pfn = -1;
> @@ -438,8 +438,8 @@ struct page *cma_alloc(struct cma *cma, size_t count, unsigned int align,
>  	if (!cma || !cma->count || !cma->bitmap)
>  		return NULL;
>  
> -	pr_debug("%s(cma %p, count %zu, align %d)\n", __func__, (void *)cma,
> -		 count, align);
> +	pr_debug("%s(cma %p, count %zu, align %d gfp_mask 0x%x)\n", __func__,
> +			(void *)cma, count, align, gfp_mask);
>  
>  	if (!count)
>  		return NULL;
> @@ -471,7 +471,7 @@ struct page *cma_alloc(struct cma *cma, size_t count, unsigned int align,
>  
>  		pfn = cma->base_pfn + (bitmap_no << cma->order_per_bit);
>  		ret = alloc_contig_range(pfn, pfn + count, MIGRATE_CMA,
> -				     GFP_KERNEL | (no_warn ? __GFP_NOWARN : 0));
> +						gfp_mask);
>  
>  		if (ret == 0) {
>  			page = pfn_to_page(pfn);
> @@ -500,7 +500,7 @@ struct page *cma_alloc(struct cma *cma, size_t count, unsigned int align,
>  			page_kasan_tag_reset(page + i);
>  	}
>  
> -	if (ret && !no_warn) {
> +	if (ret && !(gfp_mask & __GFP_NOWARN)) {
>  		pr_err("%s: alloc failed, req-size: %zu pages, ret: %d\n",
>  			__func__, count, ret);
>  		cma_debug_show_areas(cma);
> diff --git a/mm/cma_debug.c b/mm/cma_debug.c
> index d5bf8aa34fdc..00170c41cf81 100644
> --- a/mm/cma_debug.c
> +++ b/mm/cma_debug.c
> @@ -137,7 +137,7 @@ static int cma_alloc_mem(struct cma *cma, int count)
>  	if (!mem)
>  		return -ENOMEM;
>  
> -	p = cma_alloc(cma, count, 0, false);
> +	p = cma_alloc(cma, count, 0, GFP_KERNEL);
>  	if (!p) {
>  		kfree(mem);
>  		return -ENOMEM;
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index a6bad1f686c5..4209a2ed1e1b 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -1266,7 +1266,8 @@ static struct page *alloc_gigantic_page(struct hstate *h, gfp_t gfp_mask,
>  
>  		if (hugetlb_cma[nid]) {
>  			page = cma_alloc(hugetlb_cma[nid], nr_pages,
> -					huge_page_order(h), true);
> +					huge_page_order(h),
> +					GFP_KERNEL | __GFP_NOWARN);
>  			if (page)
>  				return page;
>  		}
> @@ -1277,7 +1278,8 @@ static struct page *alloc_gigantic_page(struct hstate *h, gfp_t gfp_mask,
>  					continue;
>  
>  				page = cma_alloc(hugetlb_cma[node], nr_pages,
> -						huge_page_order(h), true);
> +						huge_page_order(h),
> +						GFP_KERNEL | __GFP_NOWARN);
>  				if (page)
>  					return page;
>  			}
> diff --git a/mm/secretmem.c b/mm/secretmem.c
> index b8a32954ac68..585d55b9f9d8 100644
> --- a/mm/secretmem.c
> +++ b/mm/secretmem.c
> @@ -86,7 +86,8 @@ static int secretmem_pool_increase(struct secretmem_ctx *ctx, gfp_t gfp)
>  	struct page *page;
>  	int err;
>  
> -	page = cma_alloc(secretmem_cma, nr_pages, PMD_SIZE, gfp & __GFP_NOWARN);
> +	page = cma_alloc(secretmem_cma, nr_pages, PMD_SIZE,
> +				GFP_KERNEL | (gfp & __GFP_NOWARN));
>  	if (!page)
>  		return -ENOMEM;
>  
> 

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

