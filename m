Return-Path: <linux-media+bounces-40372-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F3AB2D7D6
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 11:18:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB54E723E6A
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 09:16:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E21D2DEA7A;
	Wed, 20 Aug 2025 09:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nioZkvUb"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B772EBB86;
	Wed, 20 Aug 2025 09:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755680949; cv=none; b=OakvW9jKl+YChSzflrl7oQW/bhLb93ZpIG1XD7+4jhrwmHnUkbLugPnORv/9YPv14BzaVDYcMAZ9aYjMjghY2mcNDEdL4RT7/LsyQanP6wx2fnfu/6ok8WTOXJM20kojr9X1HwjQQRHfFOnEdGQLOE+PqknzS7rl4zxVSMda8pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755680949; c=relaxed/simple;
	bh=2oCZ0+OTZ/L1A3NpHOd0seju622UWLDrXlS7+9AjUsI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=iGmX636RkbFBWNDtMaeW2I8wO4gitVylfSvSc6G2jgUf9sX4VifHHp48z+0qgNFPXDgFpywLP+WsvvMLM8wsN0CklaLx+FfXnp3YZuAZaiEhsEJ+IFE9RUEXPrSdnFqReSi2NqEt77FdGPsUrdNOjgj5fdUiyP+hPsDWDTJp9TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nioZkvUb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1owLB002743;
	Wed, 20 Aug 2025 09:09:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5OhDvakfRX6yHXf2q5+xS81YyuTy7r5uIIe+OCQRF0A=; b=nioZkvUbLSYBhW88
	Q5wbKc0IV7UhvdM2ZczDuExbF55bMkejBB6Rjb3EirfA3UNcoLbtTOPyGAjvwm4n
	QECKUzKAVCqWnErKx81XRMT4Fi+JDlJvfgm29Ff60dMeNgFsjYtr0nHxLhnqlkpt
	eJs+WJ85CfLhIbr7bGTgNVijoY82BS9vfbaAWxomNzn3CZzeRSUPIh6NgYOH+SaD
	X5c17Ch9TCiSULPGTMV9Xf5nNEAXX38Rj9YPoN6gyhwHUR4ugxCzmwJGoPZuIlaA
	4te5BXXfLsywob0Pjz8elTna87c4iu15hTecuJx5v1gO6B04NXORNXSHa/1lXml+
	+P4xOA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n528s3q9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 09:09:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57K992on002391
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 09:09:02 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 20 Aug 2025 02:08:58 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 20 Aug 2025 14:37:56 +0530
Subject: [PATCH v3 18/26] media: iris: Add encoder support for V4L2 event
 subscription
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250820-iris-video-encoder-v3-18-80ab0ba58b3d@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755680867; l=3625;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=2oCZ0+OTZ/L1A3NpHOd0seju622UWLDrXlS7+9AjUsI=;
 b=BF5/ydgErXFx5VPhrjk8ek6zkoq7QA76zo1Ne67tnp7pEu5w01wmzzIdoi+cQ1jkmDjssCTIx
 3LpIlCVyxOyBQxPrE/vGRVg6y1hcMLo5XrMHfHJM2QhKhfnMYfXB22j
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=fpOFpF4f c=1 sm=1 tr=0 ts=68a590af cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=JXiySR5JOE9jObuYKgMA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: ydCLXqeVWD8S8bws0uSJBwR372h9P4Cm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXxPwF13RnoEnv
 ixL5rxcrVepHC5nsk2olcl7x4fPWm1THGBmM6dEmpZpbcqCkqZhiJxQzFHZb/5lbDwf39mn2r2K
 XkzLe6tmBAm4v5f0u5AHrnNzdYT4rSI4VyL4Dx/Ovd0nq7JCvtTG2h5cgsDUWUb8K338gFsIJUB
 H9juYVzN5Ih2z5mHKGUomeC4EszjaKBM2oBybcJ2rAvb4S3pt3FhpOxlIRKDKtU+UPRgP02o8Pj
 xpZ+sbQw5+hy7P6SUTuBP22be83WEu8fzwpUYrEt7JWf2oFrBawzYkcozQ4FdhMZDE7Af7sUPYI
 bd3+4GMLOLWrr/Kx1fmxuHoveDSk5ql7k2coC4OqNb/1jb79LOy8OrSgsl9/pOjLDcXMU5fRIaG
 LQJD+opP+WTxBm2eaegulRWtps320g==
X-Proofpoint-ORIG-GUID: ydCLXqeVWD8S8bws0uSJBwR372h9P4Cm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

Implement support for V4L2 event subscription on the encoder device by
handling the SUBSCRIBE_EVENT and UNSUBSCRIBE_EVENT ioctls with the
necessary hooks.

This enables userspace applications to subscribe to V4L2 events,
allowing asynchronous notification mechanisms.

Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_venc.c | 14 ++++++++++++++
 drivers/media/platform/qcom/iris/iris_venc.h |  1 +
 drivers/media/platform/qcom/iris/iris_vidc.c |  9 ++++++++-
 3 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index 55938050249fa1a041b835214e79028ae0b35e36..384b30555546f2a0677e49400f177b96611f866b 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
 
 #include "iris_buffer.h"
@@ -286,3 +287,16 @@ int iris_venc_validate_format(struct iris_inst *inst, u32 pixelformat)
 
 	return 0;
 }
+
+int iris_venc_subscribe_event(struct iris_inst *inst,
+			      const struct v4l2_event_subscription *sub)
+{
+	switch (sub->type) {
+	case V4L2_EVENT_EOS:
+		return v4l2_event_subscribe(&inst->fh, sub, 0, NULL);
+	case V4L2_EVENT_CTRL:
+		return v4l2_ctrl_subscribe_event(&inst->fh, sub);
+	default:
+		return -EINVAL;
+	}
+}
diff --git a/drivers/media/platform/qcom/iris/iris_venc.h b/drivers/media/platform/qcom/iris/iris_venc.h
index 04fd41275547c40c359c6ea04dfe4ee31d2d0df6..2d9614ae18e8a2318df6673fbeae5ee33c99b596 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.h
+++ b/drivers/media/platform/qcom/iris/iris_venc.h
@@ -14,5 +14,6 @@ int iris_venc_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f);
 int iris_venc_try_fmt(struct iris_inst *inst, struct v4l2_format *f);
 int iris_venc_s_fmt(struct iris_inst *inst, struct v4l2_format *f);
 int iris_venc_validate_format(struct iris_inst *inst, u32 pixelformat);
+int iris_venc_subscribe_event(struct iris_inst *inst, const struct v4l2_event_subscription *sub);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 92a616787a30a51f4fbf4760badffd6fabc48cc6..5d9b36858e9317b1eddac12004432229e18967a7 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -487,7 +487,12 @@ static int iris_subscribe_event(struct v4l2_fh *fh, const struct v4l2_event_subs
 {
 	struct iris_inst *inst = container_of(fh, struct iris_inst, fh);
 
-	return iris_vdec_subscribe_event(inst, sub);
+	if (inst->domain == DECODER)
+		return iris_vdec_subscribe_event(inst, sub);
+	else if (inst->domain == ENCODER)
+		return iris_venc_subscribe_event(inst, sub);
+
+	return -EINVAL;
 }
 
 static int iris_dec_cmd(struct file *filp, void *fh,
@@ -582,6 +587,8 @@ static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops_enc = {
 	.vidioc_enum_framesizes         = iris_enum_framesizes,
 	.vidioc_enum_frameintervals     = iris_enum_frameintervals,
 	.vidioc_querycap                = iris_querycap,
+	.vidioc_subscribe_event         = iris_subscribe_event,
+	.vidioc_unsubscribe_event       = v4l2_event_unsubscribe,
 };
 
 void iris_init_ops(struct iris_core *core)

-- 
2.34.1


