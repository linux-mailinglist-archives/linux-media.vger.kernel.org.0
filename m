Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8FD3C8C87
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 17:15:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727498AbfJBPO6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 11:14:58 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:1730 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725893AbfJBPO6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Oct 2019 11:14:58 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x92F121c012976;
        Wed, 2 Oct 2019 17:14:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=CXGmlan+Wj/viRlSDj38Z4Gh2UXNOjV1C65oThvMrZk=;
 b=GnzWAk19LFjuVyNSgWxys4YVKDpI2bCBXnIPLnprFkLfz2HqvHpTG2CGPcGU1Y2iFG67
 Vw8q+q6kraaBxdSVCl7jm5973IHFDbvdNzy4vZVoj8CE2LSzwoVR9TLuuhmixa7fhs6/
 MsQgGHoDB/N6/GXYlHcioXG7a2nCZvoWrVj4fyq24AtboTPTh3tVUJy64qWstB+m/dRk
 +BrQA93CnJu2oGeP9T/I2pezgL7jNFSRdnbGpCw0Ouu2YYsSvaetoEukSSb+r2RCvozQ
 m41oWHUih1oTJcnbHeTvoo+k2mE20H6ql2KoNBj41ZJhxh1LDoe63Wmq9qvgvrAoWrgj wg== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
        by mx08-00178001.pphosted.com with ESMTP id 2v9vnafnx7-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Wed, 02 Oct 2019 17:14:49 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 002C24B;
        Wed,  2 Oct 2019 15:14:45 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 387E92D3764;
        Wed,  2 Oct 2019 17:14:45 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.92) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 2 Oct 2019
 17:14:45 +0200
Received: from localhost (10.201.20.122) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 2 Oct 2019 17:14:44
 +0200
From:   Benjamin Gaignard <benjamin.gaignard@st.com>
To:     <mchehab@kernel.org>, <robh+dt@kernel.org>,
        <alexandre.torgue@st.com>, <hugues.fruchet@st.com>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: [PATCH] dt-bindings: media: Convert stm32 dcmi bindings to json-schema
Date:   Wed, 2 Oct 2019 17:14:42 +0200
Message-ID: <20191002151442.15428-1-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.201.20.122]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-02_07:2019-10-01,2019-10-02 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert the STM32 dcmi binding to DT schema format using json-schema

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 .../devicetree/bindings/media/st,stm32-dcmi.txt    | 45 ----------
 .../devicetree/bindings/media/st,stm32-dcmi.yaml   | 97 ++++++++++++++++++++++
 2 files changed, 97 insertions(+), 45 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/st,stm32-dcmi.txt
 create mode 100644 Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml

diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmi.txt b/Documentation/devicetree/bindings/media/st,stm32-dcmi.txt
deleted file mode 100644
index 3122ded82eb4..000000000000
--- a/Documentation/devicetree/bindings/media/st,stm32-dcmi.txt
+++ /dev/null
@@ -1,45 +0,0 @@
-STMicroelectronics STM32 Digital Camera Memory Interface (DCMI)
-
-Required properties:
-- compatible: "st,stm32-dcmi"
-- reg: physical base address and length of the registers set for the device
-- interrupts: should contain IRQ line for the DCMI
-- resets: reference to a reset controller,
-          see Documentation/devicetree/bindings/reset/st,stm32-rcc.txt
-- clocks: list of clock specifiers, corresponding to entries in
-          the clock-names property
-- clock-names: must contain "mclk", which is the DCMI peripherial clock
-- pinctrl: the pincontrol settings to configure muxing properly
-           for pins that connect to DCMI device.
-           See Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml.
-- dmas: phandle to DMA controller node,
-        see Documentation/devicetree/bindings/dma/stm32-dma.txt
-- dma-names: must contain "tx", which is the transmit channel from DCMI to DMA
-
-DCMI supports a single port node with parallel bus. It should contain one
-'port' child node with child 'endpoint' node. Please refer to the bindings
-defined in Documentation/devicetree/bindings/media/video-interfaces.txt.
-
-Example:
-
-	dcmi: dcmi@50050000 {
-		compatible = "st,stm32-dcmi";
-		reg = <0x50050000 0x400>;
-		interrupts = <78>;
-		resets = <&rcc STM32F4_AHB2_RESET(DCMI)>;
-		clocks = <&rcc 0 STM32F4_AHB2_CLOCK(DCMI)>;
-		clock-names = "mclk";
-		pinctrl-names = "default";
-		pinctrl-0 = <&dcmi_pins>;
-		dmas = <&dma2 1 1 0x414 0x3>;
-		dma-names = "tx";
-		port {
-			dcmi_0: endpoint {
-				remote-endpoint = <...>;
-				bus-width = <8>;
-				hsync-active = <0>;
-				vsync-active = <0>;
-				pclk-sample = <1>;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
new file mode 100644
index 000000000000..50e8cfed06f3
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
@@ -0,0 +1,97 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/st,stm32-dcmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STM32 Digital Camera Memory Interface (DCMI) binding
+
+maintainers:
+  - Hugues Fruchet <hugues.fruchet@st.com>
+
+properties:
+  compatible:
+    const: st,stm32-dcmi
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Module Clock
+
+  clock-names:
+    items:
+      - const: mclk
+
+  pinctrl-names: true
+
+  dmas:
+    description:
+      One DMA channel specifier following the convention outlined
+      in bindings/dma/dma.txt
+    maxItems: 1
+
+  dma-names:
+    description:
+      There must be one channel named "tx" for transmit
+    maxItems: 1
+    additionalItems: true
+    items:
+      - const: tx
+
+  resets:
+        maxItems: 1
+
+  port:
+    type: object
+    description:
+      DCMI supports a single port node with parallel bus. It should contain
+      one 'port' child node with child 'endpoint' node. Please refer to the
+      bindings defined in
+      Documentation/devicetree/bindings/media/video-interfaces.txt.
+
+patternProperties:
+  "^pinctrl-[0-9]+$": true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - dmas
+  - dma-names
+  - port
+    
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/stm32mp1-clks.h>
+    #include <dt-bindings/reset/stm32mp1-resets.h>
+    dcmi: dcmi@4c006000 {
+        compatible = "st,stm32-dcmi";
+        reg = <0x4c006000 0x400>;
+        interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+        resets = <&rcc CAMITF_R>;
+        clocks = <&rcc DCMI>;
+        clock-names = "mclk";
+        dmas = <&dmamux1 75 0x400 0x0d>;
+        dma-names = "tx";
+
+        port {
+             dcmi_0: endpoint {
+                   remote-endpoint = <&ov5640_0>;
+                   bus-width = <8>;
+                   hsync-active = <0>;
+                   vsync-active = <0>;
+                   pclk-sample = <1>;
+             };
+        };
+    };
+
+...
-- 
2.15.0

