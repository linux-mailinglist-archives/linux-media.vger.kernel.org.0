Return-Path: <linux-media+bounces-6983-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF5787A534
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 10:50:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E781F281533
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 09:50:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A95F2E62F;
	Wed, 13 Mar 2024 09:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="BZzLf2PN"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CE12C6B3;
	Wed, 13 Mar 2024 09:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710323405; cv=none; b=BVTLucNOAAJdtuU96QZ7SRGKbRmh7wXufR3irsVeZL9Y7AzDG8Z/8uAUA1Y5GVKRI2FLNbQh75ILrXBk/HenG7mumqat2kEFjPyEQZATCoKx02iC1xfqzNRWZznyEdG7MtlJW4keZqydG0X5iyihPGebDyheTsc4b2mvEyc5/e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710323405; c=relaxed/simple;
	bh=r3FgjHieRHvmPvUhf7DHkS8OZOnqayUYxYf3X+g8UPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n1W4OcQF75xVppoQlfkZh45rrfIyZwqKbUNH/2STuNOSOeEGChZJRZcqhaPswGq0ViEhdyXNYIBb6Os10zAYo/kiPp3wUO4cz/UGv58tvg9xff7VhkcLG6Jfz7ck/Vf/J4DKtAHMSM2xiM4JY6aYSlcAxzwgd56NzmIHe1HVrG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=BZzLf2PN; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710323397;
	bh=r3FgjHieRHvmPvUhf7DHkS8OZOnqayUYxYf3X+g8UPI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BZzLf2PNPWyaAIir1fvCNPxDpDlfdMjBgiAzyH7ffkyfXFFsy+hW40H36bfXJof8a
	 z200dqnWQ7nvJkIVhcBaMJU+HRl8VXXgM6S7hilv99C0yAk19GBX+YgmdbKzG2P2JA
	 rw+VoIaKF32VhAzKr7rMp49VLc/LLwxMoYdgDjjmRnkTFBdEa/LQdA26OF0JR6gui+
	 D6sLTqY6Ps4KO/Np2l/3A9GdG/ORMCk1K9ccyshVJlrgt303OH8RhPtWcPF9BwGfpM
	 jlYGX9Hck6/FT/cTKcLeLhgu+YYtRSHnHWdIzw5t/S9o57Qaglo4PrJ1aLiCICqJSK
	 l4CKBoSLSKgjw==
Received: from stla-brain-8255-1.home (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B87D837820BB;
	Wed, 13 Mar 2024 09:49:56 +0000 (UTC)
From: Julien Massot <julien.massot@collabora.com>
To: linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	kernel@collabora.com,
	linux-kernel@vger.kernel.org,
	mchehab@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	sakari.ailus@iki.fi,
	Julien Massot <julien.massot@collabora.com>
Subject: [PATCH v5 1/4] dt-bindings: media: add Maxim MAX96717 GMSL2 Serializer
Date: Wed, 13 Mar 2024 10:49:19 +0100
Message-ID: <20240313094922.311743-2-julien.massot@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240313094922.311743-1-julien.massot@collabora.com>
References: <20240313094922.311743-1-julien.massot@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DT bindings for Maxim MAX96717 GMSL2 Serializer.

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
Change since v4:
 - Add compatible for MAX96717 and use it as a fallback for MAX96717F
 - Remove extra '|' for decriptions
 - Reference 'i2c-gate' instead of 'i2c-controller'

Change since v3:
 - Renamed file to maxim,max96717.yaml dropped the 'f' suffix
 - Added lane-polarities and bus type properties to the CSI endpoint

Change since v2:
 - remove reg description
 - add data lanes min/maxItems
 - Use generic node name 
---
 .../bindings/media/i2c/maxim,max96717.yaml    | 165 ++++++++++++++++++
 1 file changed, 165 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
new file mode 100644
index 000000000000..0942d8c7c5c9
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -0,0 +1,165 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2024 Collabora Ltd.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/maxim,max96717.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MAX96717 CSI-2 to GMSL2 Serializer
+
+maintainers:
+  - Julien Massot <julien.massot@collabora.com>
+
+description:
+  The MAX96717 serializer converts MIPI CSI-2 D-PHY or C-PHY formatted input
+  into GMSL2 serial outputs. The device allows the GMSL2 link to
+  simultaneously transmit bidirectional control-channel data while forward
+  video transmissions are in progress. The MAX96717 can connect to one
+  remotely located deserializer using industry-standard coax or STP
+  interconnects. The device cans operate in pixel or tunnel mode. In pixel mode
+  the MAX96717 can select the MIPI datatype, while the tunnel mode forward all the MIPI
+  data received by the serializer.
+  The MAX96717 supports Reference Over Reverse (channel),
+  to generate a clock output for the sensor from the GMSL reverse channel.
+
+  The GMSL2 serial link operates at a fixed rate of 3Gbps or 6Gbps in the
+  forward direction and 187.5Mbps in the reverse direction.
+  MAX96717F only supports a fixed rate of 3Gbps in the forward direction.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - maxim,max96717
+      - items:
+          - enum:
+              - maxim,max96717f
+          - const: maxim,max96717 # fallback for 'f' variant
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
+            properties:
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+              lane-polarities:
+                minItems: 1
+                maxItems: 5
+
+              bus-type:
+                enum:
+                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
+                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
+
+            required:
+              - data-lanes
+              - bus-type
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
+    $ref: /schemas/i2c/i2c-gate.yaml
+    unevaluatedProperties: false
+    description:
+      The MAX96717 will forward the I2C requests from the
+      incoming GMSL2 link. Therefore, it supports an i2c-gate
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
+            compatible = "maxim,max96717f", "maxim,max96717";
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
+                        bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+                        data-lanes = <1 2 3 4>;
+                        remote-endpoint = <&sensor_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    max96917f_gmsl_out: endpoint {
+                        remote-endpoint = <&deser_gmsl_in>;
+                    };
+                };
+            };
+
+            i2c-gate {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                sensor@10 {
+                    compatible = "st,st-vgxy61";
+                    reg = <0x10>;
+                    reset-gpios = <&serializer 0 GPIO_ACTIVE_LOW>;
+                    clocks = <&serializer>;
+                    VCORE-supply = <&v1v2>;
+                    VDDIO-supply = <&v1v8>;
+                    VANA-supply = <&v2v8>;
+                    port {
+                        sensor_out: endpoint {
+                            data-lanes = <1 2 3 4>;
+                            remote-endpoint = <&max96717f_csi_in>;
+                        };
+                    };
+                };
+            };
+        };
+    };
+...
-- 
2.44.0


