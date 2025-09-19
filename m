Return-Path: <linux-media+bounces-42807-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9A5B8A635
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 17:48:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F01817B7CC3
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 15:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8358E31E8AB;
	Fri, 19 Sep 2025 15:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BCoq3Z4h"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5602631E89E
	for <linux-media@vger.kernel.org>; Fri, 19 Sep 2025 15:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758296852; cv=none; b=mq6dGsebkTBZfz66W9Vxll6Zjx5AI97fM0OcjVTuieK0aqCNSg4ly3IxEha/4gNNfXgp84sqpA63bvXvsvFiKFmNV+GseE2QRyeTa3Mk8g6THFQ6hwSnHuXF6lv8DdEkMbvZK4nIbDTr7NagZoOtbkL261xNwSAUzeqN+q7ayq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758296852; c=relaxed/simple;
	bh=Dn7j9lnDJj7KNzypQILQKqp9DEY+kjRS+/3ssNOzKhE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZfHiD85hdisy/4HBwpJA4nEEX5zBCGXiQFm6LzgoU2VoarWShbv0ce+/wc6lmgY7vIau97xfxYaxcot6IP8CXk1caHSaRRwKx2ACMVwM6nWLSKoXRX28XyWtM/36Lp8PxmFg2GIFbXOSxxYKAMC5zXCgSFncmQx5i+6FOahwJDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BCoq3Z4h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JE6G22018237
	for <linux-media@vger.kernel.org>; Fri, 19 Sep 2025 15:47:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3ecqilbI3lofq8Y7qAqt2PleVeF/bxdv24r6HUaOnpw=; b=BCoq3Z4hTqKaZnTD
	La/71svCBSZGV5lGeYDaCk6ar2o3ZqlmdqUgtN2Y1UVrkbUW/yNwpoYb+wkjRh4P
	17sJPPVSBJxK1KlX2M99t7/UDmAOumIydSrK0BT6UsCdZAySiIXGcNmjB1GfqSfu
	XOKGunR56BYsOLgppz2VDnWRvgcNIrLbpoMxPz98Ag1+tuZqLsEuXaQK6sleZq3H
	DeO/4Y/UO8XJYQBeyUB91ij5AtmJ42sel8nMd/i2n3FDQoGGRUtatMk+2eUEbwBU
	2uUw0FmU8iUsypt2YDwAMrkeN+t7Mh1ttl7vmPp/QzUBEihubo3w4PTDgeHSG2ba
	Cc+fQg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxwjx26-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 19 Sep 2025 15:47:29 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-77ec1f25fedso938953b3a.0
        for <linux-media@vger.kernel.org>; Fri, 19 Sep 2025 08:47:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758296848; x=1758901648;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ecqilbI3lofq8Y7qAqt2PleVeF/bxdv24r6HUaOnpw=;
        b=cvCtsgCui72xlxFwqMrOt0a8+Q4ti2yMm2qU53sRxDol6pQuXBQE2bGEol24LA1uol
         O9Ne5OBihM4XKfmb9AiK+3xJgRYG1+ZuEhZGUcS3pk+goRKyU7D4WPy4wJ1L0FJ5crGR
         R+ymBoXbPWMzAmuio8waGH0vRinDrDJJj2emqCBJHIvIKAVkQt9nGI1meZoiFNU0F5y/
         ApBym7lPCSBpEOEVtyiqFGHaTnJf2boWTsfivk4QpnJfBRU4ns4C7qG4xUDaTom1aGB+
         Ng0uavE2MHluZtPd/Wy5ojm7IE7YNLTelYw1f/1vrlL/gDiIrAcjDDpzRN72GGWXDqW2
         5sMg==
X-Gm-Message-State: AOJu0Yzo1Ucdah1ILnghqEd3T4twSu2LHqntmumV681b9OmfAeMs6c0p
	SWzaoFwL6m2NxmDgBiMXfoseW6smtJqscvb6WT/fLh5aAN8klRYpUiHtELZucgXRl5GiKpnmr/m
	qTQS8i4Ev36VFlgWXia5iHyRHEveT57iK9pPTsRV56aZ+pTzT6lUOpjKalUQfB+9O3w==
X-Gm-Gg: ASbGnct1e0TOqwzoV6xoqC/Z+4XbcgLNCHHU/8g+L6jZod59hmv4hD7bETUM44hx03R
	3FNm+XaAJq4XAA+yKZhLCRA0bchWxdD7bIAi78MLoNZKF8meIROLoo84rrqsG3I5V2xU8c0iclG
	ssQXXJPVeR99YZbCWMjOFc2K0c+xPBhBBxL2ZUYxogp/hsebq46aSOSL1aNh8AOk0U+gxvCPw0p
	b2zrfC1pDovMUkZer8WkM8LPHlZjsWXibXaACHeqCYgJcTvqEuSY4BCOy8gKLlBGSEKUYMHsvyU
	m4gbyXcrbW9VhAd4iziytnNEXuPXTc63DTrmJhKG3iA84s2z5M193pn5WEjhSAta9wvw3Wprrc5
	rXw==
X-Received: by 2002:a05:6a00:1d18:b0:77f:11bd:749a with SMTP id d2e1a72fcca58-77f11bd75c0mr1170445b3a.20.1758296848253;
        Fri, 19 Sep 2025 08:47:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlXo0KSqglVgpIcLh5XA7UCg42fBIQBsxCnMNPxIstRIdEmma7vCc+k2D4gDdNlEVk+r71cA==
X-Received: by 2002:a05:6a00:1d18:b0:77f:11bd:749a with SMTP id d2e1a72fcca58-77f11bd75c0mr1170410b3a.20.1758296847757;
        Fri, 19 Sep 2025 08:47:27 -0700 (PDT)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77cfc2490dcsm5706653b3a.36.2025.09.19.08.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 08:47:27 -0700 (PDT)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Fri, 19 Sep 2025 21:17:17 +0530
Subject: [PATCH 2/2] media: iris: Add support for QC08C format for encoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250919-video-iris-ubwc-enable-v1-2-000d11edafd8@oss.qualcomm.com>
References: <20250919-video-iris-ubwc-enable-v1-0-000d11edafd8@oss.qualcomm.com>
In-Reply-To: <20250919-video-iris-ubwc-enable-v1-0-000d11edafd8@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758296838; l=7485;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=Dn7j9lnDJj7KNzypQILQKqp9DEY+kjRS+/3ssNOzKhE=;
 b=z40yWKPrSg9gWTZrVQX9dkXCJ+P+ESWbLiIfXy1lK664oIgZ7GFYj3jS+A/D3hqvChSKEh//9
 +snbCDgSVOmBqIMyNxGmDcC5Y1xmuJ9Rs7oOe57aMrjCr1ansPczg4/
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Authority-Analysis: v=2.4 cv=HbIUTjE8 c=1 sm=1 tr=0 ts=68cd7b11 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=nS3McV74YSJk3wcLVjgA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX1GHKcQdm5EtR
 eqzrZWhn+qUv8HUUyV7BvAgbDN+LP33IGiBNI2HW4DpzHCcHZnU4Y8vC83RBZvDbQvBYOsvnlwo
 pliABC3KVTlFpAo/ejPViwfw0EyIDl82bt1lud08RemnqPACGIkYrZvA3Qb86Gln3fsNqbvsb6p
 E2RS3fOA2eyQ9B2dMj1qnFuFHUhO8s9FfJ6amLhFcdpLu4Vka+EEh86EC6+AEfgJIgeIvcmea5Y
 PBKX8vrJ8lkCRtKky73OjJ4occ2PkQvyCSWM4yD9olZmCjahQyiNjmZXcrbb12YRb0oUJckoy8K
 +73JUID08Ahhrkk+fnTDiL9ela1PRZ5O9PXgzgD0dVscKFXHGRYFSXjg7X4PT2RnRItGBXmC27B
 H9xbgO/s
X-Proofpoint-GUID: GSNeEJhAJZhjaMF_hluW8Dts1MbMOtzh
X-Proofpoint-ORIG-GUID: GSNeEJhAJZhjaMF_hluW8Dts1MbMOtzh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

Introduce handling for the QC08C format in the encoder. Update format
checks and configuration to enable encoding to QC08C streams.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c     | 12 ++++-
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  3 +-
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |  3 +-
 drivers/media/platform/qcom/iris/iris_venc.c       | 59 ++++++++++++++++++----
 4 files changed, 63 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index 83dcf49e57ec1473bc4edd26c48ab0b247d23818..b89b1ee06cce151e7c04a80956380d154643c116 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -171,9 +171,14 @@ static u32 iris_yuv_buffer_size_nv12(struct iris_inst *inst)
 static u32 iris_yuv_buffer_size_qc08c(struct iris_inst *inst)
 {
 	u32 y_plane, uv_plane, y_stride, uv_stride;
-	struct v4l2_format *f = inst->fmt_dst;
 	u32 uv_meta_stride, uv_meta_plane;
 	u32 y_meta_stride, y_meta_plane;
+	struct v4l2_format *f = NULL;
+
+	if (inst->domain == DECODER)
+		f = inst->fmt_dst;
+	else
+		f = inst->fmt_src;
 
 	y_meta_stride = ALIGN(DIV_ROUND_UP(f->fmt.pix_mp.width, META_STRIDE_ALIGNED >> 1),
 			      META_STRIDE_ALIGNED);
@@ -273,7 +278,10 @@ int iris_get_buffer_size(struct iris_inst *inst,
 	} else {
 		switch (buffer_type) {
 		case BUF_INPUT:
-			return iris_yuv_buffer_size_nv12(inst);
+			if (inst->fmt_src->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC08C)
+				return iris_yuv_buffer_size_qc08c(inst);
+			else
+				return iris_yuv_buffer_size_nv12(inst);
 		case BUF_OUTPUT:
 			return iris_enc_bitstream_buffer_size(inst);
 		default:
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index e458d3349ce09aadb75d056ae84e3aab95f03078..52da7ef7bab08fb1cb2ac804ccc6e3c7f9677890 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -795,7 +795,8 @@ static int iris_hfi_gen1_set_raw_format(struct iris_inst *inst, u32 plane)
 	} else {
 		pixelformat = inst->fmt_src->fmt.pix_mp.pixelformat;
 		fmt.buffer_type = HFI_BUFFER_INPUT;
-		fmt.format = pixelformat == V4L2_PIX_FMT_NV12 ? HFI_COLOR_FORMAT_NV12 : 0;
+		fmt.format = pixelformat == V4L2_PIX_FMT_NV12 ?
+			HFI_COLOR_FORMAT_NV12 : HFI_COLOR_FORMAT_NV12_UBWC;
 		ret = hfi_gen1_set_property(inst, ptype, &fmt, sizeof(fmt));
 	}
 
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 5ad202d3fcdc57a2b7b43de15763a686ce0f7bd7..6a772db2ec33fb002d8884753a41dc98b3a8439d 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -447,7 +447,8 @@ static int iris_hfi_gen2_set_colorformat(struct iris_inst *inst, u32 plane)
 			HFI_COLOR_FMT_NV12 : HFI_COLOR_FMT_NV12_UBWC;
 	} else {
 		pixelformat = inst->fmt_src->fmt.pix_mp.pixelformat;
-		hfi_colorformat = pixelformat == V4L2_PIX_FMT_NV12 ? HFI_COLOR_FMT_NV12 : 0;
+		hfi_colorformat = pixelformat == V4L2_PIX_FMT_NV12 ?
+			HFI_COLOR_FMT_NV12 : HFI_COLOR_FMT_NV12_UBWC;
 	}
 
 	return iris_hfi_gen2_session_set_property(inst,
diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index 099bd5ed4ae0294725860305254c4cad1ec88d7e..51fa4a06a70e15310ad8e32d7e16b60b2ab11d5a 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -80,7 +80,7 @@ void iris_venc_inst_deinit(struct iris_inst *inst)
 	kfree(inst->fmt_src);
 }
 
-static const struct iris_fmt iris_venc_formats[] = {
+static const struct iris_fmt iris_venc_formats_cap[] = {
 	[IRIS_FMT_H264] = {
 		.pixfmt = V4L2_PIX_FMT_H264,
 		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
@@ -91,12 +91,35 @@ static const struct iris_fmt iris_venc_formats[] = {
 	},
 };
 
+static const struct iris_fmt iris_venc_formats_out[] = {
+	[IRIS_FMT_NV12] = {
+		.pixfmt = V4L2_PIX_FMT_NV12,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+	},
+	[IRIS_FMT_UBWC] = {
+		.pixfmt = V4L2_PIX_FMT_QC08C,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+	},
+};
+
 static const struct iris_fmt *
 find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 {
-	const struct iris_fmt *fmt = iris_venc_formats;
-	unsigned int size = ARRAY_SIZE(iris_venc_formats);
+	const struct iris_fmt *fmt = NULL;
+	unsigned int size = 0;
 	unsigned int i;
+	switch (type) {
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
+		fmt = iris_venc_formats_out;
+		size = ARRAY_SIZE(iris_venc_formats_out);
+		break;
+	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
+		fmt = iris_venc_formats_cap;
+		size = ARRAY_SIZE(iris_venc_formats_cap);
+		break;
+	default:
+		return NULL;
+	}
 
 	for (i = 0; i < size; i++) {
 		if (fmt[i].pixfmt == pixfmt)
@@ -112,8 +135,21 @@ find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 static const struct iris_fmt *
 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 {
-	const struct iris_fmt *fmt = iris_venc_formats;
-	unsigned int size = ARRAY_SIZE(iris_venc_formats);
+	const struct iris_fmt *fmt = NULL;
+	unsigned int size = 0;
+
+	switch (type) {
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
+		fmt = iris_venc_formats_out;
+		size = ARRAY_SIZE(iris_venc_formats_out);
+		break;
+	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
+		fmt = iris_venc_formats_cap;
+		size = ARRAY_SIZE(iris_venc_formats_cap);
+		break;
+	default:
+		return NULL;
+	}
 
 	if (index >= size || fmt[index].type != type)
 		return NULL;
@@ -127,9 +163,11 @@ int iris_venc_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f)
 
 	switch (f->type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
-		if (f->index)
+		fmt = find_format_by_index(inst, f->index, f->type);
+		if (!fmt)
 			return -EINVAL;
-		f->pixelformat = V4L2_PIX_FMT_NV12;
+
+		f->pixelformat = fmt->pixfmt;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		fmt = find_format_by_index(inst, f->index, f->type);
@@ -156,7 +194,7 @@ int iris_venc_try_fmt(struct iris_inst *inst, struct v4l2_format *f)
 	fmt = find_format(inst, pixmp->pixelformat, f->type);
 	switch (f->type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
-		if (f->fmt.pix_mp.pixelformat != V4L2_PIX_FMT_NV12) {
+		if (!fmt) {
 			f_inst = inst->fmt_src;
 			f->fmt.pix_mp.width = f_inst->fmt.pix_mp.width;
 			f->fmt.pix_mp.height = f_inst->fmt.pix_mp.height;
@@ -221,7 +259,7 @@ static int iris_venc_s_fmt_input(struct iris_inst *inst, struct v4l2_format *f)
 
 	iris_venc_try_fmt(inst, f);
 
-	if (f->fmt.pix_mp.pixelformat != V4L2_PIX_FMT_NV12)
+	if (!(find_format(inst, f->fmt.pix_mp.pixelformat, f->type)))
 		return -EINVAL;
 
 	fmt = inst->fmt_src;
@@ -289,7 +327,8 @@ int iris_venc_validate_format(struct iris_inst *inst, u32 pixelformat)
 {
 	const struct iris_fmt *fmt = NULL;
 
-	if (pixelformat != V4L2_PIX_FMT_NV12) {
+	fmt = find_format(inst, pixelformat, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+	if (!fmt) {
 		fmt = find_format(inst, pixelformat, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
 		if (!fmt)
 			return -EINVAL;

-- 
2.34.1


