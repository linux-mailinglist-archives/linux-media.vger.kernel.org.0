Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A41B7B6883
	for <lists+linux-media@lfdr.de>; Tue,  3 Oct 2023 14:08:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231944AbjJCMIY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Oct 2023 08:08:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231127AbjJCMIY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Oct 2023 08:08:24 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 040DAA6
        for <linux-media@vger.kernel.org>; Tue,  3 Oct 2023 05:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696334901; x=1727870901;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GwjsOAEJYrWWLIuAaHpO2bTZMa77lfX+gV/cof4TEO0=;
  b=bLl2i0KLxpK+tB8tOJw5KX/VkUgGBmmJ0Fow99uVUfsWVpSJFRO6FTpP
   q7v0ZiPTd6bpsG/uU5V2u30Wpa4mRQJoOZI+f6i1UOMY/OoO8V5yQzuE7
   M8Y0289NRy6klyBVVHgthQyzzVH5bzzwiAwiWSHtuvhTvm6xpqhHRPVsW
   Ub1x7koF1iW0TFell7DYVmof1g84BU6dbPKsY6hSJo7/OGrn4ox/L28yi
   VqyGhBGN99Zr0uvlSC8ao7aLpncyaQBQA1vaWFB48uvm7TQHPxQWx33OU
   1gR4Ncd1fe+5opQnvu544mlNlvchtVHV6cDCV3no/G2CyYv9qcP+2gV/J
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="385681487"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; 
   d="scan'208";a="385681487"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 05:08:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="780285896"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; 
   d="scan'208";a="780285896"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 05:08:17 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 23B05120797;
        Tue,  3 Oct 2023 15:08:14 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: [PATCH v6 10/28] media: Documentation: v4l: Document source routes
Date:   Tue,  3 Oct 2023 15:07:55 +0300
Message-Id: <20231003120813.77726-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231003115237.76828-1-sakari.ailus@linux.intel.com>
References: <20231003115237.76828-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document how internal pads are used on source routes. Use the IMX219
camera sensor as an example.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/v4l/dev-subdev.rst    | 179 ++++++++++++++++++
 1 file changed, 179 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
index a387e8a15b8d..fb73a95401c3 100644
--- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
+++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
@@ -553,6 +553,27 @@ A stream at a specific point in the media pipeline is identified by the
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
+*Source routes* are routes from an internal sink pad to an external source
+pad. In most cases source routes are not modifiable but they can be activated
+and deactivated using the :ref:`V4L2_SUBDEV_ROUTE_FL_ACTIVE
+<v4l2-subdev-routing-flags>` flag, depending on driver capabilities.
+
 Interaction between routes, streams, formats and selections
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
@@ -668,3 +689,161 @@ To configure this pipeline, the userspace must take the following steps:
    the configurations along the stream towards the receiver, using
    :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>` ioctls to configure each
    stream endpoint in each sub-device.
+
+Internal pads setup example
+^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+A simple example of a multiplexed stream setup might be as follows:
+
+- A CCS camera sensor source sub-device, with one sink pad (0), one source pad
+  (1), an internal sink pad (2) that represents the source of embedded
+  data. There are two routes, one from the sink pad to the source, and another
+  from the internal sink pad to the source pad. The embedded data stream needs
+  to be enabled by activating the related route. The configuration of the rest
+  of the CCS sub-devices is omitted from this example.
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
+   bridge to the receiver, and the receiver to the DMA engines. This step does
+   not differ from normal non-multiplexed media controller setup.
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
+    * - 0/0
+      - 1/0
+      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
+      - Pixel data stream from the sink pad
+    * - 2/0
+      - 1/1
+      - **V4L2_SUBDEV_ROUTE_FL_ACTIVE**
+      - Metadata stream from the internal sink pad
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
+The options available in sensor's routing configuration are dictated by
+hardware capabilities: typically camera sensors always produce image data
+stream while the embedded data stream typically can be either enabled or
+disabled.
+
+3) Configure formats and selections
+
+   This example assumes that the formats are propagated from sink pad to the
+   source pad as-is. The tables contain fields of both struct v4l2_subdev_format
+   and struct v4l2_mbus_framefmt.
+
+.. flat-table:: Formats set on the sub-devices. Bold values are set, others are
+                static or propagated.
+    :header-rows: 1
+    :fill-cells:
+
+    * - Sub-device
+      - Pad/Stream
+      - Width
+      - Height
+      - Code
+    * - :rspan:`3` Camera sensor sub-device (IMX219)
+      - 1/0
+      - 3296
+      - 2480
+      - MEDIA_BUS_FMT_SRGGB10
+    * - 0/0
+      - **3296**
+      - **2480**
+      - **MEDIA_BUS_FMT_SRGGB10**
+    * - 2/0
+      - 3296
+      - 2
+      - MEDIA_BUS_FMT_IMX219_EMBEDDED
+    * - 1/1
+      - 3296
+      - 2
+      - MEDIA_BUS_FMT_META_10
+    * - :rspan:`3` Bridge
+      - 0/0
+      - **3296**
+      - **2480**
+      - **MEDIA_BUS_FMT_SRGGB10**
+    * - 1/0
+      - 3296
+      - 2480
+      - MEDIA_BUS_FMT_SRGGB10
+    * - 0/1
+      - **3296**
+      - **2**
+      - **MEDIA_BUS_FMT_META_10**
+    * - 1/1
+      - 3296
+      - 2
+      - MEDIA_BUS_FMT_META_10
+    * - :rspan:`3` Receiver
+      - 0/0
+      - **3296**
+      - **2480**
+      - **MEDIA_BUS_FMT_SRGGB10**
+    * - 1/0
+      - 3296
+      - 2480
+      - MEDIA_BUS_FMT_SRGGB10
+    * - 0/1
+      - **3296**
+      - **2**
+      - **MEDIA_BUS_FMT_META_10**
+    * - 2/0
+      - 3296
+      - 2
+      - MEDIA_BUS_FMT_META_10
+
+The embedded data format does not need to be configured as the format is
+dictated by the pixel data format in this case.
-- 
2.39.2

