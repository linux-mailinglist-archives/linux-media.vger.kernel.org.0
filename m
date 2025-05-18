Return-Path: <linux-media+bounces-32701-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5D0ABAE31
	for <lists+linux-media@lfdr.de>; Sun, 18 May 2025 08:34:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 337FE3B99F6
	for <lists+linux-media@lfdr.de>; Sun, 18 May 2025 06:33:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84B6320297C;
	Sun, 18 May 2025 06:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DeEgrjS9"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDF91FF7B3;
	Sun, 18 May 2025 06:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747550017; cv=none; b=bIjiWwMF4PEpY0WHEX4bkQy0Q+GDWY4US0qK3CipbUPQwRc97Qhnu1YzIANM8Rn2uClKzTvEGZtqOktxxHVgIbpbiuUaF4EP3lO3MHzva1KGyKf+x3/B7W7x1cAcmK87v8QSkBtnTcfF6my4vsfBtANnsuvoVB/MLG5pNhwNiCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747550017; c=relaxed/simple;
	bh=wv0gpcgBDRpuvF2hLK16yN3Zmnt8fhI44tRhgFVgf/0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=AL44sVkP+r/I0SU6hwOnMEU4NLCqTV0biQX6cvz48aovHbQGsZk8KLYn1hyFICjrYivmE95+DGeJSahB/DHgUf5Jntx+17gvIZvJWggiNvCNVXskvdJPOl34mW4i/5+UcY/7wi8I14aUCKqx3KWxS1qr2SJd/A6a4aC+Fk3sZd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DeEgrjS9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I2hO3S000690;
	Sun, 18 May 2025 06:33:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wriNABwcJqfvMATzLMLwMdbkaoY4r8Fj4JklmexCu6Y=; b=DeEgrjS9Q/lEKzYX
	8PKCPYtm9cHK+LVuQk3CJCibAfZO7O6AnUgTFNFFN9fstHWvo0gnM/sLaSvLsDmy
	gP/wuZBLYYeIo7zQFap8YDN1ibVvxWOLDBbfg/r6mDzMalaiLaPOAVc1iuGn/71V
	6exmBEFdVCi3R85oFSAL2V/kNKlyFcFhLYiB9JvxagRqEaXK6Wng2cc6h2HRE4vz
	etkRWFFqUZbj+JiXz2NX8AdCnBLS3QgX5YM5Wf4HCxLln3TiWGquZXPKZpkljOVw
	4hLA29mOVzFs29DNH1Izg5yeINz/FvZTfFQGOJtkBJJ44ezH/4i7fHVE3lPHsTF8
	s3+Ctw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjnyhm7t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 06:33:30 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54I6XT50007870
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 06:33:29 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sat, 17 May 2025 23:33:25 -0700
From: Wenmeng Liu <quic_wenmliu@quicinc.com>
Date: Sun, 18 May 2025 14:33:07 +0800
Subject: [PATCH 1/3] dt-bindings: media: Add qcom,qcs615-camss binding
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250518-qcs615_camss-v1-1-12723e26ea3e@quicinc.com>
References: <20250518-qcs615_camss-v1-0-12723e26ea3e@quicinc.com>
In-Reply-To: <20250518-qcs615_camss-v1-0-12723e26ea3e@quicinc.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wenmeng Liu
	<quic_wenmliu@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747550002; l=11568;
 i=quic_wenmliu@quicinc.com; s=20250211; h=from:subject:message-id;
 bh=wv0gpcgBDRpuvF2hLK16yN3Zmnt8fhI44tRhgFVgf/0=;
 b=ydRDg2WWKa7j6WeW8KqvIgrVXLa+IL0LLmK7q/i4RqBFJ0TQpE7xk9Jj3jF40KKZLzXiPl/cD
 a8SQAnYI8tCBHemrs368UW7hka4GMxDN5NQPMm0tbd3YFgTidjvxRKx
X-Developer-Key: i=quic_wenmliu@quicinc.com; a=ed25519;
 pk=PTegr3w0f1C9dOSL6CUdJR5+u+X/4vsW7VMfwIMeMXQ=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDA1OCBTYWx0ZWRfXx7rG0hpGL18n
 eJiE9ZpejAzngpRWbpjY79ShunLJk5Ymb7fLcuXP4ZnWAZyJkWM6TSHkLVKjHxBCn3b9bs8lKut
 b4giPNXMWLpgZAK2nWFffwxNusN/mwJmRE+7z0r1+jScwQK+lH0jrrLBeKgX6XTwRhspiK1sqOB
 kd23T6nh/ht3Yymy1B9DxyL2DjHrtpAXn54ylxZJDpBuK1DvES6Svw1O/QHuQQxPdBmMD4iA+Ee
 AaVu5iyeVmvmZu/aD6l9NoeM45V17otT80rtMn8sjGaqS3LCfFVP1+qmIvnTL5eALBK38arMTYA
 RSeRMNKG9lkWolm6d9T0UiijS5QfG266etkTDuI7kLHS6CYfB7lpeXORuh+85MIQqZ9ih/CfvqF
 ygDwwOdSn412LTv973+r2PEkuDBHuVbtFnqLEBizaQ2QdYetjOjj5nwS/k5uV784uw4p4/Xa
X-Authority-Analysis: v=2.4 cv=Z9XsHGRA c=1 sm=1 tr=0 ts=68297f3a cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=gEfo2CItAAAA:8
 a=COk6AnOGAAAA:8 a=CXfGsmi0X-KHezRtte0A:9 a=QEXdDO2ut3YA:10
 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: FyV9suz1nDk5EkjHDtd52Gyt1Rsn7KCs
X-Proofpoint-ORIG-GUID: FyV9suz1nDk5EkjHDtd52Gyt1Rsn7KCs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_03,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180058

Add bindings for qcom,qcs615-camss in order to support the camera
subsystem for qcs615.

Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
---
 .../bindings/media/qcom,qcs615-camss.yaml          | 356 +++++++++++++++++++++
 1 file changed, 356 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcs615-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcs615-camss.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..9a87243f88d4b739cc29033509878ae706d3017f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,qcs615-camss.yaml
@@ -0,0 +1,356 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,qcs615-camss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QCS615 Camera Subsystem (CAMSS)
+
+maintainers:
+  - Wenmeng Liu <quic_wenmliu@quicinc.com>
+
+description:
+  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
+
+properties:
+  compatible:
+    const: qcom,qcs615-camss
+
+  clocks:
+    minItems: 26
+    maxItems: 26
+
+  clock-names:
+    items:
+      - const: camnoc_axi
+      - const: cpas_ahb
+      - const: cphy_rx_src
+      - const: csiphy0
+      - const: csiphy0_timer
+      - const: csiphy1
+      - const: csiphy1_timer
+      - const: csiphy2
+      - const: csiphy2_timer
+      - const: gcc_axi_hf
+      - const: slow_ahb_src
+      - const: soc_ahb
+      - const: vfe0
+      - const: vfe0_axi
+      - const: vfe0_cphy_rx
+      - const: vfe0_csid
+      - const: vfe0_src
+      - const: vfe1
+      - const: vfe1_axi
+      - const: vfe1_cphy_rx
+      - const: vfe1_csid
+      - const: vfe1_src
+      - const: vfe_lite
+      - const: vfe_lite_cphy_rx
+      - const: vfe_lite_csid
+      - const: vfe_lite_src
+
+  interrupts:
+    minItems: 9
+    maxItems: 9
+
+  interrupt-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid_lite
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: vfe0
+      - const: vfe1
+      - const: vfe_lite
+
+  iommus:
+    minItems: 3
+    maxItems: 3
+
+  interconnects:
+    minItems: 2
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: ahb
+      - const: hf_0_mnoc
+
+  power-domains:
+    items:
+      - description: IFE0 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: IFE1 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: Titan GDSC - Titan ISP Block, Global Distributed Switch Controller.
+
+  power-domain-names:
+    items:
+      - const: ife0
+      - const: ife1
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
+              clock-lanes:
+                maxItems: 1
+
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+              bus-type:
+                enum:
+                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
+                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
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
+              bus-type:
+                enum:
+                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
+                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
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
+              bus-type:
+                enum:
+                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
+                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
+
+            required:
+              - clock-lanes
+              - data-lanes
+
+  reg:
+    minItems: 9
+    maxItems: 9
+
+  reg-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid_lite
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: vfe0
+      - const: vfe1
+      - const: vfe_lite
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
+  - reg
+  - reg-names
+  - vdda-phy-supply
+  - vdda-pll-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/clock/qcom,qcs615-camcc.h>
+    #include <dt-bindings/clock/qcom,qcs615-gcc.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,qcs615-rpmh.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        camss: camss@acb3000 {
+            compatible = "qcom,qcs615-camss";
+
+            reg = <0x0 0x0acb3000 0x0 0x1000>,
+                  <0x0 0x0acba000 0x0 0x1000>,
+                  <0x0 0x0acc8000 0x0 0x1000>,
+                  <0x0 0x0ac65000 0x0 0x1000>,
+                  <0x0 0x0ac66000 0x0 0x1000>,
+                  <0x0 0x0ac67000 0x0 0x1000>,
+                  <0x0 0x0acaf000 0x0 0x4000>,
+                  <0x0 0x0acb6000 0x0 0x4000>,
+                  <0x0 0x0acc4000 0x0 0x4000>;
+            reg-names = "csid0",
+                        "csid1",
+                        "csid_lite",
+                        "csiphy0",
+                        "csiphy1",
+                        "csiphy2",
+                        "vfe0",
+                        "vfe1",
+                        "vfe_lite";
+
+            clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+                     <&camcc CAM_CC_CPAS_AHB_CLK>,
+                     <&camcc CAM_CC_CPHY_RX_CLK_SRC>,
+                     <&camcc CAM_CC_CSIPHY0_CLK>,
+                     <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+                     <&camcc CAM_CC_CSIPHY1_CLK>,
+                     <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+                     <&camcc CAM_CC_CSIPHY2_CLK>,
+                     <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+                     <&gcc GCC_CAMERA_HF_AXI_CLK>,
+                     <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
+                     <&camcc CAM_CC_SOC_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_0_CLK>,
+                     <&camcc CAM_CC_IFE_0_AXI_CLK>,
+                     <&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
+                     <&camcc CAM_CC_IFE_0_CSID_CLK>,
+                     <&camcc CAM_CC_IFE_0_CLK_SRC>,
+                     <&camcc CAM_CC_IFE_1_CLK>,
+                     <&camcc CAM_CC_IFE_1_AXI_CLK>,
+                     <&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
+                     <&camcc CAM_CC_IFE_1_CSID_CLK>,
+                     <&camcc CAM_CC_IFE_1_CLK_SRC>,
+                     <&camcc CAM_CC_IFE_LITE_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CLK_SRC>;
+
+            clock-names = "camnoc_axi",
+                          "cpas_ahb",
+                          "cphy_rx_src",
+                          "csiphy0",
+                          "csiphy0_timer",
+                          "csiphy1",
+                          "csiphy1_timer",
+                          "csiphy2",
+                          "csiphy2_timer",
+                          "gcc_axi_hf",
+                          "slow_ahb_src",
+                          "soc_ahb",
+                          "vfe0",
+                          "vfe0_axi",
+                          "vfe0_cphy_rx",
+                          "vfe0_csid",
+                          "vfe0_src",
+                          "vfe1",
+                          "vfe1_axi",
+                          "vfe1_cphy_rx",
+                          "vfe1_csid",
+                          "vfe1_src",
+                          "vfe_lite",
+                          "vfe_lite_cphy_rx",
+                          "vfe_lite_csid",
+                          "vfe_lite_src";
+
+
+            interconnects = <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_CAMERA_CFG 0>,
+                            <&mmss_noc MASTER_CAMNOC_HF0 0 &mc_virt SLAVE_EBI1 0>;
+            interconnect-names = "ahb",
+                                 "hf_0_mnoc";
+
+            interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "csid0",
+                              "csid1",
+                              "csid_lite",
+                              "csiphy0",
+                              "csiphy1",
+                              "csiphy2",
+                              "vfe0",
+                              "vfe1",
+                              "vfe_lite";
+
+            iommus = <&apps_smmu 0x820 0x40>,
+                     <&apps_smmu 0x840 0x0>,
+                     <&apps_smmu 0x860 0x40>;
+
+            power-domains = <&camcc IFE_0_GDSC>,
+                            <&camcc IFE_1_GDSC>,
+                            <&camcc TITAN_TOP_GDSC>;
+
+            vdda-phy-supply = <&vreg_l5a_0p88>;
+            vdda-pll-supply = <&vreg_l12a_1p2>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+            };
+        };
+    };

-- 
2.34.1


