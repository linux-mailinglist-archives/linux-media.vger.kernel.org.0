Return-Path: <linux-media+bounces-31902-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0868AAD884
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 09:42:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F56B1C00FBA
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 07:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43031222575;
	Wed,  7 May 2025 07:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IlEWpEJ+"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3102222C8;
	Wed,  7 May 2025 07:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746603654; cv=none; b=StPWhR5lP5gfGgKjw3qDHfEC1Ht+kaQ4aBcE5M10e+hq56ztt4q+h/4ClI3HT7a12ZLg4J0SvMGCoWlikMBmz6DRd/CBBRDM/XngpogRpvxeqITXuH8V6D0h+8uunoYJqx5/VUGN87Jj3UxaZWRqOYcu6Qa7v9a44nu0neT5eg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746603654; c=relaxed/simple;
	bh=TePP5TzQJi94BomhBzoj37916YQijsaIxH4oDDJRrFU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Q0it9Ogqd5oslNbi1+Rt0TBAQc0ltfFreCH5FZsxKFrpcMbZMKs95xtZ9eVlZkWLoO4ivDTXwMWIWCPPo86DmG3ZeVieSTVBCzyDKoQ1kKsTlSqaP2UMwesaClCXVWcdO+5HeL0KhEUPVDq02EQQdHbEo+TSWPkWKm8tWOpByBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IlEWpEJ+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5471GuD8009547;
	Wed, 7 May 2025 07:40:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+xkXgwFwq28XlC6N7aelfgAiN6TGOBBN2uELXYnZOnE=; b=IlEWpEJ+J0P7qyUD
	MWgUzTNTavQTRDmQTzYtbCAwPwH4q7ZXINZkmQtEmZfgeYCeZ5lGUb9b2xW3mwmt
	TXDKuA/J1k9RwOtDaWvIQsWCzCUp7QiNg/8N2LZLskXVHGi+/6dSZnDpQWNkS/nz
	LLmYSaGMBbipjr/t/Ti3mGI765k55oTDsNtqcPTkzA/GL+/NudAndwduAd8qaXoR
	Q10MKu+ORiGg31tvRprZu0rGD7IeGVmfGsK0QNJpaIKt9Mxkh4Y6otDRK0ZE090U
	DNCYS0Bf+Va5qHgBznTY8JOcHPJoDd2mGLm8OiFUzH2RgG5OvVAYVww93krZeNuw
	l5xTzg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46fnm1j1kd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 07:40:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5477emrv006266
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 May 2025 07:40:48 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 7 May 2025 00:40:44 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 7 May 2025 13:09:38 +0530
Subject: [PATCH v4 07/25] media: iris: Remove deprecated property setting
 to firmware
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250507-video-iris-hevc-vp9-v4-7-58db3660ac61@quicinc.com>
References: <20250507-video-iris-hevc-vp9-v4-0-58db3660ac61@quicinc.com>
In-Reply-To: <20250507-video-iris-hevc-vp9-v4-0-58db3660ac61@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>,
        Stefan Schmidt <stefan.schmidt@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746603611; l=4394;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=TePP5TzQJi94BomhBzoj37916YQijsaIxH4oDDJRrFU=;
 b=1PcQDW/QTK4tnD0D0BjRV1XeyhFZ2t/40qpamRhKdZ02SL/ZJI98J5iJa1kBa0I7wTkxq01TY
 i9x9sRTn2duDVSRM1WOOU23MZP+iS/Ewae/591Qnn6V6UkDpzdZgjfC
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: V6znj0eER8cPDP30RFzpZgnTTwPtFhG6
X-Proofpoint-ORIG-GUID: V6znj0eER8cPDP30RFzpZgnTTwPtFhG6
X-Authority-Analysis: v=2.4 cv=bLkWIO+Z c=1 sm=1 tr=0 ts=681b0e81 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=JpNlIMTKpnad2xt6eFcA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDA3MCBTYWx0ZWRfX8MG3S0Uj6EGn
 ePfbxLK5MPmNNozDg0SOEkilyXioWibyPQX3tsjYPq2AYpAmSsUjI9SD/xJDwOpCnChJkiHB4Dd
 Pp8UtGlrKGw1erZamnygcPEs+pApZa0nNAEx7PYoOu9T0oRb4XDbbXmaIzg6hKXq2yJcpX3xPOi
 HH6DYGBWxB3LLdASkzKZJzIWT5y+kEuJKTIOEAguJqPdLbgqAQubd6Dd7e9w+fsQgbjWTcmyANt
 46O1aKX2wme7/HryWyLUrfBPEnwKiM4ieNeEf2QB+mZB4YeFymFejVqgseZgXIRSdEXEWGPBtOd
 QpXJkcWi383cOsp56+5dlBRkMzNLyXCrFRd6HzlIoL474i0hWj1CSRPwTR7zhm6o6Szkh8LgEKq
 0vxq8fPK0cmJO3lx6REGWOlgsILayUlwPljjW9zTKcVVogyIE6PrNwwdcy/yeE0YcsVy+ER7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_02,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505070070

HFI_PROPERTY_CONFIG_VDEC_POST_LOOP_DEBLOCKER is deprecated and no longer
supported on current firmware, remove setting the same to firmware.

Cc: stable@vger.kernel.org
Fixes: 79865252acb6 ("media: iris: enable video driver probe of SM8250 SoC")
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
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


