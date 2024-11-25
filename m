Return-Path: <linux-media+bounces-21919-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4269D7B3F
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 06:36:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B24C1162F11
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 05:36:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76586189528;
	Mon, 25 Nov 2024 05:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="c/tphbKV"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A37188587;
	Mon, 25 Nov 2024 05:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732512928; cv=none; b=bhLWW0XzLictBf/62Af0pl7bQQJK2oELnfBmKLWftqukkj5XVNXdN2FTBQHqfjUP1zDCNCQuRRC5FMhqEPp5kunhWD1xRMtzzHlUy8p/cExhJNUNYsT+S0qzMsRED/e+idsGK4QmcFXmr3chSewEdZOSQze10QVydIxFhJLkrL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732512928; c=relaxed/simple;
	bh=2IAN0GkBPGdzI2DVRoi+bNAHMQKiOhqBBfc1P/mSgkI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Zgtvnpp9cQqsdQBZsxNj9lUnENTT6pc4Ek/UyPd4LCrlZOBaQ3Ff7X57wYB/0lSSjT64FZ52ycMj/THEakF/NSPZuWyy1Y6qh93hETd38ZRcKF8hHdEJqeBEjRNnvfsbYW1t5fM9ApBsTq5xD+PgiInLqK/AFQan+3OA8GCX5K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=c/tphbKV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AONKBae000388;
	Mon, 25 Nov 2024 05:35:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hxT1CXGpL+q39AIXGREm3YgkjDQb7tBNeBjYiXUmYpE=; b=c/tphbKVPvGjTGu7
	InwdOj/dwgMLLJ5pj+2NDmCd1Pka/EQppSFbYKxV7pzwbObMCyulkiECoxjXRGVI
	taUk5XS8lwOYxwbeZbyC1DtMSQCDb//nIqEP6Fe8fPkKz+GTaXqt/QtvLP+zSQXM
	89JSYZHiPOvpU+74Y/oh5AllwwPGKLumk4mgkt/XGQpGrSODpiA5lAyIoHwYD1JT
	rN+CatANt5gjkLWu3Kinq482VHGO/ZMZQbM9kg8/b6pmaQS5MrjbroJB46W35U/j
	XET0eRFPn9C/xaWz70O5dpmT0yoUuVklcAcHnr2wiipyWT8e9BSeoJI7PBPRO4yF
	VMGOqw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4336mxbg05-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 05:35:22 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AP5ZKGk031802
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 05:35:20 GMT
Received: from hu-renjiang-sha.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 24 Nov 2024 21:35:17 -0800
From: Renjiang Han <quic_renjiang@quicinc.com>
Date: Mon, 25 Nov 2024 11:04:51 +0530
Subject: [PATCH v3 3/4] arm64: dts: qcom: add venus node for the qcs615
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241125-add-venus-for-qcs615-v3-3-5a376b97a68e@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732512906; l=3011;
 i=quic_renjiang@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=2IAN0GkBPGdzI2DVRoi+bNAHMQKiOhqBBfc1P/mSgkI=;
 b=F6jYi9+2P4lqXd6M0shnAuLkLEdJtMdXvDSBh6GcZ2g8/0EsaIffbK+83ucn2HPf9FSaLpYk2
 V2fZdpvQKO5Ah99JxJjJ1wvpg6LO9lSSMJbkaJqHACZQYvw5K0t4zyK
X-Developer-Key: i=quic_renjiang@quicinc.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: gJFmN9kOExkvRVSKxyYW-YV22HniflF2
X-Proofpoint-GUID: gJFmN9kOExkvRVSKxyYW-YV22HniflF2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 adultscore=0 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=676 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411250045

Add venus node into devicetree for the qcs615 video.

Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 86 ++++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index 06deb5c499fe83f0eb20d7957ca14948de7aab34..18ad4da5ed194458aded424560f45a3a9f3163dc 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -394,6 +394,11 @@ smem_region: smem@86000000 {
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
@@ -530,6 +535,87 @@ gem_noc: interconnect@9680000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		venus: video-codec@aa00000 {
+			compatible = "qcom,qcs615-venus";
+			reg = <0x0 0xaa00000 0x0 0x100000>;
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
+			interconnects = <&mmss_noc MASTER_VIDEO_P0 0
+					 &mc_virt SLAVE_EBI1 0>,
+					<&gem_noc MASTER_APPSS_PROC 0
+					 &config_noc SLAVE_VENUS_CFG 0>;
+			interconnect-names = "video-mem",
+					     "cpu-cfg";
+
+			iommus = <&apps_smmu 0xe40 0x20>;
+
+			memory-region = <&pil_video_mem>;
+
+			status = "disabled";
+
+			video-decoder {
+				compatible = "venus-decoder";
+			};
+
+			video-encoder {
+				compatible = "venus-encoder";
+			};
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


