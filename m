Return-Path: <linux-media+bounces-50389-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4869ED11156
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 09:10:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AEBEB302D485
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 08:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7379D3446AD;
	Mon, 12 Jan 2026 08:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SGvfBaVT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EB7NV/Jc"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2409234402B
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 08:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768205134; cv=none; b=froxHSrRiGUvOpO3KuXWBzYc1de2fLBBI9/Mc6er2MsRub+DKsJNWCBo74JXeFpW85lSYrunGm/N1Yd/6pwmPJAOXM0lcqCjSGk8jMYy9xEc+PM99RycD5szU3fy6fCxz6a1GdmEdwywKDe/qM1/W+yfXHne63NYJ2Xo82rg6Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768205134; c=relaxed/simple;
	bh=96WrBixWbEA0flUiWTIzei1KNWmIZmL0YLK2srZxHJ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fuzL7cf80omhRhEvmEqwdJzCylS90WmX/yPLnUMn8iuclKSTF05hP5oFbp6vqJ4m4sXTCHesOhxv8Q57YJvontJqpUfAKizA2G+7hUgYUPwTG+bRw9mmGct32fe4AMDhuKATSSvj0r47P9htRQS/Ly5Dz2dpPqa8i4as67dQn+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SGvfBaVT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EB7NV/Jc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C82OAc3532432
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 08:05:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W1zijEtPXBzyA/aWJ/rt1gqjP8uk5LhoHmbSSqj8Wug=; b=SGvfBaVT/juR37gy
	ZbxH9UElbMYVDF4oqAJAB0IQp6bxSR2nYzkbT8EhOETKaBXZixbiH3yn+RXn6BlX
	ZDUmIWNUnw/LXJiovkYGvFqiEk9wrJWiYmC0PxND1gd+4YkRb5jKjnU1iQ5u5VlC
	QaMUxHiDDrq6yAp0lWubVZHLMKUxE/hzNcRKkxj7ktws9+FiGFLqhsc8lvFBr9s8
	ytJvUxj9Sing7SVWdAgTlCSLZByBV+st8Rxytm+9YV+mfcDXSd71tM8C+sT+lIGu
	Wab0XfAptaTlzwvoy0Q4d/Av0qPc4CSXL7CinPuojbqkwdz/MOEgXW2PwHq7NtEj
	LfX42w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkjvxurcu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 08:05:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed79dd4a47so142315211cf.3
        for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 00:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768205131; x=1768809931; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W1zijEtPXBzyA/aWJ/rt1gqjP8uk5LhoHmbSSqj8Wug=;
        b=EB7NV/Jc1SY1ZiWJaOpn+u2MIUj1lLHA6eziDekS0rBDoYBKORCDMS4zC+NIbB6hnv
         3rDxaKelHN1NkRKB9T5738f3l2sLguURx1TPSJAe6UDfSGVaR7BPrVXMFd6eVluL99bO
         Zjvcx6Ql4bOW3o2u+eSfj+Oz2dy/YsWJqT0D4pCm4GOdmkdFMuA6ZsLosJqHBkjew07H
         kRlKCV5AL4cgc7hkIXId5VpDwnJ60eq4dUh5DfT1oNtzThpaoY/TdHqW9L85FcL+qgaG
         7fET114c63Xr9I1fBu+aLmGbM0lWuAelvBJFjcspU3uH/AlOtMW0isYzQlkmDb9Fy2Dx
         ez4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768205131; x=1768809931;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W1zijEtPXBzyA/aWJ/rt1gqjP8uk5LhoHmbSSqj8Wug=;
        b=SOSBMzmNukm3onyCh8+XXbcugC6gGkXROQXSMx22TpG/rT23hLjdKdjhgiowVXpJJR
         oH1gccdxyz9YXzok0FXbXaxTUV2VLvfqaiPKNfQzMh8908Pmhbod/H76AuyLd3oz8aZf
         b8z/NEllu/iN9bGAgIssPacMv2NHWPWjIeyRnSuWuawCht47BvNrnoXWnpf4ymC8Z9c1
         itFoImBokxePJLxQx+sQbPLeVjuTkrMmLH2C3/31mg1SX3j1TS0JPsisg+5Yl2ZqKt3Y
         F0IZjCUNWs/u2g5XlLkQBHZw+K6mF1VcU9Ml7TMQjOL/YBO4cythQFOpEM1DcSKi7vXX
         8QdQ==
X-Gm-Message-State: AOJu0Yz8FosEHKZzvkfNDsVnd0JNSCxgXcTVpEKyTtd+Kt2DuXvZLL5U
	CAMm5spTgFop92Riu3vOhdo/oxz0HhZvBbSyM9xss0EBnhAc6lKBQBKqup/3cjvR7YUdHNoeoQ6
	wQfIoFsRH2UqNn2FF6/ULOegEEr27PsC/K/zK66V+LkJpzOI+XrEofwVwFOcID+8/vA==
X-Gm-Gg: AY/fxX5+pf5PVpPEs5y2wcr1Yo0fHTTLys7xvySiS3ZvVjIINsfOjVV3zS+N9he9I/1
	Ej/GI3F03Yk4TDC6VJHv0tnqip1w22DJgzUDzJ1HfApoSMG8qiJa9yvw27i+Il0N8eDjEAJ3dXi
	fpSQYNv4aj66MLmXxkPyFfE904w4r0ypwnq7ogT1RwPPkcXOSYgWvv+ePOLuT0oQ/8BKmlCbCK/
	v3+HtGGxxo5JlCrMR0P50CE55htyyH1rKggWSWo9edbum4NTYf+o5Od84Wkr8GlEDayIhyQRmpS
	ngFeSauCVPAU2o0OBtBc64/SXg+T/B9CVqtPUHWUTwJif7Q9nGWogXqd6b0fFs61uj32Jz7dq7x
	jOWMDWQeQiAzttE7WkQhuX51pDEndV/gwsg+2Hf0u8XIxAz7uoF+VceFh8piXjF1SlwgtfwHYX/
	lr
X-Received: by 2002:ac8:5f0a:0:b0:4e8:af8a:f951 with SMTP id d75a77b69052e-4ffb4aed9ffmr240841291cf.83.1768205131300;
        Mon, 12 Jan 2026 00:05:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEBXCamg0DTS8zkIEYRaQ3Kie6jaWAFB/Y8zk1M9ChVqV+WPYgtwHYMj+YC7YInklpvje4D+w==
X-Received: by 2002:ac8:5f0a:0:b0:4e8:af8a:f951 with SMTP id d75a77b69052e-4ffb4aed9ffmr240840941cf.83.1768205130768;
        Mon, 12 Jan 2026 00:05:30 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ffa8d39230sm123116201cf.6.2026.01.12.00.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 00:05:30 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 16:04:54 +0800
Subject: [PATCH v4 3/3] arm64: dts: qcom: talos: Add camss node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-sm6150-camss-v4-3-0cd576d627f7@oss.qualcomm.com>
References: <20260112-sm6150-camss-v4-0-0cd576d627f7@oss.qualcomm.com>
In-Reply-To: <20260112-sm6150-camss-v4-0-0cd576d627f7@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768205107; l=6713;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=96WrBixWbEA0flUiWTIzei1KNWmIZmL0YLK2srZxHJ4=;
 b=HdS2+mVdYX+9KEUkWHMOzjS7yyMNiF3XP8sia16VCiha1WlEOGm2aGDemLdOw999Oc08dt0ry
 g9GRKC9QFdJAJTesCyd+1K20nlYIycGsEFN6Ujxb7fcaaJYSWDSRJh7
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=Wrsm8Nfv c=1 sm=1 tr=0 ts=6964ab4c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=_q6n6E3gDzqWkXQ7FWgA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: DR3U25CTry6Bd5NJiRavu8rTc3vCwH7z
X-Proofpoint-ORIG-GUID: DR3U25CTry6Bd5NJiRavu8rTc3vCwH7z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA2MiBTYWx0ZWRfX+/Xhm7n09lkC
 ucKPulKSwLqE+skd3yFCVsGXUnkK4CJDKfLkbIXRsd7kAabaIW0+nQhv3YePogkdUEF7eWT4CRE
 Cc2bz2BDU4h44jTLHKn6tt0gz/D70bOzPcqGZnX2TfISoLQ/N/0kKaA16G6ynnGPC0WObCF3aWc
 fAhuSf+DGDsLYSV/nqrWeDtscT4h2orCMj9iFKqDxsC/s+CzjbamJOPGl0DZWjWdAb5kZFnS9dn
 pEZ3J7jmiZ6u6dh7OgV9ArEcpTRMkXQpkYCviJAI07/vPTU8mHTBVseZqOM8Wj/itGTE/LxZhgq
 vyZQwnFsV/EBd8rzSMZHlRigm2lCVGsUbvM5+LpzikNThkC1JGeiMEuyvtLGFE3sEtn5Aa1EGZ2
 kECmL+Dgx1XdkxbAkHpXAwqYen8fgYbfcNGgu8V4wuVohIy5fENJ5sH0alo1UCqBzYaPz5qDgFM
 sPD8MGGXoAh3BnbC6sQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120062

Add node for the SM6150 camera subsystem.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 200 ++++++++++++++++++++++++++++++++++++
 1 file changed, 200 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 8171ec482be054a6d2bc8afdd1a122fa4fc591a2..5e5b43441e8919d6afc5a457e61f8a49664db66a 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -3780,6 +3780,206 @@ videocc: clock-controller@ab00000 {
 			#power-domain-cells = <1>;
 		};
 
+		camss: isp@acb3000 {
+			compatible = "qcom,sm6150-camss";
+
+			reg = <0x0 0x0acb3000 0x0 0x1000>,
+			      <0x0 0x0acba000 0x0 0x1000>,
+			      <0x0 0x0acc8000 0x0 0x1000>,
+			      <0x0 0x0ac65000 0x0 0x1000>,
+			      <0x0 0x0ac66000 0x0 0x1000>,
+			      <0x0 0x0ac67000 0x0 0x1000>,
+			      <0x0 0x0acaf000 0x0 0x4000>,
+			      <0x0 0x0acb6000 0x0 0x4000>,
+			      <0x0 0x0acc4000 0x0 0x4000>,
+			      <0x0 0x0ac6f000 0x0 0x3000>,
+			      <0x0 0x0ac42000 0x0 0x5000>,
+			      <0x0 0x0ac48000 0x0 0x1000>,
+			      <0x0 0x0ac40000 0x0 0x1000>,
+			      <0x0 0x0ac18000 0x0 0x3000>,
+			      <0x0 0x0ac00000 0x0 0x6000>,
+			      <0x0 0x0ac10000 0x0 0x8000>,
+			      <0x0 0x0ac87000 0x0 0x3000>,
+			      <0x0 0x0ac52000 0x0 0x4000>,
+			      <0x0 0x0ac4e000 0x0 0x4000>,
+			      <0x0 0x0ac6b000 0x0 0x0a00>;
+			reg-names = "csid0",
+				    "csid1",
+				    "csid_lite",
+				    "csiphy0",
+				    "csiphy1",
+				    "csiphy2",
+				    "vfe0",
+				    "vfe1",
+				    "vfe_lite",
+				    "bps",
+				    "camnoc",
+				    "cpas_cdm",
+				    "cpas_top",
+				    "icp_csr",
+				    "icp_qgic",
+				    "icp_sierra",
+				    "ipe0",
+				    "jpeg_dma",
+				    "jpeg_enc",
+				    "lrme";
+
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CSIPHY0_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY1_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY2_CLK>,
+				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+				 <&camcc CAM_CC_SOC_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_0_CLK>,
+				 <&camcc CAM_CC_IFE_0_AXI_CLK>,
+				 <&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_0_CSID_CLK>,
+				 <&camcc CAM_CC_IFE_1_CLK>,
+				 <&camcc CAM_CC_IFE_1_AXI_CLK>,
+				 <&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_1_CSID_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
+				 <&camcc CAM_CC_BPS_CLK>,
+				 <&camcc CAM_CC_BPS_AHB_CLK>,
+				 <&camcc CAM_CC_BPS_AXI_CLK>,
+				 <&camcc CAM_CC_BPS_AREG_CLK>,
+				 <&camcc CAM_CC_ICP_CLK>,
+				 <&camcc CAM_CC_IPE_0_CLK>,
+				 <&camcc CAM_CC_IPE_0_AHB_CLK>,
+				 <&camcc CAM_CC_IPE_0_AREG_CLK>,
+				 <&camcc CAM_CC_IPE_0_AXI_CLK>,
+				 <&camcc CAM_CC_JPEG_CLK>,
+				 <&camcc CAM_CC_LRME_CLK>;
+			clock-names = "gcc_ahb",
+				      "gcc_axi_hf",
+				      "camnoc_axi",
+				      "cpas_ahb",
+				      "csiphy0",
+				      "csiphy0_timer",
+				      "csiphy1",
+				      "csiphy1_timer",
+				      "csiphy2",
+				      "csiphy2_timer",
+				      "soc_ahb",
+				      "vfe0",
+				      "vfe0_axi",
+				      "vfe0_cphy_rx",
+				      "vfe0_csid",
+				      "vfe1",
+				      "vfe1_axi",
+				      "vfe1_cphy_rx",
+				      "vfe1_csid",
+				      "vfe_lite",
+				      "vfe_lite_cphy_rx",
+				      "vfe_lite_csid",
+				      "bps",
+				      "bps_ahb",
+				      "bps_axi",
+				      "bps_areg",
+				      "icp",
+				      "ipe0",
+				      "ipe0_ahb",
+				      "ipe0_areg",
+				      "ipe0_axi",
+				      "jpeg",
+				      "lrme";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_CAMNOC_HF0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_CAMNOC_HF1 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "ahb",
+					     "hf_0",
+					     "hf_1",
+					     "sf_mnoc";
+
+			interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 459 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 461 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 463 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 475 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 476 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csid_lite",
+					  "csiphy0",
+					  "csiphy1",
+					  "csiphy2",
+					  "vfe0",
+					  "vfe1",
+					  "vfe_lite",
+					  "camnoc",
+					  "cdm",
+					  "icp",
+					  "jpeg_dma",
+					  "jpeg_enc",
+					  "lrme";
+
+			iommus = <&apps_smmu 0x0820 0x40>,
+				 <&apps_smmu 0x0840 0x00>,
+				 <&apps_smmu 0x0860 0x40>,
+				 <&apps_smmu 0x0c00 0x00>,
+				 <&apps_smmu 0x0cc0 0x00>,
+				 <&apps_smmu 0x0c80 0x00>,
+				 <&apps_smmu 0x0ca0 0x00>,
+				 <&apps_smmu 0x0d00 0x00>,
+				 <&apps_smmu 0x0d20 0x00>,
+				 <&apps_smmu 0x0d40 0x00>,
+				 <&apps_smmu 0x0d80 0x20>,
+				 <&apps_smmu 0x0da0 0x20>,
+				 <&apps_smmu 0x0de2 0x00>;
+
+			power-domains = <&camcc IFE_0_GDSC>,
+					<&camcc IFE_1_GDSC>,
+					<&camcc TITAN_TOP_GDSC>,
+					<&camcc BPS_GDSC>,
+					<&camcc IPE_0_GDSC>;
+			power-domain-names = "ife0",
+					     "ife1",
+					     "top",
+					     "bps",
+					     "ipe";
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


