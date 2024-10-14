Return-Path: <linux-media+bounces-19573-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD7C99C50B
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 11:13:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A3041F251FD
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 09:13:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 018EB158868;
	Mon, 14 Oct 2024 09:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jJD96Kew"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CFC1A724C;
	Mon, 14 Oct 2024 09:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728896934; cv=none; b=DhyWj8Jn5zyrno4VLbZuQgM0bN6tEBA28dQErcrchx99glvPjlOfVwdd5QPeinC8oUA9GX98PdasgY7xmth3t9DMDP+nH3/TWTqesMcWhXzTUo7kxAJVcbjzqHAxWqnXs++VdpGv6yiKCxXPrUREggae1gKfVA72dooPrfCOHpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728896934; c=relaxed/simple;
	bh=qO/Sae3PV2FpEoIIqGvuyKmgOuun4SO1Vy/v2VgzZ8w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=IV32mS6eu0My/BR9WxEHNFcjwt1z5Tusz2VpumDF8o4EBlxQoDaUvwiEnCp00h8dNK6C2I7HtSNn+GfUTo0jffPrOPt5JBFfpkkZXuUcKll8sLF2A8PHDeQLjrPYk6cFNWdQGZizNZCBSsgszVRqHuT/6sOKk+yqdtdKU5GXaNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jJD96Kew; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49DNwCB9015497;
	Mon, 14 Oct 2024 09:08:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+U7YktKk0hH8VFCX1jFGYPO98W50ZbUelUNpaNZODbc=; b=jJD96KeweYBjcZmt
	V69ubAhPGtz76/7SXiAEimBTAPq6qVx/k6c4SJaCjl1hTPbu7c3v2RtPTZ5Jx5JQ
	88Y3ujQ/ThcijpC2yfP4WiNzWGH/k5GYUTn04rTHabSllJssKUKpkFuV3I5NZZ+s
	lCE9JPatsyVZzmA9UjvTYeR79sqkt8xZctYepeeemI5/EoB2hKo+tPKgB/29XSS5
	AVjyCZGwce/Y3s8RODPVg9Kc6H8SD/nkNWckuCv+A4mDqqIDu8qKLSNMXDN7h5qe
	UfcBBHU3kTaCVXRZcOK1siUzn+XSbPMpvLvksE91l4kks19mcue/rTpfXKZfl6Jk
	Uj9sWg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 427hvfutcq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 09:08:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49E98kok003240
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 09:08:46 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 14 Oct 2024 02:08:42 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Mon, 14 Oct 2024 14:37:36 +0530
Subject: [PATCH v4 15/28] media: iris: implement query_cap, query_ctrl and
 query_menu ioctls
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241014-qcom-video-iris-v4-v4-15-c5eaa4e9ab9e@quicinc.com>
References: <20241014-qcom-video-iris-v4-v4-0-c5eaa4e9ab9e@quicinc.com>
In-Reply-To: <20241014-qcom-video-iris-v4-v4-0-c5eaa4e9ab9e@quicinc.com>
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
        <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Vedang Nagar <quic_vnagar@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728896854; l=2763;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=3LOxz1nXBUVNA1K6LEANHl8qUO9NLtjgWhGMccDfQRc=;
 b=WRomXu7C1iHdC8dUUYS/LgPuDE/X+G4xm9YemKVcPO1pJ66aTh3XAv1wuU0/do2wXYNYJBvvy
 25XrNkv5otgAiNN/1ZIgzeAmgA2Pet0ztXpL4PJzjHRKrIiHy0aJYBN
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: dp12Qipxyyip5SSDk2mK-Hl2iWW5RbVw
X-Proofpoint-ORIG-GUID: dp12Qipxyyip5SSDk2mK-Hl2iWW5RbVw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0
 clxscore=1015 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410140066

From: Vedang Nagar <quic_vnagar@quicinc.com>

Implement query_cap, query_ctrl and query_menu ioctls
with necessary hooks.

Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_vidc.c | 52 ++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 93d2be118a81..60ee05b67f86 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -300,6 +300,55 @@ static int iris_enum_framesizes(struct file *filp, void *fh,
 	return 0;
 }
 
+static int iris_querycap(struct file *filp, void *fh, struct v4l2_capability *cap)
+{
+	strscpy(cap->driver, IRIS_DRV_NAME, sizeof(cap->driver));
+	strscpy(cap->bus_info, IRIS_BUS_NAME, sizeof(cap->bus_info));
+	memset(cap->reserved, 0, sizeof(cap->reserved));
+	strscpy(cap->card, "iris_decoder", sizeof(cap->card));
+
+	return 0;
+}
+
+static int iris_queryctrl(struct file *filp, void *fh, struct v4l2_queryctrl *q_ctrl)
+{
+	struct v4l2_ctrl *ctrl;
+	struct iris_inst *inst = iris_get_inst(filp, NULL);
+
+	ctrl = v4l2_ctrl_find(&inst->ctrl_handler, q_ctrl->id);
+	if (!ctrl)
+		return -EINVAL;
+
+	q_ctrl->minimum = ctrl->minimum;
+	q_ctrl->maximum = ctrl->maximum;
+	q_ctrl->default_value = ctrl->default_value;
+	q_ctrl->flags = 0;
+	q_ctrl->step = ctrl->step;
+
+	return 0;
+}
+
+static int iris_querymenu(struct file *filp, void *fh, struct v4l2_querymenu *qmenu)
+{
+	struct iris_inst *inst = iris_get_inst(filp, NULL);
+	struct v4l2_ctrl *ctrl;
+
+	ctrl = v4l2_ctrl_find(&inst->ctrl_handler, qmenu->id);
+	if (!ctrl)
+		return -EINVAL;
+
+	if (ctrl->type != V4L2_CTRL_TYPE_MENU)
+		return -EINVAL;
+
+	if (qmenu->index < ctrl->minimum || qmenu->index > ctrl->maximum)
+		return -EINVAL;
+
+	if (ctrl->menu_skip_mask & (1 << qmenu->index))
+		return -EINVAL;
+
+	return 0;
+}
+
 static int iris_g_selection(struct file *filp, void *fh, struct v4l2_selection *s)
 {
 	struct iris_inst *inst = iris_get_inst(filp, NULL);
@@ -366,6 +415,9 @@ static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops = {
 	.vidioc_g_fmt_vid_out_mplane    = iris_g_fmt_vid_mplane,
 	.vidioc_enum_framesizes         = iris_enum_framesizes,
 	.vidioc_reqbufs                 = v4l2_m2m_ioctl_reqbufs,
+	.vidioc_querycap                = iris_querycap,
+	.vidioc_queryctrl               = iris_queryctrl,
+	.vidioc_querymenu               = iris_querymenu,
 	.vidioc_g_selection             = iris_g_selection,
 	.vidioc_subscribe_event         = iris_subscribe_event,
 	.vidioc_unsubscribe_event       = iris_unsubscribe_event,

-- 
2.34.1


