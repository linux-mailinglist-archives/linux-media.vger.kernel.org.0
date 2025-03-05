Return-Path: <linux-media+bounces-27590-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6FDA4FC85
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 11:46:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CA751895289
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 10:45:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A24A20E014;
	Wed,  5 Mar 2025 10:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="L1De17Fn"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82C620DD46;
	Wed,  5 Mar 2025 10:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741171478; cv=none; b=toxf25PWAUDTSHybuF35bFXg2nctI0UDQVx4/IJyCKBY2JTugNDoSzo7+y5Exn94WxInzA/MDwd4WfvWdtglRXAvHNEzAvUcdOo3TrxsQD0j6+WjLfrW3voktT0l/cOWcZX7mE/1CqYm03V48Up+7kKpXYhsJQV99KlOI/cVXWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741171478; c=relaxed/simple;
	bh=bfoQqDsC1NQPQRMx8KiJDc5enWqMJGusb1/FiILZ59o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L1dUkioTo35/6ZIQNV/eZBUUepiaBKSSCdCnSQ+9xBs1/4fyzUxpxFwAYz7mDQCDYafmAe7oegvin+cuEgR5lrMVwL3hR9YQ/+qiipo3fGA2SMZOYAcy1n+rO06h1jVPll3jV+qXDLUy7cazAzK+/mV3BVM/aUxY6qKpIqbaT3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=L1De17Fn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524NAA1o031403;
	Wed, 5 Mar 2025 10:44:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pqlyaOQrG0Cuo4o0OvhPCgmZnZw5KHktDJpqXby+aCM=; b=L1De17Fn/KPFKdBn
	Czaj21u7OJ5MYp1lFTSMwzjaPy8vHzWLu/7l8MwGQxaXp3TJutzycP/DNvHBOWdo
	UM4o5ESZDzp3nqfdAJavp+X4OYwiYeMDQYE9oZJeNXtyeYSE+dQW91vLFEh6iMZo
	bmHerAKDHDYw41IvnCTuAEc3UVrvPhyRW3pBmF6njeltmGJHluu/7bX7fKqTkicA
	tX1mvn06YZ6NGP6U0Fnsm1x3MitIDM3cpOKWGteJKdH2VYLek6OOagew1ZYssL2+
	iGMMpRVqP3813hEhS8ht1dHEMZy5d/cBYHrc7BMzKaZ/EKIkLrKm1WcJwJsqUhws
	ai7prA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6t51xd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 10:44:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 525AiX5r006391
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Mar 2025 10:44:33 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 5 Mar 2025 02:44:29 -0800
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
To: <quic_vgarodia@quicinc.com>, <quic_abhinavk@quicinc.com>,
        <mchehab@kernel.org>, <quic_dikshita@quicinc.com>
CC: <hverkuil@xs4all.nl>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH 02/12] media: iris: Add platform capabilities for HEVC and VP9 decoders
Date: Wed, 5 Mar 2025 16:13:25 +0530
Message-ID: <20250305104335.3629945-3-quic_dikshita@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250305104335.3629945-1-quic_dikshita@quicinc.com>
References: <20250305104335.3629945-1-quic_dikshita@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: HspAjlj-cP7biLx4xOQchFCGoKumLA4-
X-Authority-Analysis: v=2.4 cv=KfMosRYD c=1 sm=1 tr=0 ts=67c82b11 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=7MnbDLf3qcBUn0XBFNAA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: HspAjlj-cP7biLx4xOQchFCGoKumLA4-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_04,2025-03-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 phishscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxlogscore=999 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503050086

Add platform capabilities for HEVC and VP9 codecs in decoder driver
with related hooks.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c | 28 ++++++-
 .../qcom/iris/iris_hfi_gen2_command.c         | 30 ++++++-
 .../qcom/iris/iris_hfi_gen2_defines.h         |  1 +
 .../qcom/iris/iris_hfi_gen2_response.c        | 36 ++++++++-
 .../platform/qcom/iris/iris_platform_common.h |  9 ++-
 .../platform/qcom/iris/iris_platform_sm8550.c | 80 ++++++++++++++++++-
 6 files changed, 170 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index b690578256d5..fb2b818c7c5c 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -20,9 +20,19 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
 	case V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER:
 		return DEBLOCK;
 	case V4L2_CID_MPEG_VIDEO_H264_PROFILE:
-		return PROFILE;
+		return PROFILE_H264;
+	case V4L2_CID_MPEG_VIDEO_HEVC_PROFILE:
+		return PROFILE_HEVC;
+	case V4L2_CID_MPEG_VIDEO_VP9_PROFILE:
+		return PROFILE_VP9;
 	case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
-		return LEVEL;
+		return LEVEL_H264;
+	case V4L2_CID_MPEG_VIDEO_HEVC_LEVEL:
+		return LEVEL_HEVC;
+	case V4L2_CID_MPEG_VIDEO_VP9_LEVEL:
+		return LEVEL_VP9;
+	case V4L2_CID_MPEG_VIDEO_HEVC_TIER:
+		return TIER;
 	default:
 		return INST_FW_CAP_MAX;
 	}
@@ -36,10 +46,20 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 	switch (cap_id) {
 	case DEBLOCK:
 		return V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER;
-	case PROFILE:
+	case PROFILE_H264:
 		return V4L2_CID_MPEG_VIDEO_H264_PROFILE;
-	case LEVEL:
+	case PROFILE_HEVC:
+		return V4L2_CID_MPEG_VIDEO_HEVC_PROFILE;
+	case PROFILE_VP9:
+		return V4L2_CID_MPEG_VIDEO_VP9_PROFILE;
+	case LEVEL_H264:
 		return V4L2_CID_MPEG_VIDEO_H264_LEVEL;
+	case LEVEL_HEVC:
+		return V4L2_CID_MPEG_VIDEO_HEVC_LEVEL;
+	case LEVEL_VP9:
+		return V4L2_CID_MPEG_VIDEO_VP9_LEVEL;
+	case TIER:
+		return V4L2_CID_MPEG_VIDEO_HEVC_TIER;
 	default:
 		return 0;
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index beaf3a051d7c..a3ebcda9a2ba 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -309,7 +309,20 @@ static int iris_hfi_gen2_set_profile(struct iris_inst *inst)
 {
 	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
 	u32 port = iris_hfi_gen2_get_port(V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
-	u32 profile = inst->fw_caps[PROFILE].value;
+	u32 profile;
+
+	switch (inst->codec) {
+	case V4L2_PIX_FMT_HEVC:
+		profile = inst->fw_caps[PROFILE_HEVC].value;
+		break;
+	case V4L2_PIX_FMT_VP9:
+		profile = inst->fw_caps[PROFILE_VP9].value;
+		break;
+	case V4L2_PIX_FMT_H264:
+	default:
+		profile = inst->fw_caps[PROFILE_H264].value;
+		break;
+	}
 
 	inst_hfi_gen2->src_subcr_params.profile = profile;
 
@@ -326,7 +339,20 @@ static int iris_hfi_gen2_set_level(struct iris_inst *inst)
 {
 	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
 	u32 port = iris_hfi_gen2_get_port(V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
-	u32 level = inst->fw_caps[LEVEL].value;
+	u32 level;
+
+	switch (inst->codec) {
+	case V4L2_PIX_FMT_HEVC:
+		level = inst->fw_caps[LEVEL_HEVC].value;
+		break;
+	case V4L2_PIX_FMT_VP9:
+		level = inst->fw_caps[LEVEL_VP9].value;
+		break;
+	case V4L2_PIX_FMT_H264:
+	default:
+		level = inst->fw_caps[LEVEL_H264].value;
+		break;
+	}
 
 	inst_hfi_gen2->src_subcr_params.level = level;
 
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index 2fcf7914b70f..48c507a1ec27 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -46,6 +46,7 @@
 #define HFI_PROP_CROP_OFFSETS			0x03000105
 #define HFI_PROP_PROFILE			0x03000107
 #define HFI_PROP_LEVEL				0x03000108
+#define HFI_PROP_TIER				0x03000109
 #define HFI_PROP_STAGE				0x0300010a
 #define HFI_PROP_PIPE				0x0300010b
 #define HFI_PROP_LUMA_CHROMA_BIT_DEPTH		0x0300010f
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index b75a01641d5d..809bf0f238bd 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -563,8 +563,22 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
 	inst->crop.width = pixmp_ip->width -
 		((subsc_params.crop_offsets[1] >> 16) & 0xFFFF) - inst->crop.left;
 
-	inst->fw_caps[PROFILE].value = subsc_params.profile;
-	inst->fw_caps[LEVEL].value = subsc_params.level;
+	switch (inst->codec) {
+	case V4L2_PIX_FMT_HEVC:
+		inst->fw_caps[PROFILE_HEVC].value = subsc_params.profile;
+		inst->fw_caps[LEVEL_HEVC].value = subsc_params.level;
+		break;
+	case V4L2_PIX_FMT_VP9:
+		inst->fw_caps[PROFILE_VP9].value = subsc_params.profile;
+		inst->fw_caps[LEVEL_VP9].value = subsc_params.level;
+		break;
+	case V4L2_PIX_FMT_H264:
+	default:
+		inst->fw_caps[PROFILE_H264].value = subsc_params.profile;
+		inst->fw_caps[LEVEL_H264].value = subsc_params.level;
+		break;
+	}
+
 	inst->fw_caps[POC].value = subsc_params.pic_order_cnt;
 
 	if (subsc_params.bit_depth != BIT_DEPTH_8 ||
@@ -791,8 +805,22 @@ static void iris_hfi_gen2_init_src_change_param(struct iris_inst *inst)
 					     full_range, video_format,
 					     video_signal_type_present_flag);
 
-	subsc_params->profile = inst->fw_caps[PROFILE].value;
-	subsc_params->level = inst->fw_caps[LEVEL].value;
+	switch (inst->codec) {
+	case V4L2_PIX_FMT_HEVC:
+		subsc_params->profile = inst->fw_caps[PROFILE_HEVC].value;
+		subsc_params->level = inst->fw_caps[LEVEL_HEVC].value;
+		break;
+	case V4L2_PIX_FMT_VP9:
+		subsc_params->profile = inst->fw_caps[PROFILE_VP9].value;
+		subsc_params->level = inst->fw_caps[LEVEL_VP9].value;
+		break;
+	case V4L2_PIX_FMT_H264:
+	default:
+		subsc_params->profile = inst->fw_caps[PROFILE_H264].value;
+		subsc_params->level = inst->fw_caps[LEVEL_H264].value;
+		break;
+	}
+
 	subsc_params->pic_order_cnt = inst->fw_caps[POC].value;
 	subsc_params->bit_depth = inst->fw_caps[BIT_DEPTH].value;
 	if (inst->fw_caps[CODED_FRAMES].value ==
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index f6b15d2805fb..67204cddd44a 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -78,8 +78,12 @@ struct platform_inst_caps {
 };
 
 enum platform_inst_fw_cap_type {
-	PROFILE = 1,
-	LEVEL,
+	PROFILE_H264 = 1,
+	PROFILE_HEVC,
+	PROFILE_VP9,
+	LEVEL_H264,
+	LEVEL_HEVC,
+	LEVEL_VP9,
 	INPUT_BUF_HOST_MAX_COUNT,
 	STAGE,
 	PIPE,
@@ -88,6 +92,7 @@ enum platform_inst_fw_cap_type {
 	BIT_DEPTH,
 	RAP_FRAME,
 	DEBLOCK,
+	TIER,
 	INST_FW_CAP_MAX,
 };
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
index 35d278996c43..29bc50785da5 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
@@ -14,7 +14,7 @@
 
 static struct platform_inst_fw_cap inst_fw_cap_sm8550[] = {
 	{
-		.cap_id = PROFILE,
+		.cap_id = PROFILE_H264,
 		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
 		.max = V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH,
 		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
@@ -28,7 +28,29 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550[] = {
 		.set = iris_set_u32_enum,
 	},
 	{
-		.cap_id = LEVEL,
+		.cap_id = PROFILE_HEVC,
+		.min = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
+		.max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE),
+		.value = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
+		.hfi_id = HFI_PROP_PROFILE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_u32_enum,
+	},
+	{
+		.cap_id = PROFILE_VP9,
+		.min = V4L2_MPEG_VIDEO_VP9_PROFILE_0,
+		.max = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_VP9_PROFILE_0) |
+				BIT(V4L2_MPEG_VIDEO_VP9_PROFILE_2),
+		.value = V4L2_MPEG_VIDEO_VP9_PROFILE_0,
+		.hfi_id = HFI_PROP_PROFILE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_u32_enum,
+	},
+	{
+		.cap_id = LEVEL_H264,
 		.min = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
 		.max = V4L2_MPEG_VIDEO_H264_LEVEL_6_2,
 		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_0) |
@@ -56,6 +78,60 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550[] = {
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
 		.set = iris_set_u32_enum,
 	},
+	{
+		.cap_id = LEVEL_HEVC,
+		.min = V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
+		.max = V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_1) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_6) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_6_1) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2),
+		.value = V4L2_MPEG_VIDEO_HEVC_LEVEL_6_1,
+		.hfi_id = HFI_PROP_LEVEL,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_u32_enum,
+	},
+	{
+		.cap_id = LEVEL_VP9,
+		.min = V4L2_MPEG_VIDEO_VP9_LEVEL_1_0,
+		.max = V4L2_MPEG_VIDEO_VP9_LEVEL_6_0,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_1_0) |
+				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_1_1) |
+				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_2_0) |
+				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_2_1) |
+				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_3_0) |
+				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_3_1) |
+				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_4_0) |
+				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_4_1) |
+				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_5_0) |
+				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_5_1) |
+				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_5_2) |
+				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_6_0),
+		.value = V4L2_MPEG_VIDEO_VP9_LEVEL_6_0,
+		.hfi_id = HFI_PROP_LEVEL,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_u32_enum,
+	},
+	{
+		.cap_id = TIER,
+		.min = V4L2_MPEG_VIDEO_HEVC_TIER_MAIN,
+		.max = V4L2_MPEG_VIDEO_HEVC_TIER_HIGH,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_TIER_MAIN) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_TIER_HIGH),
+		.value = V4L2_MPEG_VIDEO_HEVC_TIER_HIGH,
+		.hfi_id = HFI_PROP_TIER,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_u32_enum,
+	},
 	{
 		.cap_id = INPUT_BUF_HOST_MAX_COUNT,
 		.min = DEFAULT_MAX_HOST_BUF_COUNT,
-- 
2.34.1


