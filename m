Return-Path: <linux-media+bounces-43897-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E84E8BC34FC
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 06:34:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D150C19E0706
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 04:34:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EDC22C08BF;
	Wed,  8 Oct 2025 04:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fRM6Qp6p"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621632C0295
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 04:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759898007; cv=none; b=hxgB9rVe2SGALATP8EViy5Vastgow2GljIdJqBxBP8QOqhlWf6s3RkprmNxlBf+B/PnxQargN+dzPBszH/e9HSsUcr1pX2gVLT1XJM/N9ywMOpTErSEiSxGZgoxQ7P73hs4I09A4SPxUZb4bK67nQ7IhxMi3A6O9FCGXCEZUZq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759898007; c=relaxed/simple;
	bh=fi90ZO8VyFmDtSK0HeyOux9wfKLWW1LkXX0RQsy6nX4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ShrTdGmEnxWF7Ek7tdMPjNM4dPvRSuz/wBHXeYF1K1Qt4iB8ANB3ctsBTEgigAUU4Txleg2dh8gLCLcTJBNWXopOt2/bxtds0+kZpEbmOQx6ixFkns6UKSwE/xDnXYyuDdOmVWFw0fdqxdM6+PL8IClR0ndY3xaMOxTzYhNNvY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fRM6Qp6p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59803i7Y029215
	for <linux-media@vger.kernel.org>; Wed, 8 Oct 2025 04:33:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k6B6F2XTxUqh4MVlcAd6lH9kgrDVGWvVcnVsVD0T3Ho=; b=fRM6Qp6px+zqSR9D
	knOuHpO14Sw8EN324Vaa+bfoWNYGTJbcUYzgk91VmuYFn2ampRZK2LXs9zN5x+jr
	LFU1dVdsXBlVVLPqy0UysVdAtGhnlMRUtHBTqtQOJFx/SXuze6Xc0QPuZpGp8RCf
	l+KELEJneESmCn7O3qc+QaF+UdaUzBuoOFBiD0ZYoBhZJ/UyyWr3H0rwngfeY3gc
	z07gm4hslpAbEUOEOdc2RQJhkEKmbD4FBoNHgKCtF8Z+DR/0oiIO7bAUM7/eQowJ
	2NYwR+KLqrN/r5YM6id56Fs5nXnlmg6/aApCswsIOFR5s4i/YVAVYjFOO3BefwHi
	9OYv8g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49n89hh2fy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 04:33:24 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4de2c597a6eso256922111cf.1
        for <linux-media@vger.kernel.org>; Tue, 07 Oct 2025 21:33:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759898003; x=1760502803;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k6B6F2XTxUqh4MVlcAd6lH9kgrDVGWvVcnVsVD0T3Ho=;
        b=eOS/ufDCcziwjmSHz4wRW1OKLjTiHJqpoMFrLXH988Ngpnm3ISb13wqLina/e4KRxv
         bktaUZFhtHz/4X4xwpfzbD91FYX1G8IMtLoyHWUKP0fpvX6ouqLDHEVYYGuu0DbXYaWa
         N2YCKqiACWcpYSmBhxsnl6X+r5ZudluAQlk9iNsl6j3FrhaMqOMsH+JwnBWTKhVEk7M3
         VsSx22h6JoReiBtLm7MJLUpRwpY2TObj0HTU5t1JHPkHFcZaqSpgdO1Yjrad1m05pZOM
         /8LbQh8DdUzdywisoXatNR26Rpcva3x4x85FqaeOnNOxOwR7MxjkDN4nOKZML5afvDXw
         t/tQ==
X-Gm-Message-State: AOJu0YzCC+1XaApE3biYpsKjc9pbfoTTEqJNDx07yIui1jf0CttLaG2E
	dUb+ZTWKbH0GPv6eR5UfQZyMUJsvFtBVlBuiUbWqJKa4xWHWBna9LRoFpncJA/BfZ+2e3u3KnXl
	nOesezQBUtahHVhyZqePdxIRUXC2+ckLt3tKovRbmzxiY/SX/7VXdMAVnAHFyYGlhaQ==
X-Gm-Gg: ASbGnctaWpD6IfJ1rz/8xuuVlVJcvZSyXCNw6ZzTOGmhaeJ7SGHlyoUb1xsFDaE6n0k
	MV2sM2cVxFQpWMzjeJPFiBERV4p+mMFv81xiDDzwqRbZYSpOmcpw9r5x7cVf/uo6MwnR2CwLBKR
	Oa+35p/HvPC6t0rmO2E9nbZK4It1Cic+TSfnFjtHH5ZGY4ljbgSb1a0VUyr4WExZM+wRDYtwMQj
	xu/S0v0qTZBOTjWM5s8/zhqA3ekrc3Bgd2W+6tGZ/VLsmJROclNRnlh5jJX12gIfOs74KANqYTp
	ssJPtWQ2eSY8Snr8DJAePdC3ZPGeVELcXwoxXC1B0hihGbiapuUiwSWnNxWhwZKsd+b6xONXVIN
	z2ZymLigCHvjj7xe1Whws+pvEiCCQmMDF6fhuniS4vVp2JNHvUkPCymwStw==
X-Received: by 2002:a05:622a:8a:b0:4df:4174:8239 with SMTP id d75a77b69052e-4e6eaceafe1mr24878101cf.29.1759898003055;
        Tue, 07 Oct 2025 21:33:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlzgIpH/zOxyM4AoEVm12GklI6zFxBPvXZHu4ziA3UTn4Go7yLmW5oqRW+kwzHCkfARl0JNw==
X-Received: by 2002:a05:622a:8a:b0:4df:4174:8239 with SMTP id d75a77b69052e-4e6eaceafe1mr24877891cf.29.1759898002540;
        Tue, 07 Oct 2025 21:33:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0119f461sm6751107e87.107.2025.10.07.21.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 21:33:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 08 Oct 2025 07:33:03 +0300
Subject: [PATCH 5/8] media: iris: remove duplicateion between generic gen2
 data and qcs8300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251008-iris-sc7280-v1-5-def050ba5e1f@oss.qualcomm.com>
References: <20251008-iris-sc7280-v1-0-def050ba5e1f@oss.qualcomm.com>
In-Reply-To: <20251008-iris-sc7280-v1-0-def050ba5e1f@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=19350;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=fi90ZO8VyFmDtSK0HeyOux9wfKLWW1LkXX0RQsy6nX4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo5emDQn2adaduvlQeakcRNRGL0EJndG7oYhwe+
 plgVgf1oIOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaOXpgwAKCRCLPIo+Aiko
 1UaCCACh0IfMHHC4+zmKKGp55PC+V18+OPGF46TwvDYffl0VQKNK42ECWG8SXU8y0ZUJrI1auOL
 bnFWDnaqk7WRHmIlsty2beAMHt1GUXzuvy7kFi6CSkJY3mcH7WEwkO9LySTkGRgrbBGxRABjRS8
 xBuIWUigtGD4iIn61D9B0erfI4xwMIcpInlbVwGurxw0ChuM/wKuEZO7gsvdmkbcIATllQpoZPe
 N5fCsvGw0QZdboFNg6nXk6Rx+PHb2bTuUGK4JMaSk+x1ID+wCyUDcdJWOhMsI5cRL3TzsXqFJJC
 02eagHB32Aq6s2oK2HTBVxaAycfPpmiz5SaDNcbqSyBDDbgW
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA3MDE0NiBTYWx0ZWRfXz3zKDbvaYFcd
 O1VmrdqcVIk8UEfz4VPFdpNIOtyUzhHJ1dco34TZXjF3wk71ulngDBIqblnVIw/DEu/PZZgD9QK
 S+6UG0J8/Rr+kXlKeOvDOQabgzc4jbmjyWRSPISU1wI+WVoS224bFfvBlUt8wcTmmM+6vuO/iSK
 dnXufAK1vR6afWmgiVngHpZ1bZtzqyAqiSU3rPG1nl+nBLzdEHeL9MF01sQkh5AAQYtwLqn4FuQ
 Ul1QruKbylVmxYEGzKTrq/m2iOmu0OJpXqDI07oM9kHP4X5Zm50vPRZ6oLdMZiJInCZvaDDLzUw
 z7Qs6mlKzTP/YYsGxSCJZRzJaOZf9vvnMP5EaAqfS3kl3+NofY9wvg7NnsP2UMJbUZ3hJbkOg/w
 /j6b1owBtkGFYVf7USXvo1jVhDKi3Q==
X-Proofpoint-ORIG-GUID: tW0qDUHSYbuRh1kk7nXmy7kMAJhAbIMU
X-Proofpoint-GUID: tW0qDUHSYbuRh1kk7nXmy7kMAJhAbIMU
X-Authority-Analysis: v=2.4 cv=cKbtc1eN c=1 sm=1 tr=0 ts=68e5e994 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=UhuBZIMd0yMLEHTcz5cA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510070146

Now as we have removed PIPE value from inst_fw_caps_dec there should be
no difference between inst_fw_caps of QCS8300 and SM8550+. Drop the
QCS8300-specific tables and use generic one instead.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  28 +-
 .../platform/qcom/iris/iris_platform_qcs8300.h     | 550 ---------------------
 2 files changed, 18 insertions(+), 560 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 7ad03a800356ae9fb73bdbd6d09928d0b500cb3c..5ddc579a73bbc75e3bfca5881d6eee4aa40f09c9 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -12,7 +12,6 @@
 #include "iris_vpu_buffer.h"
 #include "iris_vpu_common.h"
 
-#include "iris_platform_qcs8300.h"
 #include "iris_platform_sm8650.h"
 #include "iris_platform_sm8750.h"
 
@@ -993,11 +992,20 @@ const struct iris_platform_data sm8750_data = {
 	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
 };
 
-/*
- * Shares most of SM8550 data except:
- * - inst_caps to platform_inst_cap_qcs8300
- * - inst_fw_caps to inst_fw_cap_qcs8300
- */
+static struct platform_inst_caps platform_inst_cap_qcs8300 = {
+	.min_frame_width = 96,
+	.max_frame_width = 4096,
+	.min_frame_height = 96,
+	.max_frame_height = 4096,
+	.max_mbpf = (4096 * 2176) / 256,
+	.mb_cycles_vpp = 200,
+	.mb_cycles_fw = 326389,
+	.mb_cycles_fw_vpp = 44156,
+	.num_comv = 0,
+	.max_frame_rate = MAXIMUM_FPS,
+	.max_operating_rate = MAXIMUM_FPS,
+};
+
 const struct iris_platform_data qcs8300_data = {
 	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
@@ -1022,10 +1030,10 @@ const struct iris_platform_data qcs8300_data = {
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
deleted file mode 100644
index 612526a938eed0554fc0da99e12c26d22e04bb6e..0000000000000000000000000000000000000000
--- a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
+++ /dev/null
@@ -1,550 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
- */
-
-#define BITRATE_MAX				245000000
-
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
-
-static struct platform_inst_caps platform_inst_cap_qcs8300 = {
-	.min_frame_width = 96,
-	.max_frame_width = 4096,
-	.min_frame_height = 96,
-	.max_frame_height = 4096,
-	.max_mbpf = (4096 * 2176) / 256,
-	.mb_cycles_vpp = 200,
-	.mb_cycles_fw = 326389,
-	.mb_cycles_fw_vpp = 44156,
-	.num_comv = 0,
-	.max_frame_rate = MAXIMUM_FPS,
-	.max_operating_rate = MAXIMUM_FPS,
-};

-- 
2.47.3


