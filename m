Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7A1D3930B8
	for <lists+linux-media@lfdr.de>; Thu, 27 May 2021 16:21:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236383AbhE0OXb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 May 2021 10:23:31 -0400
Received: from mga01.intel.com ([192.55.52.88]:47557 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235487AbhE0OXb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 May 2021 10:23:31 -0400
IronPort-SDR: Hz+Ze1DX+GrAnS0NdNU23rsVuQ2nSaJJKqrvrbXZhYDFNjNWxBuvapV4UWYYOJEHGlgeFlkm4N
 M8E61MI27Taw==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="223947927"
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; 
   d="scan'208";a="223947927"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2021 07:21:58 -0700
IronPort-SDR: ADab2WvjUy383KyM4OYRkWQ8fzikLIFIxf+A8/JgEQRyshuq1/kUbLf5YBfS62qRzw6604sFXI
 0ldVMQavFoZw==
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; 
   d="scan'208";a="477506771"
Received: from mkrastex-mobl.ger.corp.intel.com ([10.104.88.6])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2021 07:21:56 -0700
From:   Martina Krasteva <martinax.krasteva@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
        sakari.ailus@linux.intel.com,
        daniele.alessandrelli@linux.intel.com,
        paul.j.murphy@linux.intel.com,
        gjorgjix.rosikopulos@linux.intel.com,
        martinax.krasteva@linux.intel.com
Subject: [PATCH v2 3/6] dt-bindings: media: Add bindings for imx412
Date:   Thu, 27 May 2021 15:21:42 +0100
Message-Id: <20210527142145.173-4-martinax.krasteva@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210527142145.173-1-martinax.krasteva@linux.intel.com>
References: <20210527142145.173-1-martinax.krasteva@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Martina Krasteva <martinax.krasteva@intel.com>

- Add dt-bindings documentation for Sony imx412 sensor driver
- Add MAINTAINERS entry for Sony imx412 binding documentation

Signed-off-by: Martina Krasteva <martinax.krasteva@intel.com>
Acked-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
Acked-by: Paul J. Murphy <paul.j.murphy@intel.com>
---
 .../devicetree/bindings/media/i2c/sony,imx412.yaml | 91 ++++++++++++++++++++++
 MAINTAINERS                                        |  8 ++
 2 files changed, 99 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
new file mode 100644
index 000000000000..1edeabf39e6a
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2021 Intel Corporation
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/sony,imx412.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sony IMX412 Sensor
+
+maintainers:
+  - Paul J. Murphy <paul.j.murphy@intel.com>
+  - Daniele Alessandrelli <daniele.alessandrelli@intel.com>
+
+description:
+  IMX412 sensor is a Sony CMOS active pixel digital image sensor with an active
+  array size of 4072H x 3176V. It is programmable through I2C interface. The
+  I2C client address is fixed to 0x1a as per sensor data sheet. Image data is
+  sent through MIPI CSI-2.
+
+properties:
+  compatible:
+    const: sony,imx412
+  reg:
+    description: I2C address
+    maxItems: 1
+
+  assigned-clocks: true
+  assigned-clock-parents: true
+  assigned-clock-rates: true
+
+  clocks:
+    description: Clock frequency 6MHz, 12MHz, 18MHz, 24MHz or 27MHz
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
+        camera@1a {
+            compatible = "sony,imx412";
+            reg = <0x1a>;
+            clocks = <&imx412_clk>;
+
+            assigned-clocks = <&imx412_clk>;
+            assigned-clock-parents = <&imx412_clk_parent>;
+            assigned-clock-rates = <24000000>;
+
+            port {
+                imx412: endpoint {
+                    remote-endpoint = <&cam>;
+                    data-lanes = <1 2 3 4>;
+                    link-frequencies = /bits/ 64 <600000000>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 0ed3b572f316..aaf7f8559972 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17155,6 +17155,14 @@ S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
 F:	drivers/media/i2c/imx355.c
 
+SONY IMX412 SENSOR DRIVER
+M:	Paul J. Murphy <paul.j.murphy@intel.com>
+M:	Daniele Alessandrelli <daniele.alessandrelli@intel.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
+
 SONY MEMORYSTICK SUBSYSTEM
 M:	Maxim Levitsky <maximlevitsky@gmail.com>
 M:	Alex Dubov <oakad@yahoo.com>
-- 
2.11.0

