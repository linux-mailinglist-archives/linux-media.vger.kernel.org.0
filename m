Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8A1B773F77
	for <lists+linux-media@lfdr.de>; Tue,  8 Aug 2023 18:48:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233498AbjHHQs3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Aug 2023 12:48:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231569AbjHHQr0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Aug 2023 12:47:26 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2031446FE7
        for <linux-media@vger.kernel.org>; Tue,  8 Aug 2023 08:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691510214; x=1723046214;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JgZDU5kCi3na3iWCzv8U0ILdVQ6j4OMLAwGTmEastxE=;
  b=NJM+jNZucqkXpCBr80Y3nOb/BASVQ4m91Fj495hqMBy1FG/Cl6OMOxbx
   jtGSQslDFmSSWidZQtdZkds7dngs1OE+zWFvBa8y1qRuBEGPP2UxyHAIp
   cbC1lQtzz0PCIllBFHyOhPiBLV8xvYUMHEMcOU+yUC6O5uuIKyNYkOtr1
   ljfrY/+bmPt/Qjz5/l2GcFSJluCD1YOvxfst7u/uR2QxmggXhoQbSRMY3
   WD+Gv/phTrGXXGRgfDJs3tKqUwCMidKdihQ9HupjnCus5IBVpnG0esvcD
   LRg24J5bs2eHZhix0hI56vA0es05LKL/kRhvjxi3TTlexS4GtiAU7PSsD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="369648905"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="369648905"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 00:56:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="874627400"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 00:56:10 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id AEBD8122299;
        Tue,  8 Aug 2023 10:56:00 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qTHZE-00Clt1-0y;
        Tue, 08 Aug 2023 10:55:48 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>
Subject: [PATCH v3 10/10] media: uapi: v4l: Document source routes
Date:   Tue,  8 Aug 2023 10:55:38 +0300
Message-Id: <20230808075538.3043934-11-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230808075538.3043934-1-sakari.ailus@linux.intel.com>
References: <20230808075538.3043934-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document how internal pads are used on source routes.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/v4l/dev-subdev.rst    | 179 ++++++++++++++++++
 1 file changed, 179 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
index b023918177b5..27b0fe2dc83a 100644
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
 
@@ -666,3 +687,161 @@ A common way to accomplish this is to start from the sensors and propagate the
 configurations along the stream towards the receiver,
 using :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>` ioctls to configure each
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
+The options available in sensor's routing configuration are dictated by hardware
+capabilities: typically camera sensors always produce image data stream while
+the embedded data stream typically can be either enabled or disabled.
+
+3) Configure formats and selections
+
+This example assumes that the formats are propagated from sink pad to the source
+pad as-is. The tables contain fields of both struct v4l2_subdev_format and
+struct v4l2_mbus_framefmt. The full configuration of CCS camera sensor is out of
+scope of this example.
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
+    * - :rspan:`3` Camera sensor sub-device (CCS source sub-device)
+      - 0/0
+      - 640
+      - 480
+      - MEDIA_BUS_FMT_SGRBG10
+    * - 1/0
+      - 640
+      - 480
+      - **MEDIA_BUS_FMT_SGRBG10**
+    * - 2/0
+      - 640
+      - 2
+      - MEDIA_BUS_FMT_CCS_EMBEDDED_10
+    * - 1/1
+      - 640
+      - 2
+      - MEDIA_BUS_FMT_META_10
+    * - :rspan:`3` Bridge
+      - 0/0
+      - **640**
+      - **480**
+      - **MEDIA_BUS_FMT_SGRBG10**
+    * - 1/0
+      - 640
+      - 480
+      - MEDIA_BUS_FMT_SGRBG10
+    * - 0/1
+      - **640**
+      - **2**
+      - **MEDIA_BUS_FMT_META_10**
+    * - 1/1
+      - 640
+      - 2
+      - MEDIA_BUS_FMT_META_10
+    * - :rspan:`3` Receiver
+      - 0/0
+      - **640**
+      - **480**
+      - **MEDIA_BUS_FMT_SGRBG10**
+    * - 1/0
+      - 640
+      - 480
+      - MEDIA_BUS_FMT_SGRBG10
+    * - 0/1
+      - **640**
+      - **2**
+      - **MEDIA_BUS_FMT_META_10**
+    * - 2/0
+      - 640
+      - 2
+      - MEDIA_BUS_FMT_META_10
+
+The embedded data format does not need to be configured as the format is
+dictated by the pixel data format in this case.
-- 
2.39.2

