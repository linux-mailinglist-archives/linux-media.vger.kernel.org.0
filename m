Return-Path: <linux-media+bounces-40897-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 21123B3375B
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:08:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92050202F56
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 07:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F2122C0262;
	Mon, 25 Aug 2025 07:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ThRNASMP"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821382BF00D;
	Mon, 25 Aug 2025 07:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756105352; cv=none; b=vCPHMNQG+WTYC33vMdzn8RTm4iTFtZyn7kEXMgwnZSbvlyVQDgavXHi7JSZGreOaMlQzUAH3s6+uYvlqzhOgzg2vK4qImYyaVbAPpvPKg5UEOaA4R+Sh9P28kE41OKSPnyMFf1I6qpRUxS6Q1afl1BGd2YfFJW14xlLnRPH8yvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756105352; c=relaxed/simple;
	bh=jrP2/g5u408tA49O5LSVSM39q6K9UvYqw27Eb52NmBQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=uCMjhAnvD1Jpwgef5IlF9xMYpoCQjoxoOhhJWqJ5fY4fmVoQjxWMdkKmaIIyGOCBuzowIVyVkW7f32UE+KwDavP57W/eCY9P9SuPsEb1MnQkKax72yMBwv6RsIxp3I3l3YKboto6a5EtVPtdoUa6m6PGzf7RAmSO1587LthPR/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=fail smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ThRNASMP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57ONwCaA030513;
	Mon, 25 Aug 2025 07:02:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NwH0kMhSKOY4xxffUJfAr06wxw+T6sgxx+mrdXjqtQc=; b=ThRNASMPuMitd7SE
	jRoV1G7O390b03TNsSn2FMU+wc9YakndnECdKfZET4pqzi2eiLr2UeW7oeM2eBeZ
	wcfsOS6H0ubroBjyhHHBJVRM7NJnRIakmaugtXLaCU30T8jMknxGZLO/wnquCBFT
	IsvIqO9Q18Sm6HltVJQ/MTAUE53+YATifs2GxjjAByjwte3A1PfqFgw1qmbhNqy3
	UbH3AKxUtMLddevfjyYPKfUtozdP8iTlGZpr5s+uc4h/clwYMOsMR+KVxwYlC4Wt
	u/BuHqD4hRIfNYFGt1QfLJRD74NWTEKjEqdKe24Uvrk5qxsUtLcqqCFOvGKsI69e
	ym2y/Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q615c201-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 07:02:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57P72J7Z021646
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 07:02:19 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Mon, 25 Aug 2025 00:02:14 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Mon, 25 Aug 2025 12:30:47 +0530
Subject: [PATCH v4 23/26] media: iris: Set platform capabilities to
 firmware for encoder video device
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250825-iris-video-encoder-v4-23-84aa2bc0a46b@quicinc.com>
References: <20250825-iris-video-encoder-v4-0-84aa2bc0a46b@quicinc.com>
In-Reply-To: <20250825-iris-video-encoder-v4-0-84aa2bc0a46b@quicinc.com>
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
	<quic_dikshita@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756105234; l=47356;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=jrP2/g5u408tA49O5LSVSM39q6K9UvYqw27Eb52NmBQ=;
 b=VlJfnLdQxUC1+McRLrCsluw9v9rEIiyPEVOGNQmPwG9+C4ejvdnZvN4F1ceINru5a1c2tCPiZ
 EuMHx1jBuO4AwYGC8R73DBAK6m/UByFKFYSWZXTvoqI/NU0Wfwyo34p
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNCBTYWx0ZWRfX0CuPYpi0GMSN
 Sxh7vfoXrjxZBR11pQ/YBs8XzaYx56+EHOL+glor9aFiZWDGLVzgTiBC+QpSI7kylsWPc6Am/xN
 0xCgecaSRiNZUqtlxyNH7hC3r6Iam8fHE3XAU4hCU+7OBTG7C1bNcYjIawRYZVtV/xcvyF9qGIN
 zI2tQb+eelGZ3wLWRh1jJDzZOum7WksdKVbVaTJEQINHaapFcjexTFD+jtw/dz9m1BLeUSQvQFL
 zs4TkL9+Rel1+71b2WnR9jPkWTuDWnVamYZa3zT7yt+FMKzNtAC6+iAOsrI712JxaOf0GJ3hymS
 fYNJ3yeXuKCmEJwp/un+68zeoMphqdmnC14kFrGwb4v88UhB+zjDpTYRSx3XalAz4rmBx7cfNZE
 KxCMI9Xj
X-Proofpoint-GUID: YWieESq8T2x4aor7-D2aUTg4cjcwsrqQ
X-Authority-Analysis: v=2.4 cv=K+AiHzWI c=1 sm=1 tr=0 ts=68ac0a7c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=aZvx1mKrqzrPAbqSY2EA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: YWieESq8T2x4aor7-D2aUTg4cjcwsrqQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230034

Initialize and configure platform-specific capabilities for the encoder
in the firmware during stream-on, to tailor encoding behavior to the
current session's requirements. Some of these capabilities can also be
updated dynamically when V4L2 controls are modified by the client after
stream-on.

Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c     |   8 +
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 500 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  15 +
 .../platform/qcom/iris/iris_hfi_gen1_command.c     | 108 +++++
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  47 +-
 .../platform/qcom/iris/iris_hfi_gen1_response.c    |   8 +-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  32 +-
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |   9 +-
 drivers/media/platform/qcom/iris/iris_instance.h   |   3 +-
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  23 +
 .../platform/qcom/iris/iris_platform_sm8250.c      |  14 +
 11 files changed, 737 insertions(+), 30 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index 6bf9b0b35d206d51b927c824d5a5b327596251c6..8811174bfdc0ad5288aa4eb5fab9d9df876c78c9 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -227,10 +227,14 @@ static u32 iris_dec_bitstream_buffer_size(struct iris_inst *inst)
 static u32 iris_enc_bitstream_buffer_size(struct iris_inst *inst)
 {
 	u32 aligned_width, aligned_height, bitstream_size, yuv_size;
+	int bitrate_mode, frame_rc;
 	struct v4l2_format *f;
 
 	f = inst->fmt_dst;
 
+	bitrate_mode = inst->fw_caps[BITRATE_MODE].value;
+	frame_rc = inst->fw_caps[FRAME_RC_ENABLE].value;
+
 	aligned_width = ALIGN(f->fmt.pix_mp.width, 32);
 	aligned_height = ALIGN(f->fmt.pix_mp.height, 32);
 	bitstream_size = aligned_width * aligned_height * 3;
@@ -242,6 +246,10 @@ static u32 iris_enc_bitstream_buffer_size(struct iris_inst *inst)
 		/* bitstream_size = 0.5 * yuv_size; */
 		bitstream_size = (bitstream_size >> 2);
 
+	if ((!frame_rc || bitrate_mode == V4L2_MPEG_VIDEO_BITRATE_MODE_CQ) &&
+	    bitstream_size < yuv_size)
+		bitstream_size = (bitstream_size << 1);
+
 	return ALIGN(bitstream_size, 4096);
 }
 
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 797386cb96ab1d24be6cc1819e2f9202ab4cc224..754a5ad718bc37630bb861012301df7a2e7342a1 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -7,8 +7,13 @@
 #include <media/v4l2-mem2mem.h>
 
 #include "iris_ctrls.h"
+#include "iris_hfi_gen1_defines.h"
+#include "iris_hfi_gen2_defines.h"
 #include "iris_instance.h"
 
+#define CABAC_MAX_BITRATE 160000000
+#define CAVLC_MAX_BITRATE 220000000
+
 static inline bool iris_valid_cap_id(enum platform_inst_fw_cap_type cap_id)
 {
 	return cap_id >= 1 && cap_id < INST_FW_CAP_MAX;
@@ -185,7 +190,7 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 	}
 }
 
-static int iris_vdec_op_s_ctrl(struct v4l2_ctrl *ctrl)
+static int iris_op_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct iris_inst *inst = container_of(ctrl->handler, struct iris_inst, ctrl_handler);
 	enum platform_inst_fw_cap_type cap_id;
@@ -206,11 +211,16 @@ static int iris_vdec_op_s_ctrl(struct v4l2_ctrl *ctrl)
 
 	inst->fw_caps[cap_id].value = ctrl->val;
 
+	if (vb2_is_streaming(q)) {
+		if (cap[cap_id].set)
+			cap[cap_id].set(inst, cap_id);
+	}
+
 	return 0;
 }
 
 static const struct v4l2_ctrl_ops iris_ctrl_ops = {
-	.s_ctrl = iris_vdec_op_s_ctrl,
+	.s_ctrl = iris_op_s_ctrl,
 };
 
 int iris_ctrls_init(struct iris_inst *inst)
@@ -327,16 +337,24 @@ void iris_session_init_caps(struct iris_core *core)
 		core->inst_fw_caps_enc[cap_id].value = caps[i].value;
 		core->inst_fw_caps_enc[cap_id].flags = caps[i].flags;
 		core->inst_fw_caps_enc[cap_id].hfi_id = caps[i].hfi_id;
+		core->inst_fw_caps_enc[cap_id].set = caps[i].set;
 	}
 }
 
 static u32 iris_get_port_info(struct iris_inst *inst,
 			      enum platform_inst_fw_cap_type cap_id)
 {
-	if (inst->fw_caps[cap_id].flags & CAP_FLAG_INPUT_PORT)
-		return HFI_PORT_BITSTREAM;
-	else if (inst->fw_caps[cap_id].flags & CAP_FLAG_OUTPUT_PORT)
-		return HFI_PORT_RAW;
+	if (inst->domain == DECODER) {
+		if (inst->fw_caps[cap_id].flags & CAP_FLAG_INPUT_PORT)
+			return HFI_PORT_BITSTREAM;
+		else if (inst->fw_caps[cap_id].flags & CAP_FLAG_OUTPUT_PORT)
+			return HFI_PORT_RAW;
+	} else {
+		if (inst->fw_caps[cap_id].flags & CAP_FLAG_INPUT_PORT)
+			return HFI_PORT_RAW;
+		else if (inst->fw_caps[cap_id].flags & CAP_FLAG_OUTPUT_PORT)
+			return HFI_PORT_BITSTREAM;
+	}
 
 	return HFI_PORT_NONE;
 }
@@ -376,8 +394,10 @@ int iris_set_stage(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id
 	u32 width = inp_f->fmt.pix_mp.width;
 	u32 work_mode = STAGE_2;
 
-	if (iris_res_is_less_than(width, height, 1280, 720))
-		work_mode = STAGE_1;
+	if (inst->domain == DECODER) {
+		if (iris_res_is_less_than(width, height, 1280, 720))
+			work_mode = STAGE_1;
+	}
 
 	return hfi_ops->session_set_property(inst, hfi_id,
 					     HFI_HOST_FLAGS_NONE,
@@ -399,6 +419,470 @@ int iris_set_pipe(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 					     &work_route, sizeof(u32));
 }
 
+int iris_set_profile(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	u32 hfi_id, hfi_value;
+
+	if (inst->codec == V4L2_PIX_FMT_H264) {
+		hfi_id = inst->fw_caps[PROFILE_H264].hfi_id;
+		hfi_value = inst->fw_caps[PROFILE_H264].value;
+	} else {
+		hfi_id = inst->fw_caps[PROFILE_HEVC].hfi_id;
+		hfi_value = inst->fw_caps[PROFILE_HEVC].value;
+	}
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_U32_ENUM,
+					     &hfi_value, sizeof(u32));
+}
+
+int iris_set_level(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	u32 hfi_id, hfi_value;
+
+	if (inst->codec == V4L2_PIX_FMT_H264) {
+		hfi_id = inst->fw_caps[LEVEL_H264].hfi_id;
+		hfi_value = inst->fw_caps[LEVEL_H264].value;
+	} else {
+		hfi_id = inst->fw_caps[LEVEL_HEVC].hfi_id;
+		hfi_value = inst->fw_caps[LEVEL_HEVC].value;
+	}
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_U32_ENUM,
+					     &hfi_value, sizeof(u32));
+}
+
+int iris_set_profile_level_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	struct hfi_profile_level pl;
+
+	if (inst->codec == V4L2_PIX_FMT_H264) {
+		pl.profile = inst->fw_caps[PROFILE_H264].value;
+		pl.level = inst->fw_caps[LEVEL_H264].value;
+	} else {
+		pl.profile = inst->fw_caps[PROFILE_HEVC].value;
+		pl.level = inst->fw_caps[LEVEL_HEVC].value;
+	}
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_U32_ENUM,
+					     &pl, sizeof(u32));
+}
+
+int iris_set_header_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	u32 header_mode = inst->fw_caps[cap_id].value;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	u32 hfi_val;
+
+	if (header_mode == V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE)
+		hfi_val = 0;
+	else
+		hfi_val = 1;
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					 HFI_HOST_FLAGS_NONE,
+				     iris_get_port_info(inst, cap_id),
+				     HFI_PAYLOAD_U32,
+				     &hfi_val, sizeof(u32));
+}
+
+int iris_set_header_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	u32 prepend_sps_pps = inst->fw_caps[PREPEND_SPSPPS_TO_IDR].value;
+	u32 header_mode = inst->fw_caps[cap_id].value;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	u32 hfi_val;
+
+	if (prepend_sps_pps)
+		hfi_val = HFI_SEQ_HEADER_PREFIX_WITH_SYNC_FRAME;
+	else if (header_mode == V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME)
+		hfi_val = HFI_SEQ_HEADER_JOINED_WITH_1ST_FRAME;
+	else
+		hfi_val = HFI_SEQ_HEADER_SEPERATE_FRAME;
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					 HFI_HOST_FLAGS_NONE,
+				     iris_get_port_info(inst, cap_id),
+				     HFI_PAYLOAD_U32_ENUM,
+				     &hfi_val, sizeof(u32));
+}
+
+int iris_set_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	u32 entropy_mode = inst->fw_caps[ENTROPY_MODE].value;
+	u32 bitrate = inst->fw_caps[cap_id].value;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	u32 max_bitrate;
+
+	if (inst->codec == V4L2_PIX_FMT_HEVC)
+		max_bitrate = CABAC_MAX_BITRATE;
+
+	if (entropy_mode == V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC)
+		max_bitrate = CABAC_MAX_BITRATE;
+	else
+		max_bitrate = CAVLC_MAX_BITRATE;
+
+	bitrate = min(bitrate, max_bitrate);
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					 HFI_HOST_FLAGS_NONE,
+				     iris_get_port_info(inst, cap_id),
+				     HFI_PAYLOAD_U32,
+				     &bitrate, sizeof(u32));
+}
+
+int iris_set_peak_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	u32 rc_mode = inst->fw_caps[BITRATE_MODE].value;
+	u32 peak_bitrate = inst->fw_caps[cap_id].value;
+	u32 bitrate = inst->fw_caps[BITRATE].value;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+
+	if (rc_mode != V4L2_MPEG_VIDEO_BITRATE_MODE_CBR)
+		return 0;
+
+	if (inst->fw_caps[cap_id].flags & CAP_FLAG_CLIENT_SET) {
+		if (peak_bitrate < bitrate)
+			peak_bitrate = bitrate;
+	} else {
+		peak_bitrate = bitrate;
+	}
+
+	inst->fw_caps[cap_id].value = peak_bitrate;
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					 HFI_HOST_FLAGS_NONE,
+				     iris_get_port_info(inst, cap_id),
+				     HFI_PAYLOAD_U32,
+				     &peak_bitrate, sizeof(u32));
+}
+
+int iris_set_bitrate_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	u32 bitrate_mode = inst->fw_caps[BITRATE_MODE].value;
+	u32 frame_rc = inst->fw_caps[FRAME_RC_ENABLE].value;
+	u32 frame_skip = inst->fw_caps[FRAME_SKIP_MODE].value;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	u32 rc_mode = 0;
+
+	if (!frame_rc)
+		rc_mode = HFI_RATE_CONTROL_OFF;
+	else if (bitrate_mode == V4L2_MPEG_VIDEO_BITRATE_MODE_VBR)
+		rc_mode = frame_skip ? HFI_RATE_CONTROL_VBR_VFR : HFI_RATE_CONTROL_VBR_CFR;
+	else if (bitrate_mode == V4L2_MPEG_VIDEO_BITRATE_MODE_CBR)
+		rc_mode = frame_skip ? HFI_RATE_CONTROL_CBR_VFR : HFI_RATE_CONTROL_CBR_CFR;
+	else if (bitrate_mode == V4L2_MPEG_VIDEO_BITRATE_MODE_CQ)
+		rc_mode = HFI_RATE_CONTROL_CQ;
+
+	inst->hfi_rc_type = rc_mode;
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					 HFI_HOST_FLAGS_NONE,
+				     iris_get_port_info(inst, cap_id),
+				     HFI_PAYLOAD_U32_ENUM,
+				     &rc_mode, sizeof(u32));
+}
+
+int iris_set_bitrate_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	u32 bitrate_mode = inst->fw_caps[BITRATE_MODE].value;
+	u32 frame_rc = inst->fw_caps[FRAME_RC_ENABLE].value;
+	u32 frame_skip = inst->fw_caps[FRAME_SKIP_MODE].value;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	u32 rc_mode = 0;
+
+	if (!frame_rc)
+		rc_mode = HFI_RC_OFF;
+	else if (bitrate_mode == V4L2_MPEG_VIDEO_BITRATE_MODE_VBR)
+		rc_mode = HFI_RC_VBR_CFR;
+	else if (bitrate_mode == V4L2_MPEG_VIDEO_BITRATE_MODE_CBR)
+		rc_mode = frame_skip ? HFI_RC_CBR_VFR : HFI_RC_CBR_CFR;
+	else if (bitrate_mode == V4L2_MPEG_VIDEO_BITRATE_MODE_CQ)
+		rc_mode = HFI_RC_CQ;
+
+	inst->hfi_rc_type = rc_mode;
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					 HFI_HOST_FLAGS_NONE,
+				     iris_get_port_info(inst, cap_id),
+				     HFI_PAYLOAD_U32_ENUM,
+				     &rc_mode, sizeof(u32));
+}
+
+int iris_set_entropy_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	u32 entropy_mode = inst->fw_caps[cap_id].value;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	u32 hfi_val;
+
+	if (inst->codec != V4L2_PIX_FMT_H264)
+		return 0;
+
+	hfi_val = (entropy_mode == V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC) ?
+		HFI_H264_ENTROPY_CAVLC : HFI_H264_ENTROPY_CABAC;
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					 HFI_HOST_FLAGS_NONE,
+				     iris_get_port_info(inst, cap_id),
+				     HFI_PAYLOAD_U32,
+				     &hfi_val, sizeof(u32));
+}
+
+int iris_set_entropy_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	u32 entropy_mode = inst->fw_caps[cap_id].value;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	u32 profile;
+
+	if (inst->codec != V4L2_PIX_FMT_H264)
+		return 0;
+
+	profile = inst->fw_caps[PROFILE_H264].value;
+
+	if (profile == V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE ||
+	    profile == V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE)
+		entropy_mode = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC;
+
+	inst->fw_caps[cap_id].value = entropy_mode;
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					 HFI_HOST_FLAGS_NONE,
+				     iris_get_port_info(inst, cap_id),
+				     HFI_PAYLOAD_U32,
+				     &entropy_mode, sizeof(u32));
+}
+
+int iris_set_min_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	u32 i_qp_enable = 0, p_qp_enable = 0, b_qp_enable = 0;
+	u32 i_frame_qp = 0, p_frame_qp = 0, b_frame_qp = 0;
+	u32 min_qp_enable = 0, client_qp_enable = 0;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	u32 hfi_val;
+
+	if (inst->codec == V4L2_PIX_FMT_H264) {
+		if (inst->fw_caps[MIN_FRAME_QP_H264].flags & CAP_FLAG_CLIENT_SET)
+			min_qp_enable = 1;
+		if (min_qp_enable ||
+		    (inst->fw_caps[I_FRAME_MIN_QP_H264].flags & CAP_FLAG_CLIENT_SET))
+			i_qp_enable = 1;
+		if (min_qp_enable ||
+		    (inst->fw_caps[P_FRAME_MIN_QP_H264].flags & CAP_FLAG_CLIENT_SET))
+			p_qp_enable = 1;
+		if (min_qp_enable ||
+		    (inst->fw_caps[B_FRAME_MIN_QP_H264].flags & CAP_FLAG_CLIENT_SET))
+			b_qp_enable = 1;
+	} else {
+		if (inst->fw_caps[MIN_FRAME_QP_HEVC].flags & CAP_FLAG_CLIENT_SET)
+			min_qp_enable = 1;
+		if (min_qp_enable ||
+		    (inst->fw_caps[I_FRAME_MIN_QP_HEVC].flags & CAP_FLAG_CLIENT_SET))
+			i_qp_enable = 1;
+		if (min_qp_enable ||
+		    (inst->fw_caps[P_FRAME_MIN_QP_HEVC].flags & CAP_FLAG_CLIENT_SET))
+			p_qp_enable = 1;
+		if (min_qp_enable ||
+		    (inst->fw_caps[B_FRAME_MIN_QP_HEVC].flags & CAP_FLAG_CLIENT_SET))
+			b_qp_enable = 1;
+	}
+
+	client_qp_enable = i_qp_enable | p_qp_enable << 1 | b_qp_enable << 2;
+	if (!client_qp_enable)
+		return 0;
+
+	if (inst->codec == V4L2_PIX_FMT_H264) {
+		i_frame_qp = max(inst->fw_caps[I_FRAME_MIN_QP_H264].value,
+				 inst->fw_caps[MIN_FRAME_QP_H264].value);
+		p_frame_qp = max(inst->fw_caps[P_FRAME_MIN_QP_H264].value,
+				 inst->fw_caps[MIN_FRAME_QP_H264].value);
+		b_frame_qp = max(inst->fw_caps[B_FRAME_MIN_QP_H264].value,
+				 inst->fw_caps[MIN_FRAME_QP_H264].value);
+	} else {
+		i_frame_qp = max(inst->fw_caps[I_FRAME_MIN_QP_HEVC].value,
+				 inst->fw_caps[MIN_FRAME_QP_HEVC].value);
+		p_frame_qp = max(inst->fw_caps[P_FRAME_MIN_QP_HEVC].value,
+				 inst->fw_caps[MIN_FRAME_QP_HEVC].value);
+		b_frame_qp = max(inst->fw_caps[B_FRAME_MIN_QP_HEVC].value,
+				 inst->fw_caps[MIN_FRAME_QP_HEVC].value);
+	}
+
+	hfi_val = i_frame_qp | p_frame_qp << 8 | b_frame_qp << 16 | client_qp_enable << 24;
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					 HFI_HOST_FLAGS_NONE,
+				     iris_get_port_info(inst, cap_id),
+				     HFI_PAYLOAD_32_PACKED,
+				     &hfi_val, sizeof(u32));
+}
+
+int iris_set_max_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	u32 i_qp_enable = 0, p_qp_enable = 0, b_qp_enable = 0;
+	u32 max_qp_enable = 0, client_qp_enable;
+	u32 i_frame_qp, p_frame_qp, b_frame_qp;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	u32 hfi_val;
+
+	if (inst->codec == V4L2_PIX_FMT_H264) {
+		if (inst->fw_caps[MAX_FRAME_QP_H264].flags & CAP_FLAG_CLIENT_SET)
+			max_qp_enable = 1;
+		if (max_qp_enable ||
+		    (inst->fw_caps[I_FRAME_MAX_QP_H264].flags & CAP_FLAG_CLIENT_SET))
+			i_qp_enable = 1;
+		if (max_qp_enable ||
+		    (inst->fw_caps[P_FRAME_MAX_QP_H264].flags & CAP_FLAG_CLIENT_SET))
+			p_qp_enable = 1;
+		if (max_qp_enable ||
+		    (inst->fw_caps[B_FRAME_MAX_QP_H264].flags & CAP_FLAG_CLIENT_SET))
+			b_qp_enable = 1;
+	} else {
+		if (inst->fw_caps[MAX_FRAME_QP_HEVC].flags & CAP_FLAG_CLIENT_SET)
+			max_qp_enable = 1;
+		if (max_qp_enable ||
+		    (inst->fw_caps[I_FRAME_MAX_QP_HEVC].flags & CAP_FLAG_CLIENT_SET))
+			i_qp_enable = 1;
+		if (max_qp_enable ||
+		    (inst->fw_caps[P_FRAME_MAX_QP_HEVC].flags & CAP_FLAG_CLIENT_SET))
+			p_qp_enable = 1;
+		if (max_qp_enable ||
+		    (inst->fw_caps[B_FRAME_MAX_QP_HEVC].flags & CAP_FLAG_CLIENT_SET))
+			b_qp_enable = 1;
+	}
+
+	client_qp_enable = i_qp_enable | p_qp_enable << 1 | b_qp_enable << 2;
+	if (!client_qp_enable)
+		return 0;
+
+	if (inst->codec == V4L2_PIX_FMT_H264) {
+		i_frame_qp = min(inst->fw_caps[I_FRAME_MAX_QP_H264].value,
+				 inst->fw_caps[MAX_FRAME_QP_H264].value);
+		p_frame_qp = min(inst->fw_caps[P_FRAME_MAX_QP_H264].value,
+				 inst->fw_caps[MAX_FRAME_QP_H264].value);
+		b_frame_qp = min(inst->fw_caps[B_FRAME_MAX_QP_H264].value,
+				 inst->fw_caps[MAX_FRAME_QP_H264].value);
+	} else {
+		i_frame_qp = min(inst->fw_caps[I_FRAME_MAX_QP_HEVC].value,
+				 inst->fw_caps[MAX_FRAME_QP_HEVC].value);
+		p_frame_qp = min(inst->fw_caps[P_FRAME_MAX_QP_HEVC].value,
+				 inst->fw_caps[MAX_FRAME_QP_HEVC].value);
+		b_frame_qp = min(inst->fw_caps[B_FRAME_MAX_QP_HEVC].value,
+				 inst->fw_caps[MAX_FRAME_QP_HEVC].value);
+	}
+
+	hfi_val = i_frame_qp | p_frame_qp << 8 | b_frame_qp << 16 |
+		client_qp_enable << 24;
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					 HFI_HOST_FLAGS_NONE,
+				     iris_get_port_info(inst, cap_id),
+				     HFI_PAYLOAD_32_PACKED,
+				     &hfi_val, sizeof(u32));
+}
+
+int iris_set_frame_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	u32 i_qp_enable = 0, p_qp_enable = 0, b_qp_enable = 0, client_qp_enable;
+	u32 i_frame_qp, p_frame_qp, b_frame_qp;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	struct vb2_queue *q;
+	u32 hfi_val;
+
+	q = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
+	if (vb2_is_streaming(q)) {
+		if (inst->hfi_rc_type != HFI_RC_OFF)
+			return 0;
+	}
+
+	if (inst->hfi_rc_type == HFI_RC_OFF) {
+		i_qp_enable = 1;
+		p_qp_enable = 1;
+		b_qp_enable = 1;
+	} else {
+		if (inst->codec == V4L2_PIX_FMT_H264) {
+			if (inst->fw_caps[I_FRAME_QP_H264].flags & CAP_FLAG_CLIENT_SET)
+				i_qp_enable = 1;
+			if (inst->fw_caps[P_FRAME_QP_H264].flags & CAP_FLAG_CLIENT_SET)
+				p_qp_enable = 1;
+			if (inst->fw_caps[B_FRAME_QP_H264].flags & CAP_FLAG_CLIENT_SET)
+				b_qp_enable = 1;
+		} else {
+			if (inst->fw_caps[I_FRAME_QP_HEVC].flags & CAP_FLAG_CLIENT_SET)
+				i_qp_enable = 1;
+			if (inst->fw_caps[P_FRAME_QP_HEVC].flags & CAP_FLAG_CLIENT_SET)
+				p_qp_enable = 1;
+			if (inst->fw_caps[B_FRAME_QP_HEVC].flags & CAP_FLAG_CLIENT_SET)
+				b_qp_enable = 1;
+		}
+	}
+
+	client_qp_enable = i_qp_enable | p_qp_enable << 1 | b_qp_enable << 2;
+	if (!client_qp_enable)
+		return 0;
+
+	if (inst->codec == V4L2_PIX_FMT_H264) {
+		i_frame_qp = inst->fw_caps[I_FRAME_QP_H264].value;
+		p_frame_qp = inst->fw_caps[P_FRAME_QP_H264].value;
+		b_frame_qp = inst->fw_caps[B_FRAME_QP_H264].value;
+	} else {
+		i_frame_qp = inst->fw_caps[I_FRAME_QP_HEVC].value;
+		p_frame_qp = inst->fw_caps[P_FRAME_QP_HEVC].value;
+		b_frame_qp = inst->fw_caps[B_FRAME_QP_HEVC].value;
+	}
+
+	hfi_val = i_frame_qp | p_frame_qp << 8 | b_frame_qp << 16 |
+		client_qp_enable << 24;
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					 HFI_HOST_FLAGS_NONE,
+				     iris_get_port_info(inst, cap_id),
+				     HFI_PAYLOAD_32_PACKED,
+				     &hfi_val, sizeof(u32));
+}
+
+int iris_set_qp_range(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	struct hfi_quantization_range_v2 range;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+
+	if (inst->codec == V4L2_PIX_FMT_HEVC) {
+		range.min_qp.qp_packed = inst->fw_caps[MIN_FRAME_QP_HEVC].value;
+		range.max_qp.qp_packed = inst->fw_caps[MAX_FRAME_QP_HEVC].value;
+	} else {
+		range.min_qp.qp_packed = inst->fw_caps[MIN_FRAME_QP_H264].value;
+		range.max_qp.qp_packed = inst->fw_caps[MAX_FRAME_QP_H264].value;
+	}
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					 HFI_HOST_FLAGS_NONE,
+				     iris_get_port_info(inst, cap_id),
+				     HFI_PAYLOAD_32_PACKED,
+				     &range, sizeof(range));
+}
+
 int iris_set_properties(struct iris_inst *inst, u32 plane)
 {
 	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
index 9b5741868933b08dcefd4868ba89f3c43760d31c..30af333cc4941e737eb1ae83a6944b4192896e23 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.h
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
@@ -17,6 +17,21 @@ int iris_set_u32_enum(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
 int iris_set_stage(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_pipe(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_u32(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_profile(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_level(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_profile_level_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_header_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_header_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_peak_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_bitrate_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_bitrate_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_entropy_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_entropy_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_min_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_max_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_frame_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_qp_range(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_properties(struct iris_inst *inst, u32 plane);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index cd1dc9575f592cc3b5f10f9aab9a1ff86adb1dd2..690c439430a750e146e41f3feeae3c33039b61b8 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -534,6 +534,114 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		packet->shdr.hdr.size += sizeof(u32) + sizeof(*wm);
 		break;
 	}
+	case HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT: {
+		struct hfi_profile_level *in = pdata, *pl = prop_data;
+
+		pl->level = in->level;
+		pl->profile = in->profile;
+		if (pl->profile <= 0)
+			/* Profile not supported, falling back to high */
+			pl->profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH;
+
+		if (!pl->level)
+			/* Level not supported, falling back to 1 */
+			pl->level = 1;
+
+		packet->shdr.hdr.size += sizeof(u32) + sizeof(*pl);
+		break;
+	}
+	case HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER: {
+		struct hfi_enable *en = prop_data;
+		u32 *in = pdata;
+
+		en->enable = *in;
+		packet->shdr.hdr.size += sizeof(u32) + sizeof(*en);
+		break;
+	}
+	case HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE: {
+		struct hfi_bitrate *brate = prop_data;
+		u32 *in = pdata;
+
+		brate->bitrate = *in;
+		brate->layer_id = 0;
+		packet->shdr.hdr.size += sizeof(u32) + sizeof(*brate);
+		break;
+	}
+	case HFI_PROPERTY_PARAM_VENC_RATE_CONTROL: {
+		u32 *in = pdata;
+
+		switch (*in) {
+		case HFI_RATE_CONTROL_OFF:
+		case HFI_RATE_CONTROL_CBR_CFR:
+		case HFI_RATE_CONTROL_CBR_VFR:
+		case HFI_RATE_CONTROL_VBR_CFR:
+		case HFI_RATE_CONTROL_VBR_VFR:
+		case HFI_RATE_CONTROL_CQ:
+			break;
+		default:
+			return -EINVAL;
+		}
+
+		packet->data[1] = *in;
+		packet->shdr.hdr.size += sizeof(u32) * 2;
+		break;
+	}
+	case HFI_PROPERTY_PARAM_VENC_H264_ENTROPY_CONTROL: {
+		struct hfi_h264_entropy_control *entropy = prop_data;
+		u32 *in = pdata;
+
+		entropy->entropy_mode = *in;
+		if (entropy->entropy_mode == HFI_H264_ENTROPY_CABAC)
+			entropy->cabac_model = HFI_H264_CABAC_MODEL_0;
+		packet->shdr.hdr.size += sizeof(u32) + sizeof(*entropy);
+		break;
+	}
+	case HFI_PROPERTY_PARAM_VENC_SESSION_QP_RANGE_V2: {
+		struct hfi_quantization_range_v2 *range = prop_data;
+		struct hfi_quantization_range_v2 *in = pdata;
+		u32 min_qp, max_qp;
+
+		min_qp = in->min_qp.qp_packed;
+		max_qp = in->max_qp.qp_packed;
+
+		/* We'll be packing in the qp, so make sure we
+		 * won't be losing data when masking
+		 */
+		if (min_qp > 0xff || max_qp > 0xff)
+			return -ERANGE;
+
+		range->min_qp.layer_id = 0xFF;
+		range->max_qp.layer_id = 0xFF;
+		range->min_qp.qp_packed = (min_qp & 0xFF) | ((min_qp & 0xFF) << 8) |
+			((min_qp & 0xFF) << 16);
+		range->max_qp.qp_packed = (max_qp & 0xFF) | ((max_qp & 0xFF) << 8) |
+			((max_qp & 0xFF) << 16);
+		range->min_qp.enable = 7;
+		range->max_qp.enable = 7;
+		packet->shdr.hdr.size += sizeof(u32) + sizeof(*range);
+		break;
+	}
+	case HFI_PROPERTY_CONFIG_FRAME_RATE: {
+		struct hfi_framerate *frate = prop_data;
+		struct hfi_framerate *in = pdata;
+
+		frate->buffer_type = in->buffer_type;
+		frate->framerate = in->framerate;
+		packet->shdr.hdr.size += sizeof(u32) + sizeof(*frate);
+		break;
+	}
+	case HFI_PROPERTY_PARAM_UNCOMPRESSED_PLANE_ACTUAL_INFO: {
+		struct hfi_uncompressed_plane_actual_info *plane_actual_info = prop_data;
+		struct hfi_uncompressed_plane_actual_info *in = pdata;
+
+		plane_actual_info->buffer_type = in->buffer_type;
+		plane_actual_info->num_planes = in->num_planes;
+		plane_actual_info->plane_format[0] = in->plane_format[0];
+		if (in->num_planes > 1)
+			plane_actual_info->plane_format[1] = in->plane_format[1];
+		packet->shdr.hdr.size += sizeof(u32) + sizeof(*plane_actual_info);
+		break;
+	}
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index 81116420b6a3d86cca7229bdd3a875d95c1a7936..d7bbcfce6941229aedb558d24d4cd6c7a8a1aa32 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -114,15 +114,25 @@
 #define HFI_MSG_SESSION_RELEASE_RESOURCES		0x22100a
 #define HFI_MSG_SESSION_RELEASE_BUFFERS			0x22100c
 
-#define HFI_PICTURE_I					0x00000001
-#define HFI_PICTURE_P					0x00000002
-#define HFI_PICTURE_B					0x00000004
-#define HFI_PICTURE_IDR					0x00000008
+#define HFI_GEN1_PICTURE_I					0x00000001
+#define HFI_GEN1_PICTURE_P					0x00000002
+#define HFI_GEN1_PICTURE_B					0x00000004
+#define HFI_GEN1_PICTURE_IDR			0x00000008
 #define HFI_FRAME_NOTCODED				0x7f002000
 #define HFI_FRAME_YUV					0x7f004000
 #define HFI_UNUSED_PICT					0x10000000
-#define HFI_BUFFERFLAG_DATACORRUPT			0x00000008
-#define HFI_BUFFERFLAG_DROP_FRAME			0x20000000
+#define HFI_BUFFERFLAG_DATACORRUPT                     0x00000008
+#define HFI_BUFFERFLAG_DROP_FRAME                      0x20000000
+#define HFI_RATE_CONTROL_OFF			0x1000001
+#define HFI_RATE_CONTROL_VBR_VFR		0x1000002
+#define HFI_RATE_CONTROL_VBR_CFR		0x1000003
+#define HFI_RATE_CONTROL_CBR_VFR		0x1000004
+#define HFI_RATE_CONTROL_CBR_CFR		0x1000005
+#define HFI_RATE_CONTROL_CQ				0x1000008
+
+#define HFI_H264_ENTROPY_CAVLC			0x1
+#define HFI_H264_ENTROPY_CABAC			0x2
+
 #define HFI_PROPERTY_PARAM_VENC_H264_ENTROPY_CONTROL		0x2005002
 #define HFI_PROPERTY_PARAM_VENC_H264_DEBLOCK_CONTROL		0x2005003
 #define HFI_PROPERTY_PARAM_VENC_RATE_CONTROL			0x2005004
@@ -388,6 +398,31 @@ struct hfi_buffer_requirements {
 	u32 alignment;
 };
 
+struct hfi_bitrate {
+	u32 bitrate;
+	u32 layer_id;
+};
+
+#define HFI_H264_CABAC_MODEL_0			0x1
+
+struct hfi_h264_entropy_control {
+	u32 entropy_mode;
+	u32 cabac_model;
+};
+
+struct hfi_quantization_v2 {
+	u32 qp_packed;
+	u32 layer_id;
+	u32 enable;
+	u32 reserved[3];
+};
+
+struct hfi_quantization_range_v2 {
+	struct hfi_quantization_v2 min_qp;
+	struct hfi_quantization_v2 max_qp;
+	u32 reserved[4];
+};
+
 struct hfi_framerate {
 	u32 buffer_type;
 	u32 framerate;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index 2a96458833835422d30c9386d15cc1e4fb226e3d..82d3e8de7bff0ac53a971b4763ae848ff8c61ff2 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -469,14 +469,14 @@ static void iris_hfi_gen1_session_ftb_done(struct iris_inst *inst, void *packet)
 	buf->timestamp = timestamp_us;
 
 	switch (pic_type) {
-	case HFI_PICTURE_IDR:
-	case HFI_PICTURE_I:
+	case HFI_GEN1_PICTURE_IDR:
+	case HFI_GEN1_PICTURE_I:
 		flags |= V4L2_BUF_FLAG_KEYFRAME;
 		break;
-	case HFI_PICTURE_P:
+	case HFI_GEN1_PICTURE_P:
 		flags |= V4L2_BUF_FLAG_PFRAME;
 		break;
-	case HFI_PICTURE_B:
+	case HFI_GEN1_PICTURE_B:
 		flags |= V4L2_BUF_FLAG_BFRAME;
 		break;
 	case HFI_FRAME_NOTCODED:
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index b3d1c966958e516d940a7795e5cbe2f8e8bada57..aa1f795f5626c1f76a32dd650302633877ce67be 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -56,6 +56,16 @@
 #define HFI_PROP_BUFFER_HOST_MAX_COUNT		0x03000123
 #define HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT	0x03000124
 #define HFI_PROP_PIC_ORDER_CNT_TYPE		0x03000128
+
+enum hfi_rate_control {
+	HFI_RC_VBR_CFR		= 0x00000000,
+	HFI_RC_CBR_CFR		= 0x00000001,
+	HFI_RC_CQ		= 0x00000002,
+	HFI_RC_OFF		= 0x00000003,
+	HFI_RC_CBR_VFR		= 0x00000004,
+	HFI_RC_LOSSLESS		= 0x00000005,
+};
+
 #define HFI_PROP_RATE_CONTROL			0x0300012a
 #define HFI_PROP_QP_PACKED			0x0300012e
 #define HFI_PROP_MIN_QP_PACKED			0x0300012f
@@ -64,6 +74,14 @@
 #define HFI_PROP_MAX_GOP_FRAMES			0x03000146
 #define HFI_PROP_MAX_B_FRAMES			0x03000147
 #define HFI_PROP_QUALITY_MODE			0x03000148
+
+enum hfi_seq_header_mode {
+	HFI_SEQ_HEADER_SEPERATE_FRAME		= 0x00000001,
+	HFI_SEQ_HEADER_JOINED_WITH_1ST_FRAME	= 0x00000002,
+	HFI_SEQ_HEADER_PREFIX_WITH_SYNC_FRAME	= 0x00000004,
+	HFI_SEQ_HEADER_METADATA			= 0x00000008,
+};
+
 #define HFI_PROP_SEQ_HEADER_MODE		0x03000149
 #define HFI_PROP_SIGNAL_COLOR_INFO		0x03000155
 #define HFI_PROP_PICTURE_TYPE			0x03000162
@@ -123,13 +141,13 @@ enum hfi_codec_type {
 };
 
 enum hfi_picture_type {
-	HFI_PICTURE_IDR				= 0x00000001,
-	HFI_PICTURE_P				= 0x00000002,
-	HFI_PICTURE_B				= 0x00000004,
-	HFI_PICTURE_I				= 0x00000008,
-	HFI_PICTURE_CRA				= 0x00000010,
-	HFI_PICTURE_BLA				= 0x00000020,
-	HFI_PICTURE_NOSHOW			= 0x00000040,
+	HFI_GEN2_PICTURE_IDR		= 0x00000001,
+	HFI_GEN2_PICTURE_P			= 0x00000002,
+	HFI_GEN2_PICTURE_B			= 0x00000004,
+	HFI_GEN2_PICTURE_I			= 0x00000008,
+	HFI_GEN2_PICTURE_CRA		= 0x00000010,
+	HFI_GEN2_PICTURE_BLA		= 0x00000020,
+	HFI_GEN2_PICTURE_NOSHOW     = 0x00000040,
 };
 
 enum hfi_buffer_type {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index dda775d463e916f70da0b879702d96df18ea8bf7..4e4fae2359ccf210186397a417049208728b5d53 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -87,17 +87,18 @@ static bool iris_hfi_gen2_is_valid_hfi_port(u32 port, u32 buffer_type)
 
 static int iris_hfi_gen2_get_driver_buffer_flags(struct iris_inst *inst, u32 hfi_flags)
 {
-	u32 keyframe = HFI_PICTURE_IDR | HFI_PICTURE_I | HFI_PICTURE_CRA | HFI_PICTURE_BLA;
 	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
+	u32 keyframe = HFI_GEN2_PICTURE_IDR | HFI_GEN2_PICTURE_I |
+		HFI_GEN2_PICTURE_CRA | HFI_GEN2_PICTURE_BLA;
 	u32 driver_flags = 0;
 
-	if (inst_hfi_gen2->hfi_frame_info.picture_type & HFI_PICTURE_NOSHOW)
+	if (inst_hfi_gen2->hfi_frame_info.picture_type & HFI_GEN2_PICTURE_NOSHOW)
 		driver_flags |= V4L2_BUF_FLAG_ERROR;
 	else if (inst_hfi_gen2->hfi_frame_info.picture_type & keyframe)
 		driver_flags |= V4L2_BUF_FLAG_KEYFRAME;
-	else if (inst_hfi_gen2->hfi_frame_info.picture_type & HFI_PICTURE_P)
+	else if (inst_hfi_gen2->hfi_frame_info.picture_type & HFI_GEN2_PICTURE_P)
 		driver_flags |= V4L2_BUF_FLAG_PFRAME;
-	else if (inst_hfi_gen2->hfi_frame_info.picture_type & HFI_PICTURE_B)
+	else if (inst_hfi_gen2->hfi_frame_info.picture_type & HFI_GEN2_PICTURE_B)
 		driver_flags |= V4L2_BUF_FLAG_BFRAME;
 
 	if (inst_hfi_gen2->hfi_frame_info.data_corrupt || inst_hfi_gen2->hfi_frame_info.overflow)
diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index b75549718df3c87cd85aecfc74c873c60cd4bde5..5982d7adefeab80905478b32cddba7bd4651a691 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -63,7 +63,7 @@ struct iris_fmt {
  * @last_buffer_dequeued: a flag to indicate that last buffer is sent by driver
  * @frame_rate: frame rate of current instance
  * @operating_rate: operating rate of current instance
-
+ * @hfi_rc_type: rate control type
  */
 
 struct iris_inst {
@@ -101,6 +101,7 @@ struct iris_inst {
 	bool				last_buffer_dequeued;
 	u32				frame_rate;
 	u32				operating_rate;
+	u32				hfi_rc_type;
 };
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index d8b818ccd5a512f66f194b24b5f6d6609c8c838f..8b7e79a794f5ab3d26789050121dbf44a5a85b89 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -213,6 +213,7 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.value = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
 		.hfi_id = HFI_PROP_PROFILE,
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_profile,
 	},
 	{
 		.cap_id = PROFILE_HEVC,
@@ -224,6 +225,7 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.value = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
 		.hfi_id = HFI_PROP_PROFILE,
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_profile,
 	},
 	{
 		.cap_id = LEVEL_H264,
@@ -250,6 +252,7 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.value = V4L2_MPEG_VIDEO_H264_LEVEL_5_0,
 		.hfi_id = HFI_PROP_LEVEL,
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_level,
 	},
 	{
 		.cap_id = LEVEL_HEVC,
@@ -271,6 +274,7 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.value = V4L2_MPEG_VIDEO_HEVC_LEVEL_5,
 		.hfi_id = HFI_PROP_LEVEL,
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_level,
 	},
 	{
 		.cap_id = STAGE,
@@ -279,6 +283,7 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.step_or_mask = 1,
 		.value = STAGE_2,
 		.hfi_id = HFI_PROP_STAGE,
+		.set = iris_set_stage,
 	},
 	{
 		.cap_id = HEADER_MODE,
@@ -289,6 +294,7 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.value = V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME,
 		.hfi_id = HFI_PROP_SEQ_HEADER_MODE,
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_header_mode_gen2,
 	},
 	{
 		.cap_id = PREPEND_SPSPPS_TO_IDR,
@@ -306,6 +312,7 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.hfi_id = HFI_PROP_TOTAL_BITRATE,
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
 			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_bitrate,
 	},
 	{
 		.cap_id = BITRATE_PEAK,
@@ -316,6 +323,7 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.hfi_id = HFI_PROP_TOTAL_PEAK_BITRATE,
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
 			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_peak_bitrate,
 	},
 	{
 		.cap_id = BITRATE_MODE,
@@ -326,6 +334,7 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.value = V4L2_MPEG_VIDEO_BITRATE_MODE_VBR,
 		.hfi_id = HFI_PROP_RATE_CONTROL,
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_bitrate_mode_gen2,
 	},
 	{
 		.cap_id = FRAME_SKIP_MODE,
@@ -353,6 +362,7 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.hfi_id = HFI_PROP_MAX_GOP_FRAMES,
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
 			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_u32,
 	},
 	{
 		.cap_id = ENTROPY_MODE,
@@ -363,6 +373,7 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.value = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC,
 		.hfi_id = HFI_PROP_CABAC_SESSION,
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_entropy_mode_gen2,
 	},
 	{
 		.cap_id = MIN_FRAME_QP_H264,
@@ -372,6 +383,7 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.value = MIN_QP_8BIT,
 		.hfi_id = HFI_PROP_MIN_QP_PACKED,
 		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_min_qp,
 	},
 	{
 		.cap_id = MIN_FRAME_QP_HEVC,
@@ -381,6 +393,7 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.value = MIN_QP_8BIT,
 		.hfi_id = HFI_PROP_MIN_QP_PACKED,
 		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_min_qp,
 	},
 	{
 		.cap_id = MAX_FRAME_QP_H264,
@@ -390,6 +403,7 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.value = MAX_QP,
 		.hfi_id = HFI_PROP_MAX_QP_PACKED,
 		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_max_qp,
 	},
 	{
 		.cap_id = MAX_FRAME_QP_HEVC,
@@ -399,6 +413,7 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.value = MAX_QP,
 		.hfi_id = HFI_PROP_MAX_QP_PACKED,
 		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_max_qp,
 	},
 	{
 		.cap_id = I_FRAME_MIN_QP_H264,
@@ -493,6 +508,7 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.hfi_id = HFI_PROP_QP_PACKED,
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
 			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_frame_qp,
 	},
 	{
 		.cap_id = I_FRAME_QP_HEVC,
@@ -503,6 +519,7 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.hfi_id = HFI_PROP_QP_PACKED,
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
 			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_frame_qp,
 	},
 	{
 		.cap_id = P_FRAME_QP_H264,
@@ -513,6 +530,7 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.hfi_id = HFI_PROP_QP_PACKED,
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
 			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_frame_qp,
 	},
 	{
 		.cap_id = P_FRAME_QP_HEVC,
@@ -523,6 +541,7 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.hfi_id = HFI_PROP_QP_PACKED,
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
 			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_frame_qp,
 	},
 	{
 		.cap_id = B_FRAME_QP_H264,
@@ -533,6 +552,7 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.hfi_id = HFI_PROP_QP_PACKED,
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
 			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_frame_qp,
 	},
 	{
 		.cap_id = B_FRAME_QP_HEVC,
@@ -543,6 +563,7 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.hfi_id = HFI_PROP_QP_PACKED,
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
 			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_frame_qp,
 	},
 	{
 		.cap_id = INPUT_BUF_HOST_MAX_COUNT,
@@ -552,6 +573,7 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.value = DEFAULT_MAX_HOST_BUF_COUNT,
 		.hfi_id = HFI_PROP_BUFFER_HOST_MAX_COUNT,
 		.flags = CAP_FLAG_INPUT_PORT,
+		.set = iris_set_u32,
 	},
 	{
 		.cap_id = OUTPUT_BUF_HOST_MAX_COUNT,
@@ -561,6 +583,7 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.value = DEFAULT_MAX_HOST_BUF_COUNT,
 		.hfi_id = HFI_PROP_BUFFER_HOST_MAX_COUNT,
 		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_u32,
 	},
 };
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
index 746b201ededbdb194e833f339e49c24d24b58981..25757d7950aa149b60f6a1c0815cb0e528c09fc3 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
@@ -45,6 +45,7 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 		.step_or_mask = 1,
 		.value = STAGE_2,
 		.hfi_id = HFI_PROPERTY_PARAM_WORK_MODE,
+		.set = iris_set_stage,
 	},
 	{
 		.cap_id = PROFILE_H264,
@@ -59,6 +60,7 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 		.value = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
 		.hfi_id = HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT,
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_profile_level_gen1,
 	},
 	{
 		.cap_id = PROFILE_HEVC,
@@ -70,6 +72,7 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 		.value = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
 		.hfi_id = HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT,
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_profile_level_gen1,
 	},
 	{
 		.cap_id = LEVEL_H264,
@@ -94,6 +97,7 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 		.value = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
 		.hfi_id = HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT,
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_profile_level_gen1,
 	},
 	{
 		.cap_id = LEVEL_HEVC,
@@ -115,6 +119,7 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 		.value = V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
 		.hfi_id = HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT,
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_profile_level_gen1,
 	},
 	{
 		.cap_id = HEADER_MODE,
@@ -125,6 +130,7 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 		.value = V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME,
 		.hfi_id = HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER,
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_header_mode_gen1,
 	},
 	{
 		.cap_id = BITRATE,
@@ -135,6 +141,7 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 		.hfi_id = HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE,
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
 			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_bitrate,
 	},
 	{
 		.cap_id = BITRATE_MODE,
@@ -145,6 +152,7 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 		.value = V4L2_MPEG_VIDEO_BITRATE_MODE_VBR,
 		.hfi_id = HFI_PROPERTY_PARAM_VENC_RATE_CONTROL,
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_bitrate_mode_gen1,
 	},
 	{
 		.cap_id = FRAME_SKIP_MODE,
@@ -168,6 +176,7 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 		.max = (1 << 16) - 1,
 		.step_or_mask = 1,
 		.value = 30,
+		.set = iris_set_u32
 	},
 	{
 		.cap_id = ENTROPY_MODE,
@@ -178,6 +187,7 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 		.value = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC,
 		.hfi_id = HFI_PROPERTY_PARAM_VENC_H264_ENTROPY_CONTROL,
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_entropy_mode_gen1,
 	},
 	{
 		.cap_id = MIN_FRAME_QP_H264,
@@ -187,6 +197,7 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 		.value = MIN_QP_8BIT,
 		.hfi_id = HFI_PROPERTY_PARAM_VENC_SESSION_QP_RANGE_V2,
 		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_qp_range,
 	},
 	{
 		.cap_id = MIN_FRAME_QP_HEVC,
@@ -196,6 +207,7 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 		.value = MIN_QP_8BIT,
 		.hfi_id = HFI_PROPERTY_PARAM_VENC_SESSION_QP_RANGE_V2,
 		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_qp_range,
 	},
 	{
 		.cap_id = MAX_FRAME_QP_H264,
@@ -205,6 +217,7 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 		.value = MAX_QP,
 		.hfi_id = HFI_PROPERTY_PARAM_VENC_SESSION_QP_RANGE_V2,
 		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_qp_range,
 	},
 	{
 		.cap_id = MAX_FRAME_QP_HEVC,
@@ -214,6 +227,7 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 		.value = MAX_QP_HEVC,
 		.hfi_id = HFI_PROPERTY_PARAM_VENC_SESSION_QP_RANGE_V2,
 		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_qp_range,
 	},
 };
 

-- 
2.34.1


