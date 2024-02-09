Return-Path: <linux-media+bounces-4894-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EF97284FA28
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 17:52:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F9561F21635
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 16:52:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23C2D129A8B;
	Fri,  9 Feb 2024 16:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vtQB7j7S"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA417E115
	for <linux-media@vger.kernel.org>; Fri,  9 Feb 2024 16:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707497344; cv=none; b=CSey46W0p34iXHvdkd3+NiZUoUG7Wq6BrLHbugU2Rmj64Voxv5XEklUYaW2wK6DZnW49kZ9LcUlpMy2iADX/3Nv8NYfxEhEQWmGgCaCVkkzFYsvzXbj3GW0BTf2JupvPAHZzCheC+Zd2v7sAyIalDBP/5An7UBHw4SbMeHtbNqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707497344; c=relaxed/simple;
	bh=0HtMe6hNYfpY/mewRhsoX6CI2BMKIa0cQQLfu40DBb4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ui5IWKgtRvKjSWVx8W1753g5yA6e+udvKTxVGuYVsEkuSo1ui4VLBz6Ahzev5Ppzxe7o3+MGh0df/V+16Xmb65wu4f6LgCOWQaQZCtOCzzqSWW346T+7fY87J85wqWDpUjs44o5yV4IMmZ5v7r5icSIdMpCsHo8d4e9CWl9Fdxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vtQB7j7S; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (unknown [IPv6:2001:b07:5d2e:52c9:cc1e:e404:491f:e6ea])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 96CF66054;
	Fri,  9 Feb 2024 17:47:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1707497246;
	bh=0HtMe6hNYfpY/mewRhsoX6CI2BMKIa0cQQLfu40DBb4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vtQB7j7SyHJARlTwiYpxKYg8U5zPH+v9OnAoAwXDzf+Te/a2FG4OxtYwTuwa8bDVG
	 UCof4VLdq1ZSOl8UCotCZE4v0iyZrp0RiRmmwUylHCqb+Dak/Z4+wi0hIoWMSeQelU
	 BEutlYtoqnXHXvki7qZS4KteHmjFP5Pwd85UwHeg=
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
Subject: [PATCH 8/8] media: admin-guide: Document the Raspberry Pi PiSP BE
Date: Fri,  9 Feb 2024 17:48:23 +0100
Message-ID: <20240209164825.166800-9-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240209164825.166800-1-jacopo.mondi@ideasonboard.com>
References: <20240209164825.166800-1-jacopo.mondi@ideasonboard.com>
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
 Documentation/admin-guide/media/pisp-be.dot   |  22 ++++
 Documentation/admin-guide/media/pisp-be.rst   | 117 ++++++++++++++++++
 .../admin-guide/media/v4l-drivers.rst         |   1 +
 3 files changed, 140 insertions(+)
 create mode 100644 Documentation/admin-guide/media/pisp-be.dot
 create mode 100644 Documentation/admin-guide/media/pisp-be.rst

diff --git a/Documentation/admin-guide/media/pisp-be.dot b/Documentation/admin-guide/media/pisp-be.dot
new file mode 100644
index 000000000000..001b2c16e232
--- /dev/null
+++ b/Documentation/admin-guide/media/pisp-be.dot
@@ -0,0 +1,22 @@
+digraph board {
+	rankdir=TB
+	n00000001 [label="{{<port0> 0 | <port1> 1 | <port2> 2 | <port8> 8} | pispbe\n | {<port3> 3 | <port4> 4 | <port5> 5 | <port6> 6 | <port7> 7}}", shape=Mrecord, style=filled, fillcolor=green]
+	n00000001:port3 -> n0000001d [style=bold]
+	n00000001:port4 -> n00000023 [style=bold]
+	n00000001:port5 -> n00000029 [style=bold]
+	n00000001:port6 -> n0000002f [style=bold]
+	n00000001:port7 -> n00000035 [style=bold]
+	n0000000b [label="pispbe-input\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
+	n0000000b -> n00000001:port0 [style=bold]
+	n00000011 [label="pispbe-tdn_input\n/dev/video1", shape=box, style=filled, fillcolor=yellow]
+	n00000011 -> n00000001:port1 [style=bold]
+	n00000017 [label="pispbe-stitch_input\n/dev/video2", shape=box, style=filled, fillcolor=yellow]
+	n00000017 -> n00000001:port2 [style=bold]
+	n0000001d [label="pispbe-hog_output\n/dev/video3", shape=box, style=filled, fillcolor=yellow]
+	n00000023 [label="pispbe-output0\n/dev/video4", shape=box, style=filled, fillcolor=yellow]
+	n00000029 [label="pispbe-output1\n/dev/video5", shape=box, style=filled, fillcolor=yellow]
+	n0000002f [label="pispbe-tdn_output\n/dev/video6", shape=box, style=filled, fillcolor=yellow]
+	n00000035 [label="pispbe-stitch_output\n/dev/video7", shape=box, style=filled, fillcolor=yellow]
+	n0000003b [label="pispbe-config\n/dev/video8", shape=box, style=filled, fillcolor=yellow]
+	n0000003b -> n00000001:port8 [style=bold]
+}
diff --git a/Documentation/admin-guide/media/pisp-be.rst b/Documentation/admin-guide/media/pisp-be.rst
new file mode 100644
index 000000000000..871d44c3de04
--- /dev/null
+++ b/Documentation/admin-guide/media/pisp-be.rst
@@ -0,0 +1,117 @@
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
+The ISP registers a programming model are documented in the `Raspberry Pi Image
+Signal Processor (ISP) Specification document
+<https://datasheets.raspberrypi.com/camera/raspberry-pi-image-signal-processor-specification.pdf>`_
+
+The PiSP Back End ISP processes images in tiles to allow concurrent processing
+of different images. The handling of image tassellation and the computation of
+low-level configuration parameters is realized by a free software library
+called `libpisp <https://github.com/raspberrypi/libpisp>`_.
+
+The full image processing pipeline, which involves capturing RAW Bayer data from
+an image sensor through a MIPI CSI-2 compatible capture interface, storing them
+in DRAM memory and processing them in the PiSP Back to obtain images usable by
+an application is implemented in `libcamera <www.libcamera.org>`_ as part of the
+Raspberry Pi platform support.
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
+As the PiSP Back End device processes images in tiles, it can be multiplexed
+between several different execution contexts. The driver registers two
+`contexts` represented as two distinct media graph instances but could
+potentially register more of them.
+
+The media topology registered by the `pisp-be` driver is the following one:
+
+.. _pips-be-topology:
+
+.. kernel-figure:: pisp-be.dot
+    :alt:   Diagram of the default media pipeline topology
+    :align: center
+
+
+Each media graph instance registers the following video device nodes:
+
+- pispbe-input: output device for images to be submitted to the ISP for
+  processing.
+- pispbe-tdn_input: output device for temporal denoise.
+- pispbe-stitch_input: output device for image stitching (HDR).
+- pipsbe-hog_output: capture device for HOG (histogram of oriented gradients).
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
+node. For a list of image formats supported as input format by the ISP refer to
+the PiSP specification document.
+
+pispbe-tdn_input, pispbe-tdn_output
+-----------------------------------
+
+The `pispbe-tdn_input` output video device receives images to be processed by
+the temporal denoise block which are captured from the `pispbe-tdn_output`
+capture video device. Userspace should maintain a queue of buffers as captured
+from the TDN output and input to the TDN input device.
+
+pispbe-stitch_input, pispbe-tdn_output
+--------------------------------------
+
+To realize HDR (high dynamic range) image processing the image stitching and
+tonemapping blocks are used. The `pispbe-stitch_output` writes images to memory
+and the `pispbe-stitch_input` receives the previously written frame to process
+it along with the current input image. Userspace should maintain a queue of
+buffers as captured from the stitch output and input to the stitch input device.
+
+pipsbe-hog_output
+-----------------
+
+The `pipsbe-hog_output` video capture device produces image statistics in the
+form of 'Histogram of Oriented Gradients'.
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
+described in the `PiSP specification` document.
+
+ISP configuration
+=================
+
+The ISP configuration is described solely by the content of the parameters
+buffer. The only parameter that userspace needs to configure using the V4L2 API
+is the image format on the output and capture video devices for validation of
+the content of the parameters buffer.
diff --git a/Documentation/admin-guide/media/v4l-drivers.rst b/Documentation/admin-guide/media/v4l-drivers.rst
index f4bb2605f07e..1a491a74a272 100644
--- a/Documentation/admin-guide/media/v4l-drivers.rst
+++ b/Documentation/admin-guide/media/v4l-drivers.rst
@@ -21,6 +21,7 @@ Video4Linux (V4L) driver-specific documentation
 	omap3isp
 	omap4_camera
 	philips
+	pisp-be
 	qcom_camss
 	rcar-fdp1
 	rkisp1
-- 
2.43.0


