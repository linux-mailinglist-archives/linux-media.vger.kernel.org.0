Return-Path: <linux-media+bounces-19578-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA2699C520
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 11:15:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59C27286F70
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 09:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57D101AB528;
	Mon, 14 Oct 2024 09:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="L1JZp+sX"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6773B1AAE38;
	Mon, 14 Oct 2024 09:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728896962; cv=none; b=j8l1NHXpqRqc0Sv0lj5zpgIEVweLXhvMTQRGNI8XgXMtAY8cc46BWr6sHTJYKgkTUmWUr2CTrRjerYT0HcXNCiZIBXa+G/dePz6sn3nCKhlS5WobZJM4wk5bsI/H1QjtdhyV10AxA6rXroVpxeQiG/kd4G4FqYRVA9laGArd7Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728896962; c=relaxed/simple;
	bh=YIp70DPyBx3xw2/NatFatE7J48KZaaoEqz6vxmv0d0Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Fnr19jmDXnamBiUOSfpk1ZZSxZiTRrkGb9IFvciAzTKUME8GnucFwO+FSLTFqarwKNITGCrm0vr18i748bdpS9gN7f+bhZE6MEZ7x6ffhymG1patPLZuiKrbuD56DVmVXsrcULrYkZrQn83jACeL5YT5J5KmDc11wX1ao9Aqp3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=L1JZp+sX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49DN52NT032568;
	Mon, 14 Oct 2024 09:09:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5V72eUwS+AiCSJ4ElXWallFhBKZtk4OFxuZxR39ZsSY=; b=L1JZp+sXYlRgK+rY
	qjb4umKGfXFxw92qeOBTBiuN571ptL1NbYdKjJctY7xvpI6TNUDosb0yhmTmEGlr
	Udl1+oJn7G0Ps1Je4nZJXd4IPOFE4d8Xt/t2ERJ8VVfJ+VHBIuj9qqjWgDQcmBkm
	LIsEnfFAGONuOlHP+8vFxWpWeWdPP6BHZY7u+Zf3DdqWODkVMWVSOwPi7gdUhUpZ
	S4ai0DC7zkihnc9N9zfkTKlVDpZ5TKsyvOjVKxvEnZnth/h3NSAoOiVbgcbhGDEN
	4g/MLflLW0ZMTd9wpjKSg1YC3jsvUKYOihfFjXLDwqz9gmrnR+6JSbMUEBieB1oX
	wy/pig==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 427g2rkxt4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 09:09:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49E999lg016845
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 09:09:09 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 14 Oct 2024 02:09:04 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Mon, 14 Oct 2024 14:37:41 +0530
Subject: [PATCH v4 20/28] media: iris: implement vb2 ops for buf_queue and
 firmware response
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241014-qcom-video-iris-v4-v4-20-c5eaa4e9ab9e@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728896854; l=48269;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=YIp70DPyBx3xw2/NatFatE7J48KZaaoEqz6vxmv0d0Q=;
 b=j6bTUxg92vR4PMX8p6tZ7WMczxf0UypgyBX+lyadOAoty+hmcLctp3zXIsK4SJoV0pnf9a9Wz
 b6UC87/bdBxBys5bNjYcKmp6VUorCFyXLb7s2VE7zhTnBxL+hzRYKe9
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ApySwB1VKR_rrV7TBPhwgk8bXjtl7YVO
X-Proofpoint-GUID: ApySwB1VKR_rrV7TBPhwgk8bXjtl7YVO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0
 clxscore=1015 spamscore=0 adultscore=0 mlxlogscore=999 impostorscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410140066

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
 drivers/media/platform/qcom/iris/iris_buffer.c     | 118 +++++++++++++
 drivers/media/platform/qcom/iris/iris_buffer.h     |   2 +
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  53 ++++++
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  80 +++++++++
 .../platform/qcom/iris/iris_hfi_gen1_response.c    | 167 ++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_hfi_gen2.h   |   2 +
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  22 +++
 .../platform/qcom/iris/iris_hfi_gen2_response.c    | 183 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_instance.h   |   8 +
 drivers/media/platform/qcom/iris/iris_utils.c      |  16 ++
 drivers/media/platform/qcom/iris/iris_utils.h      |  16 ++
 drivers/media/platform/qcom/iris/iris_vb2.c        | 102 +++++++++++-
 drivers/media/platform/qcom/iris/iris_vb2.h        |   4 +
 drivers/media/platform/qcom/iris/iris_vdec.c       | 154 ++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_vdec.h       |   3 +-
 drivers/media/platform/qcom/iris/iris_vidc.c       |  15 ++
 17 files changed, 926 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/Kconfig b/drivers/media/platform/qcom/iris/Kconfig
index f92cc7fe9378..3c803a05305a 100644
--- a/drivers/media/platform/qcom/iris/Kconfig
+++ b/drivers/media/platform/qcom/iris/Kconfig
@@ -5,6 +5,7 @@ config VIDEO_QCOM_IRIS
         select V4L2_MEM2MEM_DEV
         select QCOM_MDT_LOADER if ARCH_QCOM
         select QCOM_SCM
+        select VIDEOBUF2_DMA_CONTIG
         help
           This is a V4L2 driver for Qualcomm iris video accelerator
           hardware. It accelerates decoding operations on various
diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index 9fa97375d61f..8df003000dc8 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
 
 #include "iris_buffer.h"
@@ -434,6 +435,36 @@ int iris_alloc_and_queue_persist_bufs(struct iris_inst *inst)
 	return 0;
 }
 
+int iris_queue_deferred_buffers(struct iris_inst *inst, enum iris_buffer_type buf_type)
+{
+	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
+	struct v4l2_m2m_buffer *buffer, *n;
+	struct iris_buffer *buf;
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
@@ -444,3 +475,90 @@ void iris_vb2_queue_error(struct iris_inst *inst)
 	q = v4l2_m2m_get_dst_vq(m2m_ctx);
 	vb2_queue_error(q);
 }
+
+static struct vb2_v4l2_buffer *
+iris_helper_find_buf(struct iris_inst *inst, u32 type, u32 idx)
+{
+	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
+
+	if (V4L2_TYPE_IS_OUTPUT(type))
+		return v4l2_m2m_src_buf_remove_by_idx(m2m_ctx, idx);
+	else
+		return v4l2_m2m_dst_buf_remove_by_idx(m2m_ctx, idx);
+}
+
+static void iris_get_ts_metadata(struct iris_inst *inst, u64 timestamp_ns,
+				 struct vb2_v4l2_buffer *vbuf)
+{
+	u32 mask = V4L2_BUF_FLAG_TIMECODE | V4L2_BUF_FLAG_TSTAMP_SRC_MASK;
+	u32 i;
+
+	for (i = 0; i < ARRAY_SIZE(inst->tss); ++i) {
+		if (inst->tss[i].ts_ns != timestamp_ns)
+			continue;
+
+		vbuf->flags &= ~mask;
+		vbuf->flags |= inst->tss[i].flags;
+		vbuf->timecode = inst->tss[i].tc;
+		return;
+	}
+
+	vbuf->flags &= ~mask;
+	vbuf->flags |= inst->tss[inst->metadata_idx].flags;
+	vbuf->timecode = inst->tss[inst->metadata_idx].tc;
+}
+
+int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
+{
+	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
+	struct vb2_v4l2_buffer *vbuf;
+	struct vb2_buffer *vb2;
+	u32 type, state;
+
+	switch (buf->type) {
+	case BUF_INPUT:
+		type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
+		break;
+	case BUF_OUTPUT:
+		type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+		break;
+	default:
+		return 0; /* Internal DPB Buffers */
+	}
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
+	vbuf->flags |= buf->flags;
+
+	if (V4L2_TYPE_IS_CAPTURE(type)) {
+		vb2_set_plane_payload(vb2, 0, buf->data_size);
+		vbuf->sequence = inst->sequence_cap++;
+		iris_get_ts_metadata(inst, buf->timestamp, vbuf);
+	} else {
+		vbuf->sequence = inst->sequence_out++;
+	}
+
+	if (vbuf->flags & V4L2_BUF_FLAG_LAST) {
+		if (!v4l2_m2m_has_stopped(m2m_ctx) &&
+		    inst->subscriptions & V4L2_EVENT_EOS) {
+			const struct v4l2_event ev = { .type = V4L2_EVENT_EOS };
+
+			v4l2_event_queue_fh(&inst->fh, &ev);
+			v4l2_m2m_mark_stopped(m2m_ctx);
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
index ee7d9beca33b..82f2513576bf 100644
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
index a84bb00388d9..23a8bf29e381 100644
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
@@ -130,6 +132,143 @@ static void iris_hfi_gen1_sys_property_info(struct iris_core *core, void *packet
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
+	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
+	struct v4l2_m2m_buffer *m2m_buffer, *n;
+	u32 timestamp_hi = pkt->time_stamp_hi;
+	u32 timestamp_lo = pkt->time_stamp_lo;
+	struct iris_core *core = inst->core;
+	u32 filled_len = pkt->filled_len;
+	u32 pic_type = pkt->picture_type;
+	u32 output_tag = pkt->output_tag;
+	struct iris_buffer *buf, *iter;
+	struct iris_buffers *buffers;
+	u32 offset = pkt->offset;
+	u64 timestamp_us = 0;
+	bool found = false;
+	u32 flags = 0;
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
+	if (filled_len) {
+		timestamp_us = timestamp_hi;
+		timestamp_us = (timestamp_us << 32) | timestamp_lo;
+	} else {
+		flags |= V4L2_BUF_FLAG_LAST;
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
+	buf->flags |= flags;
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
@@ -168,6 +307,14 @@ static const struct iris_hfi_gen1_response_pkt_info pkt_infos[] = {
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
@@ -238,15 +385,21 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
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
 
 		break;
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
index 9639c7eabd6b..77c4f92b76e1 100644
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
@@ -81,6 +83,29 @@ static bool iris_hfi_gen2_is_valid_hfi_port(u32 port, u32 buffer_type)
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
@@ -154,6 +179,37 @@ static int iris_hfi_gen2_validate_hdr_packet(struct iris_core *core, struct iris
 	return 0;
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
@@ -234,19 +290,108 @@ static void iris_hfi_gen2_handle_session_close(struct iris_inst *inst,
 	complete(&inst->completion);
 }
 
+static int iris_hfi_gen2_handle_input_buffer(struct iris_inst *inst,
+					     struct iris_hfi_buffer *buffer)
+{
+	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
+	struct v4l2_m2m_buffer *m2m_buffer, *n;
+	struct iris_buffer *buf;
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
+	struct iris_buffer *buf;
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
+	return 0;
+}
+
+static void iris_hfi_gen2_handle_dequeue_buffers(struct iris_inst *inst)
+{
+	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
+	struct v4l2_m2m_buffer *buffer, *n;
+	struct iris_buffer *buf = NULL;
+
+	v4l2_m2m_for_each_src_buf_safe(m2m_ctx, buffer, n) {
+		buf = to_iris_buffer(&buffer->vb);
+		if (buf->attr & BUF_ATTR_DEQUEUED) {
+			buf->attr &= ~BUF_ATTR_DEQUEUED;
+			if (!(buf->attr & BUF_ATTR_BUFFER_DONE)) {
+				buf->attr |= BUF_ATTR_BUFFER_DONE;
+				iris_vb2_buffer_done(inst, buf);
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
+				iris_vb2_buffer_done(inst, buf);
+			}
+		}
+	}
+}
+
 static int iris_hfi_gen2_handle_release_internal_buffer(struct iris_inst *inst,
 							struct iris_hfi_buffer *buffer)
 {
+	u32 buf_type = iris_hfi_gen2_buf_type_to_driver(buffer->type);
+	struct iris_buffers *buffers = &inst->buffers[buf_type];
 	struct iris_buffer *buf, *iter;
-	struct iris_buffers *buffers;
-	u32 buf_type;
+	bool found = false;
 	int ret = 0;
-	bool found;
 
-	buf_type = iris_hfi_gen2_buf_type_to_driver(buffer->type);
-	buffers = &inst->buffers[buf_type];
-
-	found = false;
 	list_for_each_entry(iter, &buffers->list, list) {
 		if (iter->device_addr == buffer->base_address) {
 			found = true;
@@ -258,7 +403,6 @@ static int iris_hfi_gen2_handle_release_internal_buffer(struct iris_inst *inst,
 		return -EINVAL;
 
 	buf->attr &= ~BUF_ATTR_QUEUED;
-
 	if (buf->attr & BUF_ATTR_PENDING_RELEASE)
 		ret = iris_destroy_internal_buffer(inst, buf);
 
@@ -285,7 +429,12 @@ static int iris_hfi_gen2_handle_session_buffer(struct iris_inst *inst,
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
@@ -347,6 +496,12 @@ static int iris_hfi_gen2_handle_session_property(struct iris_inst *inst,
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
@@ -433,14 +588,18 @@ static int iris_hfi_gen2_handle_system_response(struct iris_core *core,
 static int iris_hfi_gen2_handle_session_response(struct iris_core *core,
 						 struct iris_hfi_header *hdr)
 {
+	struct iris_inst_hfi_gen2 *inst_hfi_gen2;
 	struct iris_hfi_packet *packet;
 	struct iris_inst *inst;
+	bool dequeue = false;
 	int ret = 0;
 	u32 i, j;
 	u8 *pkt;
 	static const struct iris_hfi_gen2_inst_hfi_range range[] = {
 		{HFI_SESSION_ERROR_BEGIN, HFI_SESSION_ERROR_END,
 		 iris_hfi_gen2_handle_session_error},
+		{HFI_INFORMATION_BEGIN, HFI_INFORMATION_END,
+		 iris_hfi_gen2_handle_session_info},
 		{HFI_PROP_BEGIN, HFI_PROP_END,
 		 iris_hfi_gen2_handle_session_property},
 		{HFI_CMD_BEGIN, HFI_CMD_END,
@@ -452,6 +611,8 @@ static int iris_hfi_gen2_handle_session_response(struct iris_core *core,
 		return -EINVAL;
 
 	mutex_lock(&inst->lock);
+	inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
+	memset(&inst_hfi_gen2->hfi_frame_info, 0, sizeof(struct iris_hfi_frame_info));
 
 	pkt = (u8 *)((u8 *)hdr + sizeof(*hdr));
 	for (i = 0; i < ARRAY_SIZE(range); i++) {
@@ -462,6 +623,7 @@ static int iris_hfi_gen2_handle_session_response(struct iris_core *core,
 				iris_hfi_gen2_handle_session_error(inst, packet);
 
 			if (packet->type > range[i].begin && packet->type < range[i].end) {
+				dequeue |= (packet->type == HFI_CMD_BUFFER);
 				ret = range[i].handle(inst, packet);
 				if (ret)
 					iris_inst_change_state(inst, IRIS_INST_ERROR);
@@ -470,6 +632,9 @@ static int iris_hfi_gen2_handle_session_response(struct iris_core *core,
 		}
 	}
 
+	if (dequeue)
+		iris_hfi_gen2_handle_dequeue_buffers(inst);
+
 	mutex_unlock(&inst->lock);
 
 	return ret;
diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index fdec6a97ac6c..e970c25b6106 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -35,6 +35,10 @@
  * @m2m_dev:	a reference to m2m device structure
  * @m2m_ctx:	a reference to m2m context structure
  * @subscriptions: variable to hold current events subscriptions
+ * @sequence_cap: a sequence counter for capture queue
+ * @sequence_out: a sequence counter for output queue
+ * @tss: timestamp metadata
+ * @metadata_idx: index for metadata buffer
  */
 
 struct iris_inst {
@@ -58,6 +62,10 @@ struct iris_inst {
 	struct v4l2_m2m_dev		*m2m_dev;
 	struct v4l2_m2m_ctx		*m2m_ctx;
 	unsigned int			subscriptions;
+	u32				sequence_cap;
+	u32				sequence_out;
+	struct iris_ts_metadata		tss[VIDEO_MAX_FRAME];
+	u32				metadata_idx;
 };
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
index 7e252ee1d165..8487a26d98ed 100644
--- a/drivers/media/platform/qcom/iris/iris_utils.c
+++ b/drivers/media/platform/qcom/iris/iris_utils.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/pm_runtime.h>
+#include <media/v4l2-mem2mem.h>
 
 #include "iris_instance.h"
 #include "iris_utils.h"
@@ -36,6 +37,21 @@ bool iris_split_mode_enabled(struct iris_inst *inst)
 	return inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_NV12;
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
index 0d46f50d3103..745fcc3a22a4 100644
--- a/drivers/media/platform/qcom/iris/iris_utils.h
+++ b/drivers/media/platform/qcom/iris/iris_utils.h
@@ -16,6 +16,20 @@ struct iris_hfi_rect_desc {
 	u32 height;
 };
 
+struct iris_hfi_frame_info {
+	u32 picture_type;
+	u32 no_output;
+	u32 data_corrupt;
+	u32 overflow;
+};
+
+struct iris_ts_metadata {
+	u64 ts_ns;
+	u64 ts_us;
+	u32 flags;
+	struct v4l2_timecode tc;
+};
+
 #define NUM_MBS_PER_FRAME(height, width) \
 	(DIV_ROUND_UP(height, 16) * DIV_ROUND_UP(width, 16))
 
@@ -36,6 +50,8 @@ bool iris_res_is_less_than(u32 width, u32 height,
 int iris_get_mbpf(struct iris_inst *inst);
 bool iris_split_mode_enabled(struct iris_inst *inst);
 struct iris_inst *iris_get_instance(struct iris_core *core, u32 session_id);
+void iris_helper_buffers_done(struct iris_inst *inst, unsigned int type,
+			      enum vb2_buffer_state state);
 int iris_wait_for_session_response(struct iris_inst *inst, bool is_flush);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
index 75c1364709d1..2e4b30ec963f 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.c
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -3,11 +3,23 @@
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
+	struct iris_buffer *buf = to_iris_buffer(vbuf);
+
+	buf->device_addr = vb2_dma_contig_plane_dma_addr(vb2, 0);
+
+	return 0;
+}
 
 int iris_vb2_queue_setup(struct vb2_queue *q,
 			 unsigned int *num_buffers, unsigned int *num_planes,
@@ -87,6 +99,7 @@ int iris_vb2_queue_setup(struct vb2_queue *q,
 
 int iris_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
 {
+	enum iris_buffer_type buf_type;
 	struct iris_inst *inst;
 	int ret = 0;
 
@@ -107,6 +120,7 @@ int iris_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
 		goto error;
 	}
 
+
 	if (V4L2_TYPE_IS_OUTPUT(q->type))
 		ret = iris_vdec_streamon_input(inst);
 	else if (V4L2_TYPE_IS_CAPTURE(q->type))
@@ -114,11 +128,22 @@ int iris_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
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
 
@@ -128,6 +153,7 @@ int iris_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
 void iris_vb2_stop_streaming(struct vb2_queue *q)
 {
 	struct iris_inst *inst;
+	int ret = 0;
 
 	inst = vb2_get_drv_priv(q);
 
@@ -140,8 +166,82 @@ void iris_vb2_stop_streaming(struct vb2_queue *q)
 	    !V4L2_TYPE_IS_CAPTURE(q->type))
 		goto exit;
 
-	iris_vdec_session_streamoff(inst, q->type);
+	ret = iris_vdec_session_streamoff(inst, q->type);
+	if (ret)
+		goto exit;
 
 exit:
+	iris_helper_buffers_done(inst, q->type, VB2_BUF_STATE_ERROR);
+	if (ret)
+		iris_inst_change_state(inst, IRIS_INST_ERROR);
+
+	mutex_unlock(&inst->lock);
+}
+
+int iris_vb2_buf_prepare(struct vb2_buffer *vb)
+{
+	struct iris_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+
+	if (V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type)) {
+		if (vbuf->field == V4L2_FIELD_ANY)
+			vbuf->field = V4L2_FIELD_NONE;
+		if (vbuf->field != V4L2_FIELD_NONE)
+			return -EINVAL;
+	}
+
+	if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
+	    vb2_plane_size(vb, 0) < iris_get_buffer_size(inst, BUF_OUTPUT))
+		return -EINVAL;
+	if (vb->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE &&
+	    vb2_plane_size(vb, 0) < iris_get_buffer_size(inst, BUF_INPUT))
+		return -EINVAL;
+
+	return 0;
+}
+
+int iris_vb2_buf_out_validate(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *v4l2_buf = to_vb2_v4l2_buffer(vb);
+
+	v4l2_buf->field = V4L2_FIELD_NONE;
+
+	return 0;
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
+
+	mutex_lock(&inst->lock);
+	if (inst->state == IRIS_INST_ERROR) {
+		ret = -EBUSY;
+		goto exit;
+	}
+
+	if (vbuf->field == V4L2_FIELD_ANY)
+		vbuf->field = V4L2_FIELD_NONE;
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
+
+exit:
+	if (ret) {
+		iris_inst_change_state(inst, IRIS_INST_ERROR);
+		v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
+	}
 	mutex_unlock(&inst->lock);
 }
diff --git a/drivers/media/platform/qcom/iris/iris_vb2.h b/drivers/media/platform/qcom/iris/iris_vb2.h
index bc3bb830c2ba..c0d22c39d197 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.h
+++ b/drivers/media/platform/qcom/iris/iris_vb2.h
@@ -6,10 +6,14 @@
 #ifndef _IRIS_VB2_H_
 #define _IRIS_VB2_H_
 
+int iris_vb2_buf_init(struct vb2_buffer *vb2);
 int iris_vb2_queue_setup(struct vb2_queue *q,
 			 unsigned int *num_buffers, unsigned int *num_planes,
 			 unsigned int sizes[], struct device *alloc_devs[]);
 int iris_vb2_start_streaming(struct vb2_queue *q, unsigned int count);
 void iris_vb2_stop_streaming(struct vb2_queue *q);
+int iris_vb2_buf_prepare(struct vb2_buffer *vb);
+int iris_vb2_buf_out_validate(struct vb2_buffer *vb);
+void iris_vb2_buf_queue(struct vb2_buffer *vb2);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 9cd77b551df4..7d5ef23b5c0a 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -242,6 +242,68 @@ int iris_vdec_subscribe_event(struct iris_inst *inst, const struct v4l2_event_su
 	return ret;
 }
 
+static int iris_vdec_get_num_queued_buffers(struct iris_inst *inst,
+					    enum iris_buffer_type type)
+{
+	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
+	struct v4l2_m2m_buffer *buffer, *n;
+	struct iris_buffer *buf;
+	u32 count = 0;
+
+	switch (type) {
+	case BUF_INPUT:
+		v4l2_m2m_for_each_src_buf_safe(m2m_ctx, buffer, n) {
+			buf = to_iris_buffer(&buffer->vb);
+			if (!(buf->attr & BUF_ATTR_QUEUED))
+				continue;
+			count++;
+		}
+		return count;
+	case BUF_OUTPUT:
+		v4l2_m2m_for_each_dst_buf_safe(m2m_ctx, buffer, n) {
+			buf = to_iris_buffer(&buffer->vb);
+			if (!(buf->attr & BUF_ATTR_QUEUED))
+				continue;
+			count++;
+		}
+		return count;
+	default:
+		return count;
+	}
+}
+
+static void iris_vdec_flush_deferred_buffers(struct iris_inst *inst,
+					     enum iris_buffer_type type)
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
 static void iris_vdec_kill_session(struct iris_inst *inst)
 {
 	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
@@ -253,23 +315,47 @@ static void iris_vdec_kill_session(struct iris_inst *inst)
 	iris_inst_change_state(inst, IRIS_INST_ERROR);
 }
 
-void iris_vdec_session_streamoff(struct iris_inst *inst, u32 plane)
+int iris_vdec_session_streamoff(struct iris_inst *inst, u32 plane)
 {
 	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	enum iris_buffer_type buffer_type;
+	u32 count;
 	int ret;
 
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
@@ -359,3 +445,67 @@ int iris_vdec_streamon_output(struct iris_inst *inst)
 
 	return ret;
 }
+
+static int
+iris_vdec_vb2_buffer_to_driver(struct vb2_buffer *vb2, struct iris_buffer *buf)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb2);
+
+	buf->type = iris_v4l2_type_to_driver(vb2->type);
+	if (buf->type == -EINVAL)
+		return -EINVAL;
+
+	buf->index = vb2->index;
+	buf->fd = vb2->planes[0].m.fd;
+	buf->buffer_size = vb2->planes[0].length;
+	buf->data_offset = vb2->planes[0].data_offset;
+	buf->data_size = vb2->planes[0].bytesused - vb2->planes[0].data_offset;
+	buf->flags = vbuf->flags;
+	buf->timestamp = vb2->timestamp;
+	buf->attr = 0;
+
+	return 0;
+}
+
+static void
+iris_set_ts_metadata(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
+{
+	u32 mask = V4L2_BUF_FLAG_TIMECODE | V4L2_BUF_FLAG_TSTAMP_SRC_MASK;
+	struct vb2_buffer *vb = &vbuf->vb2_buf;
+	u64 ts_us = vb->timestamp;
+
+	if (inst->metadata_idx >= ARRAY_SIZE(inst->tss))
+		inst->metadata_idx = 0;
+
+	do_div(ts_us, NSEC_PER_USEC);
+
+	inst->tss[inst->metadata_idx].flags = vbuf->flags & mask;
+	inst->tss[inst->metadata_idx].tc = vbuf->timecode;
+	inst->tss[inst->metadata_idx].ts_us = ts_us;
+	inst->tss[inst->metadata_idx].ts_ns = vb->timestamp;
+
+	inst->metadata_idx++;
+}
+
+int iris_vdec_qbuf(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
+{
+	struct iris_buffer *buf = to_iris_buffer(vbuf);
+	struct vb2_buffer *vb2 = &vbuf->vb2_buf;
+	struct vb2_queue *q;
+	int ret;
+
+	ret = iris_vdec_vb2_buffer_to_driver(vb2, buf);
+	if (ret)
+		return ret;
+
+	if (buf->type == BUF_INPUT)
+		iris_set_ts_metadata(inst, vbuf);
+
+	q = v4l2_m2m_get_vq(inst->m2m_ctx, vb2->type);
+	if (!vb2_is_streaming(q)) {
+		buf->attr |= BUF_ATTR_DEFERRED;
+		return 0;
+	}
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
index bab9ca52de69..aaf377f2f5f5 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -7,6 +7,7 @@
 #include <media/v4l2-event.h>
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-mem2mem.h>
+#include <media/videobuf2-dma-contig.h>
 
 #include "iris_vidc.h"
 #include "iris_instance.h"
@@ -97,6 +98,7 @@ iris_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_
 	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
 	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
 	src_vq->ops = inst->core->iris_vb2_ops;
+	src_vq->mem_ops = &vb2_dma_contig_memops;
 	src_vq->drv_priv = inst;
 	src_vq->buf_struct_size = sizeof(struct iris_buffer);
 	src_vq->dev = inst->core->dev;
@@ -109,6 +111,7 @@ iris_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_
 	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
 	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
 	dst_vq->ops = inst->core->iris_vb2_ops;
+	dst_vq->mem_ops = &vb2_dma_contig_memops;
 	dst_vq->drv_priv = inst;
 	dst_vq->buf_struct_size = sizeof(struct iris_buffer);
 	dst_vq->dev = inst->core->dev;
@@ -438,9 +441,15 @@ static struct v4l2_file_operations iris_v4l2_file_ops = {
 };
 
 static const struct vb2_ops iris_vb2_ops = {
+	.buf_init                       = iris_vb2_buf_init,
 	.queue_setup                    = iris_vb2_queue_setup,
 	.start_streaming                = iris_vb2_start_streaming,
 	.stop_streaming                 = iris_vb2_stop_streaming,
+	.buf_prepare                    = iris_vb2_buf_prepare,
+	.buf_out_validate               = iris_vb2_buf_out_validate,
+	.buf_queue                      = iris_vb2_buf_queue,
+	.wait_prepare                   = vb2_ops_wait_prepare,
+	.wait_finish                    = vb2_ops_wait_finish,
 };
 
 static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops = {
@@ -454,6 +463,12 @@ static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops = {
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


