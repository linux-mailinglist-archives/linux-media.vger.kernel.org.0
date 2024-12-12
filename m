Return-Path: <linux-media+bounces-23298-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE049EE5BB
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 12:55:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B99D91673FA
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 11:55:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E8B321639F;
	Thu, 12 Dec 2024 11:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Zd3b/oP9"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C7A21576F;
	Thu, 12 Dec 2024 11:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734004373; cv=none; b=tMmbPUza/OpQFnXUrnZZRCF8U63i8VbS37wBCyx3vDoH0faGJEpVdhk/yyY0aNdT7vLJGcCYh7QWjH00SDSSj66VVMfqGB2BnWcfqaCAOKcYWkGcNdsKSWLzJf+ZMLm/o/IiMJYHPN11MJwWsw+/dpDpLzC7AoDVQhKjXpSal7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734004373; c=relaxed/simple;
	bh=yD50Up7odWNZjPCOterWkLNvDd/qMUKPboejFgKwBSE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=OgO/De9ZIKE7neOImiCQBrU7465HC6Uf40Nb36KHQx0p4dg4Hh9W12Wm4BX7ZJnW5XGv9Cl9wfgqgUXF6jAQQc9SJjRUlTlWndnskqEL+sz8BkNysKOZkPCz6YzqmDhggKuHerJUXf2Wu0XwsO1ja4pX2izsF4FqBLemDS20iGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Zd3b/oP9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC80j9H002304;
	Thu, 12 Dec 2024 11:52:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9aPQmzqrtDKuV/EscgNVL619eBgSMGSq3Y68WF1hC5E=; b=Zd3b/oP9hMLgsmlg
	eAmyMQ2XEpxIsNns6mBQWNWPJYnsdd/6fKtuiNYzbKNDdfJ/zLjrE0MsLsHwE1Rf
	MrT/BPXQ9q4M0NvflhoaBx51Mjuna4HgWgp9ulZY2MPcaBKpuuBwoKO8xl7roSDz
	NWQmp/oBA4cYn1gYURQCpjWo761x0yU1lPSpmExW0ZLLMWmPKtIARJhBhrMxNlft
	vC5D07G8hmQSOtg50qq76rszf9/6Hl7m7HrEVqAr21psjDN7lzqkYkVHh9nRKUpT
	yNO2DvG3WQ2Ywu0zCxVYj+r9jYV48o2Yz1QlwL9KYsoBtrrMMQ+gz1ZkVizd3ShF
	lM7Exw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43eyg65a9k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 11:52:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BCBqfmH005612
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 11:52:41 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 12 Dec 2024 03:52:35 -0800
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Thu, 12 Dec 2024 17:21:32 +0530
Subject: [PATCH v9 10/28] media: iris: implement s_fmt, g_fmt and try_fmt
 ioctls
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241212-qcom-video-iris-v9-10-e8c2c6bd4041@quicinc.com>
References: <20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com>
In-Reply-To: <20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com>
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
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Vedang Nagar <quic_vnagar@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734004294; l=8063;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=hrTCsNaf5Yf36dubNH+yx55kdgAx82hNdiwLTOXnHds=;
 b=vakslEKqdbajrZL9dmwSWLO1Ubrl3LYD9pPZUFKeTxsm4Zzk7SIWh62FRlRpcSHKEFm9+bKuT
 A26+RqqC6awAwpF9jCbRO9yFNfm/kYlcqo+Dv+3sMngwkOfqZFEF0/L
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: LqwRanWpJ6c2uuH0X4A1vmVE9HXjKw1W
X-Proofpoint-ORIG-GUID: LqwRanWpJ6c2uuH0X4A1vmVE9HXjKw1W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 mlxscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120085

From: Vedang Nagar <quic_vnagar@quicinc.com>

Implement s_fmt, g_fmt and try_fmt ioctl ops with necessary hooks.

Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
Reviewed-by: Hans Verkuil <hverkuil@xs4all.nl>
Tested-by: Stefan Schmidt <stefan.schmidt@linaro.org> # x1e80100 (Dell
Reviewed-by: Stefan Schmidt <stefan.schmidt@linaro.org>
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


