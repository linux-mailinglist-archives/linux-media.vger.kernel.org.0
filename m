Return-Path: <linux-media+bounces-39774-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC63B245DE
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 11:46:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3D5B7245C6
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 09:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0FF830749F;
	Wed, 13 Aug 2025 09:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IskUEwmw"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEAD730748A;
	Wed, 13 Aug 2025 09:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755077970; cv=none; b=da3Tbb0+XHLqzxaglg/BcAmsAOP14m3y5HDkxUbIQ5no8ymyVD/nmZwlATgxGZKlCoNV1Ua0/eYkHfPVA69dHC29volQvNBoevcP6VDu1/NjpldWGy0vPqed5kN5nWEYE/zld/LIfPNzSM54ZMyWUAkbuuvx9PVrcD82T1xFH1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755077970; c=relaxed/simple;
	bh=7bj9mM/8Au+NjGCLEI8sKDouaJ3asDba7in0sMNSFEA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=F8NQk11qDsJdLKcs4HJvZC6hkOYjfvUPLlVqb5JLCo5OaEmqbXWgNIPmNH6kYjRf70ECmhrqe7cxFzKK2PNOdwg90/VZvgt0fCnS39Fmg2Kk5U+7btQERZtPWtTTiwszf2NHGZtLJGvtFJjS1sxoK7YZzPdR2KZezRGGnjWCUXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IskUEwmw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D6mIig015688;
	Wed, 13 Aug 2025 09:39:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rz4qCrPenPASaWei8MTX++fM+81NBR6iPwTy4pfnzno=; b=IskUEwmwzbTIFOPe
	4HmjBXo7zmDstWa1u/kZdHPmS0CCMKxp+SPfZKfDUY9/EzuOQifa3zJzWkoWN/ZU
	6d/UCzn4U0tNyEQhHkhv/gj+xRi75h5EMeVcRNJ/VSMZTM2lwTtKOV2jOtOZA+6j
	SN+luZ03nbhsO27gwCfwFWGUoGdTLb8ZWH4GGjntaUHlrrFBsuzL7Vz80h2gi7Zh
	bkXiJ4t5QrlOwj1Zt34QjDp3nC/oFhIotjIAaRq+O+fawkG4zDtpataNlIbv9b6h
	nhRDOXgf27Np+ta6yfafr7Sr29x9WfNkWt1+nWK+4ZXum51gpf+vC7X4JpjG7C5N
	rXU1tg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fjxbefn4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 09:39:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57D9dNSI004993
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 09:39:23 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 13 Aug 2025 02:39:20 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 13 Aug 2025 15:08:06 +0530
Subject: [PATCH v2 16/24] media: iris: Add encoder support for V4L2 event
 subscription
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250813-iris-video-encoder-v2-16-c725ff673078@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755077896; l=3568;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=7bj9mM/8Au+NjGCLEI8sKDouaJ3asDba7in0sMNSFEA=;
 b=XT0BDghhj/a3pjEwmOquhIVWlZ6aEyp1J3WRysI4rK5FswBTyh/4YL3vGy+dNyFCrqcLvcQhE
 g1Hcs5ApuuZDHin2HS1yDWnQsV9f3My97wskxa7q/H9URzJ7FYFCsJL
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=G6EcE8k5 c=1 sm=1 tr=0 ts=689c5d4c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=JXiySR5JOE9jObuYKgMA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA5NyBTYWx0ZWRfX3PAoIrOKm4YO
 xh+8vJ+oBijhT6BBmWym77cY2ahDE94HF0msLlg7mBmaRCfhWZRcqjLOg2BQE8sY/ZH051ITM+U
 pOJciZVGS1p5OV5aEHqHlcWC++ap10xPWt5SlBeEgoQMP/Tg/GkgdkbdpX6IW53YAGC9dmMI+dN
 DkX7aZJHlAIZELQDB2fomJvEZ8ammq1HFUdxu50zWYx78Jz1Loj4yvp1M/NcUPTXbkWk4qEX4GC
 /pWmxQQPvNZMyRVIj71mzJdBUoqhOdhiYx6lAnNjAQKH7EyfcnJrtTMX6UFtl9DxOV4KCPlvUSG
 OdRXz8NBxUBipqT5dVNrp8f6RMHBylVH/8t5UGk8gJ3eslUuUZw/d54wTvo/zsYu8DUd54ErTO0
 QTcJWvmb
X-Proofpoint-ORIG-GUID: bY7rOYdiJw9hA762SAaakl90sr4bt74_
X-Proofpoint-GUID: bY7rOYdiJw9hA762SAaakl90sr4bt74_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110097

Implement support for V4L2 event subscription on the encoder device by
handling the SUBSCRIBE_EVENT and UNSUBSCRIBE_EVENT ioctls with the
necessary hooks.

This enables userspace applications to subscribe to V4L2 events,
allowing asynchronous notification mechanisms.

Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_venc.c | 14 ++++++++++++++
 drivers/media/platform/qcom/iris/iris_venc.h |  1 +
 drivers/media/platform/qcom/iris/iris_vidc.c |  9 ++++++++-
 3 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index 301206253090962abbb4e4eac8ee88e7b359c98d..3dbcce23cbe94cf0edc4421694a3ba11faa5eb96 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
 
 #include "iris_buffer.h"
@@ -283,3 +284,16 @@ int iris_venc_validate_format(struct iris_inst *inst, u32 pixelformat)
 
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
index 458773a2ed7f5e16d5bd5e79dba2f5c029036505..d8c94074153e9b1ceac4f911210ddbf89bbe3533 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -489,7 +489,12 @@ static int iris_subscribe_event(struct v4l2_fh *fh, const struct v4l2_event_subs
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
@@ -584,6 +589,8 @@ static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops_enc = {
 	.vidioc_enum_framesizes         = iris_enum_framesizes,
 	.vidioc_enum_frameintervals     = iris_enum_frameintervals,
 	.vidioc_querycap                = iris_querycap,
+	.vidioc_subscribe_event         = iris_subscribe_event,
+	.vidioc_unsubscribe_event       = v4l2_event_unsubscribe,
 };
 
 void iris_init_ops(struct iris_core *core)

-- 
2.34.1


