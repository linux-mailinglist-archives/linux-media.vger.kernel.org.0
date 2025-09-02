Return-Path: <linux-media+bounces-41610-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 631D0B4108B
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 01:03:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EC1C3B0938
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 23:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB3F72E8DF1;
	Tue,  2 Sep 2025 23:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NLrnxbaS"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5852DECB1
	for <linux-media@vger.kernel.org>; Tue,  2 Sep 2025 23:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756854033; cv=none; b=KNtjXEv+kEPilR6Cx/F4LUgbCUxvtfAPdMnkxKQPinR16e2WWHfRma5gH+mX+/lcYCougPn8jl5iIMzJHZJqh2rFoKlXYzDCXRkSIoZIfeGG4f3xHJtUX3PMzI8j6tpg7u9Pd6FYZB1oeS/5WVJasKuZk3le4rjGQdId2kpaHg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756854033; c=relaxed/simple;
	bh=Kx47orXPGexZaP8p+2+3rbgEdZzv/9NvxjGLCgl4yW8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JxAQLuGqGRHUy7B2VEYT9+EmroOb50ERtG5vlWl1ZG+K+X9FqGnyNZst98nkGSdT3jdmPS9GbNt8EcbwM/d0SURWL9Y4DM0BJJ9FYLLCCMxg7TyC3lWvRc2oTCwI5fiqHRgIO+jau21Y4iQbfqx3CSSMywF9THSdcrhGzf2z83I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NLrnxbaS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582EqGoD018439
	for <linux-media@vger.kernel.org>; Tue, 2 Sep 2025 23:00:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aTBObM6XSVmy6H4vnDn98VU9Fu2k2HG5VWLw5+GWZjg=; b=NLrnxbaSLsB7uvYF
	khAVaqZ60HpiBvFT8taSV44+GepvqzJRdUJY36njKUWw3alKBCAoadfXYG7go+8B
	UC8wGD16DCTSG80uypCTQ3h82X1orvipKVxyhACHrl/jYUfuOIaJpS7arVKTDD+L
	glbedC0YEivgDXbCGrTgYwqIthN6TV8CQuTPBop58Xv7J2kkDvWhkOJ6t1nKei9j
	kyRmFwOi2+kpaDsBQxUkVPz/oJXI+55fHy71S1lRfw0MUpNbjsLFil5UR4Qtg/kU
	95auBJk3uFPLRC95rLcgu+QkDEkCsHVR4MraTG4Qkoxp3sj3haISIueLajKK0Rb5
	nNDl/g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48wqvwb6ut-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 02 Sep 2025 23:00:30 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-244582e9d17so17268465ad.3
        for <linux-media@vger.kernel.org>; Tue, 02 Sep 2025 16:00:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756854028; x=1757458828;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aTBObM6XSVmy6H4vnDn98VU9Fu2k2HG5VWLw5+GWZjg=;
        b=Wm5zDsk/+j7YvB3pKHuZk7sHJd/u3CRTVlp72qSs/9r3m0Tl9dB+bKMD5FqaG1vadq
         wc8d+I3G+pHQL2f+ie+tWZOo/Ar3GSINeuLJ/YyWI+qzLJnEKYJ+cmiC6+nwKRL6QG7A
         TA6Vzli4f5QSb/D6H/sf8HOq+RUefCFcE1zdeJ6slnnaS7rr50b21UzknA+zP8Dg9YFe
         jxViK8cOMSLZnuOqRdpIb6vDEbW+riSfEZ+b5X9Mzs6XjyufA2AGhQUjamYMG9O6YKPq
         Tgt3jHgcPzbzYIqCj1do8Iz0Je+FgHdmoupXfWOatRpxIwhLIAm+majhS559hdrjOEse
         +2XQ==
X-Gm-Message-State: AOJu0Yzu1l2AoCc/s/sfK0zcgH7XGCZj7ftQGjrwT+b5e1uMp/59bN4k
	tJKHOthWkOVOkiT+euKMfzsrKHLv98ZjvvYcxIkRPoroGhxZC6k73+43f8Bqfo9MZEmsy5L1zr4
	H2Lttnx4LVLKa3ejSNq2E0c+A1KTjpvulbDZP9zo4592qLN1T6iNWcGAZynCZO0VXHg==
X-Gm-Gg: ASbGncuoykOa0wPUqGeftGYgwja7TwmXl/DroTSMReyYBta2dpdJ9tsY1hGeOS6IqY4
	1kZRAV1j0eMHNp1g7zf+9uLg1kNT2uWn+Rl0ckD22kE9l2VV37td4k+RmcWWdadTZcx3gSnnl8D
	zJNz1Kc0Ythi5TBgGuStse7AsWKGk8wCGbblxP7Q86fesVhl+78EZGYO6lvT/4ruSMGvhOC7sJM
	5qHJXGKCltpPNzDpkYnotCUWj91LzjVdeWmn0K+X6qN2s3k4P+VayHOTCcZpKPgAbUX9SBaKvJd
	70U37PXKrYKf5UXMC/ZzKq1Jhi3PK/pJhGEiUqYQqKc3DYEGNn7Y6A2rK0snMfePADGSoZ9Wuy+
	3LmppswAKywKei7/qP7HiwIvE
X-Received: by 2002:a17:903:22d1:b0:248:8a31:bf6f with SMTP id d9443c01a7336-2491eadb922mr122349145ad.4.1756854027493;
        Tue, 02 Sep 2025 16:00:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFw+5VoJ6duWQ4Rm1aeAzQqI8Z8vHGO1kkHZv3FFiDX16bPxYBB2O3w/2sM8GerwA5o+u8cDA==
X-Received: by 2002:a17:903:22d1:b0:248:8a31:bf6f with SMTP id d9443c01a7336-2491eadb922mr122348415ad.4.1756854026147;
        Tue, 02 Sep 2025 16:00:26 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32a698ad4c1sm1875866a91.5.2025.09.02.16.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 16:00:25 -0700 (PDT)
From: DEEPA GUTHYAPPA MADIVALARA <deepa.madivalara@oss.qualcomm.com>
Date: Tue, 02 Sep 2025 16:00:05 -0700
Subject: [PATCH RFC 3/5] media: iris: Add support for AV1 format in iris
 decoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-rfc_split-v1-3-47307a70c061@oss.qualcomm.com>
References: <20250902-rfc_split-v1-0-47307a70c061@oss.qualcomm.com>
In-Reply-To: <20250902-rfc_split-v1-0-47307a70c061@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756854022; l=7441;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=Kx47orXPGexZaP8p+2+3rbgEdZzv/9NvxjGLCgl4yW8=;
 b=h/+rtfZUH/8/HR6GweeAAXpPh4PtkD34iLLBM1hgfPt/HS3x74Oldmba/GvyZcEI8MUpB8DHb
 pnaxJ2AxqCPAA50fgDxCTjwFubGpbAup10T5fs6VrwajW8noJHQylzs
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAyMDAyNCBTYWx0ZWRfX55pnBY0wmYR/
 evRvynx+aaA2Ns/yorLe8DDP+N08AZTRRA2asp3ekh2hDeQfOUzKmJ39nNVZOdIv+kKnE1oG+vk
 lx420kv/IJAfsZW5d9oFEscTJXyOkKaOC+9KYVutZbIqbLpYVbcCNNQmsHuC9ZOO7hi4rbtr3ra
 If7ljGs539j6McGrKa3JP3XHfYx7DW5KAxBtAyusoFmZme94/NatXvNBr+0bA7ukrUQBHl6Ko8E
 ZVp2GK2iXgNIO36l4FDD06rFrehat2IA4uLLvZoWC4Q2+ZTPru1yVVGhz0tsIG3/Jz89RX/+nIS
 U3Chp8R/ApE3Te0iIgx4viztzCjUIsV296EOSvoP0Vmetix+UD1vWShNOAjyK1qastqPiEKKyA+
 TwEAelMT
X-Authority-Analysis: v=2.4 cv=WKh/XmsR c=1 sm=1 tr=0 ts=68b7770e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Z_4drlmlzYXD-T4lrkMA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: gJdX36mPNQXpR5d0N_MK2lZbod1umvQG
X-Proofpoint-ORIG-GUID: gJdX36mPNQXpR5d0N_MK2lZbod1umvQG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_08,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509020024

Extend iris decoder driver to support format V4L2_PIX_FMT_AV1.
This change updates the format enumeration (VIDIOC_ENUM_FMT)
and allows setting AV1 format via VIDIOC_S_FMT for gen2 and beyond.
Gen1 iris hardware decoder does not support AV1 format.

Signed-off-by: DEEPA GUTHYAPPA MADIVALARA <deepa.madivalara@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
 drivers/media/platform/qcom/iris/iris_instance.h   |  1 +
 .../platform/qcom/iris/iris_platform_common.h      |  2 ++
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 23 ++++++++++++++++++++
 .../platform/qcom/iris/iris_platform_sm8250.c      | 17 +++++++++++++++
 drivers/media/platform/qcom/iris/iris_vdec.c       | 25 ++++++----------------
 6 files changed, 50 insertions(+), 19 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index aa1f795f5626c1f76a32dd650302633877ce67be..bbfe7a0851ea94fb7041a868b4df8b2ec63bf427 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -138,6 +138,7 @@ enum hfi_codec_type {
 	HFI_CODEC_DECODE_HEVC			= 3,
 	HFI_CODEC_ENCODE_HEVC			= 4,
 	HFI_CODEC_DECODE_VP9			= 5,
+	HFI_CODEC_DECODE_AV1			= 7,
 };
 
 enum hfi_picture_type {
diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index 5982d7adefeab80905478b32cddba7bd4651a691..f1883ffc138fd975fb76d4e45904ee04e196cd20 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -19,6 +19,7 @@ enum iris_fmt_type {
 	IRIS_FMT_H264,
 	IRIS_FMT_HEVC,
 	IRIS_FMT_VP9,
+	IRIS_FMT_AV1,
 };
 
 struct iris_fmt {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 96fa7b1bb592441e85664da408ea4ba42c9a15b5..99057a624cb976af68403ef042173b5ebefde8af 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -208,6 +208,8 @@ struct iris_platform_data {
 	u64 dma_mask;
 	const char *fwname;
 	u32 pas_id;
+	struct iris_fmt *inst_iris_fmts;
+	u32 inst_iris_fmts_size;
 	struct platform_inst_caps *inst_caps;
 	struct platform_inst_fw_cap *inst_fw_caps_dec;
 	u32 inst_fw_caps_dec_size;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index cf4b92f534b272a0a1ac2a0e7bb9316501374332..fecf2e06f19723f30777c04bc4b155954c2b746d 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -16,6 +16,25 @@
 #define VIDEO_ARCH_LX 1
 #define BITRATE_MAX				245000000
 
+static struct iris_fmt platform_fmts_sm8550_dec[] = {
+	[IRIS_FMT_H264] = {
+		.pixfmt = V4L2_PIX_FMT_H264,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+	},
+	[IRIS_FMT_HEVC] = {
+		.pixfmt = V4L2_PIX_FMT_HEVC,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+	},
+	[IRIS_FMT_VP9] = {
+		.pixfmt = V4L2_PIX_FMT_VP9,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+	},
+	[IRIS_FMT_AV1] = {
+		.pixfmt = V4L2_PIX_FMT_AV1,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+	}
+};
+
 static struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
 	{
 		.cap_id = PROFILE_H264,
@@ -756,6 +775,8 @@ struct iris_platform_data sm8550_data = {
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu/vpu30_p4.mbn",
 	.pas_id = IRIS_PAS_ID,
+	.inst_iris_fmts = platform_fmts_sm8550_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
 	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
 	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
@@ -847,6 +868,8 @@ struct iris_platform_data sm8650_data = {
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu/vpu33_p4.mbn",
 	.pas_id = IRIS_PAS_ID,
+	.inst_iris_fmts = platform_fmts_sm8550_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
 	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
 	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
index 978d0130d43b5f6febb65430a9bbe3932e8f24df..947dd25a483a792681e34fbbf4396342db582203 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
@@ -16,6 +16,21 @@
 #define BITRATE_PEAK_DEFAULT	(BITRATE_DEFAULT * 2)
 #define BITRATE_STEP		100
 
+static struct iris_fmt platform_fmts_sm8250_dec[] = {
+	[IRIS_FMT_H264] = {
+		.pixfmt = V4L2_PIX_FMT_H264,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+	},
+	[IRIS_FMT_HEVC] = {
+		.pixfmt = V4L2_PIX_FMT_HEVC,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+	},
+	[IRIS_FMT_VP9] = {
+		.pixfmt = V4L2_PIX_FMT_VP9,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+	}
+};
+
 static struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
 	{
 		.cap_id = PIPE,
@@ -335,6 +350,8 @@ struct iris_platform_data sm8250_data = {
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu-1.0/venus.mbn",
 	.pas_id = IRIS_PAS_ID,
+	.inst_iris_fmts = platform_fmts_sm8250_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8250_dec),
 	.inst_caps = &platform_inst_cap_sm8250,
 	.inst_fw_caps_dec = inst_fw_cap_sm8250_dec,
 	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8250_dec),
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index ae13c3e1b426bfd81a7b46dc6c3ff5eb5c4860cb..be8d2d48c82f385e4f46807f7e0dd52e469927cd 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -67,26 +67,12 @@ void iris_vdec_inst_deinit(struct iris_inst *inst)
 	kfree(inst->fmt_src);
 }
 
-static const struct iris_fmt iris_vdec_formats[] = {
-	[IRIS_FMT_H264] = {
-		.pixfmt = V4L2_PIX_FMT_H264,
-		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-	},
-	[IRIS_FMT_HEVC] = {
-		.pixfmt = V4L2_PIX_FMT_HEVC,
-		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-	},
-	[IRIS_FMT_VP9] = {
-		.pixfmt = V4L2_PIX_FMT_VP9,
-		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-	},
-};
-
 static const struct iris_fmt *
 find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 {
-	unsigned int size = ARRAY_SIZE(iris_vdec_formats);
-	const struct iris_fmt *fmt = iris_vdec_formats;
+	unsigned int size = inst->core->iris_platform_data->inst_iris_fmts_size;
+	const struct iris_fmt *fmt =
+			inst->core->iris_platform_data->inst_iris_fmts;
 	unsigned int i;
 
 	for (i = 0; i < size; i++) {
@@ -103,8 +89,9 @@ find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 static const struct iris_fmt *
 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 {
-	const struct iris_fmt *fmt = iris_vdec_formats;
-	unsigned int size = ARRAY_SIZE(iris_vdec_formats);
+	unsigned int size = inst->core->iris_platform_data->inst_iris_fmts_size;
+	const struct iris_fmt *fmt =
+			inst->core->iris_platform_data->inst_iris_fmts;
 
 	if (index >= size || fmt[index].type != type)
 		return NULL;

-- 
2.34.1


