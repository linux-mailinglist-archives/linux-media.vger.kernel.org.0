Return-Path: <linux-media+bounces-305-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0CC7EA69C
	for <lists+linux-media@lfdr.de>; Tue, 14 Nov 2023 00:04:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 478971F22D2B
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 23:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01E2F3D3B9;
	Mon, 13 Nov 2023 23:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c5Cj4knf"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B41F3C68A;
	Mon, 13 Nov 2023 23:04:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91B61C433C8;
	Mon, 13 Nov 2023 23:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699916664;
	bh=uuoD3H22vWn21TrrgCc1sSk7u/rIE8eHUMfeeffNbF4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c5Cj4knfbhX+5HJPImFXCYaxQkU97pKDtU21lE2erR1I3rWd4kfLdL2vzZZKeIbX5
	 Ts7TdcgTvyeYldNskFoPJRsxsHYI8SonQO6JQ9XmOdki1KXWhnqUExIdCmCtV0Rpue
	 GV8foNjPQZOfzVEIwjvsvah50cuth3tAtdKL5VmUU5Y6mp2gFxnoHx7iPTeDhtDTNa
	 QIDpSC8Nh6Dz4szhDpMjEcZxvJUQ6qqMnKkijyiZr2UjmoCAspuabQ3rP34GH7kMJ+
	 qIYXgffDA/Jln3OvrLNdDnG9prM5fd5QIqO382dfUECXUtZ/CE6ZLWRnEGn05Pn+o4
	 Gg4s5fX/Upz+A==
Received: by mercury (Postfix, from userid 1000)
	id 2AB151060A27; Tue, 14 Nov 2023 00:04:22 +0100 (CET)
From: Sebastian Reichel <sre@kernel.org>
To: Sebastian Reichel <sre@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Alain Volmat <alain.volmat@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 2/6] media: dt-bindings: gc0308: add binding
Date: Mon, 13 Nov 2023 23:57:21 +0100
Message-ID: <20231113230421.226808-3-sre@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231113230421.226808-1-sre@kernel.org>
References: <20231113230421.226808-1-sre@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DT binding for GalaxyCore GC0308 camera sensor.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
 .../bindings/media/i2c/galaxycore,gc0308.yaml | 108 ++++++++++++++++++
 1 file changed, 108 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/galaxycore,gc0308.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/galaxycore,gc0308.yaml b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc0308.yaml
new file mode 100644
index 000000000000..f81e7daed67b
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc0308.yaml
@@ -0,0 +1,108 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/galaxycore,gc0308.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Galaxycore GC0308 and GC0309 Image Sensors
+
+maintainers:
+  - Sebastian Reichel <sre@kernel.org>
+
+description: |
+  The GalaxyCore GC0308 (1/6.5") and GC0309 (1/9") are 640x480 VGA sensors
+  programmable through an I2C interface and connected via parallel bus.
+  They include an ISP capable of auto exposure and auto white balance.
+
+allOf:
+  - $ref: ../video-interface-devices.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - const: galaxycore,gc0308
+      - items:
+          - const: galaxycore,gc0309
+          - const: galaxycore,gc0308
+
+  reg:
+    const: 0x21
+
+  clocks:
+    description: Reference to the xclk clock.
+    maxItems: 1
+
+  reset-gpios:
+    description: GPIO descriptor for the reset pin.
+    maxItems: 1
+
+  powerdown-gpios:
+    description: GPIO descriptor for the powerdown pin.
+    maxItems: 1
+
+  vdd28-supply:
+    description: 2.8V supply
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    description: |
+      Video output port.
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          bus-width: true
+          data-shift: true
+          hsync-active: true
+          vsync-active: true
+          data-active: true
+          pclk-sample: true
+
+        required:
+          - bus-width
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - powerdown-gpios
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera-sensor@21 {
+            compatible = "galaxycore,gc0308";
+            reg = <0x21>;
+            clocks = <&camera_clk>;
+            powerdown-gpios = <&gpio1 5 GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&gpio1 6 GPIO_ACTIVE_LOW>;
+            vdd28-supply = <&vdd28>;
+
+            port {
+                gc0308_ep: endpoint {
+                    remote-endpoint = <&parallel_from_gc0308>;
+                    bus-width = <8>;
+                    data-shift = <2>; /* lines 9:2 are used */
+                    hsync-active = <1>; /* active high */
+                    vsync-active = <1>; /* active high */
+                    data-active = <1>; /* active high */
+                    pclk-sample = <1>; /* sample on rising edge */
+                };
+            };
+        };
+    };
+
+...
-- 
2.42.0


