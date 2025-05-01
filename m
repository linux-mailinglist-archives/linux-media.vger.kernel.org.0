Return-Path: <linux-media+bounces-31518-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F131AA63BD
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 21:16:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AEA6A1BA069C
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 19:16:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8730C22DF9F;
	Thu,  1 May 2025 19:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oo+S0Wgl"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56979226D18;
	Thu,  1 May 2025 19:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746126877; cv=none; b=t/cOEB2zSI2l9J/akEUTsrDcT8L7S934bSkZI5u+7MdIsTrI03Rz+TrkCmJBt9yi42YPj67IIszsjZEucNFopTXpRW56bZwt52oyEFZKeQUaOdJSnzUWWGDitMfMFjjk1ec3l+ntZXF+SIbV7pOXdE1pqBqaXQFRQNF21reYoSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746126877; c=relaxed/simple;
	bh=uUoOt19CgPWb7PcapuQwom5sNVeuOlyaRmuP2VhB1g0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=bdG0FEGamSjVZmkmCls7VB2m7GCU8CiFnuANkW3tN/pk0Lh5HEVtIJdCsprQhypFAxT7g+tMVwjEYVcPMjcn8zyHYdAkPIy/tjOQHaQvPda8Vy2m7IcuCH4nN4eD9XUOAsPllGRL/m4Q0b+anmG0Qqr/VtvnReolUjZ2K7JgdQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oo+S0Wgl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 541D22wZ014419;
	Thu, 1 May 2025 19:14:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S4sO1ZCbzRaHpQivN3j4XIWMtpXEiILMegrOCxBBq3k=; b=oo+S0Wgl6ubEstQI
	D3ukEMApa/54Wy9jeM5a+wSEdLYdN3uucIJObPH09O95GuyplrwRkXoYg1VYLpwo
	RTKuGqk9LJ4AQ7rMjM6D7zhM9mLXeWA8Ema7tIo40vOlIP0cql2B6/tDQmQU7Y/o
	rA9GDDKl5FRSQ4gSvT+ACYdtLQbeCGeCZETPJ03PoyN8EjeeJhOc9tQJgK0BrMO4
	+/jmiQB8zU2IW+yJKWpCQ/5kyRJAa6ByQ1JXk3zGZ8icksYK4m4xwICx5ptOIm2q
	SO8DXSNrNN7Z8/7KmO/OYsCQdoB3u0d3tr+II0qyVcW4Q/NQRx9SrYAijfF7Fjwf
	BFCc/A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u766s2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 May 2025 19:14:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 541JEVgt029510
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 1 May 2025 19:14:31 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 1 May 2025 12:14:25 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 2 May 2025 00:43:36 +0530
Subject: [PATCH v3 06/23] media: iris: Remove deprecated property setting
 to firmware
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250502-qcom-iris-hevc-vp9-v3-6-552158a10a7d@quicinc.com>
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
        <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>,
        <stable@vger.kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746126827; l=4514;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=uUoOt19CgPWb7PcapuQwom5sNVeuOlyaRmuP2VhB1g0=;
 b=ZRqZ66oGXI9oq7W7oNuz37MnTDvinKncuRLuA4MRvXi+9TFvfXv764PRT4vjr/dyuTkCA6v6j
 1GLzQpdBfzvBnLdaOpkYdYjxXIYEQ9wvuH4aHfrR7DddccQHW1hvfD7
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDE0NyBTYWx0ZWRfX3caba+YJGGjC dFPLPTYBjIzSZDX8yuv6haLTnPbL0w830fBa70x2YV/UoLNyKTs6PXbD8nHd17PnZQIJcuv123l zLPZzWgHo1hUaGc47Or8g7zjHNjy7CPqM7jWTg80RlRQnRV0+TTLo/b39k5xUe5CLVm3RHPhSbu
 dChXwORrrMOKF80RoASLBYmfIicPcVikp0uHE9fmstz3ucctBw2N/TZAWKPP2HwGxDMtMUKB4qh OxDrR4LJUPy72TAY4NsHWOobamPpR4VuXI3OxSR5rYLBNqr7eW1ZgnwTN5JkjFMzaHK+uIBYrnr DbnJF8tmYy5UPiFb5XNhgXFNe+OQp45HdTXt/zOfuEbHna/NW0pkAb2+kDyK6dzwIcy200x1c0O
 fwHevueACLG7XXecV262zzPHYV+RtVhpf4Cpp6wzeZV0Tn6/Jdz0sPpgPgC9Q5e/XfYqALWE
X-Proofpoint-GUID: ItQYUqfBGk47V-WN2fOPXdeEeD7UNI03
X-Proofpoint-ORIG-GUID: ItQYUqfBGk47V-WN2fOPXdeEeD7UNI03
X-Authority-Analysis: v=2.4 cv=b6Wy4sGx c=1 sm=1 tr=0 ts=6813c818 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=WciSHW0qczRDrvBwlocA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505010147

HFI_PROPERTY_CONFIG_VDEC_POST_LOOP_DEBLOCKER is deprecated and no longer
supported on current firmware, remove setting the same to firmware.

At the same time, remove the check for non-zero number of v4l2 controls
as some SOC might not expose any capability which requires v4l2 control.

Cc: stable@vger.kernel.org
Fixes: 79865252acb6 ("media: iris: enable video driver probe of SM8250 SoC")
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
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
index 2a86c27443ea..ce855a20ce4b 100644
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
index 9f246816a286..e178604855c1 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -65,7 +65,6 @@
 
 #define HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS		0x202001
 
-#define HFI_PROPERTY_CONFIG_VDEC_POST_LOOP_DEBLOCKER	0x1200001
 #define HFI_PROPERTY_PARAM_VDEC_DPB_COUNTS		0x120300e
 #define HFI_PROPERTY_CONFIG_VDEC_ENTROPY		0x1204004
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index ac76d9e1ef9c..1dab276431c7 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -89,7 +89,7 @@ enum platform_inst_fw_cap_type {
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


