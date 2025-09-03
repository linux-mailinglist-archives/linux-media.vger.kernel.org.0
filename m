Return-Path: <linux-media+bounces-41652-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3E1B41B12
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 12:05:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B31B566293
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 10:05:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDB152E88AB;
	Wed,  3 Sep 2025 10:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="r0s+ajlF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110DA2E7BD8;
	Wed,  3 Sep 2025 10:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756893888; cv=none; b=WmYdGOLs7VdbQ5xcbxHavXV2e4MiVJMJRpMVmB3RMtOOiNaknO6E4oNQp9DDAnBvZytd4YTkGn//gvNDJNmVXoXUYmSDP11TLU1OlSTeKCttIgowNK9gU8Fwcsznvf7KOKRT33LTa9B2XQVvFPkXkR7j1XiSSyedWlgy8VP/ykw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756893888; c=relaxed/simple;
	bh=57O5vG1c61/OQgja2mgWK6vFMFw+mDTxwWzZkGbTiwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MQKudJT7S+8WZRjVJQiCgLYU72yRsMb8a9qe/BRUPRX0UiNamgvRYYC8SrMDGuVeiykfeSbzSrmlpE5bHzrXDJQv0jBCsIqwssUr43asOfbad7aiBTLIpmbqmgneSZIn7AT4V4mN18fuHad7b6p0Icp7cUZAFMTLDr1mq4MRINw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=r0s+ajlF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 905038CB;
	Wed,  3 Sep 2025 12:03:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756893815;
	bh=57O5vG1c61/OQgja2mgWK6vFMFw+mDTxwWzZkGbTiwE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r0s+ajlF2cy/s9EIxC/SMTzYt1uZDigDex9Slp/rzHFTJmqKySx+Z4FQFtTZJ11ep
	 27vPDEchODMXq1H4xIaB1blALe4jQMvDTEfsn+OdT8Ajw2Z4vSSdXfHfmNnYF/brpO
	 p4abpkQ8fkCLvfM1P2MsKznWFHWAi0y6P+6ZLeho=
Date: Wed, 3 Sep 2025 12:04:24 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Bin Du <Bin.Du@amd.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl, bryan.odonoghue@linaro.org,
	sakari.ailus@linux.intel.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	sultan@kerneltoast.com, pratap.nirujogi@amd.com,
	benjamin.chan@amd.com, king.li@amd.com, gjorgji.rosikopulos@amd.com,
	Phil.Jawich@amd.com, Dominic.Antony@amd.com,
	mario.limonciello@amd.com, richard.gong@amd.com, anson.tsao@amd.com,
	Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
Subject: Re: [PATCH v3 7/7] Documentation: add documentation of AMD isp 4
 driver
Message-ID: <20250903100424.GB13448@pendragon.ideasonboard.com>
References: <20250828100811.95722-1-Bin.Du@amd.com>
 <20250828100811.95722-7-Bin.Du@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250828100811.95722-7-Bin.Du@amd.com>

Hi Bin,

Thank you for the patch.

On Thu, Aug 28, 2025 at 06:08:11PM +0800, Bin Du wrote:
> Add documentation for AMD isp 4 and describe the main components
> 
> Co-developed-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
> Signed-off-by: Bin Du <Bin.Du@amd.com>
> ---
>  Documentation/admin-guide/media/amdisp4-1.rst | 66 +++++++++++++++++++
>  Documentation/admin-guide/media/amdisp4.dot   |  8 +++
>  .../admin-guide/media/v4l-drivers.rst         |  1 +
>  MAINTAINERS                                   |  2 +
>  4 files changed, 77 insertions(+)
>  create mode 100644 Documentation/admin-guide/media/amdisp4-1.rst
>  create mode 100644 Documentation/admin-guide/media/amdisp4.dot
> 
> diff --git a/Documentation/admin-guide/media/amdisp4-1.rst b/Documentation/admin-guide/media/amdisp4-1.rst
> new file mode 100644
> index 000000000000..a5ed78912d0f
> --- /dev/null
> +++ b/Documentation/admin-guide/media/amdisp4-1.rst
> @@ -0,0 +1,66 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. include:: <isonum.txt>
> +
> +====================================
> +AMD Image Signal Processor (amdisp4)
> +====================================
> +
> +Introduction
> +============
> +
> +This file documents the driver for the AMD ISP4 that is part of
> +AMD Ryzen AI Max 385 SoC.
> +
> +The driver is located under drivers/media/platform/amd/isp4 and uses
> +the Media-Controller API.
> +
> +Topology
> +========
> +
> +.. _amdisp4_topology_graph:
> +
> +.. kernel-figure:: amdisp4.dot
> +     :alt:   Diagram of the media pipeline topology
> +     :align: center
> +
> +
> +
> +The driver has 1 sub-device:
> +
> +- isp: used to resize and process bayer raw frames in to yuv.
> +
> +The driver has 1 video device:
> +
> +- capture video device: capture device for retrieving images.
> +
> +
> +  - ISP4 Image Signal Processing Subdevice Node
> +
> +-----------------------------------------------
> +
> +The isp4 is represented as a single V4L2 subdev, the sub-device does not
> +provide interface to the user space. The sub-device is connected to one video node
> +(isp4_capture) with immutable active link. The isp entity is connected
> +to sensor pad 0 and receives the frames using CSI-2 protocol. The sub-device is
> +also responsible to configure CSI2-2 receiver.
> +The sub-device processes bayer raw data from the connected sensor and output
> +them to different YUV formats. The isp also has scaling capabilities.
> +
> +  - isp4_capture - Frames Capture Video Node
> +
> +--------------------------------------------
> +
> +Isp4_capture is a capture device to capture frames to memory.
> +This entity is the DMA engine that write the frames to memory.
> +The entity is connected to isp4 sub-device.
> +
> +Capturing Video Frames Example
> +==============================
> +
> +.. code-block:: bash
> +
> +         # set the links
> +
> +         # start streaming:
> +         v4l2-ctl "-d" "/dev/video0" "--set-fmt-video=width=1920,height=1080,pixelformat=NV12" "--stream-mmap" "--stream-count=10"
> diff --git a/Documentation/admin-guide/media/amdisp4.dot b/Documentation/admin-guide/media/amdisp4.dot
> new file mode 100644
> index 000000000000..a4c2f0cceb30
> --- /dev/null
> +++ b/Documentation/admin-guide/media/amdisp4.dot
> @@ -0,0 +1,8 @@
> +digraph board {
> +	rankdir=TB
> +	n00000001 [label="{{<port0> 0} | amd isp4\n | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> +	n00000001:port1 -> n00000004 [style=bold]
> +	n00000004 [label="Preview\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
> +	n0000000a [label="{{} | ov05c10 22-0010\n/dev/v4l-subdev0 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]

Does the driver still have a subdev for the sensor, or is that a
leftover ? Looking at the source code, I don't see where the sensor
would be handled.

> +	n0000000a:port0 -> n00000001:port0 [style=bold]
> +}
> diff --git a/Documentation/admin-guide/media/v4l-drivers.rst b/Documentation/admin-guide/media/v4l-drivers.rst
> index 3bac5165b134..6027416e5373 100644
> --- a/Documentation/admin-guide/media/v4l-drivers.rst
> +++ b/Documentation/admin-guide/media/v4l-drivers.rst
> @@ -9,6 +9,7 @@ Video4Linux (V4L) driver-specific documentation
>  .. toctree::
>  	:maxdepth: 2
>  
> +	amdisp4-1
>  	bttv
>  	c3-isp
>  	cafe_ccic
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7724620896e7..72ef7c77d881 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1139,6 +1139,8 @@ M:	Nirujogi Pratap <pratap.nirujogi@amd.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  T:	git git://linuxtv.org/media.git
> +F:	Documentation/admin-guide/media/amdisp4-1.rst
> +F:	Documentation/admin-guide/media/amdisp4.dot
>  F:	drivers/media/platform/amd/Kconfig
>  F:	drivers/media/platform/amd/Makefile
>  F:	drivers/media/platform/amd/isp4/Kconfig

-- 
Regards,

Laurent Pinchart

