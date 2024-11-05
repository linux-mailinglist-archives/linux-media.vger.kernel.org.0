Return-Path: <linux-media+bounces-20853-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BB39BC67D
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 08:03:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F78A1C20951
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 07:03:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87F54205E2C;
	Tue,  5 Nov 2024 06:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NdhVZv0L"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EE72040BA;
	Tue,  5 Nov 2024 06:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730789923; cv=none; b=aqy4cl+CkTammXOgqiBoGyBMrMI4zA9YGSSn+T2rIZZrWW3Iyj6rjS21/VfiRRVZAP8EqoumUr1k7+gEbbMjLshkJtYQ+v1Y0cTF179o2O6AeNKoQCL//ovtvdaM+aj9K2nUgg2K8jawqONY6x7lW2lpx7/9BIl0XKeYf3sL9fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730789923; c=relaxed/simple;
	bh=8h+nL1jul+dlnhiFUOA1XcEC0BCEkLfPzNTJZUWz7rE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=pO2H5A4YEonawXeuHsxiF4xobfaHO/jtAW4xAABJkvZGDYw4YLA9gXabLQEnPHrYf540HXUdpMneHH/J7LV1InX/rot6x31AjbKho31FWAVsW/wHyUo9nzB4+5nHDnbyt6i7qkFHfx9g5+GEJgsczIJZ3w9vZc0QseHm14rbwAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NdhVZv0L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4LInlm015691;
	Tue, 5 Nov 2024 06:58:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ypE/GifSODwBVcReJbIxa+rmML9EjZukqLD1BvjC7PQ=; b=NdhVZv0L9zWWpcKo
	sE9EYi5qclMOlcKEm0ERkxiMCeLwAS1a2ZxOfcYRlFvb/8n8Rh6DpyJI+CEKRkKi
	2Rcswcq9Kj639mu3ezg2A1EedQAT4v8w6k4mVkUbPEXt28bLGWg62BxqL8Tg2l9g
	E9dmzJ5ccVAjzMkyj9EhHEnXP487hc5/q7T7Y88+hvaLh9hDI40S2KMhnfEGKtqR
	x18UI2OQ9CQ/yBCSO823ubAOWfSVHeP06jbq8NLbkyAfz2wfvDotqmdng2M/2rg/
	9C+187Xc7bTjVNYmi494jvtk0YSLlPjuS+7//4jQdUJITRaz6qRiTlslRt/jX4KZ
	2P1OqA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd4ypjy3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 06:58:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A56wVqG003188
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 5 Nov 2024 06:58:31 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 4 Nov 2024 22:58:26 -0800
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Tue, 5 Nov 2024 12:25:42 +0530
Subject: [PATCH v5 22/28] media: iris: handle streamoff/on from client in
 dynamic resolution change
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241105-qcom-video-iris-v5-22-a88e7c220f78@quicinc.com>
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
 Agarwal" <quic_dikshita@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730789780; l=13731;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=8h+nL1jul+dlnhiFUOA1XcEC0BCEkLfPzNTJZUWz7rE=;
 b=N+nucl5yx3nVEO+OrK+9wMsFVUTH7Gx2Q5SvbKxTjqYuXYt+/sYXg6aBhqExzIpdaZDsT/71B
 B2JWsWBVz/EBdxze5Ono+ZgTvy2eyrMs1Lw8szKVnGUGrF6cqP6Led5
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: pJ3UBYf1gLEPoC9odv_rZkgdjVTFQxXz
X-Proofpoint-ORIG-GUID: pJ3UBYf1gLEPoC9odv_rZkgdjVTFQxXz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 phishscore=0 clxscore=1015 adultscore=0
 spamscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411050049

The decoder is stopped after it completes the dynamic resolution change
sequence. Handle VIDIOC_STREAMOFF() and VIDIOC_STREAMON() on the CAPTURE
queue by client to resume the decoding process.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c     | 58 ++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_buffer.h     |  1 +
 drivers/media/platform/qcom/iris/iris_hfi_common.h |  2 +
 .../platform/qcom/iris/iris_hfi_gen1_command.c     | 10 ++++
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  1 +
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 39 ++++++++++++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  2 +
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  1 +
 drivers/media/platform/qcom/iris/iris_vdec.c       | 69 +++++++++++++++++++++-
 9 files changed, 180 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index 8df003000dc8..a002675d15d7 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -404,6 +404,47 @@ int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane)
 	return 0;
 }
 
+static int iris_release_internal_buffers(struct iris_inst *inst,
+					 enum iris_buffer_type buffer_type)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	struct iris_buffers *buffers = &inst->buffers[buffer_type];
+	struct iris_buffer *buffer, *next;
+	int ret;
+
+	list_for_each_entry_safe(buffer, next, &buffers->list, list) {
+		if (buffer->attr & BUF_ATTR_PENDING_RELEASE)
+			continue;
+		if (!(buffer->attr & BUF_ATTR_QUEUED))
+			continue;
+		ret = hfi_ops->session_release_buf(inst, buffer);
+		if (ret)
+			return ret;
+		buffer->attr |= BUF_ATTR_PENDING_RELEASE;
+	}
+
+	return 0;
+}
+
+static int iris_release_input_internal_buffers(struct iris_inst *inst)
+{
+	const struct iris_platform_data *platform_data = inst->core->iris_platform_data;
+	const u32 *internal_buf_type;
+	u32 internal_buffer_count, i;
+	int ret;
+
+	internal_buf_type = platform_data->dec_ip_int_buf_tbl;
+	internal_buffer_count = platform_data->dec_ip_int_buf_tbl_size;
+
+	for (i = 0; i < internal_buffer_count; i++) {
+		ret = iris_release_internal_buffers(inst, internal_buf_type[i]);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 int iris_alloc_and_queue_persist_bufs(struct iris_inst *inst)
 {
 	struct iris_buffers *buffers = &inst->buffers[BUF_PERSIST];
@@ -435,6 +476,23 @@ int iris_alloc_and_queue_persist_bufs(struct iris_inst *inst)
 	return 0;
 }
 
+int iris_alloc_and_queue_input_int_bufs(struct iris_inst *inst)
+{
+	int ret;
+
+	iris_get_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+
+	ret = iris_release_input_internal_buffers(inst);
+	if (ret)
+		return ret;
+
+	ret = iris_create_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+	if (ret)
+		return ret;
+
+	return iris_queue_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+}
+
 int iris_queue_deferred_buffers(struct iris_inst *inst, enum iris_buffer_type buf_type)
 {
 	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
diff --git a/drivers/media/platform/qcom/iris/iris_buffer.h b/drivers/media/platform/qcom/iris/iris_buffer.h
index bd8b74a9fbc4..b4433a629331 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.h
+++ b/drivers/media/platform/qcom/iris/iris_buffer.h
@@ -108,6 +108,7 @@ int iris_queue_internal_buffers(struct iris_inst *inst, u32 plane);
 int iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buffer);
 int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane);
 int iris_alloc_and_queue_persist_bufs(struct iris_inst *inst);
+int iris_alloc_and_queue_input_int_bufs(struct iris_inst *inst);
 int iris_queue_buffer(struct iris_inst *inst, struct iris_buffer *buf);
 int iris_queue_deferred_buffers(struct iris_inst *inst, enum iris_buffer_type buf_type);
 int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf);
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
index 22b0cbfcce76..ef76207aa749 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
@@ -118,6 +118,8 @@ struct iris_hfi_command_ops {
 	int (*session_start)(struct iris_inst *inst, u32 plane);
 	int (*session_queue_buf)(struct iris_inst *inst, struct iris_buffer *buffer);
 	int (*session_release_buf)(struct iris_inst *inst, struct iris_buffer *buffer);
+	int (*session_pause)(struct iris_inst *inst, u32 plane);
+	int (*session_resume_drc)(struct iris_inst *inst, u32 plane);
 	int (*session_stop)(struct iris_inst *inst, u32 plane);
 	int (*session_close)(struct iris_inst *inst);
 };
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 82f2513576bf..8fd4495b42d8 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -205,6 +205,15 @@ static int iris_hfi_gen1_session_stop(struct iris_inst *inst, u32 plane)
 	return ret;
 }
 
+static int iris_hfi_gen1_session_continue(struct iris_inst *inst, u32 plane)
+{
+	struct hfi_session_pkt packet;
+
+	iris_hfi_gen1_packet_session_cmd(inst, &packet, HFI_CMD_SESSION_CONTINUE);
+
+	return iris_hfi_queue_cmd_write(inst->core, &packet, packet.shdr.hdr.size);
+}
+
 static int iris_hfi_gen1_queue_input_buffer(struct iris_inst *inst, struct iris_buffer *buf)
 {
 	struct hfi_session_empty_buffer_compressed_pkt ip_pkt;
@@ -778,6 +787,7 @@ static const struct iris_hfi_command_ops iris_hfi_gen1_command_ops = {
 	.session_start = iris_hfi_gen1_session_start,
 	.session_queue_buf = iris_hfi_gen1_session_queue_buffer,
 	.session_release_buf = iris_hfi_gen1_session_unset_buffers,
+	.session_resume_drc = iris_hfi_gen1_session_continue,
 	.session_stop = iris_hfi_gen1_session_stop,
 	.session_close = iris_hfi_gen1_session_close,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index 41e103744bd5..48d0d8e4dfe5 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -34,6 +34,7 @@
 #define HFI_CMD_SESSION_FLUSH				0x211008
 #define HFI_CMD_SESSION_RELEASE_BUFFERS			0x21100b
 #define HFI_CMD_SESSION_RELEASE_RESOURCES		0x21100c
+#define HFI_CMD_SESSION_CONTINUE			0x21100d
 
 #define HFI_ERR_SESSION_UNSUPPORTED_SETTING		0x1008
 #define HFI_ERR_SESSION_UNSUPPORTED_STREAM		0x100d
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index cc75231f07f1..8efc6a70a57a 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -737,6 +737,43 @@ static int iris_hfi_gen2_session_stop(struct iris_inst *inst, u32 plane)
 	return iris_wait_for_session_response(inst, false);
 }
 
+static int iris_hfi_gen2_session_pause(struct iris_inst *inst, u32 plane)
+{
+	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
+
+	iris_hfi_gen2_packet_session_command(inst,
+					     HFI_CMD_PAUSE,
+					     (HFI_HOST_FLAGS_RESPONSE_REQUIRED |
+					     HFI_HOST_FLAGS_INTR_REQUIRED),
+					     iris_hfi_gen2_get_port(plane),
+					     inst->session_id,
+					     HFI_PAYLOAD_NONE,
+					     NULL,
+					     0);
+
+	return iris_hfi_queue_cmd_write(inst->core, inst_hfi_gen2->packet,
+					inst_hfi_gen2->packet->size);
+}
+
+static int iris_hfi_gen2_session_resume_drc(struct iris_inst *inst, u32 plane)
+{
+	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
+	u32 payload = HFI_CMD_SETTINGS_CHANGE;
+
+	iris_hfi_gen2_packet_session_command(inst,
+					     HFI_CMD_RESUME,
+					     (HFI_HOST_FLAGS_RESPONSE_REQUIRED |
+					     HFI_HOST_FLAGS_INTR_REQUIRED),
+					     iris_hfi_gen2_get_port(plane),
+					     inst->session_id,
+					     HFI_PAYLOAD_U32,
+					     &payload,
+					     sizeof(u32));
+
+	return iris_hfi_queue_cmd_write(inst->core, inst_hfi_gen2->packet,
+					inst_hfi_gen2->packet->size);
+}
+
 static u32 iris_hfi_gen2_buf_type_from_driver(enum iris_buffer_type buffer_type)
 {
 	switch (buffer_type) {
@@ -860,6 +897,8 @@ static const struct iris_hfi_command_ops iris_hfi_gen2_command_ops = {
 	.session_start = iris_hfi_gen2_session_start,
 	.session_queue_buf = iris_hfi_gen2_session_queue_buffer,
 	.session_release_buf = iris_hfi_gen2_session_release_buffer,
+	.session_pause = iris_hfi_gen2_session_pause,
+	.session_resume_drc = iris_hfi_gen2_session_resume_drc,
 	.session_stop = iris_hfi_gen2_session_stop,
 	.session_close = iris_hfi_gen2_session_close,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index 66ffce02ae57..0aaba5f1ce91 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -17,9 +17,11 @@
 #define HFI_CMD_CLOSE				0x01000004
 #define HFI_CMD_START				0x01000005
 #define HFI_CMD_STOP				0x01000006
+#define HFI_CMD_RESUME				0x01000008
 #define HFI_CMD_BUFFER				0x01000009
 #define HFI_CMD_SUBSCRIBE_MODE			0x0100000B
 #define HFI_CMD_SETTINGS_CHANGE			0x0100000C
+#define HFI_CMD_PAUSE				0x01000011
 #define HFI_CMD_END				0x01FFFFFF
 
 #define HFI_BITMASK_BITSTREAM_WIDTH		0xffff0000
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index 133f6c041e05..89cf795472bf 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -332,6 +332,7 @@ static int iris_hfi_gen2_handle_output_buffer(struct iris_inst *inst,
 	struct v4l2_m2m_buffer *m2m_buffer, *n;
 	struct iris_buffer *buf;
 	bool found = false;
+	int ret;
 
 	if (hfi_buffer->flags & HFI_BUF_FW_FLAG_PSC_LAST) {
 		ret = iris_inst_sub_state_change_drc_last(inst);
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index d0602e0f4a09..4327477b7d89 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -371,13 +371,37 @@ int iris_vdec_session_streamoff(struct iris_inst *inst, u32 plane)
 static int iris_vdec_process_streamon_input(struct iris_inst *inst)
 {
 	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	enum iris_inst_sub_state set_sub_state = 0;
 	int ret;
 
 	ret = hfi_ops->session_start(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
 	if (ret)
 		return ret;
 
-	return iris_inst_state_change_streamon(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+	if (inst->sub_state & IRIS_INST_SUB_INPUT_PAUSE) {
+		ret = iris_inst_change_sub_state(inst, IRIS_INST_SUB_INPUT_PAUSE, 0);
+		if (ret)
+			return ret;
+	}
+
+	if (inst->sub_state & IRIS_INST_SUB_DRC ||
+	    inst->sub_state & IRIS_INST_SUB_FIRST_IPSC) {
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
+	return iris_inst_change_sub_state(inst, 0, set_sub_state);
 }
 
 int iris_vdec_streamon_input(struct iris_inst *inst)
@@ -412,13 +436,52 @@ int iris_vdec_streamon_input(struct iris_inst *inst)
 static int iris_vdec_process_streamon_output(struct iris_inst *inst)
 {
 	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
-	int ret;
+	enum iris_inst_sub_state clear_sub_state = 0;
+	bool drc_active = false;
+	int ret = 0;
+
+	drc_active = inst->sub_state & IRIS_INST_SUB_DRC &&
+		inst->sub_state & IRIS_INST_SUB_DRC_LAST;
+
+	if (drc_active)
+		clear_sub_state = IRIS_INST_SUB_DRC | IRIS_INST_SUB_DRC_LAST;
+
+	if (inst->sub_state & IRIS_INST_SUB_INPUT_PAUSE) {
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
+		ret = hfi_ops->session_resume_drc(inst,
+						  V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+		if (ret)
+			return ret;
+		clear_sub_state |= IRIS_INST_SUB_INPUT_PAUSE;
+	}
+
+	if (inst->sub_state & IRIS_INST_SUB_FIRST_IPSC)
+		clear_sub_state |= IRIS_INST_SUB_FIRST_IPSC;
 
 	ret = hfi_ops->session_start(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
 	if (ret)
 		return ret;
 
-	return iris_inst_state_change_streamon(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+	if (inst->sub_state & IRIS_INST_SUB_OUTPUT_PAUSE)
+		clear_sub_state |= IRIS_INST_SUB_OUTPUT_PAUSE;
+
+	ret = iris_inst_state_change_streamon(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+	if (ret)
+		return ret;
+
+	return iris_inst_change_sub_state(inst, clear_sub_state, 0);
 }
 
 int iris_vdec_streamon_output(struct iris_inst *inst)

-- 
2.34.1


