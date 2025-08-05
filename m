Return-Path: <linux-media+bounces-38923-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3DFB1B2A5
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 13:37:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D74A8621562
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 11:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BED5259CB2;
	Tue,  5 Aug 2025 11:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wQDNy6KL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CB5EEC0;
	Tue,  5 Aug 2025 11:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754393857; cv=none; b=RZy6IOMKS2Ta59d4T1hT4GBYWkYKsxN0bZ+/ZpxRn0yT1zCVZ2m2p+ZjHZQWFwyth6laB6Z95TRop66sKd9LGlFFSS6/qyvMZu3YM6IFCLv4LP0PJlqPb6OuynxyekQ20o6HhjUtbImd6igCkUabMzmxDnGFsLXO/vdjr3BdBs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754393857; c=relaxed/simple;
	bh=pzknJzdLsQ0UdjwXfakRUzrYvY8rSGUHH5bJks8yJCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nXjOciraCxtDju/sPrLYa9wUGQvxcL91czTSlI4gA+gEwq9QtAGXl+L3suzcdVmzHFrSjTYPTA9TidoUbo5G4wp4pA8rfAXsnV26r4akviV/1zdB/Sinnz+pcEBSu9VYn6eh2ZGa2TJXaC+T1N7vtTa5B3Vb6wMggPDQ1aeFpd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wQDNy6KL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id CF00F664;
	Tue,  5 Aug 2025 13:36:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754393806;
	bh=pzknJzdLsQ0UdjwXfakRUzrYvY8rSGUHH5bJks8yJCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wQDNy6KLUkiR3+cp4aRj4/Ic0aLZJOCX1CWxfDlIBj0EKQtkgjhdzeRxrQ16OTgI/
	 hrnh0HATxPbHq48EkYymZt0RWFd6dnhMDBBKYI5+xLeUeDyRWtxcsnMVw22p4OElh/
	 DD/gqN+kbtebQsvPsnOVOuj0WtM8ajiy1lWrhAmc=
Date: Tue, 5 Aug 2025 14:37:19 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Bin Du <Bin.Du@amd.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl, bryan.odonoghue@linaro.org,
	sakari.ailus@linux.intel.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
	gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com,
	Dominic.Antony@amd.com, Svetoslav.Stoilov@amd.com
Subject: Re: [PATCH v2 8/8] Documentation: add documentation of AMD isp 4
 driver
Message-ID: <20250805113719.GF24627@pendragon.ideasonboard.com>
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <20250618091959.68293-9-Bin.Du@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250618091959.68293-9-Bin.Du@amd.com>

On Wed, Jun 18, 2025 at 05:19:59PM +0800, Bin Du wrote:
> Add documentation for AMD isp 4 and describe the main components
> 
> Signed-off-by: Bin Du <Bin.Du@amd.com>
> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
> ---
>  Documentation/admin-guide/media/amdisp4-1.rst | 64 +++++++++++++++++++
>  Documentation/admin-guide/media/amdisp4.dot   |  8 +++
>  MAINTAINERS                                   |  2 +
>  3 files changed, 74 insertions(+)
>  create mode 100644 Documentation/admin-guide/media/amdisp4-1.rst
>  create mode 100644 Documentation/admin-guide/media/amdisp4.dot
> 
> diff --git a/Documentation/admin-guide/media/amdisp4-1.rst b/Documentation/admin-guide/media/amdisp4-1.rst
> new file mode 100644
> index 000000000000..417b15af689a
> --- /dev/null
> +++ b/Documentation/admin-guide/media/amdisp4-1.rst
> @@ -0,0 +1,64 @@
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
> +- <capture video device: capture device for retrieving images.
> +
> +
> +  - ISP4 Image Signal Processing Subdevice Node
> +-----------------------------------------------
> +
> +The isp4 is represented as a single V4L2 subdev, the sub-device does not
> +provide interface to the user space.

Doesn't it ? The driver sets the V4L2_SUBDEV_FL_HAS_DEVNODE flag for the
subdev, and calls v4l2_device_register_subdev_nodes().

As far as I understand, the camera is exposed by the firmware with a
webcam-like interface. We need to better understand your plans with this
driver. If everything is handled by the firmware, why are the sensor and
subdev exposed to userspace ? Why can't you expose a single video
capture device, with a media device, and handle everything behind the
scene ? I assume there may be more features coming later. Please
document the plan, we can't provide feedback on the architecture
otherwise.

> The sub-device is connected to one video node
> +(isp4_capture) with immutable active link. The isp entity is connected
> +to sensor pad 0 and receives the frames using CSI-2 protocol. The sub-device is
> +also responsible to configure CSI2-2 receiver.
> +The sub-device processes bayer raw data from the connected sensor and output
> +them to different YUV formats. The isp also has scaling capabilities.
> +
> +  - isp4_capture - Frames Capture Video Node
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

This seems very under-documented.

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
> +	n0000000a:port0 -> n00000001:port0 [style=bold]
> +}
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 15070afb14b5..e4455bde376f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1113,6 +1113,8 @@ M:	Nirujogi Pratap <pratap.nirujogi@amd.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  T:	git git://linuxtv.org/media.git
> +F:	Documentation/admin-guide/media/amdisp4-1.rst
> +F:	Documentation/admin-guide/media/amdisp4.dot
>  F:	drivers/media/platform/amd/Kconfig
>  F:	drivers/media/platform/amd/Makefile
>  F:	drivers/media/platform/amd/isp4/*

-- 
Regards,

Laurent Pinchart

