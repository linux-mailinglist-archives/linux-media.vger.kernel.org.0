Return-Path: <linux-media+bounces-35606-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C9AAE3D4E
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 12:52:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85FA2188A811
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 10:52:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCEE623F296;
	Mon, 23 Jun 2025 10:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ikINJB0n"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97EF23F295
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 10:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750675882; cv=none; b=Dlml6phgNZ4FWqFXKuknM2a4k9gSf+xcZ7gqul6hFGPIdlLAybrQkiKLdZVjMjdNXF79iUxoKM2f2t2QsjSabw/yi1FlZZ6wstfDBrtQe70/qjwQhRzUOQOgfQ0k7VJEcc7xnrb9JT61o9KdMSgWGJpJP5hbBypxE0WZwun8OmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750675882; c=relaxed/simple;
	bh=Nn1SUHbdtz+bHl8aKw5FbLQmxNDmU9kBm/3nok286Wg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Tsjp0tRDMN/R68FrkZ3KBtKNv8L0f3ePyoFJvGdeTN9g+512fx7GtubDSoAz/KcJnh5YQLTlIXyBvLQk4q12wQ5ni1SvnMoHLlVmAqTcCwIWYQCFY9PMxJqGoEqlMUQLYuU4xCgnM68gboszkRlA0aOxLSyItw+GAwsXfsCkdRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ikINJB0n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N7fW8q021706
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 10:51:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jQR+8/Rp8f5
	ejzW/Cs4Zyl6AAG5h3mREu2uxrmhGHwM=; b=ikINJB0ncyff9TeXSlsPxja5CCF
	T7MUpAk7noiFFnkzsUF+eCBV5UxOISgWSPdugxCv168LT1TuhSTUu3k6VFOVByeT
	RqmeNr8zxxl3es89eNMU4DJuFyeHyxnxxb59Ia8Oj0JbBXl7aFaXN60TQ6C8xkV8
	z+XiI8VMVbE8ws8/NA92QqSMu/9erwc6g/NNchV8KELkiZJa4BOnfWrNOaI+4ivb
	AzA9P97ci1bvCfBKvigCTKXP6AggY2oVPqhl308DgcWe8Rq44pHl2eCthAjZ2L9l
	1ZfUcQWjlCnrAmge8eX5u4s7DkSVSwkMTK6yw/Nl9SD9GVvNgco8kKz86uQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rprh4n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 10:51:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d40f335529so181505885a.0
        for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 03:51:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750675879; x=1751280679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jQR+8/Rp8f5ejzW/Cs4Zyl6AAG5h3mREu2uxrmhGHwM=;
        b=UyvZjDpXezeFCzfN2ai6eJFtBTuk/8PVpfp2dzuX5DTwnzxrLLAg888K5DRQJ0rPfb
         iMNatoCOC0nhI2llAKY7H7/uUT+xwfjHQBincMDov7GofaCxv7nC1xuPmLsn69Jk5Rur
         vldzbxrioZJw/Q/RTPqjRK1x3PJEgb53dqg2AU9ZbPXVMoh0/uIaAipG86Ql+I+xLbtk
         XX4a4C35d8WJ5os8L5WsuYVVefTbZoviD1Jt4Jz89hjQs8++nXfeyFVX3lZyLf9jFcA+
         +GegRYMDadHY39W2h0tIDERn/f2wR3/772s4Pux97r+E35i/X43wSEZDnMPEjvsF6Rdy
         pu9w==
X-Forwarded-Encrypted: i=1; AJvYcCXpKnDs1chWATsDhH440DUmowp33WTTnj+SavNHJcAIDji2yNxlRePYH2vVwA+yJ0sXae9ArwUZ6RaYzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxM6jUR832j3XzjDuAqFg6QG2mnl4Jfd3N9TgsGavdHkIG0tPrS
	Q28ND+6mgJ7MF9HhtWJk/39mwxLDaOsk+8yDGdK0zLKlFhKHj7T1YvqNS+W3PIAbfhK5ZoFIDq0
	A1WmNqT86KiB++Reif3AV/1eG/IB8QBkyuSHcfKKPScS0qNGoZ6eXXTeH0YLhvpFSMg==
X-Gm-Gg: ASbGncsxNLe+C3RH/P6BlfUH2le9iYuAR99M0srGvQAE+IJdZHRb8JV9Xez8EQNPzPo
	rh8+O+XJQhJgwhoq2mY+Jz6Ky4cNuFzCJS8jvi6SCagStAmTaSIoGTM9eG2q9CJSaRt7hkGkL5I
	xOHRpUDxd/hKGJVz7MNTs9G7gvuDM/Mfj06YqRwoHGf3Zqkr6ZsH3q87tT1fgxbQt3mwk1HWI0P
	DGAHpmgYUt0KaaGEB8ivdofKWIPMyKeBvxbKkcVt9xpCR25gwaqmppc5ZIMx2JTlGszMNCJQyfh
	Ki5urawWLmzzHQW31GvaFQ+lc280kjYJvRcYGddgKWoOoy7kCNkficYB6TIqS3DVDF79Uxf6TbT
	4
X-Received: by 2002:a05:620a:4115:b0:7d0:9a17:7b93 with SMTP id af79cd13be357-7d3fc06d5f4mr1399916385a.25.1750675878823;
        Mon, 23 Jun 2025 03:51:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLSf0V1aFEye6cMJMjuH8hB5YBXXK0jKMAug6/pk8Ammt8c4DGwEOFQRHtcZNo9kQ3R952kA==
X-Received: by 2002:a05:620a:4115:b0:7d0:9a17:7b93 with SMTP id af79cd13be357-7d3fc06d5f4mr1399915185a.25.1750675878425;
        Mon, 23 Jun 2025 03:51:18 -0700 (PDT)
Received: from trex.. (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45365af83easm100821835e9.25.2025.06.23.03.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 03:51:17 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/5] arm64: dts: qcom: qcm2290: Add venus video node
Date: Mon, 23 Jun 2025 12:51:07 +0200
Message-Id: <20250623105107.3461661-6-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250623105107.3461661-1-jorge.ramirez@oss.qualcomm.com>
References: <20250623105107.3461661-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=685931a7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=6cNYJS_lEeBOaWCNo2sA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA2NSBTYWx0ZWRfXwYsS6mrR/Yho
 k3yYTYN5C2U/tHsTt+rJOmLGLPqf2+0WZwugyb9ayoN1P4Qxi+9XBO0q+p4zcbtUfwbCbqLczxu
 R/AW7O6BKb3+Z2bIb3UGn04vv/lV2XzrFhHYFkp5X+9k2bXX7uzJZRf2KufiMDp3qqJnThrDVIo
 OBvNAJA5+rD0z7V/SR+CzEwaM4pzLksH1VfpJSdXNxQp5CvrkU9VJLS6/97sLFjWU/nxb8PNkUJ
 BhkAq7N6TcYw2ZOm6YK/I95i9tN1909KWEIaYcOhQsE+Kk6nGmTLHpEluCi5FsvjiDMmQmlk/la
 TnbMADIo2sbIvR5DbIhZnJg6zqbT6Zz63kKETi+cjQwu40DunaPt9Rg0q/ramTEtPVYvznKB8xe
 2sKP3fuNUIqQJAHp4FaZs3df3F2W5gAHaRdb11oxNw0S9WLfyXVH0ZjmOPj5n87Lu08q+0CF
X-Proofpoint-ORIG-GUID: ZfehzMO9YUoMtYFOPxI-rhwywX7DZGme
X-Proofpoint-GUID: ZfehzMO9YUoMtYFOPxI-rhwywX7DZGme
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230065

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


