Return-Path: <linux-media+bounces-29654-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6D7A8115D
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 18:07:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27C01887504
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 16:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7A0B232363;
	Tue,  8 Apr 2025 15:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lS6QX/dW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4740923E356;
	Tue,  8 Apr 2025 15:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744127781; cv=none; b=g5NcdFrGBJUU2eWTQux4A7uHuXJQ3kfRDc+LVshV+bX6T5Dltq4mxL9pUzMnuiuOxGwIYh9PL2mqyQj8LrI6Cpkb1Zb86hfmGu9E/cgA5Am5BXV40lDsEVgJmTZOayHrTi72l26GH5adUgmBge+lXQm48xsjl+LbsRsm27A6l28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744127781; c=relaxed/simple;
	bh=AmlJQti7C9eFGxogyein4oCdXIwbo2NvSof3HQImt2k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=jrkxEAFUvnqot5+80QThPWYHZTBDiuLMF1VEWyvISFvFMXORxV83BvTGWNd8m+2yPyuEvAnZVuBLB8SR+VGxjiLKl89auZZ7LOBbbiejgb4pKam4dErv+dSZFsfGKHqSBttDKxXH2aa37Ovv2ja/utr4a61b/pXyBii75kqDKtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lS6QX/dW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538Axoka027665;
	Tue, 8 Apr 2025 15:56:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tcIHgxAL1jRZJETN1ujrFvtF3m9kRMGFl4Vhb/eXZqk=; b=lS6QX/dWLr3AeMi+
	PLOIO6McJK8AUzk9t9VVjRzXIVHSrWbNz7xrpmn0J0nbXqhLWYtDQV08NNi6ADj+
	kPyLmVAAedyZ1Elvj4ljky+/BXaZkgCauxHoxnXQR+K+COeHLSugyxtIy3Zui1dQ
	EEaBq9SinHbPKOS6PTrPpqf4p6U5HienwEz5FWEoiqTjf6++i0nY7VhTMtxGCHmq
	uu1WPH9EOzkLCtrxokBPfPmOE+ok8SKbwM5odnTj2gXIP5O0Gwq2TSxOjUaXGHXN
	fd232R/s8el4jtcgb/6qru40/ISC5/SuZAhVOIdJ2fxOLERz8nIpKbV6J+26L/NH
	ciAB/A==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd00bbd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Apr 2025 15:56:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 538FuERU018781
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Apr 2025 15:56:14 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 8 Apr 2025 08:56:09 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Tue, 8 Apr 2025 21:24:32 +0530
Subject: [PATCH 18/20] media: iris: Set mandatory properties for HEVC and
 VP9 decoders.
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250408-iris-dec-hevc-vp9-v1-18-acd258778bd6@quicinc.com>
References: <20250408-iris-dec-hevc-vp9-v1-0-acd258778bd6@quicinc.com>
In-Reply-To: <20250408-iris-dec-hevc-vp9-v1-0-acd258778bd6@quicinc.com>
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
	<dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Dikshita
 Agarwal" <quic_dikshita@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744127674; l=15964;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=AmlJQti7C9eFGxogyein4oCdXIwbo2NvSof3HQImt2k=;
 b=shpOAKjczJgeC2WiBN89HYVOxs1XrllZ8JXr7wwjeEC/DQdGazMV573eSc+CaNHMoGIROAQMM
 b1u0I4LQCwlCmsZWTMYXXcc8qKFN5Dd6TaLs2Yp5pUD8ONc/oVzRH32
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: fZCPahAstvsh0haYYeV8J4HTfj7AJYOT
X-Authority-Analysis: v=2.4 cv=Q4vS452a c=1 sm=1 tr=0 ts=67f5471f cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=xPhro1Vj0uW3zemhS0AA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: fZCPahAstvsh0haYYeV8J4HTfj7AJYOT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_06,2025-04-08_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080110

Subscribe and set mandatory properties to the firmware for HEVC and VP9
decoders.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_common.h |  1 +
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  4 +-
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 97 +++++++++++++++++++---
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  7 ++
 .../platform/qcom/iris/iris_platform_common.h      | 16 +++-
 .../platform/qcom/iris/iris_platform_sm8250.c      |  4 +-
 .../platform/qcom/iris/iris_platform_sm8550.c      | 61 ++++++++++++--
 7 files changed, 161 insertions(+), 29 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
index b2c541367fc6..9e6aadb83783 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
@@ -140,6 +140,7 @@ struct hfi_subscription_params {
 	u32	color_info;
 	u32	profile;
 	u32	level;
+	u32	tier;
 };
 
 u32 iris_hfi_get_v4l2_color_primaries(u32 hfi_primaries);
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 8b7c7822a4d4..b98f781b4f48 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -774,8 +774,8 @@ static int iris_hfi_gen1_session_set_config_params(struct iris_inst *inst, u32 p
 			iris_hfi_gen1_set_bufsize},
 	};
 
-	config_params = core->iris_platform_data->input_config_params;
-	config_params_size = core->iris_platform_data->input_config_params_size;
+	config_params = core->iris_platform_data->input_config_params_default;
+	config_params_size = core->iris_platform_data->input_config_params_default_size;
 
 	if (V4L2_TYPE_IS_OUTPUT(plane)) {
 		for (i = 0; i < config_params_size; i++) {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 8c91d336ff7e..7ca5ae13d62b 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -391,11 +391,28 @@ static int iris_hfi_gen2_set_linear_stride_scanline(struct iris_inst *inst)
 						  sizeof(u64));
 }
 
+static int iris_hfi_gen2_set_tier(struct iris_inst *inst)
+{
+	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
+	u32 port = iris_hfi_gen2_get_port(V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+	u32 tier = inst->fw_caps[TIER].value;
+
+	inst_hfi_gen2->src_subcr_params.tier = tier;
+
+	return iris_hfi_gen2_session_set_property(inst,
+						  HFI_PROP_TIER,
+						  HFI_HOST_FLAGS_NONE,
+						  port,
+						  HFI_PAYLOAD_U32_ENUM,
+						  &tier,
+						  sizeof(u32));
+}
+
 static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 plane)
 {
 	struct iris_core *core = inst->core;
-	u32 config_params_size, i, j;
-	const u32 *config_params;
+	u32 config_params_size = 0, i, j;
+	const u32 *config_params = NULL;
 	int ret;
 
 	static const struct iris_hfi_prop_type_handle prop_type_handle_arr[] = {
@@ -410,11 +427,27 @@ static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 p
 		{HFI_PROP_LEVEL,                      iris_hfi_gen2_set_level                  },
 		{HFI_PROP_COLOR_FORMAT,               iris_hfi_gen2_set_colorformat            },
 		{HFI_PROP_LINEAR_STRIDE_SCANLINE,     iris_hfi_gen2_set_linear_stride_scanline },
+		{HFI_PROP_TIER,                       iris_hfi_gen2_set_tier                   },
 	};
 
 	if (V4L2_TYPE_IS_OUTPUT(plane)) {
-		config_params = core->iris_platform_data->input_config_params;
-		config_params_size = core->iris_platform_data->input_config_params_size;
+		switch (inst->codec) {
+		case V4L2_PIX_FMT_H264:
+			config_params = core->iris_platform_data->input_config_params_default;
+			config_params_size =
+				core->iris_platform_data->input_config_params_default_size;
+			break;
+		case V4L2_PIX_FMT_HEVC:
+			config_params = core->iris_platform_data->input_config_params_hevc;
+			config_params_size =
+				core->iris_platform_data->input_config_params_hevc_size;
+			break;
+		case V4L2_PIX_FMT_VP9:
+			config_params = core->iris_platform_data->input_config_params_vp9;
+			config_params_size =
+				core->iris_platform_data->input_config_params_vp9_size;
+			break;
+		}
 	} else {
 		config_params = core->iris_platform_data->output_config_params;
 		config_params_size = core->iris_platform_data->output_config_params_size;
@@ -584,8 +617,8 @@ static int iris_hfi_gen2_subscribe_change_param(struct iris_inst *inst, u32 plan
 	struct hfi_subscription_params subsc_params;
 	u32 prop_type, payload_size, payload_type;
 	struct iris_core *core = inst->core;
-	const u32 *change_param;
-	u32 change_param_size;
+	const u32 *change_param = NULL;
+	u32 change_param_size = 0;
 	u32 payload[32] = {0};
 	u32 hfi_port = 0, i;
 	int ret;
@@ -596,8 +629,23 @@ static int iris_hfi_gen2_subscribe_change_param(struct iris_inst *inst, u32 plan
 		return 0;
 	}
 
-	change_param = core->iris_platform_data->input_config_params;
-	change_param_size = core->iris_platform_data->input_config_params_size;
+	switch (inst->codec) {
+	case V4L2_PIX_FMT_H264:
+		change_param = core->iris_platform_data->input_config_params_default;
+		change_param_size =
+			core->iris_platform_data->input_config_params_default_size;
+		break;
+	case V4L2_PIX_FMT_HEVC:
+		change_param = core->iris_platform_data->input_config_params_hevc;
+		change_param_size =
+			core->iris_platform_data->input_config_params_hevc_size;
+		break;
+	case V4L2_PIX_FMT_VP9:
+		change_param = core->iris_platform_data->input_config_params_vp9;
+		change_param_size =
+			core->iris_platform_data->input_config_params_vp9_size;
+		break;
+	}
 
 	payload[0] = HFI_MODE_PORT_SETTINGS_CHANGE;
 
@@ -644,6 +692,11 @@ static int iris_hfi_gen2_subscribe_change_param(struct iris_inst *inst, u32 plan
 				payload_size = sizeof(u32);
 				payload_type = HFI_PAYLOAD_U32;
 				break;
+			case HFI_PROP_LUMA_CHROMA_BIT_DEPTH:
+				payload[0] = subsc_params.bit_depth;
+				payload_size = sizeof(u32);
+				payload_type = HFI_PAYLOAD_U32;
+				break;
 			case HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT:
 				payload[0] = subsc_params.fw_min_count;
 				payload_size = sizeof(u32);
@@ -669,6 +722,11 @@ static int iris_hfi_gen2_subscribe_change_param(struct iris_inst *inst, u32 plan
 				payload_size = sizeof(u32);
 				payload_type = HFI_PAYLOAD_U32;
 				break;
+			case HFI_PROP_TIER:
+				payload[0] = subsc_params.tier;
+				payload_size = sizeof(u32);
+				payload_type = HFI_PAYLOAD_U32;
+				break;
 			default:
 				prop_type = 0;
 				ret = -EINVAL;
@@ -695,8 +753,8 @@ static int iris_hfi_gen2_subscribe_change_param(struct iris_inst *inst, u32 plan
 static int iris_hfi_gen2_subscribe_property(struct iris_inst *inst, u32 plane)
 {
 	struct iris_core *core = inst->core;
-	u32 subscribe_prop_size, i;
-	const u32 *subcribe_prop;
+	u32 subscribe_prop_size = 0, i;
+	const u32 *subcribe_prop = NULL;
 	u32 payload[32] = {0};
 
 	payload[0] = HFI_MODE_PROPERTY;
@@ -705,8 +763,23 @@ static int iris_hfi_gen2_subscribe_property(struct iris_inst *inst, u32 plane)
 		subscribe_prop_size = core->iris_platform_data->dec_input_prop_size;
 		subcribe_prop = core->iris_platform_data->dec_input_prop;
 	} else {
-		subscribe_prop_size = core->iris_platform_data->dec_output_prop_size;
-		subcribe_prop = core->iris_platform_data->dec_output_prop;
+		switch (inst->codec) {
+		case V4L2_PIX_FMT_H264:
+			subcribe_prop = core->iris_platform_data->dec_output_prop_avc;
+			subscribe_prop_size =
+				core->iris_platform_data->dec_output_prop_avc_size;
+			break;
+		case V4L2_PIX_FMT_HEVC:
+			subcribe_prop = core->iris_platform_data->dec_output_prop_hevc;
+			subscribe_prop_size =
+				core->iris_platform_data->dec_output_prop_hevc_size;
+			break;
+		case V4L2_PIX_FMT_VP9:
+			subcribe_prop = core->iris_platform_data->dec_output_prop_vp9;
+			subscribe_prop_size =
+				core->iris_platform_data->dec_output_prop_vp9_size;
+			break;
+		}
 	}
 
 	for (i = 0; i < subscribe_prop_size; i++)
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index 1b8787c0f6a7..221f84d98a48 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -588,6 +588,7 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
 	}
 
 	inst->fw_caps[POC].value = subsc_params.pic_order_cnt;
+	inst->fw_caps[TIER].value = subsc_params.tier;
 
 	if (subsc_params.bit_depth != BIT_DEPTH_8 ||
 	    !(subsc_params.coded_frames & HFI_BITMASK_FRAME_MBS_ONLY_FLAG)) {
@@ -669,6 +670,9 @@ static int iris_hfi_gen2_handle_session_property(struct iris_inst *inst,
 		inst_hfi_gen2->src_subcr_params.crop_offsets[0] = pkt->payload[0];
 		inst_hfi_gen2->src_subcr_params.crop_offsets[1] = pkt->payload[1];
 		break;
+	case HFI_PROP_LUMA_CHROMA_BIT_DEPTH:
+		inst_hfi_gen2->src_subcr_params.bit_depth = pkt->payload[0];
+		break;
 	case HFI_PROP_CODED_FRAMES:
 		inst_hfi_gen2->src_subcr_params.coded_frames = pkt->payload[0];
 		break;
@@ -687,6 +691,9 @@ static int iris_hfi_gen2_handle_session_property(struct iris_inst *inst,
 	case HFI_PROP_LEVEL:
 		inst_hfi_gen2->src_subcr_params.level = pkt->payload[0];
 		break;
+	case HFI_PROP_TIER:
+		inst_hfi_gen2->src_subcr_params.tier = pkt->payload[0];
+		break;
 	case HFI_PROP_PICTURE_TYPE:
 		inst_hfi_gen2->hfi_frame_info.picture_type = pkt->payload[0];
 		break;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 45507929efa4..a7f9eb1d269a 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -175,14 +175,22 @@ struct iris_platform_data {
 	u32 max_session_count;
 	/* max number of macroblocks per frame supported */
 	u32 max_core_mbpf;
-	const u32 *input_config_params;
-	unsigned int input_config_params_size;
+	const u32 *input_config_params_default;
+	unsigned int input_config_params_default_size;
+	const u32 *input_config_params_hevc;
+	unsigned int input_config_params_hevc_size;
+	const u32 *input_config_params_vp9;
+	unsigned int input_config_params_vp9_size;
 	const u32 *output_config_params;
 	unsigned int output_config_params_size;
 	const u32 *dec_input_prop;
 	unsigned int dec_input_prop_size;
-	const u32 *dec_output_prop;
-	unsigned int dec_output_prop_size;
+	const u32 *dec_output_prop_avc;
+	unsigned int dec_output_prop_avc_size;
+	const u32 *dec_output_prop_hevc;
+	unsigned int dec_output_prop_hevc_size;
+	const u32 *dec_output_prop_vp9;
+	unsigned int dec_output_prop_vp9_size;
 	const u32 *dec_ip_int_buf_tbl;
 	unsigned int dec_ip_int_buf_tbl_size;
 	const u32 *dec_op_int_buf_tbl;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
index 8183e4e95fa4..8d0816a67ae0 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
@@ -128,9 +128,9 @@ struct iris_platform_data sm8250_data = {
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K,
-	.input_config_params =
+	.input_config_params_default =
 		sm8250_vdec_input_config_param_default,
-	.input_config_params_size =
+	.input_config_params_default_size =
 		ARRAY_SIZE(sm8250_vdec_input_config_param_default),
 
 	.dec_ip_int_buf_tbl = sm8250_dec_ip_int_buf_tbl,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
index 6f0688377dc6..7260becdb102 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
@@ -254,9 +254,10 @@ static struct tz_cp_config tz_cp_config_sm8550 = {
 	.cp_nonpixel_size = 0x24800000,
 };
 
-static const u32 sm8550_vdec_input_config_params[] = {
+static const u32 sm8550_vdec_input_config_params_default[] = {
 	HFI_PROP_BITSTREAM_RESOLUTION,
 	HFI_PROP_CROP_OFFSETS,
+	HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
 	HFI_PROP_CODED_FRAMES,
 	HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT,
 	HFI_PROP_PIC_ORDER_CNT_TYPE,
@@ -265,6 +266,26 @@ static const u32 sm8550_vdec_input_config_params[] = {
 	HFI_PROP_SIGNAL_COLOR_INFO,
 };
 
+static const u32 sm8550_vdec_input_config_param_hevc[] = {
+	HFI_PROP_BITSTREAM_RESOLUTION,
+	HFI_PROP_CROP_OFFSETS,
+	HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
+	HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT,
+	HFI_PROP_PROFILE,
+	HFI_PROP_LEVEL,
+	HFI_PROP_TIER,
+	HFI_PROP_SIGNAL_COLOR_INFO,
+};
+
+static const u32 sm8550_vdec_input_config_param_vp9[] = {
+	HFI_PROP_BITSTREAM_RESOLUTION,
+	HFI_PROP_CROP_OFFSETS,
+	HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
+	HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT,
+	HFI_PROP_PROFILE,
+	HFI_PROP_LEVEL,
+};
+
 static const u32 sm8550_vdec_output_config_params[] = {
 	HFI_PROP_COLOR_FORMAT,
 	HFI_PROP_LINEAR_STRIDE_SCANLINE,
@@ -274,11 +295,19 @@ static const u32 sm8550_vdec_subscribe_input_properties[] = {
 	HFI_PROP_NO_OUTPUT,
 };
 
-static const u32 sm8550_vdec_subscribe_output_properties[] = {
+static const u32 sm8550_vdec_subscribe_output_properties_avc[] = {
 	HFI_PROP_PICTURE_TYPE,
 	HFI_PROP_CABAC_SESSION,
 };
 
+static const u32 sm8550_vdec_subscribe_output_properties_hevc[] = {
+	HFI_PROP_PICTURE_TYPE,
+};
+
+static const u32 sm8550_vdec_subscribe_output_properties_vp9[] = {
+	HFI_PROP_PICTURE_TYPE,
+};
+
 static const u32 sm8550_dec_ip_int_buf_tbl[] = {
 	BUF_BIN,
 	BUF_COMV,
@@ -322,19 +351,33 @@ struct iris_platform_data sm8550_data = {
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
-	.input_config_params =
-		sm8550_vdec_input_config_params,
-	.input_config_params_size =
-		ARRAY_SIZE(sm8550_vdec_input_config_params),
+	.input_config_params_default =
+		sm8550_vdec_input_config_params_default,
+	.input_config_params_default_size =
+		ARRAY_SIZE(sm8550_vdec_input_config_params_default),
+	.input_config_params_hevc =
+		sm8550_vdec_input_config_param_hevc,
+	.input_config_params_hevc_size =
+		ARRAY_SIZE(sm8550_vdec_input_config_param_hevc),
+	.input_config_params_vp9 =
+		sm8550_vdec_input_config_param_vp9,
+	.input_config_params_vp9_size =
+		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
 	.output_config_params =
 		sm8550_vdec_output_config_params,
 	.output_config_params_size =
 		ARRAY_SIZE(sm8550_vdec_output_config_params),
 	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
 	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
-	.dec_output_prop = sm8550_vdec_subscribe_output_properties,
-	.dec_output_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_output_properties),
-
+	.dec_output_prop_avc = sm8550_vdec_subscribe_output_properties_avc,
+	.dec_output_prop_avc_size =
+		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_avc),
+	.dec_output_prop_hevc = sm8550_vdec_subscribe_output_properties_hevc,
+	.dec_output_prop_hevc_size =
+		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_hevc),
+	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
+	.dec_output_prop_vp9_size =
+		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
 	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
 	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
 	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,

-- 
2.34.1


