Return-Path: <linux-media+bounces-37067-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF63AFC5C8
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 10:33:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80E313B65E6
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 08:32:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D5AC2BEFEC;
	Tue,  8 Jul 2025 08:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cYRhXqmR"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449852BE020
	for <linux-media@vger.kernel.org>; Tue,  8 Jul 2025 08:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751963564; cv=none; b=NZwztttF7fjCZIxMOSbCN1+RZ2JnWtW1WezGErroaNf1Ehv2uz+UAUhzJcOf09Cae7qCnOvNDHSfOQcENR81zU7sdZ0gvPt5GrOv+u3msqQgnjv2RHkixSQT4ASkdD/GsKEyOAnh6154fLRibNZZ0HA8SOlF/Qv/V3AMu0d8wP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751963564; c=relaxed/simple;
	bh=qec7WQ0nRrWh3diBjhh0sXqyofo+2eU24USSC2XNtXc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jTOszPfsFN+Q0BtMAsKKQ67VTGFQtaydx9OGt3w1Oc0sWwwr7mjuQiIDyA3D9f16Soq/XijjzgfMG2URL5rw7ih0iPqWFuYy9RNuh9IhBjo8FPob782lKWwe+8QCh03KTTc5msl9mKvEHtz+9Zcc2hAwSHB1VjqaV6BcIYPnr6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cYRhXqmR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5683KEhV029010
	for <linux-media@vger.kernel.org>; Tue, 8 Jul 2025 08:32:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9uktFifMviJ
	JC68UphCtN78iNLvndREyI0IZ+30nxEY=; b=cYRhXqmRwAzu7XsYpnIfVR08dNB
	t6J3WRC5TbReBWttSH3MZko9jd6ZlBtAO+EkL1SFPg+VsSl7HEEeuu5fEqM0smWe
	KsT1/sOP8bZ5AHZEEE9+PYPSKi6cxASW44iQvugB6yKKEpwREQVSctUP1O/+FJ8j
	e/cABOwpNz7BWm6sU9DCP7eklv+hFmIuD6jqKEhjtIkps5bqgnExzYEIOiAaZx4k
	EcIlibOFMCk8BPJYu2G88u4q/m7XXaZ4jkEcsdlY4oaLNrhr0gFPRhimy5jXdk58
	3/N9YynuuLU6fJ9ZMmFMJCjSOofPTlzXpzNoAF6tLdG0aOSz1lEKNj2gXwA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47rfq2x7ys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 08 Jul 2025 08:32:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d097fd7b32so852867285a.2
        for <linux-media@vger.kernel.org>; Tue, 08 Jul 2025 01:32:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751963561; x=1752568361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9uktFifMviJJC68UphCtN78iNLvndREyI0IZ+30nxEY=;
        b=mowjFdEcw5WU+1zdlvDuMKiQbxOKU5JOp0OVBaToum6r9dHDLjf+4B4yXIJIizHs2X
         y7WBynIJPHJpTPX3GfXmkb3LNQvybY6rtJOkPLX9KybiXudw6aTu1Y6Q/UUHB6JMv7wt
         /u9d1MJ77FfTJqJsyBQV72Gu51t4fUeuRLnqJJlMk8QfgoOV+eEc7WUk2jfGJxeL+NSl
         5ZlSeKMEg+8TnYd1GTpVCdf8ANrSlYAc5QW/rQGxF+OzGabC3924yopi8umTYS8FmXrN
         2ka9+1HmjamYcljTXoFtEqIqXX0ca31Cev79idS56LgKJzCv150hvwHbdJBvjrN8JQeJ
         oHzA==
X-Forwarded-Encrypted: i=1; AJvYcCUpMpChdXguxoOYrqFx4kBfcx709SQKuoB4L6QL7GTYtCglhhh2jYp3fU7ezco39pO83SE5PzyZCixwPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFpcA0/CDt6E4k9GhW/fP/Oip83rlfp4iLo1Rq1FL1JhO6BE7m
	wTs/Cs+vLBTd6BhKSQ/4E5ok82aa04wr7a9pFS2Nx0X0wfaF8Rvg0PeGLv4lN6+///XqkYAEpw2
	md81mXv8eR3uONxxQzfaa27rZ0/GevlpPFtkEh+MMxlbMS1pyLES82GzS+22pvFPXhQ==
X-Gm-Gg: ASbGnctbe8hvBtl5E9cS9e5/MoE3KXu/LJKh9navDeJs+/a6OyoQsEI5ieC/weYBM9V
	bTWgw9S0MdAsSL9XKRCjHItA36x2c/+rSsV8EAWT1cwJxLoqq4LNMCJaKuEgUguBwza/j+e3+VE
	xfNZfYV7zRLyExIPRqJkMjWoj4h3eF7M3a63LwugNjWNFBGdho2So432CLLLPfWT/qw3WACLqKW
	G8k0zEkvFpEBbUvroOHC64aQJo5x5Z9t1iWPakxW7c7vLZ03bB1Rk4wsx9a6I0zhC4rdX8bFeBl
	WIkstc1yWmtJT7gGNOSqkIGJIi5FFoyklEHkOy0TIECSZ48ToyZQmikf4Q==
X-Received: by 2002:a05:620a:2495:b0:7d5:d49d:3e29 with SMTP id af79cd13be357-7d5dcd0a63cmr2146625885a.45.1751963561112;
        Tue, 08 Jul 2025 01:32:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExwqZLIM59U4XHMTIb/gBt9Jq/PpTvZ1b/ZlUZwDxG6w2Fkn2/DrET0EmQMR+gO8kF1vqjIw==
X-Received: by 2002:a05:620a:2495:b0:7d5:d49d:3e29 with SMTP id af79cd13be357-7d5dcd0a63cmr2146621785a.45.1751963560434;
        Tue, 08 Jul 2025 01:32:40 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:953b:906f:73bc:cc41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b4708d0959sm12315812f8f.27.2025.07.08.01.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 01:32:39 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, rfoss@kernel.org, konradybcio@kernel.org,
        krzk+dt@kernel.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v6 6/6] arm64: dts: qcom: qcm2290: Add CAMSS node
Date: Tue,  8 Jul 2025 10:32:22 +0200
Message-Id: <20250708083222.1020-7-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250708083222.1020-1-loic.poulain@oss.qualcomm.com>
References: <20250708083222.1020-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDA2OCBTYWx0ZWRfXxM5AOUAsbZrz
 ZW+fPL/pDKV4A1p2hwUarqAKqjfp4ov/ak0DK3bXUX02zr/sOhW9wKyE6aRcSLguzURvRlhYsfB
 Pklrd5KowBiecs5BmNTWs1C8fk+WTvxxwoQwF2mJY/fVtMppZKIyANg5XleGDdTwEmLkl3TKCcn
 n/rr11639PyVZvMuxEBNNxoMTYYWePGJIsDnZaPMo0y/QWrVfHqhVUU8S/lyL0Aoo8TQC7w7XK/
 UH6/hATL/8Xk8IRExPAdbXigrB2VoWmAZ0l1HsumT3dxRiN0ntmbvwDgO3DXJ8OTIwAaBuexZzm
 g+jo14+CTlak84KtlzS6evumjuxjgRVBF13+tMpEKm8X7UfXX3yKSvu5LdpSLYOWVDmgsgmonsT
 eX0kKcQLX1mMrXAEKqwEk9BIyKAbmT5mS9iHrMKVgDVlhWpso2XH++JdtgSEjJGs2gUefnHz
X-Proofpoint-ORIG-GUID: vPFZfaA1f5AwWTTMk3afcRC1Hqus04I3
X-Proofpoint-GUID: vPFZfaA1f5AwWTTMk3afcRC1Hqus04I3
X-Authority-Analysis: v=2.4 cv=SOBCVPvH c=1 sm=1 tr=0 ts=686cd7aa cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=0Y5dpRjIoD8_tdedxaUA:9
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_02,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 adultscore=0 mlxlogscore=999 spamscore=0 impostorscore=0 phishscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080068

Add node for the QCM2290 camera subsystem.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 103 ++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index f49ac1c1f8a3..54046c069959 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -1628,6 +1628,109 @@ adreno_smmu: iommu@59a0000 {
 			#iommu-cells = <2>;
 		};
 
+		camss: camss@5c11000 {
+			compatible = "qcom,qcm2290-camss";
+
+			reg = <0x0 0x5c11000 0x0 0x1000>,
+			      <0x0 0x5c6e000 0x0 0x1000>,
+			      <0x0 0x5c75000 0x0 0x1000>,
+			      <0x0 0x5c52000 0x0 0x1000>,
+			      <0x0 0x5c53000 0x0 0x1000>,
+			      <0x0 0x5c66000 0x0 0x400>,
+			      <0x0 0x5c68000 0x0 0x400>,
+			      <0x0 0x5c6f000 0x0 0x4000>,
+			      <0x0 0x5c76000 0x0 0x4000>;
+			reg-names = "top",
+				    "csid0",
+				    "csid1",
+				    "csiphy0",
+				    "csiphy1",
+				    "csitpg0",
+				    "csitpg1",
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


