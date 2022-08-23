Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2232D59CD71
	for <lists+linux-media@lfdr.de>; Tue, 23 Aug 2022 02:58:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237357AbiHWA6g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Aug 2022 20:58:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232069AbiHWA6d (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Aug 2022 20:58:33 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AEE012755;
        Mon, 22 Aug 2022 17:58:29 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4DEEE3F1;
        Tue, 23 Aug 2022 02:58:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661216308;
        bh=2SFq0F2WMMzIZdSW/pFB+flleOEVq6WUQggwOs3fF8k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lBdPozDMeS2tLHsiGmpFTTHoTSkJ6raTnw1eRuYCWCDgQANNVtLL5/bS7Coao7QlQ
         h5MRwte3iJw9MWl8O+8bnd7lhX76M/NPay2cAUA3uOPjbcNz4nhJHXLtmKQ0DQZ7Hi
         6N3CUZbQJDp90aKpz11+drzYL4qWKlLYTBISaAZg=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: media: i2c: Add IMX296 CMOS sensor binding
Date:   Tue, 23 Aug 2022 03:58:21 +0300
Message-Id: <20220823005822.13805-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220823005822.13805-1-laurent.pinchart@ideasonboard.com>
References: <20220823005822.13805-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Add YAML devicetree binding for IMX296 CMOS image sensor. Let's also
add MAINTAINERS entry for the binding and driver.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes since v2:

- Add model-specific compatible strings

Changes since v4 (in separate series):

- Rename to sony,imx296.yaml
- Add Laurent Pinchart as maintainer
- Rename power supplies
- Rename clock to INCK
- Drop clock-frequency property
- Reference OF graph DT schema
- Mention reset GPIO pin name
- Fix schema $id
- Fix port
---
 .../bindings/media/i2c/sony,imx296.yaml       | 106 ++++++++++++++++++
 MAINTAINERS                                   |   8 ++
 2 files changed, 114 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx296.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx296.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx296.yaml
new file mode 100644
index 000000000000..65ad9c100e45
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx296.yaml
@@ -0,0 +1,106 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/sony,imx296.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sony IMX296 1/2.8-Inch CMOS Image Sensor
+
+maintainers:
+  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+
+description: |-
+  The Sony IMX296 is a 1/2.9-Inch active pixel type CMOS Solid-state image
+  sensor with square pixel array and 1.58 M effective pixels. This chip
+  features a global shutter with variable charge-integration time. It is
+  programmable through I2C and 4-wire interfaces. The sensor output is
+  available via CSI-2 serial data output (1 Lane).
+
+properties:
+  compatible:
+    enum:
+      - sony,imx296
+      - sony,imx296ll
+      - sony,imx296lq
+    description:
+      The IMX296 sensor exists in two different models, a colour variant
+      (IMX296LQ) and a monochrome variant (IMX296LL). The device exposes the
+      model through registers, allowing for auto-detection with a common
+      "sony,imx296" compatible string. However, some camera modules disable the
+      ability to read the sensor model register, which disables this feature.
+      In those cases, the exact model needs to be specified as "sony,imx296ll"
+      or "sony,imx296lq".
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    description: Input clock (37.125 MHz, 54 MHz or 74.25 MHz)
+    items:
+      - const: inck
+
+  avdd-supply:
+    description: Analog power supply (3.3V)
+
+  dvdd-supply:
+    description: Digital power supply (1.2V)
+
+  ovdd-supply:
+    description: Interface power supply (1.8V)
+
+  reset-gpios:
+    description: Sensor reset (XCLR) GPIO
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - avdd-supply
+  - dvdd-supply
+  - ovdd-supply
+  - port
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
+        imx296: camera-sensor@1a {
+            compatible = "sony,imx296";
+            reg = <0x1a>;
+
+            pinctrl-names = "default";
+            pinctrl-0 = <&camera_rear_default>;
+
+            clocks = <&gcc 90>;
+            clock-names = "inck";
+
+            avdd-supply = <&camera_vdda_3v3>;
+            dvdd-supply = <&camera_vddd_1v2>;
+            ovdd-supply = <&camera_vddo_1v8>;
+
+            reset-gpios = <&msmgpio 35 GPIO_ACTIVE_LOW>;
+
+            port {
+                imx296_ep: endpoint {
+                    remote-endpoint = <&csiphy0_ep>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 9d7f64dc0efe..34e5b6e43f88 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18959,6 +18959,14 @@ T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/i2c/imx290.txt
 F:	drivers/media/i2c/imx290.c
 
+SONY IMX296 SENSOR DRIVER
+M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/i2c/sony,imx296.yaml
+
 SONY IMX319 SENSOR DRIVER
 M:	Bingbu Cao <bingbu.cao@intel.com>
 L:	linux-media@vger.kernel.org
-- 
Regards,

Laurent Pinchart

