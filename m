Return-Path: <linux-media+bounces-30101-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3BDA87904
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 09:38:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6EA2170EDF
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 07:38:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1456268FFD;
	Mon, 14 Apr 2025 07:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KTTDq64Y"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77097265CBF;
	Mon, 14 Apr 2025 07:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744616125; cv=none; b=JfZ/+fS6FlJwm0lCGzI0PDyLguTmXJtxRiCavO7Jcd+n3GWhxOglYernaoe6CyYr7etYBZprdAd2/P1x8b3pC9u6QYUv8boaUrcA3Gx1ycW+lNL3Q5gymixm21l7+Ig1O0w7+XM+9HvJf39yk9MBSYkdFsGK7evx1pR/dsi5l0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744616125; c=relaxed/simple;
	bh=ApfNcZNc3V+uEBCWCUGUKsFhCwsqPdMdPFrioGZnex8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DMQvaN3x+Qkkl+wbs52gxgoMLEV2W5Ge7k3vlNjkz/JrO8yBXMI8nhLxaG1rWHpVqEhv6tgFnGqNP0d6dM/YBNlt0QksrDhHTiQqH/diSrHZs1e+mjWFThzj2mvE8VxBkGc6idUpkDaV3jlkFiCJSPtzZR5d3wNVVVZoIesOeOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KTTDq64Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 45E67C4CEF5;
	Mon, 14 Apr 2025 07:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744616125;
	bh=ApfNcZNc3V+uEBCWCUGUKsFhCwsqPdMdPFrioGZnex8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=KTTDq64YzrwxfLXgLzu4esD9X1LLhjSrcZfBe8qD4wJAXw0IwUgn8PljdRGK8F+Yx
	 kbJuwhWxZzIdunTyv4p7bk7nR5WqinqU3xo8bvbzL6fdqXjOnSHKpFNWpG3lkcI3Ir
	 1oUWaybWcqWHrEEkBovtI/WmeSpyU//td91CD8nUBkbrjCzfL9xVQDr/fijAbsDcDn
	 7kDDAx+N8Z4PJibcUrCJUe5ZggDvSYAuZ0VZKRfF8PDn1JKhJ5TtxV+H34h0iVeHIh
	 DG7GHsRV4Hu7ZCMKJuj/5s06H3FjFfipSRAoRU2zvSf28m/QjaDYK3X+Ca8fZFo7+J
	 R4FkA5zTOLzJA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B222C369B5;
	Mon, 14 Apr 2025 07:35:25 +0000 (UTC)
From: Keke Li via B4 Relay <devnull+keke.li.amlogic.com@kernel.org>
Date: Mon, 14 Apr 2025 15:35:23 +0800
Subject: [PATCH v8 10/10] Documentation: media: add documentation file
 c3-isp.rst
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250414-c3isp-v8-10-9f89e537494e@amlogic.com>
References: <20250414-c3isp-v8-0-9f89e537494e@amlogic.com>
In-Reply-To: <20250414-c3isp-v8-0-9f89e537494e@amlogic.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 jacopo.mondi@ideasonboard.com, Keke Li <keke.li@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744616122; l=8134;
 i=keke.li@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=UxoAJSWWfek9y/D6SgG92IAyywe1fpst/ujPPpDofIw=;
 b=VNPYvOOEDTrYwlrB3KrsbDiQ624Mt0B0V1s5WrhgRoY7jkrDYTU7QAhPkTfjYU00QEphLZV8p
 cvPr4Gg/gHvCbZ8GHjIaSHxYeRrip+X/fLz+FL9hX34IMCxhsOJb6Uz
X-Developer-Key: i=keke.li@amlogic.com; a=ed25519;
 pk=XxNPTsQ0YqMJLLekV456eoKV5gbSlxnViB1k1DhfRmU=
X-Endpoint-Received: by B4 Relay for keke.li@amlogic.com/20240902 with
 auth_id=204
X-Original-From: Keke Li <keke.li@amlogic.com>
Reply-To: keke.li@amlogic.com

From: Keke Li <keke.li@amlogic.com>

Add the file 'c3-isp.rst' that documents the c3-isp driver.

Signed-off-by: Keke Li <keke.li@amlogic.com>
---
 Documentation/admin-guide/media/c3-isp.dot      |  26 ++++++
 Documentation/admin-guide/media/c3-isp.rst      | 109 ++++++++++++++++++++++++
 Documentation/admin-guide/media/v4l-drivers.rst |   1 +
 MAINTAINERS                                     |   2 +
 4 files changed, 138 insertions(+)

diff --git a/Documentation/admin-guide/media/c3-isp.dot b/Documentation/admin-guide/media/c3-isp.dot
new file mode 100644
index 000000000000..42dc931ee84a
--- /dev/null
+++ b/Documentation/admin-guide/media/c3-isp.dot
@@ -0,0 +1,26 @@
+digraph board {
+	rankdir=TB
+	n00000001 [label="{{<port0> 0 | <port1> 1} | c3-isp-core\n/dev/v4l-subdev0 | {<port2> 2 | <port3> 3 | <port4> 4 | <port5> 5}}", shape=Mrecord, style=filled, fillcolor=green]
+	n00000001:port3 -> n00000008:port0
+	n00000001:port4 -> n0000000b:port0
+	n00000001:port5 -> n0000000e:port0
+	n00000001:port2 -> n00000027
+	n00000008 [label="{{<port0> 0} | c3-isp-resizer0\n/dev/v4l-subdev1 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
+	n00000008:port1 -> n00000016 [style=bold]
+	n0000000b [label="{{<port0> 0} | c3-isp-resizer1\n/dev/v4l-subdev2 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
+	n0000000b:port1 -> n0000001a [style=bold]
+	n0000000e [label="{{<port0> 0} | c3-isp-resizer2\n/dev/v4l-subdev3 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
+	n0000000e:port1 -> n00000023 [style=bold]
+	n00000011 [label="{{<port0> 0} | c3-mipi-adapter\n/dev/v4l-subdev4 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
+	n00000011:port1 -> n00000001:port0 [style=bold]
+	n00000016 [label="c3-isp-cap0\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
+	n0000001a [label="c3-isp-cap1\n/dev/video1", shape=box, style=filled, fillcolor=yellow]
+	n0000001e [label="{{<port0> 0} | c3-mipi-csi2\n/dev/v4l-subdev5 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
+	n0000001e:port1 -> n00000011:port0 [style=bold]
+	n00000023 [label="c3-isp-cap2\n/dev/video2", shape=box, style=filled, fillcolor=yellow]
+	n00000027 [label="c3-isp-stats\n/dev/video3", shape=box, style=filled, fillcolor=yellow]
+	n0000002b [label="c3-isp-params\n/dev/video4", shape=box, style=filled, fillcolor=yellow]
+	n0000002b -> n00000001:port1
+	n0000003f [label="{{} | imx290 2-001a\n/dev/v4l-subdev6 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
+	n0000003f:port0 -> n0000001e:port0 [style=bold]
+}
diff --git a/Documentation/admin-guide/media/c3-isp.rst b/Documentation/admin-guide/media/c3-isp.rst
new file mode 100644
index 000000000000..8adac4605a6a
--- /dev/null
+++ b/Documentation/admin-guide/media/c3-isp.rst
@@ -0,0 +1,109 @@
+.. SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+
+.. include:: <isonum.txt>
+
+=================================================
+Amlogic C3 Image Signal Processing (C3ISP) driver
+=================================================
+
+Introduction
+============
+
+This file documents the Amlogic C3ISP driver located under
+drivers/media/platform/amlogic/c3/isp.
+
+The current version of the driver supports the C3ISP found on
+Amlogic C308L processor.
+
+The driver implements V4L2, Media controller and V4L2 subdev interfaces.
+Camera sensor using V4L2 subdev interface in the kernel is supported.
+
+The driver has been tested on AW419-C308L-Socket platform.
+
+Anlogic Camera hardware
+=======================
+
+The Camera hardware found on C308L processors and supported by
+the driver consists of:
+
+- 1 MIPI-CSI2 module. It handle the Physical layer of the CSI2 receivers and
+  receive MIPI data.
+  A separate camera sensor can be connected to MIPI-CSi2 module.
+- 1 MIPI-ADAPTER module. Organize MIPI data to meet ISP input requirements and
+  send MIPI data to ISP
+- 1 ISP (Image Signal Processing) module. Contain a pipeline of image processing
+  hardware blocks.
+  The ISP pipeline contains three scalers at the end.
+  The ISP also contains the DMA interface which writes the output data to memory.
+
+A high level functional view of the C3 ISP is presented below. The ISP
+takes input from the sensor.::
+
+                                                                   +---------+    +-------+
+                                                                   | Scaler  |--->| WRMIF |
+  +---------+    +------------+    +--------------+    +-------+   |---------+    +-------+
+  | Sensor  |--->| MIPI CSI-2 |--->| MIPI ADAPTER |--->|  ISP  |---|---------+    +-------+
+  +---------+    +------------+    +--------------+    +-------+   | Scaler  |--->| WRMIF |
+                                                                   +---------+    +-------+
+                                                                   |---------+    +-------+
+                                                                   | Scaler  |--->| WRMIF |
+                                                                   +---------+    +-------+
+
+Supported functionality
+=======================
+
+The current version of the driver supports:
+
+- Input from camera sensor via MIPI-CSI2;
+
+- Pixel output interface of ISP
+
+  - Scaling support. Configuration of the scaler module
+    for downscalling with ratio up to 8x.
+
+Driver Architecture and Design
+==============================
+
+The driver implements the V4L2 subdev interface. With the goal to model the
+hardware links between the modules and to expose a clean, logical and usable
+interface, the driver is split into V4L2 sub-devices as follows:
+
+- 1 c3-mipi-csi2 sub-device - mipi-csi2 is represented by a single sub-device.
+- 1 c3-mipi-adapter sub-device - mipi-adapter is represented by a single sub-devices.
+- 1 c3-isp-core sub-device - isp-core is represented by a single sub-devices.
+- 3 c3-isp-resizer sub-devices - isp-resizer is represented by a number of sub-devices
+  equal to the number of capture device.
+
+c3-isp-core sub-device is linked to 2 separate video device nodes and
+3 c3-isp-resizer sub-devices nodes.
+
+- 1 capture statistics video device node.
+- 1 output parameters video device node.
+- 3 c3-isp-resizer sub-device nodes.
+
+c3-isp-resizer sub-device is linked to capture video device node.
+
+- c3-isp-resizer0 is linked to c3-isp-cap0
+- c3-isp-resizer1 is linked to c3-isp-cap1
+- c3-isp-resizer2 is linked to c3-isp-cap2
+
+The media controller pipeline graph is as follows (with connected a
+IMX290 camera sensor):
+
+.. _isp_topology_graph:
+
+.. kernel-figure:: c3-isp.dot
+    :alt:   c3-isp.dot
+    :align: center
+
+    Media pipeline topology
+
+Implementation
+==============
+
+Runtime configuration of the hardware via 'c3-isp-params' video device node.
+Acquiring statistics of ISP hardware via 'c3-isp-stats' video device node.
+Acquiring output image of ISP hardware via 'c3-isp-cap[0, 2]' video device node.
+
+The output size of the scaler module in the ISP is configured with
+the pixel format of 'c3-isp-cap[0, 2]' video device node.
diff --git a/Documentation/admin-guide/media/v4l-drivers.rst b/Documentation/admin-guide/media/v4l-drivers.rst
index e8761561b2fe..3bac5165b134 100644
--- a/Documentation/admin-guide/media/v4l-drivers.rst
+++ b/Documentation/admin-guide/media/v4l-drivers.rst
@@ -10,6 +10,7 @@ Video4Linux (V4L) driver-specific documentation
 	:maxdepth: 2
 
 	bttv
+	c3-isp
 	cafe_ccic
 	cx88
 	fimc
diff --git a/MAINTAINERS b/MAINTAINERS
index b2bf9c6cd194..4b06a798d30c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1259,6 +1259,8 @@ AMLOGIC ISP DRIVER
 M:	Keke Li <keke.li@amlogic.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
+F:	Documentation/admin-guide/media/c3-isp.dot
+F:	Documentation/admin-guide/media/c3-isp.rst
 F:	Documentation/devicetree/bindings/media/amlogic,c3-isp.yaml
 F:	Documentation/userspace-api/media/v4l/metafmt-c3-isp.rst
 F:	drivers/media/platform/amlogic/c3/isp/

-- 
2.49.0



