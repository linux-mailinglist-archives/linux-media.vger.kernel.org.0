Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9309A66C438
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 16:45:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230439AbjAPPpL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 10:45:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230115AbjAPPpI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 10:45:08 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6679921944;
        Mon, 16 Jan 2023 07:45:07 -0800 (PST)
Received: from uno.LocalDomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 82FC6AD5;
        Mon, 16 Jan 2023 16:45:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673883905;
        bh=Rey0h70PgMveumrqgbKqAdNQBweMmt+WoF4Ssv208HM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dTMN2GLJ+0jQme/0YRVFq7ThpjaxW/5GHmuleHBbE9ozAj4NG4569nlswF8ez96Kh
         posKAMhejHbKZEysMrlTmhuUa4BXGX0qDrlEmgDmlI1r4MVCzLMFaM0L6es13xgdiq
         Ajs+1sO42PiTjXQX68b7YayVY+H5RznzXmbHQJPg=
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Nicholas Roth <nicholas@rothemail.net>,
        Robert Mader <robert.mader@collabora.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 1/2] dt-bindings: media: Add OmniVision OV8858
Date:   Mon, 16 Jan 2023 16:44:47 +0100
Message-Id: <20230116154448.76944-2-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116154448.76944-1-jacopo.mondi@ideasonboard.com>
References: <20230116154448.76944-1-jacopo.mondi@ideasonboard.com>
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

Add binding schema for the OmniVision OV8858 8 Megapixels camera sensor.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/media/i2c/ovti,ov8858.yaml       | 106 ++++++++++++++++++
 1 file changed, 106 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml
new file mode 100644
index 000000000000..a65f921ec0fd
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml
@@ -0,0 +1,106 @@
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
+    maxItems: 1
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
2.39.0

