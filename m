Return-Path: <linux-media+bounces-19031-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E02D98ED0C
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 12:32:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1EBC1C21532
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 10:32:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06ECF14BF9B;
	Thu,  3 Oct 2024 10:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gifD98a6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89FA1547FB;
	Thu,  3 Oct 2024 10:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727951515; cv=none; b=RBuCAYnq7wnq5hb8HilOzk1IGJyrFsaaWIFSPgqL7mG5kKFHx4AbfnF58oeLj5hV/57YglTVyNBX0qNDIkPPZG422xzKvnATrxN9Yw49f4S8Bf9PuYvtwMvw1hwjl7OFPt3GRD300kjE8prHuQ7nVX+Gp2Qj0S4FctljmXZnISs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727951515; c=relaxed/simple;
	bh=ldQ0outL4QKLwryuC/LIt5eVxQJHAdWhRM3fm421H80=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kJf4Xc8Z2dRbpw+rGFe0ModPssRwgQrOJeqbDbH7tQLvwSIbxBvG+dIGH6roWTCR63w7fvwJJHUQSUqSPAi6X4/UtrjgiZVDFYFc91ZMDQPaUJ1cxTzWdHkNTEeqwTIEU+yNbyi0b5yEo4E6JVsyFaleFKN/A6K9z1yu6qbgHng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gifD98a6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-156-87-48.elisa-laajakaista.fi [91.156.87.48])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6AB651014;
	Thu,  3 Oct 2024 12:30:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727951411;
	bh=ldQ0outL4QKLwryuC/LIt5eVxQJHAdWhRM3fm421H80=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gifD98a65IKIEcxngPtuBJ4H7PdF/YswKYg+mHBfqU/oeHI6cQkfpHeBzjd/hJmxg
	 TF5wfYp76Au9xUO/1fXeWM32Baud4lHwi3+j8cATznarJSC74wuGz6owSG3HjZQM2A
	 vn4Rq3zP2KkTUZFifmVr4WNl69trc1TRqJqc0n0s=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 03 Oct 2024 13:31:13 +0300
Subject: [PATCH v6 4/4] media: admin-guide: Document the Raspberry Pi CFE
 (rp1-cfe)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241003-rp1-cfe-v6-4-d6762edd98a8@ideasonboard.com>
References: <20241003-rp1-cfe-v6-0-d6762edd98a8@ideasonboard.com>
In-Reply-To: <20241003-rp1-cfe-v6-0-d6762edd98a8@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Naushir Patuck <naush@raspberrypi.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6375;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=ldQ0outL4QKLwryuC/LIt5eVxQJHAdWhRM3fm421H80=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBm/nKJ24KprpELq5Z3yI493Y0G6N9P42sYC6HYJ
 Dl3ykb/SQKJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZv5yiQAKCRD6PaqMvJYe
 9SCfD/9BNLAxQ2Hj28mgmmb4lkVSp9C4HMV/T4n3fBopxAwSSqZZJ56c9cwIoJpasKN7j4vLESR
 SeF9czRADjCZPGytnGZWwTv1LimeUmdlctHDeHE7xDKaX+8nz2juyIkZ67lusCOYECJ3f9S52BN
 ccKMBxUUuPamXLNQuDheCPZD1h4F3J07EqqvU6VG+h6cC7ENwYxM0D2RtVZvBMtrCxdE2CkU2+F
 qPHv8CQ3g0fPgfANW+RSNPzMEvwE1vVJyzfuymtNZBmyb5FhjIjN8und56MLko1Bgs2sQNGOqXz
 njL9Ju6Kx3DLs3LIPy3LYHtGZdbij632awrVSmu2fUIaG/7PT5+MxL9dLSFjW8RZnqqYSZfUCsu
 L3/euGopvKXILPbDKyBDPIG4XpnigRDGzIqp6V5Hv/iixk+jKSWfq/S36hs7wXP+MC03t+uVl2j
 KGWZek/tXinDKIBWGDFAsmH/rQQTKdW1vvECq9/KI2XMTsDknL1v2gRtaXMDtqMuzeEiC/8m4Hj
 5MHpr04VMVJzJQuLMaa7HhDpKdRLPQBjGEFNqH0a1Wv4sEOYW9E9RhOUM51zxR6gPqEoKBkDSLr
 4XOdSIEBWA80COWVnUEvfniyax0qIIM1cx1Fa6Nwq/p1GU/PCpCKdJifsUX5rj1Yd8af5PPIksu
 NE8/KtGK+WwxTzQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Add documentation for rp1-cfe driver.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 .../admin-guide/media/raspberrypi-rp1-cfe.dot      | 27 ++++++++
 .../admin-guide/media/raspberrypi-rp1-cfe.rst      | 78 ++++++++++++++++++++++
 Documentation/admin-guide/media/v4l-drivers.rst    |  1 +
 3 files changed, 106 insertions(+)

diff --git a/Documentation/admin-guide/media/raspberrypi-rp1-cfe.dot b/Documentation/admin-guide/media/raspberrypi-rp1-cfe.dot
new file mode 100644
index 000000000000..7717f2291049
--- /dev/null
+++ b/Documentation/admin-guide/media/raspberrypi-rp1-cfe.dot
@@ -0,0 +1,27 @@
+digraph board {
+	rankdir=TB
+	n00000001 [label="{{<port0> 0} | csi2\n/dev/v4l-subdev0 | {<port1> 1 | <port2> 2 | <port3> 3 | <port4> 4}}", shape=Mrecord, style=filled, fillcolor=green]
+	n00000001:port1 -> n00000011 [style=dashed]
+	n00000001:port1 -> n00000007:port0
+	n00000001:port2 -> n00000015
+	n00000001:port2 -> n00000007:port0 [style=dashed]
+	n00000001:port3 -> n00000019 [style=dashed]
+	n00000001:port3 -> n00000007:port0 [style=dashed]
+	n00000001:port4 -> n0000001d [style=dashed]
+	n00000001:port4 -> n00000007:port0 [style=dashed]
+	n00000007 [label="{{<port0> 0 | <port1> 1} | pisp-fe\n/dev/v4l-subdev1 | {<port2> 2 | <port3> 3 | <port4> 4}}", shape=Mrecord, style=filled, fillcolor=green]
+	n00000007:port2 -> n00000021
+	n00000007:port3 -> n00000025 [style=dashed]
+	n00000007:port4 -> n00000029
+	n0000000d [label="{imx219 6-0010\n/dev/v4l-subdev2 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
+	n0000000d:port0 -> n00000001:port0 [style=bold]
+	n00000011 [label="rp1-cfe-csi2-ch0\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
+	n00000015 [label="rp1-cfe-csi2-ch1\n/dev/video1", shape=box, style=filled, fillcolor=yellow]
+	n00000019 [label="rp1-cfe-csi2-ch2\n/dev/video2", shape=box, style=filled, fillcolor=yellow]
+	n0000001d [label="rp1-cfe-csi2-ch3\n/dev/video3", shape=box, style=filled, fillcolor=yellow]
+	n00000021 [label="rp1-cfe-fe-image0\n/dev/video4", shape=box, style=filled, fillcolor=yellow]
+	n00000025 [label="rp1-cfe-fe-image1\n/dev/video5", shape=box, style=filled, fillcolor=yellow]
+	n00000029 [label="rp1-cfe-fe-stats\n/dev/video6", shape=box, style=filled, fillcolor=yellow]
+	n0000002d [label="rp1-cfe-fe-config\n/dev/video7", shape=box, style=filled, fillcolor=yellow]
+	n0000002d -> n00000007:port1
+}
diff --git a/Documentation/admin-guide/media/raspberrypi-rp1-cfe.rst b/Documentation/admin-guide/media/raspberrypi-rp1-cfe.rst
new file mode 100644
index 000000000000..668d978a9875
--- /dev/null
+++ b/Documentation/admin-guide/media/raspberrypi-rp1-cfe.rst
@@ -0,0 +1,78 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+============================================
+Raspberry Pi PiSP Camera Front End (rp1-cfe)
+============================================
+
+The PiSP Camera Front End
+=========================
+
+The PiSP Camera Front End (CFE) is a module which combines a CSI-2 receiver with
+a simple ISP, called the Front End (FE).
+
+The CFE has four DMA engines and can write frames from four separate streams
+received from the CSI-2 to the memory. One of those streams can also be routed
+directly to the FE, which can do minimal image processing, write two versions
+(e.g. non-scaled and downscaled versions) of the received frames to memory and
+provide statistics of the received frames.
+
+The FE registers are documented in the `Raspberry Pi Image Signal Processor
+(ISP) Specification document
+<https://datasheets.raspberrypi.com/camera/raspberry-pi-image-signal-processor-specification.pdf>`_,
+and example code for FE can be found in `libpisp
+<https://github.com/raspberrypi/libpisp>`_.
+
+The rp1-cfe driver
+==================
+
+The Raspberry Pi PiSP Camera Front End (rp1-cfe) driver is located under
+drivers/media/platform/raspberrypi/rp1-cfe. It uses the `V4L2 API` to register
+a number of video capture and output devices, the `V4L2 subdev API` to register
+subdevices for the CSI-2 received and the FE that connects the video devices in
+a single media graph realized using the `Media Controller (MC) API`.
+
+The media topology registered by the `rp1-cfe` driver, in this particular
+example connected to an imx219 sensor, is the following one:
+
+.. _rp1-cfe-topology:
+
+.. kernel-figure:: raspberrypi-rp1-cfe.dot
+    :alt:   Diagram of an example media pipeline topology
+    :align: center
+
+The media graph contains the following video device nodes:
+
+- rp1-cfe-csi2-ch0: capture device for the first CSI-2 stream
+- rp1-cfe-csi2-ch1: capture device for the second CSI-2 stream
+- rp1-cfe-csi2-ch2: capture device for the third CSI-2 stream
+- rp1-cfe-csi2-ch3: capture device for the fourth CSI-2 stream
+- rp1-cfe-fe-image0: capture device for the first FE output
+- rp1-cfe-fe-image1: capture device for the second FE output
+- rp1-cfe-fe-stats: capture device for the FE statistics
+- rp1-cfe-fe-config: output device for FE configuration
+
+rp1-cfe-csi2-chX
+----------------
+
+The rp1-cfe-csi2-chX capture devices are normal V4L2 capture devices which
+can be used to capture video frames or metadata received from the CSI-2.
+
+rp1-cfe-fe-image0, rp1-cfe-fe-image1
+------------------------------------
+
+The rp1-cfe-fe-image0 and rp1-cfe-fe-image1 capture devices are used to write
+the processed frames to memory.
+
+rp1-cfe-fe-stats
+----------------
+
+The format of the FE statistics buffer is defined by
+:c:type:`pisp_statistics` C structure and the meaning of each parameter is
+described in the `PiSP specification` document.
+
+rp1-cfe-fe-config
+-----------------
+
+The format of the FE configuration buffer is defined by
+:c:type:`pisp_fe_config` C structure and the meaning of each parameter is
+described in the `PiSP specification` document.
diff --git a/Documentation/admin-guide/media/v4l-drivers.rst b/Documentation/admin-guide/media/v4l-drivers.rst
index b6af448b9fe9..61da154e079a 100644
--- a/Documentation/admin-guide/media/v4l-drivers.rst
+++ b/Documentation/admin-guide/media/v4l-drivers.rst
@@ -26,6 +26,7 @@ Video4Linux (V4L) driver-specific documentation
 	raspberrypi-pisp-be
 	rcar-fdp1
 	rkisp1
+	raspberrypi-rp1-cfe
 	saa7134
 	si470x
 	si4713

-- 
2.43.0


