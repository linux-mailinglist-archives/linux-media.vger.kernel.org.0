Return-Path: <linux-media+bounces-21306-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0819C56F3
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 12:49:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D3041F22214
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 11:49:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAA8C1F7791;
	Tue, 12 Nov 2024 11:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cYBzTThC"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D611CD1EF;
	Tue, 12 Nov 2024 11:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731412147; cv=none; b=nCAAoOSqFDPGOUPKzXmTfmBnqB8lZKf/fc+mIA0yI7keZrlJTGHLSSpAcNiqvdlIbNi9n+jQIsbsKrE/0/gEbH6ZMv8jCw9YVONCkcMxj/YEBn1IHje2zRI+fXjRZrt1IMDWfGS/pY6POiDqrOwFyzEn6UYaF9D4Vvt3ZmQ6q30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731412147; c=relaxed/simple;
	bh=IriwWS4wdD6u5IUmRGxXp3MpJSmb0CFqFVFONdvVSJc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=hl/2JrYfZm0/x0+9dix3R7wse+o0i6KHu/25S8FXLZz83Wvw28SRtnv4WIlGthSjs4LtWkdyQE9RmgPAkrtfDQA/E79Lzr+YlI152JGeapg1dIYL4Ap0z2LSWTqO5oxCGD0TEuZv0aqp1UoRN2vjvHkZcKAektkD4/ztS1l+lcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cYBzTThC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AC30Jre028247;
	Tue, 12 Nov 2024 11:49:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1uvz65KXF25mqIkkd4RbM3jW5eDwI61YZ/JhZAzIqNw=; b=cYBzTThCJxAFylKn
	PiedVA6au4wzGhp07cnYjvgryzjSmWR/zAXfZBC2Pf7+ZZOkV/eDL1NpoLfvKAR/
	2iTWE9JFRUrny28gpIB/rk8wcKfMRJ29iN4NNDxn47Dtdg5mC1A3xF2qy/O3wMAO
	pm5yV/IP9WSzLuxreGDq2ci8sznKAi0fmLmnJHuD1a3fJjvCTsFabI+p/okrf2RC
	jIEiANvR/xA1qhOyRHPtb4MHmsDoKyahFPpYjq+6LYyP5MgCqALsNQC/XJN2SP52
	qJCuaZzMjRYHBKx9RHNwVAbiJskrTcdvibivEUiTSCZ66kyWY58Mm4gAxzYcApjQ
	nJ5tjA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42t11872f1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 11:49:00 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ACBn0we028725
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 11:49:00 GMT
Received: from hu-renjiang-sha.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 12 Nov 2024 03:48:56 -0800
From: Renjiang Han <quic_renjiang@quicinc.com>
Date: Tue, 12 Nov 2024 17:17:57 +0530
Subject: [PATCH v2 1/4] dt-bindings: qcom,qcs615-venus: document QCS615
 venus
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241112-add-venus-for-qcs615-v2-1-e67947f957af@quicinc.com>
References: <20241112-add-venus-for-qcs615-v2-0-e67947f957af@quicinc.com>
In-Reply-To: <20241112-add-venus-for-qcs615-v2-0-e67947f957af@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731412132; l=5293;
 i=quic_renjiang@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=IriwWS4wdD6u5IUmRGxXp3MpJSmb0CFqFVFONdvVSJc=;
 b=WLRmWG3bZTdWxKNvHJtaVT2YwTG+iTqkkZGB0R1qQvS9qD70Ryhg/7zumRe91Mey488sc2Rjv
 Q7R0Ft9l0unCTtZFhN2qrA0cDY9MA02pZ6vhnh5oaVAQrBEQ9x4UXMd
X-Developer-Key: i=quic_renjiang@quicinc.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: lytVdD1OjRhMDIUryrcL061UvDGpNOCw
X-Proofpoint-GUID: lytVdD1OjRhMDIUryrcL061UvDGpNOCw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 bulkscore=0 mlxlogscore=928 lowpriorityscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411120095

Add support for Qualcomm video acceleration hardware used for video
stream decoding and encoding on QCOM QCS615.

Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
---
 .../bindings/media/qcom,qcs615-venus.yaml          | 181 +++++++++++++++++++++
 1 file changed, 181 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcs615-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcs615-venus.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..a807f4c7e94c635ef1662971b687db9bdce1b74a
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,qcs615-venus.yaml
@@ -0,0 +1,181 @@
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
+description: |
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
+    additionalProperties: false
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


