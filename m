Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B25492FDC3E
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 23:12:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727955AbhATWKn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 17:10:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729791AbhATVJm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 16:09:42 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 579EDC0613C1
        for <linux-media@vger.kernel.org>; Wed, 20 Jan 2021 13:08:55 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id q7so2489941wre.13
        for <linux-media@vger.kernel.org>; Wed, 20 Jan 2021 13:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jrbC4RQ9Vok9Ff5kzMzZA0o/riiO5zLn1Sc/26Ew/aU=;
        b=QoYootZ5afbRD+mZ8W7Gt/qW8cMhpVtTEbLrtpN+i64RDPLI1e9oTyXyxEQGtXbmJ6
         k+x4xSlixiY1CzrRf/elwYY1lK5GjyRQIHi06FP4m4hNdCDq4T4vpqJ7LwTogtgAxvGB
         +JXKRnEhzWaamXTAbsH6eq7vgHEjRXWDRzl1C7Sm4FFXar4Q32m+Nmjf4xobx5H8ktR+
         NrjuewS7iw7awksZVHJ6/wCEGxLUTSvvD6BCbP529nk63OKZOlLQVe7SUWTCLh4zf9qH
         64qlp7i1/q0h6qdewFa0RK+BM4H6eGNlkao43HgKGKDoGUTolT1cIZlqRXSWpuLOul3a
         DTig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jrbC4RQ9Vok9Ff5kzMzZA0o/riiO5zLn1Sc/26Ew/aU=;
        b=rFtpUhzaXN7LqSu5jIUN8Am+FgXow/At3ZmaKaK32XecRJRXeKaEs5N31GyJCHcF2D
         +0y3vaf5/9xYwhPPagRuEzj+79S6NeVgZVc0SdfOIQKwcg7kZIfJDT2WpdQ4pBvW6W5x
         nFE751q1DifCWDKhetXQcQjweQfmfxTVU1Oem1UUU0y2/L+PFvDEJX2AOf6ppBYCINQp
         ScBt9Ai70k5ww3onDXvdvIeIml1/n6KhOuNSb70xbYTPi6lbvNhwEJdtgAlW9d7cJyab
         IIdj+fjhYfGmngX7T6PCk+K8iFTxJUWDhLE64A0OU+F54G1acTt+3ocO+SeSshgHsrKY
         WYtg==
X-Gm-Message-State: AOAM532Y80TQD8jK2SVZxenksS9MdxwBZnoNL0hNTwaPVMQDVrxYBAVC
        oNeqhR5jRLn4a8+FjPnnlEnfz8m6+lM/7GAEuJ1mtA==
X-Google-Smtp-Source: ABdhPJzpNTD/eRhFnqsHsu0kpBD4XUvd2ZJ/N0uNyXjPU5OqeBdtTyyA5s3E/fp6fj4VyjMrWg3XY8rFJdwuJACJcbI=
X-Received: by 2002:a5d:4ecb:: with SMTP id s11mr4891114wrv.334.1611176933928;
 Wed, 20 Jan 2021 13:08:53 -0800 (PST)
MIME-Version: 1.0
References: <20210113012143.1201105-1-minchan@kernel.org> <20210113012143.1201105-2-minchan@kernel.org>
In-Reply-To: <20210113012143.1201105-2-minchan@kernel.org>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Wed, 20 Jan 2021 13:08:43 -0800
Message-ID: <CAJuCfpHDxgG6ZPK9KmMd64sdDTjFwDq5CCUjfbfN8Ta54Vq-SQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] mm: cma: introduce gfp flag in cma_alloc instead
 of no_warn
To:     Minchan Kim <minchan@kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-mm <linux-mm@kvack.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Hyesoo Yu <hyesoo.yu@samsung.com>, david@redhat.com,
        Michal Hocko <mhocko@suse.com>,
        =?UTF-8?B?7KGw6rK97Zi4?= <pullip.cho@samsung.com>,
        John Dias <joaodias@google.com>,
        Hridya Valsaraju <hridya@google.com>,
        John Stultz <john.stultz@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Christoph Hellwig <hch@infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jan 12, 2021 at 5:21 PM Minchan Kim <minchan@kernel.org> wrote:
>
> The upcoming patch will introduce __GFP_NORETRY semantic
> in alloc_contig_range which is a failfast mode of the API.
> Instead of adding a additional parameter for gfp, replace
> no_warn with gfp flag.
>
> To keep old behaviors, it follows the rule below.
>
>   no_warn                       gfp_flags
>
>   false                         GFP_KERNEL
>   true                          GFP_KERNEL|__GFP_NOWARN
>   gfp & __GFP_NOWARN            GFP_KERNEL | (gfp & __GFP_NOWARN)
>
> Signed-off-by: Minchan Kim <minchan@kernel.org>

Reviewed-by: Suren Baghdasaryan <surenb@google.com>

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
>         if (align > CONFIG_CMA_ALIGNMENT)
>                 align = CONFIG_CMA_ALIGNMENT;
>
> -       cma_pages = cma_alloc(cma_heap->cma, pagecount, align, false);
> +       cma_pages = cma_alloc(cma_heap->cma, pagecount, align, GFP_KERNEL);
>         if (!cma_pages)
>                 goto free_buffer;
>
> diff --git a/drivers/s390/char/vmcp.c b/drivers/s390/char/vmcp.c
> index 9e066281e2d0..78f9adf56456 100644
> --- a/drivers/s390/char/vmcp.c
> +++ b/drivers/s390/char/vmcp.c
> @@ -70,7 +70,7 @@ static void vmcp_response_alloc(struct vmcp_session *session)
>          * anymore the system won't work anyway.
>          */
>         if (order > 2)
> -               page = cma_alloc(vmcp_cma, nr_pages, 0, false);
> +               page = cma_alloc(vmcp_cma, nr_pages, 0, GFP_KERNEL);
>         if (page) {
>                 session->response = (char *)page_to_phys(page);
>                 session->cma_alloc = 1;
> diff --git a/include/linux/cma.h b/include/linux/cma.h
> index 217999c8a762..d6c02d08ddbc 100644
> --- a/include/linux/cma.h
> +++ b/include/linux/cma.h
> @@ -45,7 +45,7 @@ extern int cma_init_reserved_mem(phys_addr_t base, phys_addr_t size,
>                                         const char *name,
>                                         struct cma **res_cma);
>  extern struct page *cma_alloc(struct cma *cma, size_t count, unsigned int align,
> -                             bool no_warn);
> +                             gfp_t gfp_mask);
>  extern bool cma_release(struct cma *cma, const struct page *pages, unsigned int count);
>
>  extern int cma_for_each_area(int (*it)(struct cma *cma, void *data), void *data);
> diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
> index 3d63d91cba5c..552ed531c018 100644
> --- a/kernel/dma/contiguous.c
> +++ b/kernel/dma/contiguous.c
> @@ -260,7 +260,8 @@ struct page *dma_alloc_from_contiguous(struct device *dev, size_t count,
>         if (align > CONFIG_CMA_ALIGNMENT)
>                 align = CONFIG_CMA_ALIGNMENT;
>
> -       return cma_alloc(dev_get_cma_area(dev), count, align, no_warn);
> +       return cma_alloc(dev_get_cma_area(dev), count, align, GFP_KERNEL |
> +                       (no_warn ? __GFP_NOWARN : 0));
>  }
>
>  /**
> diff --git a/mm/cma.c b/mm/cma.c
> index 0ba69cd16aeb..35053b82aedc 100644
> --- a/mm/cma.c
> +++ b/mm/cma.c
> @@ -419,13 +419,13 @@ static inline void cma_debug_show_areas(struct cma *cma) { }
>   * @cma:   Contiguous memory region for which the allocation is performed.
>   * @count: Requested number of pages.
>   * @align: Requested alignment of pages (in PAGE_SIZE order).
> - * @no_warn: Avoid printing message about failed allocation
> + * @gfp_mask: GFP mask to use during during the cma allocation.
>   *
>   * This function allocates part of contiguous memory on specific
>   * contiguous memory area.
>   */
>  struct page *cma_alloc(struct cma *cma, size_t count, unsigned int align,
> -                      bool no_warn)
> +                      gfp_t gfp_mask)
>  {
>         unsigned long mask, offset;
>         unsigned long pfn = -1;
> @@ -438,8 +438,8 @@ struct page *cma_alloc(struct cma *cma, size_t count, unsigned int align,
>         if (!cma || !cma->count || !cma->bitmap)
>                 return NULL;
>
> -       pr_debug("%s(cma %p, count %zu, align %d)\n", __func__, (void *)cma,
> -                count, align);
> +       pr_debug("%s(cma %p, count %zu, align %d gfp_mask 0x%x)\n", __func__,
> +                       (void *)cma, count, align, gfp_mask);
>
>         if (!count)
>                 return NULL;
> @@ -471,7 +471,7 @@ struct page *cma_alloc(struct cma *cma, size_t count, unsigned int align,
>
>                 pfn = cma->base_pfn + (bitmap_no << cma->order_per_bit);
>                 ret = alloc_contig_range(pfn, pfn + count, MIGRATE_CMA,
> -                                    GFP_KERNEL | (no_warn ? __GFP_NOWARN : 0));
> +                                               gfp_mask);
>
>                 if (ret == 0) {
>                         page = pfn_to_page(pfn);
> @@ -500,7 +500,7 @@ struct page *cma_alloc(struct cma *cma, size_t count, unsigned int align,
>                         page_kasan_tag_reset(page + i);
>         }
>
> -       if (ret && !no_warn) {
> +       if (ret && !(gfp_mask & __GFP_NOWARN)) {
>                 pr_err("%s: alloc failed, req-size: %zu pages, ret: %d\n",
>                         __func__, count, ret);
>                 cma_debug_show_areas(cma);
> diff --git a/mm/cma_debug.c b/mm/cma_debug.c
> index d5bf8aa34fdc..00170c41cf81 100644
> --- a/mm/cma_debug.c
> +++ b/mm/cma_debug.c
> @@ -137,7 +137,7 @@ static int cma_alloc_mem(struct cma *cma, int count)
>         if (!mem)
>                 return -ENOMEM;
>
> -       p = cma_alloc(cma, count, 0, false);
> +       p = cma_alloc(cma, count, 0, GFP_KERNEL);
>         if (!p) {
>                 kfree(mem);
>                 return -ENOMEM;
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 737b2dce19e6..695af33aa66c 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -1266,7 +1266,8 @@ static struct page *alloc_gigantic_page(struct hstate *h, gfp_t gfp_mask,
>
>                 if (hugetlb_cma[nid]) {
>                         page = cma_alloc(hugetlb_cma[nid], nr_pages,
> -                                       huge_page_order(h), true);
> +                                       huge_page_order(h),
> +                                       GFP_KERNEL | __GFP_NOWARN);
>                         if (page)
>                                 return page;
>                 }
> @@ -1277,7 +1278,8 @@ static struct page *alloc_gigantic_page(struct hstate *h, gfp_t gfp_mask,
>                                         continue;
>
>                                 page = cma_alloc(hugetlb_cma[node], nr_pages,
> -                                               huge_page_order(h), true);
> +                                               huge_page_order(h),
> +                                               GFP_KERNEL | __GFP_NOWARN);
>                                 if (page)
>                                         return page;
>                         }
> diff --git a/mm/secretmem.c b/mm/secretmem.c
> index b8a32954ac68..585d55b9f9d8 100644
> --- a/mm/secretmem.c
> +++ b/mm/secretmem.c
> @@ -86,7 +86,8 @@ static int secretmem_pool_increase(struct secretmem_ctx *ctx, gfp_t gfp)
>         struct page *page;
>         int err;
>
> -       page = cma_alloc(secretmem_cma, nr_pages, PMD_SIZE, gfp & __GFP_NOWARN);
> +       page = cma_alloc(secretmem_cma, nr_pages, PMD_SIZE,
> +                               GFP_KERNEL | (gfp & __GFP_NOWARN));
>         if (!page)
>                 return -ENOMEM;
>
> --
> 2.30.0.284.gd98b1dd5eaa7-goog
>
