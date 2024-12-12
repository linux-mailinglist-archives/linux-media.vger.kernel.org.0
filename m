Return-Path: <linux-media+bounces-23300-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0365A9EE5C3
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 12:56:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9DAE81888A00
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 11:56:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA42121E0AE;
	Thu, 12 Dec 2024 11:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PVW571NG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820DF211A20;
	Thu, 12 Dec 2024 11:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734004386; cv=none; b=p5m/m5CWQZZv+UF2e/A9LFTDbnpM2ivz0ZHtkUVlUvJSUMpBCelaJWtHDfsk2Z5eYzebGYXWGQjNFQSdH9deLDouaw6n6Fu4ZA1XO3tO7LHPDxzH+GsR6+15XFb24zzPheJfIDjYzLNUbuSBi4+hpTYaM2VpEC7rdhqPGZ/uzEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734004386; c=relaxed/simple;
	bh=8g9d55PgL7/rzhYvy2FT75ccKTRm5YDZQuSquePqYx8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=twvvvfM3hW4oDQ3DSBGlsq5LvdmRfVZfAJHxdvefeLBHSkXScasFGWqKGoCuMvFMT+rb+yu6C/q1ooxjpkY9b8iy7h3IcAxW2ZnVs7RMNzavd8p7qMmfLCIKU9XEaQuVkDYy77BIGV5921qDasbRIKCyuRUBrK3Lhn8R1qTntKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PVW571NG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC7NkA4002102;
	Thu, 12 Dec 2024 11:52:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g11+ERU7fQ0pA63YGKsyGSIRE/D2Q47dGTzGTnrF/CU=; b=PVW571NG4E8DYvWy
	j1SWRdnM6BuHMufcotDpMocO3DgdRvFiGhnkpChADUIWRNJdnE2++qbPtl1SJN3l
	19tPmYoQJNdcvhv2x9VHrgQhAbNm9wtXy/ITHQ3H/k+E8P0luCIOwvSbKETZljv4
	nEL1BDfnArQDKjBj7FUCba8xY3WkRLBysk/2jqHx9kl/wQtx5qaK+tOUSiTbUaZW
	CS0TBYTwfDOjtbtAbw3MwpCoIisDQt/XHPAbMPfrhqmvsj06DOny7AzvEVH3mrsY
	Nf/gTcM0rxy0qpoNMtzkzP8/QloA23ah2UXgKNnJGDNvcBZchT7eiSYBzDTEWWEM
	AW6X9w==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43f0r9w77k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 11:52:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BCBqsjO005728
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 11:52:54 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 12 Dec 2024 03:52:47 -0800
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Thu, 12 Dec 2024 17:21:34 +0530
Subject: [PATCH v9 12/28] media: iris: implement enum_fmt and
 enum_framesizes ioctls
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241212-qcom-video-iris-v9-12-e8c2c6bd4041@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734004294; l=5924;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=kK+p3Izbz0OzsNOU67CcE09e47riFTSdAltpqScxgYA=;
 b=uaJzmeR6AobgjxRsElQbX2gyjWaubkmREhGb2UeJpnLwn3hfudvwR4Qp0i/ydIQseL9plRmIV
 mSvIKXfzWr2BQ7U4UMfaiqlM+pSiFZt8ChFxTjpH3SDy0v8N5SqNDXz
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: CZ9mj-Tw0hffghihrQ3O6a3ZuYeI3wyZ
X-Proofpoint-GUID: CZ9mj-Tw0hffghihrQ3O6a3ZuYeI3wyZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 mlxlogscore=999
 malwarescore=0 lowpriorityscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120084

From: Vedang Nagar <quic_vnagar@quicinc.com>

Implement enum_fmt and enum_framesizes ioctls with necessary hooks.

Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
Reviewed-by: Hans Verkuil <hverkuil@xs4all.nl>
Tested-by: Stefan Schmidt <stefan.schmidt@linaro.org> # x1e80100 (Dell
Reviewed-by: Stefan Schmidt <stefan.schmidt@linaro.org>
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


