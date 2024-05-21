Return-Path: <linux-media+bounces-11704-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAD88CB22C
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2024 18:31:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 229CD282C62
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2024 16:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1F227EF08;
	Tue, 21 May 2024 16:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="WKpHZGwR"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B1A17556;
	Tue, 21 May 2024 16:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716309066; cv=none; b=d0OqI9bf+1XHDrBlfMjI+p7hDXBPuAhOMKY097sajCQeyRdu2YDMPIAheii5Qd4ZWV21X8Gw2Zl0ej7h11GJO2S0H0UVR9IrQ+7BariqaB/LnxBmCy1cf6BMi2Msu5bVYGpQHBuUGlmctkrnzJUr9I2GLkA/59QmCw62sSk7o4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716309066; c=relaxed/simple;
	bh=vKGOTT1yBBRyHhWvN3uok2skglokzqEQ67BbRlFR580=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FZgkRQSyEIjB/z+uplw5DSIFW0WOshOfdFnUeaIm/Sv/enRsYXKokRBXpyVmC2aQ64kEFhC9cpvQ1rHf7HYVBXnsm+xLsi8KFMbkJsVq6kHHP9MKuRqL7BqTm0PxBqrOHcpKcYb1w/2UWdr6zLuHXD1lkwYIv+rphYz5R/enQRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=WKpHZGwR; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44LGIegf023007;
	Tue, 21 May 2024 18:30:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=selector1; bh=ITGLkU6HTHqFtjoyA5kj
	iBnTyFGlt6kPKc0wp2BTy68=; b=WKpHZGwRnWUMX+hq8UrnhKBMf3FwVp0vY9+Y
	+/GzuoDSWXlmyYWaanvIjy+J7PvWQb3paqcQEnTeb4lZDbkb6jGNCrSeowSTr90o
	hV5IXDWp7gErkwHL/Ps/zeuGLmWgv397ZOPsPFjKkniK7mofdNYeiuWybFJhZ5co
	uzc7nPnNkV5Ep7HXemuCb8UFTi5Or2N+/uVgXBWC3+HvYF8vQoO2sjLBotJi79Z8
	sHw6UNU51f6rDnXfY3j65hKkIfcX+KxXiGyJjwH7Zb7L3hdUOzhZD1KVxj5FSttx
	UF7mbFLp2VxPA+i2geSR0YCDNZXwUaj/8fUv+PBxaVctFPs0Qg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3y8vqh8nn4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 18:30:57 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4133340045;
	Tue, 21 May 2024 18:30:53 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 76E9F226FDA;
	Tue, 21 May 2024 18:30:23 +0200 (CEST)
Received: from localhost (10.130.72.242) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 21 May
 2024 18:30:23 +0200
From: Sylvain Petinot <sylvain.petinot@foss.st.com>
To: <benjamin.mugnier@foss.st.com>, <sylvain.petinot@foss.st.com>,
        <mchehab@kernel.org>, <robh@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/2] media: dt-bindings: Add ST VD56G3 camera sensor binding
Date: Tue, 21 May 2024 18:29:49 +0200
Message-ID: <20240521162950.6987-2-sylvain.petinot@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240521162950.6987-1-sylvain.petinot@foss.st.com>
References: <20240521162950.6987-1-sylvain.petinot@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-21_10,2024-05-21_01,2024-05-17_01

Add devicetree bindings Documentation for ST VD56G3 & ST VD66GY camera
sensors. Update MAINTAINERS file.

Signed-off-by: Sylvain Petinot <sylvain.petinot@foss.st.com>
---
 .../bindings/media/i2c/st,st-vd56g3.yaml      | 132 ++++++++++++++++++
 MAINTAINERS                                   |   9 ++
 2 files changed, 141 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/st,st-vd56g3.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/st,st-vd56g3.yaml b/Documentation/devicetree/bindings/media/i2c/st,st-vd56g3.yaml
new file mode 100644
index 000000000000..22cb2557e311
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/st,st-vd56g3.yaml
@@ -0,0 +1,132 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright (c) 2024 STMicroelectronics SA.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/st,st-vd56g3.yaml#
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
+properties:
+  compatible:
+    enum:
+      - st,st-vd56g3
+      - st,st-vd66gy
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
+      Sensor's GPIOs used for external LED control. Signal being the enveloppe
+      of the integration time.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 8
+    items:
+      minimum: 0
+      maximum: 7
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
+          data-lanes:
+            minItems: 1
+            maxItems: 2
+            items:
+              enum: [1, 2]
+
+          link-frequencies:
+            minItems: 1
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
+        camera-sensor@10 {
+            compatible = "st,st-vd56g3";
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
index ef6be9d95143..554e6861425b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20885,6 +20885,15 @@ S:	Maintained
 F:	Documentation/hwmon/stpddc60.rst
 F:	drivers/hwmon/pmbus/stpddc60.c
 
+ST VD56G3 DRIVER
+M:	Benjamin Mugnier <benjamin.mugnier@foss.st.com>
+M:	Sylvain Petinot <sylvain.petinot@foss.st.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/i2c/st,st-vd56g3.yaml
+F:	drivers/media/i2c/st-vd56g3.c
+
 ST VGXY61 DRIVER
 M:	Benjamin Mugnier <benjamin.mugnier@foss.st.com>
 M:	Sylvain Petinot <sylvain.petinot@foss.st.com>
-- 
2.17.1


