Return-Path: <linux-media+bounces-21661-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 344F19D3E19
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 15:54:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE7EF281CF2
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 14:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B2CE1D2F50;
	Wed, 20 Nov 2024 14:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MQVCgOeg"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD731D12E1;
	Wed, 20 Nov 2024 14:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732114086; cv=none; b=eEehd4AmUKDTpXDxcW52XATd89CJBzKetSnBSYS+79YuL4oVraEo8hmc/yHtq0S/ORb7XIoFnzrm+nXwqXYo74R2wIR1ef97ICL3EbUXjW/hrp0ZalhTNSHGxu/pBslJGNpP0Kk/zcb3tQ1+wf7kJLdFEXF4I7hiPA4Cuu9gINI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732114086; c=relaxed/simple;
	bh=uklTNfRvn93oDUOOGb7Rt3eMNn8n+Bdva7W01HFUHsQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=XVu1DEKPTpuon4rLdB3MwItR5/pd528oqNJt/yEdE1jKC+uiGKLjknic237DxO6lCZfVMm2G8K+t2eCEwn4Q3cAT0GbRNKMObikWwZImpzoYUpPcMJraMWEctmwB10mOJaEzlBz2qnyim1baXvACO8zpcLHWRegGnAg6YNV2Mf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MQVCgOeg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AK9FR5W010566;
	Wed, 20 Nov 2024 14:47:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rhNjMSJ8PyftnURTVgdn/GmnuKlkYoEtzxOv3wqgXjs=; b=MQVCgOegfeMMlgO+
	OndNB+uvuFjpQVxSFMBqLNU2sdDQ74PIiEimDpbnBjrqQIfaC4iK6l0mlJgnlQsR
	qpKFDUtTiWHivwJnmY9IKJf1W/g8UBObiZiZnFBSSCKts2acAhsD5i6I1x8LE4Uq
	v33hDEXa68EkN7HyO5GA5m2xu9nuTsm+lWiM5K1Eao6t2AFpPW+HZrqzZBzoUbDb
	ycuxk9H7XPnd8xoM3SLMorRszxhHCzHG2Cy3s9egWV+yYtUvqfeucoj58DA32dpc
	kGwQk0OyeGBWIBfJv5TtXN5F80io8JZNnZTfpMmpDVk10VVFUjE0gRTWZZbfIEvf
	e1drsg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43091me5bq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 14:47:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AKEluns009413
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 14:47:56 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 20 Nov 2024 06:47:50 -0800
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 20 Nov 2024 20:16:05 +0530
Subject: [PATCH v6 15/28] media: iris: implement query_cap ioctl
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241120-qcom-video-iris-v6-15-a8cf6704e992@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732113983; l=1500;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=7nhvofIcy0J7GxdmjMAQeF7e+V6iN2t9WVnS8YDTDWg=;
 b=RaSU0g1Vef5QWnQSfIeCkEqqICb+qN3jKgHUbyBiDQN5EotbUV045869fgZtnq95SQdPx22yI
 1bb0XlrQHtZABOW864kPhJRhlE0sx1lQXTkSQ0/RoyImehUyHF+t28y
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: DLGRkIKXCN34IkLLnsEQuCQTTB80JLSE
X-Proofpoint-GUID: DLGRkIKXCN34IkLLnsEQuCQTTB80JLSE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411200098

From: Vedang Nagar <quic_vnagar@quicinc.com>

Implement query_cap ioctl with necessary hooks.

Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_vidc.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 820d98da3190..26fdf03ab972 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -303,6 +303,14 @@ static int iris_enum_framesizes(struct file *filp, void *fh,
 	return 0;
 }
 
+static int iris_querycap(struct file *filp, void *fh, struct v4l2_capability *cap)
+{
+	strscpy(cap->driver, IRIS_DRV_NAME, sizeof(cap->driver));
+	strscpy(cap->card, "Iris Decoder", sizeof(cap->card));
+
+	return 0;
+}
+
 static int iris_g_selection(struct file *filp, void *fh, struct v4l2_selection *s)
 {
 	struct iris_inst *inst = iris_get_inst(filp, NULL);
@@ -361,6 +369,7 @@ static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops = {
 	.vidioc_g_fmt_vid_out_mplane    = iris_g_fmt_vid_mplane,
 	.vidioc_enum_framesizes         = iris_enum_framesizes,
 	.vidioc_reqbufs                 = v4l2_m2m_ioctl_reqbufs,
+	.vidioc_querycap                = iris_querycap,
 	.vidioc_g_selection             = iris_g_selection,
 	.vidioc_subscribe_event         = iris_subscribe_event,
 	.vidioc_unsubscribe_event       = v4l2_event_unsubscribe,

-- 
2.34.1


