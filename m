Return-Path: <linux-media+bounces-22155-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8316C9DA568
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 11:06:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DDACFB2892F
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 10:06:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ECF319938D;
	Wed, 27 Nov 2024 10:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Y8G3k3SI"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB13194C65;
	Wed, 27 Nov 2024 10:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732701929; cv=none; b=lAyrajrhYt9ygEnNNtR1O5i7pUKFuN6RpdJCgywZ07P5hBPAl/ET22drmoZFY0iJlOZRSR8nJwHdfW85C4uHXKsm0xXcWwaF09hAg+b7Yw351bauc3wKmOwNJpk8v3YoqThXB513Ra8In0K3Wst2hgb/zeZlQQq0Ui+5SvxC79c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732701929; c=relaxed/simple;
	bh=sq4UOB7zAn35pocxiHu+uO76yqM8+6tibF0e8NKN6bA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iq8ulg37t0sTV0m0wTKIRT9WbtPKLfFVfY9AzWPZ4keZZPnXaRDuyDZ8Yp0v/GUsZt7rLxaWoBrsCiwtjCvqV/t0+Aa8nRTnSAJJB1pZ3Tsg8gVAc8zLTR9E4wWgdJYNIc0UzzG6sqUCmvUpFeFLysJY/YVfUDeMxPrV5ABGFlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Y8G3k3SI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AR64oZg000878;
	Wed, 27 Nov 2024 10:05:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MmL17NgoObz2v3hfoTS6LhtmT82msUQTEjTA6x8fTlM=; b=Y8G3k3SIfkZr/uAZ
	3er16K0N14wsVhuKR8o+2FNttmVyJTEpphomEJMOBPLGOg9e/c119unj9MK/YlAg
	kaB+6q4vNeg51Uq8VZpUTiKKD34VFEz1mcJXJzqHZtiiJWLrIoifejC5ROfCQQio
	r3eW/RJLjYumIyt34fRC0TRaOlKjxwiVjoBuT+AcQjQoDaq4uk1pqmqiMSwVlpwh
	4Jd0Z96GfVwIrgZz7FI7539Z0uhJAXhtI7ZIYlNvhaQcWkl+TiNtnrFbBHViTwOY
	8576w7f7IPNOGDGsOV0svjBpeW6h4AU6OtPjxuMDI8DozkYGxc7JiykdkdaEvoLy
	jok4zA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 435wuerngm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 10:05:15 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ARA5EjM024293
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 10:05:14 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 27 Nov 2024 02:05:04 -0800
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
Subject: [PATCH v6 4/5] arm64: dts: qcom: sc7280: Add support for camss
Date: Wed, 27 Nov 2024 15:34:20 +0530
Message-ID: <20241127100421.3447601-5-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241127100421.3447601-1-quic_vikramsa@quicinc.com>
References: <20241127100421.3447601-1-quic_vikramsa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: L3YRFJG2hs4QlzsAcOU23fTwWjPC2HsX
X-Proofpoint-GUID: L3YRFJG2hs4QlzsAcOU23fTwWjPC2HsX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=920
 clxscore=1015 adultscore=1 impostorscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411270082

Add changes to support the camera subsystem on the SC7280.

Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 170 +++++++++++++++++++++++++++
 1 file changed, 170 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 55db1c83ef55..9376755ac43e 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -4426,6 +4426,176 @@ cci1_i2c1: i2c-bus@1 {
 			};
 		};
 
+		camss: camss@acaf000 {
+			compatible = "qcom,sc7280-camss";
+
+			reg = <0x0 0x0acb3000 0x0 0x1000>,
+			      <0x0 0x0acc8000 0x0 0x1000>,
+			      <0x0 0x0acba000 0x0 0x1000>,
+			      <0x0 0x0accf000 0x0 0x1000>,
+			      <0x0 0x0acc1000 0x0 0x1000>,
+			      <0x0 0x0ace0000 0x0 0x2000>,
+			      <0x0 0x0ace2000 0x0 0x2000>,
+			      <0x0 0x0ace4000 0x0 0x2000>,
+			      <0x0 0x0ace6000 0x0 0x2000>,
+			      <0x0 0x0ace8000 0x0 0x2000>,
+			      <0x0 0x0acaf000 0x0 0x4000>,
+			      <0x0 0x0acc4000 0x0 0x4000>,
+			      <0x0 0x0acb6000 0x0 0x4000>,
+			      <0x0 0x0accb000 0x0 0x4000>,
+			      <0x0 0x0acbd000 0x0 0x4000>;
+			reg-names = "csid0",
+				    "csid0_lite",
+				    "csid1",
+				    "csid1_lite",
+				    "csid2",
+				    "csiphy0",
+				    "csiphy1",
+				    "csiphy2",
+				    "csiphy3",
+				    "csiphy4",
+				    "vfe0",
+				    "vfe0_lite",
+				    "vfe1",
+				    "vfe1_lite",
+				    "vfe2";
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
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
+				 <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_0_CLK>,
+				 <&camcc CAM_CC_IFE_0_AXI_CLK>,
+				 <&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_0_CSID_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_0_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_0_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_0_CSID_CLK>,
+				 <&camcc CAM_CC_IFE_1_CLK>,
+				 <&camcc CAM_CC_IFE_1_AXI_CLK>,
+				 <&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_1_CSID_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_1_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_1_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_1_CSID_CLK>,
+				 <&camcc CAM_CC_IFE_2_CLK>,
+				 <&camcc CAM_CC_IFE_2_AXI_CLK>,
+				 <&camcc CAM_CC_IFE_2_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_2_CSID_CLK>;
+			clock-names = "camnoc_axi",
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
+				      "gcc_camera_ahb",
+				      "gcc_cam_hf_axi",
+				      "soc_ahb",
+				      "vfe0",
+				      "vfe0_axi",
+				      "vfe0_cphy_rx",
+				      "vfe0_csid",
+				      "vfe0_lite",
+				      "vfe0_lite_cphy_rx",
+				      "vfe0_lite_csid",
+				      "vfe1",
+				      "vfe1_axi",
+				      "vfe1_cphy_rx",
+				      "vfe1_csid",
+				      "vfe1_lite",
+				      "vfe1_lite_cphy_rx",
+				      "vfe1_lite_csid",
+				      "vfe2",
+				      "vfe2_axi",
+				      "vfe2_cphy_rx",
+				      "vfe2_csid";
+
+			interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 640 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 641 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "csid0",
+					  "csid0_lite",
+					  "csid1",
+					  "csid1_lite",
+					  "csid2",
+					  "csiphy0",
+					  "csiphy1",
+					  "csiphy2",
+					  "csiphy3",
+					  "csiphy4",
+					  "vfe0",
+					  "vfe0_lite",
+					  "vfe1",
+					  "vfe1_lite",
+					  "vfe2";
+
+			interconnects = <&gem_noc  MASTER_APPSS_PROC 0 &cnoc2 SLAVE_CAMERA_CFG 0>,
+					<&mmss_noc MASTER_CAMNOC_HF  0 &mc_virt SLAVE_EBI1     0>;
+			interconnect-names = "ahb", "hf_0";
+
+			iommus = <&apps_smmu 0x800 0x4e0>;
+
+			power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
+					<&camcc CAM_CC_IFE_1_GDSC>,
+					<&camcc CAM_CC_IFE_2_GDSC>,
+					<&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "ife0", "ife1", "ife2", "top";
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


