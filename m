Return-Path: <linux-media+bounces-32880-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 338F7ABD282
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 10:58:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8D411884221
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 08:58:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14BB4267AE3;
	Tue, 20 May 2025 08:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="C4IEyHmq"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B225C266EFB;
	Tue, 20 May 2025 08:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747731449; cv=none; b=KOdGyjJLiy8ej6cEAfU2t+9cw+8Mf2ZsbQEyVaSloiV3PNGIAqGcbd2ZQsTfLU58nW+bZoqhJBmJsAHh6cwu/Y/oPKb/Rp9j944xD32QhSf40ByQKK/JF71zI2GSHYTjDWInG3qJji6SbXb9bLMrlTWBCtR5NkWdVpp/2upHvJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747731449; c=relaxed/simple;
	bh=YfPXqblY6AHS56RJ7UdughYqt+VlrLKvlRH5ly0i0eY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=FN20Jbb0r9asd8/HlsI+N58Hgk2c0ZvRYo69H9+R1s+jb4yPnLwR/aGOveexylr1Dza3hm9ndLxDy3RmAnPEw+crvemGU6o6sezNDwdDKgZjgtyWZB+DU1AvNyk5aScu8A5tNX/tyQCXyvtoK5xTmetF4tkHgNuCUGaaxkNyyGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=C4IEyHmq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K82rJr014679;
	Tue, 20 May 2025 08:57:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d8RQ7GSbDaXU7BKG6Wm+A1eLvcy+2fTQ/MISO73rIEk=; b=C4IEyHmqRgOc6mpd
	F5+2uaGaScFV7GzQ2uYm1mNPnXTSXplC+1IcJMBGbPbXGQLmvMSX4y3DGx5dx2Ib
	goyWNW87FjA68pR/ZnUR/++W4zdgyD6LE9o41ONesOOqT8xwM4vdQa3lVp5gRe7d
	rEKpsmzHS1MDviScdP1dC5t+76kvRnoQrSHLtwSf9clAQbzWkxdZbhD/a5ub/KRX
	uVrqx7Z+GhEe/L54xgqT6FgMSduOji3wsEGwajfUfNonrHf4buhW0CYQZ1gs2tBP
	uZmsW3B0v7SSs8cdKEMxGJ5KlpeLRqTcIBoogtNp2YPju9dQAa8x4pC06qUIwKXy
	EYiKmg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rbt21jua-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 08:57:23 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54K8vMUM019902
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 08:57:22 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 20 May 2025 01:57:18 -0700
From: Wenmeng Liu <quic_wenmliu@quicinc.com>
Date: Tue, 20 May 2025 16:56:51 +0800
Subject: [PATCH 1/2] arm64: dts: qcom: qcs615: Add support for camss
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250520-qcs615-adp-air-camss-v1-1-ac25ca137d34@quicinc.com>
References: <20250520-qcs615-adp-air-camss-v1-0-ac25ca137d34@quicinc.com>
In-Reply-To: <20250520-qcs615-adp-air-camss-v1-0-ac25ca137d34@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <bryan.odonoghue@linaro.org>,
        <todor.too@gmail.com>, <rfoss@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Wenmeng Liu <quic_wenmliu@quicinc.com>,
        <linux-media@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747731434; l=4704;
 i=quic_wenmliu@quicinc.com; s=20250211; h=from:subject:message-id;
 bh=YfPXqblY6AHS56RJ7UdughYqt+VlrLKvlRH5ly0i0eY=;
 b=bzWuOdo6P0qxfE2NKXAYPOblxmCwoUyRQ4T+dzNi4a4HzSE2oaR3DM7uWkmRyofm2BgrmE8+v
 8bVjCY6Ru9tCt24EhwxAH2Lzx8tR5PncKSkePwbYq9dqiIff6aaPmjV
X-Developer-Key: i=quic_wenmliu@quicinc.com; a=ed25519;
 pk=PTegr3w0f1C9dOSL6CUdJR5+u+X/4vsW7VMfwIMeMXQ=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDA3MiBTYWx0ZWRfX6/g/KB7Pdq+V
 KJT5zhdu1xvN+WiiqEcePGJYpd7p+MBHlRQImereNec69UB+MJKOG1MQx52snhzu6LrX6BybEt7
 TuR/oRd3RMykK3eazbtVFD/+9zPv56rCp8RASfnq8vPvq9Jg24nVzyVILKWFzT3zdaU/iRFU4AX
 gMMLJ9pcxUD9aWWu79uv7PfveolCeE8imNf4k6+zLKVwEGlGY4CHRciXmT94z3gw+DgFhlM7EcC
 em7JXEDgt9Gcm89oLhyY5zm7k0jEFPIg98xzyWs4flqSSZwHBs583cqsbFghpraUJChWF4DoEeK
 4yAfxwBq419TGQRW+im2KtQROuy92zDbnEsN6+0QrvAbvd2KfJtSYli8RgpMw5q7KJa1hFqdZSa
 MpW/Fk9Up039artAgkDhEmcJaSsXTygN9WprkhNopZB86VLb8lVQJis20MfcKS7FbooLAvos
X-Proofpoint-GUID: FzdCh5vDlUbeEEZ_bVhm41t8NC7DjNq2
X-Proofpoint-ORIG-GUID: FzdCh5vDlUbeEEZ_bVhm41t8NC7DjNq2
X-Authority-Analysis: v=2.4 cv=dISmmPZb c=1 sm=1 tr=0 ts=682c43f3 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=G04TWIFFH9wquOfMwVsA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 mlxscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=806
 lowpriorityscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505200072

Add support for the camera subsystem on the QCS615 Qualcomm SoC. This
includes bringing up the CSIPHY, CSID, VFE/RDI interfaces.

QCS615 provides
- 2 x VFE, 3 RDI per VFE
- 1 x VFE Lite, 4 RDI per VFE
- 2 x CSID
- 1 x CSID Lite
- 3 x CSI PHY

Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 133 +++++++++++++++++++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index 47e350f175860e7b06f7b2c13fed75a65e489c8a..535251efc6b559447482b9ecc67ca26e7efbbb8c 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -3242,6 +3242,139 @@ videocc: clock-controller@ab00000 {
                         #power-domain-cells = <1>;
                 };
 
+		camss: camss@acb3000 {
+			compatible = "qcom,qcs615-camss";
+
+			reg = <0x0 0x0acb3000 0x0 0x1000>,
+			      <0x0 0x0acba000 0x0 0x1000>,
+			      <0x0 0x0acc8000 0x0 0x1000>,
+			      <0x0 0x0ac65000 0x0 0x1000>,
+			      <0x0 0x0ac66000 0x0 0x1000>,
+			      <0x0 0x0ac67000 0x0 0x1000>,
+			      <0x0 0x0acaf000 0x0 0x4000>,
+			      <0x0 0x0acb6000 0x0 0x4000>,
+			      <0x0 0x0acc4000 0x0 0x4000>;
+			reg-names = "csid0",
+				    "csid1",
+				    "csid_lite",
+				    "csiphy0",
+				    "csiphy1",
+				    "csiphy2",
+				    "vfe0",
+				    "vfe1",
+				    "vfe_lite";
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CPHY_RX_CLK_SRC>,
+				 <&camcc CAM_CC_CSIPHY0_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY1_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY2_CLK>,
+				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
+				 <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
+				 <&camcc CAM_CC_SOC_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_0_CLK>,
+				 <&camcc CAM_CC_IFE_0_AXI_CLK>,
+				 <&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_0_CSID_CLK>,
+				 <&camcc CAM_CC_IFE_0_CLK_SRC>,
+				 <&camcc CAM_CC_IFE_1_CLK>,
+				 <&camcc CAM_CC_IFE_1_AXI_CLK>,
+				 <&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_1_CSID_CLK>,
+				 <&camcc CAM_CC_IFE_1_CLK_SRC>,
+				 <&camcc CAM_CC_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CLK_SRC>;
+
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "cphy_rx_src",
+				      "csiphy0",
+				      "csiphy0_timer",
+				      "csiphy1",
+				      "csiphy1_timer",
+				      "csiphy2",
+				      "csiphy2_timer",
+				      "gcc_axi_hf",
+				      "slow_ahb_src",
+				      "soc_ahb",
+				      "vfe0",
+				      "vfe0_axi",
+				      "vfe0_cphy_rx",
+				      "vfe0_csid",
+				      "vfe0_src",
+				      "vfe1",
+				      "vfe1_axi",
+				      "vfe1_cphy_rx",
+				      "vfe1_csid",
+				      "vfe1_src",
+				      "vfe_lite",
+				      "vfe_lite_cphy_rx",
+				      "vfe_lite_csid",
+				      "vfe_lite_src";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC 0
+					 &config_noc SLAVE_CAMERA_CFG 0>,
+					<&mmss_noc MASTER_CAMNOC_HF0 0
+					 &mc_virt SLAVE_EBI1 0>;
+			interconnect-names = "ahb",
+					     "hf_0_mnoc";
+
+			interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csid_lite",
+					  "csiphy0",
+					  "csiphy1",
+					  "csiphy2",
+					  "vfe0",
+					  "vfe1",
+					  "vfe_lite";
+
+			iommus = <&apps_smmu 0x820 0x40>,
+				 <&apps_smmu 0x840 0x0>,
+				 <&apps_smmu 0x860 0x40>;
+
+			power-domains = <&camcc IFE_0_GDSC>,
+					<&camcc IFE_1_GDSC>,
+					<&camcc TITAN_TOP_GDSC>;
+			power-domain-names = "ife0",
+					     "ife1",
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
+			};
+		};
+
 		camcc: clock-controller@ad00000 {
                         compatible = "qcom,qcs615-camcc";
                         reg = <0 0x0ad00000 0 0x10000>;

-- 
2.34.1


