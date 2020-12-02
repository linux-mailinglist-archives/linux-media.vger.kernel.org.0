Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 357E42CB197
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 01:34:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726736AbgLBAeG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Dec 2020 19:34:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726635AbgLBAeG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Dec 2020 19:34:06 -0500
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01B59C0617A6
        for <linux-media@vger.kernel.org>; Tue,  1 Dec 2020 16:33:25 -0800 (PST)
Received: by mail-ot1-x342.google.com with SMTP id x15so102922otp.4
        for <linux-media@vger.kernel.org>; Tue, 01 Dec 2020 16:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b7bUWtf5JcEJo8eU3QHsT0IzGFGYcNHBefSS0GBzXro=;
        b=sWXd+SHH1p8PFhqTXQn2a8RJrdStziNkREVVw898XLR9gKhEeG87DKrTaXuBp+hljF
         Qy5kMm9u47MRVfglN6qahVbyGaqDWcocER3LZMDB+BF15iAozX+4iZyzq8HWMss82MeW
         NxxBBPGypZ53OxJu8U51Za+0484uvPr1pOX7Qr6OybOtcp7qeqF0Ptqi3KA/4mZqA3Ge
         2zwsRfZCpNniu2dG/mXJ6QeLuTf5zzd3dfMwSN0YB36S5UA5maIR0RGJ8L8Xqo4Cm885
         WrwMJFXPoyr6GecGPwf4V+0spF0cma8nBl1Z/ezj565VHqu0dLrlFVW+daH9jejsAhfx
         6FwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b7bUWtf5JcEJo8eU3QHsT0IzGFGYcNHBefSS0GBzXro=;
        b=Fgv8JgfI4WTdSUOK1mPdKvbYgbEXsXFphauUmV+d/H/j9UbNyoaWxC67YhMTSxxelT
         lMnHxuLCwpLBxeDJFlIbKODWqlf4Uw2vVa1+EbhToTY/c9+NbPsiLjWJHADa1EY9Od9n
         knuedQmJf4a05G0H5n9vU72DGniQM+lZbzyO86DPWSrYkgugR42AZLqFJO3d/lu+8jzJ
         QcGZbO+zfHsoVh+j9rYohuzZYLxa6Nrb4F3E+79Ob/sEu7TXwD25b23NO2hOOpO5ZQPg
         sAUNeZGJpvb6HMS7KDvPvHCxlGr+ZGE3TWdaXAJXSG2Zs0k4AER8G0L91Wy8g7lVdCqm
         6rVA==
X-Gm-Message-State: AOAM532OZxvz2NTlQIF9W3CL+KWX7iowal73c/5QCQqWGG4aOJex1JCR
        AO2fI7ZQbainS18WsUfJaii6S8QfwS8d7VTapBs9aA==
X-Google-Smtp-Source: ABdhPJzzD//+z/Kgp4hq35PZtpKGAwVdEzUSs1T/u5eAapNIYsM1KOPDQ3WheaHwILzvturXQdCwoNk4xq6ekztTclc=
X-Received: by 2002:a9d:851:: with SMTP id 75mr104253oty.102.1606869205374;
 Tue, 01 Dec 2020 16:33:25 -0800 (PST)
MIME-Version: 1.0
References: <20201201175144.3996569-1-minchan@kernel.org> <20201201175144.3996569-5-minchan@kernel.org>
 <CALAqxLXFeUStaJ8Mtm5v3kSxmeqnjzLTsyathkrKF0ke3fYGiQ@mail.gmail.com>
 <20201201225554.GA3968963@google.com> <CALAqxLW-n4-VSd9dj=KXS4WRDrPmKOShAwP9tCfCZnk+4kxW-w@mail.gmail.com>
 <20201202001302.GB3968963@google.com>
In-Reply-To: <20201202001302.GB3968963@google.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Tue, 1 Dec 2020 16:33:14 -0800
Message-ID: <CALAqxLVBRPOCwLU1iY44Nh1-SpDpsfMz+2c1XRX2WofkpjrhcQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] dma-buf: heaps: add chunk heap to dmabuf heaps
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
        <linaro-mm-sig@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Dec 1, 2020 at 4:13 PM Minchan Kim <minchan@kernel.org> wrote:
>
> On Tue, Dec 01, 2020 at 03:38:14PM -0800, John Stultz wrote:
> > On Tue, Dec 1, 2020 at 2:55 PM Minchan Kim <minchan@kernel.org> wrote:
> > > On Tue, Dec 01, 2020 at 11:48:15AM -0800, John Stultz wrote:
> > > > On Tue, Dec 1, 2020 at 9:51 AM Minchan Kim <minchan@kernel.org> wrote:
> > > >
> > > > Thanks for reworking and resending this!
> > > >
> > > > ...
> > > > > +static int __init chunk_heap_init(void)
> > > > > +{
> > > > > +       struct cma *default_cma = dev_get_cma_area(NULL);
> > > > > +       struct dma_heap_export_info exp_info;
> > > > > +       struct chunk_heap *chunk_heap;
> > > > > +
> > > > > +       if (!default_cma)
> > > > > +               return 0;
> > > > > +
> > > > > +       chunk_heap = kzalloc(sizeof(*chunk_heap), GFP_KERNEL);
> > > > > +       if (!chunk_heap)
> > > > > +               return -ENOMEM;
> > > > > +
> > > > > +       chunk_heap->order = CHUNK_HEAP_ORDER;
> > > > > +       chunk_heap->cma = default_cma;
> > > > > +
> > > > > +       exp_info.name = cma_get_name(default_cma);
> > > >
> > > > So, this would create a chunk heap name with the default CMA name,
> > > > which would be indistinguishable from the heap name used for the plain
> > > > CMA heap.
> > > >
> > > > Probably a good idea to prefix it with "chunk-" so the heap device
> > > > names are unique?
> > >
> > > That will give an impression to user that they are using different CMA
> > > area but that's not true. IMHO, let's be honest at this moment.
> >
> > I disagree.  The dmabuf heaps provide an abstraction for allocating a
> > type of memory, and while your heap is pulling from CMA, you aren't
> > "just" allocating CMA as the existing CMA heap would suffice for that.
> >
> > Since you need a slightly different method to allocate high order
> > pages in bulk, we really should have a unique way to name the
> > allocator interface. That's why I'd suggest the "chunk-" prefix to the
> > heap name.
>
> Got it. How about this?
>
> diff --git a/drivers/dma-buf/heaps/chunk_heap.c b/drivers/dma-buf/heaps/chunk_heap.c
> index 0277707a93a9..36e189d0b73d 100644
> --- a/drivers/dma-buf/heaps/chunk_heap.c
> +++ b/drivers/dma-buf/heaps/chunk_heap.c
> @@ -410,7 +410,7 @@ static int __init chunk_heap_init(void)
>         chunk_heap->order = CHUNK_HEAP_ORDER;
>         chunk_heap->cma = default_cma;
>
> -       exp_info.name = cma_get_name(default_cma);
> +       exp_info.name = "cma-chunk-heap";

That's still a bit general for the default cma (which can be named
differently). I think including cma name is important, just adding the
chunk prefix might be best.

So something like
  sprintf(buf, "chunk-%s", cma_get_name(default_cma));
  exp_info.name = buf;

thanks
-john
