Return-Path: <linux-media+bounces-16335-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4899529F3
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2024 09:31:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 58972B20FF6
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2024 07:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E299519D89F;
	Thu, 15 Aug 2024 07:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="U4R2mOSk"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF6017B4EE;
	Thu, 15 Aug 2024 07:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723707011; cv=none; b=TTYrWAWWitWx8qYFxtiz/06cq/ASlv/m3Hv3m5U9PFG7EFBQjDregXK5/T383NOSny3SUGsQLB9G/ny4421JH+w42qgn7W7OhPWqgTgdPp5gp4WB8gqmH77H6ZFy4tVcw0cVCKglcXHCjgRAtPPakx5XljMArm3QoMhgSvUZYA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723707011; c=relaxed/simple;
	bh=ldQ0outL4QKLwryuC/LIt5eVxQJHAdWhRM3fm421H80=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ety8EMcQIe+CKalmbD/xX49BAFltsERqFReNaEGK61K16e3KiSFYrEVMhD5uJfExHtkNYH2lgEr6MnFE4A1oeDggA2Z/6KuJTHvJoVHjqNhTGxAUGT5RteZcbGccMO7JWCzUFYpO3T4oLhjLrCQ8MKH1+0f963uSJssKYgQ0nKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=U4R2mOSk; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-156-87-48.elisa-laajakaista.fi [91.156.87.48])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7545C16B0;
	Thu, 15 Aug 2024 09:28:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1723706938;
	bh=ldQ0outL4QKLwryuC/LIt5eVxQJHAdWhRM3fm421H80=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=U4R2mOSkTXcPHLm6QpKCEpz+Hw54Ax2DUTIDjyXHHbTZTl4MgjpFEgSLamw3a3ijL
	 /fSNpshs3e6I7vGIAn4nMOqKaLdJ+Qz6acAqWbxSSV0s3SAXxMVlJTN+L2K/Pq5P6B
	 j6Oe2IYOl3KEn6TIWKVj4zCcwh2GEGNtrt1Wj//o=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 15 Aug 2024 10:28:55 +0300
Subject: [PATCH v3 4/4] media: admin-guide: Document the Raspberry Pi CFE
 (rp1-cfe)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240815-rp1-cfe-v3-4-e15a979db327@ideasonboard.com>
References: <20240815-rp1-cfe-v3-0-e15a979db327@ideasonboard.com>
In-Reply-To: <20240815-rp1-cfe-v3-0-e15a979db327@ideasonboard.com>
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
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBmva5up5foUzCmunvjcc/xgqkCutlcEgG0jJVHQ
 cNqUqRY3taJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZr2ubgAKCRD6PaqMvJYe
 9RxRD/96nm1jm0YWU+EbYRd+xRk4baJ4K9jCOMw6kFneR1Pzwd8DfM9k5XbvjWbheSymyeMMG4a
 g7ul8v/7zDYsStYh/07TWVCa7MwrjWe3rk1Lf62Ugr5OT+Oco/Rf5dcSsL8D/AAGkP1G1A4QPZg
 scC2h2mMxsmm2xJ9uVIW0iMG6PU6jY7AbMvlkj0pCG4t6jS4yMig+QxyK3ipBRMY5T1xQfm2z2h
 pqPkCAHIvq4CSBlNDSCQdayJHFh1QXq+VtN0nPDGs66e0w2x5QAe5TsNf6PWcXc9OdTusYaiCl5
 gmd9fZ5Uie8b1iuwEj13lyj/L792BOgAIEi7HFRBzbw1KFcT8JEnEnuEcUSZHhtCgWiPQc8U6cO
 vxjau6mfIIfwkqJyNjVQafpzGLJPqMUEu/HC13YCkEaEmd7skGOfiD8joCZSya8/JlLIZDptdNF
 beNdCJMkAklO7dCKYMbBMMBKvd9EADk5jfpIYCEpwnx0q7rU6Fo9D4nStoIYt6wYcJdaRkddYqa
 7SZPEeBcK689klOnwn4pV/Fq8o0dQPHEkT6KeLn9v/+7nAzx7aBNJJbWR11bNCuPmTeN8cxgwHF
 adVuMuMhFrbnyMf1n5o5HMCH5OoTjnrn4GcrixCVsupSSTOY6rBLFkko+IduXjIb26Ynabc5Dza
 qXLE4wCMFcD4wkg==
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


