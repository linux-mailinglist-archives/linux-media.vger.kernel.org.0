Return-Path: <linux-media+bounces-22903-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 573D99E9513
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 13:56:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 044F1188231B
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 12:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E8DC231C99;
	Mon,  9 Dec 2024 12:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BoM5MeUM"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01212309BA;
	Mon,  9 Dec 2024 12:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733748833; cv=none; b=Cw1hUlTQeoR6lqMUJmvN+xGM99Zeu6tZvRAn3KFXkGi7rBU+pvJabT6UvQ+RCjGyeVMfyM5/7RxJMVgiW6ECuapRnxwmC/Rwmw9KpgcT4mvmFx5/BB/A7lvFR28wvHNjWBtEnNuiqkBJxSVl0esF4rV3KwAJO4BEhm2X5h8THw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733748833; c=relaxed/simple;
	bh=3wHXUnCurWc9c4vRRV6r5wVR6IaVI2JonfLLxfy1vBM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=AqPYivPD6Bd0G5pFzjSRwf5Gd/GH+WM33FW9Pv4Sa0BfCPikwzgVn4UYp8ArAyS7mQFdfC0PT4AJ0J3fKYq6hujzjqHPdHAxkGqISwmQXuoCqb/MRtHpQsNBvVBejoWzLiMw43hKsbj0mPtuj7EMdByINZ2fJT8NJPydRZH0Ye0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BoM5MeUM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9AMGNj024768;
	Mon, 9 Dec 2024 12:53:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JPm5yL0kI6/0C3DEKLlHxGmFkFCsIkzfbpCx4lZ3Ifc=; b=BoM5MeUMDY2uhsV8
	8XyG21tOsy7mCssFas8f/5pzHW7wydrDp8aQ1t29XLf/eRkqGS3xGBb8+hDwvqzN
	PQO76vlUKOKjlEhpURY6nMqGyLcsof//wNNuwRvu+b2RURZMfdxnycNHXNXkhY2M
	mJ1uV7Bul1N9BequZt+niXi9ABWtMNGjZGRcCn+E4Ywv5N0qHoactgpG6JYriKvv
	+KT1tuH7HtT8EZGa36jhnPam1FiW7M9okCThpO/IG+pWxpKKXP1Pez66Za4h7rL2
	IVUyoceBwEt94Xs8DQneAtxahWaqxzv/ZEdIHEF1dPWZ1H2NTkGu+L71JP78RXTV
	9Qtr2w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ceetmv9x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 12:53:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B9CrWH0012736
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Dec 2024 12:53:32 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Dec 2024 04:53:26 -0800
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Mon, 9 Dec 2024 18:21:55 +0530
Subject: [PATCH v7 10/28] media: iris: implement s_fmt, g_fmt and try_fmt
 ioctls
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241209-qcom-video-iris-v7-10-05c6bdead47b@quicinc.com>
References: <20241209-qcom-video-iris-v7-0-05c6bdead47b@quicinc.com>
In-Reply-To: <20241209-qcom-video-iris-v7-0-05c6bdead47b@quicinc.com>
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
 Agarwal" <quic_dikshita@quicinc.com>,
        Vedang Nagar <quic_vnagar@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733748748; l=7886;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=XlZIYup7OX+QWMyo68tX+TNiMsKIsVI963qEbtLUDP4=;
 b=59O1iedT+Os+r7p+PVGqXWHDTl+CQr4SQOecBuSK7jF4m00i7cfHhp8g9xZBz84AEBu94bibP
 dRfK9tLZbzPBv+YeywUptK4fQwgTIWvFv8FWs//DjVAW/b2D61db5r/
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: sKKR4WxZnL-lQ8X9LbH27bElK2CSsRRv
X-Proofpoint-ORIG-GUID: sKKR4WxZnL-lQ8X9LbH27bElK2CSsRRv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0 mlxlogscore=999
 bulkscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412090101

From: Vedang Nagar <quic_vnagar@quicinc.com>

Implement s_fmt, g_fmt and try_fmt ioctl ops with necessary hooks.

Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_vdec.c | 122 +++++++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vdec.h |   2 +
 drivers/media/platform/qcom/iris/iris_vidc.c |  48 +++++++++++
 3 files changed, 172 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 2ed50ad5d58b..38a5df8191cc 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -3,6 +3,8 @@
  * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <media/v4l2-mem2mem.h>
+
 #include "iris_buffer.h"
 #include "iris_instance.h"
 #include "iris_vdec.h"
@@ -10,6 +12,7 @@
 
 #define DEFAULT_WIDTH 320
 #define DEFAULT_HEIGHT 240
+#define DEFAULT_CODEC_ALIGNMENT 16
 
 void iris_vdec_inst_init(struct iris_inst *inst)
 {
@@ -54,3 +57,122 @@ void iris_vdec_inst_deinit(struct iris_inst *inst)
 	kfree(inst->fmt_dst);
 	kfree(inst->fmt_src);
 }
+
+int iris_vdec_try_fmt(struct iris_inst *inst, struct v4l2_format *f)
+{
+	struct v4l2_pix_format_mplane *pixmp = &f->fmt.pix_mp;
+	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
+	struct v4l2_format *f_inst;
+	struct vb2_queue *src_q;
+
+	memset(pixmp->reserved, 0, sizeof(pixmp->reserved));
+	switch (f->type) {
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
+		if (f->fmt.pix_mp.pixelformat != V4L2_PIX_FMT_H264) {
+			f_inst = inst->fmt_src;
+			f->fmt.pix_mp.width = f_inst->fmt.pix_mp.width;
+			f->fmt.pix_mp.height = f_inst->fmt.pix_mp.height;
+			f->fmt.pix_mp.pixelformat = f_inst->fmt.pix_mp.pixelformat;
+		}
+		break;
+	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
+		if (f->fmt.pix_mp.pixelformat != V4L2_PIX_FMT_NV12) {
+			f_inst = inst->fmt_dst;
+			f->fmt.pix_mp.pixelformat = f_inst->fmt.pix_mp.pixelformat;
+			f->fmt.pix_mp.width = f_inst->fmt.pix_mp.width;
+			f->fmt.pix_mp.height = f_inst->fmt.pix_mp.height;
+		}
+
+		src_q = v4l2_m2m_get_src_vq(m2m_ctx);
+		if (vb2_is_streaming(src_q)) {
+			f_inst = inst->fmt_src;
+			f->fmt.pix_mp.height = f_inst->fmt.pix_mp.height;
+			f->fmt.pix_mp.width = f_inst->fmt.pix_mp.width;
+		}
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (pixmp->field == V4L2_FIELD_ANY)
+		pixmp->field = V4L2_FIELD_NONE;
+
+	pixmp->num_planes = 1;
+
+	return 0;
+}
+
+int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
+{
+	struct v4l2_format *fmt, *output_fmt;
+	struct vb2_queue *q;
+	u32 codec_align;
+
+	q = v4l2_m2m_get_vq(inst->m2m_ctx, f->type);
+	if (!q)
+		return -EINVAL;
+
+	if (vb2_is_busy(q))
+		return -EBUSY;
+
+	iris_vdec_try_fmt(inst, f);
+
+	switch (f->type) {
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
+		if (f->fmt.pix_mp.pixelformat != V4L2_PIX_FMT_H264)
+			return -EINVAL;
+
+		fmt = inst->fmt_src;
+		fmt->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
+
+		codec_align = DEFAULT_CODEC_ALIGNMENT;
+		fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, codec_align);
+		fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, codec_align);
+		fmt->fmt.pix_mp.num_planes = 1;
+		fmt->fmt.pix_mp.plane_fmt[0].bytesperline = 0;
+		fmt->fmt.pix_mp.plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_INPUT);
+		inst->buffers[BUF_INPUT].min_count = iris_vpu_buf_count(inst, BUF_INPUT);
+		inst->buffers[BUF_INPUT].size = fmt->fmt.pix_mp.plane_fmt[0].sizeimage;
+
+		fmt->fmt.pix_mp.colorspace = f->fmt.pix_mp.colorspace;
+		fmt->fmt.pix_mp.xfer_func = f->fmt.pix_mp.xfer_func;
+		fmt->fmt.pix_mp.ycbcr_enc = f->fmt.pix_mp.ycbcr_enc;
+		fmt->fmt.pix_mp.quantization = f->fmt.pix_mp.quantization;
+
+		output_fmt = inst->fmt_dst;
+		output_fmt->fmt.pix_mp.colorspace = f->fmt.pix_mp.colorspace;
+		output_fmt->fmt.pix_mp.xfer_func = f->fmt.pix_mp.xfer_func;
+		output_fmt->fmt.pix_mp.ycbcr_enc = f->fmt.pix_mp.ycbcr_enc;
+		output_fmt->fmt.pix_mp.quantization = f->fmt.pix_mp.quantization;
+
+		inst->crop.left = 0;
+		inst->crop.top = 0;
+		inst->crop.width = f->fmt.pix_mp.width;
+		inst->crop.height = f->fmt.pix_mp.height;
+		break;
+	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
+		fmt = inst->fmt_dst;
+		fmt->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+		if (fmt->fmt.pix_mp.pixelformat != V4L2_PIX_FMT_NV12)
+			return -EINVAL;
+		fmt->fmt.pix_mp.pixelformat = f->fmt.pix_mp.pixelformat;
+		fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, 128);
+		fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 32);
+		fmt->fmt.pix_mp.num_planes = 1;
+		fmt->fmt.pix_mp.plane_fmt[0].bytesperline = ALIGN(f->fmt.pix_mp.width, 128);
+		fmt->fmt.pix_mp.plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_OUTPUT);
+		inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
+		inst->buffers[BUF_OUTPUT].size = fmt->fmt.pix_mp.plane_fmt[0].sizeimage;
+
+		inst->crop.top = 0;
+		inst->crop.left = 0;
+		inst->crop.width = f->fmt.pix_mp.width;
+		inst->crop.height = f->fmt.pix_mp.height;
+		break;
+	default:
+		return -EINVAL;
+	}
+	memcpy(f, fmt, sizeof(*fmt));
+
+	return 0;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.h b/drivers/media/platform/qcom/iris/iris_vdec.h
index 353b73b76230..85e93f33e9e7 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.h
+++ b/drivers/media/platform/qcom/iris/iris_vdec.h
@@ -10,5 +10,7 @@ struct iris_inst;
 
 void iris_vdec_inst_init(struct iris_inst *inst);
 void iris_vdec_inst_deinit(struct iris_inst *inst);
+int iris_vdec_try_fmt(struct iris_inst *inst, struct v4l2_format *f);
+int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index ab3b63171c1d..bec965284b6e 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -217,6 +217,48 @@ int iris_close(struct file *filp)
 	return 0;
 }
 
+static int iris_try_fmt_vid_mplane(struct file *filp, void *fh, struct v4l2_format *f)
+{
+	struct iris_inst *inst = iris_get_inst(filp, NULL);
+	int ret;
+
+	mutex_lock(&inst->lock);
+	ret = iris_vdec_try_fmt(inst, f);
+	mutex_unlock(&inst->lock);
+
+	return ret;
+}
+
+static int iris_s_fmt_vid_mplane(struct file *filp, void *fh, struct v4l2_format *f)
+{
+	struct iris_inst *inst = iris_get_inst(filp, NULL);
+	int ret;
+
+	mutex_lock(&inst->lock);
+	ret = iris_vdec_s_fmt(inst, f);
+	mutex_unlock(&inst->lock);
+
+	return ret;
+}
+
+static int iris_g_fmt_vid_mplane(struct file *filp, void *fh, struct v4l2_format *f)
+{
+	struct iris_inst *inst = iris_get_inst(filp, NULL);
+	int ret = 0;
+
+	mutex_lock(&inst->lock);
+	if (V4L2_TYPE_IS_OUTPUT(f->type))
+		*f = *inst->fmt_src;
+	else if (V4L2_TYPE_IS_CAPTURE(f->type))
+		*f = *inst->fmt_dst;
+	else
+		ret = -EINVAL;
+
+	mutex_unlock(&inst->lock);
+
+	return ret;
+}
+
 static struct v4l2_file_operations iris_v4l2_file_ops = {
 	.owner                          = THIS_MODULE,
 	.open                           = iris_open,
@@ -231,6 +273,12 @@ static const struct vb2_ops iris_vb2_ops = {
 };
 
 static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops = {
+	.vidioc_try_fmt_vid_cap_mplane  = iris_try_fmt_vid_mplane,
+	.vidioc_try_fmt_vid_out_mplane  = iris_try_fmt_vid_mplane,
+	.vidioc_s_fmt_vid_cap_mplane    = iris_s_fmt_vid_mplane,
+	.vidioc_s_fmt_vid_out_mplane    = iris_s_fmt_vid_mplane,
+	.vidioc_g_fmt_vid_cap_mplane    = iris_g_fmt_vid_mplane,
+	.vidioc_g_fmt_vid_out_mplane    = iris_g_fmt_vid_mplane,
 	.vidioc_reqbufs                 = v4l2_m2m_ioctl_reqbufs,
 };
 

-- 
2.34.1


