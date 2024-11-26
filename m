Return-Path: <linux-media+bounces-22109-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0E49D9C53
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 18:22:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 015F5284092
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 17:22:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0D0A1DB522;
	Tue, 26 Nov 2024 17:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CBKeWU3T"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CB81AC8A6;
	Tue, 26 Nov 2024 17:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732641739; cv=none; b=c+Hz4L9z8HRcmU+jBJqbZh0oYZahOG8Ol6F5fpLcRNU3Oky1jm4G74vwQvtYac8JPeQL0coJSQlKFX+BWrMENgVEJv0ILj4xSwyEP88v/thzgl70/RPzmM+LFmSjjy0KpIrOFNVUzFJmjf+9rMGBt8Lvw0owUvgAfYguJsnVCGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732641739; c=relaxed/simple;
	bh=01MOoRABI36rcPowWn+OQTFEyfdWSSBHJ9oDYyKK5tU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=liev0Q5ZKP07wVBv8pgrOKYdCGGNMv+FUf6XlrjjhGJ6+6iWt2hWmOX7+Z4+zahsrafLwo/hp5zhbHT/OZ7WGA1XilpgH3Y1nF396QIJcHayLvCNbQorO3f/qd8hNvBwAqpPqVnvR+2gnQJb5krcavtl4Yc8qfLfxQizJS8WK2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CBKeWU3T; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 19F3D526;
	Tue, 26 Nov 2024 18:21:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732641713;
	bh=01MOoRABI36rcPowWn+OQTFEyfdWSSBHJ9oDYyKK5tU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CBKeWU3TGzotOgHCXTJBkjerL0a/jgrtTAZm3/ZZ+1WkEVd4ATEpzpmVzOntV1OMe
	 YXQj4FJULHCNEknKZETdhBpIbdAAsDUW688wYxYMv10TC4WjXj/IqXKkxJPRWIepZ0
	 6SF3nwqCJ3ZW1dvWUevyL3oTGehBDncOkI8q+cVg=
Date: Tue, 26 Nov 2024 19:22:05 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	Yunke Cao <yunkec@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v2 0/6] media: uvcvideo: Implement the Privacy GPIO as a
 subdevice
Message-ID: <20241126172205.GK5461@pendragon.ideasonboard.com>
References: <20241108-uvc-subdev-v2-0-85d8a051a3d3@chromium.org>
 <5b5f3bb7-7933-4861-be81-30345e333395@redhat.com>
 <CANiDSCta62P5+1aR9Ks8c6sd3_grCV3C+Le=UjKGkiohyf0R2g@mail.gmail.com>
 <55c76c99-dc86-41b2-84c6-d2e844530f67@redhat.com>
 <20241125124942.GA32280@pendragon.ideasonboard.com>
 <d240ed2e-9675-425c-acef-92ad7f5127ef@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d240ed2e-9675-425c-acef-92ad7f5127ef@redhat.com>

On Mon, Nov 25, 2024 at 02:29:51PM +0100, Hans de Goede wrote:
> On 25-Nov-24 1:49 PM, Laurent Pinchart wrote:
> > On Mon, Nov 25, 2024 at 01:25:41PM +0100, Hans de Goede wrote:
> 
> <snip>
> 
> >> I see 2 ways of doing that:
> >>
> >> 1. Use pm_runtime_set_autosuspend_delay() with a delay of say 1 second
> >> and then on set_ctrl do a pm_runtime_get_sync() +
> >> pm_runtime_put_autosuspend() giving the camera 1 second to finish
> >> applying the async ctrl (which might not be enough for e.g homing) +
> >> also avoid doing suspend + resume all the time if multiple ctrls are send
> >>
> >> 2. Instead of immediately powering on the camera on /dev/video# open
> >> track per fh if the camera has been powered on and then on the first
> >> set-ctrl, or the first other IOCTL like try/set-fmt which requires
> >> the camera to be powered on power it up and then keep it on until
> >> the fh is closed, since apps hitting these paths are likely to do
> >> more stuff which requires the camera to be powered on.
> > 
> > A mode of operation where a userspace action causes a state change and
> > the only way to change back to the previous state is to close the device
> > often leads to problems. I'd rather not do this unless we have to
> > completely rule out all other options.
> 
> But we already have that today. We already do the usb_autopm_get_interface()
> as soon as /dev/video# gets opened and the only way to undo it is to close
> /dev/video#.

Yes, but close() is the counterpart of open(). Breaking the symmetry is
what bothers me, it's not nice from an application point of view. It
wouldn't force instance have solved the issue of keeping the device
powered when used through libcamera (or anything else that keeps the
device node open after using the camera, or just after querying some of
its capabilities through TRY_FMT).

> What I'm suggesting is to no longer do the usb_autopm_get_interface()
> on all opens, but only on some.
> 
> Where "some" are the ones where we come to the conclusion that we actually
> need to power-up the USB-bus / interface because we want to talk to
> the device.
> 
> IOW delay the usb_autopm_get_interface() until the first action which
> actually requires it.
> 
> This should be a very minimal change from the pov of USB interactions
> with the actual device, so a small change of regressions while at
> least not powering on the device during udev discovery.
> 
> I guess one could argue that the cases where this is a win are so
> small that this is not worth it.

Is there a significant enough gain through this approach, and are the
other approaches impractical ? If so we can consider this.

-- 
Regards,

Laurent Pinchart

