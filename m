Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79B4E79F202
	for <lists+linux-media@lfdr.de>; Wed, 13 Sep 2023 21:28:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232394AbjIMT21 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Sep 2023 15:28:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232387AbjIMT20 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Sep 2023 15:28:26 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53A81B7;
        Wed, 13 Sep 2023 12:28:22 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-3a9e49495ddso1797b6e.1;
        Wed, 13 Sep 2023 12:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694633301; x=1695238101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2WidjAhyzzR914yrMrQA4wjCbGJH0b1DcL9K+jqRrhM=;
        b=RUp2ytGWv9dp+pir04wEXORIGle/uNVVeLD4qvJpyBeUVi2TzpClNVyFGSZvrj/sUJ
         qE+n4bPikY/JzxBxCJjoJwVYu4f4ae6dPHCpM4zg0KHsdqPrdlf+clf9oHF74VWoQcmL
         1rFsy0zaBzny+1MQsUNcCuTMbJJSor/GppemHtG/G+uS0AJpYziyJD8gklLwPY6Tvvyn
         EWE6cO0vAbj35H0l+0i11kUKfAu/1e3TtcUBZXLQPEncwsvR/zCyZJpkZTyoX0nSKMI5
         O7bctJ30s9AJ8wOmjux652dIInf69BXf3jp1zIxMHnrWB2a4dvk5/EUZSKJrzvAc+qLg
         j7FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694633301; x=1695238101;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2WidjAhyzzR914yrMrQA4wjCbGJH0b1DcL9K+jqRrhM=;
        b=i7GRWNwoSToxdQYoa0Xp3vCRnfplHXBcsb0Z+apDAbaTFvGipgyCQK5Xr/Y4uUkCFs
         LuuHXr6fARduwR7UzQ/0SSRt7qKXg8/onylpIOMntNP78LAlzOLeVJxr5sBl6DGmM0fT
         RpPCNO8nh0byxBzFKcNp5B2JAu5bOA1iL/CMUKG9i5eUuJEJqn7JQwtt1jQQ/5mdWwDn
         15Jm1XhENLhIqkdo63PdaGa5WOwt4tXlCEjPwSCjxFNLJOY7Q2ZS13HvYWAGmtzJm1Ef
         xDW/12qa3L/ovVHB46nMpNOH1eorIVzteiN2+vbvtUPCxDt1rWK/d5coc582MTjtXGIj
         OBdA==
X-Gm-Message-State: AOJu0YyUp5mlcsnFdi9I7Y0A/+hYYf3jQh5hVBRQjeVMuHq1+zxQQvwO
        SCZ73XENEm7s4AXGJERG54XUVkVCMns=
X-Google-Smtp-Source: AGHT+IFwuw2AHf3U9dQGwgRAjJ6iGmvB0H3u2uvXpeAufRd0mmf0kzaoTVpzqkcCSkRKNZOb/MCoLg==
X-Received: by 2002:a05:6808:308c:b0:3a7:72e2:3262 with SMTP id bl12-20020a056808308c00b003a772e23262mr4197780oib.5.1694633301499;
        Wed, 13 Sep 2023 12:28:21 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:1764:d532:27a2:10a0])
        by smtp.gmail.com with ESMTPSA id b14-20020a056808010e00b003a1ec14d8c6sm5476622oie.23.2023.09.13.12.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 12:28:21 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     sakari.ailus@iki.fi
Cc:     mchehab@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Fabio Estevam <festevam@denx.de>
Subject: [PATCH v4] media: dt-bindings: Add OV5642
Date:   Wed, 13 Sep 2023 16:28:11 -0300
Message-Id: <20230913192811.1946423-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Fabio Estevam <festevam@denx.de>

As explained in the description text from trivial-devices.yaml:

"This is a list of trivial I2C and SPI devices that have simple device tree
bindings, consisting only of a compatible field, an address and possibly an
interrupt line."

A camera device does not fall into this category as it needs other
properties such as regulators, reset and powerdown GPIOs, clocks,
media endpoint.

Remove the OV5642 entry from trivial-devices.yaml and add its own
ovti,ov5642.yaml.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v3:
- Make propeties conditional on parallel verus MIPI CSI-2. (Sakari)
- Remove clock-names as there is a single clock.
- Pass bus-type.

 .../bindings/media/i2c/ovti,ov5642.yaml       | 141 ++++++++++++++++++
 .../devicetree/bindings/trivial-devices.yaml  |   2 -
 2 files changed, 141 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov5642.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5642.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5642.yaml
new file mode 100644
index 000000000000..01f8b2b3fd17
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5642.yaml
@@ -0,0 +1,141 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,ov5642.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OmniVision OV5642 Image Sensor
+
+maintainers:
+  - Fabio Estevam <festevam@gmail.com>
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: ovti,ov5642
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: XCLK Input Clock
+
+  AVDD-supply:
+    description: Analog voltage supply, 2.8V.
+
+  DVDD-supply:
+    description: Digital core voltage supply, 1.5V.
+
+  DOVDD-supply:
+    description: Digital I/O voltage supply, 1.8V.
+
+  powerdown-gpios:
+    maxItems: 1
+    description: Reference to the GPIO connected to the powerdown pin, if any.
+
+  reset-gpios:
+    maxItems: 1
+    description: Reference to the GPIO connected to the reset pin, if any.
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    description: |
+      Video output port.
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          bus-type:
+            enum: [5, 6]
+
+          bus-width:
+            enum: [8, 10]
+            default: 10
+
+          data-shift:
+            enum: [0, 2]
+            default: 0
+
+          hsync-active:
+            enum: [0, 1]
+            default: 1
+
+          vsync-active:
+            enum: [0, 1]
+            default: 1
+
+          pclk-sample:
+            enum: [0, 1]
+            default: 1
+
+        allOf:
+          - if:
+              properties:
+                bus-type:
+                  const: 6
+            then:
+              properties:
+                hsync-active: false
+                vsync-active: false
+
+          - if:
+              properties:
+                bus-width:
+                  const: 10
+            then:
+              properties:
+                data-shift:
+                  const: 0
+
+        required:
+          - bus-type
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+      #include <dt-bindings/gpio/gpio.h>
+      #include <dt-bindings/media/video-interfaces.h>
+
+      i2c {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          camera@3c {
+              compatible = "ovti,ov5642";
+              reg = <0x3c>;
+              pinctrl-names = "default";
+              pinctrl-0 = <&pinctrl_ov5642>;
+              clocks = <&clk_ext_camera>;
+              DOVDD-supply = <&vgen4_reg>;
+              AVDD-supply = <&vgen3_reg>;
+              DVDD-supply = <&vgen2_reg>;
+              powerdown-gpios = <&gpio1 19 GPIO_ACTIVE_HIGH>;
+              reset-gpios = <&gpio1 20 GPIO_ACTIVE_LOW>;
+
+              port {
+                  ov5642_to_parallel: endpoint {
+                      bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
+                      remote-endpoint = <&parallel_from_ov5642>;
+                      bus-width = <8>;
+                      data-shift = <2>; /* lines 9:2 are used */
+                      hsync-active = <0>;
+                      vsync-active = <0>;
+                      pclk-sample = <1>;
+                  };
+              };
+          };
+      };
diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index cd58179ae337..c665018f55b9 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -311,8 +311,6 @@ properties:
           - nuvoton,w83773g
             # OKI ML86V7667 video decoder
           - oki,ml86v7667
-            # OV5642: Color CMOS QSXGA (5-megapixel) Image Sensor with OmniBSI and Embedded TrueFocus
-          - ovti,ov5642
             # 48-Lane, 12-Port PCI Express Gen 2 (5.0 GT/s) Switch
           - plx,pex8648
             # Pulsedlight LIDAR range-finding sensor
-- 
2.34.1

