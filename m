Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 603222B0689
	for <lists+linux-media@lfdr.de>; Thu, 12 Nov 2020 14:34:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727932AbgKLNep (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Nov 2020 08:34:45 -0500
Received: from esa6.microchip.iphmx.com ([216.71.154.253]:41666 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727646AbgKLNep (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Nov 2020 08:34:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1605188084; x=1636724084;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zSUyeT6IZWo4ojb3zNIwODIfAyYWUJhMQcPYt47u4lY=;
  b=YBDQHnMcoWZIn6af0Sz4L/Nrd0LlE8PksK1kfo9aG2b73C7HaNShb9ae
   lY0y193H9aRLls8sQuPkHdMKwifKrf9F/+mTuIW1Qhd8YmeCL2j5bZjic
   Wk6+5u0OisUP/wt2aHl4uokggoDpicCoAEEjUBuJJTWB6gFArS5IUhXoP
   GqdX6zEbf+I9+KXMDa3gaa6Mu/Rd4c/qKJxjozVPD6TOIog8K0I3xEYEU
   JyftdG5CiqIgKxwIr58yYlXUkcVnOvl8Hv8Xx6SbjUhTxnx/3yuwtN3Ol
   MWroqqGTuOc4bXw1LWWwiLFIB2E2UP5qTKkQwqYv0pIKdPuHcTMlCdy7/
   Q==;
IronPort-SDR: u/D/oeeRhGJM8TNqvR9mpeph5xH+a0q5lM+Z184pnrxZXmBHnD7USGJHgr/M5OxAMHN25axRHu
 tA8w9y7VuKYe5R9bQp8nvpOeAWD/tHUUZB/hYWuupMGimfNAeTru+jhtN3/3ZNEWlAcHhT+Wqe
 FHVSXxTQGjmoOr4J+JCv6vLeIYScXQFT6gvV/nzZqtedM9oG4Tgjlrl7YjPp2zyPXHd7NoWiEE
 jxEWqBMAiTgJt2X9gvBSvh3S8f8HErw18rmEjbgyLl+dsQhs7fm9XGKf+hooq6tJEe/ol4W+Ud
 s7E=
X-IronPort-AV: E=Sophos;i="5.77,472,1596524400"; 
   d="scan'208";a="33368544"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Nov 2020 06:34:43 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 12 Nov 2020 06:34:42 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Thu, 12 Nov 2020 06:34:40 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <robh+dt@kernel.org>,
        <sakari.ailus@iki.fi>, <laurent.pinchart@ideasonboard.com>,
        <jacopo@jmondi.org>
CC:     Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v5 1/3] dt-bindings: media: atmel: csi2dc: add bindings for microchip csi2dc
Date:   Thu, 12 Nov 2020 15:34:35 +0200
Message-ID: <20201112133437.372475-1-eugen.hristev@microchip.com>
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

 .../bindings/media/microchip,csi2dc.yaml      | 119 ++++++++++++++++++
 1 file changed, 119 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/microchip,csi2dc.yaml

diff --git a/Documentation/devicetree/bindings/media/microchip,csi2dc.yaml b/Documentation/devicetree/bindings/media/microchip,csi2dc.yaml
new file mode 100644
index 000000000000..e79f0d6ba9db
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/microchip,csi2dc.yaml
@@ -0,0 +1,119 @@
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
+  ports:
+    type: object
+    description:
+      List of ports
+
+    properties:
+      port@0:
+        type: object
+        description:
+          Input port node, single endpoint describing the input pad.
+      port@1:
+        type: object
+        description:
+          Output port node, single endpoint, describing the output pad.
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
+...
-- 
2.25.1

