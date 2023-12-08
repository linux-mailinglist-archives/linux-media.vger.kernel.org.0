Return-Path: <linux-media+bounces-1962-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A92D280A59B
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 15:34:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D8DC01C20E42
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 14:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E462200B8;
	Fri,  8 Dec 2023 14:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="iKk6ggpf"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9FEC198C;
	Fri,  8 Dec 2023 06:34:35 -0800 (PST)
Received: from stla-brain-8255-1.home (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5A42666073C0;
	Fri,  8 Dec 2023 14:34:34 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702046074;
	bh=IyYv+ysfHKxKHPUcZ0tglDcBbqy48STOs63+zb3HPi0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iKk6ggpf7J/o2vSIdBZUEaPD0oBlSzgimmveYvtp36f2/mTiX/76jp1NhDlSrHWak
	 G7DFNY8SXmeFaMCTMKl5W755moBFQLR0iFLZbMFzso+vUTBQJU3Tm8FnfaTBlsDJxV
	 9d6p/mBAJDhjd6+JxJJLv561K4ePCPtfM/FKxcDARjlQ56+RovZ2l7gen/6dxJqyIJ
	 pZMeOuCvMlrLVSWwSGTlQxo4gPaOPUANB9QWoITyNFbe3ZDx6xGAQMgNrjTK/YiTfg
	 j3Kc2BLHBDsJ+0C4G4+fkAf9s4nugWCjmi1qlXE4AEZSJUu6/TWMjtZ7ZD82gfK2hV
	 oy4h941fe/wKw==
From: Julien Massot <julien.massot@collabora.com>
To: devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: kernel@collabora.com,
	Julien Massot <julien.massot@collabora.com>
Subject: [PATCH v2 2/4] dt-bindings: media: add Maxim MAX96717F GMSL2 Serializer
Date: Fri,  8 Dec 2023 15:33:57 +0100
Message-ID: <20231208143359.469049-3-julien.massot@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231208143359.469049-1-julien.massot@collabora.com>
References: <20231208143359.469049-1-julien.massot@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DT bindings for Maxim MAX96717F GMSL2 Serializer.

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 .../bindings/media/i2c/maxim,max96717f.yaml   | 144 ++++++++++++++++++
 1 file changed, 144 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max96717f.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717f.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717f.yaml
new file mode 100644
index 000000000000..ae649c3041a6
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717f.yaml
@@ -0,0 +1,144 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2023 Collabora Ltd.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/maxim,max96717f.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GMSL2 to CSI-2 Serializer
+
+maintainers:
+  - Julien Massot <julien.massot@collabora.com>
+
+description: |
+  The MAX96717F serializer converts MIPI CSI-2 D-PHY or C-PHY formatted input
+  into GMSL2 serial outputs. The device allows the GMSL2 link to
+  simultaneously transmit bidirectional control-channel data while forward
+  video transmissions are in progress. The MAX96717F can connect to one
+  remotely located deserializer using industry-standard coax or STP
+  interconnects. The device cans operate in pixel or tunnel mode. In pixel mode
+  the MAX96717F can select the MIPI datatype, while the tunnel mode forward all the MIPI
+  data received by the serializer.
+  The MAX96717F supports Reference Over Reverse (channel),
+  to generate a clock output for the sensor from the GMSL reverse channel.
+
+  The GMSL2 serial link operates at a fixed rate of 3Gbps in the
+  forward direction and 187.5Mbps in the reverse direction.
+
+properties:
+  compatible:
+    const: maxim,max96717f
+
+  '#gpio-cells':
+    const: 2
+    description:
+      First cell is the GPIO pin number, second cell is the flags. The GPIO pin
+      number must be in range of [0, 10].
+
+  gpio-controller: true
+
+  '#clock-cells':
+    const: 0
+
+  reg:
+    description: I2C device address
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: CSI-2 Input port
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            required:
+              - data-lanes
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        unevaluatedProperties: false
+        description: GMSL Output port
+
+    required:
+      - port@1
+
+  i2c-gate:
+    $ref: /schemas/i2c/i2c-controller.yaml
+    unevaluatedProperties: false
+    description: |
+      The MAX96717F will pass through and forward the I2C requests from the
+      incoming GMSL2 link. Therefore it supports an i2c-gate
+      subnode to configure a sensor.
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
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        serializer: serializer@40 {
+            compatible = "maxim,max96717f";
+            reg = <0x40>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            #clock-cells = <0>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    max96717f_csi_in: endpoint {
+                        data-lanes = <1 2>;
+                        lane-polarities = <1 0 1>;
+                        remote-endpoint = <&vd5661_csi>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    max96917f_gmsl_out: endpoint {
+                        remote-endpoint = <&max96714_gmsl_in>;
+                    };
+                };
+            };
+
+            i2c-gate {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                vd5661@10 {
+                    compatible = "st,st-vgxy61";
+                    reg = <0x10>;
+                    reset-gpios = <&serializer 0 GPIO_ACTIVE_LOW>;
+                    clocks = <&serializer>;
+                    VCORE-supply = <&v1v2>;
+                    VDDIO-supply = <&v1v8>;
+                    VANA-supply = <&v2v8>;
+                    port {
+                        vd5661_csi: endpoint {
+                            data-lanes = <1 2>;
+                            remote-endpoint = <&max96717f_csi_in>;
+                        };
+                    };
+                };
+            };
+        };
+    };
+...
-- 
2.43.0


