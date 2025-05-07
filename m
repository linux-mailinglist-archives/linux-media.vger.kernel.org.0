Return-Path: <linux-media+bounces-31918-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 83934AAD8C3
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 09:47:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3ABF189017D
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 07:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4241E22D78D;
	Wed,  7 May 2025 07:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Fl11tZPr"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E94D22CBFA;
	Wed,  7 May 2025 07:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746603727; cv=none; b=rZ3HQSjsFsSIuraO5DFxeqKKn5YYubftyEFz3I2FSGP6E90IQujrapwiRfQOEVqklMgMsufvbn7CEfYuwRDIE0I6st256FDqh34BcSPLYoCx8DDMp50cLZrNV4KLzZPXBkLeyCiecO7aptBDXMUHTqt7fs20xqRCIZfRoUvw/Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746603727; c=relaxed/simple;
	bh=gyghgr9ryJJV47s15wqH0OQtPFOYBuElpGSsMfS/+tA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=eh4zpBvAgazwXKCOUKXMOuKVkn1eQhhKJjZJDMO5Epm0yuuO2qVq5jA6jZkKWZhENFb2tar0rMS9rfS98pPKGeT+nSU36RGNjqKARMJm1Ql8poLF+lOslWWa/gmrP/h0XpnmdnYh9BCuicyqzpteLgQjWXufahaKKvpuvL7qjQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Fl11tZPr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5471H3Zd018366;
	Wed, 7 May 2025 07:42:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sUN3teO8p+7CgTWasviT3+cqUUNSpj9awWDykXZBrFE=; b=Fl11tZPr4oYQujaQ
	erotQ9dx16bsvJcEjzZU+tli7J3bksCxQLXC1CVe6RRdGUQjnraFYAt6D3n8XFJb
	6AwEbvuxqeoYAWaEXz1TL7MTWDKukvjMl7+SXbeZZ1l2K5l2bDEqHypCg9/t6f3z
	cW7JDdwiw+M/bCi1N6Q0Hzw4C3gGoFlyELAYsm6tdaej+uVKE38pwRdhe/69EywD
	54DL0LX/CH3PgoIQ6hp8llIM/sykdf6NQ48RYXfTt+OJXeO8kLYsRooTS3lZ8XgV
	uBVABDGZhfYIJGbCsEgSBFMCUImY6wTe2sSLR4SmHQ18wnDnCUCyA1pDsM6Y/Aw3
	PRgNTg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5tbcu0u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 07:42:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5477fxe8001557
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 May 2025 07:41:59 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 7 May 2025 00:41:55 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 7 May 2025 13:09:54 +0530
Subject: [PATCH v4 23/25] media: iris: Set mandatory properties for HEVC
 and VP9 decoders.
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250507-video-iris-hevc-vp9-v4-23-58db3660ac61@quicinc.com>
References: <20250507-video-iris-hevc-vp9-v4-0-58db3660ac61@quicinc.com>
In-Reply-To: <20250507-video-iris-hevc-vp9-v4-0-58db3660ac61@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>,
        Stefan Schmidt <stefan.schmidt@linaro.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Nicolas Dufresne
	<nicolas.dufresne@collabora.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746603611; l=20037;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=gyghgr9ryJJV47s15wqH0OQtPFOYBuElpGSsMfS/+tA=;
 b=teRyciYC1tsOevSSezCyb38RUrfnckfwhDmxrQ4cIy7Ogtg2PjD9SjC26WrJ1y3ucL7Ifa+ha
 tcykcmM0q7lC6WIjNTNTR5tBPyhSHfaIGum0aGzRZtd8dAmepDaxXTq
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ZxXfswemUW3DI3zDP_QdC_8F1RtZEr13
X-Proofpoint-GUID: ZxXfswemUW3DI3zDP_QdC_8F1RtZEr13
X-Authority-Analysis: v=2.4 cv=doXbC0g4 c=1 sm=1 tr=0 ts=681b0ec8 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=ADYTvRe0etx8i7wtblAA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDA3MCBTYWx0ZWRfX8NUX+ttD61wi
 49GM6oAo4kPkFeN323Swepj/6qICPP+fN2U0b2pIk2lmb2OxKPVUeEoDWREOGad1dmPTwODbOCM
 +lpwuTUHQld1mGF+XwX93U0WIV5sF9GoYgCvFZNVASvjQC1I4XoP6KMYQ7YNy7XqJD2V1vZ8ICR
 m6s8PdmBPdFpO/vubMyp8dwWxhMNpsOVqYDAk7xv1d2Ha559UrAZqMf6FlzyV+eYawk6M39qXil
 lpNbHY+wswHYjG1j4+DbRkuztXus6jI2trFG+UxHR1M4RuCG1LpAMJ+8JsxKBTJFh5+hzqc5euT
 ftp/UMknK4Oy4VbhQZBK5HymIrSzGNHzu4P/UuRuwSpYdH1TcDcCQcotzk8lFPElZxbHfnt59nt
 iRsO3sH8/98eVrRq74IKACQvxsU06ss+WDdzlsGZRwU82cOpGWY10AgK4Khcd7rq9z+hlTyw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_02,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 mlxlogscore=999 impostorscore=0 clxscore=1015 mlxscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505070070

Subscribe and set mandatory properties to the firmware for HEVC and VP9
decoders.

Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_common.h |   1 +
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |   4 +-
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |  97 +++++++++++++++---
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |   7 ++
 .../platform/qcom/iris/iris_platform_common.h      |  16 ++-
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 114 +++++++++++++++++----
 .../platform/qcom/iris/iris_platform_sm8250.c      |   4 +-
 7 files changed, 203 insertions(+), 40 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
index b2c541367fc6170ee06141c3de27d288a8b388ee..9e6aadb837830b46e4a68865583e28fc427cef0d 100644
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
index dbb1b1dab09701ec614088d495f43640ecdb9f99..2e3f5a6b2ff11f273aecc4bae28399c260229af0 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -776,8 +776,8 @@ static int iris_hfi_gen1_session_set_config_params(struct iris_inst *inst, u32 p
 			iris_hfi_gen1_set_bufsize},
 	};
 
-	config_params = core->iris_platform_data->input_config_params;
-	config_params_size = core->iris_platform_data->input_config_params_size;
+	config_params = core->iris_platform_data->input_config_params_default;
+	config_params_size = core->iris_platform_data->input_config_params_default_size;
 
 	if (V4L2_TYPE_IS_OUTPUT(plane)) {
 		for (i = 0; i < config_params_size; i++) {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 8c91d336ff7e25256c7d496c46a5e07f47cf1df2..7ca5ae13d62b95fdcf71ef70cb6abf446b2c6e5a 100644
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
index 8e54962414aeb6a834980fc31d340d34b6ee0992..a8c30fc5c0d0668cc9980f2fcfcf21072cf9ef0a 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -587,6 +587,7 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
 	}
 
 	inst->fw_caps[POC].value = subsc_params.pic_order_cnt;
+	inst->fw_caps[TIER].value = subsc_params.tier;
 
 	if (subsc_params.bit_depth != BIT_DEPTH_8 ||
 	    !(subsc_params.coded_frames & HFI_BITMASK_FRAME_MBS_ONLY_FLAG)) {
@@ -668,6 +669,9 @@ static int iris_hfi_gen2_handle_session_property(struct iris_inst *inst,
 		inst_hfi_gen2->src_subcr_params.crop_offsets[0] = pkt->payload[0];
 		inst_hfi_gen2->src_subcr_params.crop_offsets[1] = pkt->payload[1];
 		break;
+	case HFI_PROP_LUMA_CHROMA_BIT_DEPTH:
+		inst_hfi_gen2->src_subcr_params.bit_depth = pkt->payload[0];
+		break;
 	case HFI_PROP_CODED_FRAMES:
 		inst_hfi_gen2->src_subcr_params.coded_frames = pkt->payload[0];
 		break;
@@ -686,6 +690,9 @@ static int iris_hfi_gen2_handle_session_property(struct iris_inst *inst,
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
index 71d23214f224ce55aba7c8f13e06f9b1d3e7d19e..adafdce8a856f9c661aabc5ca28f0faceaa93551 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -179,14 +179,22 @@ struct iris_platform_data {
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
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index c2cded2876b74afbd1cd427c91df73905f23ca3f..d3026b2bcb708c7ec31f134f628df7e57b54af4f 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -257,9 +257,10 @@ static struct tz_cp_config tz_cp_config_sm8550 = {
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
@@ -268,6 +269,26 @@ static const u32 sm8550_vdec_input_config_params[] = {
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
@@ -277,11 +298,19 @@ static const u32 sm8550_vdec_subscribe_input_properties[] = {
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
@@ -325,18 +354,33 @@ struct iris_platform_data sm8550_data = {
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
@@ -385,18 +429,33 @@ struct iris_platform_data sm8650_data = {
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
@@ -441,18 +500,33 @@ struct iris_platform_data qcs8300_data = {
 	.num_vpp_pipe = 2,
 	.max_session_count = 16,
 	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
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
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
index 8183e4e95fa4e94e3fb20ff4849084da2472f7da..8d0816a67ae0b6886204ce93fa5ccafaac10392a 100644
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

-- 
2.34.1


