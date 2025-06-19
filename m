Return-Path: <linux-media+bounces-35346-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A556AE0887
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 16:20:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D71611BC3D74
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 14:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A4DE221D88;
	Thu, 19 Jun 2025 14:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UBld/Jgh"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B3A21579F
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 14:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750342824; cv=none; b=aP/yGCTIcezBqA9chYXxt8yYnAsacwfC10W3I4x0e3ilP+CmCswYjPVYPY5U7DSlRfGO6mx+p916oYFc8HEu+dP26I8YdTepmoHVmOuao+roORXfnFBvvGeFK78Xnxch+Epm3Z1jmecgZKq1dhlXVpx4ZB1aBf88Ahj70nFSdFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750342824; c=relaxed/simple;
	bh=IFOmcOgvkEQOE6UT1GX5a0TCQ3Ddrsxu/wCNW4a1u0A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VNTYjF9vRunDdDGtf53D2f8BmPyn4oC822iqDxfMorYuweug8kmdv9t02CRKjcu3pA8T0qW7Gk3lQCAtdfgs5lEkYPmhlnX/HawmNWOIF00JUtBk0AsaReaCe2ZENaROZYgMmQ7oJx7PWg7lvrGViBfdJjbY3J6kskBBmX2/dH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UBld/Jgh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JEDRmW028912
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 14:20:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rjG4zPddXl0
	PsKH45bNGGBvIH8sLOx5tvW+L9Xts+hY=; b=UBld/JghjMbzTfzqJ3EaBHHnODy
	YbOvTSsSsqwa+uHZksXZR36vXjhC/7MsRhNWELvdnxQU99aaVXfKcqmPrqCrVXtJ
	0kujUyBAXuADRQrGDFvw0TCpwZnbRcS271ArA/2YdlkDb9/901S03WjxIb2TkxLE
	M96RlK2btzC6FybRZmKsFoqg99+85hW9l3zCo4+S30KgwvXWzf73mdrqdPYqgDMn
	+v9/ca3Lr5krVAwlxNafCnz4HSg/2Gz+qhvRSJJkze6V38WqpjN7Y+0csd2EZwVY
	x8TzcS0hgxBCkvExh+sJomottE/2kzBMivz+yugqovZ8xvqpOfhQohU/dmw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791h9g6qb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 14:20:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a58813b591so13743551cf.1
        for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 07:20:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750342818; x=1750947618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rjG4zPddXl0PsKH45bNGGBvIH8sLOx5tvW+L9Xts+hY=;
        b=bNyot65SEyR1nL6LZnlz4PNei5AhYlfQpWCqg/H4WLZ6oB1gpKFh3HbAN5TT4M5ouy
         GzsuYw+50s+t3RTFe5J/TxFSpcBJfbfYAoFQqvV7HrDE8jnT6WaTcBLwfUPpKjFn7vwG
         VuWmiWcby9rhWijbl9jFH4uinVjEI1qF6zsMQYY6iWGDyW+EpXO4K2Zpdln6ZWbxhGmm
         idIFLBFMRJz9AGDkzl8oZ6Z66PMrTe/HRutpbJd6D/wtauIJ98xgqR3KiR3eJ/V8itl/
         Qpijc2+wYozEarxCPj5WAkCi4ODTRne18FLSTFpgBSfut3cIg8Qj4nj9mrEAHSlHjqL8
         dG1g==
X-Forwarded-Encrypted: i=1; AJvYcCU7t1UQV9gu+WaZtgkm3v1iTgOTVsXcRIWWw1OPbjOUbnXq/aUr1NVvuC9/mXnuobQcP0S4tRb2YYhaYw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0iBuw7XZDasFv7OBxibuIauO9cJ0B9zLdRWdmkrMkYZQzeP0H
	3ErHY0fTdak5joP2GFKZPqI/5gOOQZSis9DJOY6vvXv1t0aQ7I/MusPyjWw7mSV2xlgjIK1vcRw
	+94ir3FbCwYhhzsyOqIvp74k74hHz9R51NZeylVA8jhQ9FNHVjQmGc7Nfu0S9TyOK9w==
X-Gm-Gg: ASbGncu/bjZOrxqyk/7FH3LtbfgorYWPfNqBjBib+ZDArLt58x1NxcvY4+JaSKfwtOa
	v2yOTx8yBSklDmlcdGu4/oXuM1J5kn8zaGmciD+NLz597UEodhgzJSjEcISvhgX6Igqi6S8tJWS
	/0Q1gFaYy/AvVVskOl1UiniwFId4l1i9Dp1lF9VGhitNgLh0Ugi7i9AckSWSfmOf+PNNdHC1BIb
	aCTW5Hvkpy42vp1gEkg+jZ3zwgQ47QG3zCpht72ztfg/1u/8s8NIkE8v+Zo/stSpbmpnjn7oOsj
	n0mjUIwaXOfzgfpeiWyao6bQnpCYhS9kv85z9/OAAV25X5tvECNGWuXNz57Pb7UcnFObg2+UQLk
	6
X-Received: by 2002:a05:622a:5c17:b0:4a7:937:4620 with SMTP id d75a77b69052e-4a76e14ecc7mr47625521cf.1.1750342817698;
        Thu, 19 Jun 2025 07:20:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlppA8sGbGQRFqd2N+SMTI1PPhRu7R/h34nY5vhkPBHfCbnZx2OPccT1Zo399ooSWXltrljA==
X-Received: by 2002:a05:622a:5c17:b0:4a7:937:4620 with SMTP id d75a77b69052e-4a76e14ecc7mr47625141cf.1.1750342817267;
        Thu, 19 Jun 2025 07:20:17 -0700 (PDT)
Received: from trex.. (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a58963561csm7254312f8f.47.2025.06.19.07.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 07:20:16 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        stanimir.k.varbanov@gmail.com
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 1/7] dt-bindings: media: venus: Add qcm2290 dt schema
Date: Thu, 19 Jun 2025 16:20:06 +0200
Message-Id: <20250619142012.1768981-2-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250619142012.1768981-1-jorge.ramirez@oss.qualcomm.com>
References: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
 <20250619142012.1768981-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Mu4XpQ0KSXiaAZeByXCjluAX9wNloNQ5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDExOSBTYWx0ZWRfXx/BhiE+C5jvG
 BfdqN1+Z9yx6CE4GWO41sBpUXO33oY2Nyya2pzkHBEfu6A4lH4YM+7P9ZpfZ3S00g9LDfqmb0RK
 qfJpwqqcW43O1Yqebe2LpCVcg/BDbWE2zWEULezbB/yacQFi4cAPDJk9lOE3Hidlr/BQFCK2k7t
 AmIIKc4Yf3syXFCV7FFG0kTpuS8Ys6/3jJJaSIwRBplsW385/IEQIF7DMTu6WGsMmjZ/1JvmmSM
 BeftshTv1JzU7xgKzHAZRvFsJztAtjw380iWDeEgi/jBKFc5pLqkbJsPytW1br9a9sUgZEI14BF
 hXfjQv6uMXUgj5R8ml81mY2697v/a0o65g8vR271kbR5868dfLEWU6jWhZPlqLU9uU1Z8ftzzPA
 Hs49LPUOaRNN7R/TEGUX/jz2eC/8tFtPs0+G0lfDv+7NIL9RDBa4asoY3ZcDKr+TfoO3nh8u
X-Authority-Analysis: v=2.4 cv=UL/dHDfy c=1 sm=1 tr=0 ts=68541ca4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=6IFa9wvqVegA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=UBg8vxrJu69tSQrAULkA:9 a=kacYvNCVWA4VmyqE58fU:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: Mu4XpQ0KSXiaAZeByXCjluAX9wNloNQ5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_05,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506190119

Add a schema for the venus video encoder/decoder on the qcm2290.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
---
 v2: power-domains set to 3

 .../bindings/media/qcom,qcm2290-venus.yaml    | 117 ++++++++++++++++++
 1 file changed, 117 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
new file mode 100644
index 000000000000..244559e1bdd7
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
@@ -0,0 +1,117 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,qcm2290-venus.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QCM2290 Venus video encode and decode accelerators
+
+maintainers:
+  - Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
+
+description:
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
+    maxItems: 3
+
+  power-domain-names:
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
+    };
-- 
2.34.1


