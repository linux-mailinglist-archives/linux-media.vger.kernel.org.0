Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E27C12951E
	for <lists+linux-media@lfdr.de>; Mon, 23 Dec 2019 12:33:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727015AbfLWLdx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Dec 2019 06:33:53 -0500
Received: from mail-lj1-f169.google.com ([209.85.208.169]:44788 "EHLO
        mail-lj1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726954AbfLWLdw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Dec 2019 06:33:52 -0500
Received: by mail-lj1-f169.google.com with SMTP id u71so17404467lje.11
        for <linux-media@vger.kernel.org>; Mon, 23 Dec 2019 03:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=jkanxD20zHkGk3fihhvJoQvRjKe+QCxfIUzc4lNxBrk=;
        b=L1i18nvecldHa2M8xvd1KHs+F4+mRrL9Mhz/OTamE4p7N3xRkiUDwtZeUP4+yfhPZ3
         xf+IaoIjpyFT++N8BB/9k7gDDz0bcyLHFgJFU5Zt+bbtc/uDJjD7+X+1abPG87o3m8Qw
         8mHizWC2jY3EUxC4FOLNO1sAaLQTbH6bJnvoOG9hA+AQECHqgKtw0yXDPNidK/TtgHVK
         g9m/Ko4rvuK1Vdy9uyuNdvRcigeYQeyNclbd+uPO5Un/IaToFjlW503X79Mt7fxxTlFd
         5OYknwQw04TaIE39F4q8/+I8NmMvEb10B0mQeym2MYIL7lOUMUs5TRjnXnCy5xHliz/v
         LIkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=jkanxD20zHkGk3fihhvJoQvRjKe+QCxfIUzc4lNxBrk=;
        b=go9xJ+50juOWUdQp5pSYr2tZYCZfnSYe/CVJMT7xrBrhXnvGS5XA/kYX0jEnZqtMYK
         8YvfhbVI8aR1lCfJusBs2uBCQw9FIMtqOds1Nm0Pvnd8Y7bZhAJhBM/9Ho0gC6eqNTKC
         FUi+Y7ByXj8j/gkHunihmx8wLLb244kItdEIu9W1gBryOBm9Q8W9UWJDaZYsmGLzJbhu
         QU+Y15DuAxOb1eWrBH4jBm+k3LCEKRbGcjUBI47y+PlyEydiqj9Lbb5nwuTH53IJmVHB
         szOTaxx6/Qk89izwD1Ho65AyrzwraD0i9jBSbqkFWv4cVvLnni4+wsfet1xUy/Njyxmx
         9NiA==
X-Gm-Message-State: APjAAAWRCWz5oA5amuGFM9P6bsqinnqi3em7yDFzIbs3K3pnKArvt4Cj
        vRswwim1RlZ7h6Hho5duoHLbTw==
X-Google-Smtp-Source: APXvYqyhB2qoRG2RiNVNKlOO3YVMdcRa3nVnxf3Irg7qXnuD1HAf8jS2H1uBVFD9ZkHDN2I+r+IdCg==
X-Received: by 2002:a2e:b4cf:: with SMTP id r15mr17687359ljm.52.1577100830595;
        Mon, 23 Dec 2019 03:33:50 -0800 (PST)
Received: from localhost.localdomain ([37.157.136.193])
        by smtp.gmail.com with ESMTPSA id g15sm8381500ljk.8.2019.12.23.03.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2019 03:33:50 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>, dikshita@codeaurora.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v3 06/12] dt-bindings: media: venus: Convert msm8916 to DT schema
Date:   Mon, 23 Dec 2019 13:33:05 +0200
Message-Id: <20191223113311.20602-7-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191223113311.20602-1-stanimir.varbanov@linaro.org>
References: <20191223113311.20602-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert qcom,msm8916-venus Venus binding to DT schema

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 .../bindings/media/qcom,msm8916-venus.yaml    | 117 ++++++++++++++++++
 1 file changed, 117 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml b/Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml
new file mode 100644
index 000000000000..14331c16135c
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml
@@ -0,0 +1,117 @@
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
+    const: "qcom,msm8916-venus"
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

