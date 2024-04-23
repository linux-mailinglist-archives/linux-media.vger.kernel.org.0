Return-Path: <linux-media+bounces-9897-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A07738AE221
	for <lists+linux-media@lfdr.de>; Tue, 23 Apr 2024 12:27:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60B302832CC
	for <lists+linux-media@lfdr.de>; Tue, 23 Apr 2024 10:27:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CBFF626DD;
	Tue, 23 Apr 2024 10:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KOjILEbm"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1632F60267
	for <linux-media@vger.kernel.org>; Tue, 23 Apr 2024 10:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713868040; cv=none; b=HgpHupMdrRpOmGtNVXVa00oeG7HDyP6FYhNmXXB98hcI+65ivniO+riCDu0R7GYkT3nfXJQVXfD/eHpijiaWMqbZO3uHNGymFZB2LgLN8RA0FsxByVrf5zF4Lpdf579ZGQgLre9W6BxetfQXCUb3YbmgF1gwnq3gn3CvdwtX0os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713868040; c=relaxed/simple;
	bh=u8rQjOv+9VXx5fMsSzKBcfdMk7M9kgw1aoL/hXBovzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cUM1y3tFZdzMbl/UJCbYelI9cN7ZjPPMqy5LMisfA6f50I21MI88bO2vtyhXOnvKPipZhCg59SlK/NPcDZw6pjvm21LAJiO7I+WuqeMGFEio1ePafGyfVYeCykxznLTqNEC9U4vMyXhkj237UqcGidVFQ2IFamWCJxpkQ+1cHOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KOjILEbm; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713868038; x=1745404038;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u8rQjOv+9VXx5fMsSzKBcfdMk7M9kgw1aoL/hXBovzo=;
  b=KOjILEbmO8kCTFv2QMkEFMSHUopT9S03FE6L8KS11bvN5vnXbr4nIoM3
   qncCsoXm1ZoNXncYnxXV2rLcKGfnYP+6moe6GG612RZm2nlvPfk2/7MBW
   Dr9G3xKpp8t9jdp67I+HEwqN6jgzhFjsHPlC51W9Umsb30R1jkKEEPSeV
   5HrkoEPYEcm/RiYPR6tD5xSghQR/knm6nlTdshg7F0Mu6uyp4bDBF4hIJ
   9OCVkZ1q3XCLKLGszx4VLi65HhovrgDr6TYJMLaM7xlZbIdVVpdrzV3VZ
   oBp8nXHeo/TBEQbgk1T6nOcW+kU/nXK+XeeL3QiC8nes6J9TdySHPOECw
   Q==;
X-CSE-ConnectionGUID: 7nPu8mgQS6eezj4KIq0lNg==
X-CSE-MsgGUID: 1QMoqWSKS1S8xRzE/uY7ng==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="13229493"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="13229493"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 03:27:17 -0700
X-CSE-ConnectionGUID: LaXJlFYMR+OVevC9KqQA0A==
X-CSE-MsgGUID: YhvXM9fsSSGeNdH8JGUQcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="55278809"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 03:27:14 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C99DE11FCCF;
	Tue, 23 Apr 2024 13:27:11 +0300 (EEST)
Date: Tue, 23 Apr 2024 10:27:11 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v9 10/46] media: Documentation: v4l: Document internal
 sink pads
Message-ID: <ZieM_xjmWxdcBx5r@kekkonen.localdomain>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
 <20240416193319.778192-11-sakari.ailus@linux.intel.com>
 <20240419184926.GI6414@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240419184926.GI6414@pendragon.ideasonboard.com>

Hi Laurent,

Thanks for the review!

On Fri, Apr 19, 2024 at 09:49:26PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Tue, Apr 16, 2024 at 10:32:43PM +0300, Sakari Ailus wrote:
> > Document internal sink pads, pads that have both SINK and INTERNAL flags
> > set. Use the IMX219 camera sensor as an example.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by Julien Massot <julien.massot@collabora.com>
> > ---
> >  .../userspace-api/media/v4l/dev-subdev.rst    | 145 ++++++++++++++++++
> >  1 file changed, 145 insertions(+)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > index b76e02e54512..d30dcb9e2537 100644
> > --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > @@ -553,6 +553,27 @@ A stream at a specific point in the media pipeline is identified by the
> >  sub-device and a (pad, stream) pair. For sub-devices that do not support
> >  multiplexed streams the 'stream' field is always 0.
> >  
> > +.. _v4l2-subdev-internal-source-pads:
> > +
> > +Internal sink pads and routing
> > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > +
> > +Cases where a single sub-device source pad is traversed by multiple streams, one
> > +or more of which originate from within the sub-device itself, are special as
> > +there is no external sink pad for such routes. In those cases, the sources of
> > +the internally generated streams are represented by internal sink pads, which
> > +are sink pads that have the :ref:`MEDIA_PAD_FL_INTERNAL <MEDIA-PAD-FL-INTERNAL>`
> > +pad flag set.
> > +
> > +Internal pads have all the properties of an external pad, including formats and
> > +selections. The format in this case is the source format of the stream. An
> > +internal pad always has a single stream only (0).
> > +
> > +Routes from an internal sink pad to an external source pad are typically not
> > +modifiable but they can be activated and deactivated using the
> > +:ref:`V4L2_SUBDEV_ROUTE_FL_ACTIVE <v4l2-subdev-routing-flags>` flag, depending
> > +on driver capabilities.
> > +
> >  Interaction between routes, streams, formats and selections
> >  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >  
> > @@ -668,3 +689,127 @@ To configure this pipeline, the userspace must take the following steps:
> >     the configurations along the stream towards the receiver, using
> >     :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>` ioctls to configure each
> >     stream endpoint in each sub-device.
> > +
> > +Internal pads setup example
> > +^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > +
> > +A simple example of a multiplexed stream setup might be as follows:
> > +
> > +- An IMX219 camera sensor source sub-device, with one source pad (0), one
> > +  internal sink pad (1) as the source of the image data and an internal sink
> > +  pad (2) as the source of the embedded data. There are two routes, one from the
> > +  internal sink pad 1 to the source 0 (image data) and another from the internal
> 
> s/source 0/source pad 0/

Yes.

> 
> > +  sink pad 2 to the source pad 0 (embedded data). Both streams are always
> > +  active, i.e. there is no need to separately enable the embedded data
> > +  stream. The sensor uses the CSI-2 interface.
> > +
> > +- A CSI-2 receiver in the SoC. The receiver has a single sink pad (pad 0),
> > +  connected to the sensor, and two source pads (pads 1 and 2), to the DMA
> > +  engine. The receiver demultiplexes the incoming streams to the source pads.
> 
> s/engine/engines/
> 
> maybe better, "to two DMA engines".

"to the two DMA engines".

> 
> > +
> > +- DMA engines in the SoC, one for each stream. Each DMA engine is connected to a
> > +  single source pad of the receiver.
> > +
> > +The sensor and the receiver are modelled as V4L2 sub-devices, exposed to
> > +userspace via /dev/v4l-subdevX device nodes. The DMA engines are modelled as
> > +V4L2 devices, exposed to userspace via /dev/videoX nodes.
> > +
> > +To configure this pipeline, the userspace must take the following steps:
> > +
> > +1) Set up media links between entities: enable the links from the sensor to the
> > +   receiver and from the receiver to the DMA engines. This step does not differ
> > +   from normal non-multiplexed media controller setup.
> > +
> > +2) Configure routing
> > +
> > +.. flat-table:: Camera sensor. There are no configurable routes.
> > +    :header-rows: 1
> > +
> > +    * - Sink Pad/Stream
> > +      - Source Pad/Stream
> > +      - Routing Flags
> > +      - Comments
> > +    * - 1/0
> > +      - 0/0
> > +      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> > +      - Pixel data stream from the sink pad
> 
> "from the internal image sink pad"
> 
> > +    * - 2/0
> > +      - 0/1
> > +      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> > +      - Metadata stream from the internal sink pad
> 
> "internal embedded data sink pad"

Yes...

> 
> > +
> > +.. flat-table:: Receiver routing table. Typically both routes need to be
> > +		explicitly set.
> > +    :header-rows:  1
> > +
> > +    * - Sink Pad/Stream
> > +      - Source Pad/Stream
> > +      - Routing Flags
> > +      - Comments
> > +    * - 0/0
> > +      - 1/0
> > +      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> > +      - Pixel data stream from camera sensor
> > +    * - 0/1
> > +      - 2/0
> > +      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> > +      - Metadata stream from camera sensor
> > +
> > +The options available in sensor's routing configuration are dictated by hardware
> 
> s/in sensor/in the sensor/

Agreed.

> 
> > +capabilities: typically camera sensors always produce an image data stream while
> > +it may be possible to enable and disable the embedded data stream.
> 
> Should this go after the first table ?

I'll move it there.

> 
> > +
> > +3) Configure formats and selections
> > +
> > +   This example assumes that the formats are propagated from sink pad to the
> > +   source pad as-is. The tables contain fields of both struct v4l2_subdev_format
> > +   and struct v4l2_mbus_framefmt.
> > +
> > +.. flat-table:: Formats set on the sub-devices. Bold values are set, others are
> > +                static or propagated. The order is aligned with configured
> > +                routes.
> > +    :header-rows: 1
> > +    :fill-cells:
> > +
> > +    * - Sub-device
> > +      - Pad/Stream
> > +      - Width
> > +      - Height
> > +      - Code
> > +    * - :rspan:`3` IMX219
> > +      - 1/0
> > +      - 3296
> > +      - 2480
> > +      - MEDIA_BUS_FMT_SRGGB10
> > +    * - 0/0
> > +      - **3296**
> > +      - **2480**
> > +      - **MEDIA_BUS_FMT_SRGGB10**
> > +    * - 2/0
> > +      - 3296
> > +      - 2
> > +      - MEDIA_BUS_FMT_IMX219_EMBEDDED
> 
> We need a patch in this series to define this format.

I'm waiting for your imx290 patches. :-)

> 
> > +    * - 1/1
> 
> I think this should be 0/1.

Good catch.

> 
> > +      - 3296
> > +      - 2
> > +      - MEDIA_BUS_FMT_META_10
> > +    * - :rspan:`3` CSI-2 receiver
> > +      - 0/0
> > +      - **3296**
> > +      - **2480**
> > +      - **MEDIA_BUS_FMT_SRGGB10**
> > +    * - 1/0
> > +      - 3296
> > +      - 2480
> > +      - MEDIA_BUS_FMT_SRGGB10
> > +    * - 0/1
> > +      - **3296**
> > +      - **2**
> > +      - **MEDIA_BUS_FMT_META_10**
> > +    * - 2/0
> > +      - 3296
> > +      - 2
> > +      - MEDIA_BUS_FMT_META_10
> > +
> > +The embedded data format does not need to be configured as the format is
> 
> Do you mean the "format on the sensor's pads" ? It's a bit confusing if
> you don't specify it.

That's what was meant, I'll add that.

> 
> > +dictated by the pixel data format in this case.
> 

-- 
Regards,

Sakari Ailus

