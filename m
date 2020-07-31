Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 823F523457E
	for <lists+linux-media@lfdr.de>; Fri, 31 Jul 2020 14:12:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733191AbgGaMMz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Jul 2020 08:12:55 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:38100 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732886AbgGaMMy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Jul 2020 08:12:54 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 0CD17299285
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com, mchehab@kernel.org,
        tfiga@chromium.org
Subject: [PATCH 2/2] media: admin-guide: add documentation file rkisp1.rst
Date:   Fri, 31 Jul 2020 14:12:43 +0200
Message-Id: <20200731121243.25882-3-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200731121243.25882-1-dafna.hirschfeld@collabora.com>
References: <20200731121243.25882-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

1. Add the file 'rkisp1.rst' that documents the rkisp1 driver.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 Documentation/admin-guide/media/rkisp1.dot    |  18 +++
 Documentation/admin-guide/media/rkisp1.rst    | 147 ++++++++++++++++++
 .../admin-guide/media/v4l-drivers.rst         |   1 +
 3 files changed, 166 insertions(+)
 create mode 100644 Documentation/admin-guide/media/rkisp1.dot
 create mode 100644 Documentation/admin-guide/media/rkisp1.rst

diff --git a/Documentation/admin-guide/media/rkisp1.dot b/Documentation/admin-guide/media/rkisp1.dot
new file mode 100644
index 000000000000..54c1953a6130
--- /dev/null
+++ b/Documentation/admin-guide/media/rkisp1.dot
@@ -0,0 +1,18 @@
+digraph board {
+	rankdir=TB
+	n00000001 [label="{{<port0> 0 | <port1> 1} | rkisp1_isp\n/dev/v4l-subdev0 | {<port2> 2 | <port3> 3}}", shape=Mrecord, style=filled, fillcolor=green]
+	n00000001:port2 -> n00000006:port0
+	n00000001:port2 -> n00000009:port0
+	n00000001:port3 -> n00000014 [style=bold]
+	n00000006 [label="{{<port0> 0} | rkisp1_resizer_mainpath\n/dev/v4l-subdev1 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
+	n00000006:port1 -> n0000000c [style=bold]
+	n00000009 [label="{{<port0> 0} | rkisp1_resizer_selfpath\n/dev/v4l-subdev2 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
+	n00000009:port1 -> n00000010 [style=bold]
+	n0000000c [label="rkisp1_mainpath\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
+	n00000010 [label="rkisp1_selfpath\n/dev/video1", shape=box, style=filled, fillcolor=yellow]
+	n00000014 [label="rkisp1_stats\n/dev/video2", shape=box, style=filled, fillcolor=yellow]
+	n00000018 [label="rkisp1_params\n/dev/video3", shape=box, style=filled, fillcolor=yellow]
+	n00000018 -> n00000001:port1 [style=bold]
+	n0000001c [label="{{} | imx219 4-0010\n/dev/v4l-subdev3 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
+	n0000001c:port0 -> n00000001:port0
+}
diff --git a/Documentation/admin-guide/media/rkisp1.rst b/Documentation/admin-guide/media/rkisp1.rst
new file mode 100644
index 000000000000..16021e602a93
--- /dev/null
+++ b/Documentation/admin-guide/media/rkisp1.rst
@@ -0,0 +1,147 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: <isonum.txt>
+
+=========================================
+Rockchip Image Signal Processor (rkisp1)
+=========================================
+
+Introduction
+============
+
+This file documents the driver for the Rockchip ISP1 that is part of RK3288 and RK3399 SoCs.
+The driver is located under drivers/staging/media/rkisp1 and uses the Media-Controller API.
+
+Topology
+========
+.. _rkisp1_topology_graph:
+
+.. kernel-figure:: rkisp1.dot
+    :alt:   Diagram of the default media pipeline topology
+    :align: center
+
+
+The driver has 4 video devices:
+ - rkisp1_mainpath: capture device for retrieving images, usually in higher resolution.
+ - rkisp1_selfpath: capture device for retrieving images.
+ - rkisp1_stats: a metadata capture device that sends statistics.
+ - rkisp1_params: a metadata output device that receives parameters configurations from userspace.
+
+The driver has 3 subdevices:
+ - rkisp1_resizer_mainpath: used to resize and downsample frames for the mainpath capture device.
+ - rkisp1_resizer_selfpath: used to resize and downsample frames for the selfpath capture device.
+ - rkisp1_isp: is connected to the sensor and is responsible for all the isp operations.
+
+
+rkisp1_mainpath, rkisp1_selfpath - Frames Capture Video Nodes
+-------------------------------------------------------------
+Those are the `mainpath` and `selfpath` capture devices to capture frames.
+Those entities are the DMA engines that write the frames to memory.
+The selfpath video device can capture YUV/RGB formats. Its input is YUV encoded
+stream and it is able to convert it to RGB. The selfpath in not able to capture bayer formats.
+The mainpath can capture both bayer and YUV formats but it is not able to capture RGB formats.
+Both capture videos support the ``V4L2_CAP_IO_MC`` :ref:`capability <device-capabilities>`.
+
+
+rkisp1_resizer_mainpath, rkisp1_resizer_selfpath - Resizers Subdevices Nodes
+----------------------------------------------------------------------------
+Those are resizer entities for the mainpath and the selfpath. Those entities can scale the frames up
+and down and also change the YUV sampling (for example YUV4:2:2 -> YUV4:2:0). They also have
+cropping capability on the sink pad.
+The resizers entities can only operate on YUV:4:2:2 format (MEDIA_BUS_FMT_YUYV8_2X8).
+The mainpath capture device supports capturing video in bayer formats. In that case the resizer
+of the mainpath is set to 'bypath' mode - it just forward the frame without operating on it.
+
+rkisp1_isp - Image Signal Processing Subdevice Node
+---------------------------------------------------
+This is the isp entity. It is connected to the sensor on sink pad 0 and receives the frames using
+the CSI-2 protocol. It is responsible of configuring the CSI-2 protocol.
+It has a cropping capability on sink pad 0 that is connected to the sensor and on source pad 2 connected to
+the resizer entities.
+Cropping on sink pad 0 defines the image region from the sensor.
+Cropping on source pad 2 defines the region for the Image Stabilizer (IS).
+
+.. _rkisp1_stats:
+
+rkisp1_stats - Statistics Video Node
+------------------------------------
+The statistics video node outputs the 3A (auto focus, auto exposure and auto white balance) statistics as
+well as histogram statistics for the frames that are being processed by the rkisp1 to userspace applications.
+Applications can use this statistics data to compute the desired algorithm parameters for the rkisp1.
+
+.. _rkisp1_params:
+
+rkisp1_params - Parameters Video Node
+-------------------------------------
+The parameters video node receives the rkisp1 algorithm parameters that are used
+to configure how the rkisp1 algorithms process the image.
+
+Details on processing parameters specific to the rkisp1 can be found in
+:ref:`v4l2-meta-fmt-params-rkisp1`.
+
+
+Capturing Video Frames Example
+==============================
+
+In the following example, the sensor connected to pad 0 of 'rkisp1_isp' is imx219.
+
+The following commands can be used to capture video from the selfpath video node
+with dimension 900x800 planar format YUV 4:2:2. It uses all cropping capabilities possible,
+(see explanation right below)
+
+.. code-block:: bash
+
+	# set the links
+	"media-ctl" "-d" "platform:rkisp1" "-r"
+	"media-ctl" "-d" "platform:rkisp1" "-l" "'imx219 4-0010':0 -> 'rkisp1_isp':0 [1]"
+	"media-ctl" "-d" "platform:rkisp1" "-l" "'rkisp1_isp':2 -> 'rkisp1_resizer_selfpath':0 [1]"
+	"media-ctl" "-d" "platform:rkisp1" "-l" "'rkisp1_isp':2 -> 'rkisp1_resizer_mainpath':0 [0]"
+
+	# set format for imx219 4-0010:0
+	"media-ctl" "-d" "platform:rkisp1" "--set-v4l2" '"imx219 4-0010":0 [fmt:SRGGB10_1X10/1640x1232]'
+
+	# set format for rkisp1_isp pads:
+	"media-ctl" "-d" "platform:rkisp1" "--set-v4l2" '"rkisp1_isp":0 [fmt:SRGGB10_1X10/1640x1232 crop: (0,0)/1600x1200]'
+	"media-ctl" "-d" "platform:rkisp1" "--set-v4l2" '"rkisp1_isp":2 [fmt:YUYV8_2X8/1600x1200 crop: (0,0)/1500x1100]'
+
+	# set format for rkisp1_resizer_selfpath pads:
+	"media-ctl" "-d" "platform:rkisp1" "--set-v4l2" '"rkisp1_resizer_selfpath":0 [fmt:YUYV8_2X8/1500x1100 crop: (300,400)/1400x1000]'
+	"media-ctl" "-d" "platform:rkisp1" "--set-v4l2" '"rkisp1_resizer_selfpath":1 [fmt:YUYV8_2X8/900x800]'
+
+	# set format for rkisp1_selfpath:
+	"v4l2-ctl" "-z" "platform:rkisp1" "-d" "rkisp1_selfpath" "-v" "width=900,height=800,"
+	"v4l2-ctl" "-z" "platform:rkisp1" "-d" "rkisp1_selfpath" "-v" "pixelformat=422P"
+
+	# start streaming:
+	v4l2-ctl "-z" "platform:rkisp1" "-d" "rkisp1_selfpath" "--stream-mmap" "--stream-count" "10"
+
+
+In the above example the sensor is configured to bayer format: `SRGGB10_1X10/1640x1232`.
+The rkisp1_isp:0 pad should be configured to the same mbus format and dimensions as the sensor.
+Otherwise streaming will fail with 'EPIPE' error. So it is also configured to
+`SRGGB10_1X10/1640x1232` . In addition, the rkisp1_isp:0 pad is configured to cropping
+`(0,0)/1600x1200`. The cropping dimensions are automatically propagated to be the format of the
+isp source pad `rkisp1_isp:2`. Another cropping operation is configured on the isp source pad:
+`(0,0)/1500x1100`.
+The resizer's sink pad `rkisp1_resizer_selfpath` should be configured to format
+`YUYV8_2X8/1500x1100` in order to match the format on the other side of the link. In addition a
+cropping `(300,400)/1400x1000` is configured on it.
+The source pad of the resizer, `rkisp1_resizer_selfpath:1` is configured to format
+`YUYV8_2X8/900x800`. That means that the resizer first crop a window of `(300,400)/1400x100` from
+the received frame and then scales this window to dimension `900x800`.
+
+Note that the above example does not uses the stats-params control loop.
+Therefore the capture frames will not go through the 3A algorithms and will look dark and greenish.
+
+Configuring Quantization
+========================
+
+The driver has a special feature to allow userspace to configure full range quantization on
+YUV formats. To do that, userspace can use the Colorspace Conversion API (CSC API) for subdevices
+on source pad 2 of the isp (`rkisp1_isp:2`). The quantization configured on this pad is the
+quantization of the captured video frames on the mainpath and selfpath video nodes.
+Note that the resizer and capture entities will always report the default quantization
+(limited range for YUV formats) even if the quantization is configured to full range on
+`rkisp1_isp:2`. So in order to get the configured quantization, application should get it from
+pad `rkisp1_isp:2`.
+
diff --git a/Documentation/admin-guide/media/v4l-drivers.rst b/Documentation/admin-guide/media/v4l-drivers.rst
index 251cc4ede0b6..9c7ebe2ca3bd 100644
--- a/Documentation/admin-guide/media/v4l-drivers.rst
+++ b/Documentation/admin-guide/media/v4l-drivers.rst
@@ -25,6 +25,7 @@ Video4Linux (V4L) driver-specific documentation
 	philips
 	qcom_camss
 	rcar-fdp1
+	rkisp1
 	saa7134
 	si470x
 	si4713
-- 
2.17.1

