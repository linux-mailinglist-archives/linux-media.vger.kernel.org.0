Return-Path: <linux-media+bounces-1761-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 68ACB80743F
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 16:59:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99F861C20ED4
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 15:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 159BE46449;
	Wed,  6 Dec 2023 15:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="O73lYy4g"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74D8FD41;
	Wed,  6 Dec 2023 07:59:27 -0800 (PST)
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2DB2DE45;
	Wed,  6 Dec 2023 16:58:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701878324;
	bh=U1i54No0AsNROX5iRRF3NAfluQ4XKjRZg0zpXf7sU1g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O73lYy4g2AKldqoqnHM00Y0ODgATGR6zI8CylAH60AD0IO5U7lC7/R43TuDvjdKOY
	 rmWe0lM77WWe30NhZ4b51NIRho0GMiHMu7Ahp9cH+kvst3/xg7GOhXNBeIZ7x6EZjn
	 Xwo2mZbeOKISO7Kyg09mkmw8AGi1fePcFefRIiig=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	devicetree@vger.kernel.org,
	Lee Jackson <lee.jackson@arducam.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 1/2] media: dt-bindings: Add OmniVision OV64A40
Date: Wed,  6 Dec 2023 16:58:59 +0100
Message-ID: <20231206155900.123904-2-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231206155900.123904-1-jacopo.mondi@ideasonboard.com>
References: <20231206155900.123904-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add bindings for OmniVision OV64A40.

Co-developed-by: Lee Jackson <lee.jackson@arducam.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/media/i2c/ovti,ov64a40.yaml      | 97 +++++++++++++++++++
 1 file changed, 97 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov64a40.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov64a40.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov64a40.yaml
new file mode 100644
index 000000000000..e6c9d540a2dd
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov64a40.yaml
@@ -0,0 +1,97 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,ov64a40.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OmniVision OV64A40 Image Sensor
+
+maintainers:
+  - Jacopo Mondi <jacopo.mondi@ideasonboard.com>
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: ovti,ov64a40
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  avdd-supply:
+    description: Analog voltage supply, 2.8 volts
+
+  dvdd-supply:
+    description: Digital core voltage supply, 1.1 volts
+
+  dovdd-supply:
+    description: Digital I/O voltage supply, 1.8 volts
+
+  powerdown-gpios:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        additionalProperties: false
+
+        properties:
+          bus-type:
+            enum:
+              - 1 # MIPI CSI-2 C-PHY
+              - 4 # MIPI CSI-2 D-PHY
+          data-lanes: true
+          link-frequencies: true
+          clock-noncontinuous: true
+          remote-endpoint: true
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+      #include <dt-bindings/gpio/gpio.h>
+
+      i2c {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          camera@36 {
+              compatible = "ovti,ov64a40";
+              reg = <0x36>;
+              clocks = <&camera_clk>;
+              dovdd-supply = <&vgen4_reg>;
+              avdd-supply = <&vgen3_reg>;
+              dvdd-supply = <&vgen2_reg>;
+              powerdown-gpios = <&gpio1 9 GPIO_ACTIVE_HIGH>;
+              reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
+              rotation = <180>;
+              orientation = <2>;
+
+              port {
+                  endpoint {
+                      remote-endpoint = <&mipi_csi2_in>;
+                      bus-type = <4>;
+                      data-lanes = <1 2 3 4>;
+                  };
+              };
+          };
+      };
+
+...
--
2.41.0


