Return-Path: <linux-media+bounces-24228-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF73A000A1
	for <lists+linux-media@lfdr.de>; Thu,  2 Jan 2025 22:26:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A85518839B3
	for <lists+linux-media@lfdr.de>; Thu,  2 Jan 2025 21:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C493D1B87E9;
	Thu,  2 Jan 2025 21:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dkCXTj4E"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F5B1B87CD;
	Thu,  2 Jan 2025 21:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735853183; cv=none; b=YKd7nVsvMJTJTUqHFGVsdQsGcLvcC9RWBiJumqXw9e9PMjAVliLH3pkzBws2Mid4iThIfF5JutltFAzFufNZFQqN1RTvu3yjZbh5OkC2/q4ACugcnW0FykQJ1QFfXMZsSkVr3DayPJzS2fRqjd+0+iJDOK5Bg+MaRs9AeJCS9zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735853183; c=relaxed/simple;
	bh=K93LL1KmOIlA4jas/WC7Bu+cYqLNmACJtVRlkCpxZE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Omt6sFU50CZNSRuXCjwS2PeMf+NnTQaKvpwmux8VnQsAJ/TuD//dTHYb4gnHUvzNnkUz0gR5IHowuJpYDO2c8to8YaRNq2UJwrYmO60IJGl+k0Vw94++arZvNydHy8getiVDd4D0k+YG+omE8oU/2gNp8JmeVtLqSbDwIt8u0nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dkCXTj4E; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D588321C;
	Thu,  2 Jan 2025 22:25:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1735853129;
	bh=K93LL1KmOIlA4jas/WC7Bu+cYqLNmACJtVRlkCpxZE0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dkCXTj4EUM6kUgGibGiSvXeijIbdREwnQGW0OxVSBUMXFMqEA9cmlLZvbrcXKJ0nE
	 Pjrp6wghabwPEOSD8wzFw0zou01OsWeD7UQ6RFX02D1S073Wz8z4vPE7gH1gFFxx3X
	 01A0OA8UHDTcxjxsylbOFweLAPH/9wVhhrVmqJ9M=
Date: Thu, 2 Jan 2025 23:26:18 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v12 7/8] documentation: media: add documentation for
 Toshiba Visconti Video Input Interface driver
Message-ID: <20250102212618.GI554@pendragon.ideasonboard.com>
References: <20241125092146.1561901-1-yuji2.ishikawa@toshiba.co.jp>
 <20241125092146.1561901-8-yuji2.ishikawa@toshiba.co.jp>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241125092146.1561901-8-yuji2.ishikawa@toshiba.co.jp>

Hi Ishikawa-san,

Thank you for the patch.

Overall the documentation looks quite good, it has significantly
improved compared to early versions.

On Mon, Nov 25, 2024 at 06:21:45PM +0900, Yuji Ishikawa wrote:
> Added description of Video Input Interface driver of

s/Added/Add/

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
> Changelog v12:
> - add description of CSI2RX driver
> - description of resizer subdevice
> - add block diagrams of VIIF and ISP
> - update usage of the driver
> 
>  .../admin-guide/media/v4l-drivers.rst         |   1 +
>  .../admin-guide/media/visconti-viif.dot       |  22 +
>  .../admin-guide/media/visconti-viif.rst       | 435 ++++++++++++++++++
>  .../userspace-api/media/v4l/meta-formats.rst  |   1 +
>  .../media/v4l/metafmt-visconti-viif.rst       |  48 ++
>  5 files changed, 507 insertions(+)
>  create mode 100644 Documentation/admin-guide/media/visconti-viif.dot
>  create mode 100644 Documentation/admin-guide/media/visconti-viif.rst
>  create mode 100644 Documentation/userspace-api/media/v4l/metafmt-visconti-viif.rst
> 
> diff --git a/Documentation/admin-guide/media/v4l-drivers.rst b/Documentation/admin-guide/media/v4l-drivers.rst
> index b6af448b9fe9..81054512e768 100644
> --- a/Documentation/admin-guide/media/v4l-drivers.rst
> +++ b/Documentation/admin-guide/media/v4l-drivers.rst
> @@ -32,5 +32,6 @@ Video4Linux (V4L) driver-specific documentation
>  	si476x
>  	starfive_camss
>  	vimc
> +	visconti-viif
>  	visl
>  	vivid
> diff --git a/Documentation/admin-guide/media/visconti-viif.dot b/Documentation/admin-guide/media/visconti-viif.dot
> new file mode 100644
> index 000000000000..cc75c73336fb
> --- /dev/null
> +++ b/Documentation/admin-guide/media/visconti-viif.dot
> @@ -0,0 +1,22 @@
> +digraph board {
> +        rankdir=TB
> +        n00000001 [label="{{<port0> 0 | <port4> 4} | visconti-viif:isp\n/dev/v4l-subdev0 | {<port1> 1 | <port2> 2 | <port3> 3 | <port5> 5}}", shape=Mrecord, style=filled, fillcolor=green]
> +        n00000001:port1 -> n00000008:port0
> +        n00000001:port2 -> n0000000b:port0
> +        n00000001:port3 -> n00000016
> +        n00000001:port5 -> n0000001e
> +        n00000008 [label="{{<port0> 0} | visconti-viif:resizer0\n/dev/v4l-subdev1 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> +        n00000008:port1 -> n0000000e
> +        n0000000b [label="{{<port0> 0} | visconti-viif:resizer1\n/dev/v4l-subdev2 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> +        n0000000b:port1 -> n00000012
> +        n0000000e [label="viif_capture_post0\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
> +        n00000012 [label="viif_capture_post1\n/dev/video1", shape=box, style=filled, fillcolor=yellow]
> +        n00000016 [label="viif_capture_sub\n/dev/video2", shape=box, style=filled, fillcolor=yellow]
> +        n0000001a [label="viif_params\n/dev/video3", shape=box, style=filled, fillcolor=yellow]
> +        n0000001a -> n00000001:port4
> +        n0000001e [label="viif_stats\n/dev/video4", shape=box, style=filled, fillcolor=yellow]
> +        n00000030 [label="{{<port0> 0} | visconti_csi2rx 1c008000.csi2rx\n/dev/v4l-subdev3 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> +        n00000030:port1 -> n00000001:port0
> +        n00000035 [label="{{} | imx219 1-0010\n/dev/v4l-subdev4 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
> +        n00000035:port0 -> n00000030:port0
> +}
> diff --git a/Documentation/admin-guide/media/visconti-viif.rst b/Documentation/admin-guide/media/visconti-viif.rst
> new file mode 100644
> index 000000000000..c2e85fb6f8c1
> --- /dev/null
> +++ b/Documentation/admin-guide/media/visconti-viif.rst
> @@ -0,0 +1,435 @@
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

If you intend to make this two paragraphs, you should have a blank line
in-between:

--------
This file documents the driver for the Video Input Interface (VIIF) that is
part of Toshiba Visconti SoCs.

The driver is located under drivers/media/platform/toshiba/visconti and uses
the Media-Controller API.
--------

If you intend to make this a single paragraph, there should be no line
break after the first sentence:

--------
This file documents the driver for the Video Input Interface (VIIF) that is
part of Toshiba Visconti SoCs. The driver is located under
drivers/media/platform/toshiba/visconti and uses the Media-Controller API.
--------

> +
> +The driver module is named visconti-viif,
> +and is enabled through the CONFIG_VIDEO_VISCONTI_VIIF config option.
> +The CSI-2 receiver part is controlled by another module named visconti-csi2rx,
> +which is enabled through the CONFIG_VIDEO_VISCONTI_CSI2RX config option.

Please reflow text to reach as close to 80 columns:

--------
The driver module is named visconti-viif, and is enabled through the
CONFIG_VIDEO_VISCONTI_VIIF config option. The CSI-2 receiver part is controlled
by another module named visconti-csi2rx, which is enabled through the
CONFIG_VIDEO_VISCONTI_CSI2RX config option.
--------

Same comment below where applicable.

> +
> +The Visconti VIIF Hardware
> +==========================
> +
> +The Visconti VIIF hardware is an internally developed video capture device.
> +Following function modules are integrated:
> +
> +* MIPI CSI-2 receiver (CSI2RX)
> +* L1 Image Signal Processor (L1ISP)
> +
> +  * Correction, enhancement, adjustment on bayer images.
> +
> +* L2 Image Signal Processor (L2ISP)
> +
> +  * Lens distortion correction
> +  * Scaling & Cropping with up to 2 parameter sets
> +  * Formatting picture (RGB, YUV, Grayscale, ...)
> +  * Integrated DMAC: Writing picture into main memory
> +
> +* Video DMAC
> +
> +  * Writing picture into main memory
> +
> +Visconti5 SoC has two VIIF hardware instances.
> +
> +
> +The hardware block diagram is shown below.::
> +
> +  The VIIF hardware
> +                                                              "POST0"
> +                                                              "RGB with scale 0"
> +  +--------+    +----------+    +-----+    +-----+    +-----+    +--------+
> +  | Sensor |--->|  CSI2RX  |--->|     |    |     |    |     |--->| memory |
> +  +--------+    +----------+    |     |    |     |    |     |    +--------+
> +                                |     |    | L1  |    | L2  | "POST1"
> +                                |     |--->| ISP |--->| ISP | "RGB with scale 1"
> +                                |     |    |     |    |     |    +--------+
> +                                | MUX |    |     |    |     |--->| memory |
> +                                |     |    +-----+    +-----+    +--------+
> +                                |     |                       "SUB"
> +                                |     |                       "RAW w/o scale"
> +                                |     |        +------------+    +--------+
> +                                |     |------> | Video DMAC |--->| memory |
> +                                +-----+        +------------+    +--------+
> +
> +Topology
> +========
> +
> +Graph
> +-----
> +
> +.. _visconti_viif_topology_graph:
> +
> +.. kernel-figure:: visconti-viif.dot
> +	:alt: Diagram of the default media pipeline topology
> +	:align: center
> +
> +The driver has 3 video devices for capturing images:
> +
> +- viif_capture_post0: capture device for image.
> +    - corresponds to L2ISP.
> +- viif_capture_post1: capture device for image.
> +    - corresponds to L2ISP.
> +- viif_capture_sub: capture device for bayer image.
> +    - corresponds to Video DMAC.
> +
> +The driver has 2 video devices for controlling ISP.
> +
> +- viif_params: a metadata output device that receives ISP parameters.
> +    - corresponds to L1ISP and L2ISP.
> +- viif_stats: a metadata capture device that sends statistics.
> +    - corresponds to L1ISP and L2ISP.
> +
> +The driver has 2 subdevices:

I count three subdevs in the list below (and there are actually two
resizer instances, so that would be 4 subdevs).

> +
> +- visconti_csi2rx: CSI-2 receiver operation.
> +    - corresponds to CSI2RX.
> +- visconti-viif:isp: Image Signal Processor operation.
> +    - corresponds to L1ISP and L2ISP.
> +- visconti-viif:resizer: Scaling operation of Image Signal Processor.
> +    - corresponds to L2ISP.
> +
> +visconti_csi2rx - CSI2 Receiver Subdevice Node
> +---------------------------------------------------

The title underline should have the same length as the title.

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

s/an sensor/a sensor/

> +applies multiple operations on pictures, then passes resulting images to capture nodes.
> +
> +ISP configurations/parameters are passed from userland via viif_params node.
> +The status of ISP operations are passed to userland via viif_stats node.

"stats" stands for "statistics", so I would write "The statistics
computed by the ISP are passed to ...".

And after reading more of this document, I realize that the viif_stats
node captures both statistics and status information. You could write
"The statistics computed by the ISP and the frame processing status are
passed to ...".

> +
> +L1 ISP provides following operations:
> +
> +- Input: accepts 8, 10, 12, 14bit bayer format
> +    - Operation selector; :c:type:`viif_l1_input_mode_config`
> +        - HDR image / PWL (Piecewse Linear Compression) image
> +        - with preprocessing / without preprocessing
> +    - HDRE: HDR expansion (only for PWL image);
> +      see :c:type:`viif_l1_hdre_config`
> +- Preprocessing: generate intermediate data (24bit RAW)
> +    - SLIC: Bit slicing (x3 12bit planes for preprocessing);
> +      see :c:type:`viif_l1_img_extraction_config`
> +    - ABPC/DPC: Blemish/Defect pixel correction :c:type:`viif_l1_dpc_config`
> +    - PWHB: Preset white balance; see :c:type:`viif_l1_preset_white_balance_config`
> +    - RCNR: RAW color noise reduction; see :c:type:`viif_l1_raw_color_noise_reduction_config`
> +    - HDRS: HDR synthesis; see :c:type:`viif_l1_hdrs_config`
> +- Processing on RAW image: Main Process (MPRO)
> +    - BLVC: black level correction and normalization;
> +      see :c:type:`viif_l1_black_level_correction_config`
> +    - LSSC: Lens shading correction; see :c:type:`viif_l1_lsc_config`
> +    - MPRO: digital amplifier; see :c:type:`viif_l1_main_process_config`
> +    - MPRO: bayer demosaicing; see :c:type:`viif_l1_main_process_config`
> +    - MPRO: color matrix correction; see :c:type:`viif_l1_main_process_config`
> +    - HDRC: HDR compression;

If my understanding is correct, this implements global and local tone
mapping. I would mention it explicitly here, those terms are more common
than "HDR compression". You could write for instance

   - HDRC: HDR compression (global and local tone mapping);

> +      see :c:type:`viif_l1_hdrc_config`, :c:type:`viif_l1_hdrc_ltm_config`,
> +      :c:type:`viif_l1_rgb_to_y_coef_config`
> +- Processing on RGB/YUV image: Video Process (VPRO)
> +    - VPRO: gamma correction; see :c:type:`viif_l1_gamma_config`
> +    - VPRO: RGB2YUV;
> +      see :c:type:`viif_l1_rgb_to_y_coef_config`,
> +      :c:type:`viif_l1_img_quality_adjustment_config`
> +    - VPRO: image quality adjustment; see :c:type:`viif_l1_img_quality_adjustment_config`
> +- Output: 16bit YUV
> +- Feedback loop
> +    - AWHB: auto white balance; see :c:type:`viif_l1_awb_config`,
> +      :c:type:`viif_isp_capture_status`

Does this mean that the ISP can compute white balance gains
automatically, implementing AWB in hardware ? That's interesting, it's a
feature I haven't seen before.

> +    - AEXP: auto exposure (average luminance calculation);
> +      see :c:type:`viif_l1_avg_lum_generation_config`,
> +      :c:type:`viif_l1_rgb_to_y_coef_config`, :c:type:`viif_isp_capture_status`
> +    - AG: analog gain calculation;
> +      see :c:type:`viif_l1_ag_mode_config`, :c:type:`viif_l1_ag_config`
> +
> +Below is the block diagram::
> +
> +  L1ISP::INPUT
> +
> +  +--------+                +-----+                      +-----+
> +  | Input  |--------------->|     |--------------------->|     |
> +  | 24bHDR |                |     |                      |     |
> +  +--------+                | 24b |                      | 24b |
> +                            | RAW |                      | RAW |
> +  +--------+    +------+    | (0) |                      | (1) |
> +  | Input  |--->| HDRE |--->|     |    +------------+    |     |
> +  | 24bPWL |    |      |    |     |--->| preprocess |--->|     |
> +  +--------+    +------+    +-----+    +------------+    +-----+

I'm not entirely sure to understand this correctly, could you please
correct me where I'm mistaken ?

I understand that the PWL input is HDR contents merged/stitched on the
sensor side, and compressed to a smaller than 24bpp width to reduce bus
bandwidth using a PWL function. The HDRE block applies the inverse
function to recover linear 24 bit data. In that case, the "preprocess"
pipeline operates on a single channel (using one of the param_h, param_m
and param_l set of parameters - which one ?). The HDRS blocks should be
disabled (how ?).

The HDR input, on the other hand, provides 2 or 3 channels with
different sensitivities (high, middle and low, from sensors that
implement DOL or DCG HDR). The preprocess pipeline operates on those
channels with different sets of parameters, and the HDRS combines the
channels into a single 24 bit image.

I'm not entirely sure how the two or three channels are provided to the
ISP, with DOL sensors there's a delay before the sensor starts
outputting the short (and very short) lines, so line buffers are needed
to realign the lines. I don't see this in the block diagram.

It would be nice to expand the documentation a bit with such information
about HDR processing, as I assume other developers may face similar
questions.

> +
> +  L1ISP::INPUT::preprocess
> +
> +  +-----+                                                                +-----+
> +  | 24b |    +------+    +------+    +------+    +------+    +------+    | 24b |
> +  | RAW |--->| SLIC |--->| ABPC |--->| PWHB |--->| RCNR |--->| HDRS |--->| RAW |
> +  | (0) |    +------+    +------+    +------+    +------+    +------+    | (1) |
> +  +-----+                                                                +-----+
> +
> +  L1ISP::MainProcess(MPRO)
> +
> +  +-----+
> +  | 24b |    +------+    +------+
> +  | RAW |--->| BLVC |--->| LSSC |---+
> +  | (1) |    +------+    +------+   |
> +  +-----+                           |
> +                                    |
> +     +------------------------------+
> +     |
> +     |    +-----------+    +-------------+    +--------+                +-----+
> +     +--->|   MPRO    |    |    MPRO     |    |  MPRO  |    +------+    | 16b |
> +          |  Digital  |--->| Demosaicing |----| Color  |--->| HDRC |--->| RGB |
> +     +--->| Amplifier |    |             |    | Matrix |    +------+    |     |
> +     |    +-----------+    +-------------+    +--------+                +-----+
> +     |                         |    |
> +     |    +--------------+     |    |    +------+
> +     +----| Auto         |<----+    +--->| AEXP |---> Auto-Exposure statistics
> +          | Whitebalance |               +------+
> +          +--------------+
> +                 |
> +                 +------------------------------> Auto-Whitebalance statistics
> +
> +  L1ISP::VideoProcess(VPRO)
> +
> +  +-----+    +------------+    +------------+    +---------------+    +--------+
> +  | 16b |--->| Gamma      |--->| RGB2YUV    |--->| Image Quality |--->| Output |
> +  | RGB |    | Correction |    | Conversion |    | Adjustment    |    |  16b   |
> +  |     |    +------------+    +------------+    +---------------+    |  YUV   |
> +  +-----+                                                             +--------+
> +
> +  L1ISP::AnalogGain
> +
> +  statistics                     +-------------+    +------------------+
> +  information ---> (user SW) --->| Analog Gain |--->| ABPC, RCNR, LSSC |
> +                                 +-------------+    |       MPRO, VPRO |
> +                                                    +------------------+

I'm a bit puzzled by "analog gain" here, as the ISP operates on digital
data only. Does the ISP need to be informed of the analog gain values
computed by the AEGC software algorithm and applied to the camera
sensor, for instance to estimate the noise level based on the analog
gain and adapt noise filtering accordingly ? Or is it something else ?

Edit: the text below answers this question :-)

> +
> +L2 ISP provides following operations:
> +
> +- Input: accepts 16bit YUV / RGB
> +- Operations:
> +    - Lens undistortion; see :c:type:`viif_l2_undist`

The structure is named viif_l2_undist_config. Please make sure to
compile the documentation, you should then get warnings for C types that
are not found.

> +    - Scaling; see :c:type:`viif_l2_roi`

viif_l2_roi_config

> +    - Cropping; see :c:type:`viif_l2_roi`

Looking at the implementation of the resizer subdevs, I see that the
crop and compose rectangles can be set, but they don't seem to ne used
to configure the resizer. Instead, the viif_l2_roi_config parameters are used
to configure cropping on the resizer input and scaling. This discrepancy
isn't good. I see two options to fix it:

- Keep configuring the resizer through viif_l2_roi_config and drop the resizer
  subdevs. This will simplify the driver. The main drawback is that it
  won't be possible to implement digital zoom (by changing the resizer
  configuration) asynchronously from the ISP parameters buffers, which
  can be useful to lower the latency of digital zoom.

- Drop viif_l2_roi_config, and configure the resizer from the formats,
  crop and selection rectangles on the resizer subdev pads. This makes
  the driver more complex. The main advantage is that digital zoom will
  be configurable with a smaller latency, but the drawback is that it
  won't be possible (or it will be more difficult) to configure it
  synchronously with other ISP parameters.

There are drivers in mainline that implement either of those options, so
you can pick the one you think is best.

An additional issue is that the hardware seems to implement cropping on
the output of the resizer only, not on the input. Given that the size of
the images output by the ISP pipeline must stay constant during video
capture (otherwise there would be a risk of buffer overflow), modifying
the crop rectangle on the output of the resizer is usually not allowed
during streaming. I think this could be worked around by allowing
modification only of the left and top coordinates during streaming, but
configuring everything through viif_l2_roi_config would likely be
easier. In that case, you should probably extend viif_l2_roi_config with
the crop offsets.

All of this reflects my current understanding of the ISP architecture,
based on this document and on the driver code, so please correct me if
there's anything I misunderstood. We can discuss the different options
further before you modify the driver and send a new version.

> +    - Gamma correction; see :c:type:`viif_l2_gamma_config`
> +    - YUV2RGB
> +- Output: RGB, YUV422, YUV444
> +
> +Below is the block diagram::
> +
> +  L2ISP
> +
> +  +-------+    +------------+    +--------------+    +---------+
> +  | Input |--->| YUV2RGB    |--->| Lens         |--->| Scaling |---> |
> +  | Image |    | Conversion |    | Undistortion |    |         |---> |
> +  +-------+    +------------+    +--------------+    +---------+     |

Is the scaling configuration for the two outputs independent ? If so I
would move the scaling block just before gamma correction, in each of
the branches below.

> +                                                                     |
> +          +----------------------------------------------------------+
> +          |
> +          |    +----------+    +------------+    +--------+    +--------+
> +          +--->|Gamma     |--->| Colorspace |--->| Data   |--->| Output |
> +          |    |Correction|    | Conversion |    | Packer |    | Image  |
> +          |    +----------+    +------------+    +--------+    +--------+
> +          |
> +          |    +----------+    +------------+    +--------+    +--------+
> +          +--->|Gamma     |--->| Colorspace |--->| Data   |--->| Output |
> +               |Correction|    | Conversion |    | Packer |    | Image  |
> +               +----------+    +------------+    +--------+    +--------+
> +
> +visconti-viif:resizer - Resizer Subdevice Node
> +----------------------------------------------
> +
> +The resizer subdevice resides between ISP subdevice and Capture device
> +on a capture path for post0 and post1.
> +It receives resize and crop parameters for the specific capture path
> +and controls L2ISP HW.
> +
> +following selection rectangles can be passed at VIDIOC_S_SELECTION ioctl.

s/following/The following/

> +
> +- sink pads's compose rectangle (V4L2_SEL_TGT_COMPOSE) for scaling
> +- source pad's crop rectangle (V4L2_SEL_TGT_CROP) for cropping
> +
> +
> +viif_capture_post0, viif_capture_post1 - Processed Image Capture Video Node
> +---------------------------------------------------------------------------
> +
> +These video nodes are used for capturing images processed at ISPs.
> +Supported capture formats are as follows:
> +
> +- V4L2_PIX_FMT_RGB24
> +- V4L2_PIX_FMT_ABGR32
> +- V4L2_PIX_FMT_YUV422M
> +- V4L2_PIX_FMT_YUV444M

The hardware doesn't support semi-planar formats (NV12 or NV16) or
packed formats (YUYV) ?

> +- V4L2_PIX_FMT_Y16
> +
> +Bayer format is not supported. Use viif_capture_sub instead.
> +
> +POST0 and POST1 can output images from the same input image
> +using different cropping and scaling settings.
> +
> +viif_capture_sub - Raw Image Capture Video Node
> +-----------------------------------------------
> +
> +This video node is used for capturing bayer image from the sensor.
> +The output picture has exactly the same resolution and format as the sensor input.
> +The pipeline does not edit pixel values.
> +However, when writing pixel values to memory, they are shifted to the MSB
> +to match either 8bit or 16bit.
> +
> +Therefore, resulting capture formats are as follows:
> +
> +- for 8bit RAW input:
> +    - V4L2_PIX_FMT_SRGGB8
> +    - V4L2_PIX_FMT_SGRBG8
> +    - V4L2_PIX_FMT_SGBRG8
> +    - V4L2_PIX_FMT_SBGGR8
> +- for 10, 12, 14bit RAW input:
> +    - V4L2_PIX_FMT_SRGGB16
> +    - V4L2_PIX_FMT_SGRBG16
> +    - V4L2_PIX_FMT_SGBRG16
> +    - V4L2_PIX_FMT_SBGGR16
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

The viif_stats video node provides statistics computed by the ISP and
frame processing status.

> +
> +Following information is included:
> +
> +* statistics of auto white balance
> +* average luminance information which can be used by auto exposure software impl.

s/impl/implementation/

I would also add

 * CSI-2 receiver calibration and error status
 * ISP error status

It's quite uncommon to provide this kind of status through ISP stats
buffers, but it sounds like an interesting idea. Other drivers usually
keep error counters in the kernel and expose them through debugfs.

> +
> +The buffer format is defined by struct :c:type:`visconti_viif_isp_stat`, and userspace should set
> +:ref:`V4L2_META_FMT_VISCONTI_VIIF_STATS <v4l2-meta-fmt-visconti-viif-stats>` as the data format.
> +
> +Feedback Operations
> +===================
> +
> +Among the so-called 3A functions, VIIF provides only auto-whitebalance and auto-exposure.
> +Auto-whitebalance is a standalone hardware feature.
> +Some status information is available through the ISP statistics interface.
> +
> +Auto-exposure is realized through a combination of hardware and userland software.
> +VIIF provides weighted average luminance information through the ISP statistics interface.
> +The userland application calculates the sensor gain, sensor exposure and ISP digital gain.
> +The calculated parameters are then passed to sensor's controls and the ISP parameter interface.
> +
> +Among ISP parameters, there are parameters called AG (analog gain).
> +Actually, AG parameters have nothing to do with auto-exposure.
> +It controls "strength" in several signal correction algorithms.
> +Below is the list of the functions which may be affected by AG parameters:
> +
> +- ABPC/DPC
> +- RCNR
> +- LSSC
> +- MPRO: color matrix correction
> +- VPRO
> +
> +Capturing Video Frames Example
> +==============================
> +
> +In the following example,
> +imx219 camera is connected to pad 0 of 'visconti_csi2rx' subdevice.
> +
> +The following commands yield three pictures with different zoom ratio:
> +- main path 0: 1.5x zoom, crop 1920x1080, RGB picture
> +- main path 1: 0.67x zoom, crop 640x480, RGB picture
> +- sub path: 1920x1080 RAW picture
> +
> +.. code-block:: bash
> +
> +	# set the links
> +	media-ctl -d platform:visconti-viif-0 -r
> +	media-ctl -d platform:visconti-viif-0 -l '"imx219 1-0010":0 -> "visconti_csi2rx 1c008000.csi2rx":0 [1]'
> +	media-ctl -d platform:visconti-viif-0 -l '"visconti_csi2rx 1c008000.csi2rx":1 -> "visconti-viif:isp":0 [1]'
> +	media-ctl -d platform:visconti-viif-0 -l '"visconti-viif:isp":1 -> "visconti-viif:resizer0":0 [1]'
> +	media-ctl -d platform:visconti-viif-0 -l '"visconti-viif:isp":2 -> "visconti-viif:resizer1":0 [1]'
> +	media-ctl -d platform:visconti-viif-0 -l '"visconti-viif:isp":3 -> "viif_capture_sub":0 [1]'
> +	media-ctl -d platform:visconti-viif-0 -l '"visconti-viif:resizer0":1 -> "viif_capture_post0":0 [1]'
> +	media-ctl -d platform:visconti-viif-0 -l '"visconti-viif:resizer1":1 -> "viif_capture_post1":0 [1]'
> +	media-ctl -d platform:visconti-viif-0 -l '"viif_params":0 -> "visconti-viif:isp":4 [1]'
> +	media-ctl -d platform:visconti-viif-0 -l '"visconti-viif:isp":5 -> "viif_stats":0 [1]'
> +
> +	# set format for imx219
> +	media-ctl -d platform:visconti-viif-0 --set-v4l2 '"imx219 1-0010":0 [fmt:SRGGB10_1X10/1920x1080]'
> +
> +	# set format for csi2rx
> +	media-ctl -d platform:visconti-viif-0 --set-v4l2 '"visconti_csi2rx 1c008000.csi2rx":0 [fmt:SRGGB10_1X10/1920x1080  field:none colorspace:raw xfer:none ycbcr:601 quantization:full-range]'
> +
> +	# set format for isp sink pad
> +	media-ctl -d platform:visconti-viif-0 --set-v4l2 '"visconti-viif:isp":0 [fmt:SRGGB10_1X10/1920x1080]'
> +
> +	# set format for resizer pads
> +	media-ctl -d platform:visconti-viif-0 --set-v4l2 '"visconti-viif:resizer0":0 '"[fmt:YUV8_1X24/1920x1080 compose:(0,0)/2880x1620]"
> +	media-ctl -d platform:visconti-viif-0 --set-v4l2 '"visconti-viif:resizer0":1 '"[crop:(480,16)/1920x1080]"
> +	media-ctl -d platform:visconti-viif-0 --set-v4l2 '"visconti-viif:resizer1":0 '"[fmt:YUV8_1X24/1920x1080 compose:(0,0)/1280x720]"
> +	media-ctl -d platform:visconti-viif-0 --set-v4l2 '"visconti-viif:resizer1":1 '"[crop:(320,32)/640x480]"
> +
> +	media-ctl -d platform:visconti-viif-0 --set-v4l2 '"visconti-viif:isp":1 [fmt:YUV8_1X24/1024 crop:(640,0)/1024x1024]'
> +
> +	# set format for main path0
> +	v4l2-ctl -z platform:visconti-viif-0 -d viif_capture_post0 -v "width=1920,height=1080"
> +	v4l2-ctl -z platform:visconti-viif-0 -d viif_capture_post0 -v "pixelformat=RGB3"
> +
> +	# set format for main path1
> +	v4l2-ctl -z platform:visconti-viif-0 -d viif_capture_post0 -v "width=640,height=480"
> +	v4l2-ctl -z platform:visconti-viif-0 -d viif_capture_post0 -v "pixelformat=RGB3"
> +
> +	# start streaming
> +	v4l2-ctl -z platform:visconti-viif-0 -d viif_capture_post0 --stream-mmap --stream-count 1000 &
> +
> +	# start streaming with other devices while viif_capture_post0 is running
> +	v4l2-ctl -z platform:visconti-viif-0 -d viif_capture_post1 --stream-mmap --stream-count 10
> +	v4l2-ctl -z platform:visconti-viif-0 -d viif_capture_sub --stream-mmap --stream-count 10
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
> index 86ffb3bc8ade..2336842f0c26 100644
> --- a/Documentation/userspace-api/media/v4l/meta-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
> @@ -19,6 +19,7 @@ These formats are used for the :ref:`metadata` interface only.
>      metafmt-pisp-fe
>      metafmt-rkisp1
>      metafmt-uvc
> +    metafmt-visconti-viif
>      metafmt-vivid
>      metafmt-vsp1-hgo
>      metafmt-vsp1-hgt
> diff --git a/Documentation/userspace-api/media/v4l/metafmt-visconti-viif.rst b/Documentation/userspace-api/media/v4l/metafmt-visconti-viif.rst
> new file mode 100644
> index 000000000000..dc4b31627fe1
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

Assuming the documentation in the header file is adequate, the level of
detail here is fine.

-- 
Regards,

Laurent Pinchart

