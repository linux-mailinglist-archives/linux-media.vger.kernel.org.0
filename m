Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21613361246
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 20:45:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234481AbhDOSpy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Apr 2021 14:45:54 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:18374 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233948AbhDOSpy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Apr 2021 14:45:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1618512332; x=1650048332;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EfPKf6G7i8no32iDnXtauNdJhYQxJHVpG/8fquspKso=;
  b=IL0TXdBhqJH+AH409K3G01GYScbgaOWkgFypg5JthIAAfYNX4vlF7LFp
   vWUD0/EKxd0ji6swsZOAbQy9SuE6/uJps4YMnsX+gTPdxMs2yOqmtEyO+
   gAUPq9CBE51T2ajM/zocaQtzjBoaoweC/CAi9h7DDA1cww3ildPi5l/D2
   22/6fE1sYChEaKUv4pKL9NXrY4BbXEcw38gIdqPINcPDs/TdKMdQHkJ3o
   +BMjQBqX5JlDB5zmVfJNoS2E69I5DISiQumrLLBNVnFWdEuic1m+bOp6l
   2Q4AzwPoYrySOwdJBeQA5h7gSlHhFBE7R6+vf13Tmh3YD/JG92FG9FSzT
   Q==;
IronPort-SDR: TvVWtnNuCMr31Qr1s17juV9ul7As2ZenL7lCskz9YT/eY/kwv5lLWjFzC+kCuWd0CtBENu8Kpw
 wzMFNnD01ZoXewRviFDGrwSCq+0kBilhfpoPn3Id8HdrH5PJzX4x5Uu5QxozTI77fGF7AXEE6y
 ZkgCH6kbXCAF1DEyjWRPgcItwvGKSpxwlGoSzMYWNY8TrT0eKMoGBZFWCsEAc8yPGHg2luaItp
 D1YSsuURq8Zo7W9k9cYa5zOZsUpDHwBKHwCLDp7rbN3zocEBi3MY4SpM9Ar+r4DaAF522b79l1
 2G4=
X-IronPort-AV: E=Sophos;i="5.82,225,1613458800"; 
   d="scan'208";a="116611454"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Apr 2021 11:45:31 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 15 Apr 2021 11:45:30 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 15 Apr 2021 11:45:14 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <jacopo@jmondi.org>, <robh+dt@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v5 30/33] dt-bindings: media: add microchip,xisc device bindings
Date:   Thu, 15 Apr 2021 21:45:00 +0300
Message-ID: <20210415184500.868264-1-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210415085846.824796-1-eugen.hristev@microchip.com>
References: <20210415085846.824796-1-eugen.hristev@microchip.com>
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
Changes in v5:
- fixed license clause to add BSD-2
Changes in v4:
- added '|' at description to preserve line breaks

 .../bindings/media/microchip,xisc.yaml        | 129 ++++++++++++++++++
 1 file changed, 129 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/microchip,xisc.yaml

diff --git a/Documentation/devicetree/bindings/media/microchip,xisc.yaml b/Documentation/devicetree/bindings/media/microchip,xisc.yaml
new file mode 100644
index 000000000000..41afe2e5f133
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/microchip,xisc.yaml
@@ -0,0 +1,129 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
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

