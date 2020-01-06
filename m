Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FE3D13155E
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2020 16:51:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727020AbgAFPuz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jan 2020 10:50:55 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:33078 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726683AbgAFPuR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jan 2020 10:50:17 -0500
Received: by mail-lj1-f196.google.com with SMTP id y6so43370709lji.0
        for <linux-media@vger.kernel.org>; Mon, 06 Jan 2020 07:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/+dblA6Wy0tDMwHasv9xRaZyCud7/rwb9gx5/QrCftY=;
        b=LKjF/Z2x7BaM5oYy018MsZLuE3DY4Xdj4wALpx+CXzic9zxuyJSkM973+bW0LXZ7Jt
         iNAoxzCASRvEHUrn5pmPPwH5uPfi36WQcWWioTQvXH2lB1ahobp6SUbZXu1YhQtLTnvg
         egPsCM1ZtLSJfXQSBVl2HMOP1K+Viru0c8/fhVr/E4YhplS8/YHCT1VqGpPWE2BA2y6N
         ky4S+R23oHGHQ9E+xTWm6mftMg8MuLDRtzdLuDP28FV1YWg0SpN50w7GZgOD14tCT/P4
         E3ML/yezZxKOJudOEF20ZzHtedGvlG0bl5IiVcHh0a+ay/91DJJ6aPn1TLr8udQ44iHE
         RDjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/+dblA6Wy0tDMwHasv9xRaZyCud7/rwb9gx5/QrCftY=;
        b=puuQjJZ0x9vhN00HEl03P6uxneRq2MblkBiJkR7ucJnSWNe3XLK5mwZkT7NV38sGyJ
         gCsvLd8fxR9uLOMqCoirx/sEiDCNIPBZ4oEYp8rc2x6U9CGnfevV8O7Itcze4cEsAhfJ
         2Fa1DGEXt7PqxdBTn7v8pTknL/GsYyQJB8GyRav9xUs3D50LFzlR7WaAgSIgBP4u5FiJ
         XUEoZCkbebAg+QFcVBSOLN+fwkT3nbRC9YL/B/adsEGWLT7l9jps++oL25KUiGdj6n9T
         vHi3Q0USmWcXYPOe96gc2YVWgJEVaklMts28eb/Geu51wW+BhypYhYFoZT0y5rK8QFjo
         cgXA==
X-Gm-Message-State: APjAAAVcU+PKRfQJFzan2TfuBDaBsGqF+TG8/GT5nRMOLvwc+M8N6n55
        SGMIZ6QnBMh2rmSPeqMEra0Lz/z51ck=
X-Google-Smtp-Source: APXvYqxTqabEyznutx2Q7Gem5cLQGCFZQVURZpqpzJS7jK/BM63SY9X8gAYeOTTmIYzbwe4lXwKyVw==
X-Received: by 2002:a2e:9183:: with SMTP id f3mr22972214ljg.64.1578325815438;
        Mon, 06 Jan 2020 07:50:15 -0800 (PST)
Received: from localhost.localdomain ([37.157.136.193])
        by smtp.gmail.com with ESMTPSA id x84sm29388259lfa.97.2020.01.06.07.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 07:50:15 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>, dikshita@codeaurora.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v4 06/12] dt-bindings: media: venus: Convert msm8916 to DT schema
Date:   Mon,  6 Jan 2020 17:49:23 +0200
Message-Id: <20200106154929.4331-7-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200106154929.4331-1-stanimir.varbanov@linaro.org>
References: <20200106154929.4331-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert qcom,msm8916-venus Venus binding to DT schema

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 .../bindings/media/qcom,msm8916-venus.yaml    | 119 ++++++++++++++++++
 1 file changed, 119 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml b/Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml
new file mode 100644
index 000000000000..f9606df02d70
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml
@@ -0,0 +1,119 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/media/qcom,msm8916-venus.yaml#"
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
+    const: qcom,msm8916-venus
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: core
+      - const: iface
+      - const: bus
+
+  iommus:
+    maxItems: 1
+
+  memory-region:
+    maxItems: 1
+
+  video-decoder:
+    type: object
+
+    properties:
+      compatible:
+        const: "venus-decoder"
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
+        const: "venus-encoder"
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
+  - clocks
+  - clock-names
+  - iommus
+  - memory-region
+  - video-decoder
+  - video-encoder
+
+examples:
+  - |
+        #include <dt-bindings/interrupt-controller/arm-gic.h>
+        #include <dt-bindings/clock/qcom,gcc-msm8916.h>
+
+        video-codec@1d00000 {
+                compatible = "qcom,msm8916-venus";
+                reg = <0x01d00000 0xff000>;
+                interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+                clocks = <&gcc GCC_VENUS0_VCODEC0_CLK>,
+                        <&gcc GCC_VENUS0_AHB_CLK>,
+                        <&gcc GCC_VENUS0_AXI_CLK>;
+                clock-names = "core", "iface", "bus";
+                power-domains = <&gcc VENUS_GDSC>;
+                iommus = <&apps_iommu 5>;
+                memory-region = <&venus_mem>;
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
2.17.1

