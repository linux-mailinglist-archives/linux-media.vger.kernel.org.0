Return-Path: <linux-media+bounces-32108-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB9FAB0D9B
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 10:46:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EB3B17BBF48
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 08:44:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 022A8278E60;
	Fri,  9 May 2025 08:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OAidnSHG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC7727702B;
	Fri,  9 May 2025 08:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746780056; cv=none; b=FVSqGryJ/B/ikheGHlS9t5QocRCYNNv8E2u+SCRHx4ICFkySJCLtVg3cBjqV1a0jRRMYCmM6oZwobgBrqb+lZznptl0dMlZ3iJi+2YbaL4H8tesYVpQLtm866sJAgs+Pksra1W+EWNnsN7Bsu5nyZvTJasw7LDc54uAOUG1fem0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746780056; c=relaxed/simple;
	bh=I4lhoZJc5ygYnRAmQgB2n6pViQ59VcZQmEFVYHSGtJ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=TbR8E4xWw9LlqknNFz1IZ+3R8htmk7AWUDn4V3FP9netj2U64NkNgk49zfKmBGjbvMPLKZUrJWvAUlzOgccybikDlak2GRut6Xw429Th0a6erW/dLZEkdOatTzY1ZWtOPyow8B05bGPjLJQz97hX+UB5Q+ycfhkpGgCbIRZ/4sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OAidnSHG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54933Dfv031703;
	Fri, 9 May 2025 08:40:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iYbqYcxt8yLF5QO6lLuhaO55++t74y7FK7DuOaigzv0=; b=OAidnSHG1lTKDVeZ
	PLx7tYrPs686Ck5vRZZSHYRGZZ/svaE4dgkwKQSnirdUkfhqasiTNGUEm020hRPG
	k7YWf/CO13qscdCuEweo22zF1nirZ3flwGluZDQadRVn0paW32Ylw63irzOtgSpW
	1nnOZOzl6LnTzOlfd6t4PcjV+3pIkKmnCvgryNeQTs0baxLb+z3z85tDl4H8lqTF
	9KTcGv6pAbOWZhn1iS+2HknbcSUDwTPDPrjMsILkWG02wTIxCEGP/rN/d4ovMfJr
	Wz8LKMtV7/7Cz6Htz+1oBlWDhscRTf6X76elVZoEx9vUzXk6sPFvPowTh1CjVNF7
	T03+Hw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnpgkxh5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 08:40:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5498elpX001798
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 May 2025 08:40:47 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 9 May 2025 01:40:43 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 9 May 2025 14:09:09 +0530
Subject: [PATCH v5 23/26] media: iris: Add platform capabilities for HEVC
 and VP9 decoders
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250509-video-iris-hevc-vp9-v5-23-59b4ff7d331c@quicinc.com>
References: <20250509-video-iris-hevc-vp9-v5-0-59b4ff7d331c@quicinc.com>
In-Reply-To: <20250509-video-iris-hevc-vp9-v5-0-59b4ff7d331c@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt
	<stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Nicolas Dufresne
	<nicolas.dufresne@collabora.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746779937; l=18085;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=I4lhoZJc5ygYnRAmQgB2n6pViQ59VcZQmEFVYHSGtJ4=;
 b=Vcu9ZJhs4ToOrY26bCO8TF2Gh7iFzWQnZXSxzd4U0cJWjIS4Dz4sftE2+BLETNi6kn4tQLb/u
 XSc8AMNUhX3BUhXC7Cjj736ssLQuRVq/8Vk5k+9T2osyQVB+Bs8m1i2
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Ao/u3P9P c=1 sm=1 tr=0 ts=681dbf91 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=D5nq5tt_Ko1ybWLJy9sA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA4MyBTYWx0ZWRfX/Kb9J9y/s9hj
 95e3KqjsM4dayOIPn0qD8aXs/nz4XgUEtg5JBUcfEYpK8TMM8WoqBypxbNNDlFqBCWpP7uL/YEw
 uzr3dZm0Klyrj4XsVbN2oETLMtAMex7V9raT/dY94kxQMOojYxYbuoE+UfWGRqbBssgubZzZcOG
 ujLL4GYazAYRX1XRt8wjsacaVYw+DzgVaslNA9EevNBXI2IUZjnZndhivt0ApMgIerp0KsUnUgI
 oO8eKDlQQ/E/uJe4/3yIzCQFZMH1r5uPYf+svzhuZYnnlluFIj3/Lg6HVAs7tA75TODLx/Yx6KH
 PfLsmxESMQO+TutcggozZwC74aMFRtYMZiu0xmvgZTVBLunczSZbxNs8ugMfw3oGfHEmqrxUh+w
 buAf92wV9GacxfPH3vvDa7uban402IIwFEbOPwkyC58kXjfYpos9D4qVE5yqhhhiMppfM7Wh
X-Proofpoint-GUID: hqq7XoVSE6W0rEK9f0HDlJZOAKtJsowl
X-Proofpoint-ORIG-GUID: hqq7XoVSE6W0rEK9f0HDlJZOAKtJsowl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_03,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090083

Add platform capabilities for HEVC and VP9 codecs in decoder driver
with related hooks.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      |  28 ++++-
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |  28 ++++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   1 +
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  34 +++++-
 .../platform/qcom/iris/iris_platform_common.h      |   8 +-
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  80 ++++++++++++-
 .../platform/qcom/iris/iris_platform_qcs8300.h     | 126 +++++++++++++++++----
 7 files changed, 266 insertions(+), 39 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 13f5cf0d0e8a445aa68fa87a3569bd99ac23a32a..9136b723c0f2a3d5833af32ae2735ccdb244f60f 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -18,9 +18,19 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
 {
 	switch (id) {
 	case V4L2_CID_MPEG_VIDEO_H264_PROFILE:
-		return PROFILE;
+		return PROFILE_H264;
+	case V4L2_CID_MPEG_VIDEO_HEVC_PROFILE:
+		return PROFILE_HEVC;
+	case V4L2_CID_MPEG_VIDEO_VP9_PROFILE:
+		return PROFILE_VP9;
 	case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
-		return LEVEL;
+		return LEVEL_H264;
+	case V4L2_CID_MPEG_VIDEO_HEVC_LEVEL:
+		return LEVEL_HEVC;
+	case V4L2_CID_MPEG_VIDEO_VP9_LEVEL:
+		return LEVEL_VP9;
+	case V4L2_CID_MPEG_VIDEO_HEVC_TIER:
+		return TIER;
 	default:
 		return INST_FW_CAP_MAX;
 	}
@@ -32,10 +42,20 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 		return 0;
 
 	switch (cap_id) {
-	case PROFILE:
+	case PROFILE_H264:
 		return V4L2_CID_MPEG_VIDEO_H264_PROFILE;
-	case LEVEL:
+	case PROFILE_HEVC:
+		return V4L2_CID_MPEG_VIDEO_HEVC_PROFILE;
+	case PROFILE_VP9:
+		return V4L2_CID_MPEG_VIDEO_VP9_PROFILE;
+	case LEVEL_H264:
 		return V4L2_CID_MPEG_VIDEO_H264_LEVEL;
+	case LEVEL_HEVC:
+		return V4L2_CID_MPEG_VIDEO_HEVC_LEVEL;
+	case LEVEL_VP9:
+		return V4L2_CID_MPEG_VIDEO_VP9_LEVEL;
+	case TIER:
+		return V4L2_CID_MPEG_VIDEO_HEVC_TIER;
 	default:
 		return 0;
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index f23be2340658605a6266ac168ae7346af503a683..8c91d336ff7e25256c7d496c46a5e07f47cf1df2 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -295,7 +295,19 @@ static int iris_hfi_gen2_set_profile(struct iris_inst *inst)
 {
 	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
 	u32 port = iris_hfi_gen2_get_port(V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
-	u32 profile = inst->fw_caps[PROFILE].value;
+	u32 profile = 0;
+
+	switch (inst->codec) {
+	case V4L2_PIX_FMT_HEVC:
+		profile = inst->fw_caps[PROFILE_HEVC].value;
+		break;
+	case V4L2_PIX_FMT_VP9:
+		profile = inst->fw_caps[PROFILE_VP9].value;
+		break;
+	case V4L2_PIX_FMT_H264:
+		profile = inst->fw_caps[PROFILE_H264].value;
+		break;
+	}
 
 	inst_hfi_gen2->src_subcr_params.profile = profile;
 
@@ -312,7 +324,19 @@ static int iris_hfi_gen2_set_level(struct iris_inst *inst)
 {
 	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
 	u32 port = iris_hfi_gen2_get_port(V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
-	u32 level = inst->fw_caps[LEVEL].value;
+	u32 level = 0;
+
+	switch (inst->codec) {
+	case V4L2_PIX_FMT_HEVC:
+		level = inst->fw_caps[LEVEL_HEVC].value;
+		break;
+	case V4L2_PIX_FMT_VP9:
+		level = inst->fw_caps[LEVEL_VP9].value;
+		break;
+	case V4L2_PIX_FMT_H264:
+		level = inst->fw_caps[LEVEL_H264].value;
+		break;
+	}
 
 	inst_hfi_gen2->src_subcr_params.level = level;
 
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index 283d2f27e4c8e80554cafed816b0951fa5a9ee76..5f13dc11bea532600cc9b15db57e8981a1f3eb93 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -46,6 +46,7 @@
 #define HFI_PROP_CROP_OFFSETS			0x03000105
 #define HFI_PROP_PROFILE			0x03000107
 #define HFI_PROP_LEVEL				0x03000108
+#define HFI_PROP_TIER				0x03000109
 #define HFI_PROP_STAGE				0x0300010a
 #define HFI_PROP_PIPE				0x0300010b
 #define HFI_PROP_LUMA_CHROMA_BIT_DEPTH		0x0300010f
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index b6d0ff860d7866c85c7768ec263f0d30b42446a6..8e54962414aeb6a834980fc31d340d34b6ee0992 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -571,8 +571,21 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
 	inst->crop.width = pixmp_ip->width -
 		((subsc_params.crop_offsets[1] >> 16) & 0xFFFF) - inst->crop.left;
 
-	inst->fw_caps[PROFILE].value = subsc_params.profile;
-	inst->fw_caps[LEVEL].value = subsc_params.level;
+	switch (inst->codec) {
+	case V4L2_PIX_FMT_HEVC:
+		inst->fw_caps[PROFILE_HEVC].value = subsc_params.profile;
+		inst->fw_caps[LEVEL_HEVC].value = subsc_params.level;
+		break;
+	case V4L2_PIX_FMT_VP9:
+		inst->fw_caps[PROFILE_VP9].value = subsc_params.profile;
+		inst->fw_caps[LEVEL_VP9].value = subsc_params.level;
+		break;
+	case V4L2_PIX_FMT_H264:
+		inst->fw_caps[PROFILE_H264].value = subsc_params.profile;
+		inst->fw_caps[LEVEL_H264].value = subsc_params.level;
+		break;
+	}
+
 	inst->fw_caps[POC].value = subsc_params.pic_order_cnt;
 
 	if (subsc_params.bit_depth != BIT_DEPTH_8 ||
@@ -796,8 +809,21 @@ static void iris_hfi_gen2_init_src_change_param(struct iris_inst *inst)
 					     full_range, video_format,
 					     video_signal_type_present_flag);
 
-	subsc_params->profile = inst->fw_caps[PROFILE].value;
-	subsc_params->level = inst->fw_caps[LEVEL].value;
+	switch (inst->codec) {
+	case V4L2_PIX_FMT_HEVC:
+		subsc_params->profile = inst->fw_caps[PROFILE_HEVC].value;
+		subsc_params->level = inst->fw_caps[LEVEL_HEVC].value;
+		break;
+	case V4L2_PIX_FMT_VP9:
+		subsc_params->profile = inst->fw_caps[PROFILE_VP9].value;
+		subsc_params->level = inst->fw_caps[LEVEL_VP9].value;
+		break;
+	case V4L2_PIX_FMT_H264:
+		subsc_params->profile = inst->fw_caps[PROFILE_H264].value;
+		subsc_params->level = inst->fw_caps[LEVEL_H264].value;
+		break;
+	}
+
 	subsc_params->pic_order_cnt = inst->fw_caps[POC].value;
 	subsc_params->bit_depth = inst->fw_caps[BIT_DEPTH].value;
 	if (inst->fw_caps[CODED_FRAMES].value ==
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 3e0ae87526a0c95a46ddcfd75deda17e4c7dbdd4..71d23214f224ce55aba7c8f13e06f9b1d3e7d19e 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -81,8 +81,12 @@ struct platform_inst_caps {
 };
 
 enum platform_inst_fw_cap_type {
-	PROFILE = 1,
-	LEVEL,
+	PROFILE_H264 = 1,
+	PROFILE_HEVC,
+	PROFILE_VP9,
+	LEVEL_H264,
+	LEVEL_HEVC,
+	LEVEL_VP9,
 	INPUT_BUF_HOST_MAX_COUNT,
 	STAGE,
 	PIPE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index deb7037e8e86fe803ddb43f1ce6630815e798cb8..c2cded2876b74afbd1cd427c91df73905f23ca3f 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -17,7 +17,7 @@
 
 static struct platform_inst_fw_cap inst_fw_cap_sm8550[] = {
 	{
-		.cap_id = PROFILE,
+		.cap_id = PROFILE_H264,
 		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
 		.max = V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH,
 		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
@@ -31,7 +31,29 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550[] = {
 		.set = iris_set_u32_enum,
 	},
 	{
-		.cap_id = LEVEL,
+		.cap_id = PROFILE_HEVC,
+		.min = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
+		.max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE),
+		.value = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
+		.hfi_id = HFI_PROP_PROFILE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_u32_enum,
+	},
+	{
+		.cap_id = PROFILE_VP9,
+		.min = V4L2_MPEG_VIDEO_VP9_PROFILE_0,
+		.max = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_VP9_PROFILE_0) |
+				BIT(V4L2_MPEG_VIDEO_VP9_PROFILE_2),
+		.value = V4L2_MPEG_VIDEO_VP9_PROFILE_0,
+		.hfi_id = HFI_PROP_PROFILE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_u32_enum,
+	},
+	{
+		.cap_id = LEVEL_H264,
 		.min = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
 		.max = V4L2_MPEG_VIDEO_H264_LEVEL_6_2,
 		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_0) |
@@ -59,6 +81,60 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550[] = {
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
 		.set = iris_set_u32_enum,
 	},
+	{
+		.cap_id = LEVEL_HEVC,
+		.min = V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
+		.max = V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_1) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_6) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_6_1) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2),
+		.value = V4L2_MPEG_VIDEO_HEVC_LEVEL_6_1,
+		.hfi_id = HFI_PROP_LEVEL,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_u32_enum,
+	},
+	{
+		.cap_id = LEVEL_VP9,
+		.min = V4L2_MPEG_VIDEO_VP9_LEVEL_1_0,
+		.max = V4L2_MPEG_VIDEO_VP9_LEVEL_6_0,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_1_0) |
+				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_1_1) |
+				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_2_0) |
+				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_2_1) |
+				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_3_0) |
+				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_3_1) |
+				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_4_0) |
+				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_4_1) |
+				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_5_0) |
+				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_5_1) |
+				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_5_2) |
+				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_6_0),
+		.value = V4L2_MPEG_VIDEO_VP9_LEVEL_6_0,
+		.hfi_id = HFI_PROP_LEVEL,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_u32_enum,
+	},
+	{
+		.cap_id = TIER,
+		.min = V4L2_MPEG_VIDEO_HEVC_TIER_MAIN,
+		.max = V4L2_MPEG_VIDEO_HEVC_TIER_HIGH,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_TIER_MAIN) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_TIER_HIGH),
+		.value = V4L2_MPEG_VIDEO_HEVC_TIER_HIGH,
+		.hfi_id = HFI_PROP_TIER,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_u32_enum,
+	},
 	{
 		.cap_id = INPUT_BUF_HOST_MAX_COUNT,
 		.min = DEFAULT_MAX_HOST_BUF_COUNT,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
index f82355d72fcffe7e361bd30877cccb83fe9b549f..a8d66ed388a34e6bb45d4a089d981bb7d135fb50 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
@@ -5,48 +5,124 @@
 
 static struct platform_inst_fw_cap inst_fw_cap_qcs8300[] = {
 	{
-		.cap_id = PROFILE,
+		.cap_id = PROFILE_H264,
 		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
 		.max = V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH,
 		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
-			BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH) |
-			BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
-			BIT(V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
-			BIT(V4L2_MPEG_VIDEO_H264_PROFILE_HIGH),
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_HIGH) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH),
 		.value = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
 		.hfi_id = HFI_PROP_PROFILE,
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
 		.set = iris_set_u32_enum,
 	},
 	{
-		.cap_id = LEVEL,
+		.cap_id = PROFILE_HEVC,
+		.min = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
+		.max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE),
+		.value = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
+		.hfi_id = HFI_PROP_PROFILE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_u32_enum,
+	},
+	{
+		.cap_id = PROFILE_VP9,
+		.min = V4L2_MPEG_VIDEO_VP9_PROFILE_0,
+		.max = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_VP9_PROFILE_0) |
+				BIT(V4L2_MPEG_VIDEO_VP9_PROFILE_2),
+		.value = V4L2_MPEG_VIDEO_VP9_PROFILE_0,
+		.hfi_id = HFI_PROP_PROFILE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_u32_enum,
+	},
+	{
+		.cap_id = LEVEL_H264,
 		.min = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
 		.max = V4L2_MPEG_VIDEO_H264_LEVEL_6_2,
 		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_0) |
-			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1B)  |
-			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_1) |
-			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_2) |
-			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_3) |
-			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_0) |
-			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_1) |
-			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_2) |
-			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_0) |
-			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_1) |
-			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_2) |
-			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_0) |
-			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_1) |
-			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_2) |
-			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_0) |
-			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_1) |
-			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_2) |
-			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_0) |
-			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_1) |
-			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_2),
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1B) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_1) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_2) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_3) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_0) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_1) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_2) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_0) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_1) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_2) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_0) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_1) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_2) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_0) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_1) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_2) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_0) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_1) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_2),
 		.value = V4L2_MPEG_VIDEO_H264_LEVEL_6_1,
 		.hfi_id = HFI_PROP_LEVEL,
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
 		.set = iris_set_u32_enum,
 	},
+	{
+		.cap_id = LEVEL_HEVC,
+		.min = V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
+		.max = V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_1) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_6) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_6_1) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2),
+		.value = V4L2_MPEG_VIDEO_HEVC_LEVEL_6_1,
+		.hfi_id = HFI_PROP_LEVEL,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_u32_enum,
+	},
+	{
+		.cap_id = LEVEL_VP9,
+		.min = V4L2_MPEG_VIDEO_VP9_LEVEL_1_0,
+		.max = V4L2_MPEG_VIDEO_VP9_LEVEL_6_0,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_1_0) |
+				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_1_1) |
+				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_2_0) |
+				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_2_1) |
+				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_3_0) |
+				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_3_1) |
+				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_4_0) |
+				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_4_1) |
+				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_5_0) |
+				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_5_1) |
+				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_5_2) |
+				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_6_0),
+		.value = V4L2_MPEG_VIDEO_VP9_LEVEL_6_0,
+		.hfi_id = HFI_PROP_LEVEL,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_u32_enum,
+	},
+	{
+		.cap_id = TIER,
+		.min = V4L2_MPEG_VIDEO_HEVC_TIER_MAIN,
+		.max = V4L2_MPEG_VIDEO_HEVC_TIER_HIGH,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_TIER_MAIN) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_TIER_HIGH),
+		.value = V4L2_MPEG_VIDEO_HEVC_TIER_HIGH,
+		.hfi_id = HFI_PROP_TIER,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_u32_enum,
+	},
 	{
 		.cap_id = INPUT_BUF_HOST_MAX_COUNT,
 		.min = DEFAULT_MAX_HOST_BUF_COUNT,

-- 
2.34.1


