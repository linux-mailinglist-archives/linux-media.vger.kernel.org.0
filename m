Return-Path: <linux-media+bounces-7345-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6637B880884
	for <lists+linux-media@lfdr.de>; Wed, 20 Mar 2024 01:26:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A9A428410F
	for <lists+linux-media@lfdr.de>; Wed, 20 Mar 2024 00:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CA6B629;
	Wed, 20 Mar 2024 00:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FXi83vyS"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0064D7EC
	for <linux-media@vger.kernel.org>; Wed, 20 Mar 2024 00:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710894403; cv=none; b=JX9lJDlHM0sWWWtEyJf5NGiwMRT3wv8IZFD4tYJLsIbfZlNWkUOKwbIn7OpVhoc3k7nQYuMQCa3uUmK04YSNRBrpS0W/8bgDdgkIBFB4VBwM34ynFOCPqy/unZyzmi9SZxbHgbAT41eoOY1bhKG9eSX9C25gXwR0KkcuqFYC30A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710894403; c=relaxed/simple;
	bh=rNFfLag8hJPcFtCF8ZAb7a3wsQpOu8kceAxoUuf5krU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CT92VoTpRCMxJswdorQcQbB6FJkfZP5ey98LC6MZPNI1HELFG+M+ogAd6B4QsLhzJl6/Yi8mndmgWkVzLCd1Tn5sRNcIvOsGKVY5CBILfvUMXINB8dzEtTY13+fAxvn4i/9YGTOXK00Jdbdt4R0G4Ldc38gQaYAUcuYSjdBF8Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FXi83vyS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AEA282B3;
	Wed, 20 Mar 2024 01:26:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710894361;
	bh=rNFfLag8hJPcFtCF8ZAb7a3wsQpOu8kceAxoUuf5krU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FXi83vySarreCqfAXMngNdHl26bRnXz1ZDJWkTYR+5CeYmyRFqYEdy6LMsUdeKwzQ
	 IkVMBe6XqcAAA5PB/OWpflGzKxLgtqdviRV/8ZfaLXgxEd3XCPUsrSzzphlE1fuf6Z
	 e1DyP+UyYpOSag0KEQOMuT5yrK/AgG0VVhBaia90=
Date: Wed, 20 Mar 2024 02:26:25 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
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
Message-ID: <20240320002625.GN8501@pendragon.ideasonboard.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-10-sakari.ailus@linux.intel.com>
 <f4e9ebbe-29a6-4f7e-9420-c6c46293d762@collabora.com>
 <ZfmXW4tkh3FOKXU8@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZfmXW4tkh3FOKXU8@kekkonen.localdomain>

On Tue, Mar 19, 2024 at 01:47:07PM +0000, Sakari Ailus wrote:
> On Fri, Mar 15, 2024 at 04:32:59PM +0100, Julien Massot wrote:
> > On 3/13/24 08:24, Sakari Ailus wrote:
> > > Document internal source pads, pads that have both SINK and INTERNAL flags
> > > set. Use the IMX219 camera sensor as an example.
> > > 
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >   .../userspace-api/media/v4l/dev-subdev.rst    | 145 ++++++++++++++++++
> > >   1 file changed, 145 insertions(+)
> > > 
> > > diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > index a387e8a15b8d..1808f40f63e3 100644
> > > --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > @@ -553,6 +553,27 @@ A stream at a specific point in the media pipeline is identified by the
> > >   sub-device and a (pad, stream) pair. For sub-devices that do not support
> > >   multiplexed streams the 'stream' field is always 0.
> > > +.. _v4l2-subdev-internal-source-pads:
> > > +
> > > +Internal source pads and routing
> > > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > +
> > > +Cases where a single sub-device source pad is traversed by multiple streams, one
> > > +or more of which originate from within the sub-device itself, are special as
> > > +there is no external sink pad for such routes. In those cases, the sources of
> > > +the internally generated streams are represented by internal source pads, which
> > > +are sink pads that have the :ref:`MEDIA_PAD_FL_INTERNAL <MEDIA-PAD-FL-INTERNAL>`
> > > +pad flag set.

This seems to answer a question in a previous patch, where I wondered if
you meant "internal sink pad" instead of "internal source pad".

Given that this is will most likely be a source of confusion, I think
you should explain this very clearly.

.. note::

   Internal source pads model the source of data *within* a sub-device, and are
   therefore conceptually located on the "sink" side of the sub-device from the
   point of view of sub-device internal routes. For this reason, and despite
   their name, they use the :ref:`MEDIA_PAD_FL_SINK <MEDIA-PAD-FL-SINK>` flag.
   When used in the routing API, they are addressed through the ``sink_pad``
   and ``sink_stream`` fields of the :c:type:`v4l2_subdev_route` structure.

I hope this will be enough... We'll need to be extra careful during
review in the beginning, making sure to always use the right terms.

> > > +
> > > +Internal pads have all the properties of an external pad, including formats and
> > > +selections. The format in this case is the source format of the stream. An
> > > +internal pad always has a single stream only (0).
> > > +
> > > +Routes from an internal source pad to an external source pad are typically not
> > > +modifiable but they can be activated and deactivated using the
> > > +:ref:`V4L2_SUBDEV_ROUTE_FL_ACTIVE <v4l2-subdev-routing-flags>` flag, depending
> > > +on driver capabilities.
> > > +
> > >   Interaction between routes, streams, formats and selections
> > >   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > @@ -668,3 +689,127 @@ To configure this pipeline, the userspace must take the following steps:
> > >      the configurations along the stream towards the receiver, using
> > >      :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>` ioctls to configure each
> > >      stream endpoint in each sub-device.
> > > +
> > > +Internal pads setup example
> > > +^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > +
> > > +A simple example of a multiplexed stream setup might be as follows:
> > > +
> > > +- An IMX219 camera sensor source sub-device, with one sink pad (0), one source pad
> > > +  (1), an internal sink pad (2) that represents the source of embedded
> > 
> > The pixel pad is an internal pad as well ?
> 
> How about:
> 
> - An IMX219 camera sensor source sub-device, with one internal sink pad
>   (0) for image data, one source pad (1), an internal sink pad (2) that
>   represents the source of embedded

Sounds better, except you're now talking about internal sink pads, not
internal source pads :-) We have to pick one option and stick to it.
Same below.

> > > +  data. There are two routes, one from the sink pad to the source, and another

"from the internal image source pad to the source" sounds weird, so you
may need to write "from the internal image source pad to the external
source pad". If we instead talked about "internal sink pads" to model
the source of the streams, you could write "from the internal image sink
pad to the source pad".

> > > +  from the internal sink pad to the source pad. Both streams are always active,
> > > +  i.e. there is no need to separately enable the embedded data stream. The
> > > +  sensor uses the CSI-2 bus.
> > > +
> > > +- A CSI-2 receiver in the SoC (Receiver). The receiver has a single sink pad
> > > +  (pad 0), connected to the bridge, and two source pads (pads 1-2), going to the

I think you meant s/bridge/sensor/

> > > +  DMA engine. The receiver demultiplexes the incoming streams to the source

And "DMA engines" here ?

> > > +  pads.
> > > +
> > > +- DMA Engines in the SoC (DMA Engine), one for each stream. Each DMA engine is

s/Engines/engine/

> > > +  connected to a single source pad in the receiver.

s/in the/of the/

> > > +
> > > +The sensor, the bridge and the receiver are modeled as V4L2 sub-devices,

What bridge ? Same below.

> > > +exposed to userspace via /dev/v4l-subdevX device nodes. The DMA engines are
> > > +modeled as V4L2 devices, exposed to userspace via /dev/videoX nodes.
> > > +
> > > +To configure this pipeline, the userspace must take the following steps:
> > > +
> > > +1) Set up media links between entities: connect the sensors to the bridge,
> > > +   bridge to the receiver, and the receiver to the DMA engines. This step does
> > > +   not differ from normal non-multiplexed media controller setup.
> > > +
> > > +2) Configure routing
> > > +
> > > +.. flat-table:: Camera sensor. There are no configurable routes.
> > > +    :header-rows: 1
> > > +
> > > +    * - Sink Pad/Stream
> > > +      - Source Pad/Stream
> > > +      - Routing Flags
> > > +      - Comments
> > > +    * - 0/0
> > > +      - 1/0
> >
> > - 1/0
> > - 0/0
> >
> > > +      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> > > +      - Pixel data stream from the sink pad
> > > +    * - 2/0
> > > +      - 1/1
> >
> > - 0/1
> >
> > > +      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> > > +      - Metadata stream from the internal sink pad
> > 
> > In latest patch "[PATCH v6 05/15] media: i2c: imx219: Add embedded data
> > support"
> > we have:
> > - 0 -> source pad
> > - 1 -> pixel/image
> > - 2 -> EDATA
> > 
> > This is also what you did for ov2740.
> 
> Yes, these were leftovers from the CCS example. I've fixed them.
> 
> > With that fixed:
> > Reviewed-by Julien Massot <julien.massot@collabora.com>
> 
> Thank you!

-- 
Regards,

Laurent Pinchart

