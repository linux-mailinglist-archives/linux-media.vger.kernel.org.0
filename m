Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96B643930BD
	for <lists+linux-media@lfdr.de>; Thu, 27 May 2021 16:22:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236404AbhE0OXk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 May 2021 10:23:40 -0400
Received: from mga01.intel.com ([192.55.52.88]:47557 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236388AbhE0OXh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 May 2021 10:23:37 -0400
IronPort-SDR: OYxfe718Zz+e7rJluglaJNEIOvh5/Rds44hsdO+SkBW+aYTOSXP0iw3uVeOWr0ke2h5DuXagFX
 9QGAG4LnUfXw==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="223947944"
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; 
   d="scan'208";a="223947944"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2021 07:22:04 -0700
IronPort-SDR: KWcm4nC7niH1DFOmppvjQNF/wbXZlZ9IfB8MnpQh6q1VAY9W88J8EpnauHYhoGfin9MOgpgSnh
 RpmSgERGI7CQ==
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; 
   d="scan'208";a="477506801"
Received: from mkrastex-mobl.ger.corp.intel.com ([10.104.88.6])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2021 07:22:01 -0700
From:   Martina Krasteva <martinax.krasteva@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
        sakari.ailus@linux.intel.com,
        daniele.alessandrelli@linux.intel.com,
        paul.j.murphy@linux.intel.com,
        gjorgjix.rosikopulos@linux.intel.com,
        martinax.krasteva@linux.intel.com
Subject: [PATCH v2 5/6] dt-bindings: media: Add bindings for ov9282
Date:   Thu, 27 May 2021 15:21:44 +0100
Message-Id: <20210527142145.173-6-martinax.krasteva@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210527142145.173-1-martinax.krasteva@linux.intel.com>
References: <20210527142145.173-1-martinax.krasteva@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Martina Krasteva <martinax.krasteva@intel.com>

- Add dt-bindings documentation for OmniVision ov9282 sensor driver
- Add MAINTAINERS entry for OmniVision ov9282 binding documentation

Signed-off-by: Martina Krasteva <martinax.krasteva@intel.com>
Acked-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
Acked-by: Paul J. Murphy <paul.j.murphy@intel.com>
---
 .../devicetree/bindings/media/i2c/ovti,ov9282.yaml | 91 ++++++++++++++++++++++
 MAINTAINERS                                        |  8 ++
 2 files changed, 99 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
new file mode 100644
index 000000000000..ad42992c6da3
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2021 Intel Corporation
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,ov9282.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OmniVision OV9282 Sensor
+
+maintainers:
+  - Paul J. Murphy <paul.j.murphy@intel.com>
+  - Daniele Alessandrelli <daniele.alessandrelli@intel.com>
+
+description:
+  OV9282 sensor is an OmniVision black & white CMOS active pixel digital image
+  sensor with an active array size of 1296H x 816V. It is programmable through
+  I2C interface. The I2C client address is fixed to 0x60/0x70 as per sensor data
+  sheet. Image data is sent through MIPI CSI-2.
+
+properties:
+  compatible:
+    const: ovti,ov9282
+  reg:
+    description: I2C address
+    maxItems: 1
+
+  assigned-clocks: true
+  assigned-clock-parents: true
+  assigned-clock-rates: true
+
+  clocks:
+    description: Clock frequency from 6 to 27MHz
+    maxItems: 1
+
+  reset-gpios:
+    description: Reference to the GPIO connected to the XCLR pin, if any.
+    maxItems: 1
+
+  port:
+    additionalProperties: false
+    $ref: /schemas/graph.yaml#/properties/port
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes: true
+          link-frequencies: true
+
+        required:
+          - data-lanes
+          - link-frequencies
+
+    required:
+      - endpoint
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
+    i2c0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera@60 {
+            compatible = "ovti,ov9282";
+            reg = <0x60>;
+            clocks = <&ov9282_clk>;
+
+            assigned-clocks = <&ov9282_clk>;
+            assigned-clock-parents = <&ov9282_clk_parent>;
+            assigned-clock-rates = <24000000>;
+
+            port {
+                ov9282: endpoint {
+                    remote-endpoint = <&cam>;
+                    data-lanes = <1 2>;
+                    link-frequencies = /bits/ 64 <800000000>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index bc26a8e36df7..c0fa97f8755e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13650,6 +13650,14 @@ T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/i2c/ov8856.yaml
 F:	drivers/media/i2c/ov8856.c
 
+OMNIVISION OV9282 SENSOR DRIVER
+M:	Paul J. Murphy <paul.j.murphy@intel.com>
+M:	Daniele Alessandrelli <daniele.alessandrelli@intel.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
+
 OMNIVISION OV9640 SENSOR DRIVER
 M:	Petr Cvek <petrcvekcz@gmail.com>
 L:	linux-media@vger.kernel.org
-- 
2.11.0

