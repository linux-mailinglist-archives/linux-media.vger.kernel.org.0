Return-Path: <linux-media+bounces-30330-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0BAA8B8A4
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 14:14:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2290A3A5511
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 12:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3E1524C083;
	Wed, 16 Apr 2025 12:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fwUNQmN/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A6924C66C
	for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 12:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744805367; cv=none; b=Up6JGrxDhGydVV9QSjZsluia6skeUbxkCbcviLrr7Rx/CPy2yPLOGXbjJ1ZQUTQqGmqKKCjIK+JN5+TM6mIOr8F9moURef6Us48gKDvGtj4xjuN/Rwzr46K1yFSpntyxK/oHngyrGzMG9AHFmuFYqIiZVZ1D9dhhIv6WL6REFYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744805367; c=relaxed/simple;
	bh=OqhOoI2tcXTG0wlBrE+3lgaB36K07OcLYbZIEAwMF6g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fXppx0sDneGdJn53jvZaUmz8bPVz3MUoQPYF4zewbhpJewtI18i+L6IdtgXw1qeOE/kQeHOiiliFUQ8o4tjhaJ4B8vMtetHRss1BcfugUDOtTuhdGUObcrKPJLD31g0HInPzq3g/IJoCa09Z4JmERuGmW11qDpx6i5QvalGqVds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fwUNQmN/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G9mCKF021313
	for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 12:09:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TdDsbHFW7Px
	dDWoRI/tvr0I5QZItG1JmOXgwMLEsLgU=; b=fwUNQmN/gkjj/RgpQCDdiRSCKAd
	jh2aylSxsEl0e+2+b/Y9C6YypGFl+NezGxBhVjVy0MCX456JC+lWaGhkkdqu6lkL
	wcwOpZCK7l0BTZpCUd7x50Kxp2GU/ZD7IxV3oL+Rw26QCHLO8KYL9EjkdQiMY1tf
	MxHKmZaRkmKTaKqkW7pucxc6zfOXX1Uv1g4Dy41SAGr1ZJKUUEjmsD3Xt2ZZyQ1Z
	ccchDuqhwpDd6pC2ky/jTzbQOh+MshGUBawk6G7/7FW4+DZ0nrRuL0UiGgBbc6rA
	zWe9k6vn3PEumk2p2cyg9fabJ3QqSQudmw7Q71keys8/UT0vTvcfUx1npOw==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygj9bdkf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 12:09:24 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-3f6a7cba17bso6055318b6e.1
        for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 05:09:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744805364; x=1745410164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TdDsbHFW7PxdDWoRI/tvr0I5QZItG1JmOXgwMLEsLgU=;
        b=Sj0wfH1WMdPa5crIg8G0HLbmT0AzHroMrziDDC1+bxWDyQ1ial2qLj5LwER9J6ZVMU
         xRVqEuwLjOXRhUYOt3ZDp+vJlIzJ8ubLjrlhnPsDMHIJD1Igg5fKTnJBTLWZAWPS5yR6
         sGP4nCPp9LR+c6KwErQ1RxkU3drPKHhm0V3iNK6A5pHdu720EQgUQXtVyHvt5OjvPUUQ
         dS55SpfTnRpvEaix220CzSdsf1rvPYjVxRigZ6PT4DqqMWsQXfu1bN4gRziqzFOWepHp
         E+n7SWWQ/O9Ef0axspGugURHm/lNacwehuG4kkouqbM/fdJQO3wSXNa5Ln4osFnGQc3L
         L7fg==
X-Forwarded-Encrypted: i=1; AJvYcCXIrPwPEr9bi3Tek1tFJrai0CKzrfTANCfP7FmoLtTM4VfR8mun6lAbmdWg4H/IxFnr8HzOX9lc4d+Gfg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3OKQF3L1LwwBtd5yMPL2PGs9BXACFWiMPCkU9fqBoVGd3ZyoD
	rGy5BDVTUacCBw06d38eTJF8uJ8Yj3XIOx+DWeXjdXaaNrp8u4L50t3Vm6qilofcT3ACIFp+fXy
	X9HHEvp/ZBvNfEQXWUGZ/JZMsFbnxRjZEHlHkoaIWSoDZmc33BsDqtSsxHIwnqg==
X-Gm-Gg: ASbGnctoADuoL7X9h04a3WE65NFsFADnH+bQOxzWMBsC54htU8iRg++1qTUybC/dNBN
	pjrsbNYV9FtjiGUWvbY69OXBB2j6WNVUumsMiicYpVBpXhctv1Izrv+S0IYavjO1mSdqZ0N4sf5
	EhCYyYvQAXoR9BC8SkuwIPYnSzVDgDx4Y4pNGIvP6sA4YW4WT+/w69zOc/L0Kc01xxWe/NeGQev
	cbipNi4QJHTvale+q73oTsS5Ov0CYEwLn3Yg6iTe28BHkInkZ9d7D5WS5c6mzmhld+0Na5hI5UW
	5aiyetdQAuoSVM5nluvtEpp8xWm62+Yqar/glpLO1jg6/fs=
X-Received: by 2002:a05:6808:bd0:b0:3f4:1838:50d with SMTP id 5614622812f47-400b022e76cmr768942b6e.35.1744805363805;
        Wed, 16 Apr 2025 05:09:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPxwGuY2IT3x38U3lP9QQuKdo27S9+gWmKkyWLAv/MVq8s4YMRehZlhUvSkwnIYyyKJSfNXA==
X-Received: by 2002:a05:6808:bd0:b0:3f4:1838:50d with SMTP id 5614622812f47-400b022e76cmr768915b6e.35.1744805363476;
        Wed, 16 Apr 2025 05:09:23 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:15e4:d866:eb53:4185])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36f068968sm8328669a12.35.2025.04.16.05.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 05:09:23 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, rfoss@kernel.org, konradybcio@kernel.org,
        andersson@kernel.org, krzk+dt@kernel.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH 6/6] arm64: dts: qcom: qcm2290: Add CAMSS node
Date: Wed, 16 Apr 2025 14:09:08 +0200
Message-Id: <20250416120908.206873-6-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250416120908.206873-1-loic.poulain@oss.qualcomm.com>
References: <20250416120908.206873-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Kk2FPhRuENV5cV93_OiXFZAzQ3ZK96rh
X-Authority-Analysis: v=2.4 cv=PruTbxM3 c=1 sm=1 tr=0 ts=67ff9df4 cx=c_pps a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10 a=QcRrIoSkKhIA:10 a=EUspDBNiAAAA:8 a=EzCDy3pf2FPqfMyO2-oA:9 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-GUID: Kk2FPhRuENV5cV93_OiXFZAzQ3ZK96rh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_04,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=998
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160099

Add node for the QCM2290 camera subsystem.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 93 +++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index f0746123e594..4b81e721e50c 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -1579,6 +1579,99 @@ adreno_smmu: iommu@59a0000 {
 			#iommu-cells = <2>;
 		};
 
+		camss: camss@5c52000 {
+			compatible = "qcom,qcm2290-camss";
+
+			reg = <0 0x5c6e000 0 0x1000>,
+			      <0 0x5c75000 0 0x1000>,
+			      <0 0x5c52000 0 0x1000>,
+			      <0 0x5c53000 0 0x1000>,
+			      <0 0x5c6f000 0 0x4000>,
+			      <0 0x5c76000 0 0x4000>;
+			reg-names = "csid0",
+				    "csid1",
+				    "csiphy0",
+				    "csiphy1",
+				    "vfe0",
+				    "vfe1";
+
+			interrupts = <GIC_SPI 210 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 212 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 72 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 73 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 211 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 213 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csiphy0",
+					  "csiphy1",
+					  "vfe0",
+					  "vfe1";
+
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
+
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&gcc GCC_CAMSS_AXI_CLK>,
+				 <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+				 <&gcc GCC_CAMSS_TFE_0_CSID_CLK>,
+				 <&gcc GCC_CAMSS_TFE_1_CSID_CLK>,
+				 <&gcc GCC_CAMSS_CPHY_0_CLK>,
+				 <&gcc GCC_CAMSS_CPHY_1_CLK>,
+				 <&gcc GCC_CAMSS_CSI0PHYTIMER_CLK>,
+				 <&gcc GCC_CAMSS_CSI1PHYTIMER_CLK>,
+				 <&gcc GCC_CAMSS_TFE_0_CLK>,
+				 <&gcc GCC_CAMSS_TFE_1_CLK>,
+				 <&gcc GCC_CAMSS_TFE_0_CPHY_RX_CLK>,
+				 <&gcc GCC_CAMSS_TFE_1_CPHY_RX_CLK>,
+				 <&gcc GCC_CAMSS_NRT_AXI_CLK>,
+				 <&gcc GCC_CAMSS_RT_AXI_CLK>;
+			clock-names = "ahb",
+				      "axi",
+				      "top_ahb",
+				      "csi0",
+				      "csi1",
+				      "csiphy0",
+				      "csiphy1",
+				      "csiphy0_timer",
+				      "csiphy1_timer",
+				      "vfe0",
+				      "vfe1",
+				      "vfe0_cphy_rx",
+				      "vfe1_cphy_rx",
+				      "camnoc_nrt_axi",
+				      "camnoc_rt_axi";
+
+			iommus = <&apps_smmu 0x400 0x0>,
+				 <&apps_smmu 0x800 0x0>,
+				 <&apps_smmu 0x820 0x0>,
+				 <&apps_smmu 0x840 0x0>;
+
+			interconnects = <&bimc MASTER_APPSS_PROC RPM_ALWAYS_TAG
+					 &config_noc SLAVE_CAMERA_CFG RPM_ALWAYS_TAG>,
+					<&mmrt_virt MASTER_CAMNOC_HF RPM_ALWAYS_TAG
+					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
+					<&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>;
+			interconnect-names = "ahb",
+					     "hf_mnoc",
+					     "sf_mnoc";
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


