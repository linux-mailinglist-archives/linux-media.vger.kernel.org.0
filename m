Return-Path: <linux-media+bounces-16902-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2175C9606F7
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 12:09:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 889C4B21844
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 10:09:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FD361A38CB;
	Tue, 27 Aug 2024 10:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ax3sQ276"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC541A0707;
	Tue, 27 Aug 2024 10:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724753196; cv=none; b=gCLcV7QHhOeMEo8zIg32aLo4E+jVhU0HSDGM0zOmtvCfMGDER9YJkpFw7ZtZyNtl0y30kTaXE5izSzUKFXzh1UrYYgirq2/NsZ2lvy74U+Ww4XwXZf0RLpBf6oi7HbdCGUCzNjrMGfApZG25kVhOBG+W1vqJqCl7qalYx7ysJ1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724753196; c=relaxed/simple;
	bh=qFp2IWmd5gkY5X++N8b6TYA80wz7qHgX0cj0G7sqFaA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dU71qoFk6BeSvUOua+mx4xm/nCYNWy7EuObKeD6KOTt/xJDEw5YuIkUnUKiUSnXIjylo3N4XI4wgOIx0rnYdlnCvQuJcoG0ID7aRfb9oFmR09m4QHmBdbVjddLSrnDOYSWbrsOonXwVVnyNuWVYbvG057XgKByigyrDryPi4v8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ax3sQ276; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0D99BC4FE12;
	Tue, 27 Aug 2024 10:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724753196;
	bh=qFp2IWmd5gkY5X++N8b6TYA80wz7qHgX0cj0G7sqFaA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Ax3sQ276L4q9jNt8nx+0iH86SYgdQvg/N3DbeFg5K/f8YMdWeNX5QpJL5J21hCaoe
	 HySTj0DYgyK3+NhA9UQAQO1zHjkFsODqska2CBeYYPDfWwY0+L/R5r7+iDVXaC8fE7
	 A30H0DNxx6KfcIHjoy+YL7sftX4fYKJhCMPmNDjhvEJ7TAeQGzdwSQBHBHf6beE/+f
	 3jkJA16mH5R+jXpSq4aQ0ua17UzpGwobITsqjTIpnGoAwY01m9vtfTen/Bm0VKnN0w
	 jRUMk2FQrDWaA7xDUCM8+MQ9yA+fj8YqQ+XQh7XeABs/upG7EQEdv5ckDvqg1H27Ul
	 0afR3VblqzurQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04613C54735;
	Tue, 27 Aug 2024 10:06:36 +0000 (UTC)
From: Dikshita Agarwal via B4 Relay <devnull+quic_dikshita.quicinc.com@kernel.org>
Date: Tue, 27 Aug 2024 15:35:45 +0530
Subject: [PATCH v3 20/29] media: iris: subscribe parameters and properties
 to firmware for hfi_gen2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240827-iris_v3-v3-20-c5fdbbe65e70@quicinc.com>
References: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
In-Reply-To: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Vedang Nagar <quic_vnagar@quicinc.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724753190; l=11506;
 i=quic_dikshita@quicinc.com; s=20240826; h=from:subject:message-id;
 bh=/yH5GYpTmFH04bcjTHhzyHyIgbmxEkMWOptBtTwxBPE=;
 b=bRQaO2j465ExU+8ZUQHwORBRx8la1gamApl2CY2FyYpeGmEII5vOXtvqWfs6VPcfqj63E6y2P
 t9WFGWtZRvRDaEZXqClEjHcrIKDXwO88kiZFmwRcmjjK19l83ozeCp6
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=+c7562uu1Y968VTv9z59ch2v3jmlO2Qv3uX7srN3LJY=
X-Endpoint-Received: by B4 Relay for quic_dikshita@quicinc.com/20240826
 with auth_id=199
X-Original-From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Reply-To: quic_dikshita@quicinc.com

From: Vedang Nagar <quic_vnagar@quicinc.com>

For hfi_gen2, subscribe for different bitstream parameters to
firmware to get notified for change in any of the subscribed
parameters.

Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2.h   |   6 +
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 179 +++++++++++++++++++++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   9 ++
 .../platform/qcom/iris/iris_platform_common.h      |   4 +
 .../platform/qcom/iris/iris_platform_sm8550.c      |  13 ++
 5 files changed, 211 insertions(+)

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
index e50f00021f6d..791b535a3584 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -472,6 +472,9 @@ static int iris_hfi_gen2_session_open(struct iris_inst *inst)
 	if (inst->state != IRIS_INST_DEINIT)
 		return -EALREADY;
 
+	inst_hfi_gen2->ipsc_properties_set = false;
+	inst_hfi_gen2->opsc_properties_set = false;
+
 	inst_hfi_gen2->packet = kzalloc(4096, GFP_KERNEL);
 	if (!inst_hfi_gen2->packet)
 		return -ENOMEM;
@@ -536,9 +539,185 @@ static int iris_hfi_gen2_session_close(struct iris_inst *inst)
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
+	const u32 *change_param = NULL;
+	u32 change_param_size = 0;
+	u32 payload[32] = {0};
+	u32 hfi_port = 0;
+	int ret;
+	u32 i;
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
+	if (!change_param || !change_param_size)
+		return -EINVAL;
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
+	return ret;
+}
+
+static int iris_hfi_gen2_subscribe_property(struct iris_inst *inst, u32 plane)
+{
+	struct iris_core *core = inst->core;
+	const u32 *subcribe_prop = NULL;
+	u32 subscribe_prop_size = 0;
+	u32 payload[32] = {0};
+	u32 i;
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
index 20422bdca6d4..5a01391845c6 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -159,6 +159,10 @@ struct iris_platform_data {
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
index 7be803ea867d..fccee5309d81 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
@@ -207,6 +207,15 @@ static const u32 sm8550_vdec_output_config_params[] = {
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
@@ -244,4 +253,8 @@ struct iris_platform_data sm8550_data = {
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



