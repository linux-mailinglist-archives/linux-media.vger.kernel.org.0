Return-Path: <linux-media+bounces-3508-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 419EE82A7D5
	for <lists+linux-media@lfdr.de>; Thu, 11 Jan 2024 07:47:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ACD48B21072
	for <lists+linux-media@lfdr.de>; Thu, 11 Jan 2024 06:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8EC646BC;
	Thu, 11 Jan 2024 06:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CB7h3Dbc"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294C35672
	for <linux-media@vger.kernel.org>; Thu, 11 Jan 2024 06:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704955626; x=1736491626;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9P1Nu6asS2B7HUvvY5KCXJwm6dJesUD9xHYIGYRExuM=;
  b=CB7h3DbcA61kvytFv/9NBrr5FKgTk6CBQINPPjpfKf2pJyJCqHFpUZtK
   J6aQUfzCo4RxrCNwoTSKCSSlanmMeNmLZT0vyjHEfbNhH5q2jMxpON968
   4604PLGt9HwGrf73I/A79xUdg8vsGzD8JeGZFyz4ll4m6TmZQP4M9n0fm
   vC0EnK9DJ4kqhB8JcmkPVIOy+1W0PSfoWJhbpMFAPeWqM3KgOStQorjYF
   PpJKsFwMAl88LlB+JDiQo6RVu4LXLhPpuHdbLFHn1kF4TXAsIjU6MoVtu
   gxJkm0jax1xD7GPz4vO2NrAa8ycEHS7dra9OraFtFVwYsYFYjgIkh597Z
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="397629216"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; 
   d="scan'208";a="397629216"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2024 22:47:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="775515692"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; 
   d="scan'208";a="775515692"
Received: from icg-kernel3.bj.intel.com ([172.16.126.107])
  by orsmga007.jf.intel.com with ESMTP; 10 Jan 2024 22:47:01 -0800
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	andriy.shevchenko@linux.intel.com,
	hdegoede@redhat.com
Cc: ilpo.jarvinen@linux.intel.com,
	claus.stovgaard@gmail.com,
	tomi.valkeinen@ideasonboard.com,
	tfiga@chromium.org,
	senozhatsky@chromium.org,
	andreaskleist@gmail.com,
	bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	hongju.wang@intel.com
Subject: [PATCH v3 14/17] Documentation: add Intel IPU6 ISYS driver admin-guide doc
Date: Thu, 11 Jan 2024 14:55:28 +0800
Message-ID: <20240111065531.2418836-15-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240111065531.2418836-1-bingbu.cao@intel.com>
References: <20240111065531.2418836-1-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bingbu Cao <bingbu.cao@intel.com>

This document mainly describe the functionality of IPU6 and
IPU6 isys driver, and gives an example that how user can do
imaging capture with tools.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 Documentation/admin-guide/media/ipu6-isys.rst | 158 ++++++++++++++++
 .../admin-guide/media/ipu6_isys_graph.svg     | 174 ++++++++++++++++++
 .../admin-guide/media/v4l-drivers.rst         |   1 +
 3 files changed, 333 insertions(+)
 create mode 100644 Documentation/admin-guide/media/ipu6-isys.rst
 create mode 100644 Documentation/admin-guide/media/ipu6_isys_graph.svg

diff --git a/Documentation/admin-guide/media/ipu6-isys.rst b/Documentation/admin-guide/media/ipu6-isys.rst
new file mode 100644
index 000000000000..5e78ab88c649
--- /dev/null
+++ b/Documentation/admin-guide/media/ipu6-isys.rst
@@ -0,0 +1,158 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: <isonum.txt>
+
+========================================================
+Intel Image Processing Unit 6 (IPU6) Input System driver
+========================================================
+
+Copyright |copy| 2023 Intel Corporation
+
+Introduction
+============
+
+This file documents the Intel IPU6 (6th generation Image Processing Unit)
+Input System (MIPI CSI2 receiver) drivers located under
+drivers/media/pci/intel/ipu6.
+
+The Intel IPU6 can be found in certain Intel Chipsets but not in all SKUs:
+
+* TigerLake
+* JasperLake
+* AlderLake
+* RaptorLake
+* MeteorLake
+
+Intel IPU6 is made up of two components - Input System (ISYS) and Processing
+System (PSYS).
+
+The Input System mainly works as MIPI CSI2 receiver which receives and
+processes the imaging data from the sensors and outputs the frames to memory.
+
+There are 2 driver modules - intel_ipu6 and intel_ipu6_isys. intel_ipu6 is an
+IPU6 common driver which does PCI configuration, firmware loading and parsing,
+firmware authentication, DMA mapping and IPU-MMU (internal Memory mapping Unit)
+configuration. intel_ipu6_isys implements V4L2, Media Controller and V4L2
+sub-device interfaces. The IPU6 ISYS driver supports camera sensors connected
+to the IPU6 ISYS through V4L2 sub-device sensor drivers.
+
+.. Note:: See Documentation/driver-api/media/drivers/ipu6.rst for more
+	  information about the IPU6 hardware.
+
+
+Input system driver
+===================
+
+The input System driver mainly configures CSI2 DPHY, constructs the firmware
+stream configuration, sends commands to firmware, gets response from hardware
+and firmware and then returns buffers to user.
+The ISYS is represented as several V4L2 sub-devices - 'Intel IPU6 CSI2 $port',
+which provide V4L2 subdev interfaces to the user space, there are also several
+video nodes for each CSI-2 stream capture - 'Intel IPU6 ISYS capture $num' which
+provide interface to user to set formats, queue buffers and streaming.
+
+.. kernel-figure::  ipu6_isys_graph.svg
+   :alt: ipu6 isys media graph with multiple streams support
+
+   ipu6 isys media graph with multiple streams support
+
+Capturing frames by IPU6 ISYS
+-----------------------------
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
+Here is an example of IPU6 ISYS raw capture on Dell XPS 9315 laptop. On this
+machine, ov01a10 sensor is connected to IPU ISYS CSI2 port 2, which can
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
+          -f SBGGR10 $(media-ctl -d $MDEV -e "Intel IPU6 ISYS Capture 0")
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
+    -f SGRBG10 ${CAPTURE_DEV}
+
+    CAPTURE_META=$(media-ctl -e "Intel IPU6 ISYS Capture 1")
+    ./yavta --data-prefix -c100 -n5 -I -s97x1 -B meta-capture \
+    --file=/tmp/meta-#.bin -f GENERIC_8 ${CAPTURE_META}
+
+References
+==========
+
+.. [#f1] https://git.ideasonboard.org/?p=media-ctl.git;a=summary
+.. [#f2] https://git.ideasonboard.org/yavta.git
diff --git a/Documentation/admin-guide/media/ipu6_isys_graph.svg b/Documentation/admin-guide/media/ipu6_isys_graph.svg
new file mode 100644
index 000000000000..707747c75280
--- /dev/null
+++ b/Documentation/admin-guide/media/ipu6_isys_graph.svg
@@ -0,0 +1,174 @@
+<?xml version="1.0" encoding="UTF-8" standalone="no"?>
+<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN"
+ "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
+<!-- Generated by graphviz version 2.38.0 (20140413.2041)
+ -->
+<!-- Title: board Pages: 1 -->
+<svg width="559pt" height="810pt"
+ viewBox="0.00 0.00 559.00 809.50" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
+<g id="graph0" class="graph" transform="scale(1 1) rotate(0) translate(4 805.5)">
+<title>board</title>
+<polygon fill="white" stroke="none" points="-4,4 -4,-805.5 555,-805.5 555,4 -4,4"/>
+<!-- n00000001 -->
+<g id="node1" class="node"><title>n00000001</title>
+<polygon fill="#66cd00" stroke="black" points="551,-192.5 387,-192.5 387,-154.5 551,-154.5 551,-192.5"/>
+<text text-anchor="middle" x="469" y="-177.3" font-family="Times,serif" font-size="14.00">Intel IPU6 ISYS Capture 0</text>
+<text text-anchor="middle" x="469" y="-162.3" font-family="Times,serif" font-size="14.00">/dev/video0</text>
+</g>
+<!-- n00000002 -->
+<g id="node2" class="node"><title>n00000002</title>
+<polygon fill="#66cd00" stroke="black" points="551,-395.5 387,-395.5 387,-357.5 551,-357.5 551,-395.5"/>
+<text text-anchor="middle" x="469" y="-380.3" font-family="Times,serif" font-size="14.00">Intel IPU6 ISYS Capture 1</text>
+<text text-anchor="middle" x="469" y="-365.3" font-family="Times,serif" font-size="14.00">/dev/video1</text>
+</g>
+<!-- n00000003 -->
+<g id="node3" class="node"><title>n00000003</title>
+<polygon fill="#66cd00" stroke="black" points="551,-598.5 387,-598.5 387,-560.5 551,-560.5 551,-598.5"/>
+<text text-anchor="middle" x="469" y="-583.3" font-family="Times,serif" font-size="14.00">Intel IPU6 ISYS Capture 2</text>
+<text text-anchor="middle" x="469" y="-568.3" font-family="Times,serif" font-size="14.00">/dev/video2</text>
+</g>
+<!-- n00000004 -->
+<g id="node4" class="node"><title>n00000004</title>
+<polygon fill="#66cd00" stroke="black" points="551,-801.5 387,-801.5 387,-763.5 551,-763.5 551,-801.5"/>
+<text text-anchor="middle" x="469" y="-786.3" font-family="Times,serif" font-size="14.00">Intel IPU6 ISYS Capture 3</text>
+<text text-anchor="middle" x="469" y="-771.3" font-family="Times,serif" font-size="14.00">/dev/video3</text>
+</g>
+<!-- n0000007d -->
+<g id="node5" class="node"><title>n0000007d</title>
+<path fill="#ffb90f" stroke="black" d="M201,-0.5C201,-0.5 339,-0.5 339,-0.5 345,-0.5 351,-6.5 351,-12.5 351,-12.5 351,-172.5 351,-172.5 351,-178.5 345,-184.5 339,-184.5 339,-184.5 201,-184.5 201,-184.5 195,-184.5 189,-178.5 189,-172.5 189,-172.5 189,-12.5 189,-12.5 189,-6.5 195,-0.5 201,-0.5"/>
+<text text-anchor="middle" x="200.5" y="-88.8" font-family="Times,serif" font-size="14.00">0</text>
+<polyline fill="none" stroke="black" points="212,-0.5 212,-184.5 "/>
+<text text-anchor="middle" x="270" y="-96.3" font-family="Times,serif" font-size="14.00">Intel IPU6 CSI2 0</text>
+<text text-anchor="middle" x="270" y="-81.3" font-family="Times,serif" font-size="14.00">/dev/v4l&#45;subdev0</text>
+<polyline fill="none" stroke="black" points="328,-0.5 328,-184.5 "/>
+<text text-anchor="middle" x="339.5" y="-169.3" font-family="Times,serif" font-size="14.00">1</text>
+<polyline fill="none" stroke="black" points="328,-161.5 351,-161.5 "/>
+<text text-anchor="middle" x="339.5" y="-146.3" font-family="Times,serif" font-size="14.00">2</text>
+<polyline fill="none" stroke="black" points="328,-138.5 351,-138.5 "/>
+<text text-anchor="middle" x="339.5" y="-123.3" font-family="Times,serif" font-size="14.00">3</text>
+<polyline fill="none" stroke="black" points="328,-115.5 351,-115.5 "/>
+<text text-anchor="middle" x="339.5" y="-100.3" font-family="Times,serif" font-size="14.00">4</text>
+<polyline fill="none" stroke="black" points="328,-92.5 351,-92.5 "/>
+<text text-anchor="middle" x="339.5" y="-77.3" font-family="Times,serif" font-size="14.00">5</text>
+<polyline fill="none" stroke="black" points="328,-69.5 351,-69.5 "/>
+<text text-anchor="middle" x="339.5" y="-54.3" font-family="Times,serif" font-size="14.00">6</text>
+<polyline fill="none" stroke="black" points="328,-46.5 351,-46.5 "/>
+<text text-anchor="middle" x="339.5" y="-31.3" font-family="Times,serif" font-size="14.00">7</text>
+<polyline fill="none" stroke="black" points="328,-23.5 351,-23.5 "/>
+<text text-anchor="middle" x="339.5" y="-8.3" font-family="Times,serif" font-size="14.00">8</text>
+</g>
+<!-- n0000007d&#45;&gt;n00000001 -->
+<g id="edge1" class="edge"><title>n0000007d:port1&#45;&gt;n00000001</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M351,-173.5C359.322,-173.5 367.976,-173.5 376.644,-173.5"/>
+<polygon fill="black" stroke="black" points="376.807,-177 386.807,-173.5 376.807,-170 376.807,-177"/>
+</g>
+<!-- n00000087 -->
+<g id="node6" class="node"><title>n00000087</title>
+<path fill="#ffb90f" stroke="black" d="M201,-203.5C201,-203.5 339,-203.5 339,-203.5 345,-203.5 351,-209.5 351,-215.5 351,-215.5 351,-375.5 351,-375.5 351,-381.5 345,-387.5 339,-387.5 339,-387.5 201,-387.5 201,-387.5 195,-387.5 189,-381.5 189,-375.5 189,-375.5 189,-215.5 189,-215.5 189,-209.5 195,-203.5 201,-203.5"/>
+<text text-anchor="middle" x="200.5" y="-291.8" font-family="Times,serif" font-size="14.00">0</text>
+<polyline fill="none" stroke="black" points="212,-203.5 212,-387.5 "/>
+<text text-anchor="middle" x="270" y="-299.3" font-family="Times,serif" font-size="14.00">Intel IPU6 CSI2 1</text>
+<text text-anchor="middle" x="270" y="-284.3" font-family="Times,serif" font-size="14.00">/dev/v4l&#45;subdev1</text>
+<polyline fill="none" stroke="black" points="328,-203.5 328,-387.5 "/>
+<text text-anchor="middle" x="339.5" y="-372.3" font-family="Times,serif" font-size="14.00">1</text>
+<polyline fill="none" stroke="black" points="328,-364.5 351,-364.5 "/>
+<text text-anchor="middle" x="339.5" y="-349.3" font-family="Times,serif" font-size="14.00">2</text>
+<polyline fill="none" stroke="black" points="328,-341.5 351,-341.5 "/>
+<text text-anchor="middle" x="339.5" y="-326.3" font-family="Times,serif" font-size="14.00">3</text>
+<polyline fill="none" stroke="black" points="328,-318.5 351,-318.5 "/>
+<text text-anchor="middle" x="339.5" y="-303.3" font-family="Times,serif" font-size="14.00">4</text>
+<polyline fill="none" stroke="black" points="328,-295.5 351,-295.5 "/>
+<text text-anchor="middle" x="339.5" y="-280.3" font-family="Times,serif" font-size="14.00">5</text>
+<polyline fill="none" stroke="black" points="328,-272.5 351,-272.5 "/>
+<text text-anchor="middle" x="339.5" y="-257.3" font-family="Times,serif" font-size="14.00">6</text>
+<polyline fill="none" stroke="black" points="328,-249.5 351,-249.5 "/>
+<text text-anchor="middle" x="339.5" y="-234.3" font-family="Times,serif" font-size="14.00">7</text>
+<polyline fill="none" stroke="black" points="328,-226.5 351,-226.5 "/>
+<text text-anchor="middle" x="339.5" y="-211.3" font-family="Times,serif" font-size="14.00">8</text>
+</g>
+<!-- n00000087&#45;&gt;n00000002 -->
+<g id="edge2" class="edge"><title>n00000087:port1&#45;&gt;n00000002</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M351,-376.5C359.322,-376.5 367.976,-376.5 376.644,-376.5"/>
+<polygon fill="black" stroke="black" points="376.807,-380 386.807,-376.5 376.807,-373 376.807,-380"/>
+</g>
+<!-- n00000091 -->
+<g id="node7" class="node"><title>n00000091</title>
+<path fill="#ffb90f" stroke="black" d="M201,-406.5C201,-406.5 339,-406.5 339,-406.5 345,-406.5 351,-412.5 351,-418.5 351,-418.5 351,-578.5 351,-578.5 351,-584.5 345,-590.5 339,-590.5 339,-590.5 201,-590.5 201,-590.5 195,-590.5 189,-584.5 189,-578.5 189,-578.5 189,-418.5 189,-418.5 189,-412.5 195,-406.5 201,-406.5"/>
+<text text-anchor="middle" x="200.5" y="-494.8" font-family="Times,serif" font-size="14.00">0</text>
+<polyline fill="none" stroke="black" points="212,-406.5 212,-590.5 "/>
+<text text-anchor="middle" x="270" y="-502.3" font-family="Times,serif" font-size="14.00">Intel IPU6 CSI2 2</text>
+<text text-anchor="middle" x="270" y="-487.3" font-family="Times,serif" font-size="14.00">/dev/v4l&#45;subdev2</text>
+<polyline fill="none" stroke="black" points="328,-406.5 328,-590.5 "/>
+<text text-anchor="middle" x="339.5" y="-575.3" font-family="Times,serif" font-size="14.00">1</text>
+<polyline fill="none" stroke="black" points="328,-567.5 351,-567.5 "/>
+<text text-anchor="middle" x="339.5" y="-552.3" font-family="Times,serif" font-size="14.00">2</text>
+<polyline fill="none" stroke="black" points="328,-544.5 351,-544.5 "/>
+<text text-anchor="middle" x="339.5" y="-529.3" font-family="Times,serif" font-size="14.00">3</text>
+<polyline fill="none" stroke="black" points="328,-521.5 351,-521.5 "/>
+<text text-anchor="middle" x="339.5" y="-506.3" font-family="Times,serif" font-size="14.00">4</text>
+<polyline fill="none" stroke="black" points="328,-498.5 351,-498.5 "/>
+<text text-anchor="middle" x="339.5" y="-483.3" font-family="Times,serif" font-size="14.00">5</text>
+<polyline fill="none" stroke="black" points="328,-475.5 351,-475.5 "/>
+<text text-anchor="middle" x="339.5" y="-460.3" font-family="Times,serif" font-size="14.00">6</text>
+<polyline fill="none" stroke="black" points="328,-452.5 351,-452.5 "/>
+<text text-anchor="middle" x="339.5" y="-437.3" font-family="Times,serif" font-size="14.00">7</text>
+<polyline fill="none" stroke="black" points="328,-429.5 351,-429.5 "/>
+<text text-anchor="middle" x="339.5" y="-414.3" font-family="Times,serif" font-size="14.00">8</text>
+</g>
+<!-- n00000091&#45;&gt;n00000003 -->
+<g id="edge3" class="edge"><title>n00000091:port1&#45;&gt;n00000003</title>
+<path fill="none" stroke="black" d="M351,-579.5C359.322,-579.5 367.976,-579.5 376.644,-579.5"/>
+<polygon fill="black" stroke="black" points="376.807,-583 386.807,-579.5 376.807,-576 376.807,-583"/>
+</g>
+<!-- n0000009b -->
+<g id="node8" class="node"><title>n0000009b</title>
+<path fill="#ffb90f" stroke="black" d="M201,-609.5C201,-609.5 339,-609.5 339,-609.5 345,-609.5 351,-615.5 351,-621.5 351,-621.5 351,-781.5 351,-781.5 351,-787.5 345,-793.5 339,-793.5 339,-793.5 201,-793.5 201,-793.5 195,-793.5 189,-787.5 189,-781.5 189,-781.5 189,-621.5 189,-621.5 189,-615.5 195,-609.5 201,-609.5"/>
+<text text-anchor="middle" x="200.5" y="-697.8" font-family="Times,serif" font-size="14.00">0</text>
+<polyline fill="none" stroke="black" points="212,-609.5 212,-793.5 "/>
+<text text-anchor="middle" x="270" y="-705.3" font-family="Times,serif" font-size="14.00">Intel IPU6 CSI2 3</text>
+<text text-anchor="middle" x="270" y="-690.3" font-family="Times,serif" font-size="14.00">/dev/v4l&#45;subdev3</text>
+<polyline fill="none" stroke="black" points="328,-609.5 328,-793.5 "/>
+<text text-anchor="middle" x="339.5" y="-778.3" font-family="Times,serif" font-size="14.00">1</text>
+<polyline fill="none" stroke="black" points="328,-770.5 351,-770.5 "/>
+<text text-anchor="middle" x="339.5" y="-755.3" font-family="Times,serif" font-size="14.00">2</text>
+<polyline fill="none" stroke="black" points="328,-747.5 351,-747.5 "/>
+<text text-anchor="middle" x="339.5" y="-732.3" font-family="Times,serif" font-size="14.00">3</text>
+<polyline fill="none" stroke="black" points="328,-724.5 351,-724.5 "/>
+<text text-anchor="middle" x="339.5" y="-709.3" font-family="Times,serif" font-size="14.00">4</text>
+<polyline fill="none" stroke="black" points="328,-701.5 351,-701.5 "/>
+<text text-anchor="middle" x="339.5" y="-686.3" font-family="Times,serif" font-size="14.00">5</text>
+<polyline fill="none" stroke="black" points="328,-678.5 351,-678.5 "/>
+<text text-anchor="middle" x="339.5" y="-663.3" font-family="Times,serif" font-size="14.00">6</text>
+<polyline fill="none" stroke="black" points="328,-655.5 351,-655.5 "/>
+<text text-anchor="middle" x="339.5" y="-640.3" font-family="Times,serif" font-size="14.00">7</text>
+<polyline fill="none" stroke="black" points="328,-632.5 351,-632.5 "/>
+<text text-anchor="middle" x="339.5" y="-617.3" font-family="Times,serif" font-size="14.00">8</text>
+</g>
+<!-- n0000009b&#45;&gt;n00000004 -->
+<g id="edge4" class="edge"><title>n0000009b:port1&#45;&gt;n00000004</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M351,-782.5C359.322,-782.5 367.976,-782.5 376.644,-782.5"/>
+<polygon fill="black" stroke="black" points="376.807,-786 386.807,-782.5 376.807,-779 376.807,-786"/>
+</g>
+<!-- n00000865 -->
+<g id="node9" class="node"><title>n00000865</title>
+<path fill="cornflowerblue" stroke="black" d="M12,-479.5C12,-479.5 141,-479.5 141,-479.5 147,-479.5 153,-485.5 153,-491.5 153,-491.5 153,-505.5 153,-505.5 153,-511.5 147,-517.5 141,-517.5 141,-517.5 12,-517.5 12,-517.5 6,-517.5 0,-511.5 0,-505.5 0,-505.5 0,-491.5 0,-491.5 0,-485.5 6,-479.5 12,-479.5"/>
+<text text-anchor="middle" x="10" y="-494.8" font-family="Times,serif" font-size="14.00"> </text>
+<polyline fill="none" stroke="black" points="20,-479.5 20,-517.5 "/>
+<text text-anchor="middle" x="75" y="-502.3" font-family="Times,serif" font-size="14.00">ov01a10 3&#45;0036</text>
+<text text-anchor="middle" x="75" y="-487.3" font-family="Times,serif" font-size="14.00">/dev/v4l&#45;subdev4</text>
+<polyline fill="none" stroke="black" points="130,-479.5 130,-517.5 "/>
+<text text-anchor="middle" x="141.5" y="-494.8" font-family="Times,serif" font-size="14.00">0</text>
+</g>
+<!-- n00000865&#45;&gt;n00000091 -->
+<g id="edge5" class="edge"><title>n00000865:port0&#45;&gt;n00000091:port0</title>
+<path fill="none" stroke="black" d="M153,-498.5C165,-498.5 170.25,-498.5 178.875,-498.5"/>
+<polygon fill="black" stroke="black" points="179,-502 189,-498.5 179,-495 179,-502"/>
+</g>
+<!-- n00000866 -->
+<!-- n00000866&#45;&gt;n0000007d -->
+<!-- n00000867 -->
+<!-- n00000867&#45;&gt;n00000087 -->
+<!-- n00000868 -->
+<!-- n00000868&#45;&gt;n0000009b -->
+</g>
+</svg>
diff --git a/Documentation/admin-guide/media/v4l-drivers.rst b/Documentation/admin-guide/media/v4l-drivers.rst
index 61283d67ceef..50bdef2d1762 100644
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
2.42.0


