Return-Path: <linux-media+bounces-375-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB097EC440
	for <lists+linux-media@lfdr.de>; Wed, 15 Nov 2023 14:59:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37B971F270D0
	for <lists+linux-media@lfdr.de>; Wed, 15 Nov 2023 13:59:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBEB821342;
	Wed, 15 Nov 2023 13:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RR7r62QO"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0682D1F958;
	Wed, 15 Nov 2023 13:59:24 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CDADE1;
	Wed, 15 Nov 2023 05:59:23 -0800 (PST)
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 31993327;
	Wed, 15 Nov 2023 14:58:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1700056735;
	bh=PO6y014tLX864WjvvbeGrZknPugC1Nfc34TFKdJoe9k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RR7r62QOMhgJfEf441KLEx5Up2k5GO1egq8MHvbokh0nn/utvtZ3FosYaVHeF1Hzn
	 aGrXTNYj0l55QLj3e3Rwb9nVg7aN+cD7PitCLShFc0t6hYikDt7GwVOjGdXtWoWP5H
	 vrVZ5aoC7hI2eZuqqsCIIecD76W74U3RVu8LZFjs=
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
	devicetree@vger.kernel.org
Subject: [PATCH v3 1/2] media: dt-bindings: Add OmniVision OV64A40
Date: Wed, 15 Nov 2023 14:59:03 +0100
Message-ID: <20231115135904.27156-2-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231115135904.27156-1-jacopo.mondi@ideasonboard.com>
References: <20231115135904.27156-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add bindings for OmniVision OV64A40.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../bindings/media/i2c/ovti,ov64a40.yaml      | 98 +++++++++++++++++++
 1 file changed, 98 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov64a40.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov64a40.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov64a40.yaml
new file mode 100644
index 000000000000..15fbe86bba10
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov64a40.yaml
@@ -0,0 +1,98 @@
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
+                      link-frequencies = /bits/ 64 <456000000>;
+                  };
+              };
+          };
+      };
+
+...

base-commit: 61ab89c1916219ccbeca9f6cefb1680212de8d1c
--
2.41.0


