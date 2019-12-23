Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3130C129524
	for <lists+linux-media@lfdr.de>; Mon, 23 Dec 2019 12:34:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727134AbfLWLeB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Dec 2019 06:34:01 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:43454 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727070AbfLWLeA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Dec 2019 06:34:00 -0500
Received: by mail-lf1-f68.google.com with SMTP id 9so12364517lfq.10
        for <linux-media@vger.kernel.org>; Mon, 23 Dec 2019 03:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=sBimMWrdiMS/SV7r+5Ho5hP1ycHxH3KojpEjAurdcyM=;
        b=mlSP65helcix43S4kYjoy7IdhCNeN6X9/Gzt8FHVW3rKKkYhTIulY3g7ghBKgjWRMH
         AEbecyq9sNCDK+1HqQIZacoEFrQeznI+7R6AZP/q/1h3Sd8MA4zy19eZdav30HJJQCsT
         aYBm5QG7VmFOWr99YH3rDW+Pk7PRRVlKCSDdu6hfDkDZanQPy6r31LKVEdjzVoLeMKGv
         Pha6gbPBA+uYnNNnVxzJqqkuryRXicySanGWQx/eRhGlBiHqeyWOWzoLLbIo+PcBlLJP
         P9gJWucyWOpfBMpwEojvR8XeRDrVsDxDwq4vYKF9ngo3JcTYf3EgJPCfG/b02bSvWYzn
         +ing==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=sBimMWrdiMS/SV7r+5Ho5hP1ycHxH3KojpEjAurdcyM=;
        b=OnxjkKlILvTj0lbQGeLi7DckmiQsrx+H7TO3eOE59UtVtb9fKm2qhp3BvSosiMuG/W
         dmvquRBnOSZZVca4uGc7sOCIHFyJ7Hd31bCI5qDHiYF2eRsCp+AuwxkSR4JnNFAG62zK
         tDS8fLdNUsxkCJYYaubDtDiTjJJO5hXbP8zk1jdAXy7Z7w/WHzJm8Vu0trWFSx3wjG1g
         49XBl+4OwM8BU3aDZ7k5ekQZFfSPHlqqHiltdT567PVSUpj0efClWWdmiTwtVghcqN4S
         alFGDfW8tyvUilWcOfcdd2iOwbN4JY8eC16UK3P9y3YrwB4hrlrbV88TCOVOmIbSyfd+
         63/A==
X-Gm-Message-State: APjAAAW5i5OKafi6ilepNQrC1n+piJo5t2XipZBBQ2CYS0wkzUAT2Q3K
        rOd1pp0E6LD0WliBT9foQ3SLNQ==
X-Google-Smtp-Source: APXvYqzNQeIlnqJ9Q58fzbaMBMbdzLjp1AzAkBXc7OZXrp63OsEZ2mdJs3uB3vl1oU8eUb4oaGFNhw==
X-Received: by 2002:ac2:531b:: with SMTP id c27mr16168656lfh.91.1577100837875;
        Mon, 23 Dec 2019 03:33:57 -0800 (PST)
Received: from localhost.localdomain ([37.157.136.193])
        by smtp.gmail.com with ESMTPSA id g15sm8381500ljk.8.2019.12.23.03.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2019 03:33:57 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>, dikshita@codeaurora.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v3 09/12] dt-bindings: media: venus: Add sdm845v2 DT schema
Date:   Mon, 23 Dec 2019 13:33:08 +0200
Message-Id: <20191223113311.20602-10-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191223113311.20602-1-stanimir.varbanov@linaro.org>
References: <20191223113311.20602-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add new qcom,sdm845-venus-v2 DT binding schema.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 .../bindings/media/qcom,sdm845-venus-v2.yaml  | 139 ++++++++++++++++++
 1 file changed, 139 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml b/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml
new file mode 100644
index 000000000000..d38d932d2722
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml
@@ -0,0 +1,139 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/media/qcom,sdm845-venus-v2.yaml#"
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
+    const: "qcom,sdm845-venus-v2"
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
+    additionalProperties: false
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

