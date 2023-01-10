Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6D60663CB4
	for <lists+linux-media@lfdr.de>; Tue, 10 Jan 2023 10:23:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237709AbjAJJWz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Jan 2023 04:22:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232008AbjAJJWq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Jan 2023 04:22:46 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D87548CC0
        for <linux-media@vger.kernel.org>; Tue, 10 Jan 2023 01:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673342565; x=1704878565;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DDHcEHJjGQlH6tFXh6XyrqRLVsS/UIRcJ4mmcePn2w8=;
  b=eElaUXgYuGdmRggxSOEIUJAipSfbGPZA+2XP8BwnJgjrD9OtVuj+raMt
   CoDr8yaBoW2mARXhhUa416e+6pwPrr6nT/jM2gATFiJeJAZ7MVYN48eD9
   eM+ufdVPXDYOWOznNF2ezV7/t4uYS6j8cXhpo3r3kUq+hEeDTw1/J9axE
   pw9eBvtaLAcHtRQNVl64anlYOQAx31XJFmL8zdxBFXuYweeU2rooXoO4Q
   aNKKJ07ZsuZZwflRl0E/RY+ETdmpRShqp4+9rnPvWxtB0gka941B0bbJf
   cw678HV7aLevjut8bS112OLdAZUZ5ANYIZTy3Wy9dGVWgQLY5J2f7L4sk
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="350322357"
X-IronPort-AV: E=Sophos;i="5.96,314,1665471600"; 
   d="scan'208";a="350322357"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2023 01:22:44 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="764668004"
X-IronPort-AV: E=Sophos;i="5.96,314,1665471600"; 
   d="scan'208";a="764668004"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2023 01:22:42 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 6BCE42031E;
        Tue, 10 Jan 2023 11:16:50 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1pFAkl-008P8t-A9; Tue, 10 Jan 2023 11:17:07 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
Subject: [PATCH 1/1] media: Documentation: Update documentation for streams
Date:   Tue, 10 Jan 2023 11:17:07 +0200
Message-Id: <20230110091707.2003226-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221215121634.287100-1-tomi.valkeinen@ideasonboard.com>
References: <20221215121634.287100-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document how streams interacts with formats and selections.

Update documentation in respect to what is allowed, in particular streams
are only supported via full routes, source-only routes are not supported
right now.

The centerpiece of the API additions are streams. Albeit routes are
configured via S_ROUTING IOCTL that also declares streams, it is streams
that are accessed through other APIs. Thus refer to streams instead of
routes in documentation.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
Hi folks,

This replaces my earlier documetation patch. The commit message and the
subject have changed and the content reflects this. Largely this means
removing a few features of the interface --- for now.

The intent is to be able to merge this very soon, thus those portions that
are still debated have been dropped (no more dependencies between streams,
for instance).

 .../userspace-api/media/v4l/dev-subdev.rst    | 121 +++++++++---------
 1 file changed, 58 insertions(+), 63 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
index 072e82b2b2786..d2badf21a62cd 100644
--- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
+++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
@@ -406,6 +406,8 @@ pixel array is not rectangular but cross-shaped or round. The maximum
 size may also be smaller than the BOUNDS rectangle.
 
 
+.. _format-propagation:
+
 Order of configuration and format propagation
 ---------------------------------------------
 
@@ -507,12 +509,12 @@ source pads.
 Streams, multiplexed media pads and internal routing
 ----------------------------------------------------
 
-Commonly V4L2 subdevices support only separate video streams, that is, only a
-single stream can pass through a media link and a media pad. Thus each pad
-contains a format configuration for that single stream. In some cases a subdev
-can do stream processing and split a stream into two or compose two streams
-into one, but the inputs and outputs for the subdev are still a single stream
-per pad.
+Simple V4L2 subdevices do not support multiple, unrelated video streams,
+and only a single stream can pass through a media link and a media pad.
+Thus each pad contains a format and selection configuration for that
+single stream. A subdev can do stream processing and split a stream into
+two or compose two streams into one, but the inputs and outputs for the
+subdev are still a single stream per pad.
 
 Some hardware, e.g. MIPI CSI-2, support multiplexed streams, that is, multiple
 data streams are transmitted on the same bus, which is represented by a media
@@ -539,14 +541,35 @@ streams from one end of the link to the other, and subdevices have routing
 tables which describe how the incoming streams from sink pads are routed to the
 source pads.
 
-A stream ID (often just "stream") is a media link-local identifier for a stream.
-In other words, a particular stream ID must exist on both sides of a media
+A stream ID is a media pad-local identifier for a stream. Streams IDs of
+the same stream must be equal on both ends of a link. In other words,
+a particular stream ID must exist on both sides of a media
 link, but another stream ID can be used for the same stream at the other side
-of the subdevice.
+of the subdevice. The same stream ID is used to refer to the stream on
+both pads of the link on all ioctls operating on pads.
+
+A stream at a specific point in the media pipeline is identified by the
+sub-devdev and a (pad, stream) pair. For subdevices that do not support
+multiplexed streams the 'stream' field is always 0.
+
+Interaction between routes, streams, formats and selections
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+The addition of streams to the V4L2 sub-device interface moves the sub-device
+formats and selections from pads to (pad, stream) pairs. Besides the
+usual pad, also the stream ID needs to be provided for setting formats and
+selections. The order of configuring formats and selections along a stream is
+the same as without streams (see :ref:`format-propagation`).
+
+Instead of the sub-device wide merging of streams from all source pads
+towards all sink pads, data flows for each route are separate from each
+other. Any number of routes from streams on sink pads towards streams on
+source pads is allowed, to the extent supported by drivers. For every
+stream on a sink pad, however, only a single route is allowed.
 
-A stream at a specific point in the media pipeline is identified with the
-subdev and a (pad, stream) pair. For subdevices that do not support
-multiplexed streams the 'stream' is always 0.
+Any configurations of a stream within a pad, such as format or selections,
+are independent of similar configurations on other streams. This is
+subject to change in the future.
 
 Configuring streams
 ^^^^^^^^^^^^^^^^^^^
@@ -560,34 +583,37 @@ There are three steps in configuring the streams:
 1) Set up links. Connect the pads between subdevices using the :ref:`Media
 Controller API <media_controller>`
 
-2) Routing. The routing table for the subdevice must be set with
+2) Streams. Streams are declared and their routing is configured by
+setting the routing table for the subdevice must be set with
 :ref:`VIDIOC_SUBDEV_S_ROUTING <VIDIOC_SUBDEV_G_ROUTING>` ioctl. Note that
-setting the routing table will reset all the stream configurations in a media
-entity.
+setting the routing table will reset formats and selections in the
+sub-device to default values.
 
-3) Configure streams. Each route endpoint must be configured
-with :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>`.
+3) Configure formats and selections. Formats and selections of each stream
+are configured separately as documented for plain subdevices in
+:ref:`<format-propagation>`. The stream ID is set to the same stream ID
+associated with either sink or source pads of routes configured using the
+:ref:`VIDIOC_SUBDEV_S_ROUTING <VIDIOC_SUBDEV_G_ROUTING>` ioctl.
 
 Multiplexed streams setup example
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 A simple example of a multiplexed stream setup might be as follows:
 
-- Two identical sensors (Sensor A and Sensor B). Each sensor has a single source
-  pad (pad 0) which carries two streams, pixel data stream and metadata
-  stream.
+- Two identical sensors (Sensor A and Sensor B). The sensors produce image
+  data only and hence do not need specific support for streams.
 
 - Multiplexer bridge (Bridge). The bridge has two sink pads, connected to the
-  sensors (pads 0, 1), and one source pad (pad 2), which outputs all 4
-  streams.
+  sensors (pads 0, 1), and one source pad (pad 2), which outputs both of
+  the streams.
 
 - Receiver in the SoC (Receiver). The receiver has a single sink pad (pad 0),
   connected to the bridge, and four source pads (pads 1-4), going to the DMA
-  engine. The receiver demultiplexes the incoming streams to the four source
+  engine. The receiver demultiplexes the incoming streams to two the source
   pads.
 
 - Four DMA Engines in the SoC (DMA Engine). Each DMA engine is connected to a
-  single source pad in the receiver.
+  single source pad in the receive via a link, two of which are active.
 
 The sensors, the bridge and the receiver are modeled as V4L2 subdevices,
 exposed to userspace via /dev/v4l-subdevX device nodes. The DMA engines are
@@ -599,23 +625,7 @@ To configure this pipeline, the userspace must take the following steps:
 bridge to the receiver, and the receiver to the DMA engines. This step does
 not differ from normal non-multiplexed media controller setup.
 
-2) Configure routing.
-
-.. flat-table:: Sensor routing table (identical on both sensors)
-    :header-rows:  1
-
-    * - Sink Pad/Stream
-      - Source Pad/Stream
-      - Routing Flags
-      - Comments
-    * - 0/0 (unused)
-      - 0/0
-      - V4L2_SUBDEV_ROUTE_FL_ACTIVE | V4L2_SUBDEV_ROUTE_FL_SOURCE_ONLY
-      - Pixel data stream. Source route, i.e. the sink fields are unused.
-    * - 0/0 (unused)
-      - 0/1
-      - V4L2_SUBDEV_ROUTE_FL_ACTIVE | V4L2_SUBDEV_ROUTE_FL_SOURCE_ONLY
-      - Metadata stream. Source route, i.e. the sink fields are unused.
+2) Configure routing
 
 .. flat-table:: Bridge routing table
     :header-rows:  1
@@ -628,18 +638,10 @@ not differ from normal non-multiplexed media controller setup.
       - 2/0
       - V4L2_SUBDEV_ROUTE_FL_ACTIVE
       - Pixel data stream from Sensor A
-    * - 0/1
-      - 2/1
-      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
-      - Metadata stream from Sensor A
     * - 1/0
-      - 2/2
+      - 2/1
       - V4L2_SUBDEV_ROUTE_FL_ACTIVE
       - Pixel data stream from Sensor B
-    * - 1/1
-      - 2/3
-      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
-      - Metadata stream from Sensor B
 
 .. flat-table:: Receiver routing table
     :header-rows:  1
@@ -655,22 +657,15 @@ not differ from normal non-multiplexed media controller setup.
     * - 0/1
       - 2/0
       - V4L2_SUBDEV_ROUTE_FL_ACTIVE
-      - Metadata stream from Sensor A
-    * - 0/2
-      - 3/0
-      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
       - Pixel data stream from Sensor B
-    * - 0/3
-      - 4/0
-      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
-      - Metadata stream from Sensor B
 
-3) Configure streams
+3) Configure formats and selections
 
-After configuring the routing table, the next step is configuring the streams.
-This step is similar to configuring the pads in a non-multiplexed streams
-setup, with the difference that we need to configure each (pad, stream) pair
-(i.e. route endpoint) instead of just a pad.
+After configuring the routing table, the next step is configuring the
+formats and selections for the streams. This step is similar to
+configuring the pads in a non-multiplexed streams setup, with the
+difference that we need to configure each (pad, stream) pair instead of
+just a pad.
 
 A common way to accomplish this is to start from the sensors and propagate the
 configurations along the stream towards the receiver,
-- 
2.30.2

