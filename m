Return-Path: <linux-media+bounces-19580-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1824C99C59D
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 11:27:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5F132B27767
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 09:15:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 021A01AB6FB;
	Mon, 14 Oct 2024 09:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pE2uQLOo"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541561AB52E;
	Mon, 14 Oct 2024 09:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728896966; cv=none; b=Q4uBfyzjOLg04jcWyStqCdxvlcY2OtGHql87w+7RDPLN+kbvU/ErCfPZ+EVLr1XsVeYDFyuHbl+FJahgKzCmMqu4iX8PGq5Vz0An8EUqO6Koy8JxkQ8Fvi2nHCynvTy61Z7E8LA6dD1WCrWDFn/0Wa5/VP5doSQeZr2dR5cobm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728896966; c=relaxed/simple;
	bh=f7Z+xk8r1SbnpjktBGcac9ylL03GyvuXDxsy76uMeh0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=SyZQz0PhyeFb4sbGH/KG7tiUshsrst5/aBEoisq3fLAXrK36S1D/e/Wp7CnrRq4+UqmM2zul9NnszJarQXlgBTD7ADqO2FbfqGujaj0jKWLQDlUa73I6E9F50Mq2vbGPkhAsnq6YDHX3P1Klxg9Wd8P5HTMoUdRUJBWUGj4/Tdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pE2uQLOo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49DN6o8f004976;
	Mon, 14 Oct 2024 09:09:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mnjumdX5vOkqhTDmkKUYpZaFWA39VO2uL/vnWVEQkFg=; b=pE2uQLOoGTau7ikR
	vzEPqJ5uWO05cUxiaVAWJt2SbedhPvCwkHQAi/YqHYaTKItiN7GAI10W8inSQdte
	7egWcOfrws+Zyqo9wRS+UICZEVFaBVDscsLgTaeN8AKZ9vgS06rC8HIM4Bot5yB/
	hShvrTWXmQhfniSWGp6PQxj6ocjmGSd7Gy1+9vPMgaHoR3ar54eddsj/v0US2cBS
	532EkXSPpKhw+rKAqPstgT03h7N07qitwy8ILQRu+5RNbC6uNRKsd89gMcLiDl2V
	QiZW91tUMHLU4cOAXBbG0BB6KIwwHz3sr/PKhZL31K0PVACLP13xCnr/LxqaSC9S
	eS1Zcg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 427jd8utgf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 09:09:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49E99HAJ005302
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 09:09:17 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 14 Oct 2024 02:09:13 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Mon, 14 Oct 2024 14:37:43 +0530
Subject: [PATCH v4 22/28] media: iris: handle streamoff/on from client in
 dynamic resolution change
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241014-qcom-video-iris-v4-v4-22-c5eaa4e9ab9e@quicinc.com>
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
        Dikshita Agarwal <quic_dikshita@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728896854; l=13732;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=f7Z+xk8r1SbnpjktBGcac9ylL03GyvuXDxsy76uMeh0=;
 b=hIjJs9Ue/sD4BNFAxVskw48Oqb4h5LDHMASaqfl9eqP+LHWJDmqNdWGa5gH6nUGjhzQmPbbzH
 ZC06Qs6EtE/DJ6lIVjvSMCd+6Taavbd78AWyVWYUjxXYLO5d3fsm+Ye
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: WeqFcuGfNY29bxq8Y-1RW22uG66Hzvc9
X-Proofpoint-ORIG-GUID: WeqFcuGfNY29bxq8Y-1RW22uG66Hzvc9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=999 malwarescore=0 priorityscore=1501 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410140066

The decoder is stopped after it completes the dynamic resolution change
sequence.
Handle VIDIOC_STREAMOFF() and VIDIOC_STREAMON() on the CAPTURE queue
by client to resume the decoding process.

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
index c2e308519fe9..4891a513a297 100644
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
index 0d904d64884c..33a1fc9b997e 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -376,13 +376,37 @@ int iris_vdec_session_streamoff(struct iris_inst *inst, u32 plane)
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
@@ -417,13 +441,52 @@ int iris_vdec_streamon_input(struct iris_inst *inst)
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


