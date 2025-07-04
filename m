Return-Path: <linux-media+bounces-36782-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 626A0AF8A7B
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 10:02:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 880943A82CC
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 08:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D94772D8785;
	Fri,  4 Jul 2025 07:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mFEMCNIf"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1DE2857E9;
	Fri,  4 Jul 2025 07:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615668; cv=none; b=C9UFTXuG/EECcLJhZ+NTZwq6SIrLgaufD6zICz6W0XA11Gs0jU2aZm1ya1nBteerUqV8w3X/wngxAZy+JteVM69KNiWyHP8r4e2pdt/7cEJI/ylujw4dwbmmxHNpjtLkw9dQdNpyr4te4P7XZnAFB792L2NGO4XUxJCjNBtiEeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615668; c=relaxed/simple;
	bh=aVSBRYM0dzFACZSMY6AVKuZ0pWWqdJ/B2pGpYaZ0PSw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=gbn84NPBAOMbMKLsFoZ/8VhuAJJ1zaARnYk6zoG3/t9+g5l5cyEwH+nfE3sIBY8ggL+J4PMyHsm+WeBCpYlgkPO57uorUD9q/LVBcdBCBqFp5Kl0Ap/dyO0YIGLSpA/mGdFee5V3lHQ45DnDM0TJ4NdWsYDPsXsnwJkhBsGox6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mFEMCNIf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563Mwio5022207;
	Fri, 4 Jul 2025 07:54:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rBK0U+PPSWwscE7KUwHuHViQLhQP9bEJG4X6O6r4lWs=; b=mFEMCNIfOwMehZqz
	cF79DFzOQaa34GYEEzo9soDA5Cnn6pcy9+G2aWVAqKOz22AKO2U1oI9l9+hwK3ts
	BCiZ7l0Z/aQu4aU/5lJujQ43FMwoihoXU9rjKulP9E6kBbzIytuw7uscKNTWqHlu
	MUfE6mR4fc725jkG5vL7F2VR4MrhY2/jjm7bn9b8kRxfbTUEI34O6NIiGthg3MNq
	DoqvZMDv4T/Ie+Lpm3cgnbuN7zDlkd5AJCjNSy62te9ayHE6fWRtWfkvO76CJlRA
	IsaIMx2LRDMa5vDQNuJDxYVzQYSAFjkR5u6v55ObQWssjJW1znQDY12xMYawQTjR
	HrrZSg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bw34wm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 07:54:21 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5647sKPB019904
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Jul 2025 07:54:20 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 4 Jul 2025 00:54:17 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 4 Jul 2025 13:23:17 +0530
Subject: [PATCH 17/25] media: iris: Add encoder support for V4L2 event
 subscription
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250704-iris-video-encoder-v1-17-b6ce24e273cf@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751615599; l=3502;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=aVSBRYM0dzFACZSMY6AVKuZ0pWWqdJ/B2pGpYaZ0PSw=;
 b=1fivc1NE9oZFlhdJoF/spQlh2QQj8AFQOZOm2pNzKSA6RSICZNhgVS7tcqw9PdnJW6wgQD7DL
 e4hPzV6dIviCyL6px05TFyFU+N9BkaKJ24qVB1CEpVp+Kx8maWCm4n5
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: N_pfPDwL1STJndBZ1CHAq_eghcnI8H6M
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=686788ad cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=JXiySR5JOE9jObuYKgMA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: N_pfPDwL1STJndBZ1CHAq_eghcnI8H6M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA2MCBTYWx0ZWRfX+NmnEg0Y7vIY
 BTME2lUs/KyB4KvOdvkmAPMVabgJ/JSQIMbXFytz5AXyBrUQxemnmdnQKxiuirqMX5MkteskY61
 UmJ4arOFci/FsL7E/h+kSC0AGnops2Qqxktyo6QKdeoD42RtPelM79X6+nk1n097FXiXLCkEM18
 0NwCdLXzy7EqTTa/6oVkjk8+6OT+ZgQaOIROgAGesQKu1ohP5Jmn8AAUwwPoZREsmxAcL3Xd80d
 f7oIfx+sQYZB4kpknrg/TbOpPIMvBaxIy9ues4PZ2W7X+hhuCn87udzInG3KdpbX4ymRSe8HC5p
 9npSreKmyTLatuM8W3AY+Dwwun4rzNsYF0Gv6oOZ0YgDz+5N7sw0nM08n09BLkvJrkUaxi6DPi0
 57sdHefkGFcOgWkeuqAXnsVscig/VjvWGflLnyJZPhmunDv97hxERRE7SaLL/8aiCqsRPhPG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040060

Implement support for V4L2 event subscription on the encoder device by
handling the SUBSCRIBE_EVENT and UNSUBSCRIBE_EVENT ioctls with the
necessary hooks.

This enables userspace applications to subscribe to V4L2 events,
allowing asynchronous notification mechanisms.

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


