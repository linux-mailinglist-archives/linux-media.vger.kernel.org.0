Return-Path: <linux-media+bounces-5866-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D52F8862D20
	for <lists+linux-media@lfdr.de>; Sun, 25 Feb 2024 22:23:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3075FB211B4
	for <lists+linux-media@lfdr.de>; Sun, 25 Feb 2024 21:23:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3902F1B953;
	Sun, 25 Feb 2024 21:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lV4cnoAy"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DBA16419;
	Sun, 25 Feb 2024 21:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708896185; cv=none; b=H7lZL0hi7Okt+M90SLC1BxxGEzWS5MLE2iBVstX/GdpJVJGf4ZIsf6BePOQN5VRiRk+YP+FfqeBdb/J6utEev2sp/ZFMYlcX5wtuhlwGrhmW7Os5qepRO03NJeME/WrgmdXJ5nxKJzTNHEKnFBhjWL6d9JGINTnXO3v15RpBH/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708896185; c=relaxed/simple;
	bh=9nvp1cNaPSzmnAzSEznqyw+/2NCRF7TjQN6L8jjSDhA=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=mRuhv8hpIj+SDU44xdlmm5g/3tsBLwZ4/f7Kf8a6BPvkakD7Sayebbff/uFEVhJERcECRLymQQXPnHCyNwc3ifGT+b4l1J10dm6Dom4+eNDbyk2VYDPB3+nGPY+05xuzXvqO4i4WWI7BlBd3fTLToKEbrxrNaCmzaghTwvVXMjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lV4cnoAy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CD74D8C;
	Sun, 25 Feb 2024 22:22:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1708896163;
	bh=9nvp1cNaPSzmnAzSEznqyw+/2NCRF7TjQN6L8jjSDhA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=lV4cnoAyE+JeNbzjOyBFzMxA/vo9Y+m1rKo4S1+SSoqo4I7eWGd1uz2qPxPvzN8cX
	 V8SiiC8hgqDDC+jTYOlC1LunPFFVrOUUvQlpgIzyimZG3iO14tjO+xwh6p9Exa5YlO
	 SuF4+5K49bDfCrsXfaHcUEd8wAQlNgw0hUagf7LA=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240214141906.245685-5-dan.scally@ideasonboard.com>
References: <20240214141906.245685-1-dan.scally@ideasonboard.com> <20240214141906.245685-5-dan.scally@ideasonboard.com>
Subject: Re: [PATCH v2 4/5] media: Documentation: Add Mali-C55 ISP Documentation
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: jacopo.mondi@ideasonboard.com, nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jerome.forissier@linaro.org, laurent.pinchart@ideasonboard.com, Daniel Scally <dan.scally@ideasonboard.com>
To: Daniel Scally <dan.scally@ideasonboard.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Date: Sun, 25 Feb 2024 21:22:52 +0000
Message-ID: <170889617240.914352.11519004661256637360@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Hi Dan,

Quoting Daniel Scally (2024-02-14 14:19:05)
> Add a documentation page for the mali-c55 driver, which gives a brief
> overview of the hardware and explains how to use the driver's capture
> devices and the crop/scaler functions.
>=20
> Acked-by: Nayden Kanchev <nayden.kanchev@arm.com>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
> Changes in v2:
>=20
>         - none
>=20
>  .../admin-guide/media/mali-c55-graph.dot      |  19 ++
>  Documentation/admin-guide/media/mali-c55.rst  | 318 ++++++++++++++++++
>  .../admin-guide/media/v4l-drivers.rst         |   1 +
>  3 files changed, 338 insertions(+)
>  create mode 100644 Documentation/admin-guide/media/mali-c55-graph.dot
>  create mode 100644 Documentation/admin-guide/media/mali-c55.rst
>=20
> diff --git a/Documentation/admin-guide/media/mali-c55-graph.dot b/Documen=
tation/admin-guide/media/mali-c55-graph.dot
> new file mode 100644
> index 000000000000..0775ba42bf4c
> --- /dev/null
> +++ b/Documentation/admin-guide/media/mali-c55-graph.dot
> @@ -0,0 +1,19 @@
> +digraph board {
> +        rankdir=3DTB
> +        n00000001 [label=3D"{{} | mali-c55 tpg\n/dev/v4l-subdev0 | {<por=
t0> 0}}", shape=3DMrecord, style=3Dfilled, fillcolor=3Dgreen]
> +        n00000001:port0 -> n00000003:port0 [style=3Ddashed]
> +        n00000003 [label=3D"{{<port0> 0} | mali-c55 isp\n/dev/v4l-subdev=
1 | {<port1> 1 | <port2> 2}}", shape=3DMrecord, style=3Dfilled, fillcolor=
=3Dgreen]
> +        n00000003:port1 -> n00000007:port0 [style=3Dbold]
> +        n00000003:port2 -> n00000007:port2 [style=3Dbold]
> +        n00000003:port1 -> n0000000b:port0 [style=3Dbold]
> +        n00000007 [label=3D"{{<port0> 0 | <port2> 2} | mali-c55 resizer =
fr\n/dev/v4l-subdev2 | {<port1> 1}}", shape=3DMrecord, style=3Dfilled, fill=
color=3Dgreen]
> +        n00000007:port1 -> n0000000e [style=3Dbold]
> +        n0000000b [label=3D"{{<port0> 0} | mali-c55 resizer ds\n/dev/v4l=
-subdev3 | {<port1> 1}}", shape=3DMrecord, style=3Dfilled, fillcolor=3Dgree=
n]
> +        n0000000b:port1 -> n00000012 [style=3Dbold]
> +        n0000000e [label=3D"mali-c55 fr\n/dev/video0", shape=3Dbox, styl=
e=3Dfilled, fillcolor=3Dyellow]
> +        n00000012 [label=3D"mali-c55 ds\n/dev/video1", shape=3Dbox, styl=
e=3Dfilled, fillcolor=3Dyellow]
> +        n00000022 [label=3D"{{<port0> 0} | csi2-rx\n/dev/v4l-subdev4 | {=
<port1> 1}}", shape=3DMrecord, style=3Dfilled, fillcolor=3Dgreen]
> +        n00000022:port1 -> n00000003:port0
> +        n00000027 [label=3D"{{} | imx415 1-001a\n/dev/v4l-subdev5 | {<po=
rt0> 0}}", shape=3DMrecord, style=3Dfilled, fillcolor=3Dgreen]
> +        n00000027:port0 -> n00000022:port0 [style=3Dbold]
> +}
> \ No newline at end of file
> diff --git a/Documentation/admin-guide/media/mali-c55.rst b/Documentation=
/admin-guide/media/mali-c55.rst
> new file mode 100644
> index 000000000000..83f630c3bd9d
> --- /dev/null
> +++ b/Documentation/admin-guide/media/mali-c55.rst
> @@ -0,0 +1,318 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +ARM Mali-C55 Image Signal Processor driver
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Introduction
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +This file documents the driver for ARM's Mali-C55 Image Signal Processor=
. The
> +driver is located under drivers/media/platform/arm/mali-c55.
> +
> +The Mali-C55 ISP receives data in either raw Bayer format or RGB/YUV for=
mat from
> +sensors through either a parallel interface or a memory bus before proce=
ssing it
> +and outputting it through an internal DMA engine. Two output pipelines a=
re
> +possible (though one may not be fitted, depending on the implementation)=
. These
> +are referred to as "Full resolution" and "Downscale", but the naming is =
historic
> +and both pipes are capable of cropping/scaling operations. An integrated=
 test
> +pattern generator can be used to drive the ISP and produce image data in=
 the
> +absence of a connected camera sensor. The driver module is named mali_c5=
5, and
> +is enabled through the CONFIG_VIDEO_MALI_C55 config option.

Can it handle metadata or other datatypes separately? anything else
that's worthy of mention? Or maybe not yet in this version.

> +
> +The driver implements V4L2, Media Controller and V4L2 Subdevice interfac=
es and
> +expects camera sensors connected to the ISP to have V4L2 subdevice inter=
faces.
> +
> +Mali-C55 ISP hardware
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +A high level functional view of the Mali-C55 ISP is presented below. The=
 ISP
> +takes input from either a live source or through a DMA engine for memory=
 input,
> +depending on the SoC integration.::
> +
> +  +---------+    +----------+                                     +-----=
---+
> +  | Sensor  |--->| CSI-2 Rx |                "Full Resolution"    |  DMA=
   |
> +  +---------+    +----------+   |\                 Output    +--->| Writ=
er |
> +                       |        | \                          |    +-----=
---+
> +                       |        |  \    +----------+  +------+---> Strea=
ming I/O
> +  +------------+       +------->|   |   |          |  |
> +  |            |                |   |-->| Mali-C55 |--+
> +  | DMA Reader |--------------->|   |   |    ISP   |  |
> +  |            |                |  /    |          |  |      +---> Strea=
ming I/O
> +  +------------+                | /     +----------+  |      |
> +                                |/                    +------+
> +                                                            |    +------=
--+
> +                                                             +--->|  DMA=
   |
> +                                               "Downscaled"       | Writ=
er |
> +                                                 Output          +------=
--+
> +
> +Media Controller Topology
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> +
> +An example of the ISP's topology (as implemented in a system with an IMX=
415
> +camera sensor and generic CSI-2 receiver) is below:
> +
> +
> +.. kernel-figure:: mali-c55-graph.dot
> +    :alt:   mali-c55-graph.dot
> +    :align: center
> +
> +The driver has 4 V4L2 subdevices:
> +
> +- `mali_c55 isp`: Responsible for configuring input crop and color space
> +                  conversion
> +- `mali_c55 tpg`: The test pattern generator, emulating a camera sensor.
> +- `mali_c55 resizer fr`: The Full-Resolution pipe resizer
> +- `mali_c55 resizer ds`: The Downscale pipe resizer
> +
> +The driver has 2 V4L2 video devices:
> +
> +- `mali-c55 fr`: The full-resolution pipe's capture device
> +- `mali-c55 ds`: The downscale pipe's capture device
> +
> +Idiosyncrasies
> +--------------
> +
> +**mali-c55 isp**
> +The `mali-c55 isp` subdevice has a single sink pad to which all sources =
of data
> +should be connected. The active source is selected by enabling the appro=
priate
> +media link and disabling all others.

By that I presume you mean you can only accept a single input link at a
time?

> The ISP has two source pads, reflecting the
> +different paths through which it can internally route data. Tap points w=
ithin
> +the ISP allow users to divert data to avoid processing by some or all of=
 the
> +hardware's processing steps. The diagram below is intended only to highl=
ight how
> +the bypassing works and is not a true reflection of those processing ste=
ps; for
> +a high-level functional block diagram see ARM's developer page for the
> +ISP [3]_::
> +
> +  +--------------------------------------------------------------+
> +  |                Possible Internal ISP Data Routes             |
> +  |          +------------+  +----------+  +------------+        |
> +  +---+      |            |  |          |  |  Colour    |    +---+
> +  | 0 |--+-->| Processing |->| Demosaic |->|   Space    |--->| 1 |
> +  +---+  |   |            |  |          |  | Conversion |    +---+
> +  |      |   +------------+  +----------+  +------------+        |
> +  |      |                                                   +---+
> +  |      +---------------------------------------------------| 2 |
> +  |                                                          +---+
> +  |                                                              |
> +  +--------------------------------------------------------------+
> +
> +
> +.. flat-table::
> +    :header-rows: 1
> +
> +    * - Pad
> +      - Direction
> +      - Purpose
> +
> +    * - 0
> +      - sink
> +      - Data input, connected to the TPG and camera sensors
> +
> +    * - 1
> +      - source
> +      - RGB/YUV data, connected to the FR and DS V4L2 subdevices
> +
> +    * - 2
> +      - source
> +      - RAW bayer data, connected to the FR V4L2 subdevices
> +
> +**mali-c55 resizer fr**
> +The `mali-c55 resizer fr` subdevice has two _sink_ pads to reflect the d=
ifferent
> +insertion points in the hardware (either RAW or demosaiced data):
> +
> +.. flat-table::
> +    :header-rows: 1
> +
> +    * - Pad
> +      - Direction
> +      - Purpose
> +
> +    * - 0
> +      - sink
> +      - Data input connected to the ISP's demosaiced stream.
> +
> +    * - 1
> +      - source
> +      - Data output connected to the capture video device
> +
> +    * - 2
> +      - sink
> +      - Data input connected to the ISP's raw data stream
> +
> +The data source in use is selected through the routing API; two routes e=
ach of a
> +single stream are available:
> +
> +.. flat-table::
> +    :header-rows: 1
> +
> +    * - Sink Pad
> +      - Source Pad
> +      - Purpose
> +
> +    * - 0
> +      - 1
> +      - Demosaiced data route
> +
> +    * - 2
> +      - 1
> +      - Raw data route
> +
> +
> +If the demosaiced route is active then the FR pipe is only capable of ou=
tput
> +in RGB/YUV formats. If the raw route is active then the output reflects =
the
> +input (which may be either Bayer or RGB/YUV data).
> +
> +Using the driver to capture video
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Using the media controller APIs we can configure the input source and IS=
P to
> +capture images in a variety of formats. In the examples below, configuri=
ng the
> +media graph is done with the v4l-utils [1]_ package's media-ctl utility.
> +Capturing the images is done with yavta [2]_.
> +
> +Configuring the input source
> +----------------------------
> +
> +The first step is to set the input source that we wish by enabling the c=
orrect
> +media link. Using the example topology above, we can select the TPG as f=
ollows:
> +
> +.. code-block:: none
> +
> +    media-ctl -l "'lte-csi2-rx':1->'mali-c55 isp':0[0]"
> +    media-ctl -l "'mali-c55 tpg':0->'mali-c55 isp':0[1]"
> +
> +Capturing bayer data from the source and processing to RGB/YUV
> +--------------------------------------------------------------
> +To capture 1920x1080 bayer data from the source and push it through the =
ISP's
> +full processing pipeline, we configure the data formats appropriately on=
 the
> +source, ISP and resizer subdevices and set the FR resizer's routing to s=
elect
> +processed data. The media bus format on the resizer's source pad will be=
 either
> +RGB121212_1X36 or YUV10_1X30, depending on whether you want to capture R=
GB or
> +YUV. The ISP's debayering block outputs RGB data natively, setting the s=
ource
> +pad format to YUV10_1X30 enables the colour space conversion block.
> +
> +In this example we target RGB565 output, so select RGB121212_1X36 as the=
 resizer
> +source pad's format:
> +
> +.. code-block:: none
> +
> +    # Set formats on the TPG and ISP
> +    media-ctl -V "'mali-c55 tpg':0[fmt:SRGGB16_1X16/1920x1080]"
> +    media-ctl -V "'mali-c55 isp':0[fmt:SRGGB16_1X16/1920x1080]"
> +    media-ctl -V "'mali-c55 isp':1[fmt:SRGGB16_1X16/1920x1080]"
> +
> +    # Set routing on the FR resizer
> +    media-ctl -R "'mali-c55 resizer fr'[0/0->1/0[1],2/0->1/0[0]]"
> +
> +    # Set format on the resizer, must be done AFTER the routing.
> +    media-ctl -V "'mali-c55 resizer fr':1[fmt:RGB121212_1X36/1920x1080]"
> +
> +The downscale output can also be used to stream data at the same time. I=
n this
> +case only processed data can be captured and so no routing need be set:

Is the route automatically reset? or is it just that the default route
is already the correct choice for this instance?

> +
> +.. code-block:: none
> +
> +    # Set format on the resizer
> +    media-ctl -V "'mali-c55 resizer ds':1[fmt:RGB121212_1X36/1920x1080]"
> +
> +Following which images can be captured from both the FR and DS output's =
video
> +devices (simultaneously, if desired):
> +
> +.. code-block:: none
> +
> +    yavta -f RGB565 -s 1920x1080 -c10 /dev/video0
> +    yavta -f RGB565 -s 1920x1080 -c10 /dev/video1
> +

Is there any synchronisation required? Can one pipe run without the
other if they are both enabled? or will stalling on one pipe stall the
other?

> +Cropping the image
> +~~~~~~~~~~~~~~~~~~
> +
> +Both the full resolution and downscale pipes can crop to a minimum resol=
ution of
> +640x480. To crop the image simply configure the resizer's sink pad's cro=
p and
> +compose rectangles and set the format on the video device:
> +
> +.. code-block:: none
> +
> +    media-ctl -V "'mali-c55 resizer fr':0[fmt:RGB121212_1X36/1920x1080 c=
rop:(480,270)/640x480 compose:(0,0)/640x480]"
> +    media-ctl -V "'mali-c55 resizer fr':1[fmt:RGB121212_1X36/640x480]"
> +    yavta -f RGB565 -s 640x480 -c10 /dev/video0
> +
> +Downscaling the image
> +~~~~~~~~~~~~~~~~~~~~~
> +
> +Both the full resolution and downscale pipes can downscale the image by =
up to 8x
> +provided the minimum 640x480 resolution is adhered to. For the best imag=
e result

'minimum 640x480 output resolution' I presume.

Maybe the ISP limits/restrictions need to be defined before here?

> +the scaling ratio for each dimension should be the same. To configure sc=
aling we
> +use the compose rectangle on the resizer's sink pad:
> +
> +.. code-block:: none
> +
> +    media-ctl -V "'mali-c55 resizer fr':0[fmt:RGB121212_1X36/1920x1080 c=
rop:(0,0)/1920x1080 compose:(0,0)/640x480]"
> +    media-ctl -V "'mali-c55 resizer fr':1[fmt:RGB121212_1X36/640x480]"
> +    yavta -f RGB565 -s 640x480 -c10 /dev/video0
> +
> +Capturing images in YUV formats
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +If we need to output YUV data rather than RGB the color space conversion=
 block
> +needs to be active, which is achieved by setting MEDIA_BUS_FMT_YUV10_1X3=
0 on the

Is 10 bit required here? (As opposed to the 12 bit before in the
pipeline? is that a limitation on the component?) or is this to match
the desired output format?

> +resizer's source pad. We can then configure a capture format like NV12 (=
here in
> +its multi-planar variant)
> +
> +.. code-block:: none
> +
> +    media-ctl -V "'mali-c55 resizer fr':1[fmt:YUV10_1X30/1920x1080]"
> +    yavta -f NV12M -s 1920x1080 -c10 /dev/video0
> +
> +Capturing RGB data from the source and processing it with the resizers
> +----------------------------------------------------------------------
> +
> +The Mali-C55 ISP can work with sensors capable of outputting RGB data. I=
n this
> +case although none of the image quality blocks would be used it can still
> +crop/scale the data in the usual way.
> +
> +To achieve this, the ISP's sink pad's format is set to
> +MEDIA_BUS_FMT_RGB202020_1X60 - this reflects the format that data must b=
e in to
> +work with the ISP. Converting the camera sensor's output to that format =
is the
> +responsibility of external hardware.
> +
> +In this example we ask the test pattern generator to give us RGB data in=
stead of
> +bayer.
> +
> +.. code-block:: none
> +
> +    media-ctl -V "'mali-c55 tpg':0[fmt:RGB202020_1X60/1920x1080]"
> +    media-ctl -V "'mali-c55 isp':0[fmt:RGB202020_1X60/1920x1080]"
> +
> +Cropping or scaling the data can be done in exactly the same way as outl=
ined
> +earlier.
> +
> +Capturing raw data from the source and outputting it unmodified
> +-----------------------------------------------------------------
> +
> +The ISP can additionally capture raw data from the source and output it =
on the
> +full resolution pipe only, completely unmodified. In this case the downs=
cale
> +pipe can still process the data normally and be used at the same time.
> +
> +To configure raw bypass the FR resizer's subdevice's routing table needs=
 to be
> +configured, followed by formats in the appropriate places:
> +
> +.. code-block:: none
> +
> +    # We need to configure the routing table for the resizer to use the =
bypass
> +    # path along with set formats on the resizer's bypass sink pad. Doin=
g this
> +    # necessitates a single media-ctl command, as multiple calls to the =
program
> +    # reset the routing table.
> +    media-ctl -R "'mali-c55 resizer fr'[0/0->1/0[0],2/0->1/0[1]]"\
> +    -V "'mali-c55 isp':0[fmt:RGB202020_1X60/1920x1080],"\
> +       "'mali-c55 resizer fr':2[fmt:RGB202020_1X60/1920x1080],"\
> +       "'mali-c55 resizer fr':1[fmt:RGB202020_1X60/1920x1080]"
> +
> +    # Set format on the video device and stream
> +    yavta -f RGB565 -s 1920x1080 -c10 /dev/video0
> +
> +References
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +.. [1] https://git.linuxtv.org/v4l-utils.git/
> +.. [2] https://git.ideasonboard.org/yavta.git
> +.. [3] https://developer.arm.com/Processors/Mali-C55
> diff --git a/Documentation/admin-guide/media/v4l-drivers.rst b/Documentat=
ion/admin-guide/media/v4l-drivers.rst
> index f4bb2605f07e..af033c892808 100644
> --- a/Documentation/admin-guide/media/v4l-drivers.rst
> +++ b/Documentation/admin-guide/media/v4l-drivers.rst
> @@ -17,6 +17,7 @@ Video4Linux (V4L) driver-specific documentation
>         imx7
>         ipu3
>         ivtv
> +       mali-c55
>         mgb4
>         omap3isp
>         omap4_camera
> --=20
> 2.34.1
>

