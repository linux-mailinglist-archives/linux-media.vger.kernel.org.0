Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C58B44E8A3
	for <lists+linux-media@lfdr.de>; Fri, 12 Nov 2021 15:27:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235170AbhKLO3z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Nov 2021 09:29:55 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:12832 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235160AbhKLO3x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Nov 2021 09:29:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1636727223; x=1668263223;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gQlOgsFU3lvwEJZ0GlpMCdPLTOswYzMcUfa8grsjJm8=;
  b=orT6OYfKacmJYh7ktBcrDtXqBeKzINHW7SOG80uyKMi3yOnm3apX88RY
   5vMCfWqq+5d61onqgUMo4AQfLaoA5wx7rmp3FzlcfZwntbxKjD0mXrqWX
   o60r6/BHc0xmQHXJYhmn3UQGZMdfbqQkTmb2dD9/9yfMyKQN3zpy3BFi8
   62tU6+aiN8/+gxRbRs+YaA/LXHZJahjZhPzTkFlv8hMg8WavXct9Dk63z
   I4j1VSxEB2DFK6uC7afxkkH7GDqeSwRN+3HIWX8RdbHDCZHhQufk5SRos
   B0Csrlt9qDz9cRj7Z8doSqTP2ciztZMwd2jAIqF2qLFJseFxpU2j+Hvce
   g==;
IronPort-SDR: Bs3Pc7fX2eWsijC4Vla2oqEkZ+HRs34iqC3abszHFxRdWUWmKZuzau6zNRmZDFpj6uKvpJeLd1
 5AWj3YH3bNIutqhPjrUN0uwx5BG5smK+IHRY3eTusfRfe/6JrrtvPlwFcKSKONVA0xM9cMPlbD
 gRjIrsp8SxyqzvJUUl7sCK2t/9aPADqQqVGeZV9Le2ARFFSHcsmqalJIyBu3tA1zlHrBZVHW7s
 TmlrCcS2ilkxJhCJc5Qxyl316oCMN8ZUtObYIk826ac81ET5CA5N1V7olK3+KMU+7+0WPbGbhK
 LWtL54ZCmUko0GvQ4+S8b4Vt
X-IronPort-AV: E=Sophos;i="5.87,229,1631602800"; 
   d="scan'208";a="151718697"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Nov 2021 07:26:01 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 12 Nov 2021 07:26:00 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 12 Nov 2021 07:25:48 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <linux-media@vger.kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <jacopo@jmondi.org>,
        <laurent.pinchart@ideasonboard.com>, <sakari.ailus@iki.fi>,
        <nicolas.ferre@microchip.com>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v2 02/25] dt-bindings: media: atmel: csi2dc: add bindings for microchip csi2dc
Date:   Fri, 12 Nov 2021 16:24:46 +0200
Message-ID: <20211112142509.2230884-3-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211112142509.2230884-1-eugen.hristev@microchip.com>
References: <20211112142509.2230884-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add bindings documentation for Microchip CSI2 Demultiplexer controller.

CSI2DC is a demultiplexer from Synopsys IDI interface specification to
parallel interface connection or direct memory access.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
Changes in v2:
- changed the endpoint/port references as suggested by Rob

Changes in this version :
- fixed 'sink' name to be actually source.
- added dma properties and example with dma

Previous change log:
Changes in v5:
- modified bindings as per Rob Herring review

Changes in v4:
- Removed property for inter-line-delay and for clock continuous/non-continuous
- Removed virtual channel by reg for second endpoint

Changes in v3:
- Removed some text from description, as it was explained in the schema
- fixed other things as per Rob's review
- moved some text inside the schema, like the clock description

Changes in v2:
- fixed warnings reported by dt_binding_check

 .../bindings/media/microchip,csi2dc.yaml      | 159 ++++++++++++++++++
 1 file changed, 159 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/microchip,csi2dc.yaml

diff --git a/Documentation/devicetree/bindings/media/microchip,csi2dc.yaml b/Documentation/devicetree/bindings/media/microchip,csi2dc.yaml
new file mode 100644
index 000000000000..45418c964bf3
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/microchip,csi2dc.yaml
@@ -0,0 +1,159 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
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
+  IDI interface is Synopsys proprietary.
+
+  CSI2DC provides two pipes, one video pipe and one data pipe. Video pipe
+  is connected to a sensor controller and the data pipe is accessible
+  as a DMA slave port to a DMA controller.
+
+  CSI2DC supports a single 'port' node as a sink port with Synopsys 32-bit
+  IDI interface. The connected endpoint must be a IDI interface compatible
+  device , that can provide 32-bit IDI interface connection as source port.
+  This port is mandatory.
+
+  CSI2DC supports one 'port' node as source port with parallel interface.
+  This is called video pipe.
+  This port has an 'endpoint' that can be connected to a sink port of another
+  controller (next in pipeline).
+
+  CSI2DC also supports direct access to the data through AHB, via DMA channel,
+  called data pipe.
+  Because of this, the source 'port' child node (second) is not mandatory.
+  If the source 'port' child node is missing, only data pipe is available.
+  For data pipe to be available, a dma controller must be referenced.
+
+properties:
+  compatible:
+    const: microchip,sama7g5-csi2dc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    description:
+      CSI2DC must have two clocks to function correctly. One clock is the
+      peripheral clock for the inside functionality of the hardware block.
+      This is named 'pclk'. The second clock must be the cross domain clock,
+      in which CSI2DC will perform clock crossing. This clock must be fed
+      by the next controller in pipeline, which usually is a sensor controller.
+      Normally this clock should be given by this sensor controller who
+      is also a clock source. This clock is named 'scck', sensor controller clock.
+    items:
+      - const: pclk
+      - const: scck
+
+  dmas:
+    maxItems: 1
+
+  dma-names:
+    const: rx
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Input port node, single endpoint describing the input port.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+            description: Endpoint connected to input device
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Output port node, single endpoint describing the output port.
+
+        properties:
+          endpoint:
+            unevaluatedProperties: false
+            $ref: video-interfaces.yaml#
+            description: Endpoint connected to output device
+
+    required:
+      - port@0
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - ports
+
+examples:
+  # Example for connecting to a parallel sensor controller block
+  - |
+    csi2dc@e1404000 {
+        compatible = "microchip,sama7g5-csi2dc";
+        reg = <0xe1404000 0x500>;
+        clocks = <&pclk>, <&scck>;
+        clock-names = "pclk", "scck";
+
+        ports {
+               #address-cells = <1>;
+               #size-cells = <0>;
+               port@0 {
+                       reg = <0>; /* must be 0, first child port */
+                       csi2dc_in: endpoint { /* input from IDI interface */
+                               remote-endpoint = <&csi2host_out>;
+                       };
+               };
+
+               port@1 {
+                       reg = <1>; /* must be 1, second child port */
+                       csi2dc_out: endpoint {
+                               remote-endpoint = <&xisc_in>; /* output to sensor controller */
+                       };
+               };
+        };
+    };
+
+  # Example for connecting to a DMA master as an AHB slave
+  - |
+    #include <dt-bindings/dma/at91.h>
+    csi2dc@e1404000 {
+        compatible = "microchip,sama7g5-csi2dc";
+        reg = <0xe1404000 0x500>;
+        clocks = <&pclk>, <&scck>;
+        clock-names = "pclk", "scck";
+        dmas = <&dma0 AT91_XDMAC_DT_PERID(34)>;
+        dma-names = "rx";
+
+        ports {
+               #address-cells = <1>;
+               #size-cells = <0>;
+               port@0 {
+                       reg = <0>; /* must be 0, first child port */
+                       csi2dc_input: endpoint { /* input from IDI interface */
+                               remote-endpoint = <&csi2host_out>;
+                       };
+               };
+        };
+    };
+
+...
-- 
2.25.1

