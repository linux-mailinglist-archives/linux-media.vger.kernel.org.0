Return-Path: <linux-media+bounces-19030-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD6C98ED08
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 12:32:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A280F1F22B3D
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 10:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC8D215443F;
	Thu,  3 Oct 2024 10:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LARB3rqc"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A487914F9CF;
	Thu,  3 Oct 2024 10:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727951512; cv=none; b=AJtGd2DftmcI+7HJdIzHSNv5uUGlIUZco4NDbt/vZ7Uj4xYuBBvfV4Jgl6qCapy7IjlHwALWhFzwFKHGXeq36waOvpa6g0zdQRzZBFt4Bug/6xaCCUuCMWqJnQrPoAbNA+8Tm5vMllA0ChDxZRpZHRt63mOxbN6v7WeEE51m2KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727951512; c=relaxed/simple;
	bh=glmpFc00SsZ+PfwzIlsw73UpQTBgwInpTitkkKEeCPQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=URlv6iuD6AuDTe57Qp49L3b3+ciDxZeA+S1olSqcW5ci59uC1rYK/IvoQiYZ2LPTd01Ffl8DUC5ifuKI0O2R7ZDmo+ynP0ZpApbJIvumjUoT9F5m6Ud+K1WDPswkV7+txVtgPHwQ/7yZGOtR9lE7dJsEeeQEnqZQq2jjbE8l7M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LARB3rqc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-156-87-48.elisa-laajakaista.fi [91.156.87.48])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C57BE593;
	Thu,  3 Oct 2024 12:30:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727951408;
	bh=glmpFc00SsZ+PfwzIlsw73UpQTBgwInpTitkkKEeCPQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LARB3rqczKQKneHP+g4Q3caZKQIVI6io33AYlNeWzjnGldP911kyKLMgbb+MFGrcY
	 qk4TtzQua+PYFHF74mrNwOpAE9t8gYUlrvfo6Tf2DS/mb/n8TEPTlV51Cu4mSbgCmU
	 cdY2V/Yw0X/E5PDiWwct4ntp6DlZT+RONM9xneYE=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 03 Oct 2024 13:31:11 +0300
Subject: [PATCH v6 2/4] dt-bindings: media: Add bindings for
 raspberrypi,rp1-cfe
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241003-rp1-cfe-v6-2-d6762edd98a8@ideasonboard.com>
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
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2916;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=glmpFc00SsZ+PfwzIlsw73UpQTBgwInpTitkkKEeCPQ=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBm/nKIVH1t1UZe0EvytC+zRi7nNKk/ErE+l8Dhl
 nkQm1P9HmGJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZv5yiAAKCRD6PaqMvJYe
 9XXMD/wOypvOeRP/ssJ5sWxBhLzXj5BKvmBln0yICG8V//C8uWiF/201ScuRNzOndEsz19bX1q/
 ZtmqO2lM/N7TvNLCo14ZvaKdkh0p8cSLiLGOgk2jn/Kal5b6VJN0oUgIHM1ZRDOaST7vVakND3P
 ROowQBTdFWOjIIRjAtgLPRK0jfLg4wlqdD2bJBX61sGujUowyvWoyE0VZN+OPOMXSKbQTHNl64r
 9U9ADkSorL6hPYLuQuSgAj+adEXMhOsa7eADGXmRSb8f1JOzdkgpm90JdJ7LNDfDInxUUtMpUVL
 Dk4Vm2blB1VWJQ5X3aiBLz9CxxGw7oQ+vzxhsziUMe4J7WgpSN+9XsNjS3GALMgqlloyhUXyuHq
 6pOOgI1IUjbOU3ldci6t9vc36Hbxlx3DutAJvPjvbgo+MhR0PcGBQr0IrysfOh6V94o9ByG1/TE
 PdzcVIfOX1u8FFQ0mgRVHNp8yqrT6HVtu74xgpZLwuNO9FN7g66dcqEeX3GOqnNAyy1qt0h1O7g
 8s5WIfD2lRzhUtTs1/3IY/H588Yh0zYduWafvw5G//vs+TgMLOsYbVqVeQReJLKALSl82UnlaOr
 lI9FAQR9Ld13MF9634pHlMLeMgqM4GNzWO7m0kf7YQTrZkyDVge8v0ZXacpAp/qFyM9gXqFeM8b
 EcmrZoelp+hfzGw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Add DT bindings for raspberrypi,rp1-cfe.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 .../bindings/media/raspberrypi,rp1-cfe.yaml        | 93 ++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/raspberrypi,rp1-cfe.yaml b/Documentation/devicetree/bindings/media/raspberrypi,rp1-cfe.yaml
new file mode 100644
index 000000000000..eba5394719b9
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/raspberrypi,rp1-cfe.yaml
@@ -0,0 +1,93 @@
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
+        required:
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
+            data-lanes = <1 2>;
+          };
+        };
+      };
+    };

-- 
2.43.0


