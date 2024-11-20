Return-Path: <linux-media+bounces-21659-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EB99D3E12
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 15:53:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 590EF281B6B
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 14:53:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A7BF1D12E0;
	Wed, 20 Nov 2024 14:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KX5+bLXy"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2769F1BF7E5;
	Wed, 20 Nov 2024 14:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732114081; cv=none; b=ll+UfmobRlrUxbIN89Awtnij5Wb/ing95pf0m4dXdMMrqEiKlHqqIHFz5waYqpiA+hZHMZ8gfPZ6IyhKAAdNtrCvT3RPUX0XaUa8P6pFYH0sXltgvYILt0OTYsC819JwyDwbnvHcTEfyBWXpeJsLCs3IIg9yOwpjZeljGW+JOyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732114081; c=relaxed/simple;
	bh=6c4fOrsfRMdsXn8zmGdJGS5A67/6xQaJIdex3v6Px+U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=DVc7WmnB+RAC+tviJeZS2j8atNLbr/18Wsl66fsKLvr9jRTbA6EYQTVQCn4/4+6m3RZE11uborNt58hk/zGXv5pza9rzvrZWi2uee/gcMCLiVFJN8jldOh1XuwF17ODYwG9MmfBHQGQpiEObsViW6KGsKs2iKJ5COUW4Hhtbf1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KX5+bLXy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AK9FVjV005827;
	Wed, 20 Nov 2024 14:47:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p9kbJ0kkLOPigYM5y54n9rJhGGTK4WG/YqunICV6Qgw=; b=KX5+bLXyGD4B9AVv
	r/lXp9N/oTacnGuWa+9nUih7t7dHjnf0PgJb+NWkwgVp7Z5aqCMW/Db5wzUVhPHZ
	nqMA72u5EGZxcvbb20qYKVa2/+SBFajXQcimJ/Xfd35zBPzAHQ3cn+b7Evv+l9tA
	L+1eD0DvU/NVtOdGuPGYQJk8JTVtBOSnrB1wAUbGc5REmBITFR6ggYjgRtPuUx9u
	fuyBIFeeglOoO1NitIJnF9lsvwEgzYwW5AIdfW6Vb9hKeCkOQCRT0RuOx3D0LSne
	Dyjad8Ncw93AT9uSvE2pf4g4gvsqy01XhXTH3Wc9UFMdR+5cAcCCgRGA5prInsCA
	kNntow==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y7x7ey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 14:47:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AKEliTq006207
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 14:47:44 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 20 Nov 2024 06:47:39 -0800
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 20 Nov 2024 20:16:03 +0530
Subject: [PATCH v6 13/28] media: iris: implement subscribe_event and
 unsubscribe_event ioctls
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241120-qcom-video-iris-v6-13-a8cf6704e992@quicinc.com>
References: <20241120-qcom-video-iris-v6-0-a8cf6704e992@quicinc.com>
In-Reply-To: <20241120-qcom-video-iris-v6-0-a8cf6704e992@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732113983; l=4457;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=1DvM7J74kUtS4JtLaQfrazG5fg8bqhKNeG/nGTYgEBw=;
 b=AQPdfdT41fcC9/fygKaq9HOP6WcDrm5G8+bEAfLlU9NqFuj+/eGdKjERLA9eSY4Lq3+lyIEY6
 bLGef6DpoqGDK9B+FGafgdi99pniS5giiwDSCMC82zw63VKbnjPA91C
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: TD5spztk_WU-y2Z-FdUiJpECYyb58xDr
X-Proofpoint-GUID: TD5spztk_WU-y2Z-FdUiJpECYyb58xDr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 mlxlogscore=999 clxscore=1015 suspectscore=0 adultscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411200098

From: Vedang Nagar <quic_vnagar@quicinc.com>

Implement subscribe_event and unsubscribe_event iocts with necessary
hooks.

Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_instance.h |  2 ++
 drivers/media/platform/qcom/iris/iris_vdec.c     | 25 ++++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vdec.h     |  1 +
 drivers/media/platform/qcom/iris/iris_vidc.c     | 10 ++++++++++
 4 files changed, 38 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index 1e9a6075357f..ef4515d2086c 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -30,6 +30,7 @@
  * @once_per_session_set: boolean to set once per session property
  * @m2m_dev:	a reference to m2m device structure
  * @m2m_ctx:	a reference to m2m context structure
+ * @subscriptions: variable to hold current events subscriptions
  */
 
 struct iris_inst {
@@ -48,6 +49,7 @@ struct iris_inst {
 	bool				once_per_session_set;
 	struct v4l2_m2m_dev		*m2m_dev;
 	struct v4l2_m2m_ctx		*m2m_ctx;
+	unsigned int			subscriptions;
 };
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 742b45432481..9afeb681b7a7 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
 
 #include "iris_buffer.h"
@@ -193,3 +194,27 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 
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
+		inst->subscriptions |= V4L2_EVENT_EOS;
+		break;
+	case V4L2_EVENT_SOURCE_CHANGE:
+		ret = v4l2_src_change_event_subscribe(&inst->fh, sub);
+		inst->subscriptions |= V4L2_EVENT_SOURCE_CHANGE;
+		break;
+	case V4L2_EVENT_CTRL:
+		ret = v4l2_ctrl_subscribe_event(&inst->fh, sub);
+		inst->subscriptions |= V4L2_EVENT_CTRL;
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
index bc77dfc2ba67..3a138172e674 100644
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


