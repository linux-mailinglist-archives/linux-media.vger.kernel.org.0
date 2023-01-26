Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D42F67CB16
	for <lists+linux-media@lfdr.de>; Thu, 26 Jan 2023 13:47:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234330AbjAZMrA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 07:47:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232925AbjAZMq6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 07:46:58 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E44622ED7E;
        Thu, 26 Jan 2023 04:46:55 -0800 (PST)
Received: from uno.LocalDomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8206E975;
        Thu, 26 Jan 2023 13:46:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674737214;
        bh=FjHe18OjMG5kp/9PYfncXnIQ8ktDN2Uo2h/sBYfzDqo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KEeHFRPKNjvtnLjX7JmYZtk23ZQDABkw8mM7W51ml4DUyuId0aQzmWy4Gzfoygdt5
         L26YehlZFEqu4lNOv7EY0Lkcle58OAGMqQ3N8AiPFCGtT810/N8f4ruUiPImUyKl2a
         2d/KZz2AzjenZZffcMiCFjnO14aPfCd0yFG1Fbpg=
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Luca Weiss <luca@z3ntu.xyz>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v5 1/9] media: dt-bindings: Add OV5670
Date:   Thu, 26 Jan 2023 13:46:24 +0100
Message-Id: <20230126124632.45842-2-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230126124632.45842-1-jacopo.mondi@ideasonboard.com>
References: <20230126124632.45842-1-jacopo.mondi@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the bindings documentation for Omnivision OV5670 image sensor.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../bindings/media/i2c/ovti,ov5670.yaml       | 92 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 93 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov5670.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5670.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5670.yaml
new file mode 100644
index 000000000000..fa264255b5eb
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5670.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,ov5670.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Omnivision OV5670 5 Megapixels raw image sensor
+
+maintainers:
+  - Jacopo Mondi <jacopo.mondi@ideasonboard.com>
+
+description: |-
+  The OV5670 is a 5 Megapixels raw image sensor which provides images in 10-bits
+  RAW BGGR Bayer format on a 2 data lanes MIPI CSI-2 serial interface and is
+  controlled through an I2C compatible control bus.
+
+properties:
+  compatible:
+    const: ovti,ov5670
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: System clock. From 6 to 27 MHz.
+    maxItems: 1
+
+  powerdown-gpios:
+    description: Reference to the GPIO connected to the PWDNB pin. Active low.
+
+  reset-gpios:
+    description: Reference to the GPIO connected to the XSHUTDOWN pin. Active low.
+    maxItems: 1
+
+  avdd-supply:
+    description: Analog circuit power. Typically 2.8V.
+
+  dvdd-supply:
+    description: Digital circuit power. Typically 1.2V.
+
+  dovdd-supply:
+    description: Digital I/O circuit power. Typically 2.8V or 1.8V.
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
+            minItems: 1
+            maxItems: 2
+            items:
+              enum: [1, 2]
+
+          clock-noncontinuous: true
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
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ov5670: sensor@36 {
+            compatible = "ovti,ov5670";
+            reg = <0x36>;
+
+            clocks = <&sensor_xclk>;
+
+            port {
+                ov5670_ep: endpoint {
+                    remote-endpoint = <&csi_ep>;
+                    data-lanes = <1 2>;
+                    clock-noncontinuous;
+                };
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index f61eb221415b..38d8d1d5d536 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15468,6 +15468,7 @@ M:	Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/i2c/ovti,ov5670.yaml
 F:	drivers/media/i2c/ov5670.c

 OMNIVISION OV5675 SENSOR DRIVER
--
2.39.0

