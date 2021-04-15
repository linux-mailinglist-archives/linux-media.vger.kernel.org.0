Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5978136051D
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 11:00:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231614AbhDOJAx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Apr 2021 05:00:53 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:12140 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231482AbhDOJAw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Apr 2021 05:00:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1618477230; x=1650013230;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=D5cldpGdpPzdZZc/GBpc1oa0Uxl+4GmAdtIlAp2JONo=;
  b=kmp7JKG2SkHIm5U4zVxtJqIkMMuWOwIz1Y9q/21CbJwldRcV3VUos7pV
   PNwOv+1GVRgFNsALeeRGjU+zEziJQ4GhOEn+C89QPneht9r1xQmhPk39E
   sirR8mGFrlknu5LqxF98sgwbYYHZWg0HO57juG+bh5BPwVOdYqpdll6r7
   BuzpI7bFbqkb0saLV/dETMV33+9Kg3VRk03pViY2/S56kdk9aBsfYzDTV
   4+qN801P5pJUzyw3nYjaMKg3b4RdMK5ETeFZE2ScXIuH+1WdK9Tx7WRKN
   hDUuNP2KuV4pmz2ScfZqoPhW4iV0PAZfFEW3M1mv0mv/82S6Wdtbsdmh7
   A==;
IronPort-SDR: mUKy5dSxOcCbNNJbKsfJNa8Tfv8bHT3XDZngpGtS8LmuI/RutkyfKxsSCXiVixy2B79lGV4qqw
 AHcEC906bgbKIqjoGr2pzWMUfmk/g30093VJHeYSL4fpAQyNjeIG6+sR4vN6BQAksYRDVWbs6H
 s2vJPdTaX9ZixTT+ZGNmXxg+f/Z4EwonJfVuyOTIkeE2ey3aMLUuGKbKik8bpTawwwbeoPAGlW
 VslRiPuinDqRGGR0inQ8JNlfeCO/pMaeMVOH83taVQZ9Akp/2YEqpXPgq8HtF5mLItNW2c4Iwo
 0Ko=
X-IronPort-AV: E=Sophos;i="5.82,223,1613458800"; 
   d="scan'208";a="110909648"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Apr 2021 02:00:28 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 15 Apr 2021 02:00:28 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 15 Apr 2021 02:00:18 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <jacopo@jmondi.org>, <robh+dt@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v4 30/33] dt-bindings: media: add microchip,xisc device bindings
Date:   Thu, 15 Apr 2021 11:58:46 +0300
Message-ID: <20210415085846.824796-1-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210413105731.610028-31-eugen.hristev@microchip.com>
References: <20210413105731.610028-31-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add bindings for the Microchip eXtended Image Sensor Controller.
Based on the atmel,isc.yaml binding.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 .../bindings/media/microchip,xisc.yaml        | 129 ++++++++++++++++++
 1 file changed, 129 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/microchip,xisc.yaml

diff --git a/Documentation/devicetree/bindings/media/microchip,xisc.yaml b/Documentation/devicetree/bindings/media/microchip,xisc.yaml
new file mode 100644
index 000000000000..c829fa3d2e0e
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/microchip,xisc.yaml
@@ -0,0 +1,129 @@
+# SPDX-License-Identifier: GPL-2.0-only
+# Copyright (C) 2021 Microchip Technology, Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/microchip,xisc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip eXtended Image Sensor Controller (XISC)
+
+maintainers:
+  - Eugen Hristev <eugen.hristev@microchip.com>
+
+description: |
+  The eXtended Image Sensor Controller (XISC) device provides the video input capabilities for the
+  Microchip AT91 SAM family of devices.
+
+  The XISC has a single internal parallel input that supports RAW Bayer, RGB or YUV video.
+  The source can be either a demuxer from a CSI2 type of bus, or a simple direct bridge to a
+  parallel sensor.
+
+  The XISC provides one clock output that is used to clock the demuxer/bridge.
+
+properties:
+  compatible:
+    const: microchip,sama7g5-isc
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
+  clock-names:
+    items:
+      - const: hclock
+
+  '#clock-cells':
+    const: 0
+
+  clock-output-names:
+    const: isc-mck
+
+  microchip,mipi-mode:
+    type: boolean
+    description:
+      As the XISC is usually connected to a demux/bridge, the XISC receives
+      the same type of input, however, it should be aware of the type of
+      signals received. The mipi-mode enables different internal handling
+      of the data and clock lines.
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
+          bus-type:
+            enum: [5, 6]
+
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
+          - bus-type
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
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/at91.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    xisc: xisc@e1408000 {
+        compatible = "microchip,sama7g5-isc";
+        reg = <0xe1408000 0x2000>;
+        interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&pmc PMC_TYPE_PERIPHERAL 56>;
+        clock-names = "hclock";
+        #clock-cells = <0>;
+        clock-output-names = "isc-mck";
+
+        port {
+                xisc_in: endpoint {
+                       bus-type = <5>; /* Parallel */
+                       remote-endpoint = <&csi2dc_out>;
+                       hsync-active = <1>;
+                       vsync-active = <1>;
+                       bus-width = <12>;
+                };
+        };
+    };
+
-- 
2.25.1

