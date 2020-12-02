Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40A9F2CB15C
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 01:14:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727303AbgLBANq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Dec 2020 19:13:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726989AbgLBANq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Dec 2020 19:13:46 -0500
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E398C0613CF;
        Tue,  1 Dec 2020 16:13:06 -0800 (PST)
Received: by mail-pj1-x1041.google.com with SMTP id hk16so104207pjb.4;
        Tue, 01 Dec 2020 16:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ONvzCRbnsYs7DyFpSE5/MjQxVHqRBL0P/7tzKwkfWHM=;
        b=bo2pDKf5fAU+67OKk3ptI2/7T18FpKe+bqiT3x+aEsNOSK35XOQ8l8ZNFIT3q9ugQn
         i8DUY+iBC1QjT0fKPmVftvzXslalhRudFBFL6eTUuclmHxSoFsCYi1AXbdKkpcScOrv8
         n2Lki4nTQE4ShK0AJqAXOqCZFmW+4VC/7YGrZZ8evl1+ZU+Qu4CKniCufl+GlmvnKTWw
         07bYGA90bc3N7/mJPEfs3ZNUm0k18JZr25x3uIwOtUC5rLTkvlBwDX9GoXq54iIKU7sK
         WP6w966gorwTs1SdPoylJH3sJmqQnVRd8f5KLqpW0zpjEb102VGbFpMU+BOQ5fmWBu6z
         ieTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=ONvzCRbnsYs7DyFpSE5/MjQxVHqRBL0P/7tzKwkfWHM=;
        b=W0tQj1ol+cdPTFQrdl/ApqDkcdAwaf2ZO3iQF/F/YWkdKVmcN6S61k4iNExwIKY/Jn
         z4RZgtWmjH6JxUh7RrZMuarMaV2N04+3cjDdoufXhCdNLAzE6ejFFySshc3OJHzNsTD3
         fZfy5BTAmZRomqZdDuciNb4tGCjYI2W590dyLInLX4HBetjFliVS3Y8bba+H1a+n7+ud
         8uAkSCrxqVBAIXOlA3M4Gs3NKXbdM51G9G9skOw4atrZ8bS422gEcugDfCUmGfhzXBJw
         eF/n8M2J33PM0TIJiAOVJCBW5oVT+UI0oDfmH3r6TNj4XfVTUCk4AWI0iUMkM9LNgEU3
         UOrw==
X-Gm-Message-State: AOAM5312ZKlE1rxF2Ljt5cRW+we2d6HuZdpDNaCL5TqO//7o+Btnc+7j
        zeO8DrtXUSi67IqpsiDfRUY=
X-Google-Smtp-Source: ABdhPJzfhvKOHUX0TmDshT7Dzgz6t3wuG9IeBh/Zj3+Xrv32k6DiXQkpXW7YoGi9chl88ciqE1pvdw==
X-Received: by 2002:a17:902:14b:b029:da:b499:25c7 with SMTP id 69-20020a170902014bb02900dab49925c7mr55515plb.80.1606867985675;
        Tue, 01 Dec 2020 16:13:05 -0800 (PST)
Received: from google.com ([2620:15c:211:201:7220:84ff:fe09:5e58])
        by smtp.gmail.com with ESMTPSA id a14sm59066pgv.42.2020.12.01.16.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 16:13:04 -0800 (PST)
Sender: Minchan Kim <minchan.kim@gmail.com>
Date:   Tue, 1 Dec 2020 16:13:02 -0800
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
Message-ID: <20201202001302.GB3968963@google.com>
References: <20201201175144.3996569-1-minchan@kernel.org>
 <20201201175144.3996569-5-minchan@kernel.org>
 <CALAqxLXFeUStaJ8Mtm5v3kSxmeqnjzLTsyathkrKF0ke3fYGiQ@mail.gmail.com>
 <20201201225554.GA3968963@google.com>
 <CALAqxLW-n4-VSd9dj=KXS4WRDrPmKOShAwP9tCfCZnk+4kxW-w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALAqxLW-n4-VSd9dj=KXS4WRDrPmKOShAwP9tCfCZnk+4kxW-w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Dec 01, 2020 at 03:38:14PM -0800, John Stultz wrote:
> On Tue, Dec 1, 2020 at 2:55 PM Minchan Kim <minchan@kernel.org> wrote:
> > On Tue, Dec 01, 2020 at 11:48:15AM -0800, John Stultz wrote:
> > > On Tue, Dec 1, 2020 at 9:51 AM Minchan Kim <minchan@kernel.org> wrote:
> > >
> > > Thanks for reworking and resending this!
> > >
> > > ...
> > > > +static int __init chunk_heap_init(void)
> > > > +{
> > > > +       struct cma *default_cma = dev_get_cma_area(NULL);
> > > > +       struct dma_heap_export_info exp_info;
> > > > +       struct chunk_heap *chunk_heap;
> > > > +
> > > > +       if (!default_cma)
> > > > +               return 0;
> > > > +
> > > > +       chunk_heap = kzalloc(sizeof(*chunk_heap), GFP_KERNEL);
> > > > +       if (!chunk_heap)
> > > > +               return -ENOMEM;
> > > > +
> > > > +       chunk_heap->order = CHUNK_HEAP_ORDER;
> > > > +       chunk_heap->cma = default_cma;
> > > > +
> > > > +       exp_info.name = cma_get_name(default_cma);
> > >
> > > So, this would create a chunk heap name with the default CMA name,
> > > which would be indistinguishable from the heap name used for the plain
> > > CMA heap.
> > >
> > > Probably a good idea to prefix it with "chunk-" so the heap device
> > > names are unique?
> >
> > That will give an impression to user that they are using different CMA
> > area but that's not true. IMHO, let's be honest at this moment.
> 
> I disagree.  The dmabuf heaps provide an abstraction for allocating a
> type of memory, and while your heap is pulling from CMA, you aren't
> "just" allocating CMA as the existing CMA heap would suffice for that.
> 
> Since you need a slightly different method to allocate high order
> pages in bulk, we really should have a unique way to name the
> allocator interface. That's why I'd suggest the "chunk-" prefix to the
> heap name.

Got it. How about this? 

diff --git a/drivers/dma-buf/heaps/chunk_heap.c b/drivers/dma-buf/heaps/chunk_heap.c
index 0277707a93a9..36e189d0b73d 100644
--- a/drivers/dma-buf/heaps/chunk_heap.c
+++ b/drivers/dma-buf/heaps/chunk_heap.c
@@ -410,7 +410,7 @@ static int __init chunk_heap_init(void)
        chunk_heap->order = CHUNK_HEAP_ORDER;
        chunk_heap->cma = default_cma;

-       exp_info.name = cma_get_name(default_cma);
+       exp_info.name = "cma-chunk-heap";
        exp_info.ops = &chunk_heap_ops;
        exp_info.priv = chunk_heap;
