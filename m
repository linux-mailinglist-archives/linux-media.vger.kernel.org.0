Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8DDA693151
	for <lists+linux-media@lfdr.de>; Sat, 11 Feb 2023 14:47:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229546AbjBKNrk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 11 Feb 2023 08:47:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbjBKNrj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 11 Feb 2023 08:47:39 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2A6A2799B
        for <linux-media@vger.kernel.org>; Sat, 11 Feb 2023 05:47:37 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id r2so7838005wrv.7
        for <linux-media@vger.kernel.org>; Sat, 11 Feb 2023 05:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hsGQ0gdbtX4/5NNKjqT00xb2Pj6HxWh2Joiq7xE1GTg=;
        b=kAy91UoI6Ps1U+hiHxlVGyoABPV5pXKbvqap4stZ6fdIMyIuLf+BW8SJNkfa9QsOGb
         nUxzfmf36bv/owKTt8YUZc9B4DQpv6qLYPaaP/q915lHhTWYlxJWNCuuk61dvzN4MGBm
         C0SvKWeSshh8e5HPkB2Vwtz4fMfvX24Or28TpkLm5VBPXqbsGN7Z5/JtOmPCy0ahQyIR
         zGEBycdfKFkinpF8uPanorpWAuUqTEgyS6p4pBeDpyRT+OcLxYakpQPtQ45gu+F3Fdlu
         LL0VwEtU8DSXHjdgpoHBGA5WZlz5Mw7Pd9+HVSFKkGFXw1xP61IB1KjDsVB17rFaIH8Q
         lKmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hsGQ0gdbtX4/5NNKjqT00xb2Pj6HxWh2Joiq7xE1GTg=;
        b=qMrvO61H+vYjlaj0gmS0svQz/rL0n6BucsxUc0zzVxlVTg+kMwUxB4Yqf0bULy9gBY
         qP+3inrJyKeKqvJPlZFtk6pI/27XfOPzGbC45zgQsfm3BOlut6663gndWCg6mD14awk2
         UK4+EFG/WR1epSRGaXBxdiZHtgZ1KApj2M++o7Q/ruvXo2RW+idgxNbavg87e7mCVNef
         Av0FDG/39Qll4sN+RXYoa/mOdJY5SPkMgN1t5KX0PzWMXQ/CAz+N6pYns4VSRPSY/8Q4
         AEnpWR118UK8sRllrxMSn7qKcCLRlmoG10nqoUdTL3cuBJN0NohGLxUm25zh4d4aic6B
         jiaQ==
X-Gm-Message-State: AO0yUKXYeW6h0o5JI3zf/4kBGkVb7lDYfUjKsuUEtcXgl7gXBBWmqOiV
        5sj8BgSevBcXosmB+WwHVxLfzw==
X-Google-Smtp-Source: AK7set883aIRz5Kw1LUd1XUpdItdJfyN4f58Ttlh78ES2wS7DTA+MkxILK7GlP55376IH+/Kn1KtVA==
X-Received: by 2002:adf:e691:0:b0:2c5:509b:dc4a with SMTP id r17-20020adfe691000000b002c5509bdc4amr1015127wrm.50.1676123256177;
        Sat, 11 Feb 2023 05:47:36 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id y9-20020adfee09000000b002c550eb062fsm1118055wrn.14.2023.02.11.05.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 05:47:35 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/3] media: dt-bindings: i2c: samsung,s5k6a3: convert to dtschema
Date:   Sat, 11 Feb 2023 14:47:29 +0100
Message-Id: <20230211134731.85957-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert the Samsung S5K6A3(YX) raw image sensor bindings to DT schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/media/i2c/samsung,s5k6a3.yaml    | 98 +++++++++++++++++++
 .../bindings/media/samsung-s5k6a3.txt         | 33 -------
 2 files changed, 98 insertions(+), 33 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k6a3.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/samsung-s5k6a3.txt

diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5k6a3.yaml b/Documentation/devicetree/bindings/media/i2c/samsung,s5k6a3.yaml
new file mode 100644
index 000000000000..7e83a94124b5
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5k6a3.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/samsung,s5k6a3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S5K6A3(YX) raw image sensor
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+
+description:
+  S5K6A3(YX) is a raw image sensor with MIPI CSI-2 and CCP2 image data
+  interfaces and CCI (I2C compatible) control bus.
+
+properties:
+  compatible:
+    const: samsung,s5k6a3
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: extclk
+
+  clock-frequency:
+    default: 24000000
+    description: extclk clock frequency
+
+  gpios:
+    maxItems: 1
+    description: GPIO connected to the RESET pin
+
+  afvdd-supply:
+    description: AF (actuator) voltage supply
+
+  svdda-supply:
+    description: Core voltage supply
+
+  svddio-supply:
+    description: I/O voltage supply
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            items:
+              - const: 1
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - gpios
+  - afvdd-supply
+  - svdda-supply
+  - svddio-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        sensor@10 {
+            compatible = "samsung,s5k6a3";
+            reg = <0x10>;
+            clock-frequency = <24000000>;
+            clocks = <&camera 1>;
+            clock-names = "extclk";
+            gpios = <&gpm1 6 GPIO_ACTIVE_LOW>;
+            afvdd-supply = <&ldo19_reg>;
+            svdda-supply = <&cam_io_reg>;
+            svddio-supply = <&ldo19_reg>;
+
+            port {
+                endpoint {
+                    remote-endpoint = <&csis1_ep>;
+                    data-lanes = <1>;
+                };
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/media/samsung-s5k6a3.txt b/Documentation/devicetree/bindings/media/samsung-s5k6a3.txt
deleted file mode 100644
index cce01e82f3e3..000000000000
--- a/Documentation/devicetree/bindings/media/samsung-s5k6a3.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-Samsung S5K6A3(YX) raw image sensor
----------------------------------
-
-S5K6A3(YX) is a raw image sensor with MIPI CSI-2 and CCP2 image data interfaces
-and CCI (I2C compatible) control bus.
-
-Required properties:
-
-- compatible	: "samsung,s5k6a3";
-- reg		: I2C slave address of the sensor;
-- svdda-supply	: core voltage supply;
-- svddio-supply	: I/O voltage supply;
-- afvdd-supply	: AF (actuator) voltage supply;
-- gpios		: specifier of a GPIO connected to the RESET pin;
-- clocks	: should contain list of phandle and clock specifier pairs
-		  according to common clock bindings for the clocks described
-		  in the clock-names property;
-- clock-names	: should contain "extclk" entry for the sensor's EXTCLK clock;
-
-Optional properties:
-
-- clock-frequency : the frequency at which the "extclk" clock should be
-		    configured to operate, in Hz; if this property is not
-		    specified default 24 MHz value will be used.
-
-The common video interfaces bindings (see video-interfaces.txt) should be
-used to specify link to the image data receiver. The S5K6A3(YX) device
-node should contain one 'port' child node with an 'endpoint' subnode.
-
-Following properties are valid for the endpoint node:
-
-- data-lanes : (optional) specifies MIPI CSI-2 data lanes as covered in
-  video-interfaces.txt.  The sensor supports only one data lane.
-- 
2.34.1

