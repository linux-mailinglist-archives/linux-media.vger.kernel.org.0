Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10C357332CF
	for <lists+linux-media@lfdr.de>; Fri, 16 Jun 2023 16:00:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345478AbjFPOAc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Jun 2023 10:00:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344766AbjFPOAY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Jun 2023 10:00:24 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EC2F35A0;
        Fri, 16 Jun 2023 07:00:17 -0700 (PDT)
Received: from desky.lan (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2147013C5;
        Fri, 16 Jun 2023 15:59:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1686923983;
        bh=GkbXB9UyjDDTjHakH8U9wgsGOoFnfC4yPPXiFLlU3e8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ksHeBrBSGpv8v5YXZHFIEJnIkQV8MVeQV0yvpjFvT56xfafy/uCxX05p0EhUcn3d5
         r55nWVQSe7dRAecRlg0SwCNupFPemmON2SPaT+S8/GfKKeGof31Mjuy+YMjmhHn/wF
         P9wjnAVnINzpJKR8JMT1MHpoQz6kjtBVqVV515ec=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        =?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Satish Nagireddy <satish.nagireddy@getcruise.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v14 05/18] dt-bindings: media: add TI DS90UB960 FPD-Link III Deserializer
Date:   Fri, 16 Jun 2023 16:59:09 +0300
Message-Id: <20230616135922.442979-6-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230616135922.442979-1-tomi.valkeinen@ideasonboard.com>
References: <20230616135922.442979-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add DT bindings for TI DS90UB960 FPD-Link III Deserializer.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../bindings/media/i2c/ti,ds90ub960.yaml      | 427 ++++++++++++++++++
 1 file changed, 427 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
new file mode 100644
index 000000000000..289737721c2c
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
@@ -0,0 +1,427 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ti,ds90ub960.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments DS90UB9XX Family FPD-Link Deserializer Hubs
+
+maintainers:
+  - Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
+
+description:
+  The TI DS90UB9XX devices are FPD-Link video deserializers with I2C and GPIO
+  forwarding.
+
+allOf:
+  - $ref: /schemas/i2c/i2c-atr.yaml#
+
+properties:
+  compatible:
+    enum:
+      - ti,ds90ub960-q1
+      - ti,ds90ub9702-q1
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description:
+      Reference clock connected to the REFCLK pin.
+
+  clock-names:
+    items:
+      - const: refclk
+
+  powerdown-gpios:
+    maxItems: 1
+    description:
+      Specifier for the GPIO connected to the PDB pin.
+
+  i2c-alias-pool:
+    minItems: 1
+    maxItems: 32
+
+  links:
+    type: object
+    additionalProperties: false
+
+    properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+      ti,manual-strobe:
+        type: boolean
+        description:
+          Enable manual strobe position and EQ level
+
+    patternProperties:
+      '^link@[0-3]$':
+        type: object
+        additionalProperties: false
+        properties:
+          reg:
+            description: The link number
+            maxItems: 1
+
+          i2c-alias:
+            description:
+              The I2C address used for the serializer. Transactions to this
+              address on the I2C bus where the deserializer resides are
+              forwarded to the serializer.
+
+          ti,rx-mode:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum:
+              - 0 # RAW10
+              - 1 # RAW12 HF
+              - 2 # RAW12 LF
+              - 3 # CSI2 SYNC
+              - 4 # CSI2 NON-SYNC
+            description:
+              FPD-Link Input Mode. This should reflect the hardware and the
+              default mode of the connected device.
+
+          ti,cdr-mode:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum:
+              - 0 # FPD-Link III
+              - 1 # FPD-Link IV
+            description:
+              FPD-Link CDR Mode. This should reflect the hardware and the
+              default mode of the connected device.
+
+          ti,strobe-pos:
+            $ref: /schemas/types.yaml#/definitions/int32
+            minimum: -13
+            maximum: 13
+            description: Manual strobe position
+
+          ti,eq-level:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            maximum: 14
+            description: Manual EQ level
+
+          serializer:
+            type: object
+            description: FPD-Link Serializer node
+
+        required:
+          - reg
+          - i2c-alias
+          - ti,rx-mode
+          - serializer
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: FPD-Link input 0
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+            description:
+              Endpoint for FPD-Link port. If the RX mode for this port is RAW,
+              hsync-active and vsync-active must be defined.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: FPD-Link input 1
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+            description:
+              Endpoint for FPD-Link port. If the RX mode for this port is RAW,
+              hsync-active and vsync-active must be defined.
+
+      port@2:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: FPD-Link input 2
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+            description:
+              Endpoint for FPD-Link port. If the RX mode for this port is RAW,
+              hsync-active and vsync-active must be defined.
+
+      port@3:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: FPD-Link input 3
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+            description:
+              Endpoint for FPD-Link port. If the RX mode for this port is RAW,
+              hsync-active and vsync-active must be defined.
+
+      port@4:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: CSI-2 Output 0
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+              link-frequencies:
+                maxItems: 1
+
+            required:
+              - data-lanes
+              - link-frequencies
+
+      port@5:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: CSI-2 Output 1
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+              link-frequencies:
+                maxItems: 1
+
+            required:
+              - data-lanes
+              - link-frequencies
+
+    required:
+      - port@0
+      - port@1
+      - port@2
+      - port@3
+      - port@4
+      - port@5
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - ports
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+      clock-frequency = <400000>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      deser@3d {
+        compatible = "ti,ds90ub960-q1";
+        reg = <0x3d>;
+
+        clock-names = "refclk";
+        clocks = <&fixed_clock>;
+
+        powerdown-gpios = <&pca9555 7 GPIO_ACTIVE_LOW>;
+
+        i2c-alias-pool = <0x4a 0x4b 0x4c 0x4d 0x4e 0x4f>;
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          /* Port 0, Camera 0 */
+          port@0 {
+            reg = <0>;
+
+            ub960_fpd3_1_in: endpoint {
+              remote-endpoint = <&ub953_1_out>;
+            };
+          };
+
+          /* Port 1, Camera 1 */
+          port@1 {
+            reg = <1>;
+
+            ub960_fpd3_2_in: endpoint {
+              remote-endpoint = <&ub913_2_out>;
+              hsync-active = <0>;
+              vsync-active = <1>;
+            };
+          };
+
+          /* Port 2, unconnected */
+          port@2 {
+            reg = <2>;
+          };
+
+          /* Port 3, unconnected */
+          port@3 {
+            reg = <3>;
+          };
+
+          /* Port 4, CSI-2 TX */
+          port@4 {
+            reg = <4>;
+            ds90ub960_0_csi_out: endpoint {
+              data-lanes = <1 2 3 4>;
+              link-frequencies = /bits/ 64 <800000000>;
+              remote-endpoint = <&csi2_phy0>;
+            };
+          };
+
+          /* Port 5, unconnected */
+          port@5 {
+            reg = <5>;
+          };
+        };
+
+        links {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          /* Link 0 has DS90UB953 serializer and IMX274 sensor */
+
+          link@0 {
+            reg = <0>;
+            i2c-alias = <0x44>;
+
+            ti,rx-mode = <3>;
+
+            serializer1: serializer {
+              compatible = "ti,ds90ub953-q1";
+
+              gpio-controller;
+              #gpio-cells = <2>;
+
+              #clock-cells = <0>;
+
+              ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                  reg = <0>;
+                  ub953_1_in: endpoint {
+                    data-lanes = <1 2 3 4>;
+                    remote-endpoint = <&sensor_1_out>;
+                  };
+                };
+
+                port@1 {
+                  reg = <1>;
+
+                  ub953_1_out: endpoint {
+                    remote-endpoint = <&ub960_fpd3_1_in>;
+                  };
+                };
+              };
+
+              i2c {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                sensor@1a {
+                  compatible = "sony,imx274";
+                  reg = <0x1a>;
+
+                  reset-gpios = <&serializer1 0 GPIO_ACTIVE_LOW>;
+
+                  port {
+                    sensor_1_out: endpoint {
+                      remote-endpoint = <&ub953_1_in>;
+                    };
+                  };
+                };
+              };
+            };
+          };  /* End of link@0 */
+
+          /* Link 1 has DS90UB913 serializer and MT9V111 sensor */
+
+          link@1 {
+            reg = <1>;
+            i2c-alias = <0x45>;
+
+            ti,rx-mode = <0>;
+
+            serializer2: serializer {
+              compatible = "ti,ds90ub913a-q1";
+
+              gpio-controller;
+              #gpio-cells = <2>;
+
+              clocks = <&clk_cam_48M>;
+              clock-names = "clkin";
+
+              #clock-cells = <0>;
+
+              ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                  reg = <0>;
+                  ub913_2_in: endpoint {
+                    remote-endpoint = <&sensor_2_out>;
+                    pclk-sample = <1>;
+                  };
+                };
+
+                port@1 {
+                  reg = <1>;
+
+                  ub913_2_out: endpoint {
+                    remote-endpoint = <&ub960_fpd3_2_in>;
+                  };
+                };
+              };
+
+              i2c {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                sensor@48 {
+                  compatible = "aptina,mt9v111";
+                  reg = <0x48>;
+
+                  clocks = <&serializer2>;
+
+                  port {
+                    sensor_2_out: endpoint {
+                      remote-endpoint = <&ub913_2_in>;
+                    };
+                  };
+                };
+              };
+            };
+          }; /* End of link@1 */
+        };
+      };
+    };
+...
-- 
2.34.1

