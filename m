Return-Path: <linux-media+bounces-40892-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CB4B33752
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:07:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 590D63A5ED4
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 07:06:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF63C2BE050;
	Mon, 25 Aug 2025 07:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="L3ri3g56"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D342BDC3B;
	Mon, 25 Aug 2025 07:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756105325; cv=none; b=uO8K435PVkth3eptMw1oj/5uJKYfvxdlr4fDiJYC+B+5SJngG1aS6O0b5k1TvWnvlJK+g7+xQSX47GcRI++ikDS5VhmV4Q3JPbdUIQ+gOw9CUDPBlCU/j1RE2awtRlO2+ampbwZC36VO+o+aw8OQa7h9PEuqA8kMXGZkQMxmOo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756105325; c=relaxed/simple;
	bh=HnrNDmLb7pfPLN4T/szKFfo915pUIP3W1ZpgEO3l3Z8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=iWrRDxW8ONaebQwjPVT7cytgUcojn3fayB0bnZmMxcFUUuzxeS8FkosFByCf8lc+hMbVyrwb9BxkdD4x3De8vo74zmlBsrwTngg6b0x1XGoeAhpuB2SJ+7YpAsUKU9MBL4u+XA+QMU+qlfZDBDpM/nmwSuycYPy4hb1n3RGMaz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=L3ri3g56; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57OKcGGu006414;
	Mon, 25 Aug 2025 07:01:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wQKoo1iLb45mOueUv2HXdrn7oetHlrcG9Qda0LHqgkc=; b=L3ri3g56PQk63pz2
	DZ1sSJf7zQfc0qcHTt0guLVOA740YVUQJJ5kQg4FQ8kpXosVfJU/QdJsi/Pgrmrf
	brz2thpaHl1KuG3Zy4WXph3fQPUJyEpu6DFKPiRbGuk8vf+xC3i+s/GwyKb35pU+
	d+oPzbVCI50S5BNPMOfwxiC0D5g3VPegTnx9HbzvitA1yWPuDj68tszxp1OPdFqR
	StmPr6JnP+ht1UaYevyWYtghRwIOPjAbzjVlwBCp8iYoRmeDMqEKkj1kknNS69AH
	NPo+dRv4kZ8JEMvKL4XLboIP5WHxGKhLbdzXQ6ws+TpmV0Httw5LLB1rFrxOfnD2
	1pB0Uw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6de457e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 07:01:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57P71v4J027353
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 07:01:57 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Mon, 25 Aug 2025 00:01:53 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Mon, 25 Aug 2025 12:30:42 +0530
Subject: [PATCH v4 18/26] media: iris: Add encoder support for V4L2 event
 subscription
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250825-iris-video-encoder-v4-18-84aa2bc0a46b@quicinc.com>
References: <20250825-iris-video-encoder-v4-0-84aa2bc0a46b@quicinc.com>
In-Reply-To: <20250825-iris-video-encoder-v4-0-84aa2bc0a46b@quicinc.com>
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
	<quic_dikshita@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756105234; l=3767;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=HnrNDmLb7pfPLN4T/szKFfo915pUIP3W1ZpgEO3l3Z8=;
 b=KinmCFaUvNINl4CR0IXS+6A70xswld6QQa9QdMK7VZizsr17cHjZ81YT/4k0yQdTLDK9qvjOF
 zSvvWfzTc5WAXBx557oRBWqiTGTJCGV4WVrO4Z4bqiQWG0Gte8/vcuU
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNyBTYWx0ZWRfX25H2ayD+1in8
 MInwNChJBTMjDYzG4GN7utKTNsPoPIltzAQHFIEKoGkBY+L4oH7J0TC0+kyvial2namwy/cco9a
 a8OKMyx5S3ZwMiRmV7aSyIzOxnNXRJ1dkqRqXO4DiN4qJkzYH486hJy0xB8V1DaeK4rM5oTE+vP
 8u+8oHRuaCsHqz7HVjS1eHNlNjxGU6fx7n9hlclioR2ef+sJxcNROGzBRqS2lOLCSgPzcMTJuaS
 thjF2gIlS6gX0hNklQQJFeEbE/qHAoRtFSuTjKfksllimJFtz65lm6tb8+xIYsd6FDxMhkLPHIs
 52Q06Ib7q3P/fltea3dLksBzyaF1zR2wjA3i7xeBy/zOvp28jX7tnUxu/xgoArXhKnq+ueMxDr/
 jhc62Kur
X-Proofpoint-ORIG-GUID: d2qmHiUC1W1tY7x7maTD1ODw9CDWv1id
X-Proofpoint-GUID: d2qmHiUC1W1tY7x7maTD1ODw9CDWv1id
X-Authority-Analysis: v=2.4 cv=K7UiHzWI c=1 sm=1 tr=0 ts=68ac0a66 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=JXiySR5JOE9jObuYKgMA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230037

Implement support for V4L2 event subscription on the encoder device by
handling the SUBSCRIBE_EVENT and UNSUBSCRIBE_EVENT ioctls with the
necessary hooks.

This enables userspace applications to subscribe to V4L2 events,
allowing asynchronous notification mechanisms.

Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
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


