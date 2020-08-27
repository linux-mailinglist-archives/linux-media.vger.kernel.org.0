Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05D752543CD
	for <lists+linux-media@lfdr.de>; Thu, 27 Aug 2020 12:34:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727986AbgH0Keq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Aug 2020 06:34:46 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:59363 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727030AbgH0Keq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Aug 2020 06:34:46 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id B635760008;
        Thu, 27 Aug 2020 10:34:41 +0000 (UTC)
Date:   Thu, 27 Aug 2020 12:38:26 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Naushir Patuck <naush@raspberrypi.com>
Subject: Re: [PATCH v2 06/34] staging: vc04_services: Add new vc-sm-cma driver
Message-ID: <20200827103826.hm6ezuysgt5wtzj4@uno.localdomain>
References: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
 <20200504092611.9798-7-laurent.pinchart@ideasonboard.com>
 <4e42a593f16614e913613150a90e851acbfcaa8c.camel@suse.de>
 <CAPY8ntB3RCwzCzj+v0QEQp19f-X7tgfhFZ_DK3-LUiWXGK0eNA@mail.gmail.com>
 <20200824163952.t7hfri4ml4gjnddq@uno.localdomain>
 <CAPY8ntAmQxC4rTNsmfNb10XWR4bYHsMEPLei3c9Zdu00wr-_JQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntAmQxC4rTNsmfNb10XWR4bYHsMEPLei3c9Zdu00wr-_JQ@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

On Tue, Aug 25, 2020 at 06:52:18PM +0100, Dave Stevenson wrote:
> Hi Jacopo
>
> On Mon, 24 Aug 2020 at 17:36, Jacopo Mondi <jacopo@jmondi.org> wrote:
> >
> > Hi Dave, Nicolas, Laurent,
> >
> > On Wed, May 06, 2020 at 08:24:38PM +0100, Dave Stevenson wrote:
> > > Hi Nicolas
> > >
> > > On Wed, 6 May 2020 at 19:04, Nicolas Saenz Julienne
> > > <nsaenzjulienne@suse.de> wrote:
> > > >
> > > > Hi Laurent, Dave,
> > > >
> > > > On Mon, 2020-05-04 at 12:25 +0300, Laurent Pinchart wrote:
> > > > > From: Dave Stevenson <dave.stevenson@raspberrypi.org>
> > > > >
> > > > > Add Broadcom VideoCore Shared Memory support.
> > > > >
> > > > > This new driver allows contiguous memory blocks to be imported
> > > > > into the VideoCore VPU memory map, and manages the lifetime of
> > > > > those objects, only releasing the source dmabuf once the VPU has
> > > > > confirmed it has finished with it.
> > > > >
> > > >
> > > > I'm still digesting all this, but a question came up, who is using the
> > > > ioctls?
> > >
> > > We have a userspace library that uses it [1].
> > > It is used by things like MMAL to share buffers between the VPU and
> > > ARM, rather than having to get VCHI to copy all the data between
> > > mirrored buffers.
> > >
> > > I think what has happened here is that Laurent has picked up the
> > > version of the driver from the top of our downstream kernel tree.
> > > For libcamera and the ISP driver, we need a significantly smaller
> > > feature set, basically import of dmabufs only, no allocations or cache
> > > management. For the ISP driver it's mainly dmabuf import from
> > > videobuf2 for the image buffers, but there's also a need to pass in
> > > lens shading tables which are relatively large. With a small amount of
> > > rework in libcamera, we can make it so that we use dma-buf heaps to do
> > > the allocation, and pass in a dmabuf fd to the ISP driver to then map
> > > onto the VPU. That removes all the ioctls handling from this driver.
> > >
> > > Downstream we do have other use cases that want to be able to do other
> > > functions on shared memory, but that too should be reworkable into
> > > using dma-buf heaps for allocations, and vcsm only handles importing
> > > dmabufs via an ioctl. All that can be hidden away in the vcsm library,
> > > so applications don't care.
> > > We've also got some legacy code kicking around, as there was
> > > originally a version of the driver that mapped the VPU's memory blocks
> > > to the ARM. That's why the vcsm library has two code paths through
> > > almost every function - one for each driver.
> > >
> > > Laurent: What's your view? Halt the review this particular patch for
> > > now and rework, or try and get this all integrated?
> > > Mainline obviously already has dma-buf heaps merged, whilst I have a
> > > PR cherry-picking it back into our downstream 5.4. The main reason it
> > > hasn't been merged is that I haven't had a test case to prove it
> > > works. The rework should be relatively simple, but will need small
> > > updates to both libcamera and ISP driver.
> >
> > As months have passed, libcamera moved to allocate lens shading tables
> > using dma-buf heaps and the only user I can name of the vc-sm-cma
> > driver is the actual ISP, that needs to import the dmabuf pointing to
> > the lens shading maps with vc_sm_cma_import_dmabuf().
>
> You've also got vc04_services/vchiq-mmal/mmal-vchiq.c importing
> dmabufs, either from vb2_contig or imported from elsewhere when using
> VB2_MEMORY_DMABUF.

Of course. Re-looking at it, the lens-shading tables are allocated on
dmabuf heaps and the exported dmabuf fd passed with a custom control to the
ISP, which uses it to set a mmal port parameter. I got lost in the code
base at mmal-vchiq.c:port_parameter_set(), which receives a
struct bcm2835_isp_lens_shading which contains the dmabuf fd. I assume
it then maps it into the VPU memory to access the shading tables.

But of course buffer queueing to the ISP requires dmabuf importing in
the VPU, and that happens by 'submitting' a buffer to mmal-vchiq
vchiq_mmal_submit_buffer() which does that by calling
vc_sm_cma_import_dmabuf().

I hope I have a more clear idea of the two paths now.

>
> > Upstreaming the whole vc-sm-cma driver as it is for this single kAPI
> > seems a bit a no-go. Dave, what would you prefer here ? Should I
> > provide a minimal vc-sm-cam driver that only performs buffer importing
> > to support the ISP driver ? Is the buffer importing into VPU there to
> > stay or is its usage transitional and can be kept out of the next
> > submission of this series ?
>
> Both imports are here to stay as the VPU needs to be able to use those
> blocks of memory.
>

Of course. I was wondering if a fairly big component like vc-sma-cma
isn't too much for just importing, and reading further it seems like
this is a shared concern.

> This first iteration picked up a fair number of extraneous lumps (eg
> the caching calls).
> I got a reminder last week that I promised a reworked version of
> vc-sm-cma to you and I hadn't done it - sorry, juggling too many
> things. I'll get on it now, so nudge me if I haven't pushed it to you
> by the end of the week for your review.

Great, so I'll wait for news from your side

>
> We can trim it down significantly now that we have dma-heaps in and
> working. There's a niggle that the current dma-heaps are always cached
> on the ARM, but that just means that the user has to be careful to use
> DMA_BUF_IOCTL_SYNC correctly (which they should be doing anyway).

I am running what was meant to be a v2 of this series and I get a
complaint:
vc_sm_cma_import_dmabuf_internal: Expecting an uncached alias for dma_addr

When I read this paragraph from your email yesterday I immediately
thought "this should be the LSC table".

Debugging it further I found out it's actually a vb2 buffer. I have
reduced the list of patches in v2 compared to this long one, and I'm
probably left out something relevant :/
>
> Whilst waiting for that, the Unicam driver, and the prep work in
> mmal-vchiq could all be pushed first, and ideally as two independent
> patchsets as there are no inter-dependencies between them.

I could start sending out the unicam driver, yes.

Currently I'm a bit stuck not being able to receive frames from the
unicam driver. I see the buffers being returned by the ISR routine,
but I never get a buffer available notification in libcamera.

There's been a few changes to the downstream unicam driver (ie
requesting the VPU clock frequency) and I see the RPi mainline support
has moved forward quite a bit since v5.8. Are you aware of any trivial
change I might be missing that could cause this ?

Thanks
  j

>
>   Dave
>
> > Thanks
> >   j
> >
> > >
> > >   Dave
> > >
> > > [1] https://github.com/raspberrypi/userland/tree/master/host_applications/linux/libs/sm
> > >
> > > > Regards,
> > > > Nicolas
> > > >
