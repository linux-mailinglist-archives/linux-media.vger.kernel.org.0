Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0264C254BED
	for <lists+linux-media@lfdr.de>; Thu, 27 Aug 2020 19:19:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbgH0RTr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Aug 2020 13:19:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726157AbgH0RTr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Aug 2020 13:19:47 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E52F8C061264
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2020 10:19:46 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id o21so5785005wmc.0
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2020 10:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tWjas43xEklyI5v+skhEgP+KYJblDBQOl4R7SyekXUg=;
        b=kI+cT6pVP95nXkbSR8G+0SUJMPWI4ob/6+wJVnPIlyK+5CNMrqLssaObo36nS2lMb1
         HUoI14P1OLKd+g8INSoaKDE+uLjK0uH9E3HJIYOJs7W6Zxwq5q7A+u4WAhQNKkIUaPJT
         3TOOEKt9zaP83U/rvlX2m/sh248iy25QwbdkhfEycFUByCSpBHpVpQyF97fSG0koqv+0
         5pCdSCpXZQzh6i3UKnMO0XLif0vq9BcUax0hGttJev4hRJTWQ0hPUZOgN3HrPcT2z8cw
         kQquBQ+k7+B5+r9dQT3Dd476L8ESv5lWiaB1QDyDV5AUEQTBY/z2UobHL9IrGD4WO0nM
         5eAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tWjas43xEklyI5v+skhEgP+KYJblDBQOl4R7SyekXUg=;
        b=IcNXrguAeUqa8gAeA6Awe8Hz92ma69lqqY1/tNWNpSFATis9ruznOD+p6i1zDZB/le
         hd7Xd8ycBLygixLyT52NEqFXeALRgf5M2oFT1ng+jTSTx/1crT4VuKnKam4hWGAxLb5Z
         al7GELhsEklxxXEog7zyjJkAQAjq4a4gzIFlV5AvL3Zz+FGiKZqbVKeYDPyCRNMX14Vm
         //J49IVv/MamqEoeZ2Tl7NB0X18+SUUuX5l8ARqKytqCnrmOk2veNcZc6xi8gocLdbEe
         WkUjsQa+DOhm82tLNg9Y2+J9IOyACFL3eohq4cnCkm1puK9CK4B3L3Zx5xBEpFOkfAKO
         wrLA==
X-Gm-Message-State: AOAM5325768zkZQUWLSLMyrLxeLjFOS2RA7Se1i+s6vjRm3BGpbBiV1q
        mbHQVsMYnvbXgH13SSd0+N8gsC6E81sdYcENedU6PQ==
X-Google-Smtp-Source: ABdhPJwi1mM8WHsTGhCDjlN4kbF0jg3Dmaq8sgUcaaD7R6pUYjQlpwr4Hn0SXPDhCwWs+y5w3FwJZxT6t8axjSgWfrg=
X-Received: by 2002:a7b:cd05:: with SMTP id f5mr7421107wmj.116.1598548785322;
 Thu, 27 Aug 2020 10:19:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
 <20200504092611.9798-7-laurent.pinchart@ideasonboard.com> <4e42a593f16614e913613150a90e851acbfcaa8c.camel@suse.de>
 <CAPY8ntB3RCwzCzj+v0QEQp19f-X7tgfhFZ_DK3-LUiWXGK0eNA@mail.gmail.com>
 <20200824163952.t7hfri4ml4gjnddq@uno.localdomain> <CAPY8ntAmQxC4rTNsmfNb10XWR4bYHsMEPLei3c9Zdu00wr-_JQ@mail.gmail.com>
 <20200827103826.hm6ezuysgt5wtzj4@uno.localdomain> <CAPY8ntAmydTB-BrooV_yzJpTsMsarySXnZRk8hfs3RkvU3cxSw@mail.gmail.com>
 <20200827164624.6lizqnjs5uewftrc@uno.localdomain>
In-Reply-To: <20200827164624.6lizqnjs5uewftrc@uno.localdomain>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 27 Aug 2020 18:19:29 +0100
Message-ID: <CAPY8ntBzSxAnq3h0dWPuG4F825XH28Q+X66AF7KBnEYdBf=kEg@mail.gmail.com>
Subject: Re: [PATCH v2 06/34] staging: vc04_services: Add new vc-sm-cma driver
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Naushir Patuck <naush@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo

On Thu, 27 Aug 2020 at 17:42, Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> Hi Dave,
>
> On Thu, Aug 27, 2020 at 01:51:07PM +0100, Dave Stevenson wrote:
> > On Thu, 27 Aug 2020 at 11:34, Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> [snip]
>
> > > >
> > > > We can trim it down significantly now that we have dma-heaps in and
> > > > working. There's a niggle that the current dma-heaps are always cached
> > > > on the ARM, but that just means that the user has to be careful to use
> > > > DMA_BUF_IOCTL_SYNC correctly (which they should be doing anyway).
> > >
> > > I am running what was meant to be a v2 of this series and I get a
> > > complaint:
> > > vc_sm_cma_import_dmabuf_internal: Expecting an uncached alias for dma_addr
> > >
> > > When I read this paragraph from your email yesterday I immediately
> > > thought "this should be the LSC table".
> > >
> > > Debugging it further I found out it's actually a vb2 buffer. I have
> > > reduced the list of patches in v2 compared to this long one, and I'm
> > > probably left out something relevant :/
> >
> > vb2 allocated by the ISP (VB2_MEMORY_MMAP), or from Unicam that is
> > then imported into the ISP (VB2_MEMORY_DMABUF)?
> >
> > The former is the dma-ranges being incorrectly set, and the reason for
> > the patch where VCHIQ children inherit the parent's dma config. It's
> > possible something else has changed in the setup since.
>
> Re-introducing those two patches which I left out yesterday waiting
> for more comments made the warning go away, so I presume that was
> memory allocated on the ISP, exported as dmabuf by libcamera, and then
> re-imported in the video device (that's what our FrameBufferAllocator
> does, and I was testing with 'cam' which uses that class to reserve
> memory per-stream).
>
> I have a discussion open with Phil and Nicolas to see how those two
> patches might be made upstream consumable, but I'll remember to keep
> them in when testing.

OK, I'd seen some emails flying around about those patches, but then
couldn't find them when I went looking earlier.

> >
> > The latter is likely to be more involved and depend on what actually
> > allocated it (which may mean I'm using the wrong API calls).
> > I'm getting the dma address via sg_dma_address having attached and
> > mapped the dmabuf. I'm expecting that dma address to therefore follow
> > the dma-ranges of my device (not the allocator), but I'm not 100%
> > certain that is what does happen.
> >
> > A few more details of what exactly the use case that triggers it would
> > be useful.
> >
> > > >
> > > > Whilst waiting for that, the Unicam driver, and the prep work in
> > > > mmal-vchiq could all be pushed first, and ideally as two independent
> > > > patchsets as there are no inter-dependencies between them.
> > >
> > > I could start sending out the unicam driver, yes.
> > >
> > > Currently I'm a bit stuck not being able to receive frames from the
> > > unicam driver. I see the buffers being returned by the ISR routine,
> > > but I never get a buffer available notification in libcamera.
> > >
> > > There's been a few changes to the downstream unicam driver (ie
> > > requesting the VPU clock frequency) and I see the RPi mainline support
> > > has moved forward quite a bit since v5.8. Are you aware of any trivial
> > > change I might be missing that could cause this ?
> >
> > Things never stand still!
>
> Isn't it great ? :D
>
> > Requesting the VPU clock is to avoid a FIFO overflow.
> > We've gained pixel format support (with defines and docs) for Y12P and Y14P.
> > And hopefully I fixed up all the review comments from v1.
>
> Do you think it's worth upstreaming those parts in v2 or should it be
> done on top ? I should check if the VPU clock is exposed or not in
> mainline first...

Adding in the clock would be useful to avoid odd image issues
(particularly on imx477), but you're right it has a dependency on the
clock driver. I thought Maxime had managed to get that merged, but I
haven't checked.

Adding the image formats is fairly uncontentious as long as I've got
the docs for the image formats right. I did jump through the hoops to
test the docs, so I hope they're OK. The changes to the driver to
support them are a dozen lines adding them to a table.

> >
> > It's hard to guess why libcamera isn't happy if we're getting ISRs. We
> > do need to get the appropriate flags in the ISR for frame end (FEI or
> > PI0).
> > Is this Pi3 or Pi4 that you're testing on? Pi3 support should be sound
> > on mainline. AFAIK Pi4 is still a work in progress.
> > Can you stream just using v4l2-ctl --stream-mmap=3 --stream-count=1000
> > --stream-to=/dev/null ? That should work with /dev/video0. Getting the
> > embedded data is more involved over the ordering of opening and
> > starting streaming on the nodes.
>
> It's a Pi4.

Sorry, I've not tried mainline on a Pi4 yet.

> After a pleasant day of debugging I got a nice trace that shows me
> that it's actually the buffer importing part that hangs on a completion
> in vc_sm_cma_vchi_import.
>
> In mainline the whole vchi interface got dropped and I got to port the
> vc-sma-cma driver to use the vchiq interface directly. I might have
> screwed something up and I'm now looking suspiciously at this thread
> function: "vc_sm_cma_vchi_videocore_io()" (also because I had to move it
> to use msg_hold+msg_release, as peek+remove was killed by:
> b5f1547b6e3bd ("staging: vchi: Get rid of vchi_msg_peek()")

I'll look at those vchi/vchiq patches if they've now been merged. It
makes some sense for us to backport them so they get a real thrashing.
If you've gone through any of the existing drivers doing the
conversion, then feel free to throw me the files to have a look at
(and it potentially saves me some effort in doing the same
conversion).

> I'll look into that again.
>
> In the meantime is there any chance this rings any bell to you?
> https://paste.debian.net/1161469/

Nothing obvious - sorry.

> Thanks
>    j
>
> >
> > (We do have an open issue regarding getting the correct DMA address
> > for Unicam on PI0 & 1. Those share the L2 cache for many things so
> > dma-ranges is set differently, and not in a way that currently works
> > with the Unicam driver. That one may need a followup fix.)

Issue resolved. My check in the driver was invalid - we have a
downstream PR for it now.

  Dave
