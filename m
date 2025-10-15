Return-Path: <linux-media+bounces-44512-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC4EBDC9E9
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 07:41:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DB2618882E6
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 05:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEED93090C1;
	Wed, 15 Oct 2025 05:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="gTYaQ1Et"
X-Original-To: linux-media@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50582303A3B;
	Wed, 15 Oct 2025 05:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760506848; cv=none; b=W0B6jUQ7ciC0oBwoOIUOmDMEut1X12ZhRKdA+WM0HqKlrP/T1/+wieGdezKt08Cjp8h7BrzePuMSDe50+m22a1lr4d3rUtglLXl0tF3qL5pCRPSTEmfAlJEsTKFKixmaw9etLxEU3AIqs97IdT/88fsTT73wYbI+DGWFHuFN2eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760506848; c=relaxed/simple;
	bh=VeGkBS50jt2v93wyLNDX56E4jYWquwBH3Tqulq9vCyo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iPTufOjSc8wqIaOski7ZnPLRXZuPyiCJ8rzTxmLojyXnX5mUocgLuqEwAPbHiTtSU/jH8JCNlfQnAEbGyRAbjrkSHahPveFq2w+ZlkXdZEru5d4Rib1UcTAPIUqseqgeW+Os8kD18Dtjy485zirIICMs2mSP9u9AqxS/fNueFpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=gTYaQ1Et; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59F5eb0e1242450;
	Wed, 15 Oct 2025 00:40:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760506837;
	bh=KhsZshLmPsJDHOu68eOHFWd4e53aHVUaaU5BBoM5I6w=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=gTYaQ1Etb3rUbVaIjIIAP9fAIGQfq+WohW405PJYVDrTGbgnQZyuHwtEV3/FvAmPH
	 VwUM5amQlhXwWvaD6xzSzjgN31SboDcl0hXeMe3TqV3dKyVbNvmtubAbYL57sqKlEY
	 k96hKCjPeZ0C7l4AJNiY8pasLn9XQfD94jQuVcfE=
Received: from DFLE200.ent.ti.com (dfle200.ent.ti.com [10.64.6.58])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59F5ebB4175267
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 15 Oct 2025 00:40:37 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Oct
 2025 00:40:37 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 15 Oct 2025 00:40:37 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.68.198])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59F5eGdp1402458;
	Wed, 15 Oct 2025 00:40:33 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <hverkuil+cisco@kernel.org>
CC: <sakari.ailus@linux.intel.com>, <bparrot@ti.com>,
        <jai.luthra@ideasonboard.com>, <dale@farnsworth.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>,
        <y-abhilashchandra@ti.com>, Sukrut Bellary <sbellary@baylibre.com>
Subject: [PATCH V4 3/4] dt-bindings: media: ti: vpe: Add support for Video Input Port
Date: Wed, 15 Oct 2025 11:10:09 +0530
Message-ID: <20251015054010.3594423-4-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251015054010.3594423-1-y-abhilashchandra@ti.com>
References: <20251015054010.3594423-1-y-abhilashchandra@ti.com>
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
Changes in v4:
Krzysztof:
- Fix title
- Drop configuration parameters
- Remove redundant remote-endpoint
- Have one contiguous address space as defined by TRM.
- Make example complete by adding endpoints to all VIP instances

 .../devicetree/bindings/media/ti,vip.yaml     | 149 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 150 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/ti,vip.yaml

diff --git a/Documentation/devicetree/bindings/media/ti,vip.yaml b/Documentation/devicetree/bindings/media/ti,vip.yaml
new file mode 100644
index 000000000000..e41fd85acd6f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/ti,vip.yaml
@@ -0,0 +1,149 @@
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
+    vip1: video@48970000 {
+        compatible = "ti,dra7-vip";
+        reg = <0x48970000 0x1000>;
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
+
+                    vin1b_ep: endpoint {
+                           remote-endpoint = <&camera2>;
+                           hsync-active = <1>;
+                           vsync-active = <1>;
+                           pclk-sample = <0>;
+                           bus-width = <8>;
+                    };
+              };
+              vin2a: port@2 {
+                    reg = <2>;
+
+                    vin2a_ep: endpoint {
+                           remote-endpoint = <&camera3>;
+                           hsync-active = <1>;
+                           vsync-active = <1>;
+                           pclk-sample = <0>;
+                           bus-width = <16>;
+                    };
+              };
+              vin2b: port@3 {
+                    reg = <3>;
+
+                    vin2b_ep: endpoint {
+                           remote-endpoint = <&camera4>;
+                           hsync-active = <1>;
+                           vsync-active = <1>;
+                           pclk-sample = <0>;
+                           bus-width = <8>;
+                    };
+              };
+         };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 04193ceb9365..0e7e346bc405 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25846,6 +25846,7 @@ S:	Maintained
 W:	http://linuxtv.org/
 Q:	http://patchwork.linuxtv.org/project/linux-media/list/
 F:	Documentation/devicetree/bindings/media/ti,cal.yaml
+F:	Documentation/devicetree/bindings/media/ti,vip.yaml
 F:	Documentation/devicetree/bindings/media/ti,vpe.yaml
 F:	drivers/media/platform/ti/cal/
 F:	drivers/media/platform/ti/vpe/
-- 
2.34.1


