Return-Path: <linux-media+bounces-21487-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDF09D07EE
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 03:40:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 303221F218F9
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 02:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 638633C488;
	Mon, 18 Nov 2024 02:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="C/vDRHf8"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B133217BA3
	for <linux-media@vger.kernel.org>; Mon, 18 Nov 2024 02:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731897615; cv=none; b=ga3T6E+TnobxpfOYpu1GaAzZmPo16l87zCxZEXulBqh7SwPTjAfhmpogTlymJDcbc3B+QV31HdrNb+yWbXplnXuqdgBwY1t454M5IIsvxDwfNhahqhJZge0Ag60rGr6Ks/zhiHlzBjYSju4h4GPo8AevdG95jUesezmtjpsO5sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731897615; c=relaxed/simple;
	bh=ihxU/LC73MGuabYwap6O66rOZSfDAXnGyxwHUhHxbis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HR7odSNy0bESs7u1l7ds72+dC1/NlrpkhEdXXu88GyImhD7JQtwxJDUBSSH+8hbdklZ9yedBK31CWLcwibToMlOCwxagt7OUf/RWTsPR2BWe3D8BUo/uam4y0ygqkl0iovbFdwPpOLRIFt3X+5tR2hA6JAHk2sNfJx6/Qy2UAsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=C/vDRHf8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3F38F8FA;
	Mon, 18 Nov 2024 03:39:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731897595;
	bh=ihxU/LC73MGuabYwap6O66rOZSfDAXnGyxwHUhHxbis=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C/vDRHf8+fHI4aJpnUHIEvEhcxtIMWX1icwjlsAB3QAwY8eHRZ0+22JSSVktzkaGB
	 OK94Xj8dWaYbSXoH4rpky2B7uUaHd/gz0/0lrFurTgoLPLFJfYX6a6xLyfpMidcBrR
	 HDS53An7x+NklPkxoxSFkqXpcB3Z50cF9GJYXFEc=
Date: Mon, 18 Nov 2024 04:40:02 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
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
Message-ID: <20241118024002.GJ31681@pendragon.ideasonboard.com>
References: <20241011075535.588140-1-sakari.ailus@linux.intel.com>
 <20241011075535.588140-5-sakari.ailus@linux.intel.com>
 <137d5e38-b9fd-4274-8877-e5f71365242c@xs4all.nl>
 <ZzRkwVlNLzXQmWoK@kekkonen.localdomain>
 <846db937-9445-4f5c-b8fe-7c973522a3a1@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <846db937-9445-4f5c-b8fe-7c973522a3a1@xs4all.nl>

Hello,

On Wed, Nov 13, 2024 at 01:26:26PM +0100, Hans Verkuil wrote:
> On 11/13/24 09:35, Sakari Ailus wrote:
> > On Wed, Nov 13, 2024 at 09:03:57AM +0100, Hans Verkuil wrote:
> >> On 11/10/2024 09:55, Sakari Ailus wrote:
> >>> Add the V4L2_CID_CONFIG_MODEL control for the configuration model.
> >>>
> >>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> >>> ---
> >>>  .../userspace-api/media/v4l/ext-ctrls-image-process.rst      | 4 ++++
> >>>  .../userspace-api/media/v4l/subdev-config-model.rst          | 2 ++
> >>>  drivers/media/v4l2-core/v4l2-ctrls-defs.c                    | 5 +++++
> >>>  include/uapi/linux/v4l2-controls.h                           | 3 +++
> >>>  4 files changed, 14 insertions(+)
> >>>
> >>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> >>> index 27803dca8d3e..928e8e3eed7f 100644
> >>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> >>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> >>> @@ -55,3 +55,7 @@ Image Process Control IDs
> >>>      control value divided by e.g. 0x100, meaning that to get no
> >>>      digital gain the control value needs to be 0x100. The no-gain
> >>>      configuration is also typically the default.
> >>> +
> >>> +``V4L2_CID_CONFIG_MODEL (bitmask)``
> >>> +    Which configuration models the sub-device supports. Please see
> >>> +    :ref:`media_subdev_config_model`.
> >>
> >> First of all the naming is confusing: since this is specific to sub-devices, it
> >> should at least have 'SUBDEV' in the name. I first thought this reported the
> > 
> > I don't object in principle, but the reason why I didn't add that in v1 was
> > the names would get quite long. Maybe V4L2_CID_SUBDEV_CFG_MODEL?
> > 
> >> model name or something like that, I'm not sure "configuration model" is a very
> >> good name.
> > 
> > Feel free to propose a different one. :-)
> 
> I would, if I understood what you intend to achieve :-)

I'll try to rephrase what Sakari wrote in the patches.

The V4L2 specification defines a subdev API that exposes three type of
configuration elements: formats, selection rectangles and controls. The
specification contains generic information about how those configuration
elements behave, but not precisly how they apply to particular hardware
features. We leave some leeway to drivers to decide how to map selection
rectangles to device features, as long as they comply with the V4L2
specification. This is needed, as hardware features differ between
devices, so it's the driver's responsibility to handle this mapping.

Unfortunately, this lack of clearly defined mapping in the specification
has led to different drivers mapping the same hardware features to
different API elements, or implementing the API elements with slightly
different behaviours. Furthermore, many drivers have implemented
selection rectangles in ways that do not comply with the V4L2
specification. All of this makes userspace development difficult.

We can't define precisely how all configuration elements apply to
hardware features in a way that applies to all devices, as devices
differ widely. We can however develop such precise definitions for
classes of similar devices. In order to develop generic userspace code,
we then need a way for subdevs to indicate which class they belong to.
This is what the configuration model control does. The configuration
model tells userspace which section of the V4L2 specification defines
the precise behaviour of the device.

One example of how drivers implement features in different ways is
skipping and binning. Some sensor drivers use selection rectangles,
other just formats.

> >> Secondly, is this supposed to be valid for all subdevices? Only for sensors?
> >> Would an HDMI-to-CSI bridge qualify?
> > 
> > I think it could but we should have a use case for it. In other words,
> > something we can't reasonably express using existing means. In this case
> > it's a number of interfaces and device type specific behaviour (see the 3rd
> > patch).

The control can be used by any type of device, as long as someone
documents a corresponding configuration model.

> >> Thirdly, only V4L2_CID_CONFIG_MODEL_COMMON_RAW is defined right now. What other
> >> models do you have in mind? What models can co-exist (since this is a bitmask)?
> > 
> > We could have different raw camera models if needed. I don't have any
> > planned right now, though.

CCS would be another model, although I'm not sure if any other driver
would implement that model. Still, even if used by the CCS driver only,
I think it would make sense to define a CCS model.

> >> Finally, why choose a control for this? Should this perhaps be better done as
> >> a field in media_entity_desc/media_v2_entity?
> > 
> > I don't think it's a great fit. This is largely about V4L2 (to some but
> > lesser extent about MC) and we traditionally have avoided MC -> V4L2
> > dependencies.
> 
> It sounds a bit like you want to report what Mauro calls a 'Profile'.

There are similarities but it's not the same concept. What Mauro named
"profile" was more about which ioctls were implemented by the device,
and less about their detailed behaviour.

> But I would expect the control to be an enum and not a bitmask, since I
> would expect a device to fit just a single configuration mode, and not
> multiple modes.

I would have used an enum as well. In theory we could define models that
cover non-overlaping parts of the device features, and a device could
then implement multiple models, but I'm not sure that would happen.

> Also, V4L2_CID_CONFIG_MODEL_COMMON_RAW applies only to sensors, right?
> So this should be V4L2_CID_CONFIG_MODEL_SENSOR_COMMON_RAW. But what is
> common about it and what is raw about it?

Yes, mentioning "SENSOR" in the name makes sense.

> Isn't it the case that pretty much all sensor drivers fall into this
> category?

"raw" is by opposition to YUV sensors. YUV sensors (a.k.a. "smart
sensors") require very different configuration parameters compared to
raw sensors, so the model we're standardizing for raw sensors isn't
applicable.

> The only reason I see for this is if there are actually other configuration
> modes going to be added in the near future.

Even before we add a second model, this is useful for userspace. We have
many camera sensor drivers that implement the V4L2 API in different (and
sometimes non-compliant) ways. Knowing that a sensor is compatible with
the new model we're defining will be useful for libcamera.

> What I am missing in this RFC is a high-level view of why it is needed and
> how it is going to be used.
> 
> Perhaps I missed a discussion on linux-media?

-- 
Regards,

Laurent Pinchart

