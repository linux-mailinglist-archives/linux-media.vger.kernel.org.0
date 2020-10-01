Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72BF928068F
	for <lists+linux-media@lfdr.de>; Thu,  1 Oct 2020 20:29:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730144AbgJAS25 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Oct 2020 14:28:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730008AbgJAS25 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Oct 2020 14:28:57 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AAAEC0613E2
        for <linux-media@vger.kernel.org>; Thu,  1 Oct 2020 11:28:57 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id o8so6464130otl.4
        for <linux-media@vger.kernel.org>; Thu, 01 Oct 2020 11:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=kz26kZpY5ux5dw8pIZFhmygrJ593+m//lklRbB5JLMk=;
        b=krgZIkCBzg/+xOHmycMkxy7ew3qfkC0MS0ZIrW5pW70VF+EdVeRyXZkO0Oqn+NmQPZ
         3d8X7dl4fIZHceqwzlgL7ugXqkARNaXTy5Jvjm7d23XORMeTKP6u/GCUxyGzd2Kp7xSW
         NlJ8SXOPI4fnPP9FPBquFC7YwdWMSbvrQjMj1vHCIHtyBfwjrIUctakeZp2iUeob2HzI
         493E8mgiXqSHYFRmii2ajY29+GjRs7aZtpJsCwdyiR8TDqSSgQ5r48GSUQi0ynZ+YL6t
         sRL2rgrHkzJ1gabqFC3brt9Irdgq1Um5Ex8kmH1G01ZIfEbF4HpRZeHg9WwpslvpZKZH
         mHTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kz26kZpY5ux5dw8pIZFhmygrJ593+m//lklRbB5JLMk=;
        b=BawqWzr2nVTD13WA7yzmTclgjSSz5UweF76BDJRQ+3pp0tDcmkI6b8MUOiuoVjBSLU
         TN33p9YXSh7RNEhgk0yGq4SVRROsLcymgpYDhDPhAf0Z1hx0iWelfg7V7zzHxBZJDszF
         38sxshdPx+IB0l3fJtHxiBLIqC6ooWl3SQArRn253ND6SlJYTtQ+t0OKdrwj9cqE6zsV
         kAgHhCboESAxuAUVwvsC5uFI6q/vcGO7qSu9zW5yJIKL+BODQz+ex3+XalnG8z/OWmfl
         miuaW5hZBUR923LhCBtiumMYykaJ4NW7eGyGwTR8JaeBiQQh1wzSfJuph9MJo+3PGRD6
         i2hg==
X-Gm-Message-State: AOAM530C4Sfq1FqtMAJc5rXZmlhtaNoXCcMbKMT1fMvtY4zEZL9Hz1KN
        YIfYk8iwzGuYMprEXQrOfP8wCiru0xfH11NGl2YnHA==
X-Google-Smtp-Source: ABdhPJxL7u7PML17vhq85pqQ5R14JB/fSmnxH08J41Mst1wYV1OOwGpMYndJDi0i2JZkiDxG3NgBdMiTZbuIaGCHOYQ=
X-Received: by 2002:a05:6830:196:: with SMTP id q22mr5638905ota.221.1601576936284;
 Thu, 01 Oct 2020 11:28:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200926042453.67517-1-john.stultz@linaro.org>
 <20200926042453.67517-6-john.stultz@linaro.org> <1e109a138c86be7b06e20cb30a243fc7@codeaurora.org>
 <ef00c83a9be572a1f9319b818de71266@codeaurora.org>
In-Reply-To: <ef00c83a9be572a1f9319b818de71266@codeaurora.org>
From:   John Stultz <john.stultz@linaro.org>
Date:   Thu, 1 Oct 2020 11:28:45 -0700
Message-ID: <CALAqxLXWa=19FDvO2RmvBwdCG2=mrpfsk62kDknbmo0YA2rXXw@mail.gmail.com>
Subject: Re: [RFC][PATCH 5/6] dma-buf: system_heap: Add pagepool support to
 system heap
To:     Chris Goldsworthy <cgoldswo@codeaurora.org>
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
        James Jones <jajones@nvidia.com>,
        linux-media <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 1, 2020 at 7:49 AM Chris Goldsworthy
<cgoldswo@codeaurora.org> wrote:
> On 2020-09-29 21:46, Chris Goldsworthy wrote:
> > On 2020-09-25 21:24, John Stultz wrote:
> >> Reuse/abuse the pagepool code from the network code to speed
> >> up allocation performance.
> >>
> >> This is similar to the ION pagepool usage, but tries to
> >> utilize generic code instead of a custom implementation.
> >>
> >> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> >> Cc: Liam Mark <lmark@codeaurora.org>
> >> Cc: Laura Abbott <labbott@kernel.org>
> >> Cc: Brian Starkey <Brian.Starkey@arm.com>
> >> Cc: Hridya Valsaraju <hridya@google.com>
> >> Cc: Suren Baghdasaryan <surenb@google.com>
> >> Cc: Sandeep Patil <sspatil@google.com>
> >> Cc: =C3=98rjan Eide <orjan.eide@arm.com>
> >> Cc: Robin Murphy <robin.murphy@arm.com>
> >> Cc: Ezequiel Garcia <ezequiel@collabora.com>
> >> Cc: Simon Ser <contact@emersion.fr>
> >> Cc: James Jones <jajones@nvidia.com>
> >> Cc: linux-media@vger.kernel.org
> >> Cc: dri-devel@lists.freedesktop.org
> >> Signed-off-by: John Stultz <john.stultz@linaro.org>
> >> ---
> >>  drivers/dma-buf/heaps/Kconfig       |  1 +
> >>  drivers/dma-buf/heaps/system_heap.c | 32
> >> +++++++++++++++++++++++++----
> >>  2 files changed, 29 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/dma-buf/heaps/Kconfig
> >> b/drivers/dma-buf/heaps/Kconfig
> >> index a5eef06c4226..f13cde4321b1 100644
> >> --- a/drivers/dma-buf/heaps/Kconfig
> >> +++ b/drivers/dma-buf/heaps/Kconfig
> >> @@ -1,6 +1,7 @@
> >>  config DMABUF_HEAPS_SYSTEM
> >>      bool "DMA-BUF System Heap"
> >>      depends on DMABUF_HEAPS
> >> +    select PAGE_POOL
> >>      help
> >>        Choose this option to enable the system dmabuf heap. The system
> >> heap
> >>        is backed by pages from the buddy allocator. If in doubt, say Y=
.
> >> diff --git a/drivers/dma-buf/heaps/system_heap.c
> >> b/drivers/dma-buf/heaps/system_heap.c
> >> index 882a632e9bb7..9f57b4c8ae69 100644
> >> --- a/drivers/dma-buf/heaps/system_heap.c
> >> +++ b/drivers/dma-buf/heaps/system_heap.c
> >> @@ -20,6 +20,7 @@
> >>  #include <linux/scatterlist.h>
> >>  #include <linux/slab.h>
> >>  #include <linux/vmalloc.h>
> >> +#include <net/page_pool.h>
> >>
> >>  struct dma_heap *sys_heap;
> >>
> >> @@ -46,6 +47,7 @@ struct dma_heap_attachment {
> >>  static gfp_t order_flags[] =3D {HIGH_ORDER_GFP, LOW_ORDER_GFP,
> >> LOW_ORDER_GFP};
> >>  static const unsigned int orders[] =3D {8, 4, 0};
> >>  #define NUM_ORDERS ARRAY_SIZE(orders)
> >> +struct page_pool *pools[NUM_ORDERS];
> >>
> >>  static struct sg_table *dup_sg_table(struct sg_table *table)
> >>  {
> >> @@ -264,13 +266,17 @@ static void system_heap_dma_buf_release(struct
> >> dma_buf *dmabuf)
> >>      struct system_heap_buffer *buffer =3D dmabuf->priv;
> >>      struct sg_table *table;
> >>      struct scatterlist *sg;
> >> -    int i;
> >> +    int i, j;
> >>
> >>      table =3D &buffer->sg_table;
> >>      for_each_sg(table->sgl, sg, table->nents, i) {
> >>              struct page *page =3D sg_page(sg);
> >>
> >> -            __free_pages(page, compound_order(page));
> >> +            for (j =3D 0; j < NUM_ORDERS; j++) {
> >> +                    if (compound_order(page) =3D=3D orders[j])
> >> +                            break;
> >> +            }
> >> +            page_pool_put_full_page(pools[j], page, false);
> >>      }
> >>      sg_free_table(table);
> >>      kfree(buffer);
> >> @@ -300,8 +306,7 @@ static struct page
> >> *alloc_largest_available(unsigned long size,
> >>                      continue;
> >>              if (max_order < orders[i])
> >>                      continue;
> >> -
> >> -            page =3D alloc_pages(order_flags[i], orders[i]);
> >> +            page =3D page_pool_alloc_pages(pools[i], order_flags[i]);
> >>              if (!page)
> >>                      continue;
> >>              return page;
> >> @@ -406,6 +411,25 @@ static const struct dma_heap_ops system_heap_ops
> >> =3D {
> >>  static int system_heap_create(void)
> >>  {
> >>      struct dma_heap_export_info exp_info;
> >> +    int i;
> >> +
> >> +    for (i =3D 0; i < NUM_ORDERS; i++) {
> >> +            struct page_pool_params pp;
> >> +
> >> +            memset(&pp, 0, sizeof(pp));
> >> +            pp.order =3D orders[i];
> >> +            pp.dma_dir =3D DMA_BIDIRECTIONAL;
>
> Hey John,
>
> Correct me if I'm wrong, but I think that in order for pp.dma_dir to be
> used in either page_pool_alloc_pages() or page_pool_put_full_page(), we
> need to at least have PP_FLAG_DMA_MAP set (to have
> page_pool_dma_sync_for_device() called, PP_FLAG_DMA_SYNC_DEV should also
> be set I think).  I think you'd also need to to have pp->dev set.  Are
> we setting dma_dir with the intention of doing the necessary CMOs before
> we start using the page?

Looking, I think my setting of the dma_dir there on the pool is
unnecessary (and as you point out, it doesn't have much effect as long
as the PP_FLAG_DMA_MAP isn't set).
I'm really only using the pagepool as a page cache, and the dmabuf ops
are still used for mapping and syncing operations.

thanks
-john
