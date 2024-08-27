Return-Path: <linux-media+bounces-16906-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CB95E960703
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 12:10:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E20411C228D6
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 10:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3A021A4B6F;
	Tue, 27 Aug 2024 10:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lu4SglL4"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7752E1A08B1;
	Tue, 27 Aug 2024 10:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724753196; cv=none; b=jEKAeUNvUqJLL6AV7QlwEUgCG7c+LuG23xVPwpqLPS+QrJHlh3DdCmtDLL3yYv89lmWAmdu6fpsNTQ71ufOPd6vPpK73+eSIz1etRJZk40I8F7FJ9+JSLZhIGTqj9RV65O64+mVUDcRwDgBJee9fMBuSXPhVw959Devmqm8GKxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724753196; c=relaxed/simple;
	bh=Jktsc4+XkkJiJ7GPYzKUtgSH15yBHyp8CsMXKASnWjw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D4bdUxtJMESSjrPREWBU2JIemmsx75nirQNf/u70CKB5k8XWmLJvBUZHVupiD0eWMZxLIyPB6eZO2fN3kexad3yLFlsGAj9Ir0pSNim6mTLVRjYhs4lJCj96QufPsSPKpFX7HQUCZgXHaF/A/kKh/fQbZrdeOnM6NJuJ9FvINOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lu4SglL4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4D6F7C4AF61;
	Tue, 27 Aug 2024 10:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724753196;
	bh=Jktsc4+XkkJiJ7GPYzKUtgSH15yBHyp8CsMXKASnWjw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lu4SglL4qIZyyb21vnR5u8KkpYm9SR3FwaQ2bCfqe7T+ZiomN1IbZe0crhYvvo3fA
	 ysNvvtwJGNlVUrlvtQYZkJ70U/kB/cyKgXx83wa6p1MnBYduqnOJnJXEuiUHc+wlbx
	 7dgiEACe+f7ztsfu+F7d9nE+98ZqbRIj/pXTJVKzaQVRqYlIw1pGuTKY6rsnjIISkV
	 rAg//pTpz10iv7ATsuFJIzc4jbSZSfpGWbBM0w3pk5DJ++NoxsYCL8MWbgViRrSWRR
	 M7kuM7dn4ueR39qDUe9mXubGrs0O1IciJE7YqerTMFUpWdH/wzrHqGi4jBMcXbK7hR
	 +R56nONL0V0Lg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FCC5C54735;
	Tue, 27 Aug 2024 10:06:36 +0000 (UTC)
From: Dikshita Agarwal via B4 Relay <devnull+quic_dikshita.quicinc.com@kernel.org>
Date: Tue, 27 Aug 2024 15:35:47 +0530
Subject: [PATCH v3 22/29] media: iris: implement vb2 ops for buf_queue and
 firmware response
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240827-iris_v3-v3-22-c5fdbbe65e70@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724753190; l=43514;
 i=quic_dikshita@quicinc.com; s=20240826; h=from:subject:message-id;
 bh=PtNAnaCUiK3M62TveAlkDRKHkx76I9vCsxoGucFGC/8=;
 b=tPt5LEg73KTMrXCMuz6QkPYiLBQHgJGSKrQbiAlX2uDwaUMSs4nrzCtpz0/MayOvzllAAWU2t
 7RvqgMtLyaDAVDmHwlGNXd6nPYVDNiXztg5Yv8rkmGIDOD+VuTSUpar
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=+c7562uu1Y968VTv9z59ch2v3jmlO2Qv3uX7srN3LJY=
X-Endpoint-Received: by B4 Relay for quic_dikshita@quicinc.com/20240826
 with auth_id=199
X-Original-From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Reply-To: quic_dikshita@quicinc.com

From: Dikshita Agarwal <quic_dikshita@quicinc.com>

Implement vb2 ops for buf queue. Below are the different
buffer attributes:
BUF_ATTR_DEFERRED - buffer queued by client but not submitted
to firmware.
BUF_ATTR_PENDING_RELEASE - buffers requested to be released
from firmware.
BUF_ATTR_QUEUED - buffers submitted to firmware.
BUF_ATTR_DEQUEUED - buffers received from firmware.
BUF_ATTR_BUFFER_DONE - buffers sent back to vb2.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/Kconfig           |   1 +
 drivers/media/platform/qcom/iris/iris_buffer.c     |  82 +++++++++
 drivers/media/platform/qcom/iris/iris_buffer.h     |   2 +
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  53 ++++++
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  80 +++++++++
 .../platform/qcom/iris/iris_hfi_gen1_response.c    | 170 ++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_hfi_gen2.h   |   2 +
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  22 +++
 .../platform/qcom/iris/iris_hfi_gen2_response.c    | 185 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_utils.c      |  16 ++
 drivers/media/platform/qcom/iris/iris_utils.h      |   9 +
 drivers/media/platform/qcom/iris/iris_vb2.c        |  70 +++++++-
 drivers/media/platform/qcom/iris/iris_vb2.h        |   2 +
 drivers/media/platform/qcom/iris/iris_vdec.c       | 129 +++++++++++++-
 drivers/media/platform/qcom/iris/iris_vdec.h       |   3 +-
 drivers/media/platform/qcom/iris/iris_vidc.c       |  11 ++
 16 files changed, 825 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/Kconfig b/drivers/media/platform/qcom/iris/Kconfig
index ea518760c65c..dbec672ccf37 100644
--- a/drivers/media/platform/qcom/iris/Kconfig
+++ b/drivers/media/platform/qcom/iris/Kconfig
@@ -5,6 +5,7 @@ config VIDEO_QCOM_IRIS
         select V4L2_MEM2MEM_DEV
         select QCOM_MDT_LOADER if ARCH_QCOM
         select QCOM_SCM
+        select VIDEOBUF2_DMA_CONTIG
         help
           This is a V4L2 driver for Qualcomm Iris video accelerator
           hardware. It accelerates decoding operations on various
diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index 57f3ffd8596a..ed97e9f145a5 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
 
 #include "iris_buffer.h"
@@ -439,6 +440,36 @@ int iris_alloc_and_queue_persist_bufs(struct iris_inst *inst)
 	return ret;
 }
 
+int iris_queue_deferred_buffers(struct iris_inst *inst, enum iris_buffer_type buf_type)
+{
+	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
+	struct v4l2_m2m_buffer *buffer, *n;
+	struct iris_buffer *buf = NULL;
+	int ret;
+
+	if (buf_type == BUF_INPUT) {
+		v4l2_m2m_for_each_src_buf_safe(m2m_ctx, buffer, n) {
+			buf = to_iris_buffer(&buffer->vb);
+			if (!(buf->attr & BUF_ATTR_DEFERRED))
+				continue;
+			ret = iris_queue_buffer(inst, buf);
+			if (ret)
+				return ret;
+		}
+	} else {
+		v4l2_m2m_for_each_dst_buf_safe(m2m_ctx, buffer, n) {
+			buf = to_iris_buffer(&buffer->vb);
+			if (!(buf->attr & BUF_ATTR_DEFERRED))
+				continue;
+			ret = iris_queue_buffer(inst, buf);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
 void iris_vb2_queue_error(struct iris_inst *inst)
 {
 	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
@@ -449,3 +480,54 @@ void iris_vb2_queue_error(struct iris_inst *inst)
 	q = v4l2_m2m_get_dst_vq(m2m_ctx);
 	vb2_queue_error(q);
 }
+
+static struct vb2_v4l2_buffer *
+iris_helper_find_buf(struct iris_inst *inst, unsigned int type, u32 idx)
+{
+	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
+
+	if (V4L2_TYPE_IS_OUTPUT(type))
+		return v4l2_m2m_src_buf_remove_by_idx(m2m_ctx, idx);
+	else
+		return v4l2_m2m_dst_buf_remove_by_idx(m2m_ctx, idx);
+}
+
+int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
+{
+	struct vb2_v4l2_buffer *vbuf;
+	struct vb2_buffer *vb2;
+	int type, state;
+
+	if (buf->type == BUF_INPUT)
+		type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
+	else if (buf->type == BUF_OUTPUT)
+		type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+	else
+		return 0; /* Internal DPB Buffers */
+
+	vbuf = iris_helper_find_buf(inst, type, buf->index);
+	if (!vbuf)
+		return -EINVAL;
+
+	vb2 = &vbuf->vb2_buf;
+
+	if (buf->flags & V4L2_BUF_FLAG_ERROR)
+		state = VB2_BUF_STATE_ERROR;
+	else
+		state = VB2_BUF_STATE_DONE;
+
+	vbuf->flags = buf->flags;
+
+	if (vbuf->flags & V4L2_BUF_FLAG_LAST) {
+		if (inst->subscriptions & V4L2_EVENT_EOS) {
+			const struct v4l2_event ev = { .type = V4L2_EVENT_EOS };
+
+			v4l2_event_queue_fh(&inst->fh, &ev);
+		}
+	}
+	vb2->timestamp = buf->timestamp;
+	vb2->planes[0].bytesused = buf->data_size + vb2->planes[0].data_offset;
+	v4l2_m2m_buf_done(vbuf, state);
+
+	return 0;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_buffer.h b/drivers/media/platform/qcom/iris/iris_buffer.h
index 41e090e9f0b0..bd8b74a9fbc4 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.h
+++ b/drivers/media/platform/qcom/iris/iris_buffer.h
@@ -109,6 +109,8 @@ int iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buf
 int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane);
 int iris_alloc_and_queue_persist_bufs(struct iris_inst *inst);
 int iris_queue_buffer(struct iris_inst *inst, struct iris_buffer *buf);
+int iris_queue_deferred_buffers(struct iris_inst *inst, enum iris_buffer_type buf_type);
+int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf);
 void iris_vb2_queue_error(struct iris_inst *inst);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index be45a38166eb..5edee12d6a1b 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -180,6 +180,10 @@ static int iris_hfi_gen1_session_stop(struct iris_inst *inst, u32 plane)
 		ret = iris_hfi_queue_cmd_write(core, &pkt, pkt.shdr.hdr.size);
 		if (!ret)
 			ret = iris_wait_for_session_response(inst, false);
+		iris_helper_buffers_done(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+					 VB2_BUF_STATE_ERROR);
+		iris_helper_buffers_done(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+					 VB2_BUF_STATE_ERROR);
 	} else if (inst->state == IRIS_INST_STREAMING) {
 		if (V4L2_TYPE_IS_OUTPUT(plane))
 			flush_type = HFI_FLUSH_ALL;
@@ -201,6 +205,50 @@ static int iris_hfi_gen1_session_stop(struct iris_inst *inst, u32 plane)
 	return ret;
 }
 
+static int iris_hfi_gen1_queue_input_buffer(struct iris_inst *inst, struct iris_buffer *buf)
+{
+	struct hfi_session_empty_buffer_compressed_pkt ip_pkt;
+
+	ip_pkt.shdr.hdr.size = sizeof(struct hfi_session_empty_buffer_compressed_pkt);
+	ip_pkt.shdr.hdr.pkt_type = HFI_CMD_SESSION_EMPTY_BUFFER;
+	ip_pkt.shdr.session_id = inst->session_id;
+	ip_pkt.time_stamp_hi = upper_32_bits(buf->timestamp);
+	ip_pkt.time_stamp_lo = lower_32_bits(buf->timestamp);
+	ip_pkt.flags = buf->flags;
+	ip_pkt.mark_target = 0;
+	ip_pkt.mark_data = 0;
+	ip_pkt.offset = buf->data_offset;
+	ip_pkt.alloc_len = buf->buffer_size;
+	ip_pkt.filled_len = buf->data_size;
+	ip_pkt.input_tag = buf->index;
+	ip_pkt.packet_buffer = buf->device_addr;
+
+	return iris_hfi_queue_cmd_write(inst->core, &ip_pkt, ip_pkt.shdr.hdr.size);
+}
+
+static int iris_hfi_gen1_queue_output_buffer(struct iris_inst *inst, struct iris_buffer *buf)
+{
+	struct hfi_session_fill_buffer_pkt op_pkt;
+
+	op_pkt.shdr.hdr.size = sizeof(struct hfi_session_fill_buffer_pkt);
+	op_pkt.shdr.hdr.pkt_type = HFI_CMD_SESSION_FILL_BUFFER;
+	op_pkt.shdr.session_id = inst->session_id;
+	op_pkt.output_tag = buf->index;
+	op_pkt.packet_buffer = buf->device_addr;
+	op_pkt.extradata_buffer = 0;
+	op_pkt.alloc_len = buf->buffer_size;
+	op_pkt.filled_len = buf->data_size;
+	op_pkt.offset = buf->data_offset;
+	op_pkt.data = 0;
+
+	if (buf->type == BUF_OUTPUT && iris_split_mode_enabled(inst))
+		op_pkt.stream_id = 1;
+	else
+		op_pkt.stream_id = 0;
+
+	return iris_hfi_queue_cmd_write(inst->core, &op_pkt, op_pkt.shdr.hdr.size);
+}
+
 static int iris_hfi_gen1_queue_internal_buffer(struct iris_inst *inst, struct iris_buffer *buf)
 {
 	struct hfi_session_set_buffers_pkt *int_pkt;
@@ -240,6 +288,11 @@ static int iris_hfi_gen1_queue_internal_buffer(struct iris_inst *inst, struct ir
 static int iris_hfi_gen1_session_queue_buffer(struct iris_inst *inst, struct iris_buffer *buf)
 {
 	switch (buf->type) {
+	case BUF_INPUT:
+		return iris_hfi_gen1_queue_input_buffer(inst, buf);
+	case BUF_OUTPUT:
+	case BUF_DPB:
+		return iris_hfi_gen1_queue_output_buffer(inst, buf);
 	case BUF_PERSIST:
 	case BUF_BIN:
 	case BUF_SCRATCH_1:
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index 5527233b03e5..b7f9e0f47675 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -29,11 +29,14 @@
 #define HFI_CMD_SESSION_LOAD_RESOURCES			0x211001
 #define HFI_CMD_SESSION_START				0x211002
 #define HFI_CMD_SESSION_STOP				0x211003
+#define HFI_CMD_SESSION_EMPTY_BUFFER			0x211004
+#define HFI_CMD_SESSION_FILL_BUFFER			0x211005
 #define HFI_CMD_SESSION_FLUSH				0x211008
 #define HFI_CMD_SESSION_RELEASE_BUFFERS			0x21100b
 #define HFI_CMD_SESSION_RELEASE_RESOURCES		0x21100c
 
 #define HFI_ERR_SESSION_UNSUPPORTED_SETTING		0x1008
+#define HFI_ERR_SESSION_UNSUPPORTED_STREAM		0x100d
 #define HFI_ERR_SESSION_UNSUPPORT_BUFFERTYPE		0x1010
 #define HFI_ERR_SESSION_INVALID_SCALE_FACTOR		0x1012
 #define HFI_ERR_SESSION_UPSCALE_NOT_SUPPORTED		0x1013
@@ -41,6 +44,8 @@
 #define HFI_EVENT_SYS_ERROR				0x1
 #define HFI_EVENT_SESSION_ERROR				0x2
 
+#define HFI_BUFFERFLAG_TIMESTAMPINVALID			0x00000100
+
 #define HFI_FLUSH_OUTPUT				0x1000002
 #define HFI_FLUSH_OUTPUT2				0x1000003
 #define HFI_FLUSH_ALL					0x1000004
@@ -84,9 +89,19 @@
 #define HFI_MSG_SESSION_START				0x221002
 #define HFI_MSG_SESSION_STOP				0x221003
 #define HFI_MSG_SESSION_FLUSH				0x221006
+#define HFI_MSG_SESSION_EMPTY_BUFFER			0x221007
+#define HFI_MSG_SESSION_FILL_BUFFER			0x221008
 #define HFI_MSG_SESSION_RELEASE_RESOURCES		0x22100a
 #define HFI_MSG_SESSION_RELEASE_BUFFERS			0x22100c
 
+#define HFI_PICTURE_I					0x00000001
+#define HFI_PICTURE_P					0x00000002
+#define HFI_PICTURE_B					0x00000004
+#define HFI_PICTURE_IDR					0x00000008
+#define HFI_FRAME_NOTCODED				0x7f002000
+#define HFI_FRAME_YUV					0x7f004000
+#define HFI_UNUSED_PICT					0x10000000
+
 struct hfi_pkt_hdr {
 	u32 size;
 	u32 pkt_type;
@@ -144,6 +159,34 @@ struct hfi_session_set_buffers_pkt {
 	u32 buffer_info[];
 };
 
+struct hfi_session_empty_buffer_compressed_pkt {
+	struct hfi_session_hdr_pkt shdr;
+	u32 time_stamp_hi;
+	u32 time_stamp_lo;
+	u32 flags;
+	u32 mark_target;
+	u32 mark_data;
+	u32 offset;
+	u32 alloc_len;
+	u32 filled_len;
+	u32 input_tag;
+	u32 packet_buffer;
+	u32 extradata_buffer;
+	u32 data;
+};
+
+struct hfi_session_fill_buffer_pkt {
+	struct hfi_session_hdr_pkt shdr;
+	u32 stream_id;
+	u32 offset;
+	u32 alloc_len;
+	u32 filled_len;
+	u32 output_tag;
+	u32 packet_buffer;
+	u32 extradata_buffer;
+	u32 data;
+};
+
 struct hfi_session_flush_pkt {
 	struct hfi_session_hdr_pkt shdr;
 	u32 flush_type;
@@ -258,6 +301,43 @@ struct hfi_multi_stream {
 	u32 enable;
 };
 
+struct hfi_msg_session_empty_buffer_done_pkt {
+	struct hfi_msg_session_hdr_pkt shdr;
+	u32 offset;
+	u32 filled_len;
+	u32 input_tag;
+	u32 packet_buffer;
+	u32 extradata_buffer;
+	u32 data[];
+};
+
+struct hfi_msg_session_fbd_uncompressed_plane0_pkt {
+	struct hfi_session_hdr_pkt shdr;
+	u32 stream_id;
+	u32 view_id;
+	u32 error_type;
+	u32 time_stamp_hi;
+	u32 time_stamp_lo;
+	u32 flags;
+	u32 mark_target;
+	u32 mark_data;
+	u32 stats;
+	u32 alloc_len;
+	u32 filled_len;
+	u32 offset;
+	u32 frame_width;
+	u32 frame_height;
+	u32 start_x_coord;
+	u32 start_y_coord;
+	u32 input_tag;
+	u32 input_tag2;
+	u32 output_tag;
+	u32 picture_type;
+	u32 packet_buffer;
+	u32 extradata_buffer;
+	u32 data[];
+};
+
 struct hfi_msg_session_release_buffers_done_pkt {
 	struct hfi_msg_session_hdr_pkt shdr;
 	u32 num_buffers;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index af1f59c43b92..32fb01616122 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -3,6 +3,8 @@
  * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <media/v4l2-mem2mem.h>
+
 #include "iris_hfi_gen1.h"
 #include "iris_hfi_gen1_defines.h"
 #include "iris_instance.h"
@@ -123,6 +125,146 @@ static void iris_hfi_gen1_sys_property_info(struct iris_core *core, void *packet
 	}
 }
 
+static void iris_hfi_gen1_session_etb_done(struct iris_inst *inst, void *packet)
+{
+	struct hfi_msg_session_empty_buffer_done_pkt *pkt = packet;
+	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
+	struct v4l2_m2m_buffer *m2m_buffer, *n;
+	struct iris_buffer *buf = NULL;
+	bool found = false;
+
+	v4l2_m2m_for_each_src_buf_safe(m2m_ctx, m2m_buffer, n) {
+		buf = to_iris_buffer(&m2m_buffer->vb);
+		if (buf->index == pkt->input_tag) {
+			found = true;
+			break;
+		}
+	}
+	if (!found)
+		goto error;
+
+	if (pkt->shdr.error_type == HFI_ERR_SESSION_UNSUPPORTED_STREAM) {
+		buf->flags = V4L2_BUF_FLAG_ERROR;
+		iris_vb2_queue_error(inst);
+		iris_inst_change_state(inst, IRIS_INST_ERROR);
+	}
+
+	if (!(buf->attr & BUF_ATTR_QUEUED))
+		return;
+
+	buf->data_size = pkt->filled_len;
+	buf->attr &= ~BUF_ATTR_QUEUED;
+
+	if (!(buf->attr & BUF_ATTR_BUFFER_DONE)) {
+		buf->attr |= BUF_ATTR_BUFFER_DONE;
+		iris_vb2_buffer_done(inst, buf);
+	}
+
+	return;
+
+error:
+	iris_inst_change_state(inst, IRIS_INST_ERROR);
+	dev_err(inst->core->dev, "error in etb done\n");
+}
+
+static void iris_hfi_gen1_session_ftb_done(struct iris_inst *inst, void *packet)
+{
+	struct hfi_msg_session_fbd_uncompressed_plane0_pkt *pkt = packet;
+	u32 flags = 0, hfi_flags = 0, offset = 0, filled_len = 0;
+	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
+	struct v4l2_m2m_buffer *m2m_buffer, *n;
+	u32 timestamp_hi = 0, timestamp_lo = 0;
+	struct iris_buffer *buf = NULL, *iter;
+	struct iris_core *core = inst->core;
+	u32 pic_type = 0, output_tag = -1;
+	struct iris_buffers *buffers;
+	u64 timestamp_us = 0;
+	bool found = false;
+
+	timestamp_hi = pkt->time_stamp_hi;
+	timestamp_lo = pkt->time_stamp_lo;
+	hfi_flags = pkt->flags;
+	offset = pkt->offset;
+	filled_len = pkt->filled_len;
+	pic_type = pkt->picture_type;
+	output_tag = pkt->output_tag;
+
+	if (iris_split_mode_enabled(inst) && pkt->stream_id == 0) {
+		buffers = &inst->buffers[BUF_DPB];
+		if (!buffers)
+			goto error;
+
+		found = false;
+		list_for_each_entry(iter, &buffers->list, list) {
+			if (!(iter->attr & BUF_ATTR_QUEUED))
+				continue;
+
+			found = (iter->index == output_tag &&
+				iter->data_offset == offset);
+
+			if (found) {
+				buf = iter;
+				break;
+			}
+		}
+	} else {
+		v4l2_m2m_for_each_dst_buf_safe(m2m_ctx, m2m_buffer, n) {
+			buf = to_iris_buffer(&m2m_buffer->vb);
+			if (!(buf->attr & BUF_ATTR_QUEUED))
+				continue;
+
+			found = (buf->index == output_tag &&
+				 buf->data_offset == offset);
+
+			if (found)
+				break;
+		}
+	}
+	if (!found)
+		goto error;
+
+	buf->data_offset = offset;
+	buf->data_size = filled_len;
+
+	if (!(hfi_flags & HFI_BUFFERFLAG_TIMESTAMPINVALID) && filled_len) {
+		timestamp_us = timestamp_hi;
+		timestamp_us = (timestamp_us << 32) | timestamp_lo;
+	}
+	buf->timestamp = timestamp_us;
+
+	switch (pic_type) {
+	case HFI_PICTURE_IDR:
+	case HFI_PICTURE_I:
+		flags |= V4L2_BUF_FLAG_KEYFRAME;
+		break;
+	case HFI_PICTURE_P:
+		flags |= V4L2_BUF_FLAG_PFRAME;
+		break;
+	case HFI_PICTURE_B:
+		flags |= V4L2_BUF_FLAG_BFRAME;
+		break;
+	case HFI_FRAME_NOTCODED:
+	case HFI_UNUSED_PICT:
+	case HFI_FRAME_YUV:
+	default:
+		break;
+	}
+
+	buf->attr &= ~BUF_ATTR_QUEUED;
+	buf->attr |= BUF_ATTR_DEQUEUED;
+	buf->attr |= BUF_ATTR_BUFFER_DONE;
+
+	buf->flags = flags;
+
+	iris_vb2_buffer_done(inst, buf);
+
+	return;
+
+error:
+	iris_inst_change_state(inst, IRIS_INST_ERROR);
+	dev_err(core->dev, "error in ftb done\n");
+}
+
 struct iris_hfi_gen1_response_pkt_info {
 	u32 pkt;
 	u32 pkt_sz;
@@ -161,6 +303,14 @@ static const struct iris_hfi_gen1_response_pkt_info pkt_infos[] = {
 	 .pkt = HFI_MSG_SESSION_STOP,
 	 .pkt_sz = sizeof(struct hfi_msg_session_hdr_pkt),
 	},
+	{
+	 .pkt = HFI_MSG_SESSION_EMPTY_BUFFER,
+	 .pkt_sz = sizeof(struct hfi_msg_session_empty_buffer_done_pkt),
+	},
+	{
+	 .pkt = HFI_MSG_SESSION_FILL_BUFFER,
+	 .pkt_sz = sizeof(struct hfi_msg_session_fbd_uncompressed_plane0_pkt),
+	},
 	{
 	 .pkt = HFI_MSG_SESSION_FLUSH,
 	 .pkt_sz = sizeof(struct hfi_msg_session_flush_done_pkt),
@@ -231,15 +381,21 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
 		}
 
 		mutex_lock(&inst->lock);
-		struct hfi_msg_session_hdr_pkt *shdr;
+		if (hdr->pkt_type == HFI_MSG_SESSION_EMPTY_BUFFER) {
+			iris_hfi_gen1_session_etb_done(inst, hdr);
+		} else if (hdr->pkt_type == HFI_MSG_SESSION_FILL_BUFFER) {
+			iris_hfi_gen1_session_ftb_done(inst, hdr);
+		} else {
+			struct hfi_msg_session_hdr_pkt *shdr;
 
-		shdr = (struct hfi_msg_session_hdr_pkt *)hdr;
-		if (shdr->error_type != HFI_ERR_NONE)
-			iris_inst_change_state(inst, IRIS_INST_ERROR);
+			shdr = (struct hfi_msg_session_hdr_pkt *)hdr;
+			if (shdr->error_type != HFI_ERR_NONE)
+				iris_inst_change_state(inst, IRIS_INST_ERROR);
 
-		done = pkt_info->pkt == HFI_MSG_SESSION_FLUSH ?
-			&inst->flush_completion : &inst->completion;
-		complete(done);
+			done = pkt_info->pkt == HFI_MSG_SESSION_FLUSH ?
+				&inst->flush_completion : &inst->completion;
+			complete(done);
+		}
 		mutex_unlock(&inst->lock);
 	}
 }
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
index 5fbbab844025..bf3aa1afb5bb 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
@@ -20,6 +20,7 @@ struct iris_core;
  * @packet: HFI packet
  * @ipsc_properties_set: boolean to set ipsc properties to fw
  * @opsc_properties_set: boolean to set opsc properties to fw
+ * @hfi_frame_info: structure of frame info
  * @src_subcr_params: subscription params to fw on input port
  * @dst_subcr_params: subscription params to fw on output port
  */
@@ -28,6 +29,7 @@ struct iris_inst_hfi_gen2 {
 	struct iris_hfi_header		*packet;
 	bool				ipsc_properties_set;
 	bool				opsc_properties_set;
+	struct iris_hfi_frame_info	hfi_frame_info;
 	struct hfi_subscription_params	src_subcr_params;
 	struct hfi_subscription_params	dst_subcr_params;
 };
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index d9a903ee1e06..69e383a99d84 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -70,6 +70,12 @@
 #define HFI_SYS_ERROR_WD_TIMEOUT		0x05000001
 #define HFI_SYSTEM_ERROR_END			0x05FFFFFF
 
+#define HFI_INFORMATION_BEGIN			0x06000000
+#define HFI_INFO_UNSUPPORTED			0x06000001
+#define HFI_INFO_DATA_CORRUPT			0x06000002
+#define HFI_INFO_BUFFER_OVERFLOW		0x06000004
+#define HFI_INFORMATION_END			0x06FFFFFF
+
 enum hfi_property_mode_type {
 	HFI_MODE_PORT_SETTINGS_CHANGE		= 0x00000001,
 	HFI_MODE_PROPERTY			= 0x00000002,
@@ -91,6 +97,15 @@ enum hfi_codec_type {
 	HFI_CODEC_ENCODE_AVC			= 2,
 };
 
+enum hfi_picture_type {
+	HFI_PICTURE_IDR				= 0x00000001,
+	HFI_PICTURE_P				= 0x00000002,
+	HFI_PICTURE_B				= 0x00000004,
+	HFI_PICTURE_I				= 0x00000008,
+	HFI_PICTURE_CRA				= 0x00000010,
+	HFI_PICTURE_BLA				= 0x00000020,
+};
+
 enum hfi_buffer_type {
 	HFI_BUFFER_BITSTREAM			= 0x00000001,
 	HFI_BUFFER_RAW				= 0x00000002,
@@ -114,6 +129,13 @@ enum hfi_buffer_host_flags {
 	HFI_BUF_HOST_FLAGS_CB_NON_SECURE	= 0x00000200,
 };
 
+enum hfi_buffer_firmware_flags {
+	HFI_BUF_FW_FLAG_RELEASE_DONE		= 0x00000001,
+	HFI_BUF_FW_FLAG_READONLY		= 0x00000010,
+	HFI_BUF_FW_FLAG_LAST			= 0x10000000,
+	HFI_BUF_FW_FLAG_PSC_LAST		= 0x20000000,
+};
+
 enum hfi_packet_firmware_flags {
 	HFI_FW_FLAGS_SUCCESS			= 0x00000001,
 	HFI_FW_FLAGS_INFORMATION		= 0x00000002,
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index c7f1b6cf102f..1b1dfbd56704 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -3,6 +3,8 @@
  * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <media/v4l2-mem2mem.h>
+
 #include "iris_hfi_gen2.h"
 #include "iris_hfi_gen2_defines.h"
 #include "iris_hfi_gen2_packet.h"
@@ -80,6 +82,29 @@ static bool iris_hfi_gen2_is_valid_hfi_port(u32 port, u32 buffer_type)
 	return true;
 }
 
+static int iris_hfi_gen2_get_driver_buffer_flags(struct iris_inst *inst, u32 hfi_flags)
+{
+	u32 keyframe = HFI_PICTURE_IDR | HFI_PICTURE_I | HFI_PICTURE_CRA | HFI_PICTURE_BLA;
+	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
+	u32 driver_flags = 0;
+
+	if (inst_hfi_gen2->hfi_frame_info.picture_type & keyframe)
+		driver_flags |= V4L2_BUF_FLAG_KEYFRAME;
+	else if (inst_hfi_gen2->hfi_frame_info.picture_type & HFI_PICTURE_P)
+		driver_flags |= V4L2_BUF_FLAG_PFRAME;
+	else if (inst_hfi_gen2->hfi_frame_info.picture_type & HFI_PICTURE_B)
+		driver_flags |= V4L2_BUF_FLAG_BFRAME;
+
+	if (inst_hfi_gen2->hfi_frame_info.data_corrupt || inst_hfi_gen2->hfi_frame_info.overflow)
+		driver_flags |= V4L2_BUF_FLAG_ERROR;
+
+	if (hfi_flags & HFI_BUF_FW_FLAG_LAST ||
+	    hfi_flags & HFI_BUF_FW_FLAG_PSC_LAST)
+		driver_flags |= V4L2_BUF_FLAG_LAST;
+
+	return driver_flags;
+}
+
 static bool iris_hfi_gen2_validate_packet_payload(struct iris_hfi_packet *pkt)
 {
 	u32 payload_size = 0;
@@ -155,6 +180,37 @@ static int iris_hfi_gen2_validate_hdr_packet(struct iris_core *core, struct iris
 	return ret;
 }
 
+static int iris_hfi_gen2_handle_session_info(struct iris_inst *inst,
+					     struct iris_hfi_packet *pkt)
+{
+	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
+	struct iris_core *core = inst->core;
+	int ret = 0;
+	char *info;
+
+	switch (pkt->type) {
+	case HFI_INFO_UNSUPPORTED:
+		info = "unsupported";
+		break;
+	case HFI_INFO_DATA_CORRUPT:
+		info = "data corrupt";
+		inst_hfi_gen2->hfi_frame_info.data_corrupt = 1;
+		break;
+	case HFI_INFO_BUFFER_OVERFLOW:
+		info = "buffer overflow";
+		inst_hfi_gen2->hfi_frame_info.overflow = 1;
+		break;
+	default:
+		info = "unknown";
+		break;
+	}
+
+	dev_dbg(core->dev, "session info received %#x: %s\n",
+		pkt->type, info);
+
+	return ret;
+}
+
 static int iris_hfi_gen2_handle_session_error(struct iris_inst *inst,
 					      struct iris_hfi_packet *pkt)
 {
@@ -228,6 +284,108 @@ static void iris_hfi_gen2_handle_session_close(struct iris_inst *inst,
 	complete(&inst->completion);
 }
 
+static int iris_hfi_gen2_handle_input_buffer(struct iris_inst *inst,
+					     struct iris_hfi_buffer *buffer)
+{
+	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
+	struct v4l2_m2m_buffer *m2m_buffer, *n;
+	struct iris_buffer *buf = NULL;
+	bool found = false;
+
+	v4l2_m2m_for_each_src_buf_safe(m2m_ctx, m2m_buffer, n) {
+		buf = to_iris_buffer(&m2m_buffer->vb);
+		if (buf->index == buffer->index) {
+			found = true;
+			break;
+		}
+	}
+	if (!found)
+		return -EINVAL;
+
+	if (!(buf->attr & BUF_ATTR_QUEUED))
+		return -EINVAL;
+
+	buf->data_size = buffer->data_size;
+	buf->attr &= ~BUF_ATTR_QUEUED;
+	buf->attr |= BUF_ATTR_DEQUEUED;
+
+	buf->flags = iris_hfi_gen2_get_driver_buffer_flags(inst, buffer->flags);
+
+	return 0;
+}
+
+static int iris_hfi_gen2_handle_output_buffer(struct iris_inst *inst,
+					      struct iris_hfi_buffer *hfi_buffer)
+{
+	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
+	struct v4l2_m2m_buffer *m2m_buffer, *n;
+	struct iris_buffer *buf = NULL;
+	int ret = 0;
+	bool found = false;
+
+	v4l2_m2m_for_each_dst_buf_safe(m2m_ctx, m2m_buffer, n) {
+		buf = to_iris_buffer(&m2m_buffer->vb);
+		if (buf->index == hfi_buffer->index &&
+		    buf->device_addr == hfi_buffer->base_address &&
+		    buf->data_offset == hfi_buffer->data_offset) {
+			found = true;
+			break;
+		}
+	}
+	if (!found)
+		return -EINVAL;
+
+	if (!(buf->attr & BUF_ATTR_QUEUED))
+		return -EINVAL;
+
+	buf->data_offset = hfi_buffer->data_offset;
+	buf->data_size = hfi_buffer->data_size;
+	buf->timestamp = hfi_buffer->timestamp;
+
+	buf->attr &= ~BUF_ATTR_QUEUED;
+	buf->attr |= BUF_ATTR_DEQUEUED;
+
+	buf->flags = iris_hfi_gen2_get_driver_buffer_flags(inst, hfi_buffer->flags);
+
+	return ret;
+}
+
+static int iris_hfi_gen2_handle_dequeue_buffers(struct iris_inst *inst)
+{
+	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
+	struct v4l2_m2m_buffer *buffer, *n;
+	struct iris_buffer *buf = NULL;
+	int ret = 0;
+
+	v4l2_m2m_for_each_src_buf_safe(m2m_ctx, buffer, n) {
+		buf = to_iris_buffer(&buffer->vb);
+		if (buf->attr & BUF_ATTR_DEQUEUED) {
+			buf->attr &= ~BUF_ATTR_DEQUEUED;
+			if (!(buf->attr & BUF_ATTR_BUFFER_DONE)) {
+				buf->attr |= BUF_ATTR_BUFFER_DONE;
+				ret = iris_vb2_buffer_done(inst, buf);
+				if (ret)
+					ret = 0;
+			}
+		}
+	}
+
+	v4l2_m2m_for_each_dst_buf_safe(m2m_ctx, buffer, n) {
+		buf = to_iris_buffer(&buffer->vb);
+		if (buf->attr & BUF_ATTR_DEQUEUED) {
+			buf->attr &= ~BUF_ATTR_DEQUEUED;
+			if (!(buf->attr & BUF_ATTR_BUFFER_DONE)) {
+				buf->attr |= BUF_ATTR_BUFFER_DONE;
+				ret = iris_vb2_buffer_done(inst, buf);
+				if (ret)
+					ret = 0;
+			}
+		}
+	}
+
+	return ret;
+}
+
 static int iris_hfi_gen2_handle_release_internal_buffer(struct iris_inst *inst,
 							struct iris_hfi_buffer *buffer)
 {
@@ -279,7 +437,12 @@ static int iris_hfi_gen2_handle_session_buffer(struct iris_inst *inst,
 	if (!iris_hfi_gen2_is_valid_hfi_port(pkt->port, buffer->type))
 		return 0;
 
-	return iris_hfi_gen2_handle_release_internal_buffer(inst, buffer);
+	if (buffer->type == HFI_BUFFER_BITSTREAM)
+		return iris_hfi_gen2_handle_input_buffer(inst, buffer);
+	else if (buffer->type == HFI_BUFFER_RAW)
+		return iris_hfi_gen2_handle_output_buffer(inst, buffer);
+	else
+		return iris_hfi_gen2_handle_release_internal_buffer(inst, buffer);
 }
 
 static int iris_hfi_gen2_handle_session_command(struct iris_inst *inst,
@@ -342,6 +505,12 @@ static int iris_hfi_gen2_handle_session_property(struct iris_inst *inst,
 	case HFI_PROP_LEVEL:
 		inst_hfi_gen2->src_subcr_params.level = pkt->payload[0];
 		break;
+	case HFI_PROP_PICTURE_TYPE:
+		inst_hfi_gen2->hfi_frame_info.picture_type = pkt->payload[0];
+		break;
+	case HFI_PROP_NO_OUTPUT:
+		inst_hfi_gen2->hfi_frame_info.no_output = 1;
+		break;
 	case HFI_PROP_QUALITY_MODE:
 	case HFI_PROP_STAGE:
 	case HFI_PROP_PIPE:
@@ -437,14 +606,18 @@ static int iris_hfi_gen2_handle_system_response(struct iris_core *core,
 static int iris_hfi_gen2_handle_session_response(struct iris_core *core,
 						 struct iris_hfi_header *hdr)
 {
+	struct iris_inst_hfi_gen2 *inst_hfi_gen2;
 	struct iris_hfi_packet *packet;
 	struct iris_inst *inst;
+	bool dequeue = false;
 	u8 *pkt, *start_pkt;
 	int ret = 0;
 	int i, j;
 	static const struct iris_hfi_gen2_inst_hfi_range range[] = {
 		{HFI_SESSION_ERROR_BEGIN, HFI_SESSION_ERROR_END,
 		 iris_hfi_gen2_handle_session_error},
+		{HFI_INFORMATION_BEGIN, HFI_INFORMATION_END,
+		 iris_hfi_gen2_handle_session_info},
 		{HFI_PROP_BEGIN, HFI_PROP_END,
 		 iris_hfi_gen2_handle_session_property},
 		{HFI_CMD_BEGIN, HFI_CMD_END,
@@ -456,6 +629,8 @@ static int iris_hfi_gen2_handle_session_response(struct iris_core *core,
 		return -EINVAL;
 
 	mutex_lock(&inst->lock);
+	inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
+	memset(&inst_hfi_gen2->hfi_frame_info, 0, sizeof(struct iris_hfi_frame_info));
 
 	start_pkt = (u8 *)((u8 *)hdr + sizeof(*hdr));
 	for (i = 0; i < ARRAY_SIZE(range); i++) {
@@ -466,6 +641,7 @@ static int iris_hfi_gen2_handle_session_response(struct iris_core *core,
 				iris_hfi_gen2_handle_session_error(inst, packet);
 
 			if (packet->type > range[i].begin && packet->type < range[i].end) {
+				dequeue |= (packet->type == HFI_CMD_BUFFER);
 				ret = range[i].handle(inst, packet);
 				if (ret)
 					iris_inst_change_state(inst, IRIS_INST_ERROR);
@@ -474,6 +650,13 @@ static int iris_hfi_gen2_handle_session_response(struct iris_core *core,
 		}
 	}
 
+	if (dequeue) {
+		ret = iris_hfi_gen2_handle_dequeue_buffers(inst);
+		if (ret)
+			goto unlock;
+	}
+
+unlock:
 	mutex_unlock(&inst->lock);
 
 	return ret;
diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
index 7f4e08d392a1..7e84b43d1d4c 100644
--- a/drivers/media/platform/qcom/iris/iris_utils.c
+++ b/drivers/media/platform/qcom/iris/iris_utils.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/pm_runtime.h>
+#include <media/v4l2-mem2mem.h>
 
 #include "iris_instance.h"
 #include "iris_utils.h"
@@ -42,6 +43,21 @@ bool iris_split_mode_enabled(struct iris_inst *inst)
 	return false;
 }
 
+void iris_helper_buffers_done(struct iris_inst *inst, unsigned int type,
+			      enum vb2_buffer_state state)
+{
+	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
+	struct vb2_v4l2_buffer *buf;
+
+	if (V4L2_TYPE_IS_OUTPUT(type)) {
+		while ((buf = v4l2_m2m_src_buf_remove(m2m_ctx)))
+			v4l2_m2m_buf_done(buf, state);
+	} else if (V4L2_TYPE_IS_CAPTURE(type)) {
+		while ((buf = v4l2_m2m_dst_buf_remove(m2m_ctx)))
+			v4l2_m2m_buf_done(buf, state);
+	}
+}
+
 int iris_wait_for_session_response(struct iris_inst *inst, bool is_flush)
 {
 	struct iris_core *core = inst->core;
diff --git a/drivers/media/platform/qcom/iris/iris_utils.h b/drivers/media/platform/qcom/iris/iris_utils.h
index 0d46f50d3103..5dd7e5ececa5 100644
--- a/drivers/media/platform/qcom/iris/iris_utils.h
+++ b/drivers/media/platform/qcom/iris/iris_utils.h
@@ -16,6 +16,13 @@ struct iris_hfi_rect_desc {
 	u32 height;
 };
 
+struct iris_hfi_frame_info {
+	u32 picture_type;
+	u32 no_output;
+	u32 data_corrupt;
+	u32 overflow;
+};
+
 #define NUM_MBS_PER_FRAME(height, width) \
 	(DIV_ROUND_UP(height, 16) * DIV_ROUND_UP(width, 16))
 
@@ -36,6 +43,8 @@ bool iris_res_is_less_than(u32 width, u32 height,
 int iris_get_mbpf(struct iris_inst *inst);
 bool iris_split_mode_enabled(struct iris_inst *inst);
 struct iris_inst *iris_get_instance(struct iris_core *core, u32 session_id);
+void iris_helper_buffers_done(struct iris_inst *inst, unsigned int type,
+			      enum vb2_buffer_state state);
 int iris_wait_for_session_response(struct iris_inst *inst, bool is_flush);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
index 03b533aef010..391c8225923d 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.c
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -3,11 +3,24 @@
  * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <media/videobuf2-dma-contig.h>
+#include <media/v4l2-mem2mem.h>
+
 #include "iris_buffer.h"
 #include "iris_instance.h"
 #include "iris_vb2.h"
 #include "iris_vdec.h"
 #include "iris_vpu_buffer.h"
+int iris_vb2_buf_init(struct vb2_buffer *vb2)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb2);
+	struct iris_buffer *buf = NULL;
+
+	buf = to_iris_buffer(vbuf);
+	buf->device_addr = vb2_dma_contig_plane_dma_addr(vb2, 0);
+
+	return 0;
+}
 
 int iris_vb2_queue_setup(struct vb2_queue *q,
 			 unsigned int *num_buffers, unsigned int *num_planes,
@@ -107,6 +120,7 @@ int iris_vb2_queue_setup(struct vb2_queue *q,
 
 int iris_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
 {
+	enum iris_buffer_type buf_type;
 	struct iris_inst *inst;
 	int ret = 0;
 
@@ -136,11 +150,22 @@ int iris_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
 	if (ret)
 		goto error;
 
+	buf_type = iris_v4l2_type_to_driver(q->type);
+	if (buf_type == -EINVAL) {
+		ret = -EINVAL;
+		goto error;
+	}
+
+	ret = iris_queue_deferred_buffers(inst, buf_type);
+	if (ret)
+		goto error;
+
 	mutex_unlock(&inst->lock);
 
 	return ret;
 
 error:
+	iris_helper_buffers_done(inst, q->type, VB2_BUF_STATE_QUEUED);
 	iris_inst_change_state(inst, IRIS_INST_ERROR);
 	mutex_unlock(&inst->lock);
 
@@ -150,6 +175,7 @@ int iris_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
 void iris_vb2_stop_streaming(struct vb2_queue *q)
 {
 	struct iris_inst *inst;
+	int ret = 0;
 
 	if (!q)
 		return;
@@ -164,8 +190,50 @@ void iris_vb2_stop_streaming(struct vb2_queue *q)
 	    !V4L2_TYPE_IS_CAPTURE(q->type))
 		goto exit;
 
-	iris_vdec_session_streamoff(inst, q->type);
+	ret = iris_vdec_session_streamoff(inst, q->type);
+	if (ret)
+		goto exit;
+
+exit:
+	iris_helper_buffers_done(inst, q->type, VB2_BUF_STATE_ERROR);
+	if (ret)
+		iris_inst_change_state(inst, IRIS_INST_ERROR);
+
+	mutex_unlock(&inst->lock);
+}
+
+void iris_vb2_buf_queue(struct vb2_buffer *vb2)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb2);
+	struct v4l2_m2m_ctx *m2m_ctx;
+	struct iris_inst *inst;
+	int ret = 0;
+
+	inst = vb2_get_drv_priv(vb2->vb2_queue);
+	if (!inst)
+		return;
+
+	mutex_lock(&inst->lock);
+	if (inst->state == IRIS_INST_ERROR) {
+		ret = -EBUSY;
+		goto exit;
+	}
+
+	m2m_ctx = inst->m2m_ctx;
+
+	if (!vb2->planes[0].bytesused && V4L2_TYPE_IS_OUTPUT(vb2->type)) {
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	v4l2_m2m_buf_queue(m2m_ctx, vbuf);
+
+	ret = iris_vdec_qbuf(inst, vbuf);
 
 exit:
+	if (ret) {
+		iris_inst_change_state(inst, IRIS_INST_ERROR);
+		v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
+	}
 	mutex_unlock(&inst->lock);
 }
diff --git a/drivers/media/platform/qcom/iris/iris_vb2.h b/drivers/media/platform/qcom/iris/iris_vb2.h
index bc3bb830c2ba..dd3197b2a5bd 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.h
+++ b/drivers/media/platform/qcom/iris/iris_vb2.h
@@ -6,10 +6,12 @@
 #ifndef _IRIS_VB2_H_
 #define _IRIS_VB2_H_
 
+int iris_vb2_buf_init(struct vb2_buffer *vb2);
 int iris_vb2_queue_setup(struct vb2_queue *q,
 			 unsigned int *num_buffers, unsigned int *num_planes,
 			 unsigned int sizes[], struct device *alloc_devs[]);
 int iris_vb2_start_streaming(struct vb2_queue *q, unsigned int count);
 void iris_vb2_stop_streaming(struct vb2_queue *q);
+void iris_vb2_buf_queue(struct vb2_buffer *vb2);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index d7895fa4b87c..17afb3c123c9 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -256,6 +256,67 @@ int iris_vdec_subscribe_event(struct iris_inst *inst, const struct v4l2_event_su
 	return ret;
 }
 
+static int iris_vdec_get_num_queued_buffers(struct iris_inst *inst,
+					    enum iris_buffer_type type)
+{
+	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
+	struct v4l2_m2m_buffer *buffer, *n;
+	struct iris_buffer *buf = NULL;
+	int count = 0;
+
+	if (type == BUF_INPUT) {
+		v4l2_m2m_for_each_src_buf_safe(m2m_ctx, buffer, n) {
+			buf = to_iris_buffer(&buffer->vb);
+			if (!(buf->attr & BUF_ATTR_QUEUED))
+				continue;
+			count++;
+		}
+	} else if (type == BUF_OUTPUT) {
+		v4l2_m2m_for_each_dst_buf_safe(m2m_ctx, buffer, n) {
+			buf = to_iris_buffer(&buffer->vb);
+			if (!(buf->attr & BUF_ATTR_QUEUED))
+				continue;
+			count++;
+		}
+	} else {
+		return count;
+	}
+
+	return count;
+}
+
+static void iris_vdec_flush_deferred_buffers(struct iris_inst *inst,
+					     enum iris_buffer_type type)
+{
+	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
+	struct v4l2_m2m_buffer *buffer, *n;
+	struct iris_buffer *buf = NULL;
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
 static void iris_vdec_kill_session(struct iris_inst *inst)
 {
 	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
@@ -267,23 +328,43 @@ static void iris_vdec_kill_session(struct iris_inst *inst)
 	iris_inst_change_state(inst, IRIS_INST_ERROR);
 }
 
-void iris_vdec_session_streamoff(struct iris_inst *inst, u32 plane)
+int iris_vdec_session_streamoff(struct iris_inst *inst, u32 plane)
 {
 	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	enum iris_buffer_type buffer_type;
+	int count = 0;
 	int ret;
 
+	if (V4L2_TYPE_IS_OUTPUT(plane))
+		buffer_type = BUF_INPUT;
+	else if (V4L2_TYPE_IS_CAPTURE(plane))
+		buffer_type = BUF_OUTPUT;
+	else
+		return -EINVAL;
+
 	ret = hfi_ops->session_stop(inst, plane);
 	if (ret)
 		goto error;
 
+	count = iris_vdec_get_num_queued_buffers(inst, buffer_type);
+	if (count) {
+		ret = -EINVAL;
+		goto error;
+	}
+
 	ret = iris_inst_state_change_streamoff(inst, plane);
 	if (ret)
 		goto error;
 
-	return;
+	iris_vdec_flush_deferred_buffers(inst, buffer_type);
+
+	return 0;
 
 error:
 	iris_vdec_kill_session(inst);
+	iris_vdec_flush_deferred_buffers(inst, buffer_type);
+
+	return ret;
 }
 
 static int iris_vdec_process_streamon_input(struct iris_inst *inst)
@@ -377,3 +458,47 @@ int iris_vdec_streamon_output(struct iris_inst *inst)
 
 	return ret;
 }
+
+static int
+iris_vdec_vb2_buffer_to_driver(struct vb2_buffer *vb2, struct iris_buffer *buf)
+{
+	struct vb2_v4l2_buffer *vbuf;
+	u32 buf_type;
+
+	if (!vb2 || !buf)
+		return -EINVAL;
+
+	vbuf = to_vb2_v4l2_buffer(vb2);
+
+	buf->fd = vb2->planes[0].m.fd;
+	buf->data_offset = vb2->planes[0].data_offset;
+	buf->data_size = vb2->planes[0].bytesused - vb2->planes[0].data_offset;
+	buf->buffer_size = vb2->planes[0].length;
+	buf->timestamp = vb2->timestamp;
+	buf->flags = vbuf->flags;
+	buf->attr = 0;
+
+	buf_type = iris_v4l2_type_to_driver(vb2->type);
+	if (buf_type == -EINVAL)
+		return -EINVAL;
+
+	buf->type = iris_v4l2_type_to_driver(vb2->type);
+	buf->index = vb2->index;
+
+	return 0;
+}
+
+int iris_vdec_qbuf(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
+{
+	struct vb2_buffer *vb2 = &vbuf->vb2_buf;
+	struct iris_buffer *buf = NULL;
+	int ret = 0;
+
+	buf = to_iris_buffer(vbuf);
+
+	ret = iris_vdec_vb2_buffer_to_driver(vb2, buf);
+	if (ret)
+		return ret;
+
+	return iris_queue_buffer(inst, buf);
+}
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.h b/drivers/media/platform/qcom/iris/iris_vdec.h
index b3299164f823..51bf0b96d9f0 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.h
+++ b/drivers/media/platform/qcom/iris/iris_vdec.h
@@ -16,6 +16,7 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f);
 int iris_vdec_subscribe_event(struct iris_inst *inst, const struct v4l2_event_subscription *sub);
 int iris_vdec_streamon_input(struct iris_inst *inst);
 int iris_vdec_streamon_output(struct iris_inst *inst);
-void iris_vdec_session_streamoff(struct iris_inst *inst, u32 plane);
+int iris_vdec_qbuf(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf);
+int iris_vdec_session_streamoff(struct iris_inst *inst, u32 plane);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 1df724588846..34c2548bce9f 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -7,6 +7,7 @@
 #include <media/v4l2-event.h>
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-mem2mem.h>
+#include <media/videobuf2-dma-contig.h>
 
 #include "iris_vidc.h"
 #include "iris_instance.h"
@@ -119,6 +120,7 @@ iris_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_
 	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
 	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
 	src_vq->ops = inst->core->iris_vb2_ops;
+	src_vq->mem_ops = &vb2_dma_contig_memops;
 	src_vq->drv_priv = inst;
 	src_vq->buf_struct_size = sizeof(struct iris_buffer);
 	src_vq->dev = inst->core->dev;
@@ -131,6 +133,7 @@ iris_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_
 	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
 	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
 	dst_vq->ops = inst->core->iris_vb2_ops;
+	dst_vq->mem_ops = &vb2_dma_contig_memops;
 	dst_vq->drv_priv = inst;
 	dst_vq->buf_struct_size = sizeof(struct iris_buffer);
 	dst_vq->dev = inst->core->dev;
@@ -610,9 +613,11 @@ static struct v4l2_file_operations iris_v4l2_file_ops = {
 };
 
 static const struct vb2_ops iris_vb2_ops = {
+	.buf_init                       = iris_vb2_buf_init,
 	.queue_setup                    = iris_vb2_queue_setup,
 	.start_streaming                = iris_vb2_start_streaming,
 	.stop_streaming                 = iris_vb2_stop_streaming,
+	.buf_queue                      = iris_vb2_buf_queue,
 };
 
 static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops = {
@@ -626,6 +631,12 @@ static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops = {
 	.vidioc_g_fmt_vid_out_mplane    = iris_g_fmt_vid_mplane,
 	.vidioc_enum_framesizes         = iris_enum_framesizes,
 	.vidioc_reqbufs                 = v4l2_m2m_ioctl_reqbufs,
+	.vidioc_querybuf                = v4l2_m2m_ioctl_querybuf,
+	.vidioc_create_bufs             = v4l2_m2m_ioctl_create_bufs,
+	.vidioc_prepare_buf             = v4l2_m2m_ioctl_prepare_buf,
+	.vidioc_expbuf                  = v4l2_m2m_ioctl_expbuf,
+	.vidioc_qbuf                    = v4l2_m2m_ioctl_qbuf,
+	.vidioc_dqbuf                   = v4l2_m2m_ioctl_dqbuf,
 	.vidioc_querycap                = iris_querycap,
 	.vidioc_queryctrl               = iris_queryctrl,
 	.vidioc_querymenu               = iris_querymenu,

-- 
2.34.1



