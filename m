Return-Path: <linux-media+bounces-30829-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E0FA99466
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 18:14:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 619131BA79B6
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 15:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9CEC2C1E22;
	Wed, 23 Apr 2025 15:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TzgZM2qA"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13C52C17B5;
	Wed, 23 Apr 2025 15:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745422792; cv=none; b=ON6xqGkw0jddGrFMpJHszcckLbmfYUCp2usqgNczJzP6GbvRCkkjzBn+uJyuWFaasA2mxHXFcfOoOYrSrlX50wPUe69PeE2pDdCP3FaZe7YQbPsr3nUea45ZC/tnKXkFH0GT/U9W0Vj3wlpdtg3B/cfJYcUjLImnUt+zcZcG6UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745422792; c=relaxed/simple;
	bh=ljh29i1lbPV8eBJD87ZuVb9gALLN2MJpzbh2M/ZeJdw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=CZE+R8I+9r++4l8Apsstq5DZPUB6JWkssNbNLxx5vk0p0KotGn7Q/v5UafDJBG8a7x4MOYDtJ8Tk83EXOajH7vBfQAlQYfSbZnsaIrz66rJT2+cjpvE68E/R/Mfi8w95MezClqIxA9ngyFSIPXLym0ZR4JziL7rLHnb9ReSWL0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TzgZM2qA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAbiDR024110;
	Wed, 23 Apr 2025 15:39:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lS5I/aeA8KBq163Rb4Fwi1w1uuJfq6wc7C6e0yYkH8I=; b=TzgZM2qAUtFwoX5w
	qjapbci1fMG2WwAckQuhl8VFpOKIESJYL1E2pdrqCwqVzxHsk1QpWuSU8fqx3HnF
	d4XjqsiZbanDRy4Mtdbf8YuWk6b8BrcfmVvVCJwUnStTQS+/DYnMn+jYOU6GKAmw
	WVnoZOOU2HKucnRNIekOLORYIeNNinctXtb8ZUf/tg4KekQx7nI4FFHWbxTxt8iA
	ZhQynUd9wwJ8R1BjEb5uYHff3ELwsivvXZhRG55TlW+s/OiQxdeb0s6u6EdotSTx
	7IKBDmln/Ud6iFS3pSRu2cqOc2CfNTV0wJsB62kIkdVZTPOaQVlrzvmY3EgVmp0r
	R3TVmg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3akka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 15:39:47 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53NFdl1l030609
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 15:39:47 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 23 Apr 2025 08:39:43 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Wed, 23 Apr 2025 21:09:11 +0530
Subject: [PATCH v3 3/4] arm64: dts: qcom: qcs8300: add support for video
 node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250423-qcs8300_iris-v3-3-d7e90606e458@quicinc.com>
References: <20250423-qcs8300_iris-v3-0-d7e90606e458@quicinc.com>
In-Reply-To: <20250423-qcs8300_iris-v3-0-d7e90606e458@quicinc.com>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
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
        Vikash Garodia
	<quic_vgarodia@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745422770; l=2668;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=ljh29i1lbPV8eBJD87ZuVb9gALLN2MJpzbh2M/ZeJdw=;
 b=zVECletC0v0F1hXUsGip0tuDYfCXsSgBrpZ0LU5WAnNdQK95AafpoYHRtvoRyFJ/jfGOXhWD5
 dE1lTZtrsAPDx1vpTa9MLoutLD4/cYuFbzmjaULTi7mKX+/RmcmOJyk
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: PzlGzLDIe38ERW2VbSiTBIu1uWgS5dio
X-Proofpoint-GUID: PzlGzLDIe38ERW2VbSiTBIu1uWgS5dio
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDExMCBTYWx0ZWRfX3YjBm6PQVWhq ++fuuCxuBoqxUC06AX2FEOodgjq7QzsPjH1qOrQlxK+kDs8U3FifO8j8HqJ2tTKp2TP/ts0mtDG Zvg2NLzrat8xDVZBthkx7atXGS8DXb7ov2aGVNIiXoMzEgnBVLMIknsUumQaodtCxd6ggKwbYK8
 NxYCCHzmrlPZ+8HEY0yaNM3B5l0p7no7lTx3N3xDf+f92pHCnSBhvwF+O0/D/UarNSmfKNT7JNj H+ZewEVpQPcZXjXYlYHDwvICkyjEAy3lMAlFYAsiIyzAANNZl38V/dyB5fzPxQHVa3x9+5KlZ8q SvQB3P3XYeSYuihk9VytezrsC0ZMv163HAiTZAe9cF5htJvSKFN8Jx1xM7SuB1ADt0wPAfv+STY
 u6j0L2DWLOtr99BMsd2SxinZEDHwFfRefzFDkkqFgOgWVdkL4x+uJIserS6xu6M6PZT7/fzn
X-Authority-Analysis: v=2.4 cv=Mepsu4/f c=1 sm=1 tr=0 ts=680909c3 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=gsePXWo3U9w2I85xqPwA:9
 a=-MVX0H8OmFgSA6gq:21 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_09,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230110

Add the IRIS video-codec node on QCS8300.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 71 +++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index 4a057f7c0d9fae0ebd1b3cf3468746b382bc886b..158779434f610b10ea82d2cdae08090a7a4402de 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -2929,6 +2929,77 @@ usb_2_dwc3: usb@a400000 {
 			};
 		};
 
+		iris: video-codec@aa00000 {
+			compatible = "qcom,qcs8300-iris";
+
+			reg = <0x0 0x0aa00000 0x0 0xf0000>;
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+					<&videocc VIDEO_CC_MVS0_GDSC>,
+					<&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_MMCX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mxc",
+					     "mmcx";
+
+			operating-points-v2 = <&iris_opp_table>;
+
+			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>;
+			clock-names = "iface",
+				      "core",
+				      "vcodec0_core";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_VIDEO_P0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-cfg",
+					     "video-mem";
+
+			memory-region = <&video_mem>;
+
+			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
+			reset-names = "bus";
+
+			iommus = <&apps_smmu 0x0880 0x0400>,
+				 <&apps_smmu 0x0887 0x0400>;
+			dma-coherent;
+
+			status = "disabled";
+
+			iris_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-366000000 {
+					opp-hz = /bits/ 64 <366000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000>;
+					required-opps = <&rpmhpd_opp_nom>,
+							<&rpmhpd_opp_nom>;
+				};
+
+				opp-533333334 {
+					opp-hz = /bits/ 64 <533333334>;
+					required-opps = <&rpmhpd_opp_turbo>,
+							<&rpmhpd_opp_turbo>;
+				};
+
+				opp-560000000 {
+					opp-hz = /bits/ 64 <560000000>;
+					required-opps = <&rpmhpd_opp_turbo_l1>,
+							<&rpmhpd_opp_turbo_l1>;
+				};
+			};
+		};
+
 		videocc: clock-controller@abf0000 {
 			compatible = "qcom,qcs8300-videocc";
 			reg = <0x0 0x0abf0000 0x0 0x10000>;

-- 
2.34.1


