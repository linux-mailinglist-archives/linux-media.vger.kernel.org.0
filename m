Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6E1A6F8BA8
	for <lists+linux-media@lfdr.de>; Fri,  5 May 2023 23:53:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233577AbjEEVxL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 May 2023 17:53:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233505AbjEEVxI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 May 2023 17:53:08 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82A2D4C37
        for <linux-media@vger.kernel.org>; Fri,  5 May 2023 14:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683323587; x=1714859587;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xDj0tJLUEPW8cSNaxQvpW6xpEtqbvA5sN/gZkh5ZYpE=;
  b=ekDkUZozbnxz0K0wRfVybnB9fVTktongwZhtM/uH1I/XzdCJUJmMN3Ug
   I95ephM0NcqBJNcVQN1Jan5TcfPYzGjIf0M/U6thfea1wMmGSI/TEp6DE
   4HLZHbfaxksDHRqNoIOfWH/NqaQuNqGYsjyD+BLFD2dZusq5UgqM90sXX
   fNhNkPHXFq82sUuBcSRQjZsTD4GIBIXgFUIk+7VGeV/1x05ODRSfT0RYC
   Ze3xFCSbDXxGipaJFrvZG4hw/IUdovjf1K8UhlYnyIqOBYmfpbOTyQzei
   PX+UJlQv+EiE6baEGRu6yCjLXiSxn85litpEs82o83z7QS3NIqli+dS8k
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="328925844"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="328925844"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 14:53:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="700626145"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="700626145"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 14:53:05 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 27F8C1227C1;
        Sat,  6 May 2023 00:53:03 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: [RFC 5/7] media: uapi: Add generic serial metadata mbus formats
Date:   Sat,  6 May 2023 00:52:55 +0300
Message-Id: <20230505215257.60704-6-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230505215257.60704-1-sakari.ailus@linux.intel.com>
References: <20230505215257.60704-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
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
 .../media/v4l/subdev-formats.rst              | 257 ++++++++++++++++++
 include/uapi/linux/media-bus-format.h         |   9 +
 2 files changed, 266 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index a3a35eeed708..1492fff58426 100644
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
+    * .. _MEDIA-BUS-FMT-META-1X8-8:
+
+      - MEDIA_BUS_FMT_META_1X8_8
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
+    * .. _MEDIA-BUS-FMT-META-1X8-10:
+
+      - MEDIA_BUS_FMT_META_1X8_10
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
+    * .. _MEDIA-BUS-FMT-META-1X8-12:
+
+      - MEDIA_BUS_FMT_META_1X8_12
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
+    * .. _MEDIA-BUS-FMT-META-1X8-14:
+
+      - MEDIA_BUS_FMT_META_1X8_14
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
+    * .. _MEDIA-BUS-FMT-META-1X8-16:
+
+      - MEDIA_BUS_FMT_META_1X8_16
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
+    * .. _MEDIA-BUS-FMT-META-1X8-20:
+
+      - MEDIA_BUS_FMT_META_1X8_20
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
+    * .. _MEDIA-BUS-FMT-META-1X8-24:
+
+      - MEDIA_BUS_FMT_META_1X8_24
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
index a03c543cb072..722463523bbd 100644
--- a/include/uapi/linux/media-bus-format.h
+++ b/include/uapi/linux/media-bus-format.h
@@ -173,4 +173,13 @@
  */
 #define MEDIA_BUS_FMT_METADATA_FIXED		0x7001
 
+/* Generic line based metadata formats for serial buses. Next is 0x800b. */
+#define MEDIA_BUS_FMT_META_1X8_8		0x8001
+#define MEDIA_BUS_FMT_META_1X8_10		0x8002
+#define MEDIA_BUS_FMT_META_1X8_12		0x8003
+#define MEDIA_BUS_FMT_META_1X8_14		0x8004
+#define MEDIA_BUS_FMT_META_1X8_16		0x8005
+#define MEDIA_BUS_FMT_META_1X8_20		0x8007
+#define MEDIA_BUS_FMT_META_1X8_24		0x8009
+
 #endif /* __LINUX_MEDIA_BUS_FORMAT_H */
-- 
2.30.2

