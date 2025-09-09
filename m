Return-Path: <linux-media+bounces-42070-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CDFB4A49F
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 10:09:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F3873B71B1
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 08:09:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3EBA255F2C;
	Tue,  9 Sep 2025 08:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="QjTmnlbb"
X-Original-To: linux-media@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347AE25484D;
	Tue,  9 Sep 2025 08:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757405323; cv=none; b=ay/dZ5grNGb21oWQ1A+LcDS5MLAWLfj6oR4nx+F5UVn/X84IkDBuhFXrcZZMCzvdWMM4hpjlMinywLp6/JtVGuGLJdN9NPlj1t5Yx+/VOP4pJipxi/MLqERXleAT9L0or69DqoGrLUqs8gOzkg4xearqg+rerVuIk92bMKrKYVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757405323; c=relaxed/simple;
	bh=vZSM/yrb2BZgSqr6rmUzjORK9UQE9yavIWDxwKGqGpQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IIqsR0dxszl4WXd0ALX3ZIFN/am/utm4AFgkN4k82xXm0u3h5o/EYXe1kAslO2xKYoXmDT5x9dwvmvd0vX/0knYEEV+rZN7CTVuPew8qmgd1zzrUNi+ubkFow4tzxHWNuyd22U2W8ZTJFe+RNZTnyqRMR5a5pTQ4yDWfajtvUgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=QjTmnlbb; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58988Rnp243223;
	Tue, 9 Sep 2025 03:08:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757405307;
	bh=wEFs+iFSAROEggAA7jjqs/gos9b4R+SgN7qg4D29q/c=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=QjTmnlbbBt2oqdGuQYjciIK+jQRRLYINYRpMcjQCFzcYz1S/nVuXmWZWoJp1rgsgD
	 l8gDaZnX29/Y+qaynSGaBIF8eA9z+DmsyIY0pNbQ/PsrFD130xlSC9wrlQNSo3S1wd
	 bYss72UlnBXj9rxxNAg34fbw8t5/kAvBICgY7tDQ=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58988RJC3566735
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 9 Sep 2025 03:08:27 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 9
 Sep 2025 03:08:27 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 9 Sep 2025 03:08:27 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.68.198])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58987soH2319864;
	Tue, 9 Sep 2025 03:08:23 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <hverkuil+cisco@kernel.org>
CC: <sakari.ailus@linux.intel.com>, <bparrot@ti.com>,
        <jai.luthra@ideasonboard.com>, <dale@farnsworth.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>,
        <y-abhilashchandra@ti.com>, Sukrut Bellary <sbellary@baylibre.com>
Subject: [PATCH V3 4/5] dt-bindings: media: ti: vpe: Add support for Video Input Port
Date: Tue, 9 Sep 2025 13:37:17 +0530
Message-ID: <20250909080718.1381758-5-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250909080718.1381758-1-y-abhilashchandra@ti.com>
References: <20250909080718.1381758-1-y-abhilashchandra@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

From: Dale Farnsworth <dale@farnsworth.org>

Add device tree bindings for the Video Input Port. Video Input Port (VIP)
can be found on devices such as DRA7xx and provides a parallel interface
to a video source such as a sensor or TV decoder.

Signed-off-by: Dale Farnsworth <dale@farnsworth.org>
Signed-off-by: Benoit Parrot <bparrot@ti.com>
Signed-off-by: Sukrut Bellary <sbellary@baylibre.com>
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
Change log:
Changes in v3:
- Remove redundant labels in bindings
- Remove minItems in interrupts and mandate exactly 2 interrupts using items
- Rename phandle from ti,vip-clk-polarity to ti,ctrl-module and explain why this is required by the device
- Make the phandle verifiable instead of just descriptive
- Drop entire sensor node from example DT
- Fix ports hierarchy using appropriate references and descriptions
- Use generic node names
- Add two new properties ti,vip-pixel-mux and ti,vip-channels with appropriate types and descriptions

 .../devicetree/bindings/media/ti,vip.yaml     | 178 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 179 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/ti,vip.yaml

diff --git a/Documentation/devicetree/bindings/media/ti,vip.yaml b/Documentation/devicetree/bindings/media/ti,vip.yaml
new file mode 100644
index 000000000000..c0bce44725db
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/ti,vip.yaml
@@ -0,0 +1,178 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2025 Texas Instruments Incorporated -  http://www.ti.com/
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/ti,vip.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments DRA7x VIDEO INPUT PORT (VIP).
+
+maintainers:
+  - Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
+
+description: |-
+  Video Input Port (VIP) can be found on devices such as DRA7xx and
+  provides the system interface and the processing capability to
+  connect parallel image-sensor as well as BT.656/1120 capable encoder
+  chip to DRA7x device.
+
+  Each VIP instance supports 2 independently configurable external
+  video input capture slices (Slice 0 and Slice 1) each providing
+  up to two video input ports (Port A and Port B).
+
+properties:
+  compatible:
+    enum:
+      - ti,dra7-vip
+
+  reg:
+    items:
+      - description: The VIP main register region
+      - description: Video Data Parser (PARSER) register region for Slice0
+      - description: Color Space Conversion (CSC) register region for Slice0
+      - description: Scaler (SC) register region for Slice0
+      - description: Video Data Parser (PARSER) register region for Slice1
+      - description: Color Space Conversion (CSC) register region for Slice1
+      - description: Scaler (SC) register region for Slice1
+      - description: Video Port Direct Memory Access (VPDMA) register region
+
+  reg-names:
+    items:
+      - const: vip
+      - const: parser0
+      - const: csc0
+      - const: sc0
+      - const: parser1
+      - const: csc1
+      - const: sc1
+      - const: vpdma
+
+  interrupts:
+    items:
+      - description: IRQ index 0 is used for Slice0 interrupts
+      - description: IRQ index 1 is used for Slice1 interrupts
+
+  ti,ctrl-module:
+    description:
+      Reference to the device control module that provides clock-edge
+      inversion control for VIP ports. These controls allow the
+      VIP to sample pixel data on the correct clock edge.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      items:
+        - description: phandle to device control module
+        - description: offset to the CTRL_CORE_SMA_SW_1 register
+        - description: Bit field to slice 0 port A
+        - description: Bit field to slice 0 port B
+        - description: Bit field to slice 1 port A
+        - description: Bit field to slice 1 port B
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    patternProperties:
+      '^port@[0-3]$':
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: |
+          Each VIP instance supports 2 independently configurable external video
+          input capture slices (Slice 0 and Slice 1) each providing up to two video
+          input ports (Port A and Port B). These ports represent the following
+          port@0 -> Slice 0 Port A
+          port@1 -> Slice 0 Port B
+          port@2 -> Slice 1 Port A
+          port@3 -> Slice 1 Port B
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              bus-width:
+                enum: [8, 16, 24]
+                default: 8
+
+              ti,vip-pixel-mux:
+                type: boolean
+                description:
+                  In BT656/1120 mode, this will enable pixel-muxing if
+                  the number of channels is either 1, 2 or 4. If this
+                  property is present then pixel-muxing is enabled
+                  otherwise it will use line-muxing.
+
+              ti,vip-channels:
+                $ref: /schemas/types.yaml#/definitions/uint8-array
+                minItems: 1
+                maxItems: 16
+                description:
+                  In BT656/1120 mode, list of channel ids to be captured.
+                  If the property is not present then 1 channel is assumed.
+
+              remote-endpoint: true
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - ti,ctrl-module
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    vip1: video@48970000 {
+        compatible = "ti,dra7-vip";
+        reg = <0x48970000 0x114>,
+              <0x48975500 0xD8>,
+              <0x48975700 0x18>,
+              <0x48975800 0x80>,
+              <0x48975a00 0xD8>,
+              <0x48975c00 0x18>,
+              <0x48975d00 0x80>,
+              <0x4897d000 0x400>;
+        reg-names = "vip",
+                    "parser0",
+                    "csc0",
+                    "sc0",
+                    "parser1",
+                    "csc1",
+                    "sc1",
+                    "vpdma";
+        interrupts = <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 392 IRQ_TYPE_LEVEL_HIGH>;
+        ti,ctrl-module = <&scm_conf 0x534 0x0 0x2 0x1 0x3>;
+
+        ports {
+              #address-cells = <1>;
+              #size-cells = <0>;
+
+              vin1a: port@0 {
+                    reg = <0>;
+
+                    vin1a_ep: endpoint {
+                           remote-endpoint = <&camera1>;
+                           hsync-active = <1>;
+                           vsync-active = <1>;
+                           pclk-sample = <0>;
+                           bus-width = <8>;
+                    };
+              };
+              vin1b: port@1 {
+                    reg = <1>;
+              };
+              vin2a: port@2 {
+                    reg = <2>;
+              };
+              vin2b: port@3 {
+                    reg = <3>;
+              };
+         };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index d7175c38c6d1..83ca0cfd0565 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25564,6 +25564,7 @@ S:	Maintained
 W:	http://linuxtv.org/
 Q:	http://patchwork.linuxtv.org/project/linux-media/list/
 F:	Documentation/devicetree/bindings/media/ti,cal.yaml
+F:	Documentation/devicetree/bindings/media/ti,vip.yaml
 F:	Documentation/devicetree/bindings/media/ti,vpe.yaml
 F:	drivers/media/platform/ti/cal/
 F:	drivers/media/platform/ti/vpe/
-- 
2.34.1


