Return-Path: <linux-media+bounces-8905-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E05589D901
	for <lists+linux-media@lfdr.de>; Tue,  9 Apr 2024 14:14:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 790211F228ED
	for <lists+linux-media@lfdr.de>; Tue,  9 Apr 2024 12:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 373A212BEAC;
	Tue,  9 Apr 2024 12:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UAKIHVdF"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4600380043
	for <linux-media@vger.kernel.org>; Tue,  9 Apr 2024 12:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712664852; cv=none; b=Rjs+SO6QDMZmq50926fn0b65v09bPAdL1a+tIaXP0oqnXnt6aO04X6Q+/tLUdIfEuVh5ZffZbXjDifVpf5xvL5IOzBPcME8TseKL98d6HvHgjo2NMizkvoaypGqi7BqoB9qfZnSnHqx2u4pgatVvwPiNygc21tuOb6jrJxWjhLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712664852; c=relaxed/simple;
	bh=R4vCz9xU2Rz78iESTBsrRELQPlYBekzFtpCE+O1Nlso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YI0s5dj0XKqviD4zLCy82UhC4KKwgx1ZGDQb4+Qw2KjZMPD9FUmGlTdKOXI5oiepFhVrKm+53BlBEIdr7toqfOfTJpSFXMdfk5gaTs/LzJ/85lU6TKEFE4IbVcptFAUNpX04QFIvl4VXC/jMVv+YJRbFTG2qLDXo7ZBzNQv+ikY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UAKIHVdF; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712664850; x=1744200850;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=R4vCz9xU2Rz78iESTBsrRELQPlYBekzFtpCE+O1Nlso=;
  b=UAKIHVdFaD8gTBGHFpYXCxygwK5pxJHjFvp6FD6GgIkRvixwLVpSxkXA
   pxYdXWHRRhylmMYfhVhJLUy9qazsD10EywbMMdyuPktaVoM7UpgLnEWbG
   0s/gr3YgU4t8rGNMMo4SVsSiZMhlBmIDG0q/R3aM0XU2Os5y8iA0xsqpP
   NAsxRy1zQBLEE+2TNNnND6fZ4VG3DTNa3GcDp9/E4puzRRZoE0Qp3zHDW
   7A8iZvXPFureGhZQvlz+hxMBKYoGEcbs7qh1A1wfDfE9y6Yc8kWUxAo5D
   8ChMHzaWH8R+ViYf6xQWRoMicQ0R25O+EyRlj2xMT2EPLCLKypMOzoaEa
   Q==;
X-CSE-ConnectionGUID: MMcluOwNRzmfDMhZQfb/5A==
X-CSE-MsgGUID: jYrJIpHeRni4Dkv+vCUzYg==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7818629"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="7818629"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 05:14:09 -0700
X-CSE-ConnectionGUID: LZxsBdibQbeBqtAuyokQ/A==
X-CSE-MsgGUID: 72DrqMXTS+eiVnzxFO/EkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="24836951"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 05:14:07 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 42446120433;
	Tue,  9 Apr 2024 15:14:04 +0300 (EEST)
Date: Tue, 9 Apr 2024 12:14:04 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Julien Massot <julien.massot@collabora.com>,
	linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 09/38] media: Documentation: v4l: Document internal
 source pads
Message-ID: <ZhUxDEhLDUxtqlO6@kekkonen.localdomain>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-10-sakari.ailus@linux.intel.com>
 <f4e9ebbe-29a6-4f7e-9420-c6c46293d762@collabora.com>
 <ZfmXW4tkh3FOKXU8@kekkonen.localdomain>
 <20240320002625.GN8501@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240320002625.GN8501@pendragon.ideasonboard.com>

Hi Laurent,

On Wed, Mar 20, 2024 at 02:26:25AM +0200, Laurent Pinchart wrote:
> On Tue, Mar 19, 2024 at 01:47:07PM +0000, Sakari Ailus wrote:
> > On Fri, Mar 15, 2024 at 04:32:59PM +0100, Julien Massot wrote:
> > > On 3/13/24 08:24, Sakari Ailus wrote:
> > > > Document internal source pads, pads that have both SINK and INTERNAL flags
> > > > set. Use the IMX219 camera sensor as an example.
> > > > 
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > ---
> > > >   .../userspace-api/media/v4l/dev-subdev.rst    | 145 ++++++++++++++++++
> > > >   1 file changed, 145 insertions(+)
> > > > 
> > > > diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > > index a387e8a15b8d..1808f40f63e3 100644
> > > > --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > > +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > > @@ -553,6 +553,27 @@ A stream at a specific point in the media pipeline is identified by the
> > > >   sub-device and a (pad, stream) pair. For sub-devices that do not support
> > > >   multiplexed streams the 'stream' field is always 0.
> > > > +.. _v4l2-subdev-internal-source-pads:
> > > > +
> > > > +Internal source pads and routing
> > > > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > > +
> > > > +Cases where a single sub-device source pad is traversed by multiple streams, one
> > > > +or more of which originate from within the sub-device itself, are special as
> > > > +there is no external sink pad for such routes. In those cases, the sources of
> > > > +the internally generated streams are represented by internal source pads, which
> > > > +are sink pads that have the :ref:`MEDIA_PAD_FL_INTERNAL <MEDIA-PAD-FL-INTERNAL>`
> > > > +pad flag set.
> 
> This seems to answer a question in a previous patch, where I wondered if
> you meant "internal sink pad" instead of "internal source pad".
> 
> Given that this is will most likely be a source of confusion, I think
> you should explain this very clearly.
> 
> .. note::
> 
>    Internal source pads model the source of data *within* a sub-device, and are
>    therefore conceptually located on the "sink" side of the sub-device from the
>    point of view of sub-device internal routes. For this reason, and despite
>    their name, they use the :ref:`MEDIA_PAD_FL_SINK <MEDIA-PAD-FL-SINK>` flag.
>    When used in the routing API, they are addressed through the ``sink_pad``
>    and ``sink_stream`` fields of the :c:type:`v4l2_subdev_route` structure.
> 
> I hope this will be enough... We'll need to be extra careful during
> review in the beginning, making sure to always use the right terms.

Let's see if we need something like this with the "internal source pad"
concept removed. But let's revisit the topic in v9.

> 
> > > > +
> > > > +Internal pads have all the properties of an external pad, including formats and
> > > > +selections. The format in this case is the source format of the stream. An
> > > > +internal pad always has a single stream only (0).
> > > > +
> > > > +Routes from an internal source pad to an external source pad are typically not
> > > > +modifiable but they can be activated and deactivated using the
> > > > +:ref:`V4L2_SUBDEV_ROUTE_FL_ACTIVE <v4l2-subdev-routing-flags>` flag, depending
> > > > +on driver capabilities.
> > > > +
> > > >   Interaction between routes, streams, formats and selections
> > > >   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > > @@ -668,3 +689,127 @@ To configure this pipeline, the userspace must take the following steps:
> > > >      the configurations along the stream towards the receiver, using
> > > >      :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>` ioctls to configure each
> > > >      stream endpoint in each sub-device.
> > > > +
> > > > +Internal pads setup example
> > > > +^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > > +
> > > > +A simple example of a multiplexed stream setup might be as follows:
> > > > +
> > > > +- An IMX219 camera sensor source sub-device, with one sink pad (0), one source pad
> > > > +  (1), an internal sink pad (2) that represents the source of embedded
> > > 
> > > The pixel pad is an internal pad as well ?
> > 
> > How about:
> > 
> > - An IMX219 camera sensor source sub-device, with one internal sink pad
> >   (0) for image data, one source pad (1), an internal sink pad (2) that
> >   represents the source of embedded
> 
> Sounds better, except you're now talking about internal sink pads, not
> internal source pads :-) We have to pick one option and stick to it.
> Same below.

Let's discuss this in the context of patch 8.

> 
> > > > +  data. There are two routes, one from the sink pad to the source, and another
> 
> "from the internal image source pad to the source" sounds weird, so you
> may need to write "from the internal image source pad to the external
> source pad". If we instead talked about "internal sink pads" to model
> the source of the streams, you could write "from the internal image sink
> pad to the source pad".

I think this text was from the original CCS example. I'll update it for
IMX290.

> 
> > > > +  from the internal sink pad to the source pad. Both streams are always active,
> > > > +  i.e. there is no need to separately enable the embedded data stream. The
> > > > +  sensor uses the CSI-2 bus.
> > > > +
> > > > +- A CSI-2 receiver in the SoC (Receiver). The receiver has a single sink pad
> > > > +  (pad 0), connected to the bridge, and two source pads (pads 1-2), going to the
> 
> I think you meant s/bridge/sensor/

Thanks. In an earlier version there was a bridge, this was a leftover from
that it seems. I'll check if there are other remaining references, too.

> 
> > > > +  DMA engine. The receiver demultiplexes the incoming streams to the source
> 
> And "DMA engines" here ?

Correct.

> 
> > > > +  pads.
> > > > +
> > > > +- DMA Engines in the SoC (DMA Engine), one for each stream. Each DMA engine is
> 
> s/Engines/engine/

Sounds good.

> 
> > > > +  connected to a single source pad in the receiver.
> 
> s/in the/of the/

Works for me.

> 
> > > > +
> > > > +The sensor, the bridge and the receiver are modeled as V4L2 sub-devices,
> 
> What bridge ? Same below.
> 
> > > > +exposed to userspace via /dev/v4l-subdevX device nodes. The DMA engines are
> > > > +modeled as V4L2 devices, exposed to userspace via /dev/videoX nodes.
> > > > +
> > > > +To configure this pipeline, the userspace must take the following steps:
> > > > +
> > > > +1) Set up media links between entities: connect the sensors to the bridge,
> > > > +   bridge to the receiver, and the receiver to the DMA engines. This step does
> > > > +   not differ from normal non-multiplexed media controller setup.
> > > > +
> > > > +2) Configure routing
> > > > +
> > > > +.. flat-table:: Camera sensor. There are no configurable routes.
> > > > +    :header-rows: 1
> > > > +
> > > > +    * - Sink Pad/Stream
> > > > +      - Source Pad/Stream
> > > > +      - Routing Flags
> > > > +      - Comments
> > > > +    * - 0/0
> > > > +      - 1/0
> > >
> > > - 1/0
> > > - 0/0
> > >
> > > > +      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> > > > +      - Pixel data stream from the sink pad
> > > > +    * - 2/0
> > > > +      - 1/1
> > >
> > > - 0/1
> > >
> > > > +      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> > > > +      - Metadata stream from the internal sink pad
> > > 
> > > In latest patch "[PATCH v6 05/15] media: i2c: imx219: Add embedded data
> > > support"
> > > we have:
> > > - 0 -> source pad
> > > - 1 -> pixel/image
> > > - 2 -> EDATA
> > > 
> > > This is also what you did for ov2740.
> > 
> > Yes, these were leftovers from the CCS example. I've fixed them.
> > 
> > > With that fixed:
> > > Reviewed-by Julien Massot <julien.massot@collabora.com>
> > 
> > Thank you!
> 

-- 
Kind regards,

Sakari Ailus

