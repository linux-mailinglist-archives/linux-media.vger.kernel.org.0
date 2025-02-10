Return-Path: <linux-media+bounces-25931-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F904A2F244
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 16:57:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B3A0318819D5
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 15:57:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E60FF244E89;
	Mon, 10 Feb 2025 15:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="U5pAHY81"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFEDC244E8A;
	Mon, 10 Feb 2025 15:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739203006; cv=none; b=bIJqWNEXy5uB+u9uAG/s9F9C8JnRgIEdrpaOhRnjd8jHoychIsjhFffoPsDfyMJwhUEjMybN68nbmczU960Ch4ueuS1bkPnoww0FcARM3SMy+z2JGMS+0hgrPoWveiZcesKvcxNDBg4QYlrO1oKbEfrrskPv43snwH3yb1Nw7qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739203006; c=relaxed/simple;
	bh=Zrs6HKve8QEZ2wrNPyKoq2lZlJdryvP75UfBhdfduGo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EjuVpTAvwW+hpScQupH1nO32Bm6ovf/cmkEJxH/6qjA8qbtgDJ5BcOXK3K5QYtMEeXKUexAmCSXC0TOL434hcz29wRafbK7gl6Z/WpKByYuu1ZES+RqESmlG38jFdBrpm3QuHJux0pW0/XODc7RdMYUA8pO9Cxc6lncaA1l++8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=U5pAHY81; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AFBxae010299;
	Mon, 10 Feb 2025 15:56:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZVJvinD0QL5g9SspPGmS4+uBdkVCqOTFq0Qn0uvgTUg=; b=U5pAHY819BsySQyg
	knXiALaWJwsAZ7E+ru/HLcUE8ykJNoegbt1merYvRS2ZhX7ZSR79Nx9Jgkl1lr4r
	luW2AB1qq66Utw9rZ9+fxbZ29ZW1wFneGZ/Kqp+naOZS5HOPqxDC+dYgaD4WROrS
	G1pkwIlAVpZoDSs4btS3mJVCZ/kf/a1oZ38jSZNzwp5zkyQB7UB4EVRWVDHDPWK9
	2/z5ZmYJ4Dm2T9eU2ubfOM7v5NaSOkI+YJ8I16oucbE4pKE9sa84sBgI+kzX0kl0
	PEmZFpWUUgrr8CpxenmiKNdj6uvJg+qtcbh1MiXm5+iW+jLuQC7sc1B79RNE3u7Q
	6dfttA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qcs59e8s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 15:56:32 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51AFuVIB025657
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 15:56:31 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 10 Feb 2025 07:56:25 -0800
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_vikramsa@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 1/2] media: dt-bindings: Add qcom,sa8775p-camss
Date: Mon, 10 Feb 2025 21:26:04 +0530
Message-ID: <20250210155605.575367-2-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250210155605.575367-1-quic_vikramsa@quicinc.com>
References: <20250210155605.575367-1-quic_vikramsa@quicinc.com>
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
X-Proofpoint-ORIG-GUID: pVI2PiM32VPK4feJx0p4c5blXYJ1MTEu
X-Proofpoint-GUID: pVI2PiM32VPK4feJx0p4c5blXYJ1MTEu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_08,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 mlxlogscore=999 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 adultscore=0 clxscore=1015 mlxscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502100131

Add bindings for qcom,sa8775p-camss to support the camera subsystem
on SA8775P platform.

Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 .../bindings/media/qcom,sa8775p-camss.yaml    | 351 ++++++++++++++++++
 1 file changed, 351 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
new file mode 100644
index 000000000000..083e1193c474
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
@@ -0,0 +1,351 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,sa8775p-camss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SA8775P CAMSS ISP
+
+maintainers:
+  - Vikram Sharma <quic_vikramsa@quicinc.com>
+
+description:
+  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
+
+properties:
+  compatible:
+    const: qcom,sa8775p-camss
+
+  reg:
+    maxItems: 22
+
+  reg-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: csid_lite2
+      - const: csid_lite3
+      - const: csid_lite4
+      - const: csid_wrapper
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: csiphy3
+      - const: tpg0
+      - const: tpg1
+      - const: tpg2
+      - const: vfe0
+      - const: vfe1
+      - const: vfe_lite0
+      - const: vfe_lite1
+      - const: vfe_lite2
+      - const: vfe_lite3
+      - const: vfe_lite4
+
+  clocks:
+    maxItems: 28
+
+  clock-names:
+    items:
+      - const: camnoc_axi
+      - const: core_ahb
+      - const: cpas_ahb
+      - const: cpas_fast_ahb_clk
+      - const: cpas_ife_lite
+      - const: cpas_vfe0
+      - const: cpas_vfe1
+      - const: csid
+      - const: csiphy0
+      - const: csiphy0_timer
+      - const: csiphy1
+      - const: csiphy1_timer
+      - const: csiphy2
+      - const: csiphy2_timer
+      - const: csiphy3
+      - const: csiphy3_timer
+      - const: csiphy_rx
+      - const: gcc_axi_hf
+      - const: gcc_axi_sf
+      - const: icp_ahb
+      - const: vfe0
+      - const: vfe0_fast_ahb
+      - const: vfe1
+      - const: vfe1_fast_ahb
+      - const: vfe_lite
+      - const: vfe_lite_ahb
+      - const: vfe_lite_cphy_rx
+      - const: vfe_lite_csid
+
+  interrupts:
+    maxItems: 21
+
+  interrupt-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid-lite0
+      - const: csid-lite1
+      - const: csid-lite2
+      - const: csid-lite3
+      - const: csid-lite4
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: csiphy3
+      - const: tpg0
+      - const: tpg1
+      - const: tpg2
+      - const: vfe0
+      - const: vfe1
+      - const: vfe-lite0
+      - const: vfe-lite1
+      - const: vfe-lite2
+      - const: vfe-lite3
+      - const: vfe-lite4
+
+  interconnects:
+    maxItems: 3
+
+  interconnect-names:
+    items:
+      - const: ahb
+      - const: hf_0
+      - const: sf_0
+
+  iommus:
+    maxItems: 1
+
+  power-domains:
+    items:
+      - description: Titan GDSC - Titan ISP Block, Global Distributed Switch Controller.
+
+  power-domain-names:
+    items:
+      - const: top
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    description:
+      CSI input ports.
+
+    patternProperties:
+      "^port@[0-3]+$":
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port for receiving CSI data on CSIPHY 0-3.
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
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - interconnects
+  - interconnect-names
+  - iommus
+  - power-domains
+  - power-domain-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,sa8775p-camcc.h>
+    #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
+    #include <dt-bindings/interconnect/qcom,sa8775p-rpmh.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        isp@ac7a000 {
+            compatible = "qcom,sa8775p-camss";
+
+            reg = <0x0 0xac7a000 0x0 0x0f01>,
+                  <0x0 0xac7c000 0x0 0x0f01>,
+                  <0x0 0xac84000 0x0 0x0f01>,
+                  <0x0 0xac88000 0x0 0x0f01>,
+                  <0x0 0xac8c000 0x0 0x0f01>,
+                  <0x0 0xac90000 0x0 0x0f01>,
+                  <0x0 0xac94000 0x0 0x0f01>,
+                  <0x0 0xac78000 0x0 0x1000>,
+                  <0x0 0xac9c000 0x0 0x2000>,
+                  <0x0 0xac9e000 0x0 0x2000>,
+                  <0x0 0xaca0000 0x0 0x2000>,
+                  <0x0 0xaca2000 0x0 0x2000>,
+                  <0x0 0xacac000 0x0 0x0400>,
+                  <0x0 0xacad000 0x0 0x0400>,
+                  <0x0 0xacae000 0x0 0x0400>,
+                  <0x0 0xac4d000 0x0 0xd000>,
+                  <0x0 0xac5a000 0x0 0xd000>,
+                  <0x0 0xac85000 0x0 0x0d00>,
+                  <0x0 0xac89000 0x0 0x0d00>,
+                  <0x0 0xac8d000 0x0 0x0d00>,
+                  <0x0 0xac91000 0x0 0x0d00>,
+                  <0x0 0xac95000 0x0 0x0d00>;
+            reg-names = "csid0",
+                        "csid1",
+                        "csid_lite0",
+                        "csid_lite1",
+                        "csid_lite2",
+                        "csid_lite3",
+                        "csid_lite4",
+                        "csid_wrapper",
+                        "csiphy0",
+                        "csiphy1",
+                        "csiphy2",
+                        "csiphy3",
+                        "tpg0",
+                        "tpg1",
+                        "tpg2",
+                        "vfe0",
+                        "vfe1",
+                        "vfe_lite0",
+                        "vfe_lite1",
+                        "vfe_lite2",
+                        "vfe_lite3",
+                        "vfe_lite4";
+
+            clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+                     <&camcc CAM_CC_CORE_AHB_CLK>,
+                     <&camcc CAM_CC_CPAS_AHB_CLK>,
+                     <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
+                     <&camcc CAM_CC_CPAS_IFE_0_CLK>,
+                     <&camcc CAM_CC_CPAS_IFE_1_CLK>,
+                     <&camcc CAM_CC_CSID_CLK>,
+                     <&camcc CAM_CC_CSIPHY0_CLK>,
+                     <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+                     <&camcc CAM_CC_CSIPHY1_CLK>,
+                     <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+                     <&camcc CAM_CC_CSIPHY2_CLK>,
+                     <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+                     <&camcc CAM_CC_CSIPHY3_CLK>,
+                     <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
+                     <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
+                     <&gcc   GCC_CAMERA_HF_AXI_CLK>,
+                     <&gcc   GCC_CAMERA_SF_AXI_CLK>,
+                     <&camcc CAM_CC_ICP_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_0_CLK>,
+                     <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_1_CLK>,
+                     <&camcc CAM_CC_IFE_1_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
+            clock-names = "camnoc_axi",
+                          "core_ahb",
+                          "cpas_ahb",
+                          "cpas_fast_ahb_clk",
+                          "cpas_ife_lite",
+                          "cpas_vfe0",
+                          "cpas_vfe1",
+                          "csid",
+                          "csiphy0",
+                          "csiphy0_timer",
+                          "csiphy1",
+                          "csiphy1_timer",
+                          "csiphy2",
+                          "csiphy2_timer",
+                          "csiphy3",
+                          "csiphy3_timer",
+                          "csiphy_rx",
+                          "gcc_axi_hf",
+                          "gcc_axi_sf",
+                          "icp_ahb",
+                          "vfe0",
+                          "vfe0_fast_ahb",
+                          "vfe1",
+                          "vfe1_fast_ahb",
+                          "vfe_lite",
+                          "vfe_lite_ahb",
+                          "vfe_lite_cphy_rx",
+                          "vfe_lite_csid";
+
+            interrupts = <GIC_SPI 565 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 564 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 759 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 758 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 604 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 545 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 546 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 547 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 761 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 760 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 605 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "csid0",
+                              "csid1",
+                              "csid-lite0",
+                              "csid-lite1",
+                              "csid-lite2",
+                              "csid-lite3",
+                              "csid-lite4",
+                              "csiphy0",
+                              "csiphy1",
+                              "csiphy2",
+                              "csiphy3",
+                              "tpg0",
+                              "tpg1",
+                              "tpg2",
+                              "vfe0",
+                              "vfe1",
+                              "vfe-lite0",
+                              "vfe-lite1",
+                              "vfe-lite2",
+                              "vfe-lite3",
+                              "vfe-lite4";
+
+            interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+                             &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+                            <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+                            <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ACTIVE_ONLY
+                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>;
+            interconnect-names = "ahb",
+                                 "hf_0",
+                                 "sf_0";
+
+            iommus = <&apps_smmu 0x3400 0x20>;
+
+            power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+            power-domain-names = "top";
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+            };
+        };
+    };
-- 
2.25.1


