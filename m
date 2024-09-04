Return-Path: <linux-media+bounces-17562-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1208996B9D8
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 13:14:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF649281F6C
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 11:14:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0ED91D2237;
	Wed,  4 Sep 2024 11:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iv+3/nNA"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2021D014F;
	Wed,  4 Sep 2024 11:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725448353; cv=none; b=TuQ2s4h7craNUI1s2EW+Pn5qxrmHn2xC7RjYSaQcS/r7MyMRvkMCg4JLO0kvqaw8tNzmNMeVkfdJ+3DyZAgmv5LZXmLdfWcQLyrdc5hjjjuHO+lIgUS6ts8C0zMstiXWmz0Vxl36gS2w1Enad/NdFeoiL30trb0DTVCsMv8Ml9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725448353; c=relaxed/simple;
	bh=TDiCjwXaBQKG1nsRyTHoyOzWVuzEAID1JICUMDQO3Ls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=lFmKTwwMKtwpSldFI7nJjd7gny81IE6bHj59CZIQafSzISVyOCNl7ZDZA7bQtsGQHYfHvqUAB3GQ9GOgloDf2Ar80XxhPglKVx7f5MXhjK8QtzadJV8jJEJ2hoNAIcXdvoxKSzkBn6lgIBxDLX0wz1EyTu9ZmmHpH5hK59GU6F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iv+3/nNA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 484ANHJJ000699;
	Wed, 4 Sep 2024 11:12:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N/5ylamGMllBmEt3bOnxKkvgJejhp8nE5+PCYAYsIPM=; b=iv+3/nNAxP8d7Kvf
	1Que1vRVqmTBsfIxCQc81tZjQnoUeVYMBPkrAUSlKnKI0PkWnq5a9WCIwviAEKct
	AikIqlA0bJZkYQfau0C39vH9LQjjmOZp+XFizGPfOqhCfT6FVpJ2uD1/u1tCmVnn
	rnEGUqtKKgYPQCXXfCk5aqETqOIGz4VvTAillBIHFsxgLIoKIdsNzpU0LTOmXC2p
	asdkKG4A5q1cvvLcyaR7WiPx093QWSNDVJIIjha7iz488Cl/IR/z5Bb674hJ1aXk
	rcFEXDAwQWQLSTtmw+sRrdgCgVJExvPZa6GTOS7ytGqmv9MfzrsZKqGJP8UW2ZXg
	1LJUNw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41drqe4t0n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Sep 2024 11:12:21 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 484BCKt7011759
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Sep 2024 11:12:20 GMT
Received: from [169.254.0.1] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Sep 2024
 04:12:13 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
Date: Wed, 4 Sep 2024 16:40:13 +0530
Subject: [PATCH 07/10] arm64: dts: qcom: sc7280: Add support for camss
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240904-camss_on_sc7280_rb3gen2_vision_v2_patches-v1-7-b18ddcd7d9df@quicinc.com>
References: <20240904-camss_on_sc7280_rb3gen2_vision_v2_patches-v1-0-b18ddcd7d9df@quicinc.com>
In-Reply-To: <20240904-camss_on_sc7280_rb3gen2_vision_v2_patches-v1-0-b18ddcd7d9df@quicinc.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kapatrala Syed
	<akapatra@quicinc.com>,
        Hariram Purushothaman <hariramp@quicinc.com>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Vikram Sharma
	<quic_vikramsa@quicinc.com>,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725448289; l=5258;
 i=quic_vikramsa@quicinc.com; s=20240628; h=from:subject:message-id;
 bh=TDiCjwXaBQKG1nsRyTHoyOzWVuzEAID1JICUMDQO3Ls=;
 b=xJmXYqO4a8ogbKx+Xi+4xhzmER3TU92TUWpFAJeP/pOSDob8sYaeiXzwz7aYHFzGtZ5sn+vNl
 4qIoTyyFFXPAedcMfc49AW3vZeGJgyQJLelyOWU50xNK97E0NW3onty
X-Developer-Key: i=quic_vikramsa@quicinc.com; a=ed25519;
 pk=vQBkwZr1Hv+VXogAyTAu7AEx8/6bvkOmgrzYFbNGCDI=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: IEX_5uY_ABjQCGpLq0L-TzVoZQbHSdwc
X-Proofpoint-ORIG-GUID: IEX_5uY_ABjQCGpLq0L-TzVoZQbHSdwc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-04_09,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 spamscore=0 mlxlogscore=946 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2409040084

Add changes to support the camera subsystem on the SC7280.

Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 175 +++++++++++++++++++++++++++++++++++
 1 file changed, 175 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 3d8410683402..109aafe967f8 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -4419,6 +4419,181 @@ cci1_i2c1: i2c-bus@1 {
 			};
 		};
 
+		camss: camss@acaf000 {
+			compatible = "qcom,sc7280-camss";
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				<&camcc CAM_CC_CPAS_AHB_CLK>,
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
+				"cpas_ahb",
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
+			interconnect-names = "ahb", "hf_0";
+			interconnects = <&gem_noc  MASTER_APPSS_PROC 0 &cnoc2 SLAVE_CAMERA_CFG 0>,
+				<&mmss_noc MASTER_CAMNOC_HF  0 &mc_virt SLAVE_EBI1     0>;
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


