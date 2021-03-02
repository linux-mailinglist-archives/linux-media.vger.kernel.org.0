Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CC6032A853
	for <lists+linux-media@lfdr.de>; Tue,  2 Mar 2021 18:42:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1580169AbhCBRa1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Mar 2021 12:30:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242526AbhCBCyS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Mar 2021 21:54:18 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41D6AC061794
        for <linux-media@vger.kernel.org>; Mon,  1 Mar 2021 18:51:22 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id m22so28975989lfg.5
        for <linux-media@vger.kernel.org>; Mon, 01 Mar 2021 18:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8E7jhhYaCr8C6xSxrpG64nSWDU98o0HEwhCAOn7PAok=;
        b=CtAXWUOUEPDunoQwsrVEycASyIeLXdyliiw3gjDfZoPH+mu6HRFJOGnvR+MXDvPlDm
         oJEoBKJceAIP2pSJHn+StAUkr8+FPr8L0aB9U0Vy1qM2/Mbuam3IoNYxT5pbkQ80CSz5
         v+n7Dc+u4gZ3D8doFYnzRKlLYdu9QORdgOB+hiY2Y5a++SWfH2tQYDboAkTDYnDaSE0Z
         JRvCN/hTYcNbxkcDEy80hNN15DwQWGSIOoLUUTwsvFme1NaGT/LGKe9KUqplff5A7xWE
         XyhzBmSQ2tNJ2WB0xFUzwBEFK5UX42BcM70Ib0iGxM8OhzGOBsql/eZGL2c4DYIhUEFD
         Xw2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8E7jhhYaCr8C6xSxrpG64nSWDU98o0HEwhCAOn7PAok=;
        b=ans/lqnV0CnY0WL6TPTVfJNgbvFPvovDNMQ2pVvE8OtyTrAUjdRMiWDHXvTsWgFoUJ
         7GGCgoB4XSKnCeWjnh7a6uxUZT9+KVdLoYJhTYFwWdn34m33nqjfExUH9IqorgUMNZwS
         X0Lxd6jGOeZRRtksqmTMpF9ROQZTDniOliI5+xaGVog3FNwopVxP6zCW0Iem6SDRf6r+
         Z+yt+YdCDG0HedcsPg4+5FUzt4O8klMd9gH2AvzyB31DjvIX08bYYWir6J2oHbICbSP4
         6AVLhaWl4aRwqMFp1Vyyn76SBrsZxHFK4JNILsoMMYf+snnKGdLOgH4GDLWgp+k9kbex
         N4Jw==
X-Gm-Message-State: AOAM533rtKGt8eALifyXUJfEZDbctD9+6XGf8NdABpRLTMdXWYtddzq5
        EGxyqYI5w1WIi3EHUX8bnYP9x8SUvFFWz27ntP7FPw==
X-Google-Smtp-Source: ABdhPJz39rZTCGPuL53OOyY7GEDe7aOcYzZlxQr263eEFf2vvM39BGGanu2WFzPxlDI0/hLiEweWlg9234LilyOgSj4=
X-Received: by 2002:a05:6512:547:: with SMTP id h7mr11428172lfl.529.1614653480706;
 Mon, 01 Mar 2021 18:51:20 -0800 (PST)
MIME-Version: 1.0
References: <20210226040908.3274666-1-john.stultz@linaro.org>
 <CAKMK7uHGutJiZ879NAweTHka=gZQBw9zWQSDJn6bTLS6bJwvvg@mail.gmail.com> <20210227094436.GA3130571@infradead.org>
In-Reply-To: <20210227094436.GA3130571@infradead.org>
From:   John Stultz <john.stultz@linaro.org>
Date:   Mon, 1 Mar 2021 18:51:09 -0800
Message-ID: <CALAqxLUcbAWiwxqLRmr4Ve4ecSAJ-jsZy-RDC3jqDONgoRht9Q@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: heaps: Set VM_PFNMAP in mmap for system and cma heaps
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        lkml <linux-kernel@vger.kernel.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Christian Koenig <christian.koenig@amd.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Sandeep Patil <sspatil@google.com>,
        Daniel Mentz <danielmentz@google.com>,
        "??rjan Eide" <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Simon Ser <contact@emersion.fr>,
        James Jones <jajones@nvidia.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Feb 27, 2021 at 1:44 AM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Fri, Feb 26, 2021 at 08:36:55AM +0100, Daniel Vetter wrote:
> > Also given that both deal with struct page there's a ton of divergence
> > between these two that doesn't make much sense. Maybe could even share
> > the code fully, aside from how you allocate the struct pages.
>
> I've been saying that since the code was first submitted.  Once pages
> are allocated from CMA they should be treated not different from normal
> pages.
>
> Please take a look at how the DMA contigous allocator manages to share
> all code for handling CMA vs alloc_pages pages.

I'll take a look at that! Thanks for the pointer!
-john
