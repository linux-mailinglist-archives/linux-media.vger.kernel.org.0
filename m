Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6012304CC9
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 23:56:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730743AbhAZWzM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 17:55:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395455AbhAZTZ1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Jan 2021 14:25:27 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C6F9C061573;
        Tue, 26 Jan 2021 11:24:47 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id kx7so2589621pjb.2;
        Tue, 26 Jan 2021 11:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PQEAhCm3+TMoHM6fCNFPYeDIJ30oYf/VDFpXx3VbChw=;
        b=pdxOOP16unQeTfJM+vcSmtoc9otBE7D1QLUGBMbUYwwc34fV0mmt1KNHQcGy+JP0cp
         53WCFFjL8QIOoe4118TDseHG68AAfQPg+8uzBDlf7Vk8eIPb8XprP3FU8DM1Fx7jAwJ4
         5dqxSza5b9ihAmhyNhw+OIYVCN/olOVqT//FYm+DX+irUbO4Hy7VwOpBEZD81ZgyAHoB
         IHHnsDCgxxMP0KCAEbhJUDrkzNhPyOaNAGPa4BSQwgPDSLRKZr8VE5N8LUaR6/Zbz3K6
         GuKzfXkjki5oS4gGXjjW50XwR7uc+G2V5R93Dzcx3edaVBVeekPcoJzppscpK0pLvETu
         d8Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=PQEAhCm3+TMoHM6fCNFPYeDIJ30oYf/VDFpXx3VbChw=;
        b=a+6WKJ6ka5oN36U2wEMo0sa2mtzygtC3ntvZiH95nJK+3tfMVysqZNoVgX0NELvKsz
         PkVk9mQwaZIKdDHJzuGlLOktCbTq/G7GoekZtzcBFdReB8lIWAZt8pnR8a1+qHKLUUjC
         DE/5sptVI3qnpXk1F4XaF+oYUz90SmtV5vVSYPaOkJj2x5VljM/sE+TExHgnP63iWLoU
         68SZQDmyp8Z1kFAbuqJWC3juS/6kZ84wfY3nKq8I3f5vI19/iDZd/OmpeGFbCbYasEf0
         wKzuX6FCXscs2KzVDfgtbx0qjAAfTddWRq2tp0jTC9ub43saYd8ApqKYvKDVCNI+OIYt
         YuRA==
X-Gm-Message-State: AOAM533dEP/Ip1rODAdz0i+OZNIXdUgVSTdG3xzpl1lc30haydrkF0Ns
        3wk1XVZKdZJAunD9uPFmDjk=
X-Google-Smtp-Source: ABdhPJxdJr9i8PyYeuFQBxPxm7+nZIJNNDk8XULgbT6ihBzMPiuZA67mDinh9JKsG2HkLZaC7sxFnw==
X-Received: by 2002:a17:90a:5403:: with SMTP id z3mr1385657pjh.198.1611689087020;
        Tue, 26 Jan 2021 11:24:47 -0800 (PST)
Received: from google.com ([2620:15c:211:201:9dd5:b47b:bb84:dede])
        by smtp.gmail.com with ESMTPSA id jx15sm2818337pjb.17.2021.01.26.11.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 11:24:45 -0800 (PST)
Sender: Minchan Kim <minchan.kim@gmail.com>
Date:   Tue, 26 Jan 2021 11:24:43 -0800
From:   Minchan Kim <minchan@kernel.org>
To:     John Stultz <john.stultz@linaro.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-mm <linux-mm@kvack.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Hyesoo Yu <hyesoo.yu@samsung.com>, david@redhat.com,
        Michal Hocko <mhocko@suse.com>,
        Suren Baghdasaryan <surenb@google.com>,
        KyongHo Cho <pullip.cho@samsung.com>,
        John Dias <joaodias@google.com>,
        Hridya Valsaraju <hridya@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Christoph Hellwig <hch@infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>
Subject: Re: [PATCH v4 4/4] dma-buf: heaps: add chunk heap to dmabuf heaps
Message-ID: <YBBse31hUxQcglig@google.com>
References: <20210121175502.274391-1-minchan@kernel.org>
 <20210121175502.274391-5-minchan@kernel.org>
 <CALAqxLWJDo=pM8bvt9YWrzJ+VyK5gojoL-v7ch1fQC=cjGwJOw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALAqxLWJDo=pM8bvt9YWrzJ+VyK5gojoL-v7ch1fQC=cjGwJOw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 25, 2021 at 11:32:57PM -0800, John Stultz wrote:
> On Thu, Jan 21, 2021 at 9:55 AM Minchan Kim <minchan@kernel.org> wrote:
> 
> Hey Minchan,
>   Thanks for sending this out! I'm still working through testing with
> this patch set, so I may have some more feedback tomorrow, but a few
> quick items I did hit below.
> 
> > +
> > +#define CHUNK_PREFIX "chunk-"
> > +
> > +static int register_chunk_heap(struct chunk_heap *chunk_heap_info)
> > +{
> > +       struct dma_heap_export_info exp_info;
> > +       const char *name = cma_get_name(chunk_heap_info->cma);
> > +       size_t len = strlen(CHUNK_PREFIX) + strlen(name) + 1;
> > +       char *buf = kmalloc(len, GFP_KERNEL);
> > +
> > +       if (!buf)
> > +               return -ENOMEM;
> > +
> > +       sprintf(buf, CHUNK_PREFIX"%s", cma_get_name(chunk_heap_info->cma));
> > +       buf[len] = '\0';
> > +
> > +       exp_info.name = buf;
> > +       exp_info.name = cma_get_name(chunk_heap_info->cma);
> 
> I think you intended to delete this line, as it's overwriting your
> prefixed name.

Hi John,

You're right. Will fix it.

> 
> > +       exp_info.ops = &chunk_heap_ops;
> > +       exp_info.priv = chunk_heap_info;
> > +
> > +       chunk_heap_info->heap = dma_heap_add(&exp_info);
> > +       if (IS_ERR(chunk_heap_info->heap)) {
> > +               kfree(buf);
> > +               return PTR_ERR(chunk_heap_info->heap);
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static int __init chunk_heap_init(void)
> > +{
> > +       unsigned int i;
> > +
> > +       for (i = 0; i < chunk_heap_count; i++)
> > +               register_chunk_heap(&chunk_heaps[i]);
> > +
> > +       return 0;
> > +}
> > +module_init(chunk_heap_init);
> > +
> > +#ifdef CONFIG_OF_EARLY_FLATTREE
> > +
> > +static int __init dmabuf_chunk_heap_area_init(struct reserved_mem *rmem)
> > +{
> > +       int ret;
> > +       struct cma *cma;
> > +       struct chunk_heap *chunk_heap_info;
> > +       const __be32 *chunk_order;
> > +
> > +       phys_addr_t align = PAGE_SIZE << max(MAX_ORDER - 1, pageblock_order);
> > +       phys_addr_t mask = align - 1;
> > +
> > +       if ((rmem->base & mask) || (rmem->size & mask)) {
> > +               pr_err("Incorrect alignment for CMA region\n");
> > +               return -EINVAL;
> 
> Passing this check can be tough if you're using dynamically assigned
> rmem, so it might be helpful for debugging to print the base/size/mask
> values?

Let me fold this into next respin.

diff --git a/drivers/dma-buf/heaps/chunk_heap.c b/drivers/dma-buf/heaps/chunk_heap.c
index 6fe8e69d108f..cc2ed5341b54 100644
--- a/drivers/dma-buf/heaps/chunk_heap.c
+++ b/drivers/dma-buf/heaps/chunk_heap.c
@@ -456,7 +456,8 @@ static int __init dmabuf_chunk_heap_area_init(struct reserved_mem *rmem)
        phys_addr_t mask = align - 1;

        if ((rmem->base & mask) || (rmem->size & mask)) {
-               pr_err("Incorrect alignment for CMA region\n");
+               pr_err("Incorrect alignment for CMA region: base %pa size %pa mask %pa\n",
+                               rmem->base, rmem->size, mask);
                return -EINVAL;
        }

Thanks for the review, John!
