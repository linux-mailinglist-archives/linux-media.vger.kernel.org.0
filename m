Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E040776B07E
	for <lists+linux-media@lfdr.de>; Tue,  1 Aug 2023 12:10:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233871AbjHAKKz convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 1 Aug 2023 06:10:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233830AbjHAKKn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Aug 2023 06:10:43 -0400
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com [61.152.239.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FF6DF1;
        Tue,  1 Aug 2023 03:10:40 -0700 (PDT)
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
        (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
        by fd01.gateway.ufhost.com (Postfix) with ESMTP id BDD158086;
        Tue,  1 Aug 2023 18:10:33 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 1 Aug
 2023 18:10:33 +0800
Received: from xiaofei.localdomain (180.164.60.184) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 1 Aug
 2023 18:10:33 +0800
From:   Keith Zhao <keith.zhao@starfivetech.com>
To:     <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>
CC:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        "Rob Herring" <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Emil Renner Berthing" <kernel@esmil.dk>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        <christian.koenig@amd.com>, Bjorn Andersson <andersson@kernel.org>,
        "Heiko Stuebner" <heiko@sntech.de>,
        Shawn Guo <shawnguo@kernel.org>, Jagan Teki <jagan@edgeble.ai>,
        Chris Morgan <macromorgan@hotmail.com>,
        Keith Zhao <keith.zhao@starfivetech.com>,
        Jack Zhu <jack.zhu@starfivetech.com>,
        Shengyang Chen <shengyang.chen@starfivetech.com>,
        Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v1 v1 2/7] dt-bindings: display: Add yamls for JH7110 display system
Date:   Tue, 1 Aug 2023 18:10:25 +0800
Message-ID: <20230801101030.2040-3-keith.zhao@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230801101030.2040-1-keith.zhao@starfivetech.com>
References: <20230801101030.2040-1-keith.zhao@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [180.164.60.184]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

StarFive SoCs JH7110 display system:
lcd-controller bases verisilicon dc8200 IP,
and hdmi bases Innosilicon IP.
Add bindings for them.

Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
---
 .../starfive/starfive,display-subsystem.yaml  |  41 +++++++
 .../starfive/starfive,jh7110-dc8200.yaml      | 107 ++++++++++++++++++
 .../starfive/starfive,jh7110-inno-hdmi.yaml   |  92 +++++++++++++++
 3 files changed, 240 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/starfive/starfive,display-subsystem.yaml
 create mode 100644 Documentation/devicetree/bindings/display/starfive/starfive,jh7110-dc8200.yaml
 create mode 100644 Documentation/devicetree/bindings/display/starfive/starfive,jh7110-inno-hdmi.yaml

diff --git a/Documentation/devicetree/bindings/display/starfive/starfive,display-subsystem.yaml b/Documentation/devicetree/bindings/display/starfive/starfive,display-subsystem.yaml
new file mode 100644
index 000000000..86018a8e6
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/starfive/starfive,display-subsystem.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/starfive/starfive,display-subsystem.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Starfive DRM master device
+
+maintainers:
+  - Keith Zhao <keith.zhao@starfivetech.com>
+  - ShengYang Chen <shengyang.chen@starfivetech.com>
+
+description:
+  The Starfive DRM master device is a virtual device needed to list all
+  display controller or other display interface nodes that comprise the
+  graphics subsystem.
+
+properties:
+  compatible:
+    const: starfive,display-subsystem
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description: |
+      Should contain a list of phandles pointing to display interface ports
+      of display controller devices. Display controller definitions as defined
+      in Documentation/devicetree/bindings/display/starfive/
+      starfive,jh7110-dc8200.yaml
+
+required:
+  - compatible
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    display-subsystem {
+        compatible = "starfive,display-subsystem";
+        ports = <&dc_out>;
+    };
diff --git a/Documentation/devicetree/bindings/display/starfive/starfive,jh7110-dc8200.yaml b/Documentation/devicetree/bindings/display/starfive/starfive,jh7110-dc8200.yaml
new file mode 100644
index 000000000..bebe2050c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/starfive/starfive,jh7110-dc8200.yaml
@@ -0,0 +1,107 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/starfive/starfive,jh7110-dc8200.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive display controller
+
+description:
+  The StarFive SoC uses the display controller based on Verisilicon IP
+  to transfer the image data from a video memory
+  buffer to an external LCD interface.
+
+maintainers:
+  - Keith Zhao <keith.zhao@starfivetech.com>
+
+properties:
+  compatible:
+    const: starfive,jh7110-dc8200
+
+  reg:
+    maxItems: 3
+
+  interrupts:
+    items:
+      - description: The interrupt will be generated when DC finish one frame
+
+  clocks:
+    items:
+      - description: Clock for display system noc bus.
+      - description: Pixel clock for display channel 0.
+      - description: Pixel clock for display channel 1.
+      - description: Clock for axi interface of display controller.
+      - description: Core clock for display controller.
+      - description: Clock for ahb interface of display controller.
+      - description: External HDMI pixel clock.
+      - description: Parent clock for pixel clock
+
+  clock-names:
+    items:
+      - const: vout_noc_disp
+      - const: vout_pix0
+      - const: vout_pix1
+      - const: vout_axi
+      - const: vout_core
+      - const: vout_vout_ahb
+      - const: hdmitx0_pixel
+      - const: vout_dc8200
+
+  resets:
+    items:
+      - description: Reset for axi interface of display controller.
+      - description: Reset for ahb interface of display controller.
+      - description: Core reset of display controller.
+
+  reset-names:
+    items:
+      - const: vout_axi
+      - const: vout_ahb
+      - const: vout_core
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      A port node with endpoint definitions as defined in
+      Documentation/devicetree/bindings/media/video-interfaces.txt.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    dc8200: lcd-controller@29400000 {
+        compatible = "starfive,jh7110-dc8200";
+        reg = <0x29400000 0x100>, <0x29400800 0x2000>, <0x295b0000 0x90>;
+        interrupts = <95>;
+        clocks = <&syscrg 60>,
+               <&voutcrg 7>,
+               <&voutcrg 8>,
+               <&voutcrg 4>,
+               <&voutcrg 5>,
+               <&voutcrg 6>,
+               <&hdmitx0_pixelclk>,
+               <&voutcrg 1>;
+        clock-names = "vout_noc_disp", "vout_pix0", "vout_pix1",
+                      "vout_axi", "vout_core", "vout_vout_ahb",
+                      "hdmitx0_pixel","vout_dc8200";
+        resets = <&voutcrg 0>, <&voutcrg 1>, <&voutcrg 2>;
+        reset-names = "vout_axi", "vout_ahb", "vout_core";
+        dc_out: port {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            dc_out_hdmi: endpoint@0 {
+                reg = <0>;
+                remote-endpoint = <&hdmi_in_dc>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/display/starfive/starfive,jh7110-inno-hdmi.yaml b/Documentation/devicetree/bindings/display/starfive/starfive,jh7110-inno-hdmi.yaml
new file mode 100644
index 000000000..f6927acf6
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/starfive/starfive,jh7110-inno-hdmi.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/starfive/starfive,jh7110-inno-hdmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Starfive JH7110 HDMI controller
+
+description:
+  The StarFive JH7110 SoC uses the HDMI signal transmiter based on innosilicon IP
+  to generate HDMI signal from its input and transmit the signal to the screen.
+
+maintainers:
+  - Keith Zhao <keith.zhao@starfivetech.com>
+
+properties:
+  compatible:
+    const: "starfive,jh7110-inno-hdmi"
+
+  reg:
+    minItems: 1
+
+  interrupts:
+    items:
+      - description: The HDMI hot plug detection interrupt.
+
+  clocks:
+    items:
+      - description: System clock of HDMI module.
+      - description: Mclk clock of HDMI audio.
+      - description: Bclk clock of HDMI audio.
+      - description: Pixel clock generated by HDMI module.
+
+  clock-names:
+    items:
+      - const: sysclk
+      - const: mclk
+      - const: bclk
+      - const: pclk
+
+  resets:
+    items:
+      - description: Reset for HDMI module.
+
+  reset-names:
+    items:
+      - const: hdmi_tx
+
+  '#sound-dai-cells':
+    const: 0
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      Should contain a remote endpoint phandle of display controller device.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - '#sound-dai-cells'
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    hdmi: hdmi@29590000 {
+        compatible = "starfive,jh7110-inno-hdmi";
+        reg = <0x29590000 0x4000>;
+        interrupts = <99>;
+        clocks = <&voutcrg 17>,
+               <&voutcrg 15>,
+               <&voutcrg 16>,
+               <&hdmitx0_pixelclk>;
+        clock-names = "sysclk", "mclk","bclk","pclk";
+        resets = <&voutcrg 9>;
+        reset-names = "hdmi_tx";
+        #sound-dai-cells = <0>;
+        hdmi_in: port {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            hdmi_in_dc: endpoint@0 {
+                reg = <0>;
+                remote-endpoint = <&dc_out_hdmi>;
+            };
+        };
+    };
-- 
2.34.1

