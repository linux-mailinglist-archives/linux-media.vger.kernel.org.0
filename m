Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 208EF6E0ACA
	for <lists+linux-media@lfdr.de>; Thu, 13 Apr 2023 11:55:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230115AbjDMJzu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Apr 2023 05:55:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229722AbjDMJzt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Apr 2023 05:55:49 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AB998A6A
        for <linux-media@vger.kernel.org>; Thu, 13 Apr 2023 02:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681379730; x=1712915730;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wBHU6pWtqCcZ+MLmEquS+uZP2DaNANFrhgCqLDUpPzs=;
  b=awNfQ4iNpFZB904/wKYsMgJyzERgaMSm1zYK/mg+O9+qYL3iNZYOYK0n
   i1hY1p6mRe36IvtcjXkTz7cXAI1gJuRgsDZzzwypz2z1bwyGx5q728Wcj
   0wwGdAUvRffwysoIMoCW7rxDMn3ItZHbqI1X+UicTLFVWHqkHFUkaFKnx
   PofLV8Z8Mp5KlKp44HhxSGeM+MydwIJmyxAChJRlJX5CBzYY4X5gf70Ig
   PoOpRsD6KV/2CK8OBZNeos4j5woUlVLEbUKhqHWdQktXcAAkvcn91DfJP
   sfFUq9V8hvid4FOYJP4DASnvkuz2rcBz2kZa+VL2a43uzE7jsUtkUvUc/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="371993135"
X-IronPort-AV: E=Sophos;i="5.98,341,1673942400"; 
   d="scan'208";a="371993135"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 02:55:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="639600233"
X-IronPort-AV: E=Sophos;i="5.98,341,1673942400"; 
   d="scan'208";a="639600233"
Received: from icg-kernel3.bj.intel.com ([172.16.126.100])
  by orsmga003.jf.intel.com with ESMTP; 13 Apr 2023 02:55:18 -0700
From:   bingbu.cao@intel.com
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com, ilpo.jarvinen@linux.intel.com
Cc:     tfiga@chromium.org, senozhatsky@chromium.org, hdegoede@redhat.com,
        bingbu.cao@intel.com, bingbu.cao@linux.intel.com,
        tian.shu.qiu@intel.com, hongju.wang@intel.com,
        daniel.h.kang@intel.com
Subject: [RFC PATCH 13/14] Documentation: add Intel IPU6 ISYS driver admin-guide doc
Date:   Thu, 13 Apr 2023 18:04:28 +0800
Message-Id: <20230413100429.919622-14-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230413100429.919622-1-bingbu.cao@intel.com>
References: <20230413100429.919622-1-bingbu.cao@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
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
 Documentation/admin-guide/media/ipu6-isys.rst | 128 +++++++
 .../admin-guide/media/ipu6_isys_graph.svg     | 338 ++++++++++++++++++
 .../admin-guide/media/v4l-drivers.rst         |   1 +
 3 files changed, 467 insertions(+)
 create mode 100644 Documentation/admin-guide/media/ipu6-isys.rst
 create mode 100644 Documentation/admin-guide/media/ipu6_isys_graph.svg

diff --git a/Documentation/admin-guide/media/ipu6-isys.rst b/Documentation/admin-guide/media/ipu6-isys.rst
new file mode 100644
index 000000000000..083b00449b86
--- /dev/null
+++ b/Documentation/admin-guide/media/ipu6-isys.rst
@@ -0,0 +1,128 @@
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
+The Input System mainly work as MIPI CSI2 receiver which receive and process the
+imaging data from the sensors and outputs the frames to memory.
+
+There are 2 driver modules - intel_ipu6 and intel_ipu6_isys. intel_ipu6 is IPU6
+common driver which does PCI configuration, firmware loading and parsing,
+firmware authentication, DMA mapping and IPU-MMU (internal Memory mapping Unit)
+configuration. intel_ipu6_isys implements V4L2, Media Controller and V4L2
+sub-device interfaces. The IPU6 ISYS driver supports camera sensors connected
+to the IPU6 ISYS through V4L2 sub-device sensor drivers.
+
+Input system driver
+===================
+
+Input System driver mainly configure CSI2 DPHY, construct the firmware stream
+configuration and send commands to firmware and get response from hardware and
+firmware and then return buffers to user.
+The ISYS is represented as several V4L2 sub-devices - 'Intel IPU6 CSI2 $port',
+which provide V4L2 subdev interfaces to the user space, there are also several
+video nodes for each CSI-2 stream capture - 'Intel IPU6 ISYS capture $num' which
+provide interface to user to set formats, queue buffers and streaming.
+
+.. kernel-figure::  ipu6_isys_graph.svg
+   :alt: ipu6 isys media graph
+
+Capturing frames by IPU6 ISYS
+------------------------------------
+
+IPU6 ISYS is used to capture frames from the camera sensors connected to the
+CSI2 port. The supported input formats of ISYS are listed in table below:
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
+    # Establish the link for the media devices using media-ctl
+    media-ctl -d $MDEV -l "\"ov01a10 3-0036\":0 -> \"Intel IPU6 CSI2 2\":0[1]"
+    media-ctl -d $MDEV -l "\"Intel IPU6 CSI2 2\":1 ->\"Intel IPU6 ISYS Capture 0\":0[5]"
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
2.39.1

