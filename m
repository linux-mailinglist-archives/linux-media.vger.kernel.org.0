Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 314EA76D9F2
	for <lists+linux-media@lfdr.de>; Wed,  2 Aug 2023 23:47:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233884AbjHBVre (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Aug 2023 17:47:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233880AbjHBVrJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Aug 2023 17:47:09 -0400
Received: from mgamail.intel.com (unknown [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C48E3A89
        for <linux-media@vger.kernel.org>; Wed,  2 Aug 2023 14:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691012791; x=1722548791;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=a3O9/XhkuF/Pz3RnPPviZ8nyts04CWuGNflXANcunag=;
  b=en2VPKy8bXbfbbnEGavMWoh1nxiZXJ0fu5s+iEuBcC5BF2J4rxyB3Zj7
   df5t/oSO/222u6krdxdlbAXxzYuGvWIgo0iAwzo8ViyyXtT6UpfaVQ1Rm
   zhaVUVhdu9lrrCCBzlrB62wmuMBzeH9I1pNn8X+pSxqIKKmOBcl7CUdfx
   4BUZ6fHcp+E0OFa9VY5yDYCbp/6jGen7Vxhx5jbLN5kxHh3FUKi4STQsy
   7ggoyR3ROoBsZhboROjDz871F+rb+yOvnGtvJE+jHm03m9fXFeCA8Cy5l
   AA4QzRu1hBtuZswbVpWyRMZvOu9DLqR5rnm7VwEOwVdnfvAfB0y+uE2qW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="372442061"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; 
   d="scan'208";a="372442061"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 14:46:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="853009327"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; 
   d="scan'208";a="853009327"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 14:46:05 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 45422122177;
        Thu,  3 Aug 2023 00:46:02 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>
Subject: [PATCH v2 4/9] media: uapi: v4l: Document source routes
Date:   Thu,  3 Aug 2023 00:45:51 +0300
Message-Id: <20230802214556.180589-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230802214556.180589-1-sakari.ailus@linux.intel.com>
References: <20230802214556.180589-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document how internal pads are used on source routes.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/v4l/dev-subdev.rst    | 117 ++++++++++++++++++
 1 file changed, 117 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
index d737c9530dbd..0e3ca6d6d81f 100644
--- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
+++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
@@ -551,6 +551,27 @@ A stream at a specific point in the media pipeline is identified by the
 sub-device and a (pad, stream) pair. For sub-devices that do not support
 multiplexed streams the 'stream' field is always 0.
 
+.. _v4l2-subdev-source-routes:
+
+Internal pads and source routes
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Cases where a single sub-device source pad is traversed by multiple streams one
+or more of which originate from within the sub-device itself are special as
+there is no external sink pad for such routes. In those cases, the sources of
+the internally generated streams are represented by internal sink pads, which
+are sink pads that have the :ref:`MEDIA_PAD_FL_INTERNAL <MEDIA-PAD-FL-INTERNAL>`
+pad flag set.
+
+Internal pads have all the properties of an external pad, including formats and
+selections. The format in this case is the source format of the stream. An
+internal pad always has a single stream only (0).
+
+/Source routes/ are routes from an internal sink pad to a(n external) source
+pad. Generally source routes are not modifiable but they can be activated and
+deactivated using the :ref:`V4L2_SUBDEV_ROUTE_FL_ACTIVE
+<v4l2-subdev-routing-flags>` flag, depending on driver capabilities.
+
 Interaction between routes, streams, formats and selections
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
@@ -666,3 +687,99 @@ A common way to accomplish this is to start from the sensors and propagate the
 configurations along the stream towards the receiver,
 using :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>` ioctls to configure each
 stream endpoint in each sub-device.
+
+Internal pads setup example
+^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+A simple example of a multiplexed stream setup might be as follows:
+
+- A camera sensor, with one source pad (0) and two internal sink pads (source of
+  image data (1) and source of embedded data (2)) and two source routes, one
+  from each internal sink pad towards the (external) source pad. The embedded
+  data stream needs to be enabled by activating the related route.
+
+- Multiplexer bridge (Bridge). The bridge has one sink pad, connected to the
+  sensor (pad 0), and one source pad (pad 1), which outputs two streams.
+
+- Receiver in the SoC (Receiver). The receiver has a single sink pad (pad 0),
+  connected to the bridge, and two source pads (pads 1-2), going to the DMA
+  engine. The receiver demultiplexes the incoming streams to the source pads.
+
+- DMA Engines in the SoC (DMA Engine), one for each stream. Each DMA engine is
+  connected to a single source pad in the receiver.
+
+The sensor, the bridge and the receiver are modeled as V4L2 sub-devices,
+exposed to userspace via /dev/v4l-subdevX device nodes. The DMA engines are
+modeled as V4L2 devices, exposed to userspace via /dev/videoX nodes.
+
+To configure this pipeline, the userspace must take the following steps:
+
+1) Set up media links between entities: connect the sensors to the bridge,
+bridge to the receiver, and the receiver to the DMA engines. This step does
+not differ from normal non-multiplexed media controller setup.
+
+2) Configure routing
+
+.. flat-table:: Camera sensor
+    :header-rows: 1
+
+    * - Sink Pad/Stream
+      - Source Pad/Stream
+      - Routing Flags
+      - Comments
+    * - 1/0
+      - 0/0
+      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
+      - Pixel data stream from internal sink pad
+    * - 2/0
+      - 0/1
+      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
+      - Metadata stream from internal sink pad
+
+.. flat-table:: Bridge routing table
+    :header-rows: 1
+
+    * - Sink Pad/Stream
+      - Source Pad/Stream
+      - Routing Flags
+      - Comments
+    * - 0/0
+      - 1/0
+      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
+      - Pixel data stream from camera sensor
+    * - 0/1
+      - 1/1
+      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
+      - Metadata stream from camera sensor
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
+      - Pixel data stream from camera sensor
+    * - 0/1
+      - 2/0
+      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
+      - Metadata stream from camera sensor
+
+3) Configure formats and selections
+
+After configuring routing, the next step is configuring the formats and
+selections for the streams. This is similar to performing this step without
+streams, with just one exception: the ``stream`` field needs to be assigned
+to the value of the stream ID.
+
+A common way to accomplish this is to start from the sensors and propagate the
+configurations along the stream towards the receiver,
+using :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>` ioctls to configure each
+stream endpoint in each sub-device.
+
+The options available in sensor's routing configuration are dictated by hardware
+capabilities: typically camera sensors always produce image data stream while
+the embedded data stream typically can be either enabled or disabled.
-- 
2.39.2

