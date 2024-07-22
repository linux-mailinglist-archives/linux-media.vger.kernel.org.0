Return-Path: <linux-media+bounces-15271-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC507939379
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 20:03:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DFCA31C2161A
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 18:03:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 661C916F8FD;
	Mon, 22 Jul 2024 18:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pDau9Rj4"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7099216DC06;
	Mon, 22 Jul 2024 18:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721671394; cv=none; b=ch0AjY3wYcKKpZdeqelNtPTj3EBD1+hHJH5DJT81OA6ZLYM1ZQIGdlJ81c1NhIXVb0OcR+8mEyA1HYtOjLiUw6Zuh9ThpyrCUNl7MyYS8i9+nkA6sZWJ/6+HoK6Qmk2xGotNTVOQM5NUHgz4r0it+Pfb3cn0Tyihx3TAcohXDZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721671394; c=relaxed/simple;
	bh=m1Scr2mzFXGqPbp+cEvq4BvW6Jh/y8f2jUCzwn6dXzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JAJ7WWXlbgEARDEEB0EjPPj/jRror8LjWjbD18taxBQKZ3y8U+TzYBZuJu/rzKfX2LkBxUTROBBEO2MdtCHka4wSmLmBaWCS1jCbyjVQlQkS4HbNoOtgzkBDNtKcy57KRDidLcgtsBsyeTmdgzftd4TQyMM/MOK1TvBq0xYKPtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pDau9Rj4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6087110B6;
	Mon, 22 Jul 2024 20:02:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1721671349;
	bh=m1Scr2mzFXGqPbp+cEvq4BvW6Jh/y8f2jUCzwn6dXzw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pDau9Rj4g/leV0FRcdx+RgWhOX4AAt2qFHpnDIBM1XlEpwFmEmLnoaf3r2J25YSYM
	 dI3NjXHwmAt30kUDMx4dYvuTUJe3KlqruRRjej69EqXLzJwmhsbAKeAyHJ5xO7ickd
	 nTSan6h4YhjD7oAImXj1gNRgP6OFlzX1D4lVpzXY=
Date: Mon, 22 Jul 2024 21:02:51 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 5/6] documentation: media: add documentation for
 Toshiba Visconti Video Input Interface driver
Message-ID: <20240722180251.GP13497@pendragon.ideasonboard.com>
References: <20240709000848.1108788-1-yuji2.ishikawa@toshiba.co.jp>
 <20240709000848.1108788-6-yuji2.ishikawa@toshiba.co.jp>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240709000848.1108788-6-yuji2.ishikawa@toshiba.co.jp>

Hi Ishikawa-san,

Thank you for the patch.

On Tue, Jul 09, 2024 at 09:08:47AM +0900, Yuji Ishikawa wrote:
> Added description of Video Input Interface driver of
> Toshiba Visconti architecture.
> It includes hardware organization, structure of the driver
> and metadata format for embedded image signal processor.
> 
> Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
> ---
> Changelog v3:
> - Newly add documentation to describe SW and HW
> 
> Changelog v4:
> - no change
> 
> Changelog v5:
> - no change
> 
> Changelog v6:
> - add description of CSI2RX subdevice
> - add ordering of ioctl(S_FMT) and ioctl(S_EXT_CTRLS)
> 
> Changelog v7:
> - no change
> 
> Changelog v8:
> - add usage of V4L2_CTRL_TYPE_VISCONTI_ISP
> 
> Changelog v9:
> - fix warning: set reference target for keyword V4L2_CTRL_TYPE_VISCONTI_ISP
> 
> Changelog v10:
> - use parameter buffers instead of compound control
>   - removed description of vendor specific compound control
>   - add description of parameter buffers for ISP control
> - update directory structure
>   - remove documents under driver-api
>   - add documents to admin-guide, userspace-api
> 
> Changelog v11:
> - update usage of the driver
> 
>  .../admin-guide/media/v4l-drivers.rst         |   1 +
>  .../admin-guide/media/visconti-viif.dot       |  18 ++
>  .../admin-guide/media/visconti-viif.rst       | 255 ++++++++++++++++++
>  .../userspace-api/media/v4l/meta-formats.rst  |   1 +
>  .../media/v4l/metafmt-visconti-viif.rst       |  48 ++++
>  5 files changed, 323 insertions(+)
>  create mode 100644 Documentation/admin-guide/media/visconti-viif.dot
>  create mode 100644 Documentation/admin-guide/media/visconti-viif.rst
>  create mode 100644 Documentation/userspace-api/media/v4l/metafmt-visconti-viif.rst
> 
> diff --git a/Documentation/admin-guide/media/v4l-drivers.rst b/Documentation/admin-guide/media/v4l-drivers.rst
> index 4120eded9a..c7e67f455a 100644
> --- a/Documentation/admin-guide/media/v4l-drivers.rst
> +++ b/Documentation/admin-guide/media/v4l-drivers.rst
> @@ -31,5 +31,6 @@ Video4Linux (V4L) driver-specific documentation
>  	si476x
>  	starfive_camss
>  	vimc
> +	visconti-viif
>  	visl
>  	vivid
> diff --git a/Documentation/admin-guide/media/visconti-viif.dot b/Documentation/admin-guide/media/visconti-viif.dot
> new file mode 100644
> index 0000000000..239d9fa2b3
> --- /dev/null
> +++ b/Documentation/admin-guide/media/visconti-viif.dot
> @@ -0,0 +1,18 @@
> +digraph board {
> +        rankdir=TB
> +        n00000001 [label="{{<port0> 0} | visconti-viif:csi2rx\n/dev/v4l-subdev0 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> +        n00000001:port1 -> n00000004:port0
> +        n00000004 [label="{{<port0> 0 | <port4> 4} | visconti-viif:isp\n/dev/v4l-subdev1 | {<port1> 1 | <port2> 2 | <port3> 3 | <port5> 5}}", shape=Mrecord, style=filled, fillcolor=green]
> +        n00000004:port1 -> n0000000b
> +        n00000004:port2 -> n0000000f
> +        n00000004:port3 -> n00000013
> +        n00000004:port5 -> n0000001b
> +        n0000000b [label="viif_capture_post0\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
> +        n0000000f [label="viif_capture_post1\n/dev/video1", shape=box, style=filled, fillcolor=yellow]
> +        n00000013 [label="viif_capture_sub\n/dev/video2", shape=box, style=filled, fillcolor=yellow]
> +        n00000017 [label="viif_params\n/dev/video3", shape=box, style=filled, fillcolor=yellow]
> +        n00000017 -> n00000004:port4
> +        n0000001b [label="viif_stats\n/dev/video4", shape=box, style=filled, fillcolor=yellow]
> +        n0000002b [label="{{} | imx219 1-0010\n/dev/v4l-subdev2 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
> +        n0000002b:port0 -> n00000001:port0
> +}
> diff --git a/Documentation/admin-guide/media/visconti-viif.rst b/Documentation/admin-guide/media/visconti-viif.rst
> new file mode 100644
> index 0000000000..4ef676754c
> --- /dev/null
> +++ b/Documentation/admin-guide/media/visconti-viif.rst
> @@ -0,0 +1,255 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +======================================================
> +Visconti Video Input Interface Driver (visconti-viif)
> +======================================================
> +
> +Introduction
> +============
> +
> +This file documents the driver for the Video Input Interface (VIIF) that is
> +part of Toshiba Visconti SoCs.
> +The driver is located under drivers/media/platform/toshiba/visconti and uses
> +the Media-Controller API.
> +
> +The Visconti VIIF Hardware
> +==========================
> +
> +The Visconti VIIF hardware is a proprietary video capture device.

In what sense is it "proprietary" ? I know the hardware itself isn't
open-source, but that's the case of most of the devices the kernel
supports :-)

> +Following function modules are integrated:
> +
> +* MIPI CSI2 receiver (CSI2RX)
> +* L1 Image Signal Processor (L1ISP)
> +
> +  * Correction, enhancement, adjustment on RAW pictures.
> +
> +* L2 Image Signal Processor (L2ISP)
> +
> +  * Lens distortion correction
> +  * Scaling
> +  * Cropping
> +
> +* Video DMAC
> +
> +  * format picture (RGB, YUV, Grayscale, ...)
> +  * write picture into DRAM
> +
> +Visconti5 SoC has two VIIF hardware instances.

Could you provide a block diagram of the hardware, that shows how the
components are connected ? The .dot file above shows the media graph,
but doesn't map to a more detailed hardware view. I would like to see,
in particular, how the CSI-2 RX, L1ISP, L2ISP and DMAC are connected,
and ideally also the processing blocks inside the L1ISP and L2ISP, and
how they are ordered. It is very important, for instance, to know
exactly where in the processing pipeline the statistics are collected.

See https://lore.kernel.org/linux-media/20240709132906.3198927-9-dan.scally@ideasonboard.com/
and https://lore.kernel.org/linux-media/20240709132906.3198927-15-dan.scally@ideasonboard.com/
for examples of the level of details. The diagram in the first link is a
good candidate for this section of the documentation, and the one from
the second link could go below in the "visconti-viif:isp - ISP Subdevice
Node" section. You can use ascii art of .dot or .svg, up to you.

> +
> +Topology
> +========
> +
> +.. _visconti_viif_topology_graph:
> +
> +.. kernel-figure:: visconti-viif.dot
> +	:alt: Diagram of the default media pipeline topology
> +	:align: center
> +
> +The driver has 5 video devices:
> +
> +- viif_capture_post0: capture device for image.
> +    - corresponds to L2ISP and Video DMAC HW.
> +- viif_capture_post1: capture device for image.
> +    - corresponds to L2ISP and Video DMAC HW.
> +- viif_capture_sub: capture device for RAW image.
> +    - corresponds to Video DMAC HW.

Does the raw capture occur right after the CSI-2 receiver, or is there
any processing applied to the image ? That's a question that would be
answered by a hardware block diagram.

> +- viif_params: a metadata output device that receives ISP parameters.
> +    - corresponds to L1ISP and L2ISP HW.
> +- viif_stats: a metadata capture device that sends statistics.
> +    - corresponds to L1ISP and L2ISP HW.
> +
> +The driver has 2 subdevices:
> +
> +- visconti-viif:csi2rx: CSI2 receiver operation.
> +    - corresponds to CSI2RX HW.
> +- visconti-viif:isp: Image Signal Processor operation.
> +    - corresponds to L1ISP and L2ISP HW.
> +
> +viif_capture_post0, viif_capture_post1 - Processed Image Capture Video Node
> +---------------------------------------------------------------------------
> +
> +These video nodes are used for capturing images processed at ISPs.
> +They capture only following formats:
> +
> +- RGB3
> +- AR24
> +- YM16
> +- YM24
> +- Y16

Please list the formats using the V4L2_PIX_FMT_* macros instead of the
4CC value, it will be easier to read.

> +
> +Bayer format is not supported. Use viif_capture_sub instead.
> +
> +POST0 and POST1 can output images from the same input image
> +using different cropping and scaling settings.

Are there any other processing parameters that can differ between POST0
and POST1 ? I'm thinking for instance about colour spaces. If so, this
should be explained here.

> +
> +viif_capture_sub - Raw Image Capture Video Node
> +-----------------------------------------------
> +
> +This video node is used for capturing bayer image from the sensor.
> +The output picture has exactly the same resolution and format as the sensor input.
> +The following depth of bayer format is supported:
> +
> +- 8bit
> +- 10bit
> +- 12bit
> +- 14bit

Does the hardware support capturing embedded data from the sensor ?

> +
> +visconti-viif:csi2rx - CSI2 Receiver Subdevice Node
> +---------------------------------------------------
> +
> +This subdevice node corresponds to a MIPI CSI2 receiver.
> +It resides between an image sensor subdevice and the ISP subdevice.
> +It controls CSI2 link configuration and training process.
> +
> +visconti-viif:isp - ISP Subdevice Node
> +--------------------------------------
> +
> +This subdevice node corresponds to L1/L2 ISPs.
> +It receives pictures from an sensor (via CSI2RX),
> +applies multiple operations on pictures, then passes resulting images to capture nodes.
> +
> +L1 ISP provides following operations:
> +
> +- Input: accepts 8, 10, 12, 14bit bayer format
> +- Preprocessing: generate intermediate data (24bit RAW)
> +    - HDRE: HDR expansion (only for PWL image);
> +      see :c:type:`viif_l1_hdre_config`, :c:type:`viif_l1_input_mode_config`
> +    - SLIC: Image Extraction (x3 12bit planes for preprocessing);
> +      see :c:type:`viif_l1_img_extraction_config`
> +    - ABPC/DPC: Defect pixel correction :c:type:`viif_l1_dpc_config`
> +    - PWHB: Preset white balance; see :c:type:`viif_l1_preset_white_balance_config`
> +    - RCNR: RAW color noise reduction; see :c:type:`viif_l1_raw_color_noise_reduction_config`
> +    - HDRS: HDR synthesis; see :c:type:`viif_l1_hdrs_config`
> +- Processing on RAW image
> +    - BLVC: black level correction and normalization;
> +      see :c:type:`viif_l1_black_level_correction_config`
> +    - LSSC: Lens shading correction; see :c:type:`viif_l1_lsc_config`
> +    - MPRO: digital amplifier; see :c:type:`viif_l1_main_process_config`
> +    - MPRO: bayer demosaicing; see :c:type:`viif_l1_main_process_config`
> +    - MPRO: color matrix correction; see :c:type:`viif_l1_main_process_config`
> +    - HDRC: HDR compression;
> +      see :c:type:`viif_l1_hdrc_config`, :c:type:`viif_l1_hdrc_ltm_config`,
> +      :c:type:`viif_l1_rgb_to_y_coef_config`
> +- Processing on RGB/YUV image
> +    - VPRO: gamma correction; see :c:type:`viif_l1_gamma_config`
> +    - VPRO: RGB2YUV;
> +      see :c:type:`viif_l1_rgb_to_y_coef_config`,
> +      :c:type:`viif_l1_img_quality_adjustment_config`
> +    - VPRO: image quality adjustment; see :c:type:`viif_l1_img_quality_adjustment_config`
> +- Output: 16bit YUV
> +- Feedback loop with software
> +    - AWHB: auto white balance; see :c:type:`viif_l1_awb_config`,
> +      :c:type:`viif_isp_capture_status`
> +    - AEXP: auto exposure (average luminance calculation);
> +      see :c:type:`viif_l1_avg_lum_generation_config`,
> +      :c:type:`viif_l1_rgb_to_y_coef_config`, :c:type:`viif_isp_capture_status`
> +    - AG: analog gain calculation;
> +      see :c:type:`viif_l1_ag_mode_config`, :c:type:`viif_l1_ag_config`
> +
> +L2 ISP provides following operations:
> +
> +- Input: accepts 16bit YUV
> +- Operations:
> +    - Lens undistortion; see :c:type:`viif_l2_undist`
> +    - Scaling; see :c:type:`viif_l2_roi`
> +    - Cropping; see :c:type:`viif_l2_roi`
> +    - Gamma correction; see :c:type:`viif_l2_gamma_config`
> +    - YUV2RGB
> +- Output: RGB, YUV422, YUV444
> +
> +ISP configurations/parameters are passed from userland via viif_params node.
> +The status of ISP operations are passed to userland via viif_stats node.
> +
> +.. _viif_params:
> +
> +viif_params - ISP Parameters Video Node
> +---------------------------------------
> +
> +The viif_params video node receives a set of ISP parameters from userspace
> +to be applied to the hardware during a video stream.
> +
> +The buffer format is defined by struct :c:type:`visconti_viif_isp_config`, and userspace should set
> +:ref:`V4L2_META_FMT_VISCONTI_VIIF_PARAMS <v4l2-meta-fmt-visconti-viif-params>` as the data format.
> +
> +.. _viif_stats:
> +
> +viif_stats - Statistics Video Node
> +----------------------------------
> +
> +The viif_stats video node provides current status of ISP.
> +
> +Following information is included:
> +
> +* statistics of auto white balance
> +* average luminance information which can be used by auto exposure software impl.

s/impl/implementation/

Out of curiosity, is there no statistics for auto-focus ?

> +
> +The buffer format is defined by struct :c:type:`visconti_viif_isp_stat`, and userspace should set
> +:ref:`V4L2_META_FMT_VISCONTI_VIIF_STATS <v4l2-meta-fmt-visconti-viif-stats>` as the data format.
> +
> +Capturing Video Frames Example
> +==============================
> +
> +In the following example,
> +imx219 camera is connected to pad 0 of 'visconti-viif:isp'.
> +
> +The following commands can be used to capture video from the main path 0
> +with dimension 1024x1024 and RGB format.
> +
> +.. code-block:: bash
> +
> +	# set the links
> +	media-ctl -d platform:visconti-viif-0 -r
> +	media-ctl -d platform:visconti-viif-0 -l '"imx219 1-0010":0 -> "visconti-viif:csi2rx":0 [1]'
> +	media-ctl -d platform:visconti-viif-0 -l '"visconti-viif:csi2rx":1 -> "visconti-viif:isp":0 [1]'
> +	media-ctl -d platform:visconti-viif-0 -l '"visconti-viif:isp":1 -> "viif_capture_post0":0 [1]'
> +	media-ctl -d platform:visconti-viif-0 -l '"visconti-viif:isp":2 -> "viif_capture_post1":0 [1]'
> +	media-ctl -d platform:visconti-viif-0 -l '"visconti-viif:isp":3 -> "viif_capture_sub":0 [1]'
> +	media-ctl -d platform:visconti-viif-0 -l '"viif_params":0 -> "visconti-viif:isp":4 [1]'
> +	media-ctl -d platform:visconti-viif-0 -l '"visconti-viif:isp":5 -> "viif_stats":0 [1]'
> +
> +	# set format for imx219
> +	media-ctl -d platform:visconti-viif-0 --set-v4l2 '"imx219 1-0010":0 [fmt:SRGGB10_1X10/1920x1080]'
> +
> +	# set format for csi2rx
> +	media-ctl -d platform:visconti-viif-0 --set-v4l2 '"visconti-viif:csi2rx":0 [fmt:SRGGB10_1X10/1920x1080]'
> +
> +	# set format for isp sink pad
> +	media-ctl -d platform:visconti-viif-0 --set-v4l2 '"visconti-viif:isp":0 [fmt:SRGGB10_1X10/1920x1080 compose:(0,0)/1920x1080]'
> +
> +	# set format for isp source pad
> +	media-ctl -d platform:visconti-viif-0 --set-v4l2 '"visconti-viif:isp":1 [fmt:YUV8_1X24/1024 crop:(640,0)/1024x1024]'
> +
> +	# set format for main path0
> +	v4l2-ctl -z platform:visconti-viif-0 -d viif_capture_post0 -v "width=1024,height=1024"
> +	v4l2-ctl -z platform:visconti-viif-0 -d viif_capture_post0 -v "pixelformat=RGB3"
> +
> +	# start streaming
> +	v4l2-ctl -z platform:visconti-viif-0 -d viif_capture_post0 --stream-mmap --stream-count 10
> +
> +
> +Use of coherent memory
> +======================
> +
> +Visconti5 SoC has two independent DDR SDRAM controllers.
> +Each controller is mapped to 36bit address space.
> +
> +Accelerator bus masters have two paths to access memory;
> +one is directly connected to SDRAM controller,
> +the another is connected via a cache coherency bus
> +which keeps coherency among CPUs.
> +
> +From accelerators and CPUs, the address map is following:
> +
> +* 0x0_8000_0000 DDR0 direct access
> +* 0x4_8000_0000 DDR0 coherency bus
> +* 0x8_8000_0000 DDR1 direct access
> +* 0xC_8000_0000 DDR1 coherency bus
> +
> +The base address can be specified with "memory" and "reserved-memory" elements
> +in a device tree description.
> +It's not recommended to mix direct address and coherent address.
> +
> +The Visconti5 VIIF driver always use only direct address to configure Video DMACs of the hardware.
> +This design is to avoid great performance loss at coherency bus caused by massive memory access.
> +You should not put the dma_coherent attribute to viif element in device tree.
> +Cache operations are done automatically by videobuf2 driver.
> diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
> index c6e56b5888..23fa0ebe45 100644
> --- a/Documentation/userspace-api/media/v4l/meta-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
> @@ -18,6 +18,7 @@ These formats are used for the :ref:`metadata` interface only.
>      metafmt-pisp-be
>      metafmt-rkisp1
>      metafmt-uvc
> +    metafmt-visconti-viif
>      metafmt-vivid
>      metafmt-vsp1-hgo
>      metafmt-vsp1-hgt
> diff --git a/Documentation/userspace-api/media/v4l/metafmt-visconti-viif.rst b/Documentation/userspace-api/media/v4l/metafmt-visconti-viif.rst
> new file mode 100644
> index 0000000000..dc4b31627f
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/metafmt-visconti-viif.rst
> @@ -0,0 +1,48 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. _v4l2-meta-fmt-visconti-viif-params:
> +
> +.. _v4l2-meta-fmt-visconti-viif-stats:
> +
> +***************************************************************************************
> +V4L2_META_FMT_VISCONTI_VIIF_PARAMS ('vifp'), V4L2_META_FMT_VISCONTI_VIIF_STATS ('vifs')
> +***************************************************************************************
> +
> +Configuration parameters
> +========================
> +
> +The configuration parameters are passed to the
> +:ref:`viif_params <viif_params>` metadata output video node, using
> +the :c:type:`v4l2_meta_format` interface. The buffer contains
> +a single instance of the C structure :c:type:`visconti_viif_isp_config` defined in
> +``visconti_viif.h``. So the structure can be obtained from the buffer by:
> +
> +.. code-block:: c
> +
> +	struct visconti_viif_isp_config *params = (struct visconti_viif_isp_config*) buffer;
> +
> +VIIF statistics
> +===============
> +
> +The VIIF device collects different statistics over an input Bayer frame.
> +Those statistics are obtained from the :ref:`viif_stats <viif_stats>`
> +metadata capture video node,
> +using the :c:type:`v4l2_meta_format` interface. The buffer contains a single
> +instance of the C structure :c:type:`visconti_viif_isp_stat` defined in
> +``visconti_viif.h``. So the structure can be obtained from the buffer by:
> +
> +.. code-block:: c
> +
> +	struct visconti_viif_isp_stat *stats = (struct visconti_viif_isp_stat*) buffer;
> +
> +The statistics collected are Exposure, AWB (auto white balance) and errors.
> +See :c:type:`visconti_viif_isp_stat` for details of the statistics.
> +
> +The statistics and configuration parameters described here are usually
> +consumed and produced by dedicated user space libraries that comprise the
> +tuning tools using software control loop.
> +
> +visconti viif uAPI data types
> +=============================
> +
> +.. kernel-doc:: include/uapi/linux/visconti_viif.h

-- 
Regards,

Laurent Pinchart

