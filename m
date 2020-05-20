Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78DFB1DBC60
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2020 20:10:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726748AbgETSKN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 May 2020 14:10:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726548AbgETSKN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 May 2020 14:10:13 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03FA7C061A0E;
        Wed, 20 May 2020 11:10:13 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id d26so3252293otc.7;
        Wed, 20 May 2020 11:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tx9re6lXGFdfxVUAVwva8EahuEz3Z+j2jfuKERIypGA=;
        b=dZP/+Ezyao2q+g8UeMH7UCWOKPM2rUJz762yFGC8HBceR93568dZwtO5olvMji49Kw
         hEFJyjeG4dsi9+JmPSTjCeXXKuiqj0hGeAE1EhgcsbqTtFzlb2YXv/Kpftg/fF1kcRi3
         rEYiIiO6n0Hjllej82qDcasPEHahE1iPUkKzmdTzhZsddaMzMVqJp/jUsszHB4I9K4wM
         TnqWaN21p2xUge4/Ie4sNg6PVHtDFnBcO1bVtsdn30YyGe2g5q1Ph5HD0mi3FNrqcHct
         iwweP+6OfIZsahDggQGT/c92eZhpe1SDn/glDgk9w2BziuLYJPYzqcV2oh2ADOUoUSdZ
         Izvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tx9re6lXGFdfxVUAVwva8EahuEz3Z+j2jfuKERIypGA=;
        b=eiTJO2PYyn3Pzzp0NLVMs55dIZfXo91XE/yfmQ6b7GZAJwkDnQQWNb0TMRhFSmpFqd
         bEshR7i2yq7dcrFs1drWdhXY1ztLbGCiv8iT95PON2RplrZMbSKj4k3xZBnl6IJfKgeG
         aRNjYzQE43DC4XdGA0RPdSkCbBHi1WiS+B26NV9EqhKI1hCNXAzYlpkalgyJHMYDiX6h
         l4pFtUf1mcJj2vOwx2X1/2+afAu0qVSRFoLl3WN8GWMulMorPxwm74wbAdAfgpj8SS81
         nrUt9W7ZaMOrXx7/bJKh4AyVpc1Snea2Brq1JOA3xLzJdtdA7ilVqumrNoH+CX2x3vbA
         r4Jw==
X-Gm-Message-State: AOAM532/7dLpqQNMOJPxzFhr4Ov/PMdSdXIGkXvMv5HfaQ/6lq6u1R5J
        5vVVqwLtf72yol/h1hrmVBqG2aEXcNFox/GrgoY=
X-Google-Smtp-Source: ABdhPJwoSeRQqKhyxkLlOF1QXnKRkw6Q0I8K11tOPLyQ2ECm09g1/OdzJ2KuQAmdH5Tb6w7Z2yIJxgImrYj8J+weL4M=
X-Received: by 2002:a4a:88e4:: with SMTP id q33mr4005168ooh.27.1589998212250;
 Wed, 20 May 2020 11:10:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200511091142.208787-1-daniel.vetter@ffwll.ch>
 <20200511091142.208787-3-daniel.vetter@ffwll.ch> <CAFCwf10m14ModSuRbQAsWf5CSJvTeP7YRzcokD=o+m2Pa0TqKg@mail.gmail.com>
 <CAPM=9tyukFdDiM6-Mxd+ouXCt9Z4t6LRZwxq7DGoX9drrHnMdQ@mail.gmail.com>
 <CAKMK7uF=SzeEBtZ9xH+jPzeML4V0QQuwBnPVw+OL+MUgTaaLzQ@mail.gmail.com>
 <CAFCwf110j5EDNH9nvrVX9fQ5JkEt5B217snyiTyfpFz8yAkxNg@mail.gmail.com> <20200520180456.GC206103@phenom.ffwll.local>
In-Reply-To: <20200520180456.GC206103@phenom.ffwll.local>
From:   Oded Gabbay <oded.gabbay@gmail.com>
Date:   Wed, 20 May 2020 21:09:42 +0300
Message-ID: <CAFCwf10Hx85bqDKKrP8M=nyaLdDo=pTQtWK0QFPh1EPUfsxEoA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 3/3] misc/habalabs: don't set default fence_ops->wait
To:     Oded Gabbay <oded.gabbay@gmail.com>,
        Dave Airlie <airlied@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, Olof Johansson <olof@lixom.net>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, May 20, 2020 at 9:05 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Thu, May 14, 2020 at 02:38:38PM +0300, Oded Gabbay wrote:
> > On Tue, May 12, 2020 at 9:12 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > >
> > > On Tue, May 12, 2020 at 4:14 AM Dave Airlie <airlied@gmail.com> wrote:
> > > >
> > > > On Mon, 11 May 2020 at 19:37, Oded Gabbay <oded.gabbay@gmail.com> wrote:
> > > > >
> > > > > On Mon, May 11, 2020 at 12:11 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > > > > >
> > > > > > It's the default.
> > > > > Thanks for catching that.
> > > > >
> > > > > >
> > > > > > Also so much for "we're not going to tell the graphics people how to
> > > > > > review their code", dma_fence is a pretty core piece of gpu driver
> > > > > > infrastructure. And it's very much uapi relevant, including piles of
> > > > > > corresponding userspace protocols and libraries for how to pass these
> > > > > > around.
> > > > > >
> > > > > > Would be great if habanalabs would not use this (from a quick look
> > > > > > it's not needed at all), since open source the userspace and playing
> > > > > > by the usual rules isn't on the table. If that's not possible (because
> > > > > > it's actually using the uapi part of dma_fence to interact with gpu
> > > > > > drivers) then we have exactly what everyone promised we'd want to
> > > > > > avoid.
> > > > >
> > > > > We don't use the uapi parts, we currently only using the fencing and
> > > > > signaling ability of this module inside our kernel code. But maybe I
> > > > > didn't understand what you request. You want us *not* to use this
> > > > > well-written piece of kernel code because it is only used by graphics
> > > > > drivers ?
> > > > > I'm sorry but I don't get this argument, if this is indeed what you meant.
> > > >
> > > > We would rather drivers using a feature that has requirements on
> > > > correct userspace implementations of the feature have a userspace that
> > > > is open source and auditable.
> > > >
> > > > Fencing is tricky, cross-device fencing is really tricky, and having
> > > > the ability for a closed userspace component to mess up other people's
> > > > drivers, think i915 shared with closed habana userspace and shared
> > > > fences, decreases ability to debug things.
> > > >
> > > > Ideally we wouldn't offer users known untested/broken scenarios, so
> > > > yes we'd prefer that drivers that intend to expose a userspace fencing
> > > > api around dma-fence would adhere to the rules of the gpu drivers.
> > > >
> > > > I'm not say you have to drop using dma-fence, but if you move towards
> > > > cross-device stuff I believe other drivers would be correct in
> > > > refusing to interact with fences from here.
> > >
> > > The flip side is if you only used dma-fence.c "because it's there",
> > > and not because it comes with an uapi attached and a cross-driver
> > > kernel internal contract for how to interact with gpu drivers, then
> > > there's really not much point in using it. It's a custom-rolled
> > > wait_queue/event thing, that's all. Without the gpu uapi and gpu
> > > cross-driver contract it would be much cleaner to just use wait_queue
> > > directly, and that's a construct all kernel developers understand, not
> > > just gpu folks. From a quick look at least habanalabs doesn't use any
> > > of these uapi/cross-driver/gpu bits.
> > > -Daniel
> >
> > Hi Daniel,
> > I want to say explicitly that we don't use the dma-buf uapi parts, nor
> > we intend to use them to communicate with any GPU device. We only use
> > it as simple completion mechanism as it was convenient to use.
> > I do understand I can exchange that mechanism with a simpler one, and
> > I will add an internal task to do it (albeit not in a very high
> > priority) and upstream it, its just that it is part of our data path
> > so we need to thoroughly validate it first.
>
> Sounds good.
>
> Wrt merging this patch here, can you include that in one of your next
> pulls? Or should I toss it entirely, waiting for you to remove dma_fence
> outright?

I'll include it in the next pull.
Thanks,
Oded
>
> Thanks, Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
