Return-Path: <linux-media+bounces-20574-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D3F9B6094
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 11:55:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C42BFB22AA2
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 10:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 203421E47BF;
	Wed, 30 Oct 2024 10:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JjCsRNGp"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDFD1E411D;
	Wed, 30 Oct 2024 10:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730285678; cv=none; b=L/ra5BwhVj7OTP92E1uCHUEh3nJTCXvjbZ3CPU+JNQVlt+tPVz8higQ8ofmDp+jjnDKnALWj3cpI3SuzKoeYCi3NPSefKqgIyyv9mLRS0s/EOA+elQaPYfIbuJJL2gW6fzDrRpKPQ+UJuC+F47nAyIYPYC/09PhadEP/dtBc4Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730285678; c=relaxed/simple;
	bh=j4OueEndsDKUkMZsjO71HyqJ1026t30K6W4/BNvFG5Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g8LiCawA/oIhkiL+Kg6FIOIbzMpYIwgPYuobIoBlLIOM1Arg9K8O7bfIeE738+VwZp64+q2F/rucrgq9PYEqUZFpSexjUmoU9UrLncf4kvuf7z8NOzXLpbU2fcfnrW0nihsFY1W7iX07h4K7XyuJTey/8XJx+zqArrBGinILVlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JjCsRNGp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49U8tcqh007307;
	Wed, 30 Oct 2024 10:54:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MchXVeHuU0Ne7MaSu7AdLTmewnC64SxRyuFlym4y/V8=; b=JjCsRNGpPNjWJw8V
	UYiBK1L0KO9UC0+aouiq46/rsq/12rY0l44JPb3CNf/djHULK9/oq+1VdZvi/ACe
	CuNoXfQmJymEg+R6zok4HS+XW4jOL/U6GfF9C3nMWI7M7+2dLixvom1vFl3VNpGa
	ocPBHrB1HtY1NgYan5+HoE2kUCPbvYw9rPSnwD3GjVMaaRnH20eCzcggZkkTih1E
	RSj5fQiQ6MpsK0EF3VoDRv8rG5Us12XVEqRXFcL4z7xxqyo/U2QxWBjhGO+dTBUB
	ZMFiiaR59zxkSppmEPCVfXfMTV6M6LbBHWfRNhIueZ2aKZgbdwK8Ov/NhzOMecLU
	l+SDOA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42khqbrbe0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 10:54:25 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49UAsOLg015501
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 10:54:24 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 30 Oct 2024 03:54:15 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <akapatra@quicinc.com>, <hariramp@quicinc.com>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <hverkuil-cisco@xs4all.nl>, <cros-qcom-dts-watchers@chromium.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_vikramsa@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: [PATCH v4 1/6] media: dt-bindings: media: camss: Add qcom,sc7280-camss binding
Date: Wed, 30 Oct 2024 16:23:42 +0530
Message-ID: <20241030105347.2117034-2-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241030105347.2117034-1-quic_vikramsa@quicinc.com>
References: <20241030105347.2117034-1-quic_vikramsa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: OwSYsdA-APBbW-edUZU3grUmqa10VMqg
X-Proofpoint-ORIG-GUID: OwSYsdA-APBbW-edUZU3grUmqa10VMqg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 spamscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410300084

Add bindings for qcom,sc7280-camss to support the camera subsystem
on the SC7280 platform.

Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 .../bindings/media/qcom,sc7280-camss.yaml     | 439 ++++++++++++++++++
 1 file changed, 439 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
new file mode 100644
index 000000000000..783a5366e32b
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
@@ -0,0 +1,439 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
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
+    maxItems: 32
+
+  clock-names:
+    items:
+      - const: camnoc_axi
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
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        camss: camss@acaf000 {
+            compatible = "qcom,sc7280-camss";
+
+            clocks = <&clock_camcc CAM_CC_CAMNOC_AXI_CLK>,
+                     <&clock_camcc CAM_CC_IFE_0_CSID_CLK>,
+                     <&clock_camcc CAM_CC_IFE_1_CSID_CLK>,
+                     <&clock_camcc CAM_CC_IFE_2_CSID_CLK>,
+                     <&clock_camcc CAM_CC_IFE_LITE_0_CSID_CLK>,
+                     <&clock_camcc CAM_CC_IFE_LITE_1_CSID_CLK>,
+                     <&clock_camcc CAM_CC_CSIPHY0_CLK>,
+                     <&clock_camcc CAM_CC_CSI0PHYTIMER_CLK>,
+                     <&clock_camcc CAM_CC_CSIPHY1_CLK>,
+                     <&clock_camcc CAM_CC_CSI1PHYTIMER_CLK>,
+                     <&clock_camcc CAM_CC_CSIPHY2_CLK>,
+                     <&clock_camcc CAM_CC_CSI2PHYTIMER_CLK>,
+                     <&clock_camcc CAM_CC_CSIPHY3_CLK>,
+                     <&clock_camcc CAM_CC_CSI3PHYTIMER_CLK>,
+                     <&clock_camcc CAM_CC_CSIPHY4_CLK>,
+                     <&clock_camcc CAM_CC_CSI4PHYTIMER_CLK>,
+                     <&gcc GCC_CAMERA_AHB_CLK>,
+                     <&gcc GCC_CAMERA_HF_AXI_CLK>,
+                     <&clock_camcc CAM_CC_CPAS_AHB_CLK>,
+                     <&clock_camcc CAM_CC_IFE_0_AXI_CLK>,
+                     <&clock_camcc CAM_CC_IFE_0_CLK>,
+                     <&clock_camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
+                     <&clock_camcc CAM_CC_IFE_1_AXI_CLK>,
+                     <&clock_camcc CAM_CC_IFE_1_CLK>,
+                     <&clock_camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
+                     <&clock_camcc CAM_CC_IFE_2_AXI_CLK>,
+                     <&clock_camcc CAM_CC_IFE_2_CLK>,
+                     <&clock_camcc CAM_CC_IFE_2_CPHY_RX_CLK>,
+                     <&clock_camcc CAM_CC_IFE_LITE_0_CLK>,
+                     <&clock_camcc CAM_CC_IFE_LITE_0_CPHY_RX_CLK>,
+                     <&clock_camcc CAM_CC_IFE_LITE_1_CLK>,
+                     <&clock_camcc CAM_CC_IFE_LITE_1_CPHY_RX_CLK>;
+
+            clock-names = "camnoc_axi",
+                          "csi0",
+                          "csi1",
+                          "csi2",
+                          "csi3",
+                          "csi4",
+                          "csiphy0",
+                          "csiphy0_timer",
+                          "csiphy1",
+                          "csiphy1_timer",
+                          "csiphy2",
+                          "csiphy2_timer",
+                          "csiphy3",
+                          "csiphy3_timer",
+                          "csiphy4",
+                          "csiphy4_timer",
+                          "gcc_camera_ahb",
+                          "gcc_camera_axi",
+                          "soc_ahb",
+                          "vfe0_axi",
+                          "vfe0",
+                          "vfe0_cphy_rx",
+                          "vfe1_axi",
+                          "vfe1",
+                          "vfe1_cphy_rx",
+                          "vfe2_axi",
+                          "vfe2",
+                          "vfe2_cphy_rx",
+                          "vfe0_lite",
+                          "vfe0_lite_cphy_rx",
+                          "vfe1_lite",
+                          "vfe1_lite_cphy_rx";
+
+            interconnects = <&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_CAMERA_CFG 0>,
+                            <&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt SLAVE_EBI1 0>;
+
+            interconnect-names = "ahb", "hf_0";
+
+            interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 640 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 641 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>;
+
+            interrupt-names = "csid0",
+                              "csid1",
+                              "csid2",
+                              "csid_lite0",
+                              "csid_lite1",
+                              "csiphy0",
+                              "csiphy1",
+                              "csiphy2",
+                              "csiphy3",
+                              "csiphy4",
+                              "vfe0",
+                              "vfe1",
+                              "vfe2",
+                              "vfe_lite0",
+                              "vfe_lite1";
+
+            iommus = <&apps_smmu 0x800 0x4e0>;
+
+            power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
+                            <&camcc CAM_CC_IFE_1_GDSC>,
+                            <&camcc CAM_CC_IFE_2_GDSC>,
+                            <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+            power-domains-names = "ife0", "ife1", "ife2", "top";
+
+            reg = <0x0 0x0acb3000 0x0 0x1000>,
+                  <0x0 0x0acba000 0x0 0x1000>,
+                  <0x0 0x0acc1000 0x0 0x1000>,
+                  <0x0 0x0acc8000 0x0 0x1000>,
+                  <0x0 0x0accf000 0x0 0x1000>,
+                  <0x0 0x0ace0000 0x0 0x2000>,
+                  <0x0 0x0ace2000 0x0 0x2000>,
+                  <0x0 0x0ace4000 0x0 0x2000>,
+                  <0x0 0x0ace6000 0x0 0x2000>,
+                  <0x0 0x0ace8000 0x0 0x2000>,
+                  <0x0 0x0acaf000 0x0 0x4000>,
+                  <0x0 0x0acb6000 0x0 0x4000>,
+                  <0x0 0x0acbd000 0x0 0x4000>,
+                  <0x0 0x0acc4000 0x0 0x4000>,
+                  <0x0 0x0accb000 0x0 0x4000>;
+
+            reg-names = "csid0",
+                        "csid1",
+                        "csid2",
+                        "csid_lite0",
+                        "csid_lite1",
+                        "csiphy0",
+                        "csiphy1",
+                        "csiphy2",
+                        "csiphy3",
+                        "csiphy4",
+                        "vfe0",
+                        "vfe1",
+                        "vfe2",
+                        "vfe_lite0",
+                        "vfe_lite1";
+
+            vdda-phy-supply = <&vreg_l10c_0p88>;
+            vdda-pll-supply = <&vreg_l6b_1p2>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+            };
+        };
+    };
-- 
2.25.1


