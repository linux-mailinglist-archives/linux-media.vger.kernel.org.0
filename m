Return-Path: <linux-media+bounces-9938-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5238AE73B
	for <lists+linux-media@lfdr.de>; Tue, 23 Apr 2024 15:01:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCF7C28B20C
	for <lists+linux-media@lfdr.de>; Tue, 23 Apr 2024 13:01:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D65B130AC4;
	Tue, 23 Apr 2024 12:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="scf0Cq+Z"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9464612D1FE
	for <linux-media@vger.kernel.org>; Tue, 23 Apr 2024 12:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713877197; cv=none; b=FtAKpIMmAFIBznITII/VgdH+olsFsL9+WXJw8itHrJqIzvD1SVUXEGprfqLqKNcAhAbW1K2jNK22qi1mU3sAftaGnjZgEjtJ0MHIL+6mD8q/pkxDvGfwsc0Cd82ILHzg2OrH1RtPhjIjorm2qqTn6aTgO4DWjbGjH71SZD+cijg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713877197; c=relaxed/simple;
	bh=tIvyqWk5aHW3X/tUvKkZ9XKurpupBgip2ttfxiznR24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L5YSJiXPV5ljaQlSaVu5UP5IYtr0ZlAtv0N2PjUyQempSfpNbImn2TWc5sll42fQZzg9Mfc9hFDhS/XcQm2cgcfPTTbpGlo6+R0zp5sAzbPaIISLDuzGYRlNtzjSqNZvW43gd7zHGPMtWiAIV10SvVLTq3DmTOfEiYtxIZVGY2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=scf0Cq+Z; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (85-76-77-173-nat.elisa-mobile.fi [85.76.77.173])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E45761A2;
	Tue, 23 Apr 2024 14:59:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713877142;
	bh=tIvyqWk5aHW3X/tUvKkZ9XKurpupBgip2ttfxiznR24=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=scf0Cq+Zd4A1IToe9CXT6bWPUvUJiP1mlRoGBCZN1TJq6nOEHOq4ZRL81X8d3l/Wl
	 9+TBWNCkup9DloWxcJnRPvxi5YEmNd9z9dOlctM/kP9cPINJIhK/9sJ0DPlt+hqoXh
	 aShMizhfKB0g148NuIyPkmr2DEA1ldEABeASV2Vs=
Date: Tue, 23 Apr 2024 15:59:44 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v9 11/46] media: Documentation: Document S_ROUTING
 behaviour
Message-ID: <20240423125944.GF20623@pendragon.ideasonboard.com>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
 <20240416193319.778192-12-sakari.ailus@linux.intel.com>
 <20240419171720.GH6414@pendragon.ideasonboard.com>
 <ZieIhSomt1DcLKnZ@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZieIhSomt1DcLKnZ@kekkonen.localdomain>

Hi Sakari,

On Tue, Apr 23, 2024 at 10:08:05AM +0000, Sakari Ailus wrote:
> On Fri, Apr 19, 2024 at 08:17:20PM +0300, Laurent Pinchart wrote:
> > On Tue, Apr 16, 2024 at 10:32:44PM +0300, Sakari Ailus wrote:
> > > Document S_ROUTING behaviour for different devices.
> > > 
> > > Generally in devices that produce streams the streams are static and some
> > > can be enabled and disabled, whereas in devices that just transport them
> > > or write them to memory, more configurability is allowed. Document this.
> > > 
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > Reviewed-by: Julien Massot <julien.massot@collabora.com>
> > > ---
> > >  .../userspace-api/media/v4l/dev-subdev.rst    | 24 +++++++++++++++++++
> > >  1 file changed, 24 insertions(+)
> > > 
> > > diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > index d30dcb9e2537..de8dfd4f11a5 100644
> > > --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > @@ -593,6 +593,30 @@ Any configurations of a stream within a pad, such as format or selections,
> > >  are independent of similar configurations on other streams. This is
> > >  subject to change in the future.
> > >  
> > > +Device types and routing setup
> > > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > +
> > > +Different kinds of sub-devices have differing behaviour for route activation,
> > > +depending on the hardware. In all cases, however, only routes that have the
> > > +``V4L2_SUBDEV_STREAM_FL_ACTIVE`` flag set are active.
> > > +
> > > +Devices generating the streams may allow enabling and disabling some of the
> > > +routes or the configuration is fixed. If the routes can be disabled, not
> > 
> > "... some of the routes, or have a fixed routing configuration."
> 
> Seems fine.
> 
> > > +declaring the routes (or declaring them without
> > > +``VIDIOC_SUBDEV_STREAM_FL_ACTIVE`` flag set) in ``VIDIOC_SUBDEV_S_ROUTING`` will
> > > +disable the routes while the sub-device driver retains the streams and their
> > > +format and selection configuration.
> > 
> > I still find the "retains their format and selection configuration"
> > quite unclear :-S
> 
> Alternatively we could say that the routes are simply not active, without
> referring to explicitly to formats and selections. I.e.:
> 
> If the routes can be disabled, not declaring the routes (or declaring them
> without ``VIDIOC_SUBDEV_STREAM_FL_ACTIVE`` flag set) in
> ``VIDIOC_SUBDEV_S_ROUTING`` will disable the routes.

I'm fine with that.

> > > The ``VIDIOC_SUBDEV_S_ROUTING`` will still
> > 
> > s/will still/ioctl will still/
> 
> Both seem to exist, more common is without "ioctl":
> 
> $ git grep '[`<]VIDIOC_SUBDEV' -- Documentation/userspace-api/media/|wc -l
> 84
> $ git grep -i "VIDIOC_SUBDEV.*ioctl" -- Documentation/userspace-api/media/|wc -l
> 34

You'll often find "ioctl" at the beginning of the next line :-) If you
would like to avoid it, you should drop "The" at the beginning of the
sentence.

> > > +return such routes back to the user in the routes array, with the
> > > +``V4L2_SUBDEV_STREAM_FL_ACTIVE`` flag unset.
> > > +
> > > +Devices transporting the streams almost always have more configurability with
> > > +respect to routing. Typically any route between the sub-device's sink and source
> > > +pads is possible, and multiple routes (usually up to certain limited number) may
> > > +be active simultaneously. For such devices, no routes are created by the driver
> > > +and user-created routes are fully replaced when ``VIDIOC_SUBDEV_S_ROUTING`` is
> > > +called on the sub-device. Such newly created routes have the device's default
> > > +configuration for format and selection rectangles.
> > > +
> > >  Configuring streams
> > >  ^^^^^^^^^^^^^^^^^^^
> > >  

-- 
Regards,

Laurent Pinchart

