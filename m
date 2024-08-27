Return-Path: <linux-media+bounces-16909-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 351B1960706
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 12:10:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5AB3A1C22951
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 10:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 085081A4B9F;
	Tue, 27 Aug 2024 10:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="juMi7WWy"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D2E1A256A;
	Tue, 27 Aug 2024 10:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724753197; cv=none; b=tQZNS1GJru4u35z6+i/nlGcaPdBw7ZuB6cOUgEn6+f5pGjqMD3MyD+yvbJEZBz/qVZnRn0wIu+9z+qvCEICwDa+tKBx+9XuuVHNo8SRrCVMRVTh0aGKbyeinf47ao1aVkjGLT9VobpD/WxkKyg/hW/G/wSOKAAoKcTtdU4oGTeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724753197; c=relaxed/simple;
	bh=lEsZ8VdAZIMGM4/Gx/+jsJ4lARBe5/lCLdrttajtXVI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aR+HmCKHVdEspXXoCkybWh07amkH4jsMv9Qi59HBck1xMail0BrSRV/eblLT7Yr6rAoANeZ9KWvEu4dQTehdTT9+a5g4Sl82nT/0KS+PoAIGoXUa7XLiK0B52lTH2GBuypw1TmZRCxF15NHpDaIWt9GqHPdjfZzT4rkW+qBpowk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=juMi7WWy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 94E11C4FEB0;
	Tue, 27 Aug 2024 10:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724753196;
	bh=lEsZ8VdAZIMGM4/Gx/+jsJ4lARBe5/lCLdrttajtXVI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=juMi7WWyx6RdqTusr0vIO+Z4WZipP6ZkH+OSbGc+VeEITzEzZobQ8hYBH37c9B9hi
	 GTLfhVIHRpqJcjNNBBFnSD+hUDSxV4tKtfnnNPulliqTD0FJX5K8B3RpYzbelcxqD5
	 tvY2asyKO2OZDaYDRg76j5DhB0qGo3a+6869gqhJgTQ/0WUbkye6nxIqqvyffqChb+
	 49aXmQ29YW/GfxsWypn+/Hbd4eYfaVHUI0ifAhLzMKUiPnOIkqih1OSU0grrZyVq3a
	 onOKm82hl+Ho6AWF7bcBCCSRKLe0s8l0+tdireEdGsasElCn8XtfT30nQw+Etqrm25
	 CaYokdZOtUIFw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89028C54736;
	Tue, 27 Aug 2024 10:06:36 +0000 (UTC)
From: Dikshita Agarwal via B4 Relay <devnull+quic_dikshita.quicinc.com@kernel.org>
Date: Tue, 27 Aug 2024 15:35:50 +0530
Subject: [PATCH v3 25/29] media: iris: add support for drain sequence
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240827-iris_v3-v3-25-c5fdbbe65e70@quicinc.com>
References: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
In-Reply-To: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724753190; l=23616;
 i=quic_dikshita@quicinc.com; s=20240826; h=from:subject:message-id;
 bh=o/SpScyY2OTjOGR+Ow4+9nzhdiAuBrhMDfgaB2nN4lg=;
 b=TXR5abSlYWO7CYYPSj/d4thqd8m1ZsxTnom/IuO3wYup3JVgpyqY5xfJKOCcQbQ6Udo2oK3Co
 SdKwgEJLACnBfKFBcnXXGd8fY6EmQfGHL2WeBm5WixMQ/3C/ZKLjheE
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=+c7562uu1Y968VTv9z59ch2v3jmlO2Qv3uX7srN3LJY=
X-Endpoint-Received: by B4 Relay for quic_dikshita@quicinc.com/20240826
 with auth_id=199
X-Original-From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Reply-To: quic_dikshita@quicinc.com

From: Dikshita Agarwal <quic_dikshita@quicinc.com>

handle the V4L2_DEC_CMD_STOP by initiating drain sequence
to firmware.
Process and decode all OUTPUT buffers queued by the client
before the VIDIOC_DECODER_CMD() was issued and mark the last
buffer with V4L2_BUF_FLAG_LAST flag. Decoder is stopped after
processing the last buffer.

Resume the decoder when one of below are issued by client:
- V4L2_DEC_CMD_START
- pair of VIDIOC_STREAMOFF() and VIDIOC_STREAMON() on the CAPTURE queue
- pair of VIDIOC_STREAMOFF() and VIDIOC_STREAMON() on the OUTPUT queue

Add the handling to resume decoding when client issues
V4L2_DEC_CMD_START to resume decoding after source change is
detected.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_common.h |   2 +
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  13 +++
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |   1 +
 .../platform/qcom/iris/iris_hfi_gen1_response.c    |  14 +++
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |  43 +++++++++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   2 +
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  46 ++++++++-
 drivers/media/platform/qcom/iris/iris_state.c      |  36 +++++++
 drivers/media/platform/qcom/iris/iris_state.h      |  11 ++-
 drivers/media/platform/qcom/iris/iris_vb2.c        |   6 +-
 drivers/media/platform/qcom/iris/iris_vdec.c       | 105 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_vdec.h       |   2 +
 drivers/media/platform/qcom/iris/iris_vidc.c       |  36 +++++++
 13 files changed, 307 insertions(+), 10 deletions(-)

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
index d65aacb2bb13..17333768afa2 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -369,6 +369,18 @@ static int iris_hfi_gen1_session_unset_buffers(struct iris_inst *inst, struct ir
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
@@ -797,6 +809,7 @@ static const struct iris_hfi_command_ops iris_hfi_gen1_command_ops = {
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
index e3d9bfb8bef6..2d537babd3e7 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -378,6 +378,7 @@ static void iris_hfi_gen1_session_ftb_done(struct iris_inst *inst, void *packet)
 	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
 	struct v4l2_m2m_buffer *m2m_buffer, *n;
 	u32 timestamp_hi = 0, timestamp_lo = 0;
+	struct hfi_session_flush_pkt flush_pkt;
 	struct iris_buffer *buf = NULL, *iter;
 	struct iris_core *core = inst->core;
 	u32 pic_type = 0, output_tag = -1;
@@ -393,6 +394,19 @@ static void iris_hfi_gen1_session_ftb_done(struct iris_inst *inst, void *packet)
 	pic_type = pkt->picture_type;
 	output_tag = pkt->output_tag;
 
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
index 42e86d6d435c..ee73a2b072db 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -822,6 +822,47 @@ static int iris_hfi_gen2_session_resume_drc(struct iris_inst *inst, u32 plane)
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
@@ -946,6 +987,8 @@ static const struct iris_hfi_command_ops iris_hfi_gen2_command_ops = {
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
index 626a858e803c..8b3402635674 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -202,6 +202,10 @@ static int iris_hfi_gen2_handle_session_info(struct iris_inst *inst,
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
@@ -329,6 +333,12 @@ static int iris_hfi_gen2_handle_output_buffer(struct iris_inst *inst,
 	int ret = 0;
 	bool found = false;
 
+	if (hfi_buffer->flags & HFI_BUF_FW_FLAG_LAST) {
+		ret = iris_inst_sub_state_change_drain_last(inst);
+		if (ret)
+			return ret;
+	}
+
 	if (hfi_buffer->flags & HFI_BUF_FW_FLAG_PSC_LAST) {
 		ret = iris_inst_sub_state_change_drc_last(inst);
 		if (ret)
@@ -429,6 +439,21 @@ static int iris_hfi_gen2_handle_release_internal_buffer(struct iris_inst *inst,
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
@@ -457,6 +482,22 @@ static int iris_hfi_gen2_handle_session_buffer(struct iris_inst *inst,
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
@@ -569,7 +610,7 @@ static int iris_hfi_gen2_handle_session_command(struct iris_inst *inst,
 		iris_hfi_gen2_handle_session_close(inst, pkt);
 		break;
 	case HFI_CMD_STOP:
-		complete(&inst->completion);
+		iris_hfi_gen2_handle_session_stop(inst, pkt);
 		break;
 	case HFI_CMD_BUFFER:
 		ret = iris_hfi_gen2_handle_session_buffer(inst, pkt);
@@ -577,6 +618,9 @@ static int iris_hfi_gen2_handle_session_command(struct iris_inst *inst,
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
index e39c110b75e0..d37f99d72491 100644
--- a/drivers/media/platform/qcom/iris/iris_state.c
+++ b/drivers/media/platform/qcom/iris/iris_state.c
@@ -160,6 +160,21 @@ int iris_inst_sub_state_change_drc(struct iris_inst *inst)
 	return iris_inst_change_sub_state(inst, 0, set_sub_state);
 }
 
+int iris_inst_sub_state_change_drain_last(struct iris_inst *inst)
+{
+	enum iris_inst_sub_state set_sub_state = IRIS_INST_SUB_NONE;
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
 	enum iris_inst_sub_state set_sub_state = IRIS_INST_SUB_NONE;
@@ -178,3 +193,24 @@ int iris_inst_sub_state_change_drc_last(struct iris_inst *inst)
 
 	return iris_inst_change_sub_state(inst, 0, set_sub_state);
 }
+
+int iris_inst_sub_state_change_pause(struct iris_inst *inst, u32 plane)
+{
+	enum iris_inst_sub_state set_sub_state = IRIS_INST_SUB_NONE;
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
diff --git a/drivers/media/platform/qcom/iris/iris_state.h b/drivers/media/platform/qcom/iris/iris_state.h
index 786b82ca0307..a01037918a9c 100644
--- a/drivers/media/platform/qcom/iris/iris_state.h
+++ b/drivers/media/platform/qcom/iris/iris_state.h
@@ -106,6 +106,9 @@ enum iris_inst_state {
  *		      sent to client.
  * IRIS_INST_SUB_DRC_LAST: indicates last buffer is received from firmware
  *                         as part of source change.
+ * IRIS_INST_SUB_DRAIN: indicates drain is in progress.
+ * IRIS_INST_SUB_DRAIN_LAST: indicates last buffer is received from firmware
+ *                           as part of drain sequence.
  * IRIS_INST_SUB_INPUT_PAUSE: source change is received form firmware. This
  *                            indicates that firmware is paused to process
  *                            any further input frames.
@@ -117,8 +120,10 @@ enum iris_inst_sub_state {
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
 
 void iris_change_core_state(struct iris_core *core,
@@ -131,5 +136,7 @@ int iris_inst_change_sub_state(struct iris_inst *inst,
 int iris_inst_state_change_streamon(struct iris_inst *inst, u32 plane);
 int iris_inst_state_change_streamoff(struct iris_inst *inst, u32 plane);
 int iris_inst_sub_state_change_drc(struct iris_inst *inst);
+int iris_inst_sub_state_change_drain_last(struct iris_inst *inst);
 int iris_inst_sub_state_change_drc_last(struct iris_inst *inst);
+int iris_inst_sub_state_change_pause(struct iris_inst *inst, u32 plane);
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
index cc9d5f14d125..8bed24cf610e 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.c
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -229,8 +229,10 @@ void iris_vb2_buf_queue(struct vb2_buffer *vb2)
 	}
 
 	if (V4L2_TYPE_IS_CAPTURE(vb2->vb2_queue->type)) {
-		if (inst->sub_state & IRIS_INST_SUB_DRC &&
-		    inst->sub_state & IRIS_INST_SUB_DRC_LAST) {
+		if ((inst->sub_state & IRIS_INST_SUB_DRC &&
+		     inst->sub_state & IRIS_INST_SUB_DRC_LAST) ||
+		    (inst->sub_state & IRIS_INST_SUB_DRAIN &&
+		     inst->sub_state & IRIS_INST_SUB_DRAIN_LAST)) {
 			vbuf->flags |= V4L2_BUF_FLAG_LAST;
 			vbuf->field = V4L2_FIELD_NONE;
 			vb2_set_plane_payload(vb2, 0, 0);
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 6d3b06150cf7..b8d2d6846daa 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -399,6 +399,7 @@ static int iris_vdec_process_streamon_input(struct iris_inst *inst)
 	}
 
 	if (inst->sub_state & IRIS_INST_SUB_DRC ||
+	    inst->sub_state & IRIS_INST_SUB_DRAIN ||
 	    inst->sub_state & IRIS_INST_SUB_FIRST_IPSC) {
 		if (!(inst->sub_state & IRIS_INST_SUB_INPUT_PAUSE)) {
 			if (hfi_ops->session_pause) {
@@ -457,14 +458,19 @@ static int iris_vdec_process_streamon_output(struct iris_inst *inst)
 {
 	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
 	enum iris_inst_sub_state clear_sub_state = IRIS_INST_SUB_NONE;
-	bool drc_active = false;
+	bool drain_active = false, drc_active = false;
 	int ret;
 
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
@@ -480,10 +486,20 @@ static int iris_vdec_process_streamon_output(struct iris_inst *inst)
 
 	if (inst->state == IRIS_INST_INPUT_STREAMING &&
 	    inst->sub_state & IRIS_INST_SUB_INPUT_PAUSE) {
-		ret = hfi_ops->session_resume_drc(inst,
-						  V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
-		if (ret)
-			return ret;
+		if (!drain_active) {
+			ret = hfi_ops->session_resume_drc(inst,
+							  V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+			if (ret)
+				return ret;
+		} else {
+			if (hfi_ops->session_resume_drain) {
+				ret =
+				hfi_ops->session_resume_drain(inst,
+							      V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+				if (ret)
+					return ret;
+			}
+		}
 		clear_sub_state |= IRIS_INST_SUB_INPUT_PAUSE;
 	}
 
@@ -584,3 +600,82 @@ int iris_vdec_qbuf(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
 
 	return iris_queue_buffer(inst, buf);
 }
+
+int iris_vdec_start_cmd(struct iris_inst *inst)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	enum iris_inst_sub_state clear_sub_state = IRIS_INST_SUB_NONE;
+	struct vb2_queue *dst_vq;
+	int ret;
+
+	dst_vq = v4l2_m2m_get_vq(inst->m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
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
+			   inst->sub_state & IRIS_INST_SUB_DRAIN_LAST) {
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
+	ret = iris_inst_change_sub_state(inst, clear_sub_state, 0);
+
+	return ret;
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
+	iris_inst_change_sub_state(inst, 0, IRIS_INST_SUB_DRAIN);
+
+	return ret;
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
index 34c2548bce9f..07eb276472f6 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -603,6 +603,40 @@ static int iris_unsubscribe_event(struct v4l2_fh *fh, const struct v4l2_event_su
 	return ret;
 }
 
+static int iris_dec_cmd(struct file *filp, void *fh,
+			struct v4l2_decoder_cmd *dec)
+{
+	struct iris_inst *inst;
+	int ret = 0;
+
+	inst = iris_get_inst(filp, fh);
+	if (!inst || !dec)
+		return -EINVAL;
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
@@ -645,6 +679,8 @@ static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops = {
 	.vidioc_unsubscribe_event       = iris_unsubscribe_event,
 	.vidioc_streamon                = v4l2_m2m_ioctl_streamon,
 	.vidioc_streamoff               = v4l2_m2m_ioctl_streamoff,
+	.vidioc_try_decoder_cmd         = v4l2_m2m_ioctl_try_decoder_cmd,
+	.vidioc_decoder_cmd             = iris_dec_cmd,
 };
 
 void iris_init_ops(struct iris_core *core)

-- 
2.34.1



