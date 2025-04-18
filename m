Return-Path: <linux-media+bounces-30551-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE467A93865
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 16:12:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E7DC8A6023
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 14:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2B9518A93C;
	Fri, 18 Apr 2025 14:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CSsUAksa"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792C5165F13
	for <linux-media@vger.kernel.org>; Fri, 18 Apr 2025 14:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744985529; cv=none; b=dfleI5stXOJDjoIIEQuJaGyYhR0RWn3z+WoVPCg+KT/UcNOY++n/WK+hVhRKBukn5mvAgqaAjDFE3XVsK4lw4HkqMJ+lAsPirsZHzI1AUBECWX+tZy238Yat1hzw37hMCoX8FQiNe0m9U8qEP+pEAE5HyEwhwyKPWN9Y6Y4L/Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744985529; c=relaxed/simple;
	bh=RU6F16UzUltqBZThb1ZaQaj8sKEF5oUODiHbmE6L394=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nqZWIEbBoWeOTqU3gDViqXN1OF6UHpL2nTEwSvtV8560tDMuexT5Z8dV6KdEShd1121KVQDqn6e81E/yfS2K00hDpS7/ohf2StjbmOvheXdMhBmWhPclg15T6Zy7lhOv3/hE7A0kGlKGiab7R1zeD1vadhwUierKNivqzLLJlqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CSsUAksa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I29adY015622
	for <linux-media@vger.kernel.org>; Fri, 18 Apr 2025 14:12:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=auiZ1TdX+vA
	WT8qcUzAplyGZZLdhSByER51XQxabkFU=; b=CSsUAksarEkakFY4zqoLs+6DpcM
	1GhAWiSD6qvmCb0361giwEl2FseQgI089/iGj3fwq9Daw4i32GKa7W8A596YnH2K
	yVXi27YOSj2AQ+mlKH+tMKAcnu4hPkxAw6HiOCj0HxCF3Li711Jf8J3e2j+fcdXA
	JaOwYmi+1NEjCuVfxgWzViBQVxtrFl2lKigZpRyd9IpBLBfORXAwp9AswBJNEkte
	Ih8W2C1cK6Q3q+7DLTAuq9y/vllPDYkKFuvg4VT5p00dU59Pu0yGpR6Tyxmy8W2U
	RdNqejUBPDmnSwOXZ00QJ+BGNjdnVsOIZybzZHo9U7ifT4Oy3RcHI7EtCZQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydhqjb8d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 18 Apr 2025 14:12:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5d608e703so316308785a.3
        for <linux-media@vger.kernel.org>; Fri, 18 Apr 2025 07:12:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744985525; x=1745590325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=auiZ1TdX+vAWT8qcUzAplyGZZLdhSByER51XQxabkFU=;
        b=JtU9DQB+xf73uoftFNsaXRFTcw/lARi8Uq33TI5vPnEohoZ42kkrUDRZxpuJhExPa3
         hDZXcM88EkKAt+Mey3buwvYetK9I5nKRRvCzySVBHOw++7WGJNKw+uzgSc36ULd0W5Y5
         nftPzXvz191xv2guueezwoJ3nQ/jpQX4dY8vDg/dhYDishpuhhS/cAruzY2YXzf1XtZr
         YNXULLeP0Kh3I6fid1QIWJ3ECI85x3kgedS1yocsoY4o8UGd6juomYPTV9IEYG7Eni4n
         4pUwyYCGUOJ2X3g4sHv/S6ExVYWYLBniT5DagRLLXeNU2TNxeBveL6uNwHR76UNSDoQ6
         ac1A==
X-Forwarded-Encrypted: i=1; AJvYcCXC0iT55wY2Uv70UL1gfDx/G5JUay6eby7T60mBxcOrxjZXWcJc7MyVf3+YwZIu0EPGzE1kkHFxZQrOfA==@vger.kernel.org
X-Gm-Message-State: AOJu0YznqrSMznVqIToWQdKqATiw6bAe+RyRduJuKZOGmKCAASfdU4NR
	Tp2RANnIruJ6nZLA+9nOMsnCXSxRa9UfAKopdqX0STtye9znoHb8Yph4+7iZ30LAv2SEOTIMpUB
	zPRQnk/Fr+ZuE6LrmfIRTjf2sBef1mqNvtc/uYHzk2HnAorl/fY2054pOrf+cuw==
X-Gm-Gg: ASbGncuWYWagJ7MYkb9jShPFQ+fuwYQhjTncoOQToJ7xCpDxZUsVdufFJJU6q+WsQjQ
	sDWrOgtZIW2/bjImgZeGuv+XogZ0mWyAhIDRwtmBLQQ1zhLS8qRV2OiCNwEfhuMr6Q4YF8w4TWA
	F2J2NQqRZEmHft4M5BkmcO7S0cZQgEMEYKDNIkvzAJJydFeMM8eOzXF2sbwbuypqIZ7JR4sQug1
	ym42RZkGiIPluI/QASZhR8lI9QPvoH33K5jpkqxTw1dfFapJb9H3xPmGrPZ80QzN4XGPxgD7BVB
	ZENwHsSXrzvy4DhXhYLE+vsRTLmYdkA6a+qKhq1oH49pAgk=
X-Received: by 2002:a05:620a:4444:b0:7c5:4eee:5409 with SMTP id af79cd13be357-7c92804d1b1mr432716685a.48.1744985525345;
        Fri, 18 Apr 2025 07:12:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmHK4539lotKEkp6aw4gcaJOY+X4dT+OcYeGMcfUwZF62FpD4y6QIG6qGr75Ze4bVXYhxAJw==
X-Received: by 2002:a05:620a:4444:b0:7c5:4eee:5409 with SMTP id af79cd13be357-7c92804d1b1mr432711985a.48.1744985524870;
        Fri, 18 Apr 2025 07:12:04 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:2dd5:219d:5008:1bec])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4404352a5f0sm81172835e9.1.2025.04.18.07.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 07:12:04 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, rfoss@kernel.org, konradybcio@kernel.org,
        andersson@kernel.org, krzk+dt@kernel.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v3 5/6] media: dt-bindings: media: camss: Add qcom,qcm2290-camss binding
Date: Fri, 18 Apr 2025 16:11:46 +0200
Message-Id: <20250418141147.205179-6-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250418141147.205179-1-loic.poulain@oss.qualcomm.com>
References: <20250418141147.205179-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: H8Pnl1Gw4zRshH9fB2DhbLVF_Wx9Kur3
X-Authority-Analysis: v=2.4 cv=C7DpyRP+ c=1 sm=1 tr=0 ts=68025db6 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10 a=QcRrIoSkKhIA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=JlZtY4oE0OGdv2NQSfYA:9 a=PEH46H7Ffwr30OY-TuGO:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: H8Pnl1Gw4zRshH9fB2DhbLVF_Wx9Kur3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_05,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180105

Add bindings for qcom,qcm2290-camss in order to support the camera
subsystem found in the Qualcomm Robotics RB1 Platform (QRB2210).

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../bindings/media/qcom,qcm2290-camss.yaml    | 243 ++++++++++++++++++
 1 file changed, 243 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
new file mode 100644
index 000000000000..fa870872f80b
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
@@ -0,0 +1,243 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,qcm2290-camss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QCM2290 Camera Subsystem (CAMSS)
+
+maintainers:
+  - Loic Poulain <loic.poulain@oss.qualcomm.com>
+
+description:
+  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
+
+properties:
+  compatible:
+    const: qcom,qcm2290-camss
+
+  reg:
+    maxItems: 9
+
+  reg-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csiphy0
+      - const: csiphy1
+      - const: csitpg0
+      - const: csitpg1
+      - const: top
+      - const: vfe0
+      - const: vfe1
+
+  clocks:
+    maxItems: 15
+
+  clock-names:
+    items:
+      - const: ahb
+      - const: axi
+      - const: camnoc_nrt_axi
+      - const: camnoc_rt_axi
+      - const: csi0
+      - const: csi1
+      - const: csiphy0
+      - const: csiphy0_timer
+      - const: csiphy1
+      - const: csiphy1_timer
+      - const: top_ahb
+      - const: vfe0
+      - const: vfe0_cphy_rx
+      - const: vfe1
+      - const: vfe1_cphy_rx
+
+  interrupts:
+    maxItems: 8
+
+  interrupt-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csiphy0
+      - const: csiphy1
+      - const: csitpg0
+      - const: csitpg1
+      - const: vfe0
+      - const: vfe1
+
+  interconnects:
+    maxItems: 3
+
+  interconnect-names:
+    items:
+      - const: ahb
+      - const: hf_mnoc
+      - const: sf_mnoc
+
+  iommus:
+    maxItems: 4
+
+  power-domains:
+    items:
+      - description: GDSC CAMSS Block, Global Distributed Switch Controller.
+
+  vdda-csiphy-1p2-supply:
+    description:
+      Phandle to a 1.2V regulator supply to CSI PHYs.
+
+  vdda-pll-1p8-supply:
+    description:
+      Phandle to 1.8V regulator supply to CAMSS refclk pll block.
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
+
+        description:
+          Input port for receiving CSI data from a CSIPHY.
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
+  - vdda-csiphy-1p2-supply
+  - vdda-pll-1p8-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
+    #include <dt-bindings/interconnect/qcom,rpm-icc.h>
+    #include <dt-bindings/interconnect/qcom,qcm2290.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        camss: camss@5c6e000 {
+            compatible = "qcom,qcm2290-camss";
+
+            reg = <0x0 0x5c6e000 0x0 0x1000>,
+                  <0x0 0x5c75000 0x0 0x1000>,
+                  <0x0 0x5c52000 0x0 0x1000>,
+                  <0x0 0x5c53000 0x0 0x1000>,
+                  <0x0 0x5c66000 0x0 0x400>,
+                  <0x0 0x5c68000 0x0 0x400>,
+                  <0x0 0x5c11000 0x0 0x1000>,
+                  <0x0 0x5c6f000 0x0 0x4000>,
+                  <0x0 0x5c76000 0x0 0x4000>;
+            reg-names = "csid0",
+                        "csid1",
+                        "csiphy0",
+                        "csiphy1",
+                        "csitpg0",
+                        "csitpg1",
+                        "top",
+                        "vfe0",
+                        "vfe1";
+
+            clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+                     <&gcc GCC_CAMSS_AXI_CLK>,
+                     <&gcc GCC_CAMSS_NRT_AXI_CLK>,
+                     <&gcc GCC_CAMSS_RT_AXI_CLK>,
+                     <&gcc GCC_CAMSS_TFE_0_CSID_CLK>,
+                     <&gcc GCC_CAMSS_TFE_1_CSID_CLK>,
+                     <&gcc GCC_CAMSS_CPHY_0_CLK>,
+                     <&gcc GCC_CAMSS_CSI0PHYTIMER_CLK>,
+                     <&gcc GCC_CAMSS_CPHY_1_CLK>,
+                     <&gcc GCC_CAMSS_CSI1PHYTIMER_CLK>,
+                     <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+                     <&gcc GCC_CAMSS_TFE_0_CLK>,
+                     <&gcc GCC_CAMSS_TFE_0_CPHY_RX_CLK>,
+                     <&gcc GCC_CAMSS_TFE_1_CLK>,
+                     <&gcc GCC_CAMSS_TFE_1_CPHY_RX_CLK>;
+            clock-names = "ahb",
+                          "axi",
+                          "camnoc_nrt_axi",
+                          "camnoc_rt_axi",
+                          "csi0",
+                          "csi1",
+                          "csiphy0",
+                          "csiphy0_timer",
+                          "csiphy1",
+                          "csiphy1_timer",
+                          "top_ahb",
+                          "vfe0",
+                          "vfe0_cphy_rx",
+                          "vfe1",
+                          "vfe1_cphy_rx";
+
+            interrupts = <GIC_SPI 210 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 212 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 72 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 73 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 309 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 310 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 211 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 213 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "csid0",
+                              "csid1",
+                              "csiphy0",
+                              "csiphy1",
+                              "csitpg0",
+                              "csitpg1",
+                              "vfe0",
+                              "vfe1";
+
+            interconnects = <&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
+                             &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+                            <&mmrt_virt MASTER_CAMNOC_HF RPM_ALWAYS_TAG
+                             &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
+                            <&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+                             &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>;
+            interconnect-names = "ahb",
+                                 "hf_mnoc",
+                                 "sf_mnoc";
+
+            iommus = <&apps_smmu 0x400 0x0>,
+                     <&apps_smmu 0x800 0x0>,
+                     <&apps_smmu 0x820 0x0>,
+                     <&apps_smmu 0x840 0x0>;
+
+            power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
+
+            vdda-csiphy-1p2-supply = <&pm4125_l5>;
+            vdda-pll-1p8-supply = <&pm4125_l13>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+            };
+        };
+    };
-- 
2.34.1


