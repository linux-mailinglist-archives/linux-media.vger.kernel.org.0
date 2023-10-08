Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4AC277BCD47
	for <lists+linux-media@lfdr.de>; Sun,  8 Oct 2023 10:52:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344459AbjJHIwH convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Sun, 8 Oct 2023 04:52:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234282AbjJHIwG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 8 Oct 2023 04:52:06 -0400
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2C7CD6;
        Sun,  8 Oct 2023 01:52:04 -0700 (PDT)
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
        (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
        by ex01.ufhost.com (Postfix) with ESMTP id 81ABE24E2BC;
        Sun,  8 Oct 2023 16:52:03 +0800 (CST)
Received: from EXMBX073.cuchost.com (172.16.6.83) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Sun, 8 Oct
 2023 16:51:59 +0800
Received: from xiaofei.localdomain (180.164.60.184) by EXMBX073.cuchost.com
 (172.16.6.83) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Sun, 8 Oct
 2023 16:51:58 +0800
From:   Jack Zhu <jack.zhu@starfivetech.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        <bryan.odonoghue@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-staging@lists.linux.dev>,
        <jack.zhu@starfivetech.com>, <changhuang.liang@starfivetech.com>
Subject: [PATCH v10 2/8] media: admin-guide: Add starfive_camss.rst for Starfive Camera Subsystem
Date:   Sun, 8 Oct 2023 16:51:48 +0800
Message-ID: <20231008085154.6757-3-jack.zhu@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231008085154.6757-1-jack.zhu@starfivetech.com>
References: <20231008085154.6757-1-jack.zhu@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [180.164.60.184]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX073.cuchost.com
 (172.16.6.83)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add starfive_camss.rst file that documents the Starfive Camera
Subsystem driver which is used for handing image sensor data.

Signed-off-by: Jack Zhu <jack.zhu@starfivetech.com>
---
 .../admin-guide/media/starfive_camss.rst      | 72 +++++++++++++++++++
 .../media/starfive_camss_graph.dot            | 12 ++++
 .../admin-guide/media/v4l-drivers.rst         |  1 +
 MAINTAINERS                                   |  1 +
 4 files changed, 86 insertions(+)
 create mode 100644 Documentation/admin-guide/media/starfive_camss.rst
 create mode 100644 Documentation/admin-guide/media/starfive_camss_graph.dot

diff --git a/Documentation/admin-guide/media/starfive_camss.rst b/Documentation/admin-guide/media/starfive_camss.rst
new file mode 100644
index 000000000000..ca42e9447c47
--- /dev/null
+++ b/Documentation/admin-guide/media/starfive_camss.rst
@@ -0,0 +1,72 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: <isonum.txt>
+
+================================
+Starfive Camera Subsystem driver
+================================
+
+Introduction
+------------
+
+This file documents the driver for the Starfive Camera Subsystem found on
+Starfive JH7110 SoC. The driver is located under drivers/staging/media/starfive/
+camss.
+
+The driver implements V4L2, Media controller and v4l2_subdev interfaces. Camera
+sensor using V4L2 subdev interface in the kernel is supported.
+
+The driver has been successfully used on the Gstreamer 1.18.5 with v4l2src
+plugin.
+
+
+Starfive Camera Subsystem hardware
+----------------------------------
+
+The Starfive Camera Subsystem hardware consists of::
+
+                    |\         +---------------+      +-----------+
+  +----------+      |  \       |               |      |           |
+  |          |      |   |      |               |      |           |
+  |   MIPI   |----->|   |----->|      ISP      |----->|           |
+  |          |      |   |      |               |      |           |
+  +----------+      |   |      |               |      |  Memory   |
+                    |MUX|      +---------------+      | Interface |
+  +----------+      |   |                             |           |
+  |          |      |   |---------------------------->|           |
+  | Parallel |----->|   |                             |           |
+  |          |      |   |                             |           |
+  +----------+      |  /                              |           |
+                    |/                                +-----------+
+
+- MIPI: The MIPI interface, receiving data from a MIPI CSI-2 camera sensor.
+
+- Parallel: The parallel interface,  receiving data from a parallel sensor.
+
+- ISP: The ISP, processing raw Bayer data from an image sensor and producing
+  YUV frames.
+
+
+Topology
+--------
+
+The media controller pipeline graph is as follows:
+
+.. _starfive_camss_graph:
+
+.. kernel-figure:: starfive_camss_graph.dot
+    :alt:   starfive_camss_graph.dot
+    :align: center
+
+The driver has 2 video devices:
+
+- capture_raw: The capture device, capturing image data directly from a sensor.
+- capture_yuv: The capture device, capturing YUV frame data processed by the
+  ISP module
+
+The driver has 3 subdevices:
+
+- stf_isp: is responsible for all the isp operations, outputs YUV frames.
+- cdns_csi2rx: a CSI-2 bridge supporting up to 4 CSI lanes in input, and 4
+  different pixel streams in output.
+- imx219: an image sensor, image data is sent through MIPI CSI-2.
diff --git a/Documentation/admin-guide/media/starfive_camss_graph.dot b/Documentation/admin-guide/media/starfive_camss_graph.dot
new file mode 100644
index 000000000000..8eff1f161ac7
--- /dev/null
+++ b/Documentation/admin-guide/media/starfive_camss_graph.dot
@@ -0,0 +1,12 @@
+digraph board {
+	rankdir=TB
+	n00000001 [label="{{<port0> 0} | stf_isp\n/dev/v4l-subdev0 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
+	n00000001:port1 -> n00000008 [style=dashed]
+	n00000004 [label="capture_raw\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
+	n00000008 [label="capture_yuv\n/dev/video1", shape=box, style=filled, fillcolor=yellow]
+	n0000000e [label="{{<port0> 0} | cdns_csi2rx.19800000.csi-bridge\n | {<port1> 1 | <port2> 2 | <port3> 3 | <port4> 4}}", shape=Mrecord, style=filled, fillcolor=green]
+	n0000000e:port1 -> n00000001:port0 [style=dashed]
+	n0000000e:port1 -> n00000004 [style=dashed]
+	n00000018 [label="{{} | imx219 6-0010\n/dev/v4l-subdev1 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
+	n00000018:port0 -> n0000000e:port0 [style=bold]
+}
diff --git a/Documentation/admin-guide/media/v4l-drivers.rst b/Documentation/admin-guide/media/v4l-drivers.rst
index 61283d67ceef..f4bb2605f07e 100644
--- a/Documentation/admin-guide/media/v4l-drivers.rst
+++ b/Documentation/admin-guide/media/v4l-drivers.rst
@@ -28,6 +28,7 @@ Video4Linux (V4L) driver-specific documentation
 	si470x
 	si4713
 	si476x
+	starfive_camss
 	vimc
 	visl
 	vivid
diff --git a/MAINTAINERS b/MAINTAINERS
index 774dcb5b70ca..2680f7242a6d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20453,6 +20453,7 @@ M:	Jack Zhu <jack.zhu@starfivetech.com>
 M:	Changhuang Liang <changhuang.liang@starfivetech.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
+F:	Documentation/admin-guide/media/starfive_camss.rst
 F:	Documentation/devicetree/bindings/media/starfive,jh7110-camss.yaml
 
 STARFIVE CRYPTO DRIVER
-- 
2.34.1

