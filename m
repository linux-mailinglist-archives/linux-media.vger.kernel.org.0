Return-Path: <linux-media+bounces-23044-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6033A9EAF5C
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 12:12:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CBE2188AD66
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 11:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A763E2153C1;
	Tue, 10 Dec 2024 11:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TskYbDBs"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2833C2343C4;
	Tue, 10 Dec 2024 11:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733828883; cv=none; b=srI6vkpqD1dQ6hYd7d2KxBaoDalDsI0vx2U8a62+sOA77vkEFUqt54nOLaSV2x9zLDmPojvXASjIZeA7HTpG9hGy3x4jMnZ+x4AtAg0cm52ec393oXfWcrr6+MBAef4cvTQaArNCsuIqEZ1tv8AqRxhtcXK03BeSTRUKC46FBqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733828883; c=relaxed/simple;
	bh=9nkIYmu8M3iWRrCXYc0AwCWNR9RNdM5nMchPof0fdDY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Sgo8RQT2vf0h+tNp2zurpTrChwQlBoi7MrbctcwTlXb/G0EQZlvvhsZvm9DEAXXl+ujKgxEQnjkrsQeTs4ZcSjHKQc+dSkMJd06ab+dJIDBnxzZerDjYtk4FXAaPH1IvABK6LGIm+rkPy9qoKl2JjwLdY1QTsHMwo6w0IXGdf3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TskYbDBs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BA8Gt2g024799;
	Tue, 10 Dec 2024 11:07:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6RA02QITXd0ds7t9jHIvviAcCpf7Eq0kJKY58wVPEJo=; b=TskYbDBsP6wVycuP
	g+l5iICSB0n2IYFlrrZheTdyF8Has50NWEgmxq1qQJ56cbHDIZG69OLN4nYV92IE
	7VTStQKwn4bqhl0K50A+yb6/1Eoj4RvbzKr2yxiL71pwHfapNGVgARYpjD5U1xhh
	6KQsP3A0DYvy7gBFICjM8rAyY7ag/ef99fO4yNd20RkAFx5zmaBAvR+hhux0VAvU
	SvY0iEOxPBuh0oZNI4C3Se6ep5fzfqx4E5Kg3fy5L7OI1/+/NHYNgzAvBKZBCdbd
	M1H0T0GdCepxnZ3Ge9hk60QQKQCk22x/gtvs+xCUZ1cHiKihVfF+gYEYvH7/8BFO
	MYnXdw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43cdpgr61t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 11:07:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BAB7p3s017405
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 11:07:51 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 10 Dec 2024 03:07:45 -0800
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Tue, 10 Dec 2024 16:35:26 +0530
Subject: [PATCH v8 22/28] media: iris: handle streamoff/on from client in
 dynamic resolution change
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241210-qcom-video-iris-v8-22-42c5403cb1a3@quicinc.com>
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
        Dikshita Agarwal <quic_dikshita@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733828732; l=13060;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=9nkIYmu8M3iWRrCXYc0AwCWNR9RNdM5nMchPof0fdDY=;
 b=pwEswvGS8vPcAvOp+nSO+S4+lBBLucACqfRENx0graKewVmIfGxLnM9V0GFtA/7lAsJ/upQVO
 49qtgpu9cpuA3Te91OX7/7my09Sd7JXmcbsYfE/HrfcWGSmJs/qygSG
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vQ1hVFxScG1Eda8ZST3N3Vbb6q8jVaum
X-Proofpoint-ORIG-GUID: vQ1hVFxScG1Eda8ZST3N3Vbb6q8jVaum
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 suspectscore=0 mlxscore=0 priorityscore=1501
 phishscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412100083

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
 drivers/media/platform/qcom/iris/iris_vdec.c       | 69 +++++++++++++++++++++-
 8 files changed, 179 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index de1267c387f1..dc096e5e95bf 100644
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
index 2c7432a59906..c36b6347b077 100644
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
index 6241098dc31d..8e14a61c9be4 100644
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
index 03f7e6ea4bf3..e0cb75a112e3 100644
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
index 416e9a19a26f..c40e0a28b21f 100644
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
index 42cd57d5e3b1..620bcb90c35f 100644
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
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 1da277ed6cb3..47a44978869b 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -357,13 +357,37 @@ int iris_vdec_session_streamoff(struct iris_inst *inst, u32 plane)
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
@@ -398,13 +422,52 @@ int iris_vdec_streamon_input(struct iris_inst *inst)
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


