Return-Path: <linux-media+bounces-19575-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AFE99C516
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 11:14:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0622C1F257EB
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 09:14:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 099111AA7A6;
	Mon, 14 Oct 2024 09:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="N7eK0dQ3"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89BE1591E2;
	Mon, 14 Oct 2024 09:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728896948; cv=none; b=JypXlvEUet1zg1hm1NqMqp75Z9CwEZgTeyhPWD/8cMFH7qIRgHADfMgAxKR0ruldIy+2BkbSmsrNxuzByWHcT6pZjv4rKPD8bxz/id747hLpU1gmsGuJuiC4Tu3jLBDWyuMV+WZFZQGn5AIba0SuQgTyuwAX/MnFydoIRXAytBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728896948; c=relaxed/simple;
	bh=5BPPT9JpTly+hBMYQwtvhe7U8nfN57vAP39ticyGt7A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=D7KTCqOgE6nxOkSEJb9IEd877xkpZpbCdflIZlfX8iVobeIsAF2gLEzOXidJHFay4dKMNyn7cAz4IZWQZwKIq8wURoU+mGFcv9W6abqCG6oVWKNEMxNYFBX69cnxFHM1E0KVXxu1Wqq00dFb40FnA9GWNrUJ/ObmBrJXxxbsKz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=N7eK0dQ3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49DNwCBB015497;
	Mon, 14 Oct 2024 09:09:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YssWsEfB1WG8igzkJZjKwfjSXpVGOkF+DfLI7BsqAqI=; b=N7eK0dQ3TADFPBDJ
	aJtEkuObDoA1gtFYgHykAqGEY4KIDig59Zd2pTrme8bQSOSRQfDIpyY/gGy1ajEV
	Gv4SHmwGnMG98HJVNl2M8z16qPNGWMhxj0ddhXrfyiJOlWMJoypfIFNMeP3Mmn8n
	hYLGNfz5ZAB6lTEF3AjEGFvwK2cOMSP8X2Y0In7/Op2HVcPMlK+xukR4VoEUfCby
	qsRoWl328k8zD9arq+WOHJNx8usuE1j1jaPGroUR8b+FthYOoOFFht3nNB30/M7b
	lhQZAd7LkXXGhasIHaNCz9yIZ4vAaoHyTlS1pVyvrvwSnpMbi/WdQb40RjuckkBC
	+51lCQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 427hvfutde-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 09:09:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49E990Pd004598
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 09:09:00 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 14 Oct 2024 02:08:55 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Mon, 14 Oct 2024 14:37:39 +0530
Subject: [PATCH v4 18/28] media: iris: subscribe parameters and properties
 to firmware for hfi_gen2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241014-qcom-video-iris-v4-v4-18-c5eaa4e9ab9e@quicinc.com>
References: <20241014-qcom-video-iris-v4-v4-0-c5eaa4e9ab9e@quicinc.com>
In-Reply-To: <20241014-qcom-video-iris-v4-v4-0-c5eaa4e9ab9e@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: Hans Verkuil <hverkuil@xs4all.nl>,
        Sebastian Fricke
	<sebastian.fricke@collabora.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Vedang Nagar <quic_vnagar@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728896854; l=11402;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=g93qP7AdaasZ1ZioQzfjm4V/OXCa4J+vWUMaxOXJRXA=;
 b=iDY8LaTsuZjOeRJBiHmBvsucQ40nExplBfI7BVjKmXAdD+6/NZoUgoTZ8FW94GKm1vzO2nlXB
 enJj+/uotwACiA6GzhILNuQdZpgbAYUyI/wqoX/uTjdasoSX9Kc6yKx
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5G44HZRLH0j3F_2UVk-5333-gU32V63T
X-Proofpoint-ORIG-GUID: 5G44HZRLH0j3F_2UVk-5333-gU32V63T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0
 clxscore=1015 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410140066

From: Vedang Nagar <quic_vnagar@quicinc.com>

For hfi_gen2, subscribe for different bitstream parameters to
firmware, to get notified for change in any of the subscribed
parameters.

Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2.h   |   6 +
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 174 +++++++++++++++++++++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   9 ++
 .../platform/qcom/iris/iris_platform_common.h      |   4 +
 .../platform/qcom/iris/iris_platform_sm8550.c      |  13 ++
 5 files changed, 206 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
index 8170c1fef569..5fbbab844025 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
@@ -18,12 +18,18 @@ struct iris_core;
  *
  * @inst: pointer to iris_instance structure
  * @packet: HFI packet
+ * @ipsc_properties_set: boolean to set ipsc properties to fw
+ * @opsc_properties_set: boolean to set opsc properties to fw
  * @src_subcr_params: subscription params to fw on input port
+ * @dst_subcr_params: subscription params to fw on output port
  */
 struct iris_inst_hfi_gen2 {
 	struct iris_inst		inst;
 	struct iris_hfi_header		*packet;
+	bool				ipsc_properties_set;
+	bool				opsc_properties_set;
 	struct hfi_subscription_params	src_subcr_params;
+	struct hfi_subscription_params	dst_subcr_params;
 };
 
 void iris_hfi_gen2_command_ops_init(struct iris_core *core);
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 0845b75aafe9..dddaa074cae1 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -437,6 +437,9 @@ static int iris_hfi_gen2_session_open(struct iris_inst *inst)
 	if (inst->state != IRIS_INST_DEINIT)
 		return -EALREADY;
 
+	inst_hfi_gen2->ipsc_properties_set = false;
+	inst_hfi_gen2->opsc_properties_set = false;
+
 	inst_hfi_gen2->packet = kzalloc(4096, GFP_KERNEL);
 	if (!inst_hfi_gen2->packet)
 		return -ENOMEM;
@@ -501,9 +504,180 @@ static int iris_hfi_gen2_session_close(struct iris_inst *inst)
 	return ret;
 }
 
+static int iris_hfi_gen2_session_subscribe_mode(struct iris_inst *inst,
+						u32 cmd, u32 plane, u32 payload_type,
+						void *payload, u32 payload_size)
+{
+	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
+
+	iris_hfi_gen2_packet_session_command(inst,
+					     cmd,
+					     (HFI_HOST_FLAGS_RESPONSE_REQUIRED |
+					     HFI_HOST_FLAGS_INTR_REQUIRED),
+					     iris_hfi_gen2_get_port(plane),
+					     inst->session_id,
+					     payload_type,
+					     payload,
+					     payload_size);
+
+	return iris_hfi_queue_cmd_write(inst->core, inst_hfi_gen2->packet,
+					inst_hfi_gen2->packet->size);
+}
+
+static int iris_hfi_gen2_subscribe_change_param(struct iris_inst *inst, u32 plane)
+{
+	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
+	struct hfi_subscription_params subsc_params;
+	u32 prop_type, payload_size, payload_type;
+	struct iris_core *core = inst->core;
+	const u32 *change_param;
+	u32 change_param_size;
+	u32 payload[32] = {0};
+	u32 hfi_port = 0, i;
+	int ret;
+
+	if ((V4L2_TYPE_IS_OUTPUT(plane) && inst_hfi_gen2->ipsc_properties_set) ||
+	    (V4L2_TYPE_IS_CAPTURE(plane) && inst_hfi_gen2->opsc_properties_set)) {
+		dev_err(core->dev, "invalid plane\n");
+		return 0;
+	}
+
+	change_param = core->iris_platform_data->input_config_params;
+	change_param_size = core->iris_platform_data->input_config_params_size;
+
+	payload[0] = HFI_MODE_PORT_SETTINGS_CHANGE;
+
+	for (i = 0; i < change_param_size; i++)
+		payload[i + 1] = change_param[i];
+
+	ret = iris_hfi_gen2_session_subscribe_mode(inst,
+						   HFI_CMD_SUBSCRIBE_MODE,
+						   plane,
+						   HFI_PAYLOAD_U32_ARRAY,
+						   &payload[0],
+						   ((change_param_size + 1) * sizeof(u32)));
+	if (ret)
+		return ret;
+
+	if (V4L2_TYPE_IS_OUTPUT(plane)) {
+		inst_hfi_gen2->ipsc_properties_set = true;
+	} else {
+		hfi_port = iris_hfi_gen2_get_port(V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+		memcpy(&inst_hfi_gen2->dst_subcr_params,
+		       &inst_hfi_gen2->src_subcr_params,
+		       sizeof(inst_hfi_gen2->src_subcr_params));
+		subsc_params = inst_hfi_gen2->dst_subcr_params;
+		for (i = 0; i < change_param_size; i++) {
+			payload[0] = 0;
+			payload[1] = 0;
+			payload_size = 0;
+			payload_type = 0;
+			prop_type = change_param[i];
+			switch (prop_type) {
+			case HFI_PROP_BITSTREAM_RESOLUTION:
+				payload[0] = subsc_params.bitstream_resolution;
+				payload_size = sizeof(u32);
+				payload_type = HFI_PAYLOAD_U32;
+				break;
+			case HFI_PROP_CROP_OFFSETS:
+				payload[0] = subsc_params.crop_offsets[0];
+				payload[1] = subsc_params.crop_offsets[1];
+				payload_size = sizeof(u64);
+				payload_type = HFI_PAYLOAD_64_PACKED;
+				break;
+			case HFI_PROP_CODED_FRAMES:
+				payload[0] = subsc_params.coded_frames;
+				payload_size = sizeof(u32);
+				payload_type = HFI_PAYLOAD_U32;
+				break;
+			case HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT:
+				payload[0] = subsc_params.fw_min_count;
+				payload_size = sizeof(u32);
+				payload_type = HFI_PAYLOAD_U32;
+				break;
+			case HFI_PROP_PIC_ORDER_CNT_TYPE:
+				payload[0] = subsc_params.pic_order_cnt;
+				payload_size = sizeof(u32);
+				payload_type = HFI_PAYLOAD_U32;
+				break;
+			case HFI_PROP_SIGNAL_COLOR_INFO:
+				payload[0] = subsc_params.color_info;
+				payload_size = sizeof(u32);
+				payload_type = HFI_PAYLOAD_U32;
+				break;
+			case HFI_PROP_PROFILE:
+				payload[0] = subsc_params.profile;
+				payload_size = sizeof(u32);
+				payload_type = HFI_PAYLOAD_U32;
+				break;
+			case HFI_PROP_LEVEL:
+				payload[0] = subsc_params.level;
+				payload_size = sizeof(u32);
+				payload_type = HFI_PAYLOAD_U32;
+				break;
+			default:
+				prop_type = 0;
+				ret = -EINVAL;
+				break;
+			}
+			if (prop_type) {
+				ret = iris_hfi_gen2_session_set_property(inst,
+									 prop_type,
+									 HFI_HOST_FLAGS_NONE,
+									 hfi_port,
+									 payload_type,
+									 &payload,
+									 payload_size);
+				if (ret)
+					return ret;
+			}
+		}
+		inst_hfi_gen2->opsc_properties_set = true;
+	}
+
+	return 0;
+}
+
+static int iris_hfi_gen2_subscribe_property(struct iris_inst *inst, u32 plane)
+{
+	struct iris_core *core = inst->core;
+	u32 subscribe_prop_size, i;
+	const u32 *subcribe_prop;
+	u32 payload[32] = {0};
+
+	payload[0] = HFI_MODE_PROPERTY;
+
+	if (V4L2_TYPE_IS_OUTPUT(plane)) {
+		subscribe_prop_size = core->iris_platform_data->dec_input_prop_size;
+		subcribe_prop = core->iris_platform_data->dec_input_prop;
+	} else {
+		subscribe_prop_size = core->iris_platform_data->dec_output_prop_size;
+		subcribe_prop = core->iris_platform_data->dec_output_prop;
+	}
+
+	for (i = 0; i < subscribe_prop_size; i++)
+		payload[i + 1] = subcribe_prop[i];
+
+	return iris_hfi_gen2_session_subscribe_mode(inst,
+						    HFI_CMD_SUBSCRIBE_MODE,
+						    plane,
+						    HFI_PAYLOAD_U32_ARRAY,
+						    &payload[0],
+						    (subscribe_prop_size + 1) * sizeof(u32));
+}
+
 static int iris_hfi_gen2_session_start(struct iris_inst *inst, u32 plane)
 {
 	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
+	int ret = 0;
+
+	ret = iris_hfi_gen2_subscribe_change_param(inst, plane);
+	if (ret)
+		return ret;
+
+	ret = iris_hfi_gen2_subscribe_property(inst, plane);
+	if (ret)
+		return ret;
 
 	iris_hfi_gen2_packet_session_command(inst,
 					     HFI_CMD_START,
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index b5b232d31ad8..92c44841c67d 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -17,6 +17,7 @@
 #define HFI_CMD_CLOSE				0x01000004
 #define HFI_CMD_START				0x01000005
 #define HFI_CMD_STOP				0x01000006
+#define HFI_CMD_SUBSCRIBE_MODE			0x0100000B
 #define HFI_CMD_END				0x01FFFFFF
 
 #define HFI_BITMASK_FRAME_MBS_ONLY_FLAG		0x00000001
@@ -42,13 +43,16 @@
 #define HFI_PROP_PIPE				0x0300010b
 #define HFI_PROP_LUMA_CHROMA_BIT_DEPTH		0x0300010f
 #define HFI_PROP_CODED_FRAMES			0x03000120
+#define HFI_PROP_CABAC_SESSION			0x03000121
 #define HFI_PROP_BUFFER_HOST_MAX_COUNT		0x03000123
 #define HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT	0x03000124
 #define HFI_PROP_PIC_ORDER_CNT_TYPE		0x03000128
 #define HFI_PROP_QUALITY_MODE			0x03000148
 #define HFI_PROP_SIGNAL_COLOR_INFO		0x03000155
+#define HFI_PROP_PICTURE_TYPE			0x03000162
 #define HFI_PROP_DEC_DEFAULT_HEADER		0x03000168
 #define HFI_PROP_DEC_START_FROM_RAP_FRAME	0x03000169
+#define HFI_PROP_NO_OUTPUT			0x0300016a
 #define HFI_PROP_END				0x03FFFFFF
 
 #define HFI_SESSION_ERROR_BEGIN			0x04000000
@@ -64,6 +68,11 @@
 #define HFI_SYS_ERROR_WD_TIMEOUT		0x05000001
 #define HFI_SYSTEM_ERROR_END			0x05FFFFFF
 
+enum hfi_property_mode_type {
+	HFI_MODE_PORT_SETTINGS_CHANGE		= 0x00000001,
+	HFI_MODE_PROPERTY			= 0x00000002,
+};
+
 enum hfi_color_format {
 	HFI_COLOR_FMT_OPAQUE			= 0,
 	HFI_COLOR_FMT_NV12			= 1,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index c54eb2a491b0..914283802219 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -147,6 +147,10 @@ struct iris_platform_data {
 	unsigned int input_config_params_size;
 	const u32 *output_config_params;
 	unsigned int output_config_params_size;
+	const u32 *dec_input_prop;
+	unsigned int dec_input_prop_size;
+	const u32 *dec_output_prop;
+	unsigned int dec_output_prop_size;
 };
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
index 4b7372805d69..0f1eb530b232 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
@@ -183,6 +183,15 @@ static const u32 sm8550_vdec_output_config_params[] = {
 	HFI_PROP_LINEAR_STRIDE_SCANLINE,
 };
 
+static const u32 sm8550_vdec_subscribe_input_properties[] = {
+	HFI_PROP_NO_OUTPUT,
+};
+
+static const u32 sm8550_vdec_subscribe_output_properties[] = {
+	HFI_PROP_PICTURE_TYPE,
+	HFI_PROP_CABAC_SESSION,
+};
+
 struct iris_platform_data sm8550_data = {
 	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
@@ -219,4 +228,8 @@ struct iris_platform_data sm8550_data = {
 		sm8550_vdec_output_config_params,
 	.output_config_params_size =
 		ARRAY_SIZE(sm8550_vdec_output_config_params),
+	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
+	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
+	.dec_output_prop = sm8550_vdec_subscribe_output_properties,
+	.dec_output_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_output_properties),
 };

-- 
2.34.1


