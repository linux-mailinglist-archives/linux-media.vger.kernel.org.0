Return-Path: <linux-media+bounces-21530-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C329D1244
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 14:42:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34ECE28419C
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 13:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD9B91B394F;
	Mon, 18 Nov 2024 13:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="OsWDIh0W"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F8E1991A5;
	Mon, 18 Nov 2024 13:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731937218; cv=none; b=OLC08yrLxuJuqacJPs4lSlSkB40VIhHgP9hUo+zYgAfzfeFIkE8PWsBAhj6lzKECnm+t7GqajuAe8gw3kT2nMgJpSal3d+tiYKhIGUyNflRgToG6YJ9kVTKSNlLvAzCszx5zBrSuNY5B2pJwCh+mRDy6cUC+06cALJSCjtIukZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731937218; c=relaxed/simple;
	bh=inE9kFVLCmvSAeXHoc+I1KKHTYYTqpPm0WjcTjjoSIY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=peBoQEBEYLWc17Vv9R7iUNNEOpWUPG8MBKE0W325oSKWPimnRthbQZXjvYl4UV4j/3h9X9XwrpG1tQ85Z5doOx5o2gnTaVFwV607yLgrfGOuDfrJN66K5u7iYtqtq9G0bg5okw7AGHNrArgoewPvd2XvQrV4diQDBfblDt0T/Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=OsWDIh0W; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AIBbYPd032344;
	Mon, 18 Nov 2024 14:39:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	QEJZk2vCEJhGT0eZcp9hmNAE/SV2uyT+MnBUZGRJClc=; b=OsWDIh0W/bzuo23+
	VvDUKMHc1ANgZ/u2jrvRZx7pTkbCMdOuoVWvZFzFKKlXZOKDNbXo1BAA388vIlv4
	Xm2GefEvnUo1xIEnUB3aJwO3wWn15w/C6ZbM2V7dE/7uPgc9PJgl9ICNVbrGgT64
	HUfbdzGF0RpBQTgnWFxF44eb/pwQRIZ99bBf1WNuuaWZkFEuGpf8juzMVBifDd8s
	xEnsSluRmT78CBwAG0iEtkL2hvmsJ3UT7joJAErUsjYqUu58Ft4wAzpRDRelHTTH
	ixSe9SFSjbnVebgPUkHD7DGA2dayLXkc4bDj5yAa80gW9DL161b3mEIyXoHd9QLq
	ybz/iw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42xkqeq7s1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 14:39:52 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 01F1D4005C;
	Mon, 18 Nov 2024 14:38:32 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 614BC2721D3;
	Mon, 18 Nov 2024 14:35:27 +0100 (CET)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 18 Nov
 2024 14:35:27 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Mon, 18 Nov 2024 14:35:25 +0100
Subject: [PATCH v3 02/15] dt-bindings: media: add description of stm32 csi
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241118-csi_dcmipp_mp25-v3-2-c1914afb0a0f@foss.st.com>
References: <20241118-csi_dcmipp_mp25-v3-0-c1914afb0a0f@foss.st.com>
In-Reply-To: <20241118-csi_dcmipp_mp25-v3-0-c1914afb0a0f@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Hans Verkuil
	<hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Alain Volmat <alain.volmat@foss.st.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Add the stm32 csi controller description.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
v2:
  - rename into st,stm32mp25-csi.yaml to match compatible
  - correct port / data-lanes (remove useless lines &
    use data-lanes 1 and 2 instead of 0 and 1)
  - correct commit log
---
 .../bindings/media/st,stm32mp25-csi.yaml           | 125 +++++++++++++++++++++
 1 file changed, 125 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml b/Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..33bedfe419244e12dbb98b358821bbc39ea6facf
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml
@@ -0,0 +1,125 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/st,stm32mp25-csi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STM32 CSI controller
+
+description:
+  The STM32 CSI controller allows connecting a CSI based
+  camera to the DCMIPP camera pipeline.
+
+maintainers:
+  - Alain Volmat <alain.volmat@foss.st.com>
+
+properties:
+  compatible:
+    enum:
+      - st,stm32mp25-csi
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: txesc
+      - const: csi2phy
+
+  resets:
+    maxItems: 1
+
+  vdd-supply:
+    description: Digital core power supply (0.91V)
+
+  vdda18-supply:
+    description: System analog power supply (1.8V)
+
+  access-controllers:
+    minItems: 1
+    maxItems: 2
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port node
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                minItems: 1
+                items:
+                  - const: 1
+                  - const: 2
+
+            required:
+              - data-lanes
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Output port node
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/st,stm32mp25-rcc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/media/video-interfaces.h>
+    #include <dt-bindings/reset/st,stm32mp25-rcc.h>
+    csi@48020000 {
+        compatible = "st,stm32mp25-csi";
+        reg = <0x48020000 0x2000>;
+        interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>;
+        resets = <&rcc CSI_R>;
+        clocks = <&rcc CK_KER_CSI>, <&rcc CK_KER_CSITXESC>, <&rcc CK_KER_CSIPHY>;
+        clock-names = "pclk", "txesc", "csi2phy";
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            port@0 {
+                reg = <0>;
+                endpoint {
+                    remote-endpoint = <&imx335_ep>;
+                    data-lanes = <1 2>;
+                    bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                endpoint {
+                    remote-endpoint = <&dcmipp_0>;
+                };
+            };
+        };
+    };
+
+...

-- 
2.25.1


