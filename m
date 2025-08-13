Return-Path: <linux-media+bounces-39772-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2628B245DB
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 11:45:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DF591BC3B4B
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 09:43:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 592FF2FF17E;
	Wed, 13 Aug 2025 09:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XgVhqDk3"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E092FE59F;
	Wed, 13 Aug 2025 09:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755077963; cv=none; b=FKUvipWKlEEjTwT7+ycGOQwZk94LGB/dqWyGtcenrozMBZ8GzxMy99vq51bB5NY2E9904tUJUGCEbFj9dswPWThf4fk7RGpWkm62eqSfslHM7fp3ukio6Btyaw+Bh2usrpy+7BBQ7demdjpPPAZGPXX/4BAv4DUWkI8LP0r34q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755077963; c=relaxed/simple;
	bh=My5/NsdbF9WM0Oqv67RFErL3CZWNzMHzG9KTDEO1P6Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=EJLd2U23+Su1DbCZERSmkqY6XyxdZpViU0K0PgK6t3TgcjKwB5XMG8ZxL5C5pwovyVBvy4ysC3Wcod6qNm8IxQ953yZLW8mDtQXHGeSEzZq4rK2lFC8yzYFwTiYAzSuly/Vw43L07BB8XCXWEOjbp4Pj+zEjuo37gUVQJvZcV9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XgVhqDk3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D6mhps016517;
	Wed, 13 Aug 2025 09:39:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/gTjOeFyj60INP3+KF/ASXNFyHDyxVaPTJs8MhX8Svs=; b=XgVhqDk3vbtAU3r9
	43R3JHWW4J5D12U6253y/Q6WWT4njKxL4pCT3GlA5IFTn1o9dba85+uC9YPU/FbQ
	B0UR5YPGawFsyMoaJT/rdVy6FpmpGR1DFmPh0dewFTPseSlg+OvKrRS6z7k4wFeE
	nwuLqWR6zU9WcrLfLkuif7XhMC1B2t7OfyGgqvzgo2qgijNpBsL3FsQBhF8Wrqh5
	WlMnnStpREGZRk2WyVysEGR2OITJ8vtLPKvHe0Ghe/qxCc58/IVw47k5LoJBIfIg
	46uIHDQBFWy91CAvpuSoCiW9D1xsPTMNuxUQC1UeLbX4O6sTg/nU1dFXdNd5RVZE
	R5cPvg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fjxbefmj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 09:39:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57D9dGuq004737
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 09:39:16 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 13 Aug 2025 02:39:12 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 13 Aug 2025 15:08:04 +0530
Subject: [PATCH v2 14/24] media: iris: Add support for
 ENUM_FRAMESIZES/FRAMEINTERVALS for encoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250813-iris-video-encoder-v2-14-c725ff673078@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755077896; l=10005;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=My5/NsdbF9WM0Oqv67RFErL3CZWNzMHzG9KTDEO1P6Y=;
 b=e2gc+sg0fEjSC64q29rwiQ41eSvHu//YXWi9FkpPObKIs7ddoxOWvPVZkO+yAmQsc1Vwn7oSa
 LJHS76wxtstBrfza+wvYJ2IaQCkfajLYaO/x4sqxK6QiHhM/9ut/E1m
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=G6EcE8k5 c=1 sm=1 tr=0 ts=689c5d44 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=1QD8j7rrkHTDSVgEayQA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA5NyBTYWx0ZWRfXz4SgHGYQVQ3S
 QjUR5Tzxqt4V5s+raDXvlOoP77xF+sqgdAhLZ8Y7XFKv76aj4/cgfLJSHGB2kNQKktXLAm7YJC3
 L0cjKcFtNOjGPnNCKubk73eHvWPpZp4I6iLQ0x95p/+RDrfSbWdfAHhJ3CRYal0OfejRCh2fD6P
 wAT+6WJ8Ex8NElcdFc7LwA88Rb7e0Ju32cn87fxRd2aRKsFP3Z+NSk8oDMM81+uBgJdefNJ1A3i
 7YimMaLvT+58O6Jg+/QvxIdmIrAjykJJphVZaTQJ/NVCfyegeXd9Mxo0VFL/Azo+q0RaP41C+bC
 fSdM1suPe3O71YllU0rlJ26KGNzGev2vD+Jmmtsl8FarXkreA4lp3H6e7HbyHplsI5bIfpU9NxH
 UhDy2U0v
X-Proofpoint-ORIG-GUID: r51N1xMhWQv9iq8l_TBlqCl6RCQlwGhv
X-Proofpoint-GUID: r51N1xMhWQv9iq8l_TBlqCl6RCQlwGhv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110097

Add support for frame size and frame interval enumeration by
implementing ENUM_FRAMESIZES/FRAMEINTERVALS V4L2 ioctls for encoder
video device with necessary hooks.

This allows userspace application to query encoder capabilities and
adapt encoding configurations accordingly.

Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 .../platform/qcom/iris/iris_platform_common.h      |  5 +-
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  3 ++
 .../platform/qcom/iris/iris_platform_sm8250.c      |  1 +
 drivers/media/platform/qcom/iris/iris_vdec.c       | 13 +++++
 drivers/media/platform/qcom/iris/iris_vdec.h       |  1 +
 drivers/media/platform/qcom/iris/iris_venc.c       | 13 +++++
 drivers/media/platform/qcom/iris/iris_venc.h       |  1 +
 drivers/media/platform/qcom/iris/iris_vidc.c       | 58 ++++++++++++++++++++--
 8 files changed, 91 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index adafdce8a856f9c661aabc5ca28f0faceaa93551..792f46e2e34fd564a1ed61523f72826fc8f74582 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -21,7 +21,8 @@ struct iris_inst;
 #define DEFAULT_MAX_HOST_BUF_COUNT		64
 #define DEFAULT_MAX_HOST_BURST_BUF_COUNT	256
 #define DEFAULT_FPS				30
-#define NUM_MBS_8K				((8192 * 4352) / 256)
+#define MAXIMUM_FPS				480
+#define NUM_MBS_8K                             ((8192 * 4352) / 256)
 
 enum stage_type {
 	STAGE_1 = 1,
@@ -179,6 +180,8 @@ struct iris_platform_data {
 	u32 max_session_count;
 	/* max number of macroblocks per frame supported */
 	u32 max_core_mbpf;
+	/* max number of macroblocks per second supported */
+	u32 max_core_mbps;
 	const u32 *input_config_params_default;
 	unsigned int input_config_params_default_size;
 	const u32 *input_config_params_hevc;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index d3026b2bcb708c7ec31f134f628df7e57b54af4f..1e2fadfe17672029b46e07ce00a8e31e0711fd58 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -354,6 +354,7 @@ struct iris_platform_data sm8550_data = {
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
+	.max_core_mbps = ((7680 * 4320) / 256) * 60,
 	.input_config_params_default =
 		sm8550_vdec_input_config_params_default,
 	.input_config_params_default_size =
@@ -429,6 +430,7 @@ struct iris_platform_data sm8650_data = {
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
+	.max_core_mbps = ((7680 * 4320) / 256) * 60,
 	.input_config_params_default =
 		sm8550_vdec_input_config_params_default,
 	.input_config_params_default_size =
@@ -500,6 +502,7 @@ struct iris_platform_data qcs8300_data = {
 	.num_vpp_pipe = 2,
 	.max_session_count = 16,
 	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
+	.max_core_mbps = ((7680 * 4320) / 256) * 60, //TODO confirm!!
 	.input_config_params_default =
 		sm8550_vdec_input_config_params_default,
 	.input_config_params_default_size =
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
index 8d0816a67ae0b6886204ce93fa5ccafaac10392a..2a3cbe1f2d4b27d3cce9e9cdad1525801d71a041 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
@@ -128,6 +128,7 @@ struct iris_platform_data sm8250_data = {
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K,
+	.max_core_mbps = ((7680 * 4320) / 256) * 60,
 	.input_config_params_default =
 		sm8250_vdec_input_config_param_default,
 	.input_config_params_default_size =
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 3482ff3f18d2bcd592b7eb7d803bf98e29276ebb..6afbd2f89260a233d75d7a0cdf3647236216c9ec 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -263,6 +263,19 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 	return 0;
 }
 
+int iris_vdec_validate_format(struct iris_inst *inst, u32 pixelformat)
+{
+	const struct iris_fmt *fmt = NULL;
+
+	if (pixelformat != V4L2_PIX_FMT_NV12) {
+		fmt = find_format(inst, pixelformat, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+		if (!fmt)
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
 int iris_vdec_subscribe_event(struct iris_inst *inst, const struct v4l2_event_subscription *sub)
 {
 	int ret = 0;
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.h b/drivers/media/platform/qcom/iris/iris_vdec.h
index b24932dc511a65017b1cadbcb984544475bd0723..097e02bfa72b5ac4e46e66c61842df1d9dd4565b 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.h
+++ b/drivers/media/platform/qcom/iris/iris_vdec.h
@@ -13,6 +13,7 @@ void iris_vdec_inst_deinit(struct iris_inst *inst);
 int iris_vdec_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f);
 int iris_vdec_try_fmt(struct iris_inst *inst, struct v4l2_format *f);
 int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f);
+int iris_vdec_validate_format(struct iris_inst *inst, u32 pixelformat);
 int iris_vdec_subscribe_event(struct iris_inst *inst, const struct v4l2_event_subscription *sub);
 void iris_vdec_src_change(struct iris_inst *inst);
 int iris_vdec_streamon_input(struct iris_inst *inst);
diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index 6bb59ce4fc565d3dcc6185233ef25d2e4d85cb3e..301206253090962abbb4e4eac8ee88e7b359c98d 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -270,3 +270,16 @@ int iris_venc_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 		return -EINVAL;
 	}
 }
+
+int iris_venc_validate_format(struct iris_inst *inst, u32 pixelformat)
+{
+	const struct iris_fmt *fmt = NULL;
+
+	if (pixelformat != V4L2_PIX_FMT_NV12) {
+		fmt = find_format(inst, pixelformat, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+		if (!fmt)
+			return -EINVAL;
+	}
+
+	return 0;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_venc.h b/drivers/media/platform/qcom/iris/iris_venc.h
index eb26a3ecbd98b3f02dfdea0dfc41bcd3a90904b6..04fd41275547c40c359c6ea04dfe4ee31d2d0df6 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.h
+++ b/drivers/media/platform/qcom/iris/iris_venc.h
@@ -13,5 +13,6 @@ void iris_venc_inst_deinit(struct iris_inst *inst);
 int iris_venc_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f);
 int iris_venc_try_fmt(struct iris_inst *inst, struct v4l2_format *f);
 int iris_venc_s_fmt(struct iris_inst *inst, struct v4l2_format *f);
+int iris_venc_validate_format(struct iris_inst *inst, u32 pixelformat);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 06b2737c5892ebbcf43b4cff66062d85cf805c20..cb1280c0c6c82187243f0bda4d98e42370ee787c 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -373,13 +373,18 @@ static int iris_enum_framesizes(struct file *filp, void *fh,
 {
 	struct iris_inst *inst = iris_get_inst(filp, NULL);
 	struct platform_inst_caps *caps;
+	int ret = 0;
 
 	if (fsize->index)
 		return -EINVAL;
 
-	if (fsize->pixel_format != V4L2_PIX_FMT_H264 &&
-	    fsize->pixel_format != V4L2_PIX_FMT_NV12)
-		return -EINVAL;
+	if (inst->domain == DECODER)
+		ret = iris_vdec_validate_format(inst, fsize->pixel_format);
+	else
+		ret = iris_venc_validate_format(inst, fsize->pixel_format);
+
+	if (ret)
+		return ret;
 
 	caps = inst->core->iris_platform_data->inst_caps;
 
@@ -391,6 +396,51 @@ static int iris_enum_framesizes(struct file *filp, void *fh,
 	fsize->stepwise.max_height = caps->max_frame_height;
 	fsize->stepwise.step_height = STEP_HEIGHT;
 
+	return ret;
+}
+
+static int iris_enum_frameintervals(struct file *filp, void *fh,
+				    struct v4l2_frmivalenum *fival)
+
+{
+	struct iris_inst *inst = iris_get_inst(filp, NULL);
+	struct platform_inst_caps *caps;
+	struct iris_core *core = inst->core;
+	u32 fps, mbpf;
+	int ret = 0;
+
+	if (inst->domain == DECODER)
+		return -ENOTTY;
+
+	if (fival->index)
+		return -EINVAL;
+
+	ret = iris_venc_validate_format(inst, fival->pixel_format);
+	if (ret)
+		return ret;
+
+	if (!fival->width || !fival->height)
+		return -EINVAL;
+
+	caps = inst->core->iris_platform_data->inst_caps;
+	if (fival->width > caps->max_frame_width ||
+	    fival->width < caps->min_frame_width ||
+	    fival->height > caps->max_frame_height ||
+	    fival->height < caps->min_frame_height)
+		return -EINVAL;
+
+	mbpf = NUM_MBS_PER_FRAME(fival->height, fival->width);
+	fps = DIV_ROUND_UP(core->iris_platform_data->max_core_mbps, mbpf);
+
+	fival->type = V4L2_FRMIVAL_TYPE_STEPWISE;
+	fival->stepwise.min.numerator = 1;
+	fival->stepwise.min.denominator =
+			min_t(u32, fps, MAXIMUM_FPS);
+	fival->stepwise.max.numerator = 1;
+	fival->stepwise.max.denominator = 1;
+	fival->stepwise.step.numerator = 1;
+	fival->stepwise.step.denominator = MAXIMUM_FPS;
+
 	return 0;
 }
 
@@ -525,6 +575,8 @@ static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops_enc = {
 	.vidioc_s_fmt_vid_out_mplane    = iris_s_fmt_vid_mplane,
 	.vidioc_g_fmt_vid_cap_mplane    = iris_g_fmt_vid_mplane,
 	.vidioc_g_fmt_vid_out_mplane    = iris_g_fmt_vid_mplane,
+	.vidioc_enum_framesizes         = iris_enum_framesizes,
+	.vidioc_enum_frameintervals     = iris_enum_frameintervals,
 };
 
 void iris_init_ops(struct iris_core *core)

-- 
2.34.1


