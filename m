Return-Path: <linux-media+bounces-17557-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A704F96B9C1
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 13:12:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE2FC1C21EBF
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 11:12:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 614B61D014F;
	Wed,  4 Sep 2024 11:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hLL8bmqz"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C221CF7AC;
	Wed,  4 Sep 2024 11:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725448321; cv=none; b=UDl5jQwLHggEn21ro56/67pJ/fjXsSr4TAIMb5Wqs571h24W7oKWXKax1DX9gYaYMm8lXb1VJV1Of/T3Cdrddjnn2sjKw2WXW5EYNozx7o0RBBvGxtmUD+dyEY8ApENbcFyMQHJjI3sZg1VOETuYjkmZV7mFXG6VBB9/q3NgbAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725448321; c=relaxed/simple;
	bh=OMIotoo1f4MVFOEQwbAjTJ5XoFssgvmRY7kgHUT2m9g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=CyybgDyY5gpiBpYG/a6gufwMOOB7aAsvD3G0sSTTNnomd2tB1hnpAdhs32nlzIxCcoDEnHvmxzc5IaR5xpJ7l6VYFc8N/fVvrwXSmr6zsrJ1cSM95ra2H7bJI9VvV0vk8Ug/Q2PkR3S6g3aFfzF9vpjy15YSrTzZuF3jraud+nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hLL8bmqz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4844XvDk019877;
	Wed, 4 Sep 2024 11:11:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sBm94gTM1ZHaYT4dFpaWU9u+jG/kNBqcujZAnbNTVRw=; b=hLL8bmqz8/wch16z
	pvof3iEXnQn9FCpSpebAmsEG52zCR8inyRW5/uR+Afn7hZ+gA1oXA2YM78iMUxFu
	A5JH2dzQfxC9lk1yAv2B8nAbf/YwQtIWQvf+cUO2NV6UrQXmO0aCaDOykQ5kIM9W
	SC2FhBdnJX2BRyTDBCGzQBcGndkOqQ5XJ2RJo4OmzlQleXc1UtBUvT2AHz89mIWE
	6oRFMwH6PDfGNf/ezqlNUPOofYQo/eIDM70jI7kUJRLiIhsdng+lkAZTnX6lEjHQ
	FjQCnM9y2Txw2imuPW1mqUH8y6AYWZv/DqWL/fEp7kZWxTenLw6Zdjtx3zFgpsdy
	dT/VZw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41egmrryjj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Sep 2024 11:11:44 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 484BBgIb023782
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Sep 2024 11:11:42 GMT
Received: from [169.254.0.1] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Sep 2024
 04:11:36 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
Date: Wed, 4 Sep 2024 16:40:07 +0530
Subject: [PATCH 01/10] media: dt-bindings: media: camss: Add
 qcom,sc7280-camss binding
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240904-camss_on_sc7280_rb3gen2_vision_v2_patches-v1-1-b18ddcd7d9df@quicinc.com>
References: <20240904-camss_on_sc7280_rb3gen2_vision_v2_patches-v1-0-b18ddcd7d9df@quicinc.com>
In-Reply-To: <20240904-camss_on_sc7280_rb3gen2_vision_v2_patches-v1-0-b18ddcd7d9df@quicinc.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kapatrala Syed
	<akapatra@quicinc.com>,
        Hariram Purushothaman <hariramp@quicinc.com>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Vikram Sharma
	<quic_vikramsa@quicinc.com>,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725448289; l=13041;
 i=quic_vikramsa@quicinc.com; s=20240628; h=from:subject:message-id;
 bh=OMIotoo1f4MVFOEQwbAjTJ5XoFssgvmRY7kgHUT2m9g=;
 b=P/nQqEEQR+PhR2V7Cv0QA80VazJy/L0rUh1H9RqiIjyexunF9tC805UAPgnGWR5V/n/ABqNLt
 7k7eC7hhPU6DhXmAJ9AWuzyI49xLnf43LncQiaXn/jiG1FDpKxY3sxI
X-Developer-Key: i=quic_vikramsa@quicinc.com; a=ed25519;
 pk=vQBkwZr1Hv+VXogAyTAu7AEx8/6bvkOmgrzYFbNGCDI=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 5RG0IaMdYDDbUtkfiCHhoXhocaWjVjue
X-Proofpoint-GUID: 5RG0IaMdYDDbUtkfiCHhoXhocaWjVjue
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-04_09,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409040084

Add bindings for qcom,sc7280-camss to support the camera subsystem
on the SC7280 platform.

Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 .../bindings/media/qcom,sc7280-camss.yaml          | 441 +++++++++++++++++++++
 1 file changed, 441 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
new file mode 100644
index 000000000000..dee244e621c8
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
@@ -0,0 +1,441 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+
+---
+$id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SC7280 CAMSS ISP
+
+maintainers:
+  - Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>
+  - Hariram Purushothaman <hariramp@quicinc.com>
+
+description:
+  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
+
+properties:
+  compatible:
+    const: qcom,sc7280-camss
+
+  clocks:
+    maxItems: 33
+
+  clock-names:
+    items:
+      - const: camnoc_axi
+      - const: cpas_ahb
+      - const: csi0
+      - const: csi1
+      - const: csi2
+      - const: csi3
+      - const: csi4
+      - const: csiphy0
+      - const: csiphy0_timer
+      - const: csiphy1
+      - const: csiphy1_timer
+      - const: csiphy2
+      - const: csiphy2_timer
+      - const: csiphy3
+      - const: csiphy3_timer
+      - const: csiphy4
+      - const: csiphy4_timer
+      - const: gcc_camera_ahb
+      - const: gcc_camera_axi
+      - const: soc_ahb
+      - const: vfe0_axi
+      - const: vfe0
+      - const: vfe0_cphy_rx
+      - const: vfe1_axi
+      - const: vfe1
+      - const: vfe1_cphy_rx
+      - const: vfe2_axi
+      - const: vfe2
+      - const: vfe2_cphy_rx
+      - const: vfe0_lite
+      - const: vfe0_lite_cphy_rx
+      - const: vfe1_lite
+      - const: vfe1_lite_cphy_rx
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: ahb
+      - const: hf_0
+
+  interrupts:
+    maxItems: 15
+
+  interrupt-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: csiphy3
+      - const: csiphy4
+      - const: vfe0
+      - const: vfe1
+      - const: vfe2
+      - const: vfe_lite0
+      - const: vfe_lite1
+
+  iommus:
+    maxItems: 1
+
+  power-domains:
+    items:
+      - description: IFE0 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: IFE1 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: IFE2 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: Titan GDSC - Titan ISP Block, Global Distributed Switch Controller.
+
+  power-domains-names:
+    items:
+      - const: ife0
+      - const: ife1
+      - const: ife2
+      - const: top
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    description:
+      CSI input ports.
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port for receiving CSI data.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+            required:
+              - data-lanes
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port for receiving CSI data.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+            required:
+              - data-lanes
+
+      port@2:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port for receiving CSI data.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+            required:
+              - data-lanes
+
+      port@3:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port for receiving CSI data.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+            required:
+              - data-lanes
+
+      port@4:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port for receiving CSI data.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+            required:
+              - data-lanes
+
+      port@5:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port for receiving CSI data.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+            required:
+              - data-lanes
+
+  reg:
+    maxItems: 15
+
+  reg-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: csiphy3
+      - const: csiphy4
+      - const: vfe0
+      - const: vfe1
+      - const: vfe2
+      - const: vfe_lite0
+      - const: vfe_lite1
+
+  vdda-phy-supply:
+    description:
+      Phandle to a regulator supply to PHY core block.
+
+  vdda-pll-supply:
+    description:
+      Phandle to 1.8V regulator supply to PHY refclk pll block.
+
+required:
+  - clock-names
+  - clocks
+  - compatible
+  - interconnects
+  - interconnect-names
+  - interrupts
+  - interrupt-names
+  - iommus
+  - power-domains
+  - power-domains-names
+  - reg
+  - reg-names
+  - vdda-phy-supply
+  - vdda-pll-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,camcc-sc7280.h>
+    #include <dt-bindings/clock/qcom,gcc-sc7280.h>
+    #include <dt-bindings/interconnect/qcom,sc7280.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      camss: camss@acaf000 {
+        compatible = "qcom,sc7280-camss";
+
+        clocks = <&clock_camcc CAM_CC_CAMNOC_AXI_CLK>,
+          <&clock_camcc CAM_CC_CPAS_AHB_CLK>,
+          <&clock_camcc CAM_CC_IFE_0_CSID_CLK>,
+          <&clock_camcc CAM_CC_IFE_1_CSID_CLK>,
+          <&clock_camcc CAM_CC_IFE_2_CSID_CLK>,
+          <&clock_camcc CAM_CC_IFE_LITE_0_CSID_CLK>,
+          <&clock_camcc CAM_CC_IFE_LITE_1_CSID_CLK>,
+          <&clock_camcc CAM_CC_CSIPHY0_CLK>,
+          <&clock_camcc CAM_CC_CSI0PHYTIMER_CLK>,
+          <&clock_camcc CAM_CC_CSIPHY1_CLK>,
+          <&clock_camcc CAM_CC_CSI1PHYTIMER_CLK>,
+          <&clock_camcc CAM_CC_CSIPHY2_CLK>,
+          <&clock_camcc CAM_CC_CSI2PHYTIMER_CLK>,
+          <&clock_camcc CAM_CC_CSIPHY3_CLK>,
+          <&clock_camcc CAM_CC_CSI3PHYTIMER_CLK>,
+          <&clock_camcc CAM_CC_CSIPHY4_CLK>,
+          <&clock_camcc CAM_CC_CSI4PHYTIMER_CLK>,
+          <&gcc GCC_CAMERA_AHB_CLK>,
+          <&gcc GCC_CAMERA_HF_AXI_CLK>,
+          <&clock_camcc CAM_CC_CPAS_AHB_CLK>,
+          <&clock_camcc CAM_CC_IFE_0_AXI_CLK>,
+          <&clock_camcc CAM_CC_IFE_0_CLK>,
+          <&clock_camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
+          <&clock_camcc CAM_CC_IFE_1_AXI_CLK>,
+          <&clock_camcc CAM_CC_IFE_1_CLK>,
+          <&clock_camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
+          <&clock_camcc CAM_CC_IFE_2_AXI_CLK>,
+          <&clock_camcc CAM_CC_IFE_2_CLK>,
+          <&clock_camcc CAM_CC_IFE_2_CPHY_RX_CLK>,
+          <&clock_camcc CAM_CC_IFE_LITE_0_CLK>,
+          <&clock_camcc CAM_CC_IFE_LITE_0_CPHY_RX_CLK>,
+          <&clock_camcc CAM_CC_IFE_LITE_1_CLK>,
+          <&clock_camcc CAM_CC_IFE_LITE_1_CPHY_RX_CLK>;
+
+        clock-names = "camnoc_axi",
+          "cpas_ahb",
+          "csi0",
+          "csi1",
+          "csi2",
+          "csi3",
+          "csi4",
+          "csiphy0",
+          "csiphy0_timer",
+          "csiphy1",
+          "csiphy1_timer",
+          "csiphy2",
+          "csiphy2_timer",
+          "csiphy3",
+          "csiphy3_timer",
+          "csiphy4",
+          "csiphy4_timer",
+          "gcc_camera_ahb",
+          "gcc_camera_axi",
+          "soc_ahb",
+          "vfe0_axi",
+          "vfe0",
+          "vfe0_cphy_rx",
+          "vfe1_axi",
+          "vfe1",
+          "vfe1_cphy_rx",
+          "vfe2_axi",
+          "vfe2",
+          "vfe2_cphy_rx",
+          "vfe0_lite",
+          "vfe0_lite_cphy_rx",
+          "vfe1_lite",
+          "vfe1_lite_cphy_rx";
+
+        interconnects = <&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_CAMERA_CFG 0>,
+          <&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt SLAVE_EBI1 0>;
+        interconnect-names = "ahb", "hf_0";
+
+        interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+          <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+          <GIC_SPI 640 IRQ_TYPE_EDGE_RISING>,
+          <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+          <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
+          <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+          <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+          <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+          <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
+          <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
+          <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+          <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+          <GIC_SPI 641 IRQ_TYPE_EDGE_RISING>,
+          <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
+          <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>;
+
+        interrupt-names = "csid0",
+          "csid1",
+          "csid2",
+          "csid_lite0",
+          "csid_lite1",
+          "csiphy0",
+          "csiphy1",
+          "csiphy2",
+          "csiphy3",
+          "csiphy4",
+          "vfe0",
+          "vfe1",
+          "vfe2",
+          "vfe_lite0",
+          "vfe_lite1";
+
+        iommus = <&apps_smmu 0x800 0x4e0>;
+
+        power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
+          <&camcc CAM_CC_IFE_1_GDSC>,
+          <&camcc CAM_CC_IFE_2_GDSC>,
+          <&camcc CAM_CC_TITAN_TOP_GDSC>;
+        power-domains-names = "ife0", "ife1", "ife2", "top";
+
+        reg = <0x0 0x0acb3000 0x0 0x1000>,
+          <0x0 0x0acba000 0x0 0x1000>,
+          <0x0 0x0acc1000 0x0 0x1000>,
+          <0x0 0x0acc8000 0x0 0x1000>,
+          <0x0 0x0accf000 0x0 0x1000>,
+          <0x0 0x0ace0000 0x0 0x2000>,
+          <0x0 0x0ace2000 0x0 0x2000>,
+          <0x0 0x0ace4000 0x0 0x2000>,
+          <0x0 0x0ace6000 0x0 0x2000>,
+          <0x0 0x0ace8000 0x0 0x2000>,
+          <0x0 0x0acaf000 0x0 0x4000>,
+          <0x0 0x0acb6000 0x0 0x4000>,
+          <0x0 0x0acbd000 0x0 0x4000>,
+          <0x0 0x0acc4000 0x0 0x4000>,
+          <0x0 0x0accb000 0x0 0x4000>;
+
+        reg-names = "csid0",
+          "csid1",
+          "csid2",
+          "csid_lite0",
+          "csid_lite1",
+          "csiphy0",
+          "csiphy1",
+          "csiphy2",
+          "csiphy3",
+          "csiphy4",
+          "vfe0",
+          "vfe1",
+          "vfe2",
+          "vfe_lite0",
+          "vfe_lite1";
+
+        vdda-phy-supply = <&vreg_l10c_0p88>;
+        vdda-pll-supply = <&vreg_l6b_1p2>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+        };
+      };
+    };

-- 
2.25.1


