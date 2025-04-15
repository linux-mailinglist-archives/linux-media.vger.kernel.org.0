Return-Path: <linux-media+bounces-30268-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8592EA8A23C
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 17:00:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32BF33BCC77
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 14:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0CF72C258F;
	Tue, 15 Apr 2025 14:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="J2XO0sWF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56EF2C256B;
	Tue, 15 Apr 2025 14:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744728934; cv=none; b=K2nwE8LZ5bfUsntyF7SLP2L64m6Idcsi9AT6fC8Yl0P7S8Fjw+f4+DCltD8XYjPCrjv85cBUdKf7bjDEP/auDD0d96ULDtzf6EuTLGbEQ2D788GkGiJ6m4rX7LxZEaqYOz6gs0WexWmcQyhivvOelBGdbl06b9sFvEGXg0XIMHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744728934; c=relaxed/simple;
	bh=N/IC2RBvp5Cv/RWrRjB+DN53auEXsM/vkfWnZQPwIRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bQWpFjmoFJ/cLZxAi1zW0K6XNSUv0EcqQ7Ci+gscYD6m7v0sXxGAUZQx5so9+eIThaNq4CiQcmwvr/ExHYsIewccRIRSLgTkn2hSUmxvAspL7IMxujtZV/Alp7r+AlYylaPVlY9DLhlZkmyknOIYwAHvnu4FbNu1CCBxDXyXq0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=J2XO0sWF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 46D8F594;
	Tue, 15 Apr 2025 16:53:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744728807;
	bh=N/IC2RBvp5Cv/RWrRjB+DN53auEXsM/vkfWnZQPwIRw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J2XO0sWFNgeNxO5AuoQcrXc19l5CjIWRvKQc0i1x1k5L6BDZ7mgmJ4oRIrK/gFlWa
	 kU/0EzFJpnzOLYNWZG+CMlOGPXwp0P8gi38ul8gN1NHJtMtlyC0Vud2KDlwX7LfHaO
	 D5bDXUE/sEMtE2juKda2uX56XDWPMevk/fvybUAU=
Date: Tue, 15 Apr 2025 16:55:26 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: keke.li@amlogic.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com, 
	laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, jacopo.mondi@ideasonboard.com
Subject: Re: [PATCH v8 10/10] Documentation: media: add documentation file
 c3-isp.rst
Message-ID: <3bordqs2ygaaj6d7yqs2cgvhc46szwf53ojsaz4aikvqmxxx3v@s5af6wtpzfxn>
References: <20250414-c3isp-v8-0-9f89e537494e@amlogic.com>
 <20250414-c3isp-v8-10-9f89e537494e@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250414-c3isp-v8-10-9f89e537494e@amlogic.com>

Hi Keke
   sorry, I missed this patch in my previous reviews.

I think you're already at v8 and there's no need to resend the whole
series. I would like to send a pull request and see this series merged
soon.

I've run the series through CI (applying a few minors to patch titles
to fix a few checkpatch warnings[1])

I can apply the below suggestions with your ack, re-run the series
through CI and send a pull request. Or, if you prefer to resend I'll
wait for a new version.

What do you prefer ?

See my comments below

On Mon, Apr 14, 2025 at 03:35:23PM +0800, Keke Li via B4 Relay wrote:
> From: Keke Li <keke.li@amlogic.com>
>
> Add the file 'c3-isp.rst' that documents the c3-isp driver.
>
> Signed-off-by: Keke Li <keke.li@amlogic.com>
> ---
>  Documentation/admin-guide/media/c3-isp.dot      |  26 ++++++
>  Documentation/admin-guide/media/c3-isp.rst      | 109 ++++++++++++++++++++++++
>  Documentation/admin-guide/media/v4l-drivers.rst |   1 +
>  MAINTAINERS                                     |   2 +
>  4 files changed, 138 insertions(+)
>
> diff --git a/Documentation/admin-guide/media/c3-isp.dot b/Documentation/admin-guide/media/c3-isp.dot
> new file mode 100644
> index 000000000000..42dc931ee84a
> --- /dev/null
> +++ b/Documentation/admin-guide/media/c3-isp.dot
> @@ -0,0 +1,26 @@
> +digraph board {
> +	rankdir=TB
> +	n00000001 [label="{{<port0> 0 | <port1> 1} | c3-isp-core\n/dev/v4l-subdev0 | {<port2> 2 | <port3> 3 | <port4> 4 | <port5> 5}}", shape=Mrecord, style=filled, fillcolor=green]
> +	n00000001:port3 -> n00000008:port0
> +	n00000001:port4 -> n0000000b:port0
> +	n00000001:port5 -> n0000000e:port0
> +	n00000001:port2 -> n00000027
> +	n00000008 [label="{{<port0> 0} | c3-isp-resizer0\n/dev/v4l-subdev1 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> +	n00000008:port1 -> n00000016 [style=bold]
> +	n0000000b [label="{{<port0> 0} | c3-isp-resizer1\n/dev/v4l-subdev2 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> +	n0000000b:port1 -> n0000001a [style=bold]
> +	n0000000e [label="{{<port0> 0} | c3-isp-resizer2\n/dev/v4l-subdev3 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> +	n0000000e:port1 -> n00000023 [style=bold]
> +	n00000011 [label="{{<port0> 0} | c3-mipi-adapter\n/dev/v4l-subdev4 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> +	n00000011:port1 -> n00000001:port0 [style=bold]
> +	n00000016 [label="c3-isp-cap0\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
> +	n0000001a [label="c3-isp-cap1\n/dev/video1", shape=box, style=filled, fillcolor=yellow]
> +	n0000001e [label="{{<port0> 0} | c3-mipi-csi2\n/dev/v4l-subdev5 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> +	n0000001e:port1 -> n00000011:port0 [style=bold]
> +	n00000023 [label="c3-isp-cap2\n/dev/video2", shape=box, style=filled, fillcolor=yellow]
> +	n00000027 [label="c3-isp-stats\n/dev/video3", shape=box, style=filled, fillcolor=yellow]
> +	n0000002b [label="c3-isp-params\n/dev/video4", shape=box, style=filled, fillcolor=yellow]
> +	n0000002b -> n00000001:port1
> +	n0000003f [label="{{} | imx290 2-001a\n/dev/v4l-subdev6 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
> +	n0000003f:port0 -> n0000001e:port0 [style=bold]
> +}
> diff --git a/Documentation/admin-guide/media/c3-isp.rst b/Documentation/admin-guide/media/c3-isp.rst
> new file mode 100644
> index 000000000000..8adac4605a6a
> --- /dev/null
> +++ b/Documentation/admin-guide/media/c3-isp.rst
> @@ -0,0 +1,109 @@
> +.. SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +
> +.. include:: <isonum.txt>
> +
> +=================================================
> +Amlogic C3 Image Signal Processing (C3ISP) driver
> +=================================================
> +
> +Introduction
> +============
> +
> +This file documents the Amlogic C3ISP driver located under
> +drivers/media/platform/amlogic/c3/isp.
> +
> +The current version of the driver supports the C3ISP found on
> +Amlogic C308L processor.
> +
> +The driver implements V4L2, Media controller and V4L2 subdev interfaces.
> +Camera sensor using V4L2 subdev interface in the kernel is supported.
> +
> +The driver has been tested on AW419-C308L-Socket platform.
> +
> +Anlogic Camera hardware

s/Anlogic/Amlogic

> +=======================
> +
> +The Camera hardware found on C308L processors and supported by
> +the driver consists of:
> +
> +- 1 MIPI-CSI2 module. It handle the Physical layer of the CSI2 receivers and
> +  receive MIPI data.
> +  A separate camera sensor can be connected to MIPI-CSi2 module.

Do not break lines when not necessary

s/CSi2/CSI-2

> +- 1 MIPI-ADAPTER module. Organize MIPI data to meet ISP input requirements and
> +  send MIPI data to ISP
> +- 1 ISP (Image Signal Processing) module. Contain a pipeline of image processing
> +  hardware blocks.
> +  The ISP pipeline contains three scalers at the end.
> +  The ISP also contains the DMA interface which writes the output data to memory.

Ditto

> +
> +A high level functional view of the C3 ISP is presented below. The ISP
> +takes input from the sensor.::
> +
> +                                                                   +---------+    +-------+
> +                                                                   | Scaler  |--->| WRMIF |
> +  +---------+    +------------+    +--------------+    +-------+   |---------+    +-------+
> +  | Sensor  |--->| MIPI CSI-2 |--->| MIPI ADAPTER |--->|  ISP  |---|---------+    +-------+
> +  +---------+    +------------+    +--------------+    +-------+   | Scaler  |--->| WRMIF |
> +                                                                   +---------+    +-------+
> +                                                                   |---------+    +-------+
> +                                                                   | Scaler  |--->| WRMIF |
> +                                                                   +---------+    +-------+
> +
> +Supported functionality
> +=======================
> +
> +The current version of the driver supports:
> +
> +- Input from camera sensor via MIPI-CSI2;

s/;/.

> +
> +- Pixel output interface of ISP
> +
> +  - Scaling support. Configuration of the scaler module
> +    for downscalling with ratio up to 8x.

To be honest I would drop this paragraph.

> +
> +Driver Architecture and Design
> +==============================
> +
> +The driver implements the V4L2 subdev interface. With the goal to model the

The driver also implements the V4L2 video capture interface and the
Media Controller interface.

To be honest, I would drop this first phrase.


> +hardware links between the modules and to expose a clean, logical and usable
> +interface, the driver is split into V4L2 sub-devices as follows:

s/is split into/registers the following/
s/as follows//

> +
> +- 1 c3-mipi-csi2 sub-device - mipi-csi2 is represented by a single sub-device.
> +- 1 c3-mipi-adapter sub-device - mipi-adapter is represented by a single sub-devices.
> +- 1 c3-isp-core sub-device - isp-core is represented by a single sub-devices.
> +- 3 c3-isp-resizer sub-devices - isp-resizer is represented by a number of sub-devices
> +  equal to the number of capture device.
> +
> +c3-isp-core sub-device is linked to 2 separate video device nodes and
> +3 c3-isp-resizer sub-devices nodes.
> +
> +- 1 capture statistics video device node.
> +- 1 output parameters video device node.
> +- 3 c3-isp-resizer sub-device nodes.
> +
> +c3-isp-resizer sub-device is linked to capture video device node.
> +
> +- c3-isp-resizer0 is linked to c3-isp-cap0
> +- c3-isp-resizer1 is linked to c3-isp-cap1
> +- c3-isp-resizer2 is linked to c3-isp-cap2
> +
> +The media controller pipeline graph is as follows (with connected a
> +IMX290 camera sensor):
> +
> +.. _isp_topology_graph:
> +
> +.. kernel-figure:: c3-isp.dot
> +    :alt:   c3-isp.dot
> +    :align: center
> +
> +    Media pipeline topology
> +
> +Implementation
> +==============
> +
> +Runtime configuration of the hardware via 'c3-isp-params' video device node.
> +Acquiring statistics of ISP hardware via 'c3-isp-stats' video device node.
> +Acquiring output image of ISP hardware via 'c3-isp-cap[0, 2]' video device node.
> +
> +The output size of the scaler module in the ISP is configured with
> +the pixel format of 'c3-isp-cap[0, 2]' video device node.

The output size.. configured with the pixel format ?

I would say:

The final picture size and format is configured using the V4L2 video
capture interface on the 'c3-isp-cap[0, 2]' video device nodes.

I would also mention the ISP is supported in libcamera (or better, on
its way to be supported by libcamera).

I can send an update to this patch for your review. Is this ok ?

I'll check with maintainers on how to then moved forward and collect
this series.

For reference, the branch where I applied minor fixups to pass
media-ci style checks and with this last patch updated is available
here
https://gitlab.freedesktop.org/linux-media/users/jmondi/-/pipelines/1406119

> diff --git a/Documentation/admin-guide/media/v4l-drivers.rst b/Documentation/admin-guide/media/v4l-drivers.rst
> index e8761561b2fe..3bac5165b134 100644
> --- a/Documentation/admin-guide/media/v4l-drivers.rst
> +++ b/Documentation/admin-guide/media/v4l-drivers.rst
> @@ -10,6 +10,7 @@ Video4Linux (V4L) driver-specific documentation
>  	:maxdepth: 2
>
>  	bttv
> +	c3-isp
>  	cafe_ccic
>  	cx88
>  	fimc
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b2bf9c6cd194..4b06a798d30c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1259,6 +1259,8 @@ AMLOGIC ISP DRIVER
>  M:	Keke Li <keke.li@amlogic.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> +F:	Documentation/admin-guide/media/c3-isp.dot
> +F:	Documentation/admin-guide/media/c3-isp.rst
>  F:	Documentation/devicetree/bindings/media/amlogic,c3-isp.yaml
>  F:	Documentation/userspace-api/media/v4l/metafmt-c3-isp.rst
>  F:	drivers/media/platform/amlogic/c3/isp/
>
> --
> 2.49.0
>
>
>

