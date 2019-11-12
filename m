Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7DDDF9310
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2019 15:51:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727423AbfKLOvK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Nov 2019 09:51:10 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:52550 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727394AbfKLOvJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Nov 2019 09:51:09 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xACEp6vW098117;
        Tue, 12 Nov 2019 08:51:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573570266;
        bh=NExSdKCWUJTypoMVmnkZw64WAdAPw9ouL0SwGsRb2fk=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=tWQORNC5vFu9V1zrJN9+0+VwLYCDsaAIdRkhsNtzcHsWWFGKf6TP9AgZfwcXxPN+W
         ZW/vf2NcBvclKFTXIHm6ODvKaRPryTv6keEMRIo5Qfln+Rxv58Z9iczPs3JTFllOSs
         S/Ewou1EhHw3wUOCgoT2vAO9HOG+H4Py98qYRQgM=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xACEp514024388
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 12 Nov 2019 08:51:05 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 12
 Nov 2019 08:51:05 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 12 Nov 2019 08:50:48 -0600
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xACEokf6068428;
        Tue, 12 Nov 2019 08:51:05 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [RESEND Patch v3 20/20] dt-bindings: media: cal: convert binding to yaml
Date:   Tue, 12 Nov 2019 08:53:47 -0600
Message-ID: <20191112145347.23519-21-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191112145347.23519-1-bparrot@ti.com>
References: <20191112145347.23519-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert ti-cal.txt to ti,cal.yaml.
Add ti,cal.yaml to the MAINTAINERS file.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 .../devicetree/bindings/media/ti,cal.yaml     | 202 ++++++++++++++++++
 .../devicetree/bindings/media/ti-cal.txt      |  81 -------
 MAINTAINERS                                   |   1 +
 3 files changed, 203 insertions(+), 81 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/ti,cal.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/ti-cal.txt

diff --git a/Documentation/devicetree/bindings/media/ti,cal.yaml b/Documentation/devicetree/bindings/media/ti,cal.yaml
new file mode 100644
index 000000000000..1ea784179536
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/ti,cal.yaml
@@ -0,0 +1,202 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/ti,cal.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments DRA72x CAMERA ADAPTATION LAYER (CAL) Device Tree Bindings
+
+maintainers:
+  - Benoit Parrot <bparrot@ti.com>
+
+description: |-
+  The Camera Adaptation Layer (CAL) is a key component for image capture
+  applications. The capture module provides the system interface and the
+  processing capability to connect CSI2 image-sensor modules to the
+  DRA72x device.
+
+  CAL supports 2 camera port nodes on MIPI bus. Each CSI2 camera port nodes
+  should contain a 'port' child node with child 'endpoint' node. Please
+  refer to the bindings defined in
+  Documentation/devicetree/bindings/media/video-interfaces.txt.
+
+properties:
+  compatible:
+    enum:
+      # for DRA72 controllers
+      - ti,dra72-cal
+      # for DRA72 controllers pre ES2.0
+      - ti,dra72-pre-es2-cal
+      # for DRA76 controllers
+      - ti,dra76-cal
+      # for AM654 controllers
+      - ti,am654-cal
+
+  reg:
+    minItems: 2
+    items:
+      - description: The CAL main register region
+      - description: The RX Core0 (DPHY0) register region
+      - description: The RX Core1 (DPHY1) register region
+
+  reg-names:
+    minItems: 2
+    items:
+      - const: cal_top
+      - const: cal_rx_core0
+      - const: cal_rx_core1
+
+  interrupts:
+    maxItems: 1
+
+  ti,camerrx-control:
+    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+    description:
+      phandle to the device control module and offset to the
+      control_camerarx_core register
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: fck
+
+  power-domains:
+    description:
+      List of phandle and PM domain specifier as documented in
+      Documentation/devicetree/bindings/power/power_domain.txt
+    maxItems: 1
+
+  # See ./video-interfaces.txt for details
+  ports:
+    type: object
+    additionalProperties: false
+
+    properties:
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+      port@0:
+        type: object
+        additionalProperties: false
+
+        properties:
+          reg:
+            const: 0
+            description: CSI2 Port #0
+
+        patternProperties:
+          endpoint:
+            type: object
+            additionalProperties: false
+
+            properties:
+              clock-lanes:
+                maxItems: 1
+
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+              remote-endpoint: true
+
+        required:
+          - reg
+
+      port@1:
+        type: object
+        additionalProperties: false
+
+        properties:
+          reg:
+            const: 1
+            description: CSI2 Port #1
+
+        patternProperties:
+          endpoint:
+            type: object
+            additionalProperties: false
+
+            properties:
+              clock-lanes:
+                maxItems: 1
+
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+              remote-endpoint: true
+
+        required:
+          - reg
+
+    required:
+      - "#address-cells"
+      - "#size-cells"
+      - port@0
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - ti,camerrx-control
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    cal: cal@4845b000 {
+        compatible = "ti,dra72-cal";
+        reg = <0x4845B000 0x400>,
+              <0x4845B800 0x40>,
+              <0x4845B900 0x40>;
+        reg-names = "cal_top",
+                    "cal_rx_core0",
+                    "cal_rx_core1";
+        interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+        ti,camerrx-control = <&scm_conf 0xE94>;
+
+        ports {
+              #address-cells = <1>;
+              #size-cells = <0>;
+
+              csi2_0: port@0 {
+                    reg = <0>;
+                    csi2_phy0: endpoint {
+                           remote-endpoint = <&csi2_cam0>;
+                           clock-lanes = <0>;
+                           data-lanes = <1 2>;
+                    };
+              };
+        };
+    };
+
+    i2c5: i2c@4807c000 {
+        clock-frequency = <400000>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera-sensor@3c {
+               compatible = "ovti,ov5640";
+               reg = <0x3c>;
+
+               clocks = <&clk_ov5640_fixed>;
+               clock-names = "xclk";
+
+               port {
+                    csi2_cam0: endpoint {
+                            remote-endpoint = <&csi2_phy0>;
+                            clock-lanes = <0>;
+                            data-lanes = <1 2>;
+                    };
+               };
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/media/ti-cal.txt b/Documentation/devicetree/bindings/media/ti-cal.txt
deleted file mode 100644
index 2deb256e7032..000000000000
--- a/Documentation/devicetree/bindings/media/ti-cal.txt
+++ /dev/null
@@ -1,81 +0,0 @@
-Texas Instruments DRA72x CAMERA ADAPTATION LAYER (CAL)
-------------------------------------------------------
-
-The Camera Adaptation Layer (CAL) is a key component for image capture
-applications. The capture module provides the system interface and the
-processing capability to connect CSI2 image-sensor modules to the
-DRA72x device.
-
-Required properties:
-- compatible:
- Should be "ti,dra72-cal", for DRA72 controllers
- Should be "ti,dra72-pre-es2-cal", for DRA72 controllers pre ES2.0
- Should be "ti,dra76-cal", for DRA76 controllers
- Should be "ti,am654-cal", for AM654 controllers
-- reg:	CAL Top level, Receiver Core #0, Receiver Core #1 and Camera RX
-	control address space
-- reg-names: cal_top, cal_rx_core0, cal_rx_core1 and camerrx_control
-	     registers
-- interrupts: should contain IRQ line for the CAL;
-- ti,camerrx-control: phandle to the device control module and offset to
-		      the control_camerarx_core register.
-		      This node is meant to replace the "camerrx_control"
-		      reg entry above but "camerrx_control" is still
-		      handled for backward compatibility.
-
-CAL supports 2 camera port nodes on MIPI bus. Each CSI2 camera port nodes
-should contain a 'port' child node with child 'endpoint' node. Please
-refer to the bindings defined in
-Documentation/devicetree/bindings/media/video-interfaces.txt.
-
-Example:
-	cal: cal@4845b000 {
-		compatible = "ti,dra72-cal";
-		reg = <0x4845B000 0x400>,
-		      <0x4845B800 0x40>,
-		      <0x4845B900 0x40>;
-		reg-names = "cal_top",
-			    "cal_rx_core0",
-			    "cal_rx_core1";
-		interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
-		ti,camerrx-control = <&scm_conf 0xE94>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			csi2_0: port@0 {
-				reg = <0>;
-				csi2_phy0: endpoint {
-					remote-endpoint = <&csi2_cam0>;
-					clock-lanes = <0>;
-					data-lanes = <1 2>;
-				};
-			};
-			csi2_1: port@1 {
-				reg = <1>;
-			};
-		};
-	};
-
-	i2c5: i2c@4807c000 {
-		clock-frequency = <400000>;
-
-		camera-sensor@3c {
-			compatible = "ovti,ov5640";
-			reg = <0x3c>;
-
-			clocks = <&clk_fixed>;
-			clock-names = "xclk";
-
-			port {
-				csi2_cam0: endpoint {
-					remote-endpoint = <&csi2_phy0>;
-					clock-lanes = <0>;
-					data-lanes = <1 2>;
-				};
-			};
-		};
-	};
diff --git a/MAINTAINERS b/MAINTAINERS
index 37a977cbac6f..909961cff0fd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16324,6 +16324,7 @@ Q:	http://patchwork.linuxtv.org/project/linux-media/list/
 S:	Maintained
 F:	drivers/media/platform/ti-vpe/
 F:	Documentation/devicetree/bindings/media/ti,vpe.yaml
+	Documentation/devicetree/bindings/media/ti,cal.yaml
 
 TI WILINK WIRELESS DRIVERS
 L:	linux-wireless@vger.kernel.org
-- 
2.17.1

