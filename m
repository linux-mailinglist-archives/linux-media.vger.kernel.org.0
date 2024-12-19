Return-Path: <linux-media+bounces-23765-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE629F7416
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 06:44:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D15F8188C0DA
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 05:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3858521770E;
	Thu, 19 Dec 2024 05:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YtWnF08n"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD1A217657;
	Thu, 19 Dec 2024 05:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734586950; cv=none; b=JXABS1uzDByINx1g6PDL73Y29JFYu4cXapr2m0Gie9nkNsS3EYJ7xh1jgq7SvsOhj0yCEPwBdT+jYApb4M7+IgCbaNuu/QA0axDfzKNkdA9a+/fEy/RCckKD9F2YH6RQLIrh0ZmfBGUL5nJJtfLdy7zS+RJIG0duVzZegD88V14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734586950; c=relaxed/simple;
	bh=MwcPFLWKasXCraPczL+0Aqnwq6fomCVk51E5cEgKDYk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=USaS+PbLKniyAPF2/WT7RlG8mK1cKd6U2d9LW0aa5akwAqRh8yXmGu+BsGVeGi7dr3lXxeV1r7eBd20e82T32FBOpYPQu3CXKa0ziVt1wyFk17li8liReiHVV4YGc2ouP42+tuO45EcNCo+3lGLRtc5eOanhOdttJ040uE5XHag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YtWnF08n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BIGR1rI000501;
	Thu, 19 Dec 2024 05:42:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CW+mGabla1LIoGyHWkbTbyAzKKAjinbAPEAVvN+GeIs=; b=YtWnF08nZaEM/Rxk
	ibjwb1LoJuJr/Y3aK/+be1oDCmSMKh6UcSsGWybdaucF1U9GHII/81SeBIK1ereV
	R/jiaSit8bYhlmQwkG3iKCiujb4WBY/S8JgkuYxrFsoJVWNu/Oa2wuZYMCn0SPO0
	R0KG8M2lFh6HaF34WRA1tf3A/G4Bu0DgtVvUUBTq7/0eadLgL9WFgJJGbICVapJU
	xd6W8nPaX7ImvTrGaRFb62xxSNes/oDwkpLpl8GedSl+67oUdxu2TvSWNbckmGc0
	OBcydZZE5jFMdu7LnS4syxkTVSoMQRnBj/DchES7+NsQHtwZ5YFFD5gCFTlUh6d1
	StgrDA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43m0su9ted-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 05:42:24 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BJ5gNpb002890
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 05:42:23 GMT
Received: from hu-renjiang-sha.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 18 Dec 2024 21:42:20 -0800
From: Renjiang Han <quic_renjiang@quicinc.com>
Date: Thu, 19 Dec 2024 11:11:55 +0530
Subject: [PATCH v6 3/4] arm64: dts: qcom: qcs615: add venus node to
 devicetree
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241219-add-venus-for-qcs615-v6-3-e9a74d3b003d@quicinc.com>
References: <20241219-add-venus-for-qcs615-v6-0-e9a74d3b003d@quicinc.com>
In-Reply-To: <20241219-add-venus-for-qcs615-v6-0-e9a74d3b003d@quicinc.com>
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
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Renjiang Han
	<quic_renjiang@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734586930; l=3154;
 i=quic_renjiang@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=MwcPFLWKasXCraPczL+0Aqnwq6fomCVk51E5cEgKDYk=;
 b=K8PvaJ28mmN7Z1W9i077lmA6xgCRi0i2L7cLzv4iVG3qaFPFEyxnBSGFzhaoQWeiePisrmdwL
 l2OK/IfStI8DaS1LjYUk7aOoyH2+pvI6xjPpgnkAhAv5wIgPYondtWV
X-Developer-Key: i=quic_renjiang@quicinc.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: X0MUs2Uda_gAvui04vMhmlC3rVCfeHNU
X-Proofpoint-ORIG-GUID: X0MUs2Uda_gAvui04vMhmlC3rVCfeHNU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=546 spamscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 phishscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412190043

Add the venus node to the devicetree for the qcs615 platform to enable
video functionality. The qcs615 platform currently lacks video
functionality due to the absence of the venus node. Fallback to sc7180 due
to the same video core.

Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 78 ++++++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index 872de9ab8f38d64e8f979bf3af8f122f8ff075d8..174d0a459a3c15defaebef16c7586dcda8618590 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -427,6 +427,11 @@ smem_region: smem@86000000 {
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
@@ -2807,6 +2812,79 @@ gem_noc: interconnect@9680000 {
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
 			reg = <0 0xab00000 0 0x10000>;

-- 
2.34.1


