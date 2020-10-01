Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88BB42809E1
	for <lists+linux-media@lfdr.de>; Fri,  2 Oct 2020 00:08:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733117AbgJAWH7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Oct 2020 18:07:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726731AbgJAWH4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Oct 2020 18:07:56 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D15C5C0613D0
        for <linux-media@vger.kernel.org>; Thu,  1 Oct 2020 15:07:54 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id x69so1946oia.8
        for <linux-media@vger.kernel.org>; Thu, 01 Oct 2020 15:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DTsNkTRKBFGiT3RnxqZet+e/40+acfLy05o3xQ2l+Jk=;
        b=aIR4I+0sBlNa3HSvx1eZnX3VRUlq2nZJCCPjELSWgEO/0HvnarH6GN/9/l4L8lCTVY
         Nu8RN/zvEY8WYHB7mMSiRF5p56z7dklm5ZfpjGbjrRdte7TTPgaD62XFFUmjgkgP8rVZ
         dVyFISlOu2Q22Kot4krNb4RRdEyX3QqoJBane5oI0QT5JT9MSp5kqfjKo3e5tnmESdby
         DtDDccIGRn76SbXAKheT0SFV1hn7BfQ9MqKX7JoEN1b8UrJlCqET+UkVsLrVSkO+6x81
         vErLl4xayHwrPjhYKw/1dA2rAb2lq4sNE5h/4OMvayGCqtS+/b8XRUBcTxOJjcbtshfv
         BfQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DTsNkTRKBFGiT3RnxqZet+e/40+acfLy05o3xQ2l+Jk=;
        b=FlFaHfn8MAp02ZjceOaBtBMe6UJoafQmlKl/VZaZMRNswLyZLnX++cFs6o9/X8SBBC
         oFj9YHU0uXzhpzP0D61THQ6RtSybFOE9doeJxzPA8ZBszON1+DkfoLLf6E8bYF28beDn
         NZKZuvqllaGiwiKjIzlFptdiaiAn19rF4I5qutrydqP3dXGaZZzOqaR7iNziCeMaRrYd
         3sqBcSpJ/bcgIANLmfTRQo9ObApG8EspDP6uhbZFzj7r+6UXRuCyvhBf+1uJ0/zws2Kk
         NQOQNJ9X42mDsTwYIPMdd5IXjJnTxA/HeBBveeIb0tvf3kLGsSypJsFYQJHNgZHZfFl3
         GJWQ==
X-Gm-Message-State: AOAM530SxIxhRfOz5ays4yD9H0ynx4ksoQyGE/rrurD5mRUMMhvH6ocS
        BluhG8mplRU5h52UIQDuFgO1AhA7uYBEIxujOTewHw==
X-Google-Smtp-Source: ABdhPJytLfO0smIK/xEv6VzJQe4myTsLm8ipjd0O6CWHheM/Dyq/BY10cueJ7Vwo1iCD6z7vzAM7/RY4nBV8/6B0afg=
X-Received: by 2002:a54:4d88:: with SMTP id y8mr1380233oix.97.1601590074016;
 Thu, 01 Oct 2020 15:07:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200926042453.67517-1-john.stultz@linaro.org>
 <20200926042453.67517-6-john.stultz@linaro.org> <1e109a138c86be7b06e20cb30a243fc7@codeaurora.org>
In-Reply-To: <1e109a138c86be7b06e20cb30a243fc7@codeaurora.org>
From:   John Stultz <john.stultz@linaro.org>
Date:   Thu, 1 Oct 2020 15:07:42 -0700
Message-ID: <CALAqxLWv+Uz_mPUtx8TzfEvKHk7kp0XS5XLX6qyW6tqacGZU5g@mail.gmail.com>
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

On Tue, Sep 29, 2020 at 9:46 PM Chris Goldsworthy
<cgoldswo@codeaurora.org> wrote:
>
> On 2020-09-25 21:24, John Stultz wrote:
> > Reuse/abuse the pagepool code from the network code to speed
> > up allocation performance.
> >
> > This is similar to the ION pagepool usage, but tries to
> > utilize generic code instead of a custom implementation.
> >
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: Liam Mark <lmark@codeaurora.org>
> > Cc: Laura Abbott <labbott@kernel.org>
> > Cc: Brian Starkey <Brian.Starkey@arm.com>
> > Cc: Hridya Valsaraju <hridya@google.com>
> > Cc: Suren Baghdasaryan <surenb@google.com>
> > Cc: Sandeep Patil <sspatil@google.com>
> > Cc: =C3=98rjan Eide <orjan.eide@arm.com>
> > Cc: Robin Murphy <robin.murphy@arm.com>
> > Cc: Ezequiel Garcia <ezequiel@collabora.com>
> > Cc: Simon Ser <contact@emersion.fr>
> > Cc: James Jones <jajones@nvidia.com>
> > Cc: linux-media@vger.kernel.org
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: John Stultz <john.stultz@linaro.org>
> > ---
> >  drivers/dma-buf/heaps/Kconfig       |  1 +
> >  drivers/dma-buf/heaps/system_heap.c | 32 +++++++++++++++++++++++++----
> >  2 files changed, 29 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/dma-buf/heaps/Kconfig
> > b/drivers/dma-buf/heaps/Kconfig
> > index a5eef06c4226..f13cde4321b1 100644
> > --- a/drivers/dma-buf/heaps/Kconfig
> > +++ b/drivers/dma-buf/heaps/Kconfig
> > @@ -1,6 +1,7 @@
> >  config DMABUF_HEAPS_SYSTEM
> >       bool "DMA-BUF System Heap"
> >       depends on DMABUF_HEAPS
> > +     select PAGE_POOL
> >       help
> >         Choose this option to enable the system dmabuf heap. The system
> > heap
> >         is backed by pages from the buddy allocator. If in doubt, say Y=
.
> > diff --git a/drivers/dma-buf/heaps/system_heap.c
> > b/drivers/dma-buf/heaps/system_heap.c
> > index 882a632e9bb7..9f57b4c8ae69 100644
> > --- a/drivers/dma-buf/heaps/system_heap.c
> > +++ b/drivers/dma-buf/heaps/system_heap.c
> > @@ -20,6 +20,7 @@
> >  #include <linux/scatterlist.h>
> >  #include <linux/slab.h>
> >  #include <linux/vmalloc.h>
> > +#include <net/page_pool.h>
> >
> >  struct dma_heap *sys_heap;
> >
> > @@ -46,6 +47,7 @@ struct dma_heap_attachment {
> >  static gfp_t order_flags[] =3D {HIGH_ORDER_GFP, LOW_ORDER_GFP,
> > LOW_ORDER_GFP};
> >  static const unsigned int orders[] =3D {8, 4, 0};
> >  #define NUM_ORDERS ARRAY_SIZE(orders)
> > +struct page_pool *pools[NUM_ORDERS];
> >
> >  static struct sg_table *dup_sg_table(struct sg_table *table)
> >  {
> > @@ -264,13 +266,17 @@ static void system_heap_dma_buf_release(struct
> > dma_buf *dmabuf)
> >       struct system_heap_buffer *buffer =3D dmabuf->priv;
> >       struct sg_table *table;
> >       struct scatterlist *sg;
> > -     int i;
> > +     int i, j;
> >
> >       table =3D &buffer->sg_table;
> >       for_each_sg(table->sgl, sg, table->nents, i) {
> >               struct page *page =3D sg_page(sg);
> >
> > -             __free_pages(page, compound_order(page));
> > +             for (j =3D 0; j < NUM_ORDERS; j++) {
> > +                     if (compound_order(page) =3D=3D orders[j])
> > +                             break;
> > +             }
> > +             page_pool_put_full_page(pools[j], page, false);
> >       }
> >       sg_free_table(table);
> >       kfree(buffer);
> > @@ -300,8 +306,7 @@ static struct page
> > *alloc_largest_available(unsigned long size,
> >                       continue;
> >               if (max_order < orders[i])
> >                       continue;
> > -
> > -             page =3D alloc_pages(order_flags[i], orders[i]);
> > +             page =3D page_pool_alloc_pages(pools[i], order_flags[i]);
> >               if (!page)
> >                       continue;
> >               return page;
> > @@ -406,6 +411,25 @@ static const struct dma_heap_ops system_heap_ops =
=3D
> > {
> >  static int system_heap_create(void)
> >  {
> >       struct dma_heap_export_info exp_info;
> > +     int i;
> > +
> > +     for (i =3D 0; i < NUM_ORDERS; i++) {
> > +             struct page_pool_params pp;
> > +
> > +             memset(&pp, 0, sizeof(pp));
> > +             pp.order =3D orders[i];
> > +             pp.dma_dir =3D DMA_BIDIRECTIONAL;
> > +             pools[i] =3D page_pool_create(&pp);
> > +
> > +             if (IS_ERR(pools[i])) {
> > +                     int j;
> > +
> > +                     pr_err("%s: page pool creation failed!\n", __func=
__);
> > +                     for (j =3D 0; j < i; j++)
> > +                             page_pool_destroy(pools[j]);
> > +                     return PTR_ERR(pools[i]);
> > +             }
> > +     }
> >
> >       exp_info.name =3D "system";
> >       exp_info.ops =3D &system_heap_ops;
>
> This is cool, I didn't know about this pooling code under /net/core.
> Nice and compact.

Oh, bummer. I just realized when allocating w/ __GFP_ZERO from the
page-pool, the logic doesn't actually clear pages when pulling from
the cache.
So unfortunately this is what accounts for much of the performance
benefit I was seeing with this approach, so I'll have to retract my
claim on the performance gain with this. :(

I've got a first pass at zeroing the pages we put into the pool, but
the numbers are not so great just yet so I've got some further work to
do.

thanks
-john
