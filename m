Return-Path: <linux-media+bounces-43712-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F46BB6326
	for <lists+linux-media@lfdr.de>; Fri, 03 Oct 2025 09:50:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB9933AC14F
	for <lists+linux-media@lfdr.de>; Fri,  3 Oct 2025 07:50:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27C6C25EFBE;
	Fri,  3 Oct 2025 07:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LNEpbdHO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB3825C809;
	Fri,  3 Oct 2025 07:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759477796; cv=none; b=j8KY6jqlG00I598N/i75zWTLlf+TGJfMoRVJS6LBRoDEqFrK3f97qcMZSDWUoFAUfavot2sfxYsjbRxKO40A3dfsF36Nlfhi/m8QQFJAoXu/8R9rriM4xrc6ZmAQ48tY/+uaRE1MRkHiGrmKcLMXAbRdJCyijiUdjpNVUHPXM8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759477796; c=relaxed/simple;
	bh=pcKHQ8N+3I6VBKLuDEZ1trChPzbscr0BS/hlauGrsSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m0L98KhahrwbWXNniQEoB53Z3AzgvM7cBMyGq/0LBYzjQ/oSqB1MKFitjL0nS+GZztBqgXipIubbBAhby1HzNe+gwF8SnugrsSWmT8+cjvkgcCR+zrxh27qBoXm1gAOfrVfD6NV4Lv5dExgTqZfayr65oasnAprP0PVON0YB908=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LNEpbdHO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CB8FE1340;
	Fri,  3 Oct 2025 09:48:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759477699;
	bh=pcKHQ8N+3I6VBKLuDEZ1trChPzbscr0BS/hlauGrsSg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LNEpbdHO0Yn8sPF49Rbvhl4tNr/MY5vXZNbKscA/nN46K4iZT6Zg/HMzwir1j/ql/
	 wO6yJ5k7fa1p0VMfIJzdH0/dwyPAwtX8AtmXaaCPMHvqvM2vnfvRX87DRflVvy+1m0
	 BegSE2DTTFIi3BEQCAungtD3uDmJbPjy+mXYkfRU=
Date: Fri, 3 Oct 2025 09:49:45 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Tomasz Figa <tfiga@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Hans Verkuil <hverkuil@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 06/26] media: v4l2-ioctl: Introduce VIDIOC_BIND_CONTEXT
Message-ID: <zossafa4bhkzjmyvrkbioyvtcaczw3sblagcfb3ojllv5xhiyl@zwz3stusdmty>
References: <20250717-multicontext-mainline-2025-v1-0-81ac18979c03@ideasonboard.com>
 <20250717-multicontext-mainline-2025-v1-6-81ac18979c03@ideasonboard.com>
 <b8e03fd2-3a44-48bb-8707-4aecabbbfd9c@collabora.com>
 <wkeizorbd2celujqgs63gzsk5nzsdtoabzg2ocdcsmg3djvl7u@hgh6ridrdwiy>
 <1ba4a5b3-abe8-4580-abf5-1e0fe19f9fb5@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1ba4a5b3-abe8-4580-abf5-1e0fe19f9fb5@collabora.com>

Hi Michael

On Fri, Oct 03, 2025 at 09:40:39AM +0200, Michael Riesch wrote:
> Hi Jacopo,
>
> On 10/2/25 10:48, Jacopo Mondi wrote:
> > Hi Michael
> >
> > On Wed, Oct 01, 2025 at 11:41:38PM +0200, Michael Riesch wrote:
> >> Hi Jacopo,
> >>
> >> On 7/17/25 12:45, Jacopo Mondi wrote:
> >>> Introduce a new ioctl in V4L2 to allocate a video device context and
> >>> associate it with a media device context.
> >>>
> >>> The ioctl is valid only if support for MEDIA_CONTROLLER is compiled in
> >>> as it calls into the entity ops to let driver allocate a new context and
> >>> binds the newly created context with the media context associated
> >>> with the file descriptor provided by userspace as the new ioctl
> >>> argument.
> >>
> >> I would have expected that the execution context of the video device
> >> already exists and is not allocated at ioctl call time. If I understand
> >
> > If userspace doesn't use contexts, why pre-allocate it ?
>
> This is more along the lines "if it keeps things simple, why not". But I
> am still diving into this and may have not gotten the complete picture yet.
>
> > See also below on the implications of using a context regardless of
> > userspace actions
> >
> >> it correctly
> >>
> >>  - after opening a video device, no context is allocated, but in
> >>    v4l2_fh_release the reference counter of the context is decreased.
> >>    This smells fishy. Note that the user may not call the ioctl.
> >
> > As far as I can see v4l2_fh_release() calls:
> >
> > void video_device_context_put(struct video_device_context *ctx)
> > {
> >        if (!ctx)
> >                return;
> >
> >        media_entity_context_put(&ctx->base);
> > }
> >
> > which is safe is !ctx
>
> Ack.
>
> >
> >>  - after opening a video device there is no context. This could imply
> >>    that two operating modes are required (with a context and without a
> >>    context), which would seem unnecessarily complex.
> >
> > You'll find out later on that I have introduced a default context for
> > this purpose
>
> Right, I'll check this out.
>
> >
> >>  - What happens if the VIDIOC_BIND_CONTEXT ioctl is called more than
> >>    once? (IIUC vfh->context gets overwritten but the old context is not
> >>    released)
> >
> > Do you mean:
> >
> > - Multiple file handles representing the same video device are bound
> >   multiple times to the same media device context ?
> >
> >   media_device_bind_context() called from v4l_bind_context() returns an error
> >
> > - An already bound video device fh is bound to (different) media
> >   device contexts ?
> >
> >   I should probably
> >
> >   if (vfh->context)
> >         return -EINVAL;
> >
> >   in v4l_bind_context()
> >
> >   As an already bound context cannot be re-bound. There currently is
> >   not un-binding mechanism, it is required to close a file handle to
> >   unbind.
>
> The latter. The check you proposed should do the trick.
>
> >> (Just found that a later patch introduces default contexts. Should this
> >> address the comments above, consider rearranging the patches so that
> >> default contexts are introduced first.)
> >
> > To be honest I don't see much difference. I'll see if it's practical
> > to do so or not.
> >
> >>
> >>> The newly allocated video context is then stored in the v4l2-fh that
> >>> represent the open file handle on which the ioctl has been called.
> >>
> >> Couldn't the same be achieved by
> >>  - v4l2_fh_open allocates a new context
> >>  - v4l2_fh_release releases it (already implemented)
> >>  - ioctl takes the existing context and binds it to the media device
> >>    context
> >> Then,
> >>  - open/release are symmetric and not fishy
> >
> > Why do you think video_device_context_put() is fishy ?
>
> Not the video_device_context_put itself, but I expected "open()
> allocates something, close() release that something". But apparently
> there is a good reason to deviate from that...
>
> >
> >>  - after open but before the ioctl call the user can safely operate on a
> >>    context
> >
> > If we always operate on a per-file-handle context even before binding
> > it, all the operations performed by an application, even it doesn't
> > use contexts, will be isolated from the rest of the world.
> >
> > This might seem desirable, but changes the semantic of all the v4l2
> > operations and an application that doesn't use context that runs on a
> > driver ported to use context will suddenly find all its configuration
> > to be transient and tied to the lifetime of an open file handle
> > instead of being device-persistent.
> >
> > Using a default, device-wise, default context allows instead existing
> > applications that do not use contexts to operate as they are used to,
> > with all the setting/configurations being stored in a persistent
> > place.
>
> ... and there it is. Did not have that in mind, thanks for pointing it out.
>

Please note there could be a way to handle what you proposed, by
unconditionally allocating a context at open() time and inspecting
its context->mdev_context field to decide if it has been bound or not,
instead of unconditionally directing operations to it.

I like symmetry as you do, but I'm still not bought on unconditionally
allocating a context at open() time.

> >
> > [...]
> >>>
> >>> +/*
> >>> + *     V I D E O   D E V I C E   C O N T E X T
> >>> + */
> >>> +
> >>> +struct v4l2_context {
> >>> +	__u32 context_fd;
> >>
> >> Reserve some space for the future?
> >>
> >
> > Might be a good idea. I can't tell how much space we should reserve
> > though :)
>
> Prediction is difficult, especially about the future. But having zero
> reserve sounds like something we could regret at some point down the
> road. __u32 reserved[3]; ?

Not opposed but to be honest I'm not aware of what the best practices
are here. Let's see what others think


>
> Best regards,
> Michael
>
> >
> >>> +};
> >>> +
> >>>  /*
> >>>   *	M E M O R Y - M A P P I N G   B U F F E R S
> >>>   */
> >>> @@ -2818,6 +2826,9 @@ struct v4l2_remove_buffers {
> >>>  #define VIDIOC_REMOVE_BUFS	_IOWR('V', 104, struct v4l2_remove_buffers)
> >>>
> >>>
> >>> +/* Context handling */
> >>> +#define VIDIOC_BIND_CONTEXT	_IOW('V', 105, struct v4l2_context)
> >>> +
> >>>  /* Reminder: when adding new ioctls please add support for them to
> >>>     drivers/media/v4l2-core/v4l2-compat-ioctl32.c as well! */
> >>>
> >>>
> >>
> >> Best regards,
> >> Michael
> >>
>

