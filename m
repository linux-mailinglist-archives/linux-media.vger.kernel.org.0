Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D39830ADC4
	for <lists+linux-media@lfdr.de>; Mon,  1 Feb 2021 18:28:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231610AbhBAR0r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Feb 2021 12:26:47 -0500
Received: from mga05.intel.com ([192.55.52.43]:30399 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231466AbhBAR0j (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Feb 2021 12:26:39 -0500
IronPort-SDR: CSX6vR0+VEyc5F/ZAbJgLDromzxBKaCoUFpgxuHBQT3q+8V9Rcj3uGIH0cXt6dijGsXWIr3ZhB
 PnK3LDUsAyqw==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="265552663"
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; 
   d="scan'208";a="265552663"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 09:24:54 -0800
IronPort-SDR: Xu1TykU9ovM0RMib8AX5AWF7ZQlYkjZfyhpkNeIqLQ1CzSSuBa5q/ZynfIYqjUSLKzHyy2Ow0D
 B+HCEdiMSIXQ==
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; 
   d="scan'208";a="391007231"
Received: from mkrastex-mobl.ger.corp.intel.com ([10.104.80.35])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 09:24:51 -0800
From:   Martina Krasteva <martinax.krasteva@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
        sakari.ailus@linux.intel.com,
        daniele.alessandrelli@linux.intel.com,
        paul.j.murphy@linux.intel.com,
        gjorgjix.rosikopulos@linux.intel.com,
        martinax.krasteva@linux.intel.com
Subject: [PATCH v5 1/2] dt-bindings: media: Add bindings for imx334
Date:   Mon,  1 Feb 2021 17:24:44 +0000
Message-Id: <20210201172445.164-2-martinax.krasteva@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210201172445.164-1-martinax.krasteva@linux.intel.com>
References: <20210201172445.164-1-martinax.krasteva@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Martina Krasteva <martinax.krasteva@intel.com>

- Add dt-bindings documentation for Sony imx334 sensor driver.
- Add MAINTAINERS entry for Sony imx334 binding documentation.

Signed-off-by: Martina Krasteva <martinax.krasteva@intel.com>
Reviewed-by: Gjorgji Rosikopulos <gjorgjix.rosikopulos@intel.com>
Acked-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
Acked-by: Paul J. Murphy <paul.j.murphy@intel.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/media/i2c/sony,imx334.yaml | 77 ++++++++++++++++++++++
 MAINTAINERS                                        |  8 +++
 2 files changed, 85 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
new file mode 100644
index 000000000000..e6b4f41f3232
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2021 Intel Corporation
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/sony,imx334.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sony IMX334 Sensor
+
+maintainers:
+  - Paul J. Murphy <paul.j.murphy@intel.com>
+  - Daniele Alessandrelli <daniele.alessandrelli@intel.com>
+
+description:
+  IMX334 sensor is a Sony CMOS active pixel digital image sensor with an active
+  array size of 3864H x 2202V. It is programmable through I2C interface. The
+  I2C client address is fixed to 0x1a as per sensor data sheet. Image data is
+  sent through MIPI CSI-2.
+
+properties:
+  compatible:
+    const: sony,imx334
+  reg:
+    description: I2C address
+    maxItems: 1
+
+  port:
+    type: object
+    additionalProperties: false
+    $ref: /schemas/graph.yaml#/properties/port
+
+    properties:
+      endpoint:
+        type: object
+        properties:
+          data-lanes:
+            $ref: ../video-interfaces.yaml#/properties/data-lanes
+          link-frequencies:
+            $ref: ../video-interfaces.yaml#/properties/link-frequencies
+            description:
+              Allowed data bus frequencies are 891000000, 594000000 and
+              455500000 Hz.
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
+            compatible = "sony,imx334";
+            reg = <0x1a>;
+
+            port {
+                imx334: endpoint {
+                    remote-endpoint = <&cam>;
+                    data-lanes = <1 2 3 4>;
+                    link-frequencies = /bits/ 64 <891000000>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 3353de0c4bc8..2ab75519938a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16589,6 +16589,14 @@ S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
 F:	drivers/media/i2c/imx319.c
 
+SONY IMX334 SENSOR DRIVER
+M:	Paul J. Murphy <paul.j.murphy@intel.com>
+M:	Daniele Alessandrelli <daniele.alessandrelli@intel.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
+
 SONY IMX355 SENSOR DRIVER
 M:	Tianshu Qiu <tian.shu.qiu@intel.com>
 L:	linux-media@vger.kernel.org
-- 
2.11.0

