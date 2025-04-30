Return-Path: <linux-media+bounces-31403-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A18CAAA4716
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 11:28:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 394C87A6A81
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 09:27:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16BCE2376FC;
	Wed, 30 Apr 2025 09:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nFYwVgzv"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3459822D795;
	Wed, 30 Apr 2025 09:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746005265; cv=none; b=UISZeAmnF5nxQ5DMxJ/kBDmPmy+CH46+Cv8+Eb7F5dP56T80Iq8ycWumkI9IOeWDFNfKAq66f4NS3qf9AgWtom9mhXZOlewLgQDXP9ph/srMcxc6Kqflm30lYl5uAMb9/PN56qEJICC1m469/pKv/BFCvDMhlkvXjXQhFuJQCCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746005265; c=relaxed/simple;
	bh=LhjzYTVbEmq8KN4Wgt9+26RV811P+w/qGS6tZIYmKcg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=igAR7NtLAOfVCrh0W22g+yN18H2e+fXjsXic28fKlvPV9UpvAqtK9MMHlPImWhpjz0Uxp9/rNabQxJLLg+MrDzjULNhTDUZypeGRVlcbjtRWoLSaOcIQlfTSgWRUtrOjxB/fcx4c0QzjNYovg4z0/V3jbF2rCGOKuL31E5Q0fYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nFYwVgzv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B26E6C4CEEA;
	Wed, 30 Apr 2025 09:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746005264;
	bh=LhjzYTVbEmq8KN4Wgt9+26RV811P+w/qGS6tZIYmKcg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nFYwVgzvxpJM64jAQ8yaHa54+UUO/ooHqpjStYq7wOFcAdB9LT0rBMu1thar7b+kO
	 WDNMOJ4t+7io+PpQqH0uJM406g7vGNhdTNWMWQ5S61rr06y3AvnTLikRI1Ipjj7x4F
	 EOe1Yv8WisBxXiZthWR9GXFFaokT+zwySMyOKUKeJT7RHIjpeS0qnAzaXEiE3CzRDl
	 G9NguwJakyTpo2YGLfud4d9GZWEgMEyLrSyU2uxE131ZhZXvIiWKV/NseZuG/cMN0J
	 1MoXHqZUAwhUJuyt5/5Q9sUVLEdRPQnWDlrIMcU1P1Ac4YdykzGGwQ2y8xoMjj9USf
	 0NOQ904GvwPbw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A204AC3ABA9;
	Wed, 30 Apr 2025 09:27:44 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Wed, 30 Apr 2025 11:15:50 +0200
Subject: [PATCH v6 01/13] Documentation: admin-guide: media: add rockchip
 camera interface
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-rk3568-vicap-v6-1-d2f5fbee1551@collabora.com>
References: <20240220-rk3568-vicap-v6-0-d2f5fbee1551@collabora.com>
In-Reply-To: <20240220-rk3568-vicap-v6-0-d2f5fbee1551@collabora.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Michael Riesch <michael.riesch@wolfvision.net>, 
 Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746004564; l=7140;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=lgdL2UknSGLykwZSJIFR4WTJWtgKAnMYvukM6U3+Y4Q=;
 b=C/k8awCE9Zax42BQaKv/HrCTRwdROkU9HCGFEInBwM1NhCEX/oZoapaOb95p8dujUjN1sUQqZ
 evrkHhp6G/MA1n+e+WLuN1jU9x+bEMngHEvpFoMn3VG727n2+XyQKdr
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com

From: Michael Riesch <michael.riesch@collabora.com>

Add a document that describes the different variants of the Rockchip
Camera Interface (CIF), their hardware layout, as well as their
representation in the media controller centric rkcif device driver,
which is located under drivers/media/platform/rockchip/rkcif.

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 .../admin-guide/media/rkcif-rk3568-vicap.dot       | 21 ++++++
 Documentation/admin-guide/media/rkcif.rst          | 83 ++++++++++++++++++++++
 Documentation/admin-guide/media/v4l-drivers.rst    |  1 +
 MAINTAINERS                                        |  7 ++
 4 files changed, 112 insertions(+)

diff --git a/Documentation/admin-guide/media/rkcif-rk3568-vicap.dot b/Documentation/admin-guide/media/rkcif-rk3568-vicap.dot
new file mode 100644
index 000000000000..4cc6963e681e
--- /dev/null
+++ b/Documentation/admin-guide/media/rkcif-rk3568-vicap.dot
@@ -0,0 +1,21 @@
+digraph board {
+        rankdir=TB
+        n00000001 [label="{{<port0> 0} | rkcif-dvp0\n/dev/v4l-subdev0 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
+        n00000001:port1 -> n00000004
+        n00000004 [label="rkcif-dvp0-id0\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
+        n0000000d [label="{{} | it6801 2-0048\n/dev/v4l-subdev1 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
+        n0000000d:port0 -> n00000001:port0
+        n00000011 [label="{{} | imx415 4-001a\n/dev/v4l-subdev4 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
+        n00000011:port1 -> n00000014
+        n00000014 [label="{{<port0> 0} | rockchip-mipi-csi fdfb0000.csi\n/dev/v4l-subdev3 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
+        n00000014:port1 -> n0000001d
+        n0000001d [label="{{<port0> 0} | rkcif-mipi0\n/dev/v4l-subdev2 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
+        n0000001d:port1 -> n00000021
+        n0000001d:port1 -> n00000022
+        n0000001d:port1 -> n00000023
+        n0000001d:port1 -> n00000024
+        n00000021 [label="rkcif-mipi0-id0\n/dev/video1", shape=box, style=filled, fillcolor=yellow]
+        n00000022 [label="rkcif-mipi0-id1\n/dev/video2", shape=box, style=filled, fillcolor=yellow]
+        n00000023 [label="rkcif-mipi0-id2\n/dev/video3", shape=box, style=filled, fillcolor=yellow]
+        n00000024 [label="rkcif-mipi0-id3\n/dev/video4", shape=box, style=filled, fillcolor=yellow]
+}
diff --git a/Documentation/admin-guide/media/rkcif.rst b/Documentation/admin-guide/media/rkcif.rst
new file mode 100644
index 000000000000..f35f644a54a0
--- /dev/null
+++ b/Documentation/admin-guide/media/rkcif.rst
@@ -0,0 +1,83 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=========================================
+Rockchip Camera Interface (CIF)
+=========================================
+
+Introduction
+============
+
+The Rockchip Camera Interface (CIF) is featured in many Rockchip SoCs in
+different variants.
+The different variants are combinations of common building blocks, such as
+
+* INTERFACE blocks of different types, namely
+
+  * the Digital Video Port (DVP, a parallel data interface)
+  * the interface block for the MIPI CSI-2 receiver
+
+* CROP units
+
+* MIPI CSI-2 receiver (not available on all variants): This unit is referred
+  to as MIPI CSI HOST in the Rockchip documentation.
+  Technically, it is a separate hardware block, but it is strongly coupled to
+  the CIF and therefore included here.
+
+* MUX units (not available on all variants) that pass the video data to an
+  image signal processor (ISP)
+
+* SCALE units (not available on all variants)
+
+* DMA engines that transfer video data into system memory using a
+  double-buffering mechanism called ping-pong mode
+
+* Support for four streams per INTERFACE block (not available on all
+  variants), e.g., for MIPI CSI-2 Virtual Channels (VCs)
+
+This document describes the different variants of the CIF, their hardware
+layout, as well as their representation in the media controller centric rkcif
+device driver, which is located under drivers/media/platform/rockchip/rkcif.
+
+Variants
+========
+
+Rockchip PX30 Video Input Processor (VIP)
+-----------------------------------------
+
+The PX30 Video Input Processor (VIP) features a digital video port that accepts
+parallel video data or BT.656.
+Since these protocols do not feature multiple streams, the VIP has one DMA
+engine that transfers the input video data into system memory.
+
+The rkcif driver represents this hardware variant by exposing one V4L2 subdevice
+(the DVP INTERFACE/CROP block) and one V4L2 device (the DVP DMA engine).
+
+Rockchip RK3568 Video Capture (VICAP)
+-------------------------------------
+
+The RK3568 Video Capture (VICAP) unit features a digital video port and a MIPI
+CSI-2 receiver that can receive video data independently.
+The DVP accepts parallel video data, BT.656 and BT.1120.
+Since the BT.1120 protocol may feature more than one stream, the RK3568 VICAP
+DVP features four DMA engines that can capture different streams.
+Similarly, the RK3568 VICAP MIPI CSI-2 receiver features four DMA engines to
+handle different Virtual Channels (VCs).
+
+The rkcif driver represents this hardware variant by exposing up to three V4L2
+subdevices:
+
+* rkcif-dvp0: INTERFACE/CROP block for the DVP
+* rockchip-mipi-csi fdfb0000.csi: MIPI CSI-2 receiver
+* rkcif-mipi0: INTERFACE/CROP block for the MIPI CSI-2 receiver
+
+and up to five V4L2 devices:
+
+* rkcif-dvp0-id0: The support for multiple streams on the DVP is not yet
+  implemented, as it is hard to find test hardware. Thus, this video device
+  represents the first DMA engine of the RK3568 DVP.
+* rkcif-mipi0-id[0...3]: The four DMA engines of the RK3568 MIPI CSI-2
+  receiver. Each DMA engine can capture a certain MIPI CSI-2 Virtual Channel.
+
+.. kernel-figure:: rkcif-rk3568-vicap.dot
+    :alt:   Topology of the RK3568 Video Capture (VICAP) unit
+    :align: center
diff --git a/Documentation/admin-guide/media/v4l-drivers.rst b/Documentation/admin-guide/media/v4l-drivers.rst
index e8761561b2fe..f6497541d55b 100644
--- a/Documentation/admin-guide/media/v4l-drivers.rst
+++ b/Documentation/admin-guide/media/v4l-drivers.rst
@@ -24,6 +24,7 @@ Video4Linux (V4L) driver-specific documentation
 	qcom_camss
 	raspberrypi-pisp-be
 	rcar-fdp1
+	rkcif
 	rkisp1
 	raspberrypi-rp1-cfe
 	saa7134
diff --git a/MAINTAINERS b/MAINTAINERS
index 96b827049501..d1184d571b64 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20859,6 +20859,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/can/rockchip,rk3568v2-canfd.yaml
 F:	drivers/net/can/rockchip/
 
+ROCKCHIP CAMERA INTERFACE (RKCIF) DRIVER
+M:	Mehdi Djait <mehdi.djait@linux.intel.com>
+M:	Michael Riesch <michael.riesch@collabora.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/admin-guide/media/rkcif*
+
 ROCKCHIP CRYPTO DRIVERS
 M:	Corentin Labbe <clabbe@baylibre.com>
 L:	linux-crypto@vger.kernel.org

-- 
2.39.5



