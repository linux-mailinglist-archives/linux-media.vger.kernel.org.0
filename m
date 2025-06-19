Return-Path: <linux-media+bounces-35350-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 12778AE088C
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 16:20:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9EAF617D418
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 14:20:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72A39234987;
	Thu, 19 Jun 2025 14:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZRZ+dvqN"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429E8226161
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 14:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750342828; cv=none; b=AJxri8wGlCthRvxtzMM3x67m1Ia2eNRPN0ohZHinUJHTbuu5CtoJ64sWnKe6KcWHbuWrusTMOWp1jQ5Kh4rGRjkP4RpElUmt3SD7kouh86zUJzxfvuWL/7nuKxFrlkK3/J/xg/VIP7n7GkCa8hTCoWvLK1wrSfH0O511oieiiv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750342828; c=relaxed/simple;
	bh=GYaa5PYPkbOVQMAq3x3jZMhZluUgXdngV9DLv2K0qRk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=S1W8Z1Tr5tU2U/i6uFp3MPLeFb2t77HbJeRkT3pmo1AiY/zGBcCguTvC/RgPZuMqdDavcbmbc0VdE9cCaduFWmTzFye170YhZH16ldN5giDDwyJ09hWNtlPVYywByelsIidzadbXb47Ax/cUnSw06mh4At6tkcpPuyQZ607VeEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZRZ+dvqN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JC8JEh005565
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 14:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fy9LUnSbCFx
	jVP4r+SINokDCmRmHgFcf4rNEh0wjnFQ=; b=ZRZ+dvqNUqkidI3DTFJ++84q9z0
	DLwFtnHFpjKvcDBAIm/0mB8N93L5kOnZ6/XMvfk70zNa0o7HxEAmTXJcyNGKtLz1
	gOhTKAWgq2n1dqQsFVQWZXFJeHXjDpN1lXR6QHaUNB1ZcUkgV0V8Dvpg7q/tVsNu
	oxdT/ql0SKIZCYyt3kWK98i0DIn72JPHIzPk9pY0c0THAGjm1HnQT5RWf+Tvt2Cj
	nFSx2f5FtQtnfUQVwfp+VA8oYjgMSctBad+CzkIm60gi5nzJzj3htURkAlmqi3Xi
	/J4AsyqDexoEQoE83r98oDvUH6VX5o2NB9CAOfzwVBjafgzMxPp1IXl3+SA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47c0rvkdxv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 14:20:26 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a716cf4345so28013491cf.2
        for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 07:20:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750342825; x=1750947625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fy9LUnSbCFxjVP4r+SINokDCmRmHgFcf4rNEh0wjnFQ=;
        b=JjlR2F9xnLf7GUkI1VWUv3voVu44ikhtKIW1/AqcyTK5Cx6k8vKTNCBRlCVRDhHmVJ
         PyH6EWUfdTWzmo6D12iV1rmrUagaRXv6uJyS6N2DmeNHG0ua8WsqyHuLC1RgQGgz9Xps
         wcBIHx9b6juhPwTrvesImLoQp4+ToRUTjBG9Q+uZ5qUvOGqvPUyV2wcOJNj47pPYgW+3
         3dH6bzA/3a4umm2a/TGCxjqwa0bKgT5s2NnNMK8who3BL50VWZvo8nqxldQo/ZRadFeB
         tk5VtqkgOnR+gy6BnLOjai1ZBNiYsCs/9khN7Ih/DMmY3HjRc56PhoR9v2SAdnCFYqYt
         sr2w==
X-Forwarded-Encrypted: i=1; AJvYcCWflgH0HvFEpDgCuo7Ovvk5b/POnjuSsS3jgyVGWatzUaZOsPfnJMChlmPKN2z4veAF5yxuu7Oe0clN8g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+D1II11DUeMGe8HfkKSKtSHNjkqUGi+8CcigbbnHZwbJdYaSl
	e3t4NrPHL5cTq5FxcvxX/V9gXqCRBRQPWGvj/XX0XOS2GiqRbWimdAvwYadhssljgY8YfxfrYOR
	cP2a/Rn5g8FwXZi2EjLbH7rc+ogMj10BDDkVG9pLB8O0PhS+UHD7VwjnPNwcfjIBYvw==
X-Gm-Gg: ASbGncvWSYUUt0DrsvixDh9UpXo8aXbx8gpHu6Y3QKdKHqcPeBYfy4Mzk+pSqN2fS2N
	3t09f0MpA7LvGPzfzVnzkWjfU0s1G7Z9xDly8oyPDvDp2TJrO1xx9o/UGPrTDsL8tSDr1Uvld87
	h8tPepxloJelxBwtso5bk+AHvcjnalym3y4QKf5LD9m/VxXoKlCmHYzNbNRC0WjaXB45L0Td+By
	MCEEDyDluXVObsjWxRv7jw/IVKJPjSWufUpzA5sUfro9KbjilA7Dywes+CkfuL43uvZIzwu2CDd
	dzb1AF3rKi6f+w7MaYpXG9zM6kZPbz5mJUMB+KYPTVFxbhzMwUWK/GyQc5DNDJAv3dwhp5AbRDx
	B
X-Received: by 2002:ac8:7d85:0:b0:477:64b0:6a21 with SMTP id d75a77b69052e-4a73c50a741mr348535951cf.23.1750342825154;
        Thu, 19 Jun 2025 07:20:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhCRnvlP0etjjpkPyeCSmSYkIm5zMDODMDu/crQw5Kac84QHMQ6yNwPGunOO6XNSGBFXlh2w==
X-Received: by 2002:ac8:7d85:0:b0:477:64b0:6a21 with SMTP id d75a77b69052e-4a73c50a741mr348535301cf.23.1750342824712;
        Thu, 19 Jun 2025 07:20:24 -0700 (PDT)
Received: from trex.. (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a58963561csm7254312f8f.47.2025.06.19.07.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 07:20:24 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        stanimir.k.varbanov@gmail.com
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 6/7] media: venus: core: Add qcm2290 DT compatible and resource data
Date: Thu, 19 Jun 2025 16:20:11 +0200
Message-Id: <20250619142012.1768981-7-jorge.ramirez@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDExOCBTYWx0ZWRfX1yCO1Ru9k9pa
 iusEU3jed7FHwazRrGfdhpkNTrhMg1vAdZCANQmi+yqgqQ1yfEHMtD3oJZjbOdQElS3FHc6pfdU
 fuDbh88nDK75UzL38OsG0m5QwxaN0l682ODCgotIO4MDKTTmAw7vSy3prlmcuQyYQ2Xcq0wjczJ
 wv+lZCH+/r1S3tIl/0qRGkzn8ewf3MehVBGR9WXSjQBUxqeVJz+qVgSrpQyXE/8FPgedx1N69MC
 6mjy2v9Ksccm3c6pQ8fRF9mhM7gwYq7FaF8//x68bO4ztK5edK37POgHgeWceIYcVs8zdRZ3hQD
 IO3q+UBQLaUNPEVpS2SVXmruDIj6ehg6WjFjrErDdNEDTCGyl0zuHxL7gODAP/F2VeQDAywJQv9
 aSs/mBIW2VoJTQEsz2D132sKwpBZa4wbYwsnZ2TLtvs+9drJHkfVVBieW/ftXaocc0W01Qtb
X-Proofpoint-GUID: KCn-OSxEh27yhVhuQIPRXN_GeIgEL2Id
X-Authority-Analysis: v=2.4 cv=btJMBFai c=1 sm=1 tr=0 ts=68541caa cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=6h1BjrdT-BD1Ylfs7NgA:9
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: KCn-OSxEh27yhVhuQIPRXN_GeIgEL2Id
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_05,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 mlxscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506190118

Add a qcm2290 compatible binding to the venus core.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---

 v2: fixed missing enc_nodename
     added Loic Poulain as co-developer (should be on v1)

 drivers/media/platform/qcom/venus/core.c | 40 ++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 8613013f5c28..3ea42e01036c 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -1062,6 +1062,45 @@ static const struct venus_resources sc7280_res = {
 	.enc_nodename = "video-encoder",
 };
 
+static const struct freq_tbl qcm2290_freq_table[] = {
+	{ 352800, 240000000 },	/* 1920x1088 @ 30 + 1280x720 @ 30 */
+	{ 244800, 133000000 },	/* 1920x1088 @ 30 */
+};
+
+static const struct bw_tbl qcm2290_bw_table_dec[] = {
+	{ 244800, 2128000, 0, 2128000, 0}, /* 1920x1088 @ 30 */
+};
+
+static const struct venus_resources qcm2290_res = {
+	.freq_tbl = qcm2290_freq_table,
+	.freq_tbl_size = ARRAY_SIZE(qcm2290_freq_table),
+	.bw_tbl_dec = qcm2290_bw_table_dec,
+	.bw_tbl_dec_size = ARRAY_SIZE(qcm2290_bw_table_dec),
+	.clks = { "core", "iface", "bus", "throttle" },
+	.clks_num = 4,
+	.vcodec0_clks = { "vcodec0_core", "vcodec0_bus" },
+	.vcodec_clks_num = 2,
+	.vcodec_pmdomains = (const char *[]) { "venus", "vcodec0" },
+	.vcodec_pmdomains_num = 2,
+	.opp_pmdomain = (const char *[]) { "cx" },
+	.vcodec_num = 1,
+	.hfi_version = HFI_VERSION_6XX_LITE,
+	.vpu_version = VPU_VERSION_AR50_LITE,
+	.max_load = 352800,
+	.num_vpp_pipes = 1,
+	.vmem_id = VIDC_RESOURCE_NONE,
+	.vmem_size = 0,
+	.vmem_addr = 0,
+	.cp_start = 0,
+	.cp_size = 0x70800000,
+	.cp_nonpixel_start = 0x1000000,
+	.cp_nonpixel_size = 0x24800000,
+	.dma_mask = 0xe0000000 - 1,
+	.fwname = "qcom/venus-6.0/venus.mbn",
+	.dec_nodename = "video-decoder",
+	.enc_nodename = "video-encoder",
+};
+
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
@@ -1072,6 +1111,7 @@ static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
 	{ .compatible = "qcom,sc7280-venus", .data = &sc7280_res, },
 	{ .compatible = "qcom,sm8250-venus", .data = &sm8250_res, },
+	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, venus_dt_match);
-- 
2.34.1


