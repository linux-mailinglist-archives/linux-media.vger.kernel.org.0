Return-Path: <linux-media+bounces-35351-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C13EAAE0891
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 16:21:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58D6B17B85A
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 14:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12FC52185A0;
	Thu, 19 Jun 2025 14:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hKQnzQOa"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7FA22D7AD
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 14:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750342830; cv=none; b=fPSCYttpN/agLG5d0U+Sq2LRn4pBSXpkBm205Njf2GpfKUbBqgAD9Wi7wRYxWOEt8T35OJlSql3isTL8XTr+AVOLdgFahWv2HNAqvYiHrzQRzI9Yj4QqQ7K25jbqdoeWr1F7IivL/WiJuhPO8NzLcINSV84iRKjZyo4bufWd2no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750342830; c=relaxed/simple;
	bh=o/swuL14/DpNjETzkD22OOrByvbtT2NBzuNE+a/c5W0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lra7XkXYtSbjNrNz0EFvl/oGq2iSVj2/QcaEH8f7FgHHOWubkPn66+/5h7NuISctraS7PWIguFrn+TrqXm3U+g+iCNSJ2inHfrFicuPpm3amAJ6DPefwDoLFSNIre8HWI0HDFmlmjhQAzBOcuEV+M1WGmLmMhyTs2lMZ8NKtqLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hKQnzQOa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JAEOkU007553
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 14:20:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yVyzHd8yQZC
	Eo+w/dpCtA6u1T2e3he177w7qRWl1e2A=; b=hKQnzQOaQlpMw6UcfgRPjoAnkNT
	h8Yz4nzSlVkWYwJH/vedf2bWt3lY6ptmAny93w8/+wuqEzeb/p06C8ucOA31ZWzF
	8wQspRfNwi8oq/reeiGT64yEBQ+3FpAJU/Tgv7SJTIao7KiuNc2t3s1tmz3x0sbE
	Tdo2JyCE0FLH4M4WYAr12SyLpDllnQYZmweLYODZHUplzMrvEfEPwxc4p7fCmXcJ
	wquw4TZ12KL5n8It5lMi4/RKHWC+/JtsQ2XmniH5rAoc0/VeGDBYhABRkS0qUMf2
	4ag/zFBj7vnTB20aelirKkuH38GpedFmJu0ht9uX6eMUy44Ur/D/Hb1l3sg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47c9krt2m0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 14:20:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5cd0f8961so183589585a.1
        for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 07:20:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750342827; x=1750947627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yVyzHd8yQZCEo+w/dpCtA6u1T2e3he177w7qRWl1e2A=;
        b=pQhbqw4wGzmWwBy0iRCAEIXCLTNjVy/dzEbreF1ANGZKE/UjSs36v2PD3WVGxmzre8
         pR3x/GcaBPrUV5E67npWbNyqnFrTV3KOOc9GrTqU1CdL+Uj8jcwgrAToV7tWk8lqTE+A
         /vV/VhofWQvle8baN31sDlnFJaUO4D/2iuF6zqvX9FCilGU2NbhZp9PfiZN8xylOJM81
         QU4UarW7bC3gbMdDa1lkkMVf01faEzFCCRtywaqLXvuQp7obNMu49+jqXuxG/JnrohP/
         Fpv0IYt2ED8H9mc6lyNMXqAvetepAp2nVKr2hsF2ogdaATIMcRIw42Ruu/hNZla7xDb3
         V6GQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUCr26EGsGe89aRvxnOVwhdhf571vyVn7H8JgWcOw3xqNgw9U2EK4Sxz76f4BH2BODrriESl/VXdXG5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YysBMrR3vvFZZpr+cYKU2Zo4zyj64kgPGW5Hns9dle4KcuadM0i
	hYj66eMDxUQg67LBrsWZzOfBRmcH1IR0E3vBXzeQ8ip1utbj4LtgqDXc0UjimpgxVYLulEo20qB
	3xLQ/vjDxbfwRORUIuQWk/375ihh0qAKOjQu5g7zFYZRWP+Mwit6scDRHs/q/YgrV3g==
X-Gm-Gg: ASbGncsxNSumRFJy3jDXDefz86ujfYl7OtBKam/SSdQFC7s5l29MY0E1DZGNkfp4c3l
	mptdqiN50MUDvO3ojAbXyUZGUatLmoqAzfphKRc+7whFDNAJtUIH66OGEVxi6wwUBrbHhIi33pM
	GoiyP9w7LYTiAMebg6RchOkc0Coim4/PxZq4UeMUgTjXT9XwMPj352/6JPD6vXZVE1h0oBumPCn
	0ESPqeG4OK+uYOBn2jFLk6YxqM3lFff9CmZwDHzkzu6IMrujsOL1PaGYxV4+xWttn+g1dMGj+iO
	GflVlHgaoDlOV4F2DQGabD0BO3D2ir3nAqr10b6JgYhyJxGcp+awAI2WJi+6vSQ/0nQdYYM0nCA
	f
X-Received: by 2002:a05:620a:3186:b0:7d0:9e8c:6fef with SMTP id af79cd13be357-7d3c6b7b64bmr2902080085a.0.1750342826584;
        Thu, 19 Jun 2025 07:20:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbfNpIpEr9e/U5doJLTwanH7FrwISvQWyWnlBtUzJFpxryxi8WkQJKOAFhAfa1tuCVj37moA==
X-Received: by 2002:a05:620a:3186:b0:7d0:9e8c:6fef with SMTP id af79cd13be357-7d3c6b7b64bmr2902075985a.0.1750342826145;
        Thu, 19 Jun 2025 07:20:26 -0700 (PDT)
Received: from trex.. (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a58963561csm7254312f8f.47.2025.06.19.07.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 07:20:25 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        stanimir.k.varbanov@gmail.com
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 7/7] arm64: dts: qcom: qcm2290: Add venus video node
Date: Thu, 19 Jun 2025 16:20:12 +0200
Message-Id: <20250619142012.1768981-8-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250619142012.1768981-1-jorge.ramirez@oss.qualcomm.com>
References: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
 <20250619142012.1768981-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: xhBmLDKIlwDU0D08fFzB7NpMuMktCKdG
X-Authority-Analysis: v=2.4 cv=UPTdHDfy c=1 sm=1 tr=0 ts=68541cac cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=6cNYJS_lEeBOaWCNo2sA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDExOSBTYWx0ZWRfXwj0SH36fYWQH
 E+HMDDELHXGrkukcAWVppLMnpj2j4dv4ofLuNSQ8+HVlXS468jKLIVP4t8vIN7S6Vcs6CBNOTWc
 WDISAxjEFzuDkl3MWFNRo1kaGO7GtNrEtGFh/GJobUUaXHNUYVt0s/ij8BS01WKvKIoYM17KeV4
 choRpiTIiLmhNYp5Z5Y4LUcbEhKg7bZmAjA2lrr2DsVpy4weFrJUfwwVw0buIOcIFthHPwgvuDA
 hfkwLY+rNgkT0HLvOT/3peuxYA/46pthpuZ/x5K/Q1FZRYCIeBu2q2yiZuLDtcBoFZyN7rhcXPp
 afp4GoOsF7lJZh7anAR3Mk0K2yXzHExDmIKxA32pFKuUj5QIQR/QZgiUkhy/bGqrx2mtpO8gs9M
 L/ZPzqXq7y5XqCbUzS7fPFTBoqt7ulFW3O5rFCmVRMdBohZIugHkax4iYIM76DC3dyo3a06u
X-Proofpoint-ORIG-GUID: xhBmLDKIlwDU0D08fFzB7NpMuMktCKdG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_05,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 mlxscore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506190119

Add DT entries for the qcm2290 venus encoder/decoder.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---

 v2: removed deprecated properties

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


