Return-Path: <linux-media+bounces-33620-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7626CAC8723
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 06:03:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AADAEA2371A
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 04:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1E0B1EF09C;
	Fri, 30 May 2025 04:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VKYMIeUT"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763481DEFD9;
	Fri, 30 May 2025 04:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748577796; cv=none; b=n4r1py88o7R33HHM13LcqX9W9j2y2QKlxLQ40rl1fOJ41I/sw9YqkA5zQximb53nGsKY4AVyLD+OPt/iJM1dab4ZZFO50JgYMjHzzuTJkQ6iDf8uXSE9SxDbUBkHn46aiQJLrbvUznyxv5rsZ4l14m4COsTr98rhTvcwFHJllfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748577796; c=relaxed/simple;
	bh=QYWgsOd7CNByg/mX76M2GoNppwnTPA5nQhPXxsopQC0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=WP2i3TcW1VjprWzSQ//4LZFp1aqy4ztY77NsvgpXHZE1Q3PIe9/6/C6ppWobziiJqPMqOVZYeNl3XaSkfxFmd3FE+vkDaRKeZ7zwWqfP4vbw2JsUEYqYDMmO+9pIVly35y3rONRVnKqwhScvE78t1nAp2t114NyNGmCj9h/eft0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VKYMIeUT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54U0Mhjw031513;
	Fri, 30 May 2025 04:03:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZUmBnBiodsYdM0a2O31C8qrILUrUFfb9zBL2Xj+sdZE=; b=VKYMIeUTzBmErz1G
	2fGLYMzIHJc7M98oW/SKX1QoNCRWjX5HBJVemXpCKYJZgmSVZW1aFVXw9Z9viwET
	mnf3+0vX1ac2xSPVoyaPBwRgLD42dW5K8arCbMdQL0znepDPdqyG1VK7iuuI2d6Y
	qjfcd/CE33HG3ovZaaUFWSReh8wpGj62aNd1/2qZzr1zGBj4yHBURhFU2Xp2/OMS
	IsC7WsJE1/AXkFmAh0Q0IX+DgfOW6O985qa+1F0nhq5O8hMQd7c8xbuIuAdsx0zX
	CZbfpl4ijj1DF/N/qs7pebdcNu4rhlQt061xhs3dMEr2CxFM83VoMfkEXzKXMprc
	SAPb1g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6vjys2y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 04:03:10 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54U4398A023614
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 04:03:09 GMT
Received: from hu-renjiang-sha.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 29 May 2025 21:03:06 -0700
From: Renjiang Han <quic_renjiang@quicinc.com>
Date: Fri, 30 May 2025 09:32:14 +0530
Subject: [PATCH v8 2/3] arm64: dts: qcom: qcs615: add venus node to
 devicetree
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250530-add-venus-for-qcs615-v8-2-c0092ac616d0@quicinc.com>
References: <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
In-Reply-To: <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748577780; l=3163;
 i=quic_renjiang@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=QYWgsOd7CNByg/mX76M2GoNppwnTPA5nQhPXxsopQC0=;
 b=f6tK0GEDIwIsHA0mqDB39N3JZFdNq6zYpIV50i4Urn8d3BJVwvEjG571OIgRYp+K9JinAQ9ZJ
 JebZjon/vaeA5nhIKVirb8VFZTRaX0+N4vCmMr2yyfY3L69Tq9j3lbt
X-Developer-Key: i=quic_renjiang@quicinc.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=UOXdHDfy c=1 sm=1 tr=0 ts=68392dfe cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=Xa-eRHvFdKebgvYFA8kA:9 a=gocLtHhLMEw7F235:21 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: y-r_2l3mMBUbQOHfI6xJbwq2jAu2WHeh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDAzMSBTYWx0ZWRfX+oWhgl3hRIFU
 DWs5UmI36hO3n6cxqiX2rVQsakzmKekjfTlGhapJGh0SU/ccUtOxbeo6M0bzNP3bOtnYl5HQUEx
 +q9GUcpai3TomNKkEwKlq4EnjDKKmvH3s+LvTjl9icHvjbnaxZeAg7ChLGyKQHHj7FG1CTypcnb
 fHAqaFVHlsfUnoMvfxhVU3S74f0kjOOF3ugKgz4YK9mDurUCszHiyrRCyXZOtBc3kI33l6I5VrY
 Vs4mQ4e6d/xQJkyeCmICJOFiPg7zp0UERT/zvvNDTrOOyymcY7J1HL01MuealUdFlh1ynVVcVI6
 iOX+HI4WGT3Jj0KLCT7OrPf1H+NgIIPxNP42L+q+H9aue93IkKA44D5lWtgTJqZNXlliI+yhrlM
 wWjj+7PKCr5CnwgC5pG+OUngipMFmBwW7gJ4kKneoCGtZzuZc0OzsOrlgta7T1AAbmWcu5fV
X-Proofpoint-GUID: y-r_2l3mMBUbQOHfI6xJbwq2jAu2WHeh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_01,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=612 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505300031

Add the venus node to the devicetree for the qcs615 platform to enable
video functionality. The qcs615 platform currently lacks video
functionality due to the absence of the venus node. Fallback to sc7180 due
to the same video core.

Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 78 ++++++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index 9befd9a40113245137779d96ac4e822cb9a142c5..7d1497dab9f3266a0837a4ec0b76120dc839575f 100644
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
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "video-mem",
+					     "cpu-cfg";
+
+			iommus = <&apps_smmu 0xe60 0x20>;
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
+					required-opps = <&rpmhpd_opp_nom_l1>;
+				};
+
+				opp-460000000 {
+					opp-hz = /bits/ 64 <460000000>;
+					required-opps = <&rpmhpd_opp_turbo>;
+				};
+			};
+		};
+
 		videocc: clock-controller@ab00000 {
 			compatible = "qcom,qcs615-videocc";
 			reg = <0 0x0ab00000 0 0x10000>;

-- 
2.34.1


