Return-Path: <linux-media+bounces-20845-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A7B9BC65D
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 08:01:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8535FB2241F
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 07:01:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C449A201031;
	Tue,  5 Nov 2024 06:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mh83KyJv"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200CC201011;
	Tue,  5 Nov 2024 06:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730789879; cv=none; b=kHlSaS1IPVXylLZQ/35wB22jNjZoDYKU/h3mH90WSDNzKLsA0PFtnrpnExr2885PsQyRiixMkF+W6uwuDlCGcfrZ/TMBtvrmdh/szEzJMlu9+qi0p6vztkmGICoEg9F6L7rnS2zBw66thWTXZyDU7HH+IyttJ4xIDyXidV+lq9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730789879; c=relaxed/simple;
	bh=qM6EP1QVUpd4MowgDZYoBWR39O6kzWBVV6YoxuFj5/w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Ls4boxh9RSlcFwXGqh+04JQAVO2gkhDgw0inKr0UyydjBBcIh6q+vE8oEl5VEcKfIzWOGOF6VLxwyYMAM4TM3Nx3ysMZyPg60a6mxOagWERc76cp704Ea59plE4oS+Iz8DeP+JGcaOaqxHcfw3oOwFDrms2VNWG9RcR40EfxPeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mh83KyJv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4LIpuC028956;
	Tue, 5 Nov 2024 06:57:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d2/jOF1D2zUPbN73356DS16RUjAmD1TNtELFj3OQwwg=; b=mh83KyJvaYBhymCc
	46uOz37z/niHyjpnuC2Z1arvv6Rh0QSvReWpnC0iZw6Rq984qvxdakVSHjxc40VM
	W/s9ie4RrfWverVJ7F1ZTAFyLmrPTg8913A1VU77GyZvLtvbYNcu80A79bbvybUh
	mogBfIOrJKE+jd54VleIn0ySLl9dVKTgQ9DZEM+Icv2TyOtmTVtAvAeWIlFogF8k
	HLMgXvT9TMHHBAt2s6x8OhGlP7y1o5OygnU7gJfeyYMjcG21syfWluxFZfCOwrzx
	/QdjkVlITxGyxWl33BVS25U3FdrFxKnFeM2Ta0uw2ptHItekgFCiZK0pzQG8KtKb
	D10R+A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd286ps7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 06:57:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A56vkcq029766
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 5 Nov 2024 06:57:46 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 4 Nov 2024 22:57:40 -0800
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Tue, 5 Nov 2024 12:25:34 +0530
Subject: [PATCH v5 14/28] media: iris: implement iris v4l2_ctrl_ops
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241105-qcom-video-iris-v5-14-a88e7c220f78@quicinc.com>
References: <20241105-qcom-video-iris-v5-0-a88e7c220f78@quicinc.com>
In-Reply-To: <20241105-qcom-video-iris-v5-0-a88e7c220f78@quicinc.com>
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
        Jianhua Lu <lujianhua000@gmail.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        "Dikshita
 Agarwal" <quic_dikshita@quicinc.com>,
        Vedang Nagar <quic_vnagar@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730789780; l=17266;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=qM6EP1QVUpd4MowgDZYoBWR39O6kzWBVV6YoxuFj5/w=;
 b=awowuCHKOnuawwb/5mB+PwU18WuW96/TQKqsJzAF7KUtQ/oy1hi2IQ1oRwOVR/9+oZIkWjZGr
 snY/cDl+FZpDBG7LkZBp9DksCx4K3Q5FwGPhYS67AtzvrgF5gb8QzK8
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: uXdfrvL6ZFtYqgjpAQ-ukZqvXcLYcY8K
X-Proofpoint-GUID: uXdfrvL6ZFtYqgjpAQ-ukZqvXcLYcY8K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 clxscore=1015 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411050050

Initialize ctrl handler by reading platform specific firmware
capabilities. Capabilities are features supported by a specific platform
(SOC). Each capability is defined with min, max, range, default value
and corresponding HFI. Implement s_ctrl and g_volatile_ctrl ctrl ops.

Co-developed-by: Vedang Nagar <quic_vnagar@quicinc.com>
Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/Makefile          |   1 +
 drivers/media/platform/qcom/iris/iris_core.h       |   2 +
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 161 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  17 +++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   2 +
 drivers/media/platform/qcom/iris/iris_instance.h   |   4 +
 .../platform/qcom/iris/iris_platform_common.h      |  29 ++++
 .../platform/qcom/iris/iris_platform_sm8550.c      |  47 ++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |   3 +
 drivers/media/platform/qcom/iris/iris_vdec.c       |   9 +-
 drivers/media/platform/qcom/iris/iris_vdec.h       |   2 +-
 drivers/media/platform/qcom/iris/iris_vidc.c       |   9 +-
 12 files changed, 283 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 48ab264b7906..f685d76c2f79 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -1,5 +1,6 @@
 iris-objs += iris_buffer.o \
              iris_core.o \
+             iris_ctrls.o \
              iris_firmware.o \
              iris_hfi_common.o \
              iris_hfi_gen1_command.o \
diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index 578166d196f6..70e0dbc7c457 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -63,6 +63,7 @@ struct icc_info {
  * @intr_status: interrupt status
  * @sys_error_handler: a delayed work for handling system fatal error
  * @instances: a list_head of all instances
+ * @inst_fw_caps: an array of supported instance capabilities
  */
 
 struct iris_core {
@@ -101,6 +102,7 @@ struct iris_core {
 	u32					intr_status;
 	struct delayed_work			sys_error_handler;
 	struct list_head			instances;
+	struct platform_inst_fw_cap		inst_fw_caps[INST_FW_CAP_MAX];
 };
 
 int iris_core_init(struct iris_core *core);
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
new file mode 100644
index 000000000000..a204e2e1edf7
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -0,0 +1,161 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <media/v4l2-mem2mem.h>
+#include "iris_ctrls.h"
+#include "iris_instance.h"
+
+static inline bool iris_valid_cap_id(enum platform_inst_fw_cap_type cap_id)
+{
+	return cap_id >= 1 && cap_id < INST_FW_CAP_MAX;
+}
+
+static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
+{
+	switch (id) {
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
+	case PROFILE:
+		return V4L2_CID_MPEG_VIDEO_H264_PROFILE;
+	case LEVEL:
+		return V4L2_CID_MPEG_VIDEO_H264_LEVEL;
+	default:
+		return 0;
+	}
+}
+
+static int iris_vdec_op_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct iris_inst *inst = container_of(ctrl->handler, struct iris_inst, ctrl_handler);
+	enum platform_inst_fw_cap_type cap_id;
+	struct platform_inst_fw_cap *cap;
+	struct vb2_queue *q;
+
+	cap = &inst->fw_caps[0];
+	cap_id = iris_get_cap_id(ctrl->id);
+	if (!iris_valid_cap_id(cap_id))
+		return -EINVAL;
+
+	q = v4l2_m2m_get_src_vq(inst->m2m_ctx);
+	if (vb2_is_streaming(q) &&
+	    (!(inst->fw_caps[cap_id].flags & CAP_FLAG_DYNAMIC_ALLOWED)))
+		return -EINVAL;
+
+	cap[cap_id].flags |= CAP_FLAG_CLIENT_SET;
+
+	inst->fw_caps[cap_id].value = ctrl->val;
+
+	return 0;
+}
+
+static const struct v4l2_ctrl_ops iris_ctrl_ops = {
+	.s_ctrl = iris_vdec_op_s_ctrl,
+};
+
+int iris_ctrls_init(struct iris_inst *inst)
+{
+	struct platform_inst_fw_cap *cap = &inst->fw_caps[0];
+	u32 num_ctrls = 0, ctrl_idx = 0, idx = 0;
+	u32 v4l2_id;
+	int ret;
+
+	for (idx = 1; idx < INST_FW_CAP_MAX; idx++) {
+		if (iris_get_v4l2_id(cap[idx].cap_id))
+			num_ctrls++;
+	}
+	if (!num_ctrls)
+		return -EINVAL;
+
+	/* Adding 1 to num_ctrls to include V4L2_CID_MIN_BUFFERS_FOR_CAPTURE */
+
+	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, num_ctrls + 1);
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
+		ctrl_idx++;
+	}
+
+	v4l2_ctrl_new_std(&inst->ctrl_handler, NULL,
+			  V4L2_CID_MIN_BUFFERS_FOR_CAPTURE, 1, 32, 1, 4);
+
+	ret = inst->ctrl_handler.error;
+	if (ret)
+		goto error;
+
+	return 0;
+error:
+	v4l2_ctrl_handler_free(&inst->ctrl_handler);
+
+	return ret;
+}
+
+void iris_session_init_caps(struct iris_core *core)
+{
+	struct platform_inst_fw_cap *caps;
+	u32 i, num_cap, cap_id;
+
+	caps = core->iris_platform_data->inst_fw_caps;
+	num_cap = core->iris_platform_data->inst_fw_caps_size;
+
+	for (i = 0; i < num_cap; i++) {
+		cap_id = caps[i].cap_id;
+		if (!iris_valid_cap_id(cap_id))
+			continue;
+
+		core->inst_fw_caps[cap_id].cap_id = caps[i].cap_id;
+		core->inst_fw_caps[cap_id].min = caps[i].min;
+		core->inst_fw_caps[cap_id].max = caps[i].max;
+		core->inst_fw_caps[cap_id].step_or_mask = caps[i].step_or_mask;
+		core->inst_fw_caps[cap_id].value = caps[i].value;
+		core->inst_fw_caps[cap_id].flags = caps[i].flags;
+		core->inst_fw_caps[cap_id].hfi_id = caps[i].hfi_id;
+	}
+}
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
new file mode 100644
index 000000000000..3e4dd46e7a26
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _IRIS_CTRLS_H_
+#define _IRIS_CTRLS_H_
+
+#include "iris_platform_common.h"
+
+struct iris_core;
+struct iris_inst;
+
+int iris_ctrls_init(struct iris_inst *inst);
+void iris_session_init_caps(struct iris_core *core);
+
+#endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index 18cc9365ab75..457ab1887793 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -28,6 +28,8 @@
 #define HFI_PROP_UBWC_BANK_SWZL_LEVEL3		0x03000008
 #define HFI_PROP_UBWC_BANK_SPREADING		0x03000009
 #define HFI_PROP_CODEC				0x03000100
+#define HFI_PROP_PROFILE			0x03000107
+#define HFI_PROP_LEVEL				0x03000108
 #define HFI_PROP_DEC_DEFAULT_HEADER		0x03000168
 #define HFI_PROP_END				0x03FFFFFF
 
diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index d28b8fd7ec2f..43ced6ece289 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -23,8 +23,10 @@
  * @fh: reference of v4l2 file handler
  * @fmt_src: structure of v4l2_format for source
  * @fmt_dst: structure of v4l2_format for destination
+ * @ctrl_handler: reference of v4l2 ctrl handler
  * @crop: structure of crop info
  * @completions: structure of signal completions
+ * @fw_caps: array of supported instance firmware capabilities
  * @buffers: array of different iris buffers
  * @fw_min_count: minimnum count of buffers needed by fw
  * @once_per_session_set: boolean to set once per session property
@@ -42,8 +44,10 @@ struct iris_inst {
 	struct v4l2_fh			fh;
 	struct v4l2_format		*fmt_src;
 	struct v4l2_format		*fmt_dst;
+	struct v4l2_ctrl_handler	ctrl_handler;
 	struct iris_hfi_rect_desc	crop;
 	struct completion		completion;
+	struct platform_inst_fw_cap	fw_caps[INST_FW_CAP_MAX];
 	struct iris_buffers		buffers[BUF_TYPE_MAX];
 	u32				fw_min_count;
 	bool				once_per_session_set;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 54a2d723797b..c45928a6c4fe 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -49,6 +49,33 @@ struct platform_inst_caps {
 	u32 max_frame_height;
 	u32 max_mbpf;
 };
+
+enum platform_inst_fw_cap_type {
+	PROFILE = 1,
+	LEVEL,
+	INST_FW_CAP_MAX,
+};
+
+enum platform_inst_fw_cap_flags {
+	CAP_FLAG_DYNAMIC_ALLOWED	= BIT(0),
+	CAP_FLAG_MENU			= BIT(1),
+	CAP_FLAG_INPUT_PORT		= BIT(2),
+	CAP_FLAG_OUTPUT_PORT		= BIT(3),
+	CAP_FLAG_CLIENT_SET		= BIT(4),
+	CAP_FLAG_BITMASK		= BIT(5),
+	CAP_FLAG_VOLATILE		= BIT(6),
+};
+
+struct platform_inst_fw_cap {
+	enum platform_inst_fw_cap_type cap_id;
+	s64 min;
+	s64 max;
+	s64 step_or_mask;
+	s64 value;
+	u32 hfi_id;
+	enum platform_inst_fw_cap_flags flags;
+};
+
 struct iris_core_power {
 	u64 clk_freq;
 	u64 icc_bw;
@@ -79,6 +106,8 @@ struct iris_platform_data {
 	const char *fwname;
 	u32 pas_id;
 	struct platform_inst_caps *inst_caps;
+	struct platform_inst_fw_cap *inst_fw_caps;
+	u32 inst_fw_caps_size;
 	struct tz_cp_config *tz_cp_config_data;
 	u32 core_arch;
 	u32 hw_response_timeout;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
index 37c0130d7059..7e3703adb5b3 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
@@ -5,11 +5,56 @@
 
 #include "iris_core.h"
 #include "iris_hfi_gen2.h"
+#include "iris_hfi_gen2_defines.h"
 #include "iris_platform_common.h"
 #include "iris_vpu_common.h"
 
 #define VIDEO_ARCH_LX 1
 
+static struct platform_inst_fw_cap inst_fw_cap_sm8550[] = {
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
+};
+
 static struct platform_inst_caps platform_inst_cap_sm8550 = {
 	.min_frame_width = 96,
 	.max_frame_width = 8192,
@@ -77,6 +122,8 @@ struct iris_platform_data sm8550_data = {
 	.fwname = "qcom/vpu/vpu30_p4.mbn",
 	.pas_id = IRIS_PAS_ID,
 	.inst_caps = &platform_inst_cap_sm8550,
+	.inst_fw_caps = inst_fw_cap_sm8550,
+	.inst_fw_caps_size = ARRAY_SIZE(inst_fw_cap_sm8550),
 	.tz_cp_config_data = &tz_cp_config_sm8550,
 	.core_arch = VIDEO_ARCH_LX,
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index ee0d1cd5732f..7b7378b7abb3 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -12,6 +12,7 @@
 #include <linux/reset.h>
 
 #include "iris_core.h"
+#include "iris_ctrls.h"
 #include "iris_vidc.h"
 
 static int iris_init_icc(struct iris_core *core)
@@ -237,6 +238,8 @@ static int iris_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	iris_session_init_caps(core);
+
 	ret = v4l2_device_register(dev, &core->v4l2_dev);
 	if (ret)
 		return ret;
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 3c9bea5f0532..f5e5c316f75e 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -7,6 +7,7 @@
 #include <media/v4l2-mem2mem.h>
 
 #include "iris_buffer.h"
+#include "iris_ctrls.h"
 #include "iris_instance.h"
 #include "iris_vdec.h"
 #include "iris_vpu_buffer.h"
@@ -15,8 +16,9 @@
 #define DEFAULT_HEIGHT 240
 #define DEFAULT_CODEC_ALIGNMENT 16
 
-void iris_vdec_inst_init(struct iris_inst *inst)
+int iris_vdec_inst_init(struct iris_inst *inst)
 {
+	struct iris_core *core = inst->core;
 	struct v4l2_format *f;
 
 	inst->fmt_src  = kzalloc(sizeof(*inst->fmt_src), GFP_KERNEL);
@@ -53,6 +55,11 @@ void iris_vdec_inst_init(struct iris_inst *inst)
 	inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
 	inst->buffers[BUF_OUTPUT].actual_count = inst->buffers[BUF_OUTPUT].min_count;
 	inst->buffers[BUF_OUTPUT].size = f->fmt.pix_mp.plane_fmt[0].sizeimage;
+
+	memcpy(&inst->fw_caps[0], &core->inst_fw_caps[0],
+	       INST_FW_CAP_MAX * sizeof(struct platform_inst_fw_cap));
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
index 3a138172e674..820d98da3190 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -23,12 +23,14 @@
 static void iris_v4l2_fh_init(struct iris_inst *inst)
 {
 	v4l2_fh_init(&inst->fh, inst->core->vdev_dec);
+	inst->fh.ctrl_handler = &inst->ctrl_handler;
 	v4l2_fh_add(&inst->fh);
 }
 
 static void iris_v4l2_fh_deinit(struct iris_inst *inst)
 {
 	v4l2_fh_del(&inst->fh);
+	inst->fh.ctrl_handler = NULL;
 	v4l2_fh_exit(&inst->fh);
 }
 
@@ -162,7 +164,9 @@ int iris_open(struct file *filp)
 		goto fail_m2m_release;
 	}
 
-	iris_vdec_inst_init(inst);
+	ret = iris_vdec_inst_init(inst);
+	if (ret)
+		goto fail_m2m_ctx_release;
 
 	iris_add_session(inst);
 
@@ -171,6 +175,8 @@ int iris_open(struct file *filp)
 
 	return 0;
 
+fail_m2m_ctx_release:
+	v4l2_m2m_ctx_release(inst->m2m_ctx);
 fail_m2m_release:
 	v4l2_m2m_release(inst->m2m_dev);
 fail_v4l2_fh_deinit:
@@ -202,6 +208,7 @@ int iris_close(struct file *filp)
 {
 	struct iris_inst *inst = iris_get_inst(filp, NULL);
 
+	v4l2_ctrl_handler_free(&inst->ctrl_handler);
 	v4l2_m2m_ctx_release(inst->m2m_ctx);
 	v4l2_m2m_release(inst->m2m_dev);
 	mutex_lock(&inst->lock);

-- 
2.34.1


