Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67A63254563
	for <lists+linux-media@lfdr.de>; Thu, 27 Aug 2020 14:52:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728901AbgH0Mwj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Aug 2020 08:52:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729126AbgH0MvZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Aug 2020 08:51:25 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B5ACC061264
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2020 05:51:25 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id w2so4838567wmi.1
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2020 05:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tWH4SgTpy2QTmcMHBPOPCrkgfTyBiuEPjt7Inc+Zr5k=;
        b=JImDwdVsFQAqYCOPa3cPpwhwst5YHZSJpUnzrMQmXgB3BJwM2X428OeKtvBAgyJKsC
         Ec/QK6CPtNEfUo/VD948FbB+Act9zSbyuSraI0g2FfGJB39dHIW4UzDvttRqsJ1vA+mM
         bjlLB/nzZaXy0YkyYrMeErJJoPdZxA4is8tBS+hjYD+YakFrMrvX5xOTEu6ADN7BX6A7
         CYF57YWfTMtgKraNhYD3dOKbFCQWtvOIJ34n2hyJJOm0z1OS6KUY0K5B7Rnw3cS00oWY
         8bxArdV/o+qk/cOYmuC+yt10jF5o6GbfMav84jt5ns4cSX+P4C7RRqvf2tB0KQKz3pyv
         NDyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tWH4SgTpy2QTmcMHBPOPCrkgfTyBiuEPjt7Inc+Zr5k=;
        b=hBoZe+Ei6id+AenDM6oVJFKEh/VLgn66cvA78P0iYKJOXImDd5krsVSWlydk9K36fo
         T6J4SEiO+icuXq9BdrCbAabEFrdRZdi3i0FRnB5snIppqiUsOFBJBAeb1sltcjUdnfjm
         +bu6m7v10OmqC8KI468Q+JVy985TV9OUWtZLyRWleTsi8/PQYLPd5DJzDZrrwb+kZWk1
         DUk3SkKVCIVoTI2sKAwE3sIY5TJCOmZNsyOY3ZfbrVo0ngJUs/JmO5CsuFJJzMGYAjwv
         8Yh7v9cAM/guKKXELDST28wOod/zfBUWjKBCSljXPmh3SU8AWa/wHCmoiElmntmLbPi7
         aM9A==
X-Gm-Message-State: AOAM531+5cTvB/sIr7ZFyuZJ7pGlGA1IMWTeD0WJJWTVVhN3VGh2zxI7
        zCpVlVAHTxW70yHkXLBrv1F+3/GBLtcdjdiIYjNP8w==
X-Google-Smtp-Source: ABdhPJzXzfoUOCYz0T3F/kr3bBMh9pvtR5gUupr5IX36Kcxz98J5SWqhpdV6Y4fD7W+OqhQBi7eOsKmkMzHqfBv/KCY=
X-Received: by 2002:a1c:7707:: with SMTP id t7mr12418553wmi.82.1598532683798;
 Thu, 27 Aug 2020 05:51:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
 <20200504092611.9798-7-laurent.pinchart@ideasonboard.com> <4e42a593f16614e913613150a90e851acbfcaa8c.camel@suse.de>
 <CAPY8ntB3RCwzCzj+v0QEQp19f-X7tgfhFZ_DK3-LUiWXGK0eNA@mail.gmail.com>
 <20200824163952.t7hfri4ml4gjnddq@uno.localdomain> <CAPY8ntAmQxC4rTNsmfNb10XWR4bYHsMEPLei3c9Zdu00wr-_JQ@mail.gmail.com>
 <20200827103826.hm6ezuysgt5wtzj4@uno.localdomain>
In-Reply-To: <20200827103826.hm6ezuysgt5wtzj4@uno.localdomain>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 27 Aug 2020 13:51:07 +0100
Message-ID: <CAPY8ntAmydTB-BrooV_yzJpTsMsarySXnZRk8hfs3RkvU3cxSw@mail.gmail.com>
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

On Thu, 27 Aug 2020 at 11:34, Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> Hi Dave,
>
> On Tue, Aug 25, 2020 at 06:52:18PM +0100, Dave Stevenson wrote:
> > Hi Jacopo
> >
> > On Mon, 24 Aug 2020 at 17:36, Jacopo Mondi <jacopo@jmondi.org> wrote:
> > >
> > > Hi Dave, Nicolas, Laurent,
> > >
> > > On Wed, May 06, 2020 at 08:24:38PM +0100, Dave Stevenson wrote:
> > > > Hi Nicolas
> > > >
> > > > On Wed, 6 May 2020 at 19:04, Nicolas Saenz Julienne
> > > > <nsaenzjulienne@suse.de> wrote:
> > > > >
> > > > > Hi Laurent, Dave,
> > > > >
> > > > > On Mon, 2020-05-04 at 12:25 +0300, Laurent Pinchart wrote:
> > > > > > From: Dave Stevenson <dave.stevenson@raspberrypi.org>
> > > > > >
> > > > > > Add Broadcom VideoCore Shared Memory support.
> > > > > >
> > > > > > This new driver allows contiguous memory blocks to be imported
> > > > > > into the VideoCore VPU memory map, and manages the lifetime of
> > > > > > those objects, only releasing the source dmabuf once the VPU has
> > > > > > confirmed it has finished with it.
> > > > > >
> > > > >
> > > > > I'm still digesting all this, but a question came up, who is using the
> > > > > ioctls?
> > > >
> > > > We have a userspace library that uses it [1].
> > > > It is used by things like MMAL to share buffers between the VPU and
> > > > ARM, rather than having to get VCHI to copy all the data between
> > > > mirrored buffers.
> > > >
> > > > I think what has happened here is that Laurent has picked up the
> > > > version of the driver from the top of our downstream kernel tree.
> > > > For libcamera and the ISP driver, we need a significantly smaller
> > > > feature set, basically import of dmabufs only, no allocations or cache
> > > > management. For the ISP driver it's mainly dmabuf import from
> > > > videobuf2 for the image buffers, but there's also a need to pass in
> > > > lens shading tables which are relatively large. With a small amount of
> > > > rework in libcamera, we can make it so that we use dma-buf heaps to do
> > > > the allocation, and pass in a dmabuf fd to the ISP driver to then map
> > > > onto the VPU. That removes all the ioctls handling from this driver.
> > > >
> > > > Downstream we do have other use cases that want to be able to do other
> > > > functions on shared memory, but that too should be reworkable into
> > > > using dma-buf heaps for allocations, and vcsm only handles importing
> > > > dmabufs via an ioctl. All that can be hidden away in the vcsm library,
> > > > so applications don't care.
> > > > We've also got some legacy code kicking around, as there was
> > > > originally a version of the driver that mapped the VPU's memory blocks
> > > > to the ARM. That's why the vcsm library has two code paths through
> > > > almost every function - one for each driver.
> > > >
> > > > Laurent: What's your view? Halt the review this particular patch for
> > > > now and rework, or try and get this all integrated?
> > > > Mainline obviously already has dma-buf heaps merged, whilst I have a
> > > > PR cherry-picking it back into our downstream 5.4. The main reason it
> > > > hasn't been merged is that I haven't had a test case to prove it
> > > > works. The rework should be relatively simple, but will need small
> > > > updates to both libcamera and ISP driver.
> > >
> > > As months have passed, libcamera moved to allocate lens shading tables
> > > using dma-buf heaps and the only user I can name of the vc-sm-cma
> > > driver is the actual ISP, that needs to import the dmabuf pointing to
> > > the lens shading maps with vc_sm_cma_import_dmabuf().
> >
> > You've also got vc04_services/vchiq-mmal/mmal-vchiq.c importing
> > dmabufs, either from vb2_contig or imported from elsewhere when using
> > VB2_MEMORY_DMABUF.
>
> Of course. Re-looking at it, the lens-shading tables are allocated on
> dmabuf heaps and the exported dmabuf fd passed with a custom control to the
> ISP, which uses it to set a mmal port parameter. I got lost in the code
> base at mmal-vchiq.c:port_parameter_set(), which receives a
> struct bcm2835_isp_lens_shading which contains the dmabuf fd. I assume
> it then maps it into the VPU memory to access the shading tables.
>
> But of course buffer queueing to the ISP requires dmabuf importing in
> the VPU, and that happens by 'submitting' a buffer to mmal-vchiq
> vchiq_mmal_submit_buffer() which does that by calling
> vc_sm_cma_import_dmabuf().
>
> I hope I have a more clear idea of the two paths now.
>
> >
> > > Upstreaming the whole vc-sm-cma driver as it is for this single kAPI
> > > seems a bit a no-go. Dave, what would you prefer here ? Should I
> > > provide a minimal vc-sm-cam driver that only performs buffer importing
> > > to support the ISP driver ? Is the buffer importing into VPU there to
> > > stay or is its usage transitional and can be kept out of the next
> > > submission of this series ?
> >
> > Both imports are here to stay as the VPU needs to be able to use those
> > blocks of memory.
> >
>
> Of course. I was wondering if a fairly big component like vc-sma-cma
> isn't too much for just importing, and reading further it seems like
> this is a shared concern.
>
> > This first iteration picked up a fair number of extraneous lumps (eg
> > the caching calls).
> > I got a reminder last week that I promised a reworked version of
> > vc-sm-cma to you and I hadn't done it - sorry, juggling too many
> > things. I'll get on it now, so nudge me if I haven't pushed it to you
> > by the end of the week for your review.
>
> Great, so I'll wait for news from your side
>
> >
> > We can trim it down significantly now that we have dma-heaps in and
> > working. There's a niggle that the current dma-heaps are always cached
> > on the ARM, but that just means that the user has to be careful to use
> > DMA_BUF_IOCTL_SYNC correctly (which they should be doing anyway).
>
> I am running what was meant to be a v2 of this series and I get a
> complaint:
> vc_sm_cma_import_dmabuf_internal: Expecting an uncached alias for dma_addr
>
> When I read this paragraph from your email yesterday I immediately
> thought "this should be the LSC table".
>
> Debugging it further I found out it's actually a vb2 buffer. I have
> reduced the list of patches in v2 compared to this long one, and I'm
> probably left out something relevant :/

vb2 allocated by the ISP (VB2_MEMORY_MMAP), or from Unicam that is
then imported into the ISP (VB2_MEMORY_DMABUF)?

The former is the dma-ranges being incorrectly set, and the reason for
the patch where VCHIQ children inherit the parent's dma config. It's
possible something else has changed in the setup since.

The latter is likely to be more involved and depend on what actually
allocated it (which may mean I'm using the wrong API calls).
I'm getting the dma address via sg_dma_address having attached and
mapped the dmabuf. I'm expecting that dma address to therefore follow
the dma-ranges of my device (not the allocator), but I'm not 100%
certain that is what does happen.

A few more details of what exactly the use case that triggers it would
be useful.

> >
> > Whilst waiting for that, the Unicam driver, and the prep work in
> > mmal-vchiq could all be pushed first, and ideally as two independent
> > patchsets as there are no inter-dependencies between them.
>
> I could start sending out the unicam driver, yes.
>
> Currently I'm a bit stuck not being able to receive frames from the
> unicam driver. I see the buffers being returned by the ISR routine,
> but I never get a buffer available notification in libcamera.
>
> There's been a few changes to the downstream unicam driver (ie
> requesting the VPU clock frequency) and I see the RPi mainline support
> has moved forward quite a bit since v5.8. Are you aware of any trivial
> change I might be missing that could cause this ?

Things never stand still!
Requesting the VPU clock is to avoid a FIFO overflow.
We've gained pixel format support (with defines and docs) for Y12P and Y14P.
And hopefully I fixed up all the review comments from v1.

It's hard to guess why libcamera isn't happy if we're getting ISRs. We
do need to get the appropriate flags in the ISR for frame end (FEI or
PI0).
Is this Pi3 or Pi4 that you're testing on? Pi3 support should be sound
on mainline. AFAIK Pi4 is still a work in progress.
Can you stream just using v4l2-ctl --stream-mmap=3 --stream-count=1000
--stream-to=/dev/null ? That should work with /dev/video0. Getting the
embedded data is more involved over the ordering of opening and
starting streaming on the nodes.

(We do have an open issue regarding getting the correct DMA address
for Unicam on PI0 & 1. Those share the L2 cache for many things so
dma-ranges is set differently, and not in a way that currently works
with the Unicam driver. That one may need a followup fix.)

  Dave

> Thanks
>   j
>
> >
> >   Dave
> >
> > > Thanks
> > >   j
> > >
> > > >
> > > >   Dave
> > > >
> > > > [1] https://github.com/raspberrypi/userland/tree/master/host_applications/linux/libs/sm
> > > >
> > > > > Regards,
> > > > > Nicolas
> > > > >
