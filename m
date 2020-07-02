Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29E3521248B
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2020 15:25:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729323AbgGBNZv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Jul 2020 09:25:51 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:37995 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728851AbgGBNZv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Jul 2020 09:25:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1593696350; x=1625232350;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VGWuODLt2ODvXD535Grf0c3lCG9kNLN9yvCj8VH4DlQ=;
  b=zwfD3hHo/yJF6yJpjaL1F4fyAHzrRfGkHaOg7yH4avBiFkaeGwPDToe0
   9o1iWwJz2NimawSUbswKajpqv5qxrggzWbbL76pGLWwVYismtTm8irdsk
   y8tLfLweLmJdHJrSKzvQpU5+03Cdn5iUBl+kKpF6E/vgTzAQya8lr1rtB
   /T5WcppR62wbUhoYcZw7Og6Z9WTu+/PXYzEpgKNkLShefqrA54x2wdP1k
   admOJbsLxSnJd2Bp7pA4/pnX9L/K7+vjhq+F7mJcJH5zPveG2ll8bjXOA
   aD4u0KChwiJuZg+gaTJPci8KRMr4DGti7eyL/Dh+ciL0rCh7FQRQXzGJY
   A==;
IronPort-SDR: bflD1Rp14wu7ah2ORFDgharZm7WtPp6nFlfPLx5xUPGLjq8m/1V8xtjV+ozcK78nbquulpCWXA
 6zsCQOXWlEHy7roL2IoLdrulV3HmMb9c1hZYXXGq81zAuTtm1eSpQVDdU+Rne2lDbg02/hFEw7
 vXVC1/toHTTW4SpO6EuzPI0y6aHJBNXfPn9KEtyC/jlpmu+PQFJJZVsVhnWaW8FHAtqPNT/Rb6
 ZyGNDFL9KJyrkcPtTNNJv6/AyPq+gtNWRoJ6/NMPvrKvX+GQ3ZLvSNa/XvuvuFE7WzUJNTU4La
 U08=
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; 
   d="scan'208";a="82395038"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Jul 2020 06:25:50 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 2 Jul 2020 06:25:30 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Thu, 2 Jul 2020 06:25:41 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <mchehab@kernel.org>, <hverkuil@xs4all.nl>, <robh+dt@kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC:     Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH 1/4] dt-bindings: media: csi2dc: add bindings for microchip csi2dc
Date:   Thu, 2 Jul 2020 16:23:56 +0300
Message-ID: <20200702132359.122844-2-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702132359.122844-1-eugen.hristev@microchip.com>
References: <20200702132359.122844-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add bindings documentation for microchip CSI2 Demultiplexer controller.

CSI2DC is a demultiplexer from Synopsys IDI interface specification to
parallel interface connection or direct memory access.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 .../bindings/media/microchip,csi2dc.yaml      | 186 ++++++++++++++++++
 1 file changed, 186 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/microchip,csi2dc.yaml

diff --git a/Documentation/devicetree/bindings/media/microchip,csi2dc.yaml b/Documentation/devicetree/bindings/media/microchip,csi2dc.yaml
new file mode 100644
index 000000000000..1a4169e09111
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/microchip,csi2dc.yaml
@@ -0,0 +1,186 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/microchip,csi2dc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip CSI2 Demux Controller (CSI2DC)
+
+maintainers:
+  - Eugen Hristev <eugen.hristev@microchip.com>
+
+description:
+  CSI2DC - Camera Serial Interface 2 Demux Controller
+
+  CSI2DC is a hardware block that receives incoming data from an IDI interface
+  and filters packets based on their data type and virtual channel identifier,
+  then converts the byte stream into a cross clock domain to a pixel stream
+  to a parallel interface that can be read by a sensor controller.
+
+  CSI2DC provides two pipes, one video pipe and one data pipe. Video pipe
+  is connected to a sensor controller and the data pipe is accessible
+  as a DMA slave port to a DMA controller.
+
+  CSI2DC supports a single 'port' node as a source pad with Synopsys 32-bit
+  IDI interface. The connected endpoint must be a IDI interface compatible
+  device (like Synopsys CSI2HOST) , that can provide 32-bit IDI interface
+  connection as sink pad.
+  It should contain one 'port' child node with one child 'endpoint' node.
+  This node should always have the 'reg' property as 0, being the first child
+  node.
+  For media entity and endpoints please refer to the bindings defined in
+  Documentation/devicetree/bindings/media/video-interfaces.txt.
+  For Synopsys IDI interface please refer to
+  Documentation/devicetree/bindings/media/snps,dw-csi-plat.txt
+
+  CSI2DC supports one 'port' node as sink pad with parallel interface. This is
+  called video pipe.
+  The reg property inside this 'port' node must have the 'reg' property as 1,
+  being the second child node.
+  This node must have one 'endpoint', and this 'endpoint' is related to the
+  virtual channel identifier.
+  The 'reg' property inside this 'endpoint' represents the CSI2 virtual channel
+  identifier.
+  This 'endpoint' can then be used as a source pad for another controller
+  (next in pipeline).
+  Please refer to the bindings defined in
+  Documentation/devicetree/bindings/media/video-interfaces.txt.
+
+  CSI2DC must have two clocks to function correctly. One clock is the
+  peripheral clock for the inside functionality of the hardware block.
+  This is named 'pclk'. The second clock must be the cross domain clock,
+  in which CSI2DC will perform clock crossing. This clock must be fed
+  by the next controller in pipeline, which usually is a sensor controller.
+  Normally this clock should be given by this sensor controller who
+  is also a clock source. This clock is named 'scck', sensor controller clock.
+
+  CSI2DC also supports direct access to the data through AHB, via DMA channel,
+  called data pipe.
+  Because of this, the sink 'port' child node (second) is not mandatory.
+  If the sink 'port' child node is missing, only data pipe is available.
+
+properties:
+  compatible:
+    const: microchip,sama7g5-csi2dc
+
+  reg:
+    description:
+      Physical base address and length of the registers set for the device.
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: scck
+
+  microchip,clk-gated:
+    type: boolean
+    description:
+      If present, indicates that the clock is gated.
+      Otherwise, the clock is free-running.
+
+  microchip,inter-line-delay:
+    allOf:
+    - $ref: /schemas/types.yaml#/definitions/uint32
+    - minimum: 1
+    - maximum: 16
+    default: 16
+    description:
+      Indicates how many clock cycles should be introduced between each line.
+
+  port@0:
+    type: object
+    description:
+      Input port node, single endpoint describing the input pad.
+
+    properties:
+      reg:
+        const: 0
+
+      endpoint:
+        type: object
+
+        properties:
+          remote-endpoint: true
+
+        required:
+          - remote-endpoint
+          - reg
+
+        additionalProperties: false
+
+    additionalProperties: false
+
+  port@1:
+    type: object
+    description:
+      Output port node, single endpoint, describing the output pad.
+
+    properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+      reg:
+        const: 1
+
+    patternProperties:
+      "^endpoint@[0-9a-f]$":
+        type: object
+
+        properties:
+          reg:
+            enum: [0, 1, 2, 3]
+            description: virtual channel for the endpoint
+
+          remote-endpoint: true
+
+        required:
+          - remote-endpoint
+          - reg
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
+  - ports
+
+examples:
+  - |
+    csi2dc@e1404000 {
+        compatible = "microchip,sama7g5-csi2dc";
+        #address-cells = <1>;
+        #size-cells = <0>;
+        reg = <0xe1404000 0x500>;
+        clocks = <&pclk>, <&ssck>;
+        clock-names = "pclk", "ssck";
+
+        port@0 {
+               reg = <0>; /* must be 0, first child port */
+               csi2dc_in: endpoint { /* input from IDI interface */
+                     remote-endpoint = <&csi2host_out>;
+               };
+        };
+
+        port@1 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <1>; /* must be 1, second child port */
+                csi2dc_out: endpoint@2 {
+                        reg = <2>;  /* virtual channel identifier */
+                        remote-endpoint = <&xisc_in>; /* output to sensor controller */
+                };
+        };
+    };
+
+...
-- 
2.25.1

