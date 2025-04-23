Return-Path: <linux-media+bounces-30778-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C42E3A9808A
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 09:22:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2AAE34420DF
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 07:21:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94094268690;
	Wed, 23 Apr 2025 07:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OMICrN8J"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EF8263C8C
	for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 07:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745392866; cv=none; b=VyU1olG0XewWfCoWJ4qbIHjHwEXITGoEianpHljcOknAsf80LetHYhanyJ3kP1ZwTIouQHOygaqC97UyETHlcrVSZQrVqRj2FLW3HWyO3+/gZu5Kwx10t3DvhLkWO2qQKKJPQD4jg5m8jDBxWjy2Y0wTMM6xTxLfJqXWfgGzdIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745392866; c=relaxed/simple;
	bh=RU6F16UzUltqBZThb1ZaQaj8sKEF5oUODiHbmE6L394=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UWa4PYj57PMwylkiyd+vDg2lbREbalPuggRwa+JGahDyUFwJMZVteJv5pOvtyp8VJx/mQqpAcMWD7N+CeOB9QfQqJ81xp7gluh07M2pfntaR3uvTQMgFSJNZHLw2VvYzYPj1Ld9WXwy7tsjQpx/BFNCfoTtnh7cVpt3IH1iVpgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OMICrN8J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0i9UZ016163
	for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 07:21:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=auiZ1TdX+vA
	WT8qcUzAplyGZZLdhSByER51XQxabkFU=; b=OMICrN8Ja1vL4+HiKygUdhWRITq
	7hcHKEoUVYZ5Dqi7Zvvi6FAY3lZSdLCIpF6AoFyK0IIlPENHnleM2RGAx5lAMEu0
	omwQy5RNjClJmAzzEZOlUerU+RivLF4oEeiDFMhdvhN1Az9+Pg3DKVvRsyoYDhoB
	Eczdm4Avmsbg/TJfg0FsrwwEHJqN0CMMUsHPG+OqrPTTGWQlaqIiQ+NIoKTs/eoH
	yaiqvgDceoM+RP9SlWZ+ptQOCKcVALcgO3PRkm62/Vqmb+j7MbxY1AL6Gs38JcE0
	e+xDKqexVq+9vlCuz8zNwQ8s+QpHe7k7pO8G5J8XjXPdcn1UmjMVsvPS1tQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3h7h2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 07:21:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c54e7922a1so907437185a.2
        for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 00:21:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745392861; x=1745997661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=auiZ1TdX+vAWT8qcUzAplyGZZLdhSByER51XQxabkFU=;
        b=mXzliNM36+YiVf79M5E+PQOcINxCUaR+GcSrPhtSNBs050DnZ0p6vXlIREWBsiCceL
         hdz1B1UT+7gmWY6Hpb3it9NXmewH1Hial6A3slBTwm/MzEcyRY92FqP3D8KKBNbHkhHE
         BjqUY19lQv3aQS/MOQdL1CHQLmnKpWzC1bcdBURhY9Kt3HpraCRtV2Qs3hB8/ibPnzPd
         YMo7B2L6SZzaOFJM35/1XctnlBau5cG8eNG6wWA0CO/tV//+Xt96UREzM8KVYVwJ2f79
         8aM8AIjYBp6yPWXr/vVu0fmr7amB6JI2CiR2PAbYyc24foNAkJnt9unM/SpDnQhkTBfN
         KqNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQpgqHhe7HXvNYQVsA7IuyjAp1icArHRjZE7I6PXp82uUFVTXy+xtIArhl6Sy3GpmQPnFh/ff6E7XNww==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLv7GSl6WUjTl/3AkZUDPaRq8e6iJLQCLptOsO3VwDu2QHoPKb
	BvESGjzbR0KqCEdbKds5DpKtf4srl/83QZJqHtwGUbrHX5cg/hhY+hnFHlbmm4G2ymfJ09QRGiC
	gqRm4l5i/rL9oGMBfWrZr5lPanVpC/8K2XmYrjZC7Xm+wmKG1jPO+Tawm0WGE/w==
X-Gm-Gg: ASbGncssdWaVOg5j+BAvjS0Hy3mkLnS6KyprOPYC/S5cL7EAvTXr/3NQs9RHzNwN7//
	5OHMphB1wWMrPHzPBxuOmOtr+oSU1AXXe8f+Yc39927X/1PNxurMxwdsLQaS6kYIpUmbwjuBJaQ
	5p9b4JW/y7xeMjDnbeIabQwlPQnd31YmodKi/AMa/vJ3297humgkbhL3THgmWmowA94MAaxqFmi
	Q8YbPq65XRcOg4a6YcoMGlxdWyS7mQfBOuffldBgjtnhkUFkt3WMAG6iOs01IfbJu0c7qRI/FHu
	YRTNMN1c0mnOG8yhrl7F3wGbPxXk7qj/rZ+28u28tf7dHvI=
X-Received: by 2002:a05:620a:1aa4:b0:7c3:d711:6ffb with SMTP id af79cd13be357-7c928015e35mr2752948685a.41.1745392861408;
        Wed, 23 Apr 2025 00:21:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4FFJHlSKVeR1xsuRxh1VkScuReF7tiKmbUivJjTZoisCTfZIeYyjYYdshNpcOokXdccBpzw==
X-Received: by 2002:a05:620a:1aa4:b0:7c3:d711:6ffb with SMTP id af79cd13be357-7c928015e35mr2752946185a.41.1745392860981;
        Wed, 23 Apr 2025 00:21:00 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:10e3:ecaa:2fb2:d23a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec42af6sm757138366b.43.2025.04.23.00.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:21:00 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, rfoss@kernel.org, konradybcio@kernel.org,
        andersson@kernel.org, krzk+dt@kernel.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v4 5/6] media: dt-bindings: Add qcom,qcm2290-camss
Date: Wed, 23 Apr 2025 09:20:43 +0200
Message-Id: <20250423072044.234024-6-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250423072044.234024-1-loic.poulain@oss.qualcomm.com>
References: <20250423072044.234024-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: caLD9UBWd9DFxRzw2lMAd5adQ-6UhNlQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA0NyBTYWx0ZWRfXwmIVBNPzOws/ DScamkilTl5KF9/Q/uK+4IA+5oC3gND1vsfLVIz9Kv5qSrOOnn6jIx8kN7/6+IEV9czio5OpGRz /Q6gtk2UW5yrwxr/6blWoVsMPwhU0gz4q0JCAzZRwuWhg8WTYolRnSBQ2PWJ9EsTuUosTTGrz4c
 uRP2bA8P/CTwg8wryiVtyPaDvXh4KoqWTxWBQbwUMYRz7QUrBSxQdBTpt1k3HCe2CtHGsCstirh vox/iuIzv2XyGJQ+Y6YygBq84iNaiAk5kgzsnmAX1WaL/o0gyJugtI46VRYoSZYgMALyGDRiIZT GSs2NdjWoYSbTxNqT1gUIVrAOTRppH3d/qo2efuqNT0ceebD6WMcSGNOEljKjzMdvGcZYqpHcH0
 S98vsTamt0PO7C+L4Dh4Rv+pWyF7nGetTrQL4WhbjhuSnzDqKF6Ut6cL3Hl/XSkgHt7FHZBN
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=680894de cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10 a=QcRrIoSkKhIA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=JlZtY4oE0OGdv2NQSfYA:9 a=NFOGd7dJGGMPyQGDc5-O:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: caLD9UBWd9DFxRzw2lMAd5adQ-6UhNlQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_05,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230047

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


