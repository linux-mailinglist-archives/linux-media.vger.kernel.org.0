Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDD09660862
	for <lists+linux-media@lfdr.de>; Fri,  6 Jan 2023 21:39:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235069AbjAFUjZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Jan 2023 15:39:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbjAFUjY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Jan 2023 15:39:24 -0500
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA6621740C;
        Fri,  6 Jan 2023 12:39:22 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 1C180C0002;
        Fri,  6 Jan 2023 20:39:18 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Nicholas Roth <nicholas@rothemail.net>,
        Robert Mader <robert.mader@collabora.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: media: Add OmniVision OV8858
Date:   Fri,  6 Jan 2023 21:39:08 +0100
Message-Id: <20230106203909.184073-2-jacopo@jmondi.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230106203909.184073-1-jacopo@jmondi.org>
References: <20230106203909.184073-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Add binding schema for the OmniVision OV8858 8 Megapixels camera sensor.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../bindings/media/i2c/ovti,ov8858.yaml       | 105 ++++++++++++++++++
 1 file changed, 105 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml
new file mode 100644
index 000000000000..002461a974f8
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml
@@ -0,0 +1,105 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,ov8858.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OmniVision OV8858 Image Sensor
+
+maintainers:
+  - Jacopo Mondi <jacopo.mondi@ideasonboard.com>
+  - Nicholas Roth <nicholas@rothemail.net>
+
+description: |
+  The OmniVision OV8858 is a color CMOS 8 Megapixels (3264x2448) image sensor
+  controlled through an I2C-compatible SCCB bus. The sensor transmits images
+  on a MIPI CSI-2 output interface with up to 4 data lanes.
+
+properties:
+  compatible:
+    const: ovti,ov8858
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description: XVCLK external clock
+
+  clock-names:
+    const: xvclk
+
+  dvdd-supply:
+    description: Digital Domain Power Supply
+
+  avdd-supply:
+    description: Analog Domain Power Supply
+
+  dovdd-supply:
+    description: I/O Domain Power Supply
+
+  powerdown-gpios:
+    description: PWDNB powerdown GPIO (active low)
+
+  reset-gpios:
+    description: XSHUTDN reset GPIO (active low)
+
+  port:
+    description: MIPI CSI-2 transmitter port
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
+            maxItems: 4
+
+        required:
+          - data-lanes
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
+    #include <dt-bindings/pinctrl/rockchip.h>
+    #include <dt-bindings/clock/rk3399-cru.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ov8858: camera@36 {
+            compatible = "ovti,ov8858";
+            reg = <0x36>;
+
+            clocks = <&cru SCLK_CIF_OUT>;
+            clock-names = "xvclk";
+            assigned-clocks = <&cru SCLK_CIF_OUT>;
+            assigned-clock-rates = <24000000>;
+
+            dovdd-supply = <&vcc1v8_dvp>;
+
+            reset-gpios = <&gpio1 RK_PA4 GPIO_ACTIVE_LOW>;
+            powerdown-gpios = <&gpio2 RK_PB4 GPIO_ACTIVE_LOW>;
+
+            port {
+                ucam_out: endpoint {
+                    remote-endpoint = <&mipi_in_ucam>;
+                    data-lanes = <1 2 3 4>;
+                };
+            };
+        };
+    };
+...
--
2.38.1

