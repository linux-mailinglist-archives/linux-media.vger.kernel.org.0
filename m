Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D903DD5E99
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2019 11:20:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730836AbfJNJUl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Oct 2019 05:20:41 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:36145 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730438AbfJNJUk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Oct 2019 05:20:40 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x9E9BMpx011331;
        Mon, 14 Oct 2019 11:20:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=hhuuQ/xWbdUGHIdjCriyvu7ExSQFVH1mUTcxcqKxezw=;
 b=WjVVZQdoEjZdAjsSHZEm2KnuVRcyv/gj+u3UP89pv3fyNSE+QYrsCJfReHv9b8OvOMoW
 gpEcVtl45pbJ5h+UaPyb61t2U9zOuAJdSdaTQPEeetz9z2fHx8y0pIjpRNL9+YYyi+VX
 wk6eov1juxcprxaL9mzZpjYslVx9aTFA5c1sndWjFlqWtZ03KNDx4JstxiQuCdmQul1Q
 de94Zv1+lnQB+AG260Qvsj2I8ndv8cCmkScETfrg4SPTpBqSampVLh8D66ohQkt8mkwn
 xIvHvN+8oZfSvUW1lsVuSBmYKz/sSvqnJxoAHsWU4S5PfS0YQoM2i0kVV6YARsSRijds fw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2vk4kwsc42-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 14 Oct 2019 11:20:26 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B65C010002A;
        Mon, 14 Oct 2019 11:20:25 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AA4432B8C56;
        Mon, 14 Oct 2019 11:20:25 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 14 Oct
 2019 11:20:25 +0200
Received: from localhost (10.201.20.122) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 14 Oct 2019 11:20:24
 +0200
From:   Benjamin Gaignard <benjamin.gaignard@st.com>
To:     <mchehab@kernel.org>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <alexandre.torgue@st.com>, <yannick.fertre@st.com>,
        <philippe.cornu@st.com>, <hugues.fruchet@st.com>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: [PATCH v3] dt-bindings: media: Convert stm32 dcmi bindings to json-schema
Date:   Mon, 14 Oct 2019 11:20:21 +0200
Message-ID: <20191014092021.24020-2-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20191014092021.24020-1-benjamin.gaignard@st.com>
References: <20191014092021.24020-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.201.20.122]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-14_06:2019-10-10,2019-10-14 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert the STM32 dcmi binding to DT schema format using json-schema

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
changes in v3:
-use (GPL-2.0-only OR BSD-2-Clause) license

changes in v2:
- use BSD-2-Clause license
- remove useless dma descriptions
- fix clock property
- add additionalProperties: false
- fix reset indentation

 .../devicetree/bindings/media/st,stm32-dcmi.txt    | 45 -----------
 .../devicetree/bindings/media/st,stm32-dcmi.yaml   | 86 ++++++++++++++++++++++
 2 files changed, 86 insertions(+), 45 deletions(-)
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
index 000000000000..3fe778cb5cc3
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
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
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: mclk
+
+  dmas:
+    maxItems: 1
+
+  dma-names:
+    items:
+      - const: tx
+
+  resets:
+    maxItems: 1
+
+  port:
+    type: object
+    description:
+      DCMI supports a single port node with parallel bus. It should contain
+      one 'port' child node with child 'endpoint' node. Please refer to the
+      bindings defined in
+      Documentation/devicetree/bindings/media/video-interfaces.txt.
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
+additionalProperties: false
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

