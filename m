Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38F017BF5B4
	for <lists+linux-media@lfdr.de>; Tue, 10 Oct 2023 10:25:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442826AbjJJIZa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Oct 2023 04:25:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442811AbjJJIZZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Oct 2023 04:25:25 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 818BBFF;
        Tue, 10 Oct 2023 01:25:22 -0700 (PDT)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39A8Gg81016206;
        Tue, 10 Oct 2023 10:25:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding:content-type; s=
        selector1; bh=SgomDZ4n8rij0Ku1C1HWR5BqnMLcC05vUVKWOJcNk4M=; b=v2
        FBRLhhfMglbo0fZ+0dHx+ZeDKZj7iYF60Gotw9QZRfV8wZ653kkxPQVvUfTQvjjd
        nikLQvQxQTtPamSWv/1naGEX+PJEWNNpxN6aofeG9HO8keDRr741nwXjgo8Faar4
        qUtV87kAgtT5bA9h73rh2QBzhaEdvBkpqoFlKmHx9pPek3cXl54DnhPAeAalk39v
        yDquHHUyoXfY7PBh1xffGi3u/EOFpI/hanKpiLkEZgBs9ZJKnz9PnkfQ6Yga5uT8
        QBA+CktTVdxO0JB247LfrlOE8epYF9QX8ryQIxebQjV78FS3u6tDeeIYXH+Tel+J
        Vzgrj8oqRI7bbSR3trmg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3tkhf7gwcn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 10 Oct 2023 10:25:02 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6BA26100058;
        Tue, 10 Oct 2023 10:25:01 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 56F2C217B9A;
        Tue, 10 Oct 2023 10:25:01 +0200 (CEST)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 10 Oct
 2023 10:25:01 +0200
From:   Alain Volmat <alain.volmat@foss.st.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dan Scally <dan.scally@ideasonboard.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 1/5] dt-bindings: media: add bindings for stm32 dcmipp
Date:   Tue, 10 Oct 2023 10:24:01 +0200
Message-ID: <20231010082413.1717919-2-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231010082413.1717919-1-alain.volmat@foss.st.com>
References: <20231010082413.1717919-1-alain.volmat@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-10_04,2023-10-09_01,2023-05-22_02
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the yaml binding for the ST Microelectronics STM32 DCMIPP
(Digital Camera Memory Interface Pixel Processor)

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../bindings/media/st,stm32-dcmipp.yaml       | 89 +++++++++++++++++++
 1 file changed, 89 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml

diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml b/Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml
new file mode 100644
index 000000000000..87731f3ce7bd
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml
@@ -0,0 +1,89 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/st,stm32-dcmipp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STM32 DCMIPP Digital Camera Memory Interface Pixel Processor
+
+maintainers:
+  - Hugues Fruchet <hugues.fruchet@foss.st.com>
+  - Alain Volmat <alain.volmat@foss.st.com>
+
+properties:
+  compatible:
+    const: st,stm32mp13-dcmipp
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
+  resets:
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
+    description:
+      DCMIPP supports a single port node with parallel bus.
+
+    properties:
+      endpoint:
+        $ref: video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          bus-type:
+            enum: [5, 6]
+            default: 5
+
+          bus-width:
+            enum: [8, 10, 12, 14]
+            default: 8
+
+          pclk-sample: true
+          hsync-active: true
+          vsync-active: true
+
+        required:
+          - pclk-sample
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - resets
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/stm32mp13-clks.h>
+    #include <dt-bindings/reset/stm32mp13-resets.h>
+    dcmipp@5a000000 {
+        compatible = "st,stm32mp13-dcmipp";
+        reg = <0x5a000000 0x400>;
+        interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
+        resets = <&rcc DCMIPP_R>;
+        clocks = <&rcc DCMIPP_K>;
+
+        port {
+             endpoint {
+                   remote-endpoint = <&mipid02_2>;
+                   bus-width = <8>;
+                   hsync-active = <0>;
+                   vsync-active = <0>;
+                   pclk-sample = <0>;
+             };
+        };
+    };
+
+...
-- 
2.25.1

