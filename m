Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCB1B248FBC
	for <lists+linux-media@lfdr.de>; Tue, 18 Aug 2020 22:56:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726853AbgHRU4N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Aug 2020 16:56:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726766AbgHRU4L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Aug 2020 16:56:11 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D544AC061342
        for <linux-media@vger.kernel.org>; Tue, 18 Aug 2020 13:56:10 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id v13so19125569oiv.13
        for <linux-media@vger.kernel.org>; Tue, 18 Aug 2020 13:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WVlaqaJEkLaogLxHkb59x+3913QcwhMo1tlZOm9AT0s=;
        b=F7t4t8R2e65gCr9vdIxnNuliGDt2ahdeDAfavI7tANLzu2aQ0/Dm9nm68MjGmfDIEn
         +INKamv7mBD5XwNAn5unHK7F4wcGpKBzLWiimwLuJuMjurd9FzQdSLd4A3XwNq4oZgON
         0mJ1mp3STPu72DoEU6s2oGDaAPZc1d9iqm6UukG6YQUqg1rxoULI89OmVCHGV1I5M6PW
         LehxdYwb6AkyftI67q/r18iiMmsk+U2qcn2C0MXIx9alBu+BWFFFFCArG9HhsRjc+0Ow
         eHMsfDTsciu66LcErJpINTzl2QMt9ciDVh42trJ4L0rc+/x0fLt7IxkYDBuYtyO6wsbj
         4YsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WVlaqaJEkLaogLxHkb59x+3913QcwhMo1tlZOm9AT0s=;
        b=UpbIhTnn6dNgFe4uiev9otdJA0fXKDKymfCduFp/YX5JZ4Vudw8P69WbpKPgDgPDwx
         RYQIDomzI6A3MIc1urfxFIMyA6vi87O3IVR8e0j53HOr8eJLUI1eKOAehiqnRnz7Dj1l
         Ig5ORi1WiZ3xLA8zewCLQ+YARYKQnBnIazv8UurQlu2Yw9U8zzsi2wX+4DdWV3XWJcTd
         FL/IBWiE93p+VZcVkIb1rQbDjzxalfayGJ5N/Jj70SDfN6i4oM1ACSeyBXd1uRZVAJS+
         P/tXsofe4NBC6eEu8Iasq21zClAnZ3QUr4l8jRPR/MWIE7cs2ZvSxUcnN8w9Rr7zgy94
         A8HA==
X-Gm-Message-State: AOAM533nhht+3sKqRpBRr0n9v4sIeQttn14maNhbe3PYT0868EMBgVGC
        bIPW16Py+vFHFEJWG1s0bBULLVMnXzt8xzSu3sXaxQ==
X-Google-Smtp-Source: ABdhPJwbu8MfbO3BaVc7WQtY8gCaYLyN64siinjCbEFyrvhEdhXeVpE86gO8wO6noTbeRWOhZomU5kKcgOZGItaZTUA=
X-Received: by 2002:aca:1117:: with SMTP id 23mr1367198oir.97.1597784170084;
 Tue, 18 Aug 2020 13:56:10 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200818074547epcas2p21e0c2442873d03800c7bc2c3e76405d6@epcas2p2.samsung.com>
 <20200818080415.7531-1-hyesoo.yu@samsung.com>
In-Reply-To: <20200818080415.7531-1-hyesoo.yu@samsung.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Tue, 18 Aug 2020 13:55:59 -0700
Message-ID: <CALAqxLWRLOqNrhhpjfqfztsWTib8SQQgeX3jJM+_ij_CvC6hiw@mail.gmail.com>
Subject: Re: [PATCH 0/3] Chunk Heap Support on DMA-HEAP
To:     Hyesoo Yu <hyesoo.yu@samsung.com>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        Minchan Kim <minchan@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        iamjoonsoo.kim@lge.com, joaodias@google.com,
        linux-mm <linux-mm@kvack.org>,
        KyongHo Cho <pullip.cho@samsung.com>,
        Suren Baghdasaryan <surenb@google.com>, vbabka@suse.cz,
        "Andrew F. Davis" <afd@ti.com>,
        "(Exiting) Benjamin Gaignard" <benjamin.gaignard@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@redhat.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Christian Koenig <christian.koenig@amd.com>,
        linux-media <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Aug 18, 2020 at 12:45 AM Hyesoo Yu <hyesoo.yu@samsung.com> wrote:
>
> These patch series to introduce a new dma heap, chunk heap.
> That heap is needed for special HW that requires bulk allocation of
> fixed high order pages. For example, 64MB dma-buf pages are made up
> to fixed order-4 pages * 1024.
>
> The chunk heap uses alloc_pages_bulk to allocate high order page.
> https://lore.kernel.org/linux-mm/20200814173131.2803002-1-minchan@kernel.org
>
> The chunk heap is registered by device tree with alignment and memory node
> of contiguous memory allocator(CMA). Alignment defines chunk page size.
> For example, alignment 0x1_0000 means chunk page size is 64KB.
> The phandle to memory node indicates contiguous memory allocator(CMA).
> If device node doesn't have cma, the registration of chunk heap fails.
>
> The patchset includes the following:
>  - export dma-heap API to register kernel module dma heap.
>  - add chunk heap implementation.
>  - document of device tree to register chunk heap
>
> Hyesoo Yu (3):
>   dma-buf: add missing EXPORT_SYMBOL_GPL() for dma heaps
>   dma-buf: heaps: add chunk heap to dmabuf heaps
>   dma-heap: Devicetree binding for chunk heap

Hey! Thanks so much for sending this out! I'm really excited to see
these heaps be submitted and reviewed on the list!

The first general concern I have with your series is that it adds a dt
binding for the chunk heap, which we've gotten a fair amount of
pushback on.

A possible alternative might be something like what Kunihiko Hayashi
proposed for non-default CMA heaps:
  https://lore.kernel.org/lkml/1594948208-4739-1-git-send-email-hayashi.kunihiko@socionext.com/

This approach would insteal allow a driver to register a CMA area with
the chunk heap implementation.

However, (and this was the catch Kunihiko Hayashi's patch) this
requires that the driver also be upstream, as we need an in-tree user
of such code.

Also, it might be good to provide some further rationale on why this
heap is beneficial over the existing CMA heap?  In general focusing
the commit messages more on the why we might want the patch, rather
than what the patch does, is helpful.

"Special hardware" that doesn't have upstream drivers isn't very
compelling for most maintainers.

That said, I'm very excited to see these sorts of submissions, as I
know lots of vendors have historically had very custom out of tree ION
heaps, and I think it would be a great benefit to the community to
better understand the experience vendors have in optimizing
performance on their devices, so we can create good common solutions
upstream. So I look forward to your insights on future revisions of
this patch series!

thanks
-john
