Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E7EC2F84D6
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 19:55:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387894AbhAOSxy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 13:53:54 -0500
Received: from relay01.th.seeweb.it ([5.144.164.162]:43021 "EHLO
        relay01.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387841AbhAOSxw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 13:53:52 -0500
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 68F691F67F;
        Fri, 15 Jan 2021 19:52:54 +0100 (CET)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     stanimir.varbanov@linaro.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, phone-devel@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH 2/2] media: dt-bindings: media: venus: Add sdm660 DT schema
Date:   Fri, 15 Jan 2021 19:52:52 +0100
Message-Id: <20210115185252.333562-3-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210115185252.333562-1-angelogioacchino.delregno@somainline.org>
References: <20210115185252.333562-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add new qcom,sdm660-venus DT binding schema.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 .../bindings/media/qcom,sdm660-venus.yaml     | 164 ++++++++++++++++++
 1 file changed, 164 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm660-venus.yaml

base-commit: 012bd807cf654b992cdc4db7eab85c1e95f9d571
prerequisite-patch-id: 734bdefdb043a8f91a48916246cc9a36fb5966e5
prerequisite-patch-id: 999517c02973237996492a41ed5bfc2990083932
prerequisite-patch-id: a48910425fac61948a7a26bec4d40d63e3368569
prerequisite-patch-id: b1a1a4216eed0d04dd16e6e8e1053dee185d06d8
prerequisite-patch-id: dff12be2631cc21ef1c3c930fba49d979f5055fe

diff --git a/Documentation/devicetree/bindings/media/qcom,sdm660-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sdm660-venus.yaml
new file mode 100644
index 000000000000..e7568d4007af
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sdm660-venus.yaml
@@ -0,0 +1,164 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/media/qcom,sdm660-venus.yaml#"
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
+    const: qcom,sdm660-venus
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 5
+
+  clock-names:
+    items:
+      - const: core
+      - const: iface
+      - const: bus
+      - const: bus_throttle
+      - const: vcodec0_core
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: video-mem
+      - const: cpu-cfg
+
+  iommus:
+    maxItems: 20
+
+  memory-region:
+    maxItems: 1
+
+  power-domains:
+    minItems: 3
+
+  power-domain-names:
+    items:
+      - const: cx
+      - const: vcodec0
+      - const: venus
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
+        maxItems: 2
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
+        #include <dt-bindings/clock/qcom,mmcc-sdm660.h>
+        #include <dt-bindings/power/qcom-rpmpd.h>
+
+        video-codec@cc00000 {
+                compatible = "qcom,sdm660-venus";
+                reg = <0x0cc00000 0xff000>;
+                interrupts = <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
+                power-domains = <&rpmpd SDM660_VDDCX>,
+                                <&mmcc VENUS_CORE0_GDSC>,
+                                <&mmcc VENUS_GDSC>;
+                power-domain-names = "cx", "vcodec0", "venus";
+                clocks = <&mmcc VIDEO_CORE_CLK>,
+                         <&mmcc VIDEO_AHB_CLK>,
+                         <&mmcc VIDEO_AXI_CLK>,
+                         <&mmcc THROTTLE_VIDEO_AXI_CLK>,
+                         <&mmcc VIDEO_SUBCORE0_CLK>;
+                clock-names = "core", "iface", "bus", "bus_throttle",
+                              "vcodec0_core";
+                iommus = <&mmss_smmu 0x400>,
+                         <&mmss_smmu 0x401>,
+                         <&mmss_smmu 0x40a>,
+                         <&mmss_smmu 0x407>,
+                         <&mmss_smmu 0x40e>,
+                         <&mmss_smmu 0x40f>,
+                         <&mmss_smmu 0x408>,
+                         <&mmss_smmu 0x409>,
+                         <&mmss_smmu 0x40b>,
+                         <&mmss_smmu 0x40c>,
+                         <&mmss_smmu 0x40d>,
+                         <&mmss_smmu 0x410>,
+                         <&mmss_smmu 0x421>,
+                         <&mmss_smmu 0x428>,
+                         <&mmss_smmu 0x429>,
+                         <&mmss_smmu 0x42b>,
+                         <&mmss_smmu 0x42c>,
+                         <&mmss_smmu 0x42d>,
+                         <&mmss_smmu 0x411>,
+                         <&mmss_smmu 0x431>;
+                memory-region = <&venus_region>;
+
+                video-decoder {
+                        compatible = "venus-decoder";
+                };
+
+                video-encoder {
+                        compatible = "venus-encoder";
+                };
+        };
-- 
2.29.2

