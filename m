Return-Path: <linux-media+bounces-28513-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8377BA69E80
	for <lists+linux-media@lfdr.de>; Thu, 20 Mar 2025 03:55:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D7B9466B36
	for <lists+linux-media@lfdr.de>; Thu, 20 Mar 2025 02:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06C511F4608;
	Thu, 20 Mar 2025 02:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fxj6atrX"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98E31B4145;
	Thu, 20 Mar 2025 02:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742439300; cv=none; b=IPJNZwqI1ECG0L02RQ8PgYRPauUIkjM84DwbyPwkKdSfSPtdhN5qTzFJkJrPUJM9KdSxt6JfG/WTLRruNtX4wsM6Npo8nfJh6F7MESCLqUbQ6wdg317XF+A+Bn011wSRUXD7StJGljr+dJptPaiWrnvQxENN78D+tBuq3qWOHdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742439300; c=relaxed/simple;
	bh=VJn9fW/LIVmE3GBWpfwt0DJu7IIj0WR7vB1YC9HpHnU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=imZpaG/ZhEiZ3/xN7OoTH89FBzjnz9G6FJKzwu0M3vf43MEUBb+n8B5R6vg8POG1hYC76w/DUzMKvzGkj59gkvYMk03W9dH4LFTrGFNsdUSc+5/s4om+5uXM4YbIJoRm06gjPIFY13cjKuHQxq+duz9L1szD8Kx0ZVtmN6PLKkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fxj6atrX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52JDu0pK009925;
	Thu, 20 Mar 2025 02:54:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EUdvY66ApU16rtXKreHRrYS3bPsCZnOUrWF9bC2iTFs=; b=fxj6atrXM7Vi2PHx
	HeGAYYHsNXX5uY/D7CDpx3D0PLFrlULWp6o9gOWj3TFKKlEI4m+X8e35eNid2+jS
	HEEELrek9N1Gs5q67P5Kx0Rxaxtj0/3gXoxLcLjfxm0BVrw0iGG1V1sSuZNxrxIV
	mg7uzrRd26mPaLzEYm6PI843TKjxNkZxtK7SYy8y/cAqTbxuCQ+K6VFzOy3ToH2i
	+65gs9JCYZJyvOQ5aKadHhqRs5SUmlEy28vKzILHAt6KiuXUTKiIQDy2oDG1Cmwz
	CbtO9wrtZFSqK1i0nXoy6W4yEZrBbOJ2xRLyiek8IbClMo/eTPZCFewSSFHnBq0t
	X2i69Q==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45fdvxmjg1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 02:54:55 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52K2ssou023213
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 02:54:54 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 19 Mar 2025 19:54:50 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Thu, 20 Mar 2025 08:24:30 +0530
Subject: [PATCH v2 2/3] arm64: dts: qcom: sa8775p: add support for video
 node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250320-dtbinding-v2-2-8d8eaa4e76cc@quicinc.com>
References: <20250320-dtbinding-v2-0-8d8eaa4e76cc@quicinc.com>
In-Reply-To: <20250320-dtbinding-v2-0-8d8eaa4e76cc@quicinc.com>
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
        "Konrad Dybcio" <konradybcio@kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sumit.garg@oss.qualcomm.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742439281; l=3071;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=VJn9fW/LIVmE3GBWpfwt0DJu7IIj0WR7vB1YC9HpHnU=;
 b=w1u6IYpsiaYtDMyVArwOwFlKRFy1RfaQGzzLBCXzokWO8bGZXrAdMKzlGT/A2btUCF6bm77P9
 gMk8dm6+tfGDgYXSSrCwouQ4OYvQH1KZ3hkcYoRyqFkZ3gOsxUBp+KC
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=SKhCVPvH c=1 sm=1 tr=0 ts=67db837f cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=gsePXWo3U9w2I85xqPwA:9 a=q4wdmsZh22oxWPhc:21
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: GgoRjjdlO7sAWBMsvHM5erE80ClqEFbn
X-Proofpoint-GUID: GgoRjjdlO7sAWBMsvHM5erE80ClqEFbn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_01,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=988 spamscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 mlxscore=0 suspectscore=0 phishscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503200018

Video node enables video on Qualcomm SA8775P platform.

Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 71 +++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 3394ae2d13003417a15e64c9e47833725ec779e6..0b5bfcdb803913396ff269c9002b4314991075b8 100644
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
+			reg = <0 0x0aa00000 0 0xf0000>;
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+					<&videocc VIDEO_CC_MVS0_GDSC>,
+					<&rpmhpd SA8775P_MXC>,
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
 			compatible = "qcom,sa8775p-videocc";
 			reg = <0x0 0x0abf0000 0x0 0x10000>;

-- 
2.34.1


