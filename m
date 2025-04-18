Return-Path: <linux-media+bounces-30511-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 939BAA931F1
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 08:29:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E7F637B24D9
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 06:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7405269827;
	Fri, 18 Apr 2025 06:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nwETSEfy"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE17267F62;
	Fri, 18 Apr 2025 06:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744957751; cv=none; b=FCD3hFPTs0/iskh30tuNgjxnCt4XzP8j8C/WIXkdNXM0iaZ8Nnnwuvouthcph5vgSJc/dJdVmIUDUk3a1UQ90Kg3qR7uCi++d7F0yyTGkyJJ5ZI/HR9zikEL57E8STyggyRW20yKSR70JD7YgbK22xYdTocLsThDV5QUPZIWODk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744957751; c=relaxed/simple;
	bh=mAHPsY6P9SchlWNx+Zig1sowJ8QKSjTrwbwWkVSwYO0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=qtqzidg4oWUTDP6b/2B7S55vsU407sfxq0sm9wcxK7TgPEsOnOxEpn90VRTIoEFPHPqHFKDdSj8Qb/hmJqVfZu0ISGi8QQu7sv3nmF3SlwqtduxGwXxkwAmWcRL44u3cCnIXVMDcIkGXMsnPpaX80ckIgngkLnbsSJJYmXXqrNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nwETSEfy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I1opZs005236;
	Fri, 18 Apr 2025 06:29:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yUZ6316VEtYeXIfzWuYhTbK5Ghcia/4ycygXgj6zKeE=; b=nwETSEfybDWn/0OO
	un11arqNYZAAc9d1Im9r52GDbLQ0AE2czgBHSvGxT9xVB4Nmvdh2VT3ov7D2D8ny
	1PVja9eXC67ad7u3rgxLhEdD+Hg4p2gPDDgg/INQ5/VvE/5rWRTNh2uhzBoymN2C
	WaJwD0TmZ2XX4VWz0sUB0TuuPS5ej1CBomXfjPX1+f7CxucXxNUEhOZA3fibx3LN
	FzjDLttqQNZe5wXDiVXEpxetgyptvPEgcHyC3h9jxzXw0hJMuPJA8FlpaodIDJdW
	jUimivez3N2inV3Yc9A2+PrALHf2DUP2r7ELUAjC/K7kaRUxtmUiVpB642nD4Myz
	S+tPDQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf6a16rc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Apr 2025 06:29:04 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53I6T3ZN006723
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Apr 2025 06:29:03 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 17 Apr 2025 23:28:59 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Fri, 18 Apr 2025 11:58:40 +0530
Subject: [PATCH v2 2/4] arm64: dts: qcom: qcs8300: add support for video
 node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250418-qcs8300_iris-v2-2-1e01385b90e9@quicinc.com>
References: <20250418-qcs8300_iris-v2-0-1e01385b90e9@quicinc.com>
In-Reply-To: <20250418-qcs8300_iris-v2-0-1e01385b90e9@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744957731; l=2621;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=mAHPsY6P9SchlWNx+Zig1sowJ8QKSjTrwbwWkVSwYO0=;
 b=gUNL9FGOA5i4bm6oYGQwJaTH8A9r9hSnOj9jbgQVtARMmsTHhvTspHFlw5anqgshqcwfswZcB
 IS8dUbYb9cjC86LdoE0FkIjBW6jJw7B8G+aloCTN2J+IDna0V1i09OU
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: VCbpIeL8HNAz3E6KmMvX0j2Jc07MoPbL
X-Authority-Analysis: v=2.4 cv=JNc7s9Kb c=1 sm=1 tr=0 ts=6801f130 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=gsePXWo3U9w2I85xqPwA:9 a=8_LpUpsc6YvuXEhJ:21
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: VCbpIeL8HNAz3E6KmMvX0j2Jc07MoPbL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_02,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=956 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180046

Video node enables video on Qualcomm QCS8300 platform.

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


