Return-Path: <linux-media+bounces-31111-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B32AA9DF7B
	for <lists+linux-media@lfdr.de>; Sun, 27 Apr 2025 08:28:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 652CD1A81479
	for <lists+linux-media@lfdr.de>; Sun, 27 Apr 2025 06:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AC86243953;
	Sun, 27 Apr 2025 06:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TDpTPxgy"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CAC24167E;
	Sun, 27 Apr 2025 06:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745735245; cv=none; b=KVTkgmMUjNtgHRJ78vEbUoroBMats7pP8YRCNoTvTzwpX8mGcOjS0KkBvZA7bC3qxyETXW9I4gl6hWB1LG0t601577zufdsEOI/Cxdikb6DQtzFiAJmlEOIN/ODq1rBGR9a94SVmkqAe1FSSdTgehdefk9H+t0mIZGMC5nqPmVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745735245; c=relaxed/simple;
	bh=rV7ELWY4jzPxSIePzvayWLNlw8ecdtIvAPaE7yFk0vU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sLYJbht+vs5pQlFcvKimTUXCFVhqZmxEXWZmN4eLiLou+dZwLvVbt928bcv/EpBpQMzIzSxTk5XZEpZeCLm/VLh0s5mIGyW+ijfmDUpmHFrJK1T+0hK6o6ct3XAJTiAlAYsJMRhOOYA/QQvZXFNo6o/kqu41E+YSj71BFvopNdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TDpTPxgy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C4AC6C4CEFA;
	Sun, 27 Apr 2025 06:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745735244;
	bh=rV7ELWY4jzPxSIePzvayWLNlw8ecdtIvAPaE7yFk0vU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TDpTPxgySUdwev2esioHyY2Sq5XePX//9shTWNWy+J8+vzprBzR/NqfZGuvkn87MU
	 ShFv1AQSE8jEoSoU39+zBgUiRxQfKsXf1UuNwyrjhUnCCo6BwR5tqjgQigvwQsbk06
	 634XDL1mL+F+p9HiLX93uWXBmQ8JobJ2/FYFrv3BMHULt1LSv5B8t7tfmrbdUpCCer
	 rf+XyZyjso3KrB5mpbAeNMaZFuMlMzwVLwBhxNJCfhDhg4ryh3pcYQTjTa+wwfsooj
	 ipeMqWJoiR8iF5+uZIXG4XxWQVXIx2SU9y4KuFaNMEiWaE7w7yi8inrsllnVVq1vOy
	 WvLNTows4RUBg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B958DC369D8;
	Sun, 27 Apr 2025 06:27:24 +0000 (UTC)
From: Keke Li via B4 Relay <devnull+keke.li.amlogic.com@kernel.org>
Date: Sun, 27 Apr 2025 14:27:18 +0800
Subject: [PATCH v9 10/10] Documentation: media: add documentation file
 c3-isp.rst
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250427-c3isp-v9-10-e0fe09433d94@amlogic.com>
References: <20250427-c3isp-v9-0-e0fe09433d94@amlogic.com>
In-Reply-To: <20250427-c3isp-v9-0-e0fe09433d94@amlogic.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 jacopo.mondi@ideasonboard.com, Keke Li <keke.li@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745735242; l=8064;
 i=keke.li@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=+qgXJevpfResF3gzd9+bsMteto6Ioe7ohnvu5EA8FeY=;
 b=L1GiFGfOGSh4t7UdgMWHpdfzM+uNicpwZ8QmOE/dHDUDIafTSMkgEmY3QU2N/BBqnnqZRt9Mu
 VDFquY6pVm6DhmByZIF1Zfe1wujepuQUeYtc4Y93GXHQ8QMY4kuXBPC
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
 Documentation/admin-guide/media/c3-isp.rst      | 101 ++++++++++++++++++++++++
 Documentation/admin-guide/media/v4l-drivers.rst |   1 +
 MAINTAINERS                                     |   2 +
 4 files changed, 130 insertions(+)

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
index 000000000000..ac508b8c6831
--- /dev/null
+++ b/Documentation/admin-guide/media/c3-isp.rst
@@ -0,0 +1,101 @@
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
+Amlogic C3 ISP
+==============
+
+The Camera hardware found on C308L processors and supported by
+the driver consists of:
+
+- 1 MIPI-CSI-2 module: handles the physical layer of the MIPI CSI-2 receiver and
+  receives data from the connected camera sensor.
+- 1 MIPI-ADAPTER module: organizes MIPI data to meet ISP input requirements and
+  send MIPI data to ISP.
+- 1 ISP (Image Signal Processing) module: contains a pipeline of image processing
+  hardware blocks. The ISP pipeline contains three resizers at the end each of
+  them connected to a DMA interface which writes the output data to memory.
+
+A high-level functional view of the C3 ISP is presented below.::
+
+                                                                   +----------+    +-------+
+                                                                   | Resizer  |--->| WRMIF |
+  +---------+    +------------+    +--------------+    +-------+   |----------+    +-------+
+  | Sensor  |--->| MIPI CSI-2 |--->| MIPI ADAPTER |--->|  ISP  |---|----------+    +-------+
+  +---------+    +------------+    +--------------+    +-------+   | Resizer  |--->| WRMIF |
+                                                                   +----------+    +-------+
+                                                                   |----------+    +-------+
+                                                                   | Resizer  |--->| WRMIF |
+                                                                   +----------+    +-------+
+
+Driver architecture and design
+==============================
+
+With the goal to model the hardware links between the modules and to expose a
+clean, logical and usable interface, the driver registers the following V4L2
+sub-devices:
+
+- 1 `c3-mipi-csi2` sub-device - the MIPI CSI-2 receiver
+- 1 `c3-mipi-adapter` sub-device - the MIPI adapter
+- 1 `c3-isp-core` sub-device - the ISP core
+- 3 `c3-isp-resizer` sub-devices - the ISP resizers
+
+The `c3-isp-core` sub-device is linked to 2 video device nodes for statistics
+capture and parameters programming:
+
+- the `c3-isp-stats` capture video device node for statistics capture
+- the `c3-isp-params` output video device for parameters programming
+
+Each `c3-isp-resizer` sub-device is linked to a capture video device node where
+frames are captured from:
+
+- `c3-isp-resizer0` is linked to the `c3-isp-cap0` capture video device
+- `c3-isp-resizer1` is linked to the `c3-isp-cap1` capture video device
+- `c3-isp-resizer2` is linked to the `c3-isp-cap2` capture video device
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
+Runtime configuration of the ISP hardware is performed on the `c3-isp-params`
+video device node using the :ref:`V4L2_META_FMT_C3ISP_PARAMS
+<v4l2-meta-fmt-c3isp-params>` as data format. The buffer structure is defined by
+:c:type:`c3_isp_params_cfg`.
+
+Statistics are captured from the `c3-isp-stats` video device node using the
+:ref:`V4L2_META_FMT_C3ISP_STATS <v4l2-meta-fmt-c3isp-stats>` data format.
+
+The final picture size and format is configured using the V4L2 video
+capture interface on the `c3-isp-cap[0, 2]` video device nodes.
+
+The Amlogic C3 ISP is supported by `libcamera <https://libcamera.org>`_ with a
+dedicated pipeline handler and algorithms that perform run-time image correction
+and enhancement.
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
index 5bbfda5662b3..e6f66a240917 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1262,6 +1262,8 @@ AMLOGIC ISP DRIVER
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



