Return-Path: <linux-media+bounces-34755-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEC9AD8EF9
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 16:14:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EBB991BC1841
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 14:08:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42B5C2D1302;
	Fri, 13 Jun 2025 14:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CD6w4KH9"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2F81CF5C0
	for <linux-media@vger.kernel.org>; Fri, 13 Jun 2025 14:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749823472; cv=none; b=U2xkhXwZ/GDVWNyQHFPML7CSmLq7+xLpNo4EPtv8IVtf2uiFMYQqfoULF/u56bXplSwdLdPAV7LM6TK+mNs1HDO3ofqQXz5sMEzwdayVBVFRfVcK70W1GZS7qUCrTjoujA6yisLqElXS3vOJoKL2QvTthWd4lDvlv/lVjUh3bEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749823472; c=relaxed/simple;
	bh=ESY5GP2xLjO/uuUBIZdrZi4e7ID7ZW6MKv1NQJpQTqc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hANbv/Ln/0SpQCsTSMJCbBfyEvdBdRSty9niYrtBBqGO+FSGiA+LI+6+KqZ69EM2vXLjabKh5snOx/lIduf20BPcWGKBjyaB1KwUmXzUfhn0fXNUsCY8D/ILFWfCsK5Qgm3UAC4TtPZ/qnZSHx0Lx/5nMhaPM02yeJU+Kxu5iaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CD6w4KH9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D7uYMG019613
	for <linux-media@vger.kernel.org>; Fri, 13 Jun 2025 14:04:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RsM2hPD5yCf
	EMigxxJenV5Fcl8jXieeQmSVNx4nPyPY=; b=CD6w4KH92tYbGASewlIXtdsZ4x/
	xAIBkOMmQJGk3tgeQjTeAyyVuq+yeDXH09KpCRbl1HUsCrHyTAbJepsOlHlAYwRr
	dkHORv82z/b6tTQCXrDKg1apZ04CRcJ4uDvfavruZxHdPkMA9ehv3Eqy1I5uo91B
	V3n7cUeSQGWQEx9bbbQ6ZurW5Pj9fYvOo0/OLaszEH65lzVxV8qJS1Qp8djY1+s6
	hAM5TlSKWGCMuIW4eAtd39umQd2zbUBDwuDAeRZnt3e0fslBPc/w8BuDGrEb5i/o
	8OC3L8Eb2G7hfUpWBp5f52PFybPNRXLyy0ax2SLKzYE1e1MmgaAS7A+jMYA==
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474eqcuq14-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Jun 2025 14:04:30 +0000 (GMT)
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-86cff1087deso502024039f.2
        for <linux-media@vger.kernel.org>; Fri, 13 Jun 2025 07:04:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749823469; x=1750428269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RsM2hPD5yCfEMigxxJenV5Fcl8jXieeQmSVNx4nPyPY=;
        b=V3Gvx4B6Q8g66ipaSrN8nWGbV/5OyB1uUyQcRvAncKIfiU6E7zm5gKxnk+SONZqJ+K
         kP/ME6fgqeDimqENriKQM97T65V41n59vqSE7z6NPUWO113yaNh9WWgGOdN6KD9fmndS
         Wr8CDb+UQTANzDBom/GzYpuspWXe2XHbXA38awfosSWcJE/AOYVD7Ibel2SDpQLksEvq
         OQdSwG4f0GGbYsyKMvgQIADSGpYkdprvWJohRh5idcCqsQJg0hL1JdYKzAFow4UgObYu
         /jP9AtkaifT79A2CKmv0Rf3qfsWbpp/WxYarKg02zUudgXFVsYcYu9IiuEmXH5e8O4wJ
         /hKA==
X-Forwarded-Encrypted: i=1; AJvYcCVeAQz7E/ai1OzxMBupbqcT9ErO7VFjPYk5DlUiWZI0bktgHFncpRr1MnLE/EK8Rg7KKKLwIfN5+neavw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh5qifog86cnuJGNWhz8EMgEN5x4PdHvsJqiffGQDdsFxjHYK9
	xQ1IezlUdy4a53lslBRUwTlZiVJXxtt6vJAgiUyDXoDsDuo8UJshGrhYTKj4nICDZIUiCskGpA7
	c6cjtgr4nBzZQjxVPfEej/0FwP9QcXkhq86N9ugdns1FK3bGOgTwiZ+UifeidhFDK/w==
X-Gm-Gg: ASbGnctHg51rkeikrm3HYivFGUNVm3ahg259Y9yowM9qdC08de4LlAcbIf9wajtSOoi
	nAI9fLNzqPvI31s1O7dUHNJR4Oma8C7g+FvYTJrs2N9WrKY4C7vpzVGqF+MHHSt+xSi0Db/PRAJ
	oesK3jiZ+J8fAuZnQtE5p/SNogIYGJ68JdkEEAFYcX1uQWK/uI/sHifUwHRUAPZlTO4tHU6c4UG
	DxnJ+6pbsVkZy5Qx/c4InSdXVX2YGqcCGZPchtCnuWzj/Vo4gRVQ5qskkPJkmDV5R33Ds0op70Q
	Yj5pFR+W9UKK9PXf5nE8x3kj4gp4Al5aklISmQ+exjQ9ZUoWDwcOyW258tCjYYKhVhDkfcVTuSy
	L
X-Received: by 2002:a05:6e02:378a:b0:3dd:9164:906a with SMTP id e9e14a558f8ab-3de00bd9d7amr30231045ab.13.1749823467733;
        Fri, 13 Jun 2025 07:04:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDz0VH3Av7q60En4HuuZIMYCmq560Rv0gKSCOnab2gqKJsosMfxKzcNjWbSyhrF0ZVHcNOeA==
X-Received: by 2002:a05:6e02:378a:b0:3dd:9164:906a with SMTP id e9e14a558f8ab-3de00bd9d7amr30230735ab.13.1749823467257;
        Fri, 13 Jun 2025 07:04:27 -0700 (PDT)
Received: from trex.. (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e268de2sm53503615e9.40.2025.06.13.07.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 07:04:26 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, stanimir.varbanov@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] arch: arm64: dts: qcom: qcm2290: Add venus video node
Date: Fri, 13 Jun 2025 16:03:59 +0200
Message-Id: <20250613140402.3619465-3-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
References: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEwMyBTYWx0ZWRfXyN8OFG9IPDVi
 iop0VZ4f3U72YlTi6TQ5y8ncxO+xXbkZmsvtQT3dz5CdCAumAF5RIK7bL72gckwOw2zUxlU0g8l
 3AZrrmFUmBVARKHdthadDdptA92fCG5BiOU2C57YSrT6BDFKbGCFz++uv77ZBYiCXqHpV4m3YHW
 48KuiWLyo4i/z6s96Tzs0AWRfbVucuauGttspy+j4f/VskS6A/qM97RWwSmUv2IVrfiK1IL2AeL
 Z4Ji8UcwKAn+hmYK05XmP7TELhVwIoGmbY6cJwlv6w9BF78scKDoI8OusptgdLtKSy2DNXypfGX
 xQcoM38UMXDoXxbR0JjY4v37inGqOaBNvUOUVqj6cddc4lZqQxz0+zWmeIqH1LMPfrkOfNrGP6h
 0ZVrz1akZsHnSqtKPmlpp70IzJruF0Br5NBtoiNyarZiiIFE/r1326zmpgMHT5Rc+D3gqW/f
X-Authority-Analysis: v=2.4 cv=Q7TS452a c=1 sm=1 tr=0 ts=684c2fee cx=c_pps
 a=uNfGY+tMOExK0qre0aeUgg==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=6cNYJS_lEeBOaWCNo2sA:9
 a=61Ooq9ZcVZHF1UnRMGoz:22
X-Proofpoint-GUID: W0aPzeZLgk3u8ChjS8XgwUkiXhiQCGrr
X-Proofpoint-ORIG-GUID: W0aPzeZLgk3u8ChjS8XgwUkiXhiQCGrr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506130103

Add DT entries for the qcm2290 venus encoder/decoder.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 53 +++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index f49ac1c1f8a3..af2c1f66fe07 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -1628,6 +1628,59 @@ adreno_smmu: iommu@59a0000 {
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
+
+			video-decoder {
+				compatible = "venus-decoder";
+			};
+
+			video-encoder {
+				compatible = "venus-encoder";
+			};
+		};
+
 		mdss: display-subsystem@5e00000 {
 			compatible = "qcom,qcm2290-mdss";
 			reg = <0x0 0x05e00000 0x0 0x1000>;
-- 
2.34.1


