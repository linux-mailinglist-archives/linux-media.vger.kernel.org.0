Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 592597A8A57
	for <lists+linux-media@lfdr.de>; Wed, 20 Sep 2023 19:12:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235650AbjITRMa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Sep 2023 13:12:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235609AbjITRMT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Sep 2023 13:12:19 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DEAF130;
        Wed, 20 Sep 2023 10:11:46 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7D12211A9;
        Wed, 20 Sep 2023 19:10:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1695229807;
        bh=qokP3+5LpbWRpdJmY5ukz9h+3AKRRyW90W1dlQD20dE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Wc5Vw5C8m4oPoWhphjpDtKFSkDoHiaiplvJeEzbv0E1Km22HcHh/kOz2tjVWYGopR
         F8ZpslRCy9V922SHsQQfpBUC6z7iXOJmUmVGV6X6x13a0PZ5lQrm/4s2M8Pc0MDXUt
         x4lyhPKOUXGy9oB2e5zUAReAvad0+0EMcJ3kGtts=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v4 1/2] media: dt-bindings: media: i2c: Add MT9M114 camera sensor binding
Date:   Wed, 20 Sep 2023 20:11:53 +0300
Message-ID: <20230920171155.7648-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230920171155.7648-1-laurent.pinchart@ideasonboard.com>
References: <20230920171155.7648-1-laurent.pinchart@ideasonboard.com>
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

Add device tree binding for the onsemi MT9M114 CMOS camera sensor.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes since v3:

- Fix typo in MAINTAINERS

Changes since v2:

- Use media bus type defines
- Add link-frequencies

Changes since v1:

- Use graph schema
- Drop unneeded properties
- Rename ON Semiconductor to onsemi
---
 .../bindings/media/i2c/onnn,mt9m114.yaml      | 114 ++++++++++++++++++
 MAINTAINERS                                   |   7 ++
 2 files changed, 121 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
new file mode 100644
index 000000000000..f6b87892068a
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
@@ -0,0 +1,114 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/onnn,mt9m114.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: onsemi 1/6-inch 720p CMOS Digital Image Sensor
+
+maintainers:
+  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+
+description: |-
+  The onsemi MT9M114 is a 1/6-inch 720p (1.26 Mp) CMOS digital image sensor
+  with an active pixel-array size of 1296H x 976V. It is programmable through
+  an I2C interface and outputs image data over a 8-bit parallel or 1-lane MIPI
+  CSI-2 connection.
+
+properties:
+  compatible:
+    const: onnn,mt9m114
+
+  reg:
+    description: I2C device address
+    enum:
+      - 0x48
+      - 0x5d
+
+  clocks:
+    description: EXTCLK clock signal
+    maxItems: 1
+
+  vdd-supply:
+    description:
+      Core digital voltage supply, 1.8V
+
+  vddio-supply:
+    description:
+      I/O digital voltage supply, 1.8V or 2.8V
+
+  vaa-supply:
+    description:
+      Analog voltage supply, 2.8V
+
+  reset-gpios:
+    description: |-
+      Reference to the GPIO connected to the RESET_BAR pin, if any (active
+      low).
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        additionalProperties: false
+
+        properties:
+          bus-type:
+            enum: [4, 5, 6]
+
+          link-frequencies: true
+          remote-endpoint: true
+
+          # The number and mapping of lanes (for CSI-2), and the bus width and
+          # signal polarities (for parallel and BT.656) are fixed and must not
+          # be specified.
+
+        required:
+          - bus-type
+          - link-frequencies
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - vdd-supply
+  - vddio-supply
+  - vaa-supply
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/media/video-interfaces.h>
+
+    i2c0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        sensor@48 {
+            compatible = "onnn,mt9m114";
+            reg = <0x48>;
+
+            clocks = <&clk24m 0>;
+
+            reset-gpios = <&gpio5 21 GPIO_ACTIVE_LOW>;
+
+            vddio-supply = <&reg_cam_1v8>;
+            vdd-supply = <&reg_cam_1v8>;
+            vaa-supply = <&reg_2p8v>;
+
+            port {
+                endpoint {
+                    bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+                    link-frequencies = /bits/ 64 <384000000>;
+                    remote-endpoint = <&mipi_csi_in>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 90f13281d297..52a60e7c3461 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14539,6 +14539,13 @@ L:	linux-mtd@lists.infradead.org
 S:	Maintained
 F:	drivers/mtd/devices/docg3*
 
+MT9M114 ONSEMI SENSOR DRIVER
+M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
+
 MT9P031 APTINA CAMERA SENSOR
 M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
 L:	linux-media@vger.kernel.org
-- 
Regards,

Laurent Pinchart

