Return-Path: <linux-media+bounces-5146-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9132854B49
	for <lists+linux-media@lfdr.de>; Wed, 14 Feb 2024 15:20:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 096F81C24390
	for <lists+linux-media@lfdr.de>; Wed, 14 Feb 2024 14:20:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F302858135;
	Wed, 14 Feb 2024 14:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="m0ve/P1b"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A20A5810D;
	Wed, 14 Feb 2024 14:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707920385; cv=none; b=tU0QBM/pGtUd5IvdF++3ipgONoZYIh52oV4silb3ZQwo6AwsEGm09NfexY3E6NsOQtwCNCbWQ4/fPFnfYsr7PxlMlpe+tKCcFmEA5jx4UfiVK9crVRQt9ObqjgUOjC5LTyTeawwK5ySqkJS5g1wqgvZgqMi7ARMH4M3KncnqTZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707920385; c=relaxed/simple;
	bh=yKDAbJPSf6bX6f3GS+eu+37ZxEXfUtZWeHHBBhMDcBY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mEA+1jfL51APCjVIABRl8vD5i+xj/4JBzetLtmJOf8Eq36BoI9FRf9MQ3Wu65hCVdTTWSDVQMha5sL3ttPi8Y9oi9Vj57DmPzwtkM0cwuO0NxhYAwjQia+l4t7s1bRUnsOFZJg65Wllol8KDWOXjLmRtWJPq7ejGAiO+OBIkmvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=m0ve/P1b; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 28CCCFA6;
	Wed, 14 Feb 2024 15:19:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1707920367;
	bh=yKDAbJPSf6bX6f3GS+eu+37ZxEXfUtZWeHHBBhMDcBY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m0ve/P1b5QitoJLkpHqLjRm6NXxdqSHOaO3jMZUiZLJ9/6XjXf7mS2nZMzw+Z03sQ
	 lyLHsAnRCIuC3YjkZDUzBmi+sp7D3Lb9ZUYHRlrexm1Qm0mLE0yPG5shT6VgWdE5uC
	 8UdTccKVHoEj2a2hMxiQsWg3egZzP3Cb5lPhuD30=
From: Daniel Scally <dan.scally@ideasonboard.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: jacopo.mondi@ideasonboard.com,
	nayden.kanchev@arm.com,
	robh+dt@kernel.org,
	mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	jerome.forissier@linaro.org,
	kieran.bingham@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v2 4/5] media: Documentation: Add Mali-C55 ISP Documentation
Date: Wed, 14 Feb 2024 14:19:05 +0000
Message-Id: <20240214141906.245685-5-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240214141906.245685-1-dan.scally@ideasonboard.com>
References: <20240214141906.245685-1-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a documentation page for the mali-c55 driver, which gives a brief
overview of the hardware and explains how to use the driver's capture
devices and the crop/scaler functions.

Acked-by: Nayden Kanchev <nayden.kanchev@arm.com>
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v2:

	- none

 .../admin-guide/media/mali-c55-graph.dot      |  19 ++
 Documentation/admin-guide/media/mali-c55.rst  | 318 ++++++++++++++++++
 .../admin-guide/media/v4l-drivers.rst         |   1 +
 3 files changed, 338 insertions(+)
 create mode 100644 Documentation/admin-guide/media/mali-c55-graph.dot
 create mode 100644 Documentation/admin-guide/media/mali-c55.rst

diff --git a/Documentation/admin-guide/media/mali-c55-graph.dot b/Documentation/admin-guide/media/mali-c55-graph.dot
new file mode 100644
index 000000000000..0775ba42bf4c
--- /dev/null
+++ b/Documentation/admin-guide/media/mali-c55-graph.dot
@@ -0,0 +1,19 @@
+digraph board {
+        rankdir=TB
+        n00000001 [label="{{} | mali-c55 tpg\n/dev/v4l-subdev0 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
+        n00000001:port0 -> n00000003:port0 [style=dashed]
+        n00000003 [label="{{<port0> 0} | mali-c55 isp\n/dev/v4l-subdev1 | {<port1> 1 | <port2> 2}}", shape=Mrecord, style=filled, fillcolor=green]
+        n00000003:port1 -> n00000007:port0 [style=bold]
+        n00000003:port2 -> n00000007:port2 [style=bold]
+        n00000003:port1 -> n0000000b:port0 [style=bold]
+        n00000007 [label="{{<port0> 0 | <port2> 2} | mali-c55 resizer fr\n/dev/v4l-subdev2 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
+        n00000007:port1 -> n0000000e [style=bold]
+        n0000000b [label="{{<port0> 0} | mali-c55 resizer ds\n/dev/v4l-subdev3 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
+        n0000000b:port1 -> n00000012 [style=bold]
+        n0000000e [label="mali-c55 fr\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
+        n00000012 [label="mali-c55 ds\n/dev/video1", shape=box, style=filled, fillcolor=yellow]
+        n00000022 [label="{{<port0> 0} | csi2-rx\n/dev/v4l-subdev4 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
+        n00000022:port1 -> n00000003:port0
+        n00000027 [label="{{} | imx415 1-001a\n/dev/v4l-subdev5 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
+        n00000027:port0 -> n00000022:port0 [style=bold]
+}
\ No newline at end of file
diff --git a/Documentation/admin-guide/media/mali-c55.rst b/Documentation/admin-guide/media/mali-c55.rst
new file mode 100644
index 000000000000..83f630c3bd9d
--- /dev/null
+++ b/Documentation/admin-guide/media/mali-c55.rst
@@ -0,0 +1,318 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==========================================
+ARM Mali-C55 Image Signal Processor driver
+==========================================
+
+Introduction
+============
+
+This file documents the driver for ARM's Mali-C55 Image Signal Processor. The
+driver is located under drivers/media/platform/arm/mali-c55.
+
+The Mali-C55 ISP receives data in either raw Bayer format or RGB/YUV format from
+sensors through either a parallel interface or a memory bus before processing it
+and outputting it through an internal DMA engine. Two output pipelines are
+possible (though one may not be fitted, depending on the implementation). These
+are referred to as "Full resolution" and "Downscale", but the naming is historic
+and both pipes are capable of cropping/scaling operations. An integrated test
+pattern generator can be used to drive the ISP and produce image data in the
+absence of a connected camera sensor. The driver module is named mali_c55, and
+is enabled through the CONFIG_VIDEO_MALI_C55 config option.
+
+The driver implements V4L2, Media Controller and V4L2 Subdevice interfaces and
+expects camera sensors connected to the ISP to have V4L2 subdevice interfaces.
+
+Mali-C55 ISP hardware
+=====================
+
+A high level functional view of the Mali-C55 ISP is presented below. The ISP
+takes input from either a live source or through a DMA engine for memory input,
+depending on the SoC integration.::
+
+  +---------+    +----------+                                     +--------+
+  | Sensor  |--->| CSI-2 Rx |                "Full Resolution"    |  DMA   |
+  +---------+    +----------+   |\                 Output    +--->| Writer |
+                       |        | \                          |    +--------+
+                       |        |  \    +----------+  +------+---> Streaming I/O
+  +------------+       +------->|   |   |          |  |
+  |            |                |   |-->| Mali-C55 |--+
+  | DMA Reader |--------------->|   |   |    ISP   |  |
+  |            |                |  /    |          |  |      +---> Streaming I/O
+  +------------+                | /     +----------+  |      |
+                                |/                    +------+
+				                             |    +--------+
+                                                             +--->|  DMA   |
+                                               "Downscaled"       | Writer |
+					          Output          +--------+
+
+Media Controller Topology
+=========================
+
+An example of the ISP's topology (as implemented in a system with an IMX415
+camera sensor and generic CSI-2 receiver) is below:
+
+
+.. kernel-figure:: mali-c55-graph.dot
+    :alt:   mali-c55-graph.dot
+    :align: center
+
+The driver has 4 V4L2 subdevices:
+
+- `mali_c55 isp`: Responsible for configuring input crop and color space
+                  conversion
+- `mali_c55 tpg`: The test pattern generator, emulating a camera sensor.
+- `mali_c55 resizer fr`: The Full-Resolution pipe resizer
+- `mali_c55 resizer ds`: The Downscale pipe resizer
+
+The driver has 2 V4L2 video devices:
+
+- `mali-c55 fr`: The full-resolution pipe's capture device
+- `mali-c55 ds`: The downscale pipe's capture device
+
+Idiosyncrasies
+--------------
+
+**mali-c55 isp**
+The `mali-c55 isp` subdevice has a single sink pad to which all sources of data
+should be connected. The active source is selected by enabling the appropriate
+media link and disabling all others. The ISP has two source pads, reflecting the
+different paths through which it can internally route data. Tap points within
+the ISP allow users to divert data to avoid processing by some or all of the
+hardware's processing steps. The diagram below is intended only to highlight how
+the bypassing works and is not a true reflection of those processing steps; for
+a high-level functional block diagram see ARM's developer page for the
+ISP [3]_::
+
+  +--------------------------------------------------------------+
+  |                Possible Internal ISP Data Routes             |
+  |          +------------+  +----------+  +------------+        |
+  +---+      |            |  |          |  |  Colour    |    +---+
+  | 0 |--+-->| Processing |->| Demosaic |->|   Space    |--->| 1 |
+  +---+  |   |            |  |          |  | Conversion |    +---+
+  |      |   +------------+  +----------+  +------------+        |
+  |      |                                                   +---+
+  |      +---------------------------------------------------| 2 |
+  |                                                          +---+
+  |                                                              |
+  +--------------------------------------------------------------+
+
+
+.. flat-table::
+    :header-rows: 1
+
+    * - Pad
+      - Direction
+      - Purpose
+
+    * - 0
+      - sink
+      - Data input, connected to the TPG and camera sensors
+
+    * - 1
+      - source
+      - RGB/YUV data, connected to the FR and DS V4L2 subdevices
+
+    * - 2
+      - source
+      - RAW bayer data, connected to the FR V4L2 subdevices
+
+**mali-c55 resizer fr**
+The `mali-c55 resizer fr` subdevice has two _sink_ pads to reflect the different
+insertion points in the hardware (either RAW or demosaiced data):
+
+.. flat-table::
+    :header-rows: 1
+
+    * - Pad
+      - Direction
+      - Purpose
+
+    * - 0
+      - sink
+      - Data input connected to the ISP's demosaiced stream.
+
+    * - 1
+      - source
+      - Data output connected to the capture video device
+
+    * - 2
+      - sink
+      - Data input connected to the ISP's raw data stream
+
+The data source in use is selected through the routing API; two routes each of a
+single stream are available:
+
+.. flat-table::
+    :header-rows: 1
+
+    * - Sink Pad
+      - Source Pad
+      - Purpose
+
+    * - 0
+      - 1
+      - Demosaiced data route
+
+    * - 2
+      - 1
+      - Raw data route
+
+
+If the demosaiced route is active then the FR pipe is only capable of output
+in RGB/YUV formats. If the raw route is active then the output reflects the
+input (which may be either Bayer or RGB/YUV data).
+
+Using the driver to capture video
+=================================
+
+Using the media controller APIs we can configure the input source and ISP to
+capture images in a variety of formats. In the examples below, configuring the
+media graph is done with the v4l-utils [1]_ package's media-ctl utility.
+Capturing the images is done with yavta [2]_.
+
+Configuring the input source
+----------------------------
+
+The first step is to set the input source that we wish by enabling the correct
+media link. Using the example topology above, we can select the TPG as follows:
+
+.. code-block:: none
+
+    media-ctl -l "'lte-csi2-rx':1->'mali-c55 isp':0[0]"
+    media-ctl -l "'mali-c55 tpg':0->'mali-c55 isp':0[1]"
+
+Capturing bayer data from the source and processing to RGB/YUV
+--------------------------------------------------------------
+To capture 1920x1080 bayer data from the source and push it through the ISP's
+full processing pipeline, we configure the data formats appropriately on the
+source, ISP and resizer subdevices and set the FR resizer's routing to select
+processed data. The media bus format on the resizer's source pad will be either
+RGB121212_1X36 or YUV10_1X30, depending on whether you want to capture RGB or
+YUV. The ISP's debayering block outputs RGB data natively, setting the source
+pad format to YUV10_1X30 enables the colour space conversion block.
+
+In this example we target RGB565 output, so select RGB121212_1X36 as the resizer
+source pad's format:
+
+.. code-block:: none
+
+    # Set formats on the TPG and ISP
+    media-ctl -V "'mali-c55 tpg':0[fmt:SRGGB16_1X16/1920x1080]"
+    media-ctl -V "'mali-c55 isp':0[fmt:SRGGB16_1X16/1920x1080]"
+    media-ctl -V "'mali-c55 isp':1[fmt:SRGGB16_1X16/1920x1080]"
+
+    # Set routing on the FR resizer
+    media-ctl -R "'mali-c55 resizer fr'[0/0->1/0[1],2/0->1/0[0]]"
+
+    # Set format on the resizer, must be done AFTER the routing.
+    media-ctl -V "'mali-c55 resizer fr':1[fmt:RGB121212_1X36/1920x1080]"
+
+The downscale output can also be used to stream data at the same time. In this
+case only processed data can be captured and so no routing need be set:
+
+.. code-block:: none
+
+    # Set format on the resizer
+    media-ctl -V "'mali-c55 resizer ds':1[fmt:RGB121212_1X36/1920x1080]"
+
+Following which images can be captured from both the FR and DS output's video
+devices (simultaneously, if desired):
+
+.. code-block:: none
+
+    yavta -f RGB565 -s 1920x1080 -c10 /dev/video0
+    yavta -f RGB565 -s 1920x1080 -c10 /dev/video1
+
+Cropping the image
+~~~~~~~~~~~~~~~~~~
+
+Both the full resolution and downscale pipes can crop to a minimum resolution of
+640x480. To crop the image simply configure the resizer's sink pad's crop and
+compose rectangles and set the format on the video device:
+
+.. code-block:: none
+
+    media-ctl -V "'mali-c55 resizer fr':0[fmt:RGB121212_1X36/1920x1080 crop:(480,270)/640x480 compose:(0,0)/640x480]"
+    media-ctl -V "'mali-c55 resizer fr':1[fmt:RGB121212_1X36/640x480]"
+    yavta -f RGB565 -s 640x480 -c10 /dev/video0
+
+Downscaling the image
+~~~~~~~~~~~~~~~~~~~~~
+
+Both the full resolution and downscale pipes can downscale the image by up to 8x
+provided the minimum 640x480 resolution is adhered to. For the best image result
+the scaling ratio for each dimension should be the same. To configure scaling we
+use the compose rectangle on the resizer's sink pad:
+
+.. code-block:: none
+
+    media-ctl -V "'mali-c55 resizer fr':0[fmt:RGB121212_1X36/1920x1080 crop:(0,0)/1920x1080 compose:(0,0)/640x480]"
+    media-ctl -V "'mali-c55 resizer fr':1[fmt:RGB121212_1X36/640x480]"
+    yavta -f RGB565 -s 640x480 -c10 /dev/video0
+
+Capturing images in YUV formats
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+If we need to output YUV data rather than RGB the color space conversion block
+needs to be active, which is achieved by setting MEDIA_BUS_FMT_YUV10_1X30 on the
+resizer's source pad. We can then configure a capture format like NV12 (here in
+its multi-planar variant)
+
+.. code-block:: none
+
+    media-ctl -V "'mali-c55 resizer fr':1[fmt:YUV10_1X30/1920x1080]"
+    yavta -f NV12M -s 1920x1080 -c10 /dev/video0
+
+Capturing RGB data from the source and processing it with the resizers
+----------------------------------------------------------------------
+
+The Mali-C55 ISP can work with sensors capable of outputting RGB data. In this
+case although none of the image quality blocks would be used it can still
+crop/scale the data in the usual way.
+
+To achieve this, the ISP's sink pad's format is set to
+MEDIA_BUS_FMT_RGB202020_1X60 - this reflects the format that data must be in to
+work with the ISP. Converting the camera sensor's output to that format is the
+responsibility of external hardware.
+
+In this example we ask the test pattern generator to give us RGB data instead of
+bayer.
+
+.. code-block:: none
+
+    media-ctl -V "'mali-c55 tpg':0[fmt:RGB202020_1X60/1920x1080]"
+    media-ctl -V "'mali-c55 isp':0[fmt:RGB202020_1X60/1920x1080]"
+
+Cropping or scaling the data can be done in exactly the same way as outlined
+earlier.
+
+Capturing raw data from the source and outputting it unmodified
+-----------------------------------------------------------------
+
+The ISP can additionally capture raw data from the source and output it on the
+full resolution pipe only, completely unmodified. In this case the downscale
+pipe can still process the data normally and be used at the same time.
+
+To configure raw bypass the FR resizer's subdevice's routing table needs to be
+configured, followed by formats in the appropriate places:
+
+.. code-block:: none
+
+    # We need to configure the routing table for the resizer to use the bypass
+    # path along with set formats on the resizer's bypass sink pad. Doing this
+    # necessitates a single media-ctl command, as multiple calls to the program
+    # reset the routing table.
+    media-ctl -R "'mali-c55 resizer fr'[0/0->1/0[0],2/0->1/0[1]]"\
+    -V "'mali-c55 isp':0[fmt:RGB202020_1X60/1920x1080],"\
+       "'mali-c55 resizer fr':2[fmt:RGB202020_1X60/1920x1080],"\
+       "'mali-c55 resizer fr':1[fmt:RGB202020_1X60/1920x1080]"
+
+    # Set format on the video device and stream
+    yavta -f RGB565 -s 1920x1080 -c10 /dev/video0
+
+References
+==========
+.. [1] https://git.linuxtv.org/v4l-utils.git/
+.. [2] https://git.ideasonboard.org/yavta.git
+.. [3] https://developer.arm.com/Processors/Mali-C55
diff --git a/Documentation/admin-guide/media/v4l-drivers.rst b/Documentation/admin-guide/media/v4l-drivers.rst
index f4bb2605f07e..af033c892808 100644
--- a/Documentation/admin-guide/media/v4l-drivers.rst
+++ b/Documentation/admin-guide/media/v4l-drivers.rst
@@ -17,6 +17,7 @@ Video4Linux (V4L) driver-specific documentation
 	imx7
 	ipu3
 	ivtv
+	mali-c55
 	mgb4
 	omap3isp
 	omap4_camera
-- 
2.34.1


