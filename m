Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D706342403
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 19:07:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230296AbhCSSGt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Mar 2021 14:06:49 -0400
Received: from mga09.intel.com ([134.134.136.24]:57280 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230294AbhCSSGn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Mar 2021 14:06:43 -0400
IronPort-SDR: 43pE442BPGkLcen9E+TN2OMQCh+4VnbC8ZpzPOafB91+IcBmWbKtX5eakYUTIHxbTQdGBtOATr
 AhQAwPP4GLTw==
X-IronPort-AV: E=McAfee;i="6000,8403,9928"; a="190036002"
X-IronPort-AV: E=Sophos;i="5.81,262,1610438400"; 
   d="scan'208";a="190036002"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2021 11:06:42 -0700
IronPort-SDR: 3TATCr0aMGc9/ye7O0+eCl1LkzqwKOQAIfZ5TIQ85BsnGX08H+kyWnHcVA7tvbFW3nKcRH8WPT
 FhA/yD7JCEJQ==
X-IronPort-AV: E=Sophos;i="5.81,262,1610438400"; 
   d="scan'208";a="413605690"
Received: from mkrastex-mobl.ger.corp.intel.com ([10.104.88.55])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2021 11:06:39 -0700
From:   Martina Krasteva <martinax.krasteva@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
        sakari.ailus@linux.intel.com,
        daniele.alessandrelli@linux.intel.com,
        paul.j.murphy@linux.intel.com,
        gjorgjix.rosikopulos@linux.intel.com,
        martinax.krasteva@linux.intel.com
Subject: [PATCH 01/10] dt-bindings: media: Add bindings for Keem Bay Camera
Date:   Fri, 19 Mar 2021 18:06:23 +0000
Message-Id: <20210319180632.585-2-martinax.krasteva@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210319180632.585-1-martinax.krasteva@linux.intel.com>
References: <20210319180632.585-1-martinax.krasteva@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Martina Krasteva <martinax.krasteva@intel.com>

- Add dt-bindings documentation for Intel Keem Bay Camera driver.
- Add MAINTAINERS entry for Intel Keem Bay Camera binding
  documentation.

Co-developed-by: Gjorgji Rosikopulos <gjorgjix.rosikopulos@intel.com>
Signed-off-by: Gjorgji Rosikopulos <gjorgjix.rosikopulos@intel.com>
Signed-off-by: Martina Krasteva <martinax.krasteva@intel.com>
Acked-by: Paul J. Murphy <paul.j.murphy@intel.com>
Acked-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
---
 .../bindings/media/intel,keembay-camera.yaml       | 98 ++++++++++++++++++++++
 MAINTAINERS                                        |  8 ++
 2 files changed, 106 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/intel,keembay-camera.yaml

diff --git a/Documentation/devicetree/bindings/media/intel,keembay-camera.yaml b/Documentation/devicetree/bindings/media/intel,keembay-camera.yaml
new file mode 100644
index 000000000000..78242b05228d
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/intel,keembay-camera.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2021 Intel Corporation
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/intel,keembay-camera.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Intel Keem Bay camera subsystem
+
+maintainers:
+  - Paul J. Murphy <paul.j.murphy@intel.com>
+  - Daniele Alessandrelli <daniele.alessandrelli@intel.com>
+
+properties:
+  compatible:
+    const: intel,keembay-camera
+  memory-region:
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+  ports:
+    type: object
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    "#address-cells":
+      const: 1
+    "#size-cells":
+      const: 0
+
+    properties:
+      port@[0-5]:
+        type: object
+        additionalProperties: false
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          The port number matches the D-PHY number (D-PHY#0 - D-PHY#5).
+
+        properties:
+          endpoint:
+            type: object
+
+            properties:
+              data-lanes:
+                $ref: video-interfaces.yaml#/properties/data-lanes
+                description:
+                  Six two-lane d-phys (D-PHY#0 - D-PHY#5) are available, which
+                  can be used by six RX controllers (RX-CTRL#0 - RX-CTRL#5).
+                  RX-CTRL#0, RX-CTRL#2, RX-CTRL#4 can be connected to two
+                  D-PHY's and will be able to work with 3 and 4 lanes. In this
+                  case the RX-CTRLs mapped to those D-PHYs cannot be used.
+
+                  Clock and data lanes are defined as follows
+                    D-PHY#0 - clock - 0, data - 1, 2
+                    D-PHY#1 - clock - 3, data - 4, 5
+                    D-PHY#2 - clock - 6, data - 7, 8
+                    D-PHY#3 - clock - 9, data - 10, 11
+                    D-PHY#4 - clock - 12, data - 13, 14
+                    D-PHY#5 - clock - 15, data - 16, 17
+
+            required:
+              - data-lanes
+
+      required:
+        - reg
+        - endpoint
+
+    required:
+      - "#address-cells"
+      - "#size-cells"
+      - port@[0-5]
+
+required:
+  - compatible
+  - ports
+
+
+additionalProperties: false
+
+examples:
+  - |
+    keembay_camera {
+        compatible = "intel,keembay-camera";
+        memory-region = <&mem>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@4 {
+                reg = <4>;
+
+                cam: endpoint {
+                    remote-endpoint = <&imx334>;
+                    data-lanes = <13 14 16 17>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 08f9c2b7f3b3..c3f583ef8e46 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1965,6 +1965,14 @@ M:	Lennert Buytenhek <kernel@wantstofly.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 
+ARM/INTEL KEEM BAY CAMERA SUBSYSTEM
+M:	Paul J. Murphy <paul.j.murphy@intel.com>
+M:	Daniele Alessandrelli <daniele.alessandrelli@intel.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/intel,keembay-camera.yaml
+
 ARM/IP FABRICS DOUBLE ESPRESSO MACHINE SUPPORT
 M:	Lennert Buytenhek <kernel@wantstofly.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.11.0

