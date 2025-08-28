Return-Path: <linux-media+bounces-41276-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BEFB3A6EF
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 18:50:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86BA0563494
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 16:50:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C7C632C33E;
	Thu, 28 Aug 2025 16:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I3l5eAof"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D48132C332;
	Thu, 28 Aug 2025 16:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756399824; cv=none; b=ZhfgCEeR/Bcnz7e7CqzHIeID7phXkt6MmWLPlY2kGpVU5cJXcDRX8azF2YSFNT5tbyabt17I1yBItUmuZuf8U4LaLSL8ekScCUsCvVqQU5B2U/zns4nPpl8WHrIfJfw0MK2CflQatvZR0ZEcVZm7Ilq0rJu8lnJUfri7f4bUSvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756399824; c=relaxed/simple;
	bh=IGvGL3xrGi8LRSSXlXVajh0KweHQZQyiZR1tI/deIew=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CdvfP6pttYnEzVq3HguHa9WeQYqGWhQGCfrxstc6i0VzyWWf4oLVwpUZ3oq+VoSAEyGIzgY2vbO2Tw6aFZm6+j1nZnMI5CgIK/wOJvfDHes+NGCLZkU2mmGrUe+q4upzHEA1oFSwND0m0nPinfUUh8cOUi5ph6L8rt6sArd3u+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I3l5eAof; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A89BDC4CEEB;
	Thu, 28 Aug 2025 16:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756399824;
	bh=IGvGL3xrGi8LRSSXlXVajh0KweHQZQyiZR1tI/deIew=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=I3l5eAofOsHzQ7Q+tzaiPrnYZnk6sa7+CEvTqnCMPJr2EMEVbDrRo5oDGpuh5rO4z
	 eABFyzb0kg27zKzG1QDgbGO8z11DG0VrrXR8EdCCxjKUjn2m6VI4Z4Udojm0xdovjs
	 /EsMyoq4/1mfHnOFLvHAfFrRXG+tSrczF5EtYhU0gke2SzV0QgMETe66b6AtJ0OXmw
	 9UNe8juyZLsrcInRDPg0QCW+DCDBbjIBEia2jn0ouOAKwAwUGAEu+BhS/LU5N/P2sw
	 zFB5oii7V63mkVaohjW0raR9Epk7xpf/1f9ADerx2FC8Fxy9ISfx7/uTBVn8vpvGoM
	 xD+h8wEZ4xlqA==
Message-ID: <906411e5-4354-4670-bd84-640a5b47a2bd@kernel.org>
Date: Thu, 28 Aug 2025 11:50:21 -0500
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] Documentation: add documentation of AMD isp 4
 driver
To: Bin Du <Bin.Du@amd.com>, mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 sultan@kerneltoast.com
Cc: pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 richard.gong@amd.com, anson.tsao@amd.com,
 Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
References: <20250828100811.95722-1-Bin.Du@amd.com>
 <20250828100811.95722-7-Bin.Du@amd.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20250828100811.95722-7-Bin.Du@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Just two small nits to me.

On 8/28/25 5:08 AM, Du, Bin wrote:
> Add documentation for AMD isp 4 and describe the main components

Probably should be "ISP"

> 
> Co-developed-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
> Signed-off-by: Bin Du <Bin.Du@amd.com>

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

> ---
>   Documentation/admin-guide/media/amdisp4-1.rst | 66 +++++++++++++++++++
>   Documentation/admin-guide/media/amdisp4.dot   |  8 +++
>   .../admin-guide/media/v4l-drivers.rst         |  1 +
>   MAINTAINERS                                   |  2 +
>   4 files changed, 77 insertions(+)
>   create mode 100644 Documentation/admin-guide/media/amdisp4-1.rst
>   create mode 100644 Documentation/admin-guide/media/amdisp4.dot
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

It's in 390 too isn't it?

Maybe it's better to say:
Ryzen AI Max 300 Series

That's what 
https://www.amd.com/en/products/processors/laptop/ryzen/ai-300-series/amd-ryzen-ai-max-plus-395.html 
uses after all.

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
> +	n0000000a:port0 -> n00000001:port0 [style=bold]
> +}
> diff --git a/Documentation/admin-guide/media/v4l-drivers.rst b/Documentation/admin-guide/media/v4l-drivers.rst
> index 3bac5165b134..6027416e5373 100644
> --- a/Documentation/admin-guide/media/v4l-drivers.rst
> +++ b/Documentation/admin-guide/media/v4l-drivers.rst
> @@ -9,6 +9,7 @@ Video4Linux (V4L) driver-specific documentation
>   .. toctree::
>   	:maxdepth: 2
>   
> +	amdisp4-1
>   	bttv
>   	c3-isp
>   	cafe_ccic
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7724620896e7..72ef7c77d881 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1139,6 +1139,8 @@ M:	Nirujogi Pratap <pratap.nirujogi@amd.com>
>   L:	linux-media@vger.kernel.org
>   S:	Maintained
>   T:	git git://linuxtv.org/media.git
> +F:	Documentation/admin-guide/media/amdisp4-1.rst
> +F:	Documentation/admin-guide/media/amdisp4.dot
>   F:	drivers/media/platform/amd/Kconfig
>   F:	drivers/media/platform/amd/Makefile
>   F:	drivers/media/platform/amd/isp4/Kconfig


