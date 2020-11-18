Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24BEC2B75A6
	for <lists+linux-media@lfdr.de>; Wed, 18 Nov 2020 06:21:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726444AbgKRFSb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Nov 2020 00:18:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726234AbgKRFSb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Nov 2020 00:18:31 -0500
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14482C061A4F
        for <linux-media@vger.kernel.org>; Tue, 17 Nov 2020 21:18:31 -0800 (PST)
Received: by mail-ot1-x342.google.com with SMTP id o3so595973ota.8
        for <linux-media@vger.kernel.org>; Tue, 17 Nov 2020 21:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F7sKJwkzdbeLOyKiVuDYfrrRTcjeln31HNpMolHCz84=;
        b=dhgZBRUwhlMJGYy5B5kg0/hTc+PVW/P9fwbxUQJYELxJr3sFTgqZUB3YOpBKAzffVk
         DY8UNWEqVw/HybCxEg7v6elONW5OXpewFmWZL47EXnXpZ8KRUpN25OyEbQ9waYsX2RYx
         Z7M6iEvChYlW5DZl2OVnarihlbMHfZ+iw9QzaRzN3biQjmkcdmZfzEv9o1SvTTS68wEa
         j8YjGL9BGrbAOtVkCtPFjv7oRrzDU3i75AjHiOH8d7M/p3Fs5gn7lA76LSbCUU4yP3Pf
         y279jWnjt9FlaQSVf4leq5rK885Ko1y0Kv581qhqm/jDkmphNYUXOMTTDpKcLJGF9Wct
         d2EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F7sKJwkzdbeLOyKiVuDYfrrRTcjeln31HNpMolHCz84=;
        b=QxGFzl48yIvddRFAS35Bl/pK/19C4JAT/anhx4fz3PsbPg0pagsFdyn4Z0Pui6Jia8
         AH2oJeifMZnJC5QgYJdpxrZ45OGtFFT0A2Vexq3ft0zgXdvgRs62zjNH1mPeGCH2XlLc
         HJ6cSJZ6tF+HRXfkx8IZjZUm9GmVQV9x1MSjeds7VbZ/tpjHLm+1j+qi0PuikDsqHPz7
         rYJHZJSgwB+HlDCx4RdjpBnm4RG2Bot+On7sJZaJQo970WEan7IIXoB6Td1eBy9971pf
         rm56ybPY7SNJDvM6+2M0WjgqCaA4XsCgk3AJAs5//kuvjKur4J2ZUstSAG7XxHbvAYHg
         PRdw==
X-Gm-Message-State: AOAM532rWwTOaJGLiLQsUrkap/TuqNw92OSXyQsCfXJUIkmtSx4GbWr+
        +mNQRcdCD9XiaZVO9lk6K2LGC1rcEDnfTahDl2uTnA==
X-Google-Smtp-Source: ABdhPJznMB7Dcm3wHiflI6UU5baKUw77SPDRMKIJ2o8sjGzcuUEIkHfXK7f360M22ZzOz3BxHb2BphgAFuVXhh6gpyE=
X-Received: by 2002:a9d:64ce:: with SMTP id n14mr5354340otl.352.1605676710354;
 Tue, 17 Nov 2020 21:18:30 -0800 (PST)
MIME-Version: 1.0
References: <20201117181935.3613581-1-minchan@kernel.org> <20201117181935.3613581-3-minchan@kernel.org>
In-Reply-To: <20201117181935.3613581-3-minchan@kernel.org>
From:   John Stultz <john.stultz@linaro.org>
Date:   Tue, 17 Nov 2020 21:18:17 -0800
Message-ID: <CALAqxLX0BfH3G0eoA77dKyuVAUGmdJGhFuaoJdyG+TGqnmt2PA@mail.gmail.com>
Subject: Re: [PATCH 2/4] dma-buf: add export symbol for dma-heap
To:     Minchan Kim <minchan@kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>, Hyesoo Yu <hyesoo.yu@samsung.com>,
        Matthew Wilcox <willy@infradead.org>, david@redhat.com,
        iamjoonsoo.kim@lge.com, vbabka@suse.cz,
        Suren Baghdasaryan <surenb@google.com>,
        KyongHo Cho <pullip.cho@samsung.com>,
        John Dias <joaodias@google.com>,
        Hridya Valsaraju <hridya@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
        Christian Koenig <christian.koenig@amd.com>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Christoph Hellwig <hch@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 17, 2020 at 10:19 AM Minchan Kim <minchan@kernel.org> wrote:
>
> From: Hyesoo Yu <hyesoo.yu@samsung.com>
>
> The heaps could be added as module, so some functions should
> be exported to register dma-heaps. And dma-heap of module can use
> cma area to allocate and free. However the function related cma
> is not exported now. Let's export them for next patches.
>
> Signed-off-by: Hyesoo Yu <hyesoo.yu@samsung.com>
> Signed-off-by: Minchan Kim <minchan@kernel.org>
> ---
>  drivers/dma-buf/dma-heap.c | 2 ++
>  mm/cma.c                   | 3 +++
>  2 files changed, 5 insertions(+)
>
> diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> index afd22c9dbdcf..cc6339cbca09 100644
> --- a/drivers/dma-buf/dma-heap.c
> +++ b/drivers/dma-buf/dma-heap.c
> @@ -189,6 +189,7 @@ void *dma_heap_get_drvdata(struct dma_heap *heap)
>  {
>         return heap->priv;
>  }
> +EXPORT_SYMBOL_GPL(dma_heap_get_drvdata);
>
>  struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
>  {
> @@ -272,6 +273,7 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
>         kfree(heap);
>         return err_ret;
>  }
> +EXPORT_SYMBOL_GPL(dma_heap_add);
>
>  static char *dma_heap_devnode(struct device *dev, umode_t *mode)
>  {

Thanks so much for sending this series along!
I'm ok with the dma-heap exports to support modules.

> diff --git a/mm/cma.c b/mm/cma.c
> index 7c11ec2dc04c..87834e2966fa 100644
> --- a/mm/cma.c
> +++ b/mm/cma.c
> @@ -54,6 +54,7 @@ const char *cma_get_name(const struct cma *cma)
>  {
>         return cma->name;
>  }
> +EXPORT_SYMBOL_GPL(cma_get_name);
>
>  static unsigned long cma_bitmap_aligned_mask(const struct cma *cma,
>                                              unsigned int align_order)
> @@ -498,6 +499,7 @@ struct page *cma_alloc(struct cma *cma, size_t count, unsigned int align,
>         pr_debug("%s(): returned %p\n", __func__, page);
>         return page;
>  }
> +EXPORT_SYMBOL_GPL(cma_alloc);
>
>  /*
>   * cma_alloc_bulk() - allocate high order bulk pages from contiguous area with
> @@ -641,6 +643,7 @@ bool cma_release(struct cma *cma, const struct page *pages, unsigned int count)
>
>         return true;
>  }
> +EXPORT_SYMBOL_GPL(cma_release);
>
>  int cma_for_each_area(int (*it)(struct cma *cma, void *data), void *data)
>  {
> --

Though Christoph's (cc'ed) input would probably be good for the cma
ones, as I know he had concerns previously with similar patches.

thanks
-john
