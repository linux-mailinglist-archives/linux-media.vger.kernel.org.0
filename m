Return-Path: <linux-media+bounces-13791-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F22991022C
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 13:08:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D44461F21D76
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 11:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DA031AB532;
	Thu, 20 Jun 2024 11:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SYRDxjCX"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944B21AB373;
	Thu, 20 Jun 2024 11:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718881691; cv=none; b=AWsbcz+7fgv8s5cCNtvz2v23FSG7YiN2NSMr3Aw2iGHotgdaiTOD4Q3Ido8Itpo26JnZtdoTRvmoYM5cHjxBIvsX4AD4326LmHLWVGU2F1+SB2rS3iECQqI6pkH2hj0uZ/Kn79NoWpSCDs+TlStnv2bOl45Nv7rsP0ze2+JOcIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718881691; c=relaxed/simple;
	bh=DurrYkPiOJ4QrUXT8rIw5NfkncY5M8gvtRLrv+kHYsc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YegY/c8vnNbo/8naYhWObasEat+AS6weESY6fd7jEI8cw/XbcfDylrxEhKCIT1crLTPo9wFUMll5sKKrC7IuAfRLLrj4QWf3rXBu4f5NDWMDy8dmEdbhL9pfrAB2PJCNB1fg1nd5/6Cj+P26+LH+x8VaxRy8zxSarLGz9AdUb+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SYRDxjCX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-144-210.elisa-laajakaista.fi [91.158.144.210])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5DB6ADD9;
	Thu, 20 Jun 2024 13:07:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718881667;
	bh=DurrYkPiOJ4QrUXT8rIw5NfkncY5M8gvtRLrv+kHYsc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SYRDxjCXSbwIi7sZwDhrOs/F1dqoXF6anmefRYD4MYUmWMk8oIuOfMxLp58AgEr33
	 HoNs6l3HYh5/WoFrCxfVAzOK6wKgAc2mnDyk+MB9Nl+TOQGq0Oq/tZIqpMECfGVUOf
	 qsgNms9ArJS3AsWuG1WRT/w1YR0Se5WESjrqGp0s=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 20 Jun 2024 14:07:51 +0300
Subject: [PATCH v2 2/4] dt-bindings: media: Add bindings for
 raspberrypi,rp1-cfe
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240620-rp1-cfe-v2-2-b8b48fdba3b3@ideasonboard.com>
References: <20240620-rp1-cfe-v2-0-b8b48fdba3b3@ideasonboard.com>
In-Reply-To: <20240620-rp1-cfe-v2-0-b8b48fdba3b3@ideasonboard.com>
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
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 20240531080707.34568-1-jacopo.mondi@ideasonboard.com
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2962;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=DurrYkPiOJ4QrUXT8rIw5NfkncY5M8gvtRLrv+kHYsc=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBmdA2RAJPAk/x5ycEjDDzhogpO2XLeMFVj7GUvr
 l4wxnP5OyOJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZnQNkQAKCRD6PaqMvJYe
 9fU5D/46l2utzerYrP/0Nbo1hFey+lNZ4Jau94sFP5SL1BctRgECU+e5wwNRZDt+is+3WNLBz8z
 fhdvgi31UiA13mTAt8HIy67Qm39WEAdKUx5OLghYwwDAvbmqA0b+t1aIlA/MA8VydP2UitV7uWx
 DhgH5qbg8DA8j0ynromwMEUXyONXWu9FpQV6vrVSDyJGJ0irbvi9nPkByidtTFi6GUA1SU7Yc6+
 lEdwOv7miBFdTHXHDO3HqQzFzasnTfuvRdZAoH9fhHyFmPYeCL+t8YMRvUoFJsnBpCrCXSE6cKL
 JyRM1+sobFGAgtTxC5Iu6T8gnr/oY5rFG++/tTaxozmrcsjaHk+B1xcAeFQ2frlZE5R4tA/HkGB
 YNw5SNlts/KS9jju3w+FHdgTu5pc8QYRTTMKzQxBckwboelm8uSCtxWc7luVVLeYGOVCOhZ0Sdt
 9JOl57x6edd2aF6Kbwi8/d5bbrHymXKXZQBF1R8pXVkM/lsu7jWcitgjuJQOrYmuIfL4VF+mRoR
 BSo2f53bm9O//4fGZRagArEBx7Z4fI17QWjqfYzTrC31gCIASwTUxEUnn60JHWMviMu7tQ+U67I
 bPn8T2xHKqJag0v8j878317yqMDEuYbGo2iJhn8oYogZouiyrhP1n+6yBTzb/j0WwzelWuxyZPH
 TVhEnhSxDdTFqvw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Add DT bindings for raspberrypi,rp1-cfe.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 .../bindings/media/raspberrypi,rp1-cfe.yaml        | 98 ++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/raspberrypi,rp1-cfe.yaml b/Documentation/devicetree/bindings/media/raspberrypi,rp1-cfe.yaml
new file mode 100644
index 000000000000..851533de2305
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/raspberrypi,rp1-cfe.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/raspberrypi,rp1-cfe.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Raspberry Pi PiSP Camera Front End
+
+maintainers:
+  - Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
+  - Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
+
+description: |
+  The Raspberry Pi PiSP Camera Front End is a module in Raspberrypi 5's RP1 I/O
+  controller, that contains:
+  - MIPI D-PHY
+  - MIPI CSI-2 receiver
+  - Simple image processor (called PiSP Front End, or FE)
+
+  The FE documentation is available at:
+  https://datasheets.raspberrypi.com/camera/raspberry-pi-image-signal-processor-specification.pdf
+
+  The PHY and CSI-2 receiver part have no public documentation.
+
+properties:
+  compatible:
+    items:
+      - const: raspberrypi,rp1-cfe
+
+  reg:
+    items:
+      - description: CSI-2 registers
+      - description: D-PHY registers
+      - description: MIPI CFG (a simple top-level mux) registers
+      - description: FE registers
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+    description: CSI-2 RX Port
+
+    properties:
+      endpoint:
+        $ref: video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            minItems: 1
+            maxItems: 4
+
+          clock-lanes:
+            maxItems: 1
+
+        required:
+          - clock-lanes
+          - data-lanes
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
+    rp1 {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      csi@110000 {
+        compatible = "raspberrypi,rp1-cfe";
+        reg = <0xc0 0x40110000 0x0 0x100>,
+              <0xc0 0x40114000 0x0 0x100>,
+              <0xc0 0x40120000 0x0 0x100>,
+              <0xc0 0x40124000 0x0 0x1000>;
+
+        interrupts = <42>;
+
+        clocks = <&rp1_clocks>;
+
+        port {
+          csi_ep: endpoint {
+            remote-endpoint = <&cam_endpoint>;
+            clock-lanes = <0>;
+            data-lanes = <1 2>;
+          };
+        };
+      };
+    };

-- 
2.34.1


