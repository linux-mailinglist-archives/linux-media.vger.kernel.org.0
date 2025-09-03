Return-Path: <linux-media+bounces-41732-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CABCB42ACE
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 22:25:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2964D582EB4
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 20:25:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F905291C19;
	Wed,  3 Sep 2025 20:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bRbd+v+O"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB962D94B9
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 20:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756931093; cv=none; b=F+UJtDBUu1KiFysHrARvbyQ6LrDmhyN5Qx9ocygyVPqtGyA/4y/DjcicLAbp3QmaKQZxH3g15rpnqDxc17JwmlKkIHXKXB2i3m3SP7dCjCSpHrg11MEmzkYRWtcfmFrztToFWMVSnZNzmhC7qoWSQlgSx6QzwUrzTv0UOaNYbT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756931093; c=relaxed/simple;
	bh=jjwBNJt6yt2YWmRJmjD0oWNOQZ6rA9A1Pi6M2hP7aFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WzRnUzO787UNaMv8DRwxmP+z4zSEFkbTK2DtGsm4RIKmFk2U+Qrve862zVvxFtXzt8EXDU4W1LVHfBzk4FHZBQWndHWsSgf7oye75P2hnkVOZ17qNvooSMM1NCcKty7vNi2keAx6nwcGz1LB3JcaQVd+MoDz6YkPK7I7jIi+eX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bRbd+v+O; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 27C6F928;
	Wed,  3 Sep 2025 22:23:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756931019;
	bh=jjwBNJt6yt2YWmRJmjD0oWNOQZ6rA9A1Pi6M2hP7aFQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bRbd+v+O85WUGb9/zXgfqnYP3DKtbg2+Fo/8HdSuJ1wBp0Gh1ubLmvBkW4TvZyb0c
	 JdpjX1A9/08G0SkfKbOY2UXQjZLTp3+T8Cv25BJhMqTT3OgncFwdnuCjL/qwubgDrP
	 lasAW3Jz7s81lqUl8sar/9ZCSpMd7vvutF0i0Uxo=
Date: Wed, 3 Sep 2025 22:24:26 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, hans@jjverkuil.nl,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v11 25/66] media: Documentation: v4l: Document internal
 sink pads
Message-ID: <20250903202426.GV3648@pendragon.ideasonboard.com>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-26-sakari.ailus@linux.intel.com>
 <6z6xfkco4aiwolh6by4srcu7ec2zwzy3c4psptmm5hxlaqnc3e@wlo6k35pcsys>
 <aLgx2XqEtd7Uh2w3@kekkonen.localdomain>
 <by4ftedqmvek3mqxv7zqizhyreotdyd2yoakcf2td5y52t5tzd@acibdthu3adr>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <by4ftedqmvek3mqxv7zqizhyreotdyd2yoakcf2td5y52t5tzd@acibdthu3adr>

On Wed, Sep 03, 2025 at 02:29:09PM +0200, Jacopo Mondi wrote:
> On Wed, Sep 03, 2025 at 03:17:29PM +0300, Sakari Ailus wrote:
> > On Mon, Sep 01, 2025 at 06:39:29PM +0200, Jacopo Mondi wrote:
> > > On Mon, Aug 25, 2025 at 12:50:26PM +0300, Sakari Ailus wrote:
> > > > Document internal sink pads, pads that have both SINK and INTERNAL flags
> > > > set. Use the IMX219 camera sensor as an example.
> > > >
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > Reviewed-by Julien Massot <julien.massot@collabora.com>
> > > > ---
> > > >  .../userspace-api/media/v4l/dev-subdev.rst    | 151 ++++++++++++++++++
> > > >  .../media/v4l/ext-ctrls-image-source.rst      |   2 +
> > > >  2 files changed, 153 insertions(+)
> > > >
> > > > diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > > index 4da67ee0b290..bb86cadfad1c 100644
> > > > --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > > +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > > @@ -553,6 +553,27 @@ A stream at a specific point in the media pipeline is identified by the
> > > >  sub-device and a (pad, stream) pair. For sub-devices that do not support
> > > >  multiplexed streams the 'stream' field is always 0.
> > > >
> > > > +.. _v4l2-subdev-internal-source-pads:
> > > > +
> > > > +Internal sink pads and routing
> > > > +------------------------------
> > > > +
> > > > +Cases where a single sub-device source pad is traversed by multiple streams, one

s/is traversed by/carries/

> > > > +or more of which originate from within the sub-device itself, are special as
> > > > +there is no external sink pad for such routes. In those cases, the sources of
> > > > +the internally generated streams are represented by internal sink pads, which
> > > > +are sink pads that have the :ref:`MEDIA_PAD_FL_INTERNAL <MEDIA-PAD-FL-INTERNAL>`
> > > > +pad flag set.
> > > > +
> > > > +Internal pads have all the properties of an external pad, including formats and
> > > > +selections. The format in this case is the source format of the stream. An

I'd add "[...] and selections, but can not be connect to other subdevs
through links."

> > > > +internal pad always has a single stream only (0).

I already have one use case (related to HDR) that could violate this
rule. I'm fine with it for now, we can always relax it later, but I'd
like to know your opinion on the concept.

> > > > +
> > > > +Routes from an internal sink pad to an external source pad are typically not
> > > > +modifiable but they can be activated and deactivated using the
> > > > +:ref:`V4L2_SUBDEV_ROUTE_FL_ACTIVE <v4l2-subdev-routing-flags>` flag, depending
> > > > +on driver capabilities.
> > >
> > > Ah, so they are modifiable :)

I was going to mention the same :-)

> > > What about
> > >
> > > Routes from an internal sink pad to an external source pad are
> > > typically created by the driver and can be activated and deactivated
> > > using the :ref:`V4L2_SUBDEV_ROUTE_FL_ACTIVE
> > > <v4l2-subdev-routing-flags>` flag, depending on the device
> > > capabilities.

I'd drop "typically" as (I think) they are always created by the driver.
We could use the word "static" already.

Routes from an internal sink pad to an external source pad are
statically created by the driver. They are or are not immutable
depending on the device capabities. The routes that are not immutable
can be activated and deactivated using the
:ref:`V4L2_SUBDEV_ROUTE_FL_ACTIVE <v4l2-subdev-routing-flags>` flag.

(we could possibly drop the last sentence as it's implied by not being
immutable, but it doesn't hurt to have the information here)

> > I'll use that.
> >
> > > > +
> > > >  Interaction between routes, streams, formats and selections
> > > >  -----------------------------------------------------------
> > > >
> > > > @@ -695,3 +716,133 @@ To configure this pipeline, the userspace must take the following steps:
> > > >     the configurations along the stream towards the receiver, using
> > > >     :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>` ioctls to configure each
> > > >     stream endpoint in each sub-device.
> > > > +
> > > > +   In case generic raw and metadata formats are used,
> > > > +   :ref:`V4L2_CID_COLOR_PATTERN <image-source-control-color-pattern>` and
> > > > +   :ref:`V4L2_CID_METADATA_LAYOUT <image_source_control_metadata_layout>`
> > > > +   controls are present on the source sub-device to obtain the pixel data color
> > > > +   pattern and metadata layout.

s/pixel data color pattern/pixel array CFA pattern/

(or you can spell out color filter array)

> > > > +
> > > > +Internal pads setup example
> > > > +---------------------------
> > > > +
> > > > +A simple example of a multiplexed stream setup might be as follows:
> > > > +
> > > > +- An IMX219 camera sensor source sub-device, with one source pad (0), one
> > >
> > > s/sensor source/sensor/
> >
> > Source sub-device is referred to in documentation elsewhere; I think it's
> > appropriate here, too.
> >
> > > Should we even mention imx219 or can this be a generic "RAW camera
> > > sensor" ?
> >
> > As this is an example, I think it's a good idea to use an actual device and
> > a driver that has support for internal pads.
> >
> > > > +  internal sink pad (1) as the source of the image data and an internal sink
> > > > +  pad (2) as the source of the embedded data. There are two routes, one from the
> > >
> > > I would provide a rational for the reason why the external source pad
> > > is preferably assigned to id 0.
> > >
> > >    - A RAW camera sensor driver modeled as a single sub-device with
> > >      three pads. The external source pas is assigned id #0 for
> > >      compatibility reasons with existing user-space applications
> > >      developed to work on drivers that pre-dates the introduction of
> > >      internal pads, where the only available pad was the external
> > >      source one. The sub-device also has two internal sink pads, pad
> > >      #1 that represents the pixel array and produces image data and
> > >      pad #2 that produces embedded data.
> >
> > I'd put this to driver documentation as it's not part of the UAPI.
> 
> mmmm, it's true we don't mandate for new drivers to have
> the source pad at index #0, and it's done only for existing drivers..
> Adn userspace should not make assumptions about pad numbers but rather
> inspect the per-pad flags to know which one is the external source pad.
> 
> So yes, it's no uAPI you're right.

That may be possible for camera sensors, but in general the pad numbers
may be part of the UAPI as there may not be any other way to tell pads
apart on some subdevs.

For camera sensors, I would document the pad numbers explicitly in the
raw camera sensor subdev configuration model, and make them part of the
UAPI. I wouldn't explain the rationale here.

> > >
> > >      There are two routes, one from the internal sink pad 1...
> > >
> > > > +  internal sink pad 1 to the source pad 0 (image data) and another from the
> > > > +  internal sink pad 2 to the source pad 0 (embedded data). Both streams are
> > > > +  always active, i.e. there is no need to separately enable the embedded data
> > > > +  stream. The sensor uses the CSI-2 interface.
> > > > +
> > > > +- A CSI-2 receiver in the SoC. The receiver has a single sink pad (pad 0),
> > > > +  connected to the sensor, and two source pads (pads 1 and 2), to the two DMA

s/the sensor/the sensor's source pad (0)/
s/the two/two/

> > > > +  engines. The receiver demultiplexes the incoming streams to the source pads.
> > > > +
> > > > +- DMA engines in the SoC, one for each stream. Each DMA engine is connected to a

s/DMA engines/Two DMA engines/

> > > > +  single source pad of the receiver.

s/single/different/

> > > > +
> > > > +The sensor and the receiver are modelled as V4L2 sub-devices, exposed to
> > > > +userspace via /dev/v4l-subdevX device nodes. The DMA engines are modelled as
> > > > +V4L2 devices, exposed to userspace via /dev/videoX nodes.

s/V4L2 devices/V4L2 video devices/

> > > > +
> > > > +To configure this pipeline, the userspace must take the following steps:
> > > > +
> > > > +1) Set up media links between entities: enable the links from the sensor to the
> > > > +   receiver and from the receiver to the DMA engines. This step does not differ
> > > > +   from normal non-multiplexed media controller setup.
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
> > > > +    * - 1/0
> > > > +      - 0/0
> > > > +      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> > >
> > > Is this also V4L2_SUBDEV_ROUTE_FL_IMMUTABLE ?
> >
> > Yes, and V4L2_SUBDEV_ROUTE_FL_STATIC. I'll update the example.
> >
> > In practice the patch needs to be moved forwards in the set so we'll have
> > all the flags.
> 
> Yeah, I noticed later those two flags have been introduced later in
> the series..
> 
> > > > +      - Pixel data stream from the internal image sink pad
> > > > +    * - 2/0
> > > > +      - 0/1
> > > > +      - V4L2_SUBDEV_ROUTE_FL_ACTIVE

I assume this one is also static and immutable.

> > > > +      - Metadata stream from the internal embedded data sink pad
> > > > +
> > > > +The options available in the sensor's routing configuration are dictated by
> > > > +hardware capabilities: typically camera sensors always produce an image data
> > >
> > > s/typically/some
> >
> > "Some" would suggest this may not be very common whereas I think this
> > applies virtually to all camera sensors.
> 
> Ok!
> 
> > > > +stream while it may be possible to enable and disable the embedded data stream.

The section provides one particular example, based on the imx219, and
then this paragraph documents a more generic concept. It's unclear if it
applies to the imx219 as well. If you want to keep it, I would phrase it
along the lines of

While both routes are immutable for the IMX219, other camera sensors may
offer more flexible configuration options. Routing configuration is
dictated by the hardware capabilities: camera sensors typically always
produce an image data stream, but some of them support enabling and
disabling the embedded data stream.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> > >
> > > s/it may be possible/other might allow
> > >
> > > if you accept my suggestion in the line above
> > >
> > > > +
> > > > +.. flat-table:: Receiver routing table. Typically both routes need to be
> > > > +		explicitly set.
> > >
> > > set or enabled ?
> >
> > On the receiver side, the routes are also created, not just enabled. I'll
> > use "created".
> 
> fine as well
> 
> > > > +    :header-rows:  1
> > > > +
> > > > +    * - Sink Pad/Stream
> > > > +      - Source Pad/Stream
> > > > +      - Routing Flags
> > > > +      - Comments
> > > > +    * - 0/0
> > > > +      - 1/0
> > > > +      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> > > > +      - Pixel data stream from camera sensor
> > > > +    * - 0/1
> > > > +      - 2/0
> > > > +      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> > > > +      - Metadata stream from camera sensor
> > > > +
> > > > +3) Configure formats and selections
> > > > +
> > > > +   This example assumes that the formats are propagated from sink pad to the
> > > > +   source pad as-is. The tables contain fields of both struct v4l2_subdev_format
> > > > +   and struct v4l2_mbus_framefmt.
> > > > +
> > > > +.. flat-table:: Formats set on the sub-devices. Bold values are set, others are
> > > > +                static or propagated. The order is aligned with configured
> > > > +                routes.
> > > > +    :header-rows: 1
> > > > +    :fill-cells:
> > > > +
> > > > +    * - Sub-device
> > > > +      - Pad/Stream
> > > > +      - Width
> > > > +      - Height
> > > > +      - Code
> > > > +    * - :rspan:`3` IMX219
> > >
> > > If you want to make this generic, I would replace IMX219 with just
> > > "Sensor"
> > >
> > > > +      - 1/0
> > > > +      - 3296
> > > > +      - 2480
> > > > +      - MEDIA_BUS_FMT_RAW_10
> > > > +    * - 0/0
> > > > +      - **3296**
> > > > +      - **2480**
> > > > +      - **MEDIA_BUS_FMT_RAW_10**
> > > > +    * - 2/0
> > > > +      - 3296
> > > > +      - 2
> > > > +      - MEDIA_BUS_FMT_META_10
> > > > +    * - 0/1
> > > > +      - 3296
> > > > +      - 2
> > > > +      - MEDIA_BUS_FMT_META_10
> > > > +    * - :rspan:`3` CSI-2 receiver
> > > > +      - 0/0
> > > > +      - **3296**
> > > > +      - **2480**
> > > > +      - **MEDIA_BUS_FMT_RAW_10**
> > > > +    * - 1/0
> > > > +      - 3296
> > > > +      - 2480
> > > > +      - MEDIA_BUS_FMT_RAW_10
> > > > +    * - 0/1
> > > > +      - **3296**
> > > > +      - **2**
> > > > +      - **MEDIA_BUS_FMT_META_10**
> > > > +    * - 2/0
> > > > +      - 3296
> > > > +      - 2
> > > > +      - MEDIA_BUS_FMT_META_10
> > > > +
> > > > +The embedded data format does not need to be configured on the sensor's pads as
> > > > +the format is dictated by the pixel data format in this case.
> > > > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > > > index 64c0f9ff5b1b..d803a2f0f2f9 100644
> > > > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > > > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > > > @@ -146,6 +146,8 @@ Image Source Control IDs
> > > >      ``V4L2_COLOR_PATTERN_FLIP_HORIZONTAL`` and
> > > >      ``V4L2_COLOR_PATTERN_FLIP_VERTICAL`` is provided as well.
> > > >
> > > > +.. _image_source_control_metadata_layout:
> > > > +
> > >
> > > All comments I made are just suggestions, so take in what you like.
> > >
> > > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> >
> > Thanks!
> >
> > > >  ``V4L2_CID_METADATA_LAYOUT (integer)``
> > > >      The metadata layout control defines the on-bus metadata layout for metadata
> > > >      streams. The control is used in conjunction with :ref:`generic metadata

-- 
Regards,

Laurent Pinchart

