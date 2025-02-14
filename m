Return-Path: <linux-media+bounces-26148-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4428AA35AC4
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 10:49:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE0DA16B945
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 09:49:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D33725A344;
	Fri, 14 Feb 2025 09:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pFcsebAz"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83E5257AD7;
	Fri, 14 Feb 2025 09:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739526516; cv=none; b=RVdiEuuJWLuBCXoHeA8M49qCOfTW8o5he68B5151XVROhoxS6SaBHA1ujUZrjZNxqIM1zBNt8l8oA8wHWvGLwHw6/HJ1NQ2ithYls8/T6f7j+x5j6zuc7rHH12dNAT9yMdBWcoQUyE08JmDzQ85dEWJmBRn6DedaB3e85ci5UvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739526516; c=relaxed/simple;
	bh=ViDF4KyCuNj5kzSXUSYzT2maKAT4h02SHQOqXM1+nCg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CJMMcqjoI6vxDFx/3CoQml9DNL47VVaUlQeE3Y3oOyRGyLutETzWFuJIWywBmNYEhGHkCcW7MW/rstCdWjTV3cL7yuDODdQadTbybSykRtY2btEH8KI9av2kxC0pHJmT7e6UR/N3YpT5r2RzkZABmCABwzvV0//8E9oHDjpe0Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pFcsebAz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51E8oIwi020887;
	Fri, 14 Feb 2025 09:48:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VBiD7/TI0aKseXEMmKgD2oELAB9ZikaBNgYWBQNctFA=; b=pFcsebAzMv82jAHT
	UkPnhxmze/K6gtfRBLz68CgeinFew8WbuNPJX9KRyCpvBeUiRGfRp47ChyCRcMdd
	a/51g2pVy5Rwac9ydfZSPjYFTkHhNfAZWhbWTd9ZD27OkoToHRRszNSBzvXq3kEW
	aKaWklsbS8DsC3J2xnqpQthMC4dlSQfNgbz68vUa0nmpuzOAbn61RoaqO9kKz99i
	HMudYkYZSYhQRSJsrt1H4rnuToH58TV56ZV39Nk7Wa9HA5YTk2wTCgU3/RD44lrY
	/LigQ5+Y5lklbZPisc3z1ADX1OwWVcxxNxpmZg2Uvn4vtrMSFXyaPI/UaaXljU/s
	fgKkfQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44sdyxuafd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 09:48:25 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51E9mOsa019242
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 09:48:24 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 14 Feb 2025 01:48:18 -0800
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_vikramsa@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Suresh
 Vankadara" <quic_svankada@quicinc.com>
Subject: [PATCH v1 2/2] arm64: dts: qcom: qcs8300: Add support for camss
Date: Fri, 14 Feb 2025 15:17:47 +0530
Message-ID: <20250214094747.2483058-3-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250214094747.2483058-1-quic_vikramsa@quicinc.com>
References: <20250214094747.2483058-1-quic_vikramsa@quicinc.com>
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
X-Proofpoint-ORIG-GUID: CDpqfKuzPUeeVMlWX_doHzcv8WDk8bv_
X-Proofpoint-GUID: CDpqfKuzPUeeVMlWX_doHzcv8WDk8bv_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_04,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 spamscore=0 bulkscore=0 suspectscore=0 mlxlogscore=828 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502140070

Add changes to support the camera subsystem on the QCS8300.

Co-developed-by: Suresh Vankadara <quic_svankada@quicinc.com>
Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 171 ++++++++++++++++++++++++++
 1 file changed, 171 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index 4a057f7c0d9f..c628573d6f54 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -2942,6 +2942,177 @@ videocc: clock-controller@abf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		camss: isp@ac78000 {
+			compatible = "qcom,qcs8300-camss";
+
+			reg = <0x0 0xac78000 0x0 0x1000>,
+			      <0x0 0xac7a000 0x0 0x0f01>,
+			      <0x0 0xac7c000 0x0 0x0f01>,
+			      <0x0 0xac84000 0x0 0x0f01>,
+			      <0x0 0xac88000 0x0 0x0f01>,
+			      <0x0 0xac8c000 0x0 0x0f01>,
+			      <0x0 0xac90000 0x0 0x0f01>,
+			      <0x0 0xac94000 0x0 0x0f01>,
+			      <0x0 0xac9c000 0x0 0x2000>,
+			      <0x0 0xac9e000 0x0 0x2000>,
+			      <0x0 0xaca0000 0x0 0x2000>,
+			      <0x0 0xacac000 0x0 0x0400>,
+			      <0x0 0xacad000 0x0 0x0400>,
+			      <0x0 0xacae000 0x0 0x0400>,
+			      <0x0 0xac4d000 0x0 0xf000>,
+			      <0x0 0xac60000 0x0 0xf000>,
+			      <0x0 0xac85000 0x0 0x0d00>,
+			      <0x0 0xac89000 0x0 0x0d00>,
+			      <0x0 0xac8d000 0x0 0x0d00>,
+			      <0x0 0xac91000 0x0 0x0d00>,
+			      <0x0 0xac95000 0x0 0x0d00>;
+			reg-names = "csid_wrapper",
+				    "csid0",
+				    "csid1",
+				    "csid_lite0",
+				    "csid_lite1",
+				    "csid_lite2",
+				    "csid_lite3",
+				    "csid_lite4",
+				    "csiphy0",
+				    "csiphy1",
+				    "csiphy2",
+				    "tpg0",
+				    "tpg1",
+				    "tpg2",
+				    "vfe0",
+				    "vfe1",
+				    "vfe_lite0",
+				    "vfe_lite1",
+				    "vfe_lite2",
+				    "vfe_lite3",
+				    "vfe_lite4";
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_0_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_1_CLK>,
+				 <&camcc CAM_CC_CSID_CLK>,
+				 <&camcc CAM_CC_CSIPHY0_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY1_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY2_CLK>,
+				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
+				 <&gcc   GCC_CAMERA_HF_AXI_CLK>,
+				 <&gcc   GCC_CAMERA_SF_AXI_CLK>,
+				 <&camcc CAM_CC_ICP_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_0_CLK>,
+				 <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_1_CLK>,
+				 <&camcc CAM_CC_IFE_1_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
+			clock-names = "camnoc_axi",
+				      "core_ahb",
+				      "cpas_ahb",
+				      "cpas_fast_ahb_clk",
+				      "cpas_ife_lite",
+				      "cpas_vfe0",
+				      "cpas_vfe1",
+				      "csid",
+				      "csiphy0",
+				      "csiphy0_timer",
+				      "csiphy1",
+				      "csiphy1_timer",
+				      "csiphy2",
+				      "csiphy2_timer",
+				      "csiphy_rx",
+				      "gcc_axi_hf",
+				      "gcc_axi_sf",
+				      "icp_ahb",
+				      "vfe0",
+				      "vfe0_fast_ahb",
+				      "vfe1",
+				      "vfe1_fast_ahb",
+				      "vfe_lite",
+				      "vfe_lite_ahb",
+				      "vfe_lite_cphy_rx",
+				      "vfe_lite_csid";
+
+			interrupts = <GIC_SPI 565 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 564 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 759 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 758 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 604 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 545 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 546 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 547 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 761 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 760 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 605 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csid-lite0",
+					  "csid-lite1",
+					  "csid-lite2",
+					  "csid-lite3",
+					  "csid-lite4",
+					  "csiphy0",
+					  "csiphy1",
+					  "csiphy2",
+					  "tpg0",
+					  "tpg1",
+					  "tpg2",
+					  "vfe0",
+					  "vfe1",
+					  "vfe-lite0",
+					  "vfe-lite1",
+					  "vfe-lite2",
+					  "vfe-lite3",
+					  "vfe-lite4";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "ahb",
+					     "hf_0";
+
+			iommus = <&apps_smmu 0x2400 0x20>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "top";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
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
+			};
+		};
+
 		camcc: clock-controller@ade0000 {
 			compatible = "qcom,qcs8300-camcc";
 			reg = <0x0 0x0ade0000 0x0 0x20000>;
-- 
2.25.1


