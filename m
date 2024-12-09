Return-Path: <linux-media+bounces-22902-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BA09E950F
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 13:55:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CDA9D282057
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 12:55:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E91F72309A9;
	Mon,  9 Dec 2024 12:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LNOQQzuS"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E811D230995;
	Mon,  9 Dec 2024 12:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733748829; cv=none; b=r7etGTIeyQGafwsZjQeck068pa4sv9pXyyo6Pq+iFIc6OD0mE268paUMniwh8Ak4dtvM11Wi8rh467ivPKUukpOEKsN2h2vIadtG8nd8V0ExpkoNoT9XuqNCLgHr6XbPDl4hVIejMyt5fL6oF9fi5pdb7D1k5OHRrVr4kzIRwwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733748829; c=relaxed/simple;
	bh=mnxufihDV3eI4Yvv19pdEVic2nHApDG3Fb2m9/Ex7l8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=JrQ5uXt5KmqNHuoR718L+xskpAAm/jQESX1lFK58CRb8blXWDOLKVKUlGWdpfaVzNB1WAUd8O/42oLuxs7WL+L5Xms166f3oJRaP4HGlUdcgZMhUFwpMnQ8LvWyc+ZL8fv8nGQJhIbz/FxEvVPd/7rnQOcyf/W3p/CIVwvBfxFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LNOQQzuS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9A0LBu010731;
	Mon, 9 Dec 2024 12:53:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fsnsaAAVHXuog6tCTfftBJOi6MJtTW/8+54S4TWlPnE=; b=LNOQQzuSUcgNbajk
	Wr+A7BpbeifA2x/60YIAzJ9wd6J5/5IwzHFNNuNsw+e8USqpc5yVUEZ9chGCrzP6
	J5YuZ3C80EjiS+C7OwcsNMj4s2a99LGwxXxKAuJm5NxnuBleLjL6QR4gW33YilJb
	fv7NX0PB15qLz3lo3ePCIN7a+P1AhnzienPvPcUGG1qylvRkc8v05Gp6iUlx4VpT
	j1VMG5MbkT/B+XnyO34Bq6zGvAWqMLKsGvMkCjxBuHUoxwPGskPTTdStU/+S0EBY
	yMQKyXoNxE/a2jW40KqCarJyqxdJhUqxjZqfEmt6cIrTtJ7YAIrM0IvPuSk3LXxF
	Vy64Cw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43cfn8vqtw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 12:53:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B9Crb1x010008
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Dec 2024 12:53:37 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Dec 2024 04:53:32 -0800
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Mon, 9 Dec 2024 18:21:56 +0530
Subject: [PATCH v7 11/28] media: iris: implement g_selection ioctl
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241209-qcom-video-iris-v7-11-05c6bdead47b@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733748748; l=1958;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=aiuXi+5cvjVJlblUxiZE4e8LsZuidzSc7YhUMp8LoU0=;
 b=leflVqTSB/K/3KGzGe4IrrIj+aZ6tWaonOQcD94xDKLiKExGzNZlrOWT34O5EJx9XJ0UlO8ON
 pQqUOVHUXE5CinK75Ty0GJLwGl8Ky2ApIaYZRkpkZMsWSHNClGtVfn2
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -urigZ9lywQUoXz2YHVcgqOli2APSkeu
X-Proofpoint-ORIG-GUID: -urigZ9lywQUoXz2YHVcgqOli2APSkeu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 spamscore=0 impostorscore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 bulkscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412090101

From: Vedang Nagar <quic_vnagar@quicinc.com>

Implement g_selection ioctl in the driver with necessary hooks.

Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
Reviewed-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_vidc.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index bec965284b6e..92eb793cbeb7 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -259,6 +259,33 @@ static int iris_g_fmt_vid_mplane(struct file *filp, void *fh, struct v4l2_format
 	return ret;
 }
 
+static int iris_g_selection(struct file *filp, void *fh, struct v4l2_selection *s)
+{
+	struct iris_inst *inst = iris_get_inst(filp, NULL);
+
+	if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		return -EINVAL;
+
+	switch (s->target) {
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+	case V4L2_SEL_TGT_CROP:
+	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
+	case V4L2_SEL_TGT_COMPOSE_PADDED:
+	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
+	case V4L2_SEL_TGT_COMPOSE:
+		s->r.left = inst->crop.left;
+		s->r.top = inst->crop.top;
+		s->r.width = inst->crop.width;
+		s->r.height = inst->crop.height;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static struct v4l2_file_operations iris_v4l2_file_ops = {
 	.owner                          = THIS_MODULE,
 	.open                           = iris_open,
@@ -280,6 +307,7 @@ static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops = {
 	.vidioc_g_fmt_vid_cap_mplane    = iris_g_fmt_vid_mplane,
 	.vidioc_g_fmt_vid_out_mplane    = iris_g_fmt_vid_mplane,
 	.vidioc_reqbufs                 = v4l2_m2m_ioctl_reqbufs,
+	.vidioc_g_selection             = iris_g_selection,
 };
 
 void iris_init_ops(struct iris_core *core)

-- 
2.34.1


