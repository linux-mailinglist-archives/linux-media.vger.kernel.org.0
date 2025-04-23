Return-Path: <linux-media+bounces-30872-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E77A9989A
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 21:35:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F3135A041D
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 19:34:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AD6C296155;
	Wed, 23 Apr 2025 19:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IrdmOAwT"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4959D293469;
	Wed, 23 Apr 2025 19:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745436859; cv=none; b=dvWDdagBxiJKDDUUfS/GGFIEQ6MO/fWRZDljdys+tin7eNXmqSkikRCLJPOdLXMG/Cu5ejeUQMywws6SVMm+AEP1BPeC4stvl1PuHAQs2CZldDkafaNjcyS3GyT1b4eP5BWLsHjjhJa+roUB4d/np0Br6fim21Gx2gUqE5MFzvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745436859; c=relaxed/simple;
	bh=ljh29i1lbPV8eBJD87ZuVb9gALLN2MJpzbh2M/ZeJdw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=TLNU2f3T7rjgWcTt9Pj9sJ3Fb0D3sbsPfds48keq2/kv8nntE9pA/Xcj3dGzEmvePmNOZUQ3VGTs/C8Nf2duXBTnboqt1n/e+seKpIVh9Byhpv+ckc5nhkJewohTXF7DY0mXXSEWSP64PLRA9nNIZNhpFJo4urVsEVrczkGtCME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IrdmOAwT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAbnEb016102;
	Wed, 23 Apr 2025 19:34:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lS5I/aeA8KBq163Rb4Fwi1w1uuJfq6wc7C6e0yYkH8I=; b=IrdmOAwT1g+Zai5x
	53yFLph5CNaMYNIwW+fT6x61uHID59gYHcL/szu1KxHv9BrhwsbswGSiGeIkcpTW
	CwFiTRkktCoa5OF+SC5SAgBRuxwRYHiNHaVQoWmHwgiyVNOwrvS8HR1lwGJCDhU8
	ZQj4aDbQc0IZ3zIZgfBU6c3ks2zczADZZ9+teygFvFkd1DYdSXukFyXFgaB58sRk
	x2YbKopJFxPMbhGSh7CXQ3PfXPE4Z+diBBtsQwraFEk7QJCCbp2GO456wP0Wm8Fm
	GaTLMdiGgorR+18tY/beWsDri2GWzH8wfeJQiPwJdogJ1h0ktS8WSIbQy4GJbNsZ
	ZgX6AA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0b8g9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 19:34:15 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53NJY27F000921
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 19:34:02 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 23 Apr 2025 12:33:58 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Thu, 24 Apr 2025 01:03:34 +0530
Subject: [PATCH v4 4/5] arm64: dts: qcom: qcs8300: add support for video
 node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250424-qcs8300_iris-v4-4-6e66ed4f6b71@quicinc.com>
References: <20250424-qcs8300_iris-v4-0-6e66ed4f6b71@quicinc.com>
In-Reply-To: <20250424-qcs8300_iris-v4-0-6e66ed4f6b71@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745436821; l=2668;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=ljh29i1lbPV8eBJD87ZuVb9gALLN2MJpzbh2M/ZeJdw=;
 b=7MHCn4ZM12YxUpxVaAPOUZ+yuHIbVizbvEuOnsq73wpZH1C6wGVh7DNI8Nm5mYyC3k6UH2Q0W
 WrHoS0W4Qx9Cbcss1UJ39hzPFFhhoK+KEk9qRSyrJvSJlqSC07rkfYl
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: U1tIRKJKWyXKs6pYuCLlFyW4ntaxsoq9
X-Proofpoint-ORIG-GUID: U1tIRKJKWyXKs6pYuCLlFyW4ntaxsoq9
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=680940b7 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=gsePXWo3U9w2I85xqPwA:9
 a=-MVX0H8OmFgSA6gq:21 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDEzNSBTYWx0ZWRfX879a52zKVzyc 9dIIvlKCf3lnXw01b5vgatFLyB4J4iFO6vC6gtX0+IJa4RBsv+Jo12x3jLPQWwhV7TIxB1IPn+e fjBq9XrvdddTYUfa5xaM8nABYaoej5fTWNQ/0DdwmWcKudR7QvSvkPI+NebPhpSZuqfdKTbfFCw
 nWhfttB8n/82uW04g1Sg1DWk0dRiCJIPNMZAEkNbxy6Vp7Xh7HCeCpX6bnv+69VSYR3ug2+LjMg YcyvW0iikxRTYgmOL4E31+bxB2byeoNCePjFl39g8M9Ct5wr77sldB4oOcJpb/zipmbhf7veksC qPVhjt3Ga0LnmcjzV/WuNf2U799Zx7yWUNIjw8aBNsiVxkVnmIMlNBwT/Tku8Rf3Twz1vqqWAJv
 9rfFd3JdnQ7WDRRv9nb6Ba50+RsVHlZ8G7H3DXoHIQ+wj6L9B/dpZJ88g2Hqsch1DYbzch0B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_11,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230135

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


