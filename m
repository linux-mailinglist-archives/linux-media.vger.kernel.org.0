Return-Path: <linux-media+bounces-40380-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8AAB2D7FA
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 11:23:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B2FC1562A37
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 09:18:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4870B3043B9;
	Wed, 20 Aug 2025 09:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TKQ3uFD4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605A92DFA39;
	Wed, 20 Aug 2025 09:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755680981; cv=none; b=TP0DAdD9gGENydQ6lnJr1ZdW9mkOeRiC6LtnCWNjZ/3wuwSvhPopU8LK4tLn4oQvL5rGT0Uf2UJ/qUU9IOjonstrReuQRkNwm7tetluad1F0ZEY8wqctX9RoD3TljVqtcJN15h7ZNKw/Wru5gOYNLfLbYZg/uTtnZ2m+sk7gRH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755680981; c=relaxed/simple;
	bh=dGHOLik5R4tJ58avQnfC3XgMah+JUZJdDWMv3/pyCII=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=EhDXE2p58F0rJBvCf28iqIBRIQRwfT456scLX5X9EUTo33cbYmvN0Ly5dP3thkaslTP2Lq++X0Au+NhvOq3ei/6Fst+S4/Jz0cDwYFMIo7JMG4jWs1HCuMFN57l7+JSuHJzCz3NwFoTnmPGDsYX17LdmKs8/LGezhQNJ/uCStaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TKQ3uFD4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1p2wd031245;
	Wed, 20 Aug 2025 09:09:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OBiq75i49VGaz3MjxZ1A5ImBjnnddcy+zdqE/vEzF44=; b=TKQ3uFD4VNCrS5db
	GjE8vwxhJsiOZ2ucYdMLx6+PPRAv815sPnqj4RsFrmSgboOc/Tje2bPBN3Zcv2Em
	gAfKEHcFggHkFwq6DpOxOXuAB2+4utcSy59SlkCLj+AbdqHqlA9FM6aLM/CPDGKw
	XcCGBR2DBtDn7JgTy89pmylARUFkVMvrgZ3llGb5akV1xH8og2tOGlFQ1xxXp+Sd
	oR29c8icZR+wMMDBWgaONrz2zWlNiHtYfslJlz7gIAbYUajkIcGNEA1XMGEU2J0u
	9fBJe25vv8z2AHgglCm5155RJxyutzqCMSWiFPlfwt7Ves8iFf1Ds2cyMr6xB+kP
	M0mayQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52dh3kh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 09:09:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57K99X7u028741
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 09:09:33 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 20 Aug 2025 02:09:29 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 20 Aug 2025 14:38:04 +0530
Subject: [PATCH v3 26/26] media: iris: Add support for drain sequence in
 encoder video device
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250820-iris-video-encoder-v3-26-80ab0ba58b3d@quicinc.com>
References: <20250820-iris-video-encoder-v3-0-80ab0ba58b3d@quicinc.com>
In-Reply-To: <20250820-iris-video-encoder-v3-0-80ab0ba58b3d@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt
	<stefan.schmidt@linaro.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        "Hans
 Verkuil" <hverkuil@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Wangao Wang <quic_wangaow@quicinc.com>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755680867; l=9079;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=dGHOLik5R4tJ58avQnfC3XgMah+JUZJdDWMv3/pyCII=;
 b=g263t2XMNDdwxw+3Nwf8QArCTbt98xaDkXVVWVeQlsVa0Qq+zL53XuFy9UxkcbcFVwvdLv4F8
 528ZC19Tq8UAoO1TvYWmvdZyvzJlx3TlOFzZvimWgbQbMb7P03AuV0V
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX2BtZgmBoO0rF
 WLkF37oe9TfDCzS0NqjVBQy+82D+LmxaaStm/9l7aAVCDIoq7Z6vxwtp8IDQlGL6kOU7rEjgnAI
 sQs4Aun9hTiCKhGdj7XsDjSww5syN1gEusrwKnQKU1XXWGX2vOEcooLDff9/24PtT/zSvZ1lZOf
 qOAPRhhJj2HIKipQZOS4hPMbZ5vYEEl5H93hlpDsVlLwFEdIFn5homFaR75yO82R9795J4xjNzq
 lHBQy0JkstfQti4OSrWt7vai50p29mvsaZAsw86o4N2FO9iKI6ZdXVog/VsjB9e72SvVy1/Lhwp
 FZtFD5Wht8GPz/ZMErvwIBnp/eLUtwg7YjmQtQdFXe83eAUELnXOemhTJb+bZBVanOWAyq99r7z
 6PbCfEitgwpjnS0bSbctpSf1jrw2fA==
X-Proofpoint-ORIG-GUID: 5RjJ_L78Ob_II68dvHRK4S8JgkTPf9fU
X-Proofpoint-GUID: 5RjJ_L78Ob_II68dvHRK4S8JgkTPf9fU
X-Authority-Analysis: v=2.4 cv=SoXJKPO0 c=1 sm=1 tr=0 ts=68a590ce cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=ghBcajBdglOd9ulocosA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

Add support for handling start and stop commands, including the
end-of-stream (drain) sequence, in the encoder video device.

This enables proper signaling to the firmware and ensures that all
pending frames are processed and flushed before completing the stream.

Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 .../platform/qcom/iris/iris_hfi_gen1_command.c     | 30 ++++++++---
 .../platform/qcom/iris/iris_hfi_gen1_response.c    |  5 ++
 drivers/media/platform/qcom/iris/iris_state.c      |  4 +-
 drivers/media/platform/qcom/iris/iris_venc.c       | 58 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_venc.h       |  2 +
 drivers/media/platform/qcom/iris/iris_vidc.c       | 35 +++++++++++++
 6 files changed, 125 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index d10a23a3d592c2c5eb6c82f67e330957a01baa8a..29cf392ca2566da286ea3e928ce4a22c2e970cc8 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -450,15 +450,31 @@ static int iris_hfi_gen1_session_unset_buffers(struct iris_inst *inst, struct ir
 
 static int iris_hfi_gen1_session_drain(struct iris_inst *inst, u32 plane)
 {
-	struct hfi_session_empty_buffer_compressed_pkt ip_pkt = {0};
+	if (inst->domain == DECODER) {
+		struct hfi_session_empty_buffer_compressed_pkt ip_pkt = {0};
+
+		ip_pkt.shdr.hdr.size = sizeof(struct hfi_session_empty_buffer_compressed_pkt);
+		ip_pkt.shdr.hdr.pkt_type = HFI_CMD_SESSION_EMPTY_BUFFER;
+		ip_pkt.shdr.session_id = inst->session_id;
+		ip_pkt.flags = HFI_BUFFERFLAG_EOS;
+		ip_pkt.packet_buffer = 0xdeadb000;
+
+		return iris_hfi_queue_cmd_write(inst->core, &ip_pkt, ip_pkt.shdr.hdr.size);
+	}
 
-	ip_pkt.shdr.hdr.size = sizeof(struct hfi_session_empty_buffer_compressed_pkt);
-	ip_pkt.shdr.hdr.pkt_type = HFI_CMD_SESSION_EMPTY_BUFFER;
-	ip_pkt.shdr.session_id = inst->session_id;
-	ip_pkt.flags = HFI_BUFFERFLAG_EOS;
-	ip_pkt.packet_buffer = 0xdeadb000;
+	if (inst->domain == ENCODER) {
+		struct hfi_session_empty_buffer_uncompressed_pkt ip_pkt = {0};
+
+		ip_pkt.shdr.hdr.size = sizeof(struct hfi_session_empty_buffer_uncompressed_pkt);
+		ip_pkt.shdr.hdr.pkt_type = HFI_CMD_SESSION_EMPTY_BUFFER;
+		ip_pkt.shdr.session_id = inst->session_id;
+		ip_pkt.flags = HFI_BUFFERFLAG_EOS;
+		ip_pkt.packet_buffer = 0xdeadb000;
+
+		return iris_hfi_queue_cmd_write(inst->core, &ip_pkt, ip_pkt.shdr.hdr.size);
+	}
 
-	return iris_hfi_queue_cmd_write(inst->core, &ip_pkt, ip_pkt.shdr.hdr.size);
+	return -EINVAL;
 }
 
 static int
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index a55d214c84048c6a3ac19a041c0f78f7e58918b8..8e864c239e293e004d21e9c3604d3e985c15d9bd 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -485,6 +485,11 @@ static void iris_hfi_gen1_session_ftb_done(struct iris_inst *inst, void *packet)
 				flags |= V4L2_BUF_FLAG_LAST;
 				inst->last_buffer_dequeued = true;
 			}
+		} else if (inst->domain == ENCODER) {
+			if (!inst->last_buffer_dequeued && iris_drain_pending(inst)) {
+				flags |= V4L2_BUF_FLAG_LAST;
+				inst->last_buffer_dequeued = true;
+			}
 		}
 	}
 	buf->timestamp = timestamp_us;
diff --git a/drivers/media/platform/qcom/iris/iris_state.c b/drivers/media/platform/qcom/iris/iris_state.c
index d1dc1a863da0b0b1af60974e9ed2ef68ea225cdd..d14472414750dc7edc4834f32a51f2c5adc3762e 100644
--- a/drivers/media/platform/qcom/iris/iris_state.c
+++ b/drivers/media/platform/qcom/iris/iris_state.c
@@ -263,11 +263,11 @@ bool iris_allow_cmd(struct iris_inst *inst, u32 cmd)
 	struct vb2_queue *src_q = v4l2_m2m_get_src_vq(inst->m2m_ctx);
 	struct vb2_queue *dst_q = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
 
-	if (cmd == V4L2_DEC_CMD_START) {
+	if (cmd == V4L2_DEC_CMD_START || cmd == V4L2_ENC_CMD_START) {
 		if (vb2_is_streaming(src_q) || vb2_is_streaming(dst_q))
 			if (iris_drc_pending(inst) || iris_drain_pending(inst))
 				return true;
-	} else if (cmd == V4L2_DEC_CMD_STOP) {
+	} else if (cmd == V4L2_DEC_CMD_STOP || cmd == V4L2_ENC_CMD_STOP) {
 		if (vb2_is_streaming(src_q))
 			if (inst->sub_state != IRIS_INST_SUB_DRAIN)
 				return true;
diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index 3270c0da668e739d4f98f008db780a0eb5d3dca4..099bd5ed4ae0294725860305254c4cad1ec88d7e 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -519,3 +519,61 @@ int iris_venc_qbuf(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
 
 	return iris_queue_buffer(inst, buf);
 }
+
+int iris_venc_start_cmd(struct iris_inst *inst)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	enum iris_inst_sub_state clear_sub_state = 0;
+	struct vb2_queue *dst_vq;
+	int ret;
+
+	dst_vq = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
+
+	if (inst->sub_state & IRIS_INST_SUB_DRAIN &&
+	    inst->sub_state & IRIS_INST_SUB_DRAIN_LAST) {
+		vb2_clear_last_buffer_dequeued(dst_vq);
+		clear_sub_state = IRIS_INST_SUB_DRAIN | IRIS_INST_SUB_DRAIN_LAST;
+		if (inst->sub_state & IRIS_INST_SUB_INPUT_PAUSE) {
+			if (hfi_ops->session_resume_drain) {
+				ret = hfi_ops->session_resume_drain(inst,
+					V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+				if (ret)
+					return ret;
+			}
+			clear_sub_state |= IRIS_INST_SUB_INPUT_PAUSE;
+		}
+		if (inst->sub_state & IRIS_INST_SUB_OUTPUT_PAUSE) {
+			if (hfi_ops->session_resume_drain) {
+				ret = hfi_ops->session_resume_drain(inst,
+					V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+				if (ret)
+					return ret;
+			}
+			clear_sub_state |= IRIS_INST_SUB_OUTPUT_PAUSE;
+		}
+	} else {
+		dev_err(inst->core->dev, "start called before receiving last_flag\n");
+		iris_inst_change_state(inst, IRIS_INST_ERROR);
+		return -EBUSY;
+	}
+
+	inst->last_buffer_dequeued = false;
+
+	return iris_inst_change_sub_state(inst, clear_sub_state, 0);
+}
+
+int iris_venc_stop_cmd(struct iris_inst *inst)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	int ret;
+
+	ret = hfi_ops->session_drain(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+	if (ret)
+		return ret;
+
+	ret = iris_inst_change_sub_state(inst, 0, IRIS_INST_SUB_DRAIN);
+
+	iris_scale_power(inst);
+
+	return ret;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_venc.h b/drivers/media/platform/qcom/iris/iris_venc.h
index bbf3b635288dd6cc39719bdde1942918357791aa..c4db7433da537578e05d566d53d89a22e1901678 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.h
+++ b/drivers/media/platform/qcom/iris/iris_venc.h
@@ -21,5 +21,7 @@ int iris_venc_s_param(struct iris_inst *inst, struct v4l2_streamparm *s_parm);
 int iris_venc_streamon_input(struct iris_inst *inst);
 int iris_venc_streamon_output(struct iris_inst *inst);
 int iris_venc_qbuf(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf);
+int iris_venc_start_cmd(struct iris_inst *inst);
+int iris_venc_stop_cmd(struct iris_inst *inst);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 245a68248a3f0fdda13b993ece45fa4c0a45aff9..798c3613e57eac1742633d61c1482229dbc32562 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -597,6 +597,39 @@ static int iris_dec_cmd(struct file *filp, void *fh,
 	return ret;
 }
 
+static int iris_enc_cmd(struct file *filp, void *fh,
+			struct v4l2_encoder_cmd *enc)
+{
+	struct iris_inst *inst = iris_get_inst(filp);
+	int ret = 0;
+
+	mutex_lock(&inst->lock);
+
+	ret = v4l2_m2m_ioctl_encoder_cmd(filp, fh, enc);
+	if (ret)
+		goto unlock;
+
+	if (inst->state == IRIS_INST_DEINIT)
+		goto unlock;
+
+	if (!iris_allow_cmd(inst, enc->cmd)) {
+		ret = -EBUSY;
+		goto unlock;
+	}
+
+	if (enc->cmd == V4L2_ENC_CMD_START)
+		ret = iris_venc_start_cmd(inst);
+	else if (enc->cmd == V4L2_ENC_CMD_STOP)
+		ret = iris_venc_stop_cmd(inst);
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
@@ -672,6 +705,8 @@ static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops_enc = {
 	.vidioc_qbuf                    = v4l2_m2m_ioctl_qbuf,
 	.vidioc_dqbuf                   = v4l2_m2m_ioctl_dqbuf,
 	.vidioc_remove_bufs             = v4l2_m2m_ioctl_remove_bufs,
+	.vidioc_try_encoder_cmd         = v4l2_m2m_ioctl_try_encoder_cmd,
+	.vidioc_encoder_cmd             = iris_enc_cmd,
 };
 
 void iris_init_ops(struct iris_core *core)

-- 
2.34.1


