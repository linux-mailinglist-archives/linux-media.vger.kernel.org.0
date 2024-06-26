Return-Path: <linux-media+bounces-14205-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBF1918E17
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 20:15:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6746428A4DF
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 18:15:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8876219067A;
	Wed, 26 Jun 2024 18:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MjrTedlA"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B96C190480;
	Wed, 26 Jun 2024 18:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719425709; cv=none; b=eMA4LhpMYxWSvH0sgSGtxILArHC9r3c2MrXh2ZSBsiCLmWr19JlIC0dvRMhbfsGwoJ9uTwt2m/svlRtUcWlEu7TzkjFmmXWhN5u1fXzyUeFmgU7hOqd1LWPlVBwfg4f9FJpAYFj+NU/c40gNFw8L/FImjheWchKBRhN9ggGJ/ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719425709; c=relaxed/simple;
	bh=GM9Bp9vE+SryzooIvXB3q2sSjljn/yxJYmXfupsvIpU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RhL8Zb1j0jI7rA/reHw5BLsT8R85VqgGXZtji+m0mu9/YUw+ikEMcPA/+TJNCan+z1pz6E0DhKmXyllKVWtWssHWU8s4YRAxs5HTTAep995x8FgRA7DNGL+vOPIoTKybiGO/XoW6sj331Vo5jyo+f1bxr0aZyRT+X4vmPysNTTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MjrTedlA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5C8DD1B37;
	Wed, 26 Jun 2024 20:14:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1719425678;
	bh=GM9Bp9vE+SryzooIvXB3q2sSjljn/yxJYmXfupsvIpU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MjrTedlAn6Kaslf3MztTe4lMWx4Q3a8kJIzvnSq70BGlOKWn38mV7FbKL+dhe7PP6
	 OfKYbfZlQROLuerrkhL/vustT1GFgCCDCPBiOYaprwv6z+yrDz++zHwvDUKLvWQkna
	 XNGwH0iKY9sNKjya5B/SueWwaN6hExFM8W32tHC4=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
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
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v11 6/8] media: dt-bindings: Add bindings for Raspberry Pi PiSP Back End
Date: Wed, 26 Jun 2024 20:14:36 +0200
Message-ID: <20240626181440.195137-7-jacopo.mondi@ideasonboard.com>
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

Add bindings for the Raspberry Pi PiSP Back End memory-to-memory image
signal processor.

Datasheet:
https://datasheets.raspberrypi.com/camera/raspberry-pi-image-signal-processor-specification.pdf

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Naushir Patuck <naush@raspberrypi.com>
---
 .../bindings/media/raspberrypi,pispbe.yaml    | 63 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml

diff --git a/Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml b/Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml
new file mode 100644
index 000000000000..1fc62a1d8eda
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/raspberrypi,pispbe.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Raspberry Pi PiSP Image Signal Processor (ISP) Back End
+
+maintainers:
+  - Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
+  - Jacopo Mondi <jacopo.mondi@ideasonboard.com>
+
+description: |
+  The Raspberry Pi PiSP Image Signal Processor (ISP) Back End is an image
+  processor that fetches images in Bayer or Grayscale format from DRAM memory
+  in tiles and produces images consumable by applications.
+
+  The full ISP documentation is available at
+  https://datasheets.raspberrypi.com/camera/raspberry-pi-image-signal-processor-specification.pdf
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - brcm,bcm2712-pispbe
+      - const: raspberrypi,pispbe
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        isp@880000  {
+             compatible = "brcm,bcm2712-pispbe", "raspberrypi,pispbe";
+             reg = <0x10 0x00880000 0x0 0x4000>;
+             interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
+             clocks = <&firmware_clocks 7>;
+             iommus = <&iommu2>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 861ee24cc1f7..4f8126990da2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18810,6 +18810,7 @@ M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
 L:	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml
 F:	include/uapi/linux/media/raspberrypi/

 RC-CORE / LIRC FRAMEWORK
--
2.45.2


