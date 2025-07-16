Return-Path: <linux-media+bounces-37866-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E434B0748D
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 13:21:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 797441C25F71
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 11:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E718B2F5095;
	Wed, 16 Jul 2025 11:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="d1pIgS0R"
X-Original-To: linux-media@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BFC2F365C;
	Wed, 16 Jul 2025 11:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752664840; cv=none; b=qepuyKaVDbkWc13eOSuYyviI0LBU41uUN4961qjnNxB/biu8zGvcmJjNK4+6c9KAbxh6pcHAh7FCZHvfLSClmNBU3/uqmrlaBk/YcxiZRkm37rVuBrOKBSYliIwSPvaWmUpp1a8b26OLvC4bWUg/DXleqsIvsHmbGsJwjv1cdBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752664840; c=relaxed/simple;
	bh=b4IstVehadZ+ESzyuwXGnpVXi1Z0M25D1IdlHYFwAxY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TDg8VQL1rUmjph1xFcZyd8qYn+13Gof2r9qpBaKpEM8f+EIIRyL6nF6CpPsF7zHF8nqeWFL4OGJ6GybtJSWNw7eOXdHJDzS9xhmjrkVrlFKHDZgg1TpSqK9QVFD/Kp1FlrxMhH3D0WpVn5JE3POg+d5Zl1ZBrQgvErkugnZtTOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=d1pIgS0R; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56GBKFkp239948;
	Wed, 16 Jul 2025 06:20:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752664815;
	bh=UaSkr3Mtkvd2G/yImBVwlc1QjOnwWe0If2XenQOoUZw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=d1pIgS0RxaFtBBO2EjCCvEdxT1OcyYv+pg/fLVdmD/yM7TAswuLQoiN6/JLaboAkn
	 GVctZzByCsQGxHKSZkl6vlksFChYn04n7VjotD8G2ah+1tKFtT/4WCkxFF7+J1POyA
	 e0PQOIPMyKixbURgX1mYZk4Wz/7eDwYcWLysxG3o=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56GBKEKj1981344
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 16 Jul 2025 06:20:14 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 16
 Jul 2025 06:20:14 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 16 Jul 2025 06:20:14 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56GBJep3344714;
	Wed, 16 Jul 2025 06:20:07 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <linux@armlinux.org.uk>, <ardb@kernel.org>, <ebiggers@kernel.org>,
        <geert+renesas@glider.be>, <claudiu.beznea@tuxon.dev>,
        <bparrot@ti.com>, <andre.draszik@linaro.org>,
        <kuninori.morimoto.gx@renesas.com>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <heikki.krogerus@linux.intel.com>, <kory.maincent@bootlin.com>,
        <florian.fainelli@broadcom.com>, <lumag@kernel.org>,
        <dale@farnsworth.org>, <sbellary@baylibre.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <dagriego@biglakesoftware.com>, <u-kumar1@ti.com>,
        <y-abhilashchandra@ti.com>
Subject: [PATCH V2 3/4] dt-bindings: media: ti: vpe: Add bindings for Video Input Port
Date: Wed, 16 Jul 2025 16:49:11 +0530
Message-ID: <20250716111912.235157-4-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250716111912.235157-1-y-abhilashchandra@ti.com>
References: <20250716111912.235157-1-y-abhilashchandra@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

From: Dale Farnsworth <dale@farnsworth.org>

Add device tree bindings for the Video Input Port. Video Input Port (VIP)
can be found on devices such as DRA7xx and provides a parallel interface
to a video source such as a sensor or TV decoder.

Signed-off-by: Dale Farnsworth <dale@farnsworth.org>
Signed-off-by: Benoit Parrot <bparrot@ti.com>
Signed-off-by: Sukrut Bellary <sbellary@baylibre.com>
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
Changelog:
Changes in v2:
- Remove array and just use hsync: true in bindings
- Remove array and use enum for bus width in bindings
- Use pattern properties since properties across ports are same
- Update copyright year

 .../devicetree/bindings/media/ti,vip.yaml     | 211 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 212 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/ti,vip.yaml

diff --git a/Documentation/devicetree/bindings/media/ti,vip.yaml b/Documentation/devicetree/bindings/media/ti,vip.yaml
new file mode 100644
index 000000000000..44091c15a537
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/ti,vip.yaml
@@ -0,0 +1,211 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2025 Texas Instruments Incorporated -  http://www.ti.com/
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/ti,vip.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments DRA7x VIDEO INPUT PORT (VIP).
+
+maintainers:
+  - Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
+
+description: |-
+  The Video Input Port (VIP) is a key component for image capture
+  applications. The capture module provides the system interface and the
+  processing capability to connect parallel image-sensor as well as
+  BT.656/1120 capable encoder chip to DRA7x device.
+
+  Each VIP instance supports 2 independently configurable external video
+  input capture slices (Slice 0 and Slice 1) each providing up to two video
+  input ports (Port A and Port B) where Port A can be configured as
+  24/16/8-bit port and Port B is fixed as 8-bit port.
+  Here these ports a represented as follows
+    port@0 -> Slice 0 Port A
+    port@1 -> Slice 0 Port B
+    port@2 -> Slice 1 Port A
+    port@3 -> Slice 1 Port B
+
+  Each camera port nodes should contain a 'port' child node with child
+  'endpoint' node. Please refer to the bindings defined in
+  Documentation/devicetree/bindings/media/video-interfaces.yaml.
+
+properties:
+  compatible:
+    enum:
+      - ti,dra7-vip
+
+  label:
+    description: Instance name
+
+  reg:
+    items:
+      - description: The VIP main register region
+      - description: Video Data Parser (PARSER) register region for Slice0
+      - description: Color Space Conversion (CSC) register region for Slice0
+      - description: Scaler (SC) register region for Slice0
+      - description: Video Data Parser (PARSER) register region for Slice1
+      - description: Color Space Conversion (CSC) register region for Slice1
+      - description: Scaler (SC) register region for Slice1
+      - description: Video Port Direct Memory Access (VPDMA) register region
+
+  reg-names:
+    items:
+      - const: vip
+      - const: parser0
+      - const: csc0
+      - const: sc0
+      - const: parser1
+      - const: csc1
+      - const: sc1
+      - const: vpdma
+
+  interrupts:
+    minItems: 2
+    description:
+      IRQ index 0 is used for Slice0 interrupts
+      IRQ index 1 is used for Slice1 interrupts
+
+  ti,vip-clk-polarity:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      phandle to the device control module. The 1st argument should
+      contain the register offset to the CTRL_CORE_SMA_SW_1 register.
+      2nd argument contains the bit field to slice 0 port A,
+      3rd argument contains the bit field to slice 0 port B,
+      4th argument contains the bit field to slice 1 port A,
+      5th argument contains the bit field to slice 1 port B.
+
+patternProperties:
+  '^port@[0-3]$':
+    type: object
+    additionalProperties: false
+
+    properties:
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+      reg:
+        description: The port number
+        maxItems: 1
+
+      label:
+        description: Port name. Usually the pin group name
+
+      endpoint:
+        $ref: /schemas/graph.yaml#/properties/endpoint
+        type: object
+        additionalProperties: false
+
+        properties:
+          hsync-active: true
+          vsync-active: true
+          pclk-sample: true
+          bus-width:
+            enum: [8, 24]
+            default: 8
+
+          remote-endpoint: true
+
+    required:
+      - "#address-cells"
+      - "#size-cells"
+      - port@0
+      - reg
+      - label
+
+required:
+  - compatible
+  - label
+  - reg
+  - reg-names
+  - interrupts
+  - ti,vip-clk-polarity
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    vip1: vip@48970000 {
+        compatible = "ti,dra7-vip1";
+        label = "vip1";
+        reg = <0x48970000 0x114>,
+              <0x48975500 0xD8>,
+              <0x48975700 0x18>,
+              <0x48975800 0x80>,
+              <0x48975a00 0xD8>,
+              <0x48975c00 0x18>,
+              <0x48975d00 0x80>,
+              <0x4897d000 0x400>;
+        reg-names = "vip",
+                    "parser0",
+                    "csc0",
+                    "sc0",
+                    "parser1",
+                    "csc1",
+                    "sc1",
+                    "vpdma";
+        interrupts = <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 392 IRQ_TYPE_LEVEL_HIGH>;
+        ti,vip-clk-polarity = <&scm_conf 0x534 0x1 0x4 0x2 0x8>;
+
+        ports {
+              #address-cells = <1>;
+              #size-cells = <0>;
+
+              vin1a: port@0 {
+                    reg = <0>;
+                    label = "vin1a";
+
+                    vin1a_ep: endpoint {
+                           remote-endpoint = <&camera1>;
+                           hsync-active = <1>;
+                           vsync-active = <1>;
+                           pclk-sample = <0>;
+                           bus-width = <8>;
+                    };
+              };
+              vin1b: port@1 {
+                    reg = <1>;
+                    label = "vin1b";
+              };
+              vin2a: port@2 {
+                    reg = <2>;
+                    label = "vin2a";
+              };
+              vin2b: port@3 {
+                    reg = <3>;
+                    label = "vin2b";
+              };
+         };
+    };
+
+    i2c {
+        clock-frequency = <400000>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+         camera@37 {
+              compatible = "ovti,ov10633";
+              reg = <0x37>;
+
+              clocks = <&fixed_clock>;
+              clocks-names = "xvclk";
+
+              port {
+                   camera1: endpoint {
+                           remote-endpoint = <&vin1a_ep>;
+                           hsync-active = <1>;
+                           vsync-active = <1>;
+                           pclk-sample = <0>;
+                           bus-width = <8>;
+                   };
+              };
+         };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index ea4b29c8b6b5..c5c5f0d1967f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25211,6 +25211,7 @@ S:	Maintained
 W:	http://linuxtv.org/
 Q:	http://patchwork.linuxtv.org/project/linux-media/list/
 F:	Documentation/devicetree/bindings/media/ti,cal.yaml
+F:	Documentation/devicetree/bindings/media/ti,vip.yaml
 F:	Documentation/devicetree/bindings/media/ti,vpe.yaml
 F:	drivers/media/platform/ti/cal/
 F:	drivers/media/platform/ti/vpe/
-- 
2.34.1


