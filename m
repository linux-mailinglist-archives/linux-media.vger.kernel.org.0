Return-Path: <linux-media+bounces-36783-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E134AAF8A80
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 10:02:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D52821CA348A
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 08:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A5152DCC02;
	Fri,  4 Jul 2025 07:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="icgw9/5y"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3ACF2D97BE;
	Fri,  4 Jul 2025 07:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615672; cv=none; b=Ri6QsMSl27fSCdKcM0p64LBIPAV4868dHk3639jg4oyJSZc/3vBwZOIz2XudlVn2xZIIHMuP4eN3irj1OnMF0Aunp5AvX/Uqq+jo74Lixgh8LEpIdFl/v13SDUHXrYaRjmx3tj394QIAkGx+17E1Sfk8QE+zsiRPcL8RVzq3Byo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615672; c=relaxed/simple;
	bh=s5EcbUknkQfTe70BqoXoFc1adqDtlQbwQUL/1RUlW2k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=aSRvKxQ20/FGRckHwA0c8pTiTJ8pkF15z7ysxedZ6u8vKJHA/bDRQdryvLXC9NGbEZycZfFBKQ+/e3ShSD6nbx23qbyIxR+mfGiotB5+DtaR+fNZGOTj+kSNiblUhikDnvcuES9t6QyCPZ+IBUbONl5QzbRCOY5chXgvrACcLTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=icgw9/5y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563IctQO029572;
	Fri, 4 Jul 2025 07:54:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bUAvhVvnBbbYgy9q0mHdzebSgGWDOX2R719IRsy1Ogc=; b=icgw9/5ybqA7/ei2
	FqITrI+8NDGHrGpZhfRVuLDtXjgSUWdTsB6Yyz7EOZknQQOTvw4Lfe9llRt6Du9y
	UigmBh/XOZ95Mnm0EJt57TtDTX/TDZvn2JSHJfHBGSJ7lBtHcldQYfso8PziNr3E
	mZs+PafU4WMrLqjzEvpqnFpu/18JMQM2VzbXsYjQWP4Qwy3Fh9x6oUy3KFFxs3BF
	nobkCSlEoGgUzbTeP3zxgVD5O6OpEX92eR/OsUdTpP3N0SYeCCCzrz5D3L7gIkSr
	5AhBdjE6b9HqMLRd5H9yjS5zBgKwSirRutgmH5nItFv9fjhf2wA5gwOM7qLniSQZ
	gxZ/1Q==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47nh9s4bv9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 07:54:24 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5647sO23002082
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Jul 2025 07:54:24 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 4 Jul 2025 00:54:20 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 4 Jul 2025 13:23:18 +0530
Subject: [PATCH 18/25] media: iris: Add support for G/S_SELECTION for
 encoder video device
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250704-iris-video-encoder-v1-18-b6ce24e273cf@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751615599; l=5403;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=s5EcbUknkQfTe70BqoXoFc1adqDtlQbwQUL/1RUlW2k=;
 b=pPLUCcxCPz40tNk/Zu5WqNQqH0IAc4ky00+3VnoEFnyf9Wwe2bBYbjMIrLXs1Zd1rXjzSQyHq
 vMaaScwzBmuCtumpXJz+205T6wM+cDNnKAGINLgPMfXVMKGZ5MVQ3OP
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=frrcZE4f c=1 sm=1 tr=0 ts=686788b0 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=HMXTeDd-yh4hRLGjqV0A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA2MCBTYWx0ZWRfX0wbFOIm2ygyv
 vQKv1PsELq/Ma4Ss5K8K5w2cPwthIr4ECqTznfHPcK/ZIhC7FPEKx34IUKLplomXvZy2Z9mw1JA
 ELWPK6zsCKlNbvSgK4Vg1MvKnSvNww9FrwCIhoD2PbaYli3r8qMBtJCaeb27aQt+WJmt6LvtaQG
 q0/hXKiFLlUpowy2y5hUADvuxLBjS78vE08HI3jvUyClUTmTFlAjUsotZw8K7aBZOY4O9KSlaDn
 lArN6IeDTvuMo+0NeI/moDXJgIYWIotuuWFEUOYqSIw6fSzdExysQXiHqB7IAkBf1vpy8xjdA6P
 qkX5qoAt1Lo7bEOPRRcXfvIXXJAkSAOP/ndAPIAEQW5Ss32p5xxlEjPL5UlwL33GYO7SzKGEeek
 55XyIvnpNV2kwQolj+6q2UO4fVchQOa7EU2nfdxg41QCoS0utC+I6ZPdvtqHniO2+nrcf8om
X-Proofpoint-GUID: pOqOPl39xmFrlXKIve8JuIZfMvkzq0yb
X-Proofpoint-ORIG-GUID: pOqOPl39xmFrlXKIve8JuIZfMvkzq0yb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 adultscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040060

Add support for G/S_SELECTION V4L2 ioctls for the encoder video
device with necessary hooks. This allows userspace to query and
configure rectangular selection areas such as crop.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_venc.c | 28 ++++++++++++
 drivers/media/platform/qcom/iris/iris_venc.h |  1 +
 drivers/media/platform/qcom/iris/iris_vidc.c | 65 ++++++++++++++++++++++------
 3 files changed, 80 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index 3dbcce23cbe94cf0edc4421694a3ba11faa5eb96..930f5afe9489d01be193f1dbe429d33f5401b468 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -297,3 +297,31 @@ int iris_venc_subscribe_event(struct iris_inst *inst,
 		return -EINVAL;
 	}
 }
+
+int iris_venc_s_selection(struct iris_inst *inst, struct v4l2_selection *s)
+{
+	if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
+		return -EINVAL;
+
+	switch (s->target) {
+	case V4L2_SEL_TGT_CROP:
+		s->r.left = 0;
+		s->r.top = 0;
+
+		if (s->r.width > inst->fmt_src->fmt.pix_mp.width ||
+		    s->r.height > inst->fmt_src->fmt.pix_mp.height)
+			return -EINVAL;
+
+		inst->crop.left = s->r.left;
+		inst->crop.top = s->r.top;
+		inst->crop.width = s->r.width;
+		inst->crop.height = s->r.height;
+		inst->fmt_dst->fmt.pix_mp.width = inst->crop.width;
+		inst->fmt_dst->fmt.pix_mp.height = inst->crop.height;
+		return iris_venc_s_fmt_output(inst, inst->fmt_dst);
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_venc.h b/drivers/media/platform/qcom/iris/iris_venc.h
index 2d9614ae18e8a2318df6673fbeae5ee33c99b596..72c6e25d87113baa6d2219ae478b7d7df1aed7bf 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.h
+++ b/drivers/media/platform/qcom/iris/iris_venc.h
@@ -15,5 +15,6 @@ int iris_venc_try_fmt(struct iris_inst *inst, struct v4l2_format *f);
 int iris_venc_s_fmt(struct iris_inst *inst, struct v4l2_format *f);
 int iris_venc_validate_format(struct iris_inst *inst, u32 pixelformat);
 int iris_venc_subscribe_event(struct iris_inst *inst, const struct v4l2_event_subscription *sub);
+int iris_venc_s_selection(struct iris_inst *inst, struct v4l2_selection *s);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index d8c94074153e9b1ceac4f911210ddbf89bbe3533..2074682a35fd1c4c9f5d29fdaee3392d98bf8923 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -462,29 +462,64 @@ static int iris_g_selection(struct file *filp, void *fh, struct v4l2_selection *
 {
 	struct iris_inst *inst = iris_get_inst(filp, NULL);
 
-	if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
+	if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE &&
+	    inst->domain == DECODER)
 		return -EINVAL;
 
-	switch (s->target) {
-	case V4L2_SEL_TGT_CROP_BOUNDS:
-	case V4L2_SEL_TGT_CROP_DEFAULT:
-	case V4L2_SEL_TGT_CROP:
-	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
-	case V4L2_SEL_TGT_COMPOSE_PADDED:
-	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
-	case V4L2_SEL_TGT_COMPOSE:
+	if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT &&
+	    inst->domain == ENCODER)
+		return -EINVAL;
+
+	if (inst->domain == DECODER) {
+		switch (s->target) {
+		case V4L2_SEL_TGT_CROP_BOUNDS:
+		case V4L2_SEL_TGT_CROP_DEFAULT:
+		case V4L2_SEL_TGT_CROP:
+		case V4L2_SEL_TGT_COMPOSE_BOUNDS:
+		case V4L2_SEL_TGT_COMPOSE_PADDED:
+		case V4L2_SEL_TGT_COMPOSE_DEFAULT:
+		case V4L2_SEL_TGT_COMPOSE:
+			s->r.left = inst->crop.left;
+			s->r.top = inst->crop.top;
+			s->r.width = inst->crop.width;
+			s->r.height = inst->crop.height;
+			break;
+		default:
+			return -EINVAL;
+		}
+	} else if (inst->domain == ENCODER) {
+		switch (s->target) {
+		case V4L2_SEL_TGT_CROP_BOUNDS:
+		case V4L2_SEL_TGT_CROP_DEFAULT:
+			s->r.width = inst->fmt_src->fmt.pix_mp.width;
+			s->r.height = inst->fmt_src->fmt.pix_mp.height;
+			break;
+		case V4L2_SEL_TGT_CROP:
+			s->r.width = inst->crop.width;
+			s->r.height = inst->crop.height;
+			break;
+		default:
+			return -EINVAL;
+		}
 		s->r.left = inst->crop.left;
 		s->r.top = inst->crop.top;
-		s->r.width = inst->crop.width;
-		s->r.height = inst->crop.height;
-		break;
-	default:
-		return -EINVAL;
 	}
 
 	return 0;
 }
 
+static int iris_s_selection(struct file *filp, void *fh, struct v4l2_selection *s)
+{
+	struct iris_inst *inst = iris_get_inst(filp, NULL);
+
+	if (inst->domain == DECODER)
+		return -EINVAL;
+	else if (inst->domain == ENCODER)
+		return iris_venc_s_selection(inst, s);
+
+	return -EINVAL;
+}
+
 static int iris_subscribe_event(struct v4l2_fh *fh, const struct v4l2_event_subscription *sub)
 {
 	struct iris_inst *inst = container_of(fh, struct iris_inst, fh);
@@ -591,6 +626,8 @@ static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops_enc = {
 	.vidioc_querycap                = iris_querycap,
 	.vidioc_subscribe_event         = iris_subscribe_event,
 	.vidioc_unsubscribe_event       = v4l2_event_unsubscribe,
+	.vidioc_g_selection             = iris_g_selection,
+	.vidioc_s_selection             = iris_s_selection,
 };
 
 void iris_init_ops(struct iris_core *core)

-- 
2.34.1


