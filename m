Return-Path: <linux-media+bounces-28922-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0263DA74BC3
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 14:57:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 290881B61FCA
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 13:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30F1722A80F;
	Fri, 28 Mar 2025 13:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="HMKOWcGv"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1046226D0D;
	Fri, 28 Mar 2025 13:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743169454; cv=none; b=tN7EPfB57DHlyHdn8UD4wa2UexUwoplUOJ72XTLbnWlVrzgm2zSpG2as/jil9eMpmg+KQ2Yg2HzSBKB1K7wENUfZZ9hQ5r7rtFnGbE3xfhzUAYWjVaGsPi+05rHj6LkH0DVP5vC9R+ePW+gSYuB5ckhXRWSy8NyscLFNxpUTDzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743169454; c=relaxed/simple;
	bh=B09DmvfuwKQnKKPyLjWuwPuy4a1Kzv7cEXMmP3aehVM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=FsS6ZPcQE0dJy9dKmWoWncLgSHfBXzECuKox1LePfrctGdH9SDFlHKWblaYji9zH7LJEEl24B6g7iXpfWKtk7s7Ei2YdCY5U15JFx16mKRRjQG5aCS9dfltqG2Cab1A3GE8uqLUbyCDPhcbwYyvrRsIxu5Uy5ezyVZtsxbfrBzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=HMKOWcGv; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52S9GrOJ024396;
	Fri, 28 Mar 2025 14:44:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	a8C47gNmBbZ4DdVlcgr/qWCee01+1QgPOVDIeBxCW0A=; b=HMKOWcGveoYrcvrf
	0SQlo8YVL2sMPCULk8FMF042ihjTkyquZauOXD+uE89toAOSGM53r39R5ciovzEy
	g3d1laLFe8HG2w+tO8o3uGeZfwMlaVrWz36nA49f9FrPMfDauc5C/uEm4Ep10Lxp
	aZMYlJx0TQFX8aWTcCdPft9vA6cV3fwnu7neddlItoNhScs4wNCugv2U0lFdT85L
	tMHdp1kRQL/gaN9tGl4O096NaLuN/Qtf0dKSijj/FLE+KTGOMUbzzRNciuduLLgq
	qrIXmglNSuccSG/HWGFJw18F7/cdbaJJEUt/H4n1uKzo9Dj8TbXUB7XY/ANWSUo7
	dDh+jA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45nq0e9tx9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Mar 2025 14:44:03 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 305494004B;
	Fri, 28 Mar 2025 14:42:51 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2E8038EA1BC;
	Fri, 28 Mar 2025 14:40:25 +0100 (CET)
Received: from localhost (10.252.9.227) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 28 Mar
 2025 14:40:24 +0100
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Date: Fri, 28 Mar 2025 14:40:21 +0100
Subject: [PATCH 1/2] media: dt-bindings: Add ST VD55G1 camera sensor
 binding
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250328-b4-vd55g1-v1-1-8d16b4a79f29@foss.st.com>
References: <20250328-b4-vd55g1-v1-0-8d16b4a79f29@foss.st.com>
In-Reply-To: <20250328-b4-vd55g1-v1-0-8d16b4a79f29@foss.st.com>
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
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_07,2025-03-27_02,2024-11-22_01

Also update MAINTAINERS file accordingly.

Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
 .../devicetree/bindings/media/i2c/st,vd55g1.yaml   | 135 +++++++++++++++++++++
 MAINTAINERS                                        |   8 ++
 2 files changed, 143 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml b/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..e0a0b70a91db743703b020b4b839942fe75402e8
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
@@ -0,0 +1,135 @@
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
+    const: st,st-vd55g1
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
+            description:
+              VD55G1 only has one data lane, and must be 1.
+            maxItems: 1
+            items:
+              const: 1
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
index 2286200b355bde3604607be916ef09aa88feed0e..857af27ef392b6e6865d9a545061d1b012cce07e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22410,6 +22410,14 @@ S:	Maintained
 F:	Documentation/hwmon/stpddc60.rst
 F:	drivers/hwmon/pmbus/stpddc60.c
 
+ST VD55G1 DRIVER
+M:	Benjamin Mugnier <benjamin.mugnier@foss.st.com>
+M:	Sylvain Petinot <sylvain.petinot@foss.st.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media.git
+F:	Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
+
 ST VGXY61 DRIVER
 M:	Benjamin Mugnier <benjamin.mugnier@foss.st.com>
 M:	Sylvain Petinot <sylvain.petinot@foss.st.com>

-- 
2.25.1


