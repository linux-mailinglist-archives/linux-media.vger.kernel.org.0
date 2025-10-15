Return-Path: <linux-media+bounces-44582-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C63BDE9EA
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 15:04:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC4DC3AAA8C
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 13:02:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F110932BF40;
	Wed, 15 Oct 2025 13:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AkXkZmy5"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911952E6CA7;
	Wed, 15 Oct 2025 13:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760533343; cv=none; b=JyI/IfodLa2j6wTL0eGhLgs9VubjXtN7MizC9nH8mqQkIwH19fJZprOmdgy3mW7cObgyHTlrBpKRebFUuMHI14dg+JUgVl28inhU5ReZxCsgAtrxc8mRp56y8OoxCiTxbmKHWoPon/CyU9FtN5BtrlcuOw1Bji2qPKDEjqjhzSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760533343; c=relaxed/simple;
	bh=5sk7TrwDfO0me3ICrj1qqe+Y5L3w/gXq2dxRV1yDYhI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jbc2o0U6zaeiUYG9xkdW4pp/yv9cnnWku/HnulKrWo+tQLrZ7tXxvR5z8TLNfwKb+JFJm8lfUG/SAqKHPCjxKMT3B2YNT6jq26oyeguxoVZ8T2XSoK+NhTL71FOzl8BYxoP2+YvEvOPzXpNvjNPEJP8MDRoRL28ruBAvYfDtPEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AkXkZmy5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FAUNhH003544;
	Wed, 15 Oct 2025 13:02:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cQls1hx+D9LKxo+f9e5pfUENHdfudL+qwhdoHQ7oNKU=; b=AkXkZmy5fFqHsHWz
	5SnDxAmOa+KzNNAxpFdyZj1WGBB8JuUWsoMbfwe31Xp7eHP+kNDjmCaSEibnt4L7
	FZ2LGwPgTHpYayzRn5Sb9SbFHS+24PxuwvKMMIaN6WW5yQ1RENGvsOLjUqepmGBs
	jhGbjMladAiLxj81Rfi5csTkY4u084BTENy+YC6CugnuqfoIe0iXucLdUIpfZmiM
	md3IeAvBQ6vdPU4G9DdhetTso3JOysNMN4/tqqyCNFFwldcakZ7beHag/su7aI1f
	GFTSfOe/J8L+yqXQDktTAPcc5bc0cIg3QLpQiY19qXdJDKadT7ivMiEuI5I/aYb4
	z03Rog==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49sua8k27b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Oct 2025 13:02:03 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 59FD225t024820
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Oct 2025 13:02:02 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Wed, 15 Oct 2025 06:01:57 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <bryan.odonoghue@linaro.org>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_svankada@quicinc.com>,
        <quic_vikramsa@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 2/2] arm64: dts: qcom: qcs8300: Add support for camss
Date: Wed, 15 Oct 2025 18:31:30 +0530
Message-ID: <20251015130130.2790829-3-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251015130130.2790829-1-quic_vikramsa@quicinc.com>
References: <20251015130130.2790829-1-quic_vikramsa@quicinc.com>
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
X-Proofpoint-GUID: 3qys6yiVyFy52Kdr6vvXpjyV8ixKupwH
X-Authority-Analysis: v=2.4 cv=e5MLiKp/ c=1 sm=1 tr=0 ts=68ef9b4c cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=49fK2wAub7YDTLIv2YQA:9
 a=Ov2AurPJ2f_rkE3B:21 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE0MDEzNCBTYWx0ZWRfXy0kd7YRxa8dp
 1WnxFw4w2Q2z0lZFFEdyOC9aos3wFjW04E/p+p6PpHqkwMwfI6SZnuDOGHwL82JsAg5mqavNmoP
 7lMK6swSsTjzovWGNk2bDZg4rTcn2Eosx+lN36iGrhCBhmAxOlpmrYTNMvY2M6x1+heaBwBlSCY
 aAs4gHmHmXULGa7x4nTnmCd0K9V+Z7o/7elYK05NumFhug8udIF4dmnt5jSeklutwqaSR1oNAvH
 o9yE5aZXz44a76ReSP/6tX512LbDEVNr214Dit01VBQhOZd7fhFJ4lukfmRgzDzX5yBHnbpSieX
 HZ9uAmtCfATU8AYDJereRYRb+e3QvDCsQhVLQiS5kE1UaGAj7k3+Nbuy+R3h5JXE7Ux6q72ON2N
 ncWpcB+6cOkZGNCTIqEIcUpVFYmGyg==
X-Proofpoint-ORIG-GUID: 3qys6yiVyFy52Kdr6vvXpjyV8ixKupwH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510140134

Add changes to support the camera subsystem on the QCS8300.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 171 ++++++++++++++++++++++++++
 1 file changed, 171 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index 8d78ccac411e..acd475555115 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -4769,6 +4769,177 @@ videocc: clock-controller@abf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		camss: isp@ac78000 {
+			compatible = "qcom,qcs8300-camss";
+
+			reg = <0x0 0xac78000 0x0 0x1000>,
+			      <0x0 0xac7a000 0x0 0xf00>,
+			      <0x0 0xac7c000 0x0 0xf00>,
+			      <0x0 0xac84000 0x0 0xf00>,
+			      <0x0 0xac88000 0x0 0xf00>,
+			      <0x0 0xac8c000 0x0 0xf00>,
+			      <0x0 0xac90000 0x0 0xf00>,
+			      <0x0 0xac94000 0x0 0xf00>,
+			      <0x0 0xac9c000 0x0 0x2000>,
+			      <0x0 0xac9e000 0x0 0x2000>,
+			      <0x0 0xaca0000 0x0 0x2000>,
+			      <0x0 0xacac000 0x0 0x400>,
+			      <0x0 0xacad000 0x0 0x400>,
+			      <0x0 0xacae000 0x0 0x400>,
+			      <0x0 0xac4d000 0x0 0xf000>,
+			      <0x0 0xac60000 0x0 0xf000>,
+			      <0x0 0xac85000 0x0 0xd00>,
+			      <0x0 0xac89000 0x0 0xd00>,
+			      <0x0 0xac8d000 0x0 0xd00>,
+			      <0x0 0xac91000 0x0 0xd00>,
+			      <0x0 0xac95000 0x0 0xd00>;
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
+				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
+				 <&gcc GCC_CAMERA_SF_AXI_CLK>,
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
+				      "cpas_vfe_lite",
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
+					  "csid_lite0",
+					  "csid_lite1",
+					  "csid_lite2",
+					  "csid_lite3",
+					  "csid_lite4",
+					  "csiphy0",
+					  "csiphy1",
+					  "csiphy2",
+					  "tpg0",
+					  "tpg1",
+					  "tpg2",
+					  "vfe0",
+					  "vfe1",
+					  "vfe_lite0",
+					  "vfe_lite1",
+					  "vfe_lite2",
+					  "vfe_lite3",
+					  "vfe_lite4";
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


