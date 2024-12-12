Return-Path: <linux-media+bounces-23262-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7847E9EE29A
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 10:20:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3501281960
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 09:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E57BF20FABB;
	Thu, 12 Dec 2024 09:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="a82B5Z9E"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFEB20E318;
	Thu, 12 Dec 2024 09:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733995232; cv=none; b=I8+XCcRLMLr8STHT73i2OpT284213lrbZ9fP/+Fhpzs+YSJ6uUMNsDO3P6GLQlvbny++d0dpfmgreVlqWUr0aiWbzzHom7k3Dzz9wNXsSDRx8HoCPMevX4gSYFV9uewRSaaBTmXR/mE3z4URcH3Ox31ymYFRNWyHWSg8HOXyp5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733995232; c=relaxed/simple;
	bh=oYc5DRAiML9vtY2LTEsYJjPnid7AZWIe53/hS/2Jt2c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=uLLYUC6LWEVzA3xGdNoODvzreKlVCJPiPdAPYJhIO7q78RW1nWlS1g3kViMdeslodGZzwCkjOhMvdIlI4f6ioDhhXx6fybsIqwCdErVhKwyq1l3bfOZFeJ+KShI6lXezRMzjERlbGAUv4cckV6xXFHA/Fv68tjZrwobr4EWNwF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=a82B5Z9E; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC1QTlJ013783;
	Thu, 12 Dec 2024 10:20:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	ZG+DJqE87aAnkvsLoLPKCmF7dWVP//ATDZRc8GDxWXs=; b=a82B5Z9EWIVT47Du
	x/7jyJTieq+b5TgFGwuhnDYcD0tjCqIE/W+goBCSuekL9YSX5+gld+/+10swe0bd
	cdRL8yy4ESvk43EqPbTHZtizZcgVTxF9KShrVLbS4kxv7CMoRXkRi4CaceaVOcV/
	rY4cPt0f62cQjOfLJv12ctWXnCKET8vwv9lb9+pPxdNUqOn59l2gsZ5uxYGoW28r
	Qdi+WL9MNeunw0LqBxUaOUhjTQCQFbP8/E0Bdt4GPmWKdLJo5o9VVgxXIYc3JQFa
	fFwpj8C86l+HDKn5DBvEQWj3s9mLSvctuEOJKGfHGyOXUN41yCRy2q+YC2Zb2LIQ
	2ZLAoA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43ccnmf78a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 10:20:16 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D9AA64004B;
	Thu, 12 Dec 2024 10:18:58 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2E5F5250EA7;
	Thu, 12 Dec 2024 10:18:04 +0100 (CET)
Received: from localhost (10.129.178.65) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 12 Dec
 2024 10:18:03 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Thu, 12 Dec 2024 10:17:26 +0100
Subject: [PATCH v4 02/15] dt-bindings: media: add description of stm32 csi
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241212-csi_dcmipp_mp25-v4-2-fbeb55a05ed7@foss.st.com>
References: <20241212-csi_dcmipp_mp25-v4-0-fbeb55a05ed7@foss.st.com>
In-Reply-To: <20241212-csi_dcmipp_mp25-v4-0-fbeb55a05ed7@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Sakari Ailus
	<sakari.ailus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp
 Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>, Hans
 Verkuil <hverkuil@xs4all.nl>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Alain Volmat <alain.volmat@foss.st.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
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
index 000000000000..33bedfe41924
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
2.34.1


