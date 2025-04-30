Return-Path: <linux-media+bounces-31453-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBEDAA4AED
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 14:19:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4F019C55BB
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 12:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2258225D534;
	Wed, 30 Apr 2025 12:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EpRYAdxb"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC27125D1E0;
	Wed, 30 Apr 2025 12:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746015468; cv=none; b=iYQ35TP5zoQCvY9wx7h1WclR41JTfRwp3eRt8fZupffQ3JSnyJt4AwrVcbf6erSADK3MEVcGFtzbRKv8jCiZ036XpSkzhU4Ca5zw9qhzS/SyZp3qObXkkr3ybgX//OygiXnnIsWI064gOLW+c8QWxZeiNNn58Xl37eyRjKxByFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746015468; c=relaxed/simple;
	bh=S4txBYPGqdei8w2ZW3Z0HciYiOac+gjMzSoavOpUjYI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=bNOa7X8UhsNlp0ow4boKTjf0nU+tAUDOCa9e0mRsKJ+U2smWBBgBNZOj5BH1lHqN6fWq8eVwFUUQwVFXrmCaO064Q/m+wZPSdvrEpTLHmvgI80vR3QkFwJuS+GXLcfcLzxuSD5oFmYzIhu8MhSwSu2XzjIKTfwbTeAVCEpzuk+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EpRYAdxb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U9D8IK012202;
	Wed, 30 Apr 2025 12:17:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KX4buSDxmHUMqD0gDLI2InvWSGvyVpnMtuKcygL0AU8=; b=EpRYAdxbEsqwViQu
	Hz1/zJty/0yXolH+TmSnBrRZ7L8TEQLLe7jVgM3qgo1rHTF2O9wiIcdjhy+GZQG8
	2bAiITE/brNm38SXwApgAVEH5pHVhpCoFzXSrYHQ187qwUs9O4qmbfoYeER7EKM8
	e/IulQFRV5MJsaJNe1Q+75ZjQC3lWzCWqU3beWyuG3sQO0vpPzNfc6SO2fxg3mCn
	OMMBd0YbRAKMTU/6kO6ZipGQk4C5RPbOCIxmRxuLuubrvwpOuNYRT2BAbJ5kD9Fa
	cM1+2UEU6V2hP97VtOw1MGkZrpelRr8g0uoji5Z2LRE5pc2O8UV6lzNvlkIAUr4R
	qv/o/Q==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u3t3jv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 12:17:43 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53UCHgSv015556
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 12:17:42 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 30 Apr 2025 05:17:38 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Wed, 30 Apr 2025 17:47:10 +0530
Subject: [PATCH v6 4/5] arm64: dts: qcom: qcs8300: add video node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250430-qcs8300_iris-v6-4-a2fa43688722@quicinc.com>
References: <20250430-qcs8300_iris-v6-0-a2fa43688722@quicinc.com>
In-Reply-To: <20250430-qcs8300_iris-v6-0-a2fa43688722@quicinc.com>
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
	<konradybcio@kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746015441; l=2709;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=S4txBYPGqdei8w2ZW3Z0HciYiOac+gjMzSoavOpUjYI=;
 b=wkwIoR7MWOAWZxqOqTdR+IfhjQvkHT2kMxx2fRGI0nJJIu4qVTfzLG9wmbucXg/kLX7t4IBmg
 A0Sx7atOST5AD1azqWk/Uxejfu/j1N7i/flmdayNl/zb63kD/qnfzst
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Bv6dwZX5 c=1 sm=1 tr=0 ts=681214e7 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=gsePXWo3U9w2I85xqPwA:9
 a=yuEPOz-sr7otSJcU:21 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: BBYY8ftcGAgRD7hQKxnYeV4guVoNGkzJ
X-Proofpoint-ORIG-GUID: BBYY8ftcGAgRD7hQKxnYeV4guVoNGkzJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA4NyBTYWx0ZWRfX6EcWQIZBIFYN z6I7dHhMI3npEZoKNJUuwvluzpcKBGH9+4orW2Eo6WnbHFHjC16xkXz8vBuLmmyCxC7zKEqUsgM sg8mrC2V5cPAuQBSUGm6w/gwWzcaVW0KfGBeGfMwq+Fmujh9763abfMWsCgB2WwwAWFUvYEw59B
 mIOxlnfemMNy8/eXNQwCc8HMQOLnc5Q+bXENMea19Uf6cHtIobBJObbTyTwStoHMowbwU8KUSAj 7wco18Z9aMc2Tj8ol7x1oIUGZLcx8JofRlAye/aNUY+467qZ+9N4DkjdLxckKV+/5QDlVf3aRYx C6MBLZogYIod8/3CovqJWtGnPFbmu2aD4TX8zHglHJHzmaqjddwMBDh/d3AbKsJ9vXZEqEym1sF
 /j0LhZ+Y3ynPO9lgRr1rhsgAuwQffvpZGh3sPQQtpYrejLt15JtkBE7HHG8jVlRWrqfmwJpY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 mlxlogscore=967 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300087

Add the IRIS video-codec node on QCS8300 platform to support video
functionality.

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


