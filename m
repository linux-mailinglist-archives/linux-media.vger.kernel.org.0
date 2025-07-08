Return-Path: <linux-media+bounces-37155-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D28DAFD600
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 20:06:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 111267AEB51
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 18:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31DDB2E7BC2;
	Tue,  8 Jul 2025 18:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lBEyeNfb"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B9B2E7196
	for <linux-media@vger.kernel.org>; Tue,  8 Jul 2025 18:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751997942; cv=none; b=G9RSDyuwc8YrEh98C4PfI1gnh/bHw4nCXTgVq3mg8M8MvHOsYEGSTdFTZpEO5gaPVmngDP9UV3kKbctX3hZc1O2ND3pEwf99KQiQcPzkVtoodno2c7XHnAZAPj+BllAgfnnNc3heHNYCIJhQ4DtOtiHkkv97gwsyaNxgPFaa6/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751997942; c=relaxed/simple;
	bh=KM3x/3Pbcpku4hi+Q2J5twTHiiakqH43ags6fQQ9T8I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oOmp7hRYs+h1AFsjOSJv0074+aCeESaG/sUz3iCo3fdtw2y7YnJITfnp4HKKmriVf8Bc7qpQD/TOTAz/Ca6fkd3SAOC9xENYwa/tT50KveOpQ1SDKboweqbyKALx0jfNT6gpUBVESOPTcZwScwvzCBvPFDmpeFo5d6RbuWTxOoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lBEyeNfb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AAQHG001285
	for <linux-media@vger.kernel.org>; Tue, 8 Jul 2025 18:05:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YGHUolC1rCw
	c8hxbfX9G9XRUGGS2ug574YwaNTuSfSw=; b=lBEyeNfbCH3TNRG8Djqn6Gkv1Me
	S2BXdkHLnbm5GxI4jj6BJtKonAkX9Jc69gjwwL47wa8LgRJ1J7eC0RrXzA39wwk7
	RaIcoq8TDDhjB8R26RG6EkqsylS0auj38qwpsiTlT4ZJqDVuZImHClHDSbeyiZPV
	6IkD70JZknCaC4P79WoJqCWPYR6LbYvvLfeJW+uTmzEwNlgtcjNlj4ZuydiXis8y
	AnP7cz7X2cGBqHskmjmRkm/AVaHXJRsDMLBUjwMiuAoCBkBP61QhiQBOfM0+GOU8
	yRCMjKhR95Wo59mt9t8Apvcn+BMhx5Kn2a6Jn/yGnMI/hxbz3T4ZEwne2cQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psdr1ab7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 08 Jul 2025 18:05:39 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a6f6d07bb0so93239741cf.1
        for <linux-media@vger.kernel.org>; Tue, 08 Jul 2025 11:05:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751997938; x=1752602738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YGHUolC1rCwc8hxbfX9G9XRUGGS2ug574YwaNTuSfSw=;
        b=l0uVxJ5nv7jThZ9mBxvB9Lx1GvIC6EROTEXY63Lnstl8cFx+t8FU9Z8pqtZs0wex9V
         WGWPTeOQ991Ji4q/oIiHL3on7dlNQMvFoVeQGgUxkwyAU++50dYdmxkHcYxTeCXq7H2n
         jz0KUkEe0vlDVptnrzcRhJ/oi/m/Zi6IK0mAq9i4xO/omYIRNU9LPdOTq3oMsaIGllfP
         Hk0ghNMjhgRH7SL7QFVW3cyjVqnJTA3rdd+2m7GX4CaWrmfGeezpl2EkkwGD8AS5WpUB
         INLqdWYKCiulxuj5cFNxoskHC0R+AQ7Z/EvpoHtLQ6d/J6PtQt/eUmuJ7VOAaE2aGeK6
         GGOw==
X-Gm-Message-State: AOJu0YzbHjI2L4ipYZCqdQwkuJXPUPheDbRJ7aJ9TLy2HoXZptYXSZbI
	aRAhGq0sc3pfYSBvzOzrco9WeCVDTHmt6OjvUmvJK/qQ9NVsR++1VMT/LF1n9LK5Sfc/QHwdhr4
	HdOggHNH1Bc2IjKy6VEWPr4Untl4sz3buMH38Km8otZYMap2w2NiSIptt+xnLaR6pJ7QiQTsqmg
	==
X-Gm-Gg: ASbGncudpal0Q3G3H6NutZHn7nE6VRmWQ2soZoaS586wlXFbIo3DMmBbyrOm2iuX/Tu
	DBp2GjX3VveicAQ5LX+PtXRvosYghDugIH+SnWvGsJV0FRTMIEoDHhEc1aQ6ypLT3HuHIU0xqbR
	RlAoKevVvatwGmBqdmTuoFlzvfrfcumHvivjMCUFkoaECH9q7sGczW5TBBVN2tuibMh1SPAWl7Y
	7ze1YOugdRTg+U4re+SLpmC+K0Gzv9AROZ/0gHOLztO8zxyLOt5N+SxFfCVaZkFfvSRxlL8wEED
	j+uvvfCGVNhAwQUF6pdX+nlj7HgySW0B8qGROioFNdzAmqmly3jEg8Mm5jkSgWFAu4AqMqgJ/g=
	=
X-Received: by 2002:a05:622a:5b07:b0:4a5:98c2:34b9 with SMTP id d75a77b69052e-4a99879c338mr298267951cf.34.1751997938275;
        Tue, 08 Jul 2025 11:05:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF29pd8fhzeOYZdlDmtmT9cdQjqO0dtDDRTYDNMsDji0Xsn3tWAX86IjXcZkSCRq2tuR+n0ug==
X-Received: by 2002:a05:622a:5b07:b0:4a5:98c2:34b9 with SMTP id d75a77b69052e-4a99879c338mr298267311cf.34.1751997937725;
        Tue, 08 Jul 2025 11:05:37 -0700 (PDT)
Received: from trex.. (97.red-79-144-186.dynamicip.rima-tde.net. [79.144.186.97])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b4708d0a5csm13394906f8f.29.2025.07.08.11.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 11:05:37 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, bryan.odonoghue@linaro.org,
        quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com,
        krzk+dt@kernel.org, konradybcio@kernel.org, mchehab@kernel.org,
        robh@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        amit.kucheria@oss.qualcomm.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/7] media: dt-bindings: venus: Add qcm2290 dt schema
Date: Tue,  8 Jul 2025 20:05:24 +0200
Message-Id: <20250708180530.1384330-2-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250708180530.1384330-1-jorge.ramirez@oss.qualcomm.com>
References: <20250708180530.1384330-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ffSty1QF c=1 sm=1 tr=0 ts=686d5df3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=oX6B8lV6/A+qF9mARCc04Q==:17
 a=Wb1JkmetP80A:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=1mX_ai67dwKzVtmm1w4A:9 a=dawVfQjAaf238kedN5IG:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: jbKE_B01vdflzf7SlhwIQJNxAPoUNDJi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDE1MSBTYWx0ZWRfX9x6mPObNIRMv
 fbkyHoepQFlVQeWzGkf/Zs9lNRPP3cHsuglShSkWT+i60ip0pCIeU2CJ5q9Ac++A5c+SGlii24Q
 YxwykQ5ccypQU/hLFswYflg7cSpiqZup6bwYO7e7Zvg2SKD99TVMj4Sh92bH6UwAJwNslBVyF72
 loqHH4KaeHJHs0sdRF5j9Oqaf4sZB3DrU08ye/826+wDjKhtaTyDPDxW3dfN5Fi6OQTmxeqj4xL
 rBgBikSqE39wg8jNbTSIhq5dq75VFWvgvyL3Tn+k33VO8fnjm1ZHokjpsIs4A8gAitKUpBgcnU3
 fut+7nu3xToaDpHUU3aYhRjXfEYoxDt+R0b//ANwI3Sh/QsXGD5F8iSxw8IwtJmdMtkAIJijN7l
 nj9s+2DfEWOGnFu46ZdNtwjvuHnL6jispVJ/XIunRX3IaepmNT4l1TbctutgPsGs379CqXYm
X-Proofpoint-GUID: jbKE_B01vdflzf7SlhwIQJNxAPoUNDJi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_05,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080151

Add a schema for the venus video encoder/decoder on the qcm2290.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/media/qcom,qcm2290-venus.yaml    | 127 ++++++++++++++++++
 1 file changed, 127 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
new file mode 100644
index 000000000000..0371f8dd91a3
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
@@ -0,0 +1,127 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,qcm2290-venus.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QCM2290 Venus video encode and decode accelerators
+
+maintainers:
+  - Vikash Garodia <quic_vgarodia@quicinc.com>
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
+        reg = <0x5a00000 0xf0000>;
+        interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
+
+        power-domains = <&gcc GCC_VENUS_GDSC>,
+                        <&gcc GCC_VCODEC0_GDSC>,
+                        <&rpmpd QCM2290_VDDCX>;
+        power-domain-names = "venus",
+                             "vcodec0",
+                             "cx";
+        operating-points-v2 = <&venus_opp_table>;
+
+        clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
+                 <&gcc GCC_VIDEO_AHB_CLK>,
+                 <&gcc GCC_VENUS_CTL_AXI_CLK>,
+                 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
+                 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
+                 <&gcc GCC_VCODEC0_AXI_CLK>;
+        clock-names = "core",
+                       "iface",
+                       "bus",
+                       "throttle",
+                       "vcodec0_core",
+                       "vcodec0_bus";
+
+        memory-region = <&pil_video_mem>;
+        iommus = <&apps_smmu 0x860 0x0>,
+                 <&apps_smmu 0x880 0x0>,
+                 <&apps_smmu 0x861 0x04>,
+                 <&apps_smmu 0x863 0x0>,
+                 <&apps_smmu 0x804 0xe0>;
+
+        interconnects = <&mmnrt_virt MASTER_VIDEO_P0 RPM_ALWAYS_TAG
+                         &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
+                        <&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
+                         &config_noc SLAVE_VENUS_CFG RPM_ACTIVE_TAG>;
+        interconnect-names = "video-mem",
+                             "cpu-cfg";
+
+        venus_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-133333333 {
+                opp-hz = /bits/ 64 <133333333>;
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


