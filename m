Return-Path: <linux-media+bounces-34585-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B1AAD69DA
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 10:02:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C10927AEC22
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 08:01:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7536C22173A;
	Thu, 12 Jun 2025 08:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="B3XHWO9s"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E74C1A23B6;
	Thu, 12 Jun 2025 08:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749715330; cv=none; b=FgbeeUXW0NpYzMamsB560wvXLrO2JmEcMbI8h93wunGQdwdjJanYGfNCDuZ8ACAlNWarx3NxY0GdvlO29iTPBRrvxaTHO5HaUirsyeo2XFkpJZ3d2dFaYVQ4Fnzo/DL3NfWyTkaBunQ+wLssz/rETEY5KZQPabn57TTCenN7s0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749715330; c=relaxed/simple;
	bh=frH42T8t0FzIHwR/eWZvFS6FfpWNoiCjYljhYSh1okI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=gfVtv2hiA/lR5Jx5nDwiuNXXHLUNKPUyDXmvYLsSTq32qtZUb9vRhxjGkAPRlViMSA3dUM8M6bK3keFvo3gygv4yAZYVQxOGHH3ScZfJ2MbALdJbfI076UyW4E9uTtQ/zrIIPgnNIS+97jvA2Js5CBjqsjp5+KWTQT7cZzInwb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=B3XHWO9s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55BJt2wC009032;
	Thu, 12 Jun 2025 08:02:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=COBSocK9RPBbmb+sqpwS87
	DsOrTpWFXtzGaZSP1NOkM=; b=B3XHWO9s2+x9IlZEaUFXqsx2g8EHELb1VIE90Z
	8+NFWWNU2Wlbcz6fXepuNbjAC6FPLmkuhAav/QZTHuIiLblYCthzbaFRgDa4r0p6
	SUjs2l7eFzNKHDAQrhmB+Lk2v1anES0BNbpE7eGVYwNL/DcNIQmbKRgn9N1BQ34d
	Dy2o3BUp7oMjvuj3DovKPr65wDOQ0CzmtaIsqUkw/HGH6rxpb1lgvg4of2HzaOiW
	34kjjbAy7HaKybI1xQNR0rbhDGonWuEPykThAku9GnrZaMDESshPNxwzTFTt4E9H
	DVkyfxc0FhA2dkhxmuB1ChoZ7zxrmHXH9BMtOw1uqc0GChaw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47753buq1b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 08:02:04 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55C823tx020861
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 08:02:03 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 12 Jun 2025 01:01:59 -0700
From: Wenmeng Liu <quic_wenmliu@quicinc.com>
Date: Thu, 12 Jun 2025 16:01:26 +0800
Subject: [PATCH v2] arm64: dts: qcom: sm8550: Add support for camss
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250612-sm8550-camss-v2-1-ed370124075e@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAFaJSmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDI1MDU0Mz3eJcC1NTA93kxNziYl0jI8MU8ySTNEuLNHMloJaCotS0zAqwcdG
 xtbUAbRSavF4AAAA=
X-Change-ID: 20250516-sm8550-camss-221d7b4f98f7
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <todor.too@gmail.com>,
        <rfoss@kernel.org>, <bryan.odonoghue@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        Depeng Shao
	<quic_depengs@quicinc.com>,
        Wenmeng Liu <quic_wenmliu@quicinc.com>,
        "Konrad
 Dybcio" <konrad.dybcio@oss.qualcomm.com>,
        Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749715319; l=7387;
 i=quic_wenmliu@quicinc.com; s=20250211; h=from:subject:message-id;
 bh=frH42T8t0FzIHwR/eWZvFS6FfpWNoiCjYljhYSh1okI=;
 b=bLK7SXSGQFyhBY4BPcWnnD/VuSMKrs1i9DlEIYDISELUtF/aGvVjq3a1PVL+IDIyyOwJYP/tE
 Wd2XsZ0T6YTBEY6cUd/1/VyftzTZHr36rd7DyYHdkzrpb1hjud02asX
X-Developer-Key: i=quic_wenmliu@quicinc.com; a=ed25519;
 pk=PTegr3w0f1C9dOSL6CUdJR5+u+X/4vsW7VMfwIMeMXQ=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDA2MSBTYWx0ZWRfX35ewzFWEkFa8
 NFAVZaS8jubks8k1kE3U+KQf/C+azm5Ser0tg7iMSfY4DETMW1HmUNiaI1FUhq+r1n7rZV42fnV
 Fs8aInSVFUJOSeDCej2cdmTsq+qTgf/ypnHAT8F/7arsjiHuMd7HHC++rrus3Wqj/7OFs+5s4/w
 7b9eTziNUQdObmU0gB7Rq8Bb0JHz87jiMpY+muujFC9wM9D8iQ0STfewm7LZkTl7+sZ8XUaswDy
 KBpaO4N+jMRJGUNp7u3zqSuS8kuEEqxCZIT+J0A7b2qEa0B5zJMm+H4Er6QYZvDOO921WutZTgL
 1sAkX+dKX7stF9DKerhAHyFzdnROdO7YLQrB045acI5wBYz6LmQ66kuWcnZMK8v/SmeMrcQxHcE
 0OeQI5JjT/th3sCeLhyr3OXY6BrEZW6B7wIqASmRdm2bcCTb+ZNG1/YDdEXx8cGIRGu+RZVF
X-Proofpoint-GUID: ZEHMkhTkaZ3y90o3wajqPd6aa_9WCYQK
X-Proofpoint-ORIG-GUID: ZEHMkhTkaZ3y90o3wajqPd6aa_9WCYQK
X-Authority-Analysis: v=2.4 cv=SqOQ6OO0 c=1 sm=1 tr=0 ts=684a897c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=IACBFAE94UV1yjmVcKEA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=852 bulkscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506120061

Add support for the camera subsystem on the SM8550 Qualcomm SoC. This
includes bringing up the CSIPHY, CSID, VFE/RDI interfaces.

SM8550 provides
- 3 x VFE, 3 RDI per VFE
- 2 x VFE Lite, 4 RDI per VFE
- 3 x CSID
- 2 x CSID Lite
- 8 x CSI PHY

Co-developed-by: Depeng Shao <quic_depengs@quicinc.com>
Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
Changes in v2:
- Change the isp label to camss
- Link to v1: https://lore.kernel.org/r/20250516072707.388332-1-quic_wenmliu@quicinc.com/
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 210 +++++++++++++++++++++++++++++++++++
 1 file changed, 210 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 82cabf777cd2c1dc87457aeede913873e7322ec2..3c26a39011188fbcb0dad7105ebeaef55fbccbc2 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3325,6 +3325,216 @@ cci2_i2c1: i2c-bus@1 {
 			};
 		};
 
+		camss: isp@acb7000 {
+			compatible = "qcom,sm8550-camss";
+
+			reg = <0x0 0x0acb7000 0x0 0x0d00>,
+			      <0x0 0x0acb9000 0x0 0x0d00>,
+			      <0x0 0x0acbb000 0x0 0x0d00>,
+			      <0x0 0x0acca000 0x0 0x0a00>,
+			      <0x0 0x0acce000 0x0 0x0a00>,
+			      <0x0 0x0acb6000 0x0 0x1000>,
+			      <0x0 0x0ace4000 0x0 0x2000>,
+			      <0x0 0x0ace6000 0x0 0x2000>,
+			      <0x0 0x0ace8000 0x0 0x2000>,
+			      <0x0 0x0acea000 0x0 0x2000>,
+			      <0x0 0x0acec000 0x0 0x2000>,
+			      <0x0 0x0acee000 0x0 0x2000>,
+			      <0x0 0x0acf0000 0x0 0x2000>,
+			      <0x0 0x0acf2000 0x0 0x2000>,
+			      <0x0 0x0ac62000 0x0 0xf000>,
+			      <0x0 0x0ac71000 0x0 0xf000>,
+			      <0x0 0x0ac80000 0x0 0xf000>,
+			      <0x0 0x0accb000 0x0 0x1800>,
+			      <0x0 0x0accf000 0x0 0x1800>;
+			reg-names = "csid0",
+				    "csid1",
+				    "csid2",
+				    "csid_lite0",
+				    "csid_lite1",
+				    "csid_wrapper",
+				    "csiphy0",
+				    "csiphy1",
+				    "csiphy2",
+				    "csiphy3",
+				    "csiphy4",
+				    "csiphy5",
+				    "csiphy6",
+				    "csiphy7",
+				    "vfe0",
+				    "vfe1",
+				    "vfe2",
+				    "vfe_lite0",
+				    "vfe_lite1";
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_0_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_1_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_2_CLK>,
+				 <&camcc CAM_CC_CSID_CLK>,
+				 <&camcc CAM_CC_CSIPHY0_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY1_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY2_CLK>,
+				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY3_CLK>,
+				 <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY4_CLK>,
+				 <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY5_CLK>,
+				 <&camcc CAM_CC_CSI5PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY6_CLK>,
+				 <&camcc CAM_CC_CSI6PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY7_CLK>,
+				 <&camcc CAM_CC_CSI7PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
+				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
+				 <&camcc CAM_CC_IFE_0_CLK>,
+				 <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_1_CLK>,
+				 <&camcc CAM_CC_IFE_1_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_2_CLK>,
+				 <&camcc CAM_CC_IFE_2_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "cpas_fast_ahb_clk",
+				      "cpas_ife_lite",
+				      "cpas_vfe0",
+				      "cpas_vfe1",
+				      "cpas_vfe2",
+				      "csid",
+				      "csiphy0",
+				      "csiphy0_timer",
+				      "csiphy1",
+				      "csiphy1_timer",
+				      "csiphy2",
+				      "csiphy2_timer",
+				      "csiphy3",
+				      "csiphy3_timer",
+				      "csiphy4",
+				      "csiphy4_timer",
+				      "csiphy5",
+				      "csiphy5_timer",
+				      "csiphy6",
+				      "csiphy6_timer",
+				      "csiphy7",
+				      "csiphy7_timer",
+				      "csiphy_rx",
+				      "gcc_axi_hf",
+				      "vfe0",
+				      "vfe0_fast_ahb",
+				      "vfe1",
+				      "vfe1_fast_ahb",
+				      "vfe2",
+				      "vfe2_fast_ahb",
+				      "vfe_lite",
+				      "vfe_lite_ahb",
+				      "vfe_lite_cphy_rx",
+				      "vfe_lite_csid";
+
+			interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 605 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 376 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 89 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 278 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 277 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 602 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 604 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 688 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 606 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 377 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csid2",
+					  "csid_lite0",
+					  "csid_lite1",
+					  "csiphy0",
+					  "csiphy1",
+					  "csiphy2",
+					  "csiphy3",
+					  "csiphy4",
+					  "csiphy5",
+					  "csiphy6",
+					  "csiphy7",
+					  "vfe0",
+					  "vfe1",
+					  "vfe2",
+					  "vfe_lite0",
+					  "vfe_lite1";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "ahb",
+					     "hf_0_mnoc";
+
+			iommus = <&apps_smmu 0x800 0x20>;
+
+			power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
+					<&camcc CAM_CC_IFE_1_GDSC>,
+					<&camcc CAM_CC_IFE_2_GDSC>,
+					<&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "ife0",
+					     "ife1",
+					     "ife2",
+					     "top";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+
+				port@2 {
+					reg = <2>;
+				};
+
+				port@3 {
+					reg = <3>;
+				};
+
+				port@4 {
+					reg = <4>;
+				};
+
+				port@5 {
+					reg = <5>;
+				};
+
+				port@6 {
+					reg = <6>;
+				};
+
+				port@7 {
+					reg = <7>;
+				};
+			};
+		};
+
 		camcc: clock-controller@ade0000 {
 			compatible = "qcom,sm8550-camcc";
 			reg = <0 0x0ade0000 0 0x20000>;

---
base-commit: ed61cb3d78d585209ec775933078e268544fe9a4
change-id: 20250516-sm8550-camss-221d7b4f98f7

Best regards,
-- 
Wenmeng Liu <quic_wenmliu@quicinc.com>


