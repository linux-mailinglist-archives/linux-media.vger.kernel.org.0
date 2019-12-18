Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41CB2124845
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2019 14:25:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727380AbfLRNYi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Dec 2019 08:24:38 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:37337 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727378AbfLRNYP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Dec 2019 08:24:15 -0500
Received: by mail-lj1-f195.google.com with SMTP id u17so2125775lja.4
        for <linux-media@vger.kernel.org>; Wed, 18 Dec 2019 05:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=CITEx26ya518MBT0p0F7PP8DiduXDPXSSgjqESe9/eA=;
        b=HqqpQIYz08yRuwZxJa+FF3HZ+sKTzhV6q+LENhfdzGZPn+Tov0WvsgDJkKRkFGV49N
         kQWSqMx9DM5GnfkKAntAfBgAeTUICk+BslIpWw9byKAr3Kj9JyV0SLdHuoJqxUEozMu5
         FUgVYxCGGL1C0Wtoa8p6kIpeCZP3jCxu3ptDsrS5ObIln+GU4yiyfQaYJvLmpZ7KdKVe
         bN7OQjgFf2EM3NvejCPXNa6bkMXPQKd+uXNFuApsRkaA7DmDzywZCuWpJTQGjcI7ZYzY
         OCIyyN0LXc5efjPaFqsuTdEx+rz2HDIuWrtoTnScvjZF/nkT04ADMmYwgoupTV3oEmMO
         4j4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=CITEx26ya518MBT0p0F7PP8DiduXDPXSSgjqESe9/eA=;
        b=Hx5aaj1YEImPEZzALG4c4AmLwF28LN88IBjzzTGe4H6qwHbzVGlZc8YXZO96xb5R2U
         VV8KB0frSgnqJg3gyXmBYFQZbDwgvbmBlOW5t3+xgUVTVnhLQGTCtgv8PXgeZ9e8j0xI
         rqL4nrfgV09b8CqWJdgXrDa6TnrzF3fSpwjjBkBj1s10VEVjo/3XisqMoUMmU+L0kGz7
         kfo8Hc7Pa9gjksvmrRnzaikgfLKU4hlGPSqWmhliBbSaZGEpp86tOEU7ansHGZBZqXPP
         gni36zB9rnG4+QW1VNIswM+54d1z272ZAgAsIqn17hty3+fMViIyL3RbyQVzcumuPn5Z
         TEfg==
X-Gm-Message-State: APjAAAXPBMtx0lfKNjnqATnqyQuNOvLnPQkkuhJq6WNTeuJa2fuxShaQ
        1clhWIoxaH6Ity8yzxrBjVhT+A==
X-Google-Smtp-Source: APXvYqwlZZFinYNRqZOyePG5PluNOBy1O5Mvob+mLxlQUJ18lWEjnitzXVr6sN2m1B/AJIAmUttUWA==
X-Received: by 2002:a2e:9886:: with SMTP id b6mr1754928ljj.47.1576675453349;
        Wed, 18 Dec 2019 05:24:13 -0800 (PST)
Received: from localhost.localdomain ([37.157.136.193])
        by smtp.gmail.com with ESMTPSA id z7sm1440667lfa.81.2019.12.18.05.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 05:24:12 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>, dikshita@codeaurora.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 09/12] dt-bindings: media: venus: Add sdm845v2 DT schema
Date:   Wed, 18 Dec 2019 15:22:48 +0200
Message-Id: <20191218132251.24161-10-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191218132251.24161-1-stanimir.varbanov@linaro.org>
References: <20191218132251.24161-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add new qcom,sdm845-venus-v2 DT binding schema.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 .../bindings/media/qcom,venus-sdm845-v2.yaml  | 137 ++++++++++++++++++
 1 file changed, 137 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,venus-sdm845-v2.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,venus-sdm845-v2.yaml b/Documentation/devicetree/bindings/media/qcom,venus-sdm845-v2.yaml
new file mode 100644
index 000000000000..920cb05d17ce
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,venus-sdm845-v2.yaml
@@ -0,0 +1,137 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/media/qcom,venus-sdm845-v2.yaml#"
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
+      - qcom,sdm845-venus-v2
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 3
+
+  power-domain-names:
+    maxItems: 3
+    items:
+      - const: venus
+      - const: vcodec0
+      - const: vcodec1
+
+  clocks:
+    maxItems: 7
+
+  clock-names:
+    maxItems: 7
+    items:
+      - const: core
+      - const: iface
+      - const: bus
+      - const: vcodec0_core
+      - const: vcodec0_bus
+      - const: vcodec1_core
+      - const: vcodec1_bus
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
+        #include <dt-bindings/clock/qcom,videocc-sdm845.h>
+
+        video-codec@aa00000 {
+                compatible = "qcom,sdm845-venus-v2";
+                reg = <0 0x0aa00000 0 0xff000>;
+                interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+                clocks = <&videocc VIDEO_CC_VENUS_CTL_CORE_CLK>,
+                         <&videocc VIDEO_CC_VENUS_AHB_CLK>,
+                         <&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>,
+                         <&videocc VIDEO_CC_VCODEC0_CORE_CLK>,
+                         <&videocc VIDEO_CC_VCODEC0_AXI_CLK>,
+                         <&videocc VIDEO_CC_VCODEC1_CORE_CLK>,
+                         <&videocc VIDEO_CC_VCODEC1_AXI_CLK>;
+                clock-names = "core", "iface", "bus",
+                              "vcodec0_core", "vcodec0_bus",
+                              "vcodec1_core", "vcodec1_bus";
+                power-domains = <&videocc VENUS_GDSC>,
+                                <&videocc VCODEC0_GDSC>,
+                                <&videocc VCODEC1_GDSC>;
+                power-domain-names = "venus", "vcodec0", "vcodec1";
+                iommus = <&apps_smmu 0x10a0 0x8>,
+                         <&apps_smmu 0x10b0 0x0>;
+                memory-region = <&venus_mem>;
+
+                video-core0 {
+                        compatible = "venus-decoder";
+                };
+
+                video-core1 {
+                        compatible = "venus-encoder";
+                };
+        };
-- 
2.17.1

