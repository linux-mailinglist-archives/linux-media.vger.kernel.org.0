Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DB74307337
	for <lists+linux-media@lfdr.de>; Thu, 28 Jan 2021 10:54:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231846AbhA1Jyj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jan 2021 04:54:39 -0500
Received: from retiisi.eu ([95.216.213.190]:38636 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231745AbhA1Jyf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jan 2021 04:54:35 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id D2B24634C87
        for <linux-media@vger.kernel.org>; Thu, 28 Jan 2021 11:50:55 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 1/1] dt-bindings: Remove old ov5647.yaml file, update ovti,ov5647.yaml
Date:   Thu, 28 Jan 2021 11:47:59 +0200
Message-Id: <20210128094759.31172-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Recently ov5647.yaml got renamed as ovti,ov5647.yaml. As part of the
video-interfaces DT schema conversion that was unintentionally brought
back. Fix this by applying the schema changes to the new file and removing
the old one.

Fixes: 066a94e28a23 ("media: dt-bindings: media: Use graph and video-interfaces schemas")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../devicetree/bindings/media/i2c/ov5647.yaml | 76 -------------------
 .../bindings/media/i2c/ovti,ov5647.yaml       | 20 +----
 2 files changed, 4 insertions(+), 92 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov5647.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ov5647.yaml b/Documentation/devicetree/bindings/media/i2c/ov5647.yaml
deleted file mode 100644
index 3b1ea9da437a..000000000000
--- a/Documentation/devicetree/bindings/media/i2c/ov5647.yaml
+++ /dev/null
@@ -1,76 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/media/i2c/ov5647.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Omnivision OV5647 raw image sensor
-
-maintainers:
-  - Dave Stevenson <dave.stevenson@raspberrypi.com>
-  - Jacopo Mondi <jacopo@jmondi.org>
-
-description: |-
-  The OV5647 is a raw image sensor with MIPI CSI-2 and CCP2 image data
-  interfaces and CCI (I2C compatible) control bus.
-
-properties:
-  compatible:
-    const: ovti,ov5647
-
-  reg:
-    description: I2C device address.
-    maxItems: 1
-
-  clocks:
-    description: Reference to the xclk clock.
-    maxItems: 1
-
-  pwdn-gpios:
-    description: Reference to the GPIO connected to the pwdn pin. Active high.
-    maxItems: 1
-
-  port:
-    $ref: /schemas/graph.yaml#/$defs/port-base
-
-    properties:
-      endpoint:
-        $ref: /schemas/media/video-interfaces.yaml#
-        unevaluatedProperties: false
-
-        properties:
-          clock-noncontinuous: true
-
-    additionalProperties: false
-
-required:
-  - compatible
-  - reg
-  - clocks
-  - port
-
-additionalProperties: false
-
-examples:
-  - |
-    #include <dt-bindings/gpio/gpio.h>
-
-    i2c {
-        #address-cells = <1>;
-        #size-cells = <0>;
-
-        ov5647: camera@36 {
-            compatible = "ovti,ov5647";
-            reg = <0x36>;
-            clocks = <&camera_clk>;
-            pwdn-gpios = <&pioE 29 GPIO_ACTIVE_HIGH>;
-
-            port {
-                camera_out: endpoint {
-                    remote-endpoint = <&csi1_ep1>;
-                };
-            };
-        };
-    };
-
-...
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
index 429566c9ee1d..1ab22e75d3c6 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
@@ -31,27 +31,15 @@ properties:
     maxItems: 1
 
   port:
-    type: object
-    description: |-
-      Should contain one endpoint sub-node used to model connection to the
-      video receiver according to the specification defined in
-      Documentation/devicetree/bindings/media/video-interfaces.txt.
+    $ref: /schemas/graph.yaml#/$defs/port-base
 
     properties:
       endpoint:
-        type: object
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
 
         properties:
-          remote-endpoint:
-            description: |-
-              phandle to the video receiver input port.
-
-          clock-noncontinuous:
-            type: boolean
-            description: |-
-              Set to true to allow MIPI CSI-2 non-continuous clock operations.
-
-        additionalProperties: false
+          clock-noncontinuous: true
 
     additionalProperties: false
 
-- 
2.29.2

