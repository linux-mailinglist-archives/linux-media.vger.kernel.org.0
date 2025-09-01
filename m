Return-Path: <linux-media+bounces-41468-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CD1B3EC63
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 18:39:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9542C208411
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 16:39:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 555192EF66A;
	Mon,  1 Sep 2025 16:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KwF9ZOBU"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5494B2DF156
	for <linux-media@vger.kernel.org>; Mon,  1 Sep 2025 16:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756744780; cv=none; b=uxz6XRHVbQsucn5itAFW4JdIn7gkfzplr7cBJ/V6oFSkUu46mlEqCGHCYA6MSb/zayFWO5sYvA1rgB5JyEMiVQ47ORjw/K557IKEQTluDMc+WFrj7QcsPkwhKRE4bH5yh8vr+5rWL8/UzajMq7PoIUkrXBk6GNr21N5WywIZFX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756744780; c=relaxed/simple;
	bh=+iTp9nOFymVZ8wIWzZbdLXwi9xEgyT/5JqqFaEHDusw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m23mBtdGsBLq9tnOX1WhLbDS74awA8FQdijWWTCtsAVpX/EuigghYXffeFKsLp+rq5TIFfepmvZP+JoZOmoyt7lyM/B5TZD672ecRwrUU6fBrqJcqHlZkcpW6r9DBeB1aoP7EPBZm05VAPAzR27PtbI/AeWoSA1gx2LfMaOsPy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KwF9ZOBU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-63-95.net.vodafone.it [5.90.63.95])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4268DE45;
	Mon,  1 Sep 2025 18:38:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756744706;
	bh=+iTp9nOFymVZ8wIWzZbdLXwi9xEgyT/5JqqFaEHDusw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KwF9ZOBUu32Zw95sSvNjfgA23qRBPJPJ9Dwx3eAwF/AxHBw9gW++EvgHT64AEhpHK
	 8paHLe63cA84rrNwnz71rk8jhJg9q21Y69FFETZR207oownY3YBWyL/cX6bpmwqFc8
	 /l2DV/pyvk2g1qMbYqKu5I4TSOocJqhBBRZd0WnI=
Date: Mon, 1 Sep 2025 18:39:29 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl, 
	laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>, 
	Kate Hsuan <hpa@redhat.com>, Alexander Shiyan <eagle.alexander923@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Tommaso Merciai <tomm.merciai@gmail.com>, 
	Umang Jain <umang.jain@ideasonboard.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Julien Massot <julien.massot@collabora.com>, Naushir Patuck <naush@raspberrypi.com>, 
	"Yan, Dongcheng" <dongcheng.yan@intel.com>, "Cao, Bingbu" <bingbu.cao@intel.com>, 
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>, "Wang, Hongju" <hongju.wang@intel.com>, 
	Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, 
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Ricardo Ribalda Delgado <ribalda@kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v11 25/66] media: Documentation: v4l: Document internal
 sink pads
Message-ID: <6z6xfkco4aiwolh6by4srcu7ec2zwzy3c4psptmm5hxlaqnc3e@wlo6k35pcsys>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-26-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250825095107.1332313-26-sakari.ailus@linux.intel.com>

Hi Sakari

On Mon, Aug 25, 2025 at 12:50:26PM +0300, Sakari Ailus wrote:
> Document internal sink pads, pads that have both SINK and INTERNAL flags
> set. Use the IMX219 camera sensor as an example.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by Julien Massot <julien.massot@collabora.com>
> ---
>  .../userspace-api/media/v4l/dev-subdev.rst    | 151 ++++++++++++++++++
>  .../media/v4l/ext-ctrls-image-source.rst      |   2 +
>  2 files changed, 153 insertions(+)
>
> diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> index 4da67ee0b290..bb86cadfad1c 100644
> --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> @@ -553,6 +553,27 @@ A stream at a specific point in the media pipeline is identified by the
>  sub-device and a (pad, stream) pair. For sub-devices that do not support
>  multiplexed streams the 'stream' field is always 0.
>
> +.. _v4l2-subdev-internal-source-pads:
> +
> +Internal sink pads and routing
> +------------------------------
> +
> +Cases where a single sub-device source pad is traversed by multiple streams, one
> +or more of which originate from within the sub-device itself, are special as
> +there is no external sink pad for such routes. In those cases, the sources of
> +the internally generated streams are represented by internal sink pads, which
> +are sink pads that have the :ref:`MEDIA_PAD_FL_INTERNAL <MEDIA-PAD-FL-INTERNAL>`
> +pad flag set.
> +
> +Internal pads have all the properties of an external pad, including formats and
> +selections. The format in this case is the source format of the stream. An
> +internal pad always has a single stream only (0).
> +
> +Routes from an internal sink pad to an external source pad are typically not
> +modifiable but they can be activated and deactivated using the
> +:ref:`V4L2_SUBDEV_ROUTE_FL_ACTIVE <v4l2-subdev-routing-flags>` flag, depending
> +on driver capabilities.

Ah, so they are modifiable :)

What about

Routes from an internal sink pad to an external source pad are
typically created by the driver and can be activated and deactivated
using the :ref:`V4L2_SUBDEV_ROUTE_FL_ACTIVE
<v4l2-subdev-routing-flags>` flag, depending on the device
capabilities.

> +
>  Interaction between routes, streams, formats and selections
>  -----------------------------------------------------------
>
> @@ -695,3 +716,133 @@ To configure this pipeline, the userspace must take the following steps:
>     the configurations along the stream towards the receiver, using
>     :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>` ioctls to configure each
>     stream endpoint in each sub-device.
> +
> +   In case generic raw and metadata formats are used,
> +   :ref:`V4L2_CID_COLOR_PATTERN <image-source-control-color-pattern>` and
> +   :ref:`V4L2_CID_METADATA_LAYOUT <image_source_control_metadata_layout>`
> +   controls are present on the source sub-device to obtain the pixel data color
> +   pattern and metadata layout.
> +
> +Internal pads setup example
> +---------------------------
> +
> +A simple example of a multiplexed stream setup might be as follows:
> +
> +- An IMX219 camera sensor source sub-device, with one source pad (0), one

s/sensor source/sensor/

Should we even mention imx219 or can this be a generic "RAW camera
sensor" ?


> +  internal sink pad (1) as the source of the image data and an internal sink
> +  pad (2) as the source of the embedded data. There are two routes, one from the

I would provide a rational for the reason why the external source pad
is preferably assigned to id 0.

   - A RAW camera sensor driver modeled as a single sub-device with
     three pads. The external source pas is assigned id #0 for
     compatibility reasons with existing user-space applications
     developed to work on drivers that pre-dates the introduction of
     internal pads, where the only available pad was the external
     source one. The sub-device also has two internal sink pads, pad
     #1 that represents the pixel array and produces image data and
     pad #2 that produces embedded data.

     There are two routes, one from the internal sink pad 1...

> +  internal sink pad 1 to the source pad 0 (image data) and another from the
> +  internal sink pad 2 to the source pad 0 (embedded data). Both streams are
> +  always active, i.e. there is no need to separately enable the embedded data
> +  stream. The sensor uses the CSI-2 interface.
> +
> +- A CSI-2 receiver in the SoC. The receiver has a single sink pad (pad 0),
> +  connected to the sensor, and two source pads (pads 1 and 2), to the two DMA
> +  engines. The receiver demultiplexes the incoming streams to the source pads.
> +
> +- DMA engines in the SoC, one for each stream. Each DMA engine is connected to a
> +  single source pad of the receiver.
> +
> +The sensor and the receiver are modelled as V4L2 sub-devices, exposed to
> +userspace via /dev/v4l-subdevX device nodes. The DMA engines are modelled as
> +V4L2 devices, exposed to userspace via /dev/videoX nodes.
> +
> +To configure this pipeline, the userspace must take the following steps:
> +
> +1) Set up media links between entities: enable the links from the sensor to the
> +   receiver and from the receiver to the DMA engines. This step does not differ
> +   from normal non-multiplexed media controller setup.
> +
> +2) Configure routing
> +
> +.. flat-table:: Camera sensor. There are no configurable routes.
> +    :header-rows: 1
> +
> +    * - Sink Pad/Stream
> +      - Source Pad/Stream
> +      - Routing Flags
> +      - Comments
> +    * - 1/0
> +      - 0/0
> +      - V4L2_SUBDEV_ROUTE_FL_ACTIVE

Is this also V4L2_SUBDEV_ROUTE_FL_IMMUTABLE ?

> +      - Pixel data stream from the internal image sink pad
> +    * - 2/0
> +      - 0/1
> +      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> +      - Metadata stream from the internal embedded data sink pad
> +
> +The options available in the sensor's routing configuration are dictated by
> +hardware capabilities: typically camera sensors always produce an image data

s/typically/some

> +stream while it may be possible to enable and disable the embedded data stream.

s/it may be possible/other might allow

if you accept my suggestion in the line above

> +
> +.. flat-table:: Receiver routing table. Typically both routes need to be
> +		explicitly set.

set or enabled ?

> +    :header-rows:  1
> +
> +    * - Sink Pad/Stream
> +      - Source Pad/Stream
> +      - Routing Flags
> +      - Comments
> +    * - 0/0
> +      - 1/0
> +      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> +      - Pixel data stream from camera sensor
> +    * - 0/1
> +      - 2/0
> +      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> +      - Metadata stream from camera sensor
> +
> +3) Configure formats and selections
> +
> +   This example assumes that the formats are propagated from sink pad to the
> +   source pad as-is. The tables contain fields of both struct v4l2_subdev_format
> +   and struct v4l2_mbus_framefmt.
> +
> +.. flat-table:: Formats set on the sub-devices. Bold values are set, others are
> +                static or propagated. The order is aligned with configured
> +                routes.
> +    :header-rows: 1
> +    :fill-cells:
> +
> +    * - Sub-device
> +      - Pad/Stream
> +      - Width
> +      - Height
> +      - Code
> +    * - :rspan:`3` IMX219

If you want to make this generic, I would replace IMX219 with just
"Sensor"

> +      - 1/0
> +      - 3296
> +      - 2480
> +      - MEDIA_BUS_FMT_RAW_10
> +    * - 0/0
> +      - **3296**
> +      - **2480**
> +      - **MEDIA_BUS_FMT_RAW_10**
> +    * - 2/0
> +      - 3296
> +      - 2
> +      - MEDIA_BUS_FMT_META_10
> +    * - 0/1
> +      - 3296
> +      - 2
> +      - MEDIA_BUS_FMT_META_10
> +    * - :rspan:`3` CSI-2 receiver
> +      - 0/0
> +      - **3296**
> +      - **2480**
> +      - **MEDIA_BUS_FMT_RAW_10**
> +    * - 1/0
> +      - 3296
> +      - 2480
> +      - MEDIA_BUS_FMT_RAW_10
> +    * - 0/1
> +      - **3296**
> +      - **2**
> +      - **MEDIA_BUS_FMT_META_10**
> +    * - 2/0
> +      - 3296
> +      - 2
> +      - MEDIA_BUS_FMT_META_10
> +
> +The embedded data format does not need to be configured on the sensor's pads as
> +the format is dictated by the pixel data format in this case.
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> index 64c0f9ff5b1b..d803a2f0f2f9 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> @@ -146,6 +146,8 @@ Image Source Control IDs
>      ``V4L2_COLOR_PATTERN_FLIP_HORIZONTAL`` and
>      ``V4L2_COLOR_PATTERN_FLIP_VERTICAL`` is provided as well.
>
> +.. _image_source_control_metadata_layout:
> +

All comments I made are just suggestions, so take in what you like.

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

>  ``V4L2_CID_METADATA_LAYOUT (integer)``
>      The metadata layout control defines the on-bus metadata layout for metadata
>      streams. The control is used in conjunction with :ref:`generic metadata
> --
> 2.47.2
>
>

