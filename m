Return-Path: <linux-media+bounces-36013-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06627AE9FC2
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 16:03:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6EF36564013
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 14:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EAC02EAB7C;
	Thu, 26 Jun 2025 13:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YOZXQFKC"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A532E9EC0
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 13:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750946388; cv=none; b=B+OmOUy0ZJxEdXA/ZNTgFuOW13vcqwSIgXfJG9+De8Uh+6msPIHVuQ1pLvPvlkGYeG44SXHNusD8No5+dlbfyUUTUpceC3ibLB6sTyvz8Ob0rvtmeCw5K1U9btl5zkIGSfaIgKvSAMtF49RnJ3Ydst5umKYfa75fGnKb2oRXpG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750946388; c=relaxed/simple;
	bh=vqofARolJ/XDK2RNgQtOyM8rhX1PFh5KD7Q09TedVbA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YbV1ECZtUejCKH9oV5NKCD6RYeC7LVxNIQWZreYnoK6JQhXmFMpsbGDno0M6IGQghZKlRGN9pqbboq/8k6kyWKMHUVDWIgiwXv7PZbnNCcgDyxgR3LDJAEGgdbgxCeT8twk624ogDUDbdU5Fgtec7BNWngh++dusVfqP8NiyFWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YOZXQFKC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q9sXgI015336
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 13:59:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cxjSBOB7dOA
	jDuryO4CiO/8WxVjVs2GPsdC3lrPF1ig=; b=YOZXQFKCYIbLMY8UhnU7qI2/Gp7
	tUICRtNjXKc1SgnO1ugf2Oq48Jilc7DlhWIkso0sf8Rlfib3+VkhWDu0c1rNgffd
	8JKhTaOzvpx5uxNRNKGPyJ5D+Aswig5TWTLKD+mKvjpiiwjzZHjUvuXD+eWF41vr
	OskXrkkWmBLRsZ/924FdHdDJgnei74OwhBN0AzrZ9GY4W5YzrFHOWAo6vZBlWUxJ
	hJ+vOuNKcVJzClAk2Q5GAZteNi1VyEKzR1D4RIoCOnbE06iWK9zgEJl41u6FqJD2
	2xPjVNI1XMTrRoVG+RM1Pbr7k48vqeYioXGSWXd6U39bu5nE9wAh+t4aJXg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g88fd995-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 13:59:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d413a10b4cso173920585a.1
        for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 06:59:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750946385; x=1751551185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cxjSBOB7dOAjDuryO4CiO/8WxVjVs2GPsdC3lrPF1ig=;
        b=W4K1jB5o/X/w5hJQCTdbAcDwJb8f5k7/HBAytwMBYk0ibFUnXvwwL5+6lBOUg1Htsm
         2gwE2X/cptp72DLWPC8BxtR9sBDvFZBkWedAp309vzDdCsfy2B3bsmZBaf1Tnpt3QPg1
         MN8S2Z4b4RphwlycCHAxTui4FNLuH6+rojquwBF2KgI475tk0xcsbbDXi8Z+5FIpllvN
         ILfSBbqBsCZTCHLun7Ms49yPL4xMpdjv7uT0ur+X/CUpEJTrxgCo5MaGaZjI31D+xiqU
         UUovUaaoi8nMxRp8qvgNU5jRwiX0lBm/Y2+8qalpBWpO6y6Va1jwsJHqlSCqxAJcciEd
         TfLw==
X-Forwarded-Encrypted: i=1; AJvYcCUjwjW4YW7HEpPCAWm3opl3Q1RBDkz7oLyjfNQrEUwQGgukG9sGcBwtlN3T2kLidnJ/KILZYDNDJN/LZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBw7ncRKYYhP2vzKzTlruXKBl4RTStZpUDota0yqfaxwy9ps1a
	uf8ZYNsahihj3fYhoIlHGnnF15XO5Jnz6tud6TwvOjXAMFdWtPZ4fJBFqGfWM5HxEM2AYowFEcK
	gZ6defBHSfNoiZqg7sUi9KzeEZiCsVIxGOhv0yEmz26JnxcugyAX1/IdVskosPhHSWA==
X-Gm-Gg: ASbGncty49CuyEecWPH3K2lvVq/lutkA+QUJrtyO+wC9bgohBpXxnzNNW0FKagKtbIR
	zVgAYRFVpJYjjvRGNYjJG84zD9uNDNLx2ufVbDBeUP/frWynXLNAzKRIusSYx6om99bO5MyoxXz
	caF0I3kQ8ve/nwdv+otG69FYAB78lKVLqqRAviI1vMQfVbAWMfgIwXmcJwA+dTyD1UEObV5d0do
	AKyIOAHVD7t5ekwsVsPHn+n26S77mkiLZj6QYUfPveHdDxjcDB1EcL6jlP0+OAVPt0ki8273tmX
	qaSdDkyvVPElRqkxvsz3YmZ76GbMs8uqqBk/4izpFkNVmTk1qqcvN729BedHYcwevhjQtKpM0NU
	7
X-Received: by 2002:a05:620a:4113:b0:7cd:45ed:c4a5 with SMTP id af79cd13be357-7d43b9a7dfbmr428118585a.0.1750946385023;
        Thu, 26 Jun 2025 06:59:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmHdJs0VODNI2DNF+i7tJxFF+pbAlbZUVszbtQeaawx864hlmNY4CDrw7PLSGwgkT+UeOxxA==
X-Received: by 2002:a05:620a:4113:b0:7cd:45ed:c4a5 with SMTP id af79cd13be357-7d43b9a7dfbmr428115785a.0.1750946384541;
        Thu, 26 Jun 2025 06:59:44 -0700 (PDT)
Received: from trex.. (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823c57d7sm53723365e9.40.2025.06.26.06.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 06:59:43 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, krzk+dt@kernel.org,
        bryan.odonoghue@linaro.org, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, mchehab@kernel.org, robh@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 5/5] arm64: dts: qcom: qcm2290: Add venus video node
Date: Thu, 26 Jun 2025 15:59:31 +0200
Message-Id: <20250626135931.700937-6-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDExOCBTYWx0ZWRfX/y3k5EMgEgE/
 iQ2bBM4koenHrdl70+Xzfmj0jRa5daf6K7jwaqD04TwwRqFV1279OQBCd02SpwDMLOPGQga8THE
 5TLd6dWsQXpF2GGUtbQ6yP9Gi0JjKcloEJxTD82GkQcUn295Jg17AZKwgVjaDS1QXXp72o126Ax
 eGMF4E4Nm7mGfXJRoXyMToElfoYe8Iv7/MXvWmAPC1/TRnuLBxxZCgnxnnW6i2KQ9ZOHWuqhN4N
 bOHN7SP0XUY86//ITNIvWuxXuBDokynbRAHqQBckm4hkpVBGuPFGoUkUH4Fw0BVFWyJ+tfWKvYU
 MoGulT57WbuaXVx+bXp4cGaI+srB7USjTD0VXrlEXAnFEcRnLsBge00O+QSZpdz/ngj/iSc5E3g
 +hA3RJa3IjWkjZTQyIcvtk4c3qj7QB/pziIAcr+1b90BaTXcXSjbgtelQr6Vq6zRTYsk76H4
X-Proofpoint-ORIG-GUID: 4k4COPhAcgeHEm7k_rEdBD_4nKm9wT6t
X-Proofpoint-GUID: 4k4COPhAcgeHEm7k_rEdBD_4nKm9wT6t
X-Authority-Analysis: v=2.4 cv=LNNmQIW9 c=1 sm=1 tr=0 ts=685d5251 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=4i77JlrBmBHsL2Ry5jEA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260118

Add DT entries for the qcm2290 venus encoder/decoder.

Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 57 +++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index f49ac1c1f8a3..5326c91a0ff0 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -1628,6 +1628,63 @@ adreno_smmu: iommu@59a0000 {
 			#iommu-cells = <2>;
 		};
 
+		venus: video-codec@5a00000 {
+			compatible = "qcom,qcm2290-venus";
+			reg = <0 0x5a00000 0 0xf0000>;
+			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
+
+			power-domains = <&gcc GCC_VENUS_GDSC>,
+					<&gcc GCC_VCODEC0_GDSC>,
+					<&rpmpd QCM2290_VDDCX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "cx";
+			operating-points-v2 = <&venus_opp_table>;
+
+			clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
+				 <&gcc GCC_VIDEO_AHB_CLK>,
+				 <&gcc GCC_VENUS_CTL_AXI_CLK>,
+				 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
+				 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
+				 <&gcc GCC_VCODEC0_AXI_CLK>;
+			clock-names = "core",
+				      "iface",
+				      "bus",
+				      "throttle",
+				      "vcodec0_core",
+				      "vcodec0_bus";
+
+			memory-region = <&pil_video_mem>;
+			iommus = <&apps_smmu 0x860 0x0>,
+				 <&apps_smmu 0x880 0x0>,
+				 <&apps_smmu 0x861 0x04>,
+				 <&apps_smmu 0x863 0x0>,
+				 <&apps_smmu 0x804 0xe0>;
+
+			interconnects = <&mmnrt_virt MASTER_VIDEO_P0 RPM_ALWAYS_TAG
+					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
+					<&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
+					 &config_noc SLAVE_VENUS_CFG RPM_ACTIVE_TAG>;
+			interconnect-names = "video-mem",
+					     "cpu-cfg";
+
+			status = "okay";
+
+			venus_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
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


