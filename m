Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 695B31276E1
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2019 09:00:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727277AbfLTIAe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Dec 2019 03:00:34 -0500
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:33528 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727197AbfLTIA2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Dec 2019 03:00:28 -0500
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 20 Dec 2019 13:30:23 +0530
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg01-blr.qualcomm.com with ESMTP; 20 Dec 2019 13:30:16 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id 296A3348A; Fri, 20 Dec 2019 13:30:15 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, vgarodia@codeaurora.org,
        Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH 2/3] dt-bindings: media: venus: Add sc7180 DT schema
Date:   Fri, 20 Dec 2019 13:29:19 +0530
Message-Id: <1576828760-13176-3-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1576828760-13176-1-git-send-email-dikshita@codeaurora.org>
References: <1576828760-13176-1-git-send-email-dikshita@codeaurora.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add new qcom,sc7180-venus DT binding schema.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
---
 .../bindings/media/qcom,venus-sc7180.yaml          | 131 +++++++++++++++++++++
 1 file changed, 131 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,venus-sc7180.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,venus-sc7180.yaml b/Documentation/devicetree/bindings/media/qcom,venus-sc7180.yaml
new file mode 100644
index 0000000..a609739
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,venus-sc7180.yaml
@@ -0,0 +1,131 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/media/qcom,venus-sc7180.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcomm Venus video encode and decode accelerators
+
+maintainers:
+  - Stanimir Varbanov <stanimir.varbanov@linaro.org>
+
+description: |
+  The Venus IP is a video encode and decode accelerator present
+  on Qualcomm platforms
+
+properties:
+  compatible:
+    enum:
+      - qcom,sc7180-venus
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 2
+
+  power-domain-names:
+    maxItems: 2
+    items:
+      - const: venus
+      - const: vcodec0
+
+  clocks:
+    maxItems: 5
+
+  clock-names:
+    maxItems: 5
+    items:
+      - const: core
+      - const: iface
+      - const: bus
+      - const: vcodec0_core
+      - const: vcodec0_bus
+
+  iommus:
+    minItems: 1
+    maxItems: 20
+
+  memory-region:
+    maxItems: 1
+
+  video-core0:
+    type: object
+
+    properties:
+      compatible:
+        const: "venus-decoder"
+
+    required:
+      - compatible
+
+  video-core1:
+    type: object
+
+    properties:
+      compatible:
+        const: "venus-encoder"
+
+    required:
+      - compatible
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
+        minItems: 1
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
+  - video-core0
+  - video-core1
+
+examples:
+  - |
+        #include <dt-bindings/interrupt-controller/arm-gic.h>
+        #include <dt-bindings/clock/qcom,videocc-sc7180.h>
+
+		venus: video-codec@aa00000 {
+			compatible = "qcom,sc7180-venus";
+			reg = <0 0x0aa00000 0 0xff000>;
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&videocc VENUS_GDSC>,
+					<&videocc VCODEC0_GDSC>;
+
+			power-domain-names = "venus", "vcodec0";
+			clocks = <&videocc VIDEO_CC_VENUS_CTL_CORE_CLK>,
+				<&videocc VIDEO_CC_VENUS_AHB_CLK>,
+				<&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>,
+				<&videocc VIDEO_CC_VCODEC0_CORE_CLK>,
+				<&videocc VIDEO_CC_VCODEC0_AXI_CLK>;
+			clock-names = "core", "iface", "bus",
+					"vcodec0_core", "vcodec0_bus";
+			iommus = <&apps_smmu 0x0C00 0x60>;
+			memory-region = <&venus_mem>;
+			video-core0 {
+					compatible = "venus-decoder";
+			};
+			video-core1 {
+					compatible = "venus-encoder";
+			};
+			video-firmware {
+					iommus = <&apps_smmu 0x0C42 0x0>;
+			};
+		};
-- 
1.9.1

