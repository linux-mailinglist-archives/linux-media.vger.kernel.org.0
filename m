Return-Path: <linux-media+bounces-508-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6374F7EF421
	for <lists+linux-media@lfdr.de>; Fri, 17 Nov 2023 15:11:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 944DB1C20AC3
	for <lists+linux-media@lfdr.de>; Fri, 17 Nov 2023 14:11:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA15B347AC;
	Fri, 17 Nov 2023 14:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="wqpyb+mu"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E38BC10D5;
	Fri, 17 Nov 2023 06:11:01 -0800 (PST)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3AHB6RNb030464;
	Fri, 17 Nov 2023 15:10:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	selector1; bh=nhCVb9/ufGDkUspAqK4Ca8baYbZP5+/oHMkFDnE6y1g=; b=wq
	pyb+muqYgVm6ayUbj14jUE/tbnAx6B47oyHP2gN5/U6etoMrNbNjlxE7nGTlZkq5
	DOo03uHm7f4e3DmT08zS587u5k2ovrkIff0w712MIHkqlu6Dr03tKI4Hv5yG/WKg
	rfxtL9jnRokM2M9/BSOvVsmEEpnY89lUknxN+HPX2HzOVPAKyPJxzlVG2llldJ9J
	Z2WJE3CN4EJODhgkXLm+U/5hlEqTljmzKtxZn7GCPhOiRVcfYEClgDM49JfPpwnF
	/d+pXH4BJUFH/A3Tzuc+AJSckTlTi/r+tkppDfIVXaL7Qs9PBim7u3QpCPNqetBj
	H4mLMu8dcH5jfuREluXQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ua1u2bp3f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 15:10:49 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A0A2910002A;
	Fri, 17 Nov 2023 15:10:48 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9749D22FA22;
	Fri, 17 Nov 2023 15:10:48 +0100 (CET)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 17 Nov
 2023 15:10:48 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Alain Volmat <alain.volmat@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi
	<jacopo.mondi@ideasonboard.com>,
        Kieran Bingham
	<kieran.bingham@ideasonboard.com>,
        Pavel Machek <pavel@ucw.cz>,
        Conor Dooley
	<conor.dooley@microchip.com>,
        Rob Herring <robh@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 2/3] dt-bindings: media: i2c: add galaxycore,gc2145 dt-bindings
Date: Fri, 17 Nov 2023 15:09:41 +0100
Message-ID: <20231117140947.540669-3-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231117140947.540669-1-alain.volmat@foss.st.com>
References: <20231117140947.540669-1-alain.volmat@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-17_12,2023-11-17_01,2023-05-22_02

Introduction of the Galaxy Core GC2145 XVGA CMOS camera sensor.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
v4: add link-frequencies & correct description

 .../bindings/media/i2c/galaxycore,gc2145.yaml | 113 ++++++++++++++++++
 1 file changed, 113 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/galaxycore,gc2145.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/galaxycore,gc2145.yaml b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc2145.yaml
new file mode 100644
index 000000000000..1726ecca4c77
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc2145.yaml
@@ -0,0 +1,113 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/galaxycore,gc2145.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Galaxy Core 1/5'' UXGA CMOS Image Sensor
+
+maintainers:
+  - Alain Volmat <alain.volmat@foss.st.com>
+
+description:
+  The Galaxy Core GC2145 is a 2 Megapixel CMOS image sensor, for mobile
+  phone camera applications and digital camera products. GC2145 incorporates a
+  1616V x 1232H active pixel array, on-chip 10-bit ADC, and image signal
+  processor allowing AE/AWB/interpolation/de-noise/color-conversion and
+  gamma correction. Bayer RGB, RGB565 and YCbCr 4:2:2 can be provided by the
+  sensor. It is programmable through an I2C interface. Image data is sent
+  either through a parallel interface or through MIPI CSI-2.
+
+allOf:
+  - $ref: ../video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: galaxycore,gc2145
+
+  reg:
+    const: 0x3c
+
+  clocks:
+    maxItems: 1
+
+  powerdown-gpios:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  iovdd-supply:
+    description: Power Supply for I/O circuits (1.7 - 3V).
+
+  avdd-supply:
+    description: Power for analog circuit/sensor array (2.7 - 3V).
+
+  dvdd-supply:
+    description: Power for digital core (1.7 - 1.9V).
+
+  orientation: true
+
+  rotation: true
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          link-frequencies: true
+
+        required:
+          - link-frequencies
+
+    required:
+      - endpoint
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - powerdown-gpios
+  - reset-gpios
+  - iovdd-supply
+  - avdd-supply
+  - dvdd-supply
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
+        camera@3c {
+            compatible = "galaxycore,gc2145";
+            reg = <0x3c>;
+            clocks = <&clk_ext_camera>;
+            iovdd-supply = <&scmi_v3v3_sw>;
+            avdd-supply = <&scmi_v3v3_sw>;
+            dvdd-supply = <&scmi_v3v3_sw>;
+            powerdown-gpios = <&mcp23017 3 (GPIO_ACTIVE_LOW | GPIO_PUSH_PULL)>;
+            reset-gpios = <&mcp23017 4 (GPIO_ACTIVE_LOW | GPIO_PUSH_PULL)>;
+
+            port {
+                endpoint {
+                    remote-endpoint = <&mipid02_0>;
+                    data-lanes = <1 2>;
+                    link-frequencies = /bits/ 64 <120000000 192000000 240000000>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.25.1


