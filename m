Return-Path: <linux-media+bounces-31532-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCC5AA63FB
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 21:20:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DB00188BE59
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 19:20:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 891F522DF8A;
	Thu,  1 May 2025 19:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="me59oPY6"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2FE244673;
	Thu,  1 May 2025 19:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746126964; cv=none; b=DGKShKqw15bgXfsWJ6Us5efO+yVdHDaUlOtM54TgiQpbp99hz000T21Ygyj9ovlVKqW7/8DNm4RGBN1v5bValr3Rsx1t1r2/cBK+MOvFbOu5nV4+62AaFplIAyX1wM4Svogrk42p4Tq5ysGtB9NE1CayAqmLLgQUjQ+SH2wZvcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746126964; c=relaxed/simple;
	bh=m/EW7wEsGJzWUZQgCEAjkHW2T/d03oMWXDGbRpgmqZU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=XiYaKDglXHQXUjVNoO3m0LloghvJAqYFsX9u8wiUHJ+kyAR1Z1rOkMZByIATrlDKE4avA+PGdNiGMTX1LeiPyC//Ca8aRU28OIlRz3WBUk88fqczt5PhnwW8zMg1xKBlnUAXT6k6qWwFtWqnDOj0PgBYI3NsWHm/Fr41WQ+5tGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=me59oPY6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 541D25VW008643;
	Thu, 1 May 2025 19:15:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KOOP+5eKLUoeWI4xwXDw+rGKYhtdyDYXXj7JHUprmH4=; b=me59oPY6guE5kM5D
	h7cwFv7ZdNKqknBWvmXXpEIDObZsk7b22x3htztctYbu+yGCoPSk1ZbiLGYWWElH
	kOYWEvvFH87M8YLyAvK3CcrOgAmmoUS3hiRk2K6UsoVCJ8RDH245oFGBuZI24AvE
	QSmm7g1RBDZazaqkNFSIHHgeEY7e6gmNhImJjBtH8vW3piz++7Vd02lg3oIJYiK7
	G2m0lnOUZRyPISSPDyhmYCxqYLHr2Ek3gGABZhloLRtQOwWlCy5Ne2btC/L3ujYk
	115Kd28pSy8aLbSFc7RoQ8Jf1V0QxcwFL1WAo9Iq0SSnpwHXoKaYSE01Q/WBWwxc
	HDVVRA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6uae3jq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 May 2025 19:15:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 541JFvW4004868
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 1 May 2025 19:15:57 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 1 May 2025 12:15:51 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 2 May 2025 00:43:50 +0530
Subject: [PATCH v3 20/23] media: iris: Add platform capabilities for HEVC
 and VP9 decoders
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250502-qcom-iris-hevc-vp9-v3-20-552158a10a7d@quicinc.com>
References: <20250502-qcom-iris-hevc-vp9-v3-0-552158a10a7d@quicinc.com>
In-Reply-To: <20250502-qcom-iris-hevc-vp9-v3-0-552158a10a7d@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Nicolas Dufresne
	<nicolas.dufresne@collabora.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        <20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org>,
        <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746126827; l=17409;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=m/EW7wEsGJzWUZQgCEAjkHW2T/d03oMWXDGbRpgmqZU=;
 b=mbUhZl8lcZcahNkfIelc3CCoGxTBqFw8WkBfMKNRzHPcD52tGg2SOcs/f3Xu1F5tM8PPP8iqX
 tS9IF3Wb8iUBZIrn4f2DIrvzIf8o2jruaMhpQXxOZaqX6gEZ7riqkrc
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=BNizrEQG c=1 sm=1 tr=0 ts=6813c86d cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=rY3udxcY2z9nEhSwD0QA:9
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDE0NyBTYWx0ZWRfX14yjiz7T9X2k iVrS5w7BQYl369nyxzX3Cv4dJO92Sk9ssK2jkLgxuL6qm+wJrcMj9WzseJKm3xRl2EKJLSjCDtB Olh957o1mvPm08hRsxrel29BO3wMAytiW/ylqiK60mDvSpdG2SxwC9eLyKd7M0Jz9wmoj2YVfDh
 vtqu0bu0nw/AoPzD389CjboKu31GVif3b+a7F/CsGQWp58amf68qmScgYtTOUOe+P1/f78o4Ndz dki51MZ04bdQUeTYEQmQgsVRzp5iybI1jSDNOcX7kUT1tDrQ9tSrVma1G3NQpfYXu7Jz7HLeL3N fj+rjm5xqCnuXcDhXpo8Zbts03kZkY5rrQRg9TWsBP0yTBvRzAn5Gbb6rClobmkENBoyd9Q0RJa
 9mQhg6Et3zxK+ayNdPG2fPprmVzh6RfMb245LQ8dMXUKwRs6JYg4ugEEpjEPn2Fu07IZREP7
X-Proofpoint-GUID: PlDJIwxIQlVMOzE3ur21ViQ8pEzz8rlz
X-Proofpoint-ORIG-GUID: PlDJIwxIQlVMOzE3ur21ViQ8pEzz8rlz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0
 phishscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505010147

Add platform capabilities for HEVC and VP9 codecs in decoder driver
with related hooks.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
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
index 13f5cf0d0e8a..9136b723c0f2 100644
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
index f23be2340658..8c91d336ff7e 100644
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
index 283d2f27e4c8..5f13dc11bea5 100644
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
index 2267e220c9ea..1b8787c0f6a7 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -572,8 +572,21 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
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
@@ -797,8 +810,21 @@ static void iris_hfi_gen2_init_src_change_param(struct iris_inst *inst)
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
index 3e0ae87526a0..71d23214f224 100644
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
index deb7037e8e86..c2cded2876b7 100644
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
index f82355d72fcf..a8d66ed388a3 100644
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


