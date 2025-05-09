Return-Path: <linux-media+bounces-32107-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC66AB0DA0
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 10:46:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24E30166F50
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 08:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D08A3288509;
	Fri,  9 May 2025 08:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fqG/B6Q/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554B52882CF;
	Fri,  9 May 2025 08:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746780051; cv=none; b=NsiExCAJ1i/ixYJJJgPfO4xsBM3wHzbIgLkElWyezjqRl5wb5VJT5g/xLMNF+XIbVM35K+BfldSSfeX4zsSKE8FEwlXhmqVKUHNz5TWYNvqyFJUOtmUpx4Tl5+jG2Ak6u9udUEtmfqZdezUXgQJBnv5Ui8wseg8BP2HGE1JFNVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746780051; c=relaxed/simple;
	bh=mPaTXXar1GcvTJwA1jQG1jTpDY6XN7IaUlTIKYONY/U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=L3AZYBrZ1x6ufBRaU9LOPgqRHGPu7Wv25mFSVFz4ccnXz2uN/3CqeSGBuGKEVy+LFjcx/wt3UEh+u2z04kc4FGI+e/vlGOpagrHtIwOc1/WivH8YDu/YnywK3F2W5McOCvzucvWkRZ2FjNOIKERmimNe/08lglTJtekAU3EA82g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fqG/B6Q/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5492p95I014025;
	Fri, 9 May 2025 08:40:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r+2RzOOpFpJ1svKVUJnGhFYge92UQ+PlYb5Gw/0tBA0=; b=fqG/B6Q/59KTKM8R
	qhoKPZ+KxhvuKBwOrD26SD88z3KbwjyaaNAsa+gxao6G/It9EpugyA2W8ExpPPuo
	JSgae3uTKolV3RmVx3dXkabwvpB0tY/CrWD0tN4AwKVNhYbOq2e7qajHpw+2sGye
	J5dJ75kUdcNl5ZQrGC0jYJBVdLWzmIQ08u5LoOIhHavdsqPfFDYLwYhafqgT4mpv
	s50ywElsX9dp0qJmAyel8Hov7aIavljbaXfhlZ4YaNzhHFVcsnw43Je8iZPzFjcn
	Fg5ll1h8wDq4wuxy8FL5VjL1Lj2S4PE5xL6HO5qnUqTCDp9IND5dgi66hvwj38VE
	D2+r/g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp4m07e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 08:40:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5498ehHf018168
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 May 2025 08:40:43 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 9 May 2025 01:40:39 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 9 May 2025 14:09:08 +0530
Subject: [PATCH v5 22/26] media: iris: Add HEVC and VP9 formats for decoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250509-video-iris-hevc-vp9-v5-22-59b4ff7d331c@quicinc.com>
References: <20250509-video-iris-hevc-vp9-v5-0-59b4ff7d331c@quicinc.com>
In-Reply-To: <20250509-video-iris-hevc-vp9-v5-0-59b4ff7d331c@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt
	<stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Nicolas Dufresne
	<nicolas.dufresne@collabora.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746779937; l=10985;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=mPaTXXar1GcvTJwA1jQG1jTpDY6XN7IaUlTIKYONY/U=;
 b=ciYhVvTMXkRnWvVHFsBsgpTqi96QFbp2EiwGBMrq7Lobp0WG1eSxr1harYoXf1AsI8XCK7Oft
 ey+snpVfYKfCEmKmjj6w8M+W8pb3ds9uY7Nm3CUq6g2s1QUTom9qSGn
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: GVoBqQPy7_2wAlSUOylxg2J-1Ip7WY8K
X-Authority-Analysis: v=2.4 cv=E5XNpbdl c=1 sm=1 tr=0 ts=681dbf8c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=q7txp5L90lOmEJWSHg8A:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA4MyBTYWx0ZWRfXxgJ7B4IJxQB2
 fj6ByN/9XH8zbS7NzKnwhkPbl9hMH5kAld+bpvCaK/xQWiQ77DZ7jll+PeYt1y7bPu0hVGotjS/
 aDCb9xB1x73X2rdtDUGdbOf/4iapD/Xo8DPxHOfdD+TPlS91w7RAffgfmPdysltH/EHSICDW6d2
 kvxfPj8kV+tdojk4lbNqfvsMAEtzDhGQJTXmGpI/yyZrpvpmANJ3D7kcUtiwC8XJxREe5ScdLFo
 qC2/Q5i/VPFab6P5+Ge5spU22sEqo2UScxRVd4eHf1uEKCmEyky+C95JS+6mKtMBlPkR+jgIRTi
 0s/Nkhoy8bZ1xVQVRb05fH+AZfTEEjVOzBqFQZxl9efGEATBYmPxNIZrUYU2esA9MgKN7BbVCUN
 qJsFbWaNS2N6mnOWFsr++E+4qWZnFq/Mp1tru85dMjUhYyt1/v+aA1/mH9yj697BR3c8fWOf
X-Proofpoint-ORIG-GUID: GVoBqQPy7_2wAlSUOylxg2J-1Ip7WY8K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_03,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090083

Extend the decoder driver's supported formats to include HEVC (H.265)
and VP9. This change updates the format enumeration (VIDIOC_ENUM_FMT)
and allows setting these formats via VIDIOC_S_FMT.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 .../platform/qcom/iris/iris_hfi_gen1_command.c     | 15 ++++-
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  2 +
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 14 ++++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  3 +
 drivers/media/platform/qcom/iris/iris_instance.h   |  2 +
 drivers/media/platform/qcom/iris/iris_vdec.c       | 69 ++++++++++++++++++++--
 drivers/media/platform/qcom/iris/iris_vdec.h       | 11 ++++
 drivers/media/platform/qcom/iris/iris_vidc.c       |  3 -
 8 files changed, 108 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index bd9d86220e611e2eb39c9e114bceceac757f4d7b..dbb1b1dab09701ec614088d495f43640ecdb9f99 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -88,16 +88,29 @@ static int iris_hfi_gen1_sys_pc_prep(struct iris_core *core)
 static int iris_hfi_gen1_session_open(struct iris_inst *inst)
 {
 	struct hfi_session_open_pkt packet;
+	u32 codec = 0;
 	int ret;
 
 	if (inst->state != IRIS_INST_DEINIT)
 		return -EALREADY;
 
+	switch (inst->codec) {
+	case V4L2_PIX_FMT_H264:
+		codec = HFI_VIDEO_CODEC_H264;
+		break;
+	case V4L2_PIX_FMT_HEVC:
+		codec = HFI_VIDEO_CODEC_HEVC;
+		break;
+	case V4L2_PIX_FMT_VP9:
+		codec = HFI_VIDEO_CODEC_VP9;
+		break;
+	}
+
 	packet.shdr.hdr.size = sizeof(struct hfi_session_open_pkt);
 	packet.shdr.hdr.pkt_type = HFI_CMD_SYS_SESSION_INIT;
 	packet.shdr.session_id = inst->session_id;
 	packet.session_domain = HFI_SESSION_TYPE_DEC;
-	packet.session_codec = HFI_VIDEO_CODEC_H264;
+	packet.session_codec = codec;
 
 	reinit_completion(&inst->completion);
 
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index adffcead58ea770f992d991dd6bb3c3c7cb843b7..d4d119ca98b0cb313db351f3794bf278216bd539 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -13,6 +13,8 @@
 #define HFI_SESSION_TYPE_DEC				2
 
 #define HFI_VIDEO_CODEC_H264				0x00000002
+#define HFI_VIDEO_CODEC_HEVC				0x00002000
+#define HFI_VIDEO_CODEC_VP9				0x00004000
 
 #define HFI_ERR_NONE					0x0
 
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 802fa62c26ebef619c5b5c3e5f50637a6e9693a2..f23be2340658605a6266ac168ae7346af503a683 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -416,7 +416,19 @@ static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 p
 static int iris_hfi_gen2_session_set_codec(struct iris_inst *inst)
 {
 	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
-	u32 codec = HFI_CODEC_DECODE_AVC;
+	u32 codec = 0;
+
+	switch (inst->codec) {
+	case V4L2_PIX_FMT_H264:
+		codec = HFI_CODEC_DECODE_AVC;
+		break;
+	case V4L2_PIX_FMT_HEVC:
+		codec = HFI_CODEC_DECODE_HEVC;
+		break;
+	case V4L2_PIX_FMT_VP9:
+		codec = HFI_CODEC_DECODE_VP9;
+		break;
+	}
 
 	iris_hfi_gen2_packet_session_property(inst,
 					      HFI_PROP_CODEC,
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index 666061a612c304698067337f63ac9332c75c5d36..283d2f27e4c8e80554cafed816b0951fa5a9ee76 100644
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
index 5ec6368b2af711fd0b78854ddbf18ae58e3dcdc6..0e1f5799b72d993b25820608969e0011eabdb6bc 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -43,6 +43,7 @@
  * @sequence_out: a sequence counter for output queue
  * @tss: timestamp metadata
  * @metadata_idx: index for metadata buffer
+ * @codec: codec type
  * @last_buffer_dequeued: a flag to indicate that last buffer is sent by driver
  */
 
@@ -75,6 +76,7 @@ struct iris_inst {
 	u32				sequence_out;
 	struct iris_ts_metadata		tss[VIDEO_MAX_FRAME];
 	u32				metadata_idx;
+	u32				codec;
 	bool				last_buffer_dequeued;
 };
 
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index ce97c555192a9a4eed5c6b1287f4dfa201a017d1..d670b51c5839d1fad54d34f373cf71d5f3973a96 100644
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
+	unsigned int size = ARRAY_SIZE(iris_vdec_formats);
+	const struct iris_fmt *fmt = iris_vdec_formats;
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
index b24932dc511a65017b1cadbcb984544475bd0723..cd7aab66dc7c82dc50acef9e654a3d6c1ddb088f 100644
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
index a8144595cc78e8fbe33ad5bfa9688f96f2ef8ea6..c417e8c31f806e03555cd5e2a662a6efe5d58f3e 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -278,9 +278,6 @@ static int iris_enum_fmt(struct file *filp, void *fh, struct v4l2_fmtdesc *f)
 {
 	struct iris_inst *inst = iris_get_inst(filp, NULL);
 
-	if (f->index)
-		return -EINVAL;
-
 	return iris_vdec_enum_fmt(inst, f);
 }
 

-- 
2.34.1


