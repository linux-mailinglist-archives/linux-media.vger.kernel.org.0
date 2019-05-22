Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38A232607C
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2019 11:29:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728608AbfEVJ3O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 May 2019 05:29:14 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:52367 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728406AbfEVJ3O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 May 2019 05:29:14 -0400
Received: from collins (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id E8B7B20000E;
        Wed, 22 May 2019 09:29:06 +0000 (UTC)
Message-ID: <0961169f7abbecbc0f8382f946bd37dc9bea8507.camel@bootlin.com>
Subject: Re: Proposed updates and guidelines for MPEG-2, H.264 and H.265
 stateless support
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>
Date:   Wed, 22 May 2019 11:29:13 +0200
In-Reply-To: <20190522083229.GB30938@ulmo>
References: <0be542fabc57c38596bdb1db44aead7054a89158.camel@bootlin.com>
         <3e0d6d5106e9c0c27ef4b11e64a488726ff77103.camel@ndufresne.ca>
         <39ded6d4ddf85849bf45abc94dc8e104fd4c0978.camel@bootlin.com>
         <20190521154358.GC7098@ulmo>
         <124db795c1ed77854be6c565092c2820776ac223.camel@ndufresne.ca>
         <CAAFQd5Cmv-CJAsQ7QdoEPYyCFLDjAJjFFLo8PMZT=zeOumnkmQ@mail.gmail.com>
         <20190522092924.116b212e@collabora.com> <20190522083229.GB30938@ulmo>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mercredi 22 mai 2019 à 10:32 +0200, Thierry Reding a écrit :
> On Wed, May 22, 2019 at 09:29:24AM +0200, Boris Brezillon wrote:
> > On Wed, 22 May 2019 15:39:37 +0900
> > Tomasz Figa <tfiga@chromium.org> wrote:
> > 
> > > > It would be premature to state that we are excluding. We are just
> > > > trying to find one format to get things upstream, and make sure we have
> > > > a plan how to extend it. Trying to support everything on the first try
> > > > is not going to work so well.
> > > > 
> > > > What is interesting to provide is how does you IP achieve multi-slice
> > > > decoding per frame. That's what we are studying on the RK/Hantro chip.
> > > > Typical questions are:
> > > > 
> > > >   1. Do all slices have to be contiguous in memory
> > > >   2. If 1., do you place start-code, AVC header or pass a seperate index to let the HW locate the start of each NAL ?
> > > >   3. Does the HW do support single interrupt per frame (RK3288 as an example does not, but RK3399 do)  
> > > 
> > > AFAICT, the bit about RK3288 isn't true. At least in our downstream
> > > driver that was created mostly by RK themselves, we've been assuming
> > > that the interrupt is for the complete frame, without any problems.
> > 
> > I confirm that's what happens when all slices forming a frame are packed
> > in a single output buffer: you only get one interrupt at the end of the
> > decoding process (in that case, when the frame is decoded). Of course,
> > if you split things up and do per-slice decoding instead (one slice per
> > buffer) you get an interrupt per slice, though I didn't manage to make
> > that work.
> > I get a DEC_BUFFER interrupt (AKA, "buffer is empty but frame is not
> > fully decoded") on the first slice and an ASO (Arbitrary Slice Ordering)
> > interrupt on the second slice, which makes me think some states are
> > reset between the 2 operations leading the engine to think that the
> > second slice is part of a new frame.
> 
> That sounds a lot like how this works on Tegra. My understanding is that
> for slice decoding you'd also get an interrupt every time a full slice
> has been decoded perhaps coupled with another "frame done" interrupt
> when the full frame has been decoded after the last slice.
> 
> In frame-level decode mode you don't get interrupts in between and
> instead only get the "frame done" interrupt. Unless something went wrong
> during decoding, in which case you also get an interrupt but with error
> flags and status registers that help determine what exactly happened.
> 
> > Anyway, it doesn't sound like a crazy idea to support both per-slice
> > and per-frame decoding and maybe have a way to expose what a
> > specific codec can do (through an extra cap mechanism).
> 
> Yeah, I think it makes sense to support both for devices that can do
> both. From what Nicolas said it may make sense for an application to
> want to do slice-level decoding if receiving a stream from the network
> and frame-level decoding if playing back from a local file. If a driver
> supports both, the application could detect that and choose the
> appropriate format.
> 
> It sounds to me like using different input formats for that would be a
> very natural way to describe it. Applications can already detect the set
> of supported input formats and set the format when they allocate buffers
> so that should work very nicely.

Pixel formats are indeed the natural way to go about this, but I have
some reservations in this case. Slices are the natural unit of video
streams, just like frames are to display hardware. Part of the pipeline
configuration is slice-specific, so in theory, the pipeline needs to be
reconfigured with each slice.

What we have been doing in Cedrus is to currently gather all the slices
and use the last slice's specific configuration for the pipeline, which
sort of works, but is very likely not a good idea.

You mentionned that the Tegra VPU currentyl always operates in frame
mode (even when the stream actually has multiple slices, which I assume
are gathered at some point). I wonder how it goes about configuring
different slice parameters (which are specific to each slice, not
frame) for the different slices. 

I believe we should at least always expose per-slice granularity in the
pixel format and requests. Maybe we could have a way to allow multiple
slices to be gathered in the source buffer and have a control slice
array for each request. In that case, we'd have a single request queued
for the series of slices, with a bit offset in each control to the
matching slice.

Then we could specify that such slices must be appended in a way that
suits most decoders that would have to operate per-frame (so we need to
figure this out) and worst case, we'll always have offsets in the
controls if we need to setup a bounce buffer in the driver because
things are not laid out the way we specified.

Then we introduce a specific cap to indicate which mode is supported
(per-slice and/or per-frame) and adapt our ffmpeg reference to be able
to operate in both modes.

That adds some complexity for userspace, but I don't think we can avoid
it at this point and it feels better than having two different pixel
formats (which would probably be even more complex to manage for
userspace).

What do you think?

> > The other option would be to support only per-slice decoding with a
> > mandatory START_FRAME/END_FRAME sequence to let drivers for HW that
> > only support per-frame decoding know when they should trigger the
> > decoding operation. The downside is that it implies having a bounce
> > buffer where the driver can pack slices to be decoded on the END_FRAME
> > event.
> 
> I vaguely remember that that's what the video codec abstraction does in
> Mesa/Gallium. 

Well, if it's exposed through VDPAU or VAAPI, the interface already
operates per-slice and it would certainly not be a big issue to change
that.

Talking about the mesa/gallium video decoding stuff, I think it would
be worth having V4L2 interfaces for that now that we have the Request
API.

Basically, Nvidia GPUs have video decoding blocks (which could be
similar to the ones present on Tegra) that are accessed through a
firmware running on a Falcon MCU on the GPU side.

Having a standardized firmware interface for these and a V4L2 M2M
driver for the interface would certainly make it easier for everyone to
handle that. I don't really see why these video decoding hardware has
to be exposed through the display stack anyway and one could want to
use the GPU's video decoder without bringing up the shading cores.

> I'm not very familiar with V4L2, but this seems like it
> could be problematic to integrate with the way that V4L2 works in
> general. Perhaps sending a special buffer (0 length or whatever) to mark
> the end of a frame would work. But this is probably something that
> others have already thought about, since slice-level decoding is what
> most people are using, hence there must already be a way for userspace
> to somehow synchronize input vs. output buffers. Or does this currently
> just work by queueing bitstream buffers as fast as possible and then
> dequeueing frame buffers as they become available?

We have a Request API mechanism where we group controls (parsed
bitstream meta-data) and source (OUTPUT) buffers together and submit
them tied. When each request gets processed its buffer enters the
OUTPUT queue, which gets picked up by the driver and associated with
the first destination (CAPTURE) buffer available. Then the driver grabs
the buffers and applies the controls matching the source buffer's
request before starting decoding with M2M.

We have already worked on handling the case of requiring a single
destination buffer for the different slices, by having a flag to
indicate whether the destination buffer should be held.

Cheers,

Paul

