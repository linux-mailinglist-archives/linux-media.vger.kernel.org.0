Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5159513155C
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2020 16:51:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727208AbgAFPuq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jan 2020 10:50:46 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:44865 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726767AbgAFPuV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jan 2020 10:50:21 -0500
Received: by mail-lj1-f194.google.com with SMTP id u71so51376906lje.11
        for <linux-media@vger.kernel.org>; Mon, 06 Jan 2020 07:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=qJRQqbxtU+g5xK/We/q06cYHmzIn2tLzDjx3jt0m0lc=;
        b=SwWyXdzIVboa4oz5pq9asgnlJ43rSiu4CmuNG3Is4ywORbuYnnJUUf44y61F2UDWnk
         xUAM0OeK/tKHrbU2fkeOnDswGXrTEDy7ZL/3TSEMJQimaoqnyvhA3vJTkOYj1ujYHpvH
         xYKYbcv1aV8HYg+fWSDftud6DTbJ3EjUpwL3o+1lWjV2N2Ol8BZuuPrEKdWV3xXQ3SV+
         wEyvj3Rex5g5x1LdTM0IGbC0FDIAAkuL9wu8UTPON/5MfbIzIB7naGcFMRuBo+IAGpdr
         ID54WhnWm/TFOWcY/iBbmACR+dHFhrAKsjXzmasTVv6E0VYXOPO9Bi/wK0KO1Sp04Hd1
         zgUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=qJRQqbxtU+g5xK/We/q06cYHmzIn2tLzDjx3jt0m0lc=;
        b=g8AvwkkOC8zBP/yCLMUISf4RQm/V/QiegiTOXxYpGLPlE2lRg6/knFYMMg5HoaSItv
         Q/E9Hun2DGtBy0QkGYsgkgJeF9LoSr3SqJvXsE/5L8/Jkjp7nlbUKlFyhEoMiaB3jhua
         ahKpxKmzsYS73Nbn9KF4f4S49mWi5HU3WkVvSn7w2saMrO+lRriW1ssJjpgfWsEejQSf
         C8GQWNJCputRvMNjhZV30Z9lgeyzfs586FZdfBmAnrSUAQpen344ODw2qGlX9kIMAkTZ
         lOTwG50Bvf1VxhJJ1vmQ4z4kcxvb8hAGgsUHVx+FgqyARBI+/X/V5tOBHhk+gxTZCczt
         IftQ==
X-Gm-Message-State: APjAAAWTQlLTPzJ4yPaEgpK5LXuYoYuYz2/cXfz9beF5WEc93sHjU8+l
        CYaBbLQNlwbIeOOinW1ixrnQQg==
X-Google-Smtp-Source: APXvYqwEqBo6XhdAmAqIVvPlC+H4ae4xFNAxoOJCGDw1SOvr1ow15WmxvJqY+UtNkfDmEg1mVV1sAw==
X-Received: by 2002:a2e:870b:: with SMTP id m11mr59228435lji.93.1578325819348;
        Mon, 06 Jan 2020 07:50:19 -0800 (PST)
Received: from localhost.localdomain ([37.157.136.193])
        by smtp.gmail.com with ESMTPSA id x84sm29388259lfa.97.2020.01.06.07.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 07:50:18 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>, dikshita@codeaurora.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v4 08/12] dt-bindings: media: venus: Convert sdm845 to DT schema
Date:   Mon,  6 Jan 2020 17:49:25 +0200
Message-Id: <20200106154929.4331-9-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200106154929.4331-1-stanimir.varbanov@linaro.org>
References: <20200106154929.4331-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert qcom,sdm845-venus Venus binding to DT schema.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 .../bindings/media/qcom,sdm845-venus.yaml     | 156 ++++++++++++++++++
 1 file changed, 156 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm845-venus.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sdm845-venus.yaml
new file mode 100644
index 000000000000..05cabe4e893a
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sdm845-venus.yaml
@@ -0,0 +1,156 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/media/qcom,sdm845-venus.yaml#"
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
+    const: qcom,sdm845-venus
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
+    maxItems: 2
+
+  memory-region:
+    maxItems: 1
+
+  video-core0:
+    type: object
+
+    properties:
+      compatible:
+        const: venus-decoder
+
+      clocks:
+        maxItems: 2
+
+      clock-names:
+        items:
+          - const: core
+          - const: bus
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
+  video-core1:
+    type: object
+
+    properties:
+      compatible:
+        const: venus-encoder
+
+      clocks:
+        maxItems: 2
+
+      clock-names:
+        items:
+          - const: core
+          - const: bus
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
+  - interrupts
+  - power-domains
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
+                compatible = "qcom,sdm845-venus";
+                reg = <0 0x0aa00000 0 0xff000>;
+                interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+                clocks = <&videocc VIDEO_CC_VENUS_CTL_CORE_CLK>,
+                         <&videocc VIDEO_CC_VENUS_AHB_CLK>,
+                         <&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>;
+                clock-names = "core", "iface", "bus";
+                power-domains = <&videocc VENUS_GDSC>;
+                iommus = <&apps_smmu 0x10a0 0x8>,
+                         <&apps_smmu 0x10b0 0x0>;
+                memory-region = <&venus_mem>;
+
+                video-core0 {
+                        compatible = "venus-decoder";
+                        clocks = <&videocc VIDEO_CC_VCODEC0_CORE_CLK>,
+                                 <&videocc VIDEO_CC_VCODEC0_AXI_CLK>;
+                        clock-names = "core", "bus";
+                        power-domains = <&videocc VCODEC0_GDSC>;
+                };
+
+                video-core1 {
+                        compatible = "venus-encoder";
+                        clocks = <&videocc VIDEO_CC_VCODEC1_CORE_CLK>,
+                                 <&videocc VIDEO_CC_VCODEC1_AXI_CLK>;
+                        clock-names = "core", "bus";
+                        power-domains = <&videocc VCODEC1_GDSC>;
+                };
+        };
-- 
2.17.1

