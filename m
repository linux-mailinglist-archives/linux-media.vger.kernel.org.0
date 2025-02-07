Return-Path: <linux-media+bounces-25750-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1BAA2BCF9
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 08:55:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5DA33A96B4
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 07:55:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFA902343D4;
	Fri,  7 Feb 2025 07:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="V6mbAAFp"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7094A1AA1C8;
	Fri,  7 Feb 2025 07:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738914928; cv=none; b=caG97D26pKVtdCf6I22MHRdpSgujcXQtvBEoShsKOXUikqy2W5IN0EPwxF2Fzn7Ln+NCUldNadbPrHlpfvDQfNKPoa20TySjN3xvvnAx4eXqZUH2pO3Z7mjFA8G5urvDYB+CTCIJLBAShn/tCT/EQzu7Xb76fmi7Jh3r7GnkuBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738914928; c=relaxed/simple;
	bh=sBDYw/NfyioWk7vSBNe8CdtiQ5M87uDbmojbi8WgXH4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=EoOkkpMZtzFjWorHii2VP5PEja0QKlIKqfdc78MImI7egUkL8VJHezcofh2tl/O4oKlb4L5izzJHIkB0fvAenA/l4dIzkB4T3SvYkCpB1eoULEBYQelwr0l4/h3bjYrrs4daDGiFpIAX1oN9V0nAjH4AQcTym4wQkTdDJTyEX74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=V6mbAAFp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51730E13016280;
	Fri, 7 Feb 2025 07:55:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yLAjX6P2CDz/N4iMFPGfkTGd4y3/euksP/er+yOPZuQ=; b=V6mbAAFpB5dCZvRG
	aK5JlwWGYGHkHtUEZ96DJkUXQnMgGoInxFF9mb5brnjWC9cyZeuv/eKd/qqT7w6k
	rMFgW4WLMCwvzLSVD6Afdoqm2x5bH41XEGC/c7wRI6CdYWyfWHLpjKzBI4t2ozKk
	2bOHq5HAdb2rZbKK9ypK8AXLNDVy5aKtP9h/CuvBeii1rp9dwOCx7XGNU69qyTzt
	+sg7jyK5Fyp6RrYKFt2ysAo59ojicGN5g0Z+Gq429PMKpC/15judh+0wJEuimd/j
	FdzgEoPtaelAwWS3iqY3RrQJ6MLW99u5nLgJl1mTNLF9jN18N2wNd1mwWzoYp+VG
	4d7gYg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44n9vq0n2a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Feb 2025 07:55:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5177t7Wr006339
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Feb 2025 07:55:07 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 6 Feb 2025 23:55:00 -0800
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 7 Feb 2025 13:24:41 +0530
Subject: [PATCH v10 01/28] dt-bindings: media: Add video support for QCOM
 SM8550 SoC
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250207-qcom-video-iris-v10-1-ab66eeffbd20@quicinc.com>
References: <20250207-qcom-video-iris-v10-0-ab66eeffbd20@quicinc.com>
In-Reply-To: <20250207-qcom-video-iris-v10-0-ab66eeffbd20@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: Hans Verkuil <hverkuil@xs4all.nl>,
        Sebastian Fricke
	<sebastian.fricke@collabora.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Nicolas Dufresne
	<nicolas@ndufresne.ca>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>,
        Jianhua Lu <lujianhua000@gmail.com>,
        "Stefan
 Schmidt" <stefan.schmidt@linaro.org>,
        Joel Stanley <joel@jms.id.au>, "Johan
 Hovold" <johan@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738914892; l=5436;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=sBDYw/NfyioWk7vSBNe8CdtiQ5M87uDbmojbi8WgXH4=;
 b=oBg6m9gmM7es9uO/KOPs33YMpmjh5hw2fwRHpx+MhsTa45ZWnmN6xQXqfcgORVA9Y5SrsZeFW
 ZMQD8boyikFCkh1RDd3RJkSHfeXRVY4xonlzp6khSOwKUSgDc/GxtKl
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: It602GegiUJC788ENppGi5YU9dHupD_M
X-Proofpoint-ORIG-GUID: It602GegiUJC788ENppGi5YU9dHupD_M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_03,2025-02-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 phishscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 mlxlogscore=999 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502070059

Introduce support for Qualcomm new video acceleration hardware i.e.
iris, used for video stream decoding and encoding on QCOM SM8550 SoC.

Cc: devicetree@vger.kernel.org
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Stefan Schmidt <stefan.schmidt@linaro.org> # x1e80100 (Dell XPS 13 9345)
Reviewed-by: Stefan Schmidt <stefan.schmidt@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 .../bindings/media/qcom,sm8550-iris.yaml           | 158 +++++++++++++++++++++
 1 file changed, 158 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
new file mode 100644
index 000000000000..e424ea84c211
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
@@ -0,0 +1,158 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm iris video encode and decode accelerators
+
+maintainers:
+  - Vikash Garodia <quic_vgarodia@quicinc.com>
+  - Dikshita Agarwal <quic_dikshita@quicinc.com>
+
+description:
+  The iris video processing unit is a video encode and decode accelerator
+  present on Qualcomm platforms.
+
+allOf:
+  - $ref: qcom,venus-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,sm8550-iris
+
+  power-domains:
+    maxItems: 4
+
+  power-domain-names:
+    items:
+      - const: venus
+      - const: vcodec0
+      - const: mxc
+      - const: mmcx
+
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: iface
+      - const: core
+      - const: vcodec0_core
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: cpu-cfg
+      - const: video-mem
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: bus
+
+  iommus:
+    maxItems: 2
+
+  dma-coherent: true
+
+  operating-points-v2: true
+
+  opp-table:
+    type: object
+
+required:
+  - compatible
+  - power-domain-names
+  - interconnects
+  - interconnect-names
+  - resets
+  - reset-names
+  - iommus
+  - dma-coherent
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/clock/qcom,sm8550-gcc.h>
+    #include <dt-bindings/clock/qcom,sm8450-videocc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,sm8550-rpmh.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    video-codec@aa00000 {
+        compatible = "qcom,sm8550-iris";
+        reg = <0x0aa00000 0xf0000>;
+        interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+        power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+                        <&videocc VIDEO_CC_MVS0_GDSC>,
+                        <&rpmhpd RPMHPD_MXC>,
+                        <&rpmhpd RPMHPD_MMCX>;
+        power-domain-names = "venus", "vcodec0", "mxc", "mmcx";
+
+        clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+                 <&videocc VIDEO_CC_MVS0C_CLK>,
+                 <&videocc VIDEO_CC_MVS0_CLK>;
+        clock-names = "iface", "core", "vcodec0_core";
+
+        interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+                         &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ALWAYS>,
+                        <&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
+                         &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+        interconnect-names = "cpu-cfg", "video-mem";
+
+        memory-region = <&video_mem>;
+
+        resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
+        reset-names = "bus";
+
+        iommus = <&apps_smmu 0x1940 0x0000>,
+                 <&apps_smmu 0x1947 0x0000>;
+        dma-coherent;
+
+        operating-points-v2 = <&iris_opp_table>;
+
+        iris_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-240000000 {
+                opp-hz = /bits/ 64 <240000000>;
+                required-opps = <&rpmhpd_opp_svs>,
+                                <&rpmhpd_opp_low_svs>;
+            };
+
+            opp-338000000 {
+                opp-hz = /bits/ 64 <338000000>;
+                required-opps = <&rpmhpd_opp_svs>,
+                                <&rpmhpd_opp_svs>;
+            };
+
+            opp-366000000 {
+                opp-hz = /bits/ 64 <366000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_svs_l1>;
+            };
+
+            opp-444000000 {
+                opp-hz = /bits/ 64 <444000000>;
+                required-opps = <&rpmhpd_opp_turbo>,
+                                <&rpmhpd_opp_turbo>;
+            };
+
+            opp-533333334 {
+                opp-hz = /bits/ 64 <533333334>;
+                required-opps = <&rpmhpd_opp_turbo_l1>,
+                                <&rpmhpd_opp_turbo_l1>;
+            };
+        };
+    };
+...

-- 
2.34.1


