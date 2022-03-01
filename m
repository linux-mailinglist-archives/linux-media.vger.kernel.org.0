Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95FED4C8FDC
	for <lists+linux-media@lfdr.de>; Tue,  1 Mar 2022 17:13:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236064AbiCAQNo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Mar 2022 11:13:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236068AbiCAQNl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Mar 2022 11:13:41 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62BDD3FDAC
        for <linux-media@vger.kernel.org>; Tue,  1 Mar 2022 08:12:57 -0800 (PST)
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 897DA37C2;
        Tue,  1 Mar 2022 17:12:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646151162;
        bh=2C+nqEkL2tsuuLtt3ezG+u9Z0OP8vRBnwan7QC0SyE8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=c6cNBj1eF7BdSEiulon5igatnqqlIRBtVFc+GlmivjhFpz5VYpzfd7G9TrRI565fB
         AZIuuswD0ZtKiyYoAUXbk+s2RJgDeMikegXrGYacPOhDY+JVuDi9LXoWUBOQmnPH/R
         Fd9Hsx7DLPDxj81wfvF6yFp9WzMMC7NlKf1spnEg=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v11 25/36] media: Documentation: add multiplexed streams documentation
Date:   Tue,  1 Mar 2022 18:11:45 +0200
Message-Id: <20220301161156.1119557-26-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301161156.1119557-1-tomi.valkeinen@ideasonboard.com>
References: <20220301161156.1119557-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add documentation related to multiplexed streams.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 .../driver-api/media/v4l2-subdev.rst          |   8 +
 .../userspace-api/media/v4l/dev-subdev.rst    | 165 ++++++++++++++++++
 2 files changed, 173 insertions(+)

diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
index 115211cef4d1..80654f1bcac9 100644
--- a/Documentation/driver-api/media/v4l2-subdev.rst
+++ b/Documentation/driver-api/media/v4l2-subdev.rst
@@ -593,6 +593,14 @@ before calling v4l2_subdev_init_finalize():
 
 This shares the driver's private mutex between the controls and the states.
 
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
index a67c2749089a..fd042afeddd6 100644
--- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
+++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
@@ -503,3 +503,168 @@ source pads.
     :maxdepth: 1
 
     subdev-formats
+
+Streams, multiplexed media pads and internal routing
+----------------------------------------------------
+
+Commonly V4L2 subdevices support only separate video streams, that is, each
+link in the media graph and each pad in a subdevice pass through a single
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
+non-multiplexed subdev drivers, but, of course, require a routing configuration
+where the link between those two types of drivers contains only a single
+stream.
+
+Understanding streams
+^^^^^^^^^^^^^^^^^^^^^
+
+A stream is a stream of content (e.g. pixel data or metadata) flowing through
+the media pipeline from a source (e.g. a sensor) towards the final sink(e.g. a
+receiver and demultiplexer in a SoC). Each media link carries all the streams
+from one end of the link to the other, and subdevices have routing tables which
+describe how the incoming streams from sink pads are routed to the source
+pads.
+
+A stream ID (often just "stream") is a media link-local identifier for a
+stream. In other words, a configuration for a particular stream ID must exist
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
+:ref:`VIDIOC_SUBDEV_S_ROUTING <VIDIOC_SUBDEV_G_ROUTING>` ioctl. Note that
+setting the routing table will reset all the stream configurations.
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
+(i.e. route endpoint) instead of just a pad.
+
+A common way to accomplish this is to start from the sensors and propagate the
+configurations along the stream towards the receiver, using VIDIOC_SUBDEV_S_FMT
+to configure each stream endpoint in each subdev.
-- 
2.25.1

