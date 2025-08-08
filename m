Return-Path: <linux-media+bounces-39098-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CCEB1E4F8
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 10:55:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 50D2E4E3E37
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 08:54:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E4272741DC;
	Fri,  8 Aug 2025 08:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pt3yZLAr"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715EB272803
	for <linux-media@vger.kernel.org>; Fri,  8 Aug 2025 08:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754643199; cv=none; b=ZZS7+TH2wn3+ttNRQY943hTNS+MvneaL3bvzwvGTUtoR0qoSSvgEvqr/tX2O++MwNJYaMS2mh/zLM6cJcrYpeCw4AI43phVpubYHWpwpg7iCtMuE6eEhlH1YpiWGaoTuNFxB4ERANeuOAxMN0AvtPH9yyMgDuAdLY6x541z5ogc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754643199; c=relaxed/simple;
	bh=dARtMRs88U+SkvksFaX/4ibKTv2r3ZxeZPWci1xWpd0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=X5NDIR9orBLbhnWky1FbtNc0SqmNSsR8LBObh+UuUjahO9zPtCinQon2ILLMbzDjyR8+0nPpOeG8yRLTB50xWVJBfyHVsvPdhj68n8rZ0JNefnAAIhXWPCKDw097tgwEtPrTWa/pXV8BYQmVMa4nw2TqkGXg1m7Q/jFYdeL4Rks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pt3yZLAr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5781UiWQ028297
	for <linux-media@vger.kernel.org>; Fri, 8 Aug 2025 08:53:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gdpKkg3HGmZ
	RyeizFHxrsWvpDDfvGRJLvLm05RIe+XY=; b=pt3yZLArRw1Rm/5ncIPIb0qsGfe
	Xl4zM5tuvTrctyIr1g6i9vhW+PTOSy0tGU7pznkOIN0XIfitjU1Shx92DDOnD0IY
	rGW0Cb5sfiOzvDmHaRk+OBS6Vja5U1J8AVIaehXgKrX94UkF3kI0koUzqB32ptTT
	30Vf1VfsXVJvPy+cKwMWGzrD3VSDcUrGjUDdKaa0Kdg1dHK32SRkVM4VgFLNdeMj
	ucNd+xeRz74vK2iexyGFhZZi1dKxS91gsy7BP47MOWXPbYnsgqAFRWn/o20y1d+x
	jbMC80p0hL7KAZHi8ftpqmngjxIyEQVpubALAqCunxagD4wxVj8dgnvVzqQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw39aa0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 08 Aug 2025 08:53:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4af156a27b1so68953131cf.3
        for <linux-media@vger.kernel.org>; Fri, 08 Aug 2025 01:53:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754643194; x=1755247994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gdpKkg3HGmZRyeizFHxrsWvpDDfvGRJLvLm05RIe+XY=;
        b=KZYUTlQ89C9c+0dz89Y1KxiCGD/HN/n3u22+btqChtkAHHZ9NdfyzwlN53aiQw81hP
         Ef8B7kepKmP9+5aa9X3hEO1SEj/5rkowLDYio09TzM/P7Iy4cMkzZGGLMcKiuJpPFia6
         VVGWufMEqwLc8ewN+bH3VepJEL3R8AINDJhxdwYoUb551nx2rOoVKIEQyznORDdPAduI
         ROx7b1Kylz5GywyYL701Ug73PS0UWoN5eeoEUDYE1ugqGJ+t+gu4H5hVcoJHAqjEj9Ek
         RL4Wf0aMlXxX3rtpEvfUNkiwNBGXQff6FR6n+Ht2OWmnJpmjmTI3IwQh7mXw/Xnqv1qT
         CxrA==
X-Forwarded-Encrypted: i=1; AJvYcCXHmGxOOqXInx73iEzVCScE5pbS/dQ7cJ5hYxPtuDoXrSYjFXX0s9u+VuA0m4IXZOHtMqfG7DFObeLlJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaZASpyAYZak5P+1gxyKC2/UfyxtJd9H9nc3ScdhCXoJp2A/GM
	KmyKD6wh1oHtmy/sPW/HzLRylMuvG2GsJ92WeEPKwlhcuXd/z97Pimi9SOnATvuNNkCfcEl+MuM
	WjzyI54dZcCfzmWFOD1b695Fjplw5A+G74NO5o+ZaPpxWK1B6bHsMo3yFjqdrNQahWA==
X-Gm-Gg: ASbGncuCioqAFRmPbJOFMODSuXYbmOBjHGOC7V4C5fTQrhFWkVtaVbAg6v1G9X45YbP
	C+Q1l9okKyWdCCqHKe9Tuw1Q5BAhvUU60Q/JQ8Xpb7sp0OumZ8ugmThLMUMBptxJY472fYHmuNJ
	buhRXRIuPc26IT07SGFlfhQEgztPwowWBxInU7LHkOMMS0O85CnLh4RghvPH/GwbXifMOlkdPVB
	rcsTTfTAHhxM418sbr0eQ2ncF8XX4jAXSMCTI+AOGKd18FDmLNWHphG6Tv17oooLZQJlVvdqqKx
	Q1QyLfEeY6hIUB2YiAwspWBEtyRo4d46gAkUmMIVx3qBbCwhbJkHaHbAkQR/q09p9CL6uTPm5gy
	giEJsKPgcVhcw
X-Received: by 2002:ac8:7d46:0:b0:4b0:8057:1de9 with SMTP id d75a77b69052e-4b0aec61344mr28874081cf.3.1754643194344;
        Fri, 08 Aug 2025 01:53:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExUlMx+GGWyeBlkXQITSAYNbhDzsTQUUeJlNFeViaKa3+u63HbQcCdHN+GInBsmqD4n9/6wA==
X-Received: by 2002:ac8:7d46:0:b0:4b0:8057:1de9 with SMTP id d75a77b69052e-4b0aec61344mr28873901cf.3.1754643193925;
        Fri, 08 Aug 2025 01:53:13 -0700 (PDT)
Received: from trex.. (205.red-83-60-94.dynamicip.rima-tde.net. [83.60.94.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e5e99e04sm123818745e9.11.2025.08.08.01.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 01:53:13 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        krzk+dt@kernel.org, konradybcio@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 6/8] media: venus: core: Add qcm2290 DT compatible and resource data
Date: Fri,  8 Aug 2025 10:52:58 +0200
Message-Id: <20250808085300.1403570-7-jorge.ramirez@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOCBTYWx0ZWRfXyYeul9FJMHeR
 4JaY6rE4qcBI3gwTeYUjXSyOb+8xI3bR+FVg8LQRhSYFVuQb31TULVs/FAN/z8SM1M7XCcTy74k
 E+pzDAD9MT9RLwxfsXXvRHw90hRrUSedIOXEeflHMk78kf4N53ta9phxivr1HOLXxNzqo+lR6D5
 XQFRx6I8856kuVNXGOIvPgTnqryiT1LZL9854GqK8wVYO4z31kUOArokCEn40fyevwDRueHfRGi
 k8DAIhm01yTcfqlE0z5GqK7ffZBm4ZZSb1d/SG7pmKZ2WXoVLDDWTW91FlU4ernkiOv1wXsVzLl
 Mo0ACjctWEkKt/Xs5Lozm7CMbDU/eWWrKXJj7GZFqN4NhxpTwuXeOWZs1o2BxfPEXiJFGPw6rwd
 VEuEDMyg
X-Authority-Analysis: v=2.4 cv=J8Cq7BnS c=1 sm=1 tr=0 ts=6895bafb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Rr2dNH5/fcnoRoBmcVUeRg==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=5fA-3PHwp7xA7VOvTvgA:9 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 1I4eHNoKKdqn0_0HGdv-H-rQhQcjpYYD
X-Proofpoint-ORIG-GUID: 1I4eHNoKKdqn0_0HGdv-H-rQhQcjpYYD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060008

Add a qcm2290 compatible binding to the Venus core.

The maximum concurrency is video decode at 1920x1080 (FullHD) with video
encode at 1280x720 (HD).

The driver is not available to firmware versions below 6.0.55 due to an
internal requirement for secure buffers.

The bandwidth tables incorporate a conservative safety margin to ensure
stability under peak DDR and interconnect load conditions.

Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/venus/core.c | 50 ++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 9604a7eed49d..a7c960d1d818 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -1070,10 +1070,60 @@ static const struct venus_resources sc7280_res = {
 	.enc_nodename = "video-encoder",
 };
 
+static const struct bw_tbl qcm2290_bw_table_dec[] = {
+	{ 352800, 597000, 0, 746000, 0 }, /* 1080p@30 + 720p@30 */
+	{ 244800, 413000, 0, 516000, 0 }, /* 1080p@30 */
+	{ 216000, 364000, 0, 454000, 0 }, /* 720p@60  */
+	{ 108000, 182000, 0, 227000, 0 }, /* 720p@30  */
+};
+
+static const struct bw_tbl qcm2290_bw_table_enc[] = {
+	{ 352800, 396000, 0, 0, 0 }, /* 1080p@30 + 720p@30 */
+	{ 244800, 275000, 0, 0, 0 }, /* 1080p@30 */
+	{ 216000, 242000, 0, 0, 0 }, /* 720p@60  */
+	{ 108000, 121000, 0, 0, 0 }, /* 720p@30  */
+};
+
+static const struct firmware_version min_fw = {
+	.major = 6, .minor = 0, .rev = 55,
+};
+
+static const struct venus_resources qcm2290_res = {
+	.bw_tbl_dec = qcm2290_bw_table_dec,
+	.bw_tbl_dec_size = ARRAY_SIZE(qcm2290_bw_table_dec),
+	.bw_tbl_enc = qcm2290_bw_table_enc,
+	.bw_tbl_enc_size = ARRAY_SIZE(qcm2290_bw_table_enc),
+	.clks = { "core", "iface", "bus", "throttle" },
+	.clks_num = 4,
+	.vcodec0_clks = { "vcodec0_core", "vcodec0_bus" },
+	.vcodec_clks_num = 2,
+	.vcodec_pmdomains = (const char *[]) { "venus", "vcodec0" },
+	.vcodec_pmdomains_num = 2,
+	.opp_pmdomain = (const char *[]) { "cx" },
+	.vcodec_num = 1,
+	.hfi_version = HFI_VERSION_4XX,
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
+	.min_fw = &min_fw,
+};
+
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
 	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
+	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },
 	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
 	{ .compatible = "qcom,sc7280-venus", .data = &sc7280_res, },
 	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
-- 
2.34.1


