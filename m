Return-Path: <linux-media+bounces-39770-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D40DB245C8
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 11:44:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC4795A38A9
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 09:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B54EB2FE579;
	Wed, 13 Aug 2025 09:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FSWKVg3c"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3332F3C1D;
	Wed, 13 Aug 2025 09:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755077957; cv=none; b=FSrocMgvvZuRcnelYqzCtadQY2QpfjGl6/X9nZvcAr9eeV1rV31ZYN/lULUuhZz7AHgHS1cBKWXDU/OWpfb3OZX63Mc6wSx5XTXzw+HE3jW1Q1b9oVaw7q3Gr+mTVzh7z7CdByWA+OIKrXd7DgpWiRCHXzJWIZmz4rJ45PsQjKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755077957; c=relaxed/simple;
	bh=woB9qzaIvoFMs0+XpdefYGUAlqjS3TPkwQDYYRZ/Ak4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=DJiILc4JaWXwLdvOXTRS7SUoIXBBEtXuZU5ix3hztyHLggxMu4Pwua/PWKGRPQamlf/esCiX0eFhc37q+V+W5mMQCk3JWs0X7cNhVW/YgOCvOwTShVV2PhOJQ6OoYbiNv3NpGeEEZixgNXIuWX1jqW0Xm7NxaD9gbs/RcOv6+p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FSWKVg3c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D6mSj2030420;
	Wed, 13 Aug 2025 09:39:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	46czPxWLI0xnSJTF3Oo4KZU9LMpR1cqes9qt9mz2jEs=; b=FSWKVg3ciJDRHiEz
	K3vmbQEOjX1y0EihG8+rIwYDWCXftlmMK+TOCBiNkapbIPnKLYlvnXhDKIocrmpj
	aJTW/9LVBq9HmhNfQt0EWXokHrEKtksPsYXiz3Lwni1oewaTMCYMQc9Gtm1cdXhR
	q5P4NSNtmU3z430SYxyN1uBkaZfTPs/wj9RZ7WYavMX+4HWABSZwCawolKBeyOD2
	zcNgbDaj7HbV5kAScKAORpLjpWlzxOw+v1xKRjxMaK8M0bIZVC+nu8ORH7zCLyvU
	C9dTwHN62J5FpyqC8hojLzuYNog448ufeA/Eg8TK2kW7x9qfn9jsxfgKMy9/VusQ
	cxprUQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g9q9tcmm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 09:39:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57D9d8bu028832
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 09:39:08 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 13 Aug 2025 02:39:04 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 13 Aug 2025 15:08:02 +0530
Subject: [PATCH v2 12/24] media: iris: Initialize and deinitialize encoder
 instance structure
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250813-iris-video-encoder-v2-12-c725ff673078@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755077896; l=14291;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=woB9qzaIvoFMs0+XpdefYGUAlqjS3TPkwQDYYRZ/Ak4=;
 b=O6PUkxY1HRFF9VP/O/dDarf2fjT5OWnPz4ZSL85WvdDxd9uOK87+7AS6HrSBwrRWAQEJk1+JH
 TG1sDbXmfsfAw1H/OrT3NHZ68rgA8DEUW5bHDruGUmtmb3ItaP0ktKz
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=CNMqXQrD c=1 sm=1 tr=0 ts=689c5d3c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=IxRwsDHPDr3CWsG-5R0A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 5FHrP07gZBeWLPLlukv7rcIpdOkC7M1_
X-Proofpoint-ORIG-GUID: 5FHrP07gZBeWLPLlukv7rcIpdOkC7M1_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDE2NCBTYWx0ZWRfXwos+DcYmzBJN
 EaFGhIJF4k5oSgwK1DWHG4/aEzEv2qlvua6CrAKPKIEWjzJkTnvUD4QjE/+EuQ1HRxWJAtVaP93
 sFMxMAUW3T+HkkmXp4ZjJazy8fSNEq3ZZNOVB5pkiijYz4cBvYhfSh+X1fsXw61MvJz7GHKxBGA
 Lz5Z1RqD2Q7n8k0PsSR+e+TQlPIyiHlWk4xD494niIHiDTPKmWUuv7nFaVUKGxn6ZTPzh83X8d4
 OkrO9R21B51osAD+8gZikGq3MwYybCkX6208hk2alFdTjpAOOiwbH3pcjuFz/QJXQmu8nHZdS+r
 pB5iuj/1MTIJGZaeIDRUAna5Hwm0itZ3F4S4mKTAc9BvWLYi77qU/FJ/hJlqRIdbpB45FT9apEk
 clctyNFT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120164

Introduce initialization and deinitialization for internal encoder
instance structure with necessary hooks.

Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/Makefile          |  1 +
 drivers/media/platform/qcom/iris/iris_buffer.c     | 59 ++++++++++++++++----
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  7 ++-
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  1 +
 drivers/media/platform/qcom/iris/iris_instance.h   |  7 +++
 drivers/media/platform/qcom/iris/iris_vdec.c       |  2 -
 drivers/media/platform/qcom/iris/iris_venc.c       | 65 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_venc.h       | 14 +++++
 drivers/media/platform/qcom/iris/iris_vidc.c       | 27 ++++++++-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  5 +-
 10 files changed, 170 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index e86d00ee6f15dda8bae2f25f726feb0d427b7684..ec32145e081b1fc3538dfa7d5113162a76a6068c 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -19,6 +19,7 @@ qcom-iris-objs += \
              iris_vidc.o \
              iris_vb2.o \
              iris_vdec.o \
+             iris_venc.o \
              iris_vpu2.o \
              iris_vpu3x.o \
              iris_vpu_buffer.o \
diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index 38548ee4749ea7dd1addf2c9d0677cf5217e3546..6bf9b0b35d206d51b927c824d5a5b327596251c6 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -63,7 +63,12 @@
 static u32 iris_yuv_buffer_size_nv12(struct iris_inst *inst)
 {
 	u32 y_plane, uv_plane, y_stride, uv_stride, y_scanlines, uv_scanlines;
-	struct v4l2_format *f = inst->fmt_dst;
+	struct v4l2_format *f;
+
+	if (inst->domain == DECODER)
+		f = inst->fmt_dst;
+	else
+		f = inst->fmt_src;
 
 	y_stride = ALIGN(f->fmt.pix_mp.width, Y_STRIDE_ALIGN);
 	uv_stride = ALIGN(f->fmt.pix_mp.width, UV_STRIDE_ALIGN);
@@ -194,7 +199,7 @@ static u32 iris_yuv_buffer_size_qc08c(struct iris_inst *inst)
 	return ALIGN(y_meta_plane + y_plane + uv_meta_plane + uv_plane, PIXELS_4K);
 }
 
-static u32 iris_bitstream_buffer_size(struct iris_inst *inst)
+static u32 iris_dec_bitstream_buffer_size(struct iris_inst *inst)
 {
 	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
 	u32 base_res_mbs = NUM_MBS_4K;
@@ -219,18 +224,50 @@ static u32 iris_bitstream_buffer_size(struct iris_inst *inst)
 	return ALIGN(frame_size, PIXELS_4K);
 }
 
+static u32 iris_enc_bitstream_buffer_size(struct iris_inst *inst)
+{
+	u32 aligned_width, aligned_height, bitstream_size, yuv_size;
+	struct v4l2_format *f;
+
+	f = inst->fmt_dst;
+
+	aligned_width = ALIGN(f->fmt.pix_mp.width, 32);
+	aligned_height = ALIGN(f->fmt.pix_mp.height, 32);
+	bitstream_size = aligned_width * aligned_height * 3;
+	yuv_size = (aligned_width * aligned_height * 3) >> 1;
+	if (aligned_width * aligned_height > (4096 * 2176))
+		/* bitstream_size = 0.25 * yuv_size; */
+		bitstream_size = (bitstream_size >> 3);
+	else if (aligned_width * aligned_height > (1280 * 720))
+		/* bitstream_size = 0.5 * yuv_size; */
+		bitstream_size = (bitstream_size >> 2);
+
+	return ALIGN(bitstream_size, 4096);
+}
+
 int iris_get_buffer_size(struct iris_inst *inst,
 			 enum iris_buffer_type buffer_type)
 {
-	switch (buffer_type) {
-	case BUF_INPUT:
-		return iris_bitstream_buffer_size(inst);
-	case BUF_OUTPUT:
-		return iris_yuv_buffer_size_nv12(inst);
-	case BUF_DPB:
-		return iris_yuv_buffer_size_qc08c(inst);
-	default:
-		return 0;
+	if (inst->domain == DECODER) {
+		switch (buffer_type) {
+		case BUF_INPUT:
+			return iris_dec_bitstream_buffer_size(inst);
+		case BUF_OUTPUT:
+			return iris_yuv_buffer_size_nv12(inst);
+		case BUF_DPB:
+			return iris_yuv_buffer_size_qc08c(inst);
+		default:
+			return 0;
+		}
+	} else {
+		switch (buffer_type) {
+		case BUF_INPUT:
+			return iris_yuv_buffer_size_nv12(inst);
+		case BUF_OUTPUT:
+			return iris_enc_bitstream_buffer_size(inst);
+		default:
+			return 0;
+		}
 	}
 }
 
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 5097680ee14ebba3a126213c0584161627ca47d7..eae3dc5c596d1eb6090126ac391b8e0e2c9f09eb 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -109,7 +109,12 @@ static int iris_hfi_gen1_session_open(struct iris_inst *inst)
 	packet.shdr.hdr.size = sizeof(struct hfi_session_open_pkt);
 	packet.shdr.hdr.pkt_type = HFI_CMD_SYS_SESSION_INIT;
 	packet.shdr.session_id = inst->session_id;
-	packet.session_domain = HFI_SESSION_TYPE_DEC;
+
+	if (inst->domain == DECODER)
+		packet.session_domain = HFI_SESSION_TYPE_DEC;
+	else
+		packet.session_domain = HFI_SESSION_TYPE_ENC;
+
 	packet.session_codec = codec;
 
 	reinit_completion(&inst->completion);
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index d4d119ca98b0cb313db351f3794bf278216bd539..5b7c641b727a16c3aa7196a6d49786133653279f 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -10,6 +10,7 @@
 
 #define HFI_VIDEO_ARCH_OX				0x1
 
+#define HFI_SESSION_TYPE_ENC				1
 #define HFI_SESSION_TYPE_DEC				2
 
 #define HFI_VIDEO_CODEC_H264				0x00000002
diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index 0e1f5799b72d993b25820608969e0011eabdb6bc..ff90f010f1d36690cbadeff0787b1fb7458d7f75 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -12,6 +12,9 @@
 #include "iris_core.h"
 #include "iris_utils.h"
 
+#define DEFAULT_WIDTH 320
+#define DEFAULT_HEIGHT 240
+
 /**
  * struct iris_inst - holds per video instance parameters
  *
@@ -24,7 +27,9 @@
  * @fmt_src: structure of v4l2_format for source
  * @fmt_dst: structure of v4l2_format for destination
  * @ctrl_handler: reference of v4l2 ctrl handler
+ * @domain: domain type: encoder or decoder
  * @crop: structure of crop info
+ * @compose: structure of compose info
  * @completion: structure of signal completions
  * @flush_completion: structure of signal completions for flush cmd
  * @flush_responses_pending: counter to track number of pending flush responses
@@ -57,7 +62,9 @@ struct iris_inst {
 	struct v4l2_format		*fmt_src;
 	struct v4l2_format		*fmt_dst;
 	struct v4l2_ctrl_handler	ctrl_handler;
+	enum domain_type		domain;
 	struct iris_hfi_rect_desc	crop;
+	struct iris_hfi_rect_desc	compose;
 	struct completion		completion;
 	struct completion		flush_completion;
 	u32				flush_responses_pending;
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index d670b51c5839d1fad54d34f373cf71d5f3973a96..3482ff3f18d2bcd592b7eb7d803bf98e29276ebb 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -13,8 +13,6 @@
 #include "iris_vdec.h"
 #include "iris_vpu_buffer.h"
 
-#define DEFAULT_WIDTH 320
-#define DEFAULT_HEIGHT 240
 #define DEFAULT_CODEC_ALIGNMENT 16
 
 int iris_vdec_inst_init(struct iris_inst *inst)
diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
new file mode 100644
index 0000000000000000000000000000000000000000..e418d347ac111c1bc48304adafa259d697e49fed
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include "iris_buffer.h"
+#include "iris_instance.h"
+#include "iris_venc.h"
+#include "iris_vpu_buffer.h"
+
+int iris_venc_inst_init(struct iris_inst *inst)
+{
+	struct v4l2_format *f;
+
+	inst->fmt_src = kzalloc(sizeof(*inst->fmt_src), GFP_KERNEL);
+	inst->fmt_dst  = kzalloc(sizeof(*inst->fmt_dst), GFP_KERNEL);
+	if (!inst->fmt_src || !inst->fmt_dst)
+		return -ENOMEM;
+
+	f = inst->fmt_dst;
+	f->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+	f->fmt.pix_mp.width = DEFAULT_WIDTH;
+	f->fmt.pix_mp.height = DEFAULT_HEIGHT;
+	f->fmt.pix_mp.pixelformat = V4L2_PIX_FMT_H264;
+	inst->codec = f->fmt.pix_mp.pixelformat;
+	f->fmt.pix_mp.num_planes = 1;
+	f->fmt.pix_mp.plane_fmt[0].bytesperline = 0;
+	f->fmt.pix_mp.plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_OUTPUT);
+	f->fmt.pix_mp.field = V4L2_FIELD_NONE;
+	f->fmt.pix_mp.colorspace = V4L2_COLORSPACE_DEFAULT;
+	f->fmt.pix_mp.xfer_func = V4L2_XFER_FUNC_DEFAULT;
+	f->fmt.pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	f->fmt.pix_mp.quantization = V4L2_QUANTIZATION_DEFAULT;
+	inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
+	inst->buffers[BUF_OUTPUT].size = f->fmt.pix_mp.plane_fmt[0].sizeimage;
+
+	f = inst->fmt_src;
+	f->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
+	f->fmt.pix_mp.pixelformat = V4L2_PIX_FMT_NV12;
+	f->fmt.pix_mp.width = ALIGN(DEFAULT_WIDTH, 128);
+	f->fmt.pix_mp.height = ALIGN(DEFAULT_HEIGHT, 32);
+	f->fmt.pix_mp.num_planes = 1;
+	f->fmt.pix_mp.plane_fmt[0].bytesperline = ALIGN(DEFAULT_WIDTH, 128);
+	f->fmt.pix_mp.plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_INPUT);
+	f->fmt.pix_mp.field = V4L2_FIELD_NONE;
+	f->fmt.pix_mp.colorspace = V4L2_COLORSPACE_DEFAULT;
+	f->fmt.pix_mp.xfer_func = V4L2_XFER_FUNC_DEFAULT;
+	f->fmt.pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	f->fmt.pix_mp.quantization = V4L2_QUANTIZATION_DEFAULT;
+	inst->buffers[BUF_INPUT].min_count = iris_vpu_buf_count(inst, BUF_INPUT);
+	inst->buffers[BUF_INPUT].size = f->fmt.pix_mp.plane_fmt[0].sizeimage;
+
+	inst->crop.left = 0;
+	inst->crop.top = 0;
+	inst->crop.width = f->fmt.pix_mp.width;
+	inst->crop.height = f->fmt.pix_mp.height;
+
+	return 0;
+}
+
+void iris_venc_inst_deinit(struct iris_inst *inst)
+{
+	kfree(inst->fmt_dst);
+	kfree(inst->fmt_src);
+}
diff --git a/drivers/media/platform/qcom/iris/iris_venc.h b/drivers/media/platform/qcom/iris/iris_venc.h
new file mode 100644
index 0000000000000000000000000000000000000000..8a4cbddd0114b6d0e4ea895362b01c302250c78b
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_venc.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _IRIS_VENC_H_
+#define _IRIS_VENC_H_
+
+struct iris_inst;
+
+int iris_venc_inst_init(struct iris_inst *inst);
+void iris_venc_inst_deinit(struct iris_inst *inst);
+
+#endif
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 96313856a026efaff40da97eaaa63e847172cd57..11f27fc867dc610c18022b0942e65aa175a8567e 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -12,6 +12,7 @@
 #include "iris_vidc.h"
 #include "iris_instance.h"
 #include "iris_vdec.h"
+#include "iris_venc.h"
 #include "iris_vb2.h"
 #include "iris_vpu_buffer.h"
 #include "iris_platform_common.h"
@@ -23,7 +24,10 @@
 
 static void iris_v4l2_fh_init(struct iris_inst *inst)
 {
-	v4l2_fh_init(&inst->fh, inst->core->vdev_dec);
+	if (inst->domain == ENCODER)
+		v4l2_fh_init(&inst->fh, inst->core->vdev_enc);
+	else if (inst->domain == DECODER)
+		v4l2_fh_init(&inst->fh, inst->core->vdev_dec);
 	inst->fh.ctrl_handler = &inst->ctrl_handler;
 	v4l2_fh_add(&inst->fh);
 }
@@ -126,9 +130,19 @@ iris_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_
 int iris_open(struct file *filp)
 {
 	struct iris_core *core = video_drvdata(filp);
+	struct video_device *vdev;
 	struct iris_inst *inst;
+	u32 session_type;
 	int ret;
 
+	vdev = video_devdata(filp);
+	if (strcmp(vdev->name, "qcom-iris-decoder") == 0)
+		session_type = DECODER;
+	else if (strcmp(vdev->name, "qcom-iris-encoder") == 0)
+		session_type = ENCODER;
+	else
+		return -EINVAL;
+
 	ret = pm_runtime_resume_and_get(core->dev);
 	if (ret < 0)
 		return ret;
@@ -147,6 +161,7 @@ int iris_open(struct file *filp)
 		return -ENOMEM;
 
 	inst->core = core;
+	inst->domain = session_type;
 	inst->session_id = hash32_ptr(inst);
 	inst->state = IRIS_INST_DEINIT;
 
@@ -178,7 +193,10 @@ int iris_open(struct file *filp)
 		goto fail_m2m_release;
 	}
 
-	ret = iris_vdec_inst_init(inst);
+	if (inst->domain == DECODER)
+		ret = iris_vdec_inst_init(inst);
+	else if (inst->domain == ENCODER)
+		ret = iris_venc_inst_init(inst);
 	if (ret)
 		goto fail_m2m_ctx_release;
 
@@ -265,7 +283,10 @@ int iris_close(struct file *filp)
 	v4l2_m2m_ctx_release(inst->m2m_ctx);
 	v4l2_m2m_release(inst->m2m_dev);
 	mutex_lock(&inst->lock);
-	iris_vdec_inst_deinit(inst);
+	if (inst->domain == DECODER)
+		iris_vdec_inst_deinit(inst);
+	else if (inst->domain == ENCODER)
+		iris_venc_inst_deinit(inst);
 	iris_session_close(inst);
 	iris_inst_change_state(inst, IRIS_INST_DEINIT);
 	iris_v4l2_fh_deinit(inst);
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index f92fd39fe310b9661f892dcf1ff036ebbc102270..06d5afc3c641f0dfca3967e55273c4fa2614fdff 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -628,7 +628,10 @@ int iris_vpu_buf_count(struct iris_inst *inst, enum iris_buffer_type buffer_type
 	case BUF_INPUT:
 		return MIN_BUFFERS;
 	case BUF_OUTPUT:
-		return output_min_count(inst);
+		if (inst->domain == ENCODER)
+			return MIN_BUFFERS;
+		else
+			return output_min_count(inst);
 	case BUF_BIN:
 	case BUF_COMV:
 	case BUF_NON_COMV:

-- 
2.34.1


