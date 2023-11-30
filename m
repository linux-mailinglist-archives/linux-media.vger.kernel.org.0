Return-Path: <linux-media+bounces-1429-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C83617FF8BC
	for <lists+linux-media@lfdr.de>; Thu, 30 Nov 2023 18:47:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85185281967
	for <lists+linux-media@lfdr.de>; Thu, 30 Nov 2023 17:47:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D70D59143;
	Thu, 30 Nov 2023 17:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZTkBketZ"
X-Original-To: linux-media@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B31BE106;
	Thu, 30 Nov 2023 09:46:54 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4A1FDC000A;
	Thu, 30 Nov 2023 17:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701366412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s+kKRDGdLoRwa4sdwP8duAQkRO0quqg+Orr5DdwaX0w=;
	b=ZTkBketZtNXbb1Sq37VHPcOA0ksn3XTby7UWBldxLZaDPnhzh1dX7MaGsn8zPilY8693hi
	TVzEFu9xiBcXgtsbTnI9aXYyEyDyLXiyEucS1m0meL3gRD1TmQNC1yD0IEDiuEmH7bK8+m
	sI9n2XhiNLmVebHv3fQeJmbS7aU5nsQZQavmOf/77mdKFcC7RPEBxBtRSkt57AwRPkpjKZ
	tcsH8f9dey6qf1ZrMxTPwwRAT9o7pR2+8qD2a2TPQwTGuaMum5Mbxdc6MQHza/PcE4cgJp
	kQ3WK7YmS2xo4liNodbmjZhqyj5CaA2gwe19ya4tWvxYzwn7WikD5T/L+or0zA==
From: Mehdi Djait <mehdi.djait@bootlin.com>
To: mchehab@kernel.org,
	heiko@sntech.de,
	hverkuil-cisco@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com,
	alexandre.belloni@bootlin.com,
	maxime.chevallier@bootlin.com,
	paul.kocialkowski@bootlin.com,
	Mehdi Djait <mehdi.djait@bootlin.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH V10 2/3] media: dt-bindings: media: i2c: Add bindings for TW9900
Date: Thu, 30 Nov 2023 18:46:46 +0100
Message-ID: <08018e115a2fe352ac702e7812790e0cf3f8f64d.1701366233.git.mehdi.djait@bootlin.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1701366233.git.mehdi.djait@bootlin.com>
References: <cover.1701366233.git.mehdi.djait@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: mehdi.djait@bootlin.com

The Techwell TW9900 is a video decoder supporting multiple input
standards such as PAL and NTSC and has a parallel BT.656 output
interface.

It's designed to be low-power, posesses some features such as a
programmable comb-filter, and automatic input standard detection

Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Mehdi Djait <mehdi.djait@bootlin.com>
---
 .../bindings/media/i2c/techwell,tw9900.yaml   | 137 ++++++++++++++++++
 1 file changed, 137 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/techwell,tw9900.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/techwell,tw9900.yaml b/Documentation/devicetree/bindings/media/i2c/techwell,tw9900.yaml
new file mode 100644
index 000000000000..e37317f81072
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/techwell,tw9900.yaml
@@ -0,0 +1,137 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/techwell,tw9900.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Techwell TW9900 NTSC/PAL video decoder
+
+maintainers:
+  - Mehdi Djait <mehdi.djait@bootlin.com>
+
+description:
+  The tw9900 is a multi-standard video decoder, supporting NTSC, PAL standards
+  with auto-detection features.
+
+properties:
+  compatible:
+    const: techwell,tw9900
+
+  reg:
+    maxItems: 1
+
+  vdd-supply:
+    description: VDD power supply
+
+  reset-gpios:
+    description: GPIO descriptor for the RESET input pin
+    maxItems: 1
+
+  powerdown-gpios:
+    description: GPIO descriptor for the POWERDOWN input pin
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        description: Analog input port
+
+        properties:
+          endpoint@0:
+            $ref: /schemas/graph.yaml#/properties/endpoint
+            description: CVBS over MUX0
+
+          endpoint@1:
+            $ref: /schemas/graph.yaml#/properties/endpoint
+            description: CVBS over MUX1
+
+          endpoint@2:
+            $ref: /schemas/graph.yaml#/properties/endpoint
+            description: Chroma over CIN0 and Y over MUX0
+
+          endpoint@3:
+            $ref: /schemas/graph.yaml#/properties/endpoint
+            description: Chroma over CIN0 and Y over MUX1
+
+        oneOf:
+          - required:
+              - endpoint@0
+          - required:
+              - endpoint@1
+          - required:
+              - endpoint@2
+          - required:
+              - endpoint@3
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Video port for the decoder output.
+
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - ports
+  - reg
+  - vdd-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/display/sdtv-standards.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    composite_connector {
+        compatible = "composite-video-connector";
+        label = "tv";
+        sdtv-standards = <(SDTV_STD_PAL | SDTV_STD_NTSC)>;
+
+        port {
+            composite_to_tw9900: endpoint {
+                remote-endpoint = <&tw9900_to_composite>;
+            };
+        };
+    };
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        video-decoder@44 {
+            compatible = "techwell,tw9900";
+            reg = <0x44>;
+
+            vdd-supply = <&tw9900_supply>;
+            reset-gpios = <&gpio2 5 GPIO_ACTIVE_LOW>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    reg = <0>;
+                    tw9900_to_composite: endpoint@0 {
+                        reg = <0>;
+                        remote-endpoint = <&composite_to_tw9900>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    endpoint {
+                        remote-endpoint = <&cif_in>;
+                    };
+                };
+            };
+        };
+    };
-- 
2.41.0


