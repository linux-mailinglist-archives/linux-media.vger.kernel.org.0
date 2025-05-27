Return-Path: <linux-media+bounces-33418-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F362FAC46DF
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 05:33:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 409F33B55DC
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 03:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADB0E1DEFDA;
	Tue, 27 May 2025 03:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NKcbVzSm"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E1E1D63F2;
	Tue, 27 May 2025 03:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748316802; cv=none; b=GeS+bM1VMq+X8Ch0I1TbXo0lGKBnXFOtnCbOWyoE1ja8CZWmXDFT479pxP3F+QokM2TX6DFBHBDOO/ytZNiQtvFkp6hVmeRKyWc7h3hstcGHWRYb5YiQ2e6KtvCNDjaV1g/mRbbH9HC6rugFEd+A6rEs+mN5qSuELCDJpNVxP8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748316802; c=relaxed/simple;
	bh=rEmvbZ/8iQsXRYcWGZECQiI6jr38chSJECvJmtug07Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=G8h0Qn/Zwvd9wifJKwvR61EVHRNJE+T5Oi5ol3XnegMVwKwVmnvuXbDpMiW9R0IwP1mNn2TC3LewhuX8qlNghNsAE/QF7xYhKEztNQ9CJZhxcpQsyRqMs4c9Xz6MPO88BinfVrHBpdTHAsWDoKqZJwsHJVM9YbWpsVhcPm2iR3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NKcbVzSm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54Q9wq6T005281;
	Tue, 27 May 2025 03:33:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	najQCIcOB+75VRrZiInwW6SSgrJGtWf/1i7YPh6ondc=; b=NKcbVzSm6FQYF2cG
	fj1oKrUM448CuZ6YFtB0aOdNecKnbh16ats+R5Kz3r3RL7vMkCIZpzLVnWAM6J8g
	nEFXnDnCU6ux9Uo/vQdSCzUKtKR+uX28YxBujhEdY259qEGb164siGVy6ts53xH1
	pLqNa0sUy7qcUnziMAboPnIhhQP2XfLFFDpFXkDDX2r59YWutXRMJn6fEKOOoPyM
	zfgrYsz206SPDNUwXU9YJnw2HGc2n5Xgc4uk1k3hsN26IWE+SuwChukCYqvgD2he
	hSJ+zRASjBEZrEzEaViJJOqbl5EQ7Wx3xB5R74u8Od/Z6io1JBxqk0L+/qNgs6P3
	Np26sA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u79p5gv6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 May 2025 03:33:16 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54R3XFqJ003523
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 May 2025 03:33:15 GMT
Received: from hu-renjiang-sha.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 26 May 2025 20:33:12 -0700
From: Renjiang Han <quic_renjiang@quicinc.com>
Date: Tue, 27 May 2025 09:02:26 +0530
Subject: [PATCH v7 2/3] arm64: dts: qcom: qcs615: add venus node to
 devicetree
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250527-add-venus-for-qcs615-v7-2-cca26e2768e3@quicinc.com>
References: <20250527-add-venus-for-qcs615-v7-0-cca26e2768e3@quicinc.com>
In-Reply-To: <20250527-add-venus-for-qcs615-v7-0-cca26e2768e3@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Renjiang Han
	<quic_renjiang@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748316786; l=3155;
 i=quic_renjiang@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=rEmvbZ/8iQsXRYcWGZECQiI6jr38chSJECvJmtug07Q=;
 b=wl8uLmSQiF2DZuj38e7ewZxZDcgjoPNS8vTzWCwyuyzzCMAgeCktKFULA08MlYREPzRQlV8vf
 40bf0ZdjZrjB03cnET7Y9hCXQ2W1DOSWZs0GORRJzSB1z/gDJWa9zxe
X-Developer-Key: i=quic_renjiang@quicinc.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: N7PggFcSAICN116n2MF2ie6R6RybtlYc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDAyNiBTYWx0ZWRfX6+whTqY4cv4G
 xb4rxpdvsgtOrUpx/tfekeJB/82CY4ui9OMCka7Tw4clWKp5iVG+YJO48oRllZV00r5N50LxZA9
 x3aQe1ZGFCg28R8SDlkxcn/z6fXU6TLPBut+31OZGxdvr393V8NYFook4XRjIq0yVItQUTuaC5y
 nKtv6W6yALTxqgdU2nIzss34tt6OrXA8m3Guaka5J4F820dbhG0OVfRA2q+hQWt9IO7uOOD1Pqq
 snk11c2jlA07JD6pjNrPtevxmiL5jqyjeqYDWQjnn5uqLQ+5btIWnxgj32xlsYTIJzdRXtM9Lqo
 NopDL7Kw2KeJYvQkaVHABUQRukygMO3q0AsJ7s1PfOHgtiVQ1e8AXZKjQSk0vhWrpZGypC0E0F2
 hPa7R8XxlPIlS2/03cx7ZxPvaFeseIr06lSrzz5T4LqbIfA0i0yhNu9EFevFr8rD1Nx7L/55
X-Authority-Analysis: v=2.4 cv=HNnDFptv c=1 sm=1 tr=0 ts=6835327c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=Xa-eRHvFdKebgvYFA8kA:9 a=ASTm1FE8bQofcbXp:21 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: N7PggFcSAICN116n2MF2ie6R6RybtlYc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_02,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=576 phishscore=0 mlxscore=0 spamscore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270026

Add the venus node to the devicetree for the qcs615 platform to enable
video functionality. The qcs615 platform currently lacks video
functionality due to the absence of the venus node. Fallback to sc7180 due
to the same video core.

Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 78 ++++++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index 9befd9a40113245137779d96ac4e822cb9a142c5..a6cb7c5e4e76899a3c12f8c7656d0cf66db43895 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -449,6 +449,11 @@ smem_region: smem@86000000 {
 			no-map;
 			hwlocks = <&tcsr_mutex 3>;
 		};
+
+		pil_video_mem: pil-video@93400000 {
+			reg = <0x0 0x93400000 0x0 0x500000>;
+			no-map;
+		};
 	};
 
 	soc: soc@0 {
@@ -3253,6 +3258,79 @@ gem_noc: interconnect@9680000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		venus: video-codec@aa00000 {
+			compatible = "qcom,qcs615-venus", "qcom,sc7180-venus";
+			reg = <0x0 0x0aa00000 0x0 0x100000>;
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&videocc VIDEO_CC_VENUS_CTL_CORE_CLK>,
+				 <&videocc VIDEO_CC_VENUS_AHB_CLK>,
+				 <&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>,
+				 <&videocc VIDEO_CC_VCODEC0_CORE_CLK>,
+				 <&videocc VIDEO_CC_VCODEC0_AXI_CLK>;
+			clock-names = "core",
+				      "iface",
+				      "bus",
+				      "vcodec0_core",
+				      "vcodec0_bus";
+
+			power-domains = <&videocc VENUS_GDSC>,
+					<&videocc VCODEC0_GDSC>,
+					<&rpmhpd RPMHPD_CX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "cx";
+
+			operating-points-v2 = <&venus_opp_table>;
+
+			interconnects = <&mmss_noc MASTER_VIDEO_P0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "video-mem",
+					     "cpu-cfg";
+
+			iommus = <&apps_smmu 0xe40 0x20>;
+
+			memory-region = <&pil_video_mem>;
+
+			status = "disabled";
+
+			venus_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-133330000 {
+					opp-hz = /bits/ 64 <133330000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-380000000 {
+					opp-hz = /bits/ 64 <380000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+
+				opp-410000000 {
+					opp-hz = /bits/ 64 <410000000>;
+					required-opps = <&rpmhpd_opp_turbo>;
+				};
+
+				opp-460000000 {
+					opp-hz = /bits/ 64 <460000000>;
+					required-opps = <&rpmhpd_opp_turbo_l1>;
+				};
+			};
+		};
+
 		videocc: clock-controller@ab00000 {
 			compatible = "qcom,qcs615-videocc";
 			reg = <0 0x0ab00000 0 0x10000>;

-- 
2.34.1


