Return-Path: <linux-media+bounces-23040-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 837FB9EAF48
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 12:11:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16EC328668B
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 11:11:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28B4622FE1C;
	Tue, 10 Dec 2024 11:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hJFwtF8h"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B538F215778;
	Tue, 10 Dec 2024 11:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733828859; cv=none; b=h1p8A7eYOjL0iwg9z3+drnptECcNNy9LE0lGfzNQgQq9ExbcJeFW0sVaLwAtkAXp8cDQa9sRnB81YAbZD5KxIC64pNQ0H2ivi/rle0Bby/NiKPcH/eCMtLddjKv3SbaaVkvtFvaYCY3NFysqxUzETHnxN2+HUl5/To2so2mf/yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733828859; c=relaxed/simple;
	bh=O2BKn915BBDQHMQqjePmDqoNE45gSB9mYHgc1QfWUHM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=tUaeHzyoZndtM0QrihhDXGPCiprJb96Kh7y75rvWpKQKUersb+UDl8yh/Tnn/N6Eq91mnravEZ+7sYIpv9xOD5v3TWQpi3XRzoMzbE6rMa5z139QsU4BHHQOYwsMjdywl+XcIgOZumTB+IcErDLBh5KPa8KIwu1QvcW983uQgTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hJFwtF8h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BA6lDlt003641;
	Tue, 10 Dec 2024 11:07:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P1+qJKbZODsm6W5up398PKbIlrVV6cPIR4ocOxzp54k=; b=hJFwtF8hdbVe5Pan
	96smjFoldAmksBwbE/SBIEHsnMDhWmzmBtbxNVC2JNTvQxyCsJL/30b0dzPDwt0N
	+RcInbg8GTod6X7+yDybGaWnrsQHzIeXWR5rxm/tHFCURaI5b4eNo1ROtOsVUkal
	KbWtkSAHdRwBjWSZcTtd5POyDrtzJRKd8xqAjwXmSDjUmNhK/JAX17Nqu1QTe7aR
	sRAHMfWTprXvx8/JroT0ILH0qpHRe0V70A4N2AvyieHV6K5RGLioiNKijgFqGzZJ
	i90SXklvX20c4Jm8fwaMtmRbaMSQCd2kkV2sypZRJc7guGeROFalbVySiK9KUnzP
	tML8Hw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43dxw43vh5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 11:07:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BAB7RrA016820
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 11:07:27 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 10 Dec 2024 03:07:21 -0800
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Tue, 10 Dec 2024 16:35:22 +0530
Subject: [PATCH v8 18/28] media: iris: subscribe parameters and properties
 to firmware for hfi_gen2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241210-qcom-video-iris-v8-18-42c5403cb1a3@quicinc.com>
References: <20241210-qcom-video-iris-v8-0-42c5403cb1a3@quicinc.com>
In-Reply-To: <20241210-qcom-video-iris-v8-0-42c5403cb1a3@quicinc.com>
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
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Nicolas Dufresne
	<nicolas@ndufresne.ca>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>,
        Jianhua Lu <lujianhua000@gmail.com>,
        "Stefan
 Schmidt" <stefan.schmidt@linaro.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Vedang Nagar <quic_vnagar@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733828732; l=11401;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=fHokAtZPSh6N21fy6MpBDprqpBKGe2ObPFAA/stakt8=;
 b=gXDmtZjwKIDMIEMvKUBGR2BSS58JiTlN0H8CKKzuT9cHp05RnFzBTeVP7gHpP6i+f/ziQGTXx
 OFhE2P5gMLQBkOcc8tJ+eqpeN3v459fRw2iKWOIq10QzrxvAiH8fQ1l
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: VUa36FS88xIqccJ0PqPOJytdD5ycxzMG
X-Proofpoint-GUID: VUa36FS88xIqccJ0PqPOJytdD5ycxzMG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 clxscore=1015 spamscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412100083

From: Vedang Nagar <quic_vnagar@quicinc.com>

For hfi_gen2, subscribe for different bitstream parameters to firmware,
to get notified for change in any of the subscribed parameters.

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
index 676bcb3dc81f..0a946c1e3a4c 100644
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
index 4c9604b05034..4fb7a4e4604d 100644
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
@@ -65,6 +69,11 @@
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
index 5643fb55b09e..50965450cbb9 100644
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


