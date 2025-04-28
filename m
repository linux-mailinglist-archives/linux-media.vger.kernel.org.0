Return-Path: <linux-media+bounces-31174-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C456AA9ECF6
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 11:45:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6468716B0C3
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 09:44:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85E2228A1DC;
	Mon, 28 Apr 2025 09:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EjoYYPRH"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F73627510F;
	Mon, 28 Apr 2025 09:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745832710; cv=none; b=MpvFx/7jcsRwOZtsV14irMoHtkRzaMVnJAvSjTwlMfeimx76WXHPUVBmgbnwmf8nbz2+x7taRz2O0Nsn+IjYY9GLxZSj3FV4wLhMnyy/CkHKtZqGAv8wnTB9ykFjV6JaUpSfLe+ISiVDFM1jIEz/I+eAAjn2MniqX0EgMH4PjVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745832710; c=relaxed/simple;
	bh=qfqvVVTTp3B6JAn8R11vsnQxf2uewwrle1OsZNBBBI8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=eJNiSVye5f1jGQG/LWm1oACqcXwO3FlLAWXt2RfXrDAIXHRj9T3PbKM4ohdJAQOJMOanc3Yl48gJ8LO8cOMVNglKHxV/FGx2DcJjVOuu9A13UET0319kp71PJ8xZCKGEyA93B6RJVPE1RXUSJ4IyZ+jTOJqT+T7Jgg1ioazvMGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EjoYYPRH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S6iwSW011043;
	Mon, 28 Apr 2025 09:31:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cV2tu0CWzdN3+B0VaOeoGhx7prDM0uvChcYel0z4iRE=; b=EjoYYPRHGP+4rVqp
	HMzmSsYNpAmbmRdGpnKD9UCKujnlU9mu9r2r5FD8c06rCPy3hkImpgiLHb/lgFP1
	zZohBWt4jFjDXTjT/VNvVbITZMiLdC4qNP4u+ZcVQ1JvWuKTbu45k3jGad3SGvC/
	J4+v3Ce2+20jQ8w+OgKejVCOA1y4szrIfGjrsDMaA0Vmt84K58KdLfUnTa5/9VlQ
	oKjLh1LhWn7x3xYt30YcUcGjhvB3Epu1jAYzwBuWbWu/5RaEo7sAowZAR2Y1/3fD
	hjoB9lCdO32ZgCuy6YBIE9ZCCqvtVti1DkZEb2rjHy/7r+WDQEBkJm+/44z07gis
	TLifOg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468pevfmef-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 09:31:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53S9Vgsc031254
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 09:31:42 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 28 Apr 2025 02:31:36 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Mon, 28 Apr 2025 14:59:08 +0530
Subject: [PATCH v2 20/23] media: iris: Add platform capabilities for HEVC
 and VP9 decoders
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250428-qcom-iris-hevc-vp9-v2-20-3a6013ecb8a5@quicinc.com>
References: <20250428-qcom-iris-hevc-vp9-v2-0-3a6013ecb8a5@quicinc.com>
In-Reply-To: <20250428-qcom-iris-hevc-vp9-v2-0-3a6013ecb8a5@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Nicolas Dufresne
	<nicolas.dufresne@collabora.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        <20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org>,
        <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745832570; l=17355;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=qfqvVVTTp3B6JAn8R11vsnQxf2uewwrle1OsZNBBBI8=;
 b=9vhTUytaR0ukd1NmWBdU5CQ6+eDyCvVDd3MgmXEHkrtKxRFQpj7x1Ac28X2cji2NU0y/4Kqxv
 2+NcqNXkUB4BKojckGolKr0MLl+uJc32m+ctUEmX07ZDPdQXTQ+tKyB
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 9ARqrYD2vXe4RDwUnbzT6vH41LAyo1T_
X-Authority-Analysis: v=2.4 cv=aeBhnQot c=1 sm=1 tr=0 ts=680f4aff cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=rY3udxcY2z9nEhSwD0QA:9
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 9ARqrYD2vXe4RDwUnbzT6vH41LAyo1T_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA3OCBTYWx0ZWRfXyq0innU358lJ iCJnvi6LHMFTf4cNWQrW3ODuxfQ6kfsE9YiK5ZaOQi1MvmP8wIntQjYtlWQMZED22xWXi9oPUhq V7V1kb/AP2swEDTM6JV/loWX4c0dzkxaoHn/cBbFPnq/gw1//dHT1a0vEIfbkxSFwKXWkBASPlT
 6xPX6vct78eqDkRzIZxTeued8ETgYDQqgBUz7logiUzJ9Jp8s9eI28F2e3RuqYbgzfwsP3mcUIS F+EgjQUOjxcwI/jHg7bb5iaoW0ER2vM6HpaVEkxJkNcXFEatJY4UnP5/6cTmuy1ViZiW6antPuI AzZu2fhhHjCsJbDn4cX0Nwi1Y+Oiwbe4e/FLoVMOLuWv2Q1PZkEX5ginozBYhKT1Gu8LAqfQBAJ
 Hcz7FUsElfpxct9wgaa0eWW76aoDV2HVUWHbx2lfbf0ncs0EU+2fo3GvSXBmwunQSHypVSEp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280078

Add platform capabilities for HEVC and VP9 codecs in decoder driver
with related hooks.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      |  28 ++++-
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |  28 ++++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   1 +
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  34 +++++-
 .../platform/qcom/iris/iris_platform_common.h      |   8 +-
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  80 ++++++++++++-
 .../platform/qcom/iris/iris_platform_qcs8300.h     | 126 +++++++++++++++++----
 7 files changed, 266 insertions(+), 39 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 13f5cf0d0e8a..9136b723c0f2 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -18,9 +18,19 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
 {
 	switch (id) {
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
@@ -32,10 +42,20 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 		return 0;
 
 	switch (cap_id) {
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
index f23be2340658..8c91d336ff7e 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -295,7 +295,19 @@ static int iris_hfi_gen2_set_profile(struct iris_inst *inst)
 {
 	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
 	u32 port = iris_hfi_gen2_get_port(V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
-	u32 profile = inst->fw_caps[PROFILE].value;
+	u32 profile = 0;
+
+	switch (inst->codec) {
+	case V4L2_PIX_FMT_HEVC:
+		profile = inst->fw_caps[PROFILE_HEVC].value;
+		break;
+	case V4L2_PIX_FMT_VP9:
+		profile = inst->fw_caps[PROFILE_VP9].value;
+		break;
+	case V4L2_PIX_FMT_H264:
+		profile = inst->fw_caps[PROFILE_H264].value;
+		break;
+	}
 
 	inst_hfi_gen2->src_subcr_params.profile = profile;
 
@@ -312,7 +324,19 @@ static int iris_hfi_gen2_set_level(struct iris_inst *inst)
 {
 	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
 	u32 port = iris_hfi_gen2_get_port(V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
-	u32 level = inst->fw_caps[LEVEL].value;
+	u32 level = 0;
+
+	switch (inst->codec) {
+	case V4L2_PIX_FMT_HEVC:
+		level = inst->fw_caps[LEVEL_HEVC].value;
+		break;
+	case V4L2_PIX_FMT_VP9:
+		level = inst->fw_caps[LEVEL_VP9].value;
+		break;
+	case V4L2_PIX_FMT_H264:
+		level = inst->fw_caps[LEVEL_H264].value;
+		break;
+	}
 
 	inst_hfi_gen2->src_subcr_params.level = level;
 
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index 283d2f27e4c8..5f13dc11bea5 100644
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
index cba71b5db943..7913b8c93da7 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -573,8 +573,21 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
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
+		inst->fw_caps[PROFILE_H264].value = subsc_params.profile;
+		inst->fw_caps[LEVEL_H264].value = subsc_params.level;
+		break;
+	}
+
 	inst->fw_caps[POC].value = subsc_params.pic_order_cnt;
 
 	if (subsc_params.bit_depth != BIT_DEPTH_8 ||
@@ -798,8 +811,21 @@ static void iris_hfi_gen2_init_src_change_param(struct iris_inst *inst)
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
+		subsc_params->profile = inst->fw_caps[PROFILE_H264].value;
+		subsc_params->level = inst->fw_caps[LEVEL_H264].value;
+		break;
+	}
+
 	subsc_params->pic_order_cnt = inst->fw_caps[POC].value;
 	subsc_params->bit_depth = inst->fw_caps[BIT_DEPTH].value;
 	if (inst->fw_caps[CODED_FRAMES].value ==
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 3e0ae87526a0..71d23214f224 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -81,8 +81,12 @@ struct platform_inst_caps {
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
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index deb7037e8e86..c2cded2876b7 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -17,7 +17,7 @@
 
 static struct platform_inst_fw_cap inst_fw_cap_sm8550[] = {
 	{
-		.cap_id = PROFILE,
+		.cap_id = PROFILE_H264,
 		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
 		.max = V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH,
 		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
@@ -31,7 +31,29 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550[] = {
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
@@ -59,6 +81,60 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550[] = {
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
diff --git a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
index f82355d72fcf..a8d66ed388a3 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
@@ -5,48 +5,124 @@
 
 static struct platform_inst_fw_cap inst_fw_cap_qcs8300[] = {
 	{
-		.cap_id = PROFILE,
+		.cap_id = PROFILE_H264,
 		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
 		.max = V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH,
 		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
-			BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH) |
-			BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
-			BIT(V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
-			BIT(V4L2_MPEG_VIDEO_H264_PROFILE_HIGH),
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_HIGH) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH),
 		.value = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
 		.hfi_id = HFI_PROP_PROFILE,
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
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
-			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1B)  |
-			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_1) |
-			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_2) |
-			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_3) |
-			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_0) |
-			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_1) |
-			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_2) |
-			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_0) |
-			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_1) |
-			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_2) |
-			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_0) |
-			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_1) |
-			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_2) |
-			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_0) |
-			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_1) |
-			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_2) |
-			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_0) |
-			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_1) |
-			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_2),
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1B) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_1) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_2) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_3) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_0) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_1) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_2) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_0) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_1) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_2) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_0) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_1) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_2) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_0) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_1) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_2) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_0) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_1) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_2),
 		.value = V4L2_MPEG_VIDEO_H264_LEVEL_6_1,
 		.hfi_id = HFI_PROP_LEVEL,
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


