Return-Path: <linux-media+bounces-27591-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F3EA4FC92
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 11:46:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42DBA1892E43
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 10:45:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11F012116EE;
	Wed,  5 Mar 2025 10:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ClUji+h4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1BF20CCD2;
	Wed,  5 Mar 2025 10:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741171483; cv=none; b=hyKWhly1AiMv339KiRe//LnA4371AI8BUFkNdqSWznPS3/38HZ+lyk+3b3tWVqv1aT9w2DD0btcm2tnIfdSqVDfyGxElHjILfV6hx3rwv0Y9zWKLSiJADjmmyuC/enXRh8kNajZCxBU3mM2fE2TGnZN3xmVoyp2Up3OhTBR3QC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741171483; c=relaxed/simple;
	bh=GRBMdk8VU8eAUxStKlKWmVLGBj6B3wvvEX68WqKNazc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rOmOPKsMolg4Kryjj4meAbCR828cy8H28NED3OaarM0lkKn28f4gyGlwCumsRWJ7z61wHWQzvOi+IRQKIfH9XnMOqjBsvyO3L3gB7MBvXxnoQ5SDWEYQMj91VXmel5tTA4X5lLTY+KvyKjzKs4421uXbKC9K1KQaGxr0sA48cEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ClUji+h4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524N9i50023734;
	Wed, 5 Mar 2025 10:44:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6xOVOTNAOp6pQMSHa68+41sJazlMSqlP9aiVK27x8wQ=; b=ClUji+h4PyJUjijk
	UYf+RgtZWVlA+Tf66uUpBonLSUm29g9a2dpY+5EUFTbHlFnZf8DVnVYCM7Q+Lsuc
	J+5zJqcM8pOYI+NsxUhDzJ12yJ0pO5TOOAKrxTLd0GGa3daMr12GVedLtZkkkRkX
	FU3KwP2qwzBVouwhdXqcXSVfQ/QCKCgF9rDLsDHcMtPVXqJlrN5c7RiengHRl6jT
	ZOodImgwxW3eyyS2aWZ+nqZPV+2nRdMMnZGtB3yEgCRM1AqGjbM2+Q6WuS1CHBQR
	qS70lsCQNoTkMSpmDQxP7BrT1wt0CIAmRzgBdgqAs0H7o+ODRTdoBxYOt9xo/hhb
	/QWazg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6t535q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 10:44:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 525AiZS2032453
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Mar 2025 10:44:35 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 5 Mar 2025 02:44:32 -0800
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
To: <quic_vgarodia@quicinc.com>, <quic_abhinavk@quicinc.com>,
        <mchehab@kernel.org>, <quic_dikshita@quicinc.com>
CC: <hverkuil@xs4all.nl>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH 03/12] media: iris: Set mandatory properties for HEVC and VP9 decoders.
Date: Wed, 5 Mar 2025 16:13:26 +0530
Message-ID: <20250305104335.3629945-4-quic_dikshita@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=I/ufRMgg c=1 sm=1 tr=0 ts=67c82b14 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=xPhro1Vj0uW3zemhS0AA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: jpb5RyGJ_V0HDneS9-IzfSeiOse8S-p9
X-Proofpoint-ORIG-GUID: jpb5RyGJ_V0HDneS9-IzfSeiOse8S-p9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_04,2025-03-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503050086

Subscribe and set mandatory properties to the firmware for HEVC and VP9
decoders.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 .../platform/qcom/iris/iris_hfi_common.h      |  1 +
 .../qcom/iris/iris_hfi_gen1_command.c         |  4 +-
 .../qcom/iris/iris_hfi_gen2_command.c         | 83 +++++++++++++++++--
 .../qcom/iris/iris_hfi_gen2_response.c        |  7 ++
 .../platform/qcom/iris/iris_platform_common.h | 16 +++-
 .../platform/qcom/iris/iris_platform_sm8250.c |  4 +-
 .../platform/qcom/iris/iris_platform_sm8550.c | 61 ++++++++++++--
 7 files changed, 151 insertions(+), 25 deletions(-)

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
index 1e774b058ab9..a160ae915886 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -784,8 +784,8 @@ static int iris_hfi_gen1_session_set_config_params(struct iris_inst *inst, u32 p
 			iris_hfi_gen1_set_bufsize},
 	};
 
-	config_params = core->iris_platform_data->input_config_params;
-	config_params_size = core->iris_platform_data->input_config_params_size;
+	config_params = core->iris_platform_data->input_config_params_default;
+	config_params_size = core->iris_platform_data->input_config_params_default_size;
 
 	if (V4L2_TYPE_IS_OUTPUT(plane)) {
 		for (i = 0; i < config_params_size; i++) {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index a3ebcda9a2ba..5b4c89184297 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -192,7 +192,7 @@ static int iris_hfi_gen2_set_crop_offsets(struct iris_inst *inst)
 						  sizeof(u64));
 }
 
-static int iris_hfi_gen2_set_bit_dpeth(struct iris_inst *inst)
+static int iris_hfi_gen2_set_bit_depth(struct iris_inst *inst)
 {
 	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
 	u32 port = iris_hfi_gen2_get_port(V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
@@ -407,6 +407,23 @@ static int iris_hfi_gen2_set_linear_stride_scanline(struct iris_inst *inst)
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
@@ -418,7 +435,7 @@ static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 p
 		{HFI_PROP_BITSTREAM_RESOLUTION,       iris_hfi_gen2_set_bitstream_resolution   },
 		{HFI_PROP_CROP_OFFSETS,               iris_hfi_gen2_set_crop_offsets           },
 		{HFI_PROP_CODED_FRAMES,               iris_hfi_gen2_set_coded_frames           },
-		{HFI_PROP_LUMA_CHROMA_BIT_DEPTH,      iris_hfi_gen2_set_bit_dpeth              },
+		{HFI_PROP_LUMA_CHROMA_BIT_DEPTH,      iris_hfi_gen2_set_bit_depth              },
 		{HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT, iris_hfi_gen2_set_min_output_count       },
 		{HFI_PROP_PIC_ORDER_CNT_TYPE,         iris_hfi_gen2_set_picture_order_count    },
 		{HFI_PROP_SIGNAL_COLOR_INFO,          iris_hfi_gen2_set_colorspace             },
@@ -426,11 +443,25 @@ static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 p
 		{HFI_PROP_LEVEL,                      iris_hfi_gen2_set_level                  },
 		{HFI_PROP_COLOR_FORMAT,               iris_hfi_gen2_set_colorformat            },
 		{HFI_PROP_LINEAR_STRIDE_SCANLINE,     iris_hfi_gen2_set_linear_stride_scanline },
+		{HFI_PROP_TIER,                       iris_hfi_gen2_set_tier                   },
 	};
 
 	if (V4L2_TYPE_IS_OUTPUT(plane)) {
-		config_params = core->iris_platform_data->input_config_params;
-		config_params_size = core->iris_platform_data->input_config_params_size;
+		if (inst->codec == V4L2_PIX_FMT_H264) {
+			config_params = core->iris_platform_data->input_config_params_default;
+			config_params_size =
+				core->iris_platform_data->input_config_params_default_size;
+		} else if (inst->codec == V4L2_PIX_FMT_HEVC) {
+			config_params = core->iris_platform_data->input_config_params_hevc;
+			config_params_size =
+				core->iris_platform_data->input_config_params_hevc_size;
+		} else if (inst->codec == V4L2_PIX_FMT_VP9) {
+			config_params = core->iris_platform_data->input_config_params_vp9;
+			config_params_size =
+				core->iris_platform_data->input_config_params_vp9_size;
+		} else {
+			return -EINVAL;
+		}
 	} else {
 		config_params = core->iris_platform_data->output_config_params;
 		config_params_size = core->iris_platform_data->output_config_params_size;
@@ -600,8 +631,21 @@ static int iris_hfi_gen2_subscribe_change_param(struct iris_inst *inst, u32 plan
 		return 0;
 	}
 
-	change_param = core->iris_platform_data->input_config_params;
-	change_param_size = core->iris_platform_data->input_config_params_size;
+	if (inst->codec == V4L2_PIX_FMT_H264) {
+		change_param = core->iris_platform_data->input_config_params_default;
+		change_param_size =
+			core->iris_platform_data->input_config_params_default_size;
+	} else if (inst->codec == V4L2_PIX_FMT_HEVC) {
+		change_param = core->iris_platform_data->input_config_params_hevc;
+		change_param_size =
+			core->iris_platform_data->input_config_params_hevc_size;
+	} else if (inst->codec == V4L2_PIX_FMT_VP9) {
+		change_param = core->iris_platform_data->input_config_params_vp9;
+		change_param_size =
+			core->iris_platform_data->input_config_params_vp9_size;
+	} else {
+		return -EINVAL;
+	}
 
 	payload[0] = HFI_MODE_PORT_SETTINGS_CHANGE;
 
@@ -648,6 +692,11 @@ static int iris_hfi_gen2_subscribe_change_param(struct iris_inst *inst, u32 plan
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
@@ -673,6 +722,11 @@ static int iris_hfi_gen2_subscribe_change_param(struct iris_inst *inst, u32 plan
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
@@ -709,8 +763,21 @@ static int iris_hfi_gen2_subscribe_property(struct iris_inst *inst, u32 plane)
 		subscribe_prop_size = core->iris_platform_data->dec_input_prop_size;
 		subcribe_prop = core->iris_platform_data->dec_input_prop;
 	} else {
-		subscribe_prop_size = core->iris_platform_data->dec_output_prop_size;
-		subcribe_prop = core->iris_platform_data->dec_output_prop;
+		if (inst->codec == V4L2_PIX_FMT_H264) {
+			subcribe_prop = core->iris_platform_data->dec_output_prop_avc;
+			subscribe_prop_size =
+				core->iris_platform_data->dec_output_prop_avc_size;
+		} else if (inst->codec == V4L2_PIX_FMT_HEVC) {
+			subcribe_prop = core->iris_platform_data->dec_output_prop_hevc;
+			subscribe_prop_size =
+				core->iris_platform_data->dec_output_prop_hevc_size;
+		} else if (inst->codec == V4L2_PIX_FMT_VP9) {
+			subcribe_prop = core->iris_platform_data->dec_output_prop_vp9;
+			subscribe_prop_size =
+				core->iris_platform_data->dec_output_prop_vp9_size;
+		} else {
+			return -EINVAL;
+		}
 	}
 
 	for (i = 0; i < subscribe_prop_size; i++)
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index 809bf0f238bd..6846311a26c3 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -580,6 +580,7 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
 	}
 
 	inst->fw_caps[POC].value = subsc_params.pic_order_cnt;
+	inst->fw_caps[TIER].value = subsc_params.tier;
 
 	if (subsc_params.bit_depth != BIT_DEPTH_8 ||
 	    !(subsc_params.coded_frames & HFI_BITMASK_FRAME_MBS_ONLY_FLAG)) {
@@ -664,6 +665,9 @@ static int iris_hfi_gen2_handle_session_property(struct iris_inst *inst,
 		inst_hfi_gen2->src_subcr_params.crop_offsets[0] = pkt->payload[0];
 		inst_hfi_gen2->src_subcr_params.crop_offsets[1] = pkt->payload[1];
 		break;
+	case HFI_PROP_LUMA_CHROMA_BIT_DEPTH:
+		inst_hfi_gen2->src_subcr_params.bit_depth = pkt->payload[0];
+		break;
 	case HFI_PROP_CODED_FRAMES:
 		inst_hfi_gen2->src_subcr_params.coded_frames = pkt->payload[0];
 		break;
@@ -682,6 +686,9 @@ static int iris_hfi_gen2_handle_session_property(struct iris_inst *inst,
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
index 67204cddd44a..433ce9b00c68 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -174,14 +174,22 @@ struct iris_platform_data {
 	u32 num_vpp_pipe;
 	u32 max_session_count;
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
index 5c86fd7b7b6f..5f74e57f04fc 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
@@ -137,9 +137,9 @@ struct iris_platform_data sm8250_data = {
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
 	.max_core_mbpf = (8192 * 4352) / 256,
-	.input_config_params =
+	.input_config_params_default =
 		sm8250_vdec_input_config_param_default,
-	.input_config_params_size =
+	.input_config_params_default_size =
 		ARRAY_SIZE(sm8250_vdec_input_config_param_default),
 
 	.dec_ip_int_buf_tbl = sm8250_dec_ip_int_buf_tbl,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
index 29bc50785da5..779c71885f51 100644
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
 	.max_core_mbpf = ((8192 * 4352) / 256) * 2,
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


