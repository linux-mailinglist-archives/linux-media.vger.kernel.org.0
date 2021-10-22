Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25237437320
	for <lists+linux-media@lfdr.de>; Fri, 22 Oct 2021 09:53:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232290AbhJVH4I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Oct 2021 03:56:08 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:22711 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232279AbhJVH4H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Oct 2021 03:56:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1634889230; x=1666425230;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7j8Vm5cahPULNyteL3wTTU/YYgHhNg+Xi3C1+HJ/vuc=;
  b=ZBePsHE1FIM7ASxgauuS3ApmMk3lQkRmb3T0CA/fid8HDt6EX5G0fs18
   Yli/RabfTUxoff5CZKCk4BpeGK/0UtJh3m6Ze0C6mh5Bhevp1qUzX0j80
   7LOpNn4OP254k1LOd1Ityz2+cMbW97N0K5njP+KSLLUuIIAoewfuwVH85
   8dDiHn0mhdlWhqkvNJVSVXGdpnx56z6D0VGMhN2CSHjEqnASsO8GP8YRQ
   eClPtA59tDyize7utGtXxYbetlEn4eqcEXhJ7PFZsjHiar39HjSMYjLQw
   Lf9yygq30BvrJJ3PNe0+H+UwqGOjk1WstObEjSdJy1nJk8YZR+dEU2NgE
   g==;
IronPort-SDR: sFnqktDCZOPLJPNQHDHM+oCUTWHzAID1pPNEiQ2E2Xh0YdoZncM9ocYizeXkzYO/hCyC2h6F5d
 IXIZOaFQym1B9MFGmRBZnKvXaNS8XQESbVJifey26kx1JFh4t7TPK9ml4vQ2g6JesmcVWTFIyM
 hUuSKiN4B/4R4c+SEKSlY0WEZqIGDwpkPdgL1ZKMK9XBzhHuvcg12kPcIzITPDy2D9MA7bRjZT
 JqdfAKs4FKQ0cnb6nO+YUTjvDJaMv4hJzK6aSliPMEHpgYChnoyyl2Cm8Uf3TNPNOkm6B8RGZC
 v7m0QXuJECq4D1hPQIY8TNG0
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; 
   d="scan'208";a="73928948"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Oct 2021 00:53:49 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 22 Oct 2021 00:53:49 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 22 Oct 2021 00:53:46 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC:     <jacopo@jmondi.org>, <laurent.pinchart@ideasonboard.com>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <nicolas.ferre@microchip.com>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH 02/21] dt-bindings: media: atmel: csi2dc: add bindings for microchip csi2dc
Date:   Fri, 22 Oct 2021 10:52:28 +0300
Message-ID: <20211022075247.518880-3-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211022075247.518880-1-eugen.hristev@microchip.com>
References: <20211022075247.518880-1-eugen.hristev@microchip.com>
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


 .../bindings/media/microchip,csi2dc.yaml      | 149 ++++++++++++++++++
 1 file changed, 149 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/microchip,csi2dc.yaml

diff --git a/Documentation/devicetree/bindings/media/microchip,csi2dc.yaml b/Documentation/devicetree/bindings/media/microchip,csi2dc.yaml
new file mode 100644
index 000000000000..d317478908d0
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/microchip,csi2dc.yaml
@@ -0,0 +1,149 @@
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
+  For graph video endpoints please refer to the bindings defined in
+  Documentation/devicetree/bindings/media/video-interfaces.txt.
+  This port is mandatory.
+
+  CSI2DC supports one 'port' node as source port with parallel interface.
+  This is called video pipe.
+  This port has an 'endpoint' that can be connected to a sink port of another
+  controller (next in pipeline).
+  Please refer to the bindings defined in
+  Documentation/devicetree/bindings/media/video-interfaces.txt.
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
+    type: object
+    description:
+      List of ports
+
+    properties:
+      port@0:
+        type: object
+        description:
+          Input port node, single endpoint describing the input port.
+      port@1:
+        type: object
+        description:
+          Output port node, single endpoint, describing the output port.
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

