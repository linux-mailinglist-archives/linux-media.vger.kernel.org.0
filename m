Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4958076D9F1
	for <lists+linux-media@lfdr.de>; Wed,  2 Aug 2023 23:47:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233847AbjHBVrb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Aug 2023 17:47:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233870AbjHBVrI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Aug 2023 17:47:08 -0400
Received: from mgamail.intel.com (unknown [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CE1F3A90
        for <linux-media@vger.kernel.org>; Wed,  2 Aug 2023 14:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691012791; x=1722548791;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=baraVIKViWXHBmyB8wvxlZVfLAf9ztDNDwMbJv8RESc=;
  b=Vg4nPoLoaqhq7jHU5G2W5e8zqgO+fNOWWdEpJLFYhdY+Pe621m79LqP9
   uQOVh0cJusrfQRcxTatFgpLdgbR00DBdyCJmabveoR1tCTt4QPqAGNyV8
   iV6qSQfqThRO5b2r9hGR7ZVfGM31vD98Tye0Fe6TY9TPQYKnA1EvqL7kW
   yiNUtX7KaxjNnmNgBH4iRnHEY1dYyZ8nE5v/Lfm9O0o2bGW5Jiy8VVI8V
   KmdQ3TS4u2QFJmM8AK7zu4iInv/wisheUI5jw//0dUkhP0xBnqgAzQ2M2
   wQXZLLMPl5f7d4UANpe9aN/qCvZbf1pVnGWc7728+uAZl/piifZUuatid
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="372442067"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; 
   d="scan'208";a="372442067"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 14:46:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="853009336"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; 
   d="scan'208";a="853009336"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 14:46:07 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id EF2AC1204CF;
        Thu,  3 Aug 2023 00:46:03 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>
Subject: [PATCH v2 5/9] media: uapi: Add generic serial metadata mbus formats
Date:   Thu,  3 Aug 2023 00:45:52 +0300
Message-Id: <20230802214556.180589-6-sakari.ailus@linux.intel.com>
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

Add generic serial metadata mbus formats. These formats describe data
width and packing but not the content itself. The reason for specifying
such formats is that the formats as such are fairly device specific but
they are still handled by CSI-2 receiver drivers that should not be aware
of device specific formats. What makes generic metadata formats possible
is that these formats are parsed by software only, after capturing the
data to system memory.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/v4l/dev-subdev.rst    |   8 +-
 .../media/v4l/subdev-formats.rst              | 257 ++++++++++++++++++
 include/uapi/linux/media-bus-format.h         |   9 +
 3 files changed, 270 insertions(+), 4 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
index 0e3ca6d6d81f..8197100663b9 100644
--- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
+++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
@@ -639,8 +639,8 @@ modeled as V4L2 devices, exposed to userspace via /dev/videoX nodes.
 To configure this pipeline, the userspace must take the following steps:
 
 1) Set up media links between entities: connect the sensors to the bridge,
-bridge to the receiver, and the receiver to the DMA engines. This step does
-not differ from normal non-multiplexed media controller setup.
+   bridge to the receiver, and the receiver to the DMA engines. This step does
+   not differ from normal non-multiplexed media controller setup.
 
 2) Configure routing
 
@@ -715,8 +715,8 @@ modeled as V4L2 devices, exposed to userspace via /dev/videoX nodes.
 To configure this pipeline, the userspace must take the following steps:
 
 1) Set up media links between entities: connect the sensors to the bridge,
-bridge to the receiver, and the receiver to the DMA engines. This step does
-not differ from normal non-multiplexed media controller setup.
+   bridge to the receiver, and the receiver to the DMA engines. This step does
+   not differ from normal non-multiplexed media controller setup.
 
 2) Configure routing
 
diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index a3a35eeed708..c615da08502d 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -8234,3 +8234,260 @@ The following table lists the existing metadata formats.
 	both sides of the link and the bus format is a fixed
 	metadata format that is not configurable from userspace.
 	Width and height will be set to 0 for this format.
+
+Generic Serial Metadata Formats
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Generic serial metadata formats are used on serial busses where the actual data
+content is more or less device specific but the data is transmitted and received
+by multiple devices that do not process the data in any way, simply writing
+it to system memory for processing in software at the end of the pipeline.
+
+The more specific variant describing the actual data is used on the internal
+source pad of the originating sub-device.
+
+"b" in an array cell signifies a byte of data, followed by the number of byte
+and finally the bit number in subscript. "p" indicates a padding bit.
+
+.. _media-bus-format-generic-meta:
+
+.. cssclass: longtable
+
+.. flat-table:: Generic Serial Metadata Formats
+    :header-rows:  2
+    :stub-columns: 0
+
+    * - Identifier
+      - Code
+      -
+      - :cspan:`23` Data organization
+    * -
+      -
+      - Bit
+      - 23
+      - 22
+      - 21
+      - 20
+      - 19
+      - 18
+      - 17
+      - 16
+      - 15
+      - 14
+      - 13
+      - 12
+      - 11
+      - 10
+      - 9
+      - 8
+      - 7
+      - 6
+      - 5
+      - 4
+      - 3
+      - 2
+      - 1
+      - 0
+    * .. _MEDIA-BUS-FMT-META-8:
+
+      - MEDIA_BUS_FMT_META_8
+      - 0x8001
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      - b0\ :sub:`7`
+      - b0\ :sub:`6`
+      - b0\ :sub:`5`
+      - b0\ :sub:`4`
+      - b0\ :sub:`3`
+      - b0\ :sub:`2`
+      - b0\ :sub:`1`
+      - b0\ :sub:`0`
+    * .. _MEDIA-BUS-FMT-META-10:
+
+      - MEDIA_BUS_FMT_META_10
+      - 0x8002
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      - b0\ :sub:`7`
+      - b0\ :sub:`6`
+      - b0\ :sub:`5`
+      - b0\ :sub:`4`
+      - b0\ :sub:`3`
+      - b0\ :sub:`2`
+      - b0\ :sub:`1`
+      - b0\ :sub:`0`
+      - p
+      - p
+    * .. _MEDIA-BUS-FMT-META-12:
+
+      - MEDIA_BUS_FMT_META_12
+      - 0x8003
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      - b0\ :sub:`7`
+      - b0\ :sub:`6`
+      - b0\ :sub:`5`
+      - b0\ :sub:`4`
+      - b0\ :sub:`3`
+      - b0\ :sub:`2`
+      - b0\ :sub:`1`
+      - b0\ :sub:`0`
+      - p
+      - p
+      - p
+      - p
+    * .. _MEDIA-BUS-FMT-META-14:
+
+      - MEDIA_BUS_FMT_META_14
+      - 0x8004
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      - b0\ :sub:`7`
+      - b0\ :sub:`6`
+      - b0\ :sub:`5`
+      - b0\ :sub:`4`
+      - b0\ :sub:`3`
+      - b0\ :sub:`2`
+      - b0\ :sub:`1`
+      - b0\ :sub:`0`
+      - p
+      - p
+      - p
+      - p
+      - p
+      - p
+    * .. _MEDIA-BUS-FMT-META-16:
+
+      - MEDIA_BUS_FMT_META_16
+      - 0x8005
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      - b0\ :sub:`7`
+      - b0\ :sub:`6`
+      - b0\ :sub:`5`
+      - b0\ :sub:`4`
+      - b0\ :sub:`3`
+      - b0\ :sub:`2`
+      - b0\ :sub:`1`
+      - b0\ :sub:`0`
+      - p
+      - p
+      - p
+      - p
+      - p
+      - p
+      - p
+      - p
+    * .. _MEDIA-BUS-FMT-META-20:
+
+      - MEDIA_BUS_FMT_META_20
+      - 0x8007
+      -
+      -
+      -
+      -
+      -
+      - b0\ :sub:`7`
+      - b0\ :sub:`6`
+      - b0\ :sub:`5`
+      - b0\ :sub:`4`
+      - b0\ :sub:`3`
+      - b0\ :sub:`2`
+      - b0\ :sub:`1`
+      - b0\ :sub:`0`
+      - p
+      - p
+      - p
+      - p
+      - p
+      - p
+      - p
+      - p
+      - p
+      - p
+      - p
+      - p
+    * .. _MEDIA-BUS-FMT-META-24:
+
+      - MEDIA_BUS_FMT_META_24
+      - 0x8009
+      -
+      - b0\ :sub:`7`
+      - b0\ :sub:`6`
+      - b0\ :sub:`5`
+      - b0\ :sub:`4`
+      - b0\ :sub:`3`
+      - b0\ :sub:`2`
+      - b0\ :sub:`1`
+      - b0\ :sub:`0`
+      - p
+      - p
+      - p
+      - p
+      - p
+      - p
+      - p
+      - p
+      - p
+      - p
+      - p
+      - p
+      - p
+      - p
+      - p
+      - p
diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
index a03c543cb072..9ee031397372 100644
--- a/include/uapi/linux/media-bus-format.h
+++ b/include/uapi/linux/media-bus-format.h
@@ -173,4 +173,13 @@
  */
 #define MEDIA_BUS_FMT_METADATA_FIXED		0x7001
 
+/* Generic line based metadata formats for serial buses. Next is 0x8008. */
+#define MEDIA_BUS_FMT_META_8			0x8001
+#define MEDIA_BUS_FMT_META_10			0x8002
+#define MEDIA_BUS_FMT_META_12			0x8003
+#define MEDIA_BUS_FMT_META_14			0x8004
+#define MEDIA_BUS_FMT_META_16			0x8005
+#define MEDIA_BUS_FMT_META_20			0x8006
+#define MEDIA_BUS_FMT_META_24			0x8007
+
 #endif /* __LINUX_MEDIA_BUS_FORMAT_H */
-- 
2.39.2

