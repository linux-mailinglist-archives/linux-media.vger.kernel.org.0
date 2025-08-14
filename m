Return-Path: <linux-media+bounces-39903-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CC766B262BB
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 12:29:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8D008B600F6
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 10:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D14B306D2A;
	Thu, 14 Aug 2025 10:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lgp+Q3ni"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D007F309DAE;
	Thu, 14 Aug 2025 10:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755166640; cv=none; b=HFrFWjtT2ADwJCEaYe7Xx5asCOo+OmyC2dmcadZpteZ6WOdoqgcGej6nrgoWbKIxeoXmvX+I57PHVKHFecsXTa6SC6kkfCSCaxJMFOiycOzTm8k6RrBpGyK3QR2KEJ8d3+4eFUOZgZrPePoUq1POJb9wP/otTyYvk/3HjzcK+GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755166640; c=relaxed/simple;
	bh=vbEWIneJY58sY3cRYGyLDJk6BUlFjGMc+SB2XKtE3/w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JwTgCrsv2kHl24VxaeJm+SCHS/INo/SPbCnh/o0qsK6SrHH1DYJBEZ11kpbeUyV1Sqhsi0Hs4uDulzJZOFXigmFFfRKLqi429lIjNxM52Q2tCGeSmzJSNe1ep3O1fVcdXCCLL9xkJnLdc+HADQJhH9NvLcBdc4LDWh3w/sEMKrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lgp+Q3ni; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57E8e0Eu002797;
	Thu, 14 Aug 2025 10:17:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G/OmVvVUT2hzJ+faHvnNca1zeB19LA+7zrosRAfGcf0=; b=lgp+Q3ni0pRNbV3i
	Jd4ByrfomptGGMkITgiwyJT9giyZMX2C8Cn3Q9WtzR4YqszOH+gYjM5fXelkJMRf
	SHR7RzRjN45Cw7a50OaZvbNrJbZ7169sBZW2YUL3rvzt02qGHrJKnP/0xreo072W
	3osM7nxBPouJAVgHL0TsenlXyIkadiWANKNYu1O7xUKjllBMgcF98jjnUnZ16qkR
	b1yP5oDoixQhkmJSo1daFO4CYoNmZQQvz8kX98L//qKKLVM4Cu2GDzh2DHiat4/T
	HbJnsDBjdrAu+aRZ5ccFH2GI2mFXMFj5zeKzImpcJk/qTjb8afWukUgudRw7OGGM
	AB8tdQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxdv7acf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 10:17:08 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57EAH7Q1029256
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 10:17:07 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 14 Aug 2025 03:17:01 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_svankada@quicinc.com>,
        <quic_vikramsa@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Wenmeng Liu <quic_wenmliu@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 3/9] media: dt-bindings: Add qcom,sa8775p-camss compatible
Date: Thu, 14 Aug 2025 15:46:09 +0530
Message-ID: <20250814101615.1102795-4-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250814101615.1102795-1-quic_vikramsa@quicinc.com>
References: <20250814101615.1102795-1-quic_vikramsa@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=689db7a4 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=RQ1WPPV2gZYAH0lKadAA:9 a=sptkURWiP4Gy88Gu7hUp:22
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: x0SpAGbxnLFPYx3Lg4ZOAGFQSgiACUD8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfX9zl4TbF2ek84
 WHJNkheZ7NGahdn+mcr/BwP6AJiTLuYcIV342bnL6oH9PW/+cHUzdqPsMPKEnqDpTLdPiSbyMbc
 gh67rmZs9pct7SHHiCskduKYRNixZWrtCWwRqhwKY6Wp1JkKL0O2abtzxxonvKT0S6eszT83P3O
 sgNgMz9rItHDuLozZY+9ZbBKcYlvblieqRbY6qx2ptBQi+ZTVZqa2/2Efz1UuakHkNBVmRMnbGj
 CiwnlS/6d7F9AZshrjbAnDTcg38wrrmdVqmOsT20mnM+Zu4I6OqkYUW4eGpUk0Uw+B5Gq3IXk1k
 ctJ8h1hjOMkR4uBZLutxQYnGdruIfaClB2eQpxzM9O8kt9EcKa6DtHEJkpqDed0JNPidBZTzSj1
 dM3iTMru
X-Proofpoint-GUID: x0SpAGbxnLFPYx3Lg4ZOAGFQSgiACUD8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025

Add the compatible string "qcom,sa8775p-camss" to support the
Camera Subsystem (CAMSS) on the Qualcomm lemans platform.

The Lemans(SA8775P) platform provides:
- 2 x VFE (version 690), each with 3 RDI
- 5 x VFE Lite (version 690), each with 6 RDI
- 2 x CSID (version 690)
- 5 x CSID Lite (version 690)
- 4 x CSIPHY (version 690)
- 3 x TPG

Lemans is the first Qualcomm SoC to introduce a CSIPHY-based
Test Pattern Generator (TPG).

Co-developed-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/media/qcom,sa8775p-camss.yaml    | 361 ++++++++++++++++++
 1 file changed, 361 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
new file mode 100644
index 000000000000..019caa2b09c3
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
@@ -0,0 +1,361 @@
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
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: csid_lite2
+      - const: csid_lite3
+      - const: csid_lite4
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
+  - vdda-phy-supply
+  - vdda-pll-supply
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
+            compatible = "qcom,sa8775p-camss";
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
+                              "csid_lite0",
+                              "csid_lite1",
+                              "csid_lite2",
+                              "csid_lite3",
+                              "csid_lite4",
+                              "csiphy0",
+                              "csiphy1",
+                              "csiphy2",
+                              "csiphy3",
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
+            iommus = <&apps_smmu 0x3400 0x20>;
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


