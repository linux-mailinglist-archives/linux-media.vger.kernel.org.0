Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E3C82527CD
	for <lists+linux-media@lfdr.de>; Wed, 26 Aug 2020 08:52:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726751AbgHZGwJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Aug 2020 02:52:09 -0400
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:60067 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726707AbgHZGwJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Aug 2020 02:52:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1598424730; x=1629960730;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SI8j6m6I3e4k4zKG9EdeKsk+0HOf3F01qwpYDXe2Ni8=;
  b=JvLFDBMUmqKUWkf4z89/Ilh5tld5H6qt9DdnMKTBIqH7QhImXUKgTTel
   X6p/LraFfxkVCDCyPridQTlGmLWyWJgNydCQ7c8KmqiAHee2yYrcWaqFu
   /ImLGXgUI3C95MA9pL8xO3W+StW+t43KQ8RulyojmnkmoNtmnxjknGVk7
   +cnyKldDMDmOO9UhE6wm+hVKavyTiu1UcuAhNsH4QAAcUBR3o1tow/eaK
   Ow4c18dro/1zYPtLz/UmE/ibwq2DF0KYqqpd5xxcSqHXbLP+Pm2eMi+oG
   RV679jj2lcPhnImO2lYKtlAzw+q7kjrj56tGzB7G5Ve68PA+YmOSZQY9U
   g==;
IronPort-SDR: +BTtOBHd/Av6g0eiPDp5dgkPCHQaItVSWDbEGQ+TT7pi9LjMsDRQ50bowlH2BrDkwYeh2+2z+6
 7YgMqraxOGPeohFzOPWihOYjbeqDcG+evqUeKwn5IPUVhOS3AZzZ9M/9YKkDFQPocc15OoJxto
 SkwTkPH5I9A3VS7akiQDASYkQyow0jXA2SfxKclcmI5I4HNa3RzOJS+dpjbe4MbEQwWnoGZZlA
 0MMSmo+isnknb6r+Y0fa2p2qwFWmVYhsFGyGMqljisDMpRklo2bYlQlmOwi/y+WAQcIqUqkUnj
 ut0=
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; 
   d="scan'208";a="88565025"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Aug 2020 23:52:08 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 25 Aug 2020 23:51:18 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Tue, 25 Aug 2020 23:51:54 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <robh+dt@kernel.org>, <sakari.ailus@iki.fi>,
        <linux-media@vger.kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v3 1/3] dt-bindings: media: atmel: csi2dc: add bindings for microchip csi2dc
Date:   Wed, 26 Aug 2020 09:51:40 +0300
Message-ID: <20200826065142.205000-1-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add bindings documentation for Microchip CSI2 Demultiplexer controller.

CSI2DC is a demultiplexer from Synopsys IDI interface specification to
parallel interface connection or direct memory access.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
Changes in v3:
- Removed some text from description, as it was explained in the schema
- fixed other things as per Rob's review
- moved some text inside the schema, like the clock description

Changes in v2:
- fixed warnings reported by dt_binding_check

 .../bindings/media/microchip,csi2dc.yaml      | 174 ++++++++++++++++++
 1 file changed, 174 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/microchip,csi2dc.yaml

diff --git a/Documentation/devicetree/bindings/media/microchip,csi2dc.yaml b/Documentation/devicetree/bindings/media/microchip,csi2dc.yaml
new file mode 100644
index 000000000000..b4c1b8800a3b
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/microchip,csi2dc.yaml
@@ -0,0 +1,174 @@
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
+      "^endpoint@[0-3]$":
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

