Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E839C34EA2C
	for <lists+linux-media@lfdr.de>; Tue, 30 Mar 2021 16:21:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231622AbhC3OUz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Mar 2021 10:20:55 -0400
Received: from mga03.intel.com ([134.134.136.65]:27451 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231532AbhC3OUb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Mar 2021 10:20:31 -0400
IronPort-SDR: lZSUeanCsFMLjPQXX05sblPPHL25NdMq5h7PUVLdtV2628FG3mF1Y77zGgZNYIOJsaT+zavKBu
 ldSy4efLM8eg==
X-IronPort-AV: E=McAfee;i="6000,8403,9939"; a="191805418"
X-IronPort-AV: E=Sophos;i="5.81,291,1610438400"; 
   d="scan'208";a="191805418"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2021 07:20:30 -0700
IronPort-SDR: FCfx3B6GcQxh9NHKwnnggcnrnvomr1+prz/VMD6HvpvPvwN14VhUBEbtY2yBIXLiBbVpbtWiTK
 Hfiw2RsRDjAw==
X-IronPort-AV: E=Sophos;i="5.81,291,1610438400"; 
   d="scan'208";a="418190197"
Received: from mkrastex-mobl.ger.corp.intel.com ([10.104.88.1])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2021 07:20:28 -0700
From:   Martina Krasteva <martinax.krasteva@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
        sakari.ailus@linux.intel.com,
        daniele.alessandrelli@linux.intel.com,
        paul.j.murphy@linux.intel.com,
        gjorgjix.rosikopulos@linux.intel.com,
        martinax.krasteva@linux.intel.com
Subject: [PATCH 1/6] dt-bindings: media: Add bindings for imx335
Date:   Tue, 30 Mar 2021 15:20:18 +0100
Message-Id: <20210330142023.141-2-martinax.krasteva@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210330142023.141-1-martinax.krasteva@linux.intel.com>
References: <20210330142023.141-1-martinax.krasteva@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Martina Krasteva <martinax.krasteva@intel.com>

- Add dt-bindings documentation for Sony imx335 sensor driver
- Add MAINTAINERS entry for Sony imx335 binding documentation

Signed-off-by: Martina Krasteva <martinax.krasteva@intel.com>
Acked-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
Acked-by: Paul J. Murphy <paul.j.murphy@intel.com>
---
 .../devicetree/bindings/media/i2c/sony,imx335.yaml | 90 ++++++++++++++++++++++
 MAINTAINERS                                        |  8 ++
 2 files changed, 98 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
new file mode 100644
index 000000000000..0e286226ad9b
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
@@ -0,0 +1,90 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2021 Intel Corporation
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/sony,imx335.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sony IMX335 Sensor
+
+maintainers:
+  - Paul J. Murphy <paul.j.murphy@intel.com>
+  - Daniele Alessandrelli <daniele.alessandrelli@intel.com>
+
+description:
+  IMX335 sensor is a Sony CMOS active pixel digital image sensor with an active
+  array size of 2592H x 1944V. It is programmable through I2C interface. The
+  I2C client address is fixed to 0x1a as per sensor data sheet. Image data is
+  sent through MIPI CSI-2.
+
+properties:
+  compatible:
+    const: sony,imx335
+  reg:
+    description: I2C address
+    maxItems: 1
+
+  assigned-clocks: true
+  assigned-clock-parents: true
+  assigned-clock-rates: true
+
+  clocks:
+    description: Clock frequency from 6 to 27 MHz, 37.125MHz, 74.25MHz
+    maxItems: 1
+
+  reset-gpios:
+    description: Reference to the GPIO connected to the XCLR pin, if any.
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
+        camera@1a {
+            compatible = "sony,imx335";
+            reg = <0x1a>;
+            clocks = <&imx335_clk>;
+
+            assigned-clocks = <&imx335_clk>;
+            assigned-clock-parents = <&imx335_clk_parent>;
+            assigned-clock-rates = <24000000>;
+
+            port {
+                imx335: endpoint {
+                    remote-endpoint = <&cam>;
+                    data-lanes = <1 2 3 4>;
+                    link-frequencies = /bits/ 64 <594000000>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index cd988b258fe0..510e3c4a45b6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16875,6 +16875,14 @@ T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
 F:	drivers/media/i2c/imx334.c
 
+SONY IMX335 SENSOR DRIVER
+M:	Paul J. Murphy <paul.j.murphy@intel.com>
+M:	Daniele Alessandrelli <daniele.alessandrelli@intel.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
+
 SONY IMX355 SENSOR DRIVER
 M:	Tianshu Qiu <tian.shu.qiu@intel.com>
 L:	linux-media@vger.kernel.org
-- 
2.11.0

