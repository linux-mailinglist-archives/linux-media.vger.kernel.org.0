Return-Path: <linux-media+bounces-36790-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6174CAF8AB1
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 10:08:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6AACE189803D
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 08:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 444232F2C52;
	Fri,  4 Jul 2025 07:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EZZet3AI"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DEC2F0046;
	Fri,  4 Jul 2025 07:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615698; cv=none; b=TdLa5G3hZIOkfvVJF3g174CSlfPay91X4aAZChWGF0nrN68zgmVr9YoKmJNyrqYpc6hhK+M8wn7i6fVOQjmtj9KXZeO1FW1ehjTfhBzRlR3VGmgAQVm6fMSRTDVS0u+0zV2NSwyOozNgfYJxo/Zy61az7jTMVcwtqVXYhzXrTYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615698; c=relaxed/simple;
	bh=lSbQKc21EFh5f7cTfTA8hlLfBNQSjFCKZNHFPnWKGKI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=f+4zhOGTMKOO11ytyYLh06Vs9vXrhrKVC59/DYSVMwdlYHnqgx9eRGNJt0YuSY7byCyvai6KuFO0MRecnMX1YV7TpbBS0NSYZP0d//oGMFfm2XBthexEPnOf6hQoWosETrrZufYMWKtTPYxcdb1GNY527zdCHXrP7jtrvT8V0/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EZZet3AI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5644Ldl6000729;
	Fri, 4 Jul 2025 07:54:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2D2soBNVa/YOKDhSDJ6+16GIDoySdBP61hMBMvP/J68=; b=EZZet3AI03LFiFMD
	RcjfRQHBvouvNT+sE4IqvaudVDmvQk8+TCwZ3keseaBv28OY95xU1+1idzzgikAH
	o4rSQ1XM6oHWKzuCMd2NMDvxXuNxTlQGfteEqo+m7ym5ypcuYQfd6VdwTEYEmdKe
	Sgc/oGWks7BUNBnQb9ZvsZjjgoEAO9991SLZU1ecn+45BKcChLmj9+Otmq7vQtqg
	Sx2btCx7UzQtctNwijW/8xZl4kOLONesX9vGLyYt45f9jqPOZN0RKqMDwrjfC2B7
	MIbVEsrNoabwAD5RBKvfOoZRi890TUYSvS6nZTT9ImqTm1OneP5tCRaQgrkh/G6G
	ENOx0Q==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47p7ut0gka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 07:54:48 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5647sm4O020922
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Jul 2025 07:54:48 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 4 Jul 2025 00:54:44 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 4 Jul 2025 13:23:25 +0530
Subject: [PATCH 25/25] media: iris: Add support for drain sequence in
 encoder video device
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250704-iris-video-encoder-v1-25-b6ce24e273cf@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751615599; l=7984;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=lSbQKc21EFh5f7cTfTA8hlLfBNQSjFCKZNHFPnWKGKI=;
 b=fVquLTeMbn+RaEBfJIgH4MBWTP2Jp1xxXlD6goE0bJUb6vlQ+XlAEPIzpGH59OdZP+8CDucAb
 oJ7oVAhWgtMAcDTR+Yf/uJoDMfEd2nYonkQvAYu+SQ8I+hoXz6McM0f
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA2MCBTYWx0ZWRfX5oTOFmt2Vk1D
 z/wXU0x6O2RLA1449AOYVbzEC3ieAK+RllbNRTAauxSbZjQVbD0ocx/SceAZCHc6wHuCKlM9N3L
 OSaQ+LAe3tT9qtlXcQ7V6sBXWqrQ7Ys6mzHacr+3+wqJ47k09Lq9X5LiSn2W/O91PKKxZrng9Or
 HJdroQQMz/ie9OXfte1YMxBIbE6H1I5xw9rbZoxDlk1vEDHjdvaEHe4aWSDcRY2c+91Scl37xsO
 dL++zfQEKwKeubj/STxLrdZ/JtQVm8GhVx2XNWU5Uy/hC2CBbq+AD5A2EJOxThJzYjfK/ODnl4h
 z3lLy00xesE/Yu0Jbbe1MzLROq/MUfaUsmoKe7ByLPIH4XSF/ZxDXYjNhFMQqgD5Y5dprDGC2pP
 /fZpl2sdyDEQp+2agAYIl+EE8ZBgbUxFB7X2Z0uQid2Ac0K7BOPCfJ7WA1lcakxu3OvW87DE
X-Proofpoint-GUID: kc2kYpRjMdSmga9ph4BV9Dtr0pOthqk3
X-Authority-Analysis: v=2.4 cv=Ncfm13D4 c=1 sm=1 tr=0 ts=686788c8 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=FUEJ49ZlnHEtWuKhW4YA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: kc2kYpRjMdSmga9ph4BV9Dtr0pOthqk3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0 malwarescore=0
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040060

Add support for handling start and stop commands, including the
end-of-stream (drain) sequence, in the encoder video device.

This enables proper signaling to the firmware and ensures that all
pending frames are processed and flushed before completing the stream.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 .../platform/qcom/iris/iris_hfi_gen1_command.c     | 30 ++++++++---
 .../platform/qcom/iris/iris_hfi_gen1_response.c    |  5 ++
 drivers/media/platform/qcom/iris/iris_venc.c       | 58 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_venc.h       |  2 +
 drivers/media/platform/qcom/iris/iris_vidc.c       | 35 +++++++++++++
 5 files changed, 123 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 65648076131f5312950322216ee250474063b4bc..fff5631423330d22ead4891654fcc38d8b55e0f5 100644
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
index 6b55f8d15e1097de2fb919b30695ac41f7270adf..c4750d60cb93dab9be8a02edf47305d6a046a6ac 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -487,6 +487,11 @@ static void iris_hfi_gen1_session_ftb_done(struct iris_inst *inst, void *packet)
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
index ddf4443aba62a8799188c2046f8dadfbb3e0cdbd..01338c7f3125d982360ed8168f95ab572c9e5897 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -598,6 +598,39 @@ static int iris_dec_cmd(struct file *filp, void *fh,
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
@@ -673,6 +706,8 @@ static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops_enc = {
 	.vidioc_qbuf                    = v4l2_m2m_ioctl_qbuf,
 	.vidioc_dqbuf                   = v4l2_m2m_ioctl_dqbuf,
 	.vidioc_remove_bufs             = v4l2_m2m_ioctl_remove_bufs,
+	.vidioc_try_encoder_cmd         = v4l2_m2m_ioctl_try_encoder_cmd,
+	.vidioc_encoder_cmd             = iris_enc_cmd,
 };
 
 void iris_init_ops(struct iris_core *core)

-- 
2.34.1


