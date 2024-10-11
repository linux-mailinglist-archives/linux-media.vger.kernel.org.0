Return-Path: <linux-media+bounces-19429-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9C299A5FF
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 16:12:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 747A1B263E7
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 14:12:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B20F21C199;
	Fri, 11 Oct 2024 14:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CbiFpTy6"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1718F2194A4;
	Fri, 11 Oct 2024 14:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728655854; cv=none; b=cmt2NapXKm9U+h5/aANyjJwEzaEPqLDgv5kOECVYqfAIaRbhG9WdVCwFBPKG0hEy8/lUiKa0lU+YCKCessbjKm5CEcIkTKEz0FPWFB9bWDajm70boIpDWm1PiXK4NUBnkxFPX8pwlWt7OcoVwGMg8DtpLjbWIeXMAXHfLkMCu/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728655854; c=relaxed/simple;
	bh=gkNImmlZAaWUCONcLEnfkeosPCMG4xtJ4RrVVG6N49k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dBJgtvB3aejV4UqUwvnyrjR4omBHH2tSmhlM1dlb8timD4fOh5fqswI7gTcmlcOS14stLpIxitvhsDT4hBbPNyWQcW/2L5PDgnaTBgjZr6MR2rTUxTm3vVLC+WjVQATnAtx4avEzA/gopMNOW0+Ar67kRbgIWnvW0N3VMbjHyYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CbiFpTy6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49B85rHn013984;
	Fri, 11 Oct 2024 14:10:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JG+qCOwNzes/12OugottnOOGov+cp30/ZQ20lU/WJOo=; b=CbiFpTy6yQRtSYL3
	MqekI1vN9av2UO2Nupy3jGTrMqTlEjhpMIjgWhyYtCzXc9ALSiyRLUxUKZABN7Hn
	hvFCpHX+y6lsD69czKC6uQn5NBmKVEjUueRP5WnVds2q37aqWYHCqOhg5SwfrDj1
	7INxEraIHjEjJvRvdYk6YiNa4ivhen5LfY2v9TkHwHgNxS6/dTdfJkuUMPGRb7u3
	n/5SAqip1eGtsnvAVledrYl7ZG0MX2kpAtX+VT4gQJ3Kz/E3g9ilwga0MOkmpFb+
	O0rMhchrUCmNLHAuRmAZu/K2m9aUv3g0TNGYHPU+31+GMLXEgLIqlipKWeGBRK0p
	KdCvAA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 427077h20v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 14:10:42 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49BEAfCF014752
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 14:10:41 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 11 Oct 2024 07:10:32 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <akapatra@quicinc.com>, <hariramp@quicinc.com>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <hverkuil-cisco@xs4all.nl>, <cros-qcom-dts-watchers@chromium.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_vikramsa@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: [PATCH v3 7/8] arm64: dts: qcom: sc7280: Add support for camss
Date: Fri, 11 Oct 2024 19:39:31 +0530
Message-ID: <20241011140932.1744124-8-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241011140932.1744124-1-quic_vikramsa@quicinc.com>
References: <20241011140932.1744124-1-quic_vikramsa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: LBdlW7hMXgGo3DkyNTt7aBtGQoU7FX_p
X-Proofpoint-ORIG-GUID: LBdlW7hMXgGo3DkyNTt7aBtGQoU7FX_p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 mlxscore=0 impostorscore=0 bulkscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410110098

Add changes to support the camera subsystem on the SC7280.

Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 175 +++++++++++++++++++++++++++
 1 file changed, 175 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index b41230651def..9bab2d8dc1b4 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -4426,6 +4426,181 @@ cci1_i2c1: i2c-bus@1 {
 			};
 		};
 
+		camss: camss@acaf000 {
+			compatible = "qcom,sc7280-camss";
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				<&camcc CAM_CC_IFE_0_CSID_CLK>,
+				<&camcc CAM_CC_IFE_1_CSID_CLK>,
+				<&camcc CAM_CC_IFE_2_CSID_CLK>,
+				<&camcc CAM_CC_IFE_LITE_0_CSID_CLK>,
+				<&camcc CAM_CC_IFE_LITE_1_CSID_CLK>,
+				<&camcc CAM_CC_CSIPHY0_CLK>,
+				<&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+				<&camcc CAM_CC_CSIPHY1_CLK>,
+				<&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+				<&camcc CAM_CC_CSIPHY2_CLK>,
+				<&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+				<&camcc CAM_CC_CSIPHY3_CLK>,
+				<&camcc CAM_CC_CSI3PHYTIMER_CLK>,
+				<&camcc CAM_CC_CSIPHY4_CLK>,
+				<&camcc CAM_CC_CSI4PHYTIMER_CLK>,
+				<&gcc GCC_CAMERA_AHB_CLK>,
+				<&gcc GCC_CAMERA_HF_AXI_CLK>,
+				<&camcc CAM_CC_CPAS_AHB_CLK>,
+				<&camcc CAM_CC_IFE_0_AXI_CLK>,
+				<&camcc CAM_CC_IFE_0_CLK>,
+				<&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
+				<&camcc CAM_CC_IFE_1_AXI_CLK>,
+				<&camcc CAM_CC_IFE_1_CLK>,
+				<&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
+				<&camcc CAM_CC_IFE_2_AXI_CLK>,
+				<&camcc CAM_CC_IFE_2_CLK>,
+				<&camcc CAM_CC_IFE_2_CPHY_RX_CLK>,
+				<&camcc CAM_CC_IFE_LITE_0_CLK>,
+				<&camcc CAM_CC_IFE_LITE_0_CPHY_RX_CLK>,
+				<&camcc CAM_CC_IFE_LITE_1_CLK>,
+				<&camcc CAM_CC_IFE_LITE_1_CPHY_RX_CLK>;
+
+			clock-names = "camnoc_axi",
+				"csi0",
+				"csi1",
+				"csi2",
+				"csi3",
+				"csi4",
+				"csiphy0",
+				"csiphy0_timer",
+				"csiphy1",
+				"csiphy1_timer",
+				"csiphy2",
+				"csiphy2_timer",
+				"csiphy3",
+				"csiphy3_timer",
+				"csiphy4",
+				"csiphy4_timer",
+				"gcc_camera_ahb",
+				"gcc_camera_axi",
+				"soc_ahb",
+				"vfe0_axi",
+				"vfe0",
+				"vfe0_cphy_rx",
+				"vfe1_axi",
+				"vfe1",
+				"vfe1_cphy_rx",
+				"vfe2_axi",
+				"vfe2",
+				"vfe2_cphy_rx",
+				"vfe0_lite",
+				"vfe0_lite_cphy_rx",
+				"vfe1_lite",
+				"vfe1_lite_cphy_rx";
+
+			interconnects = <&gem_noc  MASTER_APPSS_PROC 0 &cnoc2 SLAVE_CAMERA_CFG 0>,
+				<&mmss_noc MASTER_CAMNOC_HF  0 &mc_virt SLAVE_EBI1     0>;
+
+			interconnect-names = "ahb", "hf_0";
+
+			interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 640 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 641 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 360 IRQ_TYPE_EDGE_RISING>;
+
+			interrupt-names = "csid0",
+				"csid1",
+				"csid2",
+				"csid_lite0",
+				"csid_lite1",
+				"csiphy0",
+				"csiphy1",
+				"csiphy2",
+				"csiphy3",
+				"csiphy4",
+				"vfe0",
+				"vfe1",
+				"vfe2",
+				"vfe_lite0",
+				"vfe_lite1";
+
+			iommus = <&apps_smmu 0x800 0x4e0>;
+
+			power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
+				<&camcc CAM_CC_IFE_1_GDSC>,
+				<&camcc CAM_CC_IFE_2_GDSC>,
+				<&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			power-domains-names = "ife0", "ife1", "ife2", "top";
+
+			reg = <0x0 0x0acb3000 0x0 0x1000>,
+				<0x0 0x0acba000 0x0 0x1000>,
+				<0x0 0x0acc1000 0x0 0x1000>,
+				<0x0 0x0acc8000 0x0 0x1000>,
+				<0x0 0x0accf000 0x0 0x1000>,
+				<0x0 0x0ace0000 0x0 0x2000>,
+				<0x0 0x0ace2000 0x0 0x2000>,
+				<0x0 0x0ace4000 0x0 0x2000>,
+				<0x0 0x0ace6000 0x0 0x2000>,
+				<0x0 0x0ace8000 0x0 0x2000>,
+				<0x0 0x0acaf000 0x0 0x4000>,
+				<0x0 0x0acb6000 0x0 0x4000>,
+				<0x0 0x0acbd000 0x0 0x4000>,
+				<0x0 0x0acc4000 0x0 0x4000>,
+				<0x0 0x0accb000 0x0 0x4000>;
+
+			reg-names = "csid0",
+				"csid1",
+				"csid2",
+				"csid_lite0",
+				"csid_lite1",
+				"csiphy0",
+				"csiphy1",
+				"csiphy2",
+				"csiphy3",
+				"csiphy4",
+				"vfe0",
+				"vfe1",
+				"vfe2",
+				"vfe_lite0",
+				"vfe_lite1";
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
+			};
+		};
+
 		camcc: clock-controller@ad00000 {
 			compatible = "qcom,sc7280-camcc";
 			reg = <0 0x0ad00000 0 0x10000>;
-- 
2.25.1


