Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A7C735DD66
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 13:06:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345351AbhDMLFY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 07:05:24 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:16582 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243138AbhDMLFX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 07:05:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1618311904; x=1649847904;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ebzaumar8SMo14JkWxHz4mLhmwozonizizKyYoht5ZA=;
  b=VVGRS1mGxsOvwVvPTTJ+GYbgGzkcP2At2hWZCwyArJ9G9QYTMBUdKmy3
   VOslaTVjnl4Ip/zeXeRHziKAqAEIfogLRu6O7kjg11qkddJxMnOOKE9+k
   B6HQMZdoYjr5XLxzwyu8CvIT+P9dDtPLcHuZ4gS8Hv4GJMxnqvKCQ4eAw
   +3Gz0snFLoSScDkg32OB5LgxgwZH4hIrnbpC99wObjaNLQ+90RT790Pcs
   bbG2Q5ClT0AaE1rlQgh12KYtzypI1MZm9PCR0jeifdvhsLwbK+7sqeXSr
   tWIz1BqE8jAs8yghbvQnNweti/MtYwDAmN0DBQ5lnQ4VcxYVRLEZQXtZS
   g==;
IronPort-SDR: 2e/AUsNAPQr7mJD+5DSsCm5keX4mMKfwTKyCUPt60W/Kob4p3cOY+jffhMGTQj1YHWGKT9jcra
 mtcJ84kfN5UTe7pdj4bWzmL0PV6QcgDw0nfZRaxkO4If0U9sOMejk86Q0G6EqcS2vobYbR1bXF
 urNLIOuhIeWjR0BocgLQm6mLhNdqLz7jTtC587yw5W/YIUUaIZ5gTY7BLtmzqjIdv/WjtBydpF
 zkFSXU8J3NG1TQh7qXhnU0ya3dFxIHVqUS1WEz8SzWrw4g00xbV+tW4+9fPjnULuHB1b1swfv2
 DmQ=
X-IronPort-AV: E=Sophos;i="5.82,219,1613458800"; 
   d="scan'208";a="122830504"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Apr 2021 04:05:04 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 13 Apr 2021 04:05:03 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Tue, 13 Apr 2021 04:04:50 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <jacopo@jmondi.org>, <robh+dt@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v3 30/33] dt-bindings: media: add microchip,xisc device bindings
Date:   Tue, 13 Apr 2021 13:57:28 +0300
Message-ID: <20210413105731.610028-31-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210413105731.610028-1-eugen.hristev@microchip.com>
References: <20210413105731.610028-1-eugen.hristev@microchip.com>
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
index 000000000000..e3825c4e13f8
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
+description:
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

