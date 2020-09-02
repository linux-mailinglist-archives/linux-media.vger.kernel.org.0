Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5186925A649
	for <lists+linux-media@lfdr.de>; Wed,  2 Sep 2020 09:18:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726323AbgIBHSa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Sep 2020 03:18:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:55202 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726167AbgIBHS3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Sep 2020 03:18:29 -0400
Received: from PC-kkoz.proceq.com (unknown [213.160.61.66])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 85EF82072A;
        Wed,  2 Sep 2020 07:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599031108;
        bh=Cvo0zgOycrOABxtZ9j6bV61j8XnfkWhbAJxrKlR5Ios=;
        h=From:To:Subject:Date:From;
        b=FPK2r/H8m8/1jaAyBTeB3c2P4EQhToTVhAb2cV0W3PYsPms7bNH1U7qqtm70Cw3HP
         HRrWGUmyWF/x+JTzgdQNREWaGgYEhNQs7wu3uRUPcSD2DFFUiUu16ZGAIPI89A3RGp
         XgtgrmlC/5N22zTSW0QsHDl+xXeLxIw1y5uq+vmM=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: media: imx258: Add bindings for IMX258 sensor
Date:   Wed,  2 Sep 2020 09:18:08 +0200
Message-Id: <1599031090-21608-1-git-send-email-krzk@kernel.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add bindings for the IMX258 camera sensor.  The bindings, just like the
driver, are quite limited, e.g. do not support regulator supplies.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. None
---
 .../devicetree/bindings/media/i2c/imx258.yaml      | 92 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 93 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/imx258.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/imx258.yaml b/Documentation/devicetree/bindings/media/i2c/imx258.yaml
new file mode 100644
index 000000000000..ef789ad31143
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/imx258.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/imx258.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sony IMX258 13 Mpixel CMOS Digital Image Sensor
+
+maintainers:
+  - Krzysztof Kozlowski <krzk@kernel.org>
+
+description: |-
+  IMX258 is a diagonal 5.867mm (Type 1/3.06) 13 Mega-pixel CMOS active pixel
+  type stacked image sensor with a square pixel array of size 4208 x 3120. It
+  is programmable through I2C interface.  Image data is sent through MIPI
+  CSI-2.
+
+properties:
+  compatible:
+    const: sony,imx258
+
+  clocks:
+    maxItems: 1
+
+  clock-frequency:
+    description: Frequency of input clock if clock is not provided
+    deprecated: true
+    const: 19200000
+
+  reg:
+    maxItems: 1
+
+  # See ../video-interfaces.txt for more details
+  port:
+    type: object
+    properties:
+      endpoint:
+        type: object
+        properties:
+          data-lanes:
+            items:
+              - const: 1
+              - const: 2
+              - const: 3
+              - const: 4
+
+          link-frequencies:
+            allOf:
+              - $ref: /schemas/types.yaml#/definitions/uint64-array
+            description:
+              Allowed data bus frequencies.
+
+        required:
+          - data-lanes
+          - link-frequencies
+
+required:
+  - compatible
+  - reg
+  - port
+
+
+if:
+  not:
+    required:
+      - clocks
+then:
+  required:
+    - clock-frequency
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        sensor@6c {
+            compatible = "sony,imx258";
+            reg = <0x6c>;
+            clocks = <&imx258_clk>;
+
+            port {
+                imx258_ep: endpoint {
+                    remote-endpoint = <&csi1_ep>;
+                    data-lanes = <1 2 3 4>;
+                    link-frequencies = /bits/ 64 <320000000>;
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index dc2aa691b75a..cca13d483d22 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16130,6 +16130,7 @@ M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/i2c/imx258.yaml
 F:	drivers/media/i2c/imx258.c
 
 SONY IMX274 SENSOR DRIVER
-- 
2.7.4

