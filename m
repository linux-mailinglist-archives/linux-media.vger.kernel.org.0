Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ECD03AC26B
	for <lists+linux-media@lfdr.de>; Fri, 18 Jun 2021 06:44:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231925AbhFREqe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Jun 2021 00:46:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231812AbhFREqd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Jun 2021 00:46:33 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D81AEC061574
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 21:44:23 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id c7so5845835edn.6
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 21:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xClIV3g2rAFuoyZHyCnYEVOzgSyn0J/b3rPgod6lQRo=;
        b=IysTrToP+mR4ZL3tTCrr87Yg6G1IcGhuMnYEyffxAEn8bzy3GdmpYfYIJkqF8PHMgb
         u0ISALkuGhVi0o1uZg1zyw72CX83FQ3ECFQLnGPzuz7YSmcogSZRpf1dTmtrB7dJsEzM
         BjrOup6I0s9ICwQ8TCbuwdbwrh5NA/ongy16w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xClIV3g2rAFuoyZHyCnYEVOzgSyn0J/b3rPgod6lQRo=;
        b=j3jVFAB7wKWCklb7a8nc4NIemWuR+ngCdJXaEMSgAuKVcmKtlRPbEnPfohroQTYqnZ
         ZA7V7N7XZCoXsrndwpX4fYf2cT07My3+FRaxtfubst5BjGQ4wG5TgrKt6hiGKS8xrxcq
         1s8v3OGGZQ7T2nSdCeC56UAbMorIC6jOpnJA/X3QLb/TF/P3aahFng7Zt0Wmj3IrTHtf
         lflgf5ot8wl98cPjvPvH+h/8z/gpnxfUzYo8iR0DGNwujXrvENm7jdUU6T/7sVGqzx3r
         Q5bvAb6jhNf0fHsNVRubq87rb85n78xYidHYNEXIEUyM5uTDnvPWrwfdj6DdHiiRZ3nz
         eihw==
X-Gm-Message-State: AOAM532Z3bHmgvj5hN7HPcTmN7zIlwk0J+UDNtJOeC/SfQZVsu+c1ppC
        bvctlQfRu/hN1E1KodqUy91cAyhgJ2iKeA==
X-Google-Smtp-Source: ABdhPJz+FLUzUtkzYmuNMiq14aJ5zJtvjoAFmx0ZP+GrzI5810VPnMSLIczpmmO84yECBi5MqliWMg==
X-Received: by 2002:aa7:cf0f:: with SMTP id a15mr2316251edy.313.1623991461937;
        Thu, 17 Jun 2021 21:44:21 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id mm25sm500195ejb.125.2021.06.17.21.44.21
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jun 2021 21:44:21 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id i94so9159846wri.4
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 21:44:21 -0700 (PDT)
X-Received: by 2002:adf:e804:: with SMTP id o4mr8875519wrm.103.1623991460457;
 Thu, 17 Jun 2021 21:44:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210427131344.139443-1-senozhatsky@chromium.org>
 <20210427131344.139443-9-senozhatsky@chromium.org> <10a0903a-e295-5cba-683a-1eb89a0804ed@xs4all.nl>
 <YMsAIVs7G2hUDR2F@google.com> <20210617080107.GA1422@lst.de>
 <CAAFQd5DiPstn-s+yQM3iMd=G9oaag39qCyX483a7-Jrn=gxWCA@mail.gmail.com>
 <20210617085233.GA4702@lst.de> <CAAFQd5DqK2gSTGjfo-vahXwMzzO9gv26cY=vV6urn3viDLPE7g@mail.gmail.com>
 <20210617100656.GA11107@lst.de> <CAAFQd5CgLDkJ3t1aU2PRcGu6cGFjLXOnvMqDg62Z7Zuc8ABVHg@mail.gmail.com>
 <20210618042526.GA17794@lst.de>
In-Reply-To: <20210618042526.GA17794@lst.de>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 18 Jun 2021 13:44:08 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Bt9TJ87Yk5ZpqTqrX9rmP0Uq8VNwx_rwFHakWP850Axw@mail.gmail.com>
Message-ID: <CAAFQd5Bt9TJ87Yk5ZpqTqrX9rmP0Uq8VNwx_rwFHakWP850Axw@mail.gmail.com>
Subject: Re: [PATCHv2 8/8] videobuf2: handle non-contiguous DMA allocations
To:     Christoph Hellwig <hch@lst.de>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jun 18, 2021 at 1:25 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Fri, Jun 18, 2021 at 12:21:33PM +0900, Tomasz Figa wrote:
> > > On Thu, Jun 17, 2021 at 06:40:58PM +0900, Tomasz Figa wrote:
> > > > Sorry, I meant dma_alloc_attrs() and yes, it's indeed a misnomer. Our
> > > > use case basically has no need for the additional coherent mapping, so
> > > > creation of it can be skipped to save some vmalloc space. (Yes, it
> > > > probably only matters for 32-bit architectures.)
> > >
> > > Yes, that is the normal use case, and it is solved by using
> > > dma_alloc_noncoherent or dma_alloc_noncontigous without the vmap
> > > step.
> >
> > True, silly me. Probably not enough coffee at the time I was looking at it.
> >
> > With that, wouldn't it be possible to completely get rid of
> > dma_alloc_{coherent,attrs}() and use dma_alloc_noncontiguous() +
> > optional kernel and/or userspace mapping helper everywhere? (Possibly
> > renaming it to something as simple as dma_alloc().
>
> Well, dma_alloc_coherent users want a non-cached mapping.  And while
> some architectures provide that using a vmap with "uncached" bits in the
> PTE to provide that, this:
>
>  a) is not possibly everywhere
>  b) even where possible is not always the best idea as it creates mappings
>     with differnet cachability bets

I think this could be addressed by having a dma_vmap() helper that
does the right thing, whether it's vmap() or dma_common_pages_remap()
as appropriate. Or would be this still insufficient for some
architectures?

>
> And even without that dma_alloc_noncoherent causes less overhead than
> dma_alloc_noncontigious if you only need a single contiguous range.
>

Given that behind the scenes dma_alloc_noncontiguous() would also just
call __dma_alloc_pages() for devices that need contiguous pages, would
the overhead be basically the creation of a single-entry sgtable?

> So while I'm happy we have something useful for more complex drivers like
> v4l I think the simple dma_alloc_coherent API, including some of the less
> crazy flags for dma_alloc_attrs is the right thing to use for more than
> 90% of the use cases.

One thing to take into account here is that many drivers use the
existing "simple" way, just because there wasn't a viable alternative
to do something better. Agreed, though, that we shouldn't optimize for
the rare cases.

Best regards,
Tomasz
