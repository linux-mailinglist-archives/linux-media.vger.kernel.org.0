Return-Path: <linux-media+bounces-39782-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3280B245F3
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 11:48:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DD7E3BE990
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 09:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDF202F5485;
	Wed, 13 Aug 2025 09:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="C8Mpl5MT"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE7E309DB2;
	Wed, 13 Aug 2025 09:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755078003; cv=none; b=cAPDDnt0cSlwDSx3MDZgqG0EpIPC2Pm4alfG4qdVYi1mhLl8+rU65SPB0IWfrsFAXseBjI49MUAsHvYoIwEtWqAxtzwhLfPW4SW7ruDulOPeNqaKjbEWE0MaLCGrVVtqk6/GUy/X2Atv+xzTXlq7OKV1cO5OYp97wKjL9JG576g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755078003; c=relaxed/simple;
	bh=r8d7wAqoYC9J1VdSQlbXmfc3j+sAcF/y3i5AmZEDbeU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=RRM8iLL1mZL3w/oDxT2UXgwClsBOWF7TOlvXXcrkrRrqjnpnN2N6iO3z7viGu0SgtubtVv1Ry/YdSvDKfZwqO5lO6lcjhc3xdvnhd0tusvkTrH0BFjmWvtSZHOzzFonOsN6E6QRBoTxLex3C3GJEGJTDteUKUjWPeXxuuDdoCfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=C8Mpl5MT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D6mTDv030434;
	Wed, 13 Aug 2025 09:39:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1fw0kj3R23Qk8HyBqFLytD1VOzEBp4SxyNE2tsW51xw=; b=C8Mpl5MTXxOsa79h
	qxXeIVokvOLFz74wfGjO23hw+EsoiH/h4BaU0PybhDwUQcGlPf1BLMZtrPfQop85
	VUgOMAcKoHVDTfKmBNtIOUF5HOkeCOGli7A2WlDX8wlEnyaIT3/a2BlpvUFCew1b
	+cXEgZCxcAwZHZSsIElGbCNFcBVK+5cxIcJ/VtQjuPK4Vr6xZTWJJmPW5HSmn57l
	pCz8Li7fEWUgVJtZYRf8c6fy2K8PfXxyjvFDL4xOw30a3OSlcrlXWszjKHDtsh06
	RHLNSAhr67qXt7aK5DwOegCX+EtY9xoIHmYSRfUci7BPi4pDTG8qPX5Y5/r4xqWt
	FMHjWA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g9q9tcpq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 09:39:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57D9dtEJ031542
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 09:39:55 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 13 Aug 2025 02:39:51 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 13 Aug 2025 15:08:14 +0530
Subject: [PATCH v2 24/24] media: iris: Add support for drain sequence in
 encoder video device
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250813-iris-video-encoder-v2-24-c725ff673078@quicinc.com>
References: <20250813-iris-video-encoder-v2-0-c725ff673078@quicinc.com>
In-Reply-To: <20250813-iris-video-encoder-v2-0-c725ff673078@quicinc.com>
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
        Renjiang Han <quic_renjiang@quicinc.com>,
        Wangao Wang <quic_wangaow@quicinc.com>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755077897; l=9085;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=r8d7wAqoYC9J1VdSQlbXmfc3j+sAcF/y3i5AmZEDbeU=;
 b=i0JoHPT9NUbZxutRbG7t7jx8WL30J4vvwxqjXhxxsm8lZ4uRtTkI+59dk0muWU93cz/MVkzEQ
 yj95sY1oKYMDhTWnXkPoEzuLWlHPNOcPnIWf1rOADb6YzQTlOQg2zNe
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=CNMqXQrD c=1 sm=1 tr=0 ts=689c5d6c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=ghBcajBdglOd9ulocosA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: AU9T8RqBB_i0oS_N7o7ZBRWlNg-YBh1K
X-Proofpoint-ORIG-GUID: AU9T8RqBB_i0oS_N7o7ZBRWlNg-YBh1K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDE2NCBTYWx0ZWRfX8f3tlcseRNg4
 EBVP6jJsfIsL3wnN51WI98URXRbCf4RY7JR0UIlcLgEc+AmfT6zpcYTKP87YzcM6LQmbw3dKEFj
 D7gQcuvI8W89R9kd4G3csj3I5SXEZWbJJINScmqjc+w4B1pghlMTceTqbEXyi8gm6dvzlNGSqqn
 FhPlQi0DPrPb+mxwLrsJnqj4mcUH6XOi4Kh8fmN5oftC4VJl70xxvwk43a+a2Zd3z1XxFN4eTaH
 LFHAQkJCs9JWupTA/hNh8IXeumHC8ZuYHk/fCmNGQoEMMxDrp75bijo0Us+6ac9UaAsDmJE1E9b
 b13pnOeLAUmvofHdwo41iBzrQ9+/AvTKIMUYCj96ybEx2PaADvUXZf0bu6BMeMU+Lm6VVTI6f8b
 6qMIAzv2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120164

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
index 29c8dfa684e3bd5815f7b844ba4d9c6c324c697b..6d28bb51483ea0e2fad866390d42e1ac22d78566 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -455,15 +455,31 @@ static int iris_hfi_gen1_session_unset_buffers(struct iris_inst *inst, struct ir
 
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
index 1dc79e8fbab8d69d95ebe519d736f5f2f65b2886..719baa3f82f01fdc10f0eb6c2460186b141ae1e9 100644
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
index 751e6b81a07e1a3a116b3da22f28bee281c5982c..db59ddde12037ce62200177728deb55a0e5e23dd 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -599,6 +599,39 @@ static int iris_dec_cmd(struct file *filp, void *fh,
 	return ret;
 }
 
+static int iris_enc_cmd(struct file *filp, void *fh,
+			struct v4l2_encoder_cmd *enc)
+{
+	struct iris_inst *inst = iris_get_inst(filp, NULL);
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
@@ -674,6 +707,8 @@ static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops_enc = {
 	.vidioc_qbuf                    = v4l2_m2m_ioctl_qbuf,
 	.vidioc_dqbuf                   = v4l2_m2m_ioctl_dqbuf,
 	.vidioc_remove_bufs             = v4l2_m2m_ioctl_remove_bufs,
+	.vidioc_try_encoder_cmd         = v4l2_m2m_ioctl_try_encoder_cmd,
+	.vidioc_encoder_cmd             = iris_enc_cmd,
 };
 
 void iris_init_ops(struct iris_core *core)

-- 
2.34.1


