Return-Path: <linux-media+bounces-46060-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CB2C2444C
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 10:52:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8DE0B34FB71
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 09:52:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8B41335547;
	Fri, 31 Oct 2025 09:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K/ocqW8t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nk07dQSy"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A826334C17
	for <linux-media@vger.kernel.org>; Fri, 31 Oct 2025 09:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761904306; cv=none; b=kzJPy8/xoP1DyObvhpYyZDObsPQ3dfzAc4fYGSVn7a+UtCAEaj6tNfD+4tIajzFwk87qTIgU2Hdg49TfGdDA6ZuuaSCnakg/RiOmkIv+9gbR8OUCRdPgOc5tFMveF2Ay22sVFbwwxlIeNr63Kc7uWtJpD6wk3SKU3INUo0o1DDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761904306; c=relaxed/simple;
	bh=jpNsgj9gdELo185+96j7Hr3sSN9WRvVVARbrZ2cVqXA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YMld5xORPbWkEuxPvF+JFfiuz6yOnRnltI7FN0ytlhxlRXxtSNL/wIInk75whTmSGHY0zDoT3RRmxZZFcEveHfpRnOyO5mlByauW2iYLYTG/PwQmuejTa1tZGe9nobuh/S1DXCbG9zwzIKQR5bCEqLBjMjDo35MP/NzyOg/EEfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K/ocqW8t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nk07dQSy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V73UYR2058979
	for <linux-media@vger.kernel.org>; Fri, 31 Oct 2025 09:51:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vr5kFCQzCWXCDRArBL3PmsdoAtjmZop4TRfjosWgvKU=; b=K/ocqW8tPiisJ24J
	kLqna/kh5D4YFWNH+i1jKOUwSjiKwiNY6aCSzjCu5KqWZcxdDOuEqFXlANoiumyx
	xg4VxDI0it+KGJdNF5dMA7uYyVhNOYBNKDwca6uTpv9PlnigH91BZFye9voZH3WX
	csNhpn59lz9fljv6MYjFthOmj+YBeTT/zaB07ycFZWuLLkw0hmENp7z6zbagi2zB
	GZuQZOUPQ5O6p4Eb4hhRJmPVbRliQ64fNYJIVX2p9f1Rvtejta1APazRX+JiS2dI
	MVf607toiCc3Ae5kc0SDz4ELtPMD9k8puNCp+gF43ucudLmgv6cNfiH7ICoUM/Qv
	Y2t7pg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4rcvgfrv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 31 Oct 2025 09:51:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-277f0ea6ee6so20242915ad.0
        for <linux-media@vger.kernel.org>; Fri, 31 Oct 2025 02:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761904303; x=1762509103; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vr5kFCQzCWXCDRArBL3PmsdoAtjmZop4TRfjosWgvKU=;
        b=Nk07dQSyrkF6AYnvk7eVsZ7NN6UFoeOyQH3U+cpFhVT2qFY00SFX3n23aJ1t7C2hGr
         lgjgdHUrdbRk35EN8SypII6rKKwLmCdg6pgLE5kioRmFlqInvW7nwx9AQd9OB+iNhbrP
         VIc3FXT+7KisvlgyzpTDkN96w+YrjZsQSjK3Wm2qkUbJkx4QP4rOYML9V0E7CJoLkREw
         I+U4Evfes5hE5Pi3D0wfDdth8X/yrmZnaA+3mYwdBAorDr8SwLpZvEjF+lcJOHG1mtmy
         hreVGGPAcJMXyM5gzx4MsNNE5CkC43AjkcukaFOT/qVuTu4qmCBTUb33Fxqb9fEPujxO
         UUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761904303; x=1762509103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vr5kFCQzCWXCDRArBL3PmsdoAtjmZop4TRfjosWgvKU=;
        b=skO02ynqG42gw2pnJSDEgYlWVtD6kHiah+DwGky4Orf/WChp+7Y2ewwOPtJCvVY66P
         XQps057Nj7LDGJYEhurePccTJBOJNCb4RJkaz+PUxc0GCf7oos3reFh7ZTof7c8Uvgh7
         NOdM/LePGZ2o9goxna5eX1Rwmn2EGZGwEobdWwRWPl+03UeCuv3NDqCXkrsc101rvQny
         lODfCyYWdkkMu6SrKvGQ6nLo/sK4Js8xy++iaXTgy59t+eHegXEyQ/Nw2NivGIfucF0H
         5fa03i0JsG1r5cEEL3avDWQxpKJkL3GWgewKL9pwSPmrowsI+tTlDytup2Iko4AcVno2
         h2Qw==
X-Gm-Message-State: AOJu0YyEMoKb47ReOlgTMwUslEcSauCIuxcPYx+Q4PQ2QbbHI8nXxIhN
	MLq0BU368lfl/70AKOwmbbGb0iX8lvu5YdBUHopBlvw2Y5gVInZjnZawExz4W1y61LTRD//Dr9I
	qEVa0CHfqWJf29JVlEsXoYnndeULjsDmU+AxN8/p0OC/0z9Or7MMMahPTZDzoWCJV+A==
X-Gm-Gg: ASbGncvpb02dDqJlvgGjEx1xx1HZ+CLwtoFrkAOVTLKlKqh6o3BVuhMEgUEU2ewHIDn
	2rQJx95nbVa2NxwFW01vpgWFCqpJBxjZbTJYqRB16j/q0HlSoR6MlasdR/e0/u/tNRcwTajxnt/
	1+D8EA3nCl/3IsDqgebmSwoYqt+ailMBURBKu7AJnwbG/QbR9s6InXzCA22+W1srtmYk3obZ6o3
	iwAtbyqptOGQKGtSoR0TAmv5IX3Y+ZZRLrJphcP1nyPXX76D0oAbvvJHN6Vsb6+7ufBf7DAiOMS
	h8FFABUs1Wg34blWGk+cFAHDa7puO5aXljmCw2a6t8kZwq+QCh4c4qXpsx6LWYVwqNIJwbn55hh
	turoiTBxnr+L32ZwEOLnqa5JvNfxsMimbLv+qC7Et75o5s+21lrObR2sltBXWOGpabuHeeNYXOg
	==
X-Received: by 2002:a17:903:2282:b0:295:24d7:3798 with SMTP id d9443c01a7336-29524d74040mr24545315ad.14.1761904302854;
        Fri, 31 Oct 2025 02:51:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsvGI8vYjTAW1ylwvlqQKUQl3jyhVEzCwCWM5R3dr5xcE/g3nAT2ccdbpLsDQsifi8CwKLUw==
X-Received: by 2002:a17:903:2282:b0:295:24d7:3798 with SMTP id d9443c01a7336-29524d74040mr24544925ad.14.1761904302239;
        Fri, 31 Oct 2025 02:51:42 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-295268716e4sm17913115ad.9.2025.10.31.02.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 02:51:41 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 17:50:40 +0800
Subject: [PATCH v2 2/5] media: qcom: iris: Add scale support for encoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-iris_encoder_enhancements-v2-2-319cd75cbb45@oss.qualcomm.com>
References: <20251031-iris_encoder_enhancements-v2-0-319cd75cbb45@oss.qualcomm.com>
In-Reply-To: <20251031-iris_encoder_enhancements-v2-0-319cd75cbb45@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>, quic_qiweil@quicinc.com,
        quic_renjiang@quicinc.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761904292; l=8809;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=jpNsgj9gdELo185+96j7Hr3sSN9WRvVVARbrZ2cVqXA=;
 b=/t2SCGADFdiqGYukGPuv90oUoJa6lBIq7gXXXMMaqiCwZT3NPm9majCNdN2P9RGtdT7RQdyMq
 LRddCQYK3naBpDXs3gadn/9T07d2S4wdIzfJWjVgPH08DfZxmY6uKpK
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=bJYb4f+Z c=1 sm=1 tr=0 ts=690486af cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=WTz_1cNxA-dsg9Q2lx4A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDA4OSBTYWx0ZWRfX4wyTEHQ2Vp59
 B0Q6oG51zQor0nnM5+C4MHqaz7YjFrYLQnkrwrF65oWGQA28lYiOkbJ95Nc0nfEsADxd5DR2TdB
 5BlTI5QrnptXIuROL6c1fCUs2CUO3WvHmd3s/WuX07EM66uu5aCPKNSH0hLnwSbNhocBwAssMWa
 JxG62DZ1/9mnuKSoz+AUs5XtF36gsy88ApjT4K/iSBYt28XI9GgKEbDf0Lfao6K6EhvTsBRLsuN
 lStB7dAec80S0UEkSs3C116x289sN3tYBXDj8P5dCCYUr/NUYA9XlFSazuHYZkInswM4vViMlT2
 XY+2O0IDI0E6lBtRR1hRyx9PxNmKJyN0zWvbh58/l3OI4g2KqoEa8c/QZc2IMXGmdMqAHzwE0aU
 A+99j3/CeTdtc6wpqTs4iDSIJimCeA==
X-Proofpoint-ORIG-GUID: maloJcOQAampvE6PhRz5PbP_V_5p0zGM
X-Proofpoint-GUID: maloJcOQAampvE6PhRz5PbP_V_5p0zGM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0 malwarescore=0
 spamscore=0 suspectscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310089

Add members enc_scale_width, enc_scale_height to the struct iris_inst to
support scale requirements.

Add output width and height settings in iris_venc_s_fmt_output to
enable scaling functionality.

Add VPSS buffer to platform data, which the scale function requires.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |  4 ++--
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  2 ++
 drivers/media/platform/qcom/iris/iris_instance.h   |  4 ++++
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 12 +++++++++++
 drivers/media/platform/qcom/iris/iris_venc.c       | 23 +++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  9 +++++----
 6 files changed, 47 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index ada9b4d298ef10ac47a573061369828a1e150f85..6ec217268a2bc1f939fa33820c1ae19adaad2e96 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -194,8 +194,8 @@ static int iris_hfi_gen2_set_bitstream_resolution(struct iris_inst *inst, u32 pl
 		payload_type = HFI_PAYLOAD_U32;
 	} else {
 		codec_align = inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
-		resolution = ALIGN(inst->fmt_dst->fmt.pix_mp.width, codec_align) << 16 |
-			ALIGN(inst->fmt_dst->fmt.pix_mp.height, codec_align);
+		resolution = ALIGN(inst->enc_scale_width, codec_align) << 16 |
+			ALIGN(inst->enc_scale_height, codec_align);
 		inst_hfi_gen2->dst_subcr_params.bitstream_resolution = resolution;
 		payload_type = HFI_PAYLOAD_32_PACKED;
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index 2f1f118eae4f6462ab1aa1d16844b34e6e699f1e..dc3e606b6ab429a1d15536fa8316afb1e384d674 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -54,6 +54,8 @@ static u32 iris_hfi_gen2_buf_type_to_driver(struct iris_inst *inst,
 			return BUF_SCRATCH_2;
 	case HFI_BUFFER_PERSIST:
 		return BUF_PERSIST;
+	case HFI_BUFFER_VPSS:
+		return BUF_VPSS;
 	default:
 		return 0;
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index fbae1662947df73bb3d10b7892839fa1076b7e61..5ff01dd7177fc919d0cc69553fadede5801592a1 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -66,6 +66,8 @@ struct iris_fmt {
  * @hfi_rc_type: rate control type
  * @enc_raw_width: raw image width for encoder instance
  * @enc_raw_height: raw image height for encoder instance
+ * @enc_scale_width: scale width for encoder instance
+ * @enc_scale_height: scale height for encoder instance
  */
 
 struct iris_inst {
@@ -106,6 +108,8 @@ struct iris_inst {
 	u32				hfi_rc_type;
 	u32				enc_raw_width;
 	u32				enc_raw_height;
+	u32				enc_scale_width;
+	u32				enc_scale_height;
 };
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 36d69cc73986b74534a2912524c8553970fd862e..d3306189d902a1f42666010468c9e4e4316a66e1 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -729,6 +729,10 @@ static const u32 sm8550_dec_op_int_buf_tbl[] = {
 	BUF_DPB,
 };
 
+static const u32 sm8550_enc_ip_int_buf_tbl[] = {
+	BUF_VPSS,
+};
+
 static const u32 sm8550_enc_op_int_buf_tbl[] = {
 	BUF_BIN,
 	BUF_COMV,
@@ -816,6 +820,8 @@ struct iris_platform_data sm8550_data = {
 	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
 	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
 
+	.enc_ip_int_buf_tbl = sm8550_enc_ip_int_buf_tbl,
+	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_ip_int_buf_tbl),
 	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
 	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
 };
@@ -908,6 +914,8 @@ struct iris_platform_data sm8650_data = {
 	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
 	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
 
+	.enc_ip_int_buf_tbl = sm8550_enc_ip_int_buf_tbl,
+	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_ip_int_buf_tbl),
 	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
 	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
 };
@@ -989,6 +997,8 @@ struct iris_platform_data sm8750_data = {
 	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
 	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
 
+	.enc_ip_int_buf_tbl = sm8550_enc_ip_int_buf_tbl,
+	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_ip_int_buf_tbl),
 	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
 	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
 };
@@ -1077,6 +1087,8 @@ struct iris_platform_data qcs8300_data = {
 	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
 	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
 
+	.enc_ip_int_buf_tbl = sm8550_enc_ip_int_buf_tbl,
+	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_ip_int_buf_tbl),
 	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
 	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
 };
diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index 6adadc89e360a6e4bebe1f839d38892990e10fa2..17a2e59e4ba8ff650895dde9fe569da39ef88093 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -70,6 +70,8 @@ int iris_venc_inst_init(struct iris_inst *inst)
 
 	inst->enc_raw_width = DEFAULT_WIDTH;
 	inst->enc_raw_height = DEFAULT_HEIGHT;
+	inst->enc_scale_width = DEFAULT_WIDTH;
+	inst->enc_scale_height = DEFAULT_HEIGHT;
 
 	memcpy(&inst->fw_caps[0], &core->inst_fw_caps_enc[0],
 	       INST_FW_CAP_MAX * sizeof(struct platform_inst_fw_cap));
@@ -188,15 +190,32 @@ int iris_venc_try_fmt(struct iris_inst *inst, struct v4l2_format *f)
 
 static int iris_venc_s_fmt_output(struct iris_inst *inst, struct v4l2_format *f)
 {
+	const struct iris_fmt *venc_fmt;
 	struct v4l2_format *fmt;
+	u32 codec_align;
 
 	iris_venc_try_fmt(inst, f);
 
-	if (!(find_format(inst, f->fmt.pix_mp.pixelformat, f->type)))
+	venc_fmt = find_format(inst, f->fmt.pix_mp.pixelformat, f->type);
+	if (!venc_fmt)
 		return -EINVAL;
 
+	codec_align = venc_fmt->pixfmt == V4L2_PIX_FMT_HEVC ? 32 : 16;
+
 	fmt = inst->fmt_dst;
 	fmt->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+	/*
+	 * If output format size != input format size,
+	 * it is considered a scaling case,
+	 * and the scaled size needs to be saved.
+	 */
+	if (f->fmt.pix_mp.width != fmt->fmt.pix_mp.width ||
+	    f->fmt.pix_mp.height != fmt->fmt.pix_mp.height) {
+		fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, codec_align);
+		fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, codec_align);
+		inst->enc_scale_width = f->fmt.pix_mp.width;
+		inst->enc_scale_height = f->fmt.pix_mp.height;
+	}
 	fmt->fmt.pix_mp.num_planes = 1;
 	fmt->fmt.pix_mp.plane_fmt[0].bytesperline = 0;
 	fmt->fmt.pix_mp.plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_OUTPUT);
@@ -254,6 +273,8 @@ static int iris_venc_s_fmt_input(struct iris_inst *inst, struct v4l2_format *f)
 
 	inst->enc_raw_width = f->fmt.pix_mp.width;
 	inst->enc_raw_height = f->fmt.pix_mp.height;
+	inst->enc_scale_width = f->fmt.pix_mp.width;
+	inst->enc_scale_height = f->fmt.pix_mp.height;
 
 	if (f->fmt.pix_mp.width != inst->crop.width ||
 	    f->fmt.pix_mp.height != inst->crop.height) {
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index 4463be05ce165adef6b152eb0c155d2e6a7b3c36..db5adadd1b39c06bc41ae6f1b3d2f924b3ebf150 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -1131,10 +1131,11 @@ static u32 iris_vpu_enc_arp_size(struct iris_inst *inst)
 
 inline bool is_scaling_enabled(struct iris_inst *inst)
 {
-	return inst->crop.left != inst->compose.left ||
-		inst->crop.top != inst->compose.top ||
-		inst->crop.width != inst->compose.width ||
-		inst->crop.height != inst->compose.height;
+	struct v4l2_pix_format_mplane *dst_fmt = &inst->fmt_dst->fmt.pix_mp;
+	struct v4l2_pix_format_mplane *src_fmt = &inst->fmt_src->fmt.pix_mp;
+
+	return dst_fmt->width != src_fmt->width ||
+		dst_fmt->height != src_fmt->height;
 }
 
 static inline

-- 
2.43.0


