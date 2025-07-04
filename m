Return-Path: <linux-media+bounces-36779-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AC2AF8A65
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 09:59:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D4506E47A6
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 07:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0CE12BDC2C;
	Fri,  4 Jul 2025 07:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IjCJwxG8"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE7929E0F7;
	Fri,  4 Jul 2025 07:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615659; cv=none; b=p8vb+V6PMir3wrYAF9pwR8z5y50PCap73PxI/QRonJ1owdQPYZeKgd4cpw2HX3jSOb2e+7dNHMoVJoyw+6vg/U5qkhLOVUEgSuEzHafNM9Gjy4QHqu/eIy95lYOFFL6ZWEC5v0cvpH0gN+U6aWhBYelhGxX9VD6XG1R/aJsNi9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615659; c=relaxed/simple;
	bh=F6+6wmW4gNsELkr2qUtIST5vjjLAl25J2+Zz2prT4So=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=tUwTmherA0RPb7fwY/WxkwgMuwfCQMtBNIDTqK9Kuk8Ij6WvxraWdWUZJzT9/rAg11NYlGVLul6RhTsrIm5A0sALtoWemRuw7jmRnEsM/YJItxntP+06t062jpGpyUlcifXkI35Ga/AQPKB0ZMw/CneV4hmNlcKY+V0ZdT61Moo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IjCJwxG8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564752kF032128;
	Fri, 4 Jul 2025 07:54:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iIlpnQ4FjOeY4aYwJ/ht8nPKjbM8ltv4m/sTu+bqM8Q=; b=IjCJwxG8iwf5rk1f
	/gfpb1AJb+lYVjpemAaaveBzFJmBprV1MW5Pv4M1i3cJv+JlFH0kpq+3oHIt1VUG
	7b+Lhu4I4hIDLSzca/d3qan8atndQeS8zanLZ8QSgvRQf7wFLH5H356iE2GL0LNG
	I2FP90SlUvz6FZdpWrTTb/3ODsacdkRXKywkYW8Tx816lLf2CXGSVX63HLhz8V4D
	6NjcpnkblFb+E+sSCqxBWaF7fWSTKSxnjf4kVCZPEvJvUYQXIyOqv48QpP0z8qV3
	tAqD9JX+BiRQ5c9cVy3FVlIfcsS2jIrtnAfoU9h/aPR6ZSd3f0RuqSZEus9QlWmA
	DEh+3Q==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63kka22-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 07:54:11 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5647sA0F001614
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Jul 2025 07:54:10 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 4 Jul 2025 00:54:07 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 4 Jul 2025 13:23:14 +0530
Subject: [PATCH 14/25] media: iris: Add support for ENUM_FMT, S/G/TRY_FMT
 encoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250704-iris-video-encoder-v1-14-b6ce24e273cf@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751615599; l=15318;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=F6+6wmW4gNsELkr2qUtIST5vjjLAl25J2+Zz2prT4So=;
 b=3H4GITqrhoHDTXyGkcaLZsaRPyC4e7vRGPUfVsX5n5Dxu7bO85WuNz3dem79/Ph9YhQHXGXiO
 vUQ+x0Ie7KvAgYwnx8L6UUOxnrhEf1EXaeyTuONcWINiXON0O7/lZGT
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=686788a3 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=MTZWs62D9r5BD9hYChMA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA2MCBTYWx0ZWRfX3ghGCzQnK6J/
 TwQbxZPxUELoNhMXAkxHGN4innpTqy31h6RxJXWvk2CeS2l61ZD8UmcGTCJm1qdAGt953WnMDEZ
 lNVx5+IWgzIohb+JfjqrsKImAh5HhbRk7l388JmqY6VsGISNk9IRYfhTZmFElmhGjSjOcGjhhyD
 0uS/f6eZSKrOYTlQb+y5X4kLhElI+WaC/hq14m+ve7MMPD4HnWYqJdmNLa4YCo64KW8WLandTMX
 cdfByZSABiSOallc07tp4MhtefPbm/+DMTNS6VXqOKQmHqfG6JvLMumaV1yo/wdcLiwrvqr3+yp
 XAJgjX0jubRlfHE0I5WGVYup1l8/bofMizwvhxYeGrjSS5ES2+YKSHhVMl/yXTAC7MyLadpyJkx
 mUxa+FKGo+iZzwbB/8yBQ2tHDg5Q8yti1tfLjlXIlrgKglhwSvkGKBNJ6is/UOfX7lEUzl6A
X-Proofpoint-ORIG-GUID: 5D9BB87f7p7926qlO-UdzKH23AmWbubN
X-Proofpoint-GUID: 5D9BB87f7p7926qlO-UdzKH23AmWbubN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040060

Add V4L2 format handling support for the encoder by adding
implementation of ENUM/S/G/TRY_FMT with necessary hooks.

This ensures that the encoder supports format negotiation consistent
with V4L2 expectation, enabling userspace applications to configure
resolution, pixel format and buffer layout properly.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_core.h     |   6 +-
 drivers/media/platform/qcom/iris/iris_instance.h |  11 ++
 drivers/media/platform/qcom/iris/iris_probe.c    |   3 +-
 drivers/media/platform/qcom/iris/iris_vdec.h     |  11 --
 drivers/media/platform/qcom/iris/iris_venc.c     | 207 +++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_venc.h     |   3 +
 drivers/media/platform/qcom/iris/iris_vidc.c     |  41 ++++-
 7 files changed, 261 insertions(+), 21 deletions(-)

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
index c3be9deb0a57cc2cf25d69784d54be5e4a5fe06c..0f2596427a773e5c9105b97cb234c8f0a3483226 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -157,19 +157,20 @@ static int iris_register_video_device(struct iris_core *core, enum domain_type t
 
 	vdev->release = video_device_release;
 	vdev->fops = core->iris_v4l2_file_ops;
-	vdev->ioctl_ops = core->iris_v4l2_ioctl_ops;
 	vdev->vfl_dir = VFL_DIR_M2M;
 	vdev->v4l2_dev = &core->v4l2_dev;
 	vdev->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
 
 	if (type == DECODER) {
 		strscpy(vdev->name, "qcom-iris-decoder", sizeof(vdev->name));
+		vdev->ioctl_ops = core->iris_v4l2_ioctl_ops_dec;
 		ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 		if (ret)
 			goto err_vdev_release;
 		core->vdev_dec = vdev;
 	} else if (type == ENCODER) {
 		strscpy(vdev->name, "qcom-iris-encoder", sizeof(vdev->name));
+		vdev->ioctl_ops = core->iris_v4l2_ioctl_ops_enc;
 		ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 		if (ret)
 			goto err_vdev_release;
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
index e418d347ac111c1bc48304adafa259d697e49fed..6bb59ce4fc565d3dcc6185233ef25d2e4d85cb3e 100644
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
@@ -63,3 +65,208 @@ void iris_venc_inst_deinit(struct iris_inst *inst)
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
index 11f27fc867dc610c18022b0942e65aa175a8567e..06b2737c5892ebbcf43b4cff66062d85cf805c20 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -308,16 +308,26 @@ static int iris_enum_fmt(struct file *filp, void *fh, struct v4l2_fmtdesc *f)
 {
 	struct iris_inst *inst = iris_get_inst(filp, NULL);
 
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
 	struct iris_inst *inst = iris_get_inst(filp, NULL);
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
@@ -326,10 +336,15 @@ static int iris_try_fmt_vid_mplane(struct file *filp, void *fh, struct v4l2_form
 static int iris_s_fmt_vid_mplane(struct file *filp, void *fh, struct v4l2_format *f)
 {
 	struct iris_inst *inst = iris_get_inst(filp, NULL);
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
@@ -473,7 +488,7 @@ static const struct vb2_ops iris_vb2_ops = {
 	.buf_queue                      = iris_vb2_buf_queue,
 };
 
-static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops = {
+static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops_dec = {
 	.vidioc_enum_fmt_vid_cap        = iris_enum_fmt,
 	.vidioc_enum_fmt_vid_out        = iris_enum_fmt,
 	.vidioc_try_fmt_vid_cap_mplane  = iris_try_fmt_vid_mplane,
@@ -501,9 +516,21 @@ static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops = {
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


