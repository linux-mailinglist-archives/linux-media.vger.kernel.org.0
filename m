Return-Path: <linux-media+bounces-29242-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D579EA79079
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 15:57:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F4A41898CB2
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 13:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 312D223BD18;
	Wed,  2 Apr 2025 13:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="XLvrC3td"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C763223AE93;
	Wed,  2 Apr 2025 13:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743601880; cv=none; b=PyyWpdlGHE97bd1D9UFq7Fmt1i+x/XITSgfgDm6usVIBuS8VcsaZptrH1pjZsLs+cqSSLve4VNcmJbPPfVI5r+Eg0PF/WlyN1dD7Bc3vQBssyZKMzRWF6k4oYw93SBfhdWRdjQvN1qtMx2tYMhW/eaDhULnNPvZA3hBZ8sMvz64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743601880; c=relaxed/simple;
	bh=p140j85/OhrO+olRgenPRYTgAEsPqbvKi908SwugwnA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=AtiN0r14Hnh5DZOyvrzo94mTwRwUctE6b6YR6A1rWFqsnYQtOkWsIhXZ8nlBPdRGf9B5EivJdg2PYUEXyIRLtoctOT06IfRfkJ9PGeVsqaplAkJLVI41qhwml96VhMyfFEYs3FEkhyNtwcyrksD+SmeDdh3+7GcN4rMN8nERx90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=XLvrC3td; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532DDRJM010851;
	Wed, 2 Apr 2025 15:51:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	O37U+v4j395dBnYsfKXjVXFCQcxZ6sixrAELvfvA4xc=; b=XLvrC3tdzKtygF5o
	pzqDv085KMsjy59dYdG/6ipkle2/7enTBJIjLZnxhRduWkj49i4MmmeJf13G+Vra
	zxmzi/n3hu3wqVG6SB2bwdC46ns0WrLI5NtrBFTyJQhU3ZflsHBrZNKD777Ej+iZ
	tJD15J7Lp/ioGTHHCRL0uG63978wS5H8HNeuU7QOy1jS0z1m14G6GWYXRynBnUnF
	pAchC2hKO/evtm58BCElggCSA1fR0JCrkp8aScH7h6L5/gWG3gz7ioSF5CFGu+s9
	Pn24ewWQPLg6SZ5lKj02REFIgrsp5dssXHCC1Y0SJOa2J930G+lwyeU0tfWvObHm
	hc0knA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45pua81034-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Apr 2025 15:51:10 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id CFED1400AE;
	Wed,  2 Apr 2025 15:50:22 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 71F85861386;
	Wed,  2 Apr 2025 15:50:10 +0200 (CEST)
Received: from localhost (10.252.30.87) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Apr
 2025 15:50:10 +0200
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Date: Wed, 2 Apr 2025 15:50:06 +0200
Subject: [PATCH v4 1/2] media: dt-bindings: Add ST VD55G1 camera sensor
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250402-b4-vd55g1-v4-1-84b1f54c670c@foss.st.com>
References: <20250402-b4-vd55g1-v4-0-84b1f54c670c@foss.st.com>
In-Reply-To: <20250402-b4-vd55g1-v4-0-84b1f54c670c@foss.st.com>
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
        <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_05,2025-04-02_02,2024-11-22_01

Also update MAINTAINERS file accordingly.

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


