Return-Path: <linux-media+bounces-30779-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3F0A98081
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 09:21:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EA6317AECA3
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 07:20:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69CF6267B87;
	Wed, 23 Apr 2025 07:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ABawEz/n"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5325B267729
	for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 07:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745392873; cv=none; b=sWuYigYvzUYFshYRGWK0zzomX+XI2iadnMeGVK6TGbxNaGe8SHasuWMXmE75DKbmbDVszBqOh5zr9HnXYomEfd9IXNdsMETIoMNN83ghMjP4c2HCb4cSECETQVq/7CnykgzkFOkWllnZrzPOQnbQzrzyjaxssBiD2T8AYKwyXZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745392873; c=relaxed/simple;
	bh=1Zd3cytCKlXoV3voZ/Z7Aj3t392WLrLgaxbnoqan7mI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=akELp3egGZiG9zgTtKoUsm5IU87yFFzRs38UBd+FtZ4Mk/E+5jDIYnjRdgC+m6awYwENRllhnf+PVPHjSAouehhcbjwuA4ZRyFAttfdk3O/3cp6ZYTRzdqGrdqwKE8HqTR3iF2dgPGgUQovuM9v0QOh8Zc6xc0V/SlZ9Nn+m4Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ABawEz/n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0iMOm008515
	for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 07:21:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=B683B+9/R8J
	0Vz6Lz9+auTHlZvFsEtlwtzftkgtEyFY=; b=ABawEz/nCKXLAIFxNIlljSenwqi
	3U1lie7TKJkhIRInpKlGM/bonhGovDR8k+QQ59V5732tQWR+oqrLqA7mwTe/zz15
	6Axq3BlHJSdlds1kvCGbiCkRXzbfzYDvypOdyoxio0OSfnhQWk+iPKCwO0L1YeAd
	WU72c2I2nr7IhGi10/2r36fm27y0Jw8fNdfIghkBoRzipJokYgW4jHxd+tTjQHdw
	5vH4rJpb/CZHvvPTescZJ8cUlGUjuN0DILjF91HGK/Z2kweJHbGNMni4mTA9KZnB
	1yiBBYy8k8YVm7ELeJB6VOaah5F4lmBJJ9oh3TWv/r9knDfKjdHn8177/Vw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh597r5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 07:21:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5e2a31f75so585296485a.1
        for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 00:21:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745392870; x=1745997670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B683B+9/R8J0Vz6Lz9+auTHlZvFsEtlwtzftkgtEyFY=;
        b=um3RMSSifjeVHcUBs9SdfFu014h9ET8iE6xCIi7+ofds9XgxB2ESAoLlP3BvWR5J+g
         T/YsXWYP3cs8H/PKlzwGmqTxQy/9MHQ8+LQCH2fPr2lobBfpjNe4eajW6K3ssiOBh5cF
         n55YpRVf+ubCN7el1cdvASyYwFvNyP8s05EutRgdcINEgcYTpG5DM6XaH7f+hUn1/3Gv
         gEXPfGsr1/jMJPYv6s7LdCL1C4FoaQr+xn2IKSPtIzjhrUCtHiNX3qUohpP7uCfb+s6b
         MCCsb1kdM1J0f6tMqU4KCf2XqL9FF1PSM49+yvyI3jrlYDIhJaS4WEPcm4gDk8Eup5sV
         8+bw==
X-Forwarded-Encrypted: i=1; AJvYcCXXLatU9gefxYEgRdh4kazB+ixw1IkSVg4ce9d1X82QpvDalQlKplPBCQGgXGvOm/717PxyQjTvxznn4g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXewV4LpiZw9aYB1t6ybh/P9j1zsBM8rILWwB2jViVo0U5owba
	qjNOINDXE5hPV8PszqPyExn0V0e4A2G+QwG7fDWP5+8Xog8wRDgw4oagN0UwPfvbR5SFYXxbjYy
	EeqR/H/p7Na6S4GR/nHO0OWHHFltW+FB9nJLpUaMxMwtyTcxDI9TZUyA1GWHc1b1b/GpDew==
X-Gm-Gg: ASbGncsb/NMmKq7lMaPpS8vZ2lDdOLtdJmftKQIiVUGXLPW+B++kMkMxWPXUXNJ67JG
	DTCjuzn1S8sc0ZKDv6vFUda7xZJjUd1ItT7BDaTtKr2OyWRQvPGOHMNEsuSmEK4vtNt8DeBqnTF
	r/ASOVz/tPP+lC1IRojIXKwO42c+9ysrt2K5nR7PcVykb2PVIQy3wlscWNByeqv71H50BMHZuDK
	wgw0jnjZFhr+MKSkBoNmwF68LFoQ7TT5nEWaxCV2sfERVbzUpYgEc1zW5t/H5bwipQSP6zTByJY
	3c55g3Soo4UtAWMk2qGSkaXEmeQfBtWqNIpNsY0B001L/zQ=
X-Received: by 2002:a05:620a:17a3:b0:7c5:4949:23f1 with SMTP id af79cd13be357-7c928018f4bmr3185902085a.40.1745392865611;
        Wed, 23 Apr 2025 00:21:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECt3GX1jujYZOuYeyCML0aAD6UdbPw9WeBOejlwFn8+sdFqhMMJoUnxJtiQzipVzSrLzOy0A==
X-Received: by 2002:a05:620a:17a3:b0:7c5:4949:23f1 with SMTP id af79cd13be357-7c928018f4bmr3185898685a.40.1745392865332;
        Wed, 23 Apr 2025 00:21:05 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:10e3:ecaa:2fb2:d23a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec42af6sm757138366b.43.2025.04.23.00.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:21:04 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, rfoss@kernel.org, konradybcio@kernel.org,
        andersson@kernel.org, krzk+dt@kernel.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v4 6/6] arm64: dts: qcom: qcm2290: Add CAMSS node
Date: Wed, 23 Apr 2025 09:20:44 +0200
Message-Id: <20250423072044.234024-7-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250423072044.234024-1-loic.poulain@oss.qualcomm.com>
References: <20250423072044.234024-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA0OSBTYWx0ZWRfX0+dcOrNsXls9 N6SBgiASJX6H5K7ARkkpV+RE6J/6sGNZu6xe3SxDLedUDMTvNoeXxjJVAe+AdfEEo9nJdrjym6d dIQFGLnG3hdtC1F8hZqJamlZmtQBlYYQKb3BhbDfvG/M6FtX3VM3RNLjlpZCBLb0p/FK03n7BbL
 6KteIeVM4DKU08uXkYT2pIRRSQrxTvIF9jlLXhMAHHJJaPOlmnFTJILEKydl+iUOta5/PlWlhRz RXI/SwmGc0H0A/eNFb1UlKYZmAtBXVO8IUpPdizQ/QEP2xhcoXSHNFHrx5tjHDhJdx/jDKLWMWM ngpvNsQkOGBriMDn/6LeIVDMBMhlelpOSHO9rlDivV9YjIxv4qJ9Id5cF/JqE/JwyskfUWMspjf
 6wDdn28O5L5A8eCQVTye30Ysd2NPmJ5AxfB7hnZBe8VBoGO3DWOaxmofd7xSUvSbWgMRQ4tC
X-Proofpoint-GUID: 0EHX2gSgYlWzRZV-yoHs6EJLyWCkxmVm
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=680894e7 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10 a=QcRrIoSkKhIA:10 a=EUspDBNiAAAA:8 a=EzCDy3pf2FPqfMyO2-oA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 0EHX2gSgYlWzRZV-yoHs6EJLyWCkxmVm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_05,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230049

Add node for the QCM2290 camera subsystem.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 103 ++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index f0746123e594..e2fefa79b8ac 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -1579,6 +1579,109 @@ adreno_smmu: iommu@59a0000 {
 			#iommu-cells = <2>;
 		};
 
+		camss: camss@5c6e000 {
+			compatible = "qcom,qcm2290-camss";
+
+			reg = <0x0 0x5c6e000 0x0 0x1000>,
+			      <0x0 0x5c75000 0x0 0x1000>,
+			      <0x0 0x5c52000 0x0 0x1000>,
+			      <0x0 0x5c53000 0x0 0x1000>,
+			      <0x0 0x5c66000 0x0 0x400>,
+			      <0x0 0x5c68000 0x0 0x400>,
+			      <0x0 0x5c11000 0x0 0x1000>,
+			      <0x0 0x5c6f000 0x0 0x4000>,
+			      <0x0 0x5c76000 0x0 0x4000>;
+			reg-names = "csid0",
+				    "csid1",
+				    "csiphy0",
+				    "csiphy1",
+				    "csitpg0",
+				    "csitpg1",
+				    "top",
+				    "vfe0",
+				    "vfe1";
+
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&gcc GCC_CAMSS_AXI_CLK>,
+				 <&gcc GCC_CAMSS_NRT_AXI_CLK>,
+				 <&gcc GCC_CAMSS_RT_AXI_CLK>,
+				 <&gcc GCC_CAMSS_TFE_0_CSID_CLK>,
+				 <&gcc GCC_CAMSS_TFE_1_CSID_CLK>,
+				 <&gcc GCC_CAMSS_CPHY_0_CLK>,
+				 <&gcc GCC_CAMSS_CSI0PHYTIMER_CLK>,
+				 <&gcc GCC_CAMSS_CPHY_1_CLK>,
+				 <&gcc GCC_CAMSS_CSI1PHYTIMER_CLK>,
+				 <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+				 <&gcc GCC_CAMSS_TFE_0_CLK>,
+				 <&gcc GCC_CAMSS_TFE_0_CPHY_RX_CLK>,
+				 <&gcc GCC_CAMSS_TFE_1_CLK>,
+				 <&gcc GCC_CAMSS_TFE_1_CPHY_RX_CLK> ;
+			clock-names = "ahb",
+				      "axi",
+				      "camnoc_nrt_axi",
+				      "camnoc_rt_axi",
+				      "csi0",
+				      "csi1",
+				      "csiphy0",
+				      "csiphy0_timer",
+				      "csiphy1",
+				      "csiphy1_timer",
+				      "top_ahb",
+				      "vfe0",
+				      "vfe0_cphy_rx",
+				      "vfe1",
+				      "vfe1_cphy_rx";
+
+			interrupts = <GIC_SPI 210 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 212 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 72 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 73 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 309 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 310 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 211 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 213 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csiphy0",
+					  "csiphy1",
+					  "csitpg0",
+					  "csitpg1",
+					  "vfe0",
+					  "vfe1";
+
+			interconnects = <&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
+					 &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+					<&mmrt_virt MASTER_CAMNOC_HF RPM_ALWAYS_TAG
+					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
+					<&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>;
+			interconnect-names = "ahb",
+					     "hf_mnoc",
+					     "sf_mnoc";
+
+			iommus = <&apps_smmu 0x400 0x0>,
+				 <&apps_smmu 0x800 0x0>,
+				 <&apps_smmu 0x820 0x0>,
+				 <&apps_smmu 0x840 0x0>;
+
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
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
+			};
+		};
+
 		mdss: display-subsystem@5e00000 {
 			compatible = "qcom,qcm2290-mdss";
 			reg = <0x0 0x05e00000 0x0 0x1000>;
-- 
2.34.1


