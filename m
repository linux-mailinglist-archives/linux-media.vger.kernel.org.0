Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C92EE36050F
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 10:56:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231869AbhDOI4O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Apr 2021 04:56:14 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:46863 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231864AbhDOI4O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Apr 2021 04:56:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1618476952; x=1650012952;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Nyf5AssqNqTyNhoPZLV/aqdkykZq1hbIytCxJBNgp9g=;
  b=xeIofJ3aSl8uMgnB365FpA3kW1XzgpbR7MbNB6+jUjJJ2dVxhv0MKSgN
   x7xP6UjH9HfEJTTea4XHlN5LWkkdiUPearfEoJFTs4AzIrRZvy/Oh3EzC
   Mt5pIXdqolhxJlp2bJGQ65r91AmvTenJlZtboCM+ObBO5/uaxg6TQNM4g
   R4fkbcufRZamRkotdW2Z/hF1LNF2RA/jK5fmn1iyvbqB5w18UKUY+bu19
   7incTxVRsdWclYn+siTWcbYgKMXrN16hN3QX8eiT10bACjKT7kC3oWTTe
   v88xGCGMRF4xA8x/84LDo2obUXB89oW9G8/l3zE+iHfHJYykiTdwUZRKd
   w==;
IronPort-SDR: VGAJ1F9yrHUUwWVijfzQWesMku3gRc8+ncRJZprRe4SGT495JM2Wmh01eXwSpWdV7JS9PA9A4K
 ccI7cvHEjrTRoid+ruu8JdbsY9yJqOhtyUUOJb3JkROM/fFv3VrjIp/bRrP0VSx39XMBecx7K5
 9VMNJpkjiPWsQNIejwefBOZ0d9Irfab8SocXDaDHOIRQX3STYO7Hf3GWMWAac5tY8csRoncHvp
 5/Toe7Da8HSuzfTWJabJDgiwfM608KR8pMNn/vKAdxFKIOJ4Ylx+BrYNAqK8kSrnmN6p5FpWvh
 G3w=
X-IronPort-AV: E=Sophos;i="5.82,223,1613458800"; 
   d="scan'208";a="116538076"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Apr 2021 01:55:52 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 15 Apr 2021 01:55:49 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 15 Apr 2021 01:55:37 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <jacopo@jmondi.org>, <robh+dt@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v4 29/33] dt-bindings: media: atmel-isc: convert to yaml
Date:   Thu, 15 Apr 2021 11:55:30 +0300
Message-ID: <20210415085530.824638-1-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210413105731.610028-30-eugen.hristev@microchip.com>
References: <20210413105731.610028-30-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert the Atmel ISC to yaml binding format.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
Changes in v4:
- added '|' at description to maintain line breaks

 .../devicetree/bindings/media/atmel,isc.yaml  | 115 ++++++++++++++++++
 .../devicetree/bindings/media/atmel-isc.txt   |  65 ----------
 2 files changed, 115 insertions(+), 65 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/atmel,isc.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/atmel-isc.txt

diff --git a/Documentation/devicetree/bindings/media/atmel,isc.yaml b/Documentation/devicetree/bindings/media/atmel,isc.yaml
new file mode 100644
index 000000000000..a29c11667c82
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/atmel,isc.yaml
@@ -0,0 +1,115 @@
+# SPDX-License-Identifier: GPL-2.0-only
+# Copyright (C) 2016-2021 Microchip Technology, Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/atmel,isc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Atmel Image Sensor Controller (ISC)
+
+maintainers:
+  - Eugen Hristev <eugen.hristev@microchip.com>
+
+description: |
+  The Image Sensor Controller (ISC) device provides the video input capabilities for the
+  Atmel/Microchip AT91 SAMA family of devices.
+
+  The ISC has a single parallel input that supports RAW Bayer, RGB or YUV video,
+  with both external synchronization and BT.656 synchronization for the latter.
+
+properties:
+  compatible:
+    const: atmel,sama5d2-isc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 3
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: hclock
+      - const: iscck
+      - const: gck
+
+  '#clock-cells':
+    const: 0
+
+  clock-output-names:
+    const: isc-mck
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      Input port node, single endpoint describing the input pad.
+
+    properties:
+      endpoint:
+        $ref: video-interfaces.yaml#
+
+        properties:
+          remote-endpoint: true
+
+          bus-width:
+            enum: [8, 9, 10, 11, 12]
+            default: 12
+
+          hsync-active:
+            enum: [0, 1]
+            default: 1
+
+          vsync-active:
+            enum: [0, 1]
+            default: 1
+
+          pclk-sample:
+            enum: [0, 1]
+            default: 1
+
+        required:
+          - remote-endpoint
+
+        additionalProperties: false
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+  - clock-output-names
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    isc: isc@f0008000 {
+        compatible = "atmel,sama5d2-isc";
+        reg = <0xf0008000 0x4000>;
+        interrupts = <46 IRQ_TYPE_LEVEL_HIGH 5>;
+        clocks = <&isc_clk>, <&iscck>, <&isc_gclk>;
+        clock-names = "hclock", "iscck", "gck";
+        #clock-cells = <0>;
+        clock-output-names = "isc-mck";
+
+        port {
+                isc_0: endpoint {
+                       remote-endpoint = <&ov7740_0>;
+                       hsync-active = <1>;
+                       vsync-active = <0>;
+                       pclk-sample = <1>;
+                       bus-width = <8>;
+                };
+        };
+    };
+
diff --git a/Documentation/devicetree/bindings/media/atmel-isc.txt b/Documentation/devicetree/bindings/media/atmel-isc.txt
deleted file mode 100644
index bbe0e87c6188..000000000000
--- a/Documentation/devicetree/bindings/media/atmel-isc.txt
+++ /dev/null
@@ -1,65 +0,0 @@
-Atmel Image Sensor Controller (ISC)
-----------------------------------------------
-
-Required properties for ISC:
-- compatible
-	Must be "atmel,sama5d2-isc".
-- reg
-	Physical base address and length of the registers set for the device.
-- interrupts
-	Should contain IRQ line for the ISC.
-- clocks
-	List of clock specifiers, corresponding to entries in
-	the clock-names property;
-	Please refer to clock-bindings.txt.
-- clock-names
-	Required elements: "hclock", "iscck", "gck".
-- #clock-cells
-	Should be 0.
-- clock-output-names
-	Should be "isc-mck".
-- pinctrl-names, pinctrl-0
-	Please refer to pinctrl-bindings.txt.
-
-ISC supports a single port node with parallel bus. It should contain one
-'port' child node with child 'endpoint' node. Please refer to the bindings
-defined in Documentation/devicetree/bindings/media/video-interfaces.txt.
-
-Example:
-isc: isc@f0008000 {
-	compatible = "atmel,sama5d2-isc";
-	reg = <0xf0008000 0x4000>;
-	interrupts = <46 IRQ_TYPE_LEVEL_HIGH 5>;
-	clocks = <&isc_clk>, <&iscck>, <&isc_gclk>;
-	clock-names = "hclock", "iscck", "gck";
-	#clock-cells = <0>;
-	clock-output-names = "isc-mck";
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_isc_base &pinctrl_isc_data_8bit &pinctrl_isc_data_9_10 &pinctrl_isc_data_11_12>;
-
-	port {
-		isc_0: endpoint {
-			remote-endpoint = <&ov7740_0>;
-			hsync-active = <1>;
-			vsync-active = <0>;
-			pclk-sample = <1>;
-		};
-	};
-};
-
-i2c1: i2c@fc028000 {
-	ov7740: camera@21 {
-		compatible = "ovti,ov7740";
-		reg = <0x21>;
-		clocks = <&isc>;
-		clock-names = "xvclk";
-		assigned-clocks = <&isc>;
-		assigned-clock-rates = <24000000>;
-
-		port {
-			ov7740_0: endpoint {
-				remote-endpoint = <&isc_0>;
-			};
-		};
-	};
-};
-- 
2.25.1

