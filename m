Return-Path: <linux-media+bounces-19567-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EEF99C4F4
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 11:11:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D64201F21933
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 09:11:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E04519E997;
	Mon, 14 Oct 2024 09:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="o0ytTm56"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A746156669;
	Mon, 14 Oct 2024 09:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728896912; cv=none; b=PheD+J29Un9PRC/AlWEQQ6GzcrnFbba6Ndwmqf569c6op8Oil+6b8sQo5v9DTzh2aeooPaMNFgbPsgRMvW7yYaLHMaiThNmE/aqQdSNG51SnYYz3iXbeHONH6E1SMYmGRres+t0KEY/2Cl3HkkiUAzvTBzlOs7TLNYTeWV97i0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728896912; c=relaxed/simple;
	bh=V8eOfXGGtBAu8fK3fFhiedtkwVEdnnHx3y8IZf+gqS0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=YdMP9C8xcA29evzPGpT4kxiFhN7QAuzWjr57QhRG8cREMEKFhugPJsTkTv7jtijruyvylKE8J8K/2QpHp5GumHkJmw36qVbgf7re+TZMmmmH0O9CA68XB3xZ2ALIsg5bnRiTJ9j8cXzpp2JEc1sDQIem7DaQ3wNv7JITZj+OIgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=o0ytTm56; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49DKmbQe010339;
	Mon, 14 Oct 2024 09:08:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iuGdSBznQ73GfYLDCRR4oy3eP5/ofy2IioQ6MaEwe38=; b=o0ytTm563B/ongWe
	VhiR+UlVs6GCZTeua8J8uoYRDP1/BH/V29wTiJEA92G8G9mIDn22iRD8m+JYsz4b
	7bpcojk1F6gf/HWOnEnKT3TOkGq6G7AlzENfU3JaeDKaIUj/e16MEjFtmAg4Dd7C
	USy0gWyIhLzR4Ai2vpb4bugxmklfJj3cpnzkSZ5bhMMHsKJXsb2cd6GMAbNxQU9w
	4TH9tOTD4RQpwua4jwTmXCycMNYpldbK/rBjpXuAtxcGmFngqQ1rwLVCzXhM9bOi
	8/zDoySE9swAQ2R8S7oK8qW/V/MvzrPL6q8WbhJroIhGft3oxSNiV+z6Ty+zU2Lf
	GjxtBA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 427hb33unv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 09:08:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49E98NUM015201
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 09:08:23 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 14 Oct 2024 02:08:19 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Mon, 14 Oct 2024 14:37:31 +0530
Subject: [PATCH v4 10/28] media: iris: implement s_fmt, g_fmt and try_fmt
 ioctls
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241014-qcom-video-iris-v4-v4-10-c5eaa4e9ab9e@quicinc.com>
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
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Vedang Nagar <quic_vnagar@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728896854; l=8401;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=LXBGtiYs07EUh6ZliSt40SnLljn0h2jA/6Ylk903cyA=;
 b=kCHRm4/IguwTpAZC20zuKaLv2fSy8DjZAkwReYt4+nDW2WJgu910MwN0d9XjKN8B+hLvRWqso
 GMwTbvxtmDlAint7xL8GygNCoFcG8u1tHHWnPF3+C0l/UZiA18irLR1
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ceYgyibqTYdCSSkIsS7Sq6RSKBHurTPV
X-Proofpoint-GUID: ceYgyibqTYdCSSkIsS7Sq6RSKBHurTPV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410140066

From: Vedang Nagar <quic_vnagar@quicinc.com>

Implement s_fmt, g_fmt and try_fmt ioctl ops with
necessary hooks.

Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_vdec.c | 131 +++++++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vdec.h |   2 +
 drivers/media/platform/qcom/iris/iris_vidc.c |  48 ++++++++++
 3 files changed, 181 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 7d1ef31c7c44..e807decdda2b 100644
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
@@ -56,3 +59,131 @@ void iris_vdec_inst_deinit(struct iris_inst *inst)
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
+		if (inst->buffers[BUF_INPUT].actual_count < inst->buffers[BUF_INPUT].min_count)
+			inst->buffers[BUF_INPUT].actual_count = inst->buffers[BUF_INPUT].min_count;
+
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
+		q = v4l2_m2m_get_vq(inst->m2m_ctx, f->type);
+		if (q->streaming) {
+			f->fmt.pix_mp.height = inst->fmt_src->fmt.pix_mp.height;
+			f->fmt.pix_mp.width = inst->fmt_src->fmt.pix_mp.width;
+		}
+		if (fmt->fmt.pix_mp.pixelformat != V4L2_PIX_FMT_NV12)
+			return -EINVAL;
+		fmt->fmt.pix_mp.pixelformat = f->fmt.pix_mp.pixelformat;
+		fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, 128);
+		fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 32);
+		fmt->fmt.pix_mp.num_planes = 1;
+		fmt->fmt.pix_mp.plane_fmt[0].bytesperline = ALIGN(f->fmt.pix_mp.width, 128);
+		fmt->fmt.pix_mp.plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_OUTPUT);
+
+		if (!q->streaming)
+			inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_INPUT);
+		if (inst->buffers[BUF_OUTPUT].actual_count < inst->buffers[BUF_OUTPUT].min_count)
+			inst->buffers[BUF_OUTPUT].actual_count =
+				inst->buffers[BUF_OUTPUT].min_count;
+
+		inst->buffers[BUF_OUTPUT].size = fmt->fmt.pix_mp.plane_fmt[0].sizeimage;
+
+		if (!q->streaming) {
+			inst->crop.top = 0;
+			inst->crop.left = 0;
+			inst->crop.width = f->fmt.pix_mp.width;
+			inst->crop.height = f->fmt.pix_mp.height;
+		}
+		break;
+	default:
+		return -EINVAL;
+	}
+	memcpy(f, fmt, sizeof(*fmt));
+
+	return 0;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.h b/drivers/media/platform/qcom/iris/iris_vdec.h
index 0324d7f796dd..4f2557d15ca2 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.h
+++ b/drivers/media/platform/qcom/iris/iris_vdec.h
@@ -10,5 +10,7 @@ struct iris_inst;
 
 void iris_vdec_inst_init(struct iris_inst *inst);
 void iris_vdec_inst_deinit(struct iris_inst *inst);
+int iris_vdec_try_fmt(struct iris_inst *inst, struct v4l2_format *f);
+int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index b1a9f0b5380d..05146970189b 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -214,6 +214,48 @@ int iris_close(struct file *filp)
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
+		memcpy(f, inst->fmt_src, sizeof(*f));
+	else if (V4L2_TYPE_IS_CAPTURE(f->type))
+		memcpy(f, inst->fmt_dst, sizeof(*f));
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
@@ -228,6 +270,12 @@ static const struct vb2_ops iris_vb2_ops = {
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


