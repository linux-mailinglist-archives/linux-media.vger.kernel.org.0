Return-Path: <linux-media+bounces-17940-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 759D8970FBD
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 09:28:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2EFAC283440
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 07:28:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD7AE1B3F2A;
	Mon,  9 Sep 2024 07:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fdIchWOr"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B711B14FA;
	Mon,  9 Sep 2024 07:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725866680; cv=none; b=amrBRajNRHrZ2CbIpaA9Mp8dK/iAIWgpep4xay4/SNXeU3ms10LjkylGWjK/IKirCzqnvldxZzmn51Z3p2yXtUA90u972pg3wrt1tNy3tvWYvWm4Vy0GsUPpSt5X5OH8gTueYkmcdbgektPu1drS+wKNXtMtFPNB+XBODdbt9oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725866680; c=relaxed/simple;
	bh=Q1fphv/9rcuC2t7jMyj1Iz2PXhOWNXDZDraMQA0XRCs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ts90ZtpFcfYwtsBxzWAkn1tNFgbT8VY+sZf21IOE+NEeXJ6EiZ15+tqpyLTNA5rS/GupngcD2Lq0LQHfcBEeZQhmu4BeJWYPTQDCvjbMZkBvrApYzsPgEb0Nv1mk9fcWx1Z0w6mvqDHhhLEiPaPaQsJg+iGFQ+PdnoesTOmZ92E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fdIchWOr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 15478C4CEDF;
	Mon,  9 Sep 2024 07:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725866680;
	bh=Q1fphv/9rcuC2t7jMyj1Iz2PXhOWNXDZDraMQA0XRCs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fdIchWOrkitYVhj3lYmbQ7Gychz7zGQVlc6Kpvd3hfWNu3oMduqa+F08lZ08VZUNl
	 whVMrlm0VEWNz29aXZNvl2FgFQ5YJvCeyND8jiB4wPwz9BejJTxVLBeoMxEzmxmuxZ
	 lfYysL/pZq5c7YotVsXx9+W9lKav2aO4p9a353VbNqOjhD6Q15cn8z3Ym+gf3t+m/w
	 gzFJGC7XQShs/Nfy8ahsKKN5oPnagMmjUPLa2BrddVZxdZdFukmSmzNXPDdkBpJkYH
	 mAe1or0XF2LPEn13Vc7qSZnyyGdGfDKw5dL2vOhsHBVpiTzzCFYXr/9kb7na3JdXnv
	 acxtdFmaHZ/Lw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F554ECE57B;
	Mon,  9 Sep 2024 07:24:40 +0000 (UTC)
From: Keke Li via B4 Relay <devnull+keke.li.amlogic.com@kernel.org>
Date: Mon, 09 Sep 2024 15:24:19 +0800
Subject: [PATCH v2 9/9] Documentation: media: add documentation file
 c3-isp.rst
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240909-c3isp-v2-9-3c866a1cea56@amlogic.com>
References: <20240909-c3isp-v2-0-3c866a1cea56@amlogic.com>
In-Reply-To: <20240909-c3isp-v2-0-3c866a1cea56@amlogic.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 Keke Li <keke.li@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725866660; l=7370;
 i=keke.li@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=YTakAYx84g0TgdRm+4VZZoiQabR9jqtyfMu7f8UQ3P0=;
 b=I8RMk++oabUd+d0burnDCZr5v1o4h0EvVUFOBugBZ4lnw582NMg3/EnWxtx3p1Z6Nw/5jOi7s
 mk9WFuQb+tIDGDMeIGLmURagsjqsSOAuM0ZAewzt7P7gVMfc/01jXNb
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
 Documentation/admin-guide/media/c3-isp.dot      | 26 +++++++
 Documentation/admin-guide/media/c3-isp.rst      | 96 +++++++++++++++++++++++++
 Documentation/admin-guide/media/v4l-drivers.rst |  1 +
 MAINTAINERS                                     | 10 +++
 4 files changed, 133 insertions(+)

diff --git a/Documentation/admin-guide/media/c3-isp.dot b/Documentation/admin-guide/media/c3-isp.dot
new file mode 100644
index 000000000000..0cc1b8b96404
--- /dev/null
+++ b/Documentation/admin-guide/media/c3-isp.dot
@@ -0,0 +1,26 @@
+digraph board {
+	rankdir=TB
+	n00000001 [label="{{<port0> 0 | <port1> 1} | isp-core\n/dev/v4l-subdev0 | {<port2> 2 | <port3> 3}}", shape=Mrecord, style=filled, fillcolor=green]
+	n00000001:port3 -> n00000006:port0 [style=bold]
+	n00000001:port3 -> n00000009:port0 [style=bold]
+	n00000001:port3 -> n0000000c:port0 [style=bold]
+	n00000001:port2 -> n00000020 [style=bold]
+	n00000006 [label="{{<port0> 0} | isp-resizer0\n/dev/v4l-subdev1 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
+	n00000006:port1 -> n00000014 [style=bold]
+	n00000009 [label="{{<port0> 0} | isp-resizer1\n/dev/v4l-subdev2 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
+	n00000009:port1 -> n00000018 [style=bold]
+	n0000000c [label="{{<port0> 0} | isp-resizer2\n/dev/v4l-subdev3 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
+	n0000000c:port1 -> n0000001c [style=bold]
+	n0000000f [label="{{<port0> 0} | mipi-adapter\n/dev/v4l-subdev4 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
+	n0000000f:port1 -> n00000001:port0 [style=bold]
+	n00000014 [label="isp-video0\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
+	n00000018 [label="isp-video1\n/dev/video1", shape=box, style=filled, fillcolor=yellow]
+	n0000001c [label="isp-video2\n/dev/video2", shape=box, style=filled, fillcolor=yellow]
+	n00000020 [label="isp-stats\n/dev/video3", shape=box, style=filled, fillcolor=yellow]
+	n00000024 [label="isp-params\n/dev/video4", shape=box, style=filled, fillcolor=yellow]
+	n00000024 -> n00000001:port1 [style=bold]
+	n00000038 [label="{{<port0> 0} | mipi-csi2\n/dev/v4l-subdev5 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
+	n00000038:port1 -> n0000000f:port0 [style=bold]
+	n0000003d [label="{{} | imx290 2-001a\n/dev/v4l-subdev6 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
+	n0000003d:port0 -> n00000038:port0 [style=bold]
+}
diff --git a/Documentation/admin-guide/media/c3-isp.rst b/Documentation/admin-guide/media/c3-isp.rst
new file mode 100644
index 000000000000..fab10c962465
--- /dev/null
+++ b/Documentation/admin-guide/media/c3-isp.rst
@@ -0,0 +1,96 @@
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
+drivers/media/platform/amlogic/c3-isp.
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
+- 1 mipi-csi2 sub-device - mipi-csi2 is represented by a single sub-device.
+- 1 mipi-adapter sub-device - mipi-adapter is represented by a single sub-devices.
+- 1 isp-core sub-device - isp-core is represented by a single sub-devices.
+- 3 isp-resizer sub-devices - isp-resizer is represented by a number of sub-devices
+  equal to the number of capture device.
+
+isp-core sub-device is linked to 2 separate video device nodes and
+3 isp-resizer sub-devices nodes.
+
+- 1 capture statistics video device node.
+- 1 output parameters video device node.
+- 3 isp-resizer sub-device nodes.
+
+isp-resizer sub-device is linked to capture video device node.
+
+- isp-resizer0 is linked to isp-cap0
+- isp-resizer1 is linked to isp-cap1
+- isp-resizer2 is linked to isp-cap2
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
+Runtime configuration of the hardware via 'isp-params' video device node.
+Acquiring statistics of ISP hardware via 'isp-stats' video device node.
+Acquiring output image of ISP hardware via 'isp-video[0, 2]' video device node.
+
+The output size of the scaler module in the ISP is configured with
+the pixel format of 'isp-video[0, 2]' video device node.
diff --git a/Documentation/admin-guide/media/v4l-drivers.rst b/Documentation/admin-guide/media/v4l-drivers.rst
index b6af448b9fe9..be0a8a860f39 100644
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
index c682e83dff31..4a9afbc6de1c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4887,6 +4887,16 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/can/st,stm32-bxcan.yaml
 F:	drivers/net/can/bxcan.c
 
+C3 ISP DRIVER FOR AMLOGIC
+M:	Keke Li <keke.li@amlogic.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/admin-guide/media/c3-isp.dot
+F:	Documentation/admin-guide/media/c3-isp.rst
+F:	Documentation/devicetree/bindings/media/amlogic,c3-isp.yaml
+F:	Documentation/userspace-api/media/v4l/metafmt-c3-isp.rst
+F:	drivers/media/platform/amlogic/c3-isp/
+
 C3 MIPI ADAPTER DRIVER FOR AMLOGIC
 M:	Keke Li <keke.li@amlogic.com>
 L:	linux-media@vger.kernel.org

-- 
2.46.0



