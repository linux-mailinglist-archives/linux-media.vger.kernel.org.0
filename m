Return-Path: <linux-media+bounces-16903-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1556E960701
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 12:10:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 566ADB2381E
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 10:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C73E11A3BD3;
	Tue, 27 Aug 2024 10:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TUvz4Ui6"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95741A00D3;
	Tue, 27 Aug 2024 10:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724753196; cv=none; b=BqFt2iXmJL259jG0O5nnS8fNLiG5hUasfKt+5dT423ug01Cd5o2uNUUwJFj2lkp1EYJ8TbEgF8O4t/FYeUU55n1yTfUB9N4ZWDgHFJ8Emjw+9x5KZwsGCNUEqol/eH5X5ZFoz0PBNR2ygA4kkpD6fpA+HDEq5+AWJbSAhDYXgB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724753196; c=relaxed/simple;
	bh=s7lcqMLMCAvjiOQXF+yUvPPn6c1YKH7prWBkiQcZTvI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LQOSwOV17wZGgLPGnrwKdvaM7R745a/UDWG3srQUt0l1gdezVz2eUL2Yz5kE7CaRHzyArrxpKdBIMW3ZMttxJ5eAiFwSk1SPmhJ/bcJ7dq44sLalSqTAUkN1wSJqPu4tCJ+qDbvoLJRjdCbvj+rUQkyGMxS/UeIQKckTUwnvdzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TUvz4Ui6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A9812C4FDE1;
	Tue, 27 Aug 2024 10:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724753195;
	bh=s7lcqMLMCAvjiOQXF+yUvPPn6c1YKH7prWBkiQcZTvI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TUvz4Ui63GWoY9qCC0kbHTVpUrJ0YxNyGXkAGTz6b/Nx5nBTXLC2Hk9ASOduVNegM
	 HIteax6k9Rioq3cHi7NxRSESW21CDd6RBBbkXQGoRYcvnVxpDqDhaSsjrK//aTXBfr
	 1pFJ9QS2qX30VLd74sw+pNw/usRq19vjPZ9Jpuj4cLQmOggi0B+uoYlNygj4RP52Rw
	 LB1ppXmOpIDiQq7tj0TdrVTav/AgXTgNE9OGc3U7YFocZWxkzLz1zz0C5wfyIllAg3
	 wM8EEwShefunyIpx9WpBIMy8QZv/aAkwEWNb6LmIwc8oPP9Y5s88xMg2LqF1386//D
	 R6fl9nqPTBxDA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FDC3C54734;
	Tue, 27 Aug 2024 10:06:35 +0000 (UTC)
From: Dikshita Agarwal via B4 Relay <devnull+quic_dikshita.quicinc.com@kernel.org>
Date: Tue, 27 Aug 2024 15:35:41 +0530
Subject: [PATCH v3 16/29] media: iris: implement iris v4l2_ctrl_ops and
 prepare capabilities
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240827-iris_v3-v3-16-c5fdbbe65e70@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724753190; l=27871;
 i=quic_dikshita@quicinc.com; s=20240826; h=from:subject:message-id;
 bh=mfTBSSp/p0cZpwAn10kCxzzxI8rQoAYUon451UQ4o2o=;
 b=F8cyKTJE9po4knabE3pwYrtRyyv7zBmaKRdxtfp/GSAK9tU7cH539LGqw3ltMYtep3qRDv3/b
 ZQ/K8u7L6oTBd1cPIHkTDt/RXtQX0TbR9ftuGw8U9pKA/HEpWpnmBlV
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=+c7562uu1Y968VTv9z59ch2v3jmlO2Qv3uX7srN3LJY=
X-Endpoint-Received: by B4 Relay for quic_dikshita@quicinc.com/20240826
 with auth_id=199
X-Original-From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Reply-To: quic_dikshita@quicinc.com

From: Vedang Nagar <quic_vnagar@quicinc.com>

Implement s_ctrl and g_volatile_ctrl ctrl ops.
Introduce platform specific driver and firmware capabilities.
Capabilities are set of video specifications
and features supported by a specific platform (SOC).
Each capability is defined with min, max, range, default
value and corresponding HFI.

Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/Makefile          |   1 +
 drivers/media/platform/qcom/iris/iris_buffer.c     |   3 +-
 drivers/media/platform/qcom/iris/iris_core.h       |   2 +
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 194 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  15 ++
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |   4 +
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |   1 +
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   9 +
 drivers/media/platform/qcom/iris/iris_instance.h   |   6 +
 .../platform/qcom/iris/iris_platform_common.h      |  71 ++++++++
 .../platform/qcom/iris/iris_platform_sm8250.c      |  56 ++++++
 .../platform/qcom/iris/iris_platform_sm8550.c      | 138 +++++++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |   7 +
 drivers/media/platform/qcom/iris/iris_vdec.c       |  24 ++-
 drivers/media/platform/qcom/iris/iris_vdec.h       |   2 +-
 drivers/media/platform/qcom/iris/iris_vidc.c       |  16 +-
 16 files changed, 536 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 9c50e29db41e..a746681e03cd 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -1,5 +1,6 @@
 iris-objs += iris_buffer.o \
              iris_core.o \
+             iris_ctrls.o \
              iris_firmware.o \
              iris_hfi_common.o \
              iris_hfi_gen1_command.o \
diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index a1017ceede7d..652117a19b45 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -12,7 +12,6 @@
 #define MAX_WIDTH 4096
 #define MAX_HEIGHT 2304
 #define NUM_MBS_4K (DIV_ROUND_UP(MAX_WIDTH, 16) * DIV_ROUND_UP(MAX_HEIGHT, 16))
-#define BASE_RES_MB_MAX 138240
 
 /*
  * NV12:
@@ -74,7 +73,7 @@ static u32 iris_input_buffer_size(struct iris_inst *inst)
 	num_mbs = iris_get_mbpf(inst);
 	if (num_mbs > NUM_MBS_4K) {
 		div_factor = 4;
-		base_res_mbs = BASE_RES_MB_MAX;
+		base_res_mbs = inst->driver_cap[MBPF].value;
 	} else {
 		base_res_mbs = NUM_MBS_4K;
 		div_factor = 2;
diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index 1f6eca31928d..657d26a0fa2e 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -58,6 +58,7 @@
  * @intr_status: interrupt status
  * @sys_error_handler: a delayed work for handling system fatal error
  * @instances: a list_head of all instances
+ * @inst_fw_cap: an array of supported instance capabilities
  */
 
 struct iris_core {
@@ -97,6 +98,7 @@ struct iris_core {
 	u32					intr_status;
 	struct delayed_work			sys_error_handler;
 	struct list_head			instances;
+	struct platform_inst_fw_cap		inst_fw_cap[INST_FW_CAP_MAX];
 };
 
 int iris_core_init(struct iris_core *core);
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
new file mode 100644
index 000000000000..868306d68a87
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -0,0 +1,194 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include "iris_ctrls.h"
+#include "iris_instance.h"
+
+static bool iris_valid_cap_id(enum platform_inst_fw_cap_type cap_id)
+{
+	return cap_id >= 1 && cap_id < INST_FW_CAP_MAX;
+}
+
+static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
+{
+	switch (id) {
+	case V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER:
+		return DEBLOCK;
+	case V4L2_CID_MPEG_VIDEO_H264_PROFILE:
+		return PROFILE;
+	case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
+		return LEVEL;
+	default:
+		return INST_FW_CAP_MAX;
+	}
+}
+
+static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
+{
+	if (!iris_valid_cap_id(cap_id))
+		return 0;
+
+	switch (cap_id) {
+	case DEBLOCK:
+		return V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER;
+	case PROFILE:
+		return V4L2_CID_MPEG_VIDEO_H264_PROFILE;
+	case LEVEL:
+		return V4L2_CID_MPEG_VIDEO_H264_LEVEL;
+	default:
+		return 0;
+	}
+}
+
+static int iris_vdec_op_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
+{
+	enum platform_inst_fw_cap_type cap_id;
+	struct iris_inst *inst = NULL;
+
+	inst = container_of(ctrl->handler, struct iris_inst, ctrl_handler);
+	switch (ctrl->id) {
+	case V4L2_CID_MIN_BUFFERS_FOR_CAPTURE:
+		ctrl->val = inst->buffers[BUF_OUTPUT].min_count;
+		break;
+	case V4L2_CID_MIN_BUFFERS_FOR_OUTPUT:
+		ctrl->val = inst->buffers[BUF_INPUT].min_count;
+		break;
+	default:
+		cap_id = iris_get_cap_id(ctrl->id);
+		if (iris_valid_cap_id(cap_id))
+			ctrl->val = inst->fw_cap[cap_id].value;
+		else
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int iris_vdec_op_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	enum platform_inst_fw_cap_type cap_id;
+	struct platform_inst_fw_cap *cap;
+	struct iris_inst *inst;
+
+	inst = container_of(ctrl->handler, struct iris_inst, ctrl_handler);
+	cap = &inst->fw_cap[0];
+
+	cap_id = iris_get_cap_id(ctrl->id);
+	if (!iris_valid_cap_id(cap_id))
+		return -EINVAL;
+
+	cap[cap_id].flags |= CAP_FLAG_CLIENT_SET;
+
+	inst->fw_cap[cap_id].value = ctrl->val;
+
+	return 0;
+}
+
+static const struct v4l2_ctrl_ops iris_ctrl_ops = {
+	.s_ctrl = iris_vdec_op_s_ctrl,
+	.g_volatile_ctrl = iris_vdec_op_g_volatile_ctrl,
+};
+
+int iris_ctrls_init(struct iris_inst *inst)
+{
+	struct platform_inst_fw_cap *cap;
+	int num_ctrls = 0, ctrl_idx = 0;
+	int idx = 0, ret;
+	u32 v4l2_id;
+
+	cap = &inst->fw_cap[0];
+
+	for (idx = 1; idx < INST_FW_CAP_MAX; idx++) {
+		if (iris_get_v4l2_id(cap[idx].cap_id))
+			num_ctrls++;
+	}
+	if (!num_ctrls)
+		return -EINVAL;
+
+	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, num_ctrls);
+	if (ret)
+		return ret;
+
+	for (idx = 1; idx < INST_FW_CAP_MAX; idx++) {
+		struct v4l2_ctrl *ctrl;
+
+		v4l2_id = iris_get_v4l2_id(cap[idx].cap_id);
+		if (!v4l2_id)
+			continue;
+
+		if (ctrl_idx >= num_ctrls) {
+			ret = -EINVAL;
+			goto error;
+		}
+
+		if (cap[idx].flags & CAP_FLAG_MENU) {
+			ctrl = v4l2_ctrl_new_std_menu(&inst->ctrl_handler,
+						      &iris_ctrl_ops,
+						      v4l2_id,
+						      cap[idx].max,
+						      ~(cap[idx].step_or_mask),
+						      cap[idx].value);
+		} else {
+			ctrl = v4l2_ctrl_new_std(&inst->ctrl_handler,
+						 &iris_ctrl_ops,
+						 v4l2_id,
+						 cap[idx].min,
+						 cap[idx].max,
+						 cap[idx].step_or_mask,
+						 cap[idx].value);
+		}
+		if (!ctrl) {
+			ret = -EINVAL;
+			goto error;
+		}
+
+		ret = inst->ctrl_handler.error;
+		if (ret)
+			goto error;
+
+		if ((cap[idx].flags & CAP_FLAG_VOLATILE) ||
+		    (ctrl->id == V4L2_CID_MIN_BUFFERS_FOR_CAPTURE ||
+		     ctrl->id == V4L2_CID_MIN_BUFFERS_FOR_OUTPUT))
+			ctrl->flags |= V4L2_CTRL_FLAG_VOLATILE;
+
+		ctrl->flags |= V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;
+		ctrl_idx++;
+	}
+
+	return 0;
+error:
+	v4l2_ctrl_handler_free(&inst->ctrl_handler);
+
+	return ret;
+}
+
+int iris_session_init_caps(struct iris_core *core)
+{
+	struct platform_inst_fw_cap *inst_plat_cap_data;
+	int i, num_inst_cap;
+	u32 cap_id;
+
+	inst_plat_cap_data = core->iris_platform_data->inst_fw_cap_data;
+	if (!inst_plat_cap_data)
+		return -EINVAL;
+
+	num_inst_cap = core->iris_platform_data->inst_fw_cap_data_size;
+
+	for (i = 0; i < num_inst_cap && i < INST_FW_CAP_MAX - 1; i++) {
+		cap_id = inst_plat_cap_data[i].cap_id;
+		if (!iris_valid_cap_id(cap_id))
+			continue;
+
+		core->inst_fw_cap[cap_id].cap_id = inst_plat_cap_data[i].cap_id;
+		core->inst_fw_cap[cap_id].min = inst_plat_cap_data[i].min;
+		core->inst_fw_cap[cap_id].max = inst_plat_cap_data[i].max;
+		core->inst_fw_cap[cap_id].step_or_mask = inst_plat_cap_data[i].step_or_mask;
+		core->inst_fw_cap[cap_id].value = inst_plat_cap_data[i].value;
+		core->inst_fw_cap[cap_id].flags = inst_plat_cap_data[i].flags;
+		core->inst_fw_cap[cap_id].hfi_id = inst_plat_cap_data[i].hfi_id;
+	}
+
+	return 0;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
new file mode 100644
index 000000000000..46e1da847aa8
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _IRIS_CTRLS_H_
+#define _IRIS_CTRLS_H_
+
+struct iris_core;
+struct iris_inst;
+
+int iris_ctrls_init(struct iris_inst *inst);
+int iris_session_init_caps(struct iris_core *core);
+
+#endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index da52e497b74a..9dc050063924 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -31,9 +31,13 @@
 #define HFI_EVENT_SYS_ERROR				0x1
 #define HFI_EVENT_SESSION_ERROR				0x2
 
+#define HFI_PROPERTY_CONFIG_VDEC_POST_LOOP_DEBLOCKER	0x1200001
+
 #define HFI_PROPERTY_SYS_CODEC_POWER_PLANE_CTRL		0x5
 #define HFI_PROPERTY_SYS_IMAGE_VERSION			0x6
 
+#define HFI_PROPERTY_PARAM_WORK_MODE			0x1015
+#define HFI_PROPERTY_PARAM_WORK_ROUTE			0x1017
 #define HFI_MSG_SYS_INIT				0x20001
 #define HFI_MSG_SYS_SESSION_INIT			0x20006
 #define HFI_MSG_SYS_SESSION_END				0x20007
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index a74114b0761a..6ad2ca7be0f0 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -108,6 +108,7 @@ static int iris_hfi_gen2_session_set_default_header(struct iris_inst *inst)
 	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
 	u32 default_header = false;
 
+	default_header = inst->fw_cap[DEFAULT_HEADER].value;
 	iris_hfi_gen2_packet_session_property(inst,
 					      HFI_PROP_DEC_DEFAULT_HEADER,
 					      HFI_HOST_FLAGS_NONE,
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index 18cc9365ab75..401df7b4e976 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -28,7 +28,16 @@
 #define HFI_PROP_UBWC_BANK_SWZL_LEVEL3		0x03000008
 #define HFI_PROP_UBWC_BANK_SPREADING		0x03000009
 #define HFI_PROP_CODEC				0x03000100
+#define HFI_PROP_PROFILE			0x03000107
+#define HFI_PROP_LEVEL				0x03000108
+#define HFI_PROP_STAGE				0x0300010a
+#define HFI_PROP_PIPE				0x0300010b
+#define HFI_PROP_LUMA_CHROMA_BIT_DEPTH		0x0300010f
+#define HFI_PROP_CODED_FRAMES			0x03000120
+#define HFI_PROP_BUFFER_HOST_MAX_COUNT		0x03000123
+#define HFI_PROP_PIC_ORDER_CNT_TYPE		0x03000128
 #define HFI_PROP_DEC_DEFAULT_HEADER		0x03000168
+#define HFI_PROP_DEC_START_FROM_RAP_FRAME	0x03000169
 #define HFI_PROP_END				0x03FFFFFF
 
 #define HFI_SESSION_ERROR_BEGIN			0x04000000
diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index d28b8fd7ec2f..2429b9860789 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -23,8 +23,11 @@
  * @fh: reference of v4l2 file handler
  * @fmt_src: structure of v4l2_format for source
  * @fmt_dst: structure of v4l2_format for destination
+ * @ctrl_handler: reference of v4l2 ctrl handler
  * @crop: structure of crop info
  * @completions: structure of signal completions
+ * @driver_cap: array of supported instance driver capabilities
+ * @fw_cap: array of supported instance firmware capabilities
  * @buffers: array of different iris buffers
  * @fw_min_count: minimnum count of buffers needed by fw
  * @once_per_session_set: boolean to set once per session property
@@ -42,8 +45,11 @@ struct iris_inst {
 	struct v4l2_fh			fh;
 	struct v4l2_format		*fmt_src;
 	struct v4l2_format		*fmt_dst;
+	struct v4l2_ctrl_handler	ctrl_handler;
 	struct iris_hfi_rect_desc	crop;
 	struct completion		completion;
+	struct platform_inst_driver_cap	driver_cap[INST_DRIVER_CAP_MAX];
+	struct platform_inst_fw_cap	fw_cap[INST_FW_CAP_MAX];
 	struct iris_buffers		buffers[BUF_TYPE_MAX];
 	u32				fw_min_count;
 	bool				once_per_session_set;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 754cccc638a5..2935b769abb7 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -10,6 +10,23 @@
 #define HW_RESPONSE_TIMEOUT_VALUE               (1000) /* milliseconds */
 #define AUTOSUSPEND_DELAY_VALUE			(HW_RESPONSE_TIMEOUT_VALUE + 500) /* milliseconds */
 
+#define REGISTER_BIT_DEPTH(luma, chroma)	((luma) << 16 | (chroma))
+#define BIT_DEPTH_8				REGISTER_BIT_DEPTH(8, 8)
+#define CODED_FRAMES_PROGRESSIVE		0x0
+#define DEFAULT_MAX_HOST_BUF_COUNT		64
+#define DEFAULT_MAX_HOST_BURST_BUF_COUNT	256
+
+enum stage_type {
+	STAGE_1 = 1,
+	STAGE_2 = 2,
+};
+
+enum pipe_type {
+	PIPE_1 = 1,
+	PIPE_2 = 2,
+	PIPE_4 = 4,
+};
+
 extern struct iris_platform_data sm8550_data;
 extern struct iris_platform_data sm8250_data;
 
@@ -41,6 +58,56 @@ struct ubwc_config_data {
 	u32	bank_spreading;
 };
 
+enum platform_inst_driver_cap_type {
+	FRAME_WIDTH = 1,
+	FRAME_HEIGHT,
+	MBPF,
+	INST_DRIVER_CAP_MAX,
+};
+
+enum platform_inst_fw_cap_type {
+	PROFILE = 1,
+	LEVEL,
+	INPUT_BUF_HOST_MAX_COUNT,
+	STAGE,
+	PIPE,
+	POC,
+	CODED_FRAMES,
+	BIT_DEPTH,
+	DEFAULT_HEADER,
+	RAP_FRAME,
+	DEBLOCK,
+	INST_FW_CAP_MAX,
+};
+
+enum platform_inst_cap_flags {
+	CAP_FLAG_NONE			= 0,
+	CAP_FLAG_DYNAMIC_ALLOWED	= BIT(0),
+	CAP_FLAG_MENU			= BIT(1),
+	CAP_FLAG_INPUT_PORT		= BIT(2),
+	CAP_FLAG_OUTPUT_PORT		= BIT(3),
+	CAP_FLAG_CLIENT_SET		= BIT(4),
+	CAP_FLAG_BITMASK		= BIT(5),
+	CAP_FLAG_VOLATILE		= BIT(6),
+};
+
+struct platform_inst_driver_cap {
+	enum platform_inst_driver_cap_type cap_id;
+	u32 min;
+	u32 max;
+	u32 value;
+};
+
+struct platform_inst_fw_cap {
+	enum platform_inst_fw_cap_type cap_id;
+	s64 min;
+	s64 max;
+	s64 step_or_mask;
+	s64 value;
+	u32 hfi_id;
+	enum platform_inst_cap_flags flags;
+};
+
 struct iris_core_power {
 	u64 clk_freq;
 	u64 icc_bw;
@@ -70,6 +137,10 @@ struct iris_platform_data {
 	u64 dma_mask;
 	const char *fwname;
 	u32 pas_id;
+	struct platform_inst_driver_cap *inst_driver_cap_data;
+	u32 inst_driver_cap_data_size;
+	struct platform_inst_fw_cap *inst_fw_cap_data;
+	u32 inst_fw_cap_data_size;
 	struct tz_cp_config *tz_cp_config_data;
 	u32 core_arch;
 	u32 hw_response_timeout;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
index cbc5e84641f6..ac9f720aff8e 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
@@ -7,8 +7,60 @@
 #include "iris_platform_common.h"
 #include "iris_resources.h"
 #include "iris_hfi_gen1.h"
+#include "iris_hfi_gen1_defines.h"
 #include "iris_vpu_common.h"
 
+static struct platform_inst_driver_cap instance_driver_cap_data_sm8250[] = {
+	{
+		.cap_id = FRAME_WIDTH,
+		.min = 128,
+		.max = 8192,
+		.value = 1920,
+	},
+	{
+		.cap_id = FRAME_HEIGHT,
+		.min = 128,
+		.max = 8192,
+		.value = 1920,
+	},
+	{
+		.cap_id = MBPF,
+		.min = 64,
+		.max = 138240,
+		.value = 138240,
+	},
+};
+
+static struct platform_inst_fw_cap instance_fw_cap_data_sm8250[] = {
+	{
+		.cap_id = PIPE,
+		.min = PIPE_1,
+		.max = PIPE_4,
+		.step_or_mask = 1,
+		.value = PIPE_4,
+		.hfi_id = HFI_PROPERTY_PARAM_WORK_ROUTE,
+		.flags = CAP_FLAG_NONE,
+	},
+	{
+		.cap_id = STAGE,
+		.min = STAGE_1,
+		.max = STAGE_2,
+		.step_or_mask = 1,
+		.value = STAGE_2,
+		.hfi_id = HFI_PROPERTY_PARAM_WORK_MODE,
+		.flags = CAP_FLAG_NONE,
+	},
+	{
+		.cap_id = DEBLOCK,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROPERTY_CONFIG_VDEC_POST_LOOP_DEBLOCKER,
+		.flags = CAP_FLAG_NONE,
+	},
+};
+
 static void iris_set_sm8250_preset_registers(struct iris_core *core)
 {
 	writel(0x0, core->reg_base + 0xB0088);
@@ -57,6 +109,10 @@ struct iris_platform_data sm8250_data = {
 	.dma_mask = GENMASK(31, 29) - 1,
 	.fwname = "qcom/vpu/vpu20_p4.mbn",
 	.pas_id = IRIS_PAS_ID,
+	.inst_driver_cap_data = instance_driver_cap_data_sm8250,
+	.inst_driver_cap_data_size = ARRAY_SIZE(instance_driver_cap_data_sm8250),
+	.inst_fw_cap_data = instance_fw_cap_data_sm8250,
+	.inst_fw_cap_data_size = ARRAY_SIZE(instance_fw_cap_data_sm8250),
 	.tz_cp_config_data = &tz_cp_config_sm8250,
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
 	.num_vpp_pipe = 4,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
index 57fe9986b8cf..42e44b454896 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
@@ -5,12 +5,146 @@
 
 #include "iris_core.h"
 #include "iris_hfi_gen2.h"
+#include "iris_hfi_gen2_defines.h"
 #include "iris_platform_common.h"
 #include "iris_resources.h"
 #include "iris_vpu_common.h"
 
 #define VIDEO_ARCH_LX 1
 
+static struct platform_inst_driver_cap instance_driver_cap_data_sm8550[] = {
+	{
+		.cap_id = FRAME_WIDTH,
+		.min = 96,
+		.max = 8192,
+		.value = 1920,
+	},
+	{
+		.cap_id = FRAME_HEIGHT,
+		.min = 96,
+		.max = 8192,
+		.value = 1920,
+	},
+	{
+		.cap_id = MBPF,
+		.min = 36,
+		.max = 138240,
+		.value = 138240,
+	},
+};
+
+static struct platform_inst_fw_cap instance_fw_cap_data_sm8550[] = {
+	{
+		.cap_id = PROFILE,
+		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
+		.max = V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_HIGH),
+		.value = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
+		.hfi_id = HFI_PROP_PROFILE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+	},
+	{
+		.cap_id = LEVEL,
+		.min = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
+		.max = V4L2_MPEG_VIDEO_H264_LEVEL_6_2,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_0) |
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
+		.value = V4L2_MPEG_VIDEO_H264_LEVEL_6_1,
+		.hfi_id = HFI_PROP_LEVEL,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+	},
+	{
+		.cap_id = INPUT_BUF_HOST_MAX_COUNT,
+		.min = DEFAULT_MAX_HOST_BUF_COUNT,
+		.max = DEFAULT_MAX_HOST_BURST_BUF_COUNT,
+		.step_or_mask = 1,
+		.value = DEFAULT_MAX_HOST_BUF_COUNT,
+		.hfi_id = HFI_PROP_BUFFER_HOST_MAX_COUNT,
+		.flags = CAP_FLAG_INPUT_PORT,
+	},
+	{
+		.cap_id = STAGE,
+		.min = STAGE_1,
+		.max = STAGE_2,
+		.step_or_mask = 1,
+		.value = STAGE_2,
+		.hfi_id = HFI_PROP_STAGE,
+		.flags = CAP_FLAG_NONE,
+	},
+	{
+		.cap_id = PIPE,
+		.min = PIPE_1,
+		.max = PIPE_4,
+		.step_or_mask = 1,
+		.value = PIPE_4,
+		.hfi_id = HFI_PROP_PIPE,
+		.flags = CAP_FLAG_NONE,
+	},
+	{
+		.cap_id = POC,
+		.min = 0,
+		.max = 2,
+		.step_or_mask = 1,
+		.value = 1,
+		.hfi_id = HFI_PROP_PIC_ORDER_CNT_TYPE,
+	},
+	{
+		.cap_id = CODED_FRAMES,
+		.min = CODED_FRAMES_PROGRESSIVE,
+		.max = CODED_FRAMES_PROGRESSIVE,
+		.step_or_mask = 0,
+		.value = CODED_FRAMES_PROGRESSIVE,
+		.hfi_id = HFI_PROP_CODED_FRAMES,
+	},
+	{
+		.cap_id = BIT_DEPTH,
+		.min = BIT_DEPTH_8,
+		.max = BIT_DEPTH_8,
+		.step_or_mask = 1,
+		.value = BIT_DEPTH_8,
+		.hfi_id = HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
+	},
+	{
+		.cap_id = DEFAULT_HEADER,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROP_DEC_DEFAULT_HEADER,
+	},
+	{
+		.cap_id = RAP_FRAME,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 1,
+		.hfi_id = HFI_PROP_DEC_START_FROM_RAP_FRAME,
+		.flags = CAP_FLAG_INPUT_PORT,
+	},
+};
+
 static void iris_set_sm8550_preset_registers(struct iris_core *core)
 {
 	writel(0x0, core->reg_base + 0xB0088);
@@ -69,6 +203,10 @@ struct iris_platform_data sm8550_data = {
 	.dma_mask = GENMASK(31, 29) - 1,
 	.fwname = "qcom/vpu/vpu30_p4.mbn",
 	.pas_id = IRIS_PAS_ID,
+	.inst_driver_cap_data = instance_driver_cap_data_sm8550,
+	.inst_driver_cap_data_size = ARRAY_SIZE(instance_driver_cap_data_sm8550),
+	.inst_fw_cap_data = instance_fw_cap_data_sm8550,
+	.inst_fw_cap_data_size = ARRAY_SIZE(instance_fw_cap_data_sm8550),
 	.tz_cp_config_data = &tz_cp_config_sm8550,
 	.core_arch = VIDEO_ARCH_LX,
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 5d492b3919cc..319851c50ccd 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -7,6 +7,7 @@
 #include <linux/pm_runtime.h>
 
 #include "iris_core.h"
+#include "iris_ctrls.h"
 #include "iris_vidc.h"
 
 static inline int iris_init_isr(struct iris_core *core)
@@ -145,6 +146,12 @@ static int iris_probe(struct platform_device *pdev)
 		goto err_runtime_disable;
 	}
 
+	ret = iris_session_init_caps(core);
+	if (ret) {
+		dev_err_probe(core->dev, ret, "init inst caps failed\n");
+		goto err_runtime_disable;
+	}
+
 	ret = v4l2_device_register(dev, &core->v4l2_dev);
 	if (ret)
 		goto err_runtime_disable;
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 29c7e229c148..f82a337b8f43 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -7,6 +7,7 @@
 #include <media/v4l2-mem2mem.h>
 
 #include "iris_buffer.h"
+#include "iris_ctrls.h"
 #include "iris_instance.h"
 #include "iris_vdec.h"
 #include "iris_vpu_buffer.h"
@@ -16,9 +17,13 @@
 #define DEFAULT_CODEC_ALIGNMENT 16
 #define MAX_EVENTS 30
 
-void iris_vdec_inst_init(struct iris_inst *inst)
+int iris_vdec_inst_init(struct iris_inst *inst)
 {
+	struct platform_inst_driver_cap *inst_plat_cap_data;
+	struct iris_core *core = inst->core;
 	struct v4l2_format *f;
+	int i, num_inst_cap;
+	u32 cap_id;
 
 	inst->fmt_src  = kzalloc(sizeof(*inst->fmt_src), GFP_KERNEL);
 	inst->fmt_dst  = kzalloc(sizeof(*inst->fmt_dst), GFP_KERNEL);
@@ -54,6 +59,23 @@ void iris_vdec_inst_init(struct iris_inst *inst)
 	inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
 	inst->buffers[BUF_OUTPUT].actual_count = inst->buffers[BUF_OUTPUT].min_count;
 	inst->buffers[BUF_OUTPUT].size = f->fmt.pix_mp.plane_fmt[0].sizeimage;
+
+	memcpy(&inst->fw_cap[0], &core->inst_fw_cap[0],
+	       INST_FW_CAP_MAX * sizeof(struct platform_inst_fw_cap));
+
+	inst_plat_cap_data = core->iris_platform_data->inst_driver_cap_data;
+	num_inst_cap = core->iris_platform_data->inst_driver_cap_data_size;
+
+	for (i = 0; i < num_inst_cap && i < INST_DRIVER_CAP_MAX - 1; i++) {
+		cap_id = inst_plat_cap_data[i].cap_id;
+
+		inst->driver_cap[cap_id].cap_id = inst_plat_cap_data[i].cap_id;
+		inst->driver_cap[cap_id].min = inst_plat_cap_data[i].min;
+		inst->driver_cap[cap_id].max = inst_plat_cap_data[i].max;
+		inst->driver_cap[cap_id].value = inst_plat_cap_data[i].value;
+	}
+
+	return iris_ctrls_init(inst);
 }
 
 void iris_vdec_inst_deinit(struct iris_inst *inst)
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.h b/drivers/media/platform/qcom/iris/iris_vdec.h
index 707fff34bf4d..d7b8a0ad6fa8 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.h
+++ b/drivers/media/platform/qcom/iris/iris_vdec.h
@@ -8,7 +8,7 @@
 
 struct iris_inst;
 
-void iris_vdec_inst_init(struct iris_inst *inst);
+int iris_vdec_inst_init(struct iris_inst *inst);
 void iris_vdec_inst_deinit(struct iris_inst *inst);
 int iris_vdec_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f);
 int iris_vdec_try_fmt(struct iris_inst *inst, struct v4l2_format *f);
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 141704512b3c..7d5da30cb1d1 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -16,10 +16,6 @@
 
 #define IRIS_DRV_NAME "iris_driver"
 #define IRIS_BUS_NAME "platform:iris_icc"
-#define MIN_FRAME_WIDTH 128
-#define MAX_FRAME_WIDTH 8192
-#define MIN_FRAME_HEIGHT 128
-#define MAX_FRAME_HEIGHT 8192
 #define STEP_WIDTH 1
 #define STEP_HEIGHT 1
 
@@ -31,6 +27,7 @@ static int iris_v4l2_fh_init(struct iris_inst *inst)
 		return -EINVAL;
 
 	v4l2_fh_init(&inst->fh, core->vdev_dec);
+	inst->fh.ctrl_handler = &inst->ctrl_handler;
 	v4l2_fh_add(&inst->fh);
 
 	return 0;
@@ -188,7 +185,7 @@ int iris_open(struct file *filp)
 		goto fail_m2m_release;
 	}
 
-	iris_vdec_inst_init(inst);
+	ret = iris_vdec_inst_init(inst);
 	if (ret)
 		goto fail_m2m_ctx_release;
 
@@ -244,6 +241,7 @@ int iris_close(struct file *filp)
 	if (!inst)
 		return -EINVAL;
 
+	v4l2_ctrl_handler_free(&inst->ctrl_handler);
 	v4l2_m2m_ctx_release(inst->m2m_ctx);
 	v4l2_m2m_release(inst->m2m_dev);
 	mutex_lock(&inst->lock);
@@ -351,11 +349,11 @@ static int iris_enum_framesizes(struct file *filp, void *fh,
 	}
 
 	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
-	fsize->stepwise.min_width = MIN_FRAME_WIDTH;
-	fsize->stepwise.max_width = MAX_FRAME_WIDTH;
+	fsize->stepwise.min_width = inst->driver_cap[FRAME_WIDTH].min;
+	fsize->stepwise.max_width = inst->driver_cap[FRAME_WIDTH].max;
 	fsize->stepwise.step_width = STEP_WIDTH;
-	fsize->stepwise.min_height = MIN_FRAME_HEIGHT;
-	fsize->stepwise.max_height = MAX_FRAME_HEIGHT;
+	fsize->stepwise.min_height = inst->driver_cap[FRAME_HEIGHT].min;
+	fsize->stepwise.max_height = inst->driver_cap[FRAME_HEIGHT].max;
 	fsize->stepwise.step_height = STEP_HEIGHT;
 
 unlock:

-- 
2.34.1



