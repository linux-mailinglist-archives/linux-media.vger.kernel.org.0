Return-Path: <linux-media+bounces-36786-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CB2AF8AB8
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 10:09:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99E8B1672F1
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 08:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E6342EE61F;
	Fri,  4 Jul 2025 07:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JCMPBlmh"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E212E3AF5;
	Fri,  4 Jul 2025 07:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615690; cv=none; b=Fo6lXDhEUN9Ee27u5SBlrSCgiGai/o1BZ8HXIw1L9zE/4Goyk42G71I8DfsUCpDYRn7bjNpc+MUrRWTZvQkS3hHfvzT13L/w81NEfQ7d1R7H4gSAtaVkWxbGj4ht3d5LsSUnFoUZgrTImfAr7vxxzQsfCfIQ9AGYvHA64pIawbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615690; c=relaxed/simple;
	bh=H0emGSZvjZHGbi9LkzzLhpyLbUUdc4Bu8+NIUu88Frw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=XGh9WA/+YIzkjoyl4RVExnoPknS9eVZ6cf/XdHIJbU4/w8f65+AkLwSS213D1M0ozr6yDv/yw3fSiv7WFL5jYJxwBPg2H+kyQw27T+8QkvSuM/56SIYbG7kG7zMStlYBhUWWDW733KSBFTwOz2S5JE0D3dJ5an0Yf/eLLm1TKcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JCMPBlmh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56475TCl032109;
	Fri, 4 Jul 2025 07:54:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SIlHwq49NAxgIA37IWUJst1zjKLstnkvXg1Yaf2ZUug=; b=JCMPBlmhojPktjbY
	3b7frQNRZAXsGekT9nYTXAR+E6jE/xcOXAiDAtqIhO2mKHNUahnLzMkLOHFoGL7/
	/OfxFKCKpty6pP4AypXEaNR3h0M+h6A+Tww4BP13t5hkszTsCG+Althys0/u1UCX
	2xwzGv0LOtxOZRDPjW3DG/HG7D2Vvf/heUJYANtHVqjsSkvhEaDGKNG68tyB6rh7
	uxXgQbXFbGChoYSTKhw8IwxHeOa1na4EkDEpR3txrMCKJxgm8MQeqejQ8cd6eD46
	yYtMIonbqk0rVTdsNWLH+EHJhcSKZoX35CPD2t13j4FXrDHEs4M9dNkkmC+wKjUJ
	nTsTlw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63kka4v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 07:54:35 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5647sYpA025952
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Jul 2025 07:54:34 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 4 Jul 2025 00:54:31 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 4 Jul 2025 13:23:21 +0530
Subject: [PATCH 21/25] media: iris: Add V4L2 streaming support for encoder
 video device
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250704-iris-video-encoder-v1-21-b6ce24e273cf@quicinc.com>
References: <20250704-iris-video-encoder-v1-0-b6ce24e273cf@quicinc.com>
In-Reply-To: <20250704-iris-video-encoder-v1-0-b6ce24e273cf@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        "Vedang
 Nagar" <quic_vnagar@quicinc.com>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751615599; l=71251;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=H0emGSZvjZHGbi9LkzzLhpyLbUUdc4Bu8+NIUu88Frw=;
 b=3rn9dqhr8AU2d3XRrV+Vhw8PwcqSH1X9Few7mdCUtlbDZ74qmgEd4ZXxjw++Z7+ppQoqI2gHh
 oXj4ifX8ZhLATS3vwb9wvrWCjC7mbEJ5GTwNyGTvpTyT+p4Uq5gp6n3
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=686788bb cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=6ax0HjhU0tIlWPuwGsYA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA2MCBTYWx0ZWRfXxFUndKWnCu5J
 +kDunTssZ6JW7Xlk6SYXcisRIpUS7pE4bU+6EPjaqa6NFN12qwmwFXLDJ7YXOSH/T7pzIn83jJA
 LHd5USFXTtmXXilGoRyj+LXzYmS1qC2f6bE7F+yHF92Y7u323GgTSedlGF6dIOS2iwlzSJ44vfw
 Ewr6zc9vWIwyhei+SsQFgfaFkf5lOKtWG3SmzdWIAiF8Q8kxWrnK6N4gR63Do2hMXl8+I5+tD7Y
 myZLu3VpAKFLgo2wYGz63TSz4EXYTSTJmEGfAuUrvFuc4pKhhnrOvixh2m2BvgdP3rins2zVK2t
 c3j1onAuE3tyHQuQIsX+/CMs2yzg9u30p40G6kIRH0lhmaIbR5WtUutPPpNNcpoZqU0KLO1dLHe
 3+qTL79oH1X8crYmY6xVg6tRjmUU7iNYI9/UJ/tyVWoKVdvdl6R1+kMZ+QkxpoyHy8CQJVfN
X-Proofpoint-ORIG-GUID: fcoVxni0a7vBM2v-R2RzK4QcAiblXw-B
X-Proofpoint-GUID: fcoVxni0a7vBM2v-R2RzK4QcAiblXw-B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040060

Add support for V4L2 streaming operations on the encoder video device.
During stream-on, configure mandatory properties on the respective
planes and notify the firmware to initiate an encode session.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/Makefile          |   4 +-
 drivers/media/platform/qcom/iris/iris_common.c     | 196 ++++++++++++++
 drivers/media/platform/qcom/iris/iris_common.h     |  16 ++
 drivers/media/platform/qcom/iris/iris_hfi_common.h |   2 +-
 .../platform/qcom/iris/iris_hfi_gen1_command.c     | 281 ++++++++++++++-------
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  18 ++
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 278 +++++++++++++-------
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   3 +
 .../platform/qcom/iris/iris_platform_common.h      |  20 +-
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  92 +++++--
 .../platform/qcom/iris/iris_platform_sm8250.c      |  23 +-
 drivers/media/platform/qcom/iris/iris_vb2.c        |  36 ++-
 drivers/media/platform/qcom/iris/iris_vdec.c       | 190 +-------------
 drivers/media/platform/qcom/iris/iris_vdec.h       |   1 -
 drivers/media/platform/qcom/iris/iris_venc.c       |  32 +++
 drivers/media/platform/qcom/iris/iris_venc.h       |   2 +
 drivers/media/platform/qcom/iris/iris_vidc.c       |   2 +
 17 files changed, 782 insertions(+), 414 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index ec32145e081b1fc3538dfa7d5113162a76a6068c..13270cd6d899852dded675b33d37f5919b81ccba 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -1,5 +1,5 @@
-qcom-iris-objs += \
-	     iris_buffer.o \
+qcom-iris-objs += iris_buffer.o \
+             iris_common.o \
              iris_core.o \
              iris_ctrls.o \
              iris_firmware.o \
diff --git a/drivers/media/platform/qcom/iris/iris_common.c b/drivers/media/platform/qcom/iris/iris_common.c
new file mode 100644
index 0000000000000000000000000000000000000000..d6a9271bcec77f142919070bf0566d0cf8a39562
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_common.c
@@ -0,0 +1,196 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <media/v4l2-mem2mem.h>
+
+#include "iris_common.h"
+#include "iris_ctrls.h"
+#include "iris_instance.h"
+#include "iris_power.h"
+
+int iris_process_streamon_input(struct iris_inst *inst)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	enum iris_inst_sub_state set_sub_state = 0;
+	int ret;
+
+	iris_scale_power(inst);
+
+	ret = hfi_ops->session_start(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+	if (ret)
+		return ret;
+
+	if (inst->sub_state & IRIS_INST_SUB_INPUT_PAUSE) {
+		ret = iris_inst_change_sub_state(inst, IRIS_INST_SUB_INPUT_PAUSE, 0);
+		if (ret)
+			return ret;
+	}
+
+	if (inst->domain == DECODER &&
+	    (inst->sub_state & IRIS_INST_SUB_DRC ||
+	     inst->sub_state & IRIS_INST_SUB_DRAIN ||
+	     inst->sub_state & IRIS_INST_SUB_FIRST_IPSC)) {
+		if (!(inst->sub_state & IRIS_INST_SUB_INPUT_PAUSE)) {
+			if (hfi_ops->session_pause) {
+				ret = hfi_ops->session_pause(inst,
+							     V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+				if (ret)
+					return ret;
+			}
+			set_sub_state = IRIS_INST_SUB_INPUT_PAUSE;
+		}
+	}
+
+	ret = iris_inst_state_change_streamon(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+	if (ret)
+		return ret;
+
+	inst->last_buffer_dequeued = false;
+
+	return iris_inst_change_sub_state(inst, 0, set_sub_state);
+}
+
+int iris_process_streamon_output(struct iris_inst *inst)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	bool drain_active = false, drc_active = false;
+	enum iris_inst_sub_state clear_sub_state = 0;
+	int ret = 0;
+
+	iris_scale_power(inst);
+
+	drain_active = inst->sub_state & IRIS_INST_SUB_DRAIN &&
+		inst->sub_state & IRIS_INST_SUB_DRAIN_LAST;
+
+	drc_active = inst->sub_state & IRIS_INST_SUB_DRC &&
+		inst->sub_state & IRIS_INST_SUB_DRC_LAST;
+
+	if (drc_active)
+		clear_sub_state = IRIS_INST_SUB_DRC | IRIS_INST_SUB_DRC_LAST;
+	else if (drain_active)
+		clear_sub_state = IRIS_INST_SUB_DRAIN | IRIS_INST_SUB_DRAIN_LAST;
+
+	if (inst->domain == DECODER && inst->sub_state & IRIS_INST_SUB_INPUT_PAUSE) {
+		ret = iris_alloc_and_queue_input_int_bufs(inst);
+		if (ret)
+			return ret;
+		ret = iris_set_stage(inst, STAGE);
+		if (ret)
+			return ret;
+		ret = iris_set_pipe(inst, PIPE);
+		if (ret)
+			return ret;
+	}
+
+	if (inst->state == IRIS_INST_INPUT_STREAMING &&
+	    inst->sub_state & IRIS_INST_SUB_INPUT_PAUSE) {
+		if (!drain_active)
+			ret = hfi_ops->session_resume_drc(inst,
+							  V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+		else if (hfi_ops->session_resume_drain)
+			ret = hfi_ops->session_resume_drain(inst,
+							    V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+		if (ret)
+			return ret;
+		clear_sub_state |= IRIS_INST_SUB_INPUT_PAUSE;
+	}
+
+	if (inst->sub_state & IRIS_INST_SUB_FIRST_IPSC)
+		clear_sub_state |= IRIS_INST_SUB_FIRST_IPSC;
+
+	ret = hfi_ops->session_start(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+	if (ret)
+		return ret;
+
+	if (inst->sub_state & IRIS_INST_SUB_OUTPUT_PAUSE)
+		clear_sub_state |= IRIS_INST_SUB_OUTPUT_PAUSE;
+
+	ret = iris_inst_state_change_streamon(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+	if (ret)
+		return ret;
+
+	inst->last_buffer_dequeued = false;
+
+	return iris_inst_change_sub_state(inst, clear_sub_state, 0);
+}
+
+static void iris_flush_deferred_buffers(struct iris_inst *inst,
+					enum iris_buffer_type type)
+{
+	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
+	struct v4l2_m2m_buffer *buffer, *n;
+	struct iris_buffer *buf;
+
+	if (type == BUF_INPUT) {
+		v4l2_m2m_for_each_src_buf_safe(m2m_ctx, buffer, n) {
+			buf = to_iris_buffer(&buffer->vb);
+			if (buf->attr & BUF_ATTR_DEFERRED) {
+				if (!(buf->attr & BUF_ATTR_BUFFER_DONE)) {
+					buf->attr |= BUF_ATTR_BUFFER_DONE;
+					buf->data_size = 0;
+					iris_vb2_buffer_done(inst, buf);
+				}
+			}
+		}
+	} else {
+		v4l2_m2m_for_each_dst_buf_safe(m2m_ctx, buffer, n) {
+			buf = to_iris_buffer(&buffer->vb);
+			if (buf->attr & BUF_ATTR_DEFERRED) {
+				if (!(buf->attr & BUF_ATTR_BUFFER_DONE)) {
+					buf->attr |= BUF_ATTR_BUFFER_DONE;
+					buf->data_size = 0;
+					iris_vb2_buffer_done(inst, buf);
+				}
+			}
+		}
+	}
+}
+
+static void iris_kill_session(struct iris_inst *inst)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+
+	if (!inst->session_id)
+		return;
+
+	hfi_ops->session_close(inst);
+	iris_inst_change_state(inst, IRIS_INST_ERROR);
+}
+
+int iris_session_streamoff(struct iris_inst *inst, u32 plane)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	enum iris_buffer_type buffer_type;
+	int ret;
+
+	switch (plane) {
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
+		buffer_type = BUF_INPUT;
+		break;
+	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
+		buffer_type = BUF_OUTPUT;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	ret = hfi_ops->session_stop(inst, plane);
+	if (ret)
+		goto error;
+
+	ret = iris_inst_state_change_streamoff(inst, plane);
+	if (ret)
+		goto error;
+
+	iris_flush_deferred_buffers(inst, buffer_type);
+
+	return 0;
+
+error:
+	iris_kill_session(inst);
+	iris_flush_deferred_buffers(inst, buffer_type);
+
+	return ret;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_common.h b/drivers/media/platform/qcom/iris/iris_common.h
new file mode 100644
index 0000000000000000000000000000000000000000..f385eeb53910555f17602f3951e7a6e9636a9ba2
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_common.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef __IRIS_COMMON_H__
+#define __IRIS_COMMON_H__
+
+struct iris_inst;
+struct iris_buffer;
+
+int iris_process_streamon_input(struct iris_inst *inst);
+int iris_process_streamon_output(struct iris_inst *inst);
+int iris_session_streamoff(struct iris_inst *inst, u32 plane);
+
+#endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
index 9e6aadb837830b46e4a68865583e28fc427cef0d..b51471fb32c70acee44c37f8e9dce0c6bc0b6ccc 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
@@ -102,7 +102,7 @@ enum hfi_matrix_coefficients {
 
 struct iris_hfi_prop_type_handle {
 	u32 type;
-	int (*handle)(struct iris_inst *inst);
+	int (*handle)(struct iris_inst *inst, u32 plane);
 };
 
 struct iris_hfi_command_ops {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index eae3dc5c596d1eb6090126ac391b8e0e2c9f09eb..fead3318743a09ecdc363eda4cbf252f640eb6e0 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -189,48 +189,75 @@ static int iris_hfi_gen1_session_stop(struct iris_inst *inst, u32 plane)
 	u32 flush_type = 0;
 	int ret = 0;
 
-	if (((V4L2_TYPE_IS_OUTPUT(plane) &&
-	      inst->state == IRIS_INST_INPUT_STREAMING) ||
-	    (V4L2_TYPE_IS_CAPTURE(plane) &&
-	     inst->state == IRIS_INST_OUTPUT_STREAMING) ||
-	    inst->state == IRIS_INST_ERROR) &&
-		inst->sub_state & IRIS_INST_SUB_LOAD_RESOURCES) {
-		reinit_completion(&inst->completion);
-		iris_hfi_gen1_packet_session_cmd(inst, &pkt, HFI_CMD_SESSION_STOP);
-		ret = iris_hfi_queue_cmd_write(core, &pkt, pkt.shdr.hdr.size);
-		if (!ret)
-			ret = iris_wait_for_session_response(inst, false);
-
-		reinit_completion(&inst->completion);
-		iris_hfi_gen1_packet_session_cmd(inst, &pkt, HFI_CMD_SESSION_RELEASE_RESOURCES);
-		ret = iris_hfi_queue_cmd_write(core, &pkt, pkt.shdr.hdr.size);
-		if (!ret)
-			ret = iris_wait_for_session_response(inst, false);
-
-		iris_inst_change_sub_state(inst, IRIS_INST_SUB_LOAD_RESOURCES, 0);
+	if (inst->domain == DECODER) {
+		if (((V4L2_TYPE_IS_OUTPUT(plane) &&
+		      inst->state == IRIS_INST_INPUT_STREAMING) ||
+		    (V4L2_TYPE_IS_CAPTURE(plane) &&
+		     inst->state == IRIS_INST_OUTPUT_STREAMING) ||
+		    inst->state == IRIS_INST_ERROR) &&
+			inst->sub_state & IRIS_INST_SUB_LOAD_RESOURCES) {
+			reinit_completion(&inst->completion);
+			iris_hfi_gen1_packet_session_cmd(inst, &pkt, HFI_CMD_SESSION_STOP);
+			ret = iris_hfi_queue_cmd_write(core, &pkt, pkt.shdr.hdr.size);
+			if (!ret)
+				ret = iris_wait_for_session_response(inst, false);
+
+			reinit_completion(&inst->completion);
+			iris_hfi_gen1_packet_session_cmd(inst, &pkt,
+							 HFI_CMD_SESSION_RELEASE_RESOURCES);
+			ret = iris_hfi_queue_cmd_write(core, &pkt, pkt.shdr.hdr.size);
+			if (!ret)
+				ret = iris_wait_for_session_response(inst, false);
+
+			iris_inst_change_sub_state(inst, IRIS_INST_SUB_LOAD_RESOURCES, 0);
+
+			iris_helper_buffers_done(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+						 VB2_BUF_STATE_ERROR);
+			iris_helper_buffers_done(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+						 VB2_BUF_STATE_ERROR);
+		} else if (inst->state == IRIS_INST_STREAMING) {
+			if (V4L2_TYPE_IS_OUTPUT(plane))
+				flush_type = HFI_FLUSH_ALL;
+			else if (V4L2_TYPE_IS_CAPTURE(plane))
+				flush_type = HFI_FLUSH_OUTPUT;
+
+			reinit_completion(&inst->flush_completion);
+
+			flush_pkt.shdr.hdr.size = sizeof(struct hfi_session_flush_pkt);
+			flush_pkt.shdr.hdr.pkt_type = HFI_CMD_SESSION_FLUSH;
+			flush_pkt.shdr.session_id = inst->session_id;
+			flush_pkt.flush_type = flush_type;
+
+			ret = iris_hfi_queue_cmd_write(core, &flush_pkt, flush_pkt.shdr.hdr.size);
+			if (!ret) {
+				inst->flush_responses_pending++;
+				ret = iris_wait_for_session_response(inst, true);
+			}
+		}
+	} else {
+		if (inst->state == IRIS_INST_STREAMING ||
+		    inst->state == IRIS_INST_INPUT_STREAMING ||
+		    inst->state == IRIS_INST_ERROR) {
+			reinit_completion(&inst->completion);
+			iris_hfi_gen1_packet_session_cmd(inst, &pkt, HFI_CMD_SESSION_STOP);
+			ret = iris_hfi_queue_cmd_write(core, &pkt, pkt.shdr.hdr.size);
+			if (!ret)
+				ret = iris_wait_for_session_response(inst, false);
+
+			reinit_completion(&inst->completion);
+			iris_hfi_gen1_packet_session_cmd(inst, &pkt,
+							 HFI_CMD_SESSION_RELEASE_RESOURCES);
+			ret = iris_hfi_queue_cmd_write(core, &pkt, pkt.shdr.hdr.size);
+			if (!ret)
+				ret = iris_wait_for_session_response(inst, false);
+
+			iris_inst_change_sub_state(inst, IRIS_INST_SUB_LOAD_RESOURCES, 0);
+		}
 
 		iris_helper_buffers_done(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
 					 VB2_BUF_STATE_ERROR);
 		iris_helper_buffers_done(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
 					 VB2_BUF_STATE_ERROR);
-	} else if (inst->state == IRIS_INST_STREAMING) {
-		if (V4L2_TYPE_IS_OUTPUT(plane))
-			flush_type = HFI_FLUSH_ALL;
-		else if (V4L2_TYPE_IS_CAPTURE(plane))
-			flush_type = HFI_FLUSH_OUTPUT;
-
-		reinit_completion(&inst->flush_completion);
-
-		flush_pkt.shdr.hdr.size = sizeof(struct hfi_session_flush_pkt);
-		flush_pkt.shdr.hdr.pkt_type = HFI_CMD_SESSION_FLUSH;
-		flush_pkt.shdr.session_id = inst->session_id;
-		flush_pkt.flush_type = flush_type;
-
-		ret = iris_hfi_queue_cmd_write(core, &flush_pkt, flush_pkt.shdr.hdr.size);
-		if (!ret) {
-			inst->flush_responses_pending++;
-			ret = iris_wait_for_session_response(inst, true);
-		}
 	}
 
 	return ret;
@@ -554,7 +581,7 @@ static int iris_hfi_gen1_session_set_property(struct iris_inst *inst, u32 packet
 	return hfi_gen1_set_property(inst, packet_type, payload, payload_size);
 }
 
-static int iris_hfi_gen1_set_resolution(struct iris_inst *inst)
+static int iris_hfi_gen1_set_resolution(struct iris_inst *inst, u32 plane)
 {
 	u32 ptype = HFI_PROPERTY_PARAM_FRAME_SIZE;
 	struct hfi_framesize fs;
@@ -569,14 +596,18 @@ static int iris_hfi_gen1_set_resolution(struct iris_inst *inst)
 		if (ret)
 			return ret;
 	}
-	fs.buffer_type = HFI_BUFFER_OUTPUT2;
+	if (inst->domain == DECODER)
+		fs.buffer_type = HFI_BUFFER_OUTPUT2;
+	else
+		fs.buffer_type = HFI_BUFFER_OUTPUT;
+
 	fs.width = inst->fmt_dst->fmt.pix_mp.width;
 	fs.height = inst->fmt_dst->fmt.pix_mp.height;
 
 	return hfi_gen1_set_property(inst, ptype, &fs, sizeof(fs));
 }
 
-static int iris_hfi_gen1_decide_core(struct iris_inst *inst)
+static int iris_hfi_gen1_decide_core(struct iris_inst *inst, u32 plane)
 {
 	const u32 ptype = HFI_PROPERTY_CONFIG_VIDEOCORES_USAGE;
 	struct hfi_videocores_usage_type cu;
@@ -586,36 +617,45 @@ static int iris_hfi_gen1_decide_core(struct iris_inst *inst)
 	return hfi_gen1_set_property(inst, ptype, &cu, sizeof(cu));
 }
 
-static int iris_hfi_gen1_set_raw_format(struct iris_inst *inst)
+static int iris_hfi_gen1_set_raw_format(struct iris_inst *inst, u32 plane)
 {
 	const u32 ptype = HFI_PROPERTY_PARAM_UNCOMPRESSED_FORMAT_SELECT;
-	u32 pixelformat = inst->fmt_dst->fmt.pix_mp.pixelformat;
 	struct hfi_uncompressed_format_select fmt;
+	u32 pixelformat;
 	int ret;
 
-	if (iris_split_mode_enabled(inst)) {
-		fmt.buffer_type = HFI_BUFFER_OUTPUT;
-		fmt.format = pixelformat == V4L2_PIX_FMT_NV12 ? HFI_COLOR_FORMAT_NV12_UBWC : 0;
+	if (inst->domain == DECODER) {
+		pixelformat = inst->fmt_dst->fmt.pix_mp.pixelformat;
+		if (iris_split_mode_enabled(inst)) {
+			fmt.buffer_type = HFI_BUFFER_OUTPUT;
+			fmt.format = pixelformat == V4L2_PIX_FMT_NV12 ?
+				HFI_COLOR_FORMAT_NV12_UBWC : 0;
 
-		ret = hfi_gen1_set_property(inst, ptype, &fmt, sizeof(fmt));
-		if (ret)
-			return ret;
+			ret = hfi_gen1_set_property(inst, ptype, &fmt, sizeof(fmt));
+			if (ret)
+				return ret;
 
-		fmt.buffer_type = HFI_BUFFER_OUTPUT2;
-		fmt.format = pixelformat == V4L2_PIX_FMT_NV12 ? HFI_COLOR_FORMAT_NV12 : 0;
+			fmt.buffer_type = HFI_BUFFER_OUTPUT2;
+			fmt.format = pixelformat == V4L2_PIX_FMT_NV12 ? HFI_COLOR_FORMAT_NV12 : 0;
 
-		ret = hfi_gen1_set_property(inst, ptype, &fmt, sizeof(fmt));
+			ret = hfi_gen1_set_property(inst, ptype, &fmt, sizeof(fmt));
+		} else {
+			fmt.buffer_type = HFI_BUFFER_OUTPUT;
+			fmt.format = pixelformat == V4L2_PIX_FMT_NV12 ? HFI_COLOR_FORMAT_NV12 : 0;
+
+			ret = hfi_gen1_set_property(inst, ptype, &fmt, sizeof(fmt));
+		}
 	} else {
-		fmt.buffer_type = HFI_BUFFER_OUTPUT;
+		pixelformat = inst->fmt_src->fmt.pix_mp.pixelformat;
+		fmt.buffer_type = HFI_BUFFER_INPUT;
 		fmt.format = pixelformat == V4L2_PIX_FMT_NV12 ? HFI_COLOR_FORMAT_NV12 : 0;
-
 		ret = hfi_gen1_set_property(inst, ptype, &fmt, sizeof(fmt));
 	}
 
 	return ret;
 }
 
-static int iris_hfi_gen1_set_format_constraints(struct iris_inst *inst)
+static int iris_hfi_gen1_set_format_constraints(struct iris_inst *inst, u32 plane)
 {
 	const u32 ptype = HFI_PROPERTY_PARAM_UNCOMPRESSED_PLANE_ACTUAL_CONSTRAINTS_INFO;
 	struct hfi_uncompressed_plane_actual_constraints_info pconstraint;
@@ -635,7 +675,7 @@ static int iris_hfi_gen1_set_format_constraints(struct iris_inst *inst)
 	return hfi_gen1_set_property(inst, ptype, &pconstraint, sizeof(pconstraint));
 }
 
-static int iris_hfi_gen1_set_num_bufs(struct iris_inst *inst)
+static int iris_hfi_gen1_set_num_bufs(struct iris_inst *inst, u32 plane)
 {
 	u32 ptype = HFI_PROPERTY_PARAM_BUFFER_COUNT_ACTUAL;
 	struct hfi_buffer_count_actual buf_count;
@@ -649,20 +689,28 @@ static int iris_hfi_gen1_set_num_bufs(struct iris_inst *inst)
 	if (ret)
 		return ret;
 
-	if (iris_split_mode_enabled(inst)) {
-		buf_count.type = HFI_BUFFER_OUTPUT;
-		buf_count.count_actual = VIDEO_MAX_FRAME;
-		buf_count.count_min_host = VIDEO_MAX_FRAME;
+	if (inst->domain == DECODER) {
+		if (iris_split_mode_enabled(inst)) {
+			buf_count.type = HFI_BUFFER_OUTPUT;
+			buf_count.count_actual = VIDEO_MAX_FRAME;
+			buf_count.count_min_host = VIDEO_MAX_FRAME;
 
-		ret = hfi_gen1_set_property(inst, ptype, &buf_count, sizeof(buf_count));
-		if (ret)
-			return ret;
+			ret = hfi_gen1_set_property(inst, ptype, &buf_count, sizeof(buf_count));
+			if (ret)
+				return ret;
 
-		buf_count.type = HFI_BUFFER_OUTPUT2;
-		buf_count.count_actual = iris_vpu_buf_count(inst, BUF_DPB);
-		buf_count.count_min_host = iris_vpu_buf_count(inst, BUF_DPB);
+			buf_count.type = HFI_BUFFER_OUTPUT2;
+			buf_count.count_actual = iris_vpu_buf_count(inst, BUF_DPB);
+			buf_count.count_min_host = iris_vpu_buf_count(inst, BUF_DPB);
 
-		ret = hfi_gen1_set_property(inst, ptype, &buf_count, sizeof(buf_count));
+			ret = hfi_gen1_set_property(inst, ptype, &buf_count, sizeof(buf_count));
+		} else {
+			buf_count.type = HFI_BUFFER_OUTPUT;
+			buf_count.count_actual = VIDEO_MAX_FRAME;
+			buf_count.count_min_host = VIDEO_MAX_FRAME;
+
+			ret = hfi_gen1_set_property(inst, ptype, &buf_count, sizeof(buf_count));
+		}
 	} else {
 		buf_count.type = HFI_BUFFER_OUTPUT;
 		buf_count.count_actual = VIDEO_MAX_FRAME;
@@ -674,7 +722,7 @@ static int iris_hfi_gen1_set_num_bufs(struct iris_inst *inst)
 	return ret;
 }
 
-static int iris_hfi_gen1_set_multistream(struct iris_inst *inst)
+static int iris_hfi_gen1_set_multistream(struct iris_inst *inst, u32 plane)
 {
 	u32 ptype = HFI_PROPERTY_PARAM_VDEC_MULTI_STREAM;
 	struct hfi_multi_stream multi = {0};
@@ -709,7 +757,7 @@ static int iris_hfi_gen1_set_multistream(struct iris_inst *inst)
 	return ret;
 }
 
-static int iris_hfi_gen1_set_bufsize(struct iris_inst *inst)
+static int iris_hfi_gen1_set_bufsize(struct iris_inst *inst, u32 plane)
 {
 	const u32 ptype = HFI_PROPERTY_PARAM_BUFFER_SIZE_ACTUAL;
 	struct hfi_buffer_size_actual bufsz;
@@ -744,14 +792,49 @@ static int iris_hfi_gen1_set_bufsize(struct iris_inst *inst)
 	return ret;
 }
 
+static int iris_hfi_gen1_set_frame_rate(struct iris_inst *inst, u32 plane)
+{
+	const u32 ptype = HFI_PROPERTY_CONFIG_FRAME_RATE;
+	struct hfi_framerate frate;
+
+	if (V4L2_TYPE_IS_OUTPUT(plane))
+		return 0;
+
+	frate.buffer_type = HFI_BUFFER_OUTPUT;
+	frate.framerate = inst->frame_rate;
+
+	return hfi_gen1_set_property(inst, ptype, &frate, sizeof(frate));
+}
+
+static int iris_hfi_gen1_set_stride(struct iris_inst *inst, u32 plane)
+{
+	const u32 ptype = HFI_PROPERTY_PARAM_UNCOMPRESSED_PLANE_ACTUAL_INFO;
+	struct hfi_uncompressed_plane_actual_info plane_actual_info;
+
+	plane_actual_info.buffer_type = HFI_BUFFER_INPUT;
+	plane_actual_info.num_planes = 2;
+	plane_actual_info.plane_format[0].actual_stride =
+		ALIGN(inst->fmt_src->fmt.pix_mp.width, 128);
+	plane_actual_info.plane_format[0].actual_plane_buffer_height =
+		ALIGN(inst->fmt_src->fmt.pix_mp.height, 32);
+	plane_actual_info.plane_format[1].actual_stride =
+		ALIGN(inst->fmt_src->fmt.pix_mp.width, 128);
+	plane_actual_info.plane_format[1].actual_plane_buffer_height =
+		(ALIGN(inst->fmt_src->fmt.pix_mp.height, 32)) / 2;
+
+	return hfi_gen1_set_property(inst, ptype, &plane_actual_info, sizeof(plane_actual_info));
+}
+
 static int iris_hfi_gen1_session_set_config_params(struct iris_inst *inst, u32 plane)
 {
+	struct iris_hfi_prop_type_handle const *handler = NULL;
+	u32 handler_size = 0;
 	struct iris_core *core = inst->core;
 	u32 config_params_size, i, j;
 	const u32 *config_params;
 	int ret;
 
-	static const struct iris_hfi_prop_type_handle prop_type_handle_inp_arr[] = {
+	static const struct iris_hfi_prop_type_handle vdec_prop_type_handle_inp_arr[] = {
 		{HFI_PROPERTY_PARAM_FRAME_SIZE,
 			iris_hfi_gen1_set_resolution},
 		{HFI_PROPERTY_CONFIG_VIDEOCORES_USAGE,
@@ -768,7 +851,7 @@ static int iris_hfi_gen1_session_set_config_params(struct iris_inst *inst, u32 p
 			iris_hfi_gen1_set_bufsize},
 	};
 
-	static const struct iris_hfi_prop_type_handle prop_type_handle_out_arr[] = {
+	static const struct iris_hfi_prop_type_handle vdec_prop_type_handle_out_arr[] = {
 		{HFI_PROPERTY_PARAM_FRAME_SIZE,
 			iris_hfi_gen1_set_resolution},
 		{HFI_PROPERTY_PARAM_UNCOMPRESSED_FORMAT_SELECT,
@@ -783,29 +866,43 @@ static int iris_hfi_gen1_session_set_config_params(struct iris_inst *inst, u32 p
 			iris_hfi_gen1_set_bufsize},
 	};
 
-	config_params = core->iris_platform_data->input_config_params_default;
-	config_params_size = core->iris_platform_data->input_config_params_default_size;
-
-	if (V4L2_TYPE_IS_OUTPUT(plane)) {
-		for (i = 0; i < config_params_size; i++) {
-			for (j = 0; j < ARRAY_SIZE(prop_type_handle_inp_arr); j++) {
-				if (prop_type_handle_inp_arr[j].type == config_params[i]) {
-					ret = prop_type_handle_inp_arr[j].handle(inst);
-					if (ret)
-						return ret;
-					break;
-				}
-			}
+	static const struct iris_hfi_prop_type_handle venc_prop_type_handle_inp_arr[] = {
+		{HFI_PROPERTY_CONFIG_FRAME_RATE,
+			iris_hfi_gen1_set_frame_rate},
+		{HFI_PROPERTY_PARAM_UNCOMPRESSED_PLANE_ACTUAL_INFO,
+			iris_hfi_gen1_set_stride},
+		{HFI_PROPERTY_PARAM_FRAME_SIZE,
+			iris_hfi_gen1_set_resolution},
+		{HFI_PROPERTY_PARAM_UNCOMPRESSED_FORMAT_SELECT,
+			iris_hfi_gen1_set_raw_format},
+		{HFI_PROPERTY_PARAM_BUFFER_COUNT_ACTUAL,
+			iris_hfi_gen1_set_num_bufs},
+	};
+
+	if (inst->domain == DECODER) {
+		config_params = core->iris_platform_data->dec_input_config_params_default;
+		config_params_size = core->iris_platform_data->dec_input_config_params_default_size;
+		if (V4L2_TYPE_IS_OUTPUT(plane)) {
+			handler = vdec_prop_type_handle_inp_arr;
+			handler_size = ARRAY_SIZE(vdec_prop_type_handle_inp_arr);
+		} else if (V4L2_TYPE_IS_CAPTURE(plane)) {
+			handler = vdec_prop_type_handle_out_arr;
+			handler_size = ARRAY_SIZE(vdec_prop_type_handle_out_arr);
 		}
-	} else if (V4L2_TYPE_IS_CAPTURE(plane)) {
-		for (i = 0; i < config_params_size; i++) {
-			for (j = 0; j < ARRAY_SIZE(prop_type_handle_out_arr); j++) {
-				if (prop_type_handle_out_arr[j].type == config_params[i]) {
-					ret = prop_type_handle_out_arr[j].handle(inst);
-					if (ret)
-						return ret;
-					break;
-				}
+	} else {
+		config_params = core->iris_platform_data->enc_input_config_params;
+		config_params_size = core->iris_platform_data->enc_input_config_params_size;
+		handler = venc_prop_type_handle_inp_arr;
+		handler_size = ARRAY_SIZE(venc_prop_type_handle_inp_arr);
+	}
+
+	for (i = 0; i < config_params_size; i++) {
+		for (j = 0; j < handler_size; j++) {
+			if (handler[j].type == config_params[i]) {
+				ret = handler[j].handle(inst, plane);
+				if (ret)
+					return ret;
+				break;
 			}
 		}
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index f6e2db401daeee12106a07af62179ce0d1504c5c..dd6521bc2dfeab652ded11698a88a9f850f01695 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -82,10 +82,12 @@
 #define HFI_PROPERTY_SYS_IMAGE_VERSION			0x6
 
 #define HFI_PROPERTY_PARAM_FRAME_SIZE			0x1001
+#define HFI_PROPERTY_PARAM_UNCOMPRESSED_PLANE_ACTUAL_INFO	0x1002
 #define HFI_PROPERTY_PARAM_UNCOMPRESSED_FORMAT_SELECT	0x1003
 #define HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT	0x1005
 #define HFI_PROPERTY_PARAM_WORK_MODE			0x1015
 #define HFI_PROPERTY_PARAM_WORK_ROUTE			0x1017
+#define HFI_PROPERTY_CONFIG_FRAME_RATE			0x2001
 #define HFI_PROPERTY_CONFIG_VIDEOCORES_USAGE		0x2002
 
 #define HFI_PROPERTY_PARAM_VDEC_MULTI_STREAM		0x1003001
@@ -349,6 +351,17 @@ struct hfi_uncompressed_plane_actual_constraints_info {
 	struct hfi_uncompressed_plane_constraints plane_format[2];
 };
 
+struct hfi_uncompressed_plane_actual {
+	int actual_stride;
+	u32 actual_plane_buffer_height;
+};
+
+struct hfi_uncompressed_plane_actual_info {
+	u32 buffer_type;
+	u32 num_planes;
+	struct hfi_uncompressed_plane_actual plane_format[2];
+};
+
 struct hfi_buffer_count_actual {
 	u32 type;
 	u32 count_actual;
@@ -376,6 +389,11 @@ struct hfi_buffer_requirements {
 	u32 alignment;
 };
 
+struct hfi_framerate {
+	u32 buffer_type;
+	u32 framerate;
+};
+
 struct hfi_event_data {
 	u32 error;
 	u32 height;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 7ca5ae13d62b95fdcf71ef70cb6abf446b2c6e5a..4cdceca3f8a05a6ec9ad76e7cbaa138daba0e958 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -88,15 +88,26 @@ static int iris_hfi_gen2_sys_pc_prep(struct iris_core *core)
 	return ret;
 }
 
-static u32 iris_hfi_gen2_get_port(u32 plane)
+static u32 iris_hfi_gen2_get_port(struct iris_inst *inst, u32 plane)
 {
-	switch (plane) {
-	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
-		return HFI_PORT_BITSTREAM;
-	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
-		return HFI_PORT_RAW;
-	default:
-		return HFI_PORT_NONE;
+	if (inst->domain == DECODER) {
+		switch (plane) {
+		case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
+			return HFI_PORT_BITSTREAM;
+		case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
+			return HFI_PORT_RAW;
+		default:
+			return HFI_PORT_NONE;
+		}
+	} else {
+		switch (plane) {
+		case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
+			return HFI_PORT_RAW;
+		case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
+			return HFI_PORT_BITSTREAM;
+		default:
+			return HFI_PORT_NONE;
+		}
 	}
 }
 
@@ -136,34 +147,76 @@ static int iris_hfi_gen2_session_set_property(struct iris_inst *inst, u32 packet
 					inst_hfi_gen2->packet->size);
 }
 
-static int iris_hfi_gen2_set_bitstream_resolution(struct iris_inst *inst)
+static int iris_hfi_gen2_set_raw_resolution(struct iris_inst *inst, u32 plane)
 {
-	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
-	u32 port = iris_hfi_gen2_get_port(V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
 	u32 resolution = inst->fmt_src->fmt.pix_mp.width << 16 |
 		inst->fmt_src->fmt.pix_mp.height;
+	u32 port = iris_hfi_gen2_get_port(inst, plane);
 
-	inst_hfi_gen2->src_subcr_params.bitstream_resolution = resolution;
+	return iris_hfi_gen2_session_set_property(inst,
+						  HFI_PROP_RAW_RESOLUTION,
+						  HFI_HOST_FLAGS_NONE,
+						  port,
+						  HFI_PAYLOAD_32_PACKED,
+						  &resolution,
+						  sizeof(u32));
+}
+
+static int iris_hfi_gen2_set_bitstream_resolution(struct iris_inst *inst, u32 plane)
+{
+	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
+	u32 port = iris_hfi_gen2_get_port(inst, plane);
+	enum hfi_packet_payload_info payload_type;
+	u32 resolution;
+
+	if (inst->domain == DECODER) {
+		resolution = inst->fmt_src->fmt.pix_mp.width << 16 |
+			inst->fmt_src->fmt.pix_mp.height;
+		inst_hfi_gen2->src_subcr_params.bitstream_resolution = resolution;
+		payload_type = HFI_PAYLOAD_U32;
+	} else {
+		resolution = inst->fmt_dst->fmt.pix_mp.width << 16 |
+			inst->fmt_dst->fmt.pix_mp.height;
+		inst_hfi_gen2->dst_subcr_params.bitstream_resolution = resolution;
+		payload_type = HFI_PAYLOAD_32_PACKED;
+	}
 
 	return iris_hfi_gen2_session_set_property(inst,
 						  HFI_PROP_BITSTREAM_RESOLUTION,
 						  HFI_HOST_FLAGS_NONE,
 						  port,
-						  HFI_PAYLOAD_U32,
+						  payload_type,
 						  &resolution,
 						  sizeof(u32));
 }
 
-static int iris_hfi_gen2_set_crop_offsets(struct iris_inst *inst)
+static int iris_hfi_gen2_set_crop_offsets(struct iris_inst *inst, u32 plane)
 {
-	u32 bottom_offset = (inst->fmt_src->fmt.pix_mp.height - inst->crop.height);
-	u32 right_offset = (inst->fmt_src->fmt.pix_mp.width - inst->crop.width);
 	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
-	u32 port = iris_hfi_gen2_get_port(V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
-	u32 left_offset = inst->crop.left;
-	u32 top_offset = inst->crop.top;
+	u32 port = iris_hfi_gen2_get_port(inst, plane);
+	u32 bottom_offset, right_offset;
+	u32 left_offset, top_offset;
 	u32 payload[2];
 
+	if (inst->domain == DECODER) {
+		if (V4L2_TYPE_IS_OUTPUT(plane)) {
+			bottom_offset = (inst->fmt_src->fmt.pix_mp.height - inst->crop.height);
+			right_offset = (inst->fmt_src->fmt.pix_mp.width - inst->crop.width);
+			left_offset = inst->crop.left;
+			top_offset = inst->crop.top;
+		} else {
+			bottom_offset = (inst->fmt_dst->fmt.pix_mp.height - inst->compose.height);
+			right_offset = (inst->fmt_dst->fmt.pix_mp.width - inst->compose.width);
+			left_offset = inst->compose.left;
+			top_offset = inst->compose.top;
+		}
+	} else {
+		bottom_offset = (inst->fmt_src->fmt.pix_mp.height - inst->crop.height);
+		right_offset = (inst->fmt_src->fmt.pix_mp.width - inst->crop.width);
+		left_offset = inst->crop.left;
+		top_offset = inst->crop.top;
+	}
+
 	payload[0] = FIELD_PREP(GENMASK(31, 16), left_offset) | top_offset;
 	payload[1] = FIELD_PREP(GENMASK(31, 16), right_offset) | bottom_offset;
 	inst_hfi_gen2->src_subcr_params.crop_offsets[0] = payload[0];
@@ -178,10 +231,10 @@ static int iris_hfi_gen2_set_crop_offsets(struct iris_inst *inst)
 						  sizeof(u64));
 }
 
-static int iris_hfi_gen2_set_bit_depth(struct iris_inst *inst)
+static int iris_hfi_gen2_set_bit_depth(struct iris_inst *inst, u32 plane)
 {
 	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
-	u32 port = iris_hfi_gen2_get_port(V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+	u32 port = iris_hfi_gen2_get_port(inst, plane);
 	u32 bitdepth = BIT_DEPTH_8;
 
 	inst_hfi_gen2->src_subcr_params.bit_depth = bitdepth;
@@ -195,10 +248,10 @@ static int iris_hfi_gen2_set_bit_depth(struct iris_inst *inst)
 						  sizeof(u32));
 }
 
-static int iris_hfi_gen2_set_coded_frames(struct iris_inst *inst)
+static int iris_hfi_gen2_set_coded_frames(struct iris_inst *inst, u32 plane)
 {
 	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
-	u32 port = iris_hfi_gen2_get_port(V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+	u32 port = iris_hfi_gen2_get_port(inst, plane);
 	u32 coded_frames = 0;
 
 	if (inst->fw_caps[CODED_FRAMES].value == CODED_FRAMES_PROGRESSIVE)
@@ -214,11 +267,11 @@ static int iris_hfi_gen2_set_coded_frames(struct iris_inst *inst)
 						  sizeof(u32));
 }
 
-static int iris_hfi_gen2_set_min_output_count(struct iris_inst *inst)
+static int iris_hfi_gen2_set_min_output_count(struct iris_inst *inst, u32 plane)
 {
 	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
-	u32 port = iris_hfi_gen2_get_port(V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
 	u32 min_output = inst->buffers[BUF_OUTPUT].min_count;
+	u32 port = iris_hfi_gen2_get_port(inst, plane);
 
 	inst_hfi_gen2->src_subcr_params.fw_min_count = min_output;
 
@@ -231,10 +284,10 @@ static int iris_hfi_gen2_set_min_output_count(struct iris_inst *inst)
 						  sizeof(u32));
 }
 
-static int iris_hfi_gen2_set_picture_order_count(struct iris_inst *inst)
+static int iris_hfi_gen2_set_picture_order_count(struct iris_inst *inst, u32 plane)
 {
 	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
-	u32 port = iris_hfi_gen2_get_port(V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+	u32 port = iris_hfi_gen2_get_port(inst, plane);
 	u32 poc = 0;
 
 	inst_hfi_gen2->src_subcr_params.pic_order_cnt = poc;
@@ -248,16 +301,16 @@ static int iris_hfi_gen2_set_picture_order_count(struct iris_inst *inst)
 						  sizeof(u32));
 }
 
-static int iris_hfi_gen2_set_colorspace(struct iris_inst *inst)
+static int iris_hfi_gen2_set_colorspace(struct iris_inst *inst, u32 plane)
 {
 	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
-	u32 port = iris_hfi_gen2_get_port(V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
 	struct v4l2_pix_format_mplane *pixmp = &inst->fmt_src->fmt.pix_mp;
 	u32 video_signal_type_present_flag = 0, color_info;
 	u32 matrix_coeff = HFI_MATRIX_COEFF_RESERVED;
 	u32 video_format = UNSPECIFIED_COLOR_FORMAT;
 	u32 full_range = V4L2_QUANTIZATION_DEFAULT;
 	u32 transfer_char = HFI_TRANSFER_RESERVED;
+	u32 port = iris_hfi_gen2_get_port(inst, plane);
 	u32 colour_description_present_flag = 0;
 	u32 primaries = HFI_PRIMARIES_RESERVED;
 
@@ -291,10 +344,10 @@ static int iris_hfi_gen2_set_colorspace(struct iris_inst *inst)
 						  sizeof(u32));
 }
 
-static int iris_hfi_gen2_set_profile(struct iris_inst *inst)
+static int iris_hfi_gen2_set_profile(struct iris_inst *inst, u32 plane)
 {
 	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
-	u32 port = iris_hfi_gen2_get_port(V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+	u32 port = iris_hfi_gen2_get_port(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
 	u32 profile = 0;
 
 	switch (inst->codec) {
@@ -320,10 +373,10 @@ static int iris_hfi_gen2_set_profile(struct iris_inst *inst)
 						  sizeof(u32));
 }
 
-static int iris_hfi_gen2_set_level(struct iris_inst *inst)
+static int iris_hfi_gen2_set_level(struct iris_inst *inst, u32 plane)
 {
 	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
-	u32 port = iris_hfi_gen2_get_port(V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+	u32 port = iris_hfi_gen2_get_port(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
 	u32 level = 0;
 
 	switch (inst->codec) {
@@ -349,33 +402,47 @@ static int iris_hfi_gen2_set_level(struct iris_inst *inst)
 						  sizeof(u32));
 }
 
-static int iris_hfi_gen2_set_colorformat(struct iris_inst *inst)
+static int iris_hfi_gen2_set_colorformat(struct iris_inst *inst, u32 plane)
 {
-	u32 port = iris_hfi_gen2_get_port(V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+	u32 port = iris_hfi_gen2_get_port(inst, plane);
 	u32 hfi_colorformat, pixelformat;
 
-	pixelformat = inst->fmt_dst->fmt.pix_mp.pixelformat;
-	hfi_colorformat = pixelformat == V4L2_PIX_FMT_NV12 ? HFI_COLOR_FMT_NV12 : 0;
+	if (inst->domain == DECODER) {
+		pixelformat = inst->fmt_dst->fmt.pix_mp.pixelformat;
+		hfi_colorformat = pixelformat == V4L2_PIX_FMT_NV12 ? HFI_COLOR_FMT_NV12 : 0;
+	} else {
+		pixelformat = inst->fmt_src->fmt.pix_mp.pixelformat;
+		hfi_colorformat = pixelformat == V4L2_PIX_FMT_NV12 ? HFI_COLOR_FMT_NV12 : 0;
+	}
 
 	return iris_hfi_gen2_session_set_property(inst,
 						  HFI_PROP_COLOR_FORMAT,
 						  HFI_HOST_FLAGS_NONE,
 						  port,
-						  HFI_PAYLOAD_U32,
+						  HFI_PAYLOAD_U32_ENUM,
 						  &hfi_colorformat,
 						  sizeof(u32));
 }
 
-static int iris_hfi_gen2_set_linear_stride_scanline(struct iris_inst *inst)
+static int iris_hfi_gen2_set_linear_stride_scanline(struct iris_inst *inst, u32 plane)
 {
-	u32 port = iris_hfi_gen2_get_port(V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
-	u32 pixelformat = inst->fmt_dst->fmt.pix_mp.pixelformat;
-	u32 scanline_y = inst->fmt_dst->fmt.pix_mp.height;
-	u32 stride_y = inst->fmt_dst->fmt.pix_mp.width;
-	u32 scanline_uv = scanline_y / 2;
-	u32 stride_uv = stride_y;
+	u32 pixelformat, stride_y, stride_uv, scanline_y, scanline_uv;
+	u32 port = iris_hfi_gen2_get_port(inst, plane);
 	u32 payload[2];
 
+	if (inst->domain == DECODER) {
+		pixelformat = inst->fmt_dst->fmt.pix_mp.pixelformat;
+		stride_y = inst->fmt_dst->fmt.pix_mp.width;
+		scanline_y = inst->fmt_dst->fmt.pix_mp.height;
+	} else {
+		pixelformat = inst->fmt_src->fmt.pix_mp.pixelformat;
+		stride_y = ALIGN(inst->fmt_src->fmt.pix_mp.width, 128);
+		scanline_y = ALIGN(inst->fmt_src->fmt.pix_mp.height, 32);
+	}
+
+	stride_uv = stride_y;
+	scanline_uv = scanline_y / 2;
+
 	if (pixelformat != V4L2_PIX_FMT_NV12)
 		return 0;
 
@@ -386,15 +453,15 @@ static int iris_hfi_gen2_set_linear_stride_scanline(struct iris_inst *inst)
 						  HFI_PROP_LINEAR_STRIDE_SCANLINE,
 						  HFI_HOST_FLAGS_NONE,
 						  port,
-						  HFI_PAYLOAD_U64,
+						  HFI_PAYLOAD_64_PACKED,
 						  &payload,
 						  sizeof(u64));
 }
 
-static int iris_hfi_gen2_set_tier(struct iris_inst *inst)
+static int iris_hfi_gen2_set_tier(struct iris_inst *inst, u32 plane)
 {
 	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
-	u32 port = iris_hfi_gen2_get_port(V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+	u32 port = iris_hfi_gen2_get_port(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
 	u32 tier = inst->fw_caps[TIER].value;
 
 	inst_hfi_gen2->src_subcr_params.tier = tier;
@@ -408,14 +475,28 @@ static int iris_hfi_gen2_set_tier(struct iris_inst *inst)
 						  sizeof(u32));
 }
 
+static int iris_hfi_gen2_set_frame_rate(struct iris_inst *inst, u32 plane)
+{
+	u32 port = iris_hfi_gen2_get_port(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+
+	return iris_hfi_gen2_session_set_property(inst,
+						  HFI_PROP_FRAME_RATE,
+						  HFI_HOST_FLAGS_NONE,
+						  port,
+						  HFI_PAYLOAD_Q16,
+						  &inst->frame_rate,
+						  sizeof(u32));
+}
+
 static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 plane)
 {
-	struct iris_core *core = inst->core;
+	const struct iris_platform_data *pdata = inst->core->iris_platform_data;
 	u32 config_params_size = 0, i, j;
 	const u32 *config_params = NULL;
 	int ret;
 
 	static const struct iris_hfi_prop_type_handle prop_type_handle_arr[] = {
+		{HFI_PROP_RAW_RESOLUTION,             iris_hfi_gen2_set_raw_resolution         },
 		{HFI_PROP_BITSTREAM_RESOLUTION,       iris_hfi_gen2_set_bitstream_resolution   },
 		{HFI_PROP_CROP_OFFSETS,               iris_hfi_gen2_set_crop_offsets           },
 		{HFI_PROP_CODED_FRAMES,               iris_hfi_gen2_set_coded_frames           },
@@ -428,29 +509,35 @@ static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 p
 		{HFI_PROP_COLOR_FORMAT,               iris_hfi_gen2_set_colorformat            },
 		{HFI_PROP_LINEAR_STRIDE_SCANLINE,     iris_hfi_gen2_set_linear_stride_scanline },
 		{HFI_PROP_TIER,                       iris_hfi_gen2_set_tier                   },
+		{HFI_PROP_FRAME_RATE,                 iris_hfi_gen2_set_frame_rate             },
 	};
 
-	if (V4L2_TYPE_IS_OUTPUT(plane)) {
-		switch (inst->codec) {
-		case V4L2_PIX_FMT_H264:
-			config_params = core->iris_platform_data->input_config_params_default;
-			config_params_size =
-				core->iris_platform_data->input_config_params_default_size;
-			break;
-		case V4L2_PIX_FMT_HEVC:
-			config_params = core->iris_platform_data->input_config_params_hevc;
-			config_params_size =
-				core->iris_platform_data->input_config_params_hevc_size;
-			break;
-		case V4L2_PIX_FMT_VP9:
-			config_params = core->iris_platform_data->input_config_params_vp9;
-			config_params_size =
-				core->iris_platform_data->input_config_params_vp9_size;
-			break;
+	if (inst->domain == DECODER) {
+		if (V4L2_TYPE_IS_OUTPUT(plane)) {
+			if (inst->codec == V4L2_PIX_FMT_H264) {
+				config_params = pdata->dec_input_config_params_default;
+				config_params_size = pdata->dec_input_config_params_default_size;
+			} else if (inst->codec == V4L2_PIX_FMT_HEVC) {
+				config_params = pdata->dec_input_config_params_hevc;
+				config_params_size = pdata->dec_input_config_params_hevc_size;
+			} else if (inst->codec == V4L2_PIX_FMT_VP9) {
+				config_params = pdata->dec_input_config_params_vp9;
+				config_params_size = pdata->dec_input_config_params_vp9_size;
+			} else {
+				return -EINVAL;
+			}
+		} else {
+			config_params = pdata->dec_output_config_params;
+			config_params_size = pdata->dec_output_config_params_size;
 		}
 	} else {
-		config_params = core->iris_platform_data->output_config_params;
-		config_params_size = core->iris_platform_data->output_config_params_size;
+		if (V4L2_TYPE_IS_OUTPUT(plane)) {
+			config_params = pdata->enc_input_config_params;
+			config_params_size = pdata->enc_input_config_params_size;
+		} else {
+			config_params = pdata->enc_output_config_params;
+			config_params_size = pdata->enc_output_config_params_size;
+		}
 	}
 
 	if (!config_params || !config_params_size)
@@ -459,7 +546,7 @@ static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 p
 	for (i = 0; i < config_params_size; i++) {
 		for (j = 0; j < ARRAY_SIZE(prop_type_handle_arr); j++) {
 			if (prop_type_handle_arr[j].type == config_params[i]) {
-				ret = prop_type_handle_arr[j].handle(inst);
+				ret = prop_type_handle_arr[j].handle(inst, plane);
 				if (ret)
 					return ret;
 				break;
@@ -477,14 +564,19 @@ static int iris_hfi_gen2_session_set_codec(struct iris_inst *inst)
 
 	switch (inst->codec) {
 	case V4L2_PIX_FMT_H264:
-		codec = HFI_CODEC_DECODE_AVC;
+		if (inst->domain == ENCODER)
+			codec = HFI_CODEC_ENCODE_AVC;
+		else
+			codec = HFI_CODEC_DECODE_AVC;
 		break;
 	case V4L2_PIX_FMT_HEVC:
-		codec = HFI_CODEC_DECODE_HEVC;
+		if (inst->domain == ENCODER)
+			codec = HFI_CODEC_ENCODE_HEVC;
+		else
+			codec = HFI_CODEC_DECODE_HEVC;
 		break;
 	case V4L2_PIX_FMT_VP9:
 		codec = HFI_CODEC_DECODE_VP9;
-		break;
 	}
 
 	iris_hfi_gen2_packet_session_property(inst,
@@ -550,9 +642,11 @@ static int iris_hfi_gen2_session_open(struct iris_inst *inst)
 	if (ret)
 		goto fail_free_packet;
 
-	ret = iris_hfi_gen2_session_set_default_header(inst);
-	if (ret)
-		goto fail_free_packet;
+	if (inst->domain == DECODER) {
+		ret = iris_hfi_gen2_session_set_default_header(inst);
+		if (ret)
+			goto fail_free_packet;
+	}
 
 	return 0;
 
@@ -601,7 +695,7 @@ static int iris_hfi_gen2_session_subscribe_mode(struct iris_inst *inst,
 					     cmd,
 					     (HFI_HOST_FLAGS_RESPONSE_REQUIRED |
 					     HFI_HOST_FLAGS_INTR_REQUIRED),
-					     iris_hfi_gen2_get_port(plane),
+					     iris_hfi_gen2_get_port(inst, plane),
 					     inst->session_id,
 					     payload_type,
 					     payload,
@@ -623,6 +717,9 @@ static int iris_hfi_gen2_subscribe_change_param(struct iris_inst *inst, u32 plan
 	u32 hfi_port = 0, i;
 	int ret;
 
+	if (inst->domain == ENCODER)
+		return 0;
+
 	if ((V4L2_TYPE_IS_OUTPUT(plane) && inst_hfi_gen2->ipsc_properties_set) ||
 	    (V4L2_TYPE_IS_CAPTURE(plane) && inst_hfi_gen2->opsc_properties_set)) {
 		dev_err(core->dev, "invalid plane\n");
@@ -631,19 +728,19 @@ static int iris_hfi_gen2_subscribe_change_param(struct iris_inst *inst, u32 plan
 
 	switch (inst->codec) {
 	case V4L2_PIX_FMT_H264:
-		change_param = core->iris_platform_data->input_config_params_default;
+		change_param = core->iris_platform_data->dec_input_config_params_default;
 		change_param_size =
-			core->iris_platform_data->input_config_params_default_size;
+			core->iris_platform_data->dec_input_config_params_default_size;
 		break;
 	case V4L2_PIX_FMT_HEVC:
-		change_param = core->iris_platform_data->input_config_params_hevc;
+		change_param = core->iris_platform_data->dec_input_config_params_hevc;
 		change_param_size =
-			core->iris_platform_data->input_config_params_hevc_size;
+			core->iris_platform_data->dec_input_config_params_hevc_size;
 		break;
 	case V4L2_PIX_FMT_VP9:
-		change_param = core->iris_platform_data->input_config_params_vp9;
+		change_param = core->iris_platform_data->dec_input_config_params_vp9;
 		change_param_size =
-			core->iris_platform_data->input_config_params_vp9_size;
+			core->iris_platform_data->dec_input_config_params_vp9_size;
 		break;
 	}
 
@@ -664,7 +761,7 @@ static int iris_hfi_gen2_subscribe_change_param(struct iris_inst *inst, u32 plan
 	if (V4L2_TYPE_IS_OUTPUT(plane)) {
 		inst_hfi_gen2->ipsc_properties_set = true;
 	} else {
-		hfi_port = iris_hfi_gen2_get_port(V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+		hfi_port = iris_hfi_gen2_get_port(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
 		memcpy(&inst_hfi_gen2->dst_subcr_params,
 		       &inst_hfi_gen2->src_subcr_params,
 		       sizeof(inst_hfi_gen2->src_subcr_params));
@@ -759,6 +856,9 @@ static int iris_hfi_gen2_subscribe_property(struct iris_inst *inst, u32 plane)
 
 	payload[0] = HFI_MODE_PROPERTY;
 
+	if (inst->domain == ENCODER)
+		return 0;
+
 	if (V4L2_TYPE_IS_OUTPUT(plane)) {
 		subscribe_prop_size = core->iris_platform_data->dec_input_prop_size;
 		subcribe_prop = core->iris_platform_data->dec_input_prop;
@@ -810,7 +910,7 @@ static int iris_hfi_gen2_session_start(struct iris_inst *inst, u32 plane)
 					     HFI_CMD_START,
 					     (HFI_HOST_FLAGS_RESPONSE_REQUIRED |
 					     HFI_HOST_FLAGS_INTR_REQUIRED),
-					     iris_hfi_gen2_get_port(plane),
+					     iris_hfi_gen2_get_port(inst, plane),
 					     inst->session_id,
 					     HFI_PAYLOAD_NONE,
 					     NULL,
@@ -832,7 +932,7 @@ static int iris_hfi_gen2_session_stop(struct iris_inst *inst, u32 plane)
 					     (HFI_HOST_FLAGS_RESPONSE_REQUIRED |
 					     HFI_HOST_FLAGS_INTR_REQUIRED |
 					     HFI_HOST_FLAGS_NON_DISCARDABLE),
-					     iris_hfi_gen2_get_port(plane),
+					     iris_hfi_gen2_get_port(inst, plane),
 					     inst->session_id,
 					     HFI_PAYLOAD_NONE,
 					     NULL,
@@ -854,7 +954,7 @@ static int iris_hfi_gen2_session_pause(struct iris_inst *inst, u32 plane)
 					     HFI_CMD_PAUSE,
 					     (HFI_HOST_FLAGS_RESPONSE_REQUIRED |
 					     HFI_HOST_FLAGS_INTR_REQUIRED),
-					     iris_hfi_gen2_get_port(plane),
+					     iris_hfi_gen2_get_port(inst, plane),
 					     inst->session_id,
 					     HFI_PAYLOAD_NONE,
 					     NULL,
@@ -873,7 +973,7 @@ static int iris_hfi_gen2_session_resume_drc(struct iris_inst *inst, u32 plane)
 					     HFI_CMD_RESUME,
 					     (HFI_HOST_FLAGS_RESPONSE_REQUIRED |
 					     HFI_HOST_FLAGS_INTR_REQUIRED),
-					     iris_hfi_gen2_get_port(plane),
+					     iris_hfi_gen2_get_port(inst, plane),
 					     inst->session_id,
 					     HFI_PAYLOAD_U32,
 					     &payload,
@@ -892,7 +992,7 @@ static int iris_hfi_gen2_session_resume_drain(struct iris_inst *inst, u32 plane)
 					     HFI_CMD_RESUME,
 					     (HFI_HOST_FLAGS_RESPONSE_REQUIRED |
 					     HFI_HOST_FLAGS_INTR_REQUIRED),
-					     iris_hfi_gen2_get_port(plane),
+					     iris_hfi_gen2_get_port(inst, plane),
 					     inst->session_id,
 					     HFI_PAYLOAD_U32,
 					     &payload,
@@ -914,7 +1014,7 @@ static int iris_hfi_gen2_session_drain(struct iris_inst *inst, u32 plane)
 					     (HFI_HOST_FLAGS_RESPONSE_REQUIRED |
 					     HFI_HOST_FLAGS_INTR_REQUIRED |
 					     HFI_HOST_FLAGS_NON_DISCARDABLE),
-					     iris_hfi_gen2_get_port(plane),
+					     iris_hfi_gen2_get_port(inst, plane),
 					     inst->session_id,
 					     HFI_PAYLOAD_NONE,
 					     NULL,
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index fb6724d7f95ff8858aa9ba093fefb642e89de279..b3d1c966958e516d940a7795e5cbe2f8e8bada57 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -49,6 +49,7 @@
 #define HFI_PROP_TIER				0x03000109
 #define HFI_PROP_STAGE				0x0300010a
 #define HFI_PROP_PIPE				0x0300010b
+#define HFI_PROP_FRAME_RATE			0x0300010c
 #define HFI_PROP_LUMA_CHROMA_BIT_DEPTH		0x0300010f
 #define HFI_PROP_CODED_FRAMES			0x03000120
 #define HFI_PROP_CABAC_SESSION			0x03000121
@@ -69,6 +70,8 @@
 #define HFI_PROP_DEC_DEFAULT_HEADER		0x03000168
 #define HFI_PROP_DEC_START_FROM_RAP_FRAME	0x03000169
 #define HFI_PROP_NO_OUTPUT			0x0300016a
+#define HFI_PROP_BUFFER_MARK			0x0300016c
+#define HFI_PROP_RAW_RESOLUTION		0x03000178
 #define HFI_PROP_TOTAL_PEAK_BITRATE		0x0300017C
 #define HFI_PROP_COMV_BUFFER_COUNT		0x03000193
 #define HFI_PROP_END				0x03FFFFFF
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 49adb0a52bbf19849d0cc41179063b667a0ccb2f..f89dcd3347d8c95c14cee6192dfa91389da69d37 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -222,14 +222,18 @@ struct iris_platform_data {
 	u32 max_core_mbpf;
 	/* max number of macroblocks per second supported */
 	u32 max_core_mbps;
-	const u32 *input_config_params_default;
-	unsigned int input_config_params_default_size;
-	const u32 *input_config_params_hevc;
-	unsigned int input_config_params_hevc_size;
-	const u32 *input_config_params_vp9;
-	unsigned int input_config_params_vp9_size;
-	const u32 *output_config_params;
-	unsigned int output_config_params_size;
+	const u32 *dec_input_config_params_default;
+	unsigned int dec_input_config_params_default_size;
+	const u32 *dec_input_config_params_hevc;
+	unsigned int dec_input_config_params_hevc_size;
+	const u32 *dec_input_config_params_vp9;
+	unsigned int dec_input_config_params_vp9_size;
+	const u32 *dec_output_config_params;
+	unsigned int dec_output_config_params_size;
+	const u32 *enc_input_config_params;
+	unsigned int enc_input_config_params_size;
+	const u32 *enc_output_config_params;
+	unsigned int enc_output_config_params_size;
 	const u32 *dec_input_prop;
 	unsigned int dec_input_prop_size;
 	const u32 *dec_output_prop_avc;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 04e76445dd9141285a6e48be76bdf1bdb51f0cee..bfafd7c436116423bd3e8ecd4cf24038e383d2c8 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -638,11 +638,25 @@ static const u32 sm8550_vdec_input_config_param_vp9[] = {
 	HFI_PROP_LEVEL,
 };
 
+static const u32 sm8550_venc_input_config_params[] = {
+	HFI_PROP_COLOR_FORMAT,
+	HFI_PROP_RAW_RESOLUTION,
+	HFI_PROP_CROP_OFFSETS,
+	HFI_PROP_LINEAR_STRIDE_SCANLINE,
+	HFI_PROP_SIGNAL_COLOR_INFO,
+};
+
 static const u32 sm8550_vdec_output_config_params[] = {
 	HFI_PROP_COLOR_FORMAT,
 	HFI_PROP_LINEAR_STRIDE_SCANLINE,
 };
 
+static const u32 sm8550_venc_output_config_params[] = {
+	HFI_PROP_BITSTREAM_RESOLUTION,
+	HFI_PROP_CROP_OFFSETS,
+	HFI_PROP_FRAME_RATE,
+};
+
 static const u32 sm8550_vdec_subscribe_input_properties[] = {
 	HFI_PROP_NO_OUTPUT,
 };
@@ -706,22 +720,32 @@ struct iris_platform_data sm8550_data = {
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
-	.input_config_params_default =
+	.dec_input_config_params_default =
 		sm8550_vdec_input_config_params_default,
-	.input_config_params_default_size =
+	.dec_input_config_params_default_size =
 		ARRAY_SIZE(sm8550_vdec_input_config_params_default),
-	.input_config_params_hevc =
+	.dec_input_config_params_hevc =
 		sm8550_vdec_input_config_param_hevc,
-	.input_config_params_hevc_size =
+	.dec_input_config_params_hevc_size =
 		ARRAY_SIZE(sm8550_vdec_input_config_param_hevc),
-	.input_config_params_vp9 =
+	.dec_input_config_params_vp9 =
 		sm8550_vdec_input_config_param_vp9,
-	.input_config_params_vp9_size =
+	.dec_input_config_params_vp9_size =
 		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
-	.output_config_params =
+	.dec_output_config_params =
 		sm8550_vdec_output_config_params,
-	.output_config_params_size =
+	.dec_output_config_params_size =
 		ARRAY_SIZE(sm8550_vdec_output_config_params),
+
+	.enc_input_config_params =
+		sm8550_venc_input_config_params,
+	.enc_input_config_params_size =
+		ARRAY_SIZE(sm8550_venc_input_config_params),
+	.enc_output_config_params =
+		sm8550_venc_output_config_params,
+	.enc_output_config_params_size =
+		ARRAY_SIZE(sm8550_venc_output_config_params),
+
 	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
 	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
 	.dec_output_prop_avc = sm8550_vdec_subscribe_output_properties_avc,
@@ -784,22 +808,32 @@ struct iris_platform_data sm8650_data = {
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
-	.input_config_params_default =
+	.dec_input_config_params_default =
 		sm8550_vdec_input_config_params_default,
-	.input_config_params_default_size =
+	.dec_input_config_params_default_size =
 		ARRAY_SIZE(sm8550_vdec_input_config_params_default),
-	.input_config_params_hevc =
+	.dec_input_config_params_hevc =
 		sm8550_vdec_input_config_param_hevc,
-	.input_config_params_hevc_size =
+	.dec_input_config_params_hevc_size =
 		ARRAY_SIZE(sm8550_vdec_input_config_param_hevc),
-	.input_config_params_vp9 =
+	.dec_input_config_params_vp9 =
 		sm8550_vdec_input_config_param_vp9,
-	.input_config_params_vp9_size =
+	.dec_input_config_params_vp9_size =
 		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
-	.output_config_params =
+	.dec_output_config_params =
 		sm8550_vdec_output_config_params,
-	.output_config_params_size =
+	.dec_output_config_params_size =
 		ARRAY_SIZE(sm8550_vdec_output_config_params),
+
+	.enc_input_config_params =
+		sm8550_venc_input_config_params,
+	.enc_input_config_params_size =
+		ARRAY_SIZE(sm8550_venc_input_config_params),
+	.enc_output_config_params =
+		sm8550_venc_output_config_params,
+	.enc_output_config_params_size =
+		ARRAY_SIZE(sm8550_venc_output_config_params),
+
 	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
 	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
 	.dec_output_prop_avc = sm8550_vdec_subscribe_output_properties_avc,
@@ -858,22 +892,32 @@ struct iris_platform_data qcs8300_data = {
 	.max_session_count = 16,
 	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
 	.max_core_mbps = (((3840 * 2176) / 256) * 120),
-	.input_config_params_default =
+	.dec_input_config_params_default =
 		sm8550_vdec_input_config_params_default,
-	.input_config_params_default_size =
+	.dec_input_config_params_default_size =
 		ARRAY_SIZE(sm8550_vdec_input_config_params_default),
-	.input_config_params_hevc =
+	.dec_input_config_params_hevc =
 		sm8550_vdec_input_config_param_hevc,
-	.input_config_params_hevc_size =
+	.dec_input_config_params_hevc_size =
 		ARRAY_SIZE(sm8550_vdec_input_config_param_hevc),
-	.input_config_params_vp9 =
+	.dec_input_config_params_vp9 =
 		sm8550_vdec_input_config_param_vp9,
-	.input_config_params_vp9_size =
+	.dec_input_config_params_vp9_size =
 		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
-	.output_config_params =
+	.dec_output_config_params =
 		sm8550_vdec_output_config_params,
-	.output_config_params_size =
+	.dec_output_config_params_size =
 		ARRAY_SIZE(sm8550_vdec_output_config_params),
+
+	.enc_input_config_params =
+		sm8550_venc_input_config_params,
+	.enc_input_config_params_size =
+		ARRAY_SIZE(sm8550_venc_input_config_params),
+	.enc_output_config_params =
+		sm8550_venc_output_config_params,
+	.enc_output_config_params_size =
+		ARRAY_SIZE(sm8550_venc_output_config_params),
+
 	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
 	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
 	.dec_output_prop_avc = sm8550_vdec_subscribe_output_properties_avc,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
index 4f083eac261fff5642f15c4fc2f0f9f942818cac..34960d250d09dd872749dd19cdd3316e94575b81 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
@@ -38,6 +38,14 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
 };
 
 static struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
+	{
+		.cap_id = STAGE,
+		.min = STAGE_1,
+		.max = STAGE_2,
+		.step_or_mask = 1,
+		.value = STAGE_2,
+		.hfi_id = HFI_PROPERTY_PARAM_WORK_MODE,
+	},
 	{
 		.cap_id = PROFILE_H264,
 		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
@@ -278,6 +286,14 @@ static const u32 sm8250_vdec_input_config_param_default[] = {
 	HFI_PROPERTY_PARAM_BUFFER_ALLOC_MODE,
 };
 
+static const u32 sm8250_venc_input_config_param[] = {
+	HFI_PROPERTY_CONFIG_FRAME_RATE,
+	HFI_PROPERTY_PARAM_UNCOMPRESSED_PLANE_ACTUAL_INFO,
+	HFI_PROPERTY_PARAM_FRAME_SIZE,
+	HFI_PROPERTY_PARAM_UNCOMPRESSED_FORMAT_SELECT,
+	HFI_PROPERTY_PARAM_BUFFER_COUNT_ACTUAL,
+};
+
 static const u32 sm8250_dec_ip_int_buf_tbl[] = {
 	BUF_BIN,
 	BUF_SCRATCH_1,
@@ -320,10 +336,13 @@ struct iris_platform_data sm8250_data = {
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
-	.input_config_params_default =
+	.dec_input_config_params_default =
 		sm8250_vdec_input_config_param_default,
-	.input_config_params_default_size =
+	.dec_input_config_params_default_size =
 		ARRAY_SIZE(sm8250_vdec_input_config_param_default),
+	.enc_input_config_params = sm8250_venc_input_config_param,
+	.enc_input_config_params_size =
+		ARRAY_SIZE(sm8250_venc_input_config_param),
 
 	.dec_ip_int_buf_tbl = sm8250_dec_ip_int_buf_tbl,
 	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_ip_int_buf_tbl),
diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
index e32f7e1f007228a3b2b51cd76cd193d852f16080..fbf8ebb74193284dc847c54f76f908656b3098c9 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.c
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -7,9 +7,11 @@
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
 
+#include "iris_common.h"
 #include "iris_instance.h"
 #include "iris_vb2.h"
 #include "iris_vdec.h"
+#include "iris_venc.h"
 #include "iris_power.h"
 
 static int iris_check_inst_mbpf(struct iris_inst *inst)
@@ -174,19 +176,35 @@ int iris_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
 	if (ret)
 		goto error;
 
-	if (V4L2_TYPE_IS_OUTPUT(q->type))
-		ret = iris_vdec_streamon_input(inst);
-	else if (V4L2_TYPE_IS_CAPTURE(q->type))
-		ret = iris_vdec_streamon_output(inst);
+	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
+		if (inst->domain == DECODER)
+			ret = iris_vdec_streamon_input(inst);
+		else
+			ret = iris_venc_streamon_input(inst);
+	} else if (V4L2_TYPE_IS_CAPTURE(q->type)) {
+		if (inst->domain == DECODER)
+			ret = iris_vdec_streamon_output(inst);
+		else
+			ret = iris_venc_streamon_output(inst);
+	}
 	if (ret)
 		goto error;
 
 	buf_type = iris_v4l2_type_to_driver(q->type);
 
-	if (inst->state == IRIS_INST_STREAMING)
-		ret = iris_queue_internal_deferred_buffers(inst, BUF_DPB);
-	if (!ret)
-		ret = iris_queue_deferred_buffers(inst, buf_type);
+	if (inst->domain == DECODER) {
+		if (inst->state == IRIS_INST_STREAMING)
+			ret = iris_queue_internal_deferred_buffers(inst, BUF_DPB);
+		if (!ret)
+			ret = iris_queue_deferred_buffers(inst, buf_type);
+	} else {
+		if (inst->state == IRIS_INST_STREAMING) {
+			ret = iris_queue_deferred_buffers(inst, BUF_INPUT);
+			if (!ret)
+				ret = iris_queue_deferred_buffers(inst, BUF_OUTPUT);
+		}
+	}
+
 	if (ret)
 		goto error;
 
@@ -218,7 +236,7 @@ void iris_vb2_stop_streaming(struct vb2_queue *q)
 	    !V4L2_TYPE_IS_CAPTURE(q->type))
 		goto exit;
 
-	ret = iris_vdec_session_streamoff(inst, q->type);
+	ret = iris_session_streamoff(inst, q->type);
 	if (ret)
 		goto exit;
 
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index ec7f06205e978fb71b6e2ff3241c659585490bde..f091ef45d2a5f93db066dd13afff42b26e8b0155 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -7,6 +7,7 @@
 #include <media/v4l2-mem2mem.h>
 
 #include "iris_buffer.h"
+#include "iris_common.h"
 #include "iris_ctrls.h"
 #include "iris_instance.h"
 #include "iris_power.h"
@@ -312,125 +313,6 @@ void iris_vdec_src_change(struct iris_inst *inst)
 	v4l2_event_queue_fh(&inst->fh, &event);
 }
 
-
-static void iris_vdec_flush_deferred_buffers(struct iris_inst *inst,
-					     enum iris_buffer_type type)
-{
-	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
-	struct v4l2_m2m_buffer *buffer, *n;
-	struct iris_buffer *buf;
-
-	if (type == BUF_INPUT) {
-		v4l2_m2m_for_each_src_buf_safe(m2m_ctx, buffer, n) {
-			buf = to_iris_buffer(&buffer->vb);
-			if (buf->attr & BUF_ATTR_DEFERRED) {
-				if (!(buf->attr & BUF_ATTR_BUFFER_DONE)) {
-					buf->attr |= BUF_ATTR_BUFFER_DONE;
-					buf->data_size = 0;
-					iris_vb2_buffer_done(inst, buf);
-				}
-			}
-		}
-	} else {
-		v4l2_m2m_for_each_dst_buf_safe(m2m_ctx, buffer, n) {
-			buf = to_iris_buffer(&buffer->vb);
-			if (buf->attr & BUF_ATTR_DEFERRED) {
-				if (!(buf->attr & BUF_ATTR_BUFFER_DONE)) {
-					buf->attr |= BUF_ATTR_BUFFER_DONE;
-					buf->data_size = 0;
-					iris_vb2_buffer_done(inst, buf);
-				}
-			}
-		}
-	}
-}
-
-static void iris_vdec_kill_session(struct iris_inst *inst)
-{
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
-
-	if (!inst->session_id)
-		return;
-
-	hfi_ops->session_close(inst);
-	iris_inst_change_state(inst, IRIS_INST_ERROR);
-}
-
-int iris_vdec_session_streamoff(struct iris_inst *inst, u32 plane)
-{
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
-	enum iris_buffer_type buffer_type;
-	int ret;
-
-	switch (plane) {
-	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
-		buffer_type = BUF_INPUT;
-		break;
-	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
-		buffer_type = BUF_OUTPUT;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	ret = hfi_ops->session_stop(inst, plane);
-	if (ret)
-		goto error;
-
-	ret = iris_inst_state_change_streamoff(inst, plane);
-	if (ret)
-		goto error;
-
-	iris_vdec_flush_deferred_buffers(inst, buffer_type);
-
-	return 0;
-
-error:
-	iris_vdec_kill_session(inst);
-	iris_vdec_flush_deferred_buffers(inst, buffer_type);
-
-	return ret;
-}
-
-static int iris_vdec_process_streamon_input(struct iris_inst *inst)
-{
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
-	enum iris_inst_sub_state set_sub_state = 0;
-	int ret;
-
-	iris_scale_power(inst);
-
-	ret = hfi_ops->session_start(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
-	if (ret)
-		return ret;
-
-	if (inst->sub_state & IRIS_INST_SUB_INPUT_PAUSE) {
-		ret = iris_inst_change_sub_state(inst, IRIS_INST_SUB_INPUT_PAUSE, 0);
-		if (ret)
-			return ret;
-	}
-
-	if (inst->sub_state & IRIS_INST_SUB_DRC ||
-	    inst->sub_state & IRIS_INST_SUB_DRAIN ||
-	    inst->sub_state & IRIS_INST_SUB_FIRST_IPSC) {
-		if (!(inst->sub_state & IRIS_INST_SUB_INPUT_PAUSE)) {
-			if (hfi_ops->session_pause) {
-				ret = hfi_ops->session_pause(inst,
-							     V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
-				if (ret)
-					return ret;
-			}
-			set_sub_state = IRIS_INST_SUB_INPUT_PAUSE;
-		}
-	}
-
-	ret = iris_inst_state_change_streamon(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
-	if (ret)
-		return ret;
-
-	return iris_inst_change_sub_state(inst, 0, set_sub_state);
-}
-
 int iris_vdec_streamon_input(struct iris_inst *inst)
 {
 	int ret;
@@ -457,71 +339,7 @@ int iris_vdec_streamon_input(struct iris_inst *inst)
 	if (ret)
 		return ret;
 
-	return iris_vdec_process_streamon_input(inst);
-}
-
-static int iris_vdec_process_streamon_output(struct iris_inst *inst)
-{
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
-	bool drain_active = false, drc_active = false;
-	enum iris_inst_sub_state clear_sub_state = 0;
-	int ret = 0;
-
-	iris_scale_power(inst);
-
-	drain_active = inst->sub_state & IRIS_INST_SUB_DRAIN &&
-		inst->sub_state & IRIS_INST_SUB_DRAIN_LAST;
-
-	drc_active = inst->sub_state & IRIS_INST_SUB_DRC &&
-		inst->sub_state & IRIS_INST_SUB_DRC_LAST;
-
-	if (drc_active)
-		clear_sub_state = IRIS_INST_SUB_DRC | IRIS_INST_SUB_DRC_LAST;
-	else if (drain_active)
-		clear_sub_state = IRIS_INST_SUB_DRAIN | IRIS_INST_SUB_DRAIN_LAST;
-
-	if (inst->sub_state & IRIS_INST_SUB_INPUT_PAUSE) {
-		ret = iris_alloc_and_queue_input_int_bufs(inst);
-		if (ret)
-			return ret;
-		ret = iris_set_stage(inst, STAGE);
-		if (ret)
-			return ret;
-		ret = iris_set_pipe(inst, PIPE);
-		if (ret)
-			return ret;
-	}
-
-	if (inst->state == IRIS_INST_INPUT_STREAMING &&
-	    inst->sub_state & IRIS_INST_SUB_INPUT_PAUSE) {
-		if (!drain_active)
-			ret = hfi_ops->session_resume_drc(inst,
-							  V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
-		else if (hfi_ops->session_resume_drain)
-			ret = hfi_ops->session_resume_drain(inst,
-							    V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
-		if (ret)
-			return ret;
-		clear_sub_state |= IRIS_INST_SUB_INPUT_PAUSE;
-	}
-
-	if (inst->sub_state & IRIS_INST_SUB_FIRST_IPSC)
-		clear_sub_state |= IRIS_INST_SUB_FIRST_IPSC;
-
-	ret = hfi_ops->session_start(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
-	if (ret)
-		return ret;
-
-	if (inst->sub_state & IRIS_INST_SUB_OUTPUT_PAUSE)
-		clear_sub_state |= IRIS_INST_SUB_OUTPUT_PAUSE;
-
-	ret = iris_inst_state_change_streamon(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
-	if (ret)
-		return ret;
-
-	inst->last_buffer_dequeued = false;
-
-	return iris_inst_change_sub_state(inst, clear_sub_state, 0);
+	return iris_process_streamon_input(inst);
 }
 
 int iris_vdec_streamon_output(struct iris_inst *inst)
@@ -543,7 +361,7 @@ int iris_vdec_streamon_output(struct iris_inst *inst)
 	if (ret)
 		return ret;
 
-	ret = iris_vdec_process_streamon_output(inst);
+	ret = iris_process_streamon_output(inst);
 	if (ret)
 		goto error;
 
@@ -554,7 +372,7 @@ int iris_vdec_streamon_output(struct iris_inst *inst)
 	return ret;
 
 error:
-	iris_vdec_session_streamoff(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+	iris_session_streamoff(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
 
 	return ret;
 }
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.h b/drivers/media/platform/qcom/iris/iris_vdec.h
index 097e02bfa72b5ac4e46e66c61842df1d9dd4565b..ec1ce55d1375fd6518983baae2acf0fc43b6cabd 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.h
+++ b/drivers/media/platform/qcom/iris/iris_vdec.h
@@ -21,6 +21,5 @@ int iris_vdec_streamon_output(struct iris_inst *inst);
 int iris_vdec_qbuf(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf);
 int iris_vdec_start_cmd(struct iris_inst *inst);
 int iris_vdec_stop_cmd(struct iris_inst *inst);
-int iris_vdec_session_streamoff(struct iris_inst *inst, u32 plane);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index 4630ba12349a62a37515e93ed5efa2df197bce17..4b0da51e0477ab00019396242be9fd585c11ded3 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -7,6 +7,7 @@
 #include <media/v4l2-mem2mem.h>
 
 #include "iris_buffer.h"
+#include "iris_common.h"
 #include "iris_ctrls.h"
 #include "iris_instance.h"
 #include "iris_venc.h"
@@ -425,3 +426,34 @@ int iris_venc_g_param(struct iris_inst *inst, struct v4l2_streamparm *s_parm)
 
 	return 0;
 }
+
+int iris_venc_streamon_input(struct iris_inst *inst)
+{
+	int ret;
+
+	ret = iris_set_properties(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+	if (ret)
+		return ret;
+
+	return iris_process_streamon_input(inst);
+}
+
+int iris_venc_streamon_output(struct iris_inst *inst)
+{
+	int ret;
+
+	ret = iris_set_properties(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+	if (ret)
+		goto error;
+
+	ret = iris_process_streamon_output(inst);
+	if (ret)
+		goto error;
+
+	return ret;
+
+error:
+	iris_session_streamoff(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+
+	return ret;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_venc.h b/drivers/media/platform/qcom/iris/iris_venc.h
index 0d566b7fc89b96b8fbc62a35b2ba795ca0bcf460..941b5c186e4550e3eb6325d5ae3eeac4fcee4675 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.h
+++ b/drivers/media/platform/qcom/iris/iris_venc.h
@@ -18,5 +18,7 @@ int iris_venc_subscribe_event(struct iris_inst *inst, const struct v4l2_event_su
 int iris_venc_s_selection(struct iris_inst *inst, struct v4l2_selection *s);
 int iris_venc_g_param(struct iris_inst *inst, struct v4l2_streamparm *s_parm);
 int iris_venc_s_param(struct iris_inst *inst, struct v4l2_streamparm *s_parm);
+int iris_venc_streamon_input(struct iris_inst *inst);
+int iris_venc_streamon_output(struct iris_inst *inst);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 4c11cdac19f97d08a9e6242eea74649aad0242cf..be8688140fd22ffd02e8c286bfc5f62e050ceb5b 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -658,6 +658,8 @@ static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops_enc = {
 	.vidioc_s_selection             = iris_s_selection,
 	.vidioc_s_parm                  = iris_s_parm,
 	.vidioc_g_parm                  = iris_g_parm,
+	.vidioc_streamon                = v4l2_m2m_ioctl_streamon,
+	.vidioc_streamoff               = v4l2_m2m_ioctl_streamoff,
 };
 
 void iris_init_ops(struct iris_core *core)

-- 
2.34.1


