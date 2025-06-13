Return-Path: <linux-media+bounces-34756-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BA3AD8EE2
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 16:12:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DBB543BEEDC
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 14:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 813C12D130D;
	Fri, 13 Jun 2025 14:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R/pXrXiH"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFD01B424D
	for <linux-media@vger.kernel.org>; Fri, 13 Jun 2025 14:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749823472; cv=none; b=TtAskl2DZGa+zv8NSTiRdDhyUqgPg+zzL7XMXOVgUum+4j+du4PaGE6ZSbxv5sLFudQ5wmb7jLBuExskVS4vt9GHoKxkFRS4faFhQV/7F5Svb0nLdax4MSAwXyGUKK38zzT2BEXQeco6He9x7h+sa1jnUQqNSsj7JEIwKeo8yU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749823472; c=relaxed/simple;
	bh=gdhfUspPyqBiEzOlF6EWkZ6U0ttrz2LFWzzIn0eDJFA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XzAR++7On3svSDGDBc1vICEQXWFTRyoGqXAYoSbm5fW4G+wJLEsBqb2MMWZzlxcfw+lyudQXTN1C/N8uawBMGbgNnqFoIgYRy6ji+PlLlqVKgKBjug3mUktfaSLGD68Z0sI3NliHGAqA3h/TWrz35ZPBYHFgobHAhFC8w3rr3rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R/pXrXiH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55DBuxPq001917
	for <linux-media@vger.kernel.org>; Fri, 13 Jun 2025 14:04:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dRjk/GIaSQo
	1IqS/32SDSp43gzWPCoXG2x1Joi96rvA=; b=R/pXrXiHkOGAxiUHCmLBipGR2bq
	MikV93dz4G2AvH0QoJf0D49xrjuHxB1qzKpmPL1L1BIxvBuCvOSeGxjsjJkuWqC3
	I2MSPEOZ45y+44EjNGXMWM/gRJYkFtMBwrCQJBxp5N9owSYOSLgfAUSK/va5fHAv
	x4zxdiUpitdIh1PIBBEUv6rtc3oILju8pp/ZyDOV30e6romAFdYOD4HavOtAmtHw
	kCe+R0rfrmccQ7yr59LSImIwuqQAn3ElfuOAjS21ewi+2IMvI/MsOabDztZ820xB
	o8c7tTHeWHbT33iLnScgEpbDvrrQ4TJc1EhlwuA54AbtirnPjkTA6JZRw2Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ccvkmf0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Jun 2025 14:04:29 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2350804a43eso33461345ad.0
        for <linux-media@vger.kernel.org>; Fri, 13 Jun 2025 07:04:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749823468; x=1750428268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dRjk/GIaSQo1IqS/32SDSp43gzWPCoXG2x1Joi96rvA=;
        b=cSGJpshsMyTxq2sUrFa3cI3Vzl9ilVuAltHvEaB4tDisbkMo4NQDl0c80IWRCmmbVk
         yAwCREEb89g9TQyCVOsYdn4sbL+2y2jXaHezkMXY1fzo7n9KXKO6fGnEMqTGfivFz4fy
         N6+xwptpmpVnGBG18PPS4KeZm1/VMAlwIbiIy5CB6JkbhOLiF5lk2OuJAVZ0Nylcbisk
         czx3wy877j4ws3FxqA9hXizG1VOn7r4rRBRmOPdXOex1CGX8UaT6IgB1XHe1fY8jJXQg
         b46DVUmgGy/NDBin/UIB1T6GHPT/8hTdAfX/g79P1IuAVlchymLZdeHUILLv7HSxu1pe
         V1ng==
X-Forwarded-Encrypted: i=1; AJvYcCUe+LdtVv1/eyl85U0OpVnHDfWL+h2oAWjiBlU5B1WtK3jFKTQSfssNHSqjGyAsNqYeK36AjKuBRRdLkA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3hCrwLRbiNMh/NuQ3Q0rPcsXDmzCPYPeep1435ohjhOnJ2elN
	VgQVFlQzUgIpjjGRqV3Q7p7SE3Onlj1l39XcRh2lDJ7z82PcSPDVMOGBqimyLShl+9pYl8IwlTp
	uq2rxwEGiAQYyIdlTSegoqksxbpPM97zxoklEVmNaAq3Fq8K4Bz6k/m0FfnM4nc69+kYNXD43uQ
	==
X-Gm-Gg: ASbGnctFD6CtzsrK8A51LnG7Di15dTuA21ghb9WxOHfO+FKkGOv7eS+V4Qly3DBLS7C
	V/cq4McKFFs8Pn2ZlotEvS4dq9zaB9ic6//JJ3TdMC4LN1LHdiZRRcr9wva0Wz23VuUttkppRKY
	pIY+jzmb5RdNHhjFFVEl4zNp0tMKyV2XgSWC9wx5U69TKf7sRB6p9xDnI/cWWgoi13tkTqJVECc
	KWS/1qNuP/8WxDwvx3AvlB3fsmBk6su/zIs8HutMyuApwHz6n+u6xLNUwj14AhrIgzxXVSc/CHL
	QXlJLvaUcUC3n4r0UAqKP49ypASnLgrqWE7VOVrdGDQh5lhe7zsDraQCynXv8URpNlWW2dz82rU
	b
X-Received: by 2002:a17:902:ea11:b0:234:ed31:fca8 with SMTP id d9443c01a7336-2365db04ca2mr42307585ad.27.1749823467287;
        Fri, 13 Jun 2025 07:04:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFR8jsfnA0oH2YzM9LYN0RUmbEBZjUfR9KtG7h9Y5VC+XY+k59J/pusktrBSu7tajQ58/h8lw==
X-Received: by 2002:a17:902:ea11:b0:234:ed31:fca8 with SMTP id d9443c01a7336-2365db04ca2mr42306475ad.27.1749823465796;
        Fri, 13 Jun 2025 07:04:25 -0700 (PDT)
Received: from trex.. (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e268de2sm53503615e9.40.2025.06.13.07.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 07:04:25 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, stanimir.varbanov@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] dt-bindings: media: venus: Add qcm2290 dt schema
Date: Fri, 13 Jun 2025 16:03:58 +0200
Message-Id: <20250613140402.3619465-2-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
References: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: dwZROZeO_pGkTwZhOCnoihVTKNdjb4yg
X-Authority-Analysis: v=2.4 cv=TsLmhCXh c=1 sm=1 tr=0 ts=684c2fed cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=6IFa9wvqVegA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=1mX_ai67dwKzVtmm1w4A:9 a=GvdueXVYPmCkWapjIL-Q:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: dwZROZeO_pGkTwZhOCnoihVTKNdjb4yg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEwMyBTYWx0ZWRfX2gX+xuraXi4M
 u1BMCSZLMWjHK2J4eNfsg/idbUSyuMSFO3wN0Zegh/qAit5FF0SpucqjVvVJNzqRAVLxgzx2/YY
 nRgC5r1Q7hrrS0zNviVDxM1G5Qg+tT4uP160lfAEBKc/X/5yX4YDEac8wBCls+Sk/+WUb1Mu+AG
 INbLHvQfWjl1pOq98G/VBXmYJOG2O3SOxSoXtIZtohnOOjBHm3GrMlIHJPMoC1MrcPydFLBeH0j
 2whyLA81jCT+LlbcO5lOXx5kX9tSk4McA/oiI5zGEwAyOJBvsXTYfiZl0t1enkbtRQCk1DSTkN+
 /EeZTv3QloUmoKHkV2Qs8aNGA6L7jTXBodM1xoPNm7nnRHMraC+aI8vnVRzz2mdi29r+7QH/X2c
 tbZwjV1wxg7cUKB6fpLPPH0kn0gCMDtgRAUeXrkF7IZ54NsJ2XKqsgNarK48k6mN7lMpRW7A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506130103

Add a schema for the venus video encoder/decoder on the qcm2290.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
---
 .../bindings/media/qcom,qcm2290-venus.yaml    | 153 ++++++++++++++++++
 1 file changed, 153 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
new file mode 100644
index 000000000000..ffa72f1e27f3
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
@@ -0,0 +1,153 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,qcm2290-venus.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QCM2290 Venus video encode and decode accelerators
+
+maintainers:
+  - Stanimir Varbanov <stanimir.varbanov@linaro.org>
+
+description: |
+  The Venus AR50_LITE IP is a video encode and decode accelerator present
+  on Qualcomm platforms
+
+allOf:
+  - $ref: qcom,venus-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,qcm2290-venus
+
+  power-domains:
+    minItems: 2
+    maxItems: 3
+
+  power-domain-names:
+    minItems: 2
+    items:
+      - const: venus
+      - const: vcodec0
+      - const: cx
+
+  clocks:
+    maxItems: 6
+
+  clock-names:
+    items:
+      - const: core
+      - const: iface
+      - const: bus
+      - const: throttle
+      - const: vcodec0_core
+      - const: vcodec0_bus
+
+  iommus:
+    minItems: 1
+    maxItems: 5
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: video-mem
+      - const: cpu-cfg
+
+  operating-points-v2: true
+  opp-table:
+    type: object
+
+  video-decoder:
+    type: object
+
+    properties:
+      compatible:
+        const: venus-decoder
+
+    required:
+      - compatible
+
+    deprecated: true
+    additionalProperties: false
+
+  video-encoder:
+    type: object
+
+    properties:
+      compatible:
+        const: venus-encoder
+
+    required:
+      - compatible
+
+    deprecated: true
+    additionalProperties: false
+
+required:
+  - compatible
+  - power-domain-names
+  - iommus
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
+    #include <dt-bindings/interconnect/qcom,qcm2290.h>
+    #include <dt-bindings/interconnect/qcom,rpm-icc.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    venus: video-codec@5a00000 {
+        compatible = "qcom,qcm2290-venus";
+        reg = <0x5a00000 0xff000>;
+        interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
+
+        power-domains = <&gcc GCC_VENUS_GDSC>,
+                        <&gcc GCC_VCODEC0_GDSC>,
+                        <&rpmpd QCM2290_VDDCX>;
+        power-domain-names = "venus", "vcodec0", "cx";
+        operating-points-v2 = <&venus_opp_table>;
+
+        clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
+                 <&gcc GCC_VIDEO_AHB_CLK>,
+                 <&gcc GCC_VENUS_CTL_AXI_CLK>,
+                 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
+                 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
+                 <&gcc GCC_VCODEC0_AXI_CLK>;
+        clock-names = "core", "iface", "bus", "throttle",
+                      "vcodec0_core", "vcodec0_bus";
+
+        memory-region = <&pil_video_mem>;
+        iommus = <&apps_smmu 0x860 0x0>,
+                 <&apps_smmu 0x880 0x0>,
+                 <&apps_smmu 0x861 0x04>,
+                 <&apps_smmu 0x863 0x0>,
+                 <&apps_smmu 0x804 0xE0>;
+
+        interconnects = <&mmnrt_virt MASTER_VIDEO_P0 0 &bimc SLAVE_EBI1 0>,
+                        <&bimc MASTER_APPSS_PROC 0 &config_noc SLAVE_VENUS_CFG 0>;
+        interconnect-names = "video-mem", "cpu-cfg";
+
+        venus_opp_table: opp-table {
+            compatible = "operating-points-v2";
+            opp-133000000 {
+                opp-hz = /bits/ 64 <133000000>;
+                required-opps = <&rpmpd_opp_low_svs>;
+            };
+            opp-240000000 {
+                opp-hz = /bits/ 64 <240000000>;
+                required-opps = <&rpmpd_opp_svs>;
+            };
+        };
+
+        video-decoder {
+            compatible = "venus-decoder";
+        };
+
+        video-encoder {
+            compatible = "venus-encoder";
+        };
+    };
-- 
2.34.1


