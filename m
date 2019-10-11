Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 589E6D40B6
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2019 15:13:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728309AbfJKNMt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Oct 2019 09:12:49 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:46368 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727950AbfJKNMt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Oct 2019 09:12:49 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x9BD6HRY025650;
        Fri, 11 Oct 2019 15:12:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=PWduPs3pmXgoDQ3rhQPq+MwH5Bty4MTM7xJsS5IAIeM=;
 b=ejGC399U6Tnz8nmHJ9yJotwtZtlPXZUDPGRyrPGLzyYfIRdlGjCTsGimeyuXs77gDxoJ
 xdtGKejSWEYJnO3R7v2aue1+oP5r2/jPkyI9kAg+PkQB1QnAYthQTYH5uyvfKGTFAtSl
 ypSuaQ/92dVytI8/bJ9EzDWPljmexR+Pg+9agla8XHPMZfKJ4rt8rj8cBAYpdujAyqTe
 pZ2FJH68iPBc1eIJiQ6WZQayre4WZuuyOz13zNHW1AR5lK9dEmd94eOzLmLKftoqtszi
 jySfOAh//e2UM5L+fvw07VqRHEem7jpswLb2zrhdXKA77uN2NnjoIEKU69ZYDGKGZOH9 3g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2vej2ptd96-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 11 Oct 2019 15:12:38 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EBDFF10002A;
        Fri, 11 Oct 2019 15:12:37 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B8EF02BEC5E;
        Fri, 11 Oct 2019 15:12:37 +0200 (CEST)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 11 Oct
 2019 15:12:37 +0200
Received: from localhost (10.201.20.122) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 11 Oct 2019 15:12:37
 +0200
From:   Benjamin Gaignard <benjamin.gaignard@st.com>
To:     <mchehab@kernel.org>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <alexandre.torgue@st.com>, <hverkuil-cisco@xs4all.nl>,
        <hugues.fruchet@st.com>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: [PATCH v2] dt-bindings: media: Convert stm32 cec bindings to json-schema
Date:   Fri, 11 Oct 2019 15:12:33 +0200
Message-ID: <20191011131234.24290-1-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.201.20.122]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-11_08:2019-10-10,2019-10-11 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert the STM32 cec binding to DT schema format using json-schema

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
changes in v2:
- use BSD-2-Clause license
- add additionalProperties: false
- remove pinctrl-names and pinctrl-[0-9]

 .../devicetree/bindings/media/st,stm32-cec.txt     | 19 --------
 .../devicetree/bindings/media/st,stm32-cec.yaml    | 54 ++++++++++++++++++++++
 2 files changed, 54 insertions(+), 19 deletions(-)
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
index 000000000000..e3ff7b077ff6
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/st,stm32-cec.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: BSD-2-Clause
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
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
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

