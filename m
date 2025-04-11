Return-Path: <linux-media+bounces-30069-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0C7A8682E
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 23:26:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27EEA8C37D5
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 21:23:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23F9329DB82;
	Fri, 11 Apr 2025 21:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="7mLvv7qu"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D3F26F44A;
	Fri, 11 Apr 2025 21:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744406619; cv=none; b=jY0DEs6nXB99279Ip2f6z3OnFs5VyKnsnmt1c5EupnG2n6VfJ/CKEj8OAkHztYCw9fvUqQPZSq4JBC1j2C7sz9pCtgAx9T0HWMnEvUBjKWiJLH9fSNYpljzMfZf1yb0KGuZv6l+KXhYnQgojvegfNmq8dBDTlZGjhxCTaf+bPgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744406619; c=relaxed/simple;
	bh=cX63XKW2HHprsM6zt/RgAE01PVcfHNevC+TuTOZGi0s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=udOVVPQul77ehi0sNoKRR7LrDKkqYJRNSbKm91kU66IjbiaF7ylscRHv8CoyhtcNs7/GbY0HctNP7/uLDnjEY4O1KUSHQust+2fHF2XZURLDgxaZvagkrWtWb0iIM8SpI2lmMIdWSpifDmn0O7dR3mSt/lGScmxhU5vwzhiEW3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=7mLvv7qu; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53BE5U1Q023579;
	Fri, 11 Apr 2025 23:23:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=selector1; bh=fo1chdgzDyFLeixZqZL5vaYl
	fWJ2ZzMUDn4Kzy7/BGU=; b=7mLvv7quSRG5dhOKv1nCRENVMdhu5r+Sf/Gl8zF2
	vfLqklruFTBKX7reKzNaVOF9aOQh2EPSMH6tSypPWAlxtRebWy18lO+INe/DYP2f
	boCfOl05NVcFSp+FwW65gerG9A7jyUFBT6J3CXUqrJwrjV7QKBxh+vYxcAq2MsfW
	eihK3z1y/AP5aasatPFe+RtOIC1hhmSikeSLKirJVvyVuoC3jcQ+Q+fREa0Lje4L
	lbHHvE/Utln0nLMhNhG79JHqX/7Po7K6BV5d1/DFty4uhbosmtYabRBwdEL9px/W
	2gkVrwXxRmir9ubZ4S1mrgp8PsvNPDn/f+HAVE85Z4vrGA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45xgpdx8xt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 23:23:18 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id EFD8E4004B;
	Fri, 11 Apr 2025 23:22:26 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9C8679B8605;
	Fri, 11 Apr 2025 23:21:49 +0200 (CEST)
Received: from localhost (10.130.72.242) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Apr
 2025 23:21:49 +0200
From: Sylvain Petinot <sylvain.petinot@foss.st.com>
To: <benjamin.mugnier@foss.st.com>, <sylvain.petinot@foss.st.com>,
        <mchehab@kernel.org>, <robh@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <sakari.ailus@linux.intel.com>
CC: <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <tomm.merciai@gmail.com>
Subject: [PATCH v5 1/2] media: dt-bindings: Add ST VD56G3 camera sensor
Date: Fri, 11 Apr 2025 23:21:37 +0200
Message-ID: <20250411212138.23059-2-sylvain.petinot@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250411212138.23059-1-sylvain.petinot@foss.st.com>
References: <20250411212138.23059-1-sylvain.petinot@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_08,2025-04-10_01,2024-11-22_01

Add devicetree bindings Documentation for ST VD56G3 & ST VD66GY camera
sensors. Update MAINTAINERS file.

Signed-off-by: Sylvain Petinot <sylvain.petinot@foss.st.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/media/i2c/st,vd56g3.yaml         | 139 ++++++++++++++++++
 MAINTAINERS                                   |   7 +
 2 files changed, 146 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/st,vd56g3.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/st,vd56g3.yaml b/Documentation/devicetree/bindings/media/i2c/st,vd56g3.yaml
new file mode 100644
index 000000000000..c6673b8539db
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/st,vd56g3.yaml
@@ -0,0 +1,139 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright (c) 2024 STMicroelectronics SA.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/st,vd56g3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics VD56G3 Global Shutter Image Sensor
+
+maintainers:
+  - Benjamin Mugnier <benjamin.mugnier@foss.st.com>
+  - Sylvain Petinot <sylvain.petinot@foss.st.com>
+
+description: |-
+  The STMicroelectronics VD56G3 is a 1.5 M pixel global shutter image sensor
+  with an active array size of 1124 x 1364 (portrait orientation). It is
+  programmable through I2C, the address is fixed to 0x10. The sensor output is
+  available via CSI-2, which is configured as either 1 or 2 data lanes. The
+  sensor provides 8 GPIOS that can be used for external LED signal
+  (synchronized with sensor integration periods)
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    enum:
+      - st,vd56g3
+      - st,vd66gy
+    description:
+      Two variants are availables; VD56G3 is a monochrome sensor while VD66GY
+      is a colour variant.
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  vcore-supply:
+    description: Digital core power supply (1.15V)
+
+  vddio-supply:
+    description: Digital IO power supply (1.8V)
+
+  vana-supply:
+    description: Analog power supply (2.8V)
+
+  reset-gpios:
+    description: Sensor reset active low GPIO (XSHUTDOWN)
+    maxItems: 1
+
+  st,leds:
+    description:
+      List sensor's GPIOs used to control strobe light sources during exposure
+      time. The numbers identify the sensor pin on which the illumination system
+      is connected. GPIOs are active-high.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 8
+    items:
+      minimum: 0
+      maximum: 7
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            minItems: 1
+            maxItems: 2
+            items:
+              enum: [1, 2]
+
+          link-frequencies:
+            maxItems: 1
+            items:
+              enum: [402000000, 750000000]
+
+          lane-polarities:
+            minItems: 1
+            maxItems: 3
+            description: Any lane can be inverted or not.
+
+        required:
+          - data-lanes
+          - link-frequencies
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - vcore-supply
+  - vddio-supply
+  - vana-supply
+  - reset-gpios
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera-sensor@10 {
+            compatible = "st,vd56g3";
+            reg = <0x10>;
+
+            clocks = <&camera_clk_12M>;
+
+            vcore-supply = <&camera_vcore_v1v15>;
+            vddio-supply = <&camera_vddio_v1v8>;
+            vana-supply = <&camera_vana_v2v8>;
+
+            reset-gpios = <&gpio 5 GPIO_ACTIVE_LOW>;
+            st,leds = <6>;
+
+            orientation = <2>;
+            rotation = <0>;
+
+            port {
+                endpoint {
+                    data-lanes = <1 2>;
+                    link-frequencies = /bits/ 64 <402000000>;
+                    remote-endpoint = <&csiphy0_ep>;
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 29b447157498..9cc0a50ec59d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22410,6 +22410,13 @@ S:	Maintained
 F:	Documentation/hwmon/stpddc60.rst
 F:	drivers/hwmon/pmbus/stpddc60.c
 
+ST VD56G3 IMAGE SENSOR DRIVER
+M:	Benjamin Mugnier <benjamin.mugnier@foss.st.com>
+M:	Sylvain Petinot <sylvain.petinot@foss.st.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/st,vd56g3.yaml
+
 ST VGXY61 DRIVER
 M:	Benjamin Mugnier <benjamin.mugnier@foss.st.com>
 M:	Sylvain Petinot <sylvain.petinot@foss.st.com>
-- 
2.17.1


