Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB061398A79
	for <lists+linux-media@lfdr.de>; Wed,  2 Jun 2021 15:29:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229944AbhFBNbk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Jun 2021 09:31:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229667AbhFBNbh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Jun 2021 09:31:37 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E66F9C06174A
        for <linux-media@vger.kernel.org>; Wed,  2 Jun 2021 06:29:53 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1loQwS-0006lI-89; Wed, 02 Jun 2021 15:29:52 +0200
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1loQwR-0001rT-4Q; Wed, 02 Jun 2021 15:29:51 +0200
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1loQwQ-00HUC5-VP; Wed, 02 Jun 2021 15:29:50 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        kernel@pengutronix.de, Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH v2 1/2] media: dt-bindings: Add Intersil ISL79987 DT bindings
Date:   Wed,  2 Jun 2021 15:29:49 +0200
Message-Id: <20210602132950.4167596-2-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210602132950.4167596-1-m.tretter@pengutronix.de>
References: <20210602132950.4167596-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Marek Vasut <marex@denx.de>

Add bindings for the Intersil ISL79987 analog to MIPI CSI-2 decoder.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
To: linux-media@vger.kernel.org
Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
Changelog:

v2:

- convert binding to yaml
- change description to match only isl79987
- replace num-inputs property with multiple ports
- add reset gpio
---
 .../bindings/media/i2c/isil,isl79987.yaml     | 108 ++++++++++++++++++
 1 file changed, 108 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/isil,isl79987.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/isil,isl79987.yaml b/Documentation/devicetree/bindings/media/i2c/isil,isl79987.yaml
new file mode 100644
index 000000000000..4aa27511b1ab
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/isil,isl79987.yaml
@@ -0,0 +1,108 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/isil,isl79987.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Intersil ISL79987 Analog to MIPI CSI-2 decoder
+
+maintainers:
+  - Michael Tretter <m.tretter@pengutronix.de>
+  - Marek Vasut <marex@denx.de>
+
+description:
+  The Intersil ISL79987 is an analog to MIPI CSI-2 decoder which is capable of
+  receiving up to four analog stream and multiplexing them into up to four MIPI
+  CSI-2 virtual channels, using one MIPI clock lane and 1/2 data lanes.
+
+properties:
+  compatible:
+    enum:
+      - isil,isl79987
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+    description:
+      A GPIO spec for the RSTB pin (active high)
+
+  pd-gpios:
+    maxItems: 1
+    description:
+      A GPIO spec for the Power Down pin (active high)
+
+  ports:
+    type: object
+    description:
+      A node containing input and output port nodes with endpoint definitions
+      as documented in
+      Documentation/devicetree/bindings/media/video-interfaces.txt
+    properties:
+      '#address-cells':
+        const: 1
+      '#size-cells':
+        const: 0
+      port@0:
+        type: object
+        description: Output port
+
+    patternProperties:
+      "^port@[1-4]$":
+        type: object
+        description: Input ports
+
+    required:
+      - port@0
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - ports
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      isl7998x_mipi@44 {
+        compatible = "isil,isl79987";
+        reg = <0x44>;
+        pd-gpios = <&gpio3 27 GPIO_ACTIVE_HIGH>;
+        reset-gpios = <&gpio3 28 GPIO_ACTIVE_HIGH>;
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          port@0 {
+            reg = <0>;
+            isl79987_out: endpoint {
+              remote-endpoint = <&mipi_csi2_in>;
+              clock-lanes = <0>;
+              data-lanes = <1 2>;
+            };
+          };
+
+          port@1 {
+            reg = <1>;
+            endpoint {
+              remote-endpoint = <&camera_0>;
+            };
+          };
+
+          port@2 {
+            reg = <2>;
+            endpoint {
+              remote-endpoint = <&camera_1>;
+            };
+          };
+        };
+      };
+    };
-- 
2.29.2

