Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90B27700590
	for <lists+linux-media@lfdr.de>; Fri, 12 May 2023 12:32:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240704AbjELKcG convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 12 May 2023 06:32:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240508AbjELKbi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 May 2023 06:31:38 -0400
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E1B21BC1;
        Fri, 12 May 2023 03:31:34 -0700 (PDT)
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
        (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
        by ex01.ufhost.com (Postfix) with ESMTP id 84C9424E346;
        Fri, 12 May 2023 18:28:48 +0800 (CST)
Received: from EXMBX073.cuchost.com (172.16.6.83) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 12 May
 2023 18:28:46 +0800
Received: from xiaofei.localdomain (180.164.60.184) by EXMBX073.cuchost.com
 (172.16.6.83) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 12 May
 2023 18:28:45 +0800
From:   Jack Zhu <jack.zhu@starfivetech.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        <bryan.odonoghue@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <jack.zhu@starfivetech.com>,
        <changhuang.liang@starfivetech.com>
Subject: [PATCH v5 2/6] media: admin-guide: Add starfive_camss.rst for Starfive Camera Subsystem
Date:   Fri, 12 May 2023 18:28:40 +0800
Message-ID: <20230512102844.51084-3-jack.zhu@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230512102844.51084-1-jack.zhu@starfivetech.com>
References: <20230512102844.51084-1-jack.zhu@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [180.164.60.184]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX073.cuchost.com
 (172.16.6.83)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add starfive_camss.rst file that documents the Starfive Camera
Subsystem driver which is used for handing image sensor data.

Signed-off-by: Jack Zhu <jack.zhu@starfivetech.com>
---
 .../admin-guide/media/starfive_camss.rst      | 57 +++++++++++++++++++
 .../media/starfive_camss_graph.dot            | 16 ++++++
 .../admin-guide/media/v4l-drivers.rst         |  1 +
 MAINTAINERS                                   |  1 +
 4 files changed, 75 insertions(+)
 create mode 100644 Documentation/admin-guide/media/starfive_camss.rst
 create mode 100644 Documentation/admin-guide/media/starfive_camss_graph.dot

diff --git a/Documentation/admin-guide/media/starfive_camss.rst b/Documentation/admin-guide/media/starfive_camss.rst
new file mode 100644
index 000000000000..a6378849384f
--- /dev/null
+++ b/Documentation/admin-guide/media/starfive_camss.rst
@@ -0,0 +1,57 @@
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
+Starfive JH7110 SoC. The driver is located under drivers/media/platform/
+starfive.
+
+The driver implements V4L2, Media controller and v4l2_subdev interfaces.
+Camera sensor using V4L2 subdev interface in the kernel is supported.
+
+The driver has been successfully used on the Gstreamer 1.18.5 with
+v4l2src plugin.
+
+
+Starfive Camera Subsystem hardware
+----------------------------------
+
+The Starfive Camera Subsystem hardware consists of:
+
+- MIPI DPHY Receiver: receives mipi data from a MIPI camera sensor.
+- MIPI CSIRx Controller: is responsible for handling and decoding CSI2 protocol
+  based camera sensor data stream.
+- ISP: handles the image data streams from the MIPI CSIRx Controller.
+- VIN(Video In): a top-level module, is responsible for controlling power
+  and clocks to other modules, dumps the input data to memory or transfers the
+  input data to ISP.
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
+- stf_vin0_wr_video0: capture device for images directly from the VIN module.
+- stf_vin0_isp0_video1: capture device for images without scaling.
+
+The driver has 3 subdevices:
+
+- stf_isp0: is responsible for all the isp operations.
+- stf_vin0_wr: used to dump RAW images to memory.
+- stf_vin0_isp0: used to capture images for the stf_vin0_isp0_video1 device.
diff --git a/Documentation/admin-guide/media/starfive_camss_graph.dot b/Documentation/admin-guide/media/starfive_camss_graph.dot
new file mode 100644
index 000000000000..850be912cdeb
--- /dev/null
+++ b/Documentation/admin-guide/media/starfive_camss_graph.dot
@@ -0,0 +1,16 @@
+digraph board {
+	rankdir=TB
+	n00000001 [label="{{<port0> 0} | stf_isp0\n/dev/v4l-subdev0 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
+	n00000001:port1 -> n0000000d:port0
+	n00000004 [label="{{<port0> 0} | stf_vin0_wr\n/dev/v4l-subdev1 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
+	n00000004:port1 -> n00000007 [style=bold]
+	n00000007 [label="stf_vin0_wr_video0\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
+	n0000000d [label="{{<port0> 0} | stf_vin0_isp0\n/dev/v4l-subdev2 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
+	n0000000d:port1 -> n00000010 [style=bold]
+	n00000010 [label="stf_vin0_isp0_video1\n/dev/video1", shape=box, style=filled, fillcolor=yellow]
+	n00000018 [label="{{<port0> 0} | cdns_csi2rx.19800000.csi-bridge\n | {<port1> 1 | <port2> 2 | <port3> 3 | <port4> 4}}", shape=Mrecord, style=filled, fillcolor=green]
+	n00000018:port1 -> n00000004:port0 [style=dashed]
+	n00000018:port1 -> n00000001:port0
+	n00000028 [label="{{} | imx219 6-0010\n | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
+	n00000028:port0 -> n00000018:port0 [style=bold]
+}
diff --git a/Documentation/admin-guide/media/v4l-drivers.rst b/Documentation/admin-guide/media/v4l-drivers.rst
index 1c41f87c3917..2274fd29c1d7 100644
--- a/Documentation/admin-guide/media/v4l-drivers.rst
+++ b/Documentation/admin-guide/media/v4l-drivers.rst
@@ -27,6 +27,7 @@ Video4Linux (V4L) driver-specific documentation
 	si470x
 	si4713
 	si476x
+	starfive_camss
 	vimc
 	visl
 	vivid
diff --git a/MAINTAINERS b/MAINTAINERS
index 9ef5d0e5dff0..71291dc58671 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20075,6 +20075,7 @@ M:	Jack Zhu <jack.zhu@starfivetech.com>
 M:	Changhuang Liang <changhuang.liang@starfivetech.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
+F:	Documentation/admin-guide/media/starfive_camss.rst
 F:	Documentation/devicetree/bindings/media/starfive,jh7110-camss.yaml
 
 STARFIVE DEVICETREES
-- 
2.34.1

