Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1D9B2444BA
	for <lists+linux-media@lfdr.de>; Fri, 14 Aug 2020 07:59:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726587AbgHNF7S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Aug 2020 01:59:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726410AbgHNF7P (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Aug 2020 01:59:15 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24FBCC061383
        for <linux-media@vger.kernel.org>; Thu, 13 Aug 2020 22:59:15 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id h3so7223254oie.11
        for <linux-media@vger.kernel.org>; Thu, 13 Aug 2020 22:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6ek1Xj7F+p5V5QHuUBuug/aAxVgWdWkwQ14dvtLIgIA=;
        b=u/d3+AkOSH0ZAUrREdpKK1K7+3ubxoyTo9I05t6URCCnVPUTye+E+pdV9V2a3+ccif
         jWmpaZGdH4f5C8gDoW6VBuNLHhE1+5zuMQeQxEUtLt583MPJeaDnuM4ZIjXApLZMDldZ
         cI8sNWvgt7TJWl02eoF2qITSBjQxL+K9NrXJ8TrvklB+qqHO5k48Y90zZ/69fX0WrF/R
         MA6niyBPxhu67sI+tFb0PnUtTD7MV1RvC4LgKGWOvhWzCj7wmC5lwJYbKFKeXstgY9eL
         z2qErVVTp3z2vziasizR4KHWl5qtoCFKMNuPyd+OX+cHRRC8SRlXrsEWvZfxOz/SYkje
         AWzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6ek1Xj7F+p5V5QHuUBuug/aAxVgWdWkwQ14dvtLIgIA=;
        b=at2zL6UzGVkIheniVfD21X6Wl0tuIYBhouCt7nQjqBqlv7pGgBT8AxwISjgLQOn1T5
         WvAVh2Wz78p3CkatqCFYnBgPP6szp6xSFYOKtkh9TR6/n775t7miTy/+o+TKIN9HJBrk
         MUvY7bJYQWwJMzeQq+82V9YSZ2aN1JjBVW9wuPHn+yxMSIrQ4x9N1Bf7NijMRz1VVrjG
         wjwaQ8RATX+OY7cMbQHkNA5FmvOUTRi1KuR4aV4Ij18yrmW8cQEPmQcJA9nTeKSl/s6q
         a4bdbwseg7c52d6T2LcBDYuatp7hpUTgPcP3rQRT96Dq1D4eoosKyTBXpJ0v5BZnNY9e
         T5+Q==
X-Gm-Message-State: AOAM531NJmgijhAMXgj9D0yQsEK0YbQ624dRDjH/WGlQ3S71udF8pX95
        ORUIxRxBvg0SYJVa5NfVSXms9SfGHyTi9mH9k27Pnw==
X-Google-Smtp-Source: ABdhPJygjIyHSKquccaPWBOnwk40OPCWOWVkacRMrzSamBOp7G/opmXIa+Evw20OaDL+Y6ykmzsGN0rJzm1g8bL1p74=
X-Received: by 2002:aca:dc85:: with SMTP id t127mr588618oig.169.1597384754309;
 Thu, 13 Aug 2020 22:59:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200729051632.66040-1-john.stultz@linaro.org>
 <20200729051632.66040-2-john.stultz@linaro.org> <3aabe118-929d-6ada-b317-dfa72d180717@arm.com>
In-Reply-To: <3aabe118-929d-6ada-b317-dfa72d180717@arm.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Thu, 13 Aug 2020 22:59:02 -0700
Message-ID: <CALAqxLWjbhD3LN7phqPW_PrvXFeGd3aFHzAU0AAjVcNJNOTVoA@mail.gmail.com>
Subject: Re: [RFC][PATCH 2/2] dma-heap: Add a system-uncached heap
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Liam Mark <lmark@codeaurora.org>,
        "Andrew F . Davis" <afd@ti.com>, Laura Abbott <labbott@kernel.org>,
        Hridya Valsaraju <hridya@google.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 3, 2020 at 4:06 AM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2020-07-29 06:16, John Stultz wrote:
> > This adds a heap that allocates non-contiguous buffers that are
> > marked as writecombined, so they are not cached by the CPU.
> >
...
> > +     ret = sg_alloc_table(new_table, table->nents, GFP_KERNEL);
> > +     if (ret) {
> > +             kfree(new_table);
> > +             return ERR_PTR(-ENOMEM);
> > +     }
> > +
> > +     new_sg = new_table->sgl;
> > +     for_each_sg(table->sgl, sg, table->nents, i) {
>
> Consider using the new sgtable helpers that are just about to land - in
> this case, for_each_sgtable_sg().

Ack! Thanks for the suggestion!


> > +             memcpy(new_sg, sg, sizeof(*sg));
> > +             new_sg->dma_address = 0;
>
> This seems a little bit hairy, as in theory a consumer could still treat
> a nonzero DMA length as the address being valid. Rather than copying the
> whole entry then trying to undo parts of that, maybe just:
>
>         sg_set_page(new_sg, sg_page(sg), sg->len, sg->offset);
>
> ?

Sounds good.


> > +static struct sg_table *dma_heap_map_dma_buf(struct dma_buf_attachment *attachment,
> > +                                          enum dma_data_direction direction)
> > +{
> > +     struct dma_heap_attachment *a = attachment->priv;
> > +     struct sg_table *table = a->table;
> > +
> > +     if (!dma_map_sg_attrs(attachment->dev, table->sgl, table->nents, direction,
> > +                           DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_WRITE_COMBINE))
>
> dma_map_sgtable()
>
> Also, DMA_ATTR_WRITE_COMBINE is meaningless for streaming DMA.
>

Hrm. Ok, my grasp of "streaming" vs "consistent" definitions are maybe
slightly off, since while we are mapping and unmapping buffers, the
point of this heap is that the allocated memory is uncached/coherent,
so we avoid the cache sync overhead on each mapping/unmapping, which I
thought was closer to the "consistent" definition.

But maybe if the mapping and unmapping part is really the key
difference, then ok.

Either way, from my testing, you seem to be right that the
ATTR_WRITE_COMBINE doesn't seem to make any difference in behavior.

> > +     pgprot = pgprot_writecombine(PAGE_KERNEL);
> > +
> > +     for_each_sg(table->sgl, sg, table->nents, i) {
>
> for_each_sg_page()

Ack.

> > +     /*
> > +      * XXX This is hackish. While the buffer will be uncached, we need
> > +      * to initially flush cpu cache, since the the __GFP_ZERO on the
> > +      * allocation means the zeroing was done by the cpu and thus it is likely
> > +      * cached. Map & flush it out now so we don't get corruption later on.
> > +      *
> > +      * Ideally we could do this without using the heap device as a dummy dev.
> > +      */
> > +     dma_map_sg_attrs(dma_heap_get_dev(heap), table->sgl, table->nents,
> > +                      DMA_BIDIRECTIONAL, DMA_ATTR_WRITE_COMBINE);
>
> Again, DMA_ATTR_WRITE_COMBINE is meaningless here.
>
> > +     dma_sync_sg_for_device(dma_heap_get_dev(heap), table->sgl, table->nents,
> > +                            DMA_BIDIRECTIONAL);
>
> This doesn't do anything that the map hasn't already just done.

Good point!

> > +     }
> > +     dma_heap_get_dev(heap->heap)->dma_mask = &dummy_mask;
> > +     dma_set_mask(dma_heap_get_dev(heap->heap), DMA_BIT_MASK(64));
>
> Much as I'd hate to encourage using dma_coerce_mask_and_coherent(), I'm
> not sure this is really any better :/

Sounds fair.

Thanks so much for the review, I really appreciate the feedback!
(Sorry I was a little slow to respond. The merge window has really
been something this cycle.. :P)

I'll get this all integrated and resend the patch here shortly.

thanks
-john
