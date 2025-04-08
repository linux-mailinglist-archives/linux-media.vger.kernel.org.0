Return-Path: <linux-media+bounces-29647-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEA9A81144
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 18:05:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1587719E6CD3
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 15:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBAEB2405F5;
	Tue,  8 Apr 2025 15:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DC7ylliw"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9746523E34F;
	Tue,  8 Apr 2025 15:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744127744; cv=none; b=C381doKuYPrJvpq132oep0JQaaxZTnzTOUaq+AZHJANVwy5As5gqT7sFKJL+vDebwhxfHhioM730O9qsc+exBSgRFSWEosUVVRJWMXVNHRpzUKfkKDWnIejwlz1j4mfFSbW2RB3pobDI5zwkkKY+9oQTwyirRzt86Lpgg9m5FVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744127744; c=relaxed/simple;
	bh=tMWz+J6SwJs025XtZZMQ+FN+w5UOFYupieAyVC+SzU8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=phUTcsuv4DZjdpvAOble34KlNMm+yinYGTYUXwR47jTt9O6w754mw9imEpN6+wHVwz2BcHmye9HifN4cdUvhRjqofa017f5P0ozonKJZ/Os+ZoiILJArUymLvxIYze+KBPTOWg0UdJvd8EwCHDE4OAEf4yPvVZB/u/AHNYCWSik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DC7ylliw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538BIEcX019609;
	Tue, 8 Apr 2025 15:55:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vkwwqcB0mvb7Vw8SXsBopau2QIFcp6HaC6ztDIZ+CZ4=; b=DC7ylliwuodL5jcI
	tdT3dLKFWEuSmMRV6tT5j6jtCbdrTO8UG7pvAk1vniKO9YzoPrUW2yqaE9N0ss6/
	Pwks/4G74dBvWRBYW0y49+s6Ld2Mlb2NwqkD1Zdpctj6bd/uHmbTEHOo7qKgocE2
	ukAeZ+OcZisPJKAAxxM7JdUEcFJFZaazmSuh5am8GM7+R0fcrX35gScYUPnueOFP
	b8ZImWigvbgLD2AmeNqxd3W6b/BHwLwBkQgNJ75wLy/cLJBr1Z8OYVw42rP5J6C8
	ZL1zxZ5llamMB7X4K0mhiYBjhEqsXtpR6jh4KieK7rlsAIpbSlZwORXJJmVzcF3F
	Ac/gkg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twg3g9gk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Apr 2025 15:55:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 538Ftbn6018179
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Apr 2025 15:55:37 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 8 Apr 2025 08:55:32 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Tue, 8 Apr 2025 21:24:25 +0530
Subject: [PATCH 11/20] media: iris: Remove deprecated property setting to
 firmware
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250408-iris-dec-hevc-vp9-v1-11-acd258778bd6@quicinc.com>
References: <20250408-iris-dec-hevc-vp9-v1-0-acd258778bd6@quicinc.com>
In-Reply-To: <20250408-iris-dec-hevc-vp9-v1-0-acd258778bd6@quicinc.com>
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
	<dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Dikshita
 Agarwal" <quic_dikshita@quicinc.com>,
        <stable@vger.kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744127674; l=4460;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=tMWz+J6SwJs025XtZZMQ+FN+w5UOFYupieAyVC+SzU8=;
 b=C/79/60I39PkWXwUxWOnaG97hgDPtUOyH6dvayRuhOi2TvgLUKl/5ytMQHz6o93lYSwQy50N4
 s11Mxyp1wxDArL3D6Wnz4LqAWj6sziFc2u5TE4D9lkE8z3z5aMhE8us
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: DGGHJW8YZzzZf58u34GRm653dQX4Cy_D
X-Proofpoint-ORIG-GUID: DGGHJW8YZzzZf58u34GRm653dQX4Cy_D
X-Authority-Analysis: v=2.4 cv=I/9lRMgg c=1 sm=1 tr=0 ts=67f546fa cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=WciSHW0qczRDrvBwlocA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_06,2025-04-08_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080110

HFI_PROPERTY_CONFIG_VDEC_POST_LOOP_DEBLOCKER is deprecated and no longer
supported on current firmware, remove setting the same to firmware.

At the same time, remove the check for non-zero number of v4l2 controls
as some SOC might not expose any capability which requires v4l2 control.

Cc: stable@vger.kernel.org
Fixes: 79865252acb6 ("media: iris: enable video driver probe of SM8250 SoC")
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c            | 6 ------
 drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c | 8 --------
 drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h | 1 -
 drivers/media/platform/qcom/iris/iris_platform_common.h  | 2 +-
 drivers/media/platform/qcom/iris/iris_platform_sm8250.c  | 9 ---------
 5 files changed, 1 insertion(+), 25 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index b690578256d5..915de101fcba 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -17,8 +17,6 @@ static inline bool iris_valid_cap_id(enum platform_inst_fw_cap_type cap_id)
 static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
 {
 	switch (id) {
-	case V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER:
-		return DEBLOCK;
 	case V4L2_CID_MPEG_VIDEO_H264_PROFILE:
 		return PROFILE;
 	case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
@@ -34,8 +32,6 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 		return 0;
 
 	switch (cap_id) {
-	case DEBLOCK:
-		return V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER;
 	case PROFILE:
 		return V4L2_CID_MPEG_VIDEO_H264_PROFILE;
 	case LEVEL:
@@ -84,8 +80,6 @@ int iris_ctrls_init(struct iris_inst *inst)
 		if (iris_get_v4l2_id(cap[idx].cap_id))
 			num_ctrls++;
 	}
-	if (!num_ctrls)
-		return -EINVAL;
 
 	/* Adding 1 to num_ctrls to include V4L2_CID_MIN_BUFFERS_FOR_CAPTURE */
 
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 2239708d2d7e..f9f3e2d2ce29 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -490,14 +490,6 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		packet->shdr.hdr.size += sizeof(u32) + sizeof(*wm);
 		break;
 	}
-	case HFI_PROPERTY_CONFIG_VDEC_POST_LOOP_DEBLOCKER: {
-		struct hfi_enable *en = prop_data;
-		u32 *in = pdata;
-
-		en->enable = *in;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*en);
-		break;
-	}
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index 93b5f838c290..adffcead58ea 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -65,7 +65,6 @@
 
 #define HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS		0x202001
 
-#define HFI_PROPERTY_CONFIG_VDEC_POST_LOOP_DEBLOCKER	0x1200001
 #define HFI_PROPERTY_PARAM_VDEC_DPB_COUNTS		0x120300e
 #define HFI_PROPERTY_CONFIG_VDEC_ENTROPY		0x1204004
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index f6b15d2805fb..c00fd4a83ba7 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -87,7 +87,7 @@ enum platform_inst_fw_cap_type {
 	CODED_FRAMES,
 	BIT_DEPTH,
 	RAP_FRAME,
-	DEBLOCK,
+	TIER,
 	INST_FW_CAP_MAX,
 };
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
index 5c86fd7b7b6f..543fa2661539 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
@@ -30,15 +30,6 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8250[] = {
 		.hfi_id = HFI_PROPERTY_PARAM_WORK_MODE,
 		.set = iris_set_stage,
 	},
-	{
-		.cap_id = DEBLOCK,
-		.min = 0,
-		.max = 1,
-		.step_or_mask = 1,
-		.value = 0,
-		.hfi_id = HFI_PROPERTY_CONFIG_VDEC_POST_LOOP_DEBLOCKER,
-		.set = iris_set_u32,
-	},
 };
 
 static struct platform_inst_caps platform_inst_cap_sm8250 = {

-- 
2.34.1


