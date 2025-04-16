Return-Path: <linux-media+bounces-30329-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FACA8B88B
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 14:11:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9DB947AE05F
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 12:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF6AC248886;
	Wed, 16 Apr 2025 12:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i0nKqE6j"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0E724C083
	for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 12:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744805366; cv=none; b=ZFlJMp31qSVXGeYR4vTRiAFdU983qWCsivZDfoqFOQgf+KvbhNDjgmLuM4CvlN5InX6nJyfPXoLno5kfUArPrOu5T+yrPtnzELZ4rgdaDG+vySHOYdjtkh8JqC5enVKeGxMj5uj4ky4B10oo0WJh1kUjjxH9ASU4kp++S4+hPu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744805366; c=relaxed/simple;
	bh=p2sisv3FaynmKm9MXmyj2FKEdx47s/LAReVhcDfPSNw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Pgt6686jpg2niYkF/Yt0MeK7V9/gFhcYxXGy5CTnqII1x8DO8ga3QCScWg0ehga7sNbKfSpQxXAPhqf42uj2Pl9cdPgdQpd7ybWg5mf7+4MSs/6w2RY1/NWBYZatNF/4CjB2qvHsufESgq5eJXVqwctQvEnZ/0wPDTO/ybJWQLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i0nKqE6j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G9mDoI020551
	for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 12:09:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oCwCmdS+SDe
	7GEj+Sp5OjyZYetJhaZ9LvSjllX9L3iQ=; b=i0nKqE6jCK69pqRbpvTePAOq+Eq
	Zee5qI3QB4aHxZJXKypvABhFcijJksZVlnvvCHoXXDzu+Y6T9gCJP4pbKnNugWV5
	5N7jDALeE4PW7YXd9XNY4QuHzdviOYfXm1Q94HbJtA1nNs+UvDuyg+rV/9yXpQrV
	G05mnP8JOeIOyMd7airUgVrQIux3b3BVhlVPi6kFwb/f/OlCrffUOkQqDmH8zJEG
	l7VmcLjQOxbT+UXx3Dhe5fDQ+edQwCaqQ7SYTNjORWhziGh0HWM7BeusfD0iaC5G
	j0wNcHs6uR75UE9N4W3jqyhHTyglrbfEZOCaRB9oWP/VL9VGMzm7U6zX2sg==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yg8wkeav-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 12:09:22 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-3f684f66583so1943852b6e.1
        for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 05:09:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744805362; x=1745410162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oCwCmdS+SDe7GEj+Sp5OjyZYetJhaZ9LvSjllX9L3iQ=;
        b=mWF8DDIYfM7dZ3ENwgA6NhSG4wkh8SjAmFtmTIwHp9Qbed4FUv1KONdeoaRkFfkASx
         DFGh3uL7Rg7N0SzedEqOA26/GkVWYDtlJeNnKPljpwmnU8Dk1iBmdn1r1LURrHjE6dMh
         LrTVx5T+LTWwt0GWBu4W05IkHsfuYiJ3QFS0bxMoPJanbPtY1ok0vOVuZwLTlHXNk9yg
         YBkcXrRSyHfuPKNOrF1PWi/hmrodo2m3sJqVWLvkiEb6jXPHqIc9A0M6s1gBenJfP9wQ
         /BPdGMcuHRvoS/+c51xhLNuawLCmJwHM1RYKV0PyZ1F86o7zD7+43tYVqjmANNzJa1Gc
         Bilg==
X-Forwarded-Encrypted: i=1; AJvYcCXOJmZhbLQKxmFlbS+h9gno6iT+2uvEra6N5gwieFe7y7TATB5c9OH6xc/LzMg4+oZ2gzZnIrCH2sFl6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrbyEtqZ9BhFYFzx0XHblKRGtsoLeR7ewp4g4HMjGLxJBidUe+
	gSg21QuzFhS0zzoS3mO0jiHEHCf35OdduPrGWvvWRc37mWytZP1PwEOk4NThy1ftHdygNw6r3Ir
	JyUmTvW87naGQohINrSJ3as6dVLyD86GsoFjGwmgSH0TNttKHLFpHkItwQWtH7Q==
X-Gm-Gg: ASbGncuxWcAySUgL7/ppOGNnQgc8QBe7WiZGbP62GXoP25UzZrt4AjLWEnEJU8rcbz2
	pfVcZw2ttzjL3YXy1ZMrYA5x4qtwDS84SdNKsFEi9F1ABcb1tydW+wZbAR4BPzgJYJ6l66u1d1F
	sfGS47oEkZ+Uf5qrwykR695L9uuTIyLdwhKaWr9ZGPTTY1+vhnydJG+K3Pyltis9RQUogs4NKn7
	dXuPUo1AFdUnpceHUjIhBdv3SmYcbuhUYbMRaoyitvMNo6VlJ6HjjKqiAMVqo4v+zpUo/vNQzH9
	6+o4eWdwPmxEI0v87L35RhWFPF9Aj2K4QxpSmYYF2eXFG/8=
X-Received: by 2002:a05:6808:3203:b0:3f6:a476:f7e0 with SMTP id 5614622812f47-400b01caaabmr911760b6e.9.1744805361987;
        Wed, 16 Apr 2025 05:09:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFznpFYEgBEZNt9B+00ktVcV1ME9H4Y8YDtK6rz2hRIOktahqd7meqmf6jvFuO+P/HM8WFt4A==
X-Received: by 2002:a05:6808:3203:b0:3f6:a476:f7e0 with SMTP id 5614622812f47-400b01caaabmr911734b6e.9.1744805361635;
        Wed, 16 Apr 2025 05:09:21 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:15e4:d866:eb53:4185])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36f068968sm8328669a12.35.2025.04.16.05.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 05:09:21 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, rfoss@kernel.org, konradybcio@kernel.org,
        andersson@kernel.org, krzk+dt@kernel.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH 5/6] media: dt-bindings: media: camss: Add qcom,qcm2290-camss binding
Date: Wed, 16 Apr 2025 14:09:07 +0200
Message-Id: <20250416120908.206873-5-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250416120908.206873-1-loic.poulain@oss.qualcomm.com>
References: <20250416120908.206873-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=E9TNpbdl c=1 sm=1 tr=0 ts=67ff9df2 cx=c_pps a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10 a=QcRrIoSkKhIA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=JlZtY4oE0OGdv2NQSfYA:9 a=efpaJB4zofY2dbm2aIRb:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: -WVovgMpRwQfWrqgVq_sGx-Gz6bXBqQF
X-Proofpoint-GUID: -WVovgMpRwQfWrqgVq_sGx-Gz6bXBqQF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_04,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160099

Add bindings for qcom,qcm2290-camss in order to support the camera
subsystem found in the Qualcomm Robotics RB1 Platform (QRB2210).

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../bindings/media/qcom,qcm2290-camss.yaml    | 246 ++++++++++++++++++
 1 file changed, 246 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
new file mode 100644
index 000000000000..dc53f445a90b
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
@@ -0,0 +1,246 @@
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
+    maxItems: 6
+
+  reg-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csiphy0
+      - const: csiphy1
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
+      - const: top_ahb
+      - const: csi0
+      - const: csi1
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy0_timer
+      - const: csiphy1_timer
+      - const: vfe0
+      - const: vfe1
+      - const: vfe0_cphy_rx
+      - const: vfe1_cphy_rx
+      - const: camnoc_nrt_axi
+      - const: camnoc_rt_axi
+
+  interrupts:
+    maxItems: 6
+
+  interrupt-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csiphy0
+      - const: csiphy1
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
+  vdda-phy-supply:
+    description:
+      Phandle to a 1.2V regulator supply to CSI PHYs.
+
+  vdda-pll-supply:
+    description:
+      Phandle to 1.8V regulator supply to CAMSS refclk pll block.
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
+          Input port for receiving CSI data on CSIPHY 0.
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
+          Input port for receiving CSI data on CSIPHY 1.
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
+        camss: camss@5c52000 {
+            compatible = "qcom,qcm2290-camss";
+
+            reg = <0 0x5c52000 0 0x1000>,
+                  <0 0x5c53000 0 0x1000>,
+                  <0 0x5c6e000 0 0x1000>,
+                  <0 0x5c75000 0 0x1000>,
+                  <0 0x5c6f000 0 0x4000>,
+                  <0 0x5c76000 0 0x4000>;
+            reg-names = "csid0",
+                        "csid1",
+                        "csiphy0",
+                        "csiphy1",
+                        "vfe0",
+                        "vfe1";
+
+            interrupts = <GIC_SPI 210 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 212 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 72 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 73 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 211 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 213 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "csid0",
+                              "csid1",
+                              "csiphy0",
+                              "csiphy1",
+                              "vfe0",
+                              "vfe1";
+
+            power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
+
+            clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+                     <&gcc GCC_CAMSS_AXI_CLK>,
+                     <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+                     <&gcc GCC_CAMSS_TFE_0_CSID_CLK>,
+                     <&gcc GCC_CAMSS_TFE_1_CSID_CLK>,
+                     <&gcc GCC_CAMSS_CPHY_0_CLK>,
+                     <&gcc GCC_CAMSS_CPHY_1_CLK>,
+                     <&gcc GCC_CAMSS_CSI0PHYTIMER_CLK>,
+                     <&gcc GCC_CAMSS_CSI1PHYTIMER_CLK>,
+                     <&gcc GCC_CAMSS_TFE_0_CLK>,
+                     <&gcc GCC_CAMSS_TFE_1_CLK>,
+                     <&gcc GCC_CAMSS_TFE_0_CPHY_RX_CLK>,
+                     <&gcc GCC_CAMSS_TFE_1_CPHY_RX_CLK>,
+                     <&gcc GCC_CAMSS_NRT_AXI_CLK>,
+                     <&gcc GCC_CAMSS_RT_AXI_CLK>;
+            clock-names = "ahb",
+                          "axi",
+                          "top_ahb",
+                          "csi0",
+                          "csi1",
+                          "csiphy0",
+                          "csiphy1",
+                          "csiphy0_timer",
+                          "csiphy1_timer",
+                          "vfe0",
+                          "vfe1",
+                          "vfe0_cphy_rx",
+                          "vfe1_cphy_rx",
+                          "camnoc_nrt_axi",
+                          "camnoc_rt_axi";
+
+            iommus = <&apps_smmu 0x400 0x0>,
+                     <&apps_smmu 0x800 0x0>,
+                     <&apps_smmu 0x820 0x0>,
+                     <&apps_smmu 0x840 0x0>;
+
+            interconnects = <&bimc MASTER_APPSS_PROC RPM_ALWAYS_TAG
+                             &config_noc SLAVE_CAMERA_CFG RPM_ALWAYS_TAG>,
+                            <&mmrt_virt MASTER_CAMNOC_HF RPM_ALWAYS_TAG
+                             &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
+                            <&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+                             &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>;
+            interconnect-names = "ahb",
+                                 "hf_mnoc",
+                                 "sf_mnoc";
+
+            vdda-phy-supply = <&pm4125_l5>;
+            vdda-pll-supply = <&pm4125_l13>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+            };
+        };
+    };
-- 
2.34.1


