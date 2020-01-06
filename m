Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E9C613154B
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2020 16:50:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726836AbgAFPuV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jan 2020 10:50:21 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42292 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727161AbgAFPuU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jan 2020 10:50:20 -0500
Received: by mail-lj1-f195.google.com with SMTP id y4so37037744ljj.9
        for <linux-media@vger.kernel.org>; Mon, 06 Jan 2020 07:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=bwAT2XWcUWTIAz8ovsKA2zMF8ldaoI73jdUGsE0/j7I=;
        b=ISEN+ljul5zbwEs37aMK7qGdMjDfHDaHyakglYuS0czKpb1pi83R/4dNAChWgp1ZTQ
         HI+gOII1eVo35iHxXLz225Fs/5L8sTyuLI0fZLTShiuqdrTeFRWZqjUM0naIrt4Gq+kY
         LGOJLUQggMt65g7RLc7WYEzhHDTi0dr/6YEE9AUh9II69aISX160tReVOIdlFinkUhE2
         oAJSEm1VBuu4jMYw944VHkKcUGT8WzuyYVFBYeLk6Q6PCcUebld+t1fDDbcemMM2cPTH
         cHS8TbjY1CGf9Cih9GwVr7A+wlNGRnshwBR2PApsu/X2kUcXu4Ux9qnZcBEenCOFx7lQ
         5rmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=bwAT2XWcUWTIAz8ovsKA2zMF8ldaoI73jdUGsE0/j7I=;
        b=BXXAJJmzC9+H+CaDV5nukkA+d/4MPOx0aZlODB1PWiKXQJ+M5UVkDsNaycWGBLqsmb
         od0XwzjB2di0ysp+qBqjNkgG4A6+VxvJfwFInlUOXcAYCjtaxfDAMBlZM+P1RhYaKldo
         0Gi1R+hTYgS094HdgprMxIU0grmAvikpFFR9kvmB+5nHFwDXxycJGvJFM89UMAWs3s63
         7qyRui8QmvwOzaDyG7uTGLi0V8ln/Peh5amXc+YLvWdHilzGRl8BXR3aMslGLJRe8fce
         WX5LIfWntN/LP3V32yB595J/cEbV/lQW3tDhFGryGz7BcGHvLj4gT5iqJwga/9LAGzOK
         WnjQ==
X-Gm-Message-State: APjAAAWLynPL5sMeJNX4INi1bFwTWO/83TefC26qcZVmLeEDepmwdhQy
        1xnqWqRDQB7keU7K/1BpmC8JYQ==
X-Google-Smtp-Source: APXvYqyfN/Txlv5OTSZXcQJltcuohomKJz0luNwo/dCj7iu5oNleIUxXbdzW6ldd4Sou6eeBxAQORg==
X-Received: by 2002:a2e:81d0:: with SMTP id s16mr57815026ljg.166.1578325817404;
        Mon, 06 Jan 2020 07:50:17 -0800 (PST)
Received: from localhost.localdomain ([37.157.136.193])
        by smtp.gmail.com with ESMTPSA id x84sm29388259lfa.97.2020.01.06.07.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 07:50:16 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>, dikshita@codeaurora.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v4 07/12] dt-bindings: media: venus: Convert msm8996 to DT schema
Date:   Mon,  6 Jan 2020 17:49:24 +0200
Message-Id: <20200106154929.4331-8-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200106154929.4331-1-stanimir.varbanov@linaro.org>
References: <20200106154929.4331-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert qcom,msm8996-venus Venus binding to DT schema.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 .../bindings/media/qcom,msm8996-venus.yaml    | 153 ++++++++++++++++++
 1 file changed, 153 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml b/Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml
new file mode 100644
index 000000000000..3d42fa83d31b
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml
@@ -0,0 +1,153 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/media/qcom,msm8996-venus.yaml#"
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
+    const: qcom,msm8996-venus
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
+    maxItems: 4
+
+  clock-names:
+    items:
+      - const: core
+      - const: iface
+      - const: bus
+      - const: mbus
+
+  iommus:
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
+        const: venus-decoder
+
+      clocks:
+        maxItems: 1
+
+      clock-names:
+        items:
+          - const: core
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
+          - const: core
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
+  - video-decoder
+  - video-encoder
+
+examples:
+  - |
+        #include <dt-bindings/interrupt-controller/arm-gic.h>
+        #include <dt-bindings/clock/qcom,mmcc-msm8996.h>
+
+        video-codec@c00000 {
+                compatible = "qcom,msm8996-venus";
+                reg = <0x00c00000 0xff000>;
+                interrupts = <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
+                clocks = <&mmcc VIDEO_CORE_CLK>,
+                         <&mmcc VIDEO_AHB_CLK>,
+                         <&mmcc VIDEO_AXI_CLK>,
+                         <&mmcc VIDEO_MAXI_CLK>;
+                clock-names = "core", "iface", "bus", "mbus";
+                power-domains = <&mmcc VENUS_GDSC>;
+                iommus = <&iommu 0>;
+                memory-region = <&venus_mem>;
+
+                video-decoder {
+                        compatible = "venus-decoder";
+                        clocks = <&mmcc VIDEO_SUBCORE0_CLK>;
+                        clock-names = "core";
+                        power-domains = <&mmcc VENUS_CORE0_GDSC>;
+                };
+
+                video-encoder {
+                        compatible = "venus-encoder";
+                        clocks = <&mmcc VIDEO_SUBCORE1_CLK>;
+                        clock-names = "core";
+                        power-domains = <&mmcc VENUS_CORE1_GDSC>;
+                };
+        };
-- 
2.17.1

