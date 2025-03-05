Return-Path: <linux-media+bounces-27589-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6B4A4FC82
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 11:45:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C983F18950A0
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 10:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A11A720DD7D;
	Wed,  5 Mar 2025 10:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aEPHNl6W"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5847320D503;
	Wed,  5 Mar 2025 10:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741171477; cv=none; b=GBVBNbI8zlEHaK27IPfWA1IzH2B22G9dcM6JoamCB7ElhU6K6rNBxsaXQI+uovEXp2ZtkxaNdawk8bsPNIqsqAoY6g6ZbDmU4sK2H2xAbObYgZa6rfiWBpyAXdZXi3slPKHzhCrLQzwlj9S09LIIQibxCRH4DbJRm4WJ5n+CcuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741171477; c=relaxed/simple;
	bh=ShTcG9xSos+uOGsX+xOfaUC0HwJZf5qoX09mEtRbYcI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GLY9yat3C6ZTtkx2OVIVQ+SCpYqFk/Cax5KXwGDsrVXVeobZ1Pefu4tDKtRwDsRJBrvoEhoTz2UVo7vx6cshaAFZJw2ANiZArKBT2oq8woqjwH9xJ/bW9gSSHMZIncEri2+LGK1Co8kjqBfY7Xo5fXC2ugn8T3HhtYVTShgtIAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aEPHNl6W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 525A76fj010970;
	Wed, 5 Mar 2025 10:44:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	voEqt2/g8wyEf4sTqjpv/z9IjTpkhgIb222OzcEHGq8=; b=aEPHNl6WMkchDeUU
	0JT4hCUcRGy+0bvLWeMGWh5iqcH22HeSKEU/Yyziv0to4yNaBuslYxvuXqKYOzj6
	Hh8fSS4jVABhO2jDdGlKha4skGuF7CZdQv9lqjf2r+9y9l/1qoR1mWRrXrp92dfF
	K55RAGsef8RktVE/JPvBvwc2DhcpSVwTW5fFL+Ew54HcG1bdjHJS6kSfuPYE0zQN
	6u4CCYL2ThYgBnI2oyU/ajTY9gbNN6+40+2TB70efosBYsd37CvQFtMwMWUTfaWJ
	8CsUuGQpD36F7YVB9Pm/z2u2oSKFRFDqAjgqwE2SSFFhsIanVYxF9xRJ9/hQ8ouK
	2/nPBQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6tn1e9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 10:44:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 525AiUUn032350
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Mar 2025 10:44:30 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 5 Mar 2025 02:44:26 -0800
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
To: <quic_vgarodia@quicinc.com>, <quic_abhinavk@quicinc.com>,
        <mchehab@kernel.org>, <quic_dikshita@quicinc.com>
CC: <hverkuil@xs4all.nl>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH 01/12] media: iris: Add HEVC and VP9 formats for decoder
Date: Wed, 5 Mar 2025 16:13:24 +0530
Message-ID: <20250305104335.3629945-2-quic_dikshita@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250305104335.3629945-1-quic_dikshita@quicinc.com>
References: <20250305104335.3629945-1-quic_dikshita@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=HZbuTjE8 c=1 sm=1 tr=0 ts=67c82b0f cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=q7txp5L90lOmEJWSHg8A:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: lNaGlIWCHJkFsci_JrbF7ETSSVlnClqo
X-Proofpoint-ORIG-GUID: lNaGlIWCHJkFsci_JrbF7ETSSVlnClqo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_04,2025-03-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503050086

Extend the decoder driver's supported formats to include HEVC (H.265)
and VP9. This change updates the format enumeration (VIDIOC_ENUM_FMT)
and allows setting these formats via VIDIOC_S_FMT.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 .../qcom/iris/iris_hfi_gen1_command.c         | 18 ++++-
 .../qcom/iris/iris_hfi_gen1_defines.h         |  2 +
 .../qcom/iris/iris_hfi_gen2_command.c         | 16 ++++-
 .../qcom/iris/iris_hfi_gen2_defines.h         |  3 +
 .../media/platform/qcom/iris/iris_instance.h  |  2 +
 drivers/media/platform/qcom/iris/iris_vdec.c  | 69 +++++++++++++++++--
 drivers/media/platform/qcom/iris/iris_vdec.h  | 11 +++
 drivers/media/platform/qcom/iris/iris_vidc.c  |  3 -
 8 files changed, 113 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 64f887d9a17d..1e774b058ab9 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -26,6 +26,20 @@ static u32 iris_hfi_gen1_buf_type_from_driver(enum iris_buffer_type buffer_type)
 	}
 }
 
+static u32 iris_hfi_gen1_v4l2_to_codec_type(u32 pixfmt)
+{
+	switch (pixfmt) {
+	case V4L2_PIX_FMT_H264:
+		return HFI_VIDEO_CODEC_H264;
+	case V4L2_PIX_FMT_HEVC:
+		return HFI_VIDEO_CODEC_HEVC;
+	case V4L2_PIX_FMT_VP9:
+		return HFI_VIDEO_CODEC_VP9;
+	default:
+		return 0;
+	}
+}
+
 static int iris_hfi_gen1_sys_init(struct iris_core *core)
 {
 	struct hfi_sys_init_pkt sys_init_pkt;
@@ -88,16 +102,18 @@ static int iris_hfi_gen1_sys_pc_prep(struct iris_core *core)
 static int iris_hfi_gen1_session_open(struct iris_inst *inst)
 {
 	struct hfi_session_open_pkt packet;
+	u32 codec;
 	int ret;
 
 	if (inst->state != IRIS_INST_DEINIT)
 		return -EALREADY;
 
+	codec = iris_hfi_gen1_v4l2_to_codec_type(inst->codec);
 	packet.shdr.hdr.size = sizeof(struct hfi_session_open_pkt);
 	packet.shdr.hdr.pkt_type = HFI_CMD_SYS_SESSION_INIT;
 	packet.shdr.session_id = inst->session_id;
 	packet.session_domain = HFI_SESSION_TYPE_DEC;
-	packet.session_codec = HFI_VIDEO_CODEC_H264;
+	packet.session_codec = codec;
 
 	reinit_completion(&inst->completion);
 
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index 9f246816a286..3bea643068f9 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -13,6 +13,8 @@
 #define HFI_SESSION_TYPE_DEC				2
 
 #define HFI_VIDEO_CODEC_H264				0x00000002
+#define HFI_VIDEO_CODEC_HEVC				0x00002000
+#define HFI_VIDEO_CODEC_VP9				0x00004000
 
 #define HFI_ERR_NONE					0x0
 
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index a908b41e2868..beaf3a051d7c 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -20,6 +20,20 @@
 #define SYS_NO_PAYLOAD_PKT_SIZE (sizeof(struct iris_hfi_header) + \
 	sizeof(struct iris_hfi_packet))
 
+static u32 iris_hfi_gen2_v4l2_to_codec_type(struct iris_inst *inst)
+{
+	switch (inst->codec) {
+	case V4L2_PIX_FMT_H264:
+		return HFI_CODEC_DECODE_AVC;
+	case V4L2_PIX_FMT_HEVC:
+		return HFI_CODEC_DECODE_HEVC;
+	case V4L2_PIX_FMT_VP9:
+		return HFI_CODEC_DECODE_VP9;
+	default:
+		return 0;
+	}
+}
+
 static int iris_hfi_gen2_sys_init(struct iris_core *core)
 {
 	struct iris_hfi_header *hdr;
@@ -416,7 +430,7 @@ static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 p
 static int iris_hfi_gen2_session_set_codec(struct iris_inst *inst)
 {
 	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
-	u32 codec = HFI_CODEC_DECODE_AVC;
+	u32 codec = iris_hfi_gen2_v4l2_to_codec_type(inst);
 
 	iris_hfi_gen2_packet_session_property(inst,
 					      HFI_PROP_CODEC,
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index 806f8bb7f505..2fcf7914b70f 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -104,6 +104,9 @@ enum hfi_color_format {
 enum hfi_codec_type {
 	HFI_CODEC_DECODE_AVC			= 1,
 	HFI_CODEC_ENCODE_AVC			= 2,
+	HFI_CODEC_DECODE_HEVC			= 3,
+	HFI_CODEC_ENCODE_HEVC			= 4,
+	HFI_CODEC_DECODE_VP9			= 5,
 };
 
 enum hfi_picture_type {
diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index caa3c6507006..d8f076936c2b 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -42,6 +42,7 @@
  * @sequence_out: a sequence counter for output queue
  * @tss: timestamp metadata
  * @metadata_idx: index for metadata buffer
+ * @codec: codec type
  */
 
 struct iris_inst {
@@ -72,6 +73,7 @@ struct iris_inst {
 	u32				sequence_out;
 	struct iris_ts_metadata		tss[VIDEO_MAX_FRAME];
 	u32				metadata_idx;
+	u32				codec;
 };
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 4143acedfc57..cdcfe71f5b96 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -32,6 +32,7 @@ int iris_vdec_inst_init(struct iris_inst *inst)
 	f->fmt.pix_mp.width = DEFAULT_WIDTH;
 	f->fmt.pix_mp.height = DEFAULT_HEIGHT;
 	f->fmt.pix_mp.pixelformat = V4L2_PIX_FMT_H264;
+	inst->codec = f->fmt.pix_mp.pixelformat;
 	f->fmt.pix_mp.num_planes = 1;
 	f->fmt.pix_mp.plane_fmt[0].bytesperline = 0;
 	f->fmt.pix_mp.plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_INPUT);
@@ -67,14 +68,67 @@ void iris_vdec_inst_deinit(struct iris_inst *inst)
 	kfree(inst->fmt_src);
 }
 
+static const struct iris_fmt iris_vdec_formats[] = {
+	[IRIS_FMT_H264] = {
+		.pixfmt = V4L2_PIX_FMT_H264,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+	},
+	[IRIS_FMT_HEVC] = {
+		.pixfmt = V4L2_PIX_FMT_HEVC,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+	},
+	[IRIS_FMT_VP9] = {
+		.pixfmt = V4L2_PIX_FMT_VP9,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+	},
+};
+
+static const struct iris_fmt *
+find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
+{
+	const struct iris_fmt *fmt = iris_vdec_formats;
+	unsigned int size = ARRAY_SIZE(iris_vdec_formats);
+	unsigned int i;
+
+	for (i = 0; i < size; i++) {
+		if (fmt[i].pixfmt == pixfmt)
+			break;
+	}
+
+	if (i == size || fmt[i].type != type)
+		return NULL;
+
+	return &fmt[i];
+}
+
+static const struct iris_fmt *
+find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
+{
+	const struct iris_fmt *fmt = iris_vdec_formats;
+	unsigned int size = ARRAY_SIZE(iris_vdec_formats);
+
+	if (index >= size || fmt[index].type != type)
+		return NULL;
+
+	return &fmt[index];
+}
+
 int iris_vdec_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f)
 {
+	const struct iris_fmt *fmt;
+
 	switch (f->type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
-		f->pixelformat = V4L2_PIX_FMT_H264;
+		fmt = find_format_by_index(inst, f->index, f->type);
+		if (!fmt)
+			return -EINVAL;
+
+		f->pixelformat = fmt->pixfmt;
 		f->flags = V4L2_FMT_FLAG_COMPRESSED | V4L2_FMT_FLAG_DYN_RESOLUTION;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
+		if (f->index)
+			return -EINVAL;
 		f->pixelformat = V4L2_PIX_FMT_NV12;
 		break;
 	default:
@@ -88,13 +142,15 @@ int iris_vdec_try_fmt(struct iris_inst *inst, struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pixmp = &f->fmt.pix_mp;
 	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
+	const struct iris_fmt *fmt;
 	struct v4l2_format *f_inst;
 	struct vb2_queue *src_q;
 
 	memset(pixmp->reserved, 0, sizeof(pixmp->reserved));
+	fmt = find_format(inst, pixmp->pixelformat, f->type);
 	switch (f->type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
-		if (f->fmt.pix_mp.pixelformat != V4L2_PIX_FMT_H264) {
+		if (!fmt) {
 			f_inst = inst->fmt_src;
 			f->fmt.pix_mp.width = f_inst->fmt.pix_mp.width;
 			f->fmt.pix_mp.height = f_inst->fmt.pix_mp.height;
@@ -102,7 +158,7 @@ int iris_vdec_try_fmt(struct iris_inst *inst, struct v4l2_format *f)
 		}
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
-		if (f->fmt.pix_mp.pixelformat != V4L2_PIX_FMT_NV12) {
+		if (!fmt) {
 			f_inst = inst->fmt_dst;
 			f->fmt.pix_mp.pixelformat = f_inst->fmt.pix_mp.pixelformat;
 			f->fmt.pix_mp.width = f_inst->fmt.pix_mp.width;
@@ -145,13 +201,14 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 
 	switch (f->type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
-		if (f->fmt.pix_mp.pixelformat != V4L2_PIX_FMT_H264)
+		if (!(find_format(inst, f->fmt.pix_mp.pixelformat, f->type)))
 			return -EINVAL;
 
 		fmt = inst->fmt_src;
 		fmt->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
-
-		codec_align = DEFAULT_CODEC_ALIGNMENT;
+		fmt->fmt.pix_mp.pixelformat = f->fmt.pix_mp.pixelformat;
+		inst->codec = fmt->fmt.pix_mp.pixelformat;
+		codec_align = inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
 		fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, codec_align);
 		fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, codec_align);
 		fmt->fmt.pix_mp.num_planes = 1;
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.h b/drivers/media/platform/qcom/iris/iris_vdec.h
index b24932dc511a..cd7aab66dc7c 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.h
+++ b/drivers/media/platform/qcom/iris/iris_vdec.h
@@ -8,6 +8,17 @@
 
 struct iris_inst;
 
+enum iris_fmt_type {
+	IRIS_FMT_H264,
+	IRIS_FMT_HEVC,
+	IRIS_FMT_VP9,
+};
+
+struct iris_fmt {
+	u32 pixfmt;
+	u32 type;
+};
+
 int iris_vdec_inst_init(struct iris_inst *inst);
 void iris_vdec_inst_deinit(struct iris_inst *inst);
 int iris_vdec_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f);
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index ca0f4e310f77..6a6afa15b647 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -249,9 +249,6 @@ static int iris_enum_fmt(struct file *filp, void *fh, struct v4l2_fmtdesc *f)
 {
 	struct iris_inst *inst = iris_get_inst(filp, NULL);
 
-	if (f->index)
-		return -EINVAL;
-
 	return iris_vdec_enum_fmt(inst, f);
 }
 
-- 
2.34.1


