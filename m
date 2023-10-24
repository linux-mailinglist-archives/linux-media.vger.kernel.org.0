Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25C4A7D4EC1
	for <lists+linux-media@lfdr.de>; Tue, 24 Oct 2023 13:21:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231437AbjJXLVY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Oct 2023 07:21:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231348AbjJXLVV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Oct 2023 07:21:21 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EA2ED7F
        for <linux-media@vger.kernel.org>; Tue, 24 Oct 2023 04:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698146474; x=1729682474;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BaiIKICYfaLhCBuNIn17XZdvpen5g9uAP455+vEhdFw=;
  b=TBQ8yluVjGfHLzqwQS6nOEBzhIbclIMvts5tc9NENTTdryK4r0yN8Pw3
   QhDyl7E+JJKbSR/mqCmkXF3iSlamrcbQWH3rPYCOxq6dN/UjTqa1zcd5O
   +PS9y+biasTsrZMtA5Bc9tHt4KJu3HmVOCai0XH+oYL27x2REH+rF6O0T
   +Pdfas5A5GtYTuqpGAXGp8BdYClEsbwbqkuGN1JJszrSY/Wr0LWpw1pZ7
   YkkZ0P+UQrGU8+ytSKWSA3tH89z6yNSFCJi+JVSoG96p3e2547RMFwh4w
   cB9w5iYRvpVEF7zJAVaGKl7vhZxTlyzvU6xAcHRKaicTjczmQ+USP11Pp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="473258825"
X-IronPort-AV: E=Sophos;i="6.03,247,1694761200"; 
   d="scan'208";a="473258825"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 04:21:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="762069974"
X-IronPort-AV: E=Sophos;i="6.03,247,1694761200"; 
   d="scan'208";a="762069974"
Received: from icg-kernel3.bj.intel.com ([172.16.126.174])
  by fmsmga007.fm.intel.com with ESMTP; 24 Oct 2023 04:21:00 -0700
From:   bingbu.cao@intel.com
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com
Cc:     andriy.shevchenko@linux.intel.com, hdegoede@redhat.com,
        ilpo.jarvinen@linux.intel.com, andreaskleist@gmail.com,
        claus.stovgaard@gmail.com, tfiga@chromium.org,
        senozhatsky@chromium.org, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@intel.com, bingbu.cao@linux.intel.com,
        tian.shu.qiu@intel.com, hongju.wang@intel.com
Subject: [PATCH v2 14/15] Documentation: add Intel IPU6 ISYS driver admin-guide doc
Date:   Tue, 24 Oct 2023 19:29:23 +0800
Message-ID: <20231024112924.3934228-15-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231024112924.3934228-1-bingbu.cao@intel.com>
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Bingbu Cao <bingbu.cao@intel.com>

This document mainly describe the functionality of IPU6 and
IPU6 isys driver, and gives an example that how user can do
imaging capture with tools.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 Documentation/admin-guide/media/ipu6-isys.rst |  159 +++
 .../admin-guide/media/ipu6_isys_graph.svg     |  338 +++++
 .../admin-guide/media/ipu6_isys_multi.svg     | 1124 +++++++++++++++++
 .../admin-guide/media/v4l-drivers.rst         |    1 +
 4 files changed, 1622 insertions(+)
 create mode 100644 Documentation/admin-guide/media/ipu6-isys.rst
 create mode 100644 Documentation/admin-guide/media/ipu6_isys_graph.svg
 create mode 100644 Documentation/admin-guide/media/ipu6_isys_multi.svg

diff --git a/Documentation/admin-guide/media/ipu6-isys.rst b/Documentation/admin-guide/media/ipu6-isys.rst
new file mode 100644
index 000000000000..fb4d355e1522
--- /dev/null
+++ b/Documentation/admin-guide/media/ipu6-isys.rst
@@ -0,0 +1,159 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: <isonum.txt>
+
+===============================================================
+Intel Image Processing Unit 6 (IPU6) Input System driver
+===============================================================
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
+   :alt: ipu6 isys media graph without multiple streams support
+
+   ipu6 isys media graph without multiple streams support
+
+.. kernel-figure::  ipu6_isys_multi.svg
+   :alt: ipu6 isys media graph with multiple streams support
+
+   ipu6 isys media graph with multiple streams support
+
+Capturing frames by IPU6 ISYS
+------------------------------------
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
index 000000000000..661aee18dbe2
--- /dev/null
+++ b/Documentation/admin-guide/media/ipu6_isys_graph.svg
@@ -0,0 +1,338 @@
+<?xml version="1.0" encoding="UTF-8" standalone="no"?>
+<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN"
+ "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
+<!-- Generated by graphviz version 2.43.0 (0)
+ -->
+<!-- Title: board Pages: 1 -->
+<svg width="1270pt" height="288pt"
+ viewBox="0.00 0.00 1270.00 288.00" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
+<g id="graph0" class="graph" transform="scale(1 1) rotate(0) translate(4 284)">
+<title>board</title>
+<polygon fill="white" stroke="transparent" points="-4,4 -4,-284 1266,-284 1266,4 -4,4"/>
+<!-- n00000001 -->
+<g id="node1" class="node">
+<title>n00000001</title>
+<polygon fill="yellow" stroke="black" points="842.5,-38 639.5,-38 639.5,0 842.5,0 842.5,-38"/>
+<text text-anchor="middle" x="741" y="-22.8" font-family="Times,serif" font-size="14.00">Intel IPU6 ISYS Capture 0</text>
+<text text-anchor="middle" x="741" y="-7.8" font-family="Times,serif" font-size="14.00">/dev/video0</text>
+</g>
+<!-- n00000005 -->
+<g id="node2" class="node">
+<title>n00000005</title>
+<polygon fill="yellow" stroke="black" points="1063.5,-38 860.5,-38 860.5,0 1063.5,0 1063.5,-38"/>
+<text text-anchor="middle" x="962" y="-22.8" font-family="Times,serif" font-size="14.00">Intel IPU6 ISYS Capture 1</text>
+<text text-anchor="middle" x="962" y="-7.8" font-family="Times,serif" font-size="14.00">/dev/video1</text>
+</g>
+<!-- n00000009 -->
+<g id="node3" class="node">
+<title>n00000009</title>
+<polygon fill="yellow" stroke="black" points="400.5,-38 197.5,-38 197.5,0 400.5,0 400.5,-38"/>
+<text text-anchor="middle" x="299" y="-22.8" font-family="Times,serif" font-size="14.00">Intel IPU6 ISYS Capture 2</text>
+<text text-anchor="middle" x="299" y="-7.8" font-family="Times,serif" font-size="14.00">/dev/video2</text>
+</g>
+<!-- n0000000d -->
+<g id="node4" class="node">
+<title>n0000000d</title>
+<polygon fill="yellow" stroke="black" points="621.5,-38 418.5,-38 418.5,0 621.5,0 621.5,-38"/>
+<text text-anchor="middle" x="520" y="-22.8" font-family="Times,serif" font-size="14.00">Intel IPU6 ISYS Capture 3</text>
+<text text-anchor="middle" x="520" y="-7.8" font-family="Times,serif" font-size="14.00">/dev/video3</text>
+</g>
+<!-- n00000011 -->
+<g id="node5" class="node">
+<title>n00000011</title>
+<path fill="green" stroke="black" d="M332,-74.5C332,-74.5 450,-74.5 450,-74.5 456,-74.5 462,-80.5 462,-86.5 462,-86.5 462,-146.5 462,-146.5 462,-152.5 456,-158.5 450,-158.5 450,-158.5 332,-158.5 332,-158.5 326,-158.5 320,-152.5 320,-146.5 320,-146.5 320,-86.5 320,-86.5 320,-80.5 326,-74.5 332,-74.5"/>
+<text text-anchor="middle" x="391" y="-143.3" font-family="Times,serif" font-size="14.00">0</text>
+<polyline fill="none" stroke="black" points="320,-135.5 462,-135.5 "/>
+<text text-anchor="middle" x="391" y="-120.3" font-family="Times,serif" font-size="14.00">Intel IPU6 CSI2 0</text>
+<text text-anchor="middle" x="391" y="-105.3" font-family="Times,serif" font-size="14.00">/dev/v4l&#45;subdev0</text>
+<polyline fill="none" stroke="black" points="320,-97.5 462,-97.5 "/>
+<text text-anchor="middle" x="391" y="-82.3" font-family="Times,serif" font-size="14.00">1</text>
+</g>
+<!-- n00000011&#45;&gt;n00000001 -->
+<g id="edge1" class="edge">
+<title>n00000011:port1&#45;&gt;n00000001</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M463,-85.5C469.23,-85.5 465.79,-77.41 471,-74 484.72,-65.01 561.34,-50.14 629.46,-38.27"/>
+<polygon fill="black" stroke="black" points="630.19,-41.7 639.45,-36.55 629,-34.8 630.19,-41.7"/>
+</g>
+<!-- n00000011&#45;&gt;n00000005 -->
+<g id="edge2" class="edge">
+<title>n00000011:port1&#45;&gt;n00000005</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M463,-85.5C469.23,-85.5 465.62,-77.14 471,-74 541.93,-32.58 752.57,-47.73 850.49,-38.01"/>
+<polygon fill="black" stroke="black" points="850.91,-41.48 860.45,-36.88 850.12,-34.52 850.91,-41.48"/>
+</g>
+<!-- n00000011&#45;&gt;n00000009 -->
+<g id="edge3" class="edge">
+<title>n00000011:port1&#45;&gt;n00000009</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M319,-85.5C314.85,-85.5 309.28,-66.02 305.07,-48.31"/>
+<polygon fill="black" stroke="black" points="308.41,-47.21 302.77,-38.25 301.59,-48.77 308.41,-47.21"/>
+</g>
+<!-- n00000011&#45;&gt;n0000000d -->
+<g id="edge4" class="edge">
+<title>n00000011:port1&#45;&gt;n0000000d</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M463,-85.5C469.23,-85.5 467.12,-78.87 471,-74 478.49,-64.6 487.16,-54.74 495.11,-46.06"/>
+<polygon fill="black" stroke="black" points="497.92,-48.18 502.15,-38.47 492.78,-43.42 497.92,-48.18"/>
+</g>
+<!-- n00000014 -->
+<g id="node6" class="node">
+<title>n00000014</title>
+<path fill="green" stroke="black" d="M492,-74.5C492,-74.5 610,-74.5 610,-74.5 616,-74.5 622,-80.5 622,-86.5 622,-86.5 622,-146.5 622,-146.5 622,-152.5 616,-158.5 610,-158.5 610,-158.5 492,-158.5 492,-158.5 486,-158.5 480,-152.5 480,-146.5 480,-146.5 480,-86.5 480,-86.5 480,-80.5 486,-74.5 492,-74.5"/>
+<text text-anchor="middle" x="551" y="-143.3" font-family="Times,serif" font-size="14.00">0</text>
+<polyline fill="none" stroke="black" points="480,-135.5 622,-135.5 "/>
+<text text-anchor="middle" x="551" y="-120.3" font-family="Times,serif" font-size="14.00">Intel IPU6 CSI2 1</text>
+<text text-anchor="middle" x="551" y="-105.3" font-family="Times,serif" font-size="14.00">/dev/v4l&#45;subdev1</text>
+<polyline fill="none" stroke="black" points="480,-97.5 622,-97.5 "/>
+<text text-anchor="middle" x="551" y="-82.3" font-family="Times,serif" font-size="14.00">1</text>
+</g>
+<!-- n00000014&#45;&gt;n00000001 -->
+<g id="edge5" class="edge">
+<title>n00000014:port1&#45;&gt;n00000001</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M623,-85.5C629.23,-85.5 626.28,-78.06 631,-74 645.84,-61.25 664.22,-50.69 681.67,-42.4"/>
+<polygon fill="black" stroke="black" points="683.6,-45.36 691.24,-38.02 680.69,-39 683.6,-45.36"/>
+</g>
+<!-- n00000014&#45;&gt;n00000005 -->
+<g id="edge6" class="edge">
+<title>n00000014:port1&#45;&gt;n00000005</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M623,-85.5C629.23,-85.5 625.73,-77.32 631,-74 712.48,-22.66 751.25,-51.99 850.31,-38.16"/>
+<polygon fill="black" stroke="black" points="851.05,-41.58 860.41,-36.63 850,-34.66 851.05,-41.58"/>
+</g>
+<!-- n00000014&#45;&gt;n00000009 -->
+<g id="edge7" class="edge">
+<title>n00000014:port1&#45;&gt;n00000009</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M479,-85.5C472.77,-85.5 476.02,-77.69 471,-74 451.38,-59.59 427.8,-48.95 404.49,-41.12"/>
+<polygon fill="black" stroke="black" points="405.47,-37.76 394.88,-38.04 403.33,-44.42 405.47,-37.76"/>
+</g>
+<!-- n00000014&#45;&gt;n0000000d -->
+<g id="edge8" class="edge">
+<title>n00000014:port1&#45;&gt;n0000000d</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M551,-74C551,-64.31 547.2,-54.79 542.27,-46.51"/>
+<polygon fill="black" stroke="black" points="545.07,-44.41 536.59,-38.06 539.26,-48.31 545.07,-44.41"/>
+</g>
+<!-- n00000017 -->
+<g id="node7" class="node">
+<title>n00000017</title>
+<path fill="green" stroke="black" d="M652,-74.5C652,-74.5 770,-74.5 770,-74.5 776,-74.5 782,-80.5 782,-86.5 782,-86.5 782,-146.5 782,-146.5 782,-152.5 776,-158.5 770,-158.5 770,-158.5 652,-158.5 652,-158.5 646,-158.5 640,-152.5 640,-146.5 640,-146.5 640,-86.5 640,-86.5 640,-80.5 646,-74.5 652,-74.5"/>
+<text text-anchor="middle" x="711" y="-143.3" font-family="Times,serif" font-size="14.00">0</text>
+<polyline fill="none" stroke="black" points="640,-135.5 782,-135.5 "/>
+<text text-anchor="middle" x="711" y="-120.3" font-family="Times,serif" font-size="14.00">Intel IPU6 CSI2 2</text>
+<text text-anchor="middle" x="711" y="-105.3" font-family="Times,serif" font-size="14.00">/dev/v4l&#45;subdev2</text>
+<polyline fill="none" stroke="black" points="640,-97.5 782,-97.5 "/>
+<text text-anchor="middle" x="711" y="-82.3" font-family="Times,serif" font-size="14.00">1</text>
+</g>
+<!-- n00000017&#45;&gt;n00000001 -->
+<g id="edge9" class="edge">
+<title>n00000017:port1&#45;&gt;n00000001</title>
+<path fill="none" stroke="black" d="M711,-74C711,-64.39 714.67,-54.89 719.45,-46.61"/>
+<polygon fill="black" stroke="black" points="722.44,-48.44 724.95,-38.14 716.57,-44.62 722.44,-48.44"/>
+</g>
+<!-- n00000017&#45;&gt;n00000005 -->
+<g id="edge10" class="edge">
+<title>n00000017:port1&#45;&gt;n00000005</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M783,-85.5C789.23,-85.5 785.99,-77.69 791,-74 810.5,-59.65 833.94,-49.03 857.12,-41.21"/>
+<polygon fill="black" stroke="black" points="858.23,-44.52 866.68,-38.13 856.09,-37.86 858.23,-44.52"/>
+</g>
+<!-- n00000017&#45;&gt;n00000009 -->
+<g id="edge11" class="edge">
+<title>n00000017:port1&#45;&gt;n00000009</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M639,-85.5C632.77,-85.5 636.27,-77.32 631,-74 630.85,-73.91 507.25,-53.82 410.92,-38.17"/>
+<polygon fill="black" stroke="black" points="411.24,-34.68 400.8,-36.53 410.11,-41.59 411.24,-34.68"/>
+</g>
+<!-- n00000017&#45;&gt;n0000000d -->
+<g id="edge12" class="edge">
+<title>n00000017:port1&#45;&gt;n0000000d</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M639,-85.5C632.77,-85.5 635.73,-78.05 631,-74 615.96,-61.13 597.31,-50.51 579.63,-42.2"/>
+<polygon fill="black" stroke="black" points="581.04,-39 570.49,-38.06 578.16,-45.38 581.04,-39"/>
+</g>
+<!-- n0000001a -->
+<g id="node8" class="node">
+<title>n0000001a</title>
+<path fill="green" stroke="black" d="M812,-74.5C812,-74.5 930,-74.5 930,-74.5 936,-74.5 942,-80.5 942,-86.5 942,-86.5 942,-146.5 942,-146.5 942,-152.5 936,-158.5 930,-158.5 930,-158.5 812,-158.5 812,-158.5 806,-158.5 800,-152.5 800,-146.5 800,-146.5 800,-86.5 800,-86.5 800,-80.5 806,-74.5 812,-74.5"/>
+<text text-anchor="middle" x="871" y="-143.3" font-family="Times,serif" font-size="14.00">0</text>
+<polyline fill="none" stroke="black" points="800,-135.5 942,-135.5 "/>
+<text text-anchor="middle" x="871" y="-120.3" font-family="Times,serif" font-size="14.00">Intel IPU6 CSI2 3</text>
+<text text-anchor="middle" x="871" y="-105.3" font-family="Times,serif" font-size="14.00">/dev/v4l&#45;subdev3</text>
+<polyline fill="none" stroke="black" points="800,-97.5 942,-97.5 "/>
+<text text-anchor="middle" x="871" y="-82.3" font-family="Times,serif" font-size="14.00">1</text>
+</g>
+<!-- n0000001a&#45;&gt;n00000001 -->
+<g id="edge13" class="edge">
+<title>n0000001a:port1&#45;&gt;n00000001</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M799,-85.5C792.77,-85.5 794.9,-78.85 791,-74 783.32,-64.45 774.38,-54.48 766.19,-45.74"/>
+<polygon fill="black" stroke="black" points="768.67,-43.27 759.25,-38.42 763.59,-48.08 768.67,-43.27"/>
+</g>
+<!-- n0000001a&#45;&gt;n00000005 -->
+<g id="edge14" class="edge">
+<title>n0000001a:port1&#45;&gt;n00000005</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M943,-85.5C947.13,-85.5 952.41,-66.02 956.35,-48.31"/>
+<polygon fill="black" stroke="black" points="959.83,-48.76 958.5,-38.25 952.99,-47.29 959.83,-48.76"/>
+</g>
+<!-- n0000001a&#45;&gt;n00000009 -->
+<g id="edge15" class="edge">
+<title>n0000001a:port1&#45;&gt;n00000009</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M799,-85.5C792.77,-85.5 796.38,-77.14 791,-74 720.07,-32.58 509.44,-47.67 410.64,-37.89"/>
+<polygon fill="black" stroke="black" points="410.91,-34.4 400.58,-36.75 410.13,-41.35 410.91,-34.4"/>
+</g>
+<!-- n0000001a&#45;&gt;n0000000d -->
+<g id="edge16" class="edge">
+<title>n0000001a:port1&#45;&gt;n0000000d</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M799,-85.5C792.77,-85.5 796.21,-77.41 791,-74 777.21,-64.97 700.06,-50.06 631.59,-38.19"/>
+<polygon fill="black" stroke="black" points="632.01,-34.72 621.56,-36.47 630.82,-41.61 632.01,-34.72"/>
+</g>
+<!-- n0000001d -->
+<g id="node9" class="node">
+<title>n0000001d</title>
+<path fill="green" stroke="black" d="M972,-74.5C972,-74.5 1090,-74.5 1090,-74.5 1096,-74.5 1102,-80.5 1102,-86.5 1102,-86.5 1102,-146.5 1102,-146.5 1102,-152.5 1096,-158.5 1090,-158.5 1090,-158.5 972,-158.5 972,-158.5 966,-158.5 960,-152.5 960,-146.5 960,-146.5 960,-86.5 960,-86.5 960,-80.5 966,-74.5 972,-74.5"/>
+<text text-anchor="middle" x="1031" y="-143.3" font-family="Times,serif" font-size="14.00">0</text>
+<polyline fill="none" stroke="black" points="960,-135.5 1102,-135.5 "/>
+<text text-anchor="middle" x="1031" y="-120.3" font-family="Times,serif" font-size="14.00">Intel IPU6 CSI2 4</text>
+<text text-anchor="middle" x="1031" y="-105.3" font-family="Times,serif" font-size="14.00">/dev/v4l&#45;subdev4</text>
+<polyline fill="none" stroke="black" points="960,-97.5 1102,-97.5 "/>
+<text text-anchor="middle" x="1031" y="-82.3" font-family="Times,serif" font-size="14.00">1</text>
+</g>
+<!-- n0000001d&#45;&gt;n00000001 -->
+<g id="edge17" class="edge">
+<title>n0000001d:port1&#45;&gt;n00000001</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M959,-85.5C952.77,-85.5 956.11,-77.55 951,-74 933.43,-61.79 890.08,-49.78 847.29,-40.2"/>
+<polygon fill="black" stroke="black" points="847.83,-36.73 837.32,-38 846.33,-43.57 847.83,-36.73"/>
+</g>
+<!-- n0000001d&#45;&gt;n00000005 -->
+<g id="edge18" class="edge">
+<title>n0000001d:port1&#45;&gt;n00000005</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M959,-85.5C951.05,-85.5 952.67,-66.02 955.78,-48.31"/>
+<polygon fill="black" stroke="black" points="959.26,-48.73 957.72,-38.25 952.39,-47.4 959.26,-48.73"/>
+</g>
+<!-- n0000001d&#45;&gt;n00000009 -->
+<g id="edge19" class="edge">
+<title>n0000001d:port1&#45;&gt;n00000009</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M959,-85.5C952.77,-85.5 956.42,-77.07 951,-74 848.79,-16.19 545.64,-49.84 410.76,-37.89"/>
+<polygon fill="black" stroke="black" points="410.87,-34.39 400.57,-36.86 410.17,-41.35 410.87,-34.39"/>
+</g>
+<!-- n0000001d&#45;&gt;n0000000d -->
+<g id="edge20" class="edge">
+<title>n0000001d:port1&#45;&gt;n0000000d</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M959,-85.5C952.77,-85.5 956.35,-77.19 951,-74 891.99,-38.83 716.72,-46.98 631.74,-37.91"/>
+<polygon fill="black" stroke="black" points="631.94,-34.41 621.59,-36.68 631.1,-41.36 631.94,-34.41"/>
+</g>
+<!-- n00000020 -->
+<g id="node10" class="node">
+<title>n00000020</title>
+<path fill="green" stroke="black" d="M1132,-74.5C1132,-74.5 1250,-74.5 1250,-74.5 1256,-74.5 1262,-80.5 1262,-86.5 1262,-86.5 1262,-146.5 1262,-146.5 1262,-152.5 1256,-158.5 1250,-158.5 1250,-158.5 1132,-158.5 1132,-158.5 1126,-158.5 1120,-152.5 1120,-146.5 1120,-146.5 1120,-86.5 1120,-86.5 1120,-80.5 1126,-74.5 1132,-74.5"/>
+<text text-anchor="middle" x="1191" y="-143.3" font-family="Times,serif" font-size="14.00">0</text>
+<polyline fill="none" stroke="black" points="1120,-135.5 1262,-135.5 "/>
+<text text-anchor="middle" x="1191" y="-120.3" font-family="Times,serif" font-size="14.00">Intel IPU6 CSI2 5</text>
+<text text-anchor="middle" x="1191" y="-105.3" font-family="Times,serif" font-size="14.00">/dev/v4l&#45;subdev5</text>
+<polyline fill="none" stroke="black" points="1120,-97.5 1262,-97.5 "/>
+<text text-anchor="middle" x="1191" y="-82.3" font-family="Times,serif" font-size="14.00">1</text>
+</g>
+<!-- n00000020&#45;&gt;n00000001 -->
+<g id="edge21" class="edge">
+<title>n00000020:port1&#45;&gt;n00000001</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M1119,-85.5C1112.77,-85.5 1116.31,-77.26 1111,-74 1014.66,-14.86 969.43,-53.08 852.63,-37.98"/>
+<polygon fill="black" stroke="black" points="853,-34.49 842.61,-36.57 852.03,-41.42 853,-34.49"/>
+</g>
+<!-- n00000020&#45;&gt;n00000005 -->
+<g id="edge22" class="edge">
+<title>n00000020:port1&#45;&gt;n00000005</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M1119,-85.5C1112.77,-85.5 1115.94,-77.79 1111,-74 1092.76,-59.98 1070.53,-49.35 1048.88,-41.41"/>
+<polygon fill="black" stroke="black" points="1049.91,-38.06 1039.31,-38.05 1047.59,-44.66 1049.91,-38.06"/>
+</g>
+<!-- n00000020&#45;&gt;n00000009 -->
+<g id="edge23" class="edge">
+<title>n00000020:port1&#45;&gt;n00000009</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M1119,-85.5C1112.77,-85.5 1116.44,-77.02 1111,-74 1045.09,-37.38 523.89,-45.63 410.74,-37.79"/>
+<polygon fill="black" stroke="black" points="410.82,-34.29 400.56,-36.93 410.23,-41.26 410.82,-34.29"/>
+</g>
+<!-- n00000020&#45;&gt;n0000000d -->
+<g id="edge24" class="edge">
+<title>n00000020:port1&#45;&gt;n0000000d</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M1119,-85.5C1112.77,-85.5 1116.41,-77.09 1111,-74 1020.75,-22.45 752.98,-48.96 631.79,-37.9"/>
+<polygon fill="black" stroke="black" points="631.88,-34.39 621.57,-36.83 631.16,-41.35 631.88,-34.39"/>
+</g>
+<!-- n00000023 -->
+<g id="node11" class="node">
+<title>n00000023</title>
+<path fill="green" stroke="black" d="M12,-74.5C12,-74.5 130,-74.5 130,-74.5 136,-74.5 142,-80.5 142,-86.5 142,-86.5 142,-146.5 142,-146.5 142,-152.5 136,-158.5 130,-158.5 130,-158.5 12,-158.5 12,-158.5 6,-158.5 0,-152.5 0,-146.5 0,-146.5 0,-86.5 0,-86.5 0,-80.5 6,-74.5 12,-74.5"/>
+<text text-anchor="middle" x="71" y="-143.3" font-family="Times,serif" font-size="14.00">0</text>
+<polyline fill="none" stroke="black" points="0,-135.5 142,-135.5 "/>
+<text text-anchor="middle" x="71" y="-120.3" font-family="Times,serif" font-size="14.00">Intel IPU6 CSI2 6</text>
+<text text-anchor="middle" x="71" y="-105.3" font-family="Times,serif" font-size="14.00">/dev/v4l&#45;subdev6</text>
+<polyline fill="none" stroke="black" points="0,-97.5 142,-97.5 "/>
+<text text-anchor="middle" x="71" y="-82.3" font-family="Times,serif" font-size="14.00">1</text>
+</g>
+<!-- n00000023&#45;&gt;n00000001 -->
+<g id="edge25" class="edge">
+<title>n00000023:port1&#45;&gt;n00000001</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M143,-85.5C149.23,-85.5 145.59,-77.09 151,-74 241.25,-22.45 509.02,-49.03 629.32,-38.01"/>
+<polygon fill="black" stroke="black" points="629.88,-41.47 639.46,-36.95 629.15,-34.51 629.88,-41.47"/>
+</g>
+<!-- n00000023&#45;&gt;n00000005 -->
+<g id="edge26" class="edge">
+<title>n00000023:port1&#45;&gt;n00000005</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M143,-85.5C149.23,-85.5 145.56,-77.02 151,-74 216.91,-37.38 738.12,-45.69 850.38,-37.9"/>
+<polygon fill="black" stroke="black" points="850.8,-41.37 860.47,-37.04 850.21,-34.4 850.8,-41.37"/>
+</g>
+<!-- n00000023&#45;&gt;n00000009 -->
+<g id="edge27" class="edge">
+<title>n00000023:port1&#45;&gt;n00000009</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M143,-85.5C149.23,-85.5 146.07,-77.8 151,-74 169.21,-59.97 191.42,-49.33 213.04,-41.37"/>
+<polygon fill="black" stroke="black" points="214.32,-44.63 222.58,-38.01 211.99,-38.03 214.32,-44.63"/>
+</g>
+<!-- n00000023&#45;&gt;n0000000d -->
+<g id="edge28" class="edge">
+<title>n00000023:port1&#45;&gt;n0000000d</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M143,-85.5C149.23,-85.5 145.69,-77.26 151,-74 247.34,-14.86 292.59,-53.16 408.48,-38.11"/>
+<polygon fill="black" stroke="black" points="409.01,-41.57 418.43,-36.71 408.04,-34.64 409.01,-41.57"/>
+</g>
+<!-- n00000026 -->
+<g id="node12" class="node">
+<title>n00000026</title>
+<path fill="green" stroke="black" d="M172,-74.5C172,-74.5 290,-74.5 290,-74.5 296,-74.5 302,-80.5 302,-86.5 302,-86.5 302,-146.5 302,-146.5 302,-152.5 296,-158.5 290,-158.5 290,-158.5 172,-158.5 172,-158.5 166,-158.5 160,-152.5 160,-146.5 160,-146.5 160,-86.5 160,-86.5 160,-80.5 166,-74.5 172,-74.5"/>
+<text text-anchor="middle" x="231" y="-143.3" font-family="Times,serif" font-size="14.00">0</text>
+<polyline fill="none" stroke="black" points="160,-135.5 302,-135.5 "/>
+<text text-anchor="middle" x="231" y="-120.3" font-family="Times,serif" font-size="14.00">Intel IPU6 CSI2 7</text>
+<text text-anchor="middle" x="231" y="-105.3" font-family="Times,serif" font-size="14.00">/dev/v4l&#45;subdev7</text>
+<polyline fill="none" stroke="black" points="160,-97.5 302,-97.5 "/>
+<text text-anchor="middle" x="231" y="-82.3" font-family="Times,serif" font-size="14.00">1</text>
+</g>
+<!-- n00000026&#45;&gt;n00000001 -->
+<g id="edge29" class="edge">
+<title>n00000026:port1&#45;&gt;n00000001</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M303,-85.5C309.23,-85.5 305.65,-77.19 311,-74 370.01,-38.83 545.29,-47.02 629.41,-38.03"/>
+<polygon fill="black" stroke="black" points="629.93,-41.49 639.44,-36.81 629.09,-34.54 629.93,-41.49"/>
+</g>
+<!-- n00000026&#45;&gt;n00000005 -->
+<g id="edge30" class="edge">
+<title>n00000026:port1&#45;&gt;n00000005</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M303,-85.5C309.23,-85.5 305.58,-77.07 311,-74 413.21,-16.19 716.37,-49.92 850.34,-38.01"/>
+<polygon fill="black" stroke="black" points="850.87,-41.47 860.46,-36.98 850.16,-34.51 850.87,-41.47"/>
+</g>
+<!-- n00000026&#45;&gt;n00000009 -->
+<g id="edge31" class="edge">
+<title>n00000026:port1&#45;&gt;n00000009</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M303,-85.5C310.95,-85.5 309.04,-66.02 305.66,-48.31"/>
+<polygon fill="black" stroke="black" points="309.03,-47.32 303.56,-38.25 302.18,-48.75 309.03,-47.32"/>
+</g>
+<!-- n00000026&#45;&gt;n0000000d -->
+<g id="edge32" class="edge">
+<title>n00000026:port1&#45;&gt;n0000000d</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M303,-85.5C309.23,-85.5 305.89,-77.56 311,-74 328.48,-61.84 371.63,-49.83 414.21,-40.24"/>
+<polygon fill="black" stroke="black" points="415.13,-43.62 424.14,-38.04 413.62,-36.79 415.13,-43.62"/>
+</g>
+<!-- n00000069 -->
+<g id="node13" class="node">
+<title>n00000069</title>
+<path fill="green" stroke="black" d="M654.5,-195.5C654.5,-195.5 767.5,-195.5 767.5,-195.5 773.5,-195.5 779.5,-201.5 779.5,-207.5 779.5,-207.5 779.5,-267.5 779.5,-267.5 779.5,-273.5 773.5,-279.5 767.5,-279.5 767.5,-279.5 654.5,-279.5 654.5,-279.5 648.5,-279.5 642.5,-273.5 642.5,-267.5 642.5,-267.5 642.5,-207.5 642.5,-207.5 642.5,-201.5 648.5,-195.5 654.5,-195.5"/>
+<text text-anchor="middle" x="711" y="-264.3" font-family="Times,serif" font-size="14.00"> </text>
+<polyline fill="none" stroke="black" points="642.5,-256.5 779.5,-256.5 "/>
+<text text-anchor="middle" x="711" y="-241.3" font-family="Times,serif" font-size="14.00">ov01a10 3&#45;0036</text>
+<text text-anchor="middle" x="711" y="-226.3" font-family="Times,serif" font-size="14.00">/dev/v4l&#45;subdev8</text>
+<polyline fill="none" stroke="black" points="642.5,-218.5 779.5,-218.5 "/>
+<text text-anchor="middle" x="711" y="-203.3" font-family="Times,serif" font-size="14.00">0</text>
+</g>
+<!-- n00000069&#45;&gt;n00000017 -->
+<g id="edge33" class="edge">
+<title>n00000069:port0&#45;&gt;n00000017:port0</title>
+<path fill="none" stroke="black" d="M711,-195C711,-183 711,-177.75 711,-169.12"/>
+<polygon fill="black" stroke="black" points="714.5,-169 711,-159 707.5,-169 714.5,-169"/>
+</g>
+</g>
+</svg>
diff --git a/Documentation/admin-guide/media/ipu6_isys_multi.svg b/Documentation/admin-guide/media/ipu6_isys_multi.svg
new file mode 100644
index 000000000000..5bd748d15c70
--- /dev/null
+++ b/Documentation/admin-guide/media/ipu6_isys_multi.svg
@@ -0,0 +1,1124 @@
+<?xml version="1.0" encoding="UTF-8" standalone="no"?>
+<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN"
+ "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
+<!-- Generated by graphviz version 2.43.0 (0)
+ -->
+<!-- Title: board Pages: 1 -->
+<svg width="670pt" height="802pt"
+ viewBox="0.00 0.00 670.00 802.00" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
+<g id="graph0" class="graph" transform="scale(1 1) rotate(0) translate(4 798)">
+<title>board</title>
+<polygon fill="white" stroke="transparent" points="-4,4 -4,-798 666,-798 666,4 -4,4"/>
+<!-- n00000001 -->
+<g id="node1" class="node">
+<title>n00000001</title>
+<polygon fill="yellow" stroke="black" points="657.5,-470.5 454.5,-470.5 454.5,-432.5 657.5,-432.5 657.5,-470.5"/>
+<text text-anchor="middle" x="556" y="-455.3" font-family="Times,serif" font-size="14.00">Intel IPU6 ISYS Capture 0</text>
+<text text-anchor="middle" x="556" y="-440.3" font-family="Times,serif" font-size="14.00">/dev/video0</text>
+</g>
+<!-- n00000005 -->
+<g id="node2" class="node">
+<title>n00000005</title>
+<polygon fill="yellow" stroke="black" points="657.5,-414.5 454.5,-414.5 454.5,-376.5 657.5,-376.5 657.5,-414.5"/>
+<text text-anchor="middle" x="556" y="-399.3" font-family="Times,serif" font-size="14.00">Intel IPU6 ISYS Capture 1</text>
+<text text-anchor="middle" x="556" y="-384.3" font-family="Times,serif" font-size="14.00">/dev/video1</text>
+</g>
+<!-- n00000009 -->
+<g id="node3" class="node">
+<title>n00000009</title>
+<polygon fill="yellow" stroke="black" points="660,-358.5 452,-358.5 452,-322.5 660,-322.5 660,-358.5"/>
+<text text-anchor="middle" x="556" y="-336.8" font-family="Times,serif" font-size="14.00">Intel IPU6 ISYS Capture ...</text>
+</g>
+<!-- n00000075 -->
+<g id="node4" class="node">
+<title>n00000075</title>
+<polygon fill="yellow" stroke="black" points="662,-304.5 450,-304.5 450,-266.5 662,-266.5 662,-304.5"/>
+<text text-anchor="middle" x="556" y="-289.3" font-family="Times,serif" font-size="14.00">Intel IPU6 ISYS Capture 29</text>
+<text text-anchor="middle" x="556" y="-274.3" font-family="Times,serif" font-size="14.00">/dev/video29</text>
+</g>
+<!-- n00000079 -->
+<g id="node5" class="node">
+<title>n00000079</title>
+<polygon fill="yellow" stroke="black" points="662,-526.5 450,-526.5 450,-488.5 662,-488.5 662,-526.5"/>
+<text text-anchor="middle" x="556" y="-511.3" font-family="Times,serif" font-size="14.00">Intel IPU6 ISYS Capture 30</text>
+<text text-anchor="middle" x="556" y="-496.3" font-family="Times,serif" font-size="14.00">/dev/video30</text>
+</g>
+<!-- n0000007d -->
+<g id="node6" class="node">
+<title>n0000007d</title>
+<path fill="chartreuse" stroke="black" d="M232,-203.5C232,-203.5 402,-203.5 402,-203.5 408,-203.5 414,-209.5 414,-215.5 414,-215.5 414,-375.5 414,-375.5 414,-381.5 408,-387.5 402,-387.5 402,-387.5 232,-387.5 232,-387.5 226,-387.5 220,-381.5 220,-375.5 220,-375.5 220,-215.5 220,-215.5 220,-209.5 226,-203.5 232,-203.5"/>
+<text text-anchor="middle" x="233" y="-291.8" font-family="Times,serif" font-size="14.00">0</text>
+<polyline fill="none" stroke="black" points="246,-203.5 246,-387.5 "/>
+<text text-anchor="middle" x="317" y="-299.3" font-family="Times,serif" font-size="14.00">Intel IPU6 CSI2 0</text>
+<text text-anchor="middle" x="317" y="-284.3" font-family="Times,serif" font-size="14.00">/dev/v4l&#45;subdev0</text>
+<polyline fill="none" stroke="black" points="388,-203.5 388,-387.5 "/>
+<text text-anchor="middle" x="401" y="-372.3" font-family="Times,serif" font-size="14.00">1</text>
+<polyline fill="none" stroke="black" points="388,-364.5 414,-364.5 "/>
+<text text-anchor="middle" x="401" y="-349.3" font-family="Times,serif" font-size="14.00">2</text>
+<polyline fill="none" stroke="black" points="388,-341.5 414,-341.5 "/>
+<text text-anchor="middle" x="401" y="-326.3" font-family="Times,serif" font-size="14.00">3</text>
+<polyline fill="none" stroke="black" points="388,-318.5 414,-318.5 "/>
+<text text-anchor="middle" x="401" y="-303.3" font-family="Times,serif" font-size="14.00">4</text>
+<polyline fill="none" stroke="black" points="388,-295.5 414,-295.5 "/>
+<text text-anchor="middle" x="401" y="-280.3" font-family="Times,serif" font-size="14.00">5</text>
+<polyline fill="none" stroke="black" points="388,-272.5 414,-272.5 "/>
+<text text-anchor="middle" x="401" y="-257.3" font-family="Times,serif" font-size="14.00">6</text>
+<polyline fill="none" stroke="black" points="388,-249.5 414,-249.5 "/>
+<text text-anchor="middle" x="401" y="-234.3" font-family="Times,serif" font-size="14.00">7</text>
+<polyline fill="none" stroke="black" points="388,-226.5 414,-226.5 "/>
+<text text-anchor="middle" x="401" y="-211.3" font-family="Times,serif" font-size="14.00">8</text>
+</g>
+<!-- n0000007d&#45;&gt;n00000001 -->
+<g id="edge1" class="edge">
+<title>n0000007d:port1&#45;&gt;n00000001</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-376.5C440.31,-376.5 428.12,-408.89 450,-423.5 452.27,-425.02 454.63,-426.46 457.05,-427.82"/>
+<polygon fill="black" stroke="black" points="455.54,-430.98 466.04,-432.41 458.72,-424.74 455.54,-430.98"/>
+</g>
+<!-- n0000007d&#45;&gt;n00000001 -->
+<g id="edge2" class="edge">
+<title>n0000007d:port2&#45;&gt;n00000001</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-353.5C448.98,-353.5 422.76,-401.55 450,-423.5 451.57,-424.77 453.19,-425.97 454.86,-427.13"/>
+<polygon fill="black" stroke="black" points="453.18,-430.2 463.53,-432.46 456.85,-424.24 453.18,-430.2"/>
+</g>
+<!-- n0000007d&#45;&gt;n00000001 -->
+<g id="edge3" class="edge">
+<title>n0000007d:port3&#45;&gt;n00000001</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-330.5C458.32,-330.5 417,-393.91 450,-423.5 451.14,-424.52 452.32,-425.51 453.52,-426.46"/>
+<polygon fill="black" stroke="black" points="451.66,-429.43 461.87,-432.24 455.64,-423.67 451.66,-429.43"/>
+</g>
+<!-- n0000007d&#45;&gt;n00000001 -->
+<g id="edge4" class="edge">
+<title>n0000007d:port4&#45;&gt;n00000001</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-307.5C467.98,-307.5 411.07,-386.11 450,-423.5 450.96,-424.42 451.94,-425.31 452.95,-426.17"/>
+<polygon fill="black" stroke="black" points="451,-429.08 461.12,-432.23 455.17,-423.46 451,-429.08"/>
+</g>
+<!-- n0000007d&#45;&gt;n00000001 -->
+<g id="edge5" class="edge">
+<title>n0000007d:port5&#45;&gt;n00000001</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-283.5C478.25,-283.5 404.77,-377.87 450,-423.5 450.93,-424.44 451.9,-425.35 452.88,-426.24"/>
+<polygon fill="black" stroke="black" points="450.86,-429.1 460.92,-432.43 455.14,-423.55 450.86,-429.1"/>
+</g>
+<!-- n0000007d&#45;&gt;n00000001 -->
+<g id="edge6" class="edge">
+<title>n0000007d:port6&#45;&gt;n00000001</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-260.5C488.19,-260.5 398.69,-369.92 450,-423.5 450.78,-424.32 451.59,-425.11 452.41,-425.88"/>
+<polygon fill="black" stroke="black" points="450.33,-428.7 460.31,-432.25 454.72,-423.25 450.33,-428.7"/>
+</g>
+<!-- n0000007d&#45;&gt;n00000001 -->
+<g id="edge7" class="edge">
+<title>n0000007d:port7&#45;&gt;n00000001</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-237.5C498.2,-237.5 392.56,-361.93 450,-423.5 450.77,-424.33 451.57,-425.13 452.38,-425.91"/>
+<polygon fill="black" stroke="black" points="450.26,-428.7 460.21,-432.35 454.71,-423.29 450.26,-428.7"/>
+</g>
+<!-- n0000007d&#45;&gt;n00000001 -->
+<g id="edge8" class="edge">
+<title>n0000007d:port8&#45;&gt;n00000001</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-214.5C461.13,-214.5 418.21,-388.71 450,-423.5 450.76,-424.34 451.55,-425.15 452.35,-425.94"/>
+<polygon fill="black" stroke="black" points="450.2,-428.7 460.12,-432.43 454.69,-423.33 450.2,-428.7"/>
+</g>
+<!-- n0000007d&#45;&gt;n00000005 -->
+<g id="edge9" class="edge">
+<title>n0000007d:port1&#45;&gt;n00000005</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-376.5C423.82,-376.5 433.99,-376.96 444.16,-377.73"/>
+<polygon fill="black" stroke="black" points="444.06,-381.24 454.32,-378.61 444.66,-374.26 444.06,-381.24"/>
+</g>
+<!-- n0000007d&#45;&gt;n00000005 -->
+<g id="edge10" class="edge">
+<title>n0000007d:port2&#45;&gt;n00000005</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-353.5C431.17,-353.5 433.68,-362.17 450,-367.5 456.39,-369.59 463.03,-371.63 469.73,-373.61"/>
+<polygon fill="black" stroke="black" points="468.99,-377.04 479.57,-376.46 470.94,-370.32 468.99,-377.04"/>
+</g>
+<!-- n0000007d&#45;&gt;n00000005 -->
+<g id="edge11" class="edge">
+<title>n0000007d:port3&#45;&gt;n00000005</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-330.5C436.94,-330.5 430.2,-355.9 450,-367.5 452.89,-369.19 455.88,-370.78 458.95,-372.28"/>
+<polygon fill="black" stroke="black" points="457.8,-375.6 468.36,-376.5 460.67,-369.22 457.8,-375.6"/>
+</g>
+<!-- n0000007d&#45;&gt;n00000005 -->
+<g id="edge12" class="edge">
+<title>n0000007d:port4&#45;&gt;n00000005</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-307.5C445.1,-307.5 425.16,-348.79 450,-367.5 451.81,-368.86 453.67,-370.15 455.59,-371.39"/>
+<polygon fill="black" stroke="black" points="453.89,-374.44 464.3,-376.39 457.38,-368.37 453.89,-374.44"/>
+</g>
+<!-- n0000007d&#45;&gt;n00000005 -->
+<g id="edge13" class="edge">
+<title>n0000007d:port5&#45;&gt;n00000005</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-283.5C454.62,-283.5 419.28,-340.92 450,-367.5 451.32,-368.65 452.69,-369.75 454.09,-370.8"/>
+<polygon fill="black" stroke="black" points="452.23,-373.77 462.5,-376.37 456.1,-367.93 452.23,-373.77"/>
+</g>
+<!-- n0000007d&#45;&gt;n00000005 -->
+<g id="edge14" class="edge">
+<title>n0000007d:port6&#45;&gt;n00000005</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-260.5C464.18,-260.5 413.4,-333.17 450,-367.5 451.12,-368.55 452.27,-369.56 453.46,-370.53"/>
+<polygon fill="black" stroke="black" points="451.53,-373.46 461.69,-376.43 455.6,-367.76 451.53,-373.46"/>
+</g>
+<!-- n0000007d&#45;&gt;n00000005 -->
+<g id="edge15" class="edge">
+<title>n0000007d:port7&#45;&gt;n00000005</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-237.5C473.95,-237.5 407.41,-325.31 450,-367.5 450.94,-368.43 451.91,-369.34 452.91,-370.21"/>
+<polygon fill="black" stroke="black" points="450.91,-373.09 460.99,-376.36 455.15,-367.52 450.91,-373.09"/>
+</g>
+<!-- n0000007d&#45;&gt;n00000005 -->
+<g id="edge16" class="edge">
+<title>n0000007d:port8&#45;&gt;n00000005</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-214.5C483.86,-214.5 401.34,-317.38 450,-367.5 450.79,-368.31 451.6,-369.1 452.43,-369.87"/>
+<polygon fill="black" stroke="black" points="450.36,-372.7 460.37,-376.2 454.73,-367.23 450.36,-372.7"/>
+</g>
+<!-- n0000007d&#45;&gt;n00000009 -->
+<g id="edge17" class="edge">
+<title>n0000007d:port1&#45;&gt;n00000009</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-376.5C414.46,-376.5 443.23,-369.17 474.66,-361.12"/>
+<polygon fill="black" stroke="black" points="475.65,-364.48 484.47,-358.61 473.91,-357.7 475.65,-364.48"/>
+</g>
+<!-- n0000007d&#45;&gt;n00000009 -->
+<g id="edge18" class="edge">
+<title>n0000007d:port2&#45;&gt;n00000009</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-353.5C423.03,-353.5 432.36,-353.23 441.74,-352.77"/>
+<polygon fill="black" stroke="black" points="442.12,-356.26 451.91,-352.21 441.73,-349.27 442.12,-356.26"/>
+</g>
+<!-- n0000007d&#45;&gt;n00000009 -->
+<g id="edge19" class="edge">
+<title>n0000007d:port3&#45;&gt;n00000009</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-330.5C423.01,-330.5 432.34,-330.71 441.7,-331.06"/>
+<polygon fill="black" stroke="black" points="441.73,-334.56 451.87,-331.5 442.03,-327.57 441.73,-334.56"/>
+</g>
+<!-- n0000007d&#45;&gt;n00000009 -->
+<g id="edge20" class="edge">
+<title>n0000007d:port4&#45;&gt;n00000009</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-307.5C420.75,-307.5 446.63,-313.3 474.41,-320.04"/>
+<polygon fill="black" stroke="black" points="473.74,-323.48 484.29,-322.46 475.4,-316.68 473.74,-323.48"/>
+</g>
+<!-- n0000007d&#45;&gt;n00000009 -->
+<g id="edge21" class="edge">
+<title>n0000007d:port5&#45;&gt;n00000009</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-283.5C434.83,-283.5 431.46,-304.01 450,-313.5 453.57,-315.33 457.28,-317.04 461.07,-318.64"/>
+<polygon fill="black" stroke="black" points="460.07,-322.01 470.65,-322.4 462.62,-315.49 460.07,-322.01"/>
+</g>
+<!-- n0000007d&#45;&gt;n00000009 -->
+<g id="edge22" class="edge">
+<title>n0000007d:port6&#45;&gt;n00000009</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-260.5C442.48,-260.5 426.71,-297.12 450,-313.5 452.12,-314.99 454.32,-316.4 456.58,-317.73"/>
+<polygon fill="black" stroke="black" points="455.09,-320.91 465.57,-322.49 458.37,-314.72 455.09,-320.91"/>
+</g>
+<!-- n0000007d&#45;&gt;n00000009 -->
+<g id="edge23" class="edge">
+<title>n0000007d:port7&#45;&gt;n00000009</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-237.5C451.38,-237.5 421.18,-289.71 450,-313.5 451.4,-314.65 452.84,-315.76 454.32,-316.82"/>
+<polygon fill="black" stroke="black" points="452.84,-320.02 463.17,-322.38 456.56,-314.1 452.84,-320.02"/>
+</g>
+<!-- n0000007d&#45;&gt;n00000009 -->
+<g id="edge24" class="edge">
+<title>n0000007d:port8&#45;&gt;n00000009</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-214.5C460.82,-214.5 415.33,-282.04 450,-313.5 451.13,-314.53 452.3,-315.52 453.5,-316.47"/>
+<polygon fill="black" stroke="black" points="451.6,-319.41 461.81,-322.24 455.59,-313.66 451.6,-319.41"/>
+</g>
+<!-- n0000007d&#45;&gt;n00000075 -->
+<g id="edge25" class="edge">
+<title>n0000007d:port1&#45;&gt;n00000075</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-376.5C446.25,-376.5 424.45,-333.17 450,-313.5 451.63,-312.25 453.3,-311.05 455.02,-309.91"/>
+<polygon fill="black" stroke="black" points="457.13,-312.73 463.96,-304.63 453.57,-306.7 457.13,-312.73"/>
+</g>
+<!-- n0000007d&#45;&gt;n00000075 -->
+<g id="edge26" class="edge">
+<title>n0000007d:port2&#45;&gt;n00000075</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-353.5C437.92,-353.5 429.6,-325.99 450,-313.5 452.65,-311.88 455.39,-310.35 458.21,-308.91"/>
+<polygon fill="black" stroke="black" points="459.84,-312.01 467.41,-304.59 456.87,-305.67 459.84,-312.01"/>
+</g>
+<!-- n0000007d&#45;&gt;n00000075 -->
+<g id="edge27" class="edge">
+<title>n0000007d:port3&#45;&gt;n00000075</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-330.5C431.69,-330.5 433.38,-319.58 450,-313.5 455.56,-311.46 461.34,-309.51 467.19,-307.64"/>
+<polygon fill="black" stroke="black" points="468.57,-310.88 477.1,-304.58 466.51,-304.19 468.57,-310.88"/>
+</g>
+<!-- n0000007d&#45;&gt;n00000075 -->
+<g id="edge28" class="edge">
+<title>n0000007d:port4&#45;&gt;n00000075</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-307.5C425.31,-307.5 437.06,-306.8 448.75,-305.65"/>
+<polygon fill="black" stroke="black" points="449.42,-309.1 458.98,-304.53 448.66,-302.14 449.42,-309.1"/>
+</g>
+<!-- n0000007d&#45;&gt;n00000075 -->
+<g id="edge29" class="edge">
+<title>n0000007d:port5&#45;&gt;n00000075</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-283.5C422.36,-283.5 430.99,-283.54 439.69,-283.6"/>
+<polygon fill="black" stroke="black" points="439.87,-287.1 449.9,-283.68 439.93,-280.1 439.87,-287.1"/>
+</g>
+<!-- n0000007d&#45;&gt;n00000075 -->
+<g id="edge30" class="edge">
+<title>n0000007d:port6&#45;&gt;n00000075</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-260.5C430.94,-260.5 448.85,-262.27 466.01,-264.87"/>
+<polygon fill="black" stroke="black" points="465.59,-268.35 476.02,-266.49 466.7,-261.44 465.59,-268.35"/>
+</g>
+<!-- n0000007d&#45;&gt;n00000075 -->
+<g id="edge31" class="edge">
+<title>n0000007d:port7&#45;&gt;n00000075</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-237.5C447.66,-237.5 483.54,-249.91 510.68,-262.11"/>
+<polygon fill="black" stroke="black" points="509.35,-265.35 519.9,-266.39 512.31,-259 509.35,-265.35"/>
+</g>
+<!-- n0000007d&#45;&gt;n00000075 -->
+<g id="edge32" class="edge">
+<title>n0000007d:port8&#45;&gt;n00000075</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-214.5C455.98,-214.5 498.19,-239.91 525.34,-260.33"/>
+<polygon fill="black" stroke="black" points="523.22,-263.11 533.26,-266.47 527.5,-257.58 523.22,-263.11"/>
+</g>
+<!-- n0000007d&#45;&gt;n00000079 -->
+<g id="edge33" class="edge">
+<title>n0000007d:port1&#45;&gt;n00000079</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-376.5C462.49,-376.5 414.44,-446.53 450,-479.5 451.12,-480.54 452.28,-481.55 453.47,-482.51"/>
+<polygon fill="black" stroke="black" points="451.56,-485.45 461.74,-488.38 455.61,-479.74 451.56,-485.45"/>
+</g>
+<!-- n0000007d&#45;&gt;n00000079 -->
+<g id="edge34" class="edge">
+<title>n0000007d:port2&#45;&gt;n00000079</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-353.5C472.24,-353.5 408.45,-438.68 450,-479.5 450.95,-480.43 451.92,-481.33 452.92,-482.2"/>
+<polygon fill="black" stroke="black" points="450.94,-485.09 461.03,-488.32 455.16,-479.5 450.94,-485.09"/>
+</g>
+<!-- n0000007d&#45;&gt;n00000079 -->
+<g id="edge35" class="edge">
+<title>n0000007d:port3&#45;&gt;n00000079</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-330.5C482.13,-330.5 402.4,-430.76 450,-479.5 450.93,-480.45 451.88,-481.37 452.86,-482.25"/>
+<polygon fill="black" stroke="black" points="450.82,-485.1 460.86,-488.49 455.13,-479.58 450.82,-485.1"/>
+</g>
+<!-- n0000007d&#45;&gt;n00000079 -->
+<g id="edge36" class="edge">
+<title>n0000007d:port4&#45;&gt;n00000079</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-307.5C492.1,-307.5 396.29,-422.8 450,-479.5 450.78,-480.32 451.58,-481.12 452.4,-481.9"/>
+<polygon fill="black" stroke="black" points="450.3,-484.7 460.27,-488.29 454.71,-479.27 450.3,-484.7"/>
+</g>
+<!-- n0000007d&#45;&gt;n00000079 -->
+<g id="edge37" class="edge">
+<title>n0000007d:port5&#45;&gt;n00000079</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-283.5C502.57,-283.5 389.89,-414.45 450,-479.5 450.77,-480.33 451.56,-481.14 452.37,-481.92"/>
+<polygon fill="black" stroke="black" points="450.23,-484.7 460.17,-488.39 454.7,-479.31 450.23,-484.7"/>
+</g>
+<!-- n0000007d&#45;&gt;n00000079 -->
+<g id="edge38" class="edge">
+<title>n0000007d:port6&#45;&gt;n00000079</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-260.5C463.32,-260.5 416.87,-442.96 450,-479.5 450.76,-480.34 451.54,-481.15 452.35,-481.94"/>
+<polygon fill="black" stroke="black" points="450.18,-484.7 460.09,-488.46 454.69,-479.34 450.18,-484.7"/>
+</g>
+<!-- n0000007d&#45;&gt;n00000079 -->
+<g id="edge39" class="edge">
+<title>n0000007d:port7&#45;&gt;n00000079</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-237.5C468.37,-237.5 413.79,-438.95 450,-479.5 450.63,-480.21 451.28,-480.9 451.94,-481.57"/>
+<polygon fill="black" stroke="black" points="449.72,-484.28 459.57,-488.18 454.3,-478.99 449.72,-484.28"/>
+</g>
+<!-- n0000007d&#45;&gt;n00000079 -->
+<g id="edge40" class="edge">
+<title>n0000007d:port8&#45;&gt;n00000079</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-214.5C473.43,-214.5 410.7,-434.92 450,-479.5 450.63,-480.21 451.27,-480.91 451.93,-481.58"/>
+<polygon fill="black" stroke="black" points="449.69,-484.28 459.52,-488.23 454.3,-479.01 449.69,-484.28"/>
+</g>
+<!-- n00000087 -->
+<g id="node7" class="node">
+<title>n00000087</title>
+<path fill="chartreuse" stroke="black" d="M232,-0.5C232,-0.5 402,-0.5 402,-0.5 408,-0.5 414,-6.5 414,-12.5 414,-12.5 414,-172.5 414,-172.5 414,-178.5 408,-184.5 402,-184.5 402,-184.5 232,-184.5 232,-184.5 226,-184.5 220,-178.5 220,-172.5 220,-172.5 220,-12.5 220,-12.5 220,-6.5 226,-0.5 232,-0.5"/>
+<text text-anchor="middle" x="233" y="-88.8" font-family="Times,serif" font-size="14.00">0</text>
+<polyline fill="none" stroke="black" points="246,-0.5 246,-184.5 "/>
+<text text-anchor="middle" x="317" y="-96.3" font-family="Times,serif" font-size="14.00">Intel IPU6 CSI2 1</text>
+<text text-anchor="middle" x="317" y="-81.3" font-family="Times,serif" font-size="14.00">/dev/v4l&#45;subdev1</text>
+<polyline fill="none" stroke="black" points="388,-0.5 388,-184.5 "/>
+<text text-anchor="middle" x="401" y="-169.3" font-family="Times,serif" font-size="14.00">1</text>
+<polyline fill="none" stroke="black" points="388,-161.5 414,-161.5 "/>
+<text text-anchor="middle" x="401" y="-146.3" font-family="Times,serif" font-size="14.00">2</text>
+<polyline fill="none" stroke="black" points="388,-138.5 414,-138.5 "/>
+<text text-anchor="middle" x="401" y="-123.3" font-family="Times,serif" font-size="14.00">3</text>
+<polyline fill="none" stroke="black" points="388,-115.5 414,-115.5 "/>
+<text text-anchor="middle" x="401" y="-100.3" font-family="Times,serif" font-size="14.00">4</text>
+<polyline fill="none" stroke="black" points="388,-92.5 414,-92.5 "/>
+<text text-anchor="middle" x="401" y="-77.3" font-family="Times,serif" font-size="14.00">5</text>
+<polyline fill="none" stroke="black" points="388,-69.5 414,-69.5 "/>
+<text text-anchor="middle" x="401" y="-54.3" font-family="Times,serif" font-size="14.00">6</text>
+<polyline fill="none" stroke="black" points="388,-46.5 414,-46.5 "/>
+<text text-anchor="middle" x="401" y="-31.3" font-family="Times,serif" font-size="14.00">7</text>
+<polyline fill="none" stroke="black" points="388,-23.5 414,-23.5 "/>
+<text text-anchor="middle" x="401" y="-8.3" font-family="Times,serif" font-size="14.00">8</text>
+</g>
+<!-- n00000087&#45;&gt;n00000001 -->
+<g id="edge41" class="edge">
+<title>n00000087:port1&#45;&gt;n00000001</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M401,-185.5C401,-192.53 410.26,-188.55 414,-194.5 468.78,-281.76 381.06,-346.94 450,-423.5 450.76,-424.34 451.54,-425.16 452.34,-425.95"/>
+<polygon fill="black" stroke="black" points="450.16,-428.7 460.06,-432.48 454.68,-423.35 450.16,-428.7"/>
+</g>
+<!-- n00000087&#45;&gt;n00000001 -->
+<g id="edge42" class="edge">
+<title>n00000087:port2&#45;&gt;n00000001</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-150.5C475.19,-150.5 409.62,-377.52 450,-423.5 450.63,-424.21 451.27,-424.91 451.93,-425.59"/>
+<polygon fill="black" stroke="black" points="449.68,-428.28 459.51,-432.24 454.3,-423.01 449.68,-428.28"/>
+</g>
+<!-- n00000087&#45;&gt;n00000001 -->
+<g id="edge43" class="edge">
+<title>n00000087:port3&#45;&gt;n00000001</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-127.5C480.26,-127.5 406.53,-373.49 450,-423.5 450.62,-424.22 451.26,-424.92 451.92,-425.6"/>
+<polygon fill="black" stroke="black" points="449.66,-428.27 459.47,-432.28 454.29,-423.03 449.66,-428.27"/>
+</g>
+<!-- n00000087&#45;&gt;n00000001 -->
+<g id="edge44" class="edge">
+<title>n00000087:port4&#45;&gt;n00000001</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-104.5C485.34,-104.5 403.43,-369.46 450,-423.5 450.62,-424.22 451.26,-424.92 451.91,-425.61"/>
+<polygon fill="black" stroke="black" points="449.63,-428.27 459.43,-432.31 454.29,-423.04 449.63,-428.27"/>
+</g>
+<!-- n00000087&#45;&gt;n00000001 -->
+<g id="edge45" class="edge">
+<title>n00000087:port5&#45;&gt;n00000001</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-80.5C490.64,-80.5 400.2,-365.25 450,-423.5 450.62,-424.22 451.25,-424.93 451.9,-425.61"/>
+<polygon fill="black" stroke="black" points="449.62,-428.27 459.4,-432.33 454.29,-423.05 449.62,-428.27"/>
+</g>
+<!-- n00000087&#45;&gt;n00000001 -->
+<g id="edge46" class="edge">
+<title>n00000087:port6&#45;&gt;n00000001</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-57.5C495.73,-57.5 397.09,-361.21 450,-423.5 450.61,-424.22 451.25,-424.93 451.89,-425.62"/>
+<polygon fill="black" stroke="black" points="449.6,-428.26 459.37,-432.36 454.28,-423.06 449.6,-428.26"/>
+</g>
+<!-- n00000087&#45;&gt;n00000001 -->
+<g id="edge47" class="edge">
+<title>n00000087:port7&#45;&gt;n00000001</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-34.5C500.81,-34.5 393.99,-357.17 450,-423.5 450.61,-424.23 451.24,-424.93 451.89,-425.62"/>
+<polygon fill="black" stroke="black" points="449.58,-428.26 459.35,-432.38 454.28,-423.07 449.58,-428.26"/>
+</g>
+<!-- n00000087&#45;&gt;n00000001 -->
+<g id="edge48" class="edge">
+<title>n00000087:port8&#45;&gt;n00000001</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-11.5C459.95,-11.5 420.44,-388.31 450,-423.5 450.61,-424.23 451.24,-424.94 451.88,-425.63"/>
+<polygon fill="black" stroke="black" points="449.57,-428.26 459.33,-432.39 454.28,-423.08 449.57,-428.26"/>
+</g>
+<!-- n00000087&#45;&gt;n00000005 -->
+<g id="edge49" class="edge">
+<title>n00000087:port1&#45;&gt;n00000005</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M401,-185.5C401,-192.53 410.12,-188.64 414,-194.5 457.38,-259.97 396.03,-310.45 450,-367.5 450.78,-368.32 451.58,-369.12 452.4,-369.9"/>
+<polygon fill="black" stroke="black" points="450.3,-372.7 460.26,-376.3 454.71,-367.27 450.3,-372.7"/>
+</g>
+<!-- n00000087&#45;&gt;n00000005 -->
+<g id="edge50" class="edge">
+<title>n00000087:port2&#45;&gt;n00000005</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-150.5C462.88,-150.5 417.14,-331.31 450,-367.5 450.76,-368.34 451.54,-369.15 452.35,-369.94"/>
+<polygon fill="black" stroke="black" points="450.19,-372.7 460.1,-376.45 454.69,-367.34 450.19,-372.7"/>
+</g>
+<!-- n00000087&#45;&gt;n00000005 -->
+<g id="edge51" class="edge">
+<title>n00000087:port3&#45;&gt;n00000005</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-127.5C467.93,-127.5 414.05,-327.3 450,-367.5 450.63,-368.21 451.28,-368.9 451.94,-369.57"/>
+<polygon fill="black" stroke="black" points="449.73,-372.28 459.58,-376.18 454.31,-366.99 449.73,-372.28"/>
+</g>
+<!-- n00000087&#45;&gt;n00000005 -->
+<g id="edge52" class="edge">
+<title>n00000087:port4&#45;&gt;n00000005</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-104.5C472.99,-104.5 410.97,-323.27 450,-367.5 450.63,-368.21 451.27,-368.91 451.93,-369.58"/>
+<polygon fill="black" stroke="black" points="449.69,-372.28 459.53,-376.22 454.3,-367.01 449.69,-372.28"/>
+</g>
+<!-- n00000087&#45;&gt;n00000005 -->
+<g id="edge53" class="edge">
+<title>n00000087:port5&#45;&gt;n00000005</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-80.5C478.28,-80.5 407.74,-319.07 450,-367.5 450.62,-368.22 451.26,-368.91 451.92,-369.59"/>
+<polygon fill="black" stroke="black" points="449.67,-372.27 459.48,-376.26 454.3,-367.02 449.67,-372.27"/>
+</g>
+<!-- n00000087&#45;&gt;n00000005 -->
+<g id="edge54" class="edge">
+<title>n00000087:port6&#45;&gt;n00000005</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-57.5C483.35,-57.5 404.64,-315.04 450,-367.5 450.62,-368.22 451.26,-368.92 451.91,-369.6"/>
+<polygon fill="black" stroke="black" points="449.64,-372.27 459.44,-376.29 454.29,-367.04 449.64,-372.27"/>
+</g>
+<!-- n00000087&#45;&gt;n00000005 -->
+<g id="edge55" class="edge">
+<title>n00000087:port7&#45;&gt;n00000005</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-34.5C488.43,-34.5 401.54,-311 450,-367.5 450.62,-368.22 451.25,-368.92 451.9,-369.61"/>
+<polygon fill="black" stroke="black" points="449.62,-372.27 459.41,-376.32 454.29,-367.05 449.62,-372.27"/>
+</g>
+<!-- n00000087&#45;&gt;n00000005 -->
+<g id="edge56" class="edge">
+<title>n00000087:port8&#45;&gt;n00000005</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-11.5C493.51,-11.5 398.44,-306.97 450,-367.5 450.62,-368.22 451.25,-368.93 451.89,-369.62"/>
+<polygon fill="black" stroke="black" points="449.61,-372.26 459.38,-376.35 454.29,-367.06 449.61,-372.26"/>
+</g>
+<!-- n00000087&#45;&gt;n00000009 -->
+<g id="edge57" class="edge">
+<title>n00000087:port1&#45;&gt;n00000009</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M401,-185.5C401,-192.53 409.86,-188.82 414,-194.5 446.53,-239.16 410.11,-275.26 450,-313.5 451.1,-314.56 452.24,-315.58 453.42,-316.56"/>
+<polygon fill="black" stroke="black" points="451.43,-319.44 461.58,-322.48 455.54,-313.78 451.43,-319.44"/>
+</g>
+<!-- n00000087&#45;&gt;n00000009 -->
+<g id="edge58" class="edge">
+<title>n00000087:port2&#45;&gt;n00000009</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-150.5C488.19,-150.5 398.45,-260.15 450,-313.5 450.92,-314.45 451.87,-315.37 452.84,-316.26"/>
+<polygon fill="black" stroke="black" points="450.76,-319.08 460.8,-322.49 455.08,-313.57 450.76,-319.08"/>
+</g>
+<!-- n00000087&#45;&gt;n00000009 -->
+<g id="edge59" class="edge">
+<title>n00000087:port3&#45;&gt;n00000009</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-127.5C498.2,-127.5 392.29,-252.19 450,-313.5 450.77,-314.32 451.57,-315.12 452.38,-315.9"/>
+<polygon fill="black" stroke="black" points="450.26,-318.68 460.22,-322.27 454.67,-313.25 450.26,-318.68"/>
+</g>
+<!-- n00000087&#45;&gt;n00000009 -->
+<g id="edge60" class="edge">
+<title>n00000087:port4&#45;&gt;n00000009</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-104.5C461.13,-104.5 418.05,-278.85 450,-313.5 450.77,-314.33 451.55,-315.14 452.36,-315.92"/>
+<polygon fill="black" stroke="black" points="450.2,-318.68 460.14,-322.35 454.66,-313.28 450.2,-318.68"/>
+</g>
+<!-- n00000087&#45;&gt;n00000009 -->
+<g id="edge61" class="edge">
+<title>n00000087:port5&#45;&gt;n00000009</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-80.5C466.39,-80.5 414.82,-274.68 450,-313.5 450.76,-314.34 451.54,-315.15 452.34,-315.94"/>
+<polygon fill="black" stroke="black" points="450.16,-318.67 460.07,-322.42 454.65,-313.31 450.16,-318.67"/>
+</g>
+<!-- n00000087&#45;&gt;n00000009 -->
+<g id="edge62" class="edge">
+<title>n00000087:port6&#45;&gt;n00000009</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-57.5C471.45,-57.5 411.71,-270.67 450,-313.5 450.75,-314.34 451.53,-315.16 452.32,-315.95"/>
+<polygon fill="black" stroke="black" points="450.12,-318.67 460.01,-322.47 454.64,-313.33 450.12,-318.67"/>
+</g>
+<!-- n00000087&#45;&gt;n00000009 -->
+<g id="edge63" class="edge">
+<title>n00000087:port7&#45;&gt;n00000009</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-34.5C476.51,-34.5 408.6,-266.66 450,-313.5 450.63,-314.21 451.27,-314.9 451.93,-315.58"/>
+<polygon fill="black" stroke="black" points="449.67,-318.25 459.51,-322.18 454.27,-312.97 449.67,-318.25"/>
+</g>
+<!-- n00000087&#45;&gt;n00000009 -->
+<g id="edge64" class="edge">
+<title>n00000087:port8&#45;&gt;n00000009</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-11.5C481.59,-11.5 405.49,-262.64 450,-313.5 450.62,-314.21 451.26,-314.91 451.92,-315.59"/>
+<polygon fill="black" stroke="black" points="449.65,-318.25 459.48,-322.21 454.26,-312.99 449.65,-318.25"/>
+</g>
+<!-- n00000087&#45;&gt;n00000075 -->
+<g id="edge65" class="edge">
+<title>n00000087:port1&#45;&gt;n00000075</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-173.5C468.09,-173.5 513.48,-224.67 537.22,-257.84"/>
+<polygon fill="black" stroke="black" points="534.48,-260.03 543.05,-266.25 540.23,-256.04 534.48,-260.03"/>
+</g>
+<!-- n00000087&#45;&gt;n00000075 -->
+<g id="edge66" class="edge">
+<title>n00000087:port2&#45;&gt;n00000075</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-150.5C475.34,-150.5 520.42,-217.98 541.58,-257.52"/>
+<polygon fill="black" stroke="black" points="538.49,-259.17 546.2,-266.44 544.71,-255.95 538.49,-259.17"/>
+</g>
+<!-- n00000087&#45;&gt;n00000075 -->
+<g id="edge67" class="edge">
+<title>n00000087:port3&#45;&gt;n00000075</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-127.5C482.67,-127.5 526.2,-211.62 544.71,-257.1"/>
+<polygon fill="black" stroke="black" points="541.47,-258.42 548.39,-266.44 547.98,-255.85 541.47,-258.42"/>
+</g>
+<!-- n00000087&#45;&gt;n00000075 -->
+<g id="edge68" class="edge">
+<title>n00000087:port4&#45;&gt;n00000075</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-104.5C490.21,-104.5 531.26,-205.59 547.14,-256.68"/>
+<polygon fill="black" stroke="black" points="543.85,-257.89 550.07,-266.47 550.56,-255.89 543.85,-257.89"/>
+</g>
+<!-- n00000087&#45;&gt;n00000075 -->
+<g id="edge69" class="edge">
+<title>n00000087:port5&#45;&gt;n00000075</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-80.5C498.38,-80.5 536.08,-199.86 549.21,-256.43"/>
+<polygon fill="black" stroke="black" points="545.8,-257.21 551.39,-266.21 552.64,-255.69 545.8,-257.21"/>
+</g>
+<!-- n00000087&#45;&gt;n00000075 -->
+<g id="edge70" class="edge">
+<title>n00000087:port6&#45;&gt;n00000075</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-57.5C506.42,-57.5 540.3,-194.69 550.85,-256.23"/>
+<polygon fill="black" stroke="black" points="547.45,-257.14 552.51,-266.45 554.36,-256.02 547.45,-257.14"/>
+</g>
+<!-- n00000087&#45;&gt;n00000075 -->
+<g id="edge71" class="edge">
+<title>n00000087:port7&#45;&gt;n00000075</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-34.5C514.61,-34.5 544.18,-189.69 552.22,-256.01"/>
+<polygon fill="black" stroke="black" points="548.77,-256.68 553.37,-266.22 555.73,-255.89 548.77,-256.68"/>
+</g>
+<!-- n00000087&#45;&gt;n00000075 -->
+<g id="edge72" class="edge">
+<title>n00000087:port8&#45;&gt;n00000075</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-11.5C523.15,-11.5 547.88,-185.54 553.42,-256.2"/>
+<polygon fill="black" stroke="black" points="549.93,-256.51 554.13,-266.23 556.92,-256.01 549.93,-256.51"/>
+</g>
+<!-- n00000087&#45;&gt;n00000079 -->
+<g id="edge73" class="edge">
+<title>n00000087:port1&#45;&gt;n00000079</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M401,-185.5C401,-192.53 410.35,-188.49 414,-194.5 480.24,-303.65 366.01,-383.34 450,-479.5 450.62,-480.21 451.26,-480.91 451.92,-481.59"/>
+<polygon fill="black" stroke="black" points="449.67,-484.27 459.48,-488.26 454.3,-479.02 449.67,-484.27"/>
+</g>
+<!-- n00000087&#45;&gt;n00000079 -->
+<g id="edge74" class="edge">
+<title>n00000087:port2&#45;&gt;n00000079</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-150.5C487.55,-150.5 402.08,-423.7 450,-479.5 450.62,-480.22 451.25,-480.92 451.9,-481.61"/>
+<polygon fill="black" stroke="black" points="449.63,-484.27 459.42,-488.32 454.29,-479.05 449.63,-484.27"/>
+</g>
+<!-- n00000087&#45;&gt;n00000079 -->
+<g id="edge75" class="edge">
+<title>n00000087:port3&#45;&gt;n00000079</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-127.5C492.63,-127.5 398.98,-419.67 450,-479.5 450.62,-480.22 451.25,-480.93 451.9,-481.61"/>
+<polygon fill="black" stroke="black" points="449.61,-484.26 459.39,-488.34 454.29,-479.06 449.61,-484.26"/>
+</g>
+<!-- n00000087&#45;&gt;n00000079 -->
+<g id="edge76" class="edge">
+<title>n00000087:port4&#45;&gt;n00000079</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-104.5C497.72,-104.5 395.88,-415.63 450,-479.5 450.61,-480.22 451.24,-480.93 451.89,-481.62"/>
+<polygon fill="black" stroke="black" points="449.59,-484.26 459.36,-488.36 454.28,-479.07 449.59,-484.26"/>
+</g>
+<!-- n00000087&#45;&gt;n00000079 -->
+<g id="edge77" class="edge">
+<title>n00000087:port5&#45;&gt;n00000079</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-80.5C458.51,-80.5 421.32,-445.46 450,-479.5 450.61,-480.23 451.24,-480.93 451.88,-481.63"/>
+<polygon fill="black" stroke="black" points="449.58,-484.26 459.34,-488.38 454.28,-479.07 449.58,-484.26"/>
+</g>
+<!-- n00000087&#45;&gt;n00000079 -->
+<g id="edge78" class="edge">
+<title>n00000087:port6&#45;&gt;n00000079</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-57.5C461.06,-57.5 419.77,-443.44 450,-479.5 450.61,-480.23 451.24,-480.94 451.88,-481.63"/>
+<polygon fill="black" stroke="black" points="449.57,-484.26 459.32,-488.4 454.28,-479.08 449.57,-484.26"/>
+</g>
+<!-- n00000087&#45;&gt;n00000079 -->
+<g id="edge79" class="edge">
+<title>n00000087:port7&#45;&gt;n00000079</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-34.5C463.61,-34.5 418.22,-441.41 450,-479.5 450.61,-480.23 451.23,-480.94 451.87,-481.63"/>
+<polygon fill="black" stroke="black" points="449.56,-484.26 459.3,-488.42 454.28,-479.09 449.56,-484.26"/>
+</g>
+<!-- n00000087&#45;&gt;n00000079 -->
+<g id="edge80" class="edge">
+<title>n00000087:port8&#45;&gt;n00000079</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-11.5C466.15,-11.5 416.66,-439.39 450,-479.5 450.61,-480.23 451.23,-480.94 451.87,-481.64"/>
+<polygon fill="black" stroke="black" points="449.55,-484.25 459.28,-488.43 454.28,-479.09 449.55,-484.25"/>
+</g>
+<!-- n00000091 -->
+<g id="node8" class="node">
+<title>n00000091</title>
+<path fill="chartreuse" stroke="black" d="M232,-609.5C232,-609.5 402,-609.5 402,-609.5 408,-609.5 414,-615.5 414,-621.5 414,-621.5 414,-781.5 414,-781.5 414,-787.5 408,-793.5 402,-793.5 402,-793.5 232,-793.5 232,-793.5 226,-793.5 220,-787.5 220,-781.5 220,-781.5 220,-621.5 220,-621.5 220,-615.5 226,-609.5 232,-609.5"/>
+<text text-anchor="middle" x="233" y="-697.8" font-family="Times,serif" font-size="14.00">0</text>
+<polyline fill="none" stroke="black" points="246,-609.5 246,-793.5 "/>
+<text text-anchor="middle" x="317" y="-705.3" font-family="Times,serif" font-size="14.00">Intel IPU6 CSI2 2</text>
+<text text-anchor="middle" x="317" y="-690.3" font-family="Times,serif" font-size="14.00">/dev/v4l&#45;subdev2</text>
+<polyline fill="none" stroke="black" points="388,-609.5 388,-793.5 "/>
+<text text-anchor="middle" x="401" y="-778.3" font-family="Times,serif" font-size="14.00">1</text>
+<polyline fill="none" stroke="black" points="388,-770.5 414,-770.5 "/>
+<text text-anchor="middle" x="401" y="-755.3" font-family="Times,serif" font-size="14.00">2</text>
+<polyline fill="none" stroke="black" points="388,-747.5 414,-747.5 "/>
+<text text-anchor="middle" x="401" y="-732.3" font-family="Times,serif" font-size="14.00">3</text>
+<polyline fill="none" stroke="black" points="388,-724.5 414,-724.5 "/>
+<text text-anchor="middle" x="401" y="-709.3" font-family="Times,serif" font-size="14.00">4</text>
+<polyline fill="none" stroke="black" points="388,-701.5 414,-701.5 "/>
+<text text-anchor="middle" x="401" y="-686.3" font-family="Times,serif" font-size="14.00">5</text>
+<polyline fill="none" stroke="black" points="388,-678.5 414,-678.5 "/>
+<text text-anchor="middle" x="401" y="-663.3" font-family="Times,serif" font-size="14.00">6</text>
+<polyline fill="none" stroke="black" points="388,-655.5 414,-655.5 "/>
+<text text-anchor="middle" x="401" y="-640.3" font-family="Times,serif" font-size="14.00">7</text>
+<polyline fill="none" stroke="black" points="388,-632.5 414,-632.5 "/>
+<text text-anchor="middle" x="401" y="-617.3" font-family="Times,serif" font-size="14.00">8</text>
+</g>
+<!-- n00000091&#45;&gt;n00000001 -->
+<g id="edge81" class="edge">
+<title>n00000091:port1&#45;&gt;n00000001</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-782.5C481.81,-782.5 405.58,-530.73 450,-479.5 450.62,-478.78 451.26,-478.08 451.91,-477.4"/>
+<polygon fill="black" stroke="black" points="454.29,-479.97 459.45,-470.71 449.65,-474.73 454.29,-479.97"/>
+</g>
+<!-- n00000091&#45;&gt;n00000001 -->
+<g id="edge82" class="edge">
+<title>n00000091:port2&#45;&gt;n00000001</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-759.5C476.73,-759.5 408.68,-526.7 450,-479.5 450.63,-478.79 451.27,-478.09 451.92,-477.41"/>
+<polygon fill="black" stroke="black" points="454.3,-479.98 459.49,-470.75 449.67,-474.73 454.3,-479.98"/>
+</g>
+<!-- n00000091&#45;&gt;n00000001 -->
+<g id="edge83" class="edge">
+<title>n00000091:port3&#45;&gt;n00000001</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-736.5C471.67,-736.5 411.77,-522.68 450,-479.5 450.63,-478.79 451.27,-478.1 451.93,-477.42"/>
+<polygon fill="black" stroke="black" points="454.3,-480 459.54,-470.79 449.7,-474.72 454.3,-480"/>
+</g>
+<!-- n00000091&#45;&gt;n00000001 -->
+<g id="edge84" class="edge">
+<title>n00000091:port4&#45;&gt;n00000001</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-713.5C466.61,-713.5 414.86,-518.66 450,-479.5 450.76,-478.66 451.53,-477.84 452.33,-477.04"/>
+<polygon fill="black" stroke="black" points="454.68,-479.64 460.05,-470.51 450.16,-474.3 454.68,-479.64"/>
+</g>
+<!-- n00000091&#45;&gt;n00000001 -->
+<g id="edge85" class="edge">
+<title>n00000091:port5&#45;&gt;n00000001</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-689.5C461.35,-689.5 418.07,-514.47 450,-479.5 450.76,-478.66 451.55,-477.85 452.35,-477.06"/>
+<polygon fill="black" stroke="black" points="454.69,-479.67 460.12,-470.57 450.2,-474.3 454.69,-479.67"/>
+</g>
+<!-- n00000091&#45;&gt;n00000001 -->
+<g id="edge86" class="edge">
+<title>n00000091:port6&#45;&gt;n00000001</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-666.5C498.64,-666.5 392.3,-541.42 450,-479.5 450.77,-478.67 451.57,-477.87 452.38,-477.09"/>
+<polygon fill="black" stroke="black" points="454.7,-479.7 460.2,-470.65 450.26,-474.3 454.7,-479.7"/>
+</g>
+<!-- n00000091&#45;&gt;n00000001 -->
+<g id="edge87" class="edge">
+<title>n00000091:port7&#45;&gt;n00000001</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-643.5C488.62,-643.5 398.42,-533.43 450,-479.5 450.78,-478.68 451.59,-477.89 452.41,-477.11"/>
+<polygon fill="black" stroke="black" points="454.72,-479.75 460.31,-470.75 450.33,-474.3 454.72,-479.75"/>
+</g>
+<!-- n00000091&#45;&gt;n00000001 -->
+<g id="edge88" class="edge">
+<title>n00000091:port8&#45;&gt;n00000001</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M401,-608.5C401,-601.72 409.87,-605.88 414,-600.5 448.14,-555.98 409.76,-518.6 450,-479.5 450.95,-478.58 451.93,-477.68 452.93,-476.81"/>
+<polygon fill="black" stroke="black" points="455.16,-479.52 461.07,-470.72 450.97,-473.91 455.16,-479.52"/>
+</g>
+<!-- n00000091&#45;&gt;n00000005 -->
+<g id="edge89" class="edge">
+<title>n00000091:port1&#45;&gt;n00000005</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-782.5C494.18,-782.5 398.04,-484.56 450,-423.5 450.62,-422.78 451.25,-422.07 451.89,-421.38"/>
+<polygon fill="black" stroke="black" points="454.29,-423.94 459.38,-414.65 449.6,-418.74 454.29,-423.94"/>
+</g>
+<!-- n00000091&#45;&gt;n00000005 -->
+<g id="edge90" class="edge">
+<title>n00000091:port2&#45;&gt;n00000005</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-759.5C489.09,-759.5 401.14,-480.52 450,-423.5 450.62,-422.78 451.25,-422.08 451.9,-421.39"/>
+<polygon fill="black" stroke="black" points="454.29,-423.95 459.41,-414.67 449.62,-418.73 454.29,-423.95"/>
+</g>
+<!-- n00000091&#45;&gt;n00000005 -->
+<g id="edge91" class="edge">
+<title>n00000091:port3&#45;&gt;n00000005</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-736.5C484.01,-736.5 404.24,-476.49 450,-423.5 450.62,-422.78 451.26,-422.08 451.91,-421.4"/>
+<polygon fill="black" stroke="black" points="454.29,-423.96 459.44,-414.7 449.64,-418.73 454.29,-423.96"/>
+</g>
+<!-- n00000091&#45;&gt;n00000005 -->
+<g id="edge92" class="edge">
+<title>n00000091:port4&#45;&gt;n00000005</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-713.5C478.94,-713.5 407.33,-472.46 450,-423.5 450.62,-422.78 451.26,-422.09 451.92,-421.4"/>
+<polygon fill="black" stroke="black" points="454.3,-423.98 459.48,-414.73 449.66,-418.73 454.3,-423.98"/>
+</g>
+<!-- n00000091&#45;&gt;n00000005 -->
+<g id="edge93" class="edge">
+<title>n00000091:port5&#45;&gt;n00000005</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-689.5C473.65,-689.5 410.56,-468.25 450,-423.5 450.63,-422.79 451.27,-422.09 451.93,-421.41"/>
+<polygon fill="black" stroke="black" points="454.3,-423.99 459.52,-414.77 449.69,-418.72 454.3,-423.99"/>
+</g>
+<!-- n00000091&#45;&gt;n00000005 -->
+<g id="edge94" class="edge">
+<title>n00000091:port6&#45;&gt;n00000005</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-666.5C468.59,-666.5 413.65,-464.23 450,-423.5 450.63,-422.79 451.28,-422.1 451.94,-421.43"/>
+<polygon fill="black" stroke="black" points="454.3,-424.01 459.57,-414.82 449.72,-418.72 454.3,-424.01"/>
+</g>
+<!-- n00000091&#45;&gt;n00000005 -->
+<g id="edge95" class="edge">
+<title>n00000091:port7&#45;&gt;n00000005</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-643.5C463.54,-643.5 416.74,-460.21 450,-423.5 450.76,-422.66 451.54,-421.85 452.34,-421.05"/>
+<polygon fill="black" stroke="black" points="454.69,-423.66 460.09,-414.54 450.18,-418.3 454.69,-423.66"/>
+</g>
+<!-- n00000091&#45;&gt;n00000005 -->
+<g id="edge96" class="edge">
+<title>n00000091:port8&#45;&gt;n00000005</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M401,-608.5C401,-601.72 410.11,-606.06 414,-600.5 459.98,-534.7 394.96,-481.94 450,-423.5 450.78,-422.68 451.57,-421.88 452.39,-421.1"/>
+<polygon fill="black" stroke="black" points="454.71,-423.72 460.24,-414.69 450.28,-418.3 454.71,-423.72"/>
+</g>
+<!-- n00000091&#45;&gt;n00000009 -->
+<g id="edge97" class="edge">
+<title>n00000091:port1&#45;&gt;n00000009</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-782.5C460.28,-782.5 420.08,-402.82 450,-367.5 450.61,-366.78 451.24,-366.07 451.88,-365.39"/>
+<polygon fill="black" stroke="black" points="454.25,-367.97 459.34,-358.68 449.57,-362.76 454.25,-367.97"/>
+</g>
+<!-- n00000091&#45;&gt;n00000009 -->
+<g id="edge98" class="edge">
+<title>n00000091:port2&#45;&gt;n00000009</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-759.5C501.48,-759.5 393.29,-434.1 450,-367.5 450.61,-366.78 451.24,-366.08 451.89,-365.39"/>
+<polygon fill="black" stroke="black" points="454.25,-367.97 459.37,-358.69 449.58,-362.76 454.25,-367.97"/>
+</g>
+<!-- n00000091&#45;&gt;n00000009 -->
+<g id="edge99" class="edge">
+<title>n00000091:port3&#45;&gt;n00000009</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-736.5C496.39,-736.5 396.41,-430.08 450,-367.5 450.62,-366.78 451.25,-366.08 451.9,-365.4"/>
+<polygon fill="black" stroke="black" points="454.25,-367.98 459.39,-358.71 449.6,-362.76 454.25,-367.98"/>
+</g>
+<!-- n00000091&#45;&gt;n00000009 -->
+<g id="edge100" class="edge">
+<title>n00000091:port4&#45;&gt;n00000009</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-713.5C491.3,-713.5 399.53,-426.05 450,-367.5 450.62,-366.78 451.25,-366.08 451.9,-365.4"/>
+<polygon fill="black" stroke="black" points="454.26,-367.99 459.41,-358.74 449.61,-362.75 454.26,-367.99"/>
+</g>
+<!-- n00000091&#45;&gt;n00000009 -->
+<g id="edge101" class="edge">
+<title>n00000091:port5&#45;&gt;n00000009</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-689.5C486,-689.5 402.78,-421.86 450,-367.5 450.62,-366.79 451.26,-366.09 451.91,-365.41"/>
+<polygon fill="black" stroke="black" points="454.26,-368 459.45,-358.76 449.63,-362.75 454.26,-368"/>
+</g>
+<!-- n00000091&#45;&gt;n00000009 -->
+<g id="edge102" class="edge">
+<title>n00000091:port6&#45;&gt;n00000009</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-666.5C480.92,-666.5 405.9,-417.84 450,-367.5 450.62,-366.79 451.26,-366.09 451.92,-365.42"/>
+<polygon fill="black" stroke="black" points="454.26,-368.01 459.48,-358.79 449.65,-362.75 454.26,-368.01"/>
+</g>
+<!-- n00000091&#45;&gt;n00000009 -->
+<g id="edge103" class="edge">
+<title>n00000091:port7&#45;&gt;n00000009</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-643.5C475.85,-643.5 409.01,-413.82 450,-367.5 450.63,-366.79 451.27,-366.1 451.93,-365.42"/>
+<polygon fill="black" stroke="black" points="454.27,-368.03 459.52,-358.83 449.68,-362.75 454.27,-368.03"/>
+</g>
+<!-- n00000091&#45;&gt;n00000009 -->
+<g id="edge104" class="edge">
+<title>n00000091:port8&#45;&gt;n00000009</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M401,-608.5C401,-601.72 410.25,-606.15 414,-600.5 471.97,-513.21 379.64,-445.15 450,-367.5 450.76,-366.66 451.54,-365.85 452.34,-365.06"/>
+<polygon fill="black" stroke="black" points="454.65,-367.69 460.07,-358.58 450.16,-362.33 454.65,-367.69"/>
+</g>
+<!-- n00000091&#45;&gt;n00000075 -->
+<g id="edge105" class="edge">
+<title>n00000091:port1&#45;&gt;n00000075</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-782.5C466.26,-782.5 416.59,-353.7 450,-313.5 450.61,-312.77 451.23,-312.06 451.87,-311.36"/>
+<polygon fill="black" stroke="black" points="454.28,-313.91 459.28,-304.57 449.55,-308.75 454.28,-313.91"/>
+</g>
+<!-- n00000091&#45;&gt;n00000075 -->
+<g id="edge106" class="edge">
+<title>n00000091:port2&#45;&gt;n00000075</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-759.5C463.72,-759.5 418.15,-351.67 450,-313.5 450.61,-312.77 451.23,-312.06 451.87,-311.37"/>
+<polygon fill="black" stroke="black" points="454.28,-313.91 459.3,-304.58 449.56,-308.74 454.28,-313.91"/>
+</g>
+<!-- n00000091&#45;&gt;n00000075 -->
+<g id="edge107" class="edge">
+<title>n00000091:port3&#45;&gt;n00000075</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-736.5C461.17,-736.5 419.7,-349.65 450,-313.5 450.61,-312.77 451.24,-312.06 451.88,-311.37"/>
+<polygon fill="black" stroke="black" points="454.28,-313.92 459.32,-304.6 449.57,-308.74 454.28,-313.92"/>
+</g>
+<!-- n00000091&#45;&gt;n00000075 -->
+<g id="edge108" class="edge">
+<title>n00000091:port4&#45;&gt;n00000075</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-713.5C458.62,-713.5 421.25,-347.63 450,-313.5 450.61,-312.77 451.24,-312.07 451.88,-311.37"/>
+<polygon fill="black" stroke="black" points="454.28,-313.93 459.34,-304.61 449.58,-308.74 454.28,-313.93"/>
+</g>
+<!-- n00000091&#45;&gt;n00000075 -->
+<g id="edge109" class="edge">
+<title>n00000091:port5&#45;&gt;n00000075</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-689.5C497.94,-689.5 395.74,-377.55 450,-313.5 450.61,-312.78 451.24,-312.07 451.89,-311.38"/>
+<polygon fill="black" stroke="black" points="454.28,-313.93 459.36,-304.63 449.59,-308.74 454.28,-313.93"/>
+</g>
+<!-- n00000091&#45;&gt;n00000075 -->
+<g id="edge110" class="edge">
+<title>n00000091:port6&#45;&gt;n00000075</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-666.5C492.85,-666.5 398.85,-373.51 450,-313.5 450.62,-312.78 451.25,-312.07 451.9,-311.39"/>
+<polygon fill="black" stroke="black" points="454.29,-313.94 459.39,-304.66 449.61,-308.74 454.29,-313.94"/>
+</g>
+<!-- n00000091&#45;&gt;n00000075 -->
+<g id="edge111" class="edge">
+<title>n00000091:port7&#45;&gt;n00000075</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-643.5C487.77,-643.5 401.95,-369.47 450,-313.5 450.62,-312.78 451.25,-312.08 451.9,-311.39"/>
+<polygon fill="black" stroke="black" points="454.29,-313.95 459.41,-304.68 449.63,-308.73 454.29,-313.95"/>
+</g>
+<!-- n00000091&#45;&gt;n00000075 -->
+<g id="edge112" class="edge">
+<title>n00000091:port8&#45;&gt;n00000075</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M401,-608.5C401,-601.72 410.33,-606.2 414,-600.5 483.58,-492.41 365.48,-410.36 450,-313.5 450.62,-312.78 451.26,-312.09 451.92,-311.41"/>
+<polygon fill="black" stroke="black" points="454.3,-313.98 459.48,-304.74 449.67,-308.73 454.3,-313.98"/>
+</g>
+<!-- n00000091&#45;&gt;n00000079 -->
+<g id="edge113" class="edge">
+<title>n00000091:port1&#45;&gt;n00000079</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-782.5C523.47,-782.5 548.01,-607.83 553.46,-536.9"/>
+<polygon fill="black" stroke="black" points="556.96,-537.06 554.16,-526.84 549.97,-536.57 556.96,-537.06"/>
+</g>
+<!-- n00000091&#45;&gt;n00000079 -->
+<g id="edge114" class="edge">
+<title>n00000091:port2&#45;&gt;n00000079</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-759.5C514.91,-759.5 544.31,-603.69 552.26,-537.11"/>
+<polygon fill="black" stroke="black" points="555.77,-537.18 553.4,-526.86 548.82,-536.41 555.77,-537.18"/>
+</g>
+<!-- n00000091&#45;&gt;n00000079 -->
+<g id="edge115" class="edge">
+<title>n00000091:port3&#45;&gt;n00000079</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-736.5C506.91,-736.5 540.57,-598.14 550.96,-536.51"/>
+<polygon fill="black" stroke="black" points="554.42,-537.06 552.53,-526.63 547.5,-535.95 554.42,-537.06"/>
+</g>
+<!-- n00000091&#45;&gt;n00000079 -->
+<g id="edge116" class="edge">
+<title>n00000091:port4&#45;&gt;n00000079</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-713.5C498.86,-713.5 536.4,-592.98 549.36,-536.31"/>
+<polygon fill="black" stroke="black" points="552.78,-537.03 551.5,-526.51 545.94,-535.53 552.78,-537.03"/>
+</g>
+<!-- n00000091&#45;&gt;n00000079 -->
+<g id="edge117" class="edge">
+<title>n00000091:port5&#45;&gt;n00000079</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-689.5C490.47,-689.5 531.39,-587.85 547.19,-536.48"/>
+<polygon fill="black" stroke="black" points="550.62,-537.22 550.1,-526.63 543.91,-535.23 550.62,-537.22"/>
+</g>
+<!-- n00000091&#45;&gt;n00000079 -->
+<g id="edge118" class="edge">
+<title>n00000091:port6&#45;&gt;n00000079</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-666.5C482.92,-666.5 526.33,-581.85 544.77,-536.08"/>
+<polygon fill="black" stroke="black" points="548.06,-537.27 548.42,-526.68 541.54,-534.73 548.06,-537.27"/>
+</g>
+<!-- n00000091&#45;&gt;n00000079 -->
+<g id="edge119" class="edge">
+<title>n00000091:port7&#45;&gt;n00000079</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-643.5C475.56,-643.5 520.55,-575.52 541.63,-535.69"/>
+<polygon fill="black" stroke="black" points="544.79,-537.19 546.24,-526.7 538.56,-534 544.79,-537.19"/>
+</g>
+<!-- n00000091&#45;&gt;n00000079 -->
+<g id="edge120" class="edge">
+<title>n00000091:port8&#45;&gt;n00000079</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-620.5C468.43,-620.5 513.84,-568.6 537.46,-535.15"/>
+<polygon fill="black" stroke="black" points="540.51,-536.9 543.26,-526.67 534.73,-532.94 540.51,-536.9"/>
+</g>
+<!-- n0000009b -->
+<g id="node9" class="node">
+<title>n0000009b</title>
+<path fill="chartreuse" stroke="black" d="M232,-406.5C232,-406.5 402,-406.5 402,-406.5 408,-406.5 414,-412.5 414,-418.5 414,-418.5 414,-578.5 414,-578.5 414,-584.5 408,-590.5 402,-590.5 402,-590.5 232,-590.5 232,-590.5 226,-590.5 220,-584.5 220,-578.5 220,-578.5 220,-418.5 220,-418.5 220,-412.5 226,-406.5 232,-406.5"/>
+<text text-anchor="middle" x="233" y="-494.8" font-family="Times,serif" font-size="14.00">0</text>
+<polyline fill="none" stroke="black" points="246,-406.5 246,-590.5 "/>
+<text text-anchor="middle" x="317" y="-502.3" font-family="Times,serif" font-size="14.00">Intel IPU6 CSI2 3</text>
+<text text-anchor="middle" x="317" y="-487.3" font-family="Times,serif" font-size="14.00">/dev/v4l&#45;subdev3</text>
+<polyline fill="none" stroke="black" points="388,-406.5 388,-590.5 "/>
+<text text-anchor="middle" x="401" y="-575.3" font-family="Times,serif" font-size="14.00">1</text>
+<polyline fill="none" stroke="black" points="388,-567.5 414,-567.5 "/>
+<text text-anchor="middle" x="401" y="-552.3" font-family="Times,serif" font-size="14.00">2</text>
+<polyline fill="none" stroke="black" points="388,-544.5 414,-544.5 "/>
+<text text-anchor="middle" x="401" y="-529.3" font-family="Times,serif" font-size="14.00">3</text>
+<polyline fill="none" stroke="black" points="388,-521.5 414,-521.5 "/>
+<text text-anchor="middle" x="401" y="-506.3" font-family="Times,serif" font-size="14.00">4</text>
+<polyline fill="none" stroke="black" points="388,-498.5 414,-498.5 "/>
+<text text-anchor="middle" x="401" y="-483.3" font-family="Times,serif" font-size="14.00">5</text>
+<polyline fill="none" stroke="black" points="388,-475.5 414,-475.5 "/>
+<text text-anchor="middle" x="401" y="-460.3" font-family="Times,serif" font-size="14.00">6</text>
+<polyline fill="none" stroke="black" points="388,-452.5 414,-452.5 "/>
+<text text-anchor="middle" x="401" y="-437.3" font-family="Times,serif" font-size="14.00">7</text>
+<polyline fill="none" stroke="black" points="388,-429.5 414,-429.5 "/>
+<text text-anchor="middle" x="401" y="-414.3" font-family="Times,serif" font-size="14.00">8</text>
+</g>
+<!-- n0000009b&#45;&gt;n00000001 -->
+<g id="edge121" class="edge">
+<title>n0000009b:port1&#45;&gt;n00000001</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-579.5C461.24,-579.5 415.21,-511.45 450,-479.5 451.13,-478.46 452.29,-477.46 453.49,-476.5"/>
+<polygon fill="black" stroke="black" points="455.62,-479.28 461.78,-470.66 451.59,-473.56 455.62,-479.28"/>
+</g>
+<!-- n0000009b&#45;&gt;n00000001 -->
+<g id="edge122" class="edge">
+<title>n0000009b:port2&#45;&gt;n00000001</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-556.5C451.78,-556.5 421.03,-503.75 450,-479.5 451.34,-478.38 452.73,-477.3 454.15,-476.26"/>
+<polygon fill="black" stroke="black" points="456.13,-479.15 462.63,-470.78 452.33,-473.26 456.13,-479.15"/>
+</g>
+<!-- n0000009b&#45;&gt;n00000001 -->
+<g id="edge123" class="edge">
+<title>n0000009b:port3&#45;&gt;n00000001</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-533.5C442.84,-533.5 426.55,-496.3 450,-479.5 451.9,-478.14 453.86,-476.84 455.88,-475.61"/>
+<polygon fill="black" stroke="black" points="457.92,-478.48 465,-470.6 454.55,-472.34 457.92,-478.48"/>
+</g>
+<!-- n0000009b&#45;&gt;n00000001 -->
+<g id="edge124" class="edge">
+<title>n0000009b:port4&#45;&gt;n00000001</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-510.5C435.11,-510.5 431.33,-489.36 450,-479.5 453.47,-477.67 457.06,-475.95 460.74,-474.34"/>
+<polygon fill="black" stroke="black" points="462.11,-477.57 470.05,-470.55 459.46,-471.08 462.11,-477.57"/>
+</g>
+<!-- n0000009b&#45;&gt;n00000001 -->
+<g id="edge125" class="edge">
+<title>n0000009b:port5&#45;&gt;n00000001</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-486.5C420.8,-486.5 446.87,-480.29 474.78,-473.11"/>
+<polygon fill="black" stroke="black" points="475.9,-476.44 484.7,-470.54 474.14,-469.66 475.9,-476.44"/>
+</g>
+<!-- n0000009b&#45;&gt;n00000001 -->
+<g id="edge126" class="edge">
+<title>n0000009b:port6&#45;&gt;n00000001</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-463.5C423.77,-463.5 433.9,-463.21 444.05,-462.72"/>
+<polygon fill="black" stroke="black" points="444.4,-466.21 454.19,-462.17 444.02,-459.22 444.4,-466.21"/>
+</g>
+<!-- n0000009b&#45;&gt;n00000001 -->
+<g id="edge127" class="edge">
+<title>n0000009b:port7&#45;&gt;n00000001</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-440.5C423.76,-440.5 433.89,-440.77 444.04,-441.21"/>
+<polygon fill="black" stroke="black" points="444.01,-444.72 454.18,-441.72 444.36,-437.73 444.01,-444.72"/>
+</g>
+<!-- n0000009b&#45;&gt;n00000001 -->
+<g id="edge128" class="edge">
+<title>n0000009b:port8&#45;&gt;n00000001</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-417.5C420.59,-417.5 445.35,-423.18 472.33,-429.9"/>
+<polygon fill="black" stroke="black" points="471.79,-433.37 482.34,-432.41 473.49,-426.58 471.79,-433.37"/>
+</g>
+<!-- n0000009b&#45;&gt;n00000005 -->
+<g id="edge129" class="edge">
+<title>n0000009b:port1&#45;&gt;n00000005</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-579.5C485.16,-579.5 400.54,-474.66 450,-423.5 450.79,-422.69 451.59,-421.9 452.42,-421.13"/>
+<polygon fill="black" stroke="black" points="454.72,-423.77 460.35,-414.79 450.35,-418.3 454.72,-423.77"/>
+</g>
+<!-- n0000009b&#45;&gt;n00000005 -->
+<g id="edge130" class="edge">
+<title>n0000009b:port2&#45;&gt;n00000005</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-556.5C475.24,-556.5 406.62,-466.72 450,-423.5 450.94,-422.56 451.91,-421.66 452.9,-420.78"/>
+<polygon fill="black" stroke="black" points="455.15,-423.47 460.97,-414.62 450.9,-417.91 455.15,-423.47"/>
+</g>
+<!-- n0000009b&#45;&gt;n00000005 -->
+<g id="edge131" class="edge">
+<title>n0000009b:port3&#45;&gt;n00000005</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-533.5C465.44,-533.5 412.63,-458.85 450,-423.5 451.11,-422.45 452.26,-421.43 453.44,-420.45"/>
+<polygon fill="black" stroke="black" points="455.59,-423.22 461.66,-414.53 451.5,-417.54 455.59,-423.22"/>
+</g>
+<!-- n0000009b&#45;&gt;n00000005 -->
+<g id="edge132" class="edge">
+<title>n0000009b:port4&#45;&gt;n00000005</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-510.5C455.85,-510.5 418.53,-451.08 450,-423.5 451.32,-422.35 452.68,-421.24 454.07,-420.18"/>
+<polygon fill="black" stroke="black" points="456.09,-423.04 462.45,-414.57 452.2,-417.22 456.09,-423.04"/>
+</g>
+<!-- n0000009b&#45;&gt;n00000005 -->
+<g id="edge133" class="edge">
+<title>n0000009b:port5&#45;&gt;n00000005</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-486.5C446.25,-486.5 424.45,-443.17 450,-423.5 451.63,-422.25 453.3,-421.05 455.02,-419.91"/>
+<polygon fill="black" stroke="black" points="457.13,-422.73 463.96,-414.63 453.57,-416.7 457.13,-422.73"/>
+</g>
+<!-- n0000009b&#45;&gt;n00000005 -->
+<g id="edge134" class="edge">
+<title>n0000009b:port6&#45;&gt;n00000005</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-463.5C437.92,-463.5 429.6,-435.99 450,-423.5 452.65,-421.88 455.39,-420.35 458.21,-418.91"/>
+<polygon fill="black" stroke="black" points="459.84,-422.01 467.41,-414.59 456.87,-415.67 459.84,-422.01"/>
+</g>
+<!-- n0000009b&#45;&gt;n00000005 -->
+<g id="edge135" class="edge">
+<title>n0000009b:port7&#45;&gt;n00000005</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-440.5C431.69,-440.5 433.38,-429.58 450,-423.5 455.56,-421.46 461.34,-419.51 467.19,-417.64"/>
+<polygon fill="black" stroke="black" points="468.57,-420.88 477.1,-414.58 466.51,-414.19 468.57,-420.88"/>
+</g>
+<!-- n0000009b&#45;&gt;n00000005 -->
+<g id="edge136" class="edge">
+<title>n0000009b:port8&#45;&gt;n00000005</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-417.5C425.31,-417.5 437.06,-416.8 448.75,-415.65"/>
+<polygon fill="black" stroke="black" points="449.42,-419.1 458.98,-414.53 448.66,-412.14 449.42,-419.1"/>
+</g>
+<!-- n0000009b&#45;&gt;n00000009 -->
+<g id="edge137" class="edge">
+<title>n0000009b:port1&#45;&gt;n00000009</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-579.5C461.79,-579.5 417.65,-402.67 450,-367.5 450.76,-366.67 451.55,-365.86 452.36,-365.08"/>
+<polygon fill="black" stroke="black" points="454.66,-367.71 460.13,-358.64 450.2,-362.32 454.66,-367.71"/>
+</g>
+<!-- n0000009b&#45;&gt;n00000009 -->
+<g id="edge138" class="edge">
+<title>n0000009b:port2&#45;&gt;n00000009</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-556.5C499.51,-556.5 391.48,-429.85 450,-367.5 450.77,-366.68 451.57,-365.88 452.38,-365.1"/>
+<polygon fill="black" stroke="black" points="454.67,-367.75 460.21,-358.72 450.25,-362.32 454.67,-367.75"/>
+</g>
+<!-- n0000009b&#45;&gt;n00000009 -->
+<g id="edge139" class="edge">
+<title>n0000009b:port3&#45;&gt;n00000009</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-533.5C489.49,-533.5 397.65,-421.89 450,-367.5 450.78,-366.69 451.59,-365.9 452.41,-365.13"/>
+<polygon fill="black" stroke="black" points="454.69,-367.79 460.31,-358.81 450.32,-362.32 454.69,-367.79"/>
+</g>
+<!-- n0000009b&#45;&gt;n00000009 -->
+<g id="edge140" class="edge">
+<title>n0000009b:port4&#45;&gt;n00000009</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-510.5C479.54,-510.5 403.77,-413.96 450,-367.5 450.93,-366.56 451.89,-365.65 452.88,-364.78"/>
+<polygon fill="black" stroke="black" points="455.1,-367.49 460.92,-358.63 450.85,-361.93 455.1,-367.49"/>
+</g>
+<!-- n0000009b&#45;&gt;n00000009 -->
+<g id="edge141" class="edge">
+<title>n0000009b:port5&#45;&gt;n00000009</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-486.5C469.26,-486.5 410.11,-405.74 450,-367.5 451.1,-366.44 452.24,-365.42 453.42,-364.44"/>
+<polygon fill="black" stroke="black" points="455.54,-367.22 461.58,-358.52 451.43,-361.56 455.54,-367.22"/>
+</g>
+<!-- n0000009b&#45;&gt;n00000009 -->
+<g id="edge142" class="edge">
+<title>n0000009b:port6&#45;&gt;n00000009</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-463.5C459.57,-463.5 416.1,-397.95 450,-367.5 451.3,-366.33 452.64,-365.21 454.03,-364.14"/>
+<polygon fill="black" stroke="black" points="456.02,-367.02 462.33,-358.51 452.09,-361.23 456.02,-367.02"/>
+</g>
+<!-- n0000009b&#45;&gt;n00000009 -->
+<g id="edge143" class="edge">
+<title>n0000009b:port7&#45;&gt;n00000009</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-440.5C450.18,-440.5 421.92,-390.31 450,-367.5 451.56,-366.23 453.18,-365.02 454.84,-363.87"/>
+<polygon fill="black" stroke="black" points="456.79,-366.77 463.48,-358.56 453.13,-360.81 456.79,-366.77"/>
+</g>
+<!-- n0000009b&#45;&gt;n00000009 -->
+<g id="edge144" class="edge">
+<title>n0000009b:port8&#45;&gt;n00000009</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-417.5C441.38,-417.5 427.39,-382.94 450,-367.5 452.18,-366.01 454.43,-364.61 456.74,-363.28"/>
+<polygon fill="black" stroke="black" points="458.65,-366.23 465.94,-358.54 455.44,-360.01 458.65,-366.23"/>
+</g>
+<!-- n0000009b&#45;&gt;n00000075 -->
+<g id="edge145" class="edge">
+<title>n0000009b:port1&#45;&gt;n00000075</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-579.5C473.65,-579.5 410.56,-358.25 450,-313.5 450.63,-312.79 451.27,-312.09 451.93,-311.41"/>
+<polygon fill="black" stroke="black" points="454.3,-313.99 459.52,-304.77 449.69,-308.72 454.3,-313.99"/>
+</g>
+<!-- n0000009b&#45;&gt;n00000075 -->
+<g id="edge146" class="edge">
+<title>n0000009b:port2&#45;&gt;n00000075</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-556.5C468.59,-556.5 413.65,-354.23 450,-313.5 450.63,-312.79 451.28,-312.1 451.94,-311.43"/>
+<polygon fill="black" stroke="black" points="454.3,-314.01 459.57,-304.82 449.72,-308.72 454.3,-314.01"/>
+</g>
+<!-- n0000009b&#45;&gt;n00000075 -->
+<g id="edge147" class="edge">
+<title>n0000009b:port3&#45;&gt;n00000075</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-533.5C463.54,-533.5 416.74,-350.21 450,-313.5 450.76,-312.66 451.54,-311.85 452.34,-311.05"/>
+<polygon fill="black" stroke="black" points="454.69,-313.66 460.09,-304.54 450.18,-308.3 454.69,-313.66"/>
+</g>
+<!-- n0000009b&#45;&gt;n00000075 -->
+<g id="edge148" class="edge">
+<title>n0000009b:port4&#45;&gt;n00000075</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-510.5C503.01,-510.5 389.63,-378.9 450,-313.5 450.77,-312.67 451.56,-311.86 452.37,-311.07"/>
+<polygon fill="black" stroke="black" points="454.7,-313.69 460.16,-304.61 450.23,-308.3 454.7,-313.69"/>
+</g>
+<!-- n0000009b&#45;&gt;n00000075 -->
+<g id="edge149" class="edge">
+<title>n0000009b:port5&#45;&gt;n00000075</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-486.5C492.54,-486.5 396.03,-370.55 450,-313.5 450.78,-312.68 451.58,-311.88 452.4,-311.1"/>
+<polygon fill="black" stroke="black" points="454.71,-313.73 460.26,-304.7 450.3,-308.3 454.71,-313.73"/>
+</g>
+<!-- n0000009b&#45;&gt;n00000075 -->
+<g id="edge150" class="edge">
+<title>n0000009b:port6&#45;&gt;n00000075</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-463.5C482.56,-463.5 402.13,-362.58 450,-313.5 450.93,-312.55 451.88,-311.63 452.86,-310.74"/>
+<polygon fill="black" stroke="black" points="455.12,-313.42 460.85,-304.5 450.82,-307.9 455.12,-313.42"/>
+</g>
+<!-- n0000009b&#45;&gt;n00000075 -->
+<g id="edge151" class="edge">
+<title>n0000009b:port7&#45;&gt;n00000075</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-440.5C472.67,-440.5 408.19,-354.66 450,-313.5 450.95,-312.57 451.92,-311.67 452.92,-310.8"/>
+<polygon fill="black" stroke="black" points="455.15,-313.49 461.02,-304.67 450.93,-307.91 455.15,-313.49"/>
+</g>
+<!-- n0000009b&#45;&gt;n00000075 -->
+<g id="edge152" class="edge">
+<title>n0000009b:port8&#45;&gt;n00000075</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-417.5C462.91,-417.5 414.18,-346.81 450,-313.5 451.12,-312.46 452.28,-311.45 453.47,-310.48"/>
+<polygon fill="black" stroke="black" points="455.61,-313.25 461.73,-304.6 451.55,-307.55 455.61,-313.25"/>
+</g>
+<!-- n0000009b&#45;&gt;n00000079 -->
+<g id="edge153" class="edge">
+<title>n0000009b:port1&#45;&gt;n00000079</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-579.5C456.1,-579.5 498.29,-553.73 525.4,-533.02"/>
+<polygon fill="black" stroke="black" points="527.62,-535.73 533.31,-526.79 523.29,-530.23 527.62,-535.73"/>
+</g>
+<!-- n0000009b&#45;&gt;n00000079 -->
+<g id="edge154" class="edge">
+<title>n0000009b:port2&#45;&gt;n00000079</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-556.5C448.08,-556.5 484.35,-543.57 511.57,-531"/>
+<polygon fill="black" stroke="black" points="513.29,-534.05 520.8,-526.58 510.27,-527.74 513.29,-534.05"/>
+</g>
+<!-- n0000009b&#45;&gt;n00000079 -->
+<g id="edge155" class="edge">
+<title>n0000009b:port3&#45;&gt;n00000079</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-533.5C432.27,-533.5 451.66,-531.36 470.02,-528.31"/>
+<polygon fill="black" stroke="black" points="470.86,-531.72 480.1,-526.53 469.64,-524.82 470.86,-531.72"/>
+</g>
+<!-- n0000009b&#45;&gt;n00000079 -->
+<g id="edge156" class="edge">
+<title>n0000009b:port4&#45;&gt;n00000079</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-510.5C422.36,-510.5 431,-510.45 439.69,-510.35"/>
+<polygon fill="black" stroke="black" points="439.95,-513.85 449.91,-510.23 439.86,-506.85 439.95,-513.85"/>
+</g>
+<!-- n0000009b&#45;&gt;n00000079 -->
+<g id="edge157" class="edge">
+<title>n0000009b:port5&#45;&gt;n00000079</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-486.5C422.72,-486.5 431.71,-486.9 440.74,-487.58"/>
+<polygon fill="black" stroke="black" points="440.66,-491.09 450.92,-488.48 441.27,-484.12 440.66,-491.09"/>
+</g>
+<!-- n0000009b&#45;&gt;n00000079 -->
+<g id="edge158" class="edge">
+<title>n0000009b:port6&#45;&gt;n00000079</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-463.5C431.51,-463.5 433.49,-473.67 450,-479.5 455.9,-481.58 462.02,-483.59 468.23,-485.52"/>
+<polygon fill="black" stroke="black" points="467.43,-488.93 478.01,-488.47 469.45,-482.23 467.43,-488.93"/>
+</g>
+<!-- n0000009b&#45;&gt;n00000079 -->
+<g id="edge159" class="edge">
+<title>n0000009b:port7&#45;&gt;n00000079</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-440.5C437.59,-440.5 429.8,-467.31 450,-479.5 452.79,-481.18 455.67,-482.76 458.64,-484.25"/>
+<polygon fill="black" stroke="black" points="457.18,-487.43 467.72,-488.44 460.11,-481.08 457.18,-487.43"/>
+</g>
+<!-- n0000009b&#45;&gt;n00000079 -->
+<g id="edge160" class="edge">
+<title>n0000009b:port8&#45;&gt;n00000079</title>
+<path fill="none" stroke="black" stroke-dasharray="5,2" d="M414,-417.5C445.86,-417.5 424.69,-460.15 450,-479.5 451.8,-480.87 453.65,-482.18 455.56,-483.42"/>
+<polygon fill="black" stroke="black" points="453.84,-486.47 464.25,-488.47 457.36,-480.42 453.84,-486.47"/>
+</g>
+<!-- n00000865 -->
+<g id="node10" class="node">
+<title>n00000865</title>
+<path fill="#00cdcd" stroke="black" d="M12,-682.5C12,-682.5 172,-682.5 172,-682.5 178,-682.5 184,-688.5 184,-694.5 184,-694.5 184,-708.5 184,-708.5 184,-714.5 178,-720.5 172,-720.5 172,-720.5 12,-720.5 12,-720.5 6,-720.5 0,-714.5 0,-708.5 0,-708.5 0,-694.5 0,-694.5 0,-688.5 6,-682.5 12,-682.5"/>
+<text text-anchor="middle" x="10.5" y="-697.8" font-family="Times,serif" font-size="14.00"> </text>
+<polyline fill="none" stroke="black" points="21,-682.5 21,-720.5 "/>
+<text text-anchor="middle" x="89.5" y="-705.3" font-family="Times,serif" font-size="14.00">ov01a10 3&#45;0036</text>
+<text text-anchor="middle" x="89.5" y="-690.3" font-family="Times,serif" font-size="14.00">/dev/v4l&#45;subdev4</text>
+<polyline fill="none" stroke="black" points="158,-682.5 158,-720.5 "/>
+<text text-anchor="middle" x="171" y="-697.8" font-family="Times,serif" font-size="14.00">0</text>
+</g>
+<!-- n00000865&#45;&gt;n00000091 -->
+<g id="edge161" class="edge">
+<title>n00000865:port0&#45;&gt;n00000091:port0</title>
+<path fill="none" stroke="black" d="M184,-701.5C196,-701.5 201.25,-701.5 209.88,-701.5"/>
+<polygon fill="black" stroke="black" points="210,-705 220,-701.5 210,-698 210,-705"/>
+</g>
+</g>
+</svg>
diff --git a/Documentation/admin-guide/media/v4l-drivers.rst b/Documentation/admin-guide/media/v4l-drivers.rst
index 1c41f87c3917..f6328a242cbe 100644
--- a/Documentation/admin-guide/media/v4l-drivers.rst
+++ b/Documentation/admin-guide/media/v4l-drivers.rst
@@ -16,6 +16,7 @@ Video4Linux (V4L) driver-specific documentation
 	imx
 	imx7
 	ipu3
+	ipu6-isys
 	ivtv
 	omap3isp
 	omap4_camera
-- 
2.42.0

