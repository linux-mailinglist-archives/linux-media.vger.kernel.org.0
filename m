Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EE977B684F
	for <lists+linux-media@lfdr.de>; Tue,  3 Oct 2023 13:52:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231849AbjJCLwx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Oct 2023 07:52:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232058AbjJCLww (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Oct 2023 07:52:52 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 624DCA7
        for <linux-media@vger.kernel.org>; Tue,  3 Oct 2023 04:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696333969; x=1727869969;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PrIYsWsx/AHSo5nDA3v2jd2fa1WTup9gwXhDzEGlrV8=;
  b=PUzc1IJm9ugWxufzMfBNfOCuNkyINoBOhbmvVnQpO6uKYUbahJDZ+xKr
   koWArE3jaC2V/5cYS0wmBCXGAToADBSCfJ/aDrBnIkfvAzAdaAMtspwQa
   ZNX9o26JUK8yhDmfUEq6ZjrJDjuJSCvaGx07GjBUfQQIe2kLk4wxH+MqN
   nEkf+FVyczqX9dz0xb9lVXiyTSDmEnbXOFREPb6jPZI/dK2hgwARwlB45
   f9Ln0SJVA2APEDaqVIDk365HOIdrCOohNchc4vK4okTEAvzLwG/kWOtyo
   KLgU9Y5v7MXu2qLGu+lKwXuo6krL1KydDrcMkrWtNAFwB9HCKF0J37Gq/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="413767109"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; 
   d="scan'208";a="413767109"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 04:52:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="816650495"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; 
   d="scan'208";a="816650495"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 04:52:44 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id B654B120A56;
        Tue,  3 Oct 2023 14:52:40 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: [PATCH v6 02/28] media: uapi: Add generic serial metadata mbus formats
Date:   Tue,  3 Oct 2023 14:52:30 +0300
Message-Id: <20231003115237.76828-3-sakari.ailus@linux.intel.com>
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

Add generic serial metadata mbus formats. These formats describe data
width and packing but not the content itself. The reason for specifying
such formats is that the formats as such are fairly device specific but
they are still handled by CSI-2 receiver drivers that should not be aware
of device specific formats. What makes generic metadata formats possible
is that these formats are parsed by software only, after capturing the
data to system memory.

Also add a definition for "Data unit" to cover what is essentially a pixel
but is not image data.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/glossary.rst          |   8 +
 .../media/v4l/subdev-formats.rst              | 258 ++++++++++++++++++
 include/uapi/linux/media-bus-format.h         |   9 +
 3 files changed, 275 insertions(+)

diff --git a/Documentation/userspace-api/media/glossary.rst b/Documentation/userspace-api/media/glossary.rst
index f7b99a4527c7..65217b8a44cc 100644
--- a/Documentation/userspace-api/media/glossary.rst
+++ b/Documentation/userspace-api/media/glossary.rst
@@ -25,6 +25,14 @@ Glossary
 
 	See :ref:`cec`.
 
+.. _media-glossary-data-unit:
+
+    Data unit
+
+	Unit of data transported by a bus. On parallel buses, this is called a
+	sample while on serial buses the data unit is logical. If the data unit
+	is image data, it may also be called a pixel.
+
     Device Driver
 	Part of the Linux Kernel that implements support for a hardware
 	component.
diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index a3a35eeed708..c54bf834d839 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -8234,3 +8234,261 @@ The following table lists the existing metadata formats.
 	both sides of the link and the bus format is a fixed
 	metadata format that is not configurable from userspace.
 	Width and height will be set to 0 for this format.
+
+Generic Serial Metadata Formats
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Generic serial metadata formats are used on serial buses where the actual data
+content is more or less device specific but the data is transmitted and received
+by multiple devices that do not process the data in any way, simply writing
+it to system memory for processing in software at the end of the pipeline.
+
+The more specific variant describing the actual data is used on the internal
+source pad of the originating sub-device.
+
+"b" in an array cell signifies a byte of data, followed by the number of the bit
+and finally the bit number in subscript. "X" indicates a padding bit.
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
+      - :cspan:`23` Data organization within bus ``Data unit
+	<media-glossary-data-unit>``
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
+      - X
+      - X
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
+      - X
+      - X
+      - X
+      - X
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
+      - X
+      - X
+      - X
+      - X
+      - X
+      - X
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
+      - X
+      - X
+      - X
+      - X
+      - X
+      - X
+      - X
+      - X
+    * .. _MEDIA-BUS-FMT-META-20:
+
+      - MEDIA_BUS_FMT_META_20
+      - 0x8006
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
+      - X
+      - X
+      - X
+      - X
+      - X
+      - X
+      - X
+      - X
+      - X
+      - X
+      - X
+      - X
+    * .. _MEDIA-BUS-FMT-META-24:
+
+      - MEDIA_BUS_FMT_META_24
+      - 0x8007
+      -
+      - b0\ :sub:`7`
+      - b0\ :sub:`6`
+      - b0\ :sub:`5`
+      - b0\ :sub:`4`
+      - b0\ :sub:`3`
+      - b0\ :sub:`2`
+      - b0\ :sub:`1`
+      - b0\ :sub:`0`
+      - X
+      - X
+      - X
+      - X
+      - X
+      - X
+      - X
+      - X
+      - X
+      - X
+      - X
+      - X
+      - X
+      - X
+      - X
+      - X
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

