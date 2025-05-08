Return-Path: <linux-media+bounces-32033-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDCFAAFB19
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 15:18:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2AC743B57CD
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 13:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEFEA22AE59;
	Thu,  8 May 2025 13:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XIluJEh/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF7286358;
	Thu,  8 May 2025 13:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746710318; cv=none; b=QE0ddH9YfAU2hj/YdKq9HImNBL0e/Dh+kU3TVZJu8A1hLoJNYBF5i2Nruyk4jeJd4sY9QrFysOi+KRD8n7Gnln5QLuX6siqWQEwL3RgVJwSBOPr7MPqtTHNhfG8nhHaBy1+/1/nysXmflO15VNh2/YxAs6wqoLr0+3BtdJDRpBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746710318; c=relaxed/simple;
	bh=opaTfR9NJjO+sFAtpS4vg+nUn5uEqCiviCv+VqmE9Qg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i/L7ldtzFV8k0Uq5R29jL37CPimO4C3hDB11dlZO7gwgHFalZVHwKsRvHh0Oceg9IqUcoPK+KCMjxunB6U88WU01FfFDZh5yECtKMUyNUi6m6rabr7Ywnn9mgrI0hK7PFexocoG3cctAhqMLH08k53/hzIpM1nYE7dLNAk8yai0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XIluJEh/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2001:861:3a80:3300:7c3b:c7bf:b733:fa1b])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2C30E2E0;
	Thu,  8 May 2025 15:18:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746710301;
	bh=opaTfR9NJjO+sFAtpS4vg+nUn5uEqCiviCv+VqmE9Qg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XIluJEh/xfv4vsIOpMBiZA0sZ80oJElq9TgfPsSI4x/16m9yn9TxZBPAXbgABco23
	 fpAo2SYFwybCHzeX7/IZAznrMyCk7Gi2Gp4Fm2WAGY4XLhD/YQyVAmFtrQsnedw7I/
	 Ma/9OzSclAchB4G25rd98XAFVHD5BAOVuQVcy8B8=
Date: Thu, 8 May 2025 15:18:30 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: keke.li@amlogic.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com, 
	laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, jacopo.mondi@ideasonboard.com
Subject: Re: [PATCH v9 10/10] Documentation: media: add documentation file
 c3-isp.rst
Message-ID: <vqdqksb5ghl5pdzargeqlb2ynadw25zbxprrvbhg4kin4aotmc@7zgontkhlfdb>
References: <20250427-c3isp-v9-0-e0fe09433d94@amlogic.com>
 <20250427-c3isp-v9-10-e0fe09433d94@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250427-c3isp-v9-10-e0fe09433d94@amlogic.com>

Hi Keke

On Sun, Apr 27, 2025 at 02:27:18PM +0800, Keke Li via B4 Relay wrote:
> From: Keke Li <keke.li@amlogic.com>
>
> Add the file 'c3-isp.rst' that documents the c3-isp driver.
>
> Signed-off-by: Keke Li <keke.li@amlogic.com>

Sorry for the delay, the patch matches what was suggested with a few
corrections on top, so
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

The series is ready in my opinion. Let me sync with maintainers on
what is the fastest path to collect it.

Thanks for the perseverance!

> ---
>  Documentation/admin-guide/media/c3-isp.dot      |  26 ++++++
>  Documentation/admin-guide/media/c3-isp.rst      | 101 ++++++++++++++++++++++++
>  Documentation/admin-guide/media/v4l-drivers.rst |   1 +
>  MAINTAINERS                                     |   2 +
>  4 files changed, 130 insertions(+)
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
> index 000000000000..ac508b8c6831
> --- /dev/null
> +++ b/Documentation/admin-guide/media/c3-isp.rst
> @@ -0,0 +1,101 @@
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
> +Amlogic C3 ISP
> +==============
> +
> +The Camera hardware found on C308L processors and supported by
> +the driver consists of:
> +
> +- 1 MIPI-CSI-2 module: handles the physical layer of the MIPI CSI-2 receiver and
> +  receives data from the connected camera sensor.
> +- 1 MIPI-ADAPTER module: organizes MIPI data to meet ISP input requirements and
> +  send MIPI data to ISP.
> +- 1 ISP (Image Signal Processing) module: contains a pipeline of image processing
> +  hardware blocks. The ISP pipeline contains three resizers at the end each of
> +  them connected to a DMA interface which writes the output data to memory.
> +
> +A high-level functional view of the C3 ISP is presented below.::
> +
> +                                                                   +----------+    +-------+
> +                                                                   | Resizer  |--->| WRMIF |
> +  +---------+    +------------+    +--------------+    +-------+   |----------+    +-------+
> +  | Sensor  |--->| MIPI CSI-2 |--->| MIPI ADAPTER |--->|  ISP  |---|----------+    +-------+
> +  +---------+    +------------+    +--------------+    +-------+   | Resizer  |--->| WRMIF |
> +                                                                   +----------+    +-------+
> +                                                                   |----------+    +-------+
> +                                                                   | Resizer  |--->| WRMIF |
> +                                                                   +----------+    +-------+
> +
> +Driver architecture and design
> +==============================
> +
> +With the goal to model the hardware links between the modules and to expose a
> +clean, logical and usable interface, the driver registers the following V4L2
> +sub-devices:
> +
> +- 1 `c3-mipi-csi2` sub-device - the MIPI CSI-2 receiver
> +- 1 `c3-mipi-adapter` sub-device - the MIPI adapter
> +- 1 `c3-isp-core` sub-device - the ISP core
> +- 3 `c3-isp-resizer` sub-devices - the ISP resizers
> +
> +The `c3-isp-core` sub-device is linked to 2 video device nodes for statistics
> +capture and parameters programming:
> +
> +- the `c3-isp-stats` capture video device node for statistics capture
> +- the `c3-isp-params` output video device for parameters programming
> +
> +Each `c3-isp-resizer` sub-device is linked to a capture video device node where
> +frames are captured from:
> +
> +- `c3-isp-resizer0` is linked to the `c3-isp-cap0` capture video device
> +- `c3-isp-resizer1` is linked to the `c3-isp-cap1` capture video device
> +- `c3-isp-resizer2` is linked to the `c3-isp-cap2` capture video device
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
> +Runtime configuration of the ISP hardware is performed on the `c3-isp-params`
> +video device node using the :ref:`V4L2_META_FMT_C3ISP_PARAMS
> +<v4l2-meta-fmt-c3isp-params>` as data format. The buffer structure is defined by
> +:c:type:`c3_isp_params_cfg`.
> +
> +Statistics are captured from the `c3-isp-stats` video device node using the
> +:ref:`V4L2_META_FMT_C3ISP_STATS <v4l2-meta-fmt-c3isp-stats>` data format.
> +
> +The final picture size and format is configured using the V4L2 video
> +capture interface on the `c3-isp-cap[0, 2]` video device nodes.
> +
> +The Amlogic C3 ISP is supported by `libcamera <https://libcamera.org>`_ with a
> +dedicated pipeline handler and algorithms that perform run-time image correction
> +and enhancement.
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
> index 5bbfda5662b3..e6f66a240917 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1262,6 +1262,8 @@ AMLOGIC ISP DRIVER
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

