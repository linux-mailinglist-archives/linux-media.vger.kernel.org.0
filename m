Return-Path: <linux-media+bounces-35579-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5AEAE3770
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 09:52:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5DA717A9336
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 07:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A630C1FC0E3;
	Mon, 23 Jun 2025 07:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EBez9FuS"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD020221F10
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 07:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750665005; cv=none; b=tOH9XSZ4cr3QeyqaLZydqd+k6XneMFuu91VsnpRhqfXaqACqqSWI+xAZwwKJkPvqcdZaelNmymqgb8XHKKPtLvqd9OkICWY2W/mXsHnTKt5yEcys60HSCqC97d0FUg7MWq5pwIhh5zCB+xm9cQA+v66Y5LS6lpxw/WqJaz9wJ3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750665005; c=relaxed/simple;
	bh=Nn1SUHbdtz+bHl8aKw5FbLQmxNDmU9kBm/3nok286Wg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qkpJryCn1UKwv+AnqTzAWJFV8ca1JpYi/4Bgcs3NlRimDLREwnEbwFTzHeKZUuTu++fid3D4eN4aJdq+whH4o+G0zREGhB6XTEKwCRbFBIYy5TNiyCMbVrThW9RelcLLjMhi/OFPj4qOcpMg0LKEBgbbCMhvWHpuZ2V/4Ml1hfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EBez9FuS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55MLrGij013850
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 07:50:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jQR+8/Rp8f5
	ejzW/Cs4Zyl6AAG5h3mREu2uxrmhGHwM=; b=EBez9FuSEVbHFpoqoUqxiFce1Pt
	/9GhnirYjPfI3CNpTeMzlBO76W/EbZpFFVZYs12I/8heO65FP7OZ5YhuQ6E4LdF9
	k/DxdsPyPlGPKOvsCDvrM279RwmfRKGvom1/11LyQO2BFFDvsvAQAhbWzxjYzO7c
	ZnZG/2sSsfv2npB21neTTjeeqx64/lGFHZuGHBxoKpD4q/5XwYUFgpEE9u8tYjro
	7qQjQaI8nHQrd+Ex6DGpq4QxkhALfS4k+THR4v9tNhMOhGpu0pQwg6IXDu0TtYge
	6lyZHe5JIMHWDc4RG65llPXC9kTTdhq3ksZFG2yhYEHtNvf0F258FGn5eNQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47esa4h492-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 07:50:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c790dc38b4so640334085a.0
        for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 00:50:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750665000; x=1751269800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jQR+8/Rp8f5ejzW/Cs4Zyl6AAG5h3mREu2uxrmhGHwM=;
        b=KRTOMUAeS0Kl0+51INYV7tobQqWAHAY9YIizOz2FI8jXRyH9RtcHW/ejSZMkBaucWj
         sjU0XGez8Cv3rjZPv5tzhmMEgYV8EU1fdHmJGIupeFErSr27oxDL28nOWIZBLLeA8YxG
         v4+kCFGhK6tWGN3xUnlbbcnVUv+uzgvvUGNu48FVrxB1I7mQ8TnEZ8BGdtA3Bn6uiTHC
         R2fVPoazcapcpsu8RRAwOuByL4ftmR96Z4LCmprTcunGaXEIBqbQPWu3RW7gmeBIHcSO
         1mPLF8TSkrIWl/bDm/wFBXOQUrjsGFB1y7VfzqyEWKNNfp8PsFv5CP0883MCSnRmRbUr
         bpuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUM/qj8rVePZ6YljCMLsVIEPxQ1PMQYd7FBMqqv8tCr6PW4JAZx97DTCXTKf+RWVAzsQku73TrPOvn+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLXBv8RvJUZRDCpIPHJ8bNiuNWDbBdttft9FqteYajSlqG6COU
	M0WNc1QzmNAZtGnlT5ElZdkaiPSkpRqZ63OwGhpKfX7JgxQZ0AYMemZJShUkctVN0YGGwfX79GG
	B52rjbp7PeQTzAESYgKxblDNoBMcRMfUp+tgAFcSNRWRpEzGD4/FrF4EMHa89kBEzDw==
X-Gm-Gg: ASbGncs+0bFCASJxx1SGQNHOPwEt08+98UWLk2Yy3IhW0i2LR2bhzi3jg18xXrTK+C2
	/SqIwpdlJAM5a0IzgHzL6/uskpCgmUC4z0eKD2Lwc8kIoWdI1uRPaYl5WbnSn20eGyJam/UhB42
	kerA/ojFrSi11uCf7AYssF/HVpSxipPtY4bIxaWic/YlGpSkUPplWCvxBqr9+Lu+4YLwF3FBB51
	k/iWkTw9yytjvJIV9BG5ImARLlBXDeCf6SxNY99VJ4kUs1QqtqZ+5CzDEBNm8zEMtmdlEtWRKGh
	TvrDsVOtNJlsIhNxHrm0CzVSrl6do172yCkEHsfgerew+yjFydILowhgiphdePEwgW789p8Z320
	r
X-Received: by 2002:a05:620a:460d:b0:7d3:e648:5f5 with SMTP id af79cd13be357-7d3fbf760acmr1548209485a.1.1750665000175;
        Mon, 23 Jun 2025 00:50:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbmKUcg/kFZe3QXuKKB+2EpQOW/AczTl6L69ib3vwtTOg8rRVszsHDWIaLVlARzjyBpTaLQA==
X-Received: by 2002:a05:620a:460d:b0:7d3:e648:5f5 with SMTP id af79cd13be357-7d3fbf760acmr1548207285a.1.1750664999780;
        Mon, 23 Jun 2025 00:49:59 -0700 (PDT)
Received: from trex.. (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f17ac7sm8755313f8f.23.2025.06.23.00.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 00:49:59 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/5] arm64: dts: qcom: qcm2290: Add venus video node
Date: Mon, 23 Jun 2025 09:49:40 +0200
Message-Id: <20250623074940.3445115-6-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250623074940.3445115-1-jorge.ramirez@oss.qualcomm.com>
References: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
 <20250623074940.3445115-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=eLYTjGp1 c=1 sm=1 tr=0 ts=68590729 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=6cNYJS_lEeBOaWCNo2sA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: qG6PW78yWPAeERpraT6ydh6BZf64HdER
X-Proofpoint-ORIG-GUID: qG6PW78yWPAeERpraT6ydh6BZf64HdER
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA0NSBTYWx0ZWRfX7f333u4d5Jx8
 H0CLD4qPeB4YxWjMucXap4jwqr6R8MZm6r9yGwtnEApu/fl6RMYHoOxIL4UClxh5Y28fv6Dc54S
 +K/D0nZutpJB3GdXR48jjkbxLox2gipamKLHxK8OZv1pdhBLW6nlrHGQtL70ANfuSFfuPmI+n5b
 WIuKNhYOJDQZKd+XESt3G/xIzuUkNoAiwPbiIxcRFQVDe/Pnf03T8eihK5C1MFbV4Xz712rYf88
 O2lQSN7+Q3qcVO3EKkAff04PJ3SPriczRt4u23vs70gURopIUXn1GHMBvjk9KNErkRJddhCm/ZX
 EGj/xuc5OC535SAqnMj2v9YQZRpwNcM72m/0cglVgrCBdGNE5YC95vaxFlruodAQPvVV9NnQGBS
 mDsVHyNNzt2bcM3PlFOc+IZUWNuZ58VmkxR6XIAVCnsCFa6PvcUB4jdW0a+PVnOJJ34BiLTM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_02,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230045

Add DT entries for the qcm2290 venus encoder/decoder.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 45 +++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index f49ac1c1f8a3..b7e789d1f639 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -1628,6 +1628,51 @@ adreno_smmu: iommu@59a0000 {
 			#iommu-cells = <2>;
 		};
 
+		venus: video-codec@5a00000 {
+			compatible = "qcom,qcm2290-venus";
+			reg = <0 0x5a00000 0 0xff000>;
+			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
+
+			power-domains = <&gcc GCC_VENUS_GDSC>,
+					<&gcc GCC_VCODEC0_GDSC>,
+					<&rpmpd QCM2290_VDDCX>;
+			power-domain-names = "venus", "vcodec0", "cx";
+			operating-points-v2 = <&venus_opp_table>;
+
+			clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
+				 <&gcc GCC_VIDEO_AHB_CLK>,
+				 <&gcc GCC_VENUS_CTL_AXI_CLK>,
+				 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
+				 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
+				 <&gcc GCC_VCODEC0_AXI_CLK>;
+			clock-names = "core", "iface", "bus", "throttle",
+				      "vcodec0_core", "vcodec0_bus";
+
+			memory-region = <&pil_video_mem>;
+			iommus = <&apps_smmu 0x860 0x0>,
+				 <&apps_smmu 0x880 0x0>,
+				 <&apps_smmu 0x861 0x04>,
+				 <&apps_smmu 0x863 0x0>,
+				 <&apps_smmu 0x804 0xE0>;
+
+			interconnects = <&mmnrt_virt MASTER_VIDEO_P0 0 &bimc SLAVE_EBI1 0>,
+					<&bimc MASTER_APPSS_PROC 0 &config_noc SLAVE_VENUS_CFG 0>;
+			interconnect-names = "video-mem", "cpu-cfg";
+
+			venus_opp_table: opp-table {
+				compatible = "operating-points-v2";
+				opp-133000000 {
+					opp-hz = /bits/ 64 <133000000>;
+					required-opps = <&rpmpd_opp_low_svs>;
+				};
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
+					required-opps = <&rpmpd_opp_svs>;
+				};
+			};
+		};
+
 		mdss: display-subsystem@5e00000 {
 			compatible = "qcom,qcm2290-mdss";
 			reg = <0x0 0x05e00000 0x0 0x1000>;
-- 
2.34.1


