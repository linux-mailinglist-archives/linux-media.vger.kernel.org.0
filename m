Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77551C8C7F
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 17:14:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726302AbfJBPOe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 11:14:34 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:15482 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725893AbfJBPOe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Oct 2019 11:14:34 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x92F12ig012973;
        Wed, 2 Oct 2019 17:14:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=D9QXght0DwmJBUs1ZMlBMXOpXnyjGQ9efsg+0K0ThWY=;
 b=oZdEpT2Y9rh7RZVyIa23ZtJ1m2Okzo/Cl04oHgAl/GtpF0pjVvcwlWKvp40JgDugmt8F
 LrtT+E656hQnFnMLvZnlRUjprlfgQ0PRc1imhFtosymApK76fb+I+nkFMw3g1WJLSYDQ
 peTtfzBFqHvoqeOiYBSKge4E2HfVRjNz2/4jJ6lD0A9nHhXB7e3dTojYnH1j8i7JDAWA
 uEC9HnrB2dgavZ5KEP0kMBXRrahXBV0LWchH6VtDnkej7mk2GoXN4yF9J51rqEvFl9SR
 4oqaE+9r4c1qhvS1Trgza4hDY6LdhNvTJ0+4n3M9B2nWNihaveoiEqcLs7TIf0qazONz tw== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
        by mx08-00178001.pphosted.com with ESMTP id 2v9vnafnuu-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Wed, 02 Oct 2019 17:14:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8990A22;
        Wed,  2 Oct 2019 15:14:19 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E08462D3761;
        Wed,  2 Oct 2019 17:14:18 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.92) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 2 Oct 2019
 17:14:18 +0200
Received: from localhost (10.201.20.122) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 2 Oct 2019 17:14:18
 +0200
From:   Benjamin Gaignard <benjamin.gaignard@st.com>
To:     <mchehab@kernel.org>, <robh+dt@kernel.org>,
        <alexandre.torgue@st.com>, <yannick.fertre@st.com>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: [PATCH] dt-bindings: media: Convert stm32 cec bindings to json-schema
Date:   Wed, 2 Oct 2019 17:14:10 +0200
Message-ID: <20191002151410.15306-1-benjamin.gaignard@st.com>
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

Convert the STM32 cec binding to DT schema format using json-schema

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 .../devicetree/bindings/media/st,stm32-cec.txt     | 19 --------
 .../devicetree/bindings/media/st,stm32-cec.yaml    | 57 ++++++++++++++++++++++
 2 files changed, 57 insertions(+), 19 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/st,stm32-cec.txt
 create mode 100644 Documentation/devicetree/bindings/media/st,stm32-cec.yaml

diff --git a/Documentation/devicetree/bindings/media/st,stm32-cec.txt b/Documentation/devicetree/bindings/media/st,stm32-cec.txt
deleted file mode 100644
index 6be2381c180d..000000000000
--- a/Documentation/devicetree/bindings/media/st,stm32-cec.txt
+++ /dev/null
@@ -1,19 +0,0 @@
-STMicroelectronics STM32 CEC driver
-
-Required properties:
- - compatible : value should be "st,stm32-cec"
- - reg : Physical base address of the IP registers and length of memory
-	 mapped region.
- - clocks : from common clock binding: handle to CEC clocks
- - clock-names : from common clock binding: must be "cec" and "hdmi-cec".
- - interrupts : CEC interrupt number to the CPU.
-
-Example for stm32f746:
-
-cec: cec@40006c00 {
-	compatible = "st,stm32-cec";
-	reg = <0x40006C00 0x400>;
-	interrupts = <94>;
-	clocks = <&rcc 0 STM32F7_APB1_CLOCK(CEC)>, <&rcc 1 CLK_HDMI_CEC>;
-	clock-names = "cec", "hdmi-cec";
-};
diff --git a/Documentation/devicetree/bindings/media/st,stm32-cec.yaml b/Documentation/devicetree/bindings/media/st,stm32-cec.yaml
new file mode 100644
index 000000000000..c99144107185
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/st,stm32-cec.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/st,stm32-cec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STM32 CEC bindings
+
+maintainers:
+  - Benjamin Gaignard <benjamin.gaignard@st.com>
+  - Yannick Fertre <yannick.fertre@st.com>
+
+properties:
+  compatible:
+    const: st,stm32-cec
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
+      - description: Bus Clock
+
+  clock-names:
+    items:
+      - const: cec
+      - const: hdmi-cec
+
+  pinctrl-names: true
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
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/stm32mp1-clks.h>
+    cec: cec@40006c00 {
+        compatible = "st,stm32-cec";
+        reg = <0x40006c00 0x400>;
+        interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&rcc CEC_K>, <&clk_lse>;
+        clock-names = "cec", "hdmi-cec";
+    };
+
+...
-- 
2.15.0

