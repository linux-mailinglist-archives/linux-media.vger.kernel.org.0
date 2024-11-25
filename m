Return-Path: <linux-media+bounces-21917-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEC89D7B37
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 06:35:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1D1F162E55
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 05:35:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9702118130D;
	Mon, 25 Nov 2024 05:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gWOhbcUI"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712181714B3;
	Mon, 25 Nov 2024 05:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732512921; cv=none; b=a+NPZP6LzzC9bcX+8v8offYz5ks2KsNwfoWf5/CZzS2DEhO9i+xDSJl5l/iojv18eQ+aPV/LcS1v1F/TVtwiJNwnUibdGjGSWMvv4feX1JrfQG+0XOMdq34++t0/9I5Lak1n2KjKM9bIxjtPJlL76b9rnkxmiT/rIREuuNs/0V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732512921; c=relaxed/simple;
	bh=kcQrYPqIrfhZYQzT9N77XpVrwqSiThU0H+jWfVuRiE4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=gQd/m37FeX5LtnhWT5HaJgs53EOgHAyGQaCpWBK4YMTVV4AfpFISzOu3agSOWsxVHY/rFTC9BHejgAmf+wgCnBcXeEBZW613EBaIvb8Ym6g0lOO1E3ACJrZ/WKok/z28PJ6SbeIXC59jotGyDRBSYXz4Ih0LYeluGq++AR4bggU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gWOhbcUI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AP0iOtf006692;
	Mon, 25 Nov 2024 05:35:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TcUyi+pznnQBKD8Kg7OGttepW6+uyJWd6n56pmY2aJw=; b=gWOhbcUIGecjPHLr
	mqyO5QOC2kGWdqvC3Q/Ba3L8APl3a5BNbmMdOyyUI9yB0CdmfYURzvvE5j7dv84p
	KOcb+HeMrFYc33aOM+awmcRACNJKdSPHtHl3IheLQ214EDmb7mNJ6DS2DC1ekB9f
	mS12LCrRK3WId1/jiTFAzQ7RCfl9F/5LibER6hTeSJeLngihVp/JF13wXU85M9Z+
	wMpqmq81t5qGxnQMI2nh5XVo0cAluTe+SnLF87TcqUxJWUmdeBDwm4TACs86ifgh
	0izi8Sta+qZ2hRuofMcMxXmt+e9kBMTO/y1S28gheFDHXMtiYtT1v2cTw+Ekp4pq
	6XlTUQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4334rd3pgq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 05:35:14 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AP5ZDk4014840
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 05:35:13 GMT
Received: from hu-renjiang-sha.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 24 Nov 2024 21:35:10 -0800
From: Renjiang Han <quic_renjiang@quicinc.com>
Date: Mon, 25 Nov 2024 11:04:49 +0530
Subject: [PATCH v3 1/4] dt-bindings: qcom,qcs615-venus: add support for
 video hardware
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241125-add-venus-for-qcs615-v3-1-5a376b97a68e@quicinc.com>
References: <20241125-add-venus-for-qcs615-v3-0-5a376b97a68e@quicinc.com>
In-Reply-To: <20241125-add-venus-for-qcs615-v3-0-5a376b97a68e@quicinc.com>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Renjiang Han
	<quic_renjiang@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732512906; l=5294;
 i=quic_renjiang@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=kcQrYPqIrfhZYQzT9N77XpVrwqSiThU0H+jWfVuRiE4=;
 b=5SL4Bgb5R3BjBTYy5VuKyMPr7fNzSnAHxLxp4ZlIhelMkQIauro6Srcpp4ruwq0DN31n4LE2e
 Q364X2RhmICDpUoabFFi88HHOMccdgQQJaQHIkk7W70qGpM7LVhVpHk
X-Developer-Key: i=quic_renjiang@quicinc.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: sHtG1_pa9Myb1Bvw8gd5BySbBY7NvW3K
X-Proofpoint-GUID: sHtG1_pa9Myb1Bvw8gd5BySbBY7NvW3K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 mlxlogscore=955
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411250045

Add support for Qualcomm video acceleration hardware used for video
stream decoding and encoding on QCOM QCS615.

Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
---
 .../bindings/media/qcom,qcs615-venus.yaml          | 182 +++++++++++++++++++++
 1 file changed, 182 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcs615-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcs615-venus.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..7a3a01ff06d8b62bc2424a0a24857c86c6865f89
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,qcs615-venus.yaml
@@ -0,0 +1,182 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,qcs615-venus.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QCS615 Venus video encode and decode accelerators
+
+maintainers:
+  - Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
+  - Vikash Garodia <quic_vgarodia@quicinc.com>
+
+description:
+  The Venus IP is a video encode and decode accelerator present
+  on Qualcomm platforms
+
+allOf:
+  - $ref: qcom,venus-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,qcs615-venus
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
+    maxItems: 5
+
+  clock-names:
+    items:
+      - const: core
+      - const: iface
+      - const: bus
+      - const: vcodec0_core
+      - const: vcodec0_bus
+
+  iommus:
+    maxItems: 1
+
+  memory-region:
+    maxItems: 1
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
+
+  opp-table:
+    type: object
+
+  video-decoder:
+    type: object
+
+    additionalProperties: false
+
+    properties:
+      compatible:
+        const: venus-decoder
+
+    required:
+      - compatible
+
+  video-encoder:
+    type: object
+
+    additionalProperties: false
+
+    properties:
+      compatible:
+        const: venus-encoder
+
+    required:
+      - compatible
+
+required:
+  - compatible
+  - power-domain-names
+  - iommus
+  - video-decoder
+  - video-encoder
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,qcs615-videocc.h>
+    #include <dt-bindings/interconnect/qcom,qcs615-rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    venus: video-codec@aa00000 {
+        compatible = "qcom,qcs615-venus";
+        reg = <0xaa00000 0x100000>;
+        interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+        clocks = <&videocc VIDEO_CC_VENUS_CTL_CORE_CLK>,
+                 <&videocc VIDEO_CC_VENUS_AHB_CLK>,
+                 <&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>,
+                 <&videocc VIDEO_CC_VCODEC0_CORE_CLK>,
+                 <&videocc VIDEO_CC_VCODEC0_AXI_CLK>;
+        clock-names = "core",
+                      "iface",
+                      "bus",
+                      "vcodec0_core",
+                      "vcodec0_bus";
+
+        power-domains = <&videocc VENUS_GDSC>,
+                        <&videocc VCODEC0_GDSC>,
+                        <&rpmhpd RPMHPD_CX>;
+        power-domain-names = "venus",
+                             "vcodec0",
+                             "cx";
+
+        operating-points-v2 = <&venus_opp_table>;
+
+        interconnects = <&mmss_noc MASTER_VIDEO_P0 0
+                         &mc_virt SLAVE_EBI1 0>,
+                        <&gem_noc MASTER_APPSS_PROC 0
+                         &config_noc SLAVE_VENUS_CFG 0>;
+        interconnect-names = "video-mem",
+                             "cpu-cfg";
+
+        iommus = <&apps_smmu 0xe40 0x20>;
+
+        memory-region = <&pil_video_mem>;
+
+        video-decoder {
+            compatible = "venus-decoder";
+        };
+
+        video-encoder {
+            compatible = "venus-encoder";
+        };
+
+        venus_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-133330000 {
+                opp-hz = /bits/ 64 <133330000>;
+                required-opps = <&rpmhpd_opp_low_svs>;
+            };
+
+            opp-240000000 {
+                opp-hz = /bits/ 64 <240000000>;
+                required-opps = <&rpmhpd_opp_svs>;
+            };
+
+            opp-300000000 {
+                opp-hz = /bits/ 64 <300000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>;
+            };
+
+            opp-380000000 {
+                opp-hz = /bits/ 64 <380000000>;
+                required-opps = <&rpmhpd_opp_nom>;
+            };
+
+            opp-410000000 {
+                opp-hz = /bits/ 64 <410000000>;
+                required-opps = <&rpmhpd_opp_turbo>;
+            };
+
+            opp-460000000 {
+                opp-hz = /bits/ 64 <460000000>;
+                required-opps = <&rpmhpd_opp_turbo_l1>;
+            };
+        };
+    };

-- 
2.34.1


