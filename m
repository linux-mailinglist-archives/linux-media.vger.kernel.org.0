Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61D8F254B09
	for <lists+linux-media@lfdr.de>; Thu, 27 Aug 2020 18:42:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726236AbgH0Qmo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Aug 2020 12:42:44 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:36803 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727111AbgH0Qmn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Aug 2020 12:42:43 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 60A28FF80A;
        Thu, 27 Aug 2020 16:42:38 +0000 (UTC)
Date:   Thu, 27 Aug 2020 18:46:24 +0200
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
Message-ID: <20200827164624.6lizqnjs5uewftrc@uno.localdomain>
References: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
 <20200504092611.9798-7-laurent.pinchart@ideasonboard.com>
 <4e42a593f16614e913613150a90e851acbfcaa8c.camel@suse.de>
 <CAPY8ntB3RCwzCzj+v0QEQp19f-X7tgfhFZ_DK3-LUiWXGK0eNA@mail.gmail.com>
 <20200824163952.t7hfri4ml4gjnddq@uno.localdomain>
 <CAPY8ntAmQxC4rTNsmfNb10XWR4bYHsMEPLei3c9Zdu00wr-_JQ@mail.gmail.com>
 <20200827103826.hm6ezuysgt5wtzj4@uno.localdomain>
 <CAPY8ntAmydTB-BrooV_yzJpTsMsarySXnZRk8hfs3RkvU3cxSw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntAmydTB-BrooV_yzJpTsMsarySXnZRk8hfs3RkvU3cxSw@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

On Thu, Aug 27, 2020 at 01:51:07PM +0100, Dave Stevenson wrote:
> On Thu, 27 Aug 2020 at 11:34, Jacopo Mondi <jacopo@jmondi.org> wrote:

[snip]

> > >
> > > We can trim it down significantly now that we have dma-heaps in and
> > > working. There's a niggle that the current dma-heaps are always cached
> > > on the ARM, but that just means that the user has to be careful to use
> > > DMA_BUF_IOCTL_SYNC correctly (which they should be doing anyway).
> >
> > I am running what was meant to be a v2 of this series and I get a
> > complaint:
> > vc_sm_cma_import_dmabuf_internal: Expecting an uncached alias for dma_addr
> >
> > When I read this paragraph from your email yesterday I immediately
> > thought "this should be the LSC table".
> >
> > Debugging it further I found out it's actually a vb2 buffer. I have
> > reduced the list of patches in v2 compared to this long one, and I'm
> > probably left out something relevant :/
>
> vb2 allocated by the ISP (VB2_MEMORY_MMAP), or from Unicam that is
> then imported into the ISP (VB2_MEMORY_DMABUF)?
>
> The former is the dma-ranges being incorrectly set, and the reason for
> the patch where VCHIQ children inherit the parent's dma config. It's
> possible something else has changed in the setup since.

Re-introducing those two patches which I left out yesterday waiting
for more comments made the warning go away, so I presume that was
memory allocated on the ISP, exported as dmabuf by libcamera, and then
re-imported in the video device (that's what our FrameBufferAllocator
does, and I was testing with 'cam' which uses that class to reserve
memory per-stream).

I have a discussion open with Phil and Nicolas to see how those two
patches might be made upstream consumable, but I'll remember to keep
them in when testing.

>
> The latter is likely to be more involved and depend on what actually
> allocated it (which may mean I'm using the wrong API calls).
> I'm getting the dma address via sg_dma_address having attached and
> mapped the dmabuf. I'm expecting that dma address to therefore follow
> the dma-ranges of my device (not the allocator), but I'm not 100%
> certain that is what does happen.
>
> A few more details of what exactly the use case that triggers it would
> be useful.
>
> > >
> > > Whilst waiting for that, the Unicam driver, and the prep work in
> > > mmal-vchiq could all be pushed first, and ideally as two independent
> > > patchsets as there are no inter-dependencies between them.
> >
> > I could start sending out the unicam driver, yes.
> >
> > Currently I'm a bit stuck not being able to receive frames from the
> > unicam driver. I see the buffers being returned by the ISR routine,
> > but I never get a buffer available notification in libcamera.
> >
> > There's been a few changes to the downstream unicam driver (ie
> > requesting the VPU clock frequency) and I see the RPi mainline support
> > has moved forward quite a bit since v5.8. Are you aware of any trivial
> > change I might be missing that could cause this ?
>
> Things never stand still!

Isn't it great ? :D

> Requesting the VPU clock is to avoid a FIFO overflow.
> We've gained pixel format support (with defines and docs) for Y12P and Y14P.
> And hopefully I fixed up all the review comments from v1.

Do you think it's worth upstreaming those parts in v2 or should it be
done on top ? I should check if the VPU clock is exposed or not in
mainline first...

>
> It's hard to guess why libcamera isn't happy if we're getting ISRs. We
> do need to get the appropriate flags in the ISR for frame end (FEI or
> PI0).
> Is this Pi3 or Pi4 that you're testing on? Pi3 support should be sound
> on mainline. AFAIK Pi4 is still a work in progress.
> Can you stream just using v4l2-ctl --stream-mmap=3 --stream-count=1000
> --stream-to=/dev/null ? That should work with /dev/video0. Getting the
> embedded data is more involved over the ordering of opening and
> starting streaming on the nodes.

It's a Pi4.

After a pleasant day of debugging I got a nice trace that shows me
that it's actually the buffer importing part that hangs on a completion
in vc_sm_cma_vchi_import.

In mainline the whole vchi interface got dropped and I got to port the
vc-sma-cma driver to use the vchiq interface directly. I might have
screwed something up and I'm now looking suspiciously at this thread
function: "vc_sm_cma_vchi_videocore_io()" (also because I had to move it
to use msg_hold+msg_release, as peek+remove was killed by:
b5f1547b6e3bd ("staging: vchi: Get rid of vchi_msg_peek()")

I'll look into that again.

In the meantime is there any chance this rings any bell to you?
https://paste.debian.net/1161469/

Thanks
   j

>
> (We do have an open issue regarding getting the correct DMA address
> for Unicam on PI0 & 1. Those share the L2 cache for many things so
> dma-ranges is set differently, and not in a way that currently works
> with the Unicam driver. That one may need a followup fix.)
>
>   Dave
>
