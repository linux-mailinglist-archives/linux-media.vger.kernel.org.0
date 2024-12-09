Return-Path: <linux-media+bounces-22905-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 565E79E951D
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 13:56:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57B011880132
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 12:56:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D783F233D9C;
	Mon,  9 Dec 2024 12:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CnPKu1D4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75546233D73;
	Mon,  9 Dec 2024 12:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733748841; cv=none; b=jp1pyaEINw7fvXxE5I447kZ64Agc27lP9uSfQ9zrgTPn3NvQZsVxW5IOJpV+xYwA9jYvcouDW8m8JHYzeliRjLKsk0nb1Hco+pblkAJOR3yusm4phTBPDJbUZakp0lwQGJfz5grQI/g6fPwwDKHegFffgQVbOx+YzcOu22pW2nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733748841; c=relaxed/simple;
	bh=YNLAs8iImcDfLNh13SQZKANzKrfw+jazf6MnmA2/FZw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=SKMzOFRf7DShMA0nljRzPtMrDvlxUICowI2Stf+He7iAWR3Fj2spkrWQJJhqnxuGSWUruu6QOTPfY9fSchw7KeHbpeIuE8FiDWa+nyRsU4K0ZDpfzX2x6SPqnWzKGR2FffH2qqgV0TrdvV54JrAfYWm/9/741ShZN3QzD9m6Eho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CnPKu1D4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B98LVBr014037;
	Mon, 9 Dec 2024 12:53:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3NWoUJU4s6buqO0F8jxlGcEQd1no5d0HUr3J6eeU0ZI=; b=CnPKu1D4xYMq4fg2
	HtwzcJq+75ZPkRCZdgbVGAOysjJ+3xW2hGdEkTHIuu7fIxkIhLOJKHIu/Drlxg47
	8qghdilo9ixi56JPRm0rexy7mVDlNiso55c46Jk7cH7rvRZLcsPvN4jbO8SRDlTp
	DUcpgwzsCkMYienyeLWYLrNx2k5p+tY+tzTmW1CIVZ6+ZYuBUYc037rZ7AWnpAWe
	3hpJz/HPPHViuJ+iMT+b8H0qXFUHyK0n3O6jm+kaK8sWpGbenhKSl8dPKjkv0XHp
	t/pGcYwtlRRo6MylmQN8PfSwRSsiTrVeurLGIfyH/SzDX7ptpDpecxa2Im6srsoS
	Tzjrlg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43dvyah0h5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 12:53:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B9Crnl6013176
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Dec 2024 12:53:49 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Dec 2024 04:53:43 -0800
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Mon, 9 Dec 2024 18:21:58 +0530
Subject: [PATCH v7 13/28] media: iris: implement subscribe_event and
 unsubscribe_event ioctls
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241209-qcom-video-iris-v7-13-05c6bdead47b@quicinc.com>
References: <20241209-qcom-video-iris-v7-0-05c6bdead47b@quicinc.com>
In-Reply-To: <20241209-qcom-video-iris-v7-0-05c6bdead47b@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: Hans Verkuil <hverkuil@xs4all.nl>,
        Sebastian Fricke
	<sebastian.fricke@collabora.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Nicolas Dufresne
	<nicolas@ndufresne.ca>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>,
        Jianhua Lu <lujianhua000@gmail.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        "Dikshita
 Agarwal" <quic_dikshita@quicinc.com>,
        Vedang Nagar <quic_vnagar@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733748748; l=3500;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=/U9asxGjlwjJSD+wScxFfd4ovJMqy7vRh74uMqkbYq4=;
 b=B2yndezY9cieUqcXO3LGXQa0WWwcLMF15xT3miLeBtBz2RAdke0WFMycBOSf0BvTpQnnvmv+y
 k2os2r5VC7HC90ixJfAKzsXbBKK2ImPEcWMbz2jBiRBRuoTzNBBecZ+
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: q1_Q_Rq9hN_KwCJ2I844l9zaDzyjjqdE
X-Proofpoint-ORIG-GUID: q1_Q_Rq9hN_KwCJ2I844l9zaDzyjjqdE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412090101

From: Vedang Nagar <quic_vnagar@quicinc.com>

Implement subscribe_event and unsubscribe_event iocts with necessary
hooks.

Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_vdec.c | 22 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vdec.h |  1 +
 drivers/media/platform/qcom/iris/iris_vidc.c | 10 ++++++++++
 3 files changed, 33 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 081a9eda5c49..0ba60bcb9fa9 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
 
 #include "iris_buffer.h"
@@ -193,3 +194,24 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 
 	return 0;
 }
+
+int iris_vdec_subscribe_event(struct iris_inst *inst, const struct v4l2_event_subscription *sub)
+{
+	int ret = 0;
+
+	switch (sub->type) {
+	case V4L2_EVENT_EOS:
+		ret = v4l2_event_subscribe(&inst->fh, sub, 0, NULL);
+		break;
+	case V4L2_EVENT_SOURCE_CHANGE:
+		ret = v4l2_src_change_event_subscribe(&inst->fh, sub);
+		break;
+	case V4L2_EVENT_CTRL:
+		ret = v4l2_ctrl_subscribe_event(&inst->fh, sub);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return ret;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.h b/drivers/media/platform/qcom/iris/iris_vdec.h
index ae456676e578..f64ce3234e6a 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.h
+++ b/drivers/media/platform/qcom/iris/iris_vdec.h
@@ -13,5 +13,6 @@ void iris_vdec_inst_deinit(struct iris_inst *inst);
 int iris_vdec_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f);
 int iris_vdec_try_fmt(struct iris_inst *inst, struct v4l2_format *f);
 int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f);
+int iris_vdec_subscribe_event(struct iris_inst *inst, const struct v4l2_event_subscription *sub);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 82bd0be8e5da..511cd13ac471 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/pm_runtime.h>
+#include <media/v4l2-event.h>
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-mem2mem.h>
 
@@ -322,6 +323,13 @@ static int iris_g_selection(struct file *filp, void *fh, struct v4l2_selection *
 	return 0;
 }
 
+static int iris_subscribe_event(struct v4l2_fh *fh, const struct v4l2_event_subscription *sub)
+{
+	struct iris_inst *inst = container_of(fh, struct iris_inst, fh);
+
+	return iris_vdec_subscribe_event(inst, sub);
+}
+
 static struct v4l2_file_operations iris_v4l2_file_ops = {
 	.owner                          = THIS_MODULE,
 	.open                           = iris_open,
@@ -347,6 +355,8 @@ static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops = {
 	.vidioc_enum_framesizes         = iris_enum_framesizes,
 	.vidioc_reqbufs                 = v4l2_m2m_ioctl_reqbufs,
 	.vidioc_g_selection             = iris_g_selection,
+	.vidioc_subscribe_event         = iris_subscribe_event,
+	.vidioc_unsubscribe_event       = v4l2_event_unsubscribe,
 };
 
 void iris_init_ops(struct iris_core *core)

-- 
2.34.1


