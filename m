Return-Path: <linux-media+bounces-10307-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 787378B513E
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 08:20:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D69C61F22207
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 06:20:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E86B710971;
	Mon, 29 Apr 2024 06:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EARyuOzu"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD8312E73
	for <linux-media@vger.kernel.org>; Mon, 29 Apr 2024 06:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714371592; cv=none; b=iyD6zYyMrMHEvgFCa6kzChqrATwKT40WnHnclJDM9pkRbpXgXaklAw5t8lklJOjq9YU5f/9v7ekRveeJC4uR4bh1RmsfdOyBExppQ53ShR6zCiFPZoDadmLdKQdzGFAfK87Uk7HhVWhJDNG975zy14Pv2gI1GBL44Qp8JMg2ib0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714371592; c=relaxed/simple;
	bh=Lm+FcoaXCc0TSjrR8EiUYPIToTmBGf1IZSzkw7ShqeQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kccruPV1OI+WVzdtJ0XVgNcQjexu+7E2gHU4o5Q1MShWC1YFGDsAHR5vsADc/Q0evOLwZRwKrL7qNERppDzD5YgV7nVWcHryhe3bRUU1JCgzHCi/7w8r79+wGVKNqzaIChp+0Iie8vCHc+ifWJTOnXzNW6f7qMEdDQCgxJIiCYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EARyuOzu; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714371589; x=1745907589;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Lm+FcoaXCc0TSjrR8EiUYPIToTmBGf1IZSzkw7ShqeQ=;
  b=EARyuOzuEZi5+Li8X4SlTI8dUIWU3d3y6zGQGALjOOPcedtHTBTzCV9j
   I6rlHM0eJ8+dQTBBkx3tsdck4DRFHgpqxC7GAvrPwf6fcE8Sfv8Hj7Amj
   ZASZ+DbHjUDLdrMIz82Uhas6376qvVwFLPQcDmGpmuOco1itlKot3lY0W
   JiZZ7RQPSitpSbpefWyNG3BlQzfAIPpcE0Myn6aQnH1hMp6I+rW6FstSE
   6CHUZYDIPCXnX4ut8F9VaBUxnmKVHirEeZXURxNj96Tqm4Gfeg/CKIJ7B
   5qp2Qr4xmM0YDgIUvCpYZgjdqV36LO7SOKj2gFuwK6bWFeSrN9pmMIVn+
   Q==;
X-CSE-ConnectionGUID: HQNDYoMWRQqoUOz2nzopBA==
X-CSE-MsgGUID: 40HdcrHPRfa2GTbthabZqA==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="13795595"
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; 
   d="scan'208";a="13795595"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 23:19:38 -0700
X-CSE-ConnectionGUID: 85ABF9veQQ62nsd3k6Hjkw==
X-CSE-MsgGUID: fYJQatLxQVKr1zr718p4yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; 
   d="scan'208";a="26642936"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 23:19:34 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id C6C0F11FC19;
	Mon, 29 Apr 2024 09:19:29 +0300 (EEST)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@intel.com,
	laurent.pinchart@ideasonboard.com,
	andriy.shevchenko@linux.intel.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	claus.stovgaard@gmail.com,
	tomi.valkeinen@ideasonboard.com,
	tfiga@chromium.org,
	senozhatsky@chromium.org,
	andreaskleist@gmail.com,
	bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	hongju.wang@intel.com
Subject: [PATCH v7 17/18] media: Documentation: add Intel IPU6 ISYS driver admin-guide doc
Date: Mon, 29 Apr 2024 09:18:52 +0300
Message-Id: <20240429061853.983538-18-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240429061853.983538-1-sakari.ailus@linux.intel.com>
References: <20240429061853.983538-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bingbu Cao <bingbu.cao@intel.com>

This document mainly describe the functionality of IPU6 and IPU6 isys
driver, and gives an example that how user can do imaging capture with
tools.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/admin-guide/media/ipu6-isys.rst | 161 +++++
 .../admin-guide/media/ipu6_isys_graph.svg     | 548 ++++++++++++++++++
 .../admin-guide/media/v4l-drivers.rst         |   1 +
 3 files changed, 710 insertions(+)
 create mode 100644 Documentation/admin-guide/media/ipu6-isys.rst
 create mode 100644 Documentation/admin-guide/media/ipu6_isys_graph.svg

diff --git a/Documentation/admin-guide/media/ipu6-isys.rst b/Documentation/admin-guide/media/ipu6-isys.rst
new file mode 100644
index 000000000000..0721e920b5e6
--- /dev/null
+++ b/Documentation/admin-guide/media/ipu6-isys.rst
@@ -0,0 +1,161 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: <isonum.txt>
+
+========================================================
+Intel Image Processing Unit 6 (IPU6) Input System driver
+========================================================
+
+Copyright |copy| 2023--2024 Intel Corporation
+
+Introduction
+============
+
+This file documents the Intel IPU6 (6th generation Image Processing Unit)
+Input System (MIPI CSI2 receiver) drivers located under
+drivers/media/pci/intel/ipu6.
+
+The Intel IPU6 can be found in certain Intel SoCs but not in all SKUs:
+
+* Tiger Lake
+* Jasper Lake
+* Alder Lake
+* Raptor Lake
+* Meteor Lake
+
+Intel IPU6 is made up of two components - Input System (ISYS) and Processing
+System (PSYS).
+
+The Input System mainly works as MIPI CSI-2 receiver which receives and
+processes the image data from the sensors and outputs the frames to memory.
+
+There are 2 driver modules - intel-ipu6 and intel-ipu6-isys. intel-ipu6 is an
+IPU6 common driver which does PCI configuration, firmware loading and parsing,
+firmware authentication, DMA mapping and IPU-MMU (internal Memory mapping Unit)
+configuration. intel_ipu6_isys implements V4L2, Media Controller and V4L2
+sub-device interfaces. The IPU6 ISYS driver supports camera sensors connected
+to the IPU6 ISYS through V4L2 sub-device sensor drivers.
+
+.. Note:: See Documentation/driver-api/media/drivers/ipu6.rst for more
+	  information about the IPU6 hardware.
+
+Input system driver
+===================
+
+The Input System driver mainly configures CSI-2 D-PHY, constructs the firmware
+stream configuration, sends commands to firmware, gets response from hardware
+and firmware and then returns buffers to user.  The ISYS is represented as
+several V4L2 sub-devices as well as video nodes.
+
+.. kernel-figure::  ipu6_isys_graph.svg
+   :alt: ipu6 isys media graph with multiple streams support
+
+   IPU6 ISYS media graph with multiple streams support
+
+The graph has been produced using the following command:
+
+.. code-block:: none
+
+   fdp -Gsplines=true -Tsvg < dot > dot.svg
+
+Capturing frames with IPU6 ISYS
+-------------------------------
+
+IPU6 ISYS is used to capture frames from the camera sensors connected to the
+CSI2 ports. The supported input formats of ISYS are listed in table below:
+
+.. tabularcolumns:: |p{0.8cm}|p{4.0cm}|p{4.0cm}|
+
+.. flat-table::
+    :header-rows: 1
+
+    * - IPU6 ISYS supported input formats
+
+    * - RGB565, RGB888
+
+    * - UYVY8, YUYV8
+
+    * - RAW8, RAW10, RAW12
+
+.. _ipu6_isys_capture_examples:
+
+Examples
+~~~~~~~~
+
+Here is an example of IPU6 ISYS raw capture on Dell XPS 9315 laptop. On this
+machine, ov01a10 sensor is connected to IPU ISYS CSI-2 port 2, which can
+generate images at sBGGR10 with resolution 1280x800.
+
+Using the media controller APIs, we can configure ov01a10 sensor by
+media-ctl [#f1]_ and yavta [#f2]_ to transmit frames to IPU6 ISYS.
+
+.. code-block:: none
+
+    # Example 1 capture frame from ov01a10 camera sensor
+    # This example assumes /dev/media0 as the IPU ISYS media device
+    export MDEV=/dev/media0
+
+    # Establish the link for the media devices using media-ctl
+    media-ctl -d $MDEV -l "\"ov01a10 3-0036\":0 -> \"Intel IPU6 CSI2 2\":0[1]"
+
+    # Set the format for the media devices
+    media-ctl -d $MDEV -V "ov01a10:0 [fmt:SBGGR10/1280x800]"
+    media-ctl -d $MDEV -V "Intel IPU6 CSI2 2:0 [fmt:SBGGR10/1280x800]"
+    media-ctl -d $MDEV -V "Intel IPU6 CSI2 2:1 [fmt:SBGGR10/1280x800]"
+
+Once the media pipeline is configured, desired sensor specific settings
+(such as exposure and gain settings) can be set, using the yavta tool.
+
+e.g
+
+.. code-block:: none
+
+    # and that ov01a10 sensor is connected to i2c bus 3 with address 0x36
+    export SDEV=$(media-ctl -d $MDEV -e "ov01a10 3-0036")
+
+    yavta -w 0x009e0903 400 $SDEV
+    yavta -w 0x009e0913 1000 $SDEV
+    yavta -w 0x009e0911 2000 $SDEV
+
+Once the desired sensor settings are set, frame captures can be done as below.
+
+e.g
+
+.. code-block:: none
+
+    yavta --data-prefix -u -c10 -n5 -I -s 1280x800 --file=/tmp/frame-#.bin \
+            -f SBGGR10 $(media-ctl -d $MDEV -e "Intel IPU6 ISYS Capture 0")
+
+With the above command, 10 frames are captured at 1280x800 resolution with
+sBGGR10 format. The captured frames are available as /tmp/frame-#.bin files.
+
+Here is another example of IPU6 ISYS RAW and metadata capture from camera
+sensor ov2740 on Lenovo X1 Yoga laptop.
+
+.. code-block:: none
+
+    media-ctl -l "\"ov2740 14-0036\":0 -> \"Intel IPU6 CSI2 1\":0[1]"
+    media-ctl -l "\"Intel IPU6 CSI2 1\":1 -> \"Intel IPU6 ISYS Capture 0\":0[5]"
+    media-ctl -l "\"Intel IPU6 CSI2 1\":2 -> \"Intel IPU6 ISYS Capture 1\":0[5]"
+
+    # set routing
+    media-ctl -v -R "\"Intel IPU6 CSI2 1\" [0/0->1/0[1],0/1->2/1[1]]"
+
+    media-ctl -v "\"Intel IPU6 CSI2 1\":0/0 [fmt:SGRBG10/1932x1092]"
+    media-ctl -v "\"Intel IPU6 CSI2 1\":0/1 [fmt:GENERIC_8/97x1]"
+    media-ctl -v "\"Intel IPU6 CSI2 1\":1/0 [fmt:SGRBG10/1932x1092]"
+    media-ctl -v "\"Intel IPU6 CSI2 1\":2/1 [fmt:GENERIC_8/97x1]"
+
+    CAPTURE_DEV=$(media-ctl -e "Intel IPU6 ISYS Capture 0")
+    ./yavta --data-prefix -c100 -n5 -I -s1932x1092 --file=/tmp/frame-#.bin \
+        -f SGRBG10 ${CAPTURE_DEV}
+
+    CAPTURE_META=$(media-ctl -e "Intel IPU6 ISYS Capture 1")
+    ./yavta --data-prefix -c100 -n5 -I -s97x1 -B meta-capture \
+        --file=/tmp/meta-#.bin -f GENERIC_8 ${CAPTURE_META}
+
+References
+==========
+
+.. [#f1] https://git.ideasonboard.org/media-ctl.git
+.. [#f2] https://git.ideasonboard.org/yavta.git
diff --git a/Documentation/admin-guide/media/ipu6_isys_graph.svg b/Documentation/admin-guide/media/ipu6_isys_graph.svg
new file mode 100644
index 000000000000..c8539ef320d2
--- /dev/null
+++ b/Documentation/admin-guide/media/ipu6_isys_graph.svg
@@ -0,0 +1,548 @@
+<?xml version="1.0" encoding="UTF-8" standalone="no"?>
+<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN"
+ "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
+<!-- Generated by graphviz version 2.43.0 (0)
+ -->
+<!-- Title: board Pages: 1 -->
+<svg width="1703pt" height="1473pt"
+ viewBox="0.00 0.00 1703.00 1473.00" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
+<g id="graph0" class="graph" transform="scale(1 1) rotate(0) translate(4 1469)">
+<title>board</title>
+<polygon fill="white" stroke="transparent" points="-4,4 -4,-1469 1699,-1469 1699,4 -4,4"/>
+<!-- n00000001 -->
+<g id="node1" class="node">
+<title>n00000001</title>
+<polygon fill="yellow" stroke="black" points="832.99,-750.08 629.99,-750.08 629.99,-712.08 832.99,-712.08 832.99,-750.08"/>
+<text text-anchor="middle" x="731.49" y="-734.88" font-family="Times,serif" font-size="14.00">Intel IPU6 ISYS Capture 0</text>
+<text text-anchor="middle" x="731.49" y="-719.88" font-family="Times,serif" font-size="14.00">/dev/video0</text>
+</g>
+<!-- n00000005 -->
+<g id="node2" class="node">
+<title>n00000005</title>
+<polygon fill="yellow" stroke="black" points="1396.59,-771.88 1193.59,-771.88 1193.59,-733.88 1396.59,-733.88 1396.59,-771.88"/>
+<text text-anchor="middle" x="1295.09" y="-756.68" font-family="Times,serif" font-size="14.00">Intel IPU6 ISYS Capture 1</text>
+<text text-anchor="middle" x="1295.09" y="-741.68" font-family="Times,serif" font-size="14.00">/dev/video1</text>
+</g>
+<!-- n00000009 -->
+<g id="node3" class="node">
+<title>n00000009</title>
+<polygon fill="yellow" stroke="black" points="1118.52,-690.47 915.52,-690.47 915.52,-652.47 1118.52,-652.47 1118.52,-690.47"/>
+<text text-anchor="middle" x="1017.02" y="-675.27" font-family="Times,serif" font-size="14.00">Intel IPU6 ISYS Capture 2</text>
+<text text-anchor="middle" x="1017.02" y="-660.27" font-family="Times,serif" font-size="14.00">/dev/video2</text>
+</g>
+<!-- n0000000d -->
+<g id="node4" class="node">
+<title>n0000000d</title>
+<polygon fill="yellow" stroke="black" points="1105.89,-838.84 902.89,-838.84 902.89,-800.84 1105.89,-800.84 1105.89,-838.84"/>
+<text text-anchor="middle" x="1004.39" y="-823.64" font-family="Times,serif" font-size="14.00">Intel IPU6 ISYS Capture 3</text>
+<text text-anchor="middle" x="1004.39" y="-808.64" font-family="Times,serif" font-size="14.00">/dev/video3</text>
+</g>
+<!-- n00000011 -->
+<g id="node5" class="node">
+<title>n00000011</title>
+<polygon fill="yellow" stroke="black" points="1279.22,-992.95 1076.22,-992.95 1076.22,-954.95 1279.22,-954.95 1279.22,-992.95"/>
+<text text-anchor="middle" x="1177.72" y="-977.75" font-family="Times,serif" font-size="14.00">Intel IPU6 ISYS Capture 4</text>
+<text text-anchor="middle" x="1177.72" y="-962.75" font-family="Times,serif" font-size="14.00">/dev/video4</text>
+</g>
+<!-- n00000015 -->
+<g id="node6" class="node">
+<title>n00000015</title>
+<polygon fill="yellow" stroke="black" points="939.18,-984.91 736.18,-984.91 736.18,-946.91 939.18,-946.91 939.18,-984.91"/>
+<text text-anchor="middle" x="837.68" y="-969.71" font-family="Times,serif" font-size="14.00">Intel IPU6 ISYS Capture 5</text>
+<text text-anchor="middle" x="837.68" y="-954.71" font-family="Times,serif" font-size="14.00">/dev/video5</text>
+</g>
+<!-- n00000019 -->
+<g id="node7" class="node">
+<title>n00000019</title>
+<polygon fill="yellow" stroke="black" points="957.87,-527.99 754.87,-527.99 754.87,-489.99 957.87,-489.99 957.87,-527.99"/>
+<text text-anchor="middle" x="856.37" y="-512.79" font-family="Times,serif" font-size="14.00">Intel IPU6 ISYS Capture 6</text>
+<text text-anchor="middle" x="856.37" y="-497.79" font-family="Times,serif" font-size="14.00">/dev/video6</text>
+</g>
+<!-- n0000001d -->
+<g id="node8" class="node">
+<title>n0000001d</title>
+<polygon fill="yellow" stroke="black" points="1291.02,-542.15 1088.02,-542.15 1088.02,-504.15 1291.02,-504.15 1291.02,-542.15"/>
+<text text-anchor="middle" x="1189.52" y="-526.95" font-family="Times,serif" font-size="14.00">Intel IPU6 ISYS Capture 7</text>
+<text text-anchor="middle" x="1189.52" y="-511.95" font-family="Times,serif" font-size="14.00">/dev/video7</text>
+</g>
+<!-- n00000021 -->
+<g id="node9" class="node">
+<title>n00000021</title>
+<polygon fill="yellow" stroke="black" points="202.74,-611.46 -0.26,-611.46 -0.26,-573.46 202.74,-573.46 202.74,-611.46"/>
+<text text-anchor="middle" x="101.24" y="-596.26" font-family="Times,serif" font-size="14.00">Intel IPU6 ISYS Capture 8</text>
+<text text-anchor="middle" x="101.24" y="-581.26" font-family="Times,serif" font-size="14.00">/dev/video8</text>
+</g>
+<!-- n00000025 -->
+<g id="node10" class="node">
+<title>n00000025</title>
+<polygon fill="yellow" stroke="black" points="764.86,-637.89 561.86,-637.89 561.86,-599.89 764.86,-599.89 764.86,-637.89"/>
+<text text-anchor="middle" x="663.36" y="-622.69" font-family="Times,serif" font-size="14.00">Intel IPU6 ISYS Capture 9</text>
+<text text-anchor="middle" x="663.36" y="-607.69" font-family="Times,serif" font-size="14.00">/dev/video9</text>
+</g>
+<!-- n00000029 -->
+<g id="node11" class="node">
+<title>n00000029</title>
+<polygon fill="yellow" stroke="black" points="358.62,-519.5 146.62,-519.5 146.62,-481.5 358.62,-481.5 358.62,-519.5"/>
+<text text-anchor="middle" x="252.62" y="-504.3" font-family="Times,serif" font-size="14.00">Intel IPU6 ISYS Capture 10</text>
+<text text-anchor="middle" x="252.62" y="-489.3" font-family="Times,serif" font-size="14.00">/dev/video10</text>
+</g>
+<!-- n0000002d -->
+<g id="node12" class="node">
+<title>n0000002d</title>
+<polygon fill="yellow" stroke="black" points="481.4,-662.59 269.4,-662.59 269.4,-624.59 481.4,-624.59 481.4,-662.59"/>
+<text text-anchor="middle" x="375.4" y="-647.39" font-family="Times,serif" font-size="14.00">Intel IPU6 ISYS Capture 11</text>
+<text text-anchor="middle" x="375.4" y="-632.39" font-family="Times,serif" font-size="14.00">/dev/video11</text>
+</g>
+<!-- n00000031 -->
+<g id="node13" class="node">
+<title>n00000031</title>
+<polygon fill="yellow" stroke="black" points="637.17,-837.47 425.17,-837.47 425.17,-799.47 637.17,-799.47 637.17,-837.47"/>
+<text text-anchor="middle" x="531.17" y="-822.27" font-family="Times,serif" font-size="14.00">Intel IPU6 ISYS Capture 12</text>
+<text text-anchor="middle" x="531.17" y="-807.27" font-family="Times,serif" font-size="14.00">/dev/video12</text>
+</g>
+<!-- n00000035 -->
+<g id="node14" class="node">
+<title>n00000035</title>
+<polygon fill="yellow" stroke="black" points="337.75,-833.67 125.75,-833.67 125.75,-795.67 337.75,-795.67 337.75,-833.67"/>
+<text text-anchor="middle" x="231.75" y="-818.47" font-family="Times,serif" font-size="14.00">Intel IPU6 ISYS Capture 13</text>
+<text text-anchor="middle" x="231.75" y="-803.47" font-family="Times,serif" font-size="14.00">/dev/video13</text>
+</g>
+<!-- n00000039 -->
+<g id="node15" class="node">
+<title>n00000039</title>
+<polygon fill="yellow" stroke="black" points="393.07,-317.96 181.07,-317.96 181.07,-279.96 393.07,-279.96 393.07,-317.96"/>
+<text text-anchor="middle" x="287.07" y="-302.76" font-family="Times,serif" font-size="14.00">Intel IPU6 ISYS Capture 14</text>
+<text text-anchor="middle" x="287.07" y="-287.76" font-family="Times,serif" font-size="14.00">/dev/video14</text>
+</g>
+<!-- n0000003d -->
+<g id="node16" class="node">
+<title>n0000003d</title>
+<polygon fill="yellow" stroke="black" points="701.46,-391.04 489.46,-391.04 489.46,-353.04 701.46,-353.04 701.46,-391.04"/>
+<text text-anchor="middle" x="595.46" y="-375.84" font-family="Times,serif" font-size="14.00">Intel IPU6 ISYS Capture 15</text>
+<text text-anchor="middle" x="595.46" y="-360.84" font-family="Times,serif" font-size="14.00">/dev/video15</text>
+</g>
+<!-- n00000041 -->
+<g id="node17" class="node">
+<title>n00000041</title>
+<polygon fill="yellow" stroke="black" points="212.45,-1228.8 0.45,-1228.8 0.45,-1190.8 212.45,-1190.8 212.45,-1228.8"/>
+<text text-anchor="middle" x="106.45" y="-1213.6" font-family="Times,serif" font-size="14.00">Intel IPU6 ISYS Capture 16</text>
+<text text-anchor="middle" x="106.45" y="-1198.6" font-family="Times,serif" font-size="14.00">/dev/video16</text>
+</g>
+<!-- n00000045 -->
+<g id="node18" class="node">
+<title>n00000045</title>
+<polygon fill="yellow" stroke="black" points="784.86,-1252.38 572.86,-1252.38 572.86,-1214.38 784.86,-1214.38 784.86,-1252.38"/>
+<text text-anchor="middle" x="678.86" y="-1237.18" font-family="Times,serif" font-size="14.00">Intel IPU6 ISYS Capture 17</text>
+<text text-anchor="middle" x="678.86" y="-1222.18" font-family="Times,serif" font-size="14.00">/dev/video17</text>
+</g>
+<!-- n00000049 -->
+<g id="node19" class="node">
+<title>n00000049</title>
+<polygon fill="yellow" stroke="black" points="503.14,-1169.96 291.14,-1169.96 291.14,-1131.96 503.14,-1131.96 503.14,-1169.96"/>
+<text text-anchor="middle" x="397.14" y="-1154.76" font-family="Times,serif" font-size="14.00">Intel IPU6 ISYS Capture 18</text>
+<text text-anchor="middle" x="397.14" y="-1139.76" font-family="Times,serif" font-size="14.00">/dev/video18</text>
+</g>
+<!-- n0000004d -->
+<g id="node20" class="node">
+<title>n0000004d</title>
+<polygon fill="yellow" stroke="black" points="492.62,-1319.4 280.62,-1319.4 280.62,-1281.4 492.62,-1281.4 492.62,-1319.4"/>
+<text text-anchor="middle" x="386.62" y="-1304.2" font-family="Times,serif" font-size="14.00">Intel IPU6 ISYS Capture 19</text>
+<text text-anchor="middle" x="386.62" y="-1289.2" font-family="Times,serif" font-size="14.00">/dev/video19</text>
+</g>
+<!-- n00000051 -->
+<g id="node21" class="node">
+<title>n00000051</title>
+<polygon fill="yellow" stroke="black" points="680.74,-1464.66 468.74,-1464.66 468.74,-1426.66 680.74,-1426.66 680.74,-1464.66"/>
+<text text-anchor="middle" x="574.74" y="-1449.46" font-family="Times,serif" font-size="14.00">Intel IPU6 ISYS Capture 20</text>
+<text text-anchor="middle" x="574.74" y="-1434.46" font-family="Times,serif" font-size="14.00">/dev/video20</text>
+</g>
+<!-- n00000055 -->
+<g id="node22" class="node">
+<title>n00000055</title>
+<polygon fill="yellow" stroke="black" points="302.42,-1452.56 90.42,-1452.56 90.42,-1414.56 302.42,-1414.56 302.42,-1452.56"/>
+<text text-anchor="middle" x="196.42" y="-1437.36" font-family="Times,serif" font-size="14.00">Intel IPU6 ISYS Capture 21</text>
+<text text-anchor="middle" x="196.42" y="-1422.36" font-family="Times,serif" font-size="14.00">/dev/video21</text>
+</g>
+<!-- n00000059 -->
+<g id="node23" class="node">
+<title>n00000059</title>
+<polygon fill="yellow" stroke="black" points="319.89,-1018.32 107.89,-1018.32 107.89,-980.32 319.89,-980.32 319.89,-1018.32"/>
+<text text-anchor="middle" x="213.89" y="-1003.12" font-family="Times,serif" font-size="14.00">Intel IPU6 ISYS Capture 22</text>
+<text text-anchor="middle" x="213.89" y="-988.12" font-family="Times,serif" font-size="14.00">/dev/video22</text>
+</g>
+<!-- n0000005d -->
+<g id="node24" class="node">
+<title>n0000005d</title>
+<polygon fill="yellow" stroke="black" points="692.62,-1031.39 480.62,-1031.39 480.62,-993.39 692.62,-993.39 692.62,-1031.39"/>
+<text text-anchor="middle" x="586.62" y="-1016.19" font-family="Times,serif" font-size="14.00">Intel IPU6 ISYS Capture 23</text>
+<text text-anchor="middle" x="586.62" y="-1001.19" font-family="Times,serif" font-size="14.00">/dev/video23</text>
+</g>
+<!-- n00000061 -->
+<g id="node25" class="node">
+<title>n00000061</title>
+<polygon fill="yellow" stroke="black" points="1122.45,-248.8 910.45,-248.8 910.45,-210.8 1122.45,-210.8 1122.45,-248.8"/>
+<text text-anchor="middle" x="1016.45" y="-233.6" font-family="Times,serif" font-size="14.00">Intel IPU6 ISYS Capture 24</text>
+<text text-anchor="middle" x="1016.45" y="-218.6" font-family="Times,serif" font-size="14.00">/dev/video24</text>
+</g>
+<!-- n00000065 -->
+<g id="node26" class="node">
+<title>n00000065</title>
+<polygon fill="yellow" stroke="black" points="1694.86,-272.38 1482.86,-272.38 1482.86,-234.38 1694.86,-234.38 1694.86,-272.38"/>
+<text text-anchor="middle" x="1588.86" y="-257.18" font-family="Times,serif" font-size="14.00">Intel IPU6 ISYS Capture 25</text>
+<text text-anchor="middle" x="1588.86" y="-242.18" font-family="Times,serif" font-size="14.00">/dev/video25</text>
+</g>
+<!-- n00000069 -->
+<g id="node27" class="node">
+<title>n00000069</title>
+<polygon fill="yellow" stroke="black" points="1413.14,-189.96 1201.14,-189.96 1201.14,-151.96 1413.14,-151.96 1413.14,-189.96"/>
+<text text-anchor="middle" x="1307.14" y="-174.76" font-family="Times,serif" font-size="14.00">Intel IPU6 ISYS Capture 26</text>
+<text text-anchor="middle" x="1307.14" y="-159.76" font-family="Times,serif" font-size="14.00">/dev/video26</text>
+</g>
+<!-- n0000006d -->
+<g id="node28" class="node">
+<title>n0000006d</title>
+<polygon fill="yellow" stroke="black" points="1402.62,-339.4 1190.62,-339.4 1190.62,-301.4 1402.62,-301.4 1402.62,-339.4"/>
+<text text-anchor="middle" x="1296.62" y="-324.2" font-family="Times,serif" font-size="14.00">Intel IPU6 ISYS Capture 27</text>
+<text text-anchor="middle" x="1296.62" y="-309.2" font-family="Times,serif" font-size="14.00">/dev/video27</text>
+</g>
+<!-- n00000071 -->
+<g id="node29" class="node">
+<title>n00000071</title>
+<polygon fill="yellow" stroke="black" points="1590.74,-484.66 1378.74,-484.66 1378.74,-446.66 1590.74,-446.66 1590.74,-484.66"/>
+<text text-anchor="middle" x="1484.74" y="-469.46" font-family="Times,serif" font-size="14.00">Intel IPU6 ISYS Capture 28</text>
+<text text-anchor="middle" x="1484.74" y="-454.46" font-family="Times,serif" font-size="14.00">/dev/video28</text>
+</g>
+<!-- n00000075 -->
+<g id="node30" class="node">
+<title>n00000075</title>
+<polygon fill="yellow" stroke="black" points="1212.42,-472.56 1000.42,-472.56 1000.42,-434.56 1212.42,-434.56 1212.42,-472.56"/>
+<text text-anchor="middle" x="1106.42" y="-457.36" font-family="Times,serif" font-size="14.00">Intel IPU6 ISYS Capture 29</text>
+<text text-anchor="middle" x="1106.42" y="-442.36" font-family="Times,serif" font-size="14.00">/dev/video29</text>
+</g>
+<!-- n00000079 -->
+<g id="node31" class="node">
+<title>n00000079</title>
+<polygon fill="yellow" stroke="black" points="1229.89,-38.32 1017.89,-38.32 1017.89,-0.32 1229.89,-0.32 1229.89,-38.32"/>
+<text text-anchor="middle" x="1123.89" y="-23.12" font-family="Times,serif" font-size="14.00">Intel IPU6 ISYS Capture 30</text>
+<text text-anchor="middle" x="1123.89" y="-8.12" font-family="Times,serif" font-size="14.00">/dev/video30</text>
+</g>
+<!-- n0000007d -->
+<g id="node32" class="node">
+<title>n0000007d</title>
+<polygon fill="yellow" stroke="black" points="1602.62,-51.39 1390.62,-51.39 1390.62,-13.39 1602.62,-13.39 1602.62,-51.39"/>
+<text text-anchor="middle" x="1496.62" y="-36.19" font-family="Times,serif" font-size="14.00">Intel IPU6 ISYS Capture 31</text>
+<text text-anchor="middle" x="1496.62" y="-21.19" font-family="Times,serif" font-size="14.00">/dev/video31</text>
+</g>
+<!-- n00000081 -->
+<g id="node33" class="node">
+<title>n00000081</title>
+<path fill="green" stroke="black" d="M924.28,-700.28C924.28,-700.28 1108.28,-700.28 1108.28,-700.28 1114.28,-700.28 1120.28,-706.28 1120.28,-712.28 1120.28,-712.28 1120.28,-772.28 1120.28,-772.28 1120.28,-778.28 1114.28,-784.28 1108.28,-784.28 1108.28,-784.28 924.28,-784.28 924.28,-784.28 918.28,-784.28 912.28,-778.28 912.28,-772.28 912.28,-772.28 912.28,-712.28 912.28,-712.28 912.28,-706.28 918.28,-700.28 924.28,-700.28"/>
+<text text-anchor="middle" x="1016.28" y="-769.08" font-family="Times,serif" font-size="14.00">0</text>
+<polyline fill="none" stroke="black" points="912.28,-761.28 1120.28,-761.28 "/>
+<text text-anchor="middle" x="1016.28" y="-746.08" font-family="Times,serif" font-size="14.00">Intel IPU6 CSI2 0</text>
+<text text-anchor="middle" x="1016.28" y="-731.08" font-family="Times,serif" font-size="14.00">/dev/v4l&#45;subdev0</text>
+<polyline fill="none" stroke="black" points="912.28,-723.28 1120.28,-723.28 "/>
+<text text-anchor="middle" x="925.28" y="-708.08" font-family="Times,serif" font-size="14.00">1</text>
+<polyline fill="none" stroke="black" points="938.28,-700.28 938.28,-723.28 "/>
+<text text-anchor="middle" x="951.28" y="-708.08" font-family="Times,serif" font-size="14.00">2</text>
+<polyline fill="none" stroke="black" points="964.28,-700.28 964.28,-723.28 "/>
+<text text-anchor="middle" x="977.28" y="-708.08" font-family="Times,serif" font-size="14.00">3</text>
+<polyline fill="none" stroke="black" points="990.28,-700.28 990.28,-723.28 "/>
+<text text-anchor="middle" x="1003.28" y="-708.08" font-family="Times,serif" font-size="14.00">4</text>
+<polyline fill="none" stroke="black" points="1016.28,-700.28 1016.28,-723.28 "/>
+<text text-anchor="middle" x="1029.28" y="-708.08" font-family="Times,serif" font-size="14.00">5</text>
+<polyline fill="none" stroke="black" points="1042.28,-700.28 1042.28,-723.28 "/>
+<text text-anchor="middle" x="1055.28" y="-708.08" font-family="Times,serif" font-size="14.00">6</text>
+<polyline fill="none" stroke="black" points="1068.28,-700.28 1068.28,-723.28 "/>
+<text text-anchor="middle" x="1081.28" y="-708.08" font-family="Times,serif" font-size="14.00">7</text>
+<polyline fill="none" stroke="black" points="1094.28,-700.28 1094.28,-723.28 "/>
+<text text-anchor="middle" x="1107.28" y="-708.08" font-family="Times,serif" font-size="14.00">8</text>
+</g>
+<!-- n00000081&#45;&gt;n00000001 -->
+<g id="edge1" class="edge">
+<title>n00000081:port1&#45;&gt;n00000001</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M912.28,-711.28C912.28,-711.28 880.33,-714.78 843.28,-718.84"/>
+<polygon fill="black" stroke="black" points="842.81,-715.37 833.25,-719.94 843.57,-722.33 842.81,-715.37"/>
+</g>
+<!-- n00000081&#45;&gt;n00000005 -->
+<g id="edge2" class="edge">
+<title>n00000081:port2&#45;&gt;n00000005</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M951.38,-700.28C951.38,-700.28 1086.18,-688.61 1123.48,-697.08 1155.93,-704.45 1158.99,-719.67 1190.39,-730.68 1190.49,-730.71 1190.59,-730.75 1190.69,-730.78"/>
+<polygon fill="black" stroke="black" points="1189.45,-734.06 1200.05,-733.86 1191.64,-727.41 1189.45,-734.06"/>
+</g>
+<!-- n00000081&#45;&gt;n00000009 -->
+<g id="edge3" class="edge">
+<title>n00000081:port3&#45;&gt;n00000009</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M977.28,-700.28C977.28,-700.28 979.31,-698.81 982.45,-696.54"/>
+<polygon fill="black" stroke="black" points="984.7,-699.23 990.74,-690.53 980.59,-693.56 984.7,-699.23"/>
+</g>
+<!-- n00000081&#45;&gt;n0000000d -->
+<g id="edge4" class="edge">
+<title>n00000081:port4&#45;&gt;n0000000d</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M1003.38,-700.26C1003.38,-700.26 916.62,-689.8 909.08,-697.08 880.2,-725.01 885.68,-754.82 909.08,-787.48 910.88,-789.99 918.96,-793.59 929.7,-797.47"/>
+<polygon fill="black" stroke="black" points="928.69,-800.82 939.28,-800.79 930.98,-794.21 928.69,-800.82"/>
+</g>
+<!-- n00000081&#45;&gt;n00000011 -->
+<g id="edge5" class="edge">
+<title>n00000081:port5&#45;&gt;n00000011</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M1029.19,-700.26C1029.19,-700.26 1115.28,-690.56 1123.48,-697.08 1198.37,-756.64 1190.55,-886.51 1182.64,-944.71"/>
+<polygon fill="black" stroke="black" points="1179.16,-944.31 1181.18,-954.71 1186.09,-945.32 1179.16,-944.31"/>
+</g>
+<!-- n00000081&#45;&gt;n00000015 -->
+<g id="edge6" class="edge">
+<title>n00000081:port6&#45;&gt;n00000015</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M1055.18,-700.28C1055.18,-700.28 915.57,-692.2 909.08,-697.08 834.02,-753.51 831.79,-879.34 835.06,-936.56"/>
+<polygon fill="black" stroke="black" points="831.58,-936.99 835.74,-946.73 838.56,-936.52 831.58,-936.99"/>
+</g>
+<!-- n00000081&#45;&gt;n00000019 -->
+<g id="edge7" class="edge">
+<title>n00000081:port7&#45;&gt;n00000019</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M1081.28,-700.28C1081.28,-700.28 916.04,-696.54 912.32,-693.67 864.52,-656.73 856.3,-580.22 855.62,-538.2"/>
+<polygon fill="black" stroke="black" points="859.11,-538.05 855.59,-528.06 852.11,-538.07 859.11,-538.05"/>
+</g>
+<!-- n00000081&#45;&gt;n0000001d -->
+<g id="edge8" class="edge">
+<title>n00000081:port8&#45;&gt;n0000001d</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M1107.28,-700.28C1107.28,-700.28 1119.29,-696.23 1121.72,-693.67 1159.76,-653.62 1177.38,-589.6 1184.78,-552.46"/>
+<polygon fill="black" stroke="black" points="1188.29,-552.76 1186.69,-542.29 1181.41,-551.47 1188.29,-552.76"/>
+</g>
+<!-- n0000008b -->
+<g id="node34" class="node">
+<title>n0000008b</title>
+<path fill="green" stroke="black" d="M293.1,-532.08C293.1,-532.08 477.1,-532.08 477.1,-532.08 483.1,-532.08 489.1,-538.08 489.1,-544.08 489.1,-544.08 489.1,-604.08 489.1,-604.08 489.1,-610.08 483.1,-616.08 477.1,-616.08 477.1,-616.08 293.1,-616.08 293.1,-616.08 287.1,-616.08 281.1,-610.08 281.1,-604.08 281.1,-604.08 281.1,-544.08 281.1,-544.08 281.1,-538.08 287.1,-532.08 293.1,-532.08"/>
+<text text-anchor="middle" x="385.1" y="-600.88" font-family="Times,serif" font-size="14.00">0</text>
+<polyline fill="none" stroke="black" points="281.1,-593.08 489.1,-593.08 "/>
+<text text-anchor="middle" x="385.1" y="-577.88" font-family="Times,serif" font-size="14.00">Intel IPU6 CSI2 1</text>
+<text text-anchor="middle" x="385.1" y="-562.88" font-family="Times,serif" font-size="14.00">/dev/v4l&#45;subdev1</text>
+<polyline fill="none" stroke="black" points="281.1,-555.08 489.1,-555.08 "/>
+<text text-anchor="middle" x="294.1" y="-539.88" font-family="Times,serif" font-size="14.00">1</text>
+<polyline fill="none" stroke="black" points="307.1,-532.08 307.1,-555.08 "/>
+<text text-anchor="middle" x="320.1" y="-539.88" font-family="Times,serif" font-size="14.00">2</text>
+<polyline fill="none" stroke="black" points="333.1,-532.08 333.1,-555.08 "/>
+<text text-anchor="middle" x="346.1" y="-539.88" font-family="Times,serif" font-size="14.00">3</text>
+<polyline fill="none" stroke="black" points="359.1,-532.08 359.1,-555.08 "/>
+<text text-anchor="middle" x="372.1" y="-539.88" font-family="Times,serif" font-size="14.00">4</text>
+<polyline fill="none" stroke="black" points="385.1,-532.08 385.1,-555.08 "/>
+<text text-anchor="middle" x="398.1" y="-539.88" font-family="Times,serif" font-size="14.00">5</text>
+<polyline fill="none" stroke="black" points="411.1,-532.08 411.1,-555.08 "/>
+<text text-anchor="middle" x="424.1" y="-539.88" font-family="Times,serif" font-size="14.00">6</text>
+<polyline fill="none" stroke="black" points="437.1,-532.08 437.1,-555.08 "/>
+<text text-anchor="middle" x="450.1" y="-539.88" font-family="Times,serif" font-size="14.00">7</text>
+<polyline fill="none" stroke="black" points="463.1,-532.08 463.1,-555.08 "/>
+<text text-anchor="middle" x="476.1" y="-539.88" font-family="Times,serif" font-size="14.00">8</text>
+</g>
+<!-- n0000008b&#45;&gt;n00000021 -->
+<g id="edge9" class="edge">
+<title>n0000008b:port1&#45;&gt;n00000021</title>
+<path fill="none" stroke="black" d="M281.1,-543.08C281.1,-543.08 240.1,-560.51 205.94,-570.26 205.35,-570.43 204.77,-570.59 204.18,-570.76"/>
+<polygon fill="black" stroke="black" points="203.2,-567.39 194.47,-573.39 205.03,-574.15 203.2,-567.39"/>
+</g>
+<!-- n0000008b&#45;&gt;n00000025 -->
+<g id="edge10" class="edge">
+<title>n0000008b:port2&#45;&gt;n00000025</title>
+<path fill="none" stroke="black" d="M320.2,-532.07C320.2,-532.07 456.9,-514.37 492.3,-528.88 528.42,-543.68 522.86,-571.78 556.11,-594.53"/>
+<polygon fill="black" stroke="black" points="554.54,-597.67 564.9,-599.88 558.18,-591.69 554.54,-597.67"/>
+</g>
+<!-- n0000008b&#45;&gt;n00000029 -->
+<g id="edge11" class="edge">
+<title>n0000008b:port3&#45;&gt;n00000029</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M346.1,-532.08C346.1,-532.08 333.93,-527.96 318.37,-522.71"/>
+<polygon fill="black" stroke="black" points="319.48,-519.39 308.88,-519.5 317.24,-526.02 319.48,-519.39"/>
+</g>
+<!-- n0000008b&#45;&gt;n0000002d -->
+<g id="edge12" class="edge">
+<title>n0000008b:port4&#45;&gt;n0000002d</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M372.19,-532.05C372.19,-532.05 292.97,-514.3 277.9,-528.88 249.01,-556.8 253.16,-587.62 277.9,-619.28 278.34,-619.85 280.33,-620.69 283.45,-621.71"/>
+<polygon fill="black" stroke="black" points="282.71,-625.14 293.29,-624.58 284.67,-618.42 282.71,-625.14"/>
+</g>
+<!-- n0000008b&#45;&gt;n00000031 -->
+<g id="edge13" class="edge">
+<title>n0000008b:port5&#45;&gt;n00000031</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M398,-532.05C398,-532.05 476.28,-515.34 492.3,-528.88 568.49,-593.29 550.55,-729.67 538.14,-789.41"/>
+<polygon fill="black" stroke="black" points="534.69,-788.79 535.99,-799.31 541.53,-790.28 534.69,-788.79"/>
+</g>
+<!-- n0000008b&#45;&gt;n00000035 -->
+<g id="edge14" class="edge">
+<title>n0000008b:port6&#45;&gt;n00000035</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M424,-532.07C424,-532.07 290.37,-518.48 277.9,-528.88 202.27,-591.86 215.34,-725.69 225.66,-785.15"/>
+<polygon fill="black" stroke="black" points="222.29,-786.14 227.54,-795.35 229.17,-784.88 222.29,-786.14"/>
+</g>
+<!-- n0000008b&#45;&gt;n00000039 -->
+<g id="edge15" class="edge">
+<title>n0000008b:port7&#45;&gt;n00000039</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M450.1,-532.08C450.1,-532.08 395.22,-528.13 383.45,-518.65 375.46,-512.21 322.64,-385.46 298.76,-327.47"/>
+<polygon fill="black" stroke="black" points="301.96,-326.05 294.92,-318.14 295.49,-328.72 301.96,-326.05"/>
+</g>
+<!-- n0000008b&#45;&gt;n0000003d -->
+<g id="edge16" class="edge">
+<title>n0000008b:port8&#45;&gt;n0000003d</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M476.1,-532.08C476.1,-532.08 522.37,-522.39 526.85,-518.65 563.15,-488.33 581.38,-434.52 589.6,-401.2"/>
+<polygon fill="black" stroke="black" points="593.08,-401.69 591.93,-391.16 586.26,-400.11 593.08,-401.69"/>
+</g>
+<!-- n00000095 -->
+<g id="node35" class="node">
+<title>n00000095</title>
+<path fill="green" stroke="black" d="M301.38,-1180.11C301.38,-1180.11 485.38,-1180.11 485.38,-1180.11 491.38,-1180.11 497.38,-1186.11 497.38,-1192.11 497.38,-1192.11 497.38,-1252.11 497.38,-1252.11 497.38,-1258.11 491.38,-1264.11 485.38,-1264.11 485.38,-1264.11 301.38,-1264.11 301.38,-1264.11 295.38,-1264.11 289.38,-1258.11 289.38,-1252.11 289.38,-1252.11 289.38,-1192.11 289.38,-1192.11 289.38,-1186.11 295.38,-1180.11 301.38,-1180.11"/>
+<text text-anchor="middle" x="393.38" y="-1248.91" font-family="Times,serif" font-size="14.00">0</text>
+<polyline fill="none" stroke="black" points="289.38,-1241.11 497.38,-1241.11 "/>
+<text text-anchor="middle" x="393.38" y="-1225.91" font-family="Times,serif" font-size="14.00">Intel IPU6 CSI2 2</text>
+<text text-anchor="middle" x="393.38" y="-1210.91" font-family="Times,serif" font-size="14.00">/dev/v4l&#45;subdev2</text>
+<polyline fill="none" stroke="black" points="289.38,-1203.11 497.38,-1203.11 "/>
+<text text-anchor="middle" x="302.38" y="-1187.91" font-family="Times,serif" font-size="14.00">1</text>
+<polyline fill="none" stroke="black" points="315.38,-1180.11 315.38,-1203.11 "/>
+<text text-anchor="middle" x="328.38" y="-1187.91" font-family="Times,serif" font-size="14.00">2</text>
+<polyline fill="none" stroke="black" points="341.38,-1180.11 341.38,-1203.11 "/>
+<text text-anchor="middle" x="354.38" y="-1187.91" font-family="Times,serif" font-size="14.00">3</text>
+<polyline fill="none" stroke="black" points="367.38,-1180.11 367.38,-1203.11 "/>
+<text text-anchor="middle" x="380.38" y="-1187.91" font-family="Times,serif" font-size="14.00">4</text>
+<polyline fill="none" stroke="black" points="393.38,-1180.11 393.38,-1203.11 "/>
+<text text-anchor="middle" x="406.38" y="-1187.91" font-family="Times,serif" font-size="14.00">5</text>
+<polyline fill="none" stroke="black" points="419.38,-1180.11 419.38,-1203.11 "/>
+<text text-anchor="middle" x="432.38" y="-1187.91" font-family="Times,serif" font-size="14.00">6</text>
+<polyline fill="none" stroke="black" points="445.38,-1180.11 445.38,-1203.11 "/>
+<text text-anchor="middle" x="458.38" y="-1187.91" font-family="Times,serif" font-size="14.00">7</text>
+<polyline fill="none" stroke="black" points="471.38,-1180.11 471.38,-1203.11 "/>
+<text text-anchor="middle" x="484.38" y="-1187.91" font-family="Times,serif" font-size="14.00">8</text>
+</g>
+<!-- n00000095&#45;&gt;n00000041 -->
+<g id="edge17" class="edge">
+<title>n00000095:port1&#45;&gt;n00000041</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M289.38,-1191.11C289.38,-1191.11 258.94,-1194.22 222.89,-1197.91"/>
+<polygon fill="black" stroke="black" points="222.19,-1194.46 212.6,-1198.96 222.9,-1201.42 222.19,-1194.46"/>
+</g>
+<!-- n00000095&#45;&gt;n00000045 -->
+<g id="edge18" class="edge">
+<title>n00000095:port2&#45;&gt;n00000045</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M328.48,-1180.11C328.48,-1180.11 463.26,-1168.53 500.58,-1176.91 534.02,-1184.43 537.24,-1200.06 569.66,-1211.18 569.76,-1211.22 569.86,-1211.25 569.96,-1211.29"/>
+<polygon fill="black" stroke="black" points="568.86,-1214.61 579.45,-1214.34 571,-1207.95 568.86,-1214.61"/>
+</g>
+<!-- n00000095&#45;&gt;n00000049 -->
+<g id="edge19" class="edge">
+<title>n00000095:port3&#45;&gt;n00000049</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M354.38,-1180.11C354.38,-1180.11 356.8,-1178.46 360.49,-1175.94"/>
+<polygon fill="black" stroke="black" points="362.56,-1178.77 368.86,-1170.24 358.62,-1172.98 362.56,-1178.77"/>
+</g>
+<!-- n00000095&#45;&gt;n0000004d -->
+<g id="edge20" class="edge">
+<title>n00000095:port4&#45;&gt;n0000004d</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M380.47,-1180.09C380.47,-1180.09 293.71,-1169.63 286.18,-1176.91 257.29,-1204.84 262.63,-1234.76 286.18,-1267.31 288.16,-1270.05 297.33,-1273.96 309.38,-1278.13"/>
+<polygon fill="black" stroke="black" points="308.49,-1281.53 319.09,-1281.36 310.7,-1274.88 308.49,-1281.53"/>
+</g>
+<!-- n00000095&#45;&gt;n00000051 -->
+<g id="edge21" class="edge">
+<title>n00000095:port5&#45;&gt;n00000051</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M406.28,-1180.09C406.28,-1180.09 492.13,-1170.7 500.58,-1176.91 576.41,-1232.66 579.83,-1358.79 577.09,-1416.2"/>
+<polygon fill="black" stroke="black" points="573.59,-1416.23 576.51,-1426.41 580.58,-1416.63 573.59,-1416.23"/>
+</g>
+<!-- n00000095&#45;&gt;n00000055 -->
+<g id="edge22" class="edge">
+<title>n00000095:port6&#45;&gt;n00000055</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M432.28,-1180.11C432.28,-1180.11 292.85,-1172.29 286.18,-1176.91 211.26,-1228.86 198.3,-1348.49 196.45,-1404.12"/>
+<polygon fill="black" stroke="black" points="192.94,-1404.28 196.21,-1414.36 199.94,-1404.44 192.94,-1404.28"/>
+</g>
+<!-- n00000095&#45;&gt;n00000059 -->
+<g id="edge23" class="edge">
+<title>n00000095:port7&#45;&gt;n00000059</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M458.38,-1180.11C458.38,-1180.11 291.84,-1175.85 287.94,-1173.16 239.87,-1139.96 222.85,-1068.83 216.94,-1028.6"/>
+<polygon fill="black" stroke="black" points="220.39,-1028.06 215.6,-1018.61 213.46,-1028.98 220.39,-1028.06"/>
+</g>
+<!-- n00000095&#45;&gt;n0000005d -->
+<g id="edge24" class="edge">
+<title>n00000095:port8&#45;&gt;n0000005d</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M484.38,-1180.11C484.38,-1180.11 502.45,-1176.49 506.34,-1173.16 547.25,-1138.2 569.47,-1077.38 579.62,-1041.41"/>
+<polygon fill="black" stroke="black" points="583.06,-1042.09 582.28,-1031.53 576.3,-1040.27 583.06,-1042.09"/>
+</g>
+<!-- n0000009f -->
+<g id="node36" class="node">
+<title>n0000009f</title>
+<path fill="green" stroke="black" d="M1211.38,-200.11C1211.38,-200.11 1395.38,-200.11 1395.38,-200.11 1401.38,-200.11 1407.38,-206.11 1407.38,-212.11 1407.38,-212.11 1407.38,-272.11 1407.38,-272.11 1407.38,-278.11 1401.38,-284.11 1395.38,-284.11 1395.38,-284.11 1211.38,-284.11 1211.38,-284.11 1205.38,-284.11 1199.38,-278.11 1199.38,-272.11 1199.38,-272.11 1199.38,-212.11 1199.38,-212.11 1199.38,-206.11 1205.38,-200.11 1211.38,-200.11"/>
+<text text-anchor="middle" x="1303.38" y="-268.91" font-family="Times,serif" font-size="14.00">0</text>
+<polyline fill="none" stroke="black" points="1199.38,-261.11 1407.38,-261.11 "/>
+<text text-anchor="middle" x="1303.38" y="-245.91" font-family="Times,serif" font-size="14.00">Intel IPU6 CSI2 3</text>
+<text text-anchor="middle" x="1303.38" y="-230.91" font-family="Times,serif" font-size="14.00">/dev/v4l&#45;subdev3</text>
+<polyline fill="none" stroke="black" points="1199.38,-223.11 1407.38,-223.11 "/>
+<text text-anchor="middle" x="1212.38" y="-207.91" font-family="Times,serif" font-size="14.00">1</text>
+<polyline fill="none" stroke="black" points="1225.38,-200.11 1225.38,-223.11 "/>
+<text text-anchor="middle" x="1238.38" y="-207.91" font-family="Times,serif" font-size="14.00">2</text>
+<polyline fill="none" stroke="black" points="1251.38,-200.11 1251.38,-223.11 "/>
+<text text-anchor="middle" x="1264.38" y="-207.91" font-family="Times,serif" font-size="14.00">3</text>
+<polyline fill="none" stroke="black" points="1277.38,-200.11 1277.38,-223.11 "/>
+<text text-anchor="middle" x="1290.38" y="-207.91" font-family="Times,serif" font-size="14.00">4</text>
+<polyline fill="none" stroke="black" points="1303.38,-200.11 1303.38,-223.11 "/>
+<text text-anchor="middle" x="1316.38" y="-207.91" font-family="Times,serif" font-size="14.00">5</text>
+<polyline fill="none" stroke="black" points="1329.38,-200.11 1329.38,-223.11 "/>
+<text text-anchor="middle" x="1342.38" y="-207.91" font-family="Times,serif" font-size="14.00">6</text>
+<polyline fill="none" stroke="black" points="1355.38,-200.11 1355.38,-223.11 "/>
+<text text-anchor="middle" x="1368.38" y="-207.91" font-family="Times,serif" font-size="14.00">7</text>
+<polyline fill="none" stroke="black" points="1381.38,-200.11 1381.38,-223.11 "/>
+<text text-anchor="middle" x="1394.38" y="-207.91" font-family="Times,serif" font-size="14.00">8</text>
+</g>
+<!-- n0000009f&#45;&gt;n00000061 -->
+<g id="edge25" class="edge">
+<title>n0000009f:port1&#45;&gt;n00000061</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M1199.38,-211.11C1199.38,-211.11 1168.94,-214.22 1132.89,-217.91"/>
+<polygon fill="black" stroke="black" points="1132.19,-214.46 1122.6,-218.96 1132.9,-221.42 1132.19,-214.46"/>
+</g>
+<!-- n0000009f&#45;&gt;n00000065 -->
+<g id="edge26" class="edge">
+<title>n0000009f:port2&#45;&gt;n00000065</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M1238.48,-200.11C1238.48,-200.11 1373.26,-188.53 1410.58,-196.91 1444.02,-204.43 1447.24,-220.06 1479.66,-231.18 1479.76,-231.22 1479.86,-231.25 1479.96,-231.29"/>
+<polygon fill="black" stroke="black" points="1478.86,-234.61 1489.45,-234.34 1481,-227.95 1478.86,-234.61"/>
+</g>
+<!-- n0000009f&#45;&gt;n00000069 -->
+<g id="edge27" class="edge">
+<title>n0000009f:port3&#45;&gt;n00000069</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M1264.38,-200.11C1264.38,-200.11 1266.8,-198.46 1270.49,-195.94"/>
+<polygon fill="black" stroke="black" points="1272.56,-198.77 1278.86,-190.24 1268.62,-192.98 1272.56,-198.77"/>
+</g>
+<!-- n0000009f&#45;&gt;n0000006d -->
+<g id="edge28" class="edge">
+<title>n0000009f:port4&#45;&gt;n0000006d</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M1290.47,-200.09C1290.47,-200.09 1203.71,-189.63 1196.18,-196.91 1167.29,-224.84 1172.63,-254.76 1196.18,-287.31 1198.16,-290.05 1207.33,-293.96 1219.38,-298.13"/>
+<polygon fill="black" stroke="black" points="1218.49,-301.53 1229.09,-301.36 1220.7,-294.88 1218.49,-301.53"/>
+</g>
+<!-- n0000009f&#45;&gt;n00000071 -->
+<g id="edge29" class="edge">
+<title>n0000009f:port5&#45;&gt;n00000071</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M1316.28,-200.09C1316.28,-200.09 1402.13,-190.7 1410.58,-196.91 1486.41,-252.66 1489.83,-378.79 1487.09,-436.2"/>
+<polygon fill="black" stroke="black" points="1483.59,-436.23 1486.51,-446.41 1490.58,-436.63 1483.59,-436.23"/>
+</g>
+<!-- n0000009f&#45;&gt;n00000075 -->
+<g id="edge30" class="edge">
+<title>n0000009f:port6&#45;&gt;n00000075</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M1342.28,-200.11C1342.28,-200.11 1202.85,-192.29 1196.18,-196.91 1121.26,-248.86 1108.3,-368.49 1106.45,-424.12"/>
+<polygon fill="black" stroke="black" points="1102.94,-424.28 1106.21,-434.36 1109.94,-424.44 1102.94,-424.28"/>
+</g>
+<!-- n0000009f&#45;&gt;n00000079 -->
+<g id="edge31" class="edge">
+<title>n0000009f:port7&#45;&gt;n00000079</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M1368.38,-200.11C1368.38,-200.11 1201.84,-195.85 1197.94,-193.16 1149.87,-159.96 1132.85,-88.83 1126.94,-48.6"/>
+<polygon fill="black" stroke="black" points="1130.39,-48.06 1125.6,-38.61 1123.46,-48.98 1130.39,-48.06"/>
+</g>
+<!-- n0000009f&#45;&gt;n0000007d -->
+<g id="edge32" class="edge">
+<title>n0000009f:port8&#45;&gt;n0000007d</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M1394.38,-200.11C1394.38,-200.11 1412.45,-196.49 1416.34,-193.16 1457.25,-158.2 1479.47,-97.38 1489.62,-61.41"/>
+<polygon fill="black" stroke="black" points="1493.06,-62.09 1492.28,-51.53 1486.3,-60.27 1493.06,-62.09"/>
+</g>
+<!-- n000000e9 -->
+<g id="node37" class="node">
+<title>n000000e9</title>
+<path fill="green" stroke="black" d="M398.65,-431.45C398.65,-431.45 511.65,-431.45 511.65,-431.45 517.65,-431.45 523.65,-437.45 523.65,-443.45 523.65,-443.45 523.65,-503.45 523.65,-503.45 523.65,-509.45 517.65,-515.45 511.65,-515.45 511.65,-515.45 398.65,-515.45 398.65,-515.45 392.65,-515.45 386.65,-509.45 386.65,-503.45 386.65,-503.45 386.65,-443.45 386.65,-443.45 386.65,-437.45 392.65,-431.45 398.65,-431.45"/>
+<text text-anchor="middle" x="420.65" y="-500.25" font-family="Times,serif" font-size="14.00">1</text>
+<polyline fill="none" stroke="black" points="454.65,-492.45 454.65,-515.45 "/>
+<text text-anchor="middle" x="489.15" y="-500.25" font-family="Times,serif" font-size="14.00">2</text>
+<polyline fill="none" stroke="black" points="386.65,-492.45 523.65,-492.45 "/>
+<text text-anchor="middle" x="455.15" y="-477.25" font-family="Times,serif" font-size="14.00">ov2740 4&#45;0036</text>
+<text text-anchor="middle" x="455.15" y="-462.25" font-family="Times,serif" font-size="14.00">/dev/v4l&#45;subdev4</text>
+<polyline fill="none" stroke="black" points="386.65,-454.45 523.65,-454.45 "/>
+<text text-anchor="middle" x="455.15" y="-439.25" font-family="Times,serif" font-size="14.00">0</text>
+</g>
+<!-- n000000e9&#45;&gt;n0000008b -->
+<g id="edge33" class="edge">
+<title>n000000e9:port0&#45;&gt;n0000008b:port0</title>
+<path fill="none" stroke="black" stroke-width="2" d="M386.14,-442.55C386.14,-442.55 361.11,-493.23 383.45,-518.65 391.47,-527.78 484.31,-519.72 492.3,-528.88 508.64,-547.6 499.26,-579.87 493.12,-595.68"/>
+<polygon fill="black" stroke="black" stroke-width="2" points="489.86,-594.41 489.11,-604.98 496.29,-597.19 489.86,-594.41"/>
+</g>
+</g>
+</svg>
diff --git a/Documentation/admin-guide/media/v4l-drivers.rst b/Documentation/admin-guide/media/v4l-drivers.rst
index f4bb2605f07e..4120eded9a13 100644
--- a/Documentation/admin-guide/media/v4l-drivers.rst
+++ b/Documentation/admin-guide/media/v4l-drivers.rst
@@ -16,6 +16,7 @@ Video4Linux (V4L) driver-specific documentation
 	imx
 	imx7
 	ipu3
+	ipu6-isys
 	ivtv
 	mgb4
 	omap3isp
-- 
2.39.2


