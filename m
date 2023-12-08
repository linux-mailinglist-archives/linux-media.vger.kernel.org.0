Return-Path: <linux-media+bounces-1952-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4289780A501
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 15:02:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA52F281844
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 14:02:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15FE61DFCC;
	Fri,  8 Dec 2023 14:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="eL0y7q+4"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D20DC10EB;
	Fri,  8 Dec 2023 06:02:40 -0800 (PST)
Received: from stla-brain-8255-1.home (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 543F466073BF;
	Fri,  8 Dec 2023 14:02:39 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702044159;
	bh=oR//sT4gG1VSQYKCJez0lNAAABm4tSiATE5dgvrD8dc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eL0y7q+4FpjtgoJEhncxx9/znNq+j8qeuWsByCAoAmEbIYENVJV00efIV1r9gaOSM
	 f9Car0qtBlqCFX12Taf3R4ns5+m/gTPfYHPboOgnW82+GPvRGCBx6jqWHXYMTKsbfo
	 3OSPVH0xpqTqrHb66B6ymzNbmN6MRLTjsyZQM1av8hnx2AKrBX502xBJXzkNj/6qDB
	 nriqVmh5/789jwjNEf/JsnBCs6uipCWQlUsqP942IwsKg6rNzqycknboqHy+p4L4xC
	 b1LjLsW3PH/EFtU7mB84KXWMAqC3inwaVYK0ppIJWMGsSE0Y2OhZYB/c2xmd4RZ/9m
	 FqIAWvXs85BbA==
From: Julien Massot <julien.massot@collabora.com>
To: devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: kernel@collabora.com,
	Julien Massot <julien.massot@collabora.com>
Subject: [PATCH 1/4] dt-bindings: media: add Maxim MAX96714F GMSL2 Deserializer
Date: Fri,  8 Dec 2023 15:02:14 +0100
Message-ID: <20231208140217.457609-2-julien.massot@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231208140217.457609-1-julien.massot@collabora.com>
References: <20231208140217.457609-1-julien.massot@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DT bindings for Maxim MAX96714F GMSL2 Deserializer.

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 .../bindings/media/i2c/maxim,max96714f.yaml   | 163 ++++++++++++++++++
 1 file changed, 163 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max96714f.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96714f.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96714f.yaml
new file mode 100644
index 000000000000..405d02368f64
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96714f.yaml
@@ -0,0 +1,163 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2023 Collabora Ltd.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/maxim,max96714f.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GMSL2 to CSI-2 Deserializer
+
+maintainers:
+  - Julien Massot <julien.massot@collabora.com>
+
+description: |
+  The MAX96714F deserializer converts GMSL2 serial inputs into MIPI
+  CSI-2 D-PHY or C-PHY formatted output. The device allows the GMSL2 link to
+  simultaneously transmit bidirectional control-channel data while forward
+  video transmissions are in progress. The MAX96714F can connect to one
+  remotely located serializer using industry-standard coax or STP
+  interconnects. The device cans operate in pixel or tunnel mode. In pixel mode
+  the MAX96714F can select individual video stream, while the tunnel mode forward all
+  the MIPI data received by the serializer.
+
+  The GMSL2 serial link operates at a fixed rate of 3Gbps in the
+  forward direction and 187.5Mbps in the reverse direction.
+
+properties:
+  compatible:
+    const: maxim,max96714f
+
+  reg:
+    description: I2C device address
+    maxItems: 1
+
+  enable-gpios: true
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        unevaluatedProperties: false
+        description: GMSL Input
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+            description:
+              Endpoint for GMSL2-Link port.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: CSI-2 Output
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes: true
+              bus-type:
+                enum:
+                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
+
+            required:
+              - data-lanes
+              - bus-type
+
+    required:
+      - port@1
+
+  i2c-gate:
+    $ref: /schemas/i2c/i2c-controller.yaml
+    unevaluatedProperties: false
+    description: |
+      The MAX96714 will pass through and forward the I2C requests from the
+      incoming I2C bus over the GMSL2 link. Therefore it supports an i2c-gate
+      subnode to configure a serializer.
+
+  port0-poc-supply:
+    description: Regulator providing Power over Coax for a particular port
+
+required:
+  - compatible
+  - reg
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/media/video-interfaces.h>
+
+    main_i2c2 {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            gmsl-deserializer@28 {
+                    compatible = "maxim,max96714f";
+                    reg = <0x28>;
+                    enable-gpios = <&main_gpio0 37 GPIO_ACTIVE_HIGH>;
+
+                    ports {
+                            #address-cells = <1>;
+                            #size-cells = <0>;
+                            port@0 {
+                                    reg = <0>;
+                                    max96714_gmsl_in: endpoint {
+                                            remote-endpoint = <&max96917f_gmsl_out>;
+                                    };
+                           };
+
+                            port@1 {
+                                    reg = <1>;
+                                    max96714_csi_out: endpoint {
+                                            bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+                                            clock-lanes = <0>;
+                                            data-lanes = <1 2 3 4>;
+                                            link-frequencies = /bits/ 64 <400000000>;
+                                            remote-endpoint = <&csi_in>;
+                                    };
+                            };
+                    };
+
+                    i2c-gate {
+                            #address-cells = <1>;
+                            #size-cells = <0>;
+
+                            gmsl-serializer@40 {
+                                   compatible = "maxim,max96717f";
+                                   reg = <0x40>;
+                                   gpio-controller;
+                                   #gpio-cells = <2>;
+                                   #clock-cells = <0>;
+
+                                   ports {
+                                            #address-cells = <1>;
+                                            #size-cells = <0>;
+
+                                            port@0 {
+                                                    reg = <0>;
+                                                    max96717f_csi_in: endpoint {
+                                                            data-lanes = <1 2>;
+                                                            lane-polarities = <1 0 1>;
+                                                            remote-endpoint = <&vd5661_csi>;
+                                                    };
+                                            };
+
+                                            port@1 {
+                                                    reg = <1>;
+                                                    max96917f_gmsl_out: endpoint {
+                                                            remote-endpoint = <&max96714_gmsl_in>;
+                                                    };
+                                            };
+                                   };
+                            };
+                    };
+            };
+    };
+...
-- 
2.43.0


