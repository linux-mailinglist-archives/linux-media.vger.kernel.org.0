Return-Path: <linux-media+bounces-43510-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7B1BB18DA
	for <lists+linux-media@lfdr.de>; Wed, 01 Oct 2025 21:01:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3EEA3189F840
	for <lists+linux-media@lfdr.de>; Wed,  1 Oct 2025 19:01:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00EBF2E229C;
	Wed,  1 Oct 2025 19:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XMt/QjtS"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425382E888C
	for <linux-media@vger.kernel.org>; Wed,  1 Oct 2025 19:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759345223; cv=none; b=t31mL/vtP/0PEDg0b9lXmztYhvPmkD5WPpxXAyIeWmcOQHAuH69epj3NeLMo6EeKzclYODEMBzbgavNn4aOitejHwJuTUXa8+MO7gqaVC5wGpsd3tB/3ZAi7gknMr7OlvuASX2CX3jGxMk3o0GF0XAQ/14Ps3SNIeVxgoJkwsrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759345223; c=relaxed/simple;
	bh=xajVi5vqoMHc3VXshBVlzP89xG7cEyxxNOEl071BXq8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E3c3yO7vgwPiJ81uLasCxz9SXrbyLjgUojCkvMnjutFWCBtiCt8FNYNyL/q7HUDvmNLtUu50MKQAFDH3t7fgdh/u0MZqxEyeOQl7CSNP12yotwquPBgFsPkmcylHNm5w/ZeUJu65629rEHnDPMZYh69Dv2n+BUc8nEpfbmhDjbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XMt/QjtS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591IbvVi031946
	for <linux-media@vger.kernel.org>; Wed, 1 Oct 2025 19:00:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JOfmN+HRrnAEIwEBsGixSCQhow/LIwqmVCM2LlbTh88=; b=XMt/QjtSmPKLAErK
	6vT8mfXIThCyBzKDOXF5VZQGYXlkAR3qUMTsJIahlnjnVldAysDZO+TrdHCUwFc4
	uGuAg8IykV1xT13OTZNzTFkB9627kqaIRLpNqO7sPyZrMsE6T3Fj6lenW9fWTL72
	DxLDTf3eJpxX+MwGptZYRkjlDDSIGZFDtKeUiJnygl0auHJxAjsCPiL2366p6+ee
	PX8GlqLDbm//3tSj6t5vvTC3ADzOaPR2VFLmUIKVp+0sFYMHoK95fDYU9udWviQu
	qL4SOmRAQ71xzNUyn2THOEEaA5lLiifcECqvEu1+TA5I8afs7MDeVulc7d8JQgeh
	R9fIbQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6x5wre7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 01 Oct 2025 19:00:19 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-33820f67d7dso70467a91.2
        for <linux-media@vger.kernel.org>; Wed, 01 Oct 2025 12:00:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759345214; x=1759950014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JOfmN+HRrnAEIwEBsGixSCQhow/LIwqmVCM2LlbTh88=;
        b=n1f5GYOBuTDA6VV8q6IdKpqzWrdsUsXQ2uKCME+/kcj8C6+IftXW07EV69S8ecG03D
         XfiR/B1RM8R+X4oD6hqSUO4s1xvWbu3eRrdmByjPVyTPesYmYs9N2uvGMGsB/yIydFyz
         2VnFgkGxzNxwQfVTE437zvjQMio58a9Q2JAyLiUpawmc2xhd96Mr2Jn8g9WbP4jtOmp5
         9JoexQcw8MevudSVHu/9y9S6XWNp5R8pBaTPXoGYDzhOi8XIIFxXGbU3TTUwNhHdtAVh
         jN657S8X13bs/fkwAm5r9I4XhDAtShZWcOvzzdhhYR17jfEzizZAfxPOi9F+7SlbOVdh
         T+Yg==
X-Gm-Message-State: AOJu0YyhXRHNuPNavgDGfPKksqyLz97iqHJbMb+8ztqJoSfct/d+AO5H
	Dq/6GlYO/WXWhov26GwM0DvgueYLr/vp4jRMW7cdTmCZXQs+qO/14pGq58bi2Suby0/+c/Lyxim
	CAf43OWJ3efiiw8FhILJYdasiaC1fUKnjo5ROXU8Vb5PDfMx9b6dMwKJYfUdOQcqKm9/X7E59BQ
	==
X-Gm-Gg: ASbGnctARroKDASn5MRORMLfQj8EZIAVDaSevraz5AqVFlsXiX1E41PSrjbuGmKH6kY
	ykgn4sA6VQ57t//p4n4lsMXt08o6TK6FrGP0wYFg67O66r3PC2hRvaa837aWviHzLrX/rQbOadD
	eNCEvLTP2p6ggrUSEHXtzeI7tChcarv49qCrLmHjfJUOSbU6moK4HBLCyV0iVA4YZE1WwZpfje9
	mnv2CAXT2GQXgtjMA/vKHy7XQaZw6XjKzwzXEuKFh+MN1vvVNKocBRYZOREF0Q/r6L8v7HTfauS
	BjyMPa7hL743zoxuwcsXMCkgx5xaA5p9LxKO8yc0/M+HNqsPe/HaAQal/jDh9LUUKnixoB846R2
	SkAu7W+jl9+GETSqdd3HWpIijBVcrvg==
X-Received: by 2002:a17:90b:38c4:b0:32e:e18a:368d with SMTP id 98e67ed59e1d1-339a7038c89mr2762320a91.8.1759345213738;
        Wed, 01 Oct 2025 12:00:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExL4QG2vboQTe7pTbfYmJEMC2kEI9Ly4Rm5PcCd3TAaCXS/biDDpjbvPAsLrdDhnvzYEPOLA==
X-Received: by 2002:a17:90b:38c4:b0:32e:e18a:368d with SMTP id 98e67ed59e1d1-339a7038c89mr2762306a91.8.1759345213095;
        Wed, 01 Oct 2025 12:00:13 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a701cbffsm2950074a91.21.2025.10.01.12.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 12:00:12 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Wed, 01 Oct 2025 12:00:06 -0700
Subject: [PATCH 3/5] media: iris: Add support for AV1 format in iris
 decoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251001-av1_irisdecoder-v1-3-9fb08f3b96a0@oss.qualcomm.com>
References: <20251001-av1_irisdecoder-v1-0-9fb08f3b96a0@oss.qualcomm.com>
In-Reply-To: <20251001-av1_irisdecoder-v1-0-9fb08f3b96a0@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759345209; l=7441;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=xajVi5vqoMHc3VXshBVlzP89xG7cEyxxNOEl071BXq8=;
 b=GJt/KtXOt5OnOiM8GQF0ByDOHLsG+t14tKdCpOD6oQy+Lazt+K5Roo+vG+42duJcvOscrbXtt
 DRE5HhKyxrlDwBLQQ3ZukyhYUuGafYfu0vcUhRU1dgPDKzMYPb+rVd3
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-GUID: 7dJC8zV5gCN5ZXlBSmMzJ489NQy7aOoq
X-Proofpoint-ORIG-GUID: 7dJC8zV5gCN5ZXlBSmMzJ489NQy7aOoq
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=68dd7a43 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=Z_4drlmlzYXD-T4lrkMA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxOCBTYWx0ZWRfX24kO8fPeMPNe
 zE5y58QHPw4vKBjbTYASWfvjN8IvGei3LjVYsPsTeRBaJ+VkGUPBRCnG6aZG0v8baje6EHP6hfm
 VFqTrIKTTCVNU9d9h2ILBey8vOsA6XE0q+PqLCEkeip3xl7/aTqqxwJEUuQgTXMGmMpwGqiiBuT
 3LSlF1bnFGAf0ZN+eqXvGPVQzXKyhERll72LFEltAcm8APwEVihMUqNcxuZcJyZSpi31X74F8OZ
 svDU+cHEGTx5Zbruyt/BfQsV0lFLjFPfPj4L5dtuITkesuzm4hPBwVM9GDF8SOAj/2UyuQvxB7q
 2KT6tw+Bx9B9T/TKnd2WL0y1gCCkVlldFhpDERUj44G+gbOxhO+v/DTgdxFQMtBucs56jShfn13
 Ck6LkHG8rzRSTWOFXFapTAbi3tinQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_05,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270018

Extend iris decoder driver to support format V4L2_PIX_FMT_AV1.
This change updates the format enumeration (VIDIOC_ENUM_FMT)
and allows setting AV1 format via VIDIOC_S_FMT for gen2 and beyond.
Gen1 iris hardware decoder does not support AV1 format.

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
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
index 58d05e0a112eed25faea027a34c719c89d6c3897..9aca70b4c0690f0d8d799e2a9976bd20d6bb8c94 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -214,6 +214,8 @@ struct iris_platform_data {
 	u64 dma_mask;
 	const char *fwname;
 	u32 pas_id;
+	struct iris_fmt *inst_iris_fmts;
+	u32 inst_iris_fmts_size;
 	struct platform_inst_caps *inst_caps;
 	struct platform_inst_fw_cap *inst_fw_caps_dec;
 	u32 inst_fw_caps_dec_size;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 36d69cc73986b74534a2912524c8553970fd862e..12dfbb79da4838069fd0c2b00c539f4a17e300ba 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -19,6 +19,25 @@
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
@@ -760,6 +779,8 @@ struct iris_platform_data sm8550_data = {
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu/vpu30_p4.mbn",
 	.pas_id = IRIS_PAS_ID,
+	.inst_iris_fmts = platform_fmts_sm8550_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
 	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
 	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
@@ -852,6 +873,8 @@ struct iris_platform_data sm8650_data = {
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu/vpu33_p4.mbn",
 	.pas_id = IRIS_PAS_ID,
+	.inst_iris_fmts = platform_fmts_sm8550_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
 	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
 	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
index 16486284f8acccf6a95a27f6003e885226e28f4d..8fc27069a06d1480eccdbb0d41ed0f03f1328ec6 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
@@ -17,6 +17,21 @@
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
@@ -337,6 +352,8 @@ struct iris_platform_data sm8250_data = {
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


