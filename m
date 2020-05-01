Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F321D1C1EB6
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2020 22:41:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726790AbgEAUfj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 May 2020 16:35:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726564AbgEAUfi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 May 2020 16:35:38 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36867C061A0C;
        Fri,  1 May 2020 13:35:38 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id k1so12903528wrx.4;
        Fri, 01 May 2020 13:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4CV2/aVsWZ0J7YHV9S4W9vWVSAHIz1DaEhX17Sy8Wz4=;
        b=Tlrjk1dH8to4PfLXys+3mHm6CjCbaZV/J43dAGlgcHkGXSi1KQpbWvo1YvteX9WKrn
         Xf4daL6/ODr0zMKAzvwDmT24kpaD6rP4lHHuVZ97MrHjSKkvq2cZJTGkBIt2KGZBJMkg
         SZELEIm75FMbnpwhZCgPeRRH8bg8pI3oSbgax5bjUiLJ6500qgkKdfIQZNpEvNsocwRT
         TavhlFdn3namQI7yJLI2zvdYbHBYoU+m80ZSYZOaBXd5Zj3smpwI+TS9qosuSDUmztG0
         HM9TqSK4ipAOtfxDzTmHhPnhtpnOPKZsamcKqKlEMI3Mj6pPlNEWBW4wxNjqJ+GBgNPi
         fkbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4CV2/aVsWZ0J7YHV9S4W9vWVSAHIz1DaEhX17Sy8Wz4=;
        b=KBOof0Y9v/Ud6s/jqQTMyoD4yFkMBXQ/qCgfJqXBBaUBF4vkhEq/1b+ShgNZk2lYoy
         8xCZte+u4gI3FlnM50vEGsOHU/H1c2bI+BMJrZTYRgrhY1cUrlBfsodbp+FN6VxkO/aV
         XHDPIFZyIwLcJpQQuLyllv46WE36pUfkQg7vsRJcAeskh2l4WTTSr0zywld7GWjuEnDq
         FfhJErcC5Not1nwA23tom9FSqXfT8CYhOQBGNzP/N8u2K0/QC3wxyzoxilEY3B7q0d61
         RSZogZfwc3qAx3vROspBd1octrl1nidoPP87YvXPmOnpcacBhfFQNu6rCnfDBb9DeiSd
         Pm4g==
X-Gm-Message-State: AGi0PuZTEB/ZG3KL9ihaHqfcFWkUD0luChwFxZptco24wfWzV47xzWBj
        fyESPAkt843tWhEpjUMod+g=
X-Google-Smtp-Source: APiQypKs56QSSRikbo8kH00yOgGcPJYKeqjXs3piSV6FSIJYIeDDQcn6iPsk7GoyRUrMCNPKoX69gw==
X-Received: by 2002:adf:9d8d:: with SMTP id p13mr5689847wre.17.1588365336726;
        Fri, 01 May 2020 13:35:36 -0700 (PDT)
Received: from localhost.localdomain (abag125.neoplus.adsl.tpnet.pl. [83.6.170.125])
        by smtp.googlemail.com with ESMTPSA id s12sm1021981wmc.7.2020.05.01.13.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 13:35:36 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: media: Document MSM8939 Venus
Date:   Fri,  1 May 2020 22:35:03 +0200
Message-Id: <20200501203505.144362-3-konradybcio@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200501203505.144362-1-konradybcio@gmail.com>
References: <20200501203505.144362-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 .../bindings/media/qcom,msm8939-venus.yaml    | 119 ++++++++++++++++++
 1 file changed, 119 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8939-venus.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,msm8939-venus.yaml b/Documentation/devicetree/bindings/media/qcom,msm8939-venus.yaml
new file mode 100644
index 0000000000000..8cc0002d10163
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,msm8939-venus.yaml
@@ -0,0 +1,119 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/media/qcom,msm8939-venus.yaml#"
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
+    const: qcom,msm8939-venus
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
+        #include <dt-bindings/clock/qcom,gcc-msm8939.h>
+
+        video-codec@1d00000 {
+                compatible = "qcom,msm8939-venus";
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
2.26.1

