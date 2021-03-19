Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3543B342416
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 19:07:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230321AbhCSSH0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Mar 2021 14:07:26 -0400
Received: from mga09.intel.com ([134.134.136.24]:57280 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230308AbhCSSHI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Mar 2021 14:07:08 -0400
IronPort-SDR: LEtlh6MlLbI09K0ZiyJphZEUvAwzfSC3G1RxWJx/kQmx7hYCkesQkt9uMQ7/rN4lFX1hS6uq+W
 lFWWR1PGnejQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9928"; a="190036064"
X-IronPort-AV: E=Sophos;i="5.81,262,1610438400"; 
   d="scan'208";a="190036064"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2021 11:07:08 -0700
IronPort-SDR: 9//9pEPHN5TuI4CbjoC/gcefzGAIbMnTXlH/qwXwi9S8MG9RTtRaloy1apJzz4maR8paW/31+5
 ZoH+AtEPzAbg==
X-IronPort-AV: E=Sophos;i="5.81,262,1610438400"; 
   d="scan'208";a="413605821"
Received: from mkrastex-mobl.ger.corp.intel.com ([10.104.88.55])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2021 11:07:05 -0700
From:   Martina Krasteva <martinax.krasteva@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
        sakari.ailus@linux.intel.com,
        daniele.alessandrelli@linux.intel.com,
        paul.j.murphy@linux.intel.com,
        gjorgjix.rosikopulos@linux.intel.com,
        martinax.krasteva@linux.intel.com
Subject: [PATCH 10/10] media: admin-guide: Add documentation for Keem Bay Camera
Date:   Fri, 19 Mar 2021 18:06:32 +0000
Message-Id: <20210319180632.585-11-martinax.krasteva@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210319180632.585-1-martinax.krasteva@linux.intel.com>
References: <20210319180632.585-1-martinax.krasteva@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Gjorgji Rosikopulos <gjorgjix.rosikopulos@intel.com>

Add Keem Bay Camera sub-system documentation

Signed-off-by: Gjorgji Rosikopulos <gjorgjix.rosikopulos@intel.com>
Signed-off-by: Martina Krasteva <martinax.krasteva@intel.com>
Acked-by: Paul J. Murphy <paul.j.murphy@intel.com>
Acked-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
---
 Documentation/admin-guide/media/keembay-camera.dot |  12 ++
 Documentation/admin-guide/media/keembay-camera.rst | 174 +++++++++++++++++++++
 Documentation/admin-guide/media/v4l-drivers.rst    |   1 +
 MAINTAINERS                                        |   6 +-
 4 files changed, 191 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/admin-guide/media/keembay-camera.dot
 create mode 100644 Documentation/admin-guide/media/keembay-camera.rst

diff --git a/Documentation/admin-guide/media/keembay-camera.dot b/Documentation/admin-guide/media/keembay-camera.dot
new file mode 100644
index 000000000000..60a7a940b11e
--- /dev/null
+++ b/Documentation/admin-guide/media/keembay-camera.dot
@@ -0,0 +1,12 @@
+digraph board {
+	rankdir=TB
+	n00000001 [label="{{} | imx334 1-001a\n/dev/v4l-subdev0 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
+	n00000001:port0 -> n00000003:port0 [style=bold]
+	n00000003 [label="{{<port0> 0 | <port1> 1} | keembay-camera-isp\n/dev/v4l-subdev1 | {<port2> 2 | <port3> 3}}", shape=Mrecord, style=filled, fillcolor=green]
+	n00000003:port2 -> n0000000e [style=bold]
+	n00000003:port3 -> n00000014 [style=bold]
+	n00000008 [label="keembay-metadata-params\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
+	n00000008 -> n00000003:port1 [style=bold]
+	n0000000e [label="keembay-metadata-stats\n/dev/video1", shape=box, style=filled, fillcolor=yellow]
+	n00000014 [label="kmb_video kmb-video-capture\n/dev/video2", shape=box, style=filled, fillcolor=yellow]
+}
diff --git a/Documentation/admin-guide/media/keembay-camera.rst b/Documentation/admin-guide/media/keembay-camera.rst
new file mode 100644
index 000000000000..43bffc6c5969
--- /dev/null
+++ b/Documentation/admin-guide/media/keembay-camera.rst
@@ -0,0 +1,174 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: <isonum.txt>
+
+===========================
+Intel Keembay camera driver
+===========================
+
+Copyright |copy| 2021 Intel Corporation
+
+Introduction
+============
+
+This file documents the Intel Keem Bay camera driver located under
+drivers/media/platform/keembay-camera.
+
+The current version of the driver supports Intel Keem Bay VPU Camera Subsystem
+found in Intel Keem Bay platform.
+
+The Keem Bay VPU camera receives the raw Bayer data from the sensors
+and outputs the frames in a YUV format, it operates in per-frame mode
+and processing parameters are required for each processed video output.
+
+The Keem Bay Camera driver uses Xlink for communication with remote Keem Bay
+VPU Camera subsystem.
+
+The driver implements V4L2, Media controller and V4L2 subdev interfaces.
+Camera sensor using V4L2 subdev interface in the kernel is supported.
+
+Topology
+========
+.. _keembay_camera_topology_graph:
+
+.. kernel-figure:: keembay_camera.dot
+    :alt:   Diagram of the Keem Bay Camera media pipeline topology
+    :align: center
+
+
+The driver has 1 subdevice:
+
+- keembay-camera-isp: ISP subdevice responsible for all ISP operatios.
+  The subdevice supports V4L2_EVENT_FRAME_SYNC event.
+
+The driver has 3 video devices:
+
+- kmb-video-capture: capture device for retrieving processed YUV output.
+- keembay-metadata-stats: metadata capture device for retrieving statistics.
+- keembay-metadata-params: metadata output device that receives processing
+  parameters from userspace.
+
+Device operation
+----------------
+
+The Keem Bay Camera driver is represented as a media device with single
+V4L2 ISP subdev, which provides a V4L2 subdev interface to the user space.
+
+The V4L2 ISP subdev represents a pipe, which can support a maximum of one stream.
+
+The pipe has two source pads and two sink pads for the following purpose:
+
+.. tabularcolumns:: |p{0.8cm}|p{4.0cm}|p{4.0cm}|
+
+.. flat-table::
+
+    * - pad
+      - direction
+      - purpose
+
+    * - 0
+      - sink
+      - MIPI CSI-2 input, connected to the sensor subdev
+
+    * - 1
+      - sink
+      - Processing parameters
+
+    * - 2
+      - source
+      - Output processed video stream
+
+    * - 3
+      - source
+      - 3A statistics
+
+Pad 0 is connected to sensor subdev and should receive data in raw Bayer
+format over MIPI CSI-2 receiver.
+
+Pads 1, 2 and 3 are connected to a corresponding V4L2 video interface,
+exposed to userspace as a V4L2 video device node.
+
+With ISP subdev once the input video node keembay-metadata-params
+connected to pad 1 is queued with ISP processing parameters buffer,
+ISP subdev starts processing and produces the video output in
+YUV format and statistics output on respective output node.
+
+At a minimum, all of the video nodes should be enabled and have buffers queued
+to start the processing.
+
+The Keem Bay ISP V4L2 subdev has the following set of video nodes:
+
+Capture video node
+------------------
+
+The frames received by the sensor over MIPI CSI-2 input are processed by the
+Keem Bay ISP and are output to one single video node in YUV format.
+
+Only the multi-planar API is supported. More details can be found at
+:ref:`planar-apis`.
+
+Parameters video node
+---------------------
+
+The parameters video node receives the Keem Bay ISP algorithm parameters [#f1]_
+that are used to configure how the Keem Bay ISP algorithms process the image.
+
+Details on processing parameters specific to the Keem Bay ISP can be found in
+:ref:`v4l2-meta-fmt-params`.
+
+Statistics video node
+---------------------
+
+3A statistics video node is used by the Keem Bay ISP driver to output the
+statistics for the frames that are being processed by the Keem Bay ISP to
+user space applications. User space applications can use this statistics
+data to compute the desired algorithm parameters for the Keem Bay ISP.
+
+
+Configuring the Keem Bay Camera driver
+======================================
+
+The Keem Bay Camera pipeline can be configured using the Media Controller,
+defined at
+:ref:`media_controller`.
+
+Configuring Keem Bay ISP subdev for frame processing
+----------------------------------------------------
+
+The Keem Bay ISP V4L2 subdev has to be configured with media controller APIs
+to have all the video nodes setup correctly.
+
+Let us take "keembay-camera-isp" subdev as an example. We will use
+media-ctl [#f3]_ and yavta [#f2]_ tools for our example.
+Lets assume that we have sensor subdev connected which produces Raw bayer to
+
+./media-ctl -d $MDEV  -V "'keembay-camera-isp':0[fmt:SRGGB12_1X12/3840x2160]"
+
+./media-ctl -d $MDEV  -V "'keembay-camera-isp':3[fmt:YUYV8_1_5X8/3840x2160]"
+
+
+Now the pipeline is configured and ready to stream. Keem Bay ISP need buffers
+to  be queued on the all of the video nodes to start the stream.
+For that purpose we can use multiple instancies of the yavta tool:
+
+yavta --data-prefix -Bmeta-output -c10 -n5 \
+--file=isp-config.bin /dev/video0 &
+
+yavta --data-prefix -Bmeta-capture -c10 -n5 -I \
+--file=frame-#.stat /dev/video1 &
+
+yavta --data-prefix -Bcapture-mplane -c10 -n5 -I -s3840x2160 \
+--file=frame-#.out -f NV12 /dev/video2 &
+
+
+The captured frames will be stored to frame-#.out files and statistics for
+corresponding frames in frame-#.stat files.
+
+References
+==========
+
+.. [#f1] include/uapi/linux/keembay-isp-ctl.h
+
+.. [#f2] http://git.ideasonboard.org/yavta.git
+
+.. [#f3] http://git.ideasonboard.org/?p=media-ctl.git;a=summary
diff --git a/Documentation/admin-guide/media/v4l-drivers.rst b/Documentation/admin-guide/media/v4l-drivers.rst
index 9c7ebe2ca3bd..9b173d5aebfc 100644
--- a/Documentation/admin-guide/media/v4l-drivers.rst
+++ b/Documentation/admin-guide/media/v4l-drivers.rst
@@ -19,6 +19,7 @@ Video4Linux (V4L) driver-specific documentation
 	imx7
 	ipu3
 	ivtv
+	keembay-camera
 	meye
 	omap3isp
 	omap4_camera
diff --git a/MAINTAINERS b/MAINTAINERS
index d90eaf453012..ff30f157b41a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1971,9 +1971,11 @@ M:	Daniele Alessandrelli <daniele.alessandrelli@intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/admin-guide/media/keembay-camera.dot
+F:	Documentation/admin-guide/media/keembay-camera.rst
 F:	Documentation/devicetree/bindings/media/intel,keembay-camera.yaml
-F:	Documentation/media/uapi/v4l/meta-formats.rst
-F:	Documentation/media/uapi/v4l/pixfmt-meta-intel-kmb.rst
+F:	Documentation/userspace-api/media/v4l/meta-formats.rst
+F:	Documentation/userspace-api/media/v4l/pixfmt-meta-intel-kmb.rst
 F:	drivers/media/platform/keembay-camera/
 F:	include/uapi/linux/keembay-isp-ctl.h
 
-- 
2.11.0

