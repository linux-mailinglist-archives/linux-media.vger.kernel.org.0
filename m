Return-Path: <linux-media+bounces-42182-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 998A7B51471
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 12:50:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6879A188EE15
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 10:50:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 335AF313E3A;
	Wed, 10 Sep 2025 10:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ql2XeXS1"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3C7238D42;
	Wed, 10 Sep 2025 10:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757501388; cv=none; b=aJvfax78WjDv7x8VniVLrH36sIDSKoEgKfFN2MaN+ZQO6qJWZGeoBiewIT26BGQGBGZFs4f6Vj0y//mXl1+cQ8gOm0m08xjRcIIfXU6emab2bFwQEgaC6euq5hsf3iqNnuJcM4vaZzusTXtLtm+PH8uT8PpjiqZ5hsh5/SuT6fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757501388; c=relaxed/simple;
	bh=sSxrv7Dn2tDtqWvxydzFll7/k985/suspEMKvbhg1fI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NEGQy2uZSIev6USAy4BgtRZAz21KNq2FKkZyrn5OgoTToCbPzoDT/3owff2emymGNrq+uJRXYYUqaftPmOwVK6iwg72n/ENUQRYy4dZlyCFCK7kpYZFT7fh53R/JO9QQcKXxIyvNTmtqueL2SX9IJcosJ2Rs2qxpsvpGULHctrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ql2XeXS1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58AAF7ZB031900;
	Wed, 10 Sep 2025 10:49:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G+gij34Jk9OTFbW0qdKYfgsvS2YoGViffHJ4H9QBVo8=; b=Ql2XeXS1GfV+yB7/
	dYHdYEmqTjhocei7xGkq3ikSroo25f8UbaVf8HGvFw2EDll0sFnY2ZUa1kwLJaEc
	qiEsBuL3QEQp2b2glIfypuX/e7eJJsgI8FvmOYeh64oUetzXUAKqLIHw4kp2k7Cl
	WQiFB45i0AOBJWrYAxwEDFB9E8LeOSnBc1wgZoJTMv5nYWeV704pzOXBXqMq9zNG
	C5wKe+Acrmb7Zmo2BK7xzPUf/OydvGag+bm3+H/0eCP9QT7sNdS+aNHARKWOQC7M
	6/tQFWzu2fYu2mmzkAHrTZu95Lah1r/ctW7lGHDGPIuJlW2AcTX4Nz/aG8H/u1h9
	hCQNuw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490by93k6p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Sep 2025 10:49:36 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58AAnYek019421
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Sep 2025 10:49:34 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Wed, 10 Sep 2025 03:49:29 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <bryan.odonoghue@linaro.org>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_svankada@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_vikramsa@quicinc.com>,
        Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
Subject: [PATCH v3.1] media: dt-bindings: Add qcom,qcs8300-camss compatible
Date: Wed, 10 Sep 2025 16:19:15 +0530
Message-ID: <20250910104915.1444669-1-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250813053724.232494-2-quic_vikramsa@quicinc.com>
References: <20250813053724.232494-2-quic_vikramsa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Yv8PR5YX c=1 sm=1 tr=0 ts=68c157c0 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=gEfo2CItAAAA:8 a=2cgThBgHkgOnM4IxGdMA:9 a=TjNXssC_j7lpFel5tvFf:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: kpE9MAzYeiEk-pHVGDsNkubYtuHWsEBe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX5XO7nga038xy
 2cQx2O1kjg4XrzOGT5ZSj8RP5BMAM/nQ6Aq/1sWrT97lWO0olvk2NtKKVhHwucJ3t+RTzmAMqE4
 uxV3x8SNCUX2W/E4JTnT+AGYVmYvVG0Xum8zZ2ROZrWjVSUivGNbVnZNMxCaQZAQLIwarb15qNA
 c3+OCuesVFgpgXzNyomvjJOIgbgv4aVCETpgGS97qLkK/QGmtKpS3IfsZQ0gXHAkbO1NJ1mpYq3
 EDewth/C3aRH+Ml4Rd9KoxZXbT0QVgefky/Rp2/H/zvr4DJt00EwscXiDP4v/W7DcTdFGpH3HMj
 2FCV/97p9SK/uc82aLjaXhFxjH/X4LAWLsxnonHLqTsS6ylbbC9P0j13gweojan5H+VwEZkZCzB
 csnYjGKq
X-Proofpoint-ORIG-GUID: kpE9MAzYeiEk-pHVGDsNkubYtuHWsEBe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_03,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018

Add the compatible string "qcom,qcs8300-camss" to support the
Camera Subsystem (CAMSS) on the Qualcomm QCS8300 platform.

The QCS8300 platform provides:
- 2 x VFE (version 690), each with 3 RDI
- 5 x VFE Lite (version 690), each with 6 RDI
- 2 x CSID (version 690)
- 5 x CSID Lite (version 690)
- 3 x CSIPHY (version 690)
- 3 x TPG

Co-developed-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
changes since v3:
- Adding supplies to enable camera sensor imx577 on monaco-evk.
  link for camera sensor enablement chagges:
  https://lore.kernel.org/all/20250909114241.840842-1-quic_vikramsa@quicinc.com/
- Dropped RB from Bryan and Krzysztof to review again. 
--- 
 .../bindings/media/qcom,qcs8300-camss.yaml    | 349 ++++++++++++++++++
 1 file changed, 349 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
new file mode 100644
index 000000000000..559db6d67f06
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
@@ -0,0 +1,349 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,qcs8300-camss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QCS8300 CAMSS ISP
+
+maintainers:
+  - Vikram Sharma <quic_vikramsa@quicinc.com>
+
+description:
+  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
+
+properties:
+  compatible:
+    const: qcom,qcs8300-camss
+
+  reg:
+    maxItems: 21
+
+  reg-names:
+    items:
+      - const: csid_wrapper
+      - const: csid0
+      - const: csid1
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: csid_lite2
+      - const: csid_lite3
+      - const: csid_lite4
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
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
+    maxItems: 26
+
+  clock-names:
+    items:
+      - const: camnoc_axi
+      - const: core_ahb
+      - const: cpas_ahb
+      - const: cpas_fast_ahb_clk
+      - const: cpas_vfe_lite
+      - const: cpas_vfe0
+      - const: cpas_vfe1
+      - const: csid
+      - const: csiphy0
+      - const: csiphy0_timer
+      - const: csiphy1
+      - const: csiphy1_timer
+      - const: csiphy2
+      - const: csiphy2_timer
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
+    maxItems: 20
+
+  interrupt-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: csid_lite2
+      - const: csid_lite3
+      - const: csid_lite4
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
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
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: ahb
+      - const: hf_0
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
+  vdda-phy-supply:
+    description:
+      Phandle to a regulator supply to PHY core block.
+
+  vdda-pll-supply:
+    description:
+      Phandle to 1.8V regulator supply to PHY refclk pll block.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    description:
+      CSI input ports.
+
+    patternProperties:
+      "^port@[0-2]+$":
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port for receiving CSI data on CSIPHY 0-2.
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
+  - vdda-phy-supply
+  - vdda-pll-supply
+  - power-domain-names
+  - ports
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
+        isp@ac78000 {
+            compatible = "qcom,qcs8300-camss";
+
+            reg = <0x0 0xac78000 0x0 0x1000>,
+                  <0x0 0xac7a000 0x0 0x0f00>,
+                  <0x0 0xac7c000 0x0 0x0f00>,
+                  <0x0 0xac84000 0x0 0x0f00>,
+                  <0x0 0xac88000 0x0 0x0f00>,
+                  <0x0 0xac8c000 0x0 0x0f00>,
+                  <0x0 0xac90000 0x0 0x0f00>,
+                  <0x0 0xac94000 0x0 0x0f00>,
+                  <0x0 0xac9c000 0x0 0x2000>,
+                  <0x0 0xac9e000 0x0 0x2000>,
+                  <0x0 0xaca0000 0x0 0x2000>,
+                  <0x0 0xacac000 0x0 0x0400>,
+                  <0x0 0xacad000 0x0 0x0400>,
+                  <0x0 0xacae000 0x0 0x0400>,
+                  <0x0 0xac4d000 0x0 0xd000>,
+                  <0x0 0xac60000 0x0 0xd000>,
+                  <0x0 0xac85000 0x0 0x0d00>,
+                  <0x0 0xac89000 0x0 0x0d00>,
+                  <0x0 0xac8d000 0x0 0x0d00>,
+                  <0x0 0xac91000 0x0 0x0d00>,
+                  <0x0 0xac95000 0x0 0x0d00>;
+            reg-names = "csid_wrapper",
+                        "csid0",
+                        "csid1",
+                        "csid_lite0",
+                        "csid_lite1",
+                        "csid_lite2",
+                        "csid_lite3",
+                        "csid_lite4",
+                        "csiphy0",
+                        "csiphy1",
+                        "csiphy2",
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
+                     <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
+                     <&gcc GCC_CAMERA_HF_AXI_CLK>,
+                     <&gcc GCC_CAMERA_SF_AXI_CLK>,
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
+                          "cpas_vfe_lite",
+                          "cpas_vfe0",
+                          "cpas_vfe1",
+                          "csid",
+                          "csiphy0",
+                          "csiphy0_timer",
+                          "csiphy1",
+                          "csiphy1_timer",
+                          "csiphy2",
+                          "csiphy2_timer",
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
+                              "csid_lite0",
+                              "csid_lite1",
+                              "csid_lite2",
+                              "csid_lite3",
+                              "csid_lite4",
+                              "csiphy0",
+                              "csiphy1",
+                              "csiphy2",
+                              "tpg0",
+                              "tpg1",
+                              "tpg2",
+                              "vfe0",
+                              "vfe1",
+                              "vfe_lite0",
+                              "vfe_lite1",
+                              "vfe_lite2",
+                              "vfe_lite3",
+                              "vfe_lite4";
+
+            interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+                             &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+                            <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+            interconnect-names = "ahb",
+                                 "hf_0";
+
+            iommus = <&apps_smmu 0x2400 0x20>;
+
+            power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+            power-domain-names = "top";
+
+            vdda-phy-supply = <&vreg_l4a_0p88>;
+            vdda-pll-supply = <&vreg_l1c_1p2>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+            };
+        };
+    };
-- 
2.25.1


