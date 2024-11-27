Return-Path: <linux-media+bounces-22148-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C07F9DA4F6
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 10:42:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2095FB26EE3
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 09:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65CD0194082;
	Wed, 27 Nov 2024 09:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XDVp8uGE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2223E13A888;
	Wed, 27 Nov 2024 09:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732700546; cv=none; b=X4getjTfMdUkif84Ujgx4qp1HB8sA+PyUA8oous2uO71e5jM20oD7qZGzxYsP72aoSQSvwe6oxymSZS6I2G3c3D3jvgxq9miW30PxK/SC3p0OzFk0VIhgq3q8dfAw8rAu7Kz0gqpwPNw4tWJYSZRbM//3THaAVLEZ0BrxyLm4OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732700546; c=relaxed/simple;
	bh=KWKEWa3UIXAu4vOfBjPfx5eH26k3SHJci83eJv2qTjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fBc92/rnSav9JZWDNnD/pBDhXtUhorqnLMS34Jsbf10QKa36Cw+001KHlAFFFOz5bwBO4X6260AQwCaVL2pTUozgBPUv4mTF3M8ekImlu8vKztFrVcDTfPe+/JNZgZYh3IVHoJ2Uui75vVApUsGYRBGIKWCgGv6tNLAtIExZ2HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XDVp8uGE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 69465792;
	Wed, 27 Nov 2024 10:42:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732700520;
	bh=KWKEWa3UIXAu4vOfBjPfx5eH26k3SHJci83eJv2qTjM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XDVp8uGE4wQ2KBiHmPVFjkiW5WbIV13n+VdsontCe4G/OJcQIni0zLsNHGvOZE7yY
	 c12GSVsxdHGj/sMHLcUYodVZaNVkPSKli5TMDIrowic2nciWMPaBySmTYIDbi43qIp
	 7tHm2twL3gPlSBzXX7JRZtBP/yGWfXzmNuAd1cVQ=
Date: Wed, 27 Nov 2024 11:42:12 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2] media: uvcvideo: Do not set an async control owned
 by other fh
Message-ID: <20241127094212.GF31095@pendragon.ideasonboard.com>
References: <20241127-uvc-fix-async-v1-0-eb8722531b8c@chromium.org>
 <20241127-uvc-fix-async-v1-1-eb8722531b8c@chromium.org>
 <20241127091153.GA31095@pendragon.ideasonboard.com>
 <CANiDSCs36Ndyjz52aYA0SHef8JVQc=FvtDNk8xQwR=30m652Gg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCs36Ndyjz52aYA0SHef8JVQc=FvtDNk8xQwR=30m652Gg@mail.gmail.com>

On Wed, Nov 27, 2024 at 10:25:48AM +0100, Ricardo Ribalda wrote:
> On Wed, 27 Nov 2024 at 10:12, Laurent Pinchart wrote:
> > On Wed, Nov 27, 2024 at 07:46:10AM +0000, Ricardo Ribalda wrote:
> > > If a file handle is waiting for a response from an async control, avoid
> > > that other file handle operate with it.
> > >
> > > Without this patch, the first file handle will never get the event
> > > associated to that operation.
> >
> > Please explain why that is an issue (both for the commit message and for
> > me, as I'm not sure what you're fixing here).
> 
> What about something like this:
> 
> Without this patch, the first file handle will never get the event
> associated with that operation, which can lead to endless loops in
> applications. Eg:
> If an application A wants to change the zoom and to know when the
> operation has completed:
> it will open the video node, subscribe to the zoom event, change the
> control and wait for zoom to finish.
> If before the zoom operation finishes, another application B changes
> the zoom, the first app A will loop forever.

So it's related to the userspace-visible behaviour, there are no issues
with this inside the kernel ?

Applications should in any case implement timeouts, as UVC devices are
fairly unreliable. What bothers me with this patch is that if the device
doesn't generate the event, ctrl->handle will never be reset to NULL,
and the control will never be settable again. I think the current
behaviour is a lesser evil.

> > What may be an issue is that ctrl->handle seem to be accessed from
> > different contexts without proper locking :-S
> 
> Isn't it always protected by ctrl_mutex?

Not that I can tell. At least uvc_ctrl_status_event_async() isn't called
with that lock held. uvc_ctrl_set() seems OK (a lockedep assert at the
beginning of the function wouldn't hurt).

As uvc_ctrl_status_event_async() is the URB completion handler, a
spinlock would be nicer than a mutex to protect ctrl->handle.

> > > Cc: stable@vger.kernel.org
> > > Fixes: e5225c820c05 ("media: uvcvideo: Send a control event when a Control Change interrupt arrives")
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > >  drivers/media/usb/uvc/uvc_ctrl.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > > index 4fe26e82e3d1..5d3a28edf7f0 100644
> > > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > > @@ -1950,6 +1950,10 @@ int uvc_ctrl_set(struct uvc_fh *handle,
> > >       if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR))
> > >               return -EACCES;
> > >
> > > +     /* Other file handle is waiting a response from this async control. */
> > > +     if (ctrl->handle && ctrl->handle != handle)
> > > +             return -EBUSY;
> > > +
> > >       /* Clamp out of range values. */
> > >       switch (mapping->v4l2_type) {
> > >       case V4L2_CTRL_TYPE_INTEGER:

-- 
Regards,

Laurent Pinchart

