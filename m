Return-Path: <linux-media+bounces-20450-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D58A39B3954
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 19:39:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94D732813F9
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 18:39:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C52EA1DF99D;
	Mon, 28 Oct 2024 18:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GCzfLhIl"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D3B1DF972
	for <linux-media@vger.kernel.org>; Mon, 28 Oct 2024 18:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730140788; cv=none; b=T375a8ZSdFJcJt6gWPngHCVfe1hZ8r+iyHAhgexvrksEReIa/FLBdXIObt19nmhZHo5qANIl7mN0dpnSawmCSO7Govlm/3OHABH+x8Ndj4oDhaqSzAqPFREZwrVhBtKuJim+Pfafhj09k/BXhIna9f0pnNOVTKU+FxSIox+FEZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730140788; c=relaxed/simple;
	bh=I5qIft6DYAKUgIUHfP0a9YCpsIU5Gha4Yfk69ZkhokI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AIBqti3o0NVer7FOX9sQ5ZzX7xnBsY0jYyMad4SnXPoAlRkIgpVfh66NElFmGe15S3vAH/uAgHxz/1fwOLQyiOQ5X/5x7lhjMkdX54dNq+pLrx2KNmuh54OpJekbyu6vvqYpNGdK47NRxFsC3we+OZcQgCWIwE040oxwIhld2Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GCzfLhIl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 591C9641;
	Mon, 28 Oct 2024 19:39:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730140780;
	bh=I5qIft6DYAKUgIUHfP0a9YCpsIU5Gha4Yfk69ZkhokI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GCzfLhIlmNgP2hNALJZkgNJfogRd/C/ImqmVoiLPwciq4oIb72taIWILj6iQktcs+
	 TDWIndZ/LHDHuuFBF/wmUjRqt/IRwVQo2WOpo4xGDNeOTSpBmYie4p3YUencaQpK8P
	 ejf1Go/iyM4y6VAMBv27XSwFoHkvgS0hE7x0ugH4=
Date: Mon, 28 Oct 2024 20:39:36 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	"open list:ROCKCHIP ISP V1 DRIVER" <linux-media@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	"open list:ROCKCHIP ISP V1 DRIVER" <linux-rockchip@lists.infradead.org>,
	Adam Pigg <adam@piggz.co.uk>
Subject: Re: [PATCH v2] media: rkisp1: Reduce min_queued_buffers to 0
Message-ID: <20241028183936.GF26852@pendragon.ideasonboard.com>
References: <20241028143553.36704-1-jacopo.mondi@ideasonboard.com>
 <392682fd-3325-41ab-825d-67cb3de4c7b2@xs4all.nl>
 <ncxqnajjdty456w6wsk5sonjuk3e2uzvcse7bdmmmmk4lop5i2@73vuqxkol4nr>
 <6fcbb221-2b28-4fd2-8466-8c3aa711edb2@xs4all.nl>
 <20241028162141.GA26852@pendragon.ideasonboard.com>
 <j4va4obettev3q6t3woojmh7lknomicei7urgxm77ammnmdzdb@54zmlbbvspvd>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <j4va4obettev3q6t3woojmh7lknomicei7urgxm77ammnmdzdb@54zmlbbvspvd>

On Mon, Oct 28, 2024 at 06:08:18PM +0100, Jacopo Mondi wrote:
> On Mon, Oct 28, 2024 at 06:21:41PM +0200, Laurent Pinchart wrote:
> > On Mon, Oct 28, 2024 at 04:48:55PM +0100, Hans Verkuil wrote:
> > > On 28/10/2024 16:30, Jacopo Mondi wrote:
> > > > On Mon, Oct 28, 2024 at 04:02:13PM +0100, Hans Verkuil wrote:
> > > >> On 28/10/2024 15:35, Jacopo Mondi wrote:
> > > >>> There apparently is no reason to require 3 queued buffers to call
> > > >>> streamon() for the RkISP1 as the driver operates with a scratch buffer
> > > >>> where frames can be directed to if there's no available buffer provided
> > > >>> by userspace.
> > > >>>
> > > >>> Reduce the number of required buffers to 0 to allow applications to
> > > >>> operate by queueing capture buffers on-demand.
> > > >>>
> > > >>> Tested with libcamera, by operating with a single capture request. The
> > > >>> same request (and associated capture buffer) gets recycled once
> > > >>> completed. This of course causes a frame rate drop but doesn't hinder
> > > >>> operations.
> > > >>>
> > > >>> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > >>> ---
> > > >>> The first version of this patch set min_queued_buffers to 1, but setting it
> > > >>> to 0 doesn't compromise operations and it's even better as it allows application
> > > >>> to queue buffers to the capture devices on-demand. If a buffer is not provided
> > > >>> to the DMA engines, image data gets directed to the driver's internal scratch
> > > >>> buffer.
> > > >>> ---
> > > >>>  drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c | 4 +---
> > > >>>  1 file changed, 1 insertion(+), 3 deletions(-)
> > > >>>
> > > >>> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> > > >>> index 2bddb4fa8a5c..5fcf9731f41b 100644
> > > >>> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> > > >>> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> > > >>> @@ -35,8 +35,6 @@
> > > >>>  #define RKISP1_SP_DEV_NAME	RKISP1_DRIVER_NAME "_selfpath"
> > > >>>  #define RKISP1_MP_DEV_NAME	RKISP1_DRIVER_NAME "_mainpath"
> > > >>>
> > > >>> -#define RKISP1_MIN_BUFFERS_NEEDED 3
> > > >>> -
> > > >>>  enum rkisp1_plane {
> > > >>>  	RKISP1_PLANE_Y	= 0,
> > > >>>  	RKISP1_PLANE_CB	= 1,
> > > >>> @@ -1563,7 +1561,7 @@ static int rkisp1_register_capture(struct rkisp1_capture *cap)
> > > >>>  	q->ops = &rkisp1_vb2_ops;
> > > >>>  	q->mem_ops = &vb2_dma_contig_memops;
> > > >>>  	q->buf_struct_size = sizeof(struct rkisp1_buffer);
> > > >>> -	q->min_queued_buffers = RKISP1_MIN_BUFFERS_NEEDED;
> > > >>> +	q->min_queued_buffers = 0;
> > > >>
> > > >> You can probably just drop this since the vb2_queue struct is zeroed when it
> > > >> is allocated. So no need to set it to 0.
> > > >
> > > > I suspected so :)
> > > >
> > > >>
> > > >> And is the RKISP1_MIN_BUFFERS_NEEDED define still needed after this change?
> > > >
> > > > No, and this patch removes it in facts
> > > >
> > > >  -#define RKISP1_MIN_BUFFERS_NEEDED 3
> > > >  -
> > >
> > > I should have checked the patch :-) Sorry for the noise.
> > >
> > > >>
> > > >> Also, see my RFC I posted today:
> > > >>
> > > >> https://lore.kernel.org/linux-media/126cd76a-6224-483b-a18d-a3cc89e5ff2d@xs4all.nl/T/#u
> > > >>
> > > >> My main concern is that applications that just call VIDIOC_REQBUFS with count = 1
> > > >> and expect the driver to change that to a workable value, will, in fact, now just get
> > > >> one buffer. And streaming that will cause lots of frame drops.
> > > >>
> > > >> It makes sense to leave min_queued_buffers at 0 if a scratch buffer is available,
> > > >> but I'm unhappy with the fact that you get a poor experience when REQBUFS(1) is called.
> > > >
> > > > Yeah, I've read the discussion between you and Tomi and it seemed like
> > > > a good time to re-send this patch.
> > > >
> > > >> My RFC suggests improvements in the uAPI. With that in place you can use CREATE_BUFS in
> > > >> libcamera to get much better control over how many buffers should be allocated.
> > > >
> > > > In my understanding min_queued_buffers identifies how many buffers
> > > > should be queued before calling start_streaming, and this comes
> > > > directly from an hw/driver requirement. This doesn't mean that at
> > > > least min_queue_buffers should be queued at all the times during
> > > > streaming, at least, I don't see how and where videobuf2 enforces
> > > > this. Or does it ?
> > >
> > > It's an intrinsic property of the HW/driver: e.g. if it needs two buffers
> > > queued up for the DMA engine to work, then it really is always holding on
> > > to two buffers. The only thing the framework does is postpone calling
> > > start_streaming until that number of buffers is queued to ensure the
> > > DMA engine has what it needs to start. But after that vb2 doesn't check
> > > it.
> >
> > The "driver" part of "HW/driver" is important here, as drivers can
> > influence this in multiple ways. One of them is usage of scratch
> > buffers, but even without that, a DMA engine that requires two buffers
> > can easily be operated with a single buffer by programming the DMA
> > engine with the same buffer address twice. Drivers should really do so
> > unless they really can't.
> >
> > > > If the above is correct, then the number of buffers to be queued
> > > > during streaming is, in my opinion, less an hw/driver requirement but
> > > > more an application decision.
> > >
> > > No, min_queued_buffers is a HW/drivers property: the DMA engine can't
> > > start until that many buffers are queued up, and once it is started
> > > it will always hold on to that many buffers.
> 
> I get it, my point was that once start_streaming has been called, even
> if min_queued_buffers=2, there is nothing preventing userspace from
> queing one buffer at the time once the first two have completed. Sure, the
> hw/driver might not like it, but while delaying start_streaming
> prevents bad things from happening, there is nothing in the core that
> prevents applications from potentially stalling the capture
> operations.
> 
> But I get your point, if the system needs 2 buffers to start
> streaming, it will probably need two buffers to continue producing
> frames.
> 
> > That's not always true. The imx7-media-csi driver, for instance, sets
> > min_queued_buffers to 2, but allocates scratch buffers and uses them at
> > runtime, so that it can return all queued buffers to userspace.
> 
> That's interesting. From your mention of "scratch buffers" I get there
> actually is a need to have 2 buffers queued to the HW ? How does
> that work, after all queuing a buffer to the DMA engine usually means
> pointing its write engine to one (set of) addresses.
> 
> Or is it a driver-only requirement to ask for two buffers ?

The hardware has a ping-pong mechanism with two addresses and switches
between them automatically.

> > Grepping for min_queued_buffers I see drivers setting it to 4
> > (rcar-dma.c, rzg2l-video.c), 6 (cxusb-analog.c) or even 9
> > (zoran_driver.c) ! I doubt the zoran driver holds on to 9 buffers at
> > runtime. Your statement is not universally true today?.
> >
> > This could be considered as driver issues, and the min_queued_buffers
> > values should be fixed to match the runtime behaviour. In some cases I
> > expect it will require more work than just changing the value, as
> > drivers may implement the logic to operate with less buffers at runtime
> > but not at start time. This would be fixable, but it may also call for
> > asking if the start at runtime behaviours need to be identical.
> >
> > > So the application has to know somehow how many buffers are needed to
> > > actually stream. One way is via VIDIOC_REQBUFS since that is supposed to
> > > always return a workable number of buffers, the other is by actually
> > > reporting the minimum number of buffers as per my RFC.
> > >
> > > > As you said an application should be good with> 3 buffers (one queued, one currently being written to, one to be
> > > > consumed by the application), but in very specific cases where an
> > > > application retains the buffer for longer, for whatever reason, it
> > > > might need a larger number of queued buffers to provide the DMA
> > > > engines a space where to write data without them being discarded (to
> > > > scratch buffers or discarded by the DMA engine itself, if the HW
> > > > supports that). Or maybe an application is fine to drop frames and
> > > > only queue buffers sporadically (if the HW supports that ofc).
> > > >
> > > > For libcamera, and for this specific platform in particular, we're
> > > > going to base new developments on the assumption that
> > > > min_queued_buffers == 0, and it would be more convenient for use to be
> > > > able to access its value from userspace to identify if we're running
> > > > on a kernel with or without this patch being applied.
> > >
> > > So my proposal in my RFC to expose min_num_buffers would work for libcamera?
> > > It sounds like that's what you need.
> 
> My immediate need is to know if I'm running on a "legacy" version of
> this driver that still requires 3 buffers for no apparent reason, or
> on a new version. Your proposal might work, but I still feel like we
> should report the HW/driver requirement (min_queued_buffers) instead
> of trying to suggest applications how many buffers they need to
> allocate to get "smooth streaming" or similar, as the use cases
> might be different.
> 
> > It may be useful, but I think we may also just require min_num_buffers
> > == 0 for a device to be supported in libcamera. We have to implement
> 
> While I concur this would be ideal, how would it work for existing
> rkisp1 implementation that do not include this patch ? libcamera
> should be able to run on both, probably in two different "modes" /o\

A simple option is to check the kernel version, we do that in a few
places. Over time we'll increase the minimum kernel version and drop
support for legacy APIs.

> > APIs such as the Android camera HAL that has no concept of buffers being
> > kept by the device. This could possibly be handled within libcamera by
> > allocating scratch buffers in userspace, but that comes with other
> > challenges. I would like to at least try to get help from the kernel
> > until proven that it's a bad idea.

-- 
Regards,

Laurent Pinchart

