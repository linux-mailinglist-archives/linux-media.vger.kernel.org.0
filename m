Return-Path: <linux-media+bounces-36785-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAF5AF8AA6
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 10:07:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46FA66E8013
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 08:04:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AB2D2E7F21;
	Fri,  4 Jul 2025 07:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EO9Qz/9R"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF162E11D9;
	Fri,  4 Jul 2025 07:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615684; cv=none; b=ghCuOESemG71D0RpbrwEPxYlH130qaS2A56pYBUALNNvtfw6RmEicjz92v0JTihG01iEzR/jl3TuyVoaUca6m18TmWy8sOTkGowMCybHidtf8Zx+L2DhpPVzYwCJqTC5TyymWgYK9qSh+MCgwIx/kw5ud5TDgn6WDYP7kJkopYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615684; c=relaxed/simple;
	bh=SM6B09cEtLr0cQW3/wslUhcw6mhZD/RfYeYb2WABNkg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=qxxQwu6pN96lMLDWfodTn+IdYYWvcuIuBnDoEam2y0wKJS4OvLntiXHvKC+yT1xik6sCF/lQbedBW/Evq7OTjMYgMYSxOHkJ5TRFi0CjsGDwgv3jmR4AiIrR6PVqP9YUX9bDfjq506xsCs317vYORCVx+Oh7bts0AYGrWWEfo9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EO9Qz/9R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56467jRI028627;
	Fri, 4 Jul 2025 07:54:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xh6OWGtiWQgLaDZ2BaY7HS7ssnTCySoBxOxcFfoCiKY=; b=EO9Qz/9R54UyUJw8
	G/hpImVlX9ODKvU6hMzM7Nj8orpF+z5PHjOanle+6yfp+zUtlRonp4NeprmMM8/+
	W38Pdw2tCTIlbETLzvowvDEaYgAJGtjUcVI0kAx8CrxncLMdg1j120ul4eBNe04z
	ijcvwDLHXnHaFpvvvi4ThTBgPmB5S18RrBHhMbBDGsl1fGjgnmF6+0My7egmK8yE
	Kj+vuLm4FqZdh+9zwbST4AL90iFtWzwrTvc1/4vMtjvGcVRXQZQxardnwaTemd/W
	pJdyPKR+RwlcH55mUPjLClxGYZeM+6tTlASCJ7spTelzixehyHN4uQBUS7jhnOM9
	ldXRoA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bw34xf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 07:54:31 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5647sVqZ025827
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Jul 2025 07:54:31 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 4 Jul 2025 00:54:27 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 4 Jul 2025 13:23:20 +0530
Subject: [PATCH 20/25] media: iris: Add platform-specific capabilities for
 encoder video device
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250704-iris-video-encoder-v1-20-b6ce24e273cf@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751615599; l=47902;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=SM6B09cEtLr0cQW3/wslUhcw6mhZD/RfYeYb2WABNkg=;
 b=v8tZivfsu6uarc2h17mez2VoZPDZqm5vCltJcSeRmEX+9iyN757/evWcBQdejV6nkSHKn68oB
 MhsGwDBmxb6Ba5GQ3UTki9NJZd+GyUy/DERIOv6ZsBuZqdsWZSp6Tdy
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6t63fY6GMGZwHKhP_LsNvOZcovC_IXpU
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=686788b7 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=ScKKUSS3TOtuzMhYn2MA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 6t63fY6GMGZwHKhP_LsNvOZcovC_IXpU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA2MCBTYWx0ZWRfX1gvUSirzGHmf
 Auxa9otYmTnpuGdBsmliXV4IQaQmQjZ6YR6zsyWCuk02knDmE9AkvuzweUGW3gHtDGUKcgBVrVB
 Rz85nlFXahjl7nVX8fji/b5/CEm4Db4ezDdqKbZz+GS+K5LnkMdZw3d5nDjhA0Uou0ND2+dSwgs
 VDB4hBL+Y6g5FQa20GAFSp6dU4w6QqRGbRM0MZ9XXI5RCC5JeL7Afou/K/9YPUOiiG2bQoqUlNv
 8DrclUCU4DURi+i+q+h0L4TvX89eR8Wvl4XhGH5QCO/77TD33clp4AxSCi8MmELA6zSv5S4hnh6
 IqtQgBDTb14WQEE6xQJ98hJsLntAOE/fEgI83HDuSzBIDQVDqNSgp9uRyo5vrQjSWbngAiOhz50
 Tze1BK8D4QliOhV8rrqXBMtNkmHipaS4ppS4KNV4C4xqqwSCU8q0NNAhr3x7BUMySQpX1FRT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040060

Add platform-specific capabilities for the encoder video device and
initialize the corresponding controls in the control handler.

This enables proper configuration and handling of encoder-specific
features based on platform requirements.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_core.h       |   7 +-
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 175 +++++++++-
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |   8 +
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   9 +
 .../platform/qcom/iris/iris_platform_common.h      |  42 ++-
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 367 ++++++++++++++++++++-
 .../platform/qcom/iris/iris_platform_qcs8300.h     | 350 +++++++++++++++++++-
 .../platform/qcom/iris/iris_platform_sm8250.c      | 195 ++++++++++-
 drivers/media/platform/qcom/iris/iris_vdec.c       |   2 +-
 drivers/media/platform/qcom/iris/iris_venc.c       |   7 +-
 10 files changed, 1132 insertions(+), 30 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index 827aee8dcec3ee17af5a90f5594b9315f663c0b3..fb194c967ad4f9b5e00cd74f0d41e0b827ef14db 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -71,7 +71,8 @@ enum domain_type {
  * @intr_status: interrupt status
  * @sys_error_handler: a delayed work for handling system fatal error
  * @instances: a list_head of all instances
- * @inst_fw_caps: an array of supported instance capabilities
+ * @inst_fw_caps_dec: an array of supported instance capabilities by decoder
+ * @inst_fw_caps_enc: an array of supported instance capabilities by encoder
  */
 
 struct iris_core {
@@ -113,7 +114,9 @@ struct iris_core {
 	u32					intr_status;
 	struct delayed_work			sys_error_handler;
 	struct list_head			instances;
-	struct platform_inst_fw_cap		inst_fw_caps[INST_FW_CAP_MAX];
+	/* encoder and decoder have overlapping caps, so two different arrays are required */
+	struct platform_inst_fw_cap		inst_fw_caps_dec[INST_FW_CAP_MAX];
+	struct platform_inst_fw_cap		inst_fw_caps_enc[INST_FW_CAP_MAX];
 };
 
 int iris_core_init(struct iris_core *core);
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 9136b723c0f2a3d5833af32ae2735ccdb244f60f..797386cb96ab1d24be6cc1819e2f9202ab4cc224 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -31,6 +31,68 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
 		return LEVEL_VP9;
 	case V4L2_CID_MPEG_VIDEO_HEVC_TIER:
 		return TIER;
+	case V4L2_CID_MPEG_VIDEO_HEADER_MODE:
+		return HEADER_MODE;
+	case V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR:
+		return PREPEND_SPSPPS_TO_IDR;
+	case V4L2_CID_MPEG_VIDEO_BITRATE:
+		return BITRATE;
+	case V4L2_CID_MPEG_VIDEO_BITRATE_PEAK:
+		return BITRATE_PEAK;
+	case V4L2_CID_MPEG_VIDEO_BITRATE_MODE:
+		return BITRATE_MODE;
+	case V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE:
+		return FRAME_SKIP_MODE;
+	case V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE:
+		return FRAME_RC_ENABLE;
+	case V4L2_CID_MPEG_VIDEO_GOP_SIZE:
+		return GOP_SIZE;
+	case V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE:
+		return ENTROPY_MODE;
+	case V4L2_CID_MPEG_VIDEO_H264_MIN_QP:
+		return MIN_FRAME_QP_H264;
+	case V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP:
+		return MIN_FRAME_QP_HEVC;
+	case V4L2_CID_MPEG_VIDEO_H264_MAX_QP:
+		return MAX_FRAME_QP_H264;
+	case V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP:
+		return MAX_FRAME_QP_HEVC;
+	case V4L2_CID_MPEG_VIDEO_H264_I_FRAME_MIN_QP:
+		return I_FRAME_MIN_QP_H264;
+	case V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_MIN_QP:
+		return I_FRAME_MIN_QP_HEVC;
+	case V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MIN_QP:
+		return P_FRAME_MIN_QP_H264;
+	case V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_MIN_QP:
+		return P_FRAME_MIN_QP_HEVC;
+	case V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MIN_QP:
+		return B_FRAME_MIN_QP_H264;
+	case V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_MIN_QP:
+		return B_FRAME_MIN_QP_HEVC;
+	case V4L2_CID_MPEG_VIDEO_H264_I_FRAME_MAX_QP:
+		return I_FRAME_MAX_QP_H264;
+	case V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_MAX_QP:
+		return I_FRAME_MAX_QP_HEVC;
+	case V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MAX_QP:
+		return P_FRAME_MAX_QP_H264;
+	case V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_MAX_QP:
+		return P_FRAME_MAX_QP_HEVC;
+	case V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MAX_QP:
+		return B_FRAME_MAX_QP_H264;
+	case V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_MAX_QP:
+		return B_FRAME_MAX_QP_HEVC;
+	case V4L2_CID_MPEG_VIDEO_H264_I_FRAME_QP:
+		return I_FRAME_QP_H264;
+	case V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_QP:
+		return I_FRAME_QP_HEVC;
+	case V4L2_CID_MPEG_VIDEO_H264_P_FRAME_QP:
+		return P_FRAME_QP_H264;
+	case V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_QP:
+		return P_FRAME_QP_HEVC;
+	case V4L2_CID_MPEG_VIDEO_H264_B_FRAME_QP:
+		return B_FRAME_QP_H264;
+	case V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP:
+		return B_FRAME_QP_HEVC;
 	default:
 		return INST_FW_CAP_MAX;
 	}
@@ -56,6 +118,68 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 		return V4L2_CID_MPEG_VIDEO_VP9_LEVEL;
 	case TIER:
 		return V4L2_CID_MPEG_VIDEO_HEVC_TIER;
+	case HEADER_MODE:
+		return V4L2_CID_MPEG_VIDEO_HEADER_MODE;
+	case PREPEND_SPSPPS_TO_IDR:
+		return V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR;
+	case BITRATE:
+		return V4L2_CID_MPEG_VIDEO_BITRATE;
+	case BITRATE_PEAK:
+		return V4L2_CID_MPEG_VIDEO_BITRATE_PEAK;
+	case BITRATE_MODE:
+		return V4L2_CID_MPEG_VIDEO_BITRATE_MODE;
+	case FRAME_SKIP_MODE:
+		return V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE;
+	case FRAME_RC_ENABLE:
+		return V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE;
+	case GOP_SIZE:
+		return V4L2_CID_MPEG_VIDEO_GOP_SIZE;
+	case ENTROPY_MODE:
+		return V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE;
+	case MIN_FRAME_QP_H264:
+		return V4L2_CID_MPEG_VIDEO_H264_MIN_QP;
+	case MIN_FRAME_QP_HEVC:
+		return V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP;
+	case MAX_FRAME_QP_H264:
+		return V4L2_CID_MPEG_VIDEO_H264_MAX_QP;
+	case MAX_FRAME_QP_HEVC:
+		return V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP;
+	case I_FRAME_MIN_QP_H264:
+		return V4L2_CID_MPEG_VIDEO_H264_I_FRAME_MIN_QP;
+	case I_FRAME_MIN_QP_HEVC:
+		return V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_MIN_QP;
+	case P_FRAME_MIN_QP_H264:
+		return V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MIN_QP;
+	case P_FRAME_MIN_QP_HEVC:
+		return V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_MIN_QP;
+	case B_FRAME_MIN_QP_H264:
+		return V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MIN_QP;
+	case B_FRAME_MIN_QP_HEVC:
+		return V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_MIN_QP;
+	case I_FRAME_MAX_QP_H264:
+		return V4L2_CID_MPEG_VIDEO_H264_I_FRAME_MAX_QP;
+	case I_FRAME_MAX_QP_HEVC:
+		return V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_MAX_QP;
+	case P_FRAME_MAX_QP_H264:
+		return V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MAX_QP;
+	case P_FRAME_MAX_QP_HEVC:
+		return V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_MAX_QP;
+	case B_FRAME_MAX_QP_H264:
+		return V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MAX_QP;
+	case B_FRAME_MAX_QP_HEVC:
+		return V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_MAX_QP;
+	case I_FRAME_QP_H264:
+		return V4L2_CID_MPEG_VIDEO_H264_I_FRAME_QP;
+	case I_FRAME_QP_HEVC:
+		return V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_QP;
+	case P_FRAME_QP_H264:
+		return V4L2_CID_MPEG_VIDEO_H264_P_FRAME_QP;
+	case P_FRAME_QP_HEVC:
+		return V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_QP;
+	case B_FRAME_QP_H264:
+		return V4L2_CID_MPEG_VIDEO_H264_B_FRAME_QP;
+	case B_FRAME_QP_HEVC:
+		return V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP;
 	default:
 		return 0;
 	}
@@ -101,7 +225,10 @@ int iris_ctrls_init(struct iris_inst *inst)
 			num_ctrls++;
 	}
 
-	/* Adding 1 to num_ctrls to include V4L2_CID_MIN_BUFFERS_FOR_CAPTURE */
+	/* Adding 1 to num_ctrls to include
+	 * V4L2_CID_MIN_BUFFERS_FOR_CAPTURE for decoder and
+	 * V4L2_CID_MIN_BUFFERS_FOR_OUTPUT for encoder
+	 */
 
 	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, num_ctrls + 1);
 	if (ret)
@@ -143,8 +270,13 @@ int iris_ctrls_init(struct iris_inst *inst)
 		ctrl_idx++;
 	}
 
-	v4l2_ctrl_new_std(&inst->ctrl_handler, NULL,
-			  V4L2_CID_MIN_BUFFERS_FOR_CAPTURE, 1, 32, 1, 4);
+	if (inst->domain == DECODER) {
+		v4l2_ctrl_new_std(&inst->ctrl_handler, NULL,
+				  V4L2_CID_MIN_BUFFERS_FOR_CAPTURE, 1, 32, 1, 4);
+	} else {
+		v4l2_ctrl_new_std(&inst->ctrl_handler, NULL,
+				  V4L2_CID_MIN_BUFFERS_FOR_OUTPUT, 1, 32, 1, 4);
+	}
 
 	ret = inst->ctrl_handler.error;
 	if (ret)
@@ -162,22 +294,39 @@ void iris_session_init_caps(struct iris_core *core)
 	struct platform_inst_fw_cap *caps;
 	u32 i, num_cap, cap_id;
 
-	caps = core->iris_platform_data->inst_fw_caps;
-	num_cap = core->iris_platform_data->inst_fw_caps_size;
+	caps = core->iris_platform_data->inst_fw_caps_dec;
+	num_cap = core->iris_platform_data->inst_fw_caps_dec_size;
+
+	for (i = 0; i < num_cap; i++) {
+		cap_id = caps[i].cap_id;
+		if (!iris_valid_cap_id(cap_id))
+			continue;
+
+		core->inst_fw_caps_dec[cap_id].cap_id = caps[i].cap_id;
+		core->inst_fw_caps_dec[cap_id].min = caps[i].min;
+		core->inst_fw_caps_dec[cap_id].max = caps[i].max;
+		core->inst_fw_caps_dec[cap_id].step_or_mask = caps[i].step_or_mask;
+		core->inst_fw_caps_dec[cap_id].value = caps[i].value;
+		core->inst_fw_caps_dec[cap_id].flags = caps[i].flags;
+		core->inst_fw_caps_dec[cap_id].hfi_id = caps[i].hfi_id;
+		core->inst_fw_caps_dec[cap_id].set = caps[i].set;
+	}
+
+	caps = core->iris_platform_data->inst_fw_caps_enc;
+	num_cap = core->iris_platform_data->inst_fw_caps_enc_size;
 
 	for (i = 0; i < num_cap; i++) {
 		cap_id = caps[i].cap_id;
 		if (!iris_valid_cap_id(cap_id))
 			continue;
 
-		core->inst_fw_caps[cap_id].cap_id = caps[i].cap_id;
-		core->inst_fw_caps[cap_id].min = caps[i].min;
-		core->inst_fw_caps[cap_id].max = caps[i].max;
-		core->inst_fw_caps[cap_id].step_or_mask = caps[i].step_or_mask;
-		core->inst_fw_caps[cap_id].value = caps[i].value;
-		core->inst_fw_caps[cap_id].flags = caps[i].flags;
-		core->inst_fw_caps[cap_id].hfi_id = caps[i].hfi_id;
-		core->inst_fw_caps[cap_id].set = caps[i].set;
+		core->inst_fw_caps_enc[cap_id].cap_id = caps[i].cap_id;
+		core->inst_fw_caps_enc[cap_id].min = caps[i].min;
+		core->inst_fw_caps_enc[cap_id].max = caps[i].max;
+		core->inst_fw_caps_enc[cap_id].step_or_mask = caps[i].step_or_mask;
+		core->inst_fw_caps_enc[cap_id].value = caps[i].value;
+		core->inst_fw_caps_enc[cap_id].flags = caps[i].flags;
+		core->inst_fw_caps_enc[cap_id].hfi_id = caps[i].hfi_id;
 	}
 }
 
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index 5b7c641b727a16c3aa7196a6d49786133653279f..f6e2db401daeee12106a07af62179ce0d1504c5c 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -121,6 +121,14 @@
 #define HFI_UNUSED_PICT					0x10000000
 #define HFI_BUFFERFLAG_DATACORRUPT			0x00000008
 #define HFI_BUFFERFLAG_DROP_FRAME			0x20000000
+#define HFI_PROPERTY_PARAM_VENC_H264_ENTROPY_CONTROL		0x2005002
+#define HFI_PROPERTY_PARAM_VENC_H264_DEBLOCK_CONTROL		0x2005003
+#define HFI_PROPERTY_PARAM_VENC_RATE_CONTROL			0x2005004
+#define HFI_PROPERTY_PARAM_VENC_SESSION_QP_RANGE_V2		0x2005009
+#define HFI_PROPERTY_PARAM_VENC_MAX_NUM_B_FRAMES		0x2005020
+#define HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE			0x2006001
+#define HFI_PROPERTY_CONFIG_VENC_MAX_BITRATE			0x2006007
+#define HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER	0x2006008
 
 struct hfi_pkt_hdr {
 	u32 size;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index 5f13dc11bea532600cc9b15db57e8981a1f3eb93..fb6724d7f95ff8858aa9ba093fefb642e89de279 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -55,12 +55,21 @@
 #define HFI_PROP_BUFFER_HOST_MAX_COUNT		0x03000123
 #define HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT	0x03000124
 #define HFI_PROP_PIC_ORDER_CNT_TYPE		0x03000128
+#define HFI_PROP_RATE_CONTROL			0x0300012a
+#define HFI_PROP_QP_PACKED			0x0300012e
+#define HFI_PROP_MIN_QP_PACKED			0x0300012f
+#define HFI_PROP_MAX_QP_PACKED			0x03000130
+#define HFI_PROP_TOTAL_BITRATE			0x0300013b
+#define HFI_PROP_MAX_GOP_FRAMES			0x03000146
+#define HFI_PROP_MAX_B_FRAMES			0x03000147
 #define HFI_PROP_QUALITY_MODE			0x03000148
+#define HFI_PROP_SEQ_HEADER_MODE		0x03000149
 #define HFI_PROP_SIGNAL_COLOR_INFO		0x03000155
 #define HFI_PROP_PICTURE_TYPE			0x03000162
 #define HFI_PROP_DEC_DEFAULT_HEADER		0x03000168
 #define HFI_PROP_DEC_START_FROM_RAP_FRAME	0x03000169
 #define HFI_PROP_NO_OUTPUT			0x0300016a
+#define HFI_PROP_TOTAL_PEAK_BITRATE		0x0300017C
 #define HFI_PROP_COMV_BUFFER_COUNT		0x03000193
 #define HFI_PROP_END				0x03FFFFFF
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index d0b84c93aef409b51a767ba11f91c6ce2533f27f..49adb0a52bbf19849d0cc41179063b667a0ccb2f 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -23,6 +23,11 @@ struct iris_inst;
 #define DEFAULT_FPS				30
 #define MAXIMUM_FPS				480
 #define NUM_MBS_8K                             ((8192 * 4352) / 256)
+#define MIN_QP_8BIT				1
+#define MAX_QP					51
+#define MAX_QP_HEVC				63
+#define DEFAULT_QP				20
+#define BITRATE_DEFAULT			20000000
 
 enum stage_type {
 	STAGE_1 = 1,
@@ -98,6 +103,37 @@ enum platform_inst_fw_cap_type {
 	BIT_DEPTH,
 	RAP_FRAME,
 	TIER,
+	HEADER_MODE,
+	PREPEND_SPSPPS_TO_IDR,
+	BITRATE,
+	BITRATE_PEAK,
+	BITRATE_MODE,
+	FRAME_SKIP_MODE,
+	FRAME_RC_ENABLE,
+	GOP_SIZE,
+	ENTROPY_MODE,
+	MIN_FRAME_QP_H264,
+	MIN_FRAME_QP_HEVC,
+	MAX_FRAME_QP_H264,
+	MAX_FRAME_QP_HEVC,
+	I_FRAME_MIN_QP_H264,
+	I_FRAME_MIN_QP_HEVC,
+	P_FRAME_MIN_QP_H264,
+	P_FRAME_MIN_QP_HEVC,
+	B_FRAME_MIN_QP_H264,
+	B_FRAME_MIN_QP_HEVC,
+	I_FRAME_MAX_QP_H264,
+	I_FRAME_MAX_QP_HEVC,
+	P_FRAME_MAX_QP_H264,
+	P_FRAME_MAX_QP_HEVC,
+	B_FRAME_MAX_QP_H264,
+	B_FRAME_MAX_QP_HEVC,
+	I_FRAME_QP_H264,
+	I_FRAME_QP_HEVC,
+	P_FRAME_QP_H264,
+	P_FRAME_QP_HEVC,
+	B_FRAME_QP_H264,
+	B_FRAME_QP_HEVC,
 	INST_FW_CAP_MAX,
 };
 
@@ -172,8 +208,10 @@ struct iris_platform_data {
 	const char *fwname;
 	u32 pas_id;
 	struct platform_inst_caps *inst_caps;
-	struct platform_inst_fw_cap *inst_fw_caps;
-	u32 inst_fw_caps_size;
+	struct platform_inst_fw_cap *inst_fw_caps_dec;
+	u32 inst_fw_caps_dec_size;
+	struct platform_inst_fw_cap *inst_fw_caps_enc;
+	u32 inst_fw_caps_enc_size;
 	struct tz_cp_config *tz_cp_config_data;
 	u32 core_arch;
 	u32 hw_response_timeout;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index e047fb75a99a6372dac4ad029baea16034cac633..04e76445dd9141285a6e48be76bdf1bdb51f0cee 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -14,8 +14,9 @@
 #include "iris_platform_sm8650.h"
 
 #define VIDEO_ARCH_LX 1
+#define BITRATE_MAX				245000000
 
-static struct platform_inst_fw_cap inst_fw_cap_sm8550[] = {
+static struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
 	{
 		.cap_id = PROFILE_H264,
 		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
@@ -199,6 +200,352 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550[] = {
 	},
 };
 
+static struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
+	{
+		.cap_id = PROFILE_H264,
+		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
+		.max = V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_HIGH),
+		.value = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
+		.hfi_id = HFI_PROP_PROFILE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+	},
+	{
+		.cap_id = PROFILE_HEVC,
+		.min = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
+		.max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10),
+		.value = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
+		.hfi_id = HFI_PROP_PROFILE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+	},
+	{
+		.cap_id = LEVEL_H264,
+		.min = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
+		.max = V4L2_MPEG_VIDEO_H264_LEVEL_6_0,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_0) |
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
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_0),
+		.value = V4L2_MPEG_VIDEO_H264_LEVEL_5_0,
+		.hfi_id = HFI_PROP_LEVEL,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+	},
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
+		.value = V4L2_MPEG_VIDEO_HEVC_LEVEL_5,
+		.hfi_id = HFI_PROP_LEVEL,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+	},
+	{
+		.cap_id = STAGE,
+		.min = STAGE_1,
+		.max = STAGE_2,
+		.step_or_mask = 1,
+		.value = STAGE_2,
+		.hfi_id = HFI_PROP_STAGE,
+	},
+	{
+		.cap_id = HEADER_MODE,
+		.min = V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE,
+		.max = V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE) |
+				BIT(V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME),
+		.value = V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME,
+		.hfi_id = HFI_PROP_SEQ_HEADER_MODE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+	},
+	{
+		.cap_id = PREPEND_SPSPPS_TO_IDR,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 0,
+	},
+	{
+		.cap_id = BITRATE,
+		.min = 1,
+		.max = BITRATE_MAX,
+		.step_or_mask = 1,
+		.value = BITRATE_DEFAULT,
+		.hfi_id = HFI_PROP_TOTAL_BITRATE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+	},
+	{
+		.cap_id = BITRATE_PEAK,
+		.min = 1,
+		.max = BITRATE_MAX,
+		.step_or_mask = 1,
+		.value = BITRATE_DEFAULT,
+		.hfi_id = HFI_PROP_TOTAL_PEAK_BITRATE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+	},
+	{
+		.cap_id = BITRATE_MODE,
+		.min = V4L2_MPEG_VIDEO_BITRATE_MODE_VBR,
+		.max = V4L2_MPEG_VIDEO_BITRATE_MODE_CBR,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_BITRATE_MODE_VBR) |
+				BIT(V4L2_MPEG_VIDEO_BITRATE_MODE_CBR),
+		.value = V4L2_MPEG_VIDEO_BITRATE_MODE_VBR,
+		.hfi_id = HFI_PROP_RATE_CONTROL,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+	},
+	{
+		.cap_id = FRAME_SKIP_MODE,
+		.min = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED,
+		.max = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED) |
+				BIT(V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_LEVEL_LIMIT) |
+				BIT(V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT),
+		.value = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+	},
+	{
+		.cap_id = FRAME_RC_ENABLE,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 1,
+	},
+	{
+		.cap_id = GOP_SIZE,
+		.min = 0,
+		.max = INT_MAX,
+		.step_or_mask = 1,
+		.value = 2 * DEFAULT_FPS - 1,
+		.hfi_id = HFI_PROP_MAX_GOP_FRAMES,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+	},
+	{
+		.cap_id = ENTROPY_MODE,
+		.min = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC,
+		.max = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC) |
+				BIT(V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC),
+		.value = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC,
+		.hfi_id = HFI_PROP_CABAC_SESSION,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+	},
+	{
+		.cap_id = MIN_FRAME_QP_H264,
+		.min = MIN_QP_8BIT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT,
+		.hfi_id = HFI_PROP_MIN_QP_PACKED,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+	},
+	{
+		.cap_id = MIN_FRAME_QP_HEVC,
+		.min = MIN_QP_8BIT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT,
+		.hfi_id = HFI_PROP_MIN_QP_PACKED,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+	},
+	{
+		.cap_id = MAX_FRAME_QP_H264,
+		.min = MIN_QP_8BIT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT,
+		.hfi_id = HFI_PROP_MAX_QP_PACKED,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+	},
+	{
+		.cap_id = MAX_FRAME_QP_HEVC,
+		.min = MIN_QP_8BIT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT,
+		.hfi_id = HFI_PROP_MAX_QP_PACKED,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+	},
+	{
+		.cap_id = I_FRAME_MIN_QP_H264,
+		.min = MIN_QP_8BIT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT,
+	},
+	{
+		.cap_id = I_FRAME_MIN_QP_HEVC,
+		.min = MIN_QP_8BIT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT,
+	},
+	{
+		.cap_id = P_FRAME_MIN_QP_H264,
+		.min = MIN_QP_8BIT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT,
+	},
+	{
+		.cap_id = P_FRAME_MIN_QP_HEVC,
+		.min = MIN_QP_8BIT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT,
+	},
+	{
+		.cap_id = B_FRAME_MIN_QP_H264,
+		.min = MIN_QP_8BIT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT,
+	},
+	{
+		.cap_id = B_FRAME_MIN_QP_HEVC,
+		.min = MIN_QP_8BIT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT,
+	},
+	{
+		.cap_id = I_FRAME_MAX_QP_H264,
+		.min = MIN_QP_8BIT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT,
+	},
+	{
+		.cap_id = I_FRAME_MAX_QP_HEVC,
+		.min = MIN_QP_8BIT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT,
+	},
+	{
+		.cap_id = P_FRAME_MAX_QP_H264,
+		.min = MIN_QP_8BIT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT,
+	},
+	{
+		.cap_id = P_FRAME_MAX_QP_HEVC,
+		.min = MIN_QP_8BIT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT,
+	},
+	{
+		.cap_id = B_FRAME_MAX_QP_H264,
+		.min = MIN_QP_8BIT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT,
+	},
+	{
+		.cap_id = B_FRAME_MAX_QP_HEVC,
+		.min = MIN_QP_8BIT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT,
+	},
+	{
+		.cap_id = I_FRAME_QP_H264,
+		.min = MIN_QP_8BIT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = DEFAULT_QP,
+		.hfi_id = HFI_PROP_QP_PACKED,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+	},
+	{
+		.cap_id = I_FRAME_QP_HEVC,
+		.min = MIN_QP_8BIT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = DEFAULT_QP,
+		.hfi_id = HFI_PROP_QP_PACKED,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+	},
+	{
+		.cap_id = P_FRAME_QP_H264,
+		.min = MIN_QP_8BIT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = DEFAULT_QP,
+		.hfi_id = HFI_PROP_QP_PACKED,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+	},
+	{
+		.cap_id = P_FRAME_QP_HEVC,
+		.min = MIN_QP_8BIT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = DEFAULT_QP,
+		.hfi_id = HFI_PROP_QP_PACKED,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+	},
+	{
+		.cap_id = B_FRAME_QP_H264,
+		.min = MIN_QP_8BIT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = DEFAULT_QP,
+		.hfi_id = HFI_PROP_QP_PACKED,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+	},
+	{
+		.cap_id = B_FRAME_QP_HEVC,
+		.min = MIN_QP_8BIT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = DEFAULT_QP,
+		.hfi_id = HFI_PROP_QP_PACKED,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+	},
+};
+
 static struct platform_inst_caps platform_inst_cap_sm8550 = {
 	.min_frame_width = 96,
 	.max_frame_width = 8192,
@@ -347,8 +694,10 @@ struct iris_platform_data sm8550_data = {
 	.fwname = "qcom/vpu/vpu30_p4.mbn",
 	.pas_id = IRIS_PAS_ID,
 	.inst_caps = &platform_inst_cap_sm8550,
-	.inst_fw_caps = inst_fw_cap_sm8550,
-	.inst_fw_caps_size = ARRAY_SIZE(inst_fw_cap_sm8550),
+	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
+	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
+	.inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
+	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),
 	.tz_cp_config_data = &tz_cp_config_sm8550,
 	.core_arch = VIDEO_ARCH_LX,
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
@@ -423,8 +772,10 @@ struct iris_platform_data sm8650_data = {
 	.fwname = "qcom/vpu/vpu33_p4.mbn",
 	.pas_id = IRIS_PAS_ID,
 	.inst_caps = &platform_inst_cap_sm8550,
-	.inst_fw_caps = inst_fw_cap_sm8550,
-	.inst_fw_caps_size = ARRAY_SIZE(inst_fw_cap_sm8550),
+	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
+	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
+	.inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
+	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),
 	.tz_cp_config_data = &tz_cp_config_sm8550,
 	.core_arch = VIDEO_ARCH_LX,
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
@@ -495,8 +846,10 @@ struct iris_platform_data qcs8300_data = {
 	.fwname = "qcom/vpu/vpu30_p4_s6.mbn",
 	.pas_id = IRIS_PAS_ID,
 	.inst_caps = &platform_inst_cap_qcs8300,
-	.inst_fw_caps = inst_fw_cap_qcs8300,
-	.inst_fw_caps_size = ARRAY_SIZE(inst_fw_cap_qcs8300),
+	.inst_fw_caps_dec = inst_fw_cap_qcs8300_dec,
+	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_qcs8300_dec),
+	.inst_fw_caps_enc = inst_fw_cap_qcs8300_enc,
+	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_qcs8300_enc),
 	.tz_cp_config_data = &tz_cp_config_sm8550,
 	.core_arch = VIDEO_ARCH_LX,
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
index 22e485b0b2ae8f110d2f3b817e202d1aa7d227fd..33764f05fe1a75014fb69051ac1fc0eeb97628ef 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
@@ -3,7 +3,9 @@
  * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
-static struct platform_inst_fw_cap inst_fw_cap_qcs8300[] = {
+#define BITRATE_MAX				245000000
+
+static struct platform_inst_fw_cap inst_fw_cap_qcs8300_dec[] = {
 	{
 		.cap_id = PROFILE_H264,
 		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
@@ -187,6 +189,352 @@ static struct platform_inst_fw_cap inst_fw_cap_qcs8300[] = {
 	},
 };
 
+static struct platform_inst_fw_cap inst_fw_cap_qcs8300_enc[] = {
+	{
+		.cap_id = PROFILE_H264,
+		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
+		.max = V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_HIGH),
+		.value = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
+		.hfi_id = HFI_PROP_PROFILE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+	},
+	{
+		.cap_id = PROFILE_HEVC,
+		.min = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
+		.max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10),
+		.value = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
+		.hfi_id = HFI_PROP_PROFILE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+	},
+	{
+		.cap_id = LEVEL_H264,
+		.min = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
+		.max = V4L2_MPEG_VIDEO_H264_LEVEL_6_0,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_0) |
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
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_0),
+		.value = V4L2_MPEG_VIDEO_H264_LEVEL_5_0,
+		.hfi_id = HFI_PROP_LEVEL,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+	},
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
+		.value = V4L2_MPEG_VIDEO_HEVC_LEVEL_5,
+		.hfi_id = HFI_PROP_LEVEL,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+	},
+	{
+		.cap_id = STAGE,
+		.min = STAGE_1,
+		.max = STAGE_2,
+		.step_or_mask = 1,
+		.value = STAGE_2,
+		.hfi_id = HFI_PROP_STAGE,
+	},
+	{
+		.cap_id = HEADER_MODE,
+		.min = V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE,
+		.max = V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE) |
+				BIT(V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME),
+		.value = V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME,
+		.hfi_id = HFI_PROP_SEQ_HEADER_MODE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+	},
+	{
+		.cap_id = PREPEND_SPSPPS_TO_IDR,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 0,
+	},
+	{
+		.cap_id = BITRATE,
+		.min = 1,
+		.max = BITRATE_MAX,
+		.step_or_mask = 1,
+		.value = BITRATE_DEFAULT,
+		.hfi_id = HFI_PROP_TOTAL_BITRATE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+	},
+	{
+		.cap_id = BITRATE_PEAK,
+		.min = 1,
+		.max = BITRATE_MAX,
+		.step_or_mask = 1,
+		.value = BITRATE_DEFAULT,
+		.hfi_id = HFI_PROP_TOTAL_PEAK_BITRATE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+	},
+	{
+		.cap_id = BITRATE_MODE,
+		.min = V4L2_MPEG_VIDEO_BITRATE_MODE_VBR,
+		.max = V4L2_MPEG_VIDEO_BITRATE_MODE_CBR,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_BITRATE_MODE_VBR) |
+				BIT(V4L2_MPEG_VIDEO_BITRATE_MODE_CBR),
+		.value = V4L2_MPEG_VIDEO_BITRATE_MODE_VBR,
+		.hfi_id = HFI_PROP_RATE_CONTROL,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+	},
+	{
+		.cap_id = FRAME_SKIP_MODE,
+		.min = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED,
+		.max = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED) |
+				BIT(V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_LEVEL_LIMIT) |
+				BIT(V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT),
+		.value = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+	},
+	{
+		.cap_id = FRAME_RC_ENABLE,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 1,
+	},
+	{
+		.cap_id = GOP_SIZE,
+		.min = 0,
+		.max = INT_MAX,
+		.step_or_mask = 1,
+		.value = 2 * DEFAULT_FPS - 1,
+		.hfi_id = HFI_PROP_MAX_GOP_FRAMES,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+	},
+	{
+		.cap_id = ENTROPY_MODE,
+		.min = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC,
+		.max = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC) |
+				BIT(V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC),
+		.value = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC,
+		.hfi_id = HFI_PROP_CABAC_SESSION,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+	},
+	{
+		.cap_id = MIN_FRAME_QP_H264,
+		.min = MIN_QP_8BIT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT,
+		.hfi_id = HFI_PROP_MIN_QP_PACKED,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+	},
+	{
+		.cap_id = MIN_FRAME_QP_HEVC,
+		.min = MIN_QP_8BIT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT,
+		.hfi_id = HFI_PROP_MIN_QP_PACKED,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+	},
+	{
+		.cap_id = MAX_FRAME_QP_H264,
+		.min = MIN_QP_8BIT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT,
+		.hfi_id = HFI_PROP_MAX_QP_PACKED,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+	},
+	{
+		.cap_id = MAX_FRAME_QP_HEVC,
+		.min = MIN_QP_8BIT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT,
+		.hfi_id = HFI_PROP_MAX_QP_PACKED,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+	},
+	{
+		.cap_id = I_FRAME_MIN_QP_H264,
+		.min = MIN_QP_8BIT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT,
+	},
+	{
+		.cap_id = I_FRAME_MIN_QP_HEVC,
+		.min = MIN_QP_8BIT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT,
+	},
+	{
+		.cap_id = P_FRAME_MIN_QP_H264,
+		.min = MIN_QP_8BIT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT,
+	},
+	{
+		.cap_id = P_FRAME_MIN_QP_HEVC,
+		.min = MIN_QP_8BIT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT,
+	},
+	{
+		.cap_id = B_FRAME_MIN_QP_H264,
+		.min = MIN_QP_8BIT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT,
+	},
+	{
+		.cap_id = B_FRAME_MIN_QP_HEVC,
+		.min = MIN_QP_8BIT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT,
+	},
+	{
+		.cap_id = I_FRAME_MAX_QP_H264,
+		.min = MIN_QP_8BIT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT,
+	},
+	{
+		.cap_id = I_FRAME_MAX_QP_HEVC,
+		.min = MIN_QP_8BIT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT,
+	},
+	{
+		.cap_id = P_FRAME_MAX_QP_H264,
+		.min = MIN_QP_8BIT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT,
+	},
+	{
+		.cap_id = P_FRAME_MAX_QP_HEVC,
+		.min = MIN_QP_8BIT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT,
+	},
+	{
+		.cap_id = B_FRAME_MAX_QP_H264,
+		.min = MIN_QP_8BIT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT,
+	},
+	{
+		.cap_id = B_FRAME_MAX_QP_HEVC,
+		.min = MIN_QP_8BIT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT,
+	},
+	{
+		.cap_id = I_FRAME_QP_H264,
+		.min = MIN_QP_8BIT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = DEFAULT_QP,
+		.hfi_id = HFI_PROP_QP_PACKED,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+	},
+	{
+		.cap_id = I_FRAME_QP_HEVC,
+		.min = MIN_QP_8BIT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = DEFAULT_QP,
+		.hfi_id = HFI_PROP_QP_PACKED,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+	},
+	{
+		.cap_id = P_FRAME_QP_H264,
+		.min = MIN_QP_8BIT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = DEFAULT_QP,
+		.hfi_id = HFI_PROP_QP_PACKED,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+	},
+	{
+		.cap_id = P_FRAME_QP_HEVC,
+		.min = MIN_QP_8BIT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = DEFAULT_QP,
+		.hfi_id = HFI_PROP_QP_PACKED,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+	},
+	{
+		.cap_id = B_FRAME_QP_H264,
+		.min = MIN_QP_8BIT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = DEFAULT_QP,
+		.hfi_id = HFI_PROP_QP_PACKED,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+	},
+	{
+		.cap_id = B_FRAME_QP_HEVC,
+		.min = MIN_QP_8BIT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = DEFAULT_QP,
+		.hfi_id = HFI_PROP_QP_PACKED,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+	},
+};
+
 static struct platform_inst_caps platform_inst_cap_qcs8300 = {
 	.min_frame_width = 96,
 	.max_frame_width = 4096,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
index 5d59a5a3172a510b3a38f7c9c29dffd919fafce7..4f083eac261fff5642f15c4fc2f0f9f942818cac 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
@@ -11,7 +11,12 @@
 #include "iris_hfi_gen1_defines.h"
 #include "iris_vpu_common.h"
 
-static struct platform_inst_fw_cap inst_fw_cap_sm8250[] = {
+#define BITRATE_MIN		32000
+#define BITRATE_MAX		160000000
+#define BITRATE_PEAK_DEFAULT	(BITRATE_DEFAULT * 2)
+#define BITRATE_STEP		100
+
+static struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
 	{
 		.cap_id = PIPE,
 		.min = PIPE_1,
@@ -32,6 +37,188 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8250[] = {
 	},
 };
 
+static struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
+	{
+		.cap_id = PROFILE_H264,
+		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
+		.max = V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_HIGH) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_STEREO_HIGH) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH),
+		.value = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
+		.hfi_id = HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+	},
+	{
+		.cap_id = PROFILE_HEVC,
+		.min = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
+		.max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10),
+		.value = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
+		.hfi_id = HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+	},
+	{
+		.cap_id = LEVEL_H264,
+		.min = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
+		.max = V4L2_MPEG_VIDEO_H264_LEVEL_5_1,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_0) |
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
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_1),
+		.value = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
+		.hfi_id = HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+	},
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
+		.value = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
+		.hfi_id = HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+	},
+	{
+		.cap_id = HEADER_MODE,
+		.min = V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE,
+		.max = V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE) |
+				BIT(V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME),
+		.value = V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME,
+		.hfi_id = HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+	},
+	{
+		.cap_id = BITRATE,
+		.min = BITRATE_MIN,
+		.max = BITRATE_MAX,
+		.step_or_mask = BITRATE_STEP,
+		.value = BITRATE_DEFAULT,
+		.hfi_id = HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+	},
+	{
+		.cap_id = BITRATE_PEAK,
+		.min = BITRATE_MIN,
+		.max = BITRATE_MAX,
+		.step_or_mask = BITRATE_STEP,
+		.value = BITRATE_PEAK_DEFAULT,
+		.hfi_id = HFI_PROPERTY_CONFIG_VENC_MAX_BITRATE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+	},
+	{
+		.cap_id = BITRATE_MODE,
+		.min = V4L2_MPEG_VIDEO_BITRATE_MODE_VBR,
+		.max = V4L2_MPEG_VIDEO_BITRATE_MODE_CBR,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_BITRATE_MODE_VBR) |
+				BIT(V4L2_MPEG_VIDEO_BITRATE_MODE_CBR),
+		.value = V4L2_MPEG_VIDEO_BITRATE_MODE_VBR,
+		.hfi_id = HFI_PROPERTY_PARAM_VENC_RATE_CONTROL,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+	},
+	{
+		.cap_id = FRAME_SKIP_MODE,
+		.min = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED,
+		.max = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED) |
+				BIT(V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT),
+		.value = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+	},
+	{
+		.cap_id = FRAME_RC_ENABLE,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 1,
+	},
+	{
+		.cap_id = GOP_SIZE,
+		.min = 0,
+		.max = (1 << 16) - 1,
+		.step_or_mask = 1,
+		.value = 30,
+	},
+	{
+		.cap_id = ENTROPY_MODE,
+		.min = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC,
+		.max = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC) |
+				BIT(V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC),
+		.value = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC,
+		.hfi_id = HFI_PROPERTY_PARAM_VENC_H264_ENTROPY_CONTROL,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+	},
+	{
+		.cap_id = MIN_FRAME_QP_H264,
+		.min = MIN_QP_8BIT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT,
+		.hfi_id = HFI_PROPERTY_PARAM_VENC_SESSION_QP_RANGE_V2,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+	},
+	{
+		.cap_id = MIN_FRAME_QP_HEVC,
+		.min = MIN_QP_8BIT,
+		.max = MAX_QP_HEVC,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT,
+		.hfi_id = HFI_PROPERTY_PARAM_VENC_SESSION_QP_RANGE_V2,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+	},
+	{
+		.cap_id = MAX_FRAME_QP_H264,
+		.min = MIN_QP_8BIT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MAX_QP,
+		.hfi_id = HFI_PROPERTY_PARAM_VENC_SESSION_QP_RANGE_V2,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+	},
+	{
+		.cap_id = MAX_FRAME_QP_HEVC,
+		.min = MIN_QP_8BIT,
+		.max = MAX_QP_HEVC,
+		.step_or_mask = 1,
+		.value = MAX_QP_HEVC,
+		.hfi_id = HFI_PROPERTY_PARAM_VENC_SESSION_QP_RANGE_V2,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+	},
+};
+
 static struct platform_inst_caps platform_inst_cap_sm8250 = {
 	.min_frame_width = 128,
 	.max_frame_width = 8192,
@@ -123,8 +310,10 @@ struct iris_platform_data sm8250_data = {
 	.fwname = "qcom/vpu-1.0/venus.mbn",
 	.pas_id = IRIS_PAS_ID,
 	.inst_caps = &platform_inst_cap_sm8250,
-	.inst_fw_caps = inst_fw_cap_sm8250,
-	.inst_fw_caps_size = ARRAY_SIZE(inst_fw_cap_sm8250),
+	.inst_fw_caps_dec = inst_fw_cap_sm8250_dec,
+	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8250_dec),
+	.inst_fw_caps_enc = inst_fw_cap_sm8250_enc,
+	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8250_enc),
 	.tz_cp_config_data = &tz_cp_config_sm8250,
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
 	.num_vpp_pipe = 4,
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 0fb863426cdf479c50cad8a627c2845a6dfe0b32..ec7f06205e978fb71b6e2ff3241c659585490bde 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -54,7 +54,7 @@ int iris_vdec_inst_init(struct iris_inst *inst)
 	inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
 	inst->buffers[BUF_OUTPUT].size = f->fmt.pix_mp.plane_fmt[0].sizeimage;
 
-	memcpy(&inst->fw_caps[0], &core->inst_fw_caps[0],
+	memcpy(&inst->fw_caps[0], &core->inst_fw_caps_dec[0],
 	       INST_FW_CAP_MAX * sizeof(struct platform_inst_fw_cap));
 
 	return iris_ctrls_init(inst);
diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index 11666f40a4d1c34e1b6eca0b5e40e0f09eeb2b67..4630ba12349a62a37515e93ed5efa2df197bce17 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -7,12 +7,14 @@
 #include <media/v4l2-mem2mem.h>
 
 #include "iris_buffer.h"
+#include "iris_ctrls.h"
 #include "iris_instance.h"
 #include "iris_venc.h"
 #include "iris_vpu_buffer.h"
 
 int iris_venc_inst_init(struct iris_inst *inst)
 {
+	struct iris_core *core = inst->core;
 	struct v4l2_format *f;
 
 	inst->fmt_src = kzalloc(sizeof(*inst->fmt_src), GFP_KERNEL);
@@ -61,7 +63,10 @@ int iris_venc_inst_init(struct iris_inst *inst)
 	inst->operating_rate = DEFAULT_FPS << 16;
 	inst->frame_rate = DEFAULT_FPS << 16;
 
-	return 0;
+	memcpy(&inst->fw_caps[0], &core->inst_fw_caps_enc[0],
+	       INST_FW_CAP_MAX * sizeof(struct platform_inst_fw_cap));
+
+	return iris_ctrls_init(inst);
 }
 
 void iris_venc_inst_deinit(struct iris_inst *inst)

-- 
2.34.1


