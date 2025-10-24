Return-Path: <linux-media+bounces-45475-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1401FC0567A
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 11:46:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0DEC64E50F6
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 09:46:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6798E30E0EF;
	Fri, 24 Oct 2025 09:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="hQhSUMu1"
X-Original-To: linux-media@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A71F30E0C6;
	Fri, 24 Oct 2025 09:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761299130; cv=none; b=Gy7P9/gz8FbBNq6AFUDqzH+hiql7rOaioeI0zWbDENru1e3lI1VElCc0CI4Hmd3Jq0DCnsY7kBU3H03hgGCWn4EijqNFQIbQ7k4DwoHAM3D/sYPR/Hz/e9fA55uTw9019UinFjVa+JxtkuYov8nLSCopZ8UDaAC3OdBMCjn4nXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761299130; c=relaxed/simple;
	bh=lCiWBEn/bFYSvRyh64nGdptJJrXDMU84QsxxNebX2mA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cyqZQr5iqxBWumg7YI0Joc6R9gZvlR/jP/CjyGlMUJboCkyDGLJdm+CLmp/VWmut2k2AItoMFef4xrZm5h5skmIGrkVwG+sAZDycswLzGjAnG5I2p/kz0XiPpmlpU5uc45NugieI6s8ez8yBB1VgCZSflZdOXZ3rDmOu4aF8OQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=hQhSUMu1; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59O9jElD734403;
	Fri, 24 Oct 2025 04:45:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761299114;
	bh=5H9hIHytoo4OqUK/5SOOe5hv79fClStJ2aETiCQvUJc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=hQhSUMu1xFjuTskbyBR1rmJOm6sSuQJ8asLsKpq3iieADLnj3cyrfZj6rQyQThMIt
	 96/CBEyDtjgY51hkGWjxEKwok5ftRbwIHdh0bN2Mc5cQay72xYVMA2n1rOS8o5tz5P
	 NVR6FvGdTxCOe+9ccDbdMHe+DuQRWmoTzE2N1Tvs=
Received: from DLEE206.ent.ti.com (dlee206.ent.ti.com [157.170.170.90])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59O9jE0K3494078
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 24 Oct 2025 04:45:14 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 24 Oct
 2025 04:45:14 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 24 Oct 2025 04:45:14 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.68.198])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59O9isvm148409;
	Fri, 24 Oct 2025 04:45:10 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <hverkuil+cisco@kernel.org>
CC: <sakari.ailus@linux.intel.com>, <bparrot@ti.com>,
        <jai.luthra@ideasonboard.com>, <dale@farnsworth.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>,
        <y-abhilashchandra@ti.com>, Sukrut Bellary <sbellary@baylibre.com>
Subject: [PATCH V5 3/4] dt-bindings: media: ti: vpe: Add support for Video Input Port
Date: Fri, 24 Oct 2025 15:14:51 +0530
Message-ID: <20251024094452.549186-4-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251024094452.549186-1-y-abhilashchandra@ti.com>
References: <20251024094452.549186-1-y-abhilashchandra@ti.com>
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
Changelog:
Changes in v5:
Krzysztof:
- Drop VIP node's label from the example
- Fix indentation of the example

 .../devicetree/bindings/media/ti,vip.yaml     | 152 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 153 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/ti,vip.yaml

diff --git a/Documentation/devicetree/bindings/media/ti,vip.yaml b/Documentation/devicetree/bindings/media/ti,vip.yaml
new file mode 100644
index 000000000000..e30cc461542b
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/ti,vip.yaml
@@ -0,0 +1,152 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2025 Texas Instruments Incorporated -  http://www.ti.com/
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/ti,vip.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments DRA7x Video Input Port (VIP)
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
+    maxItems: 1
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
+required:
+  - compatible
+  - reg
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
+    video@48970000 {
+      compatible = "ti,dra7-vip";
+      reg = <0x48970000 0x1000>;
+      interrupts = <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 392 IRQ_TYPE_LEVEL_HIGH>;
+      ti,ctrl-module = <&scm_conf 0x534 0x0 0x2 0x1 0x3>;
+
+      ports {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        vin1a: port@0 {
+          reg = <0>;
+
+          vin1a_ep: endpoint {
+            remote-endpoint = <&camera1>;
+            hsync-active = <1>;
+            vsync-active = <1>;
+            pclk-sample = <0>;
+            bus-width = <8>;
+          };
+        };
+
+        vin1b: port@1 {
+          reg = <1>;
+
+          vin1b_ep: endpoint {
+            remote-endpoint = <&camera2>;
+            hsync-active = <1>;
+            vsync-active = <1>;
+            pclk-sample = <0>;
+            bus-width = <8>;
+          };
+        };
+
+        vin2a: port@2 {
+          reg = <2>;
+
+          vin2a_ep: endpoint {
+            remote-endpoint = <&camera3>;
+            hsync-active = <1>;
+            vsync-active = <1>;
+            pclk-sample = <0>;
+            bus-width = <16>;
+          };
+        };
+
+        vin2b: port@3 {
+          reg = <3>;
+
+          vin2b_ep: endpoint {
+            remote-endpoint = <&camera4>;
+            hsync-active = <1>;
+            vsync-active = <1>;
+            pclk-sample = <0>;
+            bus-width = <8>;
+          };
+        };
+      };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 5ea78444f035..5e57c742d8e5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25933,6 +25933,7 @@ S:	Maintained
 W:	http://linuxtv.org/
 Q:	http://patchwork.linuxtv.org/project/linux-media/list/
 F:	Documentation/devicetree/bindings/media/ti,cal.yaml
+F:	Documentation/devicetree/bindings/media/ti,vip.yaml
 F:	Documentation/devicetree/bindings/media/ti,vpe.yaml
 F:	drivers/media/platform/ti/cal/
 F:	drivers/media/platform/ti/vpe/
-- 
2.34.1


