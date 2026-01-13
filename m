Return-Path: <linux-media+bounces-50605-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AD6D1B39C
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 21:35:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F90D3088B60
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 20:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 640373101BC;
	Tue, 13 Jan 2026 20:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pWwD8fI2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I1+oDvML"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9435B3064AE
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 20:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768336427; cv=none; b=KUpb5EXEvP/a4100Hvt0sX3J+CvQhKMO8gZskQ3D0Oq211fGdlxVGJXqwc/nbr87zVJx+/jN8IB6J9/cr6PyLttya4kjljlHBjV7udR0TUM7mY9/UlfK7woSAHg2yKJehNK+jXsLZzyb5djMKWj7hiknYmHKBNDB5cb25Rb9KIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768336427; c=relaxed/simple;
	bh=mI3w+fNYnExFQMgzeQKywHjpUbJ8gQ2nSgDbYOTLhNw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sM4/w8sb40JHeQ+Bzytq5/oAzy1MA+6rhRZw7DK5WXBX3vpyBxiBgMIzeSUhrdRd8oM8M043vjDjtklmrXUJFZCCsLT9JF6gmMnVw5LEFqL3rZL6CAtWWR75RQhR0b4r7vtdequGUo6o+8STAG4Gni9OVv60hQdIr4YfUk5heqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pWwD8fI2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I1+oDvML; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DHZl2J3799018
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 20:33:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pGDn7XjluYGlc7+xUytTtb7c+6xJORtfZoGQQYOexXU=; b=pWwD8fI2C7Xses0w
	U1VbGxDMe+DwgOSMEpXtzr5sD/vngPdQZzbJnS51s7CGQfmctrILpyuNXs4xyBV6
	brO9nHTnoUb+UFZVd8qgkAAqc7FOum4rBMjz4y4wb6uRk9KmdbLOphwFdT+CX5oJ
	huMHzotgO9NJBa1Wf6ijKwUwea2DijPZTqfWLtnUy3eqZAXYil3/7meGSQgWdGse
	/+BILPOucoqQKOLVw70aI3RVoESeC2LH3+Z4PxhajRdkznaPBV0i5JDLIa9cx0t0
	jiaOy6y3TyYPCnW47qben57GMgXPMzKTWLEntbGx61D5xaayBfGZH7XnbZjrvfg0
	t5CXkA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnm0dt164-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 20:33:40 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2ac330edb5dso152490eec.2
        for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 12:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768336420; x=1768941220; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pGDn7XjluYGlc7+xUytTtb7c+6xJORtfZoGQQYOexXU=;
        b=I1+oDvMLSRXDMiXqSkXfHxKfSO4GXkrY12tGXUs4Pvb91v4njfyRbMtb7kntDuYqtg
         NIuk2fjX0onsbmZp7MCpAqG1wh5Uvp6vwCAKkKN4/Wpe/E3sUVvG4iMGdANwyhfufGgr
         szW7HYHxNqz/MwHTyDov0gLIB7KlSZ98klxH8cq47VmNlOnHrEsm5GyEvGCu51z3XY2L
         gph8BhTluCPEASCS5IHzwZXaygQ9nLLFmP//+FfHQkNVFMOq8BYNfhwR/q9OytwdcG6T
         cV1px+ui6Yue5fPvbWvcp4QM/sT6e2IwGvddGkBfyls9qwXv3j5QjF1eveg1LxOz2Xy5
         kPYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768336420; x=1768941220;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pGDn7XjluYGlc7+xUytTtb7c+6xJORtfZoGQQYOexXU=;
        b=cLzy91mS7crBie7rivJfTc06XVGXtEzzVD1cRmmlxlInNQFQJsN9sR7u7l9+YMPbfV
         YP6amx3C1ocKHKFuPQt2phBquBw8RbHrLwJGbAw7hFfFUOsqXJrr4Rs8N49GUGPVXih6
         a+CypEpukNpb/AJcWS/TFpplP2HQW3D5rNeWNxNBlAF5fbpOKJ7p73W2HIfIO4qABGMP
         YgzcSmZG/TNwTX55I7q9CLcUGK4rzSiaYvD3bqeL2bW5L4o+9Vc37QiFo67zX2sOuc6Y
         miPuikBp0FkjVM/KUNBQlJa8bmaU4eUbiHxkd4Pt/uVltfUyZAH3m1RynR8cP0EdoAJY
         4rdg==
X-Gm-Message-State: AOJu0YzzONOMeGZ3D4F9p9FJqtMzcYusEDbESfrlzlbP6Y3a32OlfQ90
	Y+JYI3cFgvhvG2Tz76ISiF9pjm/MdKJtgUtv9yd/Hz3rWnmx//tO0ks0L+twUTDkRdThjGEpBsH
	SKbTpmkTYRSyChOsoXbxpvu7YCT/jKD/NPIQf+X6zWyzu+MGfprje/gv//MUZkutJ9A==
X-Gm-Gg: AY/fxX6pMvRysI6lwQgxjKXrYWBZx1lV4/U7TL50ormwDLFgN2WRNqTYeJZTx+HFGmm
	s7UoTy7KfN7s0EP4MNmUflG9kuePkrfcQC/UGe20J0aZNF7K7rKiVlALx3eKZCateerUyJ4RUH6
	TT1WDWYte6k7D8FHxU8QI8J3H8A8ibVvI0XcH8XCxOTYuMyKUlLxHzXp1RrUG7akj4fOviHnJEy
	lqZy9ddgiAeUdN7mQmPp37lMQKxsfOJxF7eyCIzRdaQ1GghM+/f92+KHrjcN2Zz3k+3OWSaD2n6
	FrxpB/wa7je1hZ9O2Z+J9LH2qws+fimFRIIGLCHgrg1dPk9eauAotFS+VpJaTrka26dzfpokv50
	gBNWwyFLh1xnJDTjPLKTP7SdpI6snY7eOk6BcFpgpBPJnBQnvyeIEv08gbVHQg1aBubN/Ww==
X-Received: by 2002:a05:7300:3b1a:b0:2b0:4f9a:724b with SMTP id 5a478bee46e88-2b4871e9771mr143243eec.6.1768336419448;
        Tue, 13 Jan 2026 12:33:39 -0800 (PST)
X-Received: by 2002:a05:7300:3b1a:b0:2b0:4f9a:724b with SMTP id 5a478bee46e88-2b4871e9771mr143218eec.6.1768336418830;
        Tue, 13 Jan 2026 12:33:38 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b170673bc0sm19157897eec.5.2026.01.13.12.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 12:33:38 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 12:33:34 -0800
Subject: [RFC PATCH 3/3] media: iris: Add ROI support framework for video
 encoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-iris_enc_roi-v1-3-6c86eba38587@oss.qualcomm.com>
References: <20260113-iris_enc_roi-v1-0-6c86eba38587@oss.qualcomm.com>
In-Reply-To: <20260113-iris_enc_roi-v1-0-6c86eba38587@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768336416; l=6206;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=mI3w+fNYnExFQMgzeQKywHjpUbJ8gQ2nSgDbYOTLhNw=;
 b=DHw1LIcBDk9zxxR949jpdE1ETt0fE+cV00q30+Cfosh6oWTtAU25x2IthDRhu5+UQ/J6t/959
 82UNoZZQZmjAnWkxGSgWy5GSojKKsgF1NDGVkzSn04bIl60PaWGh44u
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Authority-Analysis: v=2.4 cv=BYXVE7t2 c=1 sm=1 tr=0 ts=6966ac24 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=4usVFD2bs8YhfvkcmPAA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: CK_Zcz6RqPvodwOTbEOlLiJOqjZcwIJu
X-Proofpoint-GUID: CK_Zcz6RqPvodwOTbEOlLiJOqjZcwIJu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE2OCBTYWx0ZWRfX9Ui1BajfoXvi
 66xs6DFfE7rwP8COsp5gFkLO2eYaHmsHQbLrfLNIa8jENoob/QmbJkXJ2k2eZ5X1I8TCY++rkrF
 ZEYDAKzqXd/J2VT3hO9t45QCm888bWChKgwnmh27/BDAQhyuwOMh/u0qqpBgNVWlz58iy2RO9wN
 PRRbatZ64QFUKeFQMTecAkyqP/OQfX5aeOwCKgOF8n3PnO+yy1GjHbrA9hIAPKZybb3Yk/githY
 /36yvM0VoUh35g2bABid7u5GgeHQ5VQMGYEp6rpkeVbZkJ/ECEgEXrjT7H2DR792ix8WIluK5Gw
 nnr3o2llnoB+C3JcdTARC6hJrvcOVIdpUSOR3CfzdHAPs/9PHWYjB6RW4mqFTFGZ0u4q3eXyvOr
 X1YnWUJCMn307a5WdYDmpm5KzIujkQXs1WTf+L27qb9pNTux1GqDlz2TKBoje6avxORyRGK/Ftf
 f+o/pbG8nlwNePNbKeg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 impostorscore=0
 spamscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130168

Add ROI support in the iris driver, including control structures
and default parameters. Extend support to set ROI parameters
using compound control V4L2_CTRL_TYPE_ENC_ROI_PARAMS.

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 54 +++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
 .../platform/qcom/iris/iris_platform_common.h      |  4 ++
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  8 ++++
 4 files changed, 66 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index c0b3a09ad3e3dfb0a47e3603a8089cf61390fda8..2d00df554a64829af550ed43267bf73b6a9c892e 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -98,6 +98,8 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
 		return B_FRAME_QP_H264;
 	case V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP:
 		return B_FRAME_QP_HEVC;
+	case V4L2_CID_MPEG_VIDEO_ENC_ROI:
+		return ROI_PARAMS;
 	default:
 		return INST_FW_CAP_MAX;
 	}
@@ -185,6 +187,8 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 		return V4L2_CID_MPEG_VIDEO_H264_B_FRAME_QP;
 	case B_FRAME_QP_HEVC:
 		return V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP;
+	case ROI_PARAMS:
+		return V4L2_CID_MPEG_VIDEO_ENC_ROI;
 	default:
 		return 0;
 	}
@@ -208,9 +212,14 @@ static int iris_op_s_ctrl(struct v4l2_ctrl *ctrl)
 		return -EINVAL;
 
 	cap[cap_id].flags |= CAP_FLAG_CLIENT_SET;
-
 	inst->fw_caps[cap_id].value = ctrl->val;
 
+	if (inst->fw_caps[cap_id].flags & CAP_FLAG_COMPOUND) {
+		if (cap_id == ROI_PARAMS)
+			inst->fw_caps[cap_id].p_def =
+				(const void *)ctrl->p_new.p_enc_roi_params;
+	}
+
 	if (vb2_is_streaming(q)) {
 		if (cap[cap_id].set)
 			cap[cap_id].set(inst, cap_id);
@@ -223,6 +232,21 @@ static const struct v4l2_ctrl_ops iris_ctrl_ops = {
 	.s_ctrl = iris_op_s_ctrl,
 };
 
+static const struct v4l2_ctrl_enc_roi_params enc_roi_params = {
+	.num_roi_regions = 10,
+	.roi_params = {
+	[0 ... 9] = {
+		.roi_rect = {
+			.left = 0,
+			.top = 0,
+			.width = 0,
+			.height = 0,
+			},
+		.delta_qp = 0,
+		},
+	},
+};
+
 int iris_ctrls_init(struct iris_inst *inst)
 {
 	struct platform_inst_fw_cap *cap = &inst->fw_caps[0];
@@ -263,6 +287,22 @@ int iris_ctrls_init(struct iris_inst *inst)
 						      cap[idx].max,
 						      ~(cap[idx].step_or_mask),
 						      cap[idx].value);
+		} else if (cap[idx].flags & CAP_FLAG_COMPOUND) {
+			if (cap[idx].cap_id == ROI_PARAMS)
+				cap[idx].p_def = &enc_roi_params;
+
+			ctrl = v4l2_ctrl_new_std_compound(&inst->ctrl_handler,
+							  &iris_ctrl_ops,
+							  v4l2_id,
+							  v4l2_ctrl_ptr_create
+							  ((void *)
+							    cap[idx].p_def),
+							  v4l2_ctrl_ptr_create
+							  ((void *)
+							    NULL),
+							  v4l2_ctrl_ptr_create
+							  ((void *)
+							    NULL));
 		} else {
 			ctrl = v4l2_ctrl_new_std(&inst->ctrl_handler,
 						 &iris_ctrl_ops,
@@ -915,3 +955,15 @@ int iris_set_properties(struct iris_inst *inst, u32 plane)
 
 	return 0;
 }
+
+int iris_set_roi_params(struct iris_inst *inst, u32 plane)
+{
+	const struct v4l2_ctrl_enc_roi_params *enc_roi_params;
+	enc_roi_params = inst->fw_caps[ROI_PARAMS].p_def;
+
+	/* Todo: Send HFI prop to firmware
+	 * once support is available
+	 */
+
+	return 0;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
index 30af333cc4941e737eb1ae83a6944b4192896e23..92ceb9e412635f04787fe92a9e5c6ba03bb7332d 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.h
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
@@ -33,5 +33,6 @@ int iris_set_max_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_i
 int iris_set_frame_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_qp_range(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_properties(struct iris_inst *inst, u32 plane);
+int iris_set_roi_params(struct iris_inst *inst, u32 plane);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 8d8cdb56a3c7722c06287d4d10feed14ba2b254c..6fcbdcb11db7785085de8f95b07f93f8a045c9ce 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -6,6 +6,7 @@
 #ifndef __IRIS_PLATFORM_COMMON_H__
 #define __IRIS_PLATFORM_COMMON_H__
 
+#include <media/v4l2-ctrls.h>
 #include <linux/bits.h>
 #include "iris_buffer.h"
 
@@ -143,6 +144,7 @@ enum platform_inst_fw_cap_type {
 	P_FRAME_QP_HEVC,
 	B_FRAME_QP_H264,
 	B_FRAME_QP_HEVC,
+	ROI_PARAMS,
 	INST_FW_CAP_MAX,
 };
 
@@ -154,6 +156,7 @@ enum platform_inst_fw_cap_flags {
 	CAP_FLAG_CLIENT_SET		= BIT(4),
 	CAP_FLAG_BITMASK		= BIT(5),
 	CAP_FLAG_VOLATILE		= BIT(6),
+	CAP_FLAG_COMPOUND		= BIT(7),
 };
 
 struct platform_inst_fw_cap {
@@ -163,6 +166,7 @@ struct platform_inst_fw_cap {
 	s64 step_or_mask;
 	s64 value;
 	u32 hfi_id;
+	const void *p_def;
 	enum platform_inst_fw_cap_flags flags;
 	int (*set)(struct iris_inst *inst,
 		   enum platform_inst_fw_cap_type cap_id);
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index c1989240c248601c34b84f508f1b72d72f81260a..eccfe5642d6803fd435787cadc83f878572dbdd5 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -586,6 +586,14 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.flags = CAP_FLAG_OUTPUT_PORT,
 		.set = iris_set_u32,
 	},
+	{
+		.cap_id = ROI_PARAMS,
+		.step_or_mask = 1,
+		.p_def = NULL,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_COMPOUND |
+			 CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_roi_params,
+	},
 };
 
 static struct platform_inst_caps platform_inst_cap_sm8550 = {

-- 
2.34.1


