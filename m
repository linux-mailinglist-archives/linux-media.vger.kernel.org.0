Return-Path: <linux-media+bounces-41653-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9B8B41B23
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 12:06:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10A54189620D
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 10:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FC2E2E8B86;
	Wed,  3 Sep 2025 10:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FsdMXoJp"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6FC2AE66;
	Wed,  3 Sep 2025 10:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756893992; cv=none; b=H/XyhomJYX1DV/3d2GttNaTqW+CiBhEvNP6pa01LstH4MFWGcUyUG0f7B++hSN879z1Rmsnm1poQ0GYeKi43kgyIm8PeLU938aaftwGoiWj3qoBiUq9LqC0CcgXAj88uBU4jKw3jM/ORc0km+sdpPl+iPLe8uu13AFd4F6qxfac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756893992; c=relaxed/simple;
	bh=BFx8u1TPCmyaJV2ApccXZcWZPkBaGamkU4QcZBpeLUM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=erPVB+tCVjkEQUgpzyDrtyBdzDAmeoBPK9lpTq4Mh6SZDvrdbEwCPXVvMlZ//rUlWyQZs/sedfmTfFocGuwCCSv3xT47zwE4XDpdth0nbzwrRqaVqKum/8wrMmiX2WyO/duTorSpFS+m3Z12TUSB0cCYMHlimzT4MsuLLDAIr7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FsdMXoJp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58322TYb019738;
	Wed, 3 Sep 2025 10:06:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gR4bFFz7DXhzcsWA7MQiQDawz6VXV7VQGrrDugScKnE=; b=FsdMXoJpydmzn4hf
	/GZ1h7WvaxQ7h4V9FTyrjbqwvPNMsrDjWYVbwvcCGTKglftAYqsImSjRuJK/uwMJ
	F/mMPyadoPZosz1Y8nGLuQoOL3zddAe/QuDr8nhReNc0WtxGWDXr36NTe+tl55ss
	7EPYVTudvHM5PF7me/cWxeBx7F9ecGp6AvYUPZSvi1F0bBafnl7CGJVyYrxc6TZz
	ZBiFZj+8kbpOGt7oDs5QSUkosAG3oTjMpKjxX2yfUPykXV2bkq6mIeQMDuhfW8An
	wvZNpEhoDmKbaYMlnJ9D2xAG8ppqwwyGos09M4sS9l9Xf7sHQlM4fr0w8EnN62in
	l0g+VQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw03722-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 10:06:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 583A6Gmp024118
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Sep 2025 10:06:16 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Wed, 3 Sep 2025 03:06:10 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
To: <quic_vgarodia@quicinc.com>, <abhinav.kumar@linux.dev>,
        <bryan.odonoghue@linaro.org>, <mchehab@kernel.org>,
        <stefan.schmidt@linaro.org>, <quic_vnagar@quicinc.com>,
        <hverkuil@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_renjiang@quicinc.com>,
        <quic_wangaow@quicinc.com>, <neil.armstrong@linaro.org>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>
Subject: [PATCH v4.1 20/26] media: iris: Add support for G/S_PARM for encoder video device
Date: Wed, 3 Sep 2025 15:35:40 +0530
Message-ID: <20250903100540.1963414-1-quic_dikshita@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250825-iris-video-encoder-v4-20-84aa2bc0a46b@quicinc.com>
References: <20250825-iris-video-encoder-v4-20-84aa2bc0a46b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: NtXBdSySEFl_f0lddPNxTqgzYCxO2SsS
X-Proofpoint-ORIG-GUID: NtXBdSySEFl_f0lddPNxTqgzYCxO2SsS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX8zGlIXlONUYB
 V+YtzqP9HijRKvUAtnMNNA1kxfjST5P2k7XdyTUojJTyr8FeCmSX7XF8BlgDQTc6Fc5xz3EWYfV
 ECpaAglh2qqf0Y6a0UIueleWgihxKRFQpTiqY5Hazli3gGCAVKmNnv9dgU2AoFaOcBwVSg7oz59
 RnU46UG9cp80MiROLIyE2S4iLFxog7yGHwwvro7gg7BIN4kkUjHZlLO3EzvicyjnmWMV22IrgPV
 QhRwWlI4bKh518mAx5/GOD/wyFqXBy1FSdkJG70f6+HzK82HNxtaufofuWH9FPlwox2bItMbaFq
 bZOBkhSqphVDK8hEPGuOpT8O6YCzpeas4fz4a6VtrJMWoL0qqrCuxXP4nHODCNYL1hQJj5ASYw+
 E5hIAJGh
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b81319 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=oW_SD1oTPVrhALOFHK4A:9 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027

Add supports for the G/S_PARM V4L2 ioctls for encoder video device with
necessary hooks. This allows userspace to query the current streaming
parameters such as frame intervals and set desired streaming parameters
primarily the frame rate.

Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
changes since v4:
- fix incorrect retrieval of the iris_inst structure in iris_g/s_parm.

 .../media/platform/qcom/iris/iris_instance.h  |  5 +
 .../platform/qcom/iris/iris_platform_common.h |  2 +
 .../platform/qcom/iris/iris_platform_gen2.c   |  2 +
 .../qcom/iris/iris_platform_qcs8300.h         |  2 +
 .../platform/qcom/iris/iris_platform_sm8250.c |  2 +
 drivers/media/platform/qcom/iris/iris_utils.c | 36 +++++++
 drivers/media/platform/qcom/iris/iris_utils.h |  2 +
 drivers/media/platform/qcom/iris/iris_vb2.c   | 17 ----
 drivers/media/platform/qcom/iris/iris_venc.c  | 94 +++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_venc.h  |  2 +
 drivers/media/platform/qcom/iris/iris_vidc.c  | 30 ++++++
 11 files changed, 177 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index 55cf97021118..b75549718df3 100644
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
index 792f46e2e34f..d0b84c93aef4 100644
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
index d5f7eb904569..a245fce04b3a 100644
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
index a8d66ed388a3..64331b705fca 100644
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
index 2a3cbe1f2d4b..4ff72109c600 100644
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
index 83c70d6a2d90..85c70a62b1fd 100644
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
index 49869cf7a376..75740181122f 100644
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
index e62ed7a57df2..e32f7e1f0072 100644
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
index 71960a0e903d..967db02ed27f 100644
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
index 72c6e25d8711..0d566b7fc89b 100644
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
index b134ae710d9e..1fd0c87e2075 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -530,6 +530,34 @@ static int iris_subscribe_event(struct v4l2_fh *fh, const struct v4l2_event_subs
 	return -EINVAL;
 }
 
+static int iris_s_parm(struct file *filp, void *fh, struct v4l2_streamparm *a)
+{
+	struct iris_inst *inst = iris_get_inst(filp);
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
+	struct iris_inst *inst = iris_get_inst(filp);
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


