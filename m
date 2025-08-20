Return-Path: <linux-media+bounces-40374-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFFDB2D7FB
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 11:23:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C7121C42F7A
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 09:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68B272EFDA6;
	Wed, 20 Aug 2025 09:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="F5lxgSaG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE59D2EF643;
	Wed, 20 Aug 2025 09:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755680957; cv=none; b=ssJW3EWffoFPQjp0YYtto1zDoh2LuLxiTuTBliZzn/weBonXJXWhqpeJA2jyus+Jv//M3NzDoEmVm6D+gIoX8/V1tDbOx21bbOd5hq0S6pW2Bxm98k7MC9lGhhoWVMPwY5wfWMe0GGyiQguKkGc2BjD8smMmz2waS08cS/0n2IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755680957; c=relaxed/simple;
	bh=jTgyjmRWdvwFLDYo/EnarukGiilD70aFrmxWLVSEMls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=WLdQyHU3tRrggLwtb+XgwKXjJfmrw6xHNX0/OPL2aer+PxSvkPCH7eUBaJQxE4p4B9q8FtENv2vg24jQQtInUwtMiIy8YqPa2H6EfoEYl8jD+kHWCt5uY5ZQkFYf4QFO9GK8QGpkcC5iqzV5XvQvBVntUtGZ1UX1LbhXEny5mMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=F5lxgSaG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1oXeC002009;
	Wed, 20 Aug 2025 09:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JAnmxApjmy1Sz1VbaMRyRY06BZxWYYqRd2Gu+jZvXAs=; b=F5lxgSaGprZsYRYu
	LZ+BoBec8U7v3Xa4sr7EbKpq8b3+e1CqhDPwLm4Z/aiOh/gWyHKDSboWNZm7wy5R
	h2e4g3fQ4dW6oj9SGtiqJms8ohlI+aa3+u1SHcgjOAnVdyCWC7Eunxbb6hVWT1dJ
	Ym6+Y9t2d22kuH1JmJ1n/drcBqZXETxHEpIGsK1fYbHlNYyDRmmB4hlQk4kdnODD
	7TOIGZUW74pJLMV5DjTta8zzD8FAINaTtwyVhYla7YwCPo8aPz3ZIurpOFOpfZJe
	m97s0zqTNpbJp62AK0fFmfV/K0w+lfFa+b/ZP+QasFKRoquj1i6iR6zQZpVBDteC
	H1OuWA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n528s3qq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 09:09:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57K9994c002683
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 09:09:09 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 20 Aug 2025 02:09:05 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 20 Aug 2025 14:37:58 +0530
Subject: [PATCH v3 20/26] media: iris: Add support for G/S_PARM for encoder
 video device
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250820-iris-video-encoder-v3-20-80ab0ba58b3d@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755680867; l=13308;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=jTgyjmRWdvwFLDYo/EnarukGiilD70aFrmxWLVSEMls=;
 b=+dUPiuCDg/eEQMYknAvFsk9sw8EGMqCJtyDhHOYSIT+Kv8q8O/WMNMDE6EAsixUkmOPpjFS1Y
 vtqS+l5jOKTD2+wb5UWbg/ULp1mr1wAI3hbsbCP1n7AG3NMsofBlvxO
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=fpOFpF4f c=1 sm=1 tr=0 ts=68a590b6 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=oW_SD1oTPVrhALOFHK4A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: H8ugL649nMZ3o6g7XJke9B-vgGQxuru3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXyI22xEM2oj0U
 s036t+jc80gijTtbabYw+gXHbdyNBYSLIdj04KyMIxrEClrKD3hRyoyRde1GjTvfs2fZAbmnOQR
 +4jxkn3UtAF6mMDE0h8yhV5i9k2tdzHp9UUvEsFS/QVFcRCdEpinmNxOFGbmoGL2hM7B/EQ/mLE
 MwJzGmv9YZOwrUE1TfnurPM/UwMmFeYAueFjTq3psnPffR5ZEkd1BqcJxcjIj5IPwdV6/aJei6m
 GbaMqaaOqSCk/VZJsCVMykW8HiV9yy6iHyH/bWhPqXpmUtz2WBHQGtT2K4J5qP8NY6VFqGOzhkP
 PL4G3eACL7pkoOD9iqdmnxIOvDplsosNFi5Emu/9Vx9Cq4NAOeal6qQjrcesOg59Uk42sC2u+S2
 xuNV5QqI8ZgPCozS2n6DbpryS4s7Ag==
X-Proofpoint-ORIG-GUID: H8ugL649nMZ3o6g7XJke9B-vgGQxuru3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

Add supports for the G/S_PARM V4L2 ioctls for encoder video device with
necessary hooks. This allows userspace to query the current streaming
parameters such as frame intervals and set desired streaming parameters
primarily the frame rate.

Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_instance.h   |  5 ++
 .../platform/qcom/iris/iris_platform_common.h      |  2 +
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  2 +
 .../platform/qcom/iris/iris_platform_qcs8300.h     |  2 +
 .../platform/qcom/iris/iris_platform_sm8250.c      |  2 +
 drivers/media/platform/qcom/iris/iris_utils.c      | 36 +++++++++
 drivers/media/platform/qcom/iris/iris_utils.h      |  2 +
 drivers/media/platform/qcom/iris/iris_vb2.c        | 17 ----
 drivers/media/platform/qcom/iris/iris_venc.c       | 94 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_venc.h       |  2 +
 drivers/media/platform/qcom/iris/iris_vidc.c       | 30 +++++++
 11 files changed, 177 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index 55cf9702111829ef24189986ba5245c7684bfe11..b75549718df3c87cd85aecfc74c873c60cd4bde5 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -61,6 +61,9 @@ struct iris_fmt {
  * @metadata_idx: index for metadata buffer
  * @codec: codec type
  * @last_buffer_dequeued: a flag to indicate that last buffer is sent by driver
+ * @frame_rate: frame rate of current instance
+ * @operating_rate: operating rate of current instance
+
  */
 
 struct iris_inst {
@@ -96,6 +99,8 @@ struct iris_inst {
 	u32				metadata_idx;
 	u32				codec;
 	bool				last_buffer_dequeued;
+	u32				frame_rate;
+	u32				operating_rate;
 };
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 792f46e2e34fd564a1ed61523f72826fc8f74582..d0b84c93aef409b51a767ba11f91c6ce2533f27f 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -79,6 +79,8 @@ struct platform_inst_caps {
 	u32 mb_cycles_fw;
 	u32 mb_cycles_fw_vpp;
 	u32 num_comv;
+	u32 max_frame_rate;
+	u32 max_operating_rate;
 };
 
 enum platform_inst_fw_cap_type {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index d5f7eb904569d4e3ae9c33e1436c8151cac5355d..a245fce04b3a901cf2eb06fb35c15c0176199c11 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -209,6 +209,8 @@ static struct platform_inst_caps platform_inst_cap_sm8550 = {
 	.mb_cycles_fw = 489583,
 	.mb_cycles_fw_vpp = 66234,
 	.num_comv = 0,
+	.max_frame_rate = MAXIMUM_FPS,
+	.max_operating_rate = MAXIMUM_FPS,
 };
 
 static void iris_set_sm8550_preset_registers(struct iris_core *core)
diff --git a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
index a8d66ed388a34e6bb45d4a089d981bb7d135fb50..64331b705fca541e0547afc01ec108759529c9d8 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
@@ -197,4 +197,6 @@ static struct platform_inst_caps platform_inst_cap_qcs8300 = {
 	.mb_cycles_fw = 326389,
 	.mb_cycles_fw_vpp = 44156,
 	.num_comv = 0,
+	.max_frame_rate = MAXIMUM_FPS,
+	.max_operating_rate = MAXIMUM_FPS,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
index 2a3cbe1f2d4b27d3cce9e9cdad1525801d71a041..4ff72109c6001cc47d746d366f458c0ff0a8924a 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
@@ -40,6 +40,8 @@ static struct platform_inst_caps platform_inst_cap_sm8250 = {
 	.max_mbpf = 138240,
 	.mb_cycles_vsp = 25,
 	.mb_cycles_vpp = 200,
+	.max_frame_rate = MAXIMUM_FPS,
+	.max_operating_rate = MAXIMUM_FPS,
 };
 
 static void iris_set_sm8250_preset_registers(struct iris_core *core)
diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
index 83c70d6a2d9092615dcf1b7d0fc85110f0df1aa0..85c70a62b1fd2c409fc18b28f64771cb0097a7fd 100644
--- a/drivers/media/platform/qcom/iris/iris_utils.c
+++ b/drivers/media/platform/qcom/iris/iris_utils.c
@@ -88,3 +88,39 @@ struct iris_inst *iris_get_instance(struct iris_core *core, u32 session_id)
 	mutex_unlock(&core->lock);
 	return NULL;
 }
+
+int iris_check_core_mbpf(struct iris_inst *inst)
+{
+	struct iris_core *core = inst->core;
+	struct iris_inst *instance;
+	u32 total_mbpf = 0;
+
+	mutex_lock(&core->lock);
+	list_for_each_entry(instance, &core->instances, list)
+		total_mbpf += iris_get_mbpf(instance);
+	mutex_unlock(&core->lock);
+
+	if (total_mbpf > core->iris_platform_data->max_core_mbpf)
+		return -ENOMEM;
+
+	return 0;
+}
+
+int iris_check_core_mbps(struct iris_inst *inst)
+{
+	struct iris_core *core = inst->core;
+	struct iris_inst *instance;
+	u32 total_mbps = 0, fps = 0;
+
+	mutex_lock(&core->lock);
+	list_for_each_entry(instance, &core->instances, list) {
+		fps = max(instance->frame_rate, instance->operating_rate);
+		total_mbps += iris_get_mbpf(instance) * fps;
+	}
+	mutex_unlock(&core->lock);
+
+	if (total_mbps > core->iris_platform_data->max_core_mbps)
+		return -ENOMEM;
+
+	return 0;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_utils.h b/drivers/media/platform/qcom/iris/iris_utils.h
index 49869cf7a376880a026f44ff3883a6b13c6fcfbb..75740181122f5bdf93d64d3f43b3a26a9fe97919 100644
--- a/drivers/media/platform/qcom/iris/iris_utils.h
+++ b/drivers/media/platform/qcom/iris/iris_utils.h
@@ -49,5 +49,7 @@ struct iris_inst *iris_get_instance(struct iris_core *core, u32 session_id);
 void iris_helper_buffers_done(struct iris_inst *inst, unsigned int type,
 			      enum vb2_buffer_state state);
 int iris_wait_for_session_response(struct iris_inst *inst, bool is_flush);
+int iris_check_core_mbpf(struct iris_inst *inst);
+int iris_check_core_mbps(struct iris_inst *inst);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
index e62ed7a57df2debf0a930ad8307e6d945f589922..e32f7e1f007228a3b2b51cd76cd193d852f16080 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.c
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -12,23 +12,6 @@
 #include "iris_vdec.h"
 #include "iris_power.h"
 
-static int iris_check_core_mbpf(struct iris_inst *inst)
-{
-	struct iris_core *core = inst->core;
-	struct iris_inst *instance;
-	u32 total_mbpf = 0;
-
-	mutex_lock(&core->lock);
-	list_for_each_entry(instance, &core->instances, list)
-		total_mbpf += iris_get_mbpf(instance);
-	mutex_unlock(&core->lock);
-
-	if (total_mbpf > core->iris_platform_data->max_core_mbpf)
-		return -ENOMEM;
-
-	return 0;
-}
-
 static int iris_check_inst_mbpf(struct iris_inst *inst)
 {
 	struct platform_inst_caps *caps;
diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index 71960a0e903d114be7a9e797089c3dee2fab2545..967db02ed27f31498e0f5c3245a37473022f4be5 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -61,6 +61,9 @@ int iris_venc_inst_init(struct iris_inst *inst)
 	inst->crop.width = f->fmt.pix_mp.width;
 	inst->crop.height = f->fmt.pix_mp.height;
 
+	inst->operating_rate = DEFAULT_FPS;
+	inst->frame_rate = DEFAULT_FPS;
+
 	return 0;
 }
 
@@ -326,3 +329,94 @@ int iris_venc_s_selection(struct iris_inst *inst, struct v4l2_selection *s)
 		return -EINVAL;
 	}
 }
+
+int iris_venc_s_param(struct iris_inst *inst, struct v4l2_streamparm *s_parm)
+{
+	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
+	struct vb2_queue *src_q = v4l2_m2m_get_src_vq(inst->m2m_ctx);
+	struct vb2_queue *dst_q = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
+	struct v4l2_fract *timeperframe = NULL;
+	u32 default_rate = DEFAULT_FPS;
+	bool is_frame_rate = false;
+	u64 us_per_frame, fps;
+	u32 max_rate;
+
+	int ret = 0;
+
+	if (s_parm->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		timeperframe = &s_parm->parm.output.timeperframe;
+		max_rate = caps->max_operating_rate;
+		s_parm->parm.output.capability = V4L2_CAP_TIMEPERFRAME;
+	} else {
+		timeperframe = &s_parm->parm.capture.timeperframe;
+		is_frame_rate = true;
+		max_rate = caps->max_frame_rate;
+		s_parm->parm.capture.capability = V4L2_CAP_TIMEPERFRAME;
+	}
+
+	if (!timeperframe->denominator || !timeperframe->numerator) {
+		if (!timeperframe->numerator)
+			timeperframe->numerator = 1;
+		if (!timeperframe->denominator)
+			timeperframe->denominator = default_rate;
+	}
+
+	us_per_frame = timeperframe->numerator * (u64)USEC_PER_SEC;
+	do_div(us_per_frame, timeperframe->denominator);
+
+	if (!us_per_frame)
+		return -EINVAL;
+
+	fps = (u64)USEC_PER_SEC;
+	do_div(fps, us_per_frame);
+	if (fps > max_rate) {
+		ret = -ENOMEM;
+		goto reset_rate;
+	}
+
+	if (is_frame_rate)
+		inst->frame_rate = (u32)fps;
+	else
+		inst->operating_rate = (u32)fps;
+
+	if ((s_parm->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE && vb2_is_streaming(src_q)) ||
+	    (s_parm->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE && vb2_is_streaming(dst_q))) {
+		ret = iris_check_core_mbpf(inst);
+		if (ret)
+			goto reset_rate;
+		ret = iris_check_core_mbps(inst);
+		if (ret)
+			goto reset_rate;
+	}
+
+	return 0;
+
+reset_rate:
+	if (ret) {
+		if (is_frame_rate)
+			inst->frame_rate = default_rate;
+		else
+			inst->operating_rate = default_rate;
+	}
+
+	return ret;
+}
+
+int iris_venc_g_param(struct iris_inst *inst, struct v4l2_streamparm *s_parm)
+{
+	struct v4l2_fract *timeperframe = NULL;
+
+	if (s_parm->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		timeperframe = &s_parm->parm.output.timeperframe;
+		timeperframe->numerator = 1;
+		timeperframe->denominator = inst->operating_rate;
+		s_parm->parm.output.capability = V4L2_CAP_TIMEPERFRAME;
+	} else {
+		timeperframe = &s_parm->parm.capture.timeperframe;
+		timeperframe->numerator = 1;
+		timeperframe->denominator = inst->frame_rate;
+		s_parm->parm.capture.capability = V4L2_CAP_TIMEPERFRAME;
+	}
+
+	return 0;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_venc.h b/drivers/media/platform/qcom/iris/iris_venc.h
index 72c6e25d87113baa6d2219ae478b7d7df1aed7bf..0d566b7fc89b96b8fbc62a35b2ba795ca0bcf460 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.h
+++ b/drivers/media/platform/qcom/iris/iris_venc.h
@@ -16,5 +16,7 @@ int iris_venc_s_fmt(struct iris_inst *inst, struct v4l2_format *f);
 int iris_venc_validate_format(struct iris_inst *inst, u32 pixelformat);
 int iris_venc_subscribe_event(struct iris_inst *inst, const struct v4l2_event_subscription *sub);
 int iris_venc_s_selection(struct iris_inst *inst, struct v4l2_selection *s);
+int iris_venc_g_param(struct iris_inst *inst, struct v4l2_streamparm *s_parm);
+int iris_venc_s_param(struct iris_inst *inst, struct v4l2_streamparm *s_parm);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index b134ae710d9e1d02bc52db2e9356fdc4f668a387..6e3bd02afe44534a8f36cc22d9c8cda4a53a05cd 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -530,6 +530,34 @@ static int iris_subscribe_event(struct v4l2_fh *fh, const struct v4l2_event_subs
 	return -EINVAL;
 }
 
+static int iris_s_parm(struct file *filp, void *fh, struct v4l2_streamparm *a)
+{
+	struct iris_inst *inst = container_of(fh, struct iris_inst, fh);
+
+	if (a->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
+	    a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+		return -EINVAL;
+
+	if (inst->domain == ENCODER)
+		return iris_venc_s_param(inst, a);
+	else
+		return -EINVAL;
+}
+
+static int iris_g_parm(struct file *filp, void *fh, struct v4l2_streamparm *a)
+{
+	struct iris_inst *inst = container_of(fh, struct iris_inst, fh);
+
+	if (a->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
+	    a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+		return -EINVAL;
+
+	if (inst->domain == ENCODER)
+		return iris_venc_g_param(inst, a);
+	else
+		return -EINVAL;
+}
+
 static int iris_dec_cmd(struct file *filp, void *fh,
 			struct v4l2_decoder_cmd *dec)
 {
@@ -626,6 +654,8 @@ static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops_enc = {
 	.vidioc_unsubscribe_event       = v4l2_event_unsubscribe,
 	.vidioc_g_selection             = iris_g_selection,
 	.vidioc_s_selection             = iris_s_selection,
+	.vidioc_s_parm                  = iris_s_parm,
+	.vidioc_g_parm                  = iris_g_parm,
 };
 
 void iris_init_ops(struct iris_core *core)

-- 
2.34.1


