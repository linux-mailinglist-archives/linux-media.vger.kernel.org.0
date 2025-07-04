Return-Path: <linux-media+bounces-36791-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8CBAF8AD9
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 10:12:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC95C4A5A31
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 08:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C95E2F3644;
	Fri,  4 Jul 2025 07:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mGYzBVyA"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A315D2EF9C0;
	Fri,  4 Jul 2025 07:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615699; cv=none; b=J95JDHuJQP7xIA7RW31L69dp1vCul5odqaIfKXXyz9mpGHBWqOPYZeiaPjWKgnke2ZL/61/zlnnicXdS84abV0R+a7QcPrFH1JGoWS/KhqVf9G7IQJVehUoEV1DUU1p1xp6lzC4kej1g64IgUyiG9cNzcw+Q4TkEZee0q8Z3fAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615699; c=relaxed/simple;
	bh=yt78twjOxPyZbieKiQQQU/NnoiWl6RPUhKn4rxAT7dg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ISlpTcFZ79iBY/LpUqY3XxehVg1hZ2JIgQV97TdXLum7NBG2Ae593Px1OItbWf9cTVhsw0p1f3V755hCHUAXzCfEcgaUVSzjBFP/xgMW5MRFNK1Hz5LTwBgATaP0Q2mN5j8FOwkqS1YhptI2Ga7hj/8X8GC7jeZT5SeSM72p3A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mGYzBVyA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563Ik5Iw005534;
	Fri, 4 Jul 2025 07:54:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j8VP0uY6ce7iO6Gli1yCrQl3pDIoNzbV4UbyrGt6k1A=; b=mGYzBVyA8fdyJzMz
	tCr3p3MFrQVWFcfhgXSP7T1uIdjpLl/6nzXYn7d5Fz7j3OrMyYyIdZ9rf/Z0EZLf
	Vt2OF4puKcNfs5eg/tMG6aWvQZwh/2B7F0npgx9QrFiC2kxVDrj7LQxC5Sy3X3f5
	UtidVWN2YoCT0+/flX/6oZXYLQpV16Z9gWrNEj/6Z/kXjvL978IgzfNCnNxBwYTd
	TajZ81xYtscKcvS3JZQWLiJSqkrUGLkFOJ7wZVmpwGjR2m0TkgwFE+5tbojyJ4ak
	s1C23yjV2yIlLKvC6MvdJei1N6RZtSSJVs2BC+GwpXzloIatfUgjwCe8Wu46uQAD
	Lz6YoQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qmjtu7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 07:54:39 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5647scYs026045
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Jul 2025 07:54:38 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 4 Jul 2025 00:54:34 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 4 Jul 2025 13:23:22 +0530
Subject: [PATCH 22/25] media: iris: Set platform capabilities to firmware
 for encoder video device
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250704-iris-video-encoder-v1-22-b6ce24e273cf@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751615599; l=47077;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=yt78twjOxPyZbieKiQQQU/NnoiWl6RPUhKn4rxAT7dg=;
 b=uIhAI1EReF4J5yQHUAyzFjNvZsxYxMZcQLhRzhwEmfW8HDhRjwvJ3jWM6uV6WHJqW9EWclUcM
 Y2tKLHFX+X3AbUQ5zXTvHt7QZyHLnSCBnxKge4Wndc6wyvEmIVXUPD5
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=686788bf cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=T8pL2teHXzhsmah6oQwA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: iJZwvNFO6MiW1fJBMrH-3cBKKeNs1yiW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA2MCBTYWx0ZWRfX3ql3y2Ran7Ct
 HZZJi27axhZoArKUxFsTeDIo5XeTdpaLI6RQagcF7iRhJ7oSJXH2BUfQg/exOUl+Y0dteyYR2SX
 9vnoNZWoffgLAcZreq0mnl4arZR9JiSUw98qC2jk24d6LZTrm4/CeC85aPJ+noW339VWY+x8ErG
 XE5QsJ3y2YcBW1MtDy9zN62iaKfpaInAAs2ORRqlnO/yYQNtk6U6E2HZJ4Yj1prBAWtuGInuzDB
 A0IFG2seExkClbu8sWQlLTHxHorjmTsh7xSJvcY1B8qQPDAVCXExt33wM26y+cwAKhFchqDa8Oe
 D6+VTHvpLteyA09Dwc6MbIsS6lUM9c6fTSLSM4mreCyDhZ76h10ocUvRH6/qeYXiCRB+3EpM+rD
 gvhEIokcS7jEdUlvlYTuhAVWd2IUBo2lqdgLdDV1saMwgQIGvK1NtVqZ0H0H+AjClMxs3V3g
X-Proofpoint-GUID: iJZwvNFO6MiW1fJBMrH-3cBKKeNs1yiW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040060

Initialize and configure platform-specific capabilities for the encoder
in the firmware during stream-on, to tailor encoding behavior to the
current session's requirements. Some of these capabilities can also be
updated dynamically when V4L2 controls are modified by the client after
stream-on.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c     |   8 +
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 500 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  15 +
 .../platform/qcom/iris/iris_hfi_gen1_command.c     | 117 +++++
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  47 +-
 .../platform/qcom/iris/iris_hfi_gen1_response.c    |   8 +-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  32 +-
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |   9 +-
 drivers/media/platform/qcom/iris/iris_instance.h   |   3 +-
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  21 +
 .../platform/qcom/iris/iris_platform_sm8250.c      |  15 +
 11 files changed, 745 insertions(+), 30 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index f9036057779830624eafe83e8c906a05ec3b3210..8ec10e6058f2b66c923a9925048f90537603004b 100644
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
index fead3318743a09ecdc363eda4cbf252f640eb6e0..a575d618a341cceb5b06257466994544a5e61862 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -539,6 +539,123 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
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
+	case HFI_PROPERTY_CONFIG_VENC_MAX_BITRATE: {
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
index dd6521bc2dfeab652ded11698a88a9f850f01695..6ce166fb42c7ae4823f88d7303d651752018ea2d 100644
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
@@ -389,6 +399,31 @@ struct hfi_buffer_requirements {
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
index bfafd7c436116423bd3e8ecd4cf24038e383d2c8..8c0dd09c592df1c679e3e98590ba1b430c6d21c9 100644
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
 		.value = MIN_QP_8BIT,
 		.hfi_id = HFI_PROP_MAX_QP_PACKED,
 		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_max_qp,
 	},
 	{
 		.cap_id = MAX_FRAME_QP_HEVC,
@@ -399,6 +413,7 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.value = MIN_QP_8BIT,
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
 };
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
index 34960d250d09dd872749dd19cdd3316e94575b81..cd09442be9675af9674f74679932285d3c0197c1 100644
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
 		.value = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
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
 		.cap_id = BITRATE_PEAK,
@@ -145,6 +152,7 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 		.hfi_id = HFI_PROPERTY_CONFIG_VENC_MAX_BITRATE,
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
 			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_peak_bitrate,
 	},
 	{
 		.cap_id = BITRATE_MODE,
@@ -155,6 +163,7 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 		.value = V4L2_MPEG_VIDEO_BITRATE_MODE_VBR,
 		.hfi_id = HFI_PROPERTY_PARAM_VENC_RATE_CONTROL,
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_bitrate_mode_gen1,
 	},
 	{
 		.cap_id = FRAME_SKIP_MODE,
@@ -178,6 +187,7 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 		.max = (1 << 16) - 1,
 		.step_or_mask = 1,
 		.value = 30,
+		.set = iris_set_u32
 	},
 	{
 		.cap_id = ENTROPY_MODE,
@@ -188,6 +198,7 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 		.value = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC,
 		.hfi_id = HFI_PROPERTY_PARAM_VENC_H264_ENTROPY_CONTROL,
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_entropy_mode_gen1,
 	},
 	{
 		.cap_id = MIN_FRAME_QP_H264,
@@ -197,6 +208,7 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 		.value = MIN_QP_8BIT,
 		.hfi_id = HFI_PROPERTY_PARAM_VENC_SESSION_QP_RANGE_V2,
 		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_qp_range,
 	},
 	{
 		.cap_id = MIN_FRAME_QP_HEVC,
@@ -206,6 +218,7 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 		.value = MIN_QP_8BIT,
 		.hfi_id = HFI_PROPERTY_PARAM_VENC_SESSION_QP_RANGE_V2,
 		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_qp_range,
 	},
 	{
 		.cap_id = MAX_FRAME_QP_H264,
@@ -215,6 +228,7 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 		.value = MAX_QP,
 		.hfi_id = HFI_PROPERTY_PARAM_VENC_SESSION_QP_RANGE_V2,
 		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_qp_range,
 	},
 	{
 		.cap_id = MAX_FRAME_QP_HEVC,
@@ -224,6 +238,7 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 		.value = MAX_QP_HEVC,
 		.hfi_id = HFI_PROPERTY_PARAM_VENC_SESSION_QP_RANGE_V2,
 		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_qp_range,
 	},
 };
 

-- 
2.34.1


