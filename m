Return-Path: <linux-media+bounces-21040-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EE79C00D9
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 10:07:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B2D1D1C20F71
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 09:07:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28DAD1DFD98;
	Thu,  7 Nov 2024 09:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="guRqLKOT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03E81D7E4E;
	Thu,  7 Nov 2024 09:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730970439; cv=none; b=ttd9UeMe5SPG5Prh/YGtsNKm3Kw8+RovmwhZSWiz/niBkpLnM5akPCZE0+bXdRbTVUx5NWYYXVdhPAMBbW25Uy7ma/yxwCmfUPlrWD0KrIfLrw5pVXvT7hge8Jcxk/FRG9aFdFRkY022cSZzCwgdH1fPB6Bm7eUpR6MJ61ssFjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730970439; c=relaxed/simple;
	bh=qQ+Mq1PoHmzYYRhW4t7moV2q9f1V3YSFI/uBar/82WQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G9TgZ45tn3u8pV8rvlK+jZ40tMTaq453dYMz6sW0ER0vmVczP6UwdbssMOK1hjVBfn0JDf782yipLofpP8Zklr9w8IFx+vrQC652Ivp6hGzJGQ8tnVwPOLipPX9xggpX6dqppSF8rtyauWvg3/bmb3/QlcnkH95/jB0e0YzMvTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=guRqLKOT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DB0A55B3;
	Thu,  7 Nov 2024 10:07:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730970427;
	bh=qQ+Mq1PoHmzYYRhW4t7moV2q9f1V3YSFI/uBar/82WQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=guRqLKOTQRpbZjH72oFhlsZ7w4beOJNsF9CKJAVOb+PRQuOyW/W7M1EJyOqLsBQ8I
	 Nh2T4gs7d6jeQwljwTyKvxu68i3z5RLXr5MV4h+vJTxZxcUF+H1tyKA4gvvTVXD1j1
	 M8YKXtsb11X08UJnErz0xgKbCh4aqWiy6HCgeusU=
Date: Thu, 7 Nov 2024 10:07:12 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: keke.li@amlogic.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com, 
	laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com
Subject: Re: [PATCH v3 9/9] Documentation: media: add documentation file
 c3-isp.rst
Message-ID: <eob4pf23npxbo5g4cqtke5c3u2ikp2zpg6qz2hvc4gxh644n4q@x57p3h4v3pnp>
References: <20240918-c3isp-v3-0-f774a39e6774@amlogic.com>
 <20240918-c3isp-v3-9-f774a39e6774@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240918-c3isp-v3-9-f774a39e6774@amlogic.com>

Hi Keke

On Wed, Sep 18, 2024 at 02:07:20PM +0800, Keke Li via B4 Relay wrote:
> From: Keke Li <keke.li@amlogic.com>
>
> Add the file 'c3-isp.rst' that documents the c3-isp driver.
>
> Signed-off-by: Keke Li <keke.li@amlogic.com>
> ---
>  Documentation/admin-guide/media/c3-isp.dot      | 26 +++++++
>  Documentation/admin-guide/media/c3-isp.rst      | 96 +++++++++++++++++++++++++
>  Documentation/admin-guide/media/v4l-drivers.rst |  1 +
>  MAINTAINERS                                     | 10 +++
>  4 files changed, 133 insertions(+)
>
> diff --git a/Documentation/admin-guide/media/c3-isp.dot b/Documentation/admin-guide/media/c3-isp.dot
> new file mode 100644
> index 000000000000..0cc1b8b96404
> --- /dev/null
> +++ b/Documentation/admin-guide/media/c3-isp.dot
> @@ -0,0 +1,26 @@
> +digraph board {
> +	rankdir=TB
> +	n00000001 [label="{{<port0> 0 | <port1> 1} | isp-core\n/dev/v4l-subdev0 | {<port2> 2 | <port3> 3}}", shape=Mrecord, style=filled, fillcolor=green]
> +	n00000001:port3 -> n00000006:port0 [style=bold]
> +	n00000001:port3 -> n00000009:port0 [style=bold]
> +	n00000001:port3 -> n0000000c:port0 [style=bold]
> +	n00000001:port2 -> n00000020 [style=bold]
> +	n00000006 [label="{{<port0> 0} | isp-resizer0\n/dev/v4l-subdev1 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> +	n00000006:port1 -> n00000014 [style=bold]
> +	n00000009 [label="{{<port0> 0} | isp-resizer1\n/dev/v4l-subdev2 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> +	n00000009:port1 -> n00000018 [style=bold]
> +	n0000000c [label="{{<port0> 0} | isp-resizer2\n/dev/v4l-subdev3 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> +	n0000000c:port1 -> n0000001c [style=bold]
> +	n0000000f [label="{{<port0> 0} | mipi-adapter\n/dev/v4l-subdev4 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> +	n0000000f:port1 -> n00000001:port0 [style=bold]
> +	n00000014 [label="isp-video0\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
> +	n00000018 [label="isp-video1\n/dev/video1", shape=box, style=filled, fillcolor=yellow]
> +	n0000001c [label="isp-video2\n/dev/video2", shape=box, style=filled, fillcolor=yellow]
> +	n00000020 [label="isp-stats\n/dev/video3", shape=box, style=filled, fillcolor=yellow]
> +	n00000024 [label="isp-params\n/dev/video4", shape=box, style=filled, fillcolor=yellow]
> +	n00000024 -> n00000001:port1 [style=bold]
> +	n00000038 [label="{{<port0> 0} | mipi-csi2\n/dev/v4l-subdev5 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> +	n00000038:port1 -> n0000000f:port0 [style=bold]
> +	n0000003d [label="{{} | imx290 2-001a\n/dev/v4l-subdev6 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
> +	n0000003d:port0 -> n00000038:port0 [style=bold]
> +}
> diff --git a/Documentation/admin-guide/media/c3-isp.rst b/Documentation/admin-guide/media/c3-isp.rst
> new file mode 100644
> index 000000000000..fab10c962465
> --- /dev/null
> +++ b/Documentation/admin-guide/media/c3-isp.rst
> @@ -0,0 +1,96 @@
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
> +drivers/media/platform/amlogic/c3-isp.
> +
> +The current version of the driver supports the C3ISP found on
> +Amlogic C308L processor.
> +
> +The driver implements V4L2, Media controller and V4L2 subdev interfaces.
> +Camera sensor using V4L2 subdev interface in the kernel is supported.

I would drop this last statement

> +
> +The driver has been tested on AW419-C308L-Socket platform.
> +
> +Anlogic Camera hardware

Amlogic

> +=======================
> +
> +The Camera hardware found on C308L processors and supported by
> +the driver consists of:
> +
> +- 1 MIPI-CSI2 module. It handle the Physical layer of the CSI2 receivers and
> +  receive MIPI data.

Do not break lines if you do not break it to new paragraphs

     What I mean is not to.
     Do this but instead:

     Either do this on multiple lines if you go beyond 80 columns in
     writing your text without breaking earlier.

     Or break it.

     To separate paragraphs.

> +  A separate camera sensor can be connected to MIPI-CSi2 module.

I would drop "separate" and mention that both RAW and YUV/RGB sensors
are supported

> +- 1 MIPI-ADAPTER module. Organize MIPI data to meet ISP input requirements and
> +  send MIPI data to ISP
> +- 1 ISP (Image Signal Processing) module. Contain a pipeline of image processing
> +  hardware blocks.
> +  The ISP pipeline contains three scalers at the end.
> +  The ISP also contains the DMA interface which writes the output data to memory.
> +
> +Supported functionality
> +=======================
> +
> +The current version of the driver supports:
> +
> +- Input from camera sensor via MIPI-CSI2;
> +
> +- Pixel output interface of ISP
> +
> +  - Scaling support. Configuration of the scaler module
> +    for downscalling with ratio up to 8x.

No need to break line before 80-cols

> +
> +Driver Architecture and Design
> +==============================
> +
> +The driver implements the V4L2 subdev interface. With the goal to model the
> +hardware links between the modules and to expose a clean, logical and usable
> +interface, the driver is split into V4L2 sub-devices as follows:
> +
> +- 1 mipi-csi2 sub-device - mipi-csi2 is represented by a single sub-device.
> +- 1 mipi-adapter sub-device - mipi-adapter is represented by a single sub-devices.
> +- 1 isp-core sub-device - isp-core is represented by a single sub-devices.
> +- 3 isp-resizer sub-devices - isp-resizer is represented by a number of sub-devices
> +  equal to the number of capture device.
> +
> +isp-core sub-device is linked to 2 separate video device nodes and
> +3 isp-resizer sub-devices nodes.
> +
> +- 1 capture statistics video device node.
> +- 1 output parameters video device node.
> +- 3 isp-resizer sub-device nodes.
> +
> +isp-resizer sub-device is linked to capture video device node.
> +
> +- isp-resizer0 is linked to isp-cap0
> +- isp-resizer1 is linked to isp-cap1
> +- isp-resizer2 is linked to isp-cap2
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
> +Runtime configuration of the hardware via 'isp-params' video device node.
> +Acquiring statistics of ISP hardware via 'isp-stats' video device node.
> +Acquiring output image of ISP hardware via 'isp-video[0, 2]' video device node.

The text above names them 'isp-cap[0, 2]'

> +
> +The output size of the scaler module in the ISP is configured with
> +the pixel format of 'isp-video[0, 2]' video device node.

I haven't looked yet at how this is implemented, but I presume the
correct sizes should be configured on the isp-resizerX sub-device as
well. I would drop this last pharse as it might be misleading ?

> diff --git a/Documentation/admin-guide/media/v4l-drivers.rst b/Documentation/admin-guide/media/v4l-drivers.rst
> index b6af448b9fe9..be0a8a860f39 100644
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
> index 31168c05f304..954dd9bdf77e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1209,6 +1209,16 @@ F:	Documentation/devicetree/bindings/perf/amlogic,g12-ddr-pmu.yaml
>  F:	drivers/perf/amlogic/
>  F:	include/soc/amlogic/
>
> +AMLOGIC ISP DRIVER
> +M:	Keke Li <keke.li@amlogic.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained

I would add the entry to MAINTAINERS when introducing the ISP driver
and only add

> +F:	Documentation/admin-guide/media/c3-isp.dot
> +F:	Documentation/admin-guide/media/c3-isp.rst

These two files in this patch

> +F:	Documentation/devicetree/bindings/media/amlogic,c3-isp.yaml
> +F:	Documentation/userspace-api/media/v4l/metafmt-c3-isp.rst
> +F:	drivers/media/platform/amlogic/c3-isp/

And also the uAPI header is missing from the files list it seems

Thanks
  j

> +
>  AMLOGIC MIPI ADAPTER DRIVER
>  M:	Keke Li <keke.li@amlogic.com>
>  L:	linux-media@vger.kernel.org
>
> --
> 2.46.1
>
>
>

