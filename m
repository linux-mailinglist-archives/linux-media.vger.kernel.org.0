Return-Path: <linux-media+bounces-26132-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3BAA35195
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2025 23:50:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C1D33AE0F0
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2025 22:50:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB2C422D7BD;
	Thu, 13 Feb 2025 22:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rW8FLU6e"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB144281362
	for <linux-media@vger.kernel.org>; Thu, 13 Feb 2025 22:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739486855; cv=none; b=LtWmv/VmJzRk9NZw3LPXkc4CT43SHVkgvbISZK9r87yZxWoZbL2dnAnkM4wILpKn9RtsMZUEjW5gEdBJp0yPp8qaxHl7G9T6c+7Zh5tTXxhVtB5ePWq5kKCsBdu0JWlXATl7cc0lIg1U+vGMAfUBvv4FkDv3ejVt0pLksNefBo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739486855; c=relaxed/simple;
	bh=RbIXx38oAshIaGY9VxMJCNdu/YfIjlroHuRfZy7eZrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NzQ1KcsmR/k4bniNLEfqNPAM9IH4fvHiXQpR0FQmpl9cHpG0OTjS40hNibvFuC6/wgonK3TYYBxCOBvmMofwU25reXWcYfHS0q/uCKmcUF48pa9REC7CcJ5j+HTyBd4ALVExSxLd0hSc5z7jGI2EmGKZaut17H3GwqMsh1Zulvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rW8FLU6e; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B4891594;
	Thu, 13 Feb 2025 23:46:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739486771;
	bh=RbIXx38oAshIaGY9VxMJCNdu/YfIjlroHuRfZy7eZrw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rW8FLU6eICjvy00mwArx/WdOPuGdpNU7JfG0+0D6Lr736ZaJbAE00aPXjYFdtxsI2
	 1FSHgb+EVliqIKrms7CudN4S5noQMZTbPHU23NhWzI54yZDmAQPRB8kEoT4A9DwD8h
	 l5iJfhcf7j5BEa1mFX05suVUpjnCjQlCZAV10zw0=
Date: Fri, 14 Feb 2025 00:47:18 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>
Subject: Re: [RFC 4/4] media: v4l: ctrl: Add V4L2_CID_CONFIG_MODEL control
Message-ID: <20250213224718.GD27260@pendragon.ideasonboard.com>
References: <20241011075535.588140-1-sakari.ailus@linux.intel.com>
 <20241011075535.588140-5-sakari.ailus@linux.intel.com>
 <137d5e38-b9fd-4274-8877-e5f71365242c@xs4all.nl>
 <ZzRkwVlNLzXQmWoK@kekkonen.localdomain>
 <846db937-9445-4f5c-b8fe-7c973522a3a1@xs4all.nl>
 <20241118024002.GJ31681@pendragon.ideasonboard.com>
 <Z6sK5oTiwez5brwk@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z6sK5oTiwez5brwk@kekkonen.localdomain>

On Tue, Feb 11, 2025 at 08:31:34AM +0000, Sakari Ailus wrote:
> On Mon, Nov 18, 2024 at 04:40:02AM +0200, Laurent Pinchart wrote:
> > On Wed, Nov 13, 2024 at 01:26:26PM +0100, Hans Verkuil wrote:
> > > On 11/13/24 09:35, Sakari Ailus wrote:
> > > > On Wed, Nov 13, 2024 at 09:03:57AM +0100, Hans Verkuil wrote:
> > > >> On 11/10/2024 09:55, Sakari Ailus wrote:
> > > >>> Add the V4L2_CID_CONFIG_MODEL control for the configuration model.
> > > >>>
> > > >>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > >>> ---
> > > >>>  .../userspace-api/media/v4l/ext-ctrls-image-process.rst      | 4 ++++
> > > >>>  .../userspace-api/media/v4l/subdev-config-model.rst          | 2 ++
> > > >>>  drivers/media/v4l2-core/v4l2-ctrls-defs.c                    | 5 +++++
> > > >>>  include/uapi/linux/v4l2-controls.h                           | 3 +++
> > > >>>  4 files changed, 14 insertions(+)
> > > >>>
> > > >>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> > > >>> index 27803dca8d3e..928e8e3eed7f 100644
> > > >>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> > > >>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> > > >>> @@ -55,3 +55,7 @@ Image Process Control IDs
> > > >>>      control value divided by e.g. 0x100, meaning that to get no
> > > >>>      digital gain the control value needs to be 0x100. The no-gain
> > > >>>      configuration is also typically the default.
> > > >>> +
> > > >>> +``V4L2_CID_CONFIG_MODEL (bitmask)``
> > > >>> +    Which configuration models the sub-device supports. Please see
> > > >>> +    :ref:`media_subdev_config_model`.
> > > >>
> > > >> First of all the naming is confusing: since this is specific to sub-devices, it
> > > >> should at least have 'SUBDEV' in the name. I first thought this reported the
> > > > 
> > > > I don't object in principle, but the reason why I didn't add that in v1 was
> > > > the names would get quite long. Maybe V4L2_CID_SUBDEV_CFG_MODEL?
> > > > 
> > > >> model name or something like that, I'm not sure "configuration model" is a very
> > > >> good name.
> > > > 
> > > > Feel free to propose a different one. :-)
> > > 
> > > I would, if I understood what you intend to achieve :-)
> > 
> > I'll try to rephrase what Sakari wrote in the patches.
> > 
> > The V4L2 specification defines a subdev API that exposes three type of
> > configuration elements: formats, selection rectangles and controls. The
> > specification contains generic information about how those configuration
> > elements behave, but not precisly how they apply to particular hardware
> > features. We leave some leeway to drivers to decide how to map selection
> > rectangles to device features, as long as they comply with the V4L2
> > specification. This is needed, as hardware features differ between
> > devices, so it's the driver's responsibility to handle this mapping.
> > 
> > Unfortunately, this lack of clearly defined mapping in the specification
> > has led to different drivers mapping the same hardware features to
> > different API elements, or implementing the API elements with slightly
> > different behaviours. Furthermore, many drivers have implemented
> > selection rectangles in ways that do not comply with the V4L2
> > specification. All of this makes userspace development difficult.
> > 
> > We can't define precisely how all configuration elements apply to
> > hardware features in a way that applies to all devices, as devices
> > differ widely. We can however develop such precise definitions for
> > classes of similar devices. In order to develop generic userspace code,
> > we then need a way for subdevs to indicate which class they belong to.
> > This is what the configuration model control does. The configuration
> > model tells userspace which section of the V4L2 specification defines
> > the precise behaviour of the device.
> > 
> > One example of how drivers implement features in different ways is
> > skipping and binning. Some sensor drivers use selection rectangles,
> > other just formats.
> 
> I'll use this text, with some modifications, in the documentation of
> sub-device configuration models.
> 
> > > >> Secondly, is this supposed to be valid for all subdevices? Only for sensors?
> > > >> Would an HDMI-to-CSI bridge qualify?
> > > > 
> > > > I think it could but we should have a use case for it. In other words,
> > > > something we can't reasonably express using existing means. In this case
> > > > it's a number of interfaces and device type specific behaviour (see the 3rd
> > > > patch).
> > 
> > The control can be used by any type of device, as long as someone
> > documents a corresponding configuration model.
> > 
> > > >> Thirdly, only V4L2_CID_CONFIG_MODEL_COMMON_RAW is defined right now. What other
> > > >> models do you have in mind? What models can co-exist (since this is a bitmask)?
> > > > 
> > > > We could have different raw camera models if needed. I don't have any
> > > > planned right now, though.
> > 
> > CCS would be another model, although I'm not sure if any other driver
> > would implement that model. Still, even if used by the CCS driver only,
> > I think it would make sense to define a CCS model.
> 
> Currently the only way to determine CCS driver is being used is that some
> CCS specific controls are supported by the device. I'm beginning to lean
> towards having a CCS model, too. I'll add that in the next version.
> 
> > > >> Finally, why choose a control for this? Should this perhaps be better done as
> > > >> a field in media_entity_desc/media_v2_entity?
> > > > 
> > > > I don't think it's a great fit. This is largely about V4L2 (to some but
> > > > lesser extent about MC) and we traditionally have avoided MC -> V4L2
> > > > dependencies.
> > > 
> > > It sounds a bit like you want to report what Mauro calls a 'Profile'.
> > 
> > There are similarities but it's not the same concept. What Mauro named
> > "profile" was more about which ioctls were implemented by the device,
> > and less about their detailed behaviour.
> 
> I think it was only about the IOCTLs supported, that's it.
> 
> > > But I would expect the control to be an enum and not a bitmask, since I
> > > would expect a device to fit just a single configuration mode, and not
> > > multiple modes.
> > 
> > I would have used an enum as well. In theory we could define models that
> > cover non-overlaping parts of the device features, and a device could
> > then implement multiple models, but I'm not sure that would happen.
> 
> I'm open to making this an enum if you prefer that. My concern, and the
> reason why I used a bitmask, is that a sub-device could implement several
> models at a time. They could also be used to declare semantics of a specific
> part of the device interface, not the entire interface. For instance,
> analogue gain model could be an example of that albeit this likely could be
> derived from controls present.

That's what I understood from your initial proposal. I think it's an
interesting idea, but I believe it's also too complex at this point.
There would be lots of issues to solve, in particular how to define
models to evoid overlaps between parts of the device. This could be
explored, but will require substantial work to prototype, with support
in enough drivers to get confidence the API would be right. At this
point, I'd rather go for an enum and keep the "model of subdev models"
simple.

> > > Also, V4L2_CID_CONFIG_MODEL_COMMON_RAW applies only to sensors, right?
> > > So this should be V4L2_CID_CONFIG_MODEL_SENSOR_COMMON_RAW. But what is
> > > common about it and what is raw about it?
> > 
> > Yes, mentioning "SENSOR" in the name makes sense.
> 
> That name is very long. :-( Anyway, I don't see this being an issue in
> practice so I'll use that in the next version.
> 
> > > Isn't it the case that pretty much all sensor drivers fall into this
> > > category?
> > 
> > "raw" is by opposition to YUV sensors. YUV sensors (a.k.a. "smart
> > sensors") require very different configuration parameters compared to
> > raw sensors, so the model we're standardizing for raw sensors isn't
> > applicable.
> > 
> > > The only reason I see for this is if there are actually other configuration
> > > modes going to be added in the near future.
> > 
> > Even before we add a second model, this is useful for userspace. We have
> > many camera sensor drivers that implement the V4L2 API in different (and
> > sometimes non-compliant) ways. Knowing that a sensor is compatible with
> > the new model we're defining will be useful for libcamera.
> > 
> > > What I am missing in this RFC is a high-level view of why it is needed and
> > > how it is going to be used.
> > > 
> > > Perhaps I missed a discussion on linux-media?

-- 
Regards,

Laurent Pinchart

