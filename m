Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFC7D419390
	for <lists+linux-media@lfdr.de>; Mon, 27 Sep 2021 13:47:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234144AbhI0Lsk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Sep 2021 07:48:40 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:36562 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234037AbhI0Lsj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Sep 2021 07:48:39 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 27 Sep 2021 04:47:02 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 27 Sep 2021 04:47:00 -0700
X-QCInternal: smtphost
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg02-blr.qualcomm.com with ESMTP; 27 Sep 2021 17:16:44 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id C658121BAE; Mon, 27 Sep 2021 17:16:42 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mchehab@kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        vgarodia@codeaurora.org, stanimir.varbanov@linaro.org,
        Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH v4] dt-bindings: media: venus: Add sc7280 dt schema
Date:   Mon, 27 Sep 2021 17:16:37 +0530
Message-Id: <1632743197-32291-1-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a schema description for the venus video encoder/decoder on the sc7280.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
change since v3:
    Added missing dependency.

 .../bindings/media/qcom,sc7280-venus.yaml          | 160 +++++++++++++++++++++
 1 file changed, 160 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
new file mode 100644
index 0000000..12a42a0
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
@@ -0,0 +1,160 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/media/qcom,sc7280-venus.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcomm Venus video encode and decode accelerators
+
+maintainers:
+  - Stanimir Varbanov <stanimir.varbanov@linaro.org>
+
+description: |
+  The Venus Iris2 IP is a video encode and decode accelerator present
+  on Qualcomm platforms
+
+properties:
+  compatible:
+    const: qcom,sc7280-venus
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    minItems: 2
+    maxItems: 3
+
+  power-domain-names:
+    minItems: 2
+    maxItems: 3
+    items:
+      - const: venus
+      - const: vcodec0
+      - const: cx
+
+  clocks:
+    maxItems: 5
+
+  clock-names:
+    items:
+      - const: core
+      - const: bus
+      - const: iface
+      - const: vcodec_core
+      - const: vcodec_bus
+
+  iommus:
+    maxItems: 2
+
+  memory-region:
+    maxItems: 1
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: cpu-cfg
+      - const: video-mem
+
+  video-decoder:
+    type: object
+
+    properties:
+      compatible:
+        const: venus-decoder
+
+    required:
+      - compatible
+
+    additionalProperties: false
+
+  video-encoder:
+    type: object
+
+    properties:
+      compatible:
+        const: venus-encoder
+
+    required:
+      - compatible
+
+    additionalProperties: false
+
+  video-firmware:
+    type: object
+
+    description: |
+      Firmware subnode is needed when the platform does not
+      have TrustZone.
+
+    properties:
+      iommus:
+        maxItems: 1
+
+    required:
+      - iommus
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - power-domains
+  - power-domain-names
+  - clocks
+  - clock-names
+  - iommus
+  - memory-region
+  - video-decoder
+  - video-encoder
+
+additionalProperties: false
+
+examples:
+  - |
+        #include <dt-bindings/interrupt-controller/arm-gic.h>
+        #include <dt-bindings/clock/qcom,videocc-sc7280.h>
+
+        venus: video-codec@aa00000 {
+                compatible = "qcom,sc7280-venus";
+                reg = <0x0aa00000 0xd0600>;
+                interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+                clocks = <&videocc VIDEO_CC_MVSC_CORE_CLK>,
+                         <&videocc VIDEO_CC_MVSC_CTL_AXI_CLK>,
+                         <&videocc VIDEO_CC_VENUS_AHB_CLK>,
+                         <&videocc VIDEO_CC_MVS0_CORE_CLK>,
+                         <&videocc VIDEO_CC_MVS0_AXI_CLK>;
+                clock-names = "core", "bus", "iface",
+                              "vcodec_core", "vcodec_bus";
+
+                power-domains = <&videocc MVSC_GDSC>,
+                                <&videocc MVS0_GDSC>;
+                                <&rpmhpd SC7280_CX>;
+                power-domain-names = "venus", "vcodec0", "cx";
+
+                interconnects = <&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_VENUS_CFG 0>
+                                <&mmss_noc MASTER_VIDEO_P0 0 &mc_virt SLAVE_EBI1 0>;
+                interconnect-names = "cpu-cfg", "video-mem";
+
+                iommus = <&apps_smmu 0x2180 0x20>,
+                         <&apps_smmu 0x2184 0x20>;
+
+                memory-region = <&video_mem>;
+
+                video-decoder {
+                        compatible = "venus-decoder";
+                };
+
+                video-encoder {
+                        compatible = "venus-encoder";
+                };
+
+                video-firmware {
+                        iommus = <&apps_smmu 0x21a2 0x0>;
+                };
+        };
-- 
2.7.4

