Return-Path: <linux-media+bounces-14789-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EB892BF63
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 18:14:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 928B4B284E1
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 16:13:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98AD61A4F2D;
	Tue,  9 Jul 2024 16:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="i2+ovGrO"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375741A3BB9;
	Tue,  9 Jul 2024 16:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720541285; cv=none; b=uJ5Pro5X6jrFteKS+DeedAoOcXDBZ350xQxEcTbWoQ9l1f7ZIbLjrnGUcGZZfgmJQPNuF4mSKyAhOc6wNmi0R9u6ztafx5cFQopwcMHTwqpVBixAAtlOMacd4P2hg1vDkvbuYZ/LnTP4ZhBLjzdimide6JyBYg7HuzvFAHUil4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720541285; c=relaxed/simple;
	bh=xVW8/qvnuPdIVCOpQSuenkAMlxtnRDwmb4a7EKLiTrc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mqk0PVcGC2MyxBSh94SDHnF3qh9Y4qZ9HrOVANTCJUc/wOJ45hXHC6uZR0eBntqlRKxZB4VTM9u5ylpIsVeFlngq4Q8QzKCugqMtmRfQei5MsECG+BZwG3VAilGo9KgiMRq5JOaoR0OZlP4IULdZASAFqkMJRD5O5GiXErXlRgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=i2+ovGrO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 469DAKnT021766;
	Tue, 9 Jul 2024 16:07:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=k9Ze9ydIvjqBydy8fZDyB0uR
	UlHyGNy4/68RlumKHLQ=; b=i2+ovGrOs1372JXmNHcFAG4j78BGPgc3gq3DtE5W
	/alwq3/YiXayMx+i/eKM4LF03Hre4eTuXNGuzR0FHWCNcEeW2pF62TgwlVjPlxOV
	O6WqA7o4dLAdtAMp8lW/+rv9WrZw9wXtap/d6yE4gpZ6CMxGzRZdJdtmOiRqYcSb
	L9XgUKnHX9VzA2deM3vdP4U3oAnJqSnkGBuDYnID6tJSjU/jKHmSsZaa0pg+Oy08
	HBmqSX2LroPWPdvTtaSeJr8TFfd3b0HpdPYyTvdWsQKI6cqRTmJv6bhdwUnEI9R+
	rRZNF/DwBCtE4itmZ22FS0IlY3oy7D6R/RcXpDJMxT/EAw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406we8xufw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 16:07:43 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 469G7gU8032103
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 16:07:42 GMT
Received: from hu-depengs-sha.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 9 Jul 2024 09:07:36 -0700
From: Depeng Shao <quic_depengs@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <quic_eberman@quicinc.com>, <quic_depengs@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>, Yongsheng Li <quic_yon@quicinc.com>
Subject: [PATCH 07/13] dt-bindings: media: camss: Add qcom,sm8550-camss binding
Date: Tue, 9 Jul 2024 21:36:50 +0530
Message-ID: <20240709160656.31146-8-quic_depengs@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240709160656.31146-1-quic_depengs@quicinc.com>
References: <20240709160656.31146-1-quic_depengs@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: YTS4JiofOcD_6hb9vDM9UmqLWP6hRBwE
X-Proofpoint-GUID: YTS4JiofOcD_6hb9vDM9UmqLWP6hRBwE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_05,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 mlxlogscore=999 malwarescore=0 mlxscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2407090106

Add bindings for qcom,sm8550-camss in order to support the camera
subsystem for sm8550

Co-developed-by: Yongsheng Li <quic_yon@quicinc.com>
Signed-off-by: Yongsheng Li <quic_yon@quicinc.com>
Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
---
 .../bindings/media/qcom,sm8550-camss.yaml     | 545 ++++++++++++++++++
 1 file changed, 545 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml
new file mode 100644
index 000000000000..d002b0ff119e
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml
@@ -0,0 +1,545 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,sm8550-camss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SM8550 Camera Subsystem (CAMSS)
+
+maintainers:
+  - Depeng Shao <quic_depengs@quicinc.com>
+
+description: |
+  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
+
+properties:
+  compatible:
+    const: qcom,sm8550-camss
+
+  clocks:
+    minItems: 47
+    maxItems: 47
+
+  clock-names:
+    items:
+      - const: cam_ahb_clk
+      - const: cam_hf_axi
+      - const: cam_sf_axi
+      - const: camnoc_axi
+      - const: camnoc_axi_src
+      - const: core_ahb
+      - const: cpas_ahb
+      - const: slow_ahb_src
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
+      - const: csiphy5
+      - const: csiphy5_timer
+      - const: csiphy6
+      - const: csiphy6_timer
+      - const: csiphy7
+      - const: csiphy7_timer
+      - const: csid_src
+      - const: csid
+      - const: csiphy_rx
+      - const: vfe0_fast_ahb
+      - const: vfe0_src
+      - const: vfe0
+      - const: cpas_vfe0
+      - const: vfe1_fast_ahb
+      - const: vfe1_src
+      - const: vfe1
+      - const: cpas_vfe2
+      - const: vfe2_fast_ahb
+      - const: vfe2_src
+      - const: vfe2
+      - const: cpas_vfe1
+      - const: vfe_lite_ahb
+      - const: vfe_lite_csid_src
+      - const: vfe_lite
+      - const: vfe_lite_cphy_rx
+      - const: vfe_lite_csid
+      - const: cpas_ife_lite
+      - const: cpas_fast_ahb_clk
+      - const: fast_ahb_src
+
+  interrupts:
+    minItems: 18
+    maxItems: 18
+
+  interrupt-names:
+    items:
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: csiphy3
+      - const: csiphy4
+      - const: csiphy5
+      - const: csiphy6
+      - const: csiphy7
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: vfe0
+      - const: vfe1
+      - const: vfe2
+      - const: vfe_lite0
+      - const: vfe_lite1
+
+  iommus:
+    maxItems: 1
+
+  interconnects:
+    minItems: 4
+    maxItems: 4
+
+  interconnect-names:
+    items:
+      - const: cam_ahb
+      - const: cam_hf_0_mnoc
+      - const: cam_sf_0_mnoc
+      - const: cam_sf_icp_mnoc
+
+  power-domains:
+    items:
+      - description: IFE0 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: IFE1 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: IFE2 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: Titan GDSC - Titan ISP Block, Global Distributed Switch Controller.
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
+              clock-lanes:
+                maxItems: 1
+
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+            required:
+              - clock-lanes
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
+              clock-lanes:
+                maxItems: 1
+
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+            required:
+              - clock-lanes
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
+              clock-lanes:
+                maxItems: 1
+
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+            required:
+              - clock-lanes
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
+              clock-lanes:
+                maxItems: 1
+
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+            required:
+              - clock-lanes
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
+              clock-lanes:
+                maxItems: 1
+
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+            required:
+              - clock-lanes
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
+              clock-lanes:
+                maxItems: 1
+
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+            required:
+              - clock-lanes
+              - data-lanes
+
+  reg:
+    minItems: 19
+    maxItems: 19
+
+  reg-names:
+    items:
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: csiphy3
+      - const: csiphy4
+      - const: csiphy5
+      - const: csiphy6
+      - const: csiphy7
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: csid_top
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
+      Phandle to 1.2V regulator supply to PHY refclk pll block.
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
+  - reg
+  - reg-names
+  - vdda-phy-supply
+  - vdda-pll-supply
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,sm8550-camcc.h>
+    #include <dt-bindings/clock/qcom,sm8550-gcc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/interconnect/qcom,sm8550-rpmh.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        camss: camss@ace4000 {
+            compatible = "qcom,sm8550-camss";
+
+            reg = <0 0x0ace4000 0 0x2000>,
+                  <0 0x0ace6000 0 0x2000>,
+                  <0 0x0ace8000 0 0x2000>,
+                  <0 0x0acea000 0 0x2000>,
+                  <0 0x0acec000 0 0x2000>,
+                  <0 0x0acee000 0 0x2000>,
+                  <0 0x0acf0000 0 0x2000>,
+                  <0 0x0acf2000 0 0x2000>,
+                  <0 0x0acb7000 0 0xd00>,
+                  <0 0x0acb9000 0 0xd00>,
+                  <0 0x0acbb000 0 0xd00>,
+                  <0 0x0acca000 0 0xa00>,
+                  <0 0x0acce000 0 0xa00>,
+                  <0 0x0acb6000 0 0x1000>,
+                  <0 0x0ac62000 0 0xf000>,
+                  <0 0x0ac71000 0 0xf000>,
+                  <0 0x0ac80000 0 0xf000>,
+                  <0 0x0acca000 0 0x2800>,
+                  <0 0x0acce000 0 0x2800>;
+            reg-names = "csiphy0",
+                    "csiphy1",
+                    "csiphy2",
+                    "csiphy3",
+                    "csiphy4",
+                    "csiphy5",
+                    "csiphy6",
+                    "csiphy7",
+                    "csid0",
+                    "csid1",
+                    "csid2",
+                    "csid_lite0",
+                    "csid_lite1",
+                    "csid_top",
+                    "vfe0",
+                    "vfe1",
+                    "vfe2",
+                    "vfe_lite0",
+                    "vfe_lite1";
+
+            vdda-phy-supply = <&vreg_l1e_0p88>;
+            vdda-pll-supply = <&vreg_l3e_1p2>;
+
+            interrupts = <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 278 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 277 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 431 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 376 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 688 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 377 IRQ_TYPE_LEVEL_HIGH>;
+
+            interrupt-names = "csiphy0",
+                    "csiphy1",
+                    "csiphy2",
+                    "csiphy3",
+                    "csiphy4",
+                    "csiphy5",
+                    "csiphy6",
+                    "csiphy7",
+                    "csid0",
+                    "csid1",
+                    "csid2",
+                    "csid_lite0",
+                    "csid_lite1",
+                    "vfe0",
+                    "vfe1",
+                    "vfe2",
+                    "vfe_lite0",
+                    "vfe_lite1";
+
+            power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
+                    <&camcc CAM_CC_IFE_1_GDSC>,
+                    <&camcc CAM_CC_IFE_2_GDSC>,
+                    <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+            clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+                 <&gcc GCC_CAMERA_HF_AXI_CLK>,
+                 <&gcc GCC_CAMERA_SF_AXI_CLK>,
+                 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+                 <&camcc CAM_CC_CAMNOC_AXI_CLK_SRC>,
+                 <&camcc CAM_CC_CORE_AHB_CLK>,
+                 <&camcc CAM_CC_CPAS_AHB_CLK>,
+                 <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
+                 <&camcc CAM_CC_CSIPHY0_CLK>,
+                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+                 <&camcc CAM_CC_CSIPHY1_CLK>,
+                 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+                 <&camcc CAM_CC_CSIPHY2_CLK>,
+                 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+                 <&camcc CAM_CC_CSIPHY3_CLK>,
+                 <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
+                 <&camcc CAM_CC_CSIPHY4_CLK>,
+                 <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
+                 <&camcc CAM_CC_CSIPHY5_CLK>,
+                 <&camcc CAM_CC_CSI5PHYTIMER_CLK>,
+                 <&camcc CAM_CC_CSIPHY6_CLK>,
+                 <&camcc CAM_CC_CSI6PHYTIMER_CLK>,
+                 <&camcc CAM_CC_CSIPHY7_CLK>,
+                 <&camcc CAM_CC_CSI7PHYTIMER_CLK>,
+                 <&camcc CAM_CC_CSID_CLK_SRC>,
+                 <&camcc CAM_CC_CSID_CLK>,
+                 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
+                 <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
+                 <&camcc CAM_CC_IFE_0_CLK_SRC>,
+                 <&camcc CAM_CC_IFE_0_CLK>,
+                 <&camcc CAM_CC_CPAS_IFE_0_CLK>,
+                 <&camcc CAM_CC_IFE_1_FAST_AHB_CLK>,
+                 <&camcc CAM_CC_IFE_1_CLK_SRC>,
+                 <&camcc CAM_CC_IFE_1_CLK>,
+                 <&camcc CAM_CC_CPAS_IFE_1_CLK>,
+                 <&camcc CAM_CC_IFE_2_FAST_AHB_CLK>,
+                 <&camcc CAM_CC_IFE_2_CLK_SRC>,
+                 <&camcc CAM_CC_IFE_2_CLK>,
+                 <&camcc CAM_CC_CPAS_IFE_2_CLK>,
+                 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+                 <&camcc CAM_CC_IFE_LITE_CSID_CLK_SRC>,
+                 <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
+                 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+                 <&camcc CAM_CC_IFE_LITE_CLK>,
+                 <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
+                 <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
+                 <&camcc CAM_CC_FAST_AHB_CLK_SRC>;
+
+            clock-names = "cam_ahb_clk",
+                      "cam_hf_axi",
+                      "cam_sf_axi",
+                      "camnoc_axi",
+                      "camnoc_axi_src",
+                      "core_ahb",
+                      "cpas_ahb",
+                      "slow_ahb_src",
+                      "csiphy0",
+                      "csiphy0_timer",
+                      "csiphy1",
+                      "csiphy1_timer",
+                      "csiphy2",
+                      "csiphy2_timer",
+                      "csiphy3",
+                      "csiphy3_timer",
+                      "csiphy4",
+                      "csiphy4_timer",
+                      "csiphy5",
+                      "csiphy5_timer",
+                      "csiphy6",
+                      "csiphy6_timer",
+                      "csiphy7",
+                      "csiphy7_timer",
+                      "csid_src",
+                      "csid",
+                      "csiphy_rx",
+                      "vfe0_fast_ahb",
+                      "vfe0_src",
+                      "vfe0",
+                      "cpas_vfe0",
+                      "vfe1_fast_ahb",
+                      "vfe1_src",
+                      "vfe1",
+                      "cpas_vfe1",
+                      "vfe2_fast_ahb",
+                      "vfe2_src",
+                      "vfe2",
+                      "cpas_vfe2",
+                      "vfe_lite_ahb",
+                      "vfe_lite_csid_src",
+                      "vfe_lite_csid",
+                      "vfe_lite_cphy_rx",
+                      "vfe_lite",
+                      "cpas_ife_lite",
+                      "cpas_fast_ahb_clk",
+                      "fast_ahb_src";
+
+            iommus = <&apps_smmu 0x800 0x20>;
+
+            interconnects =
+                    <&gem_noc         MASTER_APPSS_PROC          0 &config_noc SLAVE_CAMERA_CFG  0>,
+                    <&mmss_noc        MASTER_CAMNOC_HF           0 &mc_virt SLAVE_EBI1           0>,
+                    <&mmss_noc        MASTER_CAMNOC_SF           0 &mc_virt SLAVE_EBI1           0>,
+                    <&mmss_noc        MASTER_CAMNOC_ICP          0 &mc_virt SLAVE_EBI1           0>;
+            interconnect-names =
+                    "cam_ahb",
+                    "cam_hf_0_mnoc",
+                    "cam_sf_0_mnoc",
+                    "cam_sf_icp_mnoc";
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    csiphy_ep0: endpoint@0 {
+                        reg = <0>;
+                        clock-lanes = <7>;
+                        data-lanes = <0 1>;
+                        remote-endpoint = <&sensor_ep>;
+                    };
+                };
+            };
+        };
+    };
-- 
2.34.1


