Return-Path: <linux-media+bounces-9937-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF748AE713
	for <lists+linux-media@lfdr.de>; Tue, 23 Apr 2024 14:56:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76BFC1F25E71
	for <lists+linux-media@lfdr.de>; Tue, 23 Apr 2024 12:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9571B12C524;
	Tue, 23 Apr 2024 12:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NZomdFBc"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2AD85C4E
	for <linux-media@vger.kernel.org>; Tue, 23 Apr 2024 12:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713876989; cv=none; b=F7bcKfx7C+lzVOLIByB50wx+m02iD5KXe3zpwBq+CCEOr6rJ4khsX/XlpH+f6iXFL0kc9safskeHN4ClA77+7Vp0QtaGmPci3nas+iiiuY86QPVKieVxIpbjRgbWtuVc8+sUjroZj6P7PifKHLCrNZlqjWzRERdH2Zk9Pq7wwtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713876989; c=relaxed/simple;
	bh=hY4oI3kti1hBlcSs/iWA9nL7ONqcVIrt9h2+y/cBpVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c7mDlzrRWXjFj4ZyZPlBVlQLdmVfPYU82NQny4Rp4nizO0RP5DOhss1Ez0JRa13XPudE8MPVenCCtJrecELzuVjzVXRkL6QOynlhdz71qbDJ3THORvVVswpf5u1i7hzEBcWDEhHCH4QDziC7GL4d3+6ggpRTUtRU6UtJRK9F2yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NZomdFBc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (85-76-77-173-nat.elisa-mobile.fi [85.76.77.173])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 74A21E4;
	Tue, 23 Apr 2024 14:55:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713876934;
	bh=hY4oI3kti1hBlcSs/iWA9nL7ONqcVIrt9h2+y/cBpVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NZomdFBce8LpX2gjC37vr0z7609e7pe/oWkNNsZE+lhCw9/7lLxXsSq/8rLuONA0a
	 re9whXEhRcP6EEjVmQOUTx8vS5DXlj/1d8xZbc7rwjXuh2/33lCx/9/WOT+lZYTYSb
	 uphajY2PRJ69nKthuEPuodrCYEi3NALmR2VFUoBk=
Date: Tue, 23 Apr 2024 15:56:18 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v9 10/46] media: Documentation: v4l: Document internal
 sink pads
Message-ID: <20240423125618.GE20623@pendragon.ideasonboard.com>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
 <20240416193319.778192-11-sakari.ailus@linux.intel.com>
 <20240419184926.GI6414@pendragon.ideasonboard.com>
 <ZieM_xjmWxdcBx5r@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZieM_xjmWxdcBx5r@kekkonen.localdomain>

Hi Sakari,

On Tue, Apr 23, 2024 at 10:27:11AM +0000, Sakari Ailus wrote:
> On Fri, Apr 19, 2024 at 09:49:26PM +0300, Laurent Pinchart wrote:
> > On Tue, Apr 16, 2024 at 10:32:43PM +0300, Sakari Ailus wrote:
> > > Document internal sink pads, pads that have both SINK and INTERNAL flags
> > > set. Use the IMX219 camera sensor as an example.
> > > 
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > Reviewed-by Julien Massot <julien.massot@collabora.com>
> > > ---
> > >  .../userspace-api/media/v4l/dev-subdev.rst    | 145 ++++++++++++++++++
> > >  1 file changed, 145 insertions(+)
> > > 
> > > diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > index b76e02e54512..d30dcb9e2537 100644
> > > --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > @@ -553,6 +553,27 @@ A stream at a specific point in the media pipeline is identified by the
> > >  sub-device and a (pad, stream) pair. For sub-devices that do not support
> > >  multiplexed streams the 'stream' field is always 0.
> > >  
> > > +.. _v4l2-subdev-internal-source-pads:
> > > +
> > > +Internal sink pads and routing
> > > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > +
> > > +Cases where a single sub-device source pad is traversed by multiple streams, one
> > > +or more of which originate from within the sub-device itself, are special as
> > > +there is no external sink pad for such routes. In those cases, the sources of
> > > +the internally generated streams are represented by internal sink pads, which
> > > +are sink pads that have the :ref:`MEDIA_PAD_FL_INTERNAL <MEDIA-PAD-FL-INTERNAL>`
> > > +pad flag set.
> > > +
> > > +Internal pads have all the properties of an external pad, including formats and
> > > +selections. The format in this case is the source format of the stream. An
> > > +internal pad always has a single stream only (0).
> > > +
> > > +Routes from an internal sink pad to an external source pad are typically not
> > > +modifiable but they can be activated and deactivated using the
> > > +:ref:`V4L2_SUBDEV_ROUTE_FL_ACTIVE <v4l2-subdev-routing-flags>` flag, depending
> > > +on driver capabilities.
> > > +
> > >  Interaction between routes, streams, formats and selections
> > >  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > >  
> > > @@ -668,3 +689,127 @@ To configure this pipeline, the userspace must take the following steps:
> > >     the configurations along the stream towards the receiver, using
> > >     :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>` ioctls to configure each
> > >     stream endpoint in each sub-device.
> > > +
> > > +Internal pads setup example
> > > +^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > +
> > > +A simple example of a multiplexed stream setup might be as follows:
> > > +
> > > +- An IMX219 camera sensor source sub-device, with one source pad (0), one
> > > +  internal sink pad (1) as the source of the image data and an internal sink
> > > +  pad (2) as the source of the embedded data. There are two routes, one from the
> > > +  internal sink pad 1 to the source 0 (image data) and another from the internal
> > 
> > s/source 0/source pad 0/
> 
> Yes.
> 
> > > +  sink pad 2 to the source pad 0 (embedded data). Both streams are always
> > > +  active, i.e. there is no need to separately enable the embedded data
> > > +  stream. The sensor uses the CSI-2 interface.
> > > +
> > > +- A CSI-2 receiver in the SoC. The receiver has a single sink pad (pad 0),
> > > +  connected to the sensor, and two source pads (pads 1 and 2), to the DMA
> > > +  engine. The receiver demultiplexes the incoming streams to the source pads.
> > 
> > s/engine/engines/
> > 
> > maybe better, "to two DMA engines".
> 
> "to the two DMA engines".
> 
> > > +
> > > +- DMA engines in the SoC, one for each stream. Each DMA engine is connected to a
> > > +  single source pad of the receiver.
> > > +
> > > +The sensor and the receiver are modelled as V4L2 sub-devices, exposed to
> > > +userspace via /dev/v4l-subdevX device nodes. The DMA engines are modelled as
> > > +V4L2 devices, exposed to userspace via /dev/videoX nodes.
> > > +
> > > +To configure this pipeline, the userspace must take the following steps:
> > > +
> > > +1) Set up media links between entities: enable the links from the sensor to the
> > > +   receiver and from the receiver to the DMA engines. This step does not differ
> > > +   from normal non-multiplexed media controller setup.
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
> > > +    * - 1/0
> > > +      - 0/0
> > > +      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> > > +      - Pixel data stream from the sink pad
> > 
> > "from the internal image sink pad"
> > 
> > > +    * - 2/0
> > > +      - 0/1
> > > +      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> > > +      - Metadata stream from the internal sink pad
> > 
> > "internal embedded data sink pad"
> 
> Yes...
> 
> > > +
> > > +.. flat-table:: Receiver routing table. Typically both routes need to be
> > > +		explicitly set.
> > > +    :header-rows:  1
> > > +
> > > +    * - Sink Pad/Stream
> > > +      - Source Pad/Stream
> > > +      - Routing Flags
> > > +      - Comments
> > > +    * - 0/0
> > > +      - 1/0
> > > +      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> > > +      - Pixel data stream from camera sensor
> > > +    * - 0/1
> > > +      - 2/0
> > > +      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> > > +      - Metadata stream from camera sensor
> > > +
> > > +The options available in sensor's routing configuration are dictated by hardware
> > 
> > s/in sensor/in the sensor/
> 
> Agreed.
> 
> > > +capabilities: typically camera sensors always produce an image data stream while
> > > +it may be possible to enable and disable the embedded data stream.
> > 
> > Should this go after the first table ?
> 
> I'll move it there.
> 
> > > +
> > > +3) Configure formats and selections
> > > +
> > > +   This example assumes that the formats are propagated from sink pad to the
> > > +   source pad as-is. The tables contain fields of both struct v4l2_subdev_format
> > > +   and struct v4l2_mbus_framefmt.
> > > +
> > > +.. flat-table:: Formats set on the sub-devices. Bold values are set, others are
> > > +                static or propagated. The order is aligned with configured
> > > +                routes.
> > > +    :header-rows: 1
> > > +    :fill-cells:
> > > +
> > > +    * - Sub-device
> > > +      - Pad/Stream
> > > +      - Width
> > > +      - Height
> > > +      - Code
> > > +    * - :rspan:`3` IMX219
> > > +      - 1/0
> > > +      - 3296
> > > +      - 2480
> > > +      - MEDIA_BUS_FMT_SRGGB10
> > > +    * - 0/0
> > > +      - **3296**
> > > +      - **2480**
> > > +      - **MEDIA_BUS_FMT_SRGGB10**
> > > +    * - 2/0
> > > +      - 3296
> > > +      - 2
> > > +      - MEDIA_BUS_FMT_IMX219_EMBEDDED
> > 
> > We need a patch in this series to define this format.
> 
> I'm waiting for your imx290 patches. :-)

I assume you mean imx219 :-) They will come, but we need to discuss
usage of internal pads for raw sensors first. That won't make it in time
for v6.10, I hope we'll be in time for v6.11.

> > > +    * - 1/1
> > 
> > I think this should be 0/1.
> 
> Good catch.
> 
> > > +      - 3296
> > > +      - 2
> > > +      - MEDIA_BUS_FMT_META_10
> > > +    * - :rspan:`3` CSI-2 receiver
> > > +      - 0/0
> > > +      - **3296**
> > > +      - **2480**
> > > +      - **MEDIA_BUS_FMT_SRGGB10**
> > > +    * - 1/0
> > > +      - 3296
> > > +      - 2480
> > > +      - MEDIA_BUS_FMT_SRGGB10
> > > +    * - 0/1
> > > +      - **3296**
> > > +      - **2**
> > > +      - **MEDIA_BUS_FMT_META_10**
> > > +    * - 2/0
> > > +      - 3296
> > > +      - 2
> > > +      - MEDIA_BUS_FMT_META_10
> > > +
> > > +The embedded data format does not need to be configured as the format is
> > 
> > Do you mean the "format on the sensor's pads" ? It's a bit confusing if
> > you don't specify it.
> 
> That's what was meant, I'll add that.
> 
> > > +dictated by the pixel data format in this case.

-- 
Regards,

Laurent Pinchart

