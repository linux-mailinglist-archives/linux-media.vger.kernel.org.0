Return-Path: <linux-media+bounces-14206-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BA3918E18
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 20:15:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 806F01F24492
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 18:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8A2B190684;
	Wed, 26 Jun 2024 18:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="k769Gkg1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8044B190480
	for <linux-media@vger.kernel.org>; Wed, 26 Jun 2024 18:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719425712; cv=none; b=g77/fUgDOAD/Apy3X6tQwAirzJ99bnmBJOhL9a1BAMJtWVV3UCL8xwKpAS3MjIiy1FFbtvWAvMCqKc4UfNi2fXjUuIC2CBA1WfOJwZQDTQnd/C02cMZBBsohAIk8r/1381z3K4PWgQHgsNmifUS4LBv+KrStJRkBFBZAQUavKcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719425712; c=relaxed/simple;
	bh=oyuCgxTv4hl2JY8XNMK4A6DznDCW7nfLR3RghWmXy8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X93bYp5Zvew6ySxHV6ansaEIcgLs0qfgm9sVmclrEclc/SMpqtCZ5MkumGTmEYUX8WSf+LhHqmG6nweF132pZp5Mr4rmdAYNBhBPxQCxNhovu2MH7RG/fdX819zQeatKhcW60otq+nZA1JaCAP/EBMcRT+R+1UZGpHlKUwkqWeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=k769Gkg1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4F8E91BA0;
	Wed, 26 Jun 2024 20:14:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1719425679;
	bh=oyuCgxTv4hl2JY8XNMK4A6DznDCW7nfLR3RghWmXy8Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k769Gkg1v9U3iY0F/GZNr1M7mDgYoB3c7/Ulv0YEIzr/B6gSN1snOGmTCAFGR1DQB
	 HUACxCRMm33iFFbuSaTVdOZbIa/j6uhTewy5+7hLN79wuFJM9EGiz965m6SQ0NdEEm
	 Yumdx5MA/3zYAN9308ONGXjPApa5cuwZnkBtsuis=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v11 8/8] media: admin-guide: Document the Raspberry Pi PiSP BE
Date: Wed, 26 Jun 2024 20:14:38 +0200
Message-ID: <20240626181440.195137-9-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240626181440.195137-1-jacopo.mondi@ideasonboard.com>
References: <20240626181440.195137-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation for the PiSP Back End memory-to-memory ISP.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../admin-guide/media/raspberrypi-pisp-be.dot |  20 ++++
 .../admin-guide/media/raspberrypi-pisp-be.rst | 109 ++++++++++++++++++
 .../admin-guide/media/v4l-drivers.rst         |   1 +
 3 files changed, 130 insertions(+)
 create mode 100644 Documentation/admin-guide/media/raspberrypi-pisp-be.dot
 create mode 100644 Documentation/admin-guide/media/raspberrypi-pisp-be.rst

diff --git a/Documentation/admin-guide/media/raspberrypi-pisp-be.dot b/Documentation/admin-guide/media/raspberrypi-pisp-be.dot
new file mode 100644
index 000000000000..55671dc1d443
--- /dev/null
+++ b/Documentation/admin-guide/media/raspberrypi-pisp-be.dot
@@ -0,0 +1,20 @@
+digraph board {
+	rankdir=TB
+	n00000001 [label="{{<port0> 0 | <port1> 1 | <port2> 2 | <port7> 7} | pispbe\n | {<port3> 3 | <port4> 4 | <port5> 5 | <port6> 6}}", shape=Mrecord, style=filled, fillcolor=green]
+	n00000001:port3 -> n0000001c [style=bold]
+	n00000001:port4 -> n00000022 [style=bold]
+	n00000001:port5 -> n00000028 [style=bold]
+	n00000001:port6 -> n0000002e [style=bold]
+	n0000000a [label="pispbe-input\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
+	n0000000a -> n00000001:port0 [style=bold]
+	n00000010 [label="pispbe-tdn_input\n/dev/video1", shape=box, style=filled, fillcolor=yellow]
+	n00000010 -> n00000001:port1 [style=bold]
+	n00000016 [label="pispbe-stitch_input\n/dev/video2", shape=box, style=filled, fillcolor=yellow]
+	n00000016 -> n00000001:port2 [style=bold]
+	n0000001c [label="pispbe-output0\n/dev/video3", shape=box, style=filled, fillcolor=yellow]
+	n00000022 [label="pispbe-output1\n/dev/video4", shape=box, style=filled, fillcolor=yellow]
+	n00000028 [label="pispbe-tdn_output\n/dev/video5", shape=box, style=filled, fillcolor=yellow]
+	n0000002e [label="pispbe-stitch_output\n/dev/video6", shape=box, style=filled, fillcolor=yellow]
+	n00000034 [label="pispbe-config\n/dev/video7", shape=box, style=filled, fillcolor=yellow]
+	n00000034 -> n00000001:port7 [style=bold]
+}
diff --git a/Documentation/admin-guide/media/raspberrypi-pisp-be.rst b/Documentation/admin-guide/media/raspberrypi-pisp-be.rst
new file mode 100644
index 000000000000..0fcf46f26276
--- /dev/null
+++ b/Documentation/admin-guide/media/raspberrypi-pisp-be.rst
@@ -0,0 +1,109 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=========================================================
+Raspberry Pi PiSP Back End Memory-to-Memory ISP (pisp-be)
+=========================================================
+
+The PiSP Back End
+=================
+
+The PiSP Back End is a memory-to-memory Image Signal Processor (ISP) which reads
+image data from DRAM memory and performs image processing as specified by the
+application through the parameters in a configuration buffer, before writing
+pixel data back to memory through two distinct output channels.
+
+The ISP registers and programming model are documented in the `Raspberry Pi
+Image Signal Processor (PiSP) Specification document`_
+
+The PiSP Back End ISP processes images in tiles. The handling of image
+tessellation and the computation of low-level configuration parameters is
+realized by a free software library called `libpisp
+<https://github.com/raspberrypi/libpisp>`_.
+
+The full image processing pipeline, which involves capturing RAW Bayer data from
+an image sensor through a MIPI CSI-2 compatible capture interface, storing them
+in DRAM memory and processing them in the PiSP Back End to obtain images usable
+by an application is implemented in `libcamera <https://libcamera.org>`_ as
+part of the Raspberry Pi platform support.
+
+The pisp-be driver
+==================
+
+The Raspberry Pi PiSP Back End (pisp-be) driver is located under
+drivers/media/platform/raspberrypi/pisp-be. It uses the `V4L2 API` to register
+a number of video capture and output devices, the `V4L2 subdev API` to register
+a subdevice for the ISP that connects the video devices in a single media graph
+realized using the `Media Controller (MC) API`.
+
+The media topology registered by the `pisp-be` driver is represented below:
+
+.. _pips-be-topology:
+
+.. kernel-figure:: raspberrypi-pisp-be.dot
+    :alt:   Diagram of the default media pipeline topology
+    :align: center
+
+
+The media graph registers the following video device nodes:
+
+- pispbe-input: output device for images to be submitted to the ISP for
+  processing.
+- pispbe-tdn_input: output device for temporal denoise.
+- pispbe-stitch_input: output device for image stitching (HDR).
+- pispbe-output0: first capture device for processed images.
+- pispbe-output1: second capture device for processed images.
+- pispbe-tdn_output: capture device for temporal denoise.
+- pispbe-stitch_output: capture device for image stitching (HDR).
+- pispbe-config: output device for ISP configuration parameters.
+
+pispbe-input
+------------
+
+Images to be processed by the ISP are queued to the `pispbe-input` output device
+node. For a list of image formats supported as input to the ISP refer to the
+`Raspberry Pi Image Signal Processor (PiSP) Specification document`_.
+
+pispbe-tdn_input, pispbe-tdn_output
+-----------------------------------
+
+The `pispbe-tdn_input` output video device receives images to be processed by
+the temporal denoise block which are captured from the `pispbe-tdn_output`
+capture video device. Userspace is responsible for maintaining queues on both
+devices, and ensuring that buffers completed on the output are queued to the
+input.
+
+pispbe-stitch_input, pispbe-stitch_output
+-----------------------------------------
+
+To realize HDR (high dynamic range) image processing the image stitching and
+tonemapping blocks are used. The `pispbe-stitch_output` writes images to memory
+and the `pispbe-stitch_input` receives the previously written frame to process
+it along with the current input image. Userspace is responsible for maintaining
+queues on both devices, and ensuring that buffers completed on the output are
+queued to the input.
+
+pispbe-output0, pispbe-output1
+------------------------------
+
+The two capture devices write to memory the pixel data as processed by the ISP.
+
+pispbe-config
+-------------
+
+The `pispbe-config` output video devices receives a buffer of configuration
+parameters that define the desired image processing to be performed by the ISP.
+
+The format of the ISP configuration parameter is defined by
+:c:type:`pisp_be_tiles_config` C structure and the meaning of each parameter is
+described in the `Raspberry Pi Image Signal Processor (PiSP) Specification
+document`_.
+
+ISP configuration
+=================
+
+The ISP configuration is described solely by the content of the parameters
+buffer. The only parameter that userspace needs to configure using the V4L2 API
+is the image format on the output and capture video devices for validation of
+the content of the parameters buffer.
+
+.. _Raspberry Pi Image Signal Processor (PiSP) Specification document: https://datasheets.raspberrypi.com/camera/raspberry-pi-image-signal-processor-specification.pdf
diff --git a/Documentation/admin-guide/media/v4l-drivers.rst b/Documentation/admin-guide/media/v4l-drivers.rst
index 4120eded9a13..b6af448b9fe9 100644
--- a/Documentation/admin-guide/media/v4l-drivers.rst
+++ b/Documentation/admin-guide/media/v4l-drivers.rst
@@ -23,6 +23,7 @@ Video4Linux (V4L) driver-specific documentation
 	omap4_camera
 	philips
 	qcom_camss
+	raspberrypi-pisp-be
 	rcar-fdp1
 	rkisp1
 	saa7134
-- 
2.45.2


