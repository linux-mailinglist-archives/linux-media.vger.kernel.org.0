Return-Path: <linux-media+bounces-25760-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7770CA2BD25
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 08:59:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E3DF67A4EDB
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 07:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83A052397BE;
	Fri,  7 Feb 2025 07:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="O6Jrdi+v"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28483239797;
	Fri,  7 Feb 2025 07:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738914983; cv=none; b=JexYmFSibnKOZDqIxKS7rc/u+ts0Kb09W5xPSqIahc1I4AHRD+FYQsS/H/APWhbbxxhUf/15QVPfyFHhvZoIavLZvjcwxrl35KbY3iIQSS8EssK6cMt9dBpLNi0A1FWICrNZIiVgZfiHbtCclJMGnUmfbCWiJRIkIOEcmuF1Ky8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738914983; c=relaxed/simple;
	bh=X1FMqnU3zRGqCqi+lvIh09KpUW/Dz2v72jzr/ZcI9bY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=j1jxr++7+k2TJfZb6yKCAgQ+FJFJqr83tcVNl/aThcV099XcvbN0WV/u4KxSwdE5hZAupNerYvAf1Aa2hUga8UATf6Cch6kq2XTgUTiIXO9TsFqE53pqcllS7Gfyt4C/rwn9UnxE+m3zz7BXZxOXFaaLvLBn3dSHaWydH1pAniE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=O6Jrdi+v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5172JFML004711;
	Fri, 7 Feb 2025 07:56:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PoM9/HRHo8DD3n+Ll5d8mPr7OMyWyEBKko0HTDVptkM=; b=O6Jrdi+vuPNv6LVC
	fxSb1xW3jHY4SG6ADLs+QCtup0j6adqy9ALAF/uWwudfQjmJvgnlit7Ipmr1ESk7
	zLCVwr/H+We4IL4LpzixwbX6pMIhK5d+OSYrozIEs/t610DpDr2gxEsg5eCMkDQm
	7KPCx49HohbPfXsTCTscoyt8aBG0mG6WaER5wCEuU3SWPXYgtcupHWiRosos6VJy
	8D5oExmyPu4wshDKURV9Hczivk0uOq24y6Ef8dwEO4pIN+AwFNPshAYZDhUtuNdD
	gbdDPRRSsYxIOQVPTwtKQ5mM1nr+olttDBc5clIXhLF7F8XfB5kmyBP0wcDFfzln
	YLqXfw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44n99e8qbk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Feb 2025 07:56:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5177u62H008390
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Feb 2025 07:56:06 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 6 Feb 2025 23:55:59 -0800
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 7 Feb 2025 13:24:50 +0530
Subject: [PATCH v10 10/28] media: iris: implement s_fmt, g_fmt and try_fmt
 ioctls
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250207-qcom-video-iris-v10-10-ab66eeffbd20@quicinc.com>
References: <20250207-qcom-video-iris-v10-0-ab66eeffbd20@quicinc.com>
In-Reply-To: <20250207-qcom-video-iris-v10-0-ab66eeffbd20@quicinc.com>
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
        Jianhua Lu <lujianhua000@gmail.com>,
        "Stefan
 Schmidt" <stefan.schmidt@linaro.org>,
        Joel Stanley <joel@jms.id.au>, "Johan
 Hovold" <johan@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Vedang Nagar <quic_vnagar@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738914893; l=8227;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=EYQ3AicFhbj1+6acGiEj6lNOClTR+yi7J5sAWYEp5l8=;
 b=wyV8pRVp+2zhkZ3q6609PeRXZ1KGf4OJ4BIb2lOEbu0d6PzndYll6bJd9ZBiLOJ4AxJdNQJo9
 DS9LjV5oIl/CiJM/ZPW6GbUcyj7HRkxYqHO/JvYASqHEzuaKQ9WzEPg
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _0krYjlTR1uxp4OyI7IIyJntcov35c4s
X-Proofpoint-GUID: _0krYjlTR1uxp4OyI7IIyJntcov35c4s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_03,2025-02-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 mlxscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 adultscore=0 mlxlogscore=999 malwarescore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502070060

From: Vedang Nagar <quic_vnagar@quicinc.com>

Implement the s_fmt, g_fmt and try_fmt ioctl ops with the necessary
hooks.

Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
Reviewed-by: Hans Verkuil <hverkuil@xs4all.nl>
Tested-by: Stefan Schmidt <stefan.schmidt@linaro.org> # x1e80100 (Dell XPS 13 9345)
Reviewed-by: Stefan Schmidt <stefan.schmidt@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK
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


