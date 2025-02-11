Return-Path: <linux-media+bounces-25988-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2839CA305CA
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 09:31:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0ED0164886
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 08:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFA371EF0AB;
	Tue, 11 Feb 2025 08:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RJ3jAoWt"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279E6192B86
	for <linux-media@vger.kernel.org>; Tue, 11 Feb 2025 08:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739262703; cv=none; b=ftL8QiAwPuKfP7mj26NDjyflwEfNrxXMMLXbXgcJ6XaG9Qcse3RL0k2XVqFCKTW85PBs6K3V6GcrjktyqE3mDbqrcxxawoqyKHVAiPOC9c3ewOBnZlZYpo2EYUEv/NB1F/x9TAh4P26v9N2EDvC1mNNsnaXQdRG4TbL/IhGVoOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739262703; c=relaxed/simple;
	bh=sqKIAiSWdphXg2wUkYryJ96Od9m035/ViFFFQbZUyvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E1LO31JFIlzYaLEYEoZBBSoL2UveC6rXyz3diZQQLIYIrPhOqd6UFwfvvTHmlqsN+WjZJk8+EaAi58//qcfWllq/sajQbxfvgx9r+wd4ZkHiqpyap3mCctd1B54vwdtQrs8/+Dr4HMSvNJZoZLrUk0kxnutsjtgEQ1UBhStN5P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RJ3jAoWt; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739262700; x=1770798700;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sqKIAiSWdphXg2wUkYryJ96Od9m035/ViFFFQbZUyvM=;
  b=RJ3jAoWtcUfoqMvRq7sdo+OOiAcJPgycGf3KpbdCA7TD7wzL1B2mgzmq
   JYMcFRqbB+VKyDsXDjt0h9T360joHU1w/WIhm638JsDeIIsdrHmFCv4Hj
   9cnflxbgf7kqkS+g1NQypuLtqYGZABz2EWV0lN3g7ZiAeGjQvCo0I+OTS
   wLhVgqx6igawvR1NOD59vrvZR/PRO4myN+u38qtaHuvMq9WZLuTVyzrck
   z9CtxZKNxtBne3pXeHPm+K4bljU/Fd8MlFjkqwCQwD45UOfTY+Am57c/7
   x3bAYYSQPJ5Sk8lqu6eFq0LPNM9oFg+IRLZMFtjMP5UAOeU6DZyRE39Ns
   w==;
X-CSE-ConnectionGUID: Ytvekc4mS8GYL8GZ6gNzXw==
X-CSE-MsgGUID: 3FyxVenJR1mvzpBBzxfnuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="43798104"
X-IronPort-AV: E=Sophos;i="6.13,276,1732608000"; 
   d="scan'208";a="43798104"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 00:31:39 -0800
X-CSE-ConnectionGUID: ny1WRUVLR/qwcbgHYRJWSQ==
X-CSE-MsgGUID: x1pG1Z/3RqWv29um0ooo7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,276,1732608000"; 
   d="scan'208";a="112270629"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 00:31:37 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3B47411F7E8;
	Tue, 11 Feb 2025 10:31:34 +0200 (EET)
Date: Tue, 11 Feb 2025 08:31:34 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Message-ID: <Z6sK5oTiwez5brwk@kekkonen.localdomain>
References: <20241011075535.588140-1-sakari.ailus@linux.intel.com>
 <20241011075535.588140-5-sakari.ailus@linux.intel.com>
 <137d5e38-b9fd-4274-8877-e5f71365242c@xs4all.nl>
 <ZzRkwVlNLzXQmWoK@kekkonen.localdomain>
 <846db937-9445-4f5c-b8fe-7c973522a3a1@xs4all.nl>
 <20241118024002.GJ31681@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118024002.GJ31681@pendragon.ideasonboard.com>

Hi Laurent,

On Mon, Nov 18, 2024 at 04:40:02AM +0200, Laurent Pinchart wrote:
> Hello,
> 
> On Wed, Nov 13, 2024 at 01:26:26PM +0100, Hans Verkuil wrote:
> > On 11/13/24 09:35, Sakari Ailus wrote:
> > > On Wed, Nov 13, 2024 at 09:03:57AM +0100, Hans Verkuil wrote:
> > >> On 11/10/2024 09:55, Sakari Ailus wrote:
> > >>> Add the V4L2_CID_CONFIG_MODEL control for the configuration model.
> > >>>
> > >>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > >>> ---
> > >>>  .../userspace-api/media/v4l/ext-ctrls-image-process.rst      | 4 ++++
> > >>>  .../userspace-api/media/v4l/subdev-config-model.rst          | 2 ++
> > >>>  drivers/media/v4l2-core/v4l2-ctrls-defs.c                    | 5 +++++
> > >>>  include/uapi/linux/v4l2-controls.h                           | 3 +++
> > >>>  4 files changed, 14 insertions(+)
> > >>>
> > >>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> > >>> index 27803dca8d3e..928e8e3eed7f 100644
> > >>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> > >>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> > >>> @@ -55,3 +55,7 @@ Image Process Control IDs
> > >>>      control value divided by e.g. 0x100, meaning that to get no
> > >>>      digital gain the control value needs to be 0x100. The no-gain
> > >>>      configuration is also typically the default.
> > >>> +
> > >>> +``V4L2_CID_CONFIG_MODEL (bitmask)``
> > >>> +    Which configuration models the sub-device supports. Please see
> > >>> +    :ref:`media_subdev_config_model`.
> > >>
> > >> First of all the naming is confusing: since this is specific to sub-devices, it
> > >> should at least have 'SUBDEV' in the name. I first thought this reported the
> > > 
> > > I don't object in principle, but the reason why I didn't add that in v1 was
> > > the names would get quite long. Maybe V4L2_CID_SUBDEV_CFG_MODEL?
> > > 
> > >> model name or something like that, I'm not sure "configuration model" is a very
> > >> good name.
> > > 
> > > Feel free to propose a different one. :-)
> > 
> > I would, if I understood what you intend to achieve :-)
> 
> I'll try to rephrase what Sakari wrote in the patches.
> 
> The V4L2 specification defines a subdev API that exposes three type of
> configuration elements: formats, selection rectangles and controls. The
> specification contains generic information about how those configuration
> elements behave, but not precisly how they apply to particular hardware
> features. We leave some leeway to drivers to decide how to map selection
> rectangles to device features, as long as they comply with the V4L2
> specification. This is needed, as hardware features differ between
> devices, so it's the driver's responsibility to handle this mapping.
> 
> Unfortunately, this lack of clearly defined mapping in the specification
> has led to different drivers mapping the same hardware features to
> different API elements, or implementing the API elements with slightly
> different behaviours. Furthermore, many drivers have implemented
> selection rectangles in ways that do not comply with the V4L2
> specification. All of this makes userspace development difficult.
> 
> We can't define precisely how all configuration elements apply to
> hardware features in a way that applies to all devices, as devices
> differ widely. We can however develop such precise definitions for
> classes of similar devices. In order to develop generic userspace code,
> we then need a way for subdevs to indicate which class they belong to.
> This is what the configuration model control does. The configuration
> model tells userspace which section of the V4L2 specification defines
> the precise behaviour of the device.
> 
> One example of how drivers implement features in different ways is
> skipping and binning. Some sensor drivers use selection rectangles,
> other just formats.

I'll use this text, with some modifications, in the documentation of
sub-device configuration models.

> 
> > >> Secondly, is this supposed to be valid for all subdevices? Only for sensors?
> > >> Would an HDMI-to-CSI bridge qualify?
> > > 
> > > I think it could but we should have a use case for it. In other words,
> > > something we can't reasonably express using existing means. In this case
> > > it's a number of interfaces and device type specific behaviour (see the 3rd
> > > patch).
> 
> The control can be used by any type of device, as long as someone
> documents a corresponding configuration model.
> 
> > >> Thirdly, only V4L2_CID_CONFIG_MODEL_COMMON_RAW is defined right now. What other
> > >> models do you have in mind? What models can co-exist (since this is a bitmask)?
> > > 
> > > We could have different raw camera models if needed. I don't have any
> > > planned right now, though.
> 
> CCS would be another model, although I'm not sure if any other driver
> would implement that model. Still, even if used by the CCS driver only,
> I think it would make sense to define a CCS model.

Currently the only way to determine CCS driver is being used is that some
CCS specific controls are supported by the device. I'm beginning to lean
towards having a CCS model, too. I'll add that in the next version.

> 
> > >> Finally, why choose a control for this? Should this perhaps be better done as
> > >> a field in media_entity_desc/media_v2_entity?
> > > 
> > > I don't think it's a great fit. This is largely about V4L2 (to some but
> > > lesser extent about MC) and we traditionally have avoided MC -> V4L2
> > > dependencies.
> > 
> > It sounds a bit like you want to report what Mauro calls a 'Profile'.
> 
> There are similarities but it's not the same concept. What Mauro named
> "profile" was more about which ioctls were implemented by the device,
> and less about their detailed behaviour.

I think it was only about the IOCTLs supported, that's it.

> 
> > But I would expect the control to be an enum and not a bitmask, since I
> > would expect a device to fit just a single configuration mode, and not
> > multiple modes.
> 
> I would have used an enum as well. In theory we could define models that
> cover non-overlaping parts of the device features, and a device could
> then implement multiple models, but I'm not sure that would happen.

I'm open to making this an enum if you prefer that. My concern, and the
reason why I used a bitmask, is that a sub-device could implement several
models at a time. They could also be used to declare semantics of a specific
part of the device interface, not the entire interface. For instance,
analogue gain model could be an example of that albeit this likely could be
derived from controls present.

> 
> > Also, V4L2_CID_CONFIG_MODEL_COMMON_RAW applies only to sensors, right?
> > So this should be V4L2_CID_CONFIG_MODEL_SENSOR_COMMON_RAW. But what is
> > common about it and what is raw about it?
> 
> Yes, mentioning "SENSOR" in the name makes sense.

That name is very long. :-( Anyway, I don't see this being an issue in
practice so I'll use that in the next version.

> 
> > Isn't it the case that pretty much all sensor drivers fall into this
> > category?
> 
> "raw" is by opposition to YUV sensors. YUV sensors (a.k.a. "smart
> sensors") require very different configuration parameters compared to
> raw sensors, so the model we're standardizing for raw sensors isn't
> applicable.
> 
> > The only reason I see for this is if there are actually other configuration
> > modes going to be added in the near future.
> 
> Even before we add a second model, this is useful for userspace. We have
> many camera sensor drivers that implement the V4L2 API in different (and
> sometimes non-compliant) ways. Knowing that a sensor is compatible with
> the new model we're defining will be useful for libcamera.
> 
> > What I am missing in this RFC is a high-level view of why it is needed and
> > how it is going to be used.
> > 
> > Perhaps I missed a discussion on linux-media?
> 

-- 
Kind regards,

Sakari Ailus

