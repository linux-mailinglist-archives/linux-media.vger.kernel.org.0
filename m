Return-Path: <linux-media+bounces-36780-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E126AAF8A6F
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 10:01:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3B8E6E62C4
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 07:59:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 836F52D4B4E;
	Fri,  4 Jul 2025 07:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LnG4mx2w"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844A82C1590;
	Fri,  4 Jul 2025 07:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615664; cv=none; b=I5rYiRLnKqUaoO8nWJWRXDuV3x2viZnMIVcohy/roSwIw5cUlpptM7CfbvAbHEBG/kDlxHf+4F34r1nwKXHINoIFJRsqHZV2KYgVrv5ItQQ/ttG8lifUgsDbE+th5qHxOHezE53+Bkhpf+eq/INsWtoPCN9Y7g4BWL7Uvr4eouI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615664; c=relaxed/simple;
	bh=rBSFMZQnlFkvmsGXnjAJ+7RcBneq8uRcI3+uzvSGBvI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=CSQQU/1yaWZME7o/f02S/AVWFtLauBCh8JE3wjs1lkb06ZV8VmmT1P85aFP3g90nD73LzLLFD41Si8KUeMVPkinQ8pWgTIAzPCBlhtj+8c2uuEbbtnleUAKHFUBunu8dSzzIxU+KfeVWciYV9Toplff1+lrRltFFwpmyA3ddXQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LnG4mx2w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563KD02A029559;
	Fri, 4 Jul 2025 07:54:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H/HOPQfCpqiYF4bnOARS1c3kqC4SasfVC58+K1fcYkc=; b=LnG4mx2wSBafnE3O
	6yOTFCxwOrI5XLmBmxJNtaFs9fl/GG8he8cEPonK1MZRcdpxivBC5LlsNyii6xv7
	6NBpN2KwhEAazvHEv2ZS50mRUZnLtWrqqEhQ3VtDU38Pm341EmeaTBZobtBvpjo1
	Sb5DrDsCxtds4ChsAC/nhbV9toM2QyrfcHYvQIHWCb4Re9tT4bEBsVBaTd6mmF3o
	MOeZlpvf/GUzdi3o537FImeQPZQB3nfo3bkY7ny7TQxYbQSX3tsho4IWhCs1Vs2C
	zkQ0vsWkuit4jaZ1UhAsIQfTP7DQc0aok4WnOhdtRHvlPFK5t5Rh8BupiQgGgbLR
	3fourQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47nh9s4brx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 07:54:14 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5647sEPY001670
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Jul 2025 07:54:14 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 4 Jul 2025 00:54:10 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 4 Jul 2025 13:23:15 +0530
Subject: [PATCH 15/25] media: iris: Add support for
 ENUM_FRAMESIZES/FRAMEINTERVALS for encoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250704-iris-video-encoder-v1-15-b6ce24e273cf@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751615599; l=9939;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=rBSFMZQnlFkvmsGXnjAJ+7RcBneq8uRcI3+uzvSGBvI=;
 b=RZmFK+8IOeWk9WSz8o7KoN+nnoIleRlVMENzrVmLq8xTVgc5OEoOyju1cQ215d2pdGKHU8nH7
 q9V25euSqpSDuq14xi6ddT/JCH2xqhyEMI6KIxjJ5zAmBQuYzVkbTg0
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=frrcZE4f c=1 sm=1 tr=0 ts=686788a6 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=1QD8j7rrkHTDSVgEayQA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA2MCBTYWx0ZWRfXyPUocmpTTOgF
 jYgi/UouMOQ1w5Y1NUI8b8MkDuIRZmcVrZToWBPrwtwGhg6qx85aBO5Z633mbcO9+tbyjeylcnw
 UGyNzzeBsqJZG/0HxSaXHw+IEyenaIRxfrwSjngVo/GRJIwiA52uyPtY8xlwO7s7xdFS94VV9gi
 smrwfUfOG4UcopTZKDLOCRgLWIezwObg5AZEZrTOKjaXnh+cW5/Mg0724s7NB8GUt4JonKs/nX2
 w+FDBlP3RPb90VNZYInZi0XLoICs/vkvQnxJi1CeRsm4OM+DrEc2V+IvzDf/27fdnuHwZF7B7WY
 lBmkAaKJPSDefAthH+iwVPDlqOQrQ2OVWWpWPQU7hyPeYdd/xOgxeyDJzrVnptOTnKbL9h98l/y
 8Vdmllu3wXrXG52wONdDIBgTBDwgvuIXapf7GsUhdJ6xFGpPKYRTqvqV08ZAl6QjjSnS6ZYz
X-Proofpoint-GUID: r3_WAGQJTEl_qoY0ljyPXR2E3Q4gBDcL
X-Proofpoint-ORIG-GUID: r3_WAGQJTEl_qoY0ljyPXR2E3Q4gBDcL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 adultscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040060

Add support for frame size and frame interval enumeration by
implementing ENUM_FRAMESIZES/FRAMEINTERVALS V4L2 ioctls for encoder
video device with necessary hooks.

This allows userspace application to query encoder capabilities and
adapt encoding configurations accordingly.

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
index 13c7d2e243f43161df62170e4b8b56fc83b58193..0fb863426cdf479c50cad8a627c2845a6dfe0b32 100644
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


