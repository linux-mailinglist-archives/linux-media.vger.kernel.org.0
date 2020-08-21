Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B611124DFAE
	for <lists+linux-media@lfdr.de>; Fri, 21 Aug 2020 20:33:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725991AbgHUSdK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Aug 2020 14:33:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725802AbgHUSdI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Aug 2020 14:33:08 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 653C4C061573
        for <linux-media@vger.kernel.org>; Fri, 21 Aug 2020 11:33:08 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id v13so2305051oiv.13
        for <linux-media@vger.kernel.org>; Fri, 21 Aug 2020 11:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8nGTtqOdT8QbhAcolfnXtRJ6zNTRjlwZ2C3fhFZhaDs=;
        b=LLawsSEid7WFC/5Q38+TeSvLC+sPqjrYKhgVQSk/ixd/d0hwUPtCw61+uX5DEKfe4e
         OFtXI0rYVO1PFTyC/s2Ff1d7Z6NF9M3gXf08AmXqpkp/WRv/JjZBxJh3k13Okyw/Rejz
         /YxQtr8VqsQJMhFJurWYh33xHJaYk1skwo1scAJ16Opvh3C60s+RlCGOOu42EnX3hGNO
         fwMkru5sQyb4FLI0PjDO5B2qbKnpvxAHJu0MkVaZQ8mch/fJ8jwV2X6YTVooqulrx7sQ
         y6SHYD6FKd6Ca1phJd57A7BGJKWipwmw3C25j2P9jzyjS75+L96igCuhj4Q+SDN3lO2L
         C3kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8nGTtqOdT8QbhAcolfnXtRJ6zNTRjlwZ2C3fhFZhaDs=;
        b=nni1h2qt1mBFj+2b12HptrplTfn2/sYzuoajhPZE+F/G/X22x3RsxVw+GiDa1nE8IC
         Hr4fOKtiEx8I7i/Vyqc4laQaImrdEj3h/wOgHJTg5ycPdtgLp1tJ2vRIW80DDqkCmR30
         Kq9LBeYk+wYkNhZ5iNcBNQ9tArNYoBYoKQl+JmTi2+P7MIsJfOZPQ5/uVReGuCpfOylW
         37HDcBmtYGv28Vkzj1Xn0cOQ2fHzNIjAC5XaNQsnhFUSWqIITh34ILe3v/kHcYKqnbz9
         FAO/Jg8pazfaImE59j34FkqN37UFhidZEutUv/NLtSag+H97uEBdLMt+z62gMdXHH+Ym
         IBkw==
X-Gm-Message-State: AOAM5320wRHyLlAs0M2afV/ej5koutxhh3NqAcKyrLyL8BveUkbLVWYm
        LTdoNMPuKHrG513aomsGxLokjsP8aA1h0I8DjzbHCw==
X-Google-Smtp-Source: ABdhPJxU0l4/PQ0p0REIHWIO5iBFsGV6uZhIfU5XfQAXI0KuYVF8+u294BmLV/xzkuc7A4Xyps+x1hAcLGupZkVqjh0=
X-Received: by 2002:aca:1c15:: with SMTP id c21mr2711233oic.10.1598034787715;
 Fri, 21 Aug 2020 11:33:07 -0700 (PDT)
MIME-Version: 1.0
References: <1594948208-4739-1-git-send-email-hayashi.kunihiko@socionext.com>
 <CALAqxLXuJQOCXcpyWwyBFZGFK_dEgG0edEEf2=vOpAw6Ng8mBQ@mail.gmail.com>
 <eacfc713-e98a-78fa-b316-3943600813d0@socionext.com> <CALAqxLVzUnc5CH_pA7h3ygXFPRz05KtNZx+_M3eAXXrm7hhGBQ@mail.gmail.com>
 <377e6e65-0b44-ecd0-cfc5-6fbc82be35d5@socionext.com>
In-Reply-To: <377e6e65-0b44-ecd0-cfc5-6fbc82be35d5@socionext.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Fri, 21 Aug 2020 11:32:56 -0700
Message-ID: <CALAqxLXbKZ=y4BTG7Kx9E46Uysx=eV=GitEDQKwp-Obg5aHUrw@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: heaps: Introduce dma_heap_add_cma() for
 non-default CMA heap
To:     Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        "Andrew F . Davis" <afd@ti.com>, Liam Mark <lmark@codeaurora.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Christian Koenig <christian.koenig@amd.com>,
        linux-media <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Laura Abbott <labbott@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Aug 21, 2020 at 2:14 AM Kunihiko Hayashi
<hayashi.kunihiko@socionext.com> wrote:
>
> On 2020/08/01 4:38, John Stultz wrote:
> > On Fri, Jul 31, 2020 at 2:32 AM Kunihiko Hayashi
> > <hayashi.kunihiko@socionext.com> wrote:
> >> On 2020/07/29 4:17, John Stultz wrote:
> >>> Do you have a upstream driver that you plan to make use this new call?
> >>
> >> Unfortunately I don't have an upstream driver using this call.
> >>
> >> This call is called from dma-buf heaps "importer" or "customer",
> >> and I only made an example (do nothing) importer driver
> >> to test the call.
> >>
> >>> We want to have in-tree users of code added.
> >>
> >> I think this is a generic way to use non-default CMA heaps, however,
> >> we need in-tree "importer" drivers to want to use non-default CMA heaps.
> >> I don't find it from now.
> >>
> >
> > Yea, I and again, I do agree this is functionality that will be
> > needed. But we'll need to wait for a user (camera driver, etc which
> > would utilize the reserved cma region) before we can merge it
> > upstream. :(  Do let me know if you have an out of tree driver that
> > would make use of it, and we can see what can be done to help upstream
> > things.
>
> Sorry for late.
> Before I prepare or find a user driver as "importer",
> I think something is different in this patch.
>
> This patch makes it possible to treat non-default CMA connected to
> "importer" device with memory-region as dma-buf heaps.
>
> However, the allocated memory from this dma-buf heaps can be used
> for "any" devices, and the "importer" can treat memories from other
> dma-buf heaps.
>
> So, the "importer" and the non-default CMA aren't directly related,
> and I think an "exporter" for the non-default CMA should be enabled.
>
> In paticular, the kernel initializer (as an "exporter") calls
> dma_heap_add_cma() for all CMAs defined in Devicetree, and
> the device files associated with each CMA appear under "/dev/dma_heap/".
> For example:
>
>     /dev/dma_heap/linux,cma@10000000
>     /dev/dma_heap/linux,cma@11000000
>     /dev/dma_heap/linux,cma@12000000
>     ...
>
> All of these device files can be fairly allocated to any "importer" device.
>
> Actually I think that the kernel should executes dma_heap_add_cma()
> for ALL defined reserved-memory nodes.
>
> If this idea hasn't been discussed yet and this is reasonable,
> I'll prepare RFC patches.

So yes! An earlier version of the CMA heap I submitted did add all CMA
regions as accessible heaps as you propose here.

However, the concern was that in some cases, those regions are device
specific reserved memory that the driver is probably expecting to have
exclusive access. To allow (sufficiently privileged, or misconfigured)
userland to be able to allocate out of that seemed like it might cause
trouble, and instead we should have CMA regions explicitly exported.
There was some proposal to add a dt property to the reserved memory
section (similar to linux,cma-default) and use that to do the
exporting, but other discussions seemed to prefer having drivers
export it explicitly in a fashion very similar to what your earlier
patch does. The only trouble is we just need an upstream driver to add
such a call in the series before we can merge it.

thanks
-john
