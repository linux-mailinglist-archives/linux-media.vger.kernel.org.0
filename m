Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9D1865EE4A
	for <lists+linux-media@lfdr.de>; Thu,  5 Jan 2023 15:04:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234596AbjAEOEA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Jan 2023 09:04:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234247AbjAEODd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Jan 2023 09:03:33 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EAB02008;
        Thu,  5 Jan 2023 06:03:32 -0800 (PST)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3F621D8C;
        Thu,  5 Jan 2023 15:03:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1672927409;
        bh=nnlXKrVGAl8DumbyGRI6UA9wEiCBmXKebELeEKLetmI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YPnIIsd9WPhNWoXCgGYsBgsRQAYdT1upaJ4pU1s6TK1lViaydg+ISOiTgbWxfETDO
         vCd8s1q+Os0h+7v4ocoAcP0cuBEoqbxluISE8JzsnbWP2CFs65YluSWsPjbn7v7bgi
         BSC98vOZiYTKBFLwrXO1ue1DzF5Uq84YEeWfllrc=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Shawn Tu <shawnx.tu@intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        =?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v6 4/8] dt-bindings: media: add TI DS90UB953 FPD-Link III Serializer
Date:   Thu,  5 Jan 2023 16:03:03 +0200
Message-Id: <20230105140307.272052-5-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230105140307.272052-1-tomi.valkeinen@ideasonboard.com>
References: <20230105140307.272052-1-tomi.valkeinen@ideasonboard.com>
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

Add DT bindings for TI DS90UB953 FPD-Link III Serializer.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 .../bindings/media/i2c/ti,ds90ub953.yaml      | 134 ++++++++++++++++++
 1 file changed, 134 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
new file mode 100644
index 000000000000..2030366994d1
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
@@ -0,0 +1,134 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ti,ds90ub953.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments DS90UB953 FPD-Link III Serializer
+
+maintainers:
+  - Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
+
+description:
+  The TI DS90UB953 is an FPD-Link III video serializer for MIPI CSI-2.
+
+properties:
+  compatible:
+    enum:
+      - ti,ds90ub953-q1
+      - ti,ds90ub971-q1
+
+  '#gpio-cells':
+    const: 2
+    description:
+      First cell is the GPIO pin number, second cell is the flags. The GPIO pin
+      number must be in range of [0, 3].
+
+  gpio-controller: true
+
+  clocks:
+    maxItems: 1
+    description:
+      Reference clock connected to the CLKIN pin.
+
+  clock-names:
+    items:
+      - const: clkin
+
+  '#clock-cells':
+    const: 0
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: CSI-2 input port
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            required:
+              - data-lanes
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        unevaluatedProperties: false
+        description: FPD-Link III output port
+
+    required:
+      - port@0
+      - port@1
+
+  i2c:
+    $ref: /schemas/i2c/i2c-controller.yaml#
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - '#gpio-cells'
+  - gpio-controller
+  - '#clock-cells'
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    serializer {
+      compatible = "ti,ds90ub953-q1";
+
+      gpio-controller;
+      #gpio-cells = <2>;
+
+      #clock-cells = <0>;
+
+      ports {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        port@0 {
+          reg = <0>;
+          ub953_in: endpoint {
+            clock-lanes = <0>;
+            data-lanes = <1 2 3 4>;
+            remote-endpoint = <&sensor_out>;
+          };
+        };
+
+        port@1 {
+          reg = <1>;
+          endpoint {
+            remote-endpoint = <&deser_fpd_in>;
+          };
+        };
+      };
+
+      i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        sensor@1a {
+          compatible = "sony,imx274";
+          reg = <0x1a>;
+
+          reset-gpios = <&serializer 0 GPIO_ACTIVE_LOW>;
+
+          clocks = <&serializer>;
+          clock-names = "inck";
+
+          port {
+            sensor_out: endpoint {
+              remote-endpoint = <&ub953_in>;
+            };
+          };
+        };
+      };
+    };
+...
-- 
2.34.1

