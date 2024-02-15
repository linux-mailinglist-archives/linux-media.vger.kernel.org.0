Return-Path: <linux-media+bounces-5228-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C26C856EC2
	for <lists+linux-media@lfdr.de>; Thu, 15 Feb 2024 21:45:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CCCF4B24875
	for <lists+linux-media@lfdr.de>; Thu, 15 Feb 2024 20:44:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F09CD13B2B2;
	Thu, 15 Feb 2024 20:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Lt8eNVwq"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A736F2595;
	Thu, 15 Feb 2024 20:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708029893; cv=none; b=Sm/T3jEV6390L+iTh5WzzEfnTaIy8O/TW5ESU5O5RvPW9AXHHSoZAx0VkXBEsqrJiPLEC4ppAfthGZGs0HkQ7Cg47njCN7o3n5+SYz+1P5WaJUFa8iclvYbMH4d9OctT07IFseFexFu3HAIeIBspIm9vXIitp9vo/UOTLM8Qt5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708029893; c=relaxed/simple;
	bh=xcbKewUfe6jBXYsCHtQ+JTCdRsu7qW0RHTxfeBfWcrI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o3bJ7iZy5gOYrhotfnyLkmMcy117j39hEP3uN9H282WkNc7xDJ82NPkbxyK1f4UcEjubR1RyL2nDnJPDdSKxsTnN7sHWF+ESQ71PTQ3YQ5fwJmlrttTx8xw+w3D9TZ8KJjQf9QXDjiGbt5aLzZJvkXaEgWNFpHzXuigg5P0N7sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Lt8eNVwq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from umang.jain (unknown [103.86.18.214])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 33C6913AC;
	Thu, 15 Feb 2024 21:44:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1708029885;
	bh=xcbKewUfe6jBXYsCHtQ+JTCdRsu7qW0RHTxfeBfWcrI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Lt8eNVwq7tKNh2veoQvkLmLyzPf8Jws12RVODOjMGI7nRzMIdtD6CrJZuJcisJJKu
	 tqb0H9cTPTfQeLBoaFjYSpR1/TURUrw57p/wxH5b67LgbNHIbvFvJFUbghsTXhjZnS
	 VZXQUgVLVEet6Z1Mh5gSMva72ERGXGCd4GvpdXhE=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	willl will <will@willwhang.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 1/2] media: dt-bindings: media: Add bindings for IMX283
Date: Fri, 16 Feb 2024 02:14:34 +0530
Message-ID: <20240215204436.9194-2-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240215204436.9194-1-umang.jain@ideasonboard.com>
References: <20240215204436.9194-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- Add dt-bindings documentation for Sony IMX283 sensor driver
- Add MAINTAINERS entry for Sony IMX283 binding documentation

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../bindings/media/i2c/sony,imx283.yaml       | 100 ++++++++++++++++++
 MAINTAINERS                                   |   8 ++
 2 files changed, 108 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx283.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx283.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx283.yaml
new file mode 100644
index 000000000000..3cf46429b282
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx283.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2024 Ideas on Board Oy
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/sony,imx283.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sony IMX283 Sensor
+
+maintainers:
+  - Kieran Bingham <kieran.bingham@ideasonboard.com>
+  - Umang Jain <umang.jain@ideasonboard.com>
+
+description:
+  IMX283 sensor is a Sony CMOS active pixel digital image sensor with an active
+  array size of 5472H x 3648V. It is programmable through I2C interface. The
+  I2C client address is fixed to 0x1a as per sensor data sheet. Image data is
+  sent through MIPI CSI-2.
+
+properties:
+  compatible:
+    const: sony,imx283
+  reg:
+    description: I2C address
+    maxItems: 1
+
+  assigned-clocks: true
+  assigned-clock-parents: true
+  assigned-clock-rates: true
+
+  clocks:
+    description: Clock frequency from 6 to 24 MHz.
+    maxItems: 1
+
+  vana-supply:
+    description: Analog power supply (2.9V)
+
+  vdig-supply:
+    description: Interface power supply (1.8V)
+
+  vddl-supply:
+    description: Digital power supply (1.2V)
+
+  port:
+    additionalProperties: false
+    $ref: /schemas/graph.yaml#/$defs/port-base
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
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera@1a {
+            compatible = "sony,imx283";
+            reg = <0x1a>;
+            clocks = <&imx283_clk>;
+
+            assigned-clocks = <&imx283_clk>;
+            assigned-clock-parents = <&imx283_clk_parent>;
+            assigned-clock-rates = <12000000>;
+
+            vadd-supply = <&camera_vadd_2v9>;
+            vdd1-supply = <&camera_vdd1_1v8>;
+            vdd2-supply = <&camera_vdd2_1v2>;
+
+            port {
+                imx283: endpoint {
+                    remote-endpoint = <&cam>;
+                    data-lanes = <1 2 3 4>;
+                    link-frequencies = /bits/ 64 <360000000>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 8999497011a2..53df4b6e3260 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20366,6 +20366,14 @@ T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml
 F:	drivers/media/i2c/imx274.c
 
+SONY IMX283 SENSOR DRIVER
+M:	Kieran Bingham <kieran.bingham@ideasonboard.com>
+M:	Umang Jain <umang.jain@ideasonboard.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/i2c/sony,imx283.yaml
+
 SONY IMX290 SENSOR DRIVER
 M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
 L:	linux-media@vger.kernel.org
-- 
2.43.0


