Return-Path: <linux-media+bounces-19227-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8137F9946A5
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 13:23:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A59C31C23B01
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 11:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 672B91DEFF8;
	Tue,  8 Oct 2024 11:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="nqAOptdJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B521DED6F;
	Tue,  8 Oct 2024 11:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728386501; cv=none; b=q7Xg3yoh4hVKRDA6xy/XaP561DGfK2BMbEGfvHDt9v6bEF+Wu1VhstDpvnV8aVeof6F/8RZFn+7Q1jZzuQaBw5/UccJitH6hUIdtD71OUEjpwA7pf496BdBw49nQ608z0trro5l16xEaSbsxaAX60/TJ/7CH/uMTpInQdp2iXyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728386501; c=relaxed/simple;
	bh=bDZ1nmPh76at+OcvI4UXTjHlWHiTN34mOgxwnYsozA4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=b7xedxs7hCi1oWsE6GQiCHygo7CpKfWnn1ZWwqAkg8JcKUYj1NUob6xa/hde2xhAkibAAkLluQjxB3EBzuOqnZfl4hupLsHXGqhXmoaRVmRoKJaKdle1DPrmsl3sD0EuhBfTZNCXpGC36cHU7zM3YGMU7NsVZfF3qc7JZoQuu+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=nqAOptdJ; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4989xKYQ010445;
	Tue, 8 Oct 2024 13:21:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	kiqzWHEBgnNYNgdh+Exj40v+YEhGxybZPtFdvBV6hu4=; b=nqAOptdJRBi4dFTT
	0QfU9K772LTxMs3WZPyfle7J20aD/O5BIm4+ERlSP9yS6xPPV4Rq/nYz03uyyuw3
	dmkdxo/CMLS1dkYse7bnrQRgHNwM85Ud85lGI2DceBexlAUbIU6Vf2rN8yFFEmBH
	6/OA/vrwTVllKIK4qh4wVrZVgcLyq1pl6UIWRcnCUzkgFQGGxrZ5W8N6J7qtkwhl
	ga7SmdDIoH2DU4X9MnGewe7o9IaqywA0awal9LCb/GQ+2TsGW/zxl78Z/cQ6QJIJ
	xy41f1HHVcJO0Yy+5tYv3kzgexzjljQJ6oniDbrDr6oQdEABLQ/Ehvz9LUjQG00t
	aPYWog==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 422xv760qt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Oct 2024 13:21:26 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 549FE40055;
	Tue,  8 Oct 2024 13:20:12 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0A25128518A;
	Tue,  8 Oct 2024 13:18:15 +0200 (CEST)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 8 Oct
 2024 13:18:14 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 8 Oct 2024 13:18:04 +0200
Subject: [PATCH 02/15] dt-bindings: media: addition of stm32 csi driver
 description
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241008-csi_dcmipp_mp25-v1-2-e3fd0ed54b31@foss.st.com>
References: <20241008-csi_dcmipp_mp25-v1-0-e3fd0ed54b31@foss.st.com>
In-Reply-To: <20241008-csi_dcmipp_mp25-v1-0-e3fd0ed54b31@foss.st.com>
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
        <devicetree@vger.kernel.org>, Alain Volmat <alain.volmat@foss.st.com>
X-Mailer: b4 0.14.0
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Addition of the stm32 csi controller driver

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 .../devicetree/bindings/media/st,stm32-csi.yaml    | 129 +++++++++++++++++++++
 1 file changed, 129 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/st,stm32-csi.yaml b/Documentation/devicetree/bindings/media/st,stm32-csi.yaml
new file mode 100644
index 000000000000..71e7c51be58c
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/st,stm32-csi.yaml
@@ -0,0 +1,129 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/st,stm32-csi.yaml#
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
+                description:
+                  Indicate the number of data-lanes and their mapping.
+
+                items:
+                  minItems: 1
+                  items:
+                    - const: 1
+                    - const: 2
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
+                    data-lanes = <0 1>;
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


