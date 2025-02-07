Return-Path: <linux-media+bounces-25765-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8A7A2BD33
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 09:00:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F6EE3A8EA0
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 08:00:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1632623CEE0;
	Fri,  7 Feb 2025 07:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="N17W3EXE"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C47E23C36C;
	Fri,  7 Feb 2025 07:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738915016; cv=none; b=hcTi/SPHSlQ1cmS3qv4w99GNaz37aEW6wX3uvS+yeB8+GIDtuknjtFDnWKZDBotO2BJAZuUZXpzYvKEJYtnbGY/aRhjg+v11C5GypB3v4l4hrK4yVqZuZhDvIKUV/E9mMCVzjzkp1iyo6Yd1bEAtAfiNx5RYKc3IBhCUCjkHXJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738915016; c=relaxed/simple;
	bh=ypnSGcff52MxR6I3AReMIT0RLmyB38HaZDqVcXVXTT8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=uOg+buJEmAyWyO2LVjp/C/NBNQVx5YB87kwkvaatWlIn1tyBzqF3A6+Y0DioUENuIHLFqkM1BXvPmjiGrpBWefMM1FT6lrnmanm0+Y51OaJdiIYBEBuN4LnzqncvG8VkJ/qAm6ovf277pG/cy5m9jtj1nGiBi72qCANHFnbh254=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=N17W3EXE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51770llQ015199;
	Fri, 7 Feb 2025 07:56:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aYj4c+drkttt6EVgc///D3ckKhrTSSxPMYRTqN/gRKQ=; b=N17W3EXEab2igeDP
	sW5n33iJpVYW9CEupAb0IIu+9hVkG9fRwB5uD/QJovL6uVzUQnmORxbnP8SLRfiR
	lJpB5S1VkaOxL52Zf3/STlOgQqTIe4gDdsRpJqa2X0H1Np6YHXicF0BPm6xMXsI5
	7/4NBWxxPSWIAardJhKMSCfKp4S/TvrsKPnhRwcSVD3xB9nu6yClydPQTQbTuhNX
	8hl7BucLVVI/wiy08fVPQD1eREv2FV3PPnxCOIMlz1J7HxPcK9eVDNmiO4Co8H2d
	q45XIxJGQlcgnOuerm64PXSZLCo5+yLGy3lNUQEG+qH5pfRaEYB2oOqrohxZiD1X
	RGF4cA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44nddm84d0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Feb 2025 07:56:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5177udVV031480
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Feb 2025 07:56:39 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 6 Feb 2025 23:56:33 -0800
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 7 Feb 2025 13:24:55 +0530
Subject: [PATCH v10 15/28] media: iris: implement query_cap ioctl
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250207-qcom-video-iris-v10-15-ab66eeffbd20@quicinc.com>
References: <20250207-qcom-video-iris-v10-0-ab66eeffbd20@quicinc.com>
In-Reply-To: <20250207-qcom-video-iris-v10-0-ab66eeffbd20@quicinc.com>
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
        Jianhua Lu <lujianhua000@gmail.com>,
        "Stefan
 Schmidt" <stefan.schmidt@linaro.org>,
        Joel Stanley <joel@jms.id.au>, "Johan
 Hovold" <johan@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Vedang Nagar <quic_vnagar@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738914893; l=1840;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=Wia9U6nrvHa1GQBYuE3MwNdupxy/J3tmecBZa3UaJrc=;
 b=bV/co1aS4bx4gP7meOQSbPeLHsZBckhrAXSzYRf+gf2ChoscfbsH+xaQgFP037uJorFUY4kn3
 JlWEtCMW1OWCS8YKBP6Yj5RQ4pqHcIv+PnrIyMwPsiLBD1YFyi+a/0L
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: wG5AdwXgAezUNA-EhLR4ICLEy_xFE1V5
X-Proofpoint-ORIG-GUID: wG5AdwXgAezUNA-EhLR4ICLEy_xFE1V5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_03,2025-02-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 mlxlogscore=999 adultscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 mlxscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502070060

From: Vedang Nagar <quic_vnagar@quicinc.com>

Implement the query_cap ioctl with the necessary hooks.

Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
Reviewed-by: Hans Verkuil <hverkuil@xs4all.nl>
Tested-by: Stefan Schmidt <stefan.schmidt@linaro.org> # x1e80100 (Dell XPS 13 9345)
Reviewed-by: Stefan Schmidt <stefan.schmidt@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_vidc.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 90e70aa8eedf..5b54231f2def 100644
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


