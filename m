Return-Path: <linux-media+bounces-40373-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 672A0B2D7F6
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 11:23:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78B011883114
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 09:17:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D26882EE27C;
	Wed, 20 Aug 2025 09:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="K3YxA9Mm"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72DA2DEA80;
	Wed, 20 Aug 2025 09:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755680953; cv=none; b=e5QX3Dbbsp7DFcBpR14WNkMQHPTVuYDYlYXM8bQKgcjQSpxhGyheGgvQicjZjKGyVOZUdjUrMhxrCG9SeDDZhfGhWMcOj0LpY6MVB3MNbrsKPfiaLeyHyhbPuX1r6mZTx1ndBJ3TR1ioIRAYYb/av2thH34Rgpnp/Xos0rTRHeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755680953; c=relaxed/simple;
	bh=sXXGwLvcAjvCXF8GkwRJ2vwbzZfoQXdBAH1SWxXTVY0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=S+Z6lLZSjWpKUVhX3lE5HxUIuVZ/i+MA8x5vWEcCpAn2w2Va0UaNWVWaC/0FHsOm3CUGe5x+pDXfFJjKoVMASVSqOuPRd+EJPE1O6eEFuSC6taXEK0PLj3bK89WCR30HLbWFDeToMomIT5J2bak/1YcZUJUQB6GwV/S3Xuk7oeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=K3YxA9Mm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1p2cF027095;
	Wed, 20 Aug 2025 09:09:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NExXeHebTM038r2CtTsX9US/S/+F7jB75FJmx+LIQcs=; b=K3YxA9MmTXBamBeL
	CJRLkm262tLN7Iua15YZRc9dBAsJyH85OjWHXKUHuUmeIexYGSjgmyz00eRYNhdO
	pFt7duj3XyPNhPffr6UPprDa7qC6Xey/l7AZo9Ti3mjq5A4SIPEXoIZjtq1yEOzn
	EMVAVlT/AZb0J1+fpNQVJK/i+oSHFQIT0zoCJNqgStJKd9PEGUkq9sp8eNYwd5Pr
	UDoZpj3Vud1V47rfSybMauAzoU+KNlCcCtGkAwnTU8fMmU05ythHJC+I61lWdL/r
	HDlF+DGthY7MffIUK1VMxGZcOhrvCFP5Z5+1DxadLvI/cYT0bJAThzrREHJk6QiW
	XnyC8w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52a94wn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 09:09:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57K995c0023347
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 09:09:06 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 20 Aug 2025 02:09:01 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 20 Aug 2025 14:37:57 +0530
Subject: [PATCH v3 19/26] media: iris: Add support for G/S_SELECTION for
 encoder video device
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250820-iris-video-encoder-v3-19-80ab0ba58b3d@quicinc.com>
References: <20250820-iris-video-encoder-v3-0-80ab0ba58b3d@quicinc.com>
In-Reply-To: <20250820-iris-video-encoder-v3-0-80ab0ba58b3d@quicinc.com>
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
	<quic_dikshita@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755680867; l=5497;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=sXXGwLvcAjvCXF8GkwRJ2vwbzZfoQXdBAH1SWxXTVY0=;
 b=BrSMuiEqqKw2kYhAB2jtCOG4SiWaVy2YFr72yTvrveFp8dLklCTDkhyC5G+lo5WvOgNgXlH5X
 LmbV18FIJJSDCbK6tqETkCavR+SyWXW5KyOAmgAaJO4eRKUimrW0iM0
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _jqvoUx2ZgdZcFhUSp_zs1eMx5XaxM9N
X-Authority-Analysis: v=2.4 cv=B83gEOtM c=1 sm=1 tr=0 ts=68a590b2 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=HMXTeDd-yh4hRLGjqV0A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: _jqvoUx2ZgdZcFhUSp_zs1eMx5XaxM9N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX+jAdAJPKV0uN
 hUzPPApw35qSbMkrm5cjFD4axqTjVA3jMQNbTOsvo80Dg37QaZUFeFhnWQhM7LUE35ebXeQjOd5
 /LaihNHNhd4gYriLMKQk8Kh5v5shRng1xWlS2kAXqDILpJ/cWMnrPSZyNAm9RL2H9SElIeK7Hb2
 GgNPN720WkvupJVq+PmlBbXfu5fyEvNGdnc4a79e981J0HdU71ypRLwrnyntbvmgGW9T3EgC3My
 AxzQjsbkhXQYzk6cSZTWW4P4m4p/iq3i8F/qb19HdIbuXz7oryL7kym2oSr6veg9TIWILLgveaq
 UnFB2raGzc5hIV2O1QQ4TRTVMG5NBqpzkyDi3LvtVMPy0GBDJZg9zXepipyOIysqlbvpKbmagOA
 tZLzmURFklN0x/8M16O+KHVUt5NUMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

Add support for G/S_SELECTION V4L2 ioctls for the encoder video
device with necessary hooks. This allows userspace to query and
configure rectangular selection areas such as crop.

Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_venc.c | 26 +++++++++++
 drivers/media/platform/qcom/iris/iris_venc.h |  1 +
 drivers/media/platform/qcom/iris/iris_vidc.c | 65 ++++++++++++++++++++++------
 3 files changed, 78 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index 384b30555546f2a0677e49400f177b96611f866b..71960a0e903d114be7a9e797089c3dee2fab2545 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -300,3 +300,29 @@ int iris_venc_subscribe_event(struct iris_inst *inst,
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
index 5d9b36858e9317b1eddac12004432229e18967a7..b134ae710d9e1d02bc52db2e9356fdc4f668a387 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -460,29 +460,64 @@ static int iris_g_selection(struct file *filp, void *fh, struct v4l2_selection *
 {
 	struct iris_inst *inst = iris_get_inst(filp);
 
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
+	struct iris_inst *inst = iris_get_inst(filp);
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
@@ -589,6 +624,8 @@ static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops_enc = {
 	.vidioc_querycap                = iris_querycap,
 	.vidioc_subscribe_event         = iris_subscribe_event,
 	.vidioc_unsubscribe_event       = v4l2_event_unsubscribe,
+	.vidioc_g_selection             = iris_g_selection,
+	.vidioc_s_selection             = iris_s_selection,
 };
 
 void iris_init_ops(struct iris_core *core)

-- 
2.34.1


