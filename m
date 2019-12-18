Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 163DC124831
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2019 14:25:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727360AbfLRNYN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Dec 2019 08:24:13 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:33667 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727313AbfLRNYK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Dec 2019 08:24:10 -0500
Received: by mail-lj1-f195.google.com with SMTP id p8so2151065ljg.0
        for <linux-media@vger.kernel.org>; Wed, 18 Dec 2019 05:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=elchFhZaQqCljObbrVWX5gAwlUOkHif5wtGb7OTNVrQ=;
        b=Sd9/Owv7c4QCll0EOO34jDhL1TvjTR3zg7RdBLhRq2l9YNY56Z+nkVsfGhAhPnTr6W
         kXP2Qpq3mdlhErLzCofHRUpBbfac4KpS4c9LIe3R98MVHNJajyGzDZkrQrJMvb78uhqH
         xi3PG1w3+dH1997lQCiCT4GEf/4WgV84185mRRfolgRVgTgZWEunmprO17CqINodLAKC
         8orR+BZQHIyN6J9tLaUChiggcnED4oLFTZ+6g0AF+RFlLxX5ND9kjKhmDX81y27rjsBu
         V+CNNTZT7nWL8o7OhwUQJ/4zP7XhgwA0RFdsiIUo8WsskKxMSB24ZC46t1K7EiHXeWyF
         57qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=elchFhZaQqCljObbrVWX5gAwlUOkHif5wtGb7OTNVrQ=;
        b=paUnYU5Y2dI6wOz2E8Xyy0Rue6XYXdvy0tzqkXV8cGqrAjI7c7OEAxoOFIjHZnsVkm
         Lp+dlM9fRuB9PZp3MrCsMcxTI9uhHwDvScZGQTyW+d3CT+xMnO+Wi0BdFOCUg4xZ2gk4
         Av69jVpRTRBb0k03659VLevWS//AOWu7dWV8sqKiEkNGnPYD+yzb/h3hoLug1wLzfzHx
         CB/Qg0Z02nWAWS+QgJTRDJCdN4rha9wtKHnFFA5Dqxxty7R2xVbPXxp8wOIoHLdSmNmc
         f6lZf0iN3iLxWhFw51/0xaqm6V4fxAVEA+JA2vV66anxjtbh2ghJdhiKlkvrYNn1MvIi
         KMEg==
X-Gm-Message-State: APjAAAVyEGX5mV5RoBquv5jVhZGyNtbW3pBFUv4Me3EgAwru2iNXUHbH
        R+a1JRJjtSYr5uHBLFi+Omga1g==
X-Google-Smtp-Source: APXvYqw/YpsnLKoxW7oc20j6FpIPNJ9NW1Ga9H1UzJFPdm9s3pixEKWCujufRKB2Qa/5Kms1jd5eDg==
X-Received: by 2002:a2e:999a:: with SMTP id w26mr1783354lji.142.1576675447780;
        Wed, 18 Dec 2019 05:24:07 -0800 (PST)
Received: from localhost.localdomain ([37.157.136.193])
        by smtp.gmail.com with ESMTPSA id z7sm1440667lfa.81.2019.12.18.05.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 05:24:07 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>, dikshita@codeaurora.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 06/12] dt-bindings: media: venus: Convert msm8916 to DT schema
Date:   Wed, 18 Dec 2019 15:22:45 +0200
Message-Id: <20191218132251.24161-7-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191218132251.24161-1-stanimir.varbanov@linaro.org>
References: <20191218132251.24161-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert qcom,msm8916-venus Venus binding to DT schema

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 .../bindings/media/qcom,venus-msm8916.yaml    | 115 ++++++++++++++++++
 1 file changed, 115 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,venus-msm8916.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,venus-msm8916.yaml b/Documentation/devicetree/bindings/media/qcom,venus-msm8916.yaml
new file mode 100644
index 000000000000..f82a8d968202
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,venus-msm8916.yaml
@@ -0,0 +1,115 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/media/qcom,venus-msm8916.yaml#"
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
+      - qcom,msm8916-venus
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
+    maxItems: 3
+    items:
+      - const: core
+      - const: iface
+      - const: bus
+
+  iommus:
+    minItems: 1
+    maxItems: 20
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

