Return-Path: <linux-media+bounces-38897-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D1DB1AEA2
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 08:46:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C711C620387
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 06:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3156221C9E3;
	Tue,  5 Aug 2025 06:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D02aDSdc"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75900231C9F
	for <linux-media@vger.kernel.org>; Tue,  5 Aug 2025 06:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754376290; cv=none; b=UN7ZhfuQDsbZ3gQ17uVGYXPnWJnaXc6aHpODWtdn1yIv9dRhLkzkogMQnlkdI46PS4iloQYXnmuINI68GDJsNDYXh/+AkVVIu5yG0zWez9vY7q65CENFqrwCFpOJaI04pL8GJpgQFueHSRYhACqh+ZYy6787s1FARY1AQD6E4Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754376290; c=relaxed/simple;
	bh=tI4EJY+AX+r+95HyElw6Y87H6Z+WIIFID7OrbHLVJ9g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AQXDxfeoJLp54r7ltCheMiXG6EFPUeED3IP5hniyL5QRAdxn4ltCt9zySrlBBLfa9hSp1HqSec+xlLmjeYrAlxyLK40zFPZgPmrthlW7IWOyANCJx+9l1CZGYtqbPraQdo6wb5irH8w6TfKwkn0UrDxaXn/trF8ywtWso+fjEKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D02aDSdc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5754rtmP004376
	for <linux-media@vger.kernel.org>; Tue, 5 Aug 2025 06:44:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cDNJIT1X4FF
	Dqpcezls1gtG8Nez0pdy1Boer2Zl4v9A=; b=D02aDSdcRPz9prtNGcJA4xDh/US
	8cONdUZnI3woIM7gG699HQF5mqr5jA130lWdEh06iOcXVhCy8ZktDEaZY5vvAwE4
	zHBN/cfPGvyCKx5RW4IzWJm6/RxuXhPoXzlT8AX9ugb8Q+whDEja405sFVVHen4H
	oztzaAVYIswSt+cck2Pl/T7JCcda62VwWKNUBTeeOGBvZNn+wvUuGkFTXk2ZSmVH
	eJdFl9u2kM7cJkVUf7Z2Fn68/yZpoz/DMwSLZn8UZCUXfFSMXkzCpcF+d73CCrj1
	rb3XX1oMxC0qN9qo3Ya54BwplszcMluD4YzaCe15sFvYOZSyoAjafwwm5Tw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489byc7e81-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 05 Aug 2025 06:44:46 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-7075d489ff0so85869026d6.3
        for <linux-media@vger.kernel.org>; Mon, 04 Aug 2025 23:44:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754376285; x=1754981085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cDNJIT1X4FFDqpcezls1gtG8Nez0pdy1Boer2Zl4v9A=;
        b=B4pazygryiSBgvugvVUDVynKB9yHmn+XtyeaBxs00t4k+IRxs6yol9xWmqntUK5Bb9
         dfD9mUMgVcLRV6dzKtJb8YA01w01zMW3J/TO5wZxL81ESaHVtu72IPhqI/OxBm/ps53C
         +UC0Tb4LWgyxZEnRyRTmh/aSSrJ+Iqu0jYEGvTzv4XxIsmzewL4qOEqo+DCLGBPcBoEp
         acyGGl8G1OvyPieodwoJghZo65z8pUbbmEKhPtAuJAwmNjH79h9+UHipw4tfsekac6gV
         oJ59Hmua1uMyI35LlQMZTcMYXTFvJjWdYYhlb6Z3fn9p8FmOglXI4ZPliBbDAsmODt0K
         jFOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBod8wogwCyqgiyufP8A0TWS/JtvIt259NqRe/mA07Az8hkztAVVSdmQxbPN0QKKmc44quRHmnylYJzA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2JHVq32xfPaF6SMG1Gt7Cjeh+eOfyAPzJQ6QsrKLDYZK+qKMG
	AYDL/RqbvJ2a/PgSP7JtEmtSkDlBkoQ3xoZ1OKfMjCrxQRQwgSRoNyaPeoTyL5gYdXQlyr8uWVp
	QhQnNkTYraiFaRV+d8rKIZm2AwM/gDrRYcNZdrRgtGZABEqc1AekgLPNf3ziMPP8q7Q==
X-Gm-Gg: ASbGnct7Qgmkz94CfGm0dCw2DgUPOo4WKdd0zrVILuvTyydIKs2s9AgvBq741LMrrdm
	3wTVC5CjAEL7snp/svVKo/y1k4P5RmJNxfxwTCG1y1kbzqJyacDGS3c+LQ5sEWjkm1J114oXkuT
	S/4CPwLRuBMe52cO5UR1zRVgZu6KrsHAZNbEj+8ns1kXmFRiANIBIYsA6PBseBG31IzB0fm/wGW
	d3Ejn5CkmnL7Se1SJ8NQwsNiDF8/wEMd1LybNiD6AOJJ1LjZ9IwiPTxrwaH13YfhamawegJZrZ5
	jiy1LjJdbNTAFgoATiQD1eMYZxN/vsRGjKQeu4H3jEVodqaPtzwsIUxjXssPRlfo7JkQXo/p1cG
	ehQ0XU0n6dvsJ
X-Received: by 2002:a05:6214:400d:b0:707:b59:8907 with SMTP id 6a1803df08f44-70935f6f80amr172014166d6.14.1754376285312;
        Mon, 04 Aug 2025 23:44:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJlNrFRgTXjKLfqSDstiQ2o9wPR/GF7AHwgeyi/ta5LUK0tA+fpwgdxf2g3ixrItUBOCQ4ZA==
X-Received: by 2002:a05:6214:400d:b0:707:b59:8907 with SMTP id 6a1803df08f44-70935f6f80amr172013906d6.14.1754376284892;
        Mon, 04 Aug 2025 23:44:44 -0700 (PDT)
Received: from trex.. (205.red-83-60-94.dynamicip.rima-tde.net. [83.60.94.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4589ee57922sm194015815e9.22.2025.08.04.23.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 23:44:44 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, bryan.odonoghue@linaro.org,
        quic_dikshita@quicinc.com, quic_vgarodia@quicinc.com,
        konradybcio@kernel.org, krzk+dt@kernel.org
Cc: mchehab@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v8 6/7] arm64: dts: qcom: qcm2290: Add Venus video node
Date: Tue,  5 Aug 2025 08:44:29 +0200
Message-Id: <20250805064430.782201-7-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250805064430.782201-1-jorge.ramirez@oss.qualcomm.com>
References: <20250805064430.782201-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 0Kq4xX37xR5FTFqbjEeorcp7KrZLvDhD
X-Authority-Analysis: v=2.4 cv=Y6D4sgeN c=1 sm=1 tr=0 ts=6891a85e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=Rr2dNH5/fcnoRoBmcVUeRg==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KD12_Wl4P5iJQNenjFgA:9
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: 0Kq4xX37xR5FTFqbjEeorcp7KrZLvDhD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDA0NSBTYWx0ZWRfXzcvioiczaV1y
 qLyax7Kpo0p8UnVRjnDHtgM+5LO03+XOwe/Mh83FfokIYJIQWDQ0OxgeDVW7D1MtZ2mT549GY9X
 iN/D0QXyT5cW5rr+ena45OcBamS8KZHZpqUszWeleSO8xPNtOOCnNVbvyxMTCCIVVUS53L22+cr
 Yge1OaHaUJz9/DiHzHPKEHpAjZH10uXOfMyhoXFrD9F0ryPDg9Tqms2ODpPUZyENInZQjTV2Sgr
 Ht6T1VXVMDpFdfCmRYwAle7J2B9DUp22YoFDDApdnjp49C7n27EWLKb2Khjvh6cWvztnvJdQzKF
 JKp1akslim4XHd1/7WOe71WrS0z3Q58y23w38Sqq82HTE2bsd/oWZunNdyFDfCxCBqDq4KDJAV3
 dSi8AslG51ZsoF60HP7cwYWYiRuaxO1IW05eGB+b8ngrT271u9phwhucJKjgrJ64PH4CQzni
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_01,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508050045

Add DT entries for the qcm2290 Venus encoder/decoder.

Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 55 +++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index f49ac1c1f8a3..7cfacd189a10 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -1628,6 +1628,61 @@ adreno_smmu: iommu@59a0000 {
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
+			venus_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-133333333 {
+					opp-hz = /bits/ 64 <133333333>;
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


