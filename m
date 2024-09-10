Return-Path: <linux-media+bounces-18049-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB8B972BA0
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 10:11:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 404C91F26438
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 08:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4268B1917FF;
	Tue, 10 Sep 2024 08:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="r/yveOD/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB761917DD;
	Tue, 10 Sep 2024 08:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725955661; cv=none; b=kHlGT/azx1e4zdHa5ZAZVu2RDObG/j5MFqATaMXKEYZOkzHt/6t4ctAB52JwqwSqGMITDtTtOH3Nor8nrWrSyPLtK8HCdtWWTgJo0megIepjYPOiHpQue1qQqMiSC2W4cG9L10b2S1md+Ijb9ges3KAS5fINfZTS7YCYoPeOFyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725955661; c=relaxed/simple;
	bh=ldQ0outL4QKLwryuC/LIt5eVxQJHAdWhRM3fm421H80=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IXgwyVBZwI4ZeOP/2TXWLVkztMYljNDayqX5LmPLr2DcKtDLbjn0c+cZ76fmgBA5baJZD11TMNCsFoqZq6efrvDCuQkwomPtiJjm5aukSNYD2zx8gNvyr6GmvzHorDEary6Lcq1sSNaSe/DCuivKrykfJyTVlUm+uMuVUM0zET8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=r/yveOD/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-156-87-48.elisa-laajakaista.fi [91.156.87.48])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A12301A60;
	Tue, 10 Sep 2024 10:06:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725955578;
	bh=ldQ0outL4QKLwryuC/LIt5eVxQJHAdWhRM3fm421H80=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=r/yveOD/QBWvCrKsa2ZyEMHRSdg105C+L4vqPB/LcEmNha7dOrOwls6/O98S5QEQ2
	 k73qCZx3DuNnTZUqK/2Ye+5iwAfebwz4ABJWoEg2g7p8y0gNbM5PazuFDDNNwjSU6u
	 s4f4nVLzZae4wfGZhFRRfK+P3efXctmYBFwUgkzQ=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 10 Sep 2024 11:07:09 +0300
Subject: [PATCH v5 4/4] media: admin-guide: Document the Raspberry Pi CFE
 (rp1-cfe)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240910-rp1-cfe-v5-4-9ab4c4c8eace@ideasonboard.com>
References: <20240910-rp1-cfe-v5-0-9ab4c4c8eace@ideasonboard.com>
In-Reply-To: <20240910-rp1-cfe-v5-0-9ab4c4c8eace@ideasonboard.com>
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
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBm3/5BqQ9yMYwo1Yar/vRA3IGB/2qZTLd5iW9CX
 1aEDGSMJLGJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZt/+QQAKCRD6PaqMvJYe
 9V1eD/9J5jhFiLHKyDfWf/5IC1O6eTUyCPP0UNHr2qh/Asjy2aLZSe4ToaZnolsKM44S+NXYXgd
 fzwm+XRzU1VbcMxHsll2BT7sEmYqkoU5STPHZ1El3Y3gQEE+UEwb7ciEMDscLg0f5k9cAm+xsAq
 6gqltEvMUZjtqEcxjI1tR63GudWYVfqlMzHI/EYtHcVEFPyRvNBHgjXMTc9zTifWDhs7YN+HkNB
 0t/18gdC4O/8F8oytoy6KUGIyfRO8bAbcK0VlAqqfPjys4kkuQMy0CXYkcVzVKlLjLbVrfvovzb
 0IGdqq+w22tHC2TsDAAibc+OpPVQTrJQDfAyE9YDSzNvvEjA79ftqpLxwzaZTgnEavAoCeE6+cc
 lpfNUzZ6B5S6QOZU183H0np/y0nNJQe1fM61hOsr6STPKOfGPcXyspwLWAxC5dRwRBLImvQvjXH
 ICS/7a3WdRJFUAG5DJAEvMAIHpjN0H/K463xmxnE3voeyQB/UDPulRdLgRzST9Jyo+NctbcMEa0
 sujX0yLU5QYr09H+XqRw/7luXjTESMjQbCIu2l0D/vgJqpXV5XDoyLWGBk91P+0qadXaEyvBLBT
 bPnb7YvmeRb0lyKH4MdQkm4ZXwkKYI4phcM8U1rz/mVLhDgXLIf7eepXOZCcouh+YXz+oCDsIXM
 Z+bm4XYrR86ZHDg==
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


