Return-Path: <linux-media+bounces-29477-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 48493A7D97E
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 11:23:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77BF517A986
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 09:20:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3015232377;
	Mon,  7 Apr 2025 09:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="1fjV39yz"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CD7230242;
	Mon,  7 Apr 2025 09:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744017544; cv=none; b=GcVUq6tCUIo7ZNoH0d6DLiXGKy1k3T0oddMRoClVuH1ACCv54QCh+1OF9FJB7Kkn/hdSbo5YCDhjp0oMVSHxiCRMYAZnaYHzgXSGoVis9or4hBLFoRo5IQVQgPrYWc3u5Sd0dnUBoH+9Q2ykw+kAKr5D7xSyshl8rsJ4vFtXIqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744017544; c=relaxed/simple;
	bh=ltxOTyeO04Wt1uUU5eVlgp7FhozyFZwWqUtRcFOCauA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ise2CAFQPzmPGS6b2M86al4pguk2Q3zPlgrIzYJoeIoGAmCxRh+BukX6QyRq+hBAx6CGBDVIam6X44m/Wh/cYjbGQBC/cE00kEzU9P2owYaeArJUWpxbO7ystaRGKTJUGw5IuC9XRqh0DHUmJ64DXgEEKJ47wF10UetxqLwQb4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=1fjV39yz; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5377m0sd028588;
	Mon, 7 Apr 2025 11:18:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	mhU2CUm77zU9ySWU3DVC6yn8pSk2uVAfU+scG0hka6w=; b=1fjV39yzuIv2MmFU
	9Jm9yEXksvEXGeTN5n5CYrzoqAzyHq6u9oGRflNKMIFl6Wlmnlkg7VjlCoARyPT6
	gU86UVJ8Ac2bFpIBFEUPKsPublSdI6f3DqshH98oGD0S0TC5NK1i7JVKzoKkaIqZ
	8npANksPSzj+I7geyUN6mMbIv2vkfyKtf7cImiTlwICrk6ICyoz8DpfChZYTAC8Y
	Q4NIacaWKcrI9NpVvMuVrQoHHUdVIHPAVsbgk/z6DQE+sP71PKsyohfqPftYxjrv
	gnIH6sM8+787ydxIEr95RSfAgpbxijoSaVIX0PPE4t58amAWETi4Sl6jJwE57n7j
	Tys15A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45tw6e6s40-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 11:18:52 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C448240045;
	Mon,  7 Apr 2025 11:18:12 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1C73194D584;
	Mon,  7 Apr 2025 11:17:37 +0200 (CEST)
Received: from localhost (10.252.1.150) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Apr
 2025 11:17:36 +0200
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Date: Mon, 7 Apr 2025 11:17:29 +0200
Subject: [PATCH v6 1/2] media: dt-bindings: Add ST VD55G1 camera sensor
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250407-b4-vd55g1-v6-1-1850f18b1f24@foss.st.com>
References: <20250407-b4-vd55g1-v6-0-1850f18b1f24@foss.st.com>
In-Reply-To: <20250407-b4-vd55g1-v6-0-1850f18b1f24@foss.st.com>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Sylvain Petinot
	<sylvain.petinot@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus
	<sakari.ailus@linux.intel.com>
CC: <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_02,2025-04-03_03,2024-11-22_01

Also update MAINTAINERS file accordingly.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
 .../devicetree/bindings/media/i2c/st,vd55g1.yaml   | 132 +++++++++++++++++++++
 MAINTAINERS                                        |   7 ++
 2 files changed, 139 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml b/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..6b777f86790da4e5941ac1cad86dc1a5021f9f5b
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
@@ -0,0 +1,132 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright (c) 2025 STMicroelectronics SA.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/st,vd55g1.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics VD55G1 Global Shutter Image Sensor
+
+maintainers:
+  - Benjamin Mugnier <benjamin.mugnier@foss.st.com>
+  - Sylvain Petinot <sylvain.petinot@foss.st.com>
+
+description: |-
+ The STMicroelectronics VD55G1 is a global shutter image sensor with an active
+ array size of 804H x 704V. It is programmable through I2C interface. The I2C
+ address is fixed to 0x10.
+ Image data is sent through MIPI CSI-2, which is configured as only 1 data
+ lane. The sensor provides 4 GPIOS that can be used for external LED signal
+ (synchronized with sensor integration periods).
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: st,vd55g1
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
+      time. The numbers identify the sensor pin on which the illumination
+      system is connected. GPIOs are active-high.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 4
+    items:
+      minimum: 0
+      maximum: 3
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
+            items:
+              - const: 1
+
+          link-frequencies:
+            maxItems: 1
+            items:
+              minimum: 125000000
+              maximum: 600000000
+
+          lane-polarities:
+            minItems: 1
+            maxItems: 2
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
+            compatible = "st,vd55g1";
+            reg = <0x10>;
+
+            clocks = <&camera_clk_12M>;
+
+            vcore-supply = <&camera_vcore_v1v15>;
+            vddio-supply = <&camera_vddio_v1v8>;
+            vana-supply = <&camera_vana_v2v8>;
+
+            reset-gpios = <&gpio 5 GPIO_ACTIVE_LOW>;
+            st,leds = <2>;
+
+            orientation = <2>;
+            rotation = <0>;
+
+            port {
+                endpoint {
+                    data-lanes = <1>;
+                    link-frequencies = /bits/ 64 <600000000>;
+                    remote-endpoint = <&csiphy0_ep>;
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 2286200b355bde3604607be916ef09aa88feed0e..4f5e9005063a157de69e81b10f8def9da9e6c04c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22410,6 +22410,13 @@ S:	Maintained
 F:	Documentation/hwmon/stpddc60.rst
 F:	drivers/hwmon/pmbus/stpddc60.c
 
+ST VD55G1 DRIVER
+M:	Benjamin Mugnier <benjamin.mugnier@foss.st.com>
+M:	Sylvain Petinot <sylvain.petinot@foss.st.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
+
 ST VGXY61 DRIVER
 M:	Benjamin Mugnier <benjamin.mugnier@foss.st.com>
 M:	Sylvain Petinot <sylvain.petinot@foss.st.com>

-- 
2.25.1


