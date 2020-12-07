Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 337CB2D1581
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 17:07:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726408AbgLGQEW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 11:04:22 -0500
Received: from mga17.intel.com ([192.55.52.151]:46186 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726203AbgLGQEW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 7 Dec 2020 11:04:22 -0500
IronPort-SDR: TrY0agwaSrWl3QlkBHh7djjXhgkjvbpO3WPIVmFp7zE6BUJT5fiSxr2dss59xPFlrUPgoVw+FG
 INMDwtrntDtQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9827"; a="153535673"
X-IronPort-AV: E=Sophos;i="5.78,400,1599548400"; 
   d="scan'208";a="153535673"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2020 08:01:21 -0800
IronPort-SDR: O6D7HBop+VmsgjNIrjyDnOGampBT0ZnSU5JKZYJIBQ8gfJtGRgZhRVSEZRRCpRBNuK1ZHBcvvK
 fsl3ED/rVA8Q==
X-IronPort-AV: E=Sophos;i="5.78,400,1599548400"; 
   d="scan'208";a="317228510"
Received: from mkrastex-mobl.ger.corp.intel.com ([10.104.88.5])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2020 08:01:15 -0800
From:   Martina Krasteva <martinax.krasteva@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
        sakari.ailus@linux.intel.com,
        daniele.alessandrelli@linux.intel.com,
        paul.j.murphy@linux.intel.com,
        gjorgjix.rosikopulos@linux.intel.com,
        martinax.krasteva@linux.intel.com
Subject: [PATCH v3 1/2] dt-bindings: media: Add bindings for imx334
Date:   Mon,  7 Dec 2020 16:01:07 +0000
Message-Id: <20201207160109.490-2-martinax.krasteva@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201207160109.490-1-martinax.krasteva@linux.intel.com>
References: <20201207160109.490-1-martinax.krasteva@linux.intel.com>
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
---
 .../devicetree/bindings/media/i2c/sony,imx334.yaml | 62 ++++++++++++++++++++++
 MAINTAINERS                                        |  8 +++
 2 files changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
new file mode 100644
index 000000000000..a8793e4070b2
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2020 Intel Corporation
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
+  # See ../video-interfaces.txt for more details
+  port:
+    type: object
+    properties:
+      endpoint:
+        type: object
+        properties:
+          remote-endpoint:
+            description: See ../video-interfaces.txt
+          data-lanes:
+            description: See ../video-interfaces.txt
+
+additionalProperties: false
+
+required:
+  - compatible
+  - port
+
+examples:
+  - |
+    i2c0 {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          camera@1a {
+                compatible = "sony,imx334";
+                reg = <0x1a>;
+
+                port {
+                      imx334: endpoint {
+                            remote-endpoint = <&cam>;
+                            data-lanes = <1 2 3 4>;
+                      };
+                };
+          };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 2daa6ee673f7..3774c0eb0b48 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16303,6 +16303,14 @@ S:	Maintained
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

