Return-Path: <linux-media+bounces-39099-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CFEB1E50A
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 10:56:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD248585D72
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 08:55:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60DB82749E7;
	Fri,  8 Aug 2025 08:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="adC18uwO"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4445266B66
	for <linux-media@vger.kernel.org>; Fri,  8 Aug 2025 08:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754643201; cv=none; b=Zz3t/F3T4ocGB6USiQLtj7Umyt11FoUsyQJZWVSMfPiruKGKayR53PoImyuILHEKplus+5NSq4XSWND/K3mgiyHuI5DDmgJVuSf/lg0kxwz3uFM4X9Co2pIVPqelWuVqhcLu50NhMdAsE2prYYr9yRLzUOnFr4iVGFNnpSRu9vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754643201; c=relaxed/simple;
	bh=23E2L3+GM5Ne5G69gtx+iV/0DudIvZsRZTXNlVujEsM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MlUSQCeuO6iCIV1WMMk2ODGSprDpETjpgwskOBgpvFsbQQa3mva2GodJnpfomgbuDMoGWFKGadHK0scgq05v3epYe2onSlkd2mF5X6C4mQjEKgieyQx1x+ucQM7L0d9eOk9Vp2PTjx9AZiGyJ6nFdW7Csi75a2+RCNxkFEcdOhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=adC18uwO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5787Ce8B018239
	for <linux-media@vger.kernel.org>; Fri, 8 Aug 2025 08:53:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WFXsE/Pq/OO
	0HhZLOEUiCFKFRSimd89W5kjcE0yBaHY=; b=adC18uwOjEKNRUPUah1X0XrBKjr
	NMGk48BH8w2E4P6CBLMFbfId64DCep6gma0n4suB7o8x5MFqKgvBJ7tprkP2OIc1
	9Dq+wrua2YBu3InDSjLx3SfeUuWf2n/MSIjzhvy5j02+0ufQkWXxSBFveb9uQDSa
	GfpagbISfmqGsHCKWXOIse2AkiDNm/9c+e9/9nwnql6FE7em9yQMbzcAEO7/zn35
	VA+tkoDSPQejKSvRSY7Zc56YtWUFvNbJK6Dua30py05449Ug/ErrBwQ+KVgtom6z
	4M30jB0Mx+U4ZlFk1Vh5FkJGe3tlh+ZLglc4jyfryzwR2r5C2EQqKy8X7Uw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48c586eybw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 08 Aug 2025 08:53:16 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-478f78ff9beso60082461cf.1
        for <linux-media@vger.kernel.org>; Fri, 08 Aug 2025 01:53:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754643196; x=1755247996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WFXsE/Pq/OO0HhZLOEUiCFKFRSimd89W5kjcE0yBaHY=;
        b=lK20paOENlED2EEEsYwfkMGzM5zudEhqnPjWf8CvBJpirsoe3LttvLB9SDnhnvLpFM
         UsKoOJFKAlmHK/E9aTVuuV2g4OUnyLUF8zIINUKSxiggfbKPBwfDGl7Fuahs+mdcHIrU
         E/+WC3seoCkZfdeHwNJ4/1JqrJ2jX7oms7pZ1yU+vOcttd8kQhKK6PptOOSfQ+jxb8fX
         ucbAsrpD3SPEkbWdeA6LgncumGCdYkhoUNUPAfr4rTGnKz4oKqbliGsqGlJVMDxMPaj3
         VC+kWdq296h/MSGymmvtDDmHftgswFxE/brMWPQqjgjBdHgJaNKWbAL9/A5edJJ5m5l+
         7vOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDOTTj4YDF/4Pd4QgOl8Z2LPA7qG9RuBYEsNfI1ZHJSDNj4z4NOi04wQasSqAOUrvpBUdURO0/3gPA2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaDZmnD5SjeH+MaUklko8NlPgZwnhl8WjlqVHJ3+bvdjKtdIoZ
	DXR49S6MJ3f0ZuXk3liBkOyIA3IIEek/otx2XTXpdUOE87d8+tzfQcQrhIMuF09NjnEZgTIblE4
	0OKGrVzuixLf3PkaLrdqm8T7ovghsEs1gejDE1UVxKx6/5C0tdfau6Ky14xoO4WERRg==
X-Gm-Gg: ASbGncsM9tfLbOtZ2zhbHYhlFdJku9G39GWnKYLwfz1Hvaz8z1dMSmG7ZiLdlWhRYRq
	AGohCY35yXdayhF2QO23FxNNkyzW0391DV8uI8YhX+tNPSmb5BjZ+xFvwwsU90bUJPzZ9xrQzhJ
	XvzdM+nXdtg059x9G8ZTovPfaBMRWbNi9wFJNkSiucHKSokwOFbZJejyApSgbVoQmDv/Tz2u/hx
	T7nd4A9SuArHutFmoVqB2Yw43dJIjfBbKzbHutCNdoPgNfgNeJuqMh4Cwa/tbxGtaLEXHxeVJtX
	znY8NKBKBmq4tDRtK9qelxq2T9KpXddcJykyM7ngsEoMfC1uuf4dmR9mbO16uIxFRGmeNFP4tO+
	8uny+lMmIiwfq
X-Received: by 2002:ac8:5701:0:b0:4b0:658e:bd88 with SMTP id d75a77b69052e-4b0aec6135cmr42498161cf.7.1754643195908;
        Fri, 08 Aug 2025 01:53:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIyBTkjW23ZduxStuoNxrstWFgHDzUxrr3Q04wuEvn2ojWkOcLrw597Hn/gTfb6Ox2Lqtjpw==
X-Received: by 2002:ac8:5701:0:b0:4b0:658e:bd88 with SMTP id d75a77b69052e-4b0aec6135cmr42497361cf.7.1754643195415;
        Fri, 08 Aug 2025 01:53:15 -0700 (PDT)
Received: from trex.. (205.red-83-60-94.dynamicip.rima-tde.net. [83.60.94.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e5e99e04sm123818745e9.11.2025.08.08.01.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 01:53:14 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        krzk+dt@kernel.org, konradybcio@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 7/8] arm64: dts: qcom: qcm2290: Add Venus video node
Date: Fri,  8 Aug 2025 10:52:59 +0200
Message-Id: <20250808085300.1403570-8-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250808085300.1403570-1-jorge.ramirez@oss.qualcomm.com>
References: <20250808085300.1403570-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: cBICqU5fQaRlL7M2LVrBOq9reqeVZLBb
X-Authority-Analysis: v=2.4 cv=MZpsu4/f c=1 sm=1 tr=0 ts=6895bafc cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Rr2dNH5/fcnoRoBmcVUeRg==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=KD12_Wl4P5iJQNenjFgA:9
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: cBICqU5fQaRlL7M2LVrBOq9reqeVZLBb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDA2NCBTYWx0ZWRfX9W3I5q83BL/B
 aWRyt4IKIbh6k+G+VQsZybPr9Pxbw7FzOpUPRAqAfgsuL5V8pV92Gci61s9uuM9aDPY6d+ehV1j
 oxZButRNSzH4IqO6hrX3FP/N/jN0GDDbsSId39s5vLzgFcc8KMbUi19JzE309mzLfXf+T3pm5hP
 4WjrdorgGEHMo/OnxrCC0kweW/t/yIEUfMfyfNcfIKj2eKLADExciF2B+N/jotR3ZRmGLwq5mpc
 QV5Ovj7k7vgn3L8wuZsKq/iiZ8/3XmUA/qfalS4HLkeaNM+Og3SPW7GVt1Cn8uUIhAruSbWCKY8
 YtVy2nKSvMUZgDfv0cpmKsfYVtUEc+2AOzx7qe202fUfnNrDq0I+wt/+k+93FFuaDeWFDRcSEnj
 InBevnSU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060064

Add DT entries for the qcm2290 Venus encoder/decoder.

Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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


