Return-Path: <linux-media+bounces-20854-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 111439BC682
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 08:04:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C28A22831D0
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 07:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30DEE1F5857;
	Tue,  5 Nov 2024 06:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XwaNaYeb"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8A62064EE;
	Tue,  5 Nov 2024 06:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730789930; cv=none; b=Q97Q0CpztTYxErDr2cDzX838lH/MUKmL/8AvEp1HlOaJAt2mfnI5rib5n+dZD/6Jhf8NINACzNhiHT2qR9omnsOctO6Cypqw4RDZljQ+ZxlDaci4ndMuDWXNejtPHyz3EmR6cPCAkiIBH2XA7qQ1du1SEITHToOU2f/CKFSDIIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730789930; c=relaxed/simple;
	bh=pCOeUi9+9KEe+k77DmPIID+DoYoztu9CPaFW/GK13/8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=uhYzcUuZR0+5Mrk4Qf3/GDoHi5Wl/wUT/Tb9i+czCeELSP231cJy4RUZdDK7zXgLyVsRUs9n9s1Oko05/A/4noz+TGwHVT9iFVk12N7c3tB7cOdBPdinqcimJw4Q0QXVszdPKgKXs0UaoFajEYF9AwhD/f4DWzT868JWvwp3JVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XwaNaYeb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4LIlbk017217;
	Tue, 5 Nov 2024 06:58:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GRvE4seG7psiHnCzE2o4N2UHToObXRVv0ypOcSap2uA=; b=XwaNaYebIukgX/r/
	DuJpUtp+STOCEpffpRZuljHWSbo2Xkxr6GJaBP/A7WBoPmGIvjGWlDFU923RpnaH
	C58l4e0vFksPJsOACReWKNi3WN6utNCC86t92gJ0tKGomwzNsZf09NXx8t1dVTJr
	O2Yy2cH1rS1B7gozel53NEKGUP78nuhpJ6CEHQJkDjiaxBiyRlnGQNU0TVi+AYQw
	wHl7xUm4gr1Q8TEmdjwV60YNsBZU+dE5id8FGuSHYy29LrQaBlo5blx8Gb+VfOOe
	N7HlkOtz4+KcjWUmyLmfpDmL6vSC9XijM9Cc2f9DVfdLkaOE3i7Nb6iJyZKTVXmn
	RNZOuw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd2r6nvp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 06:58:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A56wbR9016207
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 5 Nov 2024 06:58:37 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 4 Nov 2024 22:58:31 -0800
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Tue, 5 Nov 2024 12:25:43 +0530
Subject: [PATCH v5 23/28] media: iris: add support for drain sequence
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241105-qcom-video-iris-v5-23-a88e7c220f78@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730789780; l=25024;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=pCOeUi9+9KEe+k77DmPIID+DoYoztu9CPaFW/GK13/8=;
 b=HAbas7GStr+EbP7j6jDW5rgg7l3LLvl6lA6RlvrxrK9DWYiWN51vH3ZUwfYWIcbh4pDfthWgq
 NJnpgnUKBoNBeKt09YY9oLq5VK48W+sJNRpUk6goEXO1Ogdg4f158Sr
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 7RR3RtsheprxhKEf09tc5tkCczscFdLC
X-Proofpoint-GUID: 7RR3RtsheprxhKEf09tc5tkCczscFdLC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411050050

handle the V4L2_DEC_CMD_STOP by initiating drain sequence to firmware.
Process and decode all OUTPUT buffers queued by the client before the
VIDIOC_DECODER_CMD() was issued and mark the last buffer with
V4L2_BUF_FLAG_LAST flag. Decoder is stopped after processing the last
buffer.

Resume the decoder when one of below are issued by client:
- V4L2_DEC_CMD_START
- pair of VIDIOC_STREAMOFF() and VIDIOC_STREAMON() on the CAPTURE queue
- pair of VIDIOC_STREAMOFF() and VIDIOC_STREAMON() on the OUTPUT queue

Add the handling to resume decoding when client issues
V4L2_DEC_CMD_START to resume decoding after source change is detected.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_common.h |  2 +
 .../platform/qcom/iris/iris_hfi_gen1_command.c     | 13 ++++
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  1 +
 .../platform/qcom/iris/iris_hfi_gen1_response.c    | 15 ++++
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 43 ++++++++++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  2 +
 .../platform/qcom/iris/iris_hfi_gen2_response.c    | 46 ++++++++++-
 drivers/media/platform/qcom/iris/iris_state.c      | 68 ++++++++++++++++
 drivers/media/platform/qcom/iris/iris_state.h      | 13 +++-
 drivers/media/platform/qcom/iris/iris_vb2.c        |  6 +-
 drivers/media/platform/qcom/iris/iris_vdec.c       | 91 +++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_vdec.h       |  2 +
 drivers/media/platform/qcom/iris/iris_vidc.c       | 37 +++++++++
 13 files changed, 331 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
index ef76207aa749..5bd7073a2d9b 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
@@ -121,6 +121,8 @@ struct iris_hfi_command_ops {
 	int (*session_pause)(struct iris_inst *inst, u32 plane);
 	int (*session_resume_drc)(struct iris_inst *inst, u32 plane);
 	int (*session_stop)(struct iris_inst *inst, u32 plane);
+	int (*session_drain)(struct iris_inst *inst, u32 plane);
+	int (*session_resume_drain)(struct iris_inst *inst, u32 plane);
 	int (*session_close)(struct iris_inst *inst);
 };
 
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 8fd4495b42d8..ef65a1301a79 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -368,6 +368,18 @@ static int iris_hfi_gen1_session_unset_buffers(struct iris_inst *inst, struct ir
 	return ret;
 }
 
+static int iris_hfi_gen1_session_drain(struct iris_inst *inst, u32 plane)
+{
+	struct hfi_session_empty_buffer_compressed_pkt ip_pkt = {0};
+
+	ip_pkt.shdr.hdr.size = sizeof(struct hfi_session_empty_buffer_compressed_pkt);
+	ip_pkt.shdr.hdr.pkt_type = HFI_CMD_SESSION_EMPTY_BUFFER;
+	ip_pkt.shdr.session_id = inst->session_id;
+	ip_pkt.flags = HFI_BUFFERFLAG_EOS;
+
+	return iris_hfi_queue_cmd_write(inst->core, &ip_pkt, ip_pkt.shdr.hdr.size);
+}
+
 static int
 iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *packet,
 					  struct iris_inst *inst, u32 ptype, void *pdata)
@@ -789,6 +801,7 @@ static const struct iris_hfi_command_ops iris_hfi_gen1_command_ops = {
 	.session_release_buf = iris_hfi_gen1_session_unset_buffers,
 	.session_resume_drc = iris_hfi_gen1_session_continue,
 	.session_stop = iris_hfi_gen1_session_stop,
+	.session_drain = iris_hfi_gen1_session_drain,
 	.session_close = iris_hfi_gen1_session_close,
 };
 
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index 48d0d8e4dfe5..7f910fa0bfd7 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -49,6 +49,7 @@
 #define HFI_EVENT_DATA_SEQUENCE_CHANGED_INSUFFICIENT_BUF_RESOURCES 0x1000002
 #define HFI_EVENT_SESSION_SEQUENCE_CHANGED			   0x1000003
 
+#define HFI_BUFFERFLAG_EOS				0x00000001
 #define HFI_BUFFERFLAG_TIMESTAMPINVALID			0x00000100
 
 #define HFI_FLUSH_OUTPUT				0x1000002
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index ca2d23c4c4a6..73c05cbb2fe1 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -385,6 +385,7 @@ static void iris_hfi_gen1_session_ftb_done(struct iris_inst *inst, void *packet)
 	struct hfi_msg_session_fbd_uncompressed_plane0_pkt *pkt = packet;
 	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
 	struct v4l2_m2m_buffer *m2m_buffer, *n;
+	struct hfi_session_flush_pkt flush_pkt;
 	u32 timestamp_hi = pkt->time_stamp_hi;
 	u32 timestamp_lo = pkt->time_stamp_lo;
 	struct iris_core *core = inst->core;
@@ -393,11 +394,25 @@ static void iris_hfi_gen1_session_ftb_done(struct iris_inst *inst, void *packet)
 	u32 output_tag = pkt->output_tag;
 	struct iris_buffer *buf, *iter;
 	struct iris_buffers *buffers;
+	u32 hfi_flags = pkt->flags;
 	u32 offset = pkt->offset;
 	u64 timestamp_us = 0;
 	bool found = false;
 	u32 flags = 0;
 
+	if ((hfi_flags & HFI_BUFFERFLAG_EOS) && !filled_len) {
+		reinit_completion(&inst->flush_completion);
+
+		flush_pkt.shdr.hdr.size = sizeof(struct hfi_session_flush_pkt);
+		flush_pkt.shdr.hdr.pkt_type = HFI_CMD_SESSION_FLUSH;
+		flush_pkt.shdr.session_id = inst->session_id;
+		flush_pkt.flush_type = HFI_FLUSH_OUTPUT;
+		iris_hfi_queue_cmd_write(core, &flush_pkt, flush_pkt.shdr.hdr.size);
+		iris_inst_sub_state_change_drain_last(inst);
+
+		return;
+	}
+
 	if (iris_split_mode_enabled(inst) && pkt->stream_id == 0) {
 		buffers = &inst->buffers[BUF_DPB];
 		if (!buffers)
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 8efc6a70a57a..a908b41e2868 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -774,6 +774,47 @@ static int iris_hfi_gen2_session_resume_drc(struct iris_inst *inst, u32 plane)
 					inst_hfi_gen2->packet->size);
 }
 
+static int iris_hfi_gen2_session_resume_drain(struct iris_inst *inst, u32 plane)
+{
+	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
+	u32 payload = HFI_CMD_DRAIN;
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
+static int iris_hfi_gen2_session_drain(struct iris_inst *inst, u32 plane)
+{
+	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
+
+	if (!V4L2_TYPE_IS_OUTPUT(plane))
+		return 0;
+
+	iris_hfi_gen2_packet_session_command(inst,
+					     HFI_CMD_DRAIN,
+					     (HFI_HOST_FLAGS_RESPONSE_REQUIRED |
+					     HFI_HOST_FLAGS_INTR_REQUIRED |
+					     HFI_HOST_FLAGS_NON_DISCARDABLE),
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
 static u32 iris_hfi_gen2_buf_type_from_driver(enum iris_buffer_type buffer_type)
 {
 	switch (buffer_type) {
@@ -900,6 +941,8 @@ static const struct iris_hfi_command_ops iris_hfi_gen2_command_ops = {
 	.session_pause = iris_hfi_gen2_session_pause,
 	.session_resume_drc = iris_hfi_gen2_session_resume_drc,
 	.session_stop = iris_hfi_gen2_session_stop,
+	.session_drain = iris_hfi_gen2_session_drain,
+	.session_resume_drain = iris_hfi_gen2_session_resume_drain,
 	.session_close = iris_hfi_gen2_session_close,
 };
 
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index 0aaba5f1ce91..72d41445d765 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -17,6 +17,7 @@
 #define HFI_CMD_CLOSE				0x01000004
 #define HFI_CMD_START				0x01000005
 #define HFI_CMD_STOP				0x01000006
+#define HFI_CMD_DRAIN				0x01000007
 #define HFI_CMD_RESUME				0x01000008
 #define HFI_CMD_BUFFER				0x01000009
 #define HFI_CMD_SUBSCRIBE_MODE			0x0100000B
@@ -79,6 +80,7 @@
 #define HFI_INFO_UNSUPPORTED			0x06000001
 #define HFI_INFO_DATA_CORRUPT			0x06000002
 #define HFI_INFO_BUFFER_OVERFLOW		0x06000004
+#define HFI_INFO_HFI_FLAG_DRAIN_LAST		0x06000006
 #define HFI_INFO_HFI_FLAG_PSC_LAST		0x06000007
 #define HFI_INFORMATION_END			0x06FFFFFF
 
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index 89cf795472bf..74984903e7aa 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -201,6 +201,10 @@ static int iris_hfi_gen2_handle_session_info(struct iris_inst *inst,
 		info = "buffer overflow";
 		inst_hfi_gen2->hfi_frame_info.overflow = 1;
 		break;
+	case HFI_INFO_HFI_FLAG_DRAIN_LAST:
+		info = "drain last flag";
+		ret = iris_inst_sub_state_change_drain_last(inst);
+		break;
 	case HFI_INFO_HFI_FLAG_PSC_LAST:
 		info = "drc last flag";
 		ret = iris_inst_sub_state_change_drc_last(inst);
@@ -334,6 +338,12 @@ static int iris_hfi_gen2_handle_output_buffer(struct iris_inst *inst,
 	bool found = false;
 	int ret;
 
+	if (hfi_buffer->flags & HFI_BUF_FW_FLAG_LAST) {
+		ret = iris_inst_sub_state_change_drain_last(inst);
+		if (ret)
+			return ret;
+	}
+
 	if (hfi_buffer->flags & HFI_BUF_FW_FLAG_PSC_LAST) {
 		ret = iris_inst_sub_state_change_drc_last(inst);
 		if (ret)
@@ -422,6 +432,21 @@ static int iris_hfi_gen2_handle_release_internal_buffer(struct iris_inst *inst,
 	return ret;
 }
 
+static int iris_hfi_gen2_handle_session_stop(struct iris_inst *inst,
+					     struct iris_hfi_packet *pkt)
+{
+	int ret = 0;
+
+	if (pkt->port == HFI_PORT_RAW)
+		ret = iris_inst_sub_state_change_pause(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+	else if (pkt->port == HFI_PORT_BITSTREAM)
+		ret = iris_inst_sub_state_change_pause(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+
+	complete(&inst->completion);
+
+	return ret;
+}
+
 static int iris_hfi_gen2_handle_session_buffer(struct iris_inst *inst,
 					       struct iris_hfi_packet *pkt)
 {
@@ -450,6 +475,22 @@ static int iris_hfi_gen2_handle_session_buffer(struct iris_inst *inst,
 		return iris_hfi_gen2_handle_release_internal_buffer(inst, buffer);
 }
 
+static int iris_hfi_gen2_handle_session_drain(struct iris_inst *inst,
+					      struct iris_hfi_packet *pkt)
+{
+	int ret = 0;
+
+	if (!(pkt->flags & HFI_FW_FLAGS_SUCCESS)) {
+		iris_inst_change_state(inst, IRIS_INST_ERROR);
+		return 0;
+	}
+
+	if (inst->sub_state & IRIS_INST_SUB_DRAIN)
+		ret = iris_inst_change_sub_state(inst, 0, IRIS_INST_SUB_INPUT_PAUSE);
+
+	return ret;
+}
+
 static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
 {
 	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
@@ -568,7 +609,7 @@ static int iris_hfi_gen2_handle_session_command(struct iris_inst *inst,
 		iris_hfi_gen2_handle_session_close(inst, pkt);
 		break;
 	case HFI_CMD_STOP:
-		complete(&inst->completion);
+		iris_hfi_gen2_handle_session_stop(inst, pkt);
 		break;
 	case HFI_CMD_BUFFER:
 		ret = iris_hfi_gen2_handle_session_buffer(inst, pkt);
@@ -576,6 +617,9 @@ static int iris_hfi_gen2_handle_session_command(struct iris_inst *inst,
 	case HFI_CMD_SETTINGS_CHANGE:
 		ret = iris_hfi_gen2_handle_src_change(inst, pkt);
 		break;
+	case HFI_CMD_DRAIN:
+		ret = iris_hfi_gen2_handle_session_drain(inst, pkt);
+		break;
 	default:
 		break;
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_state.c b/drivers/media/platform/qcom/iris/iris_state.c
index aad7e734d5c8..f12306e735ec 100644
--- a/drivers/media/platform/qcom/iris/iris_state.c
+++ b/drivers/media/platform/qcom/iris/iris_state.c
@@ -3,6 +3,8 @@
  * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <media/v4l2-mem2mem.h>
+
 #include "iris_instance.h"
 
 static bool iris_allow_inst_state_change(struct iris_inst *inst,
@@ -148,6 +150,21 @@ int iris_inst_sub_state_change_drc(struct iris_inst *inst)
 	return iris_inst_change_sub_state(inst, 0, set_sub_state);
 }
 
+int iris_inst_sub_state_change_drain_last(struct iris_inst *inst)
+{
+	enum iris_inst_sub_state set_sub_state;
+
+	if (inst->sub_state & IRIS_INST_SUB_DRAIN_LAST)
+		return -EINVAL;
+
+	if (!(inst->sub_state & IRIS_INST_SUB_DRAIN))
+		return -EINVAL;
+
+	set_sub_state = IRIS_INST_SUB_DRAIN_LAST | IRIS_INST_SUB_OUTPUT_PAUSE;
+
+	return iris_inst_change_sub_state(inst, 0, set_sub_state);
+}
+
 int iris_inst_sub_state_change_drc_last(struct iris_inst *inst)
 {
 	enum iris_inst_sub_state set_sub_state;
@@ -166,3 +183,54 @@ int iris_inst_sub_state_change_drc_last(struct iris_inst *inst)
 
 	return iris_inst_change_sub_state(inst, 0, set_sub_state);
 }
+
+int iris_inst_sub_state_change_pause(struct iris_inst *inst, u32 plane)
+{
+	enum iris_inst_sub_state set_sub_state;
+
+	if (V4L2_TYPE_IS_OUTPUT(plane)) {
+		if (inst->sub_state & IRIS_INST_SUB_DRC &&
+		    !(inst->sub_state & IRIS_INST_SUB_DRC_LAST))
+			return -EINVAL;
+
+		if (inst->sub_state & IRIS_INST_SUB_DRAIN &&
+		    !(inst->sub_state & IRIS_INST_SUB_DRAIN_LAST))
+			return -EINVAL;
+
+		set_sub_state = IRIS_INST_SUB_INPUT_PAUSE;
+	} else {
+		set_sub_state = IRIS_INST_SUB_OUTPUT_PAUSE;
+	}
+
+	return iris_inst_change_sub_state(inst, 0, set_sub_state);
+}
+
+static inline bool iris_drc_pending(struct iris_inst *inst)
+{
+	return inst->sub_state & IRIS_INST_SUB_DRC &&
+		inst->sub_state & IRIS_INST_SUB_DRC_LAST;
+}
+
+static inline bool iris_drain_pending(struct iris_inst *inst)
+{
+	return inst->sub_state & IRIS_INST_SUB_DRAIN &&
+		inst->sub_state & IRIS_INST_SUB_DRAIN_LAST;
+}
+
+bool iris_allow_cmd(struct iris_inst *inst, u32 cmd)
+{
+	struct vb2_queue *src_q = v4l2_m2m_get_src_vq(inst->m2m_ctx);
+	struct vb2_queue *dst_q = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
+
+	if (cmd == V4L2_DEC_CMD_START) {
+		if (vb2_is_streaming(src_q) || vb2_is_streaming(dst_q))
+			if (iris_drc_pending(inst) || iris_drain_pending(inst))
+				return true;
+	} else if (cmd == V4L2_DEC_CMD_STOP) {
+		if (vb2_is_streaming(src_q))
+			if (inst->sub_state != IRIS_INST_SUB_DRAIN)
+				return true;
+	}
+
+	return false;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_state.h b/drivers/media/platform/qcom/iris/iris_state.h
index 12e98f8b1664..4bdd55af4f30 100644
--- a/drivers/media/platform/qcom/iris/iris_state.h
+++ b/drivers/media/platform/qcom/iris/iris_state.h
@@ -104,6 +104,9 @@ enum iris_inst_state {
  *		      sent to client.
  * IRIS_INST_SUB_DRC_LAST: indicates last buffer is received from firmware
  *                         as part of source change.
+ * IRIS_INST_SUB_DRAIN: indicates drain is in progress.
+ * IRIS_INST_SUB_DRAIN_LAST: indicates last buffer is received from firmware
+ *                           as part of drain sequence.
  * IRIS_INST_SUB_INPUT_PAUSE: source change is received form firmware. This
  *                            indicates that firmware is paused to process
  *                            any further input frames.
@@ -115,8 +118,10 @@ enum iris_inst_sub_state {
 	IRIS_INST_SUB_FIRST_IPSC	= BIT(0),
 	IRIS_INST_SUB_DRC		= BIT(1),
 	IRIS_INST_SUB_DRC_LAST		= BIT(2),
-	IRIS_INST_SUB_INPUT_PAUSE	= BIT(3),
-	IRIS_INST_SUB_OUTPUT_PAUSE	= BIT(4),
+	IRIS_INST_SUB_DRAIN		= BIT(3),
+	IRIS_INST_SUB_DRAIN_LAST	= BIT(4),
+	IRIS_INST_SUB_INPUT_PAUSE	= BIT(5),
+	IRIS_INST_SUB_OUTPUT_PAUSE	= BIT(6),
 };
 
 int iris_inst_change_state(struct iris_inst *inst,
@@ -124,9 +129,13 @@ int iris_inst_change_state(struct iris_inst *inst,
 int iris_inst_change_sub_state(struct iris_inst *inst,
 			       enum iris_inst_sub_state clear_sub_state,
 			       enum iris_inst_sub_state set_sub_state);
+
 int iris_inst_state_change_streamon(struct iris_inst *inst, u32 plane);
 int iris_inst_state_change_streamoff(struct iris_inst *inst, u32 plane);
 int iris_inst_sub_state_change_drc(struct iris_inst *inst);
+int iris_inst_sub_state_change_drain_last(struct iris_inst *inst);
 int iris_inst_sub_state_change_drc_last(struct iris_inst *inst);
+int iris_inst_sub_state_change_pause(struct iris_inst *inst, u32 plane);
+bool iris_allow_cmd(struct iris_inst *inst, u32 cmd);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
index 4775ff833bba..70ff10a23ba8 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.c
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -234,8 +234,10 @@ void iris_vb2_buf_queue(struct vb2_buffer *vb2)
 	}
 
 	if (V4L2_TYPE_IS_CAPTURE(vb2->vb2_queue->type)) {
-		if (inst->sub_state & IRIS_INST_SUB_DRC &&
-		    inst->sub_state & IRIS_INST_SUB_DRC_LAST) {
+		if ((inst->sub_state & IRIS_INST_SUB_DRC &&
+		     inst->sub_state & IRIS_INST_SUB_DRC_LAST) ||
+		    (inst->sub_state & IRIS_INST_SUB_DRAIN &&
+		     inst->sub_state & IRIS_INST_SUB_DRAIN_LAST)) {
 			vbuf->flags |= V4L2_BUF_FLAG_LAST;
 			vbuf->sequence = inst->sequence_cap++;
 			vbuf->field = V4L2_FIELD_NONE;
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 4327477b7d89..4b6b54f735fb 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -385,6 +385,7 @@ static int iris_vdec_process_streamon_input(struct iris_inst *inst)
 	}
 
 	if (inst->sub_state & IRIS_INST_SUB_DRC ||
+	    inst->sub_state & IRIS_INST_SUB_DRAIN ||
 	    inst->sub_state & IRIS_INST_SUB_FIRST_IPSC) {
 		if (!(inst->sub_state & IRIS_INST_SUB_INPUT_PAUSE)) {
 			if (hfi_ops->session_pause) {
@@ -436,15 +437,20 @@ int iris_vdec_streamon_input(struct iris_inst *inst)
 static int iris_vdec_process_streamon_output(struct iris_inst *inst)
 {
 	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	bool drain_active = false, drc_active = false;
 	enum iris_inst_sub_state clear_sub_state = 0;
-	bool drc_active = false;
 	int ret = 0;
 
+	drain_active = inst->sub_state & IRIS_INST_SUB_DRAIN &&
+		inst->sub_state & IRIS_INST_SUB_DRAIN_LAST;
+
 	drc_active = inst->sub_state & IRIS_INST_SUB_DRC &&
 		inst->sub_state & IRIS_INST_SUB_DRC_LAST;
 
 	if (drc_active)
 		clear_sub_state = IRIS_INST_SUB_DRC | IRIS_INST_SUB_DRC_LAST;
+	else if (drain_active)
+		clear_sub_state = IRIS_INST_SUB_DRAIN | IRIS_INST_SUB_DRAIN_LAST;
 
 	if (inst->sub_state & IRIS_INST_SUB_INPUT_PAUSE) {
 		ret = iris_alloc_and_queue_input_int_bufs(inst);
@@ -460,8 +466,12 @@ static int iris_vdec_process_streamon_output(struct iris_inst *inst)
 
 	if (inst->state == IRIS_INST_INPUT_STREAMING &&
 	    inst->sub_state & IRIS_INST_SUB_INPUT_PAUSE) {
-		ret = hfi_ops->session_resume_drc(inst,
-						  V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+		if (!drain_active)
+			ret = hfi_ops->session_resume_drc(inst,
+							  V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+		else if (hfi_ops->session_resume_drain)
+			ret = hfi_ops->session_resume_drain(inst,
+							    V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
 		if (ret)
 			return ret;
 		clear_sub_state |= IRIS_INST_SUB_INPUT_PAUSE;
@@ -582,3 +592,78 @@ int iris_vdec_qbuf(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
 
 	return iris_queue_buffer(inst, buf);
 }
+
+int iris_vdec_start_cmd(struct iris_inst *inst)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	enum iris_inst_sub_state clear_sub_state = 0;
+	struct vb2_queue *dst_vq;
+	int ret;
+
+	dst_vq = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
+
+	if (inst->sub_state & IRIS_INST_SUB_DRC &&
+	    inst->sub_state & IRIS_INST_SUB_DRC_LAST) {
+		vb2_clear_last_buffer_dequeued(dst_vq);
+		clear_sub_state = IRIS_INST_SUB_DRC | IRIS_INST_SUB_DRC_LAST;
+
+		if (inst->sub_state & IRIS_INST_SUB_INPUT_PAUSE) {
+			ret = hfi_ops->session_resume_drc(inst,
+							  V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+			if (ret)
+				return ret;
+			clear_sub_state |= IRIS_INST_SUB_INPUT_PAUSE;
+		}
+		if (inst->sub_state & IRIS_INST_SUB_OUTPUT_PAUSE) {
+			ret = hfi_ops->session_resume_drc(inst,
+							  V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+			if (ret)
+				return ret;
+			clear_sub_state |= IRIS_INST_SUB_OUTPUT_PAUSE;
+		}
+	} else if (inst->sub_state & IRIS_INST_SUB_DRAIN &&
+		   inst->sub_state & IRIS_INST_SUB_DRAIN_LAST) {
+		vb2_clear_last_buffer_dequeued(dst_vq);
+		clear_sub_state = IRIS_INST_SUB_DRAIN | IRIS_INST_SUB_DRAIN_LAST;
+		if (inst->sub_state & IRIS_INST_SUB_INPUT_PAUSE) {
+			if (hfi_ops->session_resume_drain) {
+				ret =
+				hfi_ops->session_resume_drain(inst,
+							      V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+				if (ret)
+					return ret;
+			}
+
+			clear_sub_state |= IRIS_INST_SUB_INPUT_PAUSE;
+		}
+		if (inst->sub_state & IRIS_INST_SUB_OUTPUT_PAUSE) {
+			if (hfi_ops->session_resume_drain) {
+				ret =
+				hfi_ops->session_resume_drain(inst,
+							      V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+				if (ret)
+					return ret;
+			}
+
+			clear_sub_state |= IRIS_INST_SUB_OUTPUT_PAUSE;
+		}
+	} else {
+		dev_err(inst->core->dev, "start called before receiving last_flag\n");
+		iris_inst_change_state(inst, IRIS_INST_ERROR);
+		return -EBUSY;
+	}
+
+	return iris_inst_change_sub_state(inst, clear_sub_state, 0);
+}
+
+int iris_vdec_stop_cmd(struct iris_inst *inst)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	int ret;
+
+	ret = hfi_ops->session_drain(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+	if (ret)
+		return ret;
+
+	return iris_inst_change_sub_state(inst, 0, IRIS_INST_SUB_DRAIN);
+}
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.h b/drivers/media/platform/qcom/iris/iris_vdec.h
index a5d63d6f7723..1d0231db24de 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.h
+++ b/drivers/media/platform/qcom/iris/iris_vdec.h
@@ -18,6 +18,8 @@ void iris_vdec_src_change(struct iris_inst *inst);
 int iris_vdec_streamon_input(struct iris_inst *inst);
 int iris_vdec_streamon_output(struct iris_inst *inst);
 int iris_vdec_qbuf(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf);
+int iris_vdec_start_cmd(struct iris_inst *inst);
+int iris_vdec_stop_cmd(struct iris_inst *inst);
 int iris_vdec_session_streamoff(struct iris_inst *inst, u32 plane);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 18e3b8bb42a6..07775869b723 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -365,6 +365,41 @@ static int iris_subscribe_event(struct v4l2_fh *fh, const struct v4l2_event_subs
 	return iris_vdec_subscribe_event(inst, sub);
 }
 
+static int iris_dec_cmd(struct file *filp, void *fh,
+			struct v4l2_decoder_cmd *dec)
+{
+	struct iris_inst *inst = iris_get_inst(filp, NULL);
+	int ret = 0;
+
+	mutex_lock(&inst->lock);
+
+	if (dec->cmd != V4L2_DEC_CMD_START &&
+	    dec->cmd != V4L2_DEC_CMD_STOP) {
+		ret = -EINVAL;
+		goto unlock;
+	}
+
+	if (inst->state == IRIS_INST_DEINIT)
+		goto unlock;
+
+	if (!iris_allow_cmd(inst, dec->cmd)) {
+		ret = -EBUSY;
+		goto unlock;
+	}
+
+	if (dec->cmd == V4L2_DEC_CMD_START)
+		ret = iris_vdec_start_cmd(inst);
+	else if (dec->cmd == V4L2_DEC_CMD_STOP)
+		ret = iris_vdec_stop_cmd(inst);
+	else
+		ret = -EINVAL;
+
+unlock:
+	mutex_unlock(&inst->lock);
+
+	return ret;
+}
+
 static struct v4l2_file_operations iris_v4l2_file_ops = {
 	.owner                          = THIS_MODULE,
 	.open                           = iris_open,
@@ -408,6 +443,8 @@ static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops = {
 	.vidioc_unsubscribe_event       = v4l2_event_unsubscribe,
 	.vidioc_streamon                = v4l2_m2m_ioctl_streamon,
 	.vidioc_streamoff               = v4l2_m2m_ioctl_streamoff,
+	.vidioc_try_decoder_cmd         = v4l2_m2m_ioctl_try_decoder_cmd,
+	.vidioc_decoder_cmd             = iris_dec_cmd,
 };
 
 void iris_init_ops(struct iris_core *core)

-- 
2.34.1


