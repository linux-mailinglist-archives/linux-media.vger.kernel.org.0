Return-Path: <linux-media+bounces-40370-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CBCB2D7EF
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 11:22:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E4C81C25C03
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 09:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 375E62EAB81;
	Wed, 20 Aug 2025 09:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="B0KMy+RR"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B672E8886;
	Wed, 20 Aug 2025 09:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755680941; cv=none; b=jvuHAZsDjheeoPajRAjtW8nrNrRq3xelCbtJTqc1S1T+P2M3CvYIun55MBbKqXLbOTeLp70oQYcUKvxHZeUT3woXDVf/aCHUdOO7r7oNOf/lZd6pTdGaDFJappw8XFI+DrUmo9YL7Hoc9RM3pEb/wbFVx9yG3NWKdkjUGNoC7Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755680941; c=relaxed/simple;
	bh=SkGyf0aAmixBXenB303AzkyVlWmdXE0PkOWuOayDKuU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=emT3JCFwGNlV0aLoDHVqTVLEcWjypsitndOd03sRPavtyiRfgrY7GljmQyb62CX31Yg3pKLCRvUfXFb4I4tfih/ykyeOnQ1WeJnPjj71FlZDyfWDcpmqQNeAmqkzDuWtUmHg45mfx/y3MOqh08dmlX/EWYNLczSnzqjX8We5qiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=B0KMy+RR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1oYB3002014;
	Wed, 20 Aug 2025 09:08:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z0Pp9hLoCzIfgAE1pqYDFAIn17dHPlTT1rVewCHwMQ0=; b=B0KMy+RR5W+DlEN9
	cmYW/lKVzwQ249Roc5W0Ln3qAaIQ2xmk7sWtT3alPx8Ub2h+Q6Arm8ao/Zgm78+T
	CdFdjn1Wl1gilvZPbfWWuuOnH4kAnB2qGaNWMBddLTlqDe/PkGBmyWfsEq89mYV6
	bu7kOYwqRaZVWfrWncfkwQAAvvzZeugBKR9a56wXuF292lAmrTIVDbPJ6SgMUatw
	Q+BqmfknB/wrZ5wwwybq0JylN82SCMxaqTRd6rdi0opEejKpNnrlxf48iU6xivSA
	5u4WnA61jC82steMGMYo/yevJArOxzBPDfiN+URVb3T99hlhaaLjijoSZ67tX5sb
	t6yrtw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n528s3pw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 09:08:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57K98sNH005330
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 09:08:54 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 20 Aug 2025 02:08:50 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 20 Aug 2025 14:37:54 +0530
Subject: [PATCH v3 16/26] media: iris: Add support for
 ENUM_FRAMESIZES/FRAMEINTERVALS for encoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250820-iris-video-encoder-v3-16-80ab0ba58b3d@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755680867; l=10036;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=SkGyf0aAmixBXenB303AzkyVlWmdXE0PkOWuOayDKuU=;
 b=GeBBHbo6BWBmW+mFLD0AqQk28rw46n3oT3oISHh3TAUg4/69OL/1QJ9vNbw5Z2F8dh6mFgCf4
 EHQUD2S68NcCkYQ8SWDC+TFmxS/nq+ueaLSs0JRFUDk2YOOK31qbLQn
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=fpOFpF4f c=1 sm=1 tr=0 ts=68a590a7 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=1QD8j7rrkHTDSVgEayQA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: c_4LMu7_W-0ob3DM7J23xZcN_HA_HqIF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX7Nzix3nrQtR8
 4fx+TTOWGYKresI7j3eP71bvSYA+oxViDXH7uQhoBUbFEQHWiNoAhUyaaFoqCeTnFtxHOVdYIpl
 fEdzX4TXHmKgr3aStxdinZg4hiqQhvwJLOoxc4s0bmA+b9WprV+HYJdWa6Fok5DMt8VY1tLD7YV
 6occbSNzuTGnPCmnq6LE1ub3SGDMqzubRztAqvnX7xkeoQBoCc0djWPcZciUn+owxLnHKms/KzX
 XwGwgcbVQB5/36Gr4IEqoi/JFd0mYWOaIMWC1uRUrF7sVQrBSOmoYzDmCwFATXjt8Xkhe9RjfX2
 G+6YoogYbgDt2NKj45Z3oIzLTGOaTpfWpsG969KRyk48YD3gL3z5w6KY+gXb5CY9keYLufgDQvp
 3alLcidIcWAQOnQoJVCWql03QpOLcA==
X-Proofpoint-ORIG-GUID: c_4LMu7_W-0ob3DM7J23xZcN_HA_HqIF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

Add support for frame size and frame interval enumeration by
implementing ENUM_FRAMESIZES/FRAMEINTERVALS V4L2 ioctls for encoder
video device with necessary hooks.

This allows userspace application to query encoder capabilities and
adapt encoding configurations accordingly.

Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
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
index d3026b2bcb708c7ec31f134f628df7e57b54af4f..d5f7eb904569d4e3ae9c33e1436c8151cac5355d 100644
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
+	.max_core_mbps = (((3840 * 2176) / 256) * 120),
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
index b4ad5df62bcd1ee390ce4f7c1c58c8693d0ab0ca..f1bc928043acea9aae7bbb960448adec9e7a4880 100644
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
index 40f7990cd162ad400711d729917b7e2577d562b2..55938050249fa1a041b835214e79028ae0b35e36 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -273,3 +273,16 @@ int iris_venc_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
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
index 7adb82186cac540919463fd6d6be85b42eeb73db..3f641782e932a30af46c631003a72d7dd2b4386e 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -371,13 +371,18 @@ static int iris_enum_framesizes(struct file *filp, void *fh,
 {
 	struct iris_inst *inst = iris_get_inst(filp);
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
 
@@ -389,6 +394,51 @@ static int iris_enum_framesizes(struct file *filp, void *fh,
 	fsize->stepwise.max_height = caps->max_frame_height;
 	fsize->stepwise.step_height = STEP_HEIGHT;
 
+	return ret;
+}
+
+static int iris_enum_frameintervals(struct file *filp, void *fh,
+				    struct v4l2_frmivalenum *fival)
+
+{
+	struct iris_inst *inst = iris_get_inst(filp);
+	struct iris_core *core = inst->core;
+	struct platform_inst_caps *caps;
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
 
@@ -523,6 +573,8 @@ static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops_enc = {
 	.vidioc_s_fmt_vid_out_mplane    = iris_s_fmt_vid_mplane,
 	.vidioc_g_fmt_vid_cap_mplane    = iris_g_fmt_vid_mplane,
 	.vidioc_g_fmt_vid_out_mplane    = iris_g_fmt_vid_mplane,
+	.vidioc_enum_framesizes         = iris_enum_framesizes,
+	.vidioc_enum_frameintervals     = iris_enum_frameintervals,
 };
 
 void iris_init_ops(struct iris_core *core)

-- 
2.34.1


