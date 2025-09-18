Return-Path: <linux-media+bounces-40368-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE81B2D7BE
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 11:15:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 59CC67BA94A
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 09:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DFDF2DE702;
	Wed, 20 Aug 2025 09:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VwMSxhLA"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CD92D8DB9;
	Wed, 20 Aug 2025 09:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755680938; cv=none; b=H20rVyz4r9RTcCiGs2k177VB1ViTk7OKAmFf50Ohyz7QqIJqo672nF66CCWO1Q+KfyKEJ+xno78C333o+9qesQAYbo7bJnaKmB/aVDUiqmuI77F8lJRg7V405sBrZYI0gUb6cHu+WB4t98DZO7p/OjoU6CG/JD0eDhd/7+Uw8gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755680938; c=relaxed/simple;
	bh=7WScUCCmB9CCY9siOSRyrb7DXeZbVOFWaFmSKzi015w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=jxZb+r2U+7U2SAfuwTGVxLOZttiakRPW54Q10FkTu1XsZ5kA3en8tfa4J9ndWaqDQHbkTe7RAfwcXjDw+FwC0uDltnNyWQwTBFK0Wyj7fZE7nwGnP2gb3Bo7AZxbd80PPd2P6qWtrp/nyLNRempT6ZCL8bTdPB1Q3J9uM19ou8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VwMSxhLA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1oxMx005872;
	Wed, 20 Aug 2025 09:08:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gKMIHmy1E4znslLhlwwBsl4qqyJ1waWE3XIx5fIbaf0=; b=VwMSxhLAU+LjTgEu
	z4FvKXhhWKtku7CwaBN2FsXpedWfuQ/cDBf+Kc0Pngj+jWQieBFBT3G7v2rexEIg
	wX1K9/gHmC9Td5JuiCr6evtKeVd7H5UjrvkPVQyW7qoCQMsXrwbZqFl0sh4oXVo/
	HLt+jEeLepILHEfS0adJtavd3dR745gzAGKwHmShNCHVo1aJ4cs4zwqyQS5uBA4r
	+ZLZ56LSkLo1LYwV//iR1JrCU9X27G4+czFfr/WeGevblrdr3P8Jh7pxCAQbmZsw
	qcfk7L/RUfA8wVrpAHYldRM1PUPT8Wjj3C/oCiaxK60/RtccuBMiqm7wqejj6Ro3
	GtqgNQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52ch3qv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 09:08:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57K98okS005299
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 09:08:50 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 20 Aug 2025 02:08:46 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 20 Aug 2025 14:37:53 +0530
Subject: [PATCH v3 15/26] media: iris: Add support for ENUM_FMT,
 S/G/TRY_FMT encoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250820-iris-video-encoder-v3-15-80ab0ba58b3d@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755680867; l=15716;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=7WScUCCmB9CCY9siOSRyrb7DXeZbVOFWaFmSKzi015w=;
 b=yGi35cW0GD5CT+RuownDJpXPPywYWXevdAe8ye19O3X95n2DbKGcRxG8sALkCrSw1TG0gpQBd
 VgkGL1KJkNkAxsvW+EUnpKZhxz9Y++EHvAqC90hCCv374xXoUFjhSDl
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: LkBgbT0ngwxOkragY4nRqxhOZN2jvoTj
X-Proofpoint-ORIG-GUID: LkBgbT0ngwxOkragY4nRqxhOZN2jvoTj
X-Authority-Analysis: v=2.4 cv=Xpij+VF9 c=1 sm=1 tr=0 ts=68a590a3 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=Le57Ke0m5vrr5mqLr9EA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX04vKTTkcLr1X
 snd03NbmqsZJLaR2c0IqGrKutfoFUSX3M2DtMU0JhKUCDs8VjjAhZzvEeRr2mysZfmqBh3qwYMh
 v0ajtB1XrfcSj7R4cQK02G4M1YdtKMwF8UdD8exug+sIVwXI33FAfq6QJGwfIwjjbuuxs70y3Zp
 IH/fhIRNV8+f7Ww59BcIzNKrRELvkCNdBvMtFCzBplmIX1SgTDGRQYWEh3iLYr/OhztILvhOdTG
 pS1bB4meu6gz4C0xpsWSYJ09gf7sv0l68kHr7jOsU3rAOzY5DOaZUW8NH86B3+tCQjupuGjPDew
 0pZn43qWk9eQe1Ok7+Do8/ZW0elQjpfm950AcZhH8qzH5F4gFi1Vg5FWbv067K30K2ZaevcBRnx
 gW5gNWf2+Bz4M+y0Ptoy3Yn5s85qJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

Add V4L2 format handling support for the encoder by adding
implementation of ENUM/S/G/TRY_FMT with necessary hooks.

This ensures that the encoder supports format negotiation consistent
with V4L2 expectation, enabling userspace applications to configure
resolution, pixel format and buffer layout properly.

Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_core.h     |   6 +-
 drivers/media/platform/qcom/iris/iris_instance.h |  11 ++
 drivers/media/platform/qcom/iris/iris_probe.c    |   3 +-
 drivers/media/platform/qcom/iris/iris_vdec.h     |  11 --
 drivers/media/platform/qcom/iris/iris_venc.c     | 212 ++++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_venc.h     |   3 +
 drivers/media/platform/qcom/iris/iris_vidc.c     |  41 ++++-
 7 files changed, 265 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index 09e83be4e00efb456b7098a499b6cce850134a06..827aee8dcec3ee17af5a90f5594b9315f663c0b3 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -40,7 +40,8 @@ enum domain_type {
  * @vdev_dec: iris video device structure for decoder
  * @vdev_enc: iris video device structure for encoder
  * @iris_v4l2_file_ops: iris v4l2 file ops
- * @iris_v4l2_ioctl_ops: iris v4l2 ioctl ops
+ * @iris_v4l2_ioctl_ops_dec: iris v4l2 ioctl ops for decoder
+ * @iris_v4l2_ioctl_ops_enc: iris v4l2 ioctl ops for encoder
  * @iris_vb2_ops: iris vb2 ops
  * @icc_tbl: table of iris interconnects
  * @icc_count: count of iris interconnects
@@ -81,7 +82,8 @@ struct iris_core {
 	struct video_device			*vdev_dec;
 	struct video_device			*vdev_enc;
 	const struct v4l2_file_operations	*iris_v4l2_file_ops;
-	const struct v4l2_ioctl_ops		*iris_v4l2_ioctl_ops;
+	const struct v4l2_ioctl_ops		*iris_v4l2_ioctl_ops_dec;
+	const struct v4l2_ioctl_ops		*iris_v4l2_ioctl_ops_enc;
 	const struct vb2_ops			*iris_vb2_ops;
 	struct icc_bulk_data			*icc_tbl;
 	u32					icc_count;
diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index ff90f010f1d36690cbadeff0787b1fb7458d7f75..55cf9702111829ef24189986ba5245c7684bfe11 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -15,6 +15,17 @@
 #define DEFAULT_WIDTH 320
 #define DEFAULT_HEIGHT 240
 
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
 /**
  * struct iris_inst - holds per video instance parameters
  *
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 324ffc5035bc0ecfd9d7491ee07fd9333917455b..85b34a649c70597bcbc4747de553ccd09c09923a 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -157,16 +157,17 @@ static int iris_register_video_device(struct iris_core *core, enum domain_type t
 
 	vdev->release = video_device_release;
 	vdev->fops = core->iris_v4l2_file_ops;
-	vdev->ioctl_ops = core->iris_v4l2_ioctl_ops;
 	vdev->vfl_dir = VFL_DIR_M2M;
 	vdev->v4l2_dev = &core->v4l2_dev;
 	vdev->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
 
 	if (type == DECODER) {
 		strscpy(vdev->name, "qcom-iris-decoder", sizeof(vdev->name));
+		vdev->ioctl_ops = core->iris_v4l2_ioctl_ops_dec;
 		core->vdev_dec = vdev;
 	} else if (type == ENCODER) {
 		strscpy(vdev->name, "qcom-iris-encoder", sizeof(vdev->name));
+		vdev->ioctl_ops = core->iris_v4l2_ioctl_ops_enc;
 		core->vdev_enc = vdev;
 	} else {
 		ret = -EINVAL;
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.h b/drivers/media/platform/qcom/iris/iris_vdec.h
index cd7aab66dc7c82dc50acef9e654a3d6c1ddb088f..b24932dc511a65017b1cadbcb984544475bd0723 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.h
+++ b/drivers/media/platform/qcom/iris/iris_vdec.h
@@ -8,17 +8,6 @@
 
 struct iris_inst;
 
-enum iris_fmt_type {
-	IRIS_FMT_H264,
-	IRIS_FMT_HEVC,
-	IRIS_FMT_VP9,
-};
-
-struct iris_fmt {
-	u32 pixfmt;
-	u32 type;
-};
-
 int iris_vdec_inst_init(struct iris_inst *inst);
 void iris_vdec_inst_deinit(struct iris_inst *inst);
 int iris_vdec_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f);
diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index e418d347ac111c1bc48304adafa259d697e49fed..40f7990cd162ad400711d729917b7e2577d562b2 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -3,6 +3,8 @@
  * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <media/v4l2-mem2mem.h>
+
 #include "iris_buffer.h"
 #include "iris_instance.h"
 #include "iris_venc.h"
@@ -14,8 +16,11 @@ int iris_venc_inst_init(struct iris_inst *inst)
 
 	inst->fmt_src = kzalloc(sizeof(*inst->fmt_src), GFP_KERNEL);
 	inst->fmt_dst  = kzalloc(sizeof(*inst->fmt_dst), GFP_KERNEL);
-	if (!inst->fmt_src || !inst->fmt_dst)
+	if (!inst->fmt_src || !inst->fmt_dst) {
+		kfree(inst->fmt_src);
+		kfree(inst->fmt_dst);
 		return -ENOMEM;
+	}
 
 	f = inst->fmt_dst;
 	f->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
@@ -63,3 +68,208 @@ void iris_venc_inst_deinit(struct iris_inst *inst)
 	kfree(inst->fmt_dst);
 	kfree(inst->fmt_src);
 }
+
+static const struct iris_fmt iris_venc_formats[] = {
+	[IRIS_FMT_H264] = {
+		.pixfmt = V4L2_PIX_FMT_H264,
+		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+	},
+	[IRIS_FMT_HEVC] = {
+		.pixfmt = V4L2_PIX_FMT_HEVC,
+		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+	},
+};
+
+static const struct iris_fmt *
+find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
+{
+	const struct iris_fmt *fmt = iris_venc_formats;
+	unsigned int size = ARRAY_SIZE(iris_venc_formats);
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
+	const struct iris_fmt *fmt = iris_venc_formats;
+	unsigned int size = ARRAY_SIZE(iris_venc_formats);
+
+	if (index >= size || fmt[index].type != type)
+		return NULL;
+
+	return &fmt[index];
+}
+
+int iris_venc_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f)
+{
+	const struct iris_fmt *fmt;
+
+	switch (f->type) {
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
+		if (f->index)
+			return -EINVAL;
+		f->pixelformat = V4L2_PIX_FMT_NV12;
+		break;
+	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
+		fmt = find_format_by_index(inst, f->index, f->type);
+		if (!fmt)
+			return -EINVAL;
+
+		f->pixelformat = fmt->pixfmt;
+		f->flags = V4L2_FMT_FLAG_COMPRESSED | V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+int iris_venc_try_fmt(struct iris_inst *inst, struct v4l2_format *f)
+{
+	struct v4l2_pix_format_mplane *pixmp = &f->fmt.pix_mp;
+	const struct iris_fmt *fmt;
+	struct v4l2_format *f_inst;
+
+	memset(pixmp->reserved, 0, sizeof(pixmp->reserved));
+	fmt = find_format(inst, pixmp->pixelformat, f->type);
+	switch (f->type) {
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
+		if (f->fmt.pix_mp.pixelformat != V4L2_PIX_FMT_NV12) {
+			f_inst = inst->fmt_src;
+			f->fmt.pix_mp.width = f_inst->fmt.pix_mp.width;
+			f->fmt.pix_mp.height = f_inst->fmt.pix_mp.height;
+			f->fmt.pix_mp.pixelformat = f_inst->fmt.pix_mp.pixelformat;
+		}
+		break;
+	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
+		if (!fmt) {
+			f_inst = inst->fmt_dst;
+			f->fmt.pix_mp.width = f_inst->fmt.pix_mp.width;
+			f->fmt.pix_mp.height = f_inst->fmt.pix_mp.height;
+			f->fmt.pix_mp.pixelformat = f_inst->fmt.pix_mp.pixelformat;
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
+static int iris_venc_s_fmt_output(struct iris_inst *inst, struct v4l2_format *f)
+{
+	struct v4l2_format *fmt;
+
+	iris_venc_try_fmt(inst, f);
+
+	if (!(find_format(inst, f->fmt.pix_mp.pixelformat, f->type)))
+		return -EINVAL;
+
+	fmt = inst->fmt_dst;
+	fmt->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+	fmt->fmt.pix_mp.num_planes = 1;
+	fmt->fmt.pix_mp.plane_fmt[0].bytesperline = 0;
+	fmt->fmt.pix_mp.plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_OUTPUT);
+
+	if (f->fmt.pix_mp.colorspace != V4L2_COLORSPACE_DEFAULT &&
+	    f->fmt.pix_mp.colorspace != V4L2_COLORSPACE_REC709)
+		f->fmt.pix_mp.colorspace = V4L2_COLORSPACE_DEFAULT;
+	fmt->fmt.pix_mp.colorspace = f->fmt.pix_mp.colorspace;
+	fmt->fmt.pix_mp.xfer_func = f->fmt.pix_mp.xfer_func;
+	fmt->fmt.pix_mp.ycbcr_enc = f->fmt.pix_mp.ycbcr_enc;
+	fmt->fmt.pix_mp.quantization = f->fmt.pix_mp.quantization;
+
+	inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
+	inst->buffers[BUF_OUTPUT].size = fmt->fmt.pix_mp.plane_fmt[0].sizeimage;
+	fmt->fmt.pix_mp.pixelformat = f->fmt.pix_mp.pixelformat;
+	inst->codec = f->fmt.pix_mp.pixelformat;
+	memcpy(f, fmt, sizeof(struct v4l2_format));
+
+	return 0;
+}
+
+static int iris_venc_s_fmt_input(struct iris_inst *inst, struct v4l2_format *f)
+{
+	struct v4l2_format *fmt, *output_fmt;
+
+	iris_venc_try_fmt(inst, f);
+
+	if (f->fmt.pix_mp.pixelformat != V4L2_PIX_FMT_NV12)
+		return -EINVAL;
+
+	fmt = inst->fmt_src;
+	fmt->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
+	fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, 128);
+	fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 32);
+	fmt->fmt.pix_mp.num_planes = 1;
+	fmt->fmt.pix_mp.pixelformat = f->fmt.pix_mp.pixelformat;
+	fmt->fmt.pix_mp.plane_fmt[0].bytesperline = ALIGN(f->fmt.pix_mp.width, 128);
+	fmt->fmt.pix_mp.plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_INPUT);
+
+	fmt->fmt.pix_mp.colorspace = f->fmt.pix_mp.colorspace;
+	fmt->fmt.pix_mp.xfer_func = f->fmt.pix_mp.xfer_func;
+	fmt->fmt.pix_mp.ycbcr_enc = f->fmt.pix_mp.ycbcr_enc;
+	fmt->fmt.pix_mp.quantization = f->fmt.pix_mp.quantization;
+
+	output_fmt = inst->fmt_dst;
+	output_fmt->fmt.pix_mp.width = fmt->fmt.pix_mp.width;
+	output_fmt->fmt.pix_mp.height = fmt->fmt.pix_mp.height;
+	output_fmt->fmt.pix_mp.colorspace = fmt->fmt.pix_mp.colorspace;
+	output_fmt->fmt.pix_mp.xfer_func = fmt->fmt.pix_mp.xfer_func;
+	output_fmt->fmt.pix_mp.ycbcr_enc = fmt->fmt.pix_mp.ycbcr_enc;
+	output_fmt->fmt.pix_mp.quantization = fmt->fmt.pix_mp.quantization;
+
+	inst->buffers[BUF_INPUT].min_count = iris_vpu_buf_count(inst, BUF_INPUT);
+	inst->buffers[BUF_INPUT].size = fmt->fmt.pix_mp.plane_fmt[0].sizeimage;
+
+	if (f->fmt.pix_mp.width != inst->crop.width ||
+	    f->fmt.pix_mp.height != inst->crop.height) {
+		inst->crop.top = 0;
+		inst->crop.left = 0;
+		inst->crop.width = fmt->fmt.pix_mp.width;
+		inst->crop.height = fmt->fmt.pix_mp.height;
+
+		iris_venc_s_fmt_output(inst, output_fmt);
+	}
+
+	memcpy(f, fmt, sizeof(struct v4l2_format));
+
+	return 0;
+}
+
+int iris_venc_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
+{
+	struct vb2_queue *q;
+
+	q = v4l2_m2m_get_vq(inst->m2m_ctx, f->type);
+	if (!q)
+		return -EINVAL;
+
+	if (vb2_is_busy(q))
+		return -EBUSY;
+
+	switch (f->type) {
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
+		return iris_venc_s_fmt_input(inst, f);
+	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
+		return iris_venc_s_fmt_output(inst, f);
+	default:
+		return -EINVAL;
+	}
+}
diff --git a/drivers/media/platform/qcom/iris/iris_venc.h b/drivers/media/platform/qcom/iris/iris_venc.h
index 8a4cbddd0114b6d0e4ea895362b01c302250c78b..eb26a3ecbd98b3f02dfdea0dfc41bcd3a90904b6 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.h
+++ b/drivers/media/platform/qcom/iris/iris_venc.h
@@ -10,5 +10,8 @@ struct iris_inst;
 
 int iris_venc_inst_init(struct iris_inst *inst);
 void iris_venc_inst_deinit(struct iris_inst *inst);
+int iris_venc_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f);
+int iris_venc_try_fmt(struct iris_inst *inst, struct v4l2_format *f);
+int iris_venc_s_fmt(struct iris_inst *inst, struct v4l2_format *f);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index cecc41a137271762d7622ab2637c4cce2c74a506..7adb82186cac540919463fd6d6be85b42eeb73db 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -306,16 +306,26 @@ static int iris_enum_fmt(struct file *filp, void *fh, struct v4l2_fmtdesc *f)
 {
 	struct iris_inst *inst = iris_get_inst(filp);
 
-	return iris_vdec_enum_fmt(inst, f);
+	if (inst->domain == DECODER)
+		return iris_vdec_enum_fmt(inst, f);
+	else if (inst->domain == ENCODER)
+		return iris_venc_enum_fmt(inst, f);
+	else
+		return -EINVAL;
 }
 
 static int iris_try_fmt_vid_mplane(struct file *filp, void *fh, struct v4l2_format *f)
 {
 	struct iris_inst *inst = iris_get_inst(filp);
-	int ret;
+	int ret = 0;
 
 	mutex_lock(&inst->lock);
-	ret = iris_vdec_try_fmt(inst, f);
+
+	if (inst->domain == DECODER)
+		ret = iris_vdec_try_fmt(inst, f);
+	else if (inst->domain == ENCODER)
+		ret = iris_venc_try_fmt(inst, f);
+
 	mutex_unlock(&inst->lock);
 
 	return ret;
@@ -324,10 +334,15 @@ static int iris_try_fmt_vid_mplane(struct file *filp, void *fh, struct v4l2_form
 static int iris_s_fmt_vid_mplane(struct file *filp, void *fh, struct v4l2_format *f)
 {
 	struct iris_inst *inst = iris_get_inst(filp);
-	int ret;
+	int ret = 0;
 
 	mutex_lock(&inst->lock);
-	ret = iris_vdec_s_fmt(inst, f);
+
+	if (inst->domain == DECODER)
+		ret = iris_vdec_s_fmt(inst, f);
+	else if (inst->domain == ENCODER)
+		ret = iris_venc_s_fmt(inst, f);
+
 	mutex_unlock(&inst->lock);
 
 	return ret;
@@ -471,7 +486,7 @@ static const struct vb2_ops iris_vb2_ops = {
 	.buf_queue                      = iris_vb2_buf_queue,
 };
 
-static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops = {
+static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops_dec = {
 	.vidioc_enum_fmt_vid_cap        = iris_enum_fmt,
 	.vidioc_enum_fmt_vid_out        = iris_enum_fmt,
 	.vidioc_try_fmt_vid_cap_mplane  = iris_try_fmt_vid_mplane,
@@ -499,9 +514,21 @@ static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops = {
 	.vidioc_decoder_cmd             = iris_dec_cmd,
 };
 
+static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops_enc = {
+	.vidioc_enum_fmt_vid_cap        = iris_enum_fmt,
+	.vidioc_enum_fmt_vid_out        = iris_enum_fmt,
+	.vidioc_try_fmt_vid_cap_mplane  = iris_try_fmt_vid_mplane,
+	.vidioc_try_fmt_vid_out_mplane  = iris_try_fmt_vid_mplane,
+	.vidioc_s_fmt_vid_cap_mplane    = iris_s_fmt_vid_mplane,
+	.vidioc_s_fmt_vid_out_mplane    = iris_s_fmt_vid_mplane,
+	.vidioc_g_fmt_vid_cap_mplane    = iris_g_fmt_vid_mplane,
+	.vidioc_g_fmt_vid_out_mplane    = iris_g_fmt_vid_mplane,
+};
+
 void iris_init_ops(struct iris_core *core)
 {
 	core->iris_v4l2_file_ops = &iris_v4l2_file_ops;
 	core->iris_vb2_ops = &iris_vb2_ops;
-	core->iris_v4l2_ioctl_ops = &iris_v4l2_ioctl_ops;
+	core->iris_v4l2_ioctl_ops_dec = &iris_v4l2_ioctl_ops_dec;
+	core->iris_v4l2_ioctl_ops_enc = &iris_v4l2_ioctl_ops_enc;
 }

-- 
2.34.1


