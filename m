Return-Path: <linux-media+bounces-32093-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAF4AB0D5E
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 10:41:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7FC937AF70C
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 08:40:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 205BC27A46B;
	Fri,  9 May 2025 08:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ajs38i8D"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1762749FF;
	Fri,  9 May 2025 08:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746779987; cv=none; b=UPkcRGVlvJoPrfgqBfhIXTV5oc99+7eS1KAR4lc+Y2j1OhCNHSkXxJy2UxCTUsat0v+c98yOeG5+29vZSbv12HPUsPeSA2SWQ46y34TPsxfrp+8l4EWjjOaWorXupGOw/jg+DSakf4hTwYjQ3pqFhYpuw8IcYl52Yh8fiEw4oSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746779987; c=relaxed/simple;
	bh=mlxc0QnHLVR3LikrdLPId6kJxcGwKDtRyKniYzOkYJc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=E5/gBd60zO5dv8iuPiEOQlkr2qSwBNLJFf8XJrBKJHrhOODbksKIhpqjBZhys3zOvB5IknHGQrECa1JnSrGMfYP2aszTZTc6qkcN7wJg4hfNNGW+U5KWZvueaVh7TnyPLCt4jCidUcV9IkMnRwPTLoFj+k+QN62upYGFK7MwKyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ajs38i8D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5491dBK9025202;
	Fri, 9 May 2025 08:39:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dmp7F/KTuljAa+K/G7NY6fm+aKAcENXGjVbsDC4i3Gg=; b=ajs38i8DoKG1t5xc
	fc3I74K2g+pYDJF3B2OfMp1sVQqRLXejTI4yiVtVRlMzdnRRHmrH7SM1pCDj6hJB
	nU+v225yWWUUgZKlLOAiU6JGV6KlMAJekcU0QXjuQ8Fwl2E7UG4YU2xQyAAl6oEH
	/2xph/ROMWGLiioUaKKyf6B1N4SsWutFzHWdXCBGTzOHZM2ov+hAiTl7wg97bxPL
	52UkFvvhnb1yKg/UEEPOorKnOUjyLwLlNUjhMZd/jtZKEDfQSt7o1FYQolgi6fzz
	XYhxcvWK3a2ZQGIO4aYWd0gteD+cgOWZIYRdyDzPJilMFumzKkJJstndPkmM8ksI
	OpfSIw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp1415y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 08:39:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5498deJ5031034
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 May 2025 08:39:40 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 9 May 2025 01:39:35 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 9 May 2025 14:08:54 +0530
Subject: [PATCH v5 08/26] media: iris: Remove deprecated property setting
 to firmware
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250509-video-iris-hevc-vp9-v5-8-59b4ff7d331c@quicinc.com>
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
        Dikshita Agarwal <quic_dikshita@quicinc.com>, <stable@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746779937; l=4678;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=mlxc0QnHLVR3LikrdLPId6kJxcGwKDtRyKniYzOkYJc=;
 b=BpRmEwYib+oZBAk1Yo4Vw/RQ7tC6dP9kNvEYZ1BtQlxczht2pJtF+v0uIobIXnoqU2SypQ5vA
 cqWAV6YXt/hCUFSkN/lCwbKsRzFnx9wCHpEZaE2uk10Qvo4Iwu25soy
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA4MyBTYWx0ZWRfX00ErBfV99MYt
 Uap69wtQpJdlFG9jBUJxWHeToIEDWcJE0j3IJks7Ay/I4YHe2r4CfwQyD/E5drRiHn6d3Fg6uer
 VhjB08tNABI8AuuL3bzrIPjyYEz4RC2nIBdNoE8Cx5MNRkwQ2VJjl+eKMHhKDJIyzlFyzqu6j98
 8QCMyy0RRj0kqWlr5yh099renEh8npR+oFGoHntbZwe14g3cUF5/loZJMSy4JY47j6iAnV+/wj8
 uw86+LU/0omj4fH2ozcvk28f7NYW9bCM9O9oG8zKkD6TuL7qAoyUl+ulitvr+vnVGN7butkjA35
 7I3k5SvZHPEw9jB7GlVvGD7o55RhUtLbme6+kIERmApBApuuSeRpaTQe7T1nC9aLJdvSZxgiF1x
 aRrp+Z+tAAZZrJYSCbJhU2cLljpugZFN2B/+78UsGpWR/J/CAIoP/sQTDdfRqqPOlLI5H64g
X-Proofpoint-GUID: 6VmUD7VMqqEJ22yeLqw6r_X86z0LFp9d
X-Proofpoint-ORIG-GUID: 6VmUD7VMqqEJ22yeLqw6r_X86z0LFp9d
X-Authority-Analysis: v=2.4 cv=W4o4VQWk c=1 sm=1 tr=0 ts=681dbf4d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=JpNlIMTKpnad2xt6eFcA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_03,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 suspectscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 mlxscore=0 adultscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090083

HFI_PROPERTY_CONFIG_VDEC_POST_LOOP_DEBLOCKER is deprecated and no longer
supported on current firmware, remove setting the same to firmware.

Cc: stable@vger.kernel.org
Fixes: 79865252acb6 ("media: iris: enable video driver probe of SM8250 SoC")
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c            | 4 ----
 drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c | 8 --------
 drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h | 1 -
 drivers/media/platform/qcom/iris/iris_platform_common.h  | 2 +-
 drivers/media/platform/qcom/iris/iris_platform_sm8250.c  | 9 ---------
 5 files changed, 1 insertion(+), 23 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 6a514af8108e92e95993916b155425fa47422e93..915de101fcba47bf1d1d9019cc5e704b87e2b9bb 100644
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
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 2a86c27443eaf2e65eef8ec1bb89545fbd5ffa50..ce855a20ce4bf4973686dd3a90bcb605065673f3 100644
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
index 9f246816a286200dff465401bee8c51097dda674..e178604855c13f71e085e7e41ed3b53e7c90c57d 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -65,7 +65,6 @@
 
 #define HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS		0x202001
 
-#define HFI_PROPERTY_CONFIG_VDEC_POST_LOOP_DEBLOCKER	0x1200001
 #define HFI_PROPERTY_PARAM_VDEC_DPB_COUNTS		0x120300e
 #define HFI_PROPERTY_CONFIG_VDEC_ENTROPY		0x1204004
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index ac76d9e1ef9c14dd132f306fae55cccbfa141092..1dab276431c716f39d89f3c92f930194ae2275d1 100644
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
index 5c86fd7b7b6fd36dc2d57a1705d915308b4c0f92..543fa2661539188ee267838bc4742717b5b11204 100644
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


