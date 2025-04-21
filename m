Return-Path: <linux-media+bounces-30626-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28033A952F7
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 16:48:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50B2F170761
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 14:48:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97A3F1D89FD;
	Mon, 21 Apr 2025 14:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mibATbbH"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781AA1CD1E1;
	Mon, 21 Apr 2025 14:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745246852; cv=none; b=r/AWk3hemxloqdbuYH0s+7gc8wGoWPi1VZjiONPswsBFiOfFoxMQ1djgxo9jPXpGfjmY+Z2Cd15iOQloVMfTwiMdiiHq7fZw/N7T6VZkZBGtmAOuZI0agUprrifyf8YXvwlNHiBJK/2Psp4lREXot9oLI2FsUsYLhDg6gtW9Kd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745246852; c=relaxed/simple;
	bh=paoT2a+DKur7CU3TUKrPeqhnhYifURTLzlPURxETM0Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=DqKQecbSSvkcJ9UWRov12wD1+ZWC/ZabWUk+yHAOBmVSOi4ezpQ0AVwELsSzxCwKDbYFPfQps8Remo6RtTebr0j6Lbcj2IZbByJHzW5JrXpc8d+5N52I6yp7+wyPQW8oksAe0MfDx9oslku3LG+ZykBSO+2mqCR9FvFiwiFQm+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mibATbbH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LAir9w013841;
	Mon, 21 Apr 2025 14:47:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ROMWIAfCJEWwPRW2ghFEPAvTa1VOC5tOA2zua1d0pqs=; b=mibATbbHls3AaT47
	VHKnzwwv4vGQQ8EcOOKZe1dvncDw8Hgaf3iAOL7MlJwq8wvPCYvwufdhSoImWa94
	SMyjxxbbT32aexAzML/w51lOt3v2EBxl+DdIcqP1C7mBtdhpByaU6QYysX0N7e9H
	5Fr5dRPgyLlFstUWHao3sH7eABRmPEGBwImfEuOqSTuQ/dlVmDbRYiN9wae9EtoG
	5kw+MGxULD6N5vVtAuIjsuad1IOKXXWllhX2I1NEiPqKMQx92E5ZWRDKcA759P+S
	I83s1KqzJLC+htOI2t5litwkaW0sYyt2DZq93HVMStd1DbtkD/cozfpcdIphaj78
	GJZFOA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46454bmdn0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 14:47:26 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53LElP9N012747
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 14:47:26 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 21 Apr 2025 07:47:21 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Mon, 21 Apr 2025 20:16:56 +0530
Subject: [PATCH v5 2/3] arm64: dts: qcom: sa8775p: add support for video
 node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250421-dtbinding-v5-2-363c1c05bc80@quicinc.com>
References: <20250421-dtbinding-v5-0-363c1c05bc80@quicinc.com>
In-Reply-To: <20250421-dtbinding-v5-0-363c1c05bc80@quicinc.com>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad Dybcio" <konradybcio@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745246832; l=3262;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=paoT2a+DKur7CU3TUKrPeqhnhYifURTLzlPURxETM0Q=;
 b=RFGXgIsrR1Yy3UgqIpfFpxSTMKwJTaP1WWOt2RA+SAL41T2DMMB6QJ7hBR6WzeccIarta83iq
 5FwLAb/qOo6A2/ND5vibGrR86YSFqwJIlyyDfnD0RSv4o8x/jVuMXnY
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=cdrSrmDM c=1 sm=1 tr=0 ts=68065a7e cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=6CS4_eOYxBNqEohWPBAA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: VIA2cOqc3Lz1K6u6Vmx8QJS-TlCXjxk7
X-Proofpoint-GUID: VIA2cOqc3Lz1K6u6Vmx8QJS-TlCXjxk7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_07,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 phishscore=0 adultscore=0 mlxlogscore=999 malwarescore=0 clxscore=1015
 spamscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210115

Video node enables video on Qualcomm SA8775P platform.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 71 +++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 3394ae2d13003417a15e64c9e47833725ec779e6..a4a822488b8a4fd2669ead5b69b2fa84ebebaa2e 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
 #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
 #include <dt-bindings/clock/qcom,sa8775p-gpucc.h>
+#include <dt-bindings/clock/qcom,sa8775p-videocc.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/interconnect/qcom,sa8775p-rpmh.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
@@ -3783,6 +3784,76 @@ llcc: system-cache-controller@9200000 {
 			interrupts = <GIC_SPI 580 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		iris: video-codec@aa00000 {
+			compatible = "qcom,sa8775p-iris", "qcom,sm8550-iris";
+
+			reg = <0x0 0x0aa00000 0x0 0xf0000>;
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+					<&videocc VIDEO_CC_MVS0_GDSC>,
+					<&rpmhpd SA8775P_MX>,
+					<&rpmhpd SA8775P_MMCX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mxc",
+					     "mmcx";
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
+			memory-region = <&pil_video_mem>;
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
+				opp-533000000 {
+					opp-hz = /bits/ 64 <533000000>;
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
 			compatible = "qcom,sa8775p-videocc";
 			reg = <0x0 0x0abf0000 0x0 0x10000>;

-- 
2.34.1


