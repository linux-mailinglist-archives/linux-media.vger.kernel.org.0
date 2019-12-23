Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F8BE12951F
	for <lists+linux-media@lfdr.de>; Mon, 23 Dec 2019 12:33:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727029AbfLWLdz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Dec 2019 06:33:55 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:38349 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727007AbfLWLdz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Dec 2019 06:33:55 -0500
Received: by mail-lj1-f195.google.com with SMTP id k8so17404841ljh.5
        for <linux-media@vger.kernel.org>; Mon, 23 Dec 2019 03:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=H9oZQbNnPKg04bTmHZzlCtfyOoPK++pS7U+3W7/mSLw=;
        b=pxbvWXpEMT6dOlVLN8Q0xT9fFnWN7z/CHLpSnCDRV1VI4aucc64DFyiAkqV935Z5ci
         1iZNw8sDc0VcubAeXhjWVIYglMTzbpOHju7v55qS30jnTKMvz3iIC/jt2NoI2C3oiMbB
         ABNeuncbRKPokgAW1p6Nh5dyY0glsGr2oBpI7SNXw6r1wTlNNPZbmXYzMN/dJArLiF1R
         CtG8OaK8KX9pDhQ3MGXJlHzIDroQulkbfzSOM81YhBtHov0dl/MdTYYCt0+BjD9+kogo
         r0hf2uhnuFoS6TZ0LnqmmlmSj1f+qq/QixvdEmqB8o/oGMDV+/ZqfNFjat6jwWQexb3v
         iBng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=H9oZQbNnPKg04bTmHZzlCtfyOoPK++pS7U+3W7/mSLw=;
        b=m8LknVhmgpRP+e6JszerQcziUazzz0TZlL27ZoaTxYkHtOPo5gCWEKWxqXZF8F31yv
         2J89iTnodU6jb7Zj41Bow7S87BAajRrkd/jE8iqutDdJvgSRgGB6AQd5RlO7wyXVU7h/
         NnauU1aBqMPhrYJXSr1gZJjWikaSk8oGb+oKAvHQmcb7GD7rP7sCdmngqmB0JIHH9tVA
         YCmMJAmH6e8pCWWl/6c5n1rhbDmObatQ6XZbsMEEGRUDf1vcdMR/TRk6QeQxM4pVVPXh
         +/f6XMyy7zhtxizcNDu9aPBcOM3R4XqkIi8j3Aun75PGKydDB8QpK91KXVGr8ZtlV6T5
         /fyg==
X-Gm-Message-State: APjAAAUp3Ke43nutEy6xyXc27xM1brgqxihqfQzCVtfqszTwBZkrQuw4
        9CRmWmGg2JlyTcFuP315wnCf7w==
X-Google-Smtp-Source: APXvYqwYbDeqqVO9C1lE2+oFQ4SHpBeU8V5WMyAeE0MG2YVTxfqkVt/eyi8rsmUdTIL6/p1bw7h26w==
X-Received: by 2002:a2e:8e22:: with SMTP id r2mr10480377ljk.51.1577100832546;
        Mon, 23 Dec 2019 03:33:52 -0800 (PST)
Received: from localhost.localdomain ([37.157.136.193])
        by smtp.gmail.com with ESMTPSA id g15sm8381500ljk.8.2019.12.23.03.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2019 03:33:52 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>, dikshita@codeaurora.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v3 07/12] dt-bindings: media: venus: Convert msm8996 to DT schema
Date:   Mon, 23 Dec 2019 13:33:06 +0200
Message-Id: <20191223113311.20602-8-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191223113311.20602-1-stanimir.varbanov@linaro.org>
References: <20191223113311.20602-1-stanimir.varbanov@linaro.org>
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
index 000000000000..d1431dfa0de8
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
+    const: "qcom,msm8996-venus"
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
+      clocks:
+        maxItems: 1
+
+      clock-names:
+        maxItems: 1
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
+        const: "venus-encoder"
+
+      clocks:
+        maxItems: 1
+
+      clock-names:
+        maxItems: 1
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

