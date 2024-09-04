Return-Path: <linux-media+bounces-17572-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C54896BA65
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 13:26:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6B7F1F23C16
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 11:26:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DA501DB92B;
	Wed,  4 Sep 2024 11:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QpCutlmt"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E121D1F5B;
	Wed,  4 Sep 2024 11:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725448786; cv=none; b=gmqFxEiyhRK8oPcbOwiU2dVwyjURjvh5+V6NHi7++w0+vlfeKp8HzTZM9uH3WFIXwZUrb5lrueuqGLXaM/xw4hy+ovTW/cjFhai9xG6xweu991JTt4jXHhUbmXGKAdMD5/VbsJK3t1S8X0CHeUgBn0byz264tN8DE12WnQl/HO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725448786; c=relaxed/simple;
	bh=ldQ0outL4QKLwryuC/LIt5eVxQJHAdWhRM3fm421H80=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KhvgczaN9zV6NGWhl0KSoxteIgYKh/krufey2KC5IYu8ncFnNKxmVhDs8qdvS9S0HtZB359AzwrCYmv0vssm+xyLSzoAbJQA/cDQ7O2JnlUayEipXl8/Vgd/QhIbyoPBiwHGAxyCBwydl0zn2G+ckCxnalGX+qtALee3xdq6DdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QpCutlmt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-156-87-48.elisa-laajakaista.fi [91.156.87.48])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DFF741667;
	Wed,  4 Sep 2024 13:18:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725448707;
	bh=ldQ0outL4QKLwryuC/LIt5eVxQJHAdWhRM3fm421H80=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QpCutlmt1xgUwjUGOCQVvDLpiTzz68H4+zRrdi+Q3E0EC4L72NUM/FhxVyu/qQexL
	 Jc1/hkO0/2tmZoa9srWrmnYp9uxtsk9UyIW/Vj7YPKYEzxLhbY7K3mhnVrvk9KKdw0
	 2Xhukyxq5RBY9cvw/8XQUtNy63zZR2epGu78Nt9E=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 04 Sep 2024 14:19:12 +0300
Subject: [PATCH v4 4/4] media: admin-guide: Document the Raspberry Pi CFE
 (rp1-cfe)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240904-rp1-cfe-v4-4-f1b5b3d69c81@ideasonboard.com>
References: <20240904-rp1-cfe-v4-0-f1b5b3d69c81@ideasonboard.com>
In-Reply-To: <20240904-rp1-cfe-v4-0-f1b5b3d69c81@ideasonboard.com>
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
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBm2EJES1LdfUszMvchzvm+GMvfWmS7d4n9Sy5+I
 pTCILBELBaJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZthCRAAKCRD6PaqMvJYe
 9X3/D/9K21Z2vx7Gl2+IuakDPfT6CClfYMu1w3SioxKx17J7OfpXt1yK1O3ACI4KhhQnpc74mMF
 6RM8lvGujL0GJexuAKcO4y5An+XTJ77E5hejnPFy1cTToNkCM3NVuxdhbE30XY2c0QZ1vfzmezB
 rUxCBBaV49lsSfYy+fZbbtCAq4EU1EkoVIzF1iXf37I94X1MlDvREuYmXoo492I3Rr5DBNHDpKY
 H3ZJD+vCCib8x1YguyOLPGb+zi51r97SM9GwU71/E+RRFM01OdnNflNZ1RGq7Mjf5ZuWTU9J7jB
 awotjqKhsy5HJxBPIcJznOw6qPq1Dkvqf9grQ7hNbpzlmwzBrsIPn4kGFVCma6PjxVra/CUg4Gz
 XuJPLTwZhVQZIEWLzoixoqswcYB3/OFp56Mj3K2ddnzscrsRY+I+vX5hMyO/2w4rxPkv6OomGR5
 hrFvfLcHpY0B0cJFo2AvkHTQ/DumlG+L5zj+FZzA1mvfyPpNBJtgDF66Wp8W6WfilRfrzBoyhAm
 6GfTlW79VIcg/6rShAyL6yteeeuATPjxUHMjKiPl2oP5LEtir0OsZ26nKO09PCuyTExUcxQKlmJ
 cEqesBswmfo45a02tgxNEnc+KsBmFPgNPfiKDswvndVZ7TtSw50RYeAIUqsLhAk+2v9R5HBTc8R
 KCnNJ4h7X6I1fzw==
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


