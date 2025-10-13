Return-Path: <linux-media+bounces-44231-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 473D0BD12FD
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 04:10:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D6273B2D4C
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 02:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFC312F3639;
	Mon, 13 Oct 2025 02:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SiBc5mNr"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDE92F1FC9
	for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 02:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760321354; cv=none; b=Q40GAKKk7XrW6sRpR40WRkg9uxUs7mD6+Ohxd1V5uK+MfGIc55fahHQScoEAnbjJ8LAnHRAspUSDseCp/JaZTznJt9tNRw0ptR1R19pzPlXNWB6H8saAgbByG2aBIyyxyigcKOXxLp47z+O2Cfb5AwiMP0zG/s++tBdzgHFvIlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760321354; c=relaxed/simple;
	bh=tF2xZKEy1KLBLxslUFvlaXuedQWx0pXD/cGg0v/pPOY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p5rN0Z5QRL4EcEMuENUWIlBr3NPQT+RXt+xZ+D7M+D2EKfJhsZ5NtryYrYC1eL3WCOXO/z23Qb+t1aKEUSk7jH6Cy/6fjNyMyiZXKHD2mvmHiQITA0TIDqJLaC1ixrSMFYkHVDSruA+wvZXkTgH1O+AvTOKpkLHAdmh9J4DuofY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SiBc5mNr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59CLe1s9014309
	for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 02:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FugFEB47eB3mkByoTboJv9KwXWC9l7irzEYYgxy7X7c=; b=SiBc5mNr/9MEtdiz
	Za/B4dVj16KV37n/EW2yDCJwcvJanuAkKguRwP/Vl3yibCkHZ6lIUIclD6G1Z2DX
	EGggLW+uVdnCjhH355bkEGYr2midVHShDUq0+pUdCaVdC4dAYUvZi/ANTgm6oadn
	8/d4bna2767uCkxCJjYxefh7Dk9DSll67p1OIgxzW60P3tCAb/Rwgk7eNO+CiphI
	pW8BGW6zspX/E+/iiCaY/U3DTvcHbGCJBq2piaDIqLADFZDv9UePfgbP64pFp1wC
	xynu8RwMm/97Xr0ZbRTXPB92Q8qCQ+2BVsnA3WlM5GRxAmqznog3WAVSawsstR0S
	i5F4KQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qff0jxk0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 02:09:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-857003e911fso2153749485a.3
        for <linux-media@vger.kernel.org>; Sun, 12 Oct 2025 19:09:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760321349; x=1760926149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FugFEB47eB3mkByoTboJv9KwXWC9l7irzEYYgxy7X7c=;
        b=NVZNQ/Swu2spFCEi6CEy2FAlUfr9nHrZKW7M6g8x+lqiWxobBCtPbVF5DEx/1YWRAE
         s0YThOFx/I8ByI+rEfJtfPJvwir5GSvir7HLx9v6L5bsGoJQjSxPvuH3svNc91t35aCz
         9hroDpE6ALCuoYdjv189vDqO7iQXVDvVBxRIAx8BcZOKy4gtTDlEhnKhbpSaJ9g8Fa2/
         ZDaFIKPDYkHO/yeS5v6pmK9YTi7I2kwnoFOqSO4kjOzSGvucDUE1PV+UtiZZWQ86ny+7
         LFgxa9RsQLPbLEfCqKUMdM4JeTCGORpcTuvCioYkD9tASMDNfthE3eMc6BeJcmtvDK1X
         cBkg==
X-Gm-Message-State: AOJu0Yxmid/DuRJXVa0EuzsN6lmUdWazJPTEspDjgz0sKnhNTiRAwlqv
	FCX+Y8X52+d7J7oXJG8l8W+hk1zFSEYRAuTlNE88Pc7VkKEDODqRa7SsvA/jhOoh6A3Zu2sLG7+
	AS02s83w3S0KGwYzDHQnglqMF+H0k1UGd1S7Q/SQWFik/f7QMeS7w7fBNCznV+kGQzA==
X-Gm-Gg: ASbGnctugevuVBIdnCxWxquRsO8ROoDtQXkG6HSitUbAkSeCSmjgsz+KzGzaA/oCGlB
	b8AFaXg2fBxxerq2E3UyvGCgXW6hjfaQnhYxIFkir0oDPKxwDveEoYCYqjGjPxSM2a6vjJ3EA+i
	cA23bMprEN97UCCZPmv3DxYBeTtNTH6dv9g6cjhX/23QuGALAwPhvU+JK/XBlVTjHhtbfJeuzDd
	hEjVF51Q2BGw5CCl3rZU6T/IR4QVf6zHpitYAG8FaIhB4D0w4k4YOn263Fz+UIg0G+aTYmwwx7q
	94hsElK0xEBpwS/vMSZZlrK86pO9M7BThMDxhAkLm8h8nkXxcr4vSJ+sxVAddzDUUp6ok63yBuc
	t2R23hGocTyKkBH60h7jJTwLHVYDoTyc8MJNp0DOkVBqZ6XVQeO7c
X-Received: by 2002:a05:622a:550b:b0:4da:24c1:9713 with SMTP id d75a77b69052e-4e6eacc1f5amr275068291cf.15.1760321349355;
        Sun, 12 Oct 2025 19:09:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE98h50XykWhGkypoyEQvA5TxuMCYFcc7+hp1bieaWCbAFpDjw53AF3ukvQ36Z8Mf+gdzxQ3w==
X-Received: by 2002:a05:622a:550b:b0:4da:24c1:9713 with SMTP id d75a77b69052e-4e6eacc1f5amr275067981cf.15.1760321348838;
        Sun, 12 Oct 2025 19:09:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4f99sm3563419e87.7.2025.10.12.19.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 19:09:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 05:08:59 +0300
Subject: [PATCH v3 5/8] media: iris: remove duplicateion between generic
 gen2 data and qcs8300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-iris-sc7280-v3-5-f3bceb77a250@oss.qualcomm.com>
References: <20251013-iris-sc7280-v3-0-f3bceb77a250@oss.qualcomm.com>
In-Reply-To: <20251013-iris-sc7280-v3-0-f3bceb77a250@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=18927;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=tF2xZKEy1KLBLxslUFvlaXuedQWx0pXD/cGg0v/pPOY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo7F85TeHppIVpL2EVSKYl0gE/PzpIjBVmkHbHT
 hQVPAO8YCOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaOxfOQAKCRCLPIo+Aiko
 1Zd/B/9fMhqo5RZZfWT3Cl7nr/ApZJQFL58x0SCU553YoNJ+DPpslcvoEASeVAI+Ln1AJCEMO1k
 vZglwbz5LyurTlV4FI9mZLRR/7ZpInJpqVOY+PFxEOrUG0GacI/XFcOCSfDCtLbh0omufV9L9FL
 HnMN5G2Qm2cj1L6+LVZ0KXOH/41+dDQHoqQTmByvn9oK0Or3a++8b9bA81wA6aeZVNJ7b9eq5hx
 lG+hDDsYqZeIfSHGkvgAUMfOSGXF7b8lcWEra+uL2NiLiaM4sIqPax11YzdAJm9eAynJ+3GCJQn
 xsStUWn1km0zz7Pr4sKY6XCPTB6mGddUcSW5O/gr0Z7Tc6me
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX8O08uVsJ8TDk
 nCMW5RL6s3cmv+gVeUtqELZMid0veImvcCI7eUMBK784mvKWyrkFlAg+OI1hNHw5vcfG7sEDSsK
 RGpYX+ikfyfrx2UhDWy9ovZ9TEZxisFPmO5WnEz+ePvQsQ1WFhxDsc3DinFH4Ndgpgu8hnvVYLG
 uHem5NsKXTprod2qZv67okaPbo8LiKkc5Xi7ieE+JkX3OTsziTjH71t/2og243Bf9wa/kF7NxkP
 e/iOLSF20W/j02Qn3L6pZQ2YCOoAsiImkSTBSRAxsLD+j/G5SDdmrKlK060lj9LuuZTUa58AYPZ
 cHiOMVbR5aE/a1ZuGlBXiWM0wiJBiEOnN3Bv56x4odkY8B4jthbs5oVbUUnVISqT5RdVzwI2eDR
 vbXGSzshsEuLLoQs4D0/iZVYrOQwhA==
X-Proofpoint-GUID: SAnGRSmSQjTdYlQeitByPymnxuCsyt-i
X-Authority-Analysis: v=2.4 cv=PriergM3 c=1 sm=1 tr=0 ts=68ec5f46 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=8lhtx-rUCDsU0NfLSlYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: SAnGRSmSQjTdYlQeitByPymnxuCsyt-i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

Now as we have removed PIPE value from inst_fw_caps_dec there should be
no difference between inst_fw_caps of QCS8300 and SM8550+. Drop the
QCS8300-specific tables and use generic one instead.

The differences between QCS8300 and SM8550 data comes from a
non-conflict merge of commit d22037f3fd33 ("media: iris: Set platform
capabilities to firmware for encoder video device") (which added .set
callbacks), and commit 6bdfa3f947a7 ("media: iris: Add platform-specific
capabilities for encoder video device") (which added QCS8300 data, but
not the callbacks).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../media/platform/qcom/iris/iris_platform_gen2.c  |   9 +-
 .../platform/qcom/iris/iris_platform_qcs8300.h     | 534 +--------------------
 2 files changed, 8 insertions(+), 535 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 7ad03a800356ae9fb73bdbd6d09928d0b500cb3c..25d761cacbbb5d45b02b8868c0f698d47ed1e758 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -996,7 +996,6 @@ const struct iris_platform_data sm8750_data = {
 /*
  * Shares most of SM8550 data except:
  * - inst_caps to platform_inst_cap_qcs8300
- * - inst_fw_caps to inst_fw_cap_qcs8300
  */
 const struct iris_platform_data qcs8300_data = {
 	.get_instance = iris_hfi_gen2_get_instance,
@@ -1022,10 +1021,10 @@ const struct iris_platform_data qcs8300_data = {
 	.fwname = "qcom/vpu/vpu30_p4_s6.mbn",
 	.pas_id = IRIS_PAS_ID,
 	.inst_caps = &platform_inst_cap_qcs8300,
-	.inst_fw_caps_dec = inst_fw_cap_qcs8300_dec,
-	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_qcs8300_dec),
-	.inst_fw_caps_enc = inst_fw_cap_qcs8300_enc,
-	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_qcs8300_enc),
+	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
+	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
+	.inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
+	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),
 	.tz_cp_config_data = &tz_cp_config_sm8550,
 	.core_arch = VIDEO_ARCH_LX,
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
index 612526a938eed0554fc0da99e12c26d22e04bb6e..a97a9f932b75a88535df66160dfc934220919ed5 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
@@ -3,537 +3,9 @@
  * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
-#define BITRATE_MAX				245000000
 
-static const struct platform_inst_fw_cap inst_fw_cap_qcs8300_dec[] = {
-	{
-		.cap_id = PROFILE_H264,
-		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
-		.max = V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH,
-		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
-				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
-				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
-				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_HIGH) |
-				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH),
-		.value = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
-		.hfi_id = HFI_PROP_PROFILE,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
-		.set = iris_set_u32_enum,
-	},
-	{
-		.cap_id = PROFILE_HEVC,
-		.min = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
-		.max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
-		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE),
-		.value = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
-		.hfi_id = HFI_PROP_PROFILE,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
-		.set = iris_set_u32_enum,
-	},
-	{
-		.cap_id = PROFILE_VP9,
-		.min = V4L2_MPEG_VIDEO_VP9_PROFILE_0,
-		.max = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
-		.step_or_mask = BIT(V4L2_MPEG_VIDEO_VP9_PROFILE_0) |
-				BIT(V4L2_MPEG_VIDEO_VP9_PROFILE_2),
-		.value = V4L2_MPEG_VIDEO_VP9_PROFILE_0,
-		.hfi_id = HFI_PROP_PROFILE,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
-		.set = iris_set_u32_enum,
-	},
-	{
-		.cap_id = LEVEL_H264,
-		.min = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
-		.max = V4L2_MPEG_VIDEO_H264_LEVEL_6_2,
-		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_0) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1B) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_1) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_2) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_3) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_0) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_1) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_2) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_0) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_1) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_2) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_0) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_1) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_2) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_0) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_1) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_2) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_0) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_1) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_2),
-		.value = V4L2_MPEG_VIDEO_H264_LEVEL_6_1,
-		.hfi_id = HFI_PROP_LEVEL,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
-		.set = iris_set_u32_enum,
-	},
-	{
-		.cap_id = LEVEL_HEVC,
-		.min = V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
-		.max = V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2,
-		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_1) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_6) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_6_1) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2),
-		.value = V4L2_MPEG_VIDEO_HEVC_LEVEL_6_1,
-		.hfi_id = HFI_PROP_LEVEL,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
-		.set = iris_set_u32_enum,
-	},
-	{
-		.cap_id = LEVEL_VP9,
-		.min = V4L2_MPEG_VIDEO_VP9_LEVEL_1_0,
-		.max = V4L2_MPEG_VIDEO_VP9_LEVEL_6_0,
-		.step_or_mask = BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_1_0) |
-				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_1_1) |
-				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_2_0) |
-				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_2_1) |
-				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_3_0) |
-				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_3_1) |
-				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_4_0) |
-				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_4_1) |
-				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_5_0) |
-				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_5_1) |
-				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_5_2) |
-				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_6_0),
-		.value = V4L2_MPEG_VIDEO_VP9_LEVEL_6_0,
-		.hfi_id = HFI_PROP_LEVEL,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
-		.set = iris_set_u32_enum,
-	},
-	{
-		.cap_id = TIER,
-		.min = V4L2_MPEG_VIDEO_HEVC_TIER_MAIN,
-		.max = V4L2_MPEG_VIDEO_HEVC_TIER_HIGH,
-		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_TIER_MAIN) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_TIER_HIGH),
-		.value = V4L2_MPEG_VIDEO_HEVC_TIER_HIGH,
-		.hfi_id = HFI_PROP_TIER,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
-		.set = iris_set_u32_enum,
-	},
-	{
-		.cap_id = INPUT_BUF_HOST_MAX_COUNT,
-		.min = DEFAULT_MAX_HOST_BUF_COUNT,
-		.max = DEFAULT_MAX_HOST_BURST_BUF_COUNT,
-		.step_or_mask = 1,
-		.value = DEFAULT_MAX_HOST_BUF_COUNT,
-		.hfi_id = HFI_PROP_BUFFER_HOST_MAX_COUNT,
-		.flags = CAP_FLAG_INPUT_PORT,
-		.set = iris_set_u32,
-	},
-	{
-		.cap_id = STAGE,
-		.min = STAGE_1,
-		.max = STAGE_2,
-		.step_or_mask = 1,
-		.value = STAGE_2,
-		.hfi_id = HFI_PROP_STAGE,
-		.set = iris_set_stage,
-	},
-	{
-		.cap_id = PIPE,
-		.min = PIPE_1,
-		/* .max is set via platform data */
-		.step_or_mask = 1,
-		/* .value is set via platform data */
-		.hfi_id = HFI_PROP_PIPE,
-		.set = iris_set_pipe,
-	},
-	{
-		.cap_id = POC,
-		.min = 0,
-		.max = 2,
-		.step_or_mask = 1,
-		.value = 1,
-		.hfi_id = HFI_PROP_PIC_ORDER_CNT_TYPE,
-	},
-	{
-		.cap_id = CODED_FRAMES,
-		.min = CODED_FRAMES_PROGRESSIVE,
-		.max = CODED_FRAMES_PROGRESSIVE,
-		.step_or_mask = 0,
-		.value = CODED_FRAMES_PROGRESSIVE,
-		.hfi_id = HFI_PROP_CODED_FRAMES,
-	},
-	{
-		.cap_id = BIT_DEPTH,
-		.min = BIT_DEPTH_8,
-		.max = BIT_DEPTH_8,
-		.step_or_mask = 1,
-		.value = BIT_DEPTH_8,
-		.hfi_id = HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
-	},
-	{
-		.cap_id = RAP_FRAME,
-		.min = 0,
-		.max = 1,
-		.step_or_mask = 1,
-		.value = 1,
-		.hfi_id = HFI_PROP_DEC_START_FROM_RAP_FRAME,
-		.flags = CAP_FLAG_INPUT_PORT,
-		.set = iris_set_u32,
-	},
-};
-
-static const struct platform_inst_fw_cap inst_fw_cap_qcs8300_enc[] = {
-	{
-		.cap_id = PROFILE_H264,
-		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
-		.max = V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH,
-		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
-				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH) |
-				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
-				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
-				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_HIGH),
-		.value = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
-		.hfi_id = HFI_PROP_PROFILE,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
-	},
-	{
-		.cap_id = PROFILE_HEVC,
-		.min = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
-		.max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
-		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10),
-		.value = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
-		.hfi_id = HFI_PROP_PROFILE,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
-	},
-	{
-		.cap_id = LEVEL_H264,
-		.min = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
-		.max = V4L2_MPEG_VIDEO_H264_LEVEL_6_0,
-		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_0) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1B) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_1) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_2) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_3) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_0) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_1) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_2) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_0) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_1) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_2) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_0) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_1) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_2) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_0) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_1) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_2) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_0),
-		.value = V4L2_MPEG_VIDEO_H264_LEVEL_5_0,
-		.hfi_id = HFI_PROP_LEVEL,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
-	},
-	{
-		.cap_id = LEVEL_HEVC,
-		.min = V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
-		.max = V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2,
-		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_1) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_6) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_6_1) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2),
-		.value = V4L2_MPEG_VIDEO_HEVC_LEVEL_5,
-		.hfi_id = HFI_PROP_LEVEL,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
-	},
-	{
-		.cap_id = STAGE,
-		.min = STAGE_1,
-		.max = STAGE_2,
-		.step_or_mask = 1,
-		.value = STAGE_2,
-		.hfi_id = HFI_PROP_STAGE,
-	},
-	{
-		.cap_id = HEADER_MODE,
-		.min = V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE,
-		.max = V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME,
-		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE) |
-				BIT(V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME),
-		.value = V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME,
-		.hfi_id = HFI_PROP_SEQ_HEADER_MODE,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
-	},
-	{
-		.cap_id = PREPEND_SPSPPS_TO_IDR,
-		.min = 0,
-		.max = 1,
-		.step_or_mask = 1,
-		.value = 0,
-	},
-	{
-		.cap_id = BITRATE,
-		.min = 1,
-		.max = BITRATE_MAX,
-		.step_or_mask = 1,
-		.value = BITRATE_DEFAULT,
-		.hfi_id = HFI_PROP_TOTAL_BITRATE,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
-			CAP_FLAG_DYNAMIC_ALLOWED,
-	},
-	{
-		.cap_id = BITRATE_PEAK,
-		.min = 1,
-		.max = BITRATE_MAX,
-		.step_or_mask = 1,
-		.value = BITRATE_DEFAULT,
-		.hfi_id = HFI_PROP_TOTAL_PEAK_BITRATE,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
-			CAP_FLAG_DYNAMIC_ALLOWED,
-	},
-	{
-		.cap_id = BITRATE_MODE,
-		.min = V4L2_MPEG_VIDEO_BITRATE_MODE_VBR,
-		.max = V4L2_MPEG_VIDEO_BITRATE_MODE_CBR,
-		.step_or_mask = BIT(V4L2_MPEG_VIDEO_BITRATE_MODE_VBR) |
-				BIT(V4L2_MPEG_VIDEO_BITRATE_MODE_CBR),
-		.value = V4L2_MPEG_VIDEO_BITRATE_MODE_VBR,
-		.hfi_id = HFI_PROP_RATE_CONTROL,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
-	},
-	{
-		.cap_id = FRAME_SKIP_MODE,
-		.min = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED,
-		.max = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT,
-		.step_or_mask = BIT(V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED) |
-				BIT(V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_LEVEL_LIMIT) |
-				BIT(V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT),
-		.value = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
-	},
-	{
-		.cap_id = FRAME_RC_ENABLE,
-		.min = 0,
-		.max = 1,
-		.step_or_mask = 1,
-		.value = 1,
-	},
-	{
-		.cap_id = GOP_SIZE,
-		.min = 0,
-		.max = INT_MAX,
-		.step_or_mask = 1,
-		.value = 2 * DEFAULT_FPS - 1,
-		.hfi_id = HFI_PROP_MAX_GOP_FRAMES,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
-			CAP_FLAG_DYNAMIC_ALLOWED,
-	},
-	{
-		.cap_id = ENTROPY_MODE,
-		.min = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC,
-		.max = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC,
-		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC) |
-				BIT(V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC),
-		.value = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC,
-		.hfi_id = HFI_PROP_CABAC_SESSION,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
-	},
-	{
-		.cap_id = MIN_FRAME_QP_H264,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = MIN_QP_8BIT,
-		.hfi_id = HFI_PROP_MIN_QP_PACKED,
-		.flags = CAP_FLAG_OUTPUT_PORT,
-	},
-	{
-		.cap_id = MIN_FRAME_QP_HEVC,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = MIN_QP_8BIT,
-		.hfi_id = HFI_PROP_MIN_QP_PACKED,
-		.flags = CAP_FLAG_OUTPUT_PORT,
-	},
-	{
-		.cap_id = MAX_FRAME_QP_H264,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = MAX_QP,
-		.hfi_id = HFI_PROP_MAX_QP_PACKED,
-		.flags = CAP_FLAG_OUTPUT_PORT,
-	},
-	{
-		.cap_id = MAX_FRAME_QP_HEVC,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = MAX_QP,
-		.hfi_id = HFI_PROP_MAX_QP_PACKED,
-		.flags = CAP_FLAG_OUTPUT_PORT,
-	},
-	{
-		.cap_id = I_FRAME_MIN_QP_H264,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = MIN_QP_8BIT,
-	},
-	{
-		.cap_id = I_FRAME_MIN_QP_HEVC,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = MIN_QP_8BIT,
-	},
-	{
-		.cap_id = P_FRAME_MIN_QP_H264,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = MIN_QP_8BIT,
-	},
-	{
-		.cap_id = P_FRAME_MIN_QP_HEVC,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = MIN_QP_8BIT,
-	},
-	{
-		.cap_id = B_FRAME_MIN_QP_H264,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = MIN_QP_8BIT,
-	},
-	{
-		.cap_id = B_FRAME_MIN_QP_HEVC,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = MIN_QP_8BIT,
-	},
-	{
-		.cap_id = I_FRAME_MAX_QP_H264,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = MAX_QP,
-	},
-	{
-		.cap_id = I_FRAME_MAX_QP_HEVC,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = MAX_QP,
-	},
-	{
-		.cap_id = P_FRAME_MAX_QP_H264,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = MAX_QP,
-	},
-	{
-		.cap_id = P_FRAME_MAX_QP_HEVC,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = MAX_QP,
-	},
-	{
-		.cap_id = B_FRAME_MAX_QP_H264,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = MAX_QP,
-	},
-	{
-		.cap_id = B_FRAME_MAX_QP_HEVC,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = MAX_QP,
-	},
-	{
-		.cap_id = I_FRAME_QP_H264,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = DEFAULT_QP,
-		.hfi_id = HFI_PROP_QP_PACKED,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
-			CAP_FLAG_DYNAMIC_ALLOWED,
-	},
-	{
-		.cap_id = I_FRAME_QP_HEVC,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = DEFAULT_QP,
-		.hfi_id = HFI_PROP_QP_PACKED,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
-			CAP_FLAG_DYNAMIC_ALLOWED,
-	},
-	{
-		.cap_id = P_FRAME_QP_H264,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = DEFAULT_QP,
-		.hfi_id = HFI_PROP_QP_PACKED,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
-			CAP_FLAG_DYNAMIC_ALLOWED,
-	},
-	{
-		.cap_id = P_FRAME_QP_HEVC,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = DEFAULT_QP,
-		.hfi_id = HFI_PROP_QP_PACKED,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
-			CAP_FLAG_DYNAMIC_ALLOWED,
-	},
-	{
-		.cap_id = B_FRAME_QP_H264,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = DEFAULT_QP,
-		.hfi_id = HFI_PROP_QP_PACKED,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
-			CAP_FLAG_DYNAMIC_ALLOWED,
-	},
-	{
-		.cap_id = B_FRAME_QP_HEVC,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = DEFAULT_QP,
-		.hfi_id = HFI_PROP_QP_PACKED,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
-			CAP_FLAG_DYNAMIC_ALLOWED,
-	},
-};
+#ifndef __IRIS_PLATFORM_QCS8300_H__
+#define __IRIS_PLATFORM_QCS8300_H__
 
 static struct platform_inst_caps platform_inst_cap_qcs8300 = {
 	.min_frame_width = 96,
@@ -548,3 +20,5 @@ static struct platform_inst_caps platform_inst_cap_qcs8300 = {
 	.max_frame_rate = MAXIMUM_FPS,
 	.max_operating_rate = MAXIMUM_FPS,
 };
+
+#endif

-- 
2.47.3


