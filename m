Return-Path: <linux-media+bounces-22904-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C83E9E9517
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 13:56:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1FEB163932
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 12:56:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21179231CB3;
	Mon,  9 Dec 2024 12:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ORywo/jC"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7929229B22;
	Mon,  9 Dec 2024 12:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733748835; cv=none; b=BbN4nh0PfE2K83u4xA23QkkfYxNDwjN5uHQN+eL2SlU+C9QCv5FAizfNAmKKkNw/C1CU0opBMjoWOmR06umCMHnTZZbkIynRJbNkjG8ZI+aDu9PhnVrbeBYW4CzcfuVIgcYuVniB5AGbcBJniMI+Uqp2kb1f7oFZd7aTExN3ilM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733748835; c=relaxed/simple;
	bh=p9igXB7zuSpRInmjS9KLuwgW/K7SOsFMNOSEnFlV2w4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=FLjQhj3GASaIi7ol7EnBkzpcHgxwqlk6jQNRx9RGsvnYpSmck1rUwlRxgWnR7gsjHJc9EibO7x6X2G1tD65lTKrF9i+OXJGN2fe9lwF/C/SizyRz9WOEv2O24n5wWhDPlPa01cJE+wIjuHbzgqn8Cp3dWOp8c9uajL7C9TwHM8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ORywo/jC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9AFlf5025164;
	Mon, 9 Dec 2024 12:53:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mEdbIu8hlJ5JhcKjvkuLIAcKqfUJ/B2NqpNLWrrAuKU=; b=ORywo/jCTO4+32HQ
	7FPJMqLS3fTUdOUHI+gQRZ9f9N1iYBYZS253/u/Ex8vylQ/Cxf7th3ylRgFYYd2T
	/6dpBK9/o4FPvnRLyGZ02KX2OK96JN9xbdp8Ac2rKv0AiQEq63gWUs6SUS+aJGoN
	UDaD2ezrCNTU1m2IeBs40DTcEPQP/epf4ZdWDR2M2JxJPPeFaXvp3lkXtaKqeWAE
	bm0zyFhnTFqYxalyc+JLqOXTr7dIMXanXNLPDSon0frOG/Anj1fCfBnwmy3/oRrg
	b5/44dlXQX4JxugD+e4J1JU9D/tiAFz+gYXyNYDvY0KoH62zhhWnv9/oGT6t0gLI
	mLC8kA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43cdpgmw22-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 12:53:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B9CrhUJ013406
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Dec 2024 12:53:43 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Dec 2024 04:53:38 -0800
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Mon, 9 Dec 2024 18:21:57 +0530
Subject: [PATCH v7 12/28] media: iris: implement enum_fmt and
 enum_framesizes ioctls
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241209-qcom-video-iris-v7-12-05c6bdead47b@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733748748; l=5795;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=L2DSe2VqF1U+Yu20OZvUpMgb0/cnK8oQbJ4HU/X363o=;
 b=JLJbtGlpunuJkr20kjzA+F5ydIbEFtFW51069cdPj1jPeI1y+szAiwriFR0IllDeLjipCEw2y
 j0QFLT+0kRoB/k+WylljfxeazoUswzUD903hqOuWQ0tvDxMszjnOW1c
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PY7usFHfPegOy8wUrdsOWZRKktkfO8TS
X-Proofpoint-ORIG-GUID: PY7usFHfPegOy8wUrdsOWZRKktkfO8TS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 suspectscore=0 mlxscore=0 priorityscore=1501
 phishscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412090101

From: Vedang Nagar <quic_vnagar@quicinc.com>

Implement enum_fmt and enum_framesizes ioctls with necessary hooks.

Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
Reviewed-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 .../platform/qcom/iris/iris_platform_common.h      |  4 +++
 .../platform/qcom/iris/iris_platform_sm8550.c      |  4 +++
 drivers/media/platform/qcom/iris/iris_vdec.c       | 17 ++++++++++
 drivers/media/platform/qcom/iris/iris_vdec.h       |  1 +
 drivers/media/platform/qcom/iris/iris_vidc.c       | 39 ++++++++++++++++++++++
 5 files changed, 65 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index d508477b066e..75d4932df910 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -43,6 +43,10 @@ struct ubwc_config_data {
 };
 
 struct platform_inst_caps {
+	u32 min_frame_width;
+	u32 max_frame_width;
+	u32 min_frame_height;
+	u32 max_frame_height;
 	u32 max_mbpf;
 };
 struct iris_core_power {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
index bc4769732aad..37c0130d7059 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
@@ -11,6 +11,10 @@
 #define VIDEO_ARCH_LX 1
 
 static struct platform_inst_caps platform_inst_cap_sm8550 = {
+	.min_frame_width = 96,
+	.max_frame_width = 8192,
+	.min_frame_height = 96,
+	.max_frame_height = 8192,
 	.max_mbpf = (8192 * 4352) / 256,
 };
 
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 38a5df8191cc..081a9eda5c49 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -58,6 +58,23 @@ void iris_vdec_inst_deinit(struct iris_inst *inst)
 	kfree(inst->fmt_src);
 }
 
+int iris_vdec_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f)
+{
+	switch (f->type) {
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
+		f->pixelformat = V4L2_PIX_FMT_H264;
+		f->flags = V4L2_FMT_FLAG_COMPRESSED | V4L2_FMT_FLAG_DYN_RESOLUTION;
+		break;
+	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
+		f->pixelformat = V4L2_PIX_FMT_NV12;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 int iris_vdec_try_fmt(struct iris_inst *inst, struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pixmp = &f->fmt.pix_mp;
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.h b/drivers/media/platform/qcom/iris/iris_vdec.h
index 85e93f33e9e7..ae456676e578 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.h
+++ b/drivers/media/platform/qcom/iris/iris_vdec.h
@@ -10,6 +10,7 @@ struct iris_inst;
 
 void iris_vdec_inst_init(struct iris_inst *inst);
 void iris_vdec_inst_deinit(struct iris_inst *inst);
+int iris_vdec_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f);
 int iris_vdec_try_fmt(struct iris_inst *inst, struct v4l2_format *f);
 int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f);
 
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 92eb793cbeb7..82bd0be8e5da 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -217,6 +217,16 @@ int iris_close(struct file *filp)
 	return 0;
 }
 
+static int iris_enum_fmt(struct file *filp, void *fh, struct v4l2_fmtdesc *f)
+{
+	struct iris_inst *inst = iris_get_inst(filp, NULL);
+
+	if (f->index)
+		return -EINVAL;
+
+	return iris_vdec_enum_fmt(inst, f);
+}
+
 static int iris_try_fmt_vid_mplane(struct file *filp, void *fh, struct v4l2_format *f)
 {
 	struct iris_inst *inst = iris_get_inst(filp, NULL);
@@ -259,6 +269,32 @@ static int iris_g_fmt_vid_mplane(struct file *filp, void *fh, struct v4l2_format
 	return ret;
 }
 
+static int iris_enum_framesizes(struct file *filp, void *fh,
+				struct v4l2_frmsizeenum *fsize)
+{
+	struct iris_inst *inst = iris_get_inst(filp, NULL);
+	struct platform_inst_caps *caps;
+
+	if (fsize->index)
+		return -EINVAL;
+
+	if (fsize->pixel_format != V4L2_PIX_FMT_H264 &&
+	    fsize->pixel_format != V4L2_PIX_FMT_NV12)
+		return -EINVAL;
+
+	caps = inst->core->iris_platform_data->inst_caps;
+
+	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
+	fsize->stepwise.min_width = caps->min_frame_width;
+	fsize->stepwise.max_width = caps->max_frame_width;
+	fsize->stepwise.step_width = STEP_WIDTH;
+	fsize->stepwise.min_height = caps->min_frame_height;
+	fsize->stepwise.max_height = caps->max_frame_height;
+	fsize->stepwise.step_height = STEP_HEIGHT;
+
+	return 0;
+}
+
 static int iris_g_selection(struct file *filp, void *fh, struct v4l2_selection *s)
 {
 	struct iris_inst *inst = iris_get_inst(filp, NULL);
@@ -300,12 +336,15 @@ static const struct vb2_ops iris_vb2_ops = {
 };
 
 static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops = {
+	.vidioc_enum_fmt_vid_cap        = iris_enum_fmt,
+	.vidioc_enum_fmt_vid_out        = iris_enum_fmt,
 	.vidioc_try_fmt_vid_cap_mplane  = iris_try_fmt_vid_mplane,
 	.vidioc_try_fmt_vid_out_mplane  = iris_try_fmt_vid_mplane,
 	.vidioc_s_fmt_vid_cap_mplane    = iris_s_fmt_vid_mplane,
 	.vidioc_s_fmt_vid_out_mplane    = iris_s_fmt_vid_mplane,
 	.vidioc_g_fmt_vid_cap_mplane    = iris_g_fmt_vid_mplane,
 	.vidioc_g_fmt_vid_out_mplane    = iris_g_fmt_vid_mplane,
+	.vidioc_enum_framesizes         = iris_enum_framesizes,
 	.vidioc_reqbufs                 = v4l2_m2m_ioctl_reqbufs,
 	.vidioc_g_selection             = iris_g_selection,
 };

-- 
2.34.1


