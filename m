Return-Path: <linux-media+bounces-35491-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D4DAE1B1E
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 14:44:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B0E924A7701
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 12:44:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFBAC28B4FD;
	Fri, 20 Jun 2025 12:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fqTPeLf2"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5399428A407
	for <linux-media@vger.kernel.org>; Fri, 20 Jun 2025 12:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750423437; cv=none; b=uF3fZtwmUC/HQrWJ8cdFyV1N9ETC0pTo65wwrPye4PB52aTzxXgI7cTEZHpqlNf1JYD70Rbrp4XyjxPL/HhMpkXaYoCp4jQz6bpq73bHofAMJRZhG7Rtz42LLCG27cEBgMkMkDfsJo8CiUIfz0FqFnoSAGARoLSYrNpGJWwq5G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750423437; c=relaxed/simple;
	bh=4u6vEwF3ERv0RVQDn/o0wc6bdHgX0A0OdPAXSvFCiKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uHklQZy3nn52P1FyuhPTsrc3Qs6zzax6DB1A94NTdyiLUocsJn5f1huI86itE2pcVSxJYSnCDBQ+DRnZyjT+VSR+0nFsyS1O+rolL2yyCtzplG1TQIATFQY79ZbXU8sfZ7a448Mv+auaqPGuwh1CEfNWoxEz585A/aJK0Wwx6fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fqTPeLf2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 532537FA;
	Fri, 20 Jun 2025 14:43:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750423411;
	bh=4u6vEwF3ERv0RVQDn/o0wc6bdHgX0A0OdPAXSvFCiKE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fqTPeLf2f99B3Avr8eUd9qvCQ5pwPDRGAn4CNzp9mcLQPtZjBsVo02GQYUrU7ZjKp
	 1tosHSt7hU1P8zxuu7TI2lu9En5giuggPlaK5XNbRfMveK8kFRehwBSjp1a1BYDdLg
	 783ppNgidY2QQxTGL8Heug5aGwxcYmLARDUIR2AE=
Date: Fri, 20 Jun 2025 14:43:42 +0200
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
Subject: Re: [PATCH v10 22/64] media: Documentation: v4l: Document internal
 sink pads
Message-ID: <xsl4dccmd3ulakeys6sg37mcj6hjor3hzavuitjfvxf6we2drs@qdpvyf5rrmxo>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
 <20250619115836.1946016-23-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250619115836.1946016-23-sakari.ailus@linux.intel.com>

Hi Sakari

On Thu, Jun 19, 2025 at 02:57:54PM +0300, Sakari Ailus wrote:
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
> index 24a69c419dfe..835e910d4391 100644
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

This might explain the use of V4L2_SUBDEV_ROUTE_FL_ACTIVE I asked
about in a previous patch review

> +
>  Interaction between routes, streams, formats and selections
>  -----------------------------------------------------------
>
> @@ -691,3 +712,133 @@ To configure this pipeline, the userspace must take the following steps:
>     the configurations along the stream towards the receiver, using
>     :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>` ioctls to configure each
>     stream endpoint in each sub-device.
> +
> +   In case generic raw and metadata formats are used,

Shouldn't we suggest/mandate to use those generic formats in the
documentation (and in new drivers)

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
> +  internal sink pad (1) as the source of the image data and an internal sink
> +  pad (2) as the source of the embedded data. There are two routes, one from the
> +  internal sink pad 1 to the source pad 0 (image data) and another from the
> +  internal sink pad 2 to the source pad 0 (embedded data). Both streams are
> +  always active, i.e. there is no need to separately enable the embedded data
> +  stream. The sensor uses the CSI-2 interface.

I would add that the fact that streams are always active is a device
specific feature, andother sensors might allow to enable/disable the
embedded data route.

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

Is "There are no configurable routes." helpful ?

> +    :header-rows: 1
> +
> +    * - Sink Pad/Stream
> +      - Source Pad/Stream
> +      - Routing Flags
> +      - Comments
> +    * - 1/0
> +      - 0/0
> +      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> +      - Pixel data stream from the internal image sink pad
> +    * - 2/0
> +      - 0/1
> +      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> +      - Metadata stream from the internal embedded data sink pad
> +
> +The options available in the sensor's routing configuration are dictated by
> +hardware capabilities: typically camera sensors always produce an image data
> +stream while it may be possible to enable and disable the embedded data stream.
> +
> +.. flat-table:: Receiver routing table. Typically both routes need to be
> +		explicitly set.
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
> +      - 1/0
> +      - 3296
> +      - 2480
> +      - MEDIA_BUS_FMT_RAW_10
> +    * - 0/0
> +      - **3296**
> +      - **2480**
> +      - **MEDIA_BUS_FMT_RAW_10**

In my understanding fields in bolds are set explicitly. Howver formats
are propagated from sinks to source, and pad 0/0 is a source. Is this
correct ?

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

I would "generic embedded data format"

> +the format is dictated by the pixel data format in this case.

is dictated or "depends"/"follows"/ etc ?

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
>  ``V4L2_CID_METADATA_LAYOUT (integer)``
>      The metadata layout control defines the on-bus metadata layout for metadata
>      streams. The control is used in conjunction with :ref:`generic metadata
> --
> 2.39.5
>
>

