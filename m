Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B0A82CB1EB
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 01:59:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727530AbgLBA6d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Dec 2020 19:58:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726619AbgLBA6d (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Dec 2020 19:58:33 -0500
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39213C0613CF;
        Tue,  1 Dec 2020 16:57:47 -0800 (PST)
Received: by mail-pj1-x1044.google.com with SMTP id ms7so157517pjb.4;
        Tue, 01 Dec 2020 16:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=u8Im7pUwrYZIu0XDUm9McsW1+o37J6dtqvcGYr5EvvM=;
        b=BnMvomIwBI3N+KOtQT5gvAZ/YPOL8nQXrf/ciAdUfG5qC1YcnabTxSnt9cO6TqDkXe
         IRnzisbugfBMeNR0WQI7AwXJQcZ7jyCWZYxm08Pk9oJhdf3ohxx2I+QY//Cb4VOjGN8J
         GRSaLptkBC5pFQq+vU0fL07Y3N0F+XJ/+RvwAdNFo8IZj8Dfy9YO3keqmv8USbRf0DOp
         vDbubF3pCJlM/dC5ieG40aFeYOgv5M8BJbY4MAsBNGo0dJ0S0vjoKe9MDoCHuaKxRE2H
         N7SeLTWHPOwKsylRr4MRmmL1KqAtMLDWcfluBLALNHXtKGhT90oXL15G73UGqOSbbZUU
         e3FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=u8Im7pUwrYZIu0XDUm9McsW1+o37J6dtqvcGYr5EvvM=;
        b=BE0BaZuM0DPqf66UTTDaVqTimvZtD8Qux7PcLNIuOvi//0I4/Oeo4rM42ScNFWsO3G
         OWBGY0nk/88j4CVh/bfRN1/zeGz5r4JIeP1SP6t5lroZN7bcqpmG+kkkhq1xdwGyYZD2
         LSGxP3biLS5K0pLvjUo9fRoSJEjwps7eYKXM90qX/40qkH5izpx0SKGXOk9+WAZKDmmR
         vHsp+JhCax/ayv8VrnIWB+btD78NzRo+yF03XVpClO14knJUo5eg/IB5NeJaHTdUHO1x
         8NJWWk1qMyePIaBEIfJf8W2D4DEj007i1PlnPgYBXAWg+vhX+xFe6Uo5VzFzelEOEQWR
         25nA==
X-Gm-Message-State: AOAM532yI+3Qbejq3zCDxfjw8ePXMdmcuYG45Kz3dGUH3yCxeuNfA2Le
        UeoyX46z4+nQZnDItobJjgo=
X-Google-Smtp-Source: ABdhPJxOwt1LLWu0zBZo4zhSX/vym8XXbM9DzbOWO25SHPiEUpnWcuYQuilFfwq2/N2y63yU4bdXqA==
X-Received: by 2002:a17:90a:ee8c:: with SMTP id i12mr406366pjz.33.1606870666635;
        Tue, 01 Dec 2020 16:57:46 -0800 (PST)
Received: from google.com ([2620:15c:211:201:7220:84ff:fe09:5e58])
        by smtp.gmail.com with ESMTPSA id y25sm119905pfn.44.2020.12.01.16.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 16:57:45 -0800 (PST)
Sender: Minchan Kim <minchan.kim@gmail.com>
Date:   Tue, 1 Dec 2020 16:57:42 -0800
From:   Minchan Kim <minchan@kernel.org>
To:     John Stultz <john.stultz@linaro.org>
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
Subject: Re: [PATCH v2 4/4] dma-buf: heaps: add chunk heap to dmabuf heaps
Message-ID: <20201202005742.GC3968963@google.com>
References: <20201201175144.3996569-1-minchan@kernel.org>
 <20201201175144.3996569-5-minchan@kernel.org>
 <CALAqxLXFeUStaJ8Mtm5v3kSxmeqnjzLTsyathkrKF0ke3fYGiQ@mail.gmail.com>
 <20201201225554.GA3968963@google.com>
 <CALAqxLW-n4-VSd9dj=KXS4WRDrPmKOShAwP9tCfCZnk+4kxW-w@mail.gmail.com>
 <20201202001302.GB3968963@google.com>
 <CALAqxLVBRPOCwLU1iY44Nh1-SpDpsfMz+2c1XRX2WofkpjrhcQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALAqxLVBRPOCwLU1iY44Nh1-SpDpsfMz+2c1XRX2WofkpjrhcQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Dec 01, 2020 at 04:33:14PM -0800, John Stultz wrote:
> On Tue, Dec 1, 2020 at 4:13 PM Minchan Kim <minchan@kernel.org> wrote:
> >
> > On Tue, Dec 01, 2020 at 03:38:14PM -0800, John Stultz wrote:
> > > On Tue, Dec 1, 2020 at 2:55 PM Minchan Kim <minchan@kernel.org> wrote:
> > > > On Tue, Dec 01, 2020 at 11:48:15AM -0800, John Stultz wrote:
> > > > > On Tue, Dec 1, 2020 at 9:51 AM Minchan Kim <minchan@kernel.org> wrote:
> > > > >
> > > > > Thanks for reworking and resending this!
> > > > >
> > > > > ...
> > > > > > +static int __init chunk_heap_init(void)
> > > > > > +{
> > > > > > +       struct cma *default_cma = dev_get_cma_area(NULL);
> > > > > > +       struct dma_heap_export_info exp_info;
> > > > > > +       struct chunk_heap *chunk_heap;
> > > > > > +
> > > > > > +       if (!default_cma)
> > > > > > +               return 0;
> > > > > > +
> > > > > > +       chunk_heap = kzalloc(sizeof(*chunk_heap), GFP_KERNEL);
> > > > > > +       if (!chunk_heap)
> > > > > > +               return -ENOMEM;
> > > > > > +
> > > > > > +       chunk_heap->order = CHUNK_HEAP_ORDER;
> > > > > > +       chunk_heap->cma = default_cma;
> > > > > > +
> > > > > > +       exp_info.name = cma_get_name(default_cma);
> > > > >
> > > > > So, this would create a chunk heap name with the default CMA name,
> > > > > which would be indistinguishable from the heap name used for the plain
> > > > > CMA heap.
> > > > >
> > > > > Probably a good idea to prefix it with "chunk-" so the heap device
> > > > > names are unique?
> > > >
> > > > That will give an impression to user that they are using different CMA
> > > > area but that's not true. IMHO, let's be honest at this moment.
> > >
> > > I disagree.  The dmabuf heaps provide an abstraction for allocating a
> > > type of memory, and while your heap is pulling from CMA, you aren't
> > > "just" allocating CMA as the existing CMA heap would suffice for that.
> > >
> > > Since you need a slightly different method to allocate high order
> > > pages in bulk, we really should have a unique way to name the
> > > allocator interface. That's why I'd suggest the "chunk-" prefix to the
> > > heap name.
> >
> > Got it. How about this?
> >
> > diff --git a/drivers/dma-buf/heaps/chunk_heap.c b/drivers/dma-buf/heaps/chunk_heap.c
> > index 0277707a93a9..36e189d0b73d 100644
> > --- a/drivers/dma-buf/heaps/chunk_heap.c
> > +++ b/drivers/dma-buf/heaps/chunk_heap.c
> > @@ -410,7 +410,7 @@ static int __init chunk_heap_init(void)
> >         chunk_heap->order = CHUNK_HEAP_ORDER;
> >         chunk_heap->cma = default_cma;
> >
> > -       exp_info.name = cma_get_name(default_cma);
> > +       exp_info.name = "cma-chunk-heap";
> 
> That's still a bit general for the default cma (which can be named
> differently). I think including cma name is important, just adding the
> chunk prefix might be best.
> 
> So something like
>   sprintf(buf, "chunk-%s", cma_get_name(default_cma));
>   exp_info.name = buf;

No problem. Will do that in respoin.
Other than that, can you give any Acked-by or Reviewed-by to save
iteration?
