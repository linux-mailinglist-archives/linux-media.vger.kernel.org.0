Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAEA42AD9CD
	for <lists+linux-media@lfdr.de>; Tue, 10 Nov 2020 16:11:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731294AbgKJPLq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Nov 2020 10:11:46 -0500
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:17663 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730754AbgKJPLp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Nov 2020 10:11:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1605021105; x=1636557105;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Ztmal9tJX5xrGn8DH9PQo8iEvJPBg8bcxFxGGaBRpHs=;
  b=mMzZOPGauCpdTbnAl1lWF6CX7CQZhAkW2OBA6mXkDfa6FkG6emn8ZxO8
   3WcJYU5qvpioN2z3Ba4V2zYM9O9n9Y5xv6R+iRird4+ETeiww5A5Ku1la
   /To816ZCqoWBYShdCNdG8w/iND0iGgujHhrlkWpffM6Atfx4r+zpm4n0u
   0ZZTVN5JVPtixVwHvEoouJMruy424u1ahyxhTJ7AdaPniQIrd0MfCzsIr
   ohUo1KhkMqkujNm+F7LB7Fe3qs8Wka3J7xD9SEhnoE4Llp0P9nvS9uD3u
   OkiyKLkBGOJ0++F72dSExkQF1TOZa+pnRXWsQN1gteSM9o47EyFJxevnd
   Q==;
IronPort-SDR: 6H5IcxBQ+SPN2/+z4QWmBfc1f0EaoxkpCCbUAgDIY7BxHK1WMNyHtgO2sFB2wkJgY5r2ph4SF+
 n08ialVeoZ5eMk9ywn0mYzWXa0STkMUjTCjVZc68qF6WiaPQWKJNWZrzANNczBiQroqurRqvsR
 eWrBKRJ6GU6H3sRZejNt8gJ0MZI6nwRfLASW8RkIXELFBTNrqOvd05OmLrwUJ7v0knOJHGvltU
 jyPEyHKwLl2Tz7HRORQysVL2ohe1KuaNTDRClS1Alkj7ssqS5kvpSTtRpNbvkdCtvKYAudPs3s
 /pk=
X-IronPort-AV: E=Sophos;i="5.77,466,1596524400"; 
   d="scan'208";a="97870267"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Nov 2020 08:11:45 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 10 Nov 2020 08:11:44 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Tue, 10 Nov 2020 08:11:41 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <robh+dt@kernel.org>,
        <sakari.ailus@iki.fi>, <laurent.pinchart@ideasonboard.com>,
        <jacopo@jmondi.org>
CC:     Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v4 1/3] dt-bindings: media: atmel: csi2dc: add bindings for microchip csi2dc
Date:   Tue, 10 Nov 2020 17:11:14 +0200
Message-ID: <20201110151116.161260-1-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
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
Changes in v4:
- Removed property for inter-line-delay and for clock continuous/non-continuous
- Removed virtual channel by reg for second endpoint

Changes in v3:
- Removed some text from description, as it was explained in the schema
- fixed other things as per Rob's review
- moved some text inside the schema, like the clock description

Changes in v2:
- fixed warnings reported by dt_binding_check

 .../bindings/media/microchip,csi2dc.yaml      | 144 ++++++++++++++++++
 1 file changed, 144 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/microchip,csi2dc.yaml

diff --git a/Documentation/devicetree/bindings/media/microchip,csi2dc.yaml b/Documentation/devicetree/bindings/media/microchip,csi2dc.yaml
new file mode 100644
index 000000000000..967e8fefe363
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/microchip,csi2dc.yaml
@@ -0,0 +1,144 @@
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
+
+  CSI2DC provides two pipes, one video pipe and one data pipe. Video pipe
+  is connected to a sensor controller and the data pipe is accessible
+  as a DMA slave port to a DMA controller.
+
+  CSI2DC supports a single 'port' node as a source pad with Synopsys 32-bit
+  IDI interface. The connected endpoint must be a IDI interface compatible
+  device (like Synopsys CSI2HOST) , that can provide 32-bit IDI interface
+  connection as sink pad.
+  For media entity and endpoints please refer to the bindings defined in
+  Documentation/devicetree/bindings/media/video-interfaces.txt.
+  For Synopsys IDI interface please refer to
+  Documentation/devicetree/bindings/media/snps,dw-csi-plat.txt
+
+  CSI2DC supports one 'port' node as sink pad with parallel interface. This is
+  called video pipe.
+  This port has an 'endpoint' can then be used as a source pad for another
+  controller (next in pipeline).
+  Please refer to the bindings defined in
+  Documentation/devicetree/bindings/media/video-interfaces.txt.
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
+      reg:
+        const: 1
+
+      endpoint:
+        type: object
+
+        properties:
+          remote-endpoint: true
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
+  - port@0
+
+examples:
+  - |
+    csi2dc@e1404000 {
+        compatible = "microchip,sama7g5-csi2dc";
+        #address-cells = <1>;
+        #size-cells = <0>;
+        reg = <0xe1404000 0x500>;
+        clocks = <&pclk>, <&scck>;
+        clock-names = "pclk", "scck";
+
+        port@0 {
+               reg = <0>; /* must be 0, first child port */
+               csi2dc_in: endpoint { /* input from IDI interface */
+                     remote-endpoint = <&csi2host_out>;
+               };
+        };
+
+        port@1 {
+                reg = <1>; /* must be 1, second child port */
+                csi2dc_out: endpoint {
+                        remote-endpoint = <&xisc_in>; /* output to sensor controller */
+                };
+        };
+    };
+
+...
-- 
2.25.1

