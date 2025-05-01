Return-Path: <linux-media+bounces-31531-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04024AA63F8
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 21:19:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7602E7B1FDC
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 19:18:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36FB022D7B5;
	Thu,  1 May 2025 19:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="na32aqu+"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9051422D7B1;
	Thu,  1 May 2025 19:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746126958; cv=none; b=ieMppNNRXPr3zU954sIplYv+SsrjBk+/BGAdHxPoZ/DQKD/Hre4xp4dMZcew2KqhBd15MFrXyCRQYOzRqBu9+V6uz+gtrmS8DImvj/QMiRCZHV7ngvmqVwsBsYQ6jbLhQbYqEX2u8A/aCw/HgrBmFYX2UQmhI4Zb2sbyP7w+FAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746126958; c=relaxed/simple;
	bh=+w3GEJWxKLblh4Hw+LDvRBYL/mzrv5krTxfdGd5FWaI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=KTbH2cUdseacY1HL7mpfr+gf/NxjUg4M8MEzXJiGZFb2DjIY4vsjeWkeOFNr0Tn08zzTWfHgcpvhsNjvkVjsUuQHo+wqC1yrQ1v1En1yLTRbe5mX683ybXyyGPWqw5VbDB+TB6Q6faHhUFdIsExcBD7lla6qYrLykpmS+jO8kjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=na32aqu+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 541D26uc008657;
	Thu, 1 May 2025 19:15:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pOxD+kPJGUabLyrFxkio0Mx6K4vBMPPC5jmWu9SVwZk=; b=na32aqu+V+d9U5VH
	9QRTaikbQIG0D5Zw3P2VZXWF23YQCXqBF+xSfsK1b4YCxUmyWGQBcam5oXiiffl8
	5yiT86f5o8Vt9sfd6YfKD3s5Dt0piuEVj0avrz3Obwx+dQmO+J0v1wxEeYGjgjK4
	Wo/fs66XHDx7K2t8aj1cPzsWojInHWw6wwnuQhP1B1kp3FiMkUNmpWhVcfAqsbC+
	Zfx2YY9S73cwLOho0AutesBA77cNfksMJhI4Y7YAE0nuPpPd9o3MnELPuagg+sf+
	nwEwGSc0qqL8+ZiSS583cSj1acHMstJPl/SlSQo/sE7KumIfdVNxs4c0YRtaAUms
	K1RgqQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6uae3jg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 May 2025 19:15:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 541JFpYA004774
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 1 May 2025 19:15:51 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 1 May 2025 12:15:45 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 2 May 2025 00:43:49 +0530
Subject: [PATCH v3 19/23] media: iris: Add HEVC and VP9 formats for decoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250502-qcom-iris-hevc-vp9-v3-19-552158a10a7d@quicinc.com>
References: <20250502-qcom-iris-hevc-vp9-v3-0-552158a10a7d@quicinc.com>
In-Reply-To: <20250502-qcom-iris-hevc-vp9-v3-0-552158a10a7d@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Nicolas Dufresne
	<nicolas.dufresne@collabora.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        <20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org>,
        <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746126827; l=10253;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=+w3GEJWxKLblh4Hw+LDvRBYL/mzrv5krTxfdGd5FWaI=;
 b=6CSWEtk5qjHRoTYDV3wyuNWCxYaN5wris3zVQ083qX0qWReNbo7W4OapS5PnuY8eLCCccOE4z
 1Diz88qAavSCZHb3Rs5Pp2fisFlEogANJAfgwcNJ90AZTAC1P1cHJeK
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=BNizrEQG c=1 sm=1 tr=0 ts=6813c868 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=mvREzO5EX4wsAlkdLbwA:9
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDE0NyBTYWx0ZWRfXzHKdkCFrrcQv eLKvSx9vckiRH4SLTFN7fVq42E3sSfVa4Jg7rddoJUVliTZ0sMXr3MfCu71FpLQDGjcwkVTZHJ/ LCNnIGy/6GCRiXj2UoLVr8TeAWxVRnURwaLD2qnwDjIZwlunWE5rIjCTmt1gi/Hha8cW4Z1+Ks4
 OXHIuLozf4/1BJ0kR1t6UYLf7B9tj2dszICKPRIh+Ez8SsHrV/I025LqnX/XcYRRRXzLq+XfCht 56NbQ6VEgHYRCDpSODHGJX60a5iD/PVM+G3hhbox66E9TUUO7RNPNu+6z6j0sDA8li8FjhQOBDR GPldojmzD7zfGiX+h1FABFCDDns6t0ezUcok7mLZqE1aWINnWkvcXZe2MStVeMMQr3nHLNKeh1I
 n9/z1D+U7KuPQX4lKt2xHSYahc6G8362St++Nnp+66q0UxVLu8wXpDBDEOXVi1sN1nqDy6Uy
X-Proofpoint-GUID: _OZ8Cb5tiuf932IbebnOSFetkW1DRa02
X-Proofpoint-ORIG-GUID: _OZ8Cb5tiuf932IbebnOSFetkW1DRa02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0
 phishscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505010147

Extend the decoder driver's supported formats to include HEVC (H.265)
and VP9. This change updates the format enumeration (VIDIOC_ENUM_FMT)
and allows setting these formats via VIDIOC_S_FMT.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
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
index bd9d86220e61..dbb1b1dab097 100644
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
index adffcead58ea..d4d119ca98b0 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -13,6 +13,8 @@
 #define HFI_SESSION_TYPE_DEC				2
 
 #define HFI_VIDEO_CODEC_H264				0x00000002
+#define HFI_VIDEO_CODEC_HEVC				0x00002000
+#define HFI_VIDEO_CODEC_VP9				0x00004000
 
 #define HFI_ERR_NONE					0x0
 
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 802fa62c26eb..f23be2340658 100644
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
index 666061a612c3..283d2f27e4c8 100644
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
index 5ec6368b2af7..0e1f5799b72d 100644
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
index ce97c555192a..d670b51c5839 100644
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
index a8144595cc78..c417e8c31f80 100644
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


