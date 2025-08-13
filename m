Return-Path: <linux-media+bounces-39775-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 725C2B245C6
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 11:44:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B51007AECA8
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 09:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08A1F307AF0;
	Wed, 13 Aug 2025 09:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="H0lrkRji"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2A72F49F7;
	Wed, 13 Aug 2025 09:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755077974; cv=none; b=EyI0Q+ZhONYP1dCY0CL9YCvUAdSVQFNIM34qMo70hWr9qzi9F4BNXE4x+z4MDFkC34KBfVMtEgbDa/fymjxDC9yJKA4DTIv8XJjv/K0CKEYrN4WEgy2Lifj2gXPC5xPcIQkqevscrHPuEfzhwD1nYb5QlWXC6INjIEDh3w46sRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755077974; c=relaxed/simple;
	bh=O6fT+Wjx1gCMp4s6zIhIIT1vw8HZ8J9TZiY8TnfRmP0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Qpv1N8/AmnPEVVDNVF7YJ8wgCwNGsETithV/CJ5H8I+e8MwOvUDBj8/DBz5hnAIsEP3KZ2P5ulScmo8PXxp4vMYsxLb5zXTj97IQApt2q13fGDdb3n5CwN4QaZehdb6/3mQrQBjffF5ZTRW4WLn1Fu/5TmrA8WrwMw/GDAbcrHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=H0lrkRji; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D6memT026744;
	Wed, 13 Aug 2025 09:39:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dgLZd8mLc3Reu4GRgWLyqO+cn9WvO0Zv5TVWNqBXudc=; b=H0lrkRjisQAvkuuV
	s0Qj4MGuOCh0tVwcX14ys9OD/ARfuFrAZeur9T+sX1LrTYdYlQV1fW1ndS5eMQsM
	b2Bz48RyYz/w83CF/zvd1KyNqRN1gGtgsHih3JPZAzs42QWmawABSIh16wXPc7nB
	RVqz0Okh2Juf1mJPT8Yv4+wO9jitaWO/OSlMqS5cF4h+juV6VyD/+egw4Zn04iqw
	oEAA1BjMg8CLPdwPzW5sP+tNPrnvZCDC7kJRHuVSNUukKb6ykV/f5NAMMbD1p6c5
	4fMBUP4Mo4YE1PkEHEnPQYu4zZgk6UnC0fb6ADXkItnSkpAB9qA136ulve/aKhvD
	voy7SQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9sugpk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 09:39:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57D9dR0E001250
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 09:39:27 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 13 Aug 2025 02:39:23 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 13 Aug 2025 15:08:07 +0530
Subject: [PATCH v2 17/24] media: iris: Add support for G/S_SELECTION for
 encoder video device
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250813-iris-video-encoder-v2-17-c725ff673078@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755077896; l=5469;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=O6fT+Wjx1gCMp4s6zIhIIT1vw8HZ8J9TZiY8TnfRmP0=;
 b=Y1HvzlslPuqx55RyDMEYFPR/KIYBOXA5RHwCCx0EcJ4Oigy/ohFJ9X2rgzvUxDPrrfCEyutPO
 zhJMUP+ORPZB17QqpRqIT/MYIpDfpGKQrX7NxO8TC/0Ci5V/JOX+4yJ
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=689c5d50 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=HMXTeDd-yh4hRLGjqV0A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 0sFLLAwkV8N1Tprjbwz3TMzMOCB4wmQZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfX1dTLdTmyCvGA
 hmGjdtO5D/RzG2U3Xnhws91GmekjxosMe19Yh+7w/FH66Vo3uw8oekZ9uNDUA3eAFrOC5eDIvWD
 zANZieRgOZR/Y8+/e/5lLlKYNxTQ7FGzs26aXoEH7rucWUIkOhdoZrX174hDF2XF9WOzZ5JxEju
 g2K/TCxi7HWxorP1ir/Q7pUlaX2D+LpPxicqpOeS4qlMei+E36y9EDn7SfIXhmxjO1rolXRsk5F
 roT0fn7cih5Pt/A3XJcFjQ8pUd+3S+05yfDaB0aNwcpz8Xc5mkXd+BQ5Mp9iacz2K0GLZ/5tmtC
 Vhmlu1seQdSYKlUJVn0CrL2t1yKvmzmjt7bnol0CmwvdYX0f9wFdeMtc9kpZrJH6A2TZ5kTf0VY
 WGHvGtz6
X-Proofpoint-GUID: 0sFLLAwkV8N1Tprjbwz3TMzMOCB4wmQZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015

Add support for G/S_SELECTION V4L2 ioctls for the encoder video
device with necessary hooks. This allows userspace to query and
configure rectangular selection areas such as crop.

Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
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


