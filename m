Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BE7B2BABD7
	for <lists+linux-media@lfdr.de>; Fri, 20 Nov 2020 15:28:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726770AbgKTO2M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Nov 2020 09:28:12 -0500
Received: from mga14.intel.com ([192.55.52.115]:21379 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725801AbgKTO2L (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Nov 2020 09:28:11 -0500
IronPort-SDR: xQQXtu5jBRpBW6NDv9kGrf3qgGBP0TpER3aFd9mrNNg56Z2OMsfJzTxp63uye/RBg3dY7igyZW
 t0rbgHT7YC2w==
X-IronPort-AV: E=McAfee;i="6000,8403,9810"; a="170698831"
X-IronPort-AV: E=Sophos;i="5.78,356,1599548400"; 
   d="scan'208";a="170698831"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2020 06:28:11 -0800
IronPort-SDR: UAjpcO7fSq4mNIAso3stJKeVMPRx+JP3HIpqqxTIqk8FbVPfRIPwBM4Bc5MIM07v9SUeYmSC3/
 oecKfOXWSs1Q==
X-IronPort-AV: E=Sophos;i="5.78,356,1599548400"; 
   d="scan'208";a="545461400"
Received: from mkrastex-mobl.ger.corp.intel.com ([10.104.67.10])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2020 06:28:09 -0800
From:   Martina Krasteva <martinax.krasteva@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
        sakari.ailus@linux.intel.com,
        daniele.alessandrelli@linux.intel.com,
        gjorgjix.rosikopulos@linux.intel.com,
        martinax.krasteva@linux.intel.com
Subject: [PATCH 1/2] dt-bindings: media: Add bindings for imx334
Date:   Fri, 20 Nov 2020 14:28:02 +0000
Message-Id: <20201120142803.308-2-martinax.krasteva@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201120142803.308-1-martinax.krasteva@linux.intel.com>
References: <20201120142803.308-1-martinax.krasteva@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Martina Krasteva <martinax.krasteva@intel.com>

- Add dt-bindings documentation for Sony imx334 sensor driver.
- Add MAINTAINERS entry for Sony imx334 binding documentation.

Signed-off-by: Martina Krasteva <martinax.krasteva@intel.com>
Reviewed-by: Gjorgji Rosikopulos <gjorgjix.rosikopulos@intel.com>
Acked-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
---
 .../devicetree/bindings/media/i2c/sony,imx334.yaml | 59 ++++++++++++++++++++++
 MAINTAINERS                                        |  7 +++
 2 files changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
new file mode 100644
index 000000000000..ff6385cd6e9e
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
@@ -0,0 +1,59 @@
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
+              description: See ../video-interfaces.txt
+          data-lanes:
+              description: See ../video-interfaces.txt
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
index e451dcce054f..6cfce99be4bb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16320,6 +16320,13 @@ S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
 F:	drivers/media/i2c/imx319.c
 
+SONY IMX334 SENSOR DRIVER
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

