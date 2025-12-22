Return-Path: <linux-media+bounces-49307-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C496CD5198
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 09:39:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EA0AD303EB80
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 08:36:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B021633A6EC;
	Mon, 22 Dec 2025 08:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BZ58OXCU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yw/hAgma"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CF833985A
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 08:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766392150; cv=none; b=LovbjfskWV7PE1B4EIcpO1hzuN8bOf1Di4dMwxccgOBIbGhGSiPMcTtGA0Cuhjxd2SCKlB+YK9Xoar3zOW+9sZAjSeYAqK4oi50XS3XTnRkssz+YHkO1Xh0QAWL7IcuEbkoymTwLaLOfZMijYB1Lc2ukd2A9wRhMNdTRWnfnfsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766392150; c=relaxed/simple;
	bh=PvRX6buVf5SzAEhfOLc8YkXfXVesNH9qpy1Tkh3qFcM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JICjNnHf1IfNGyQnI8BvwlNItji4jxNFGvcj1Oxm8Dkj41uiGbHHbRnmWeuuHJTAYU/iQfAAowL9gllS/66Ek0j0K+a7Aj1K2xLCdqXAWjsjkOm7ZDZlAdWWUrhnfkCjm24HGuUNXPf1tC8PbrC/q5oi8S1Q/anVl4eLIproA5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BZ58OXCU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yw/hAgma; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM7Xf2V4015153
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 08:29:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GBnihOtFbK8HujBlcYwjs3g6paibvwJ26w/d0W2YggA=; b=BZ58OXCUdWQc0D8W
	1Rf1wGDbe4V69gHJZw3fusqm/dqbZSizmlLbkn5jOy3EPhEDeMn9Vy39ua2sGQOi
	dXPSKFEbodLtn5hGRHeQIl/PVKMWJnJt8AGmcDNIdQTDc0pdWK6HQ13T+5JknAmw
	k3uCpbCs1Ct7OfZYATvk3jXlugQ7M9eBmsy8dQGeZKnXPpcd/tC0Fmsf2V35zGmB
	MLznRoE81pXQqJ4ckwyUf4AW53VJlT2zq5KBqbkzKpQqcCCtmY1un+13UIZniWyZ
	Ky/IoA8VTy7D0cVqD53CfBFm9hCN+MjL6ZyKzIBLzSOISqUUMLEeqtaCP9Feqn3s
	pG9PpA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mvfm9bc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 08:29:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b55a033a2aso1048847485a.0
        for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 00:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766392146; x=1766996946; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GBnihOtFbK8HujBlcYwjs3g6paibvwJ26w/d0W2YggA=;
        b=Yw/hAgmahL19YvYu1R7ekpxfVJDWdMvyTq+5ty+OT6fPR5Fc6c1LepFXnmp/8GhOTO
         wmu9o+zZMe1MQcAjX9Lf5bNdrLrj0MwHPoOO0X/ZFuFi5mfltxIQQ0GErNLrQ3OgqZiU
         CUqX7t/ZB+WE3gXC9hdvKEokHziXrznStAitikgxITF2CtuWNQ5Cuwyit+AwOAnNPvKv
         fvmNBQuKTNYm/iIQHlM6GoXFgA9z9VUr5ZypkjpWxoBNoz6OkXvA5VuRFbnu/fcClpMz
         cUqWy6ldXFYRwSADA4QRAdPUs4/BnT/OtnZmZU1xcVAreoaJHicxhzYhrfq9T0+GoF7d
         w20w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766392146; x=1766996946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GBnihOtFbK8HujBlcYwjs3g6paibvwJ26w/d0W2YggA=;
        b=hTd4AJNu03bUxxi6wZ6OnRAfsHSDKk/nIVJrCmXk0TS9vAIOcELTjYeLeocGqClMuT
         +n45H7fTm/uSppQtQhUkPb8tL0CEPeEDcoucmjGhaPhmbL9FMrEco87s83i1Ol0STpKV
         YvKtcH65BiSxMII20Ufyt3f17iIXtNNM3FqZPfb86dpnkc5o00xIPw66ZZhCXJJmmGhH
         TMFFhULB5Y1U5AmYLgibV6tdIJKslj2rWTO+W12RdB8gW0FS6qofnn6tyhrik4nPqaaJ
         aeu0lCpqOIUkCWgzi/S1dmkW+O9XJD2q37fcTc790POVlFfPLdWH3/iZq0pC1JbiaWSY
         f4aA==
X-Gm-Message-State: AOJu0YwAUy+KGmY0gPYSPHiM+jYCU9bnbH++rjFuGYh12dtjEdUMW9gO
	u4A28mTmJ/PTIY9uig6JEgTY2Rj8v1b9vsG4+e79pwvQHyCOlGV79sq08JOreRuzKe+qv38drT5
	dPLk2Anz5qPfTNTaWhndr8xcxCPwzY4A84zSSiEZTMHYO2VwEk/3laW6EN1eFoYm4LPRPuZc9Pw
	==
X-Gm-Gg: AY/fxX7g9NDKck0PyLyVJrYMI30U1bTIhrPWW2kqAJOvUbx8APj2jocwa9YX9vNYLpi
	psur5SPPZKHhP8rXNkED4M+zdZWRLdMrmH+BlED4bZXWeDRG9Dp5hEmwt2aRWgyVrGvgH2KmwTl
	96G69Xzw3du3vcZ5Mwqs2ptlvFZGDf8ifw/Px7uTYqsOMAg+lgbdRpyaonvi84M9vi8PceqOGev
	vUhiDjCABQgfkDFKdNbJ69REuad4JTW2EQ0iWihLm4XDH4qEw2VNPuvbxGYN0H6jIoScga3jU4b
	aSPsYsYwBGoM7awczwiZPGHdk0+FxvRyHwo6z3ZzlUJnC3R0LbMdKxo4/WOrZYfQykWEeXW27JY
	RdhUpz85rX0GLDNMiIAYeXtowR+HWctQ6s3/w2NZUougoTVfxOvDbx3pDh5noUIZHSJ2q+/Gt7j
	Ve
X-Received: by 2002:a05:620a:29c4:b0:811:8bbe:7a3c with SMTP id af79cd13be357-8bee76c9096mr2066094985a.23.1766392146426;
        Mon, 22 Dec 2025 00:29:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGzjlp5cT+8Lby+0xl3XfUmmXEv+Es/HLnbIS0DA46el1a6iXp2tjSKjdXA7oB1bvq9BCVWXw==
X-Received: by 2002:a05:620a:29c4:b0:811:8bbe:7a3c with SMTP id af79cd13be357-8bee76c9096mr2066092285a.23.1766392146024;
        Mon, 22 Dec 2025 00:29:06 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0970f8572sm764046585a.25.2025.12.22.00.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:29:05 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 16:28:41 +0800
Subject: [PATCH v2 3/3] arm64: dts: qcom: talos: Add camss node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-sm6150-camss-v2-3-df8469a8343a@oss.qualcomm.com>
References: <20251222-sm6150-camss-v2-0-df8469a8343a@oss.qualcomm.com>
In-Reply-To: <20251222-sm6150-camss-v2-0-df8469a8343a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766392123; l=6661;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=PvRX6buVf5SzAEhfOLc8YkXfXVesNH9qpy1Tkh3qFcM=;
 b=m3uwHTIzqYsYrJoWS2TmzBGPjk0+cfRZgJsGEbxQDIAhV4TeAQnD1/Ckd9sem0TSxxVJWjcoV
 A+rdtunTRKLAh07dWRStSEVZm+6zo05F/yAIYAi8/nv07nH+8s2Yca6
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=H8rWAuYi c=1 sm=1 tr=0 ts=69490153 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=_q6n6E3gDzqWkXQ7FWgA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: SjlcvznzVaT_AX1pS8tizraaWT023qZo
X-Proofpoint-GUID: SjlcvznzVaT_AX1pS8tizraaWT023qZo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA3NSBTYWx0ZWRfXyIweoXPrHh6a
 Ul/TLXNA5fo9NkpyfsvfLP0slzwmXBYFruBqhHzwYnQfzCoG1KeIVLJslO2iydR+kwf/xofKzCL
 oZ0sWz3E/JtP0lxQYvgIpiKgYKTEwSz01Q/2d/MkzWOabq00b6zw6U7YKwe3a5tR6vuoE4e3SMt
 ytro748UvGn8pmwqYABhXyeMBw3e8m/plgjUCQVbo/sx1ekbAK4N/4ph7khPXIPvgAVP/1ZQvaL
 khwUToNkBvkP0oK5sdbX/wr1EvT2JJpEH2G5g2lgd9/oTtAP/mYn4Kj3mMwTDpsLlNxv2AdJWv5
 D6LXueuH9xV//0qlDa8QVu+zcq0r/Hnk2ZcVcG9bZZlbYzcDlze8IlqD7WliP4ZI4n2jIGHGspH
 Qk3aB3wqfkTJQL/KhFpuPIKj4ZJUKTgnqEA67Jq/JTkXGkx2WNC3KAlilyu/pLGZ4aOepb+/ShP
 ICqbCeiLo/eoWRyzc+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220075

Add node for the SM6150 camera subsystem.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 200 ++++++++++++++++++++++++++++++++++++
 1 file changed, 200 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 95d26e3136229f9015d49e2be22f6b28f1e842f4..61c01bc2e4ee143097bbdb7416da7a8e0734be64 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -3785,6 +3785,206 @@ videocc: clock-controller@ab00000 {
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
+					     "hf0_mnoc",
+					     "hf1_mnoc",
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


