Return-Path: <linux-media+bounces-50767-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D426D23DF4
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 11:14:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EBC11309633A
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 10:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE96B22E406;
	Thu, 15 Jan 2026 10:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZRXT1g5i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gYDMMDuh"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368B835A94F
	for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 10:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768471996; cv=none; b=MuE+VDwpmSHOdYyZcUDfJaM+mzcuQQXZdoZIi4mduKNAmbsxjasIk3GTiDEgnKRF9spIyrUNqBgwMlC+KN18SSByyWzsMk+6vnm5/5Nk2Is5zjrOl1CTVN92Vr+0opZqgeEQ56TYbDyEDtgxQ+KxIqWz6MNYYqKe/RKUra5s+PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768471996; c=relaxed/simple;
	bh=5Ona5M9uA1G6MtS0rXSl9JaevxMMrhBygC6kd44fLE8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LTF6LjjpK+PnQZOhlnUwx2VlTBJ7lYVy+ylsLQCpFfoEMAvvbkIy0y3iT/QRlPjOlihfTNbX//1xihsVRxrBT1qrIgxOQhxlkcfpNATviEhJEhVM5Z3j4YLHAl5JH+QzoQQ63QKuvYSgCbIYdOobKCBRDi7xkASwFWzdBqffnyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZRXT1g5i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gYDMMDuh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6fgkM1581834
	for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 10:13:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PHcdJp6/TQDyz/DCPOcR6LgU6yYWHNz8joDLoergiJY=; b=ZRXT1g5i3GFxBgsv
	lmVUXC4n5/7A45oqdNVT5qmPytsbsxWtfRoySx82clfSDKTGcn5hyUUT231mEzqq
	rENDLcbF/u/k6vj7HtxZkCpbYt8R/Df7GAuPLPWAKO18EcY6Jbbnl79HESxbKRxy
	DfXNUXPTzoNeLjkJH312ewe+9o/sb6Z+C5CduIDpB4GRXrGyzOYEdKEP2z+8VR7M
	3Jna9doTASM1hFA9Fj5nO29eqevppbZ+tH3IfQZk8Vro1Nf27Jy65qbWNPLsntKo
	UMFw6dN7y2C7gnHUKOSY9KIdpoCkYPwSuT4Tt+82eL6Fv459/RYR4nYxOMRHkMaX
	OqdoVA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpj1pt46n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 10:13:13 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a316ddbacso16557516d6.2
        for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 02:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768471993; x=1769076793; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PHcdJp6/TQDyz/DCPOcR6LgU6yYWHNz8joDLoergiJY=;
        b=gYDMMDuhsWH6E5MaulQgrwReETgLyUcHRxs1eCjxNdHJcYRJUHKfFBClXK3zE0KUNe
         zvA/9JQBc2RmXn5nMUI59v4p7lJTDJ3I5Y7LkQRjFlwdknaVJlrrzNyICU79xxtA8ABp
         qmMgiLd9bo+peA8xlOZxxjMtTV9QOC2GKp1qYYNXZc/irWBNrN0/1shisRLiwKBKfgfF
         6kp6aQ1KcdHg/1a9W2kMYu7PwpBU5xcat8ywWs4ZJnkzaUc4YUSvu84C1d+FGHfjcKo4
         lLsl47J5IAw3CBb+T1s3LheOsQw/ymk/mldlqRk9q1qCAw/KUnK+5aqmPetWvc++USy9
         5FHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768471993; x=1769076793;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PHcdJp6/TQDyz/DCPOcR6LgU6yYWHNz8joDLoergiJY=;
        b=seNc3zvHQfVI1uawzm6DNIAjgMr7frogkvodXrHPEH+1q9VrrJYU04VlArTLA+fUg5
         2bTTbJWlpmK/pwJ2VXCaZfJO5OCe0hwqkKpePCGpUuacW3I6Gz3VmpZqlC/B2ISHiy2O
         cw2JbO7MhDGRgy38HNuaiVVCyKY8pE6zyHeWWDMNZJQRM7hbd+i12QmRN0UiIumAu7zy
         dd67TTgG5lOJkntaNcC0npAGdeAkOGtGk3H9H5+jmVb2S5kJj9Okd8XaS5XWt+8c0MCa
         XfpkJqz/FcKeszIvYX71zX05Y0RpTe5seXzPhVHXD74qwpemFofUah9n/iiQm1+Safbu
         Jzqg==
X-Forwarded-Encrypted: i=1; AJvYcCUy4I6GWFz6H5rutAkszmqqk4LNQLu2jLn7gedyB3VsJpxllMKo9uwHACdM3YRJYDwoGr7nOL5HEUvtxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxB2GHzcwDHJoZHKfXa0wFdMF29xBhNtbz0Y6ctLAEHwdJ+8sa6
	FzVw93WsmsK0iP8ZNxYvBEDzMaBvweALH7mN/FU2H37aK7QNqDemlUCyAvHSWRlUI0aLShYqTx9
	uDM26P0tEGdL7opFJzJtLHN646bcuFDaFGdiVvCgdWTOYrT8Dqcl0vBCZhOdBjdo73A==
X-Gm-Gg: AY/fxX43nydN6/pd803ufpymzxT35P8gNtPjoadDjwero6/SUhCP+pGgGr2CC5zD5wM
	Q7XvJ3euIkkIa0kk8BvRi3oOyFJ2OKD3T6CULNycONBjSA5IlReaLVHcWzPtt2S6JwJE4BXVt6n
	PmCRYCvIoCaHJMA2DYO0QXWjsOhFmihPWYEZTgf8bPKAEWwtU/RMduVQSeUAqnuRE6hrRd0Age6
	y5cpt0HwzoZ+QTt4iXgdcGGvwbrMaWVI7ifNKiN4ddG2p7GqXyAoRaX9IuCzQ+U3HztU46srKfc
	NCi66vb+3vPp9tutg5lWe3Nnz8Bh/nX8krDH9o97CAwv8sdeLv6Tw8L1tYvRR/pfMCARlz49LIG
	qj26h8G1YMpU3YSL0/BhxZ8ErfSNuzx/pUnD4pxuDAemrdHdCOwNyrQpScA1gU2Nka+7xDnPf6+
	kE
X-Received: by 2002:a05:6214:629:b0:890:808f:c262 with SMTP id 6a1803df08f44-8927437eeacmr80974966d6.29.1768471992510;
        Thu, 15 Jan 2026 02:13:12 -0800 (PST)
X-Received: by 2002:a05:6214:629:b0:890:808f:c262 with SMTP id 6a1803df08f44-8927437eeacmr80974536d6.29.1768471991993;
        Thu, 15 Jan 2026 02:13:11 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890772340b9sm199959576d6.26.2026.01.15.02.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 02:13:11 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 18:12:37 +0800
Subject: [PATCH v3 1/5] arm64: dts: qcom: talos: Add camss node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-sm6150_evk-v3-1-81526dd15543@oss.qualcomm.com>
References: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
In-Reply-To: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768471975; l=6743;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=5Ona5M9uA1G6MtS0rXSl9JaevxMMrhBygC6kd44fLE8=;
 b=KsWUpHDPa0GAvVQQny03nZ0vabHvwBJyTZexH6E68O2XuyrrMRWAUYZGCWmR6RjeovSYLHzIJ
 fYkcSBnEdGaDu6D9gxPKNcq3J1GRtYD0HwyCld0MxD+oY+/VSZyR9rm
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA3MyBTYWx0ZWRfX4HBXaKJTXKf1
 UMc2rxvnVBgUpYQ86XSCvLkGbMEUD7OrcPhJ1Z+AIZ2YYHUoTRvT5je7XLFIaIqfv3x+lG051um
 AC5m3V+8ujXB6W/QxzsXJr4zwh3RM3b4c/BhDOxE3Vi3/YYlEwlHTi0E73yg/zFO3lL1eIOfaNp
 mQlTfwcsT7OL0iDREiYY6hrWesjtZ1NOnaS25hfg+DaOuwhtJr8MEKnwDKspqUzcLQwLBXIjxfo
 LG/YBxUQaT/vrWZ/czL+nRwBhIYz0Pzgci5L9PINbBiZf2DYLfZyUZssmyhoQJjAhHJszTEF1h/
 M/4ZTufQd9ZXsf7eww2Z/n7vpcKORziUrSqxXTwBea5gWyTeiBlSc/FjQUr0CmV1YgB/QQ33QbE
 w5AMjIHuAYC79AnmjUCDCr14g1wDKNwyvT8EQccHZEtf7oAScg9dJMTHurTd3ZV/vOobiYUnPrI
 FDUaVk2qXr5beO0We7Q==
X-Authority-Analysis: v=2.4 cv=J+KnLQnS c=1 sm=1 tr=0 ts=6968bdb9 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=_q6n6E3gDzqWkXQ7FWgA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: bTSgrByonxbkGBP6iXnaa-AMyWjVfAJm
X-Proofpoint-ORIG-GUID: bTSgrByonxbkGBP6iXnaa-AMyWjVfAJm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_03,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150073

Add node for the SM6150 camera subsystem.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 200 ++++++++++++++++++++++++++++++++++++
 1 file changed, 200 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 6b9f2521d718eb5c9683393a2e5b67928631d96f..fe59975d56d6e65163dc7fcce8e08c50fadc3786 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -3790,6 +3790,206 @@ videocc: clock-controller@ab00000 {
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
+			interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 466 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 459 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 461 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 463 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 475 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 474 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 476 IRQ_TYPE_EDGE_RISING 0>;
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


