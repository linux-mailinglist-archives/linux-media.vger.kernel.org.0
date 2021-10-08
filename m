Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D5D44267A1
	for <lists+linux-media@lfdr.de>; Fri,  8 Oct 2021 12:21:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239812AbhJHKXV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Oct 2021 06:23:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239811AbhJHKXU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Oct 2021 06:23:20 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C02EEC061570;
        Fri,  8 Oct 2021 03:21:24 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: kholk11)
        with ESMTPSA id 264021F4575D
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, stanimir.varbanov@linaro.org,
        mchehab@kernel.org, robh+dt@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 1/3] dt-bindings: media: venus: Add sdm660 dt schema
Date:   Fri,  8 Oct 2021 12:21:17 +0200
Message-Id: <20211008102119.268869-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a schema description for the Venus video decoder/encoder IP
in SDM660.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/media/qcom,sdm660-venus.yaml     | 186 ++++++++++++++++++
 1 file changed, 186 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm660-venus.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,sdm660-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sdm660-venus.yaml
new file mode 100644
index 000000000000..33da7d3cfd38
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sdm660-venus.yaml
@@ -0,0 +1,186 @@
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
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
+  clocks:
+    maxItems: 4
+
+  clock-names:
+    items:
+      - const: core
+      - const: iface
+      - const: bus
+      - const: bus_throttle
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: cpu-cfg
+      - const: video-mem
+
+  interrupts:
+    maxItems: 1
+
+  iommus:
+    maxItems: 20
+
+  memory-region:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  video-decoder:
+    type: object
+
+    properties:
+      compatible:
+        const: venus-decoder
+
+      clocks:
+        maxItems: 1
+
+      clock-names:
+        items:
+          - const: vcodec0_core
+
+      power-domains:
+        maxItems: 1
+
+    required:
+      - compatible
+      - clocks
+      - clock-names
+      - power-domains
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
+      clocks:
+        maxItems: 1
+
+      clock-names:
+        items:
+          - const: vcodec0_core
+
+      power-domains:
+        maxItems: 1
+
+    required:
+      - compatible
+      - clocks
+      - clock-names
+      - power-domains
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
+  - clocks
+  - clock-names
+  - interrupts
+  - iommus
+  - memory-region
+  - power-domains
+  - video-decoder
+  - video-encoder
+
+additionalProperties: false
+
+examples:
+  - |
+        #include <dt-bindings/clock/qcom,mmcc-sdm660.h>
+        #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+        video-codec@cc00000 {
+                compatible = "qcom,sdm660-venus";
+                reg = <0x0cc00000 0xff000>;
+                clocks = <&mmcc VIDEO_CORE_CLK>,
+                         <&mmcc VIDEO_AHB_CLK>,
+                         <&mmcc VIDEO_AXI_CLK>,
+                         <&mmcc THROTTLE_VIDEO_AXI_CLK>;
+                clock-names = "core", "iface", "bus", "bus_throttle";
+                interconnects = <&gnoc 0 &mnoc 13>,
+                                <&mnoc 4 &bimc 5>;
+                interconnect-names = "cpu-cfg", "video-mem";
+                interrupts = <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
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
+                power-domains = <&mmcc VENUS_GDSC>;
+
+                video-decoder {
+                        compatible = "venus-decoder";
+                        clocks = <&mmcc VIDEO_SUBCORE0_CLK>;
+                        clock-names = "vcodec0_core";
+                        power-domains = <&mmcc VENUS_CORE0_GDSC>;
+                };
+
+                video-encoder {
+                        compatible = "venus-encoder";
+                        clocks = <&mmcc VIDEO_SUBCORE0_CLK>;
+                        clock-names = "vcodec0_core";
+                        power-domains = <&mmcc VENUS_CORE0_GDSC>;
+                };
+        };
-- 
2.33.0

