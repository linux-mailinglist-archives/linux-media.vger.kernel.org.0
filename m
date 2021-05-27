Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E55F3930B5
	for <lists+linux-media@lfdr.de>; Thu, 27 May 2021 16:21:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236351AbhE0OX0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 May 2021 10:23:26 -0400
Received: from mga01.intel.com ([192.55.52.88]:47557 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235487AbhE0OX0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 May 2021 10:23:26 -0400
IronPort-SDR: SE0Fr0S2q1YKt3vCBVJufc44+wwU0AidllDrSbIdVNfwpaNpzvp8oeL0d6zfk2T2IWXXCCe1vW
 uXMRQj/uymFg==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="223947908"
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; 
   d="scan'208";a="223947908"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2021 07:21:53 -0700
IronPort-SDR: CyjY2YjIr41xLATM4suKOWgPZMDrwuui+DO6q0TeNfKgx5Ej/bJKycDmLl3gTuTXpEtYF7JoQ6
 i4kKdduw8A7g==
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; 
   d="scan'208";a="477506747"
Received: from mkrastex-mobl.ger.corp.intel.com ([10.104.88.6])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2021 07:21:50 -0700
From:   Martina Krasteva <martinax.krasteva@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
        sakari.ailus@linux.intel.com,
        daniele.alessandrelli@linux.intel.com,
        paul.j.murphy@linux.intel.com,
        gjorgjix.rosikopulos@linux.intel.com,
        martinax.krasteva@linux.intel.com
Subject: [PATCH v2 1/6] dt-bindings: media: Add bindings for imx335
Date:   Thu, 27 May 2021 15:21:40 +0100
Message-Id: <20210527142145.173-2-martinax.krasteva@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210527142145.173-1-martinax.krasteva@linux.intel.com>
References: <20210527142145.173-1-martinax.krasteva@linux.intel.com>
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
 .../devicetree/bindings/media/i2c/sony,imx335.yaml | 91 ++++++++++++++++++++++
 MAINTAINERS                                        |  8 ++
 2 files changed, 99 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
new file mode 100644
index 000000000000..881f79532501
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
@@ -0,0 +1,91 @@
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
index 77792c171f1a..f86144307252 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17139,6 +17139,14 @@ T:	git git://linuxtv.org/media_tree.git
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

