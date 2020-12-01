Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADF7A2CB0F5
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 00:39:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727182AbgLAXjI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Dec 2020 18:39:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727102AbgLAXjH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Dec 2020 18:39:07 -0500
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A505C0613D4
        for <linux-media@vger.kernel.org>; Tue,  1 Dec 2020 15:38:27 -0800 (PST)
Received: by mail-ot1-x344.google.com with SMTP id f16so3427651otl.11
        for <linux-media@vger.kernel.org>; Tue, 01 Dec 2020 15:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AcUljttS1/Kv9szBrro01vh8YqqJASGgC7Alt3BmlWo=;
        b=CyOy3yOcWwb512J6zbdkSYqy0VmZT8LjbKvW5Ky+B3G9Z7qUsmCHoGpbA7yV3cUOjs
         ip2Oy1mvs3e72TrbAVkqZqwnrCQzLpybnu0i+q/GSgEpZfuqNu2sVHUqKOvwkgar/PBj
         1ZN0M8jT/41HGZ+A72nYrBwgA+LlOlis+FtY8ssnKqPHb6uJ3qDr5BwMOtmf2bwA6+6k
         dv/i1SRkl7IM+qxg3BUtn32XMZ8MZaeNnDEMPaLMKyPzTL+LhJ9LwoHLRvK5Ei8VMerb
         /YyXsuqWwkuud/IDiJpGaq7nDUutOqhJsHgHuXRl0o/7TUKs00JD7vth9PRfzWEYWCkC
         XcAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AcUljttS1/Kv9szBrro01vh8YqqJASGgC7Alt3BmlWo=;
        b=CfaEFMviu9K72eGn9871pG0YwQ+HebLLqZ02WLBFcvs6J8EhsGhsAaFdUuUrlS4Ftv
         E242hl42tHXroPjw6y+/J+2LlcQgN0e45su9d83dnHwj87esQXyVsmNpuIZxAVgvbw9Z
         jolAiZM709JgG2DhmZW+ZHdIlvnqzdAiD2Uix0wK081ePUNWfmnzVQK2FHBjxLuabVvC
         cUrUBOAckmT6emKtlrHjNMhHsXcPoFqdYKrtayHg/5RJ2oUjMMFWrGCSJPEWxLaHM7A9
         8pXEMxGAa929jziD4OFeWOreDyK0B1NpZ7cS1Wyq1oEPp8nRmlRXKaJOpv/DmetxadLs
         0lAg==
X-Gm-Message-State: AOAM5300C8WDQN1nEIEq4Mg9Qa4z5kOFHiSZpb3hIIhhq5PIl9KJndYN
        vSQwEY/nsBEQUBKlBYYY0uG85DJkgimtVKjrjXZywQ==
X-Google-Smtp-Source: ABdhPJzqg9/cJFXzsEKuui5LLQmcVlIxqfx8S0xbUl9UXyu4UIrtiWJuNliEU6VKkP4JD9lJJVAJhVhQ6gN0sNwiUhw=
X-Received: by 2002:a9d:851:: with SMTP id 75mr3804830oty.102.1606865906861;
 Tue, 01 Dec 2020 15:38:26 -0800 (PST)
MIME-Version: 1.0
References: <20201201175144.3996569-1-minchan@kernel.org> <20201201175144.3996569-5-minchan@kernel.org>
 <CALAqxLXFeUStaJ8Mtm5v3kSxmeqnjzLTsyathkrKF0ke3fYGiQ@mail.gmail.com> <20201201225554.GA3968963@google.com>
In-Reply-To: <20201201225554.GA3968963@google.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Tue, 1 Dec 2020 15:38:14 -0800
Message-ID: <CALAqxLW-n4-VSd9dj=KXS4WRDrPmKOShAwP9tCfCZnk+4kxW-w@mail.gmail.com>
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

On Tue, Dec 1, 2020 at 2:55 PM Minchan Kim <minchan@kernel.org> wrote:
> On Tue, Dec 01, 2020 at 11:48:15AM -0800, John Stultz wrote:
> > On Tue, Dec 1, 2020 at 9:51 AM Minchan Kim <minchan@kernel.org> wrote:
> >
> > Thanks for reworking and resending this!
> >
> > ...
> > > +static int __init chunk_heap_init(void)
> > > +{
> > > +       struct cma *default_cma = dev_get_cma_area(NULL);
> > > +       struct dma_heap_export_info exp_info;
> > > +       struct chunk_heap *chunk_heap;
> > > +
> > > +       if (!default_cma)
> > > +               return 0;
> > > +
> > > +       chunk_heap = kzalloc(sizeof(*chunk_heap), GFP_KERNEL);
> > > +       if (!chunk_heap)
> > > +               return -ENOMEM;
> > > +
> > > +       chunk_heap->order = CHUNK_HEAP_ORDER;
> > > +       chunk_heap->cma = default_cma;
> > > +
> > > +       exp_info.name = cma_get_name(default_cma);
> >
> > So, this would create a chunk heap name with the default CMA name,
> > which would be indistinguishable from the heap name used for the plain
> > CMA heap.
> >
> > Probably a good idea to prefix it with "chunk-" so the heap device
> > names are unique?
>
> That will give an impression to user that they are using different CMA
> area but that's not true. IMHO, let's be honest at this moment.

I disagree.  The dmabuf heaps provide an abstraction for allocating a
type of memory, and while your heap is pulling from CMA, you aren't
"just" allocating CMA as the existing CMA heap would suffice for that.

Since you need a slightly different method to allocate high order
pages in bulk, we really should have a unique way to name the
allocator interface. That's why I'd suggest the "chunk-" prefix to the
heap name.

thanks
-john
