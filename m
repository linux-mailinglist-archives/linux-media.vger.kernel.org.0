Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4217422183
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 10:58:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233671AbhJEJAe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 05:00:34 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60730 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233597AbhJEJAb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 05:00:31 -0400
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 71BA7187C;
        Tue,  5 Oct 2021 10:58:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1633424321;
        bh=aqqfkvQQ91fo7WaAQV6tGs4CGMxPg5kqByG2jnYVz/w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KgrjiVWtKUmz8j2QbycULLvLZir41AaYeD8N3hjkzjhuywS/sAAdd2oV0zOjXe3eE
         maelhPMnYUKZSrXkEzO8ByL7A1mMDtoP4oy5DuIAtmbeMWeLnU9oHn9kW0cJ3oCGeD
         E+D/dTktz67L++wggpnNS/JHmSVESKpkh5mrOS/w=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: [PATCH v9 30/36] media: Documentation: add multiplexed streams documentation
Date:   Tue,  5 Oct 2021 11:57:44 +0300
Message-Id: <20211005085750.138151-31-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
References: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add documentation related to multiplexed streams.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 .../driver-api/media/v4l2-subdev.rst          |   8 +
 .../userspace-api/media/v4l/dev-subdev.rst    | 164 ++++++++++++++++++
 2 files changed, 172 insertions(+)

diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
index c3fd57fff668..410e03a29f2a 100644
--- a/Documentation/driver-api/media/v4l2-subdev.rst
+++ b/Documentation/driver-api/media/v4l2-subdev.rst
@@ -546,6 +546,14 @@ subdev drivers. In these cases the called subdev ops must also handle the NULL
 case. This can be easily managed by the use of
 v4l2_subdev_validate_and_lock_state() helper.
 
+Streams, multiplexed media pads and internal routing
+----------------------------------------------------
+
+A subdevice driver can implement support for multiplexed streams by setting
+the V4L2_SUBDEV_FL_MULTIPLEXED subdev flag and implementing support for
+centrally managed subdev active state, routing and stream based
+configuration.
+
 V4L2 sub-device functions and data structures
 ---------------------------------------------
 
diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
index a67c2749089a..ea3efa97bb08 100644
--- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
+++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
@@ -503,3 +503,167 @@ source pads.
     :maxdepth: 1
 
     subdev-formats
+
+Streams, multiplexed media pads and internal routing
+----------------------------------------------------
+
+Commonly V4L2 subdevices support only separate video streams, that is, each
+link in the media grap and each pad in a subdevice passes through a single
+video stream. Thus each pad contains a format configuration for that single
+stream. In some cases a subdev can do stream processing and split a stream
+into two or compose two streams into one, but the inputs and outputs for the
+subdev are still a single stream per pad.
+
+Some hardware, e.g. MIPI CSI-2, support multiplexed streams, that is, a single
+bus carries multiple streams. Thus a camera could output two streams, a pixel
+stream and a metadata stream, and a bridge subdev could route the streams
+from multiple input pads into a single output pad.
+
+Subdevice drivers that support multiplexed streams are compatible with
+non-multiplexed subdev drivers, but, of course, requires such a routing
+configuration where the link between those two types of drivers contain only
+a single stream.
+
+Understanding streams
+^^^^^^^^^^^^^^^^^^^^^
+
+A stream is a stream of content (e.g. pixel data or metadata) flowing through
+the media pipeline from a source (e.g. a sensor) towards the final sink
+(e.g. a receiver in a SoC). Each media link carries all the streams from
+one end of the link to the other, whereas subdevices have routing tables
+which describe how the incoming streams from sink pads are routed to the
+source pads.
+
+A stream ID (often just "stream") is a media link-local identifier for a
+stream. In other words, configuration for a particular stream ID must exist
+on both sides of a media link, but another stream ID can be used for the same
+stream at the other side of the subdevice.
+
+A stream at a specific point in the media pipeline is identified with the
+subdev and a (pad, stream) pair. For subdevices that do not support
+multiplexed streams the 'stream' is always 0.
+
+Configuring streams
+^^^^^^^^^^^^^^^^^^^
+
+The configuration of the streams is done individually for each subdevice and
+the validity of the streams between subdevices is validated when the pipeline
+is started.
+
+There are three steps in configuring the streams:
+
+1) Set up links. Connect the pads between subdevices using the :ref:`Media
+Controller API <media_controller>`
+
+2) Routing. The routing table for the subdevice must be set with
+:ref:`VIDIOC_SUBDEV_S_ROUTING <VIDIOC_SUBDEV_G_ROUTING>` ioctl.
+
+3) Configure streams. Each route endpoint must be configured
+with :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>`.
+
+Multiplexed streams setup example
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+A simple example of a multiplexed stream setup might be as follows:
+
+- Two identical sensors (Sensor A and Sensor B). Each sensor has a single
+  source pad (pad 0), and outputs two streams, pixel data and metadata.
+
+- Multiplexer bridge (Bridge). The bridge has two sink pads, connected to the
+  sensors (pads 0, 1), and one source pad (pad 2), which outputs all 4
+  streams.
+
+- Receiver in the SoC (Receiver). The receiver has a single sink pad (pad 0),
+  connected to the bridge, and four source pads (pads 1-4), going to the DMA
+  engine. The receiver demultiplexes the incoming streams to the four source
+  pads.
+
+- Four DMA Engines in the SoC (DMA Engine). Each DMA engine is connected to a
+  single source pad in the receiver.
+
+The sensors, the bridge and the receiver are modeled as V4L2 subdevices,
+exposed to userspace via /dev/v4l-subdevX device nodes. The DMA engines are
+modeled as V4L2 devices, exposed to userspace via /dev/videoX nodes.
+
+To configure this pipeline, the userspace must take the following steps:
+
+1) Set up media links between entities: connect the sensors to the bridge,
+bridge to the receiver, and the receiver to the DMA engines. This step does
+not differ from normal non-multiplexed media controller setup.
+
+2) Configure routing.
+
+.. flat-table:: Sensor routing table (identical on both sensors)
+    :header-rows:  1
+
+    * - Sink Pad/Stream
+      - Source Pad/Stream
+      - Routing Flags
+      - Comments
+    * - 0/0 (unused)
+      - 0/0
+      - V4L2_SUBDEV_ROUTE_FL_ACTIVE | V4L2_SUBDEV_ROUTE_FL_SOURCE
+      - Pixel data stream. Source route, i.e. the sink fields are unused.
+    * - 0/0 (unused)
+      - 0/1
+      - V4L2_SUBDEV_ROUTE_FL_ACTIVE | V4L2_SUBDEV_ROUTE_FL_SOURCE
+      - Metadata stream. Source route, i.e. the sink fields are unused.
+
+.. flat-table:: Bridge routing table
+    :header-rows:  1
+
+    * - Sink Pad/Stream
+      - Source Pad/Stream
+      - Routing Flags
+      - Comments
+    * - 0/0
+      - 2/0
+      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
+      - Pixel data stream from Sensor A
+    * - 0/1
+      - 2/1
+      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
+      - Metadata stream from Sensor A
+    * - 1/0
+      - 2/2
+      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
+      - Pixel data stream from Sensor B
+    * - 1/1
+      - 2/3
+      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
+      - Metadata stream from Sensor B
+
+.. flat-table:: Receiver routing table
+    :header-rows:  1
+
+    * - Sink Pad/Stream
+      - Source Pad/Stream
+      - Routing Flags
+      - Comments
+    * - 0/0
+      - 1/0
+      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
+      - Pixel data stream from Sensor A
+    * - 0/1
+      - 2/0
+      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
+      - Metadata stream from Sensor A
+    * - 0/2
+      - 3/0
+      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
+      - Pixel data stream from Sensor B
+    * - 0/3
+      - 4/0
+      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
+      - Metadata stream from Sensor B
+
+3) Configure streams
+
+After configuring the routing table, the next step is configuring the streams.
+This step is similar to configuring the pads in a non-multiplexed streams
+setup, with the difference that we need to configure each (pad, stream) pair
+(i.e. route endpoint), instead of just a pad.
+
+Presuming there are no format conversions in the pipeline, the userspace needs
+to configure all the route endpoints using four formats (two pixel formats
+and two metadata formats) with VIDIOC_SUBDEV_S_FMT.
-- 
2.25.1

