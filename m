Return-Path: <linux-media+bounces-44561-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 379FFBDDCD1
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 11:33:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F3175504381
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 09:31:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E45731BCA3;
	Wed, 15 Oct 2025 09:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AQZCVr/j"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D44E31B830
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 09:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760520657; cv=none; b=fZDxxVGiG0qXtWkKEKEUYziD4jqzhOw5V7HsR/rhAKGfgboBlSvEsZuBFk+wV8m5uA6l1bxQ2ZX/wYQp2kJbddv9nvuTBoXU/HTBtH5Q8PXwf8lYHRXV3yZNSKjOlbPzkLvG11J6x1fJ742kTjGre04c+8EbSZcEa+fMxJxlWHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760520657; c=relaxed/simple;
	bh=SuVduaVkXgdGwLoV7y1FfPaaAzaHrO7lkHsSN7jXI8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VnpjA1dhoVqM1GD4/qgME3ijEe1I3aP8+vfcTJC0HLxVNddduZpM4XbHcNRxB0xyu2liM5r8CqG17uEbNfyAyGi4lO3oQBISdux9wCQKkB/arJW4BBwysIY8DQO9zmJ7LbSvjbxE0U7IGiCgWpJ6bWxAQsUSZ5km/V0I0ymnHuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AQZCVr/j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2s7Wu024770
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 09:30:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Y1kg+p2rK68
	ERP1p7EJ2CvNyyeJCHrKuUOCUWlCgr48=; b=AQZCVr/jamPPGrufNMeHn99mcbF
	ox8UuevguLnyrNSez+q5/73TZgJCTVg+m0RKjDouVtiQvod/MwOT6sYtF0HWEvjp
	EuM7MTqt9tuOG32YK8lweziFrhclLua0N4U/mQ1l5NGOqlSua+bB0B4dRAOJkvgr
	eKCcEWInXd5M71KVxYAc+8pDhWuJBepmhnp2MoSvMU5vgLU8xi5Tw4pNXQv013LC
	2HMmM8Mx3CJsArzoPMRVHGPayfKDquk9ly9p2YcNwZ1VOUyFXZTKkt+tcJ69/13/
	plPM1N5Ozn1fZxItpdM01QyMNuELPLWCLyiR4IAOfsHvU3bi/8PxmxKLtnQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qff0uuuv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 09:30:55 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-781269a9049so17022777b3a.2
        for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 02:30:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760520654; x=1761125454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y1kg+p2rK68ERP1p7EJ2CvNyyeJCHrKuUOCUWlCgr48=;
        b=k/PZsfBXK1Uw28TY/GThrKf8irpjjQodZ7DKcen79jlHd8HXB6OQfyo6ttZLtrN9tU
         GdrWO0yuNAQnQ1AWmjDF1TSqwjMAKFxI3L3ZE5JepPpRZKzjJIaj0mo4PwLg8Jr2Y/4E
         rSrXtum352gDMrDgNQHfQwliPQLqvMoDzLYSMPSd/iM+W/Nlnnifnr6s5f1eDcNRvblf
         77WVWBBT2yyx9qINKuzP1mq1RPbTvb5AuJ/ceJ30BiVL6vc3k89ju34KAhga1TQMeSRr
         PMcO/bTIsbhDeNgABk9WFxoaF74zuOTFW+h7hVqohotY5Uy0/4cLW6O/8edW1zKPUu7k
         s3zA==
X-Gm-Message-State: AOJu0YxY/fkhYuMqC/aevKWYqeWRufx/34GCFlDDADD+xMl7geJs87PU
	7WJLFemAOdjYz7wHPvKa2PHVlBrTECDn8Tk87thha0U/vqemsfPCTk8Jb7f44x4QIN88Ht6aKG/
	K+rtTakGNjaq+LqU3F8Hx0zyvXujRCuOTTvhQUiHB5+Oqyey/IdBYxwcTLAwGhbL+Tg==
X-Gm-Gg: ASbGncv5uqWyMrTojaGo+7GJE+uxOtF2ymZ9xHUTIRQfT7ckbJ9QbZOrV7DUUe4qkut
	68V8yyb95US55cUCZdDwPoqzzJmKrq5W3udK4nJ4l0c/k+N17giyvVik1UaQT9SIbuWnEadP/Y3
	CeQbMnvUJCmBsgZvs0m203guOvSfM2IdwePJwIiRUv79qQBVEHlkIVG/at3G7wnqWOHYHxT22XT
	qQZYzfsNOq3iLkgEY1TUCTPGP1dlXpLUQm0O2PsjVXsFhBUAwrbz+405/0cIMWLDOOXivNbCRES
	7PlX41MEZ8j8wUAExPfnYl9ppBi4n4EQBWnbLI6KeACGuSEGhC9xBAAVkdVM7H1WjNNeWYeT8Xl
	txIK4r/xKxF5DONyRPy3c2dmPFfl7M3rU8wY=
X-Received: by 2002:a05:6a00:4fd4:b0:78a:f784:e8cf with SMTP id d2e1a72fcca58-79387829619mr30058008b3a.27.1760520654310;
        Wed, 15 Oct 2025 02:30:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJ0soQb9bDnXm++IjhuW3gJpSyFFoMQSKckUa9K+r8CuCGeYh6rZgqF92eLptBNZ/sV3Ez2A==
X-Received: by 2002:a05:6a00:4fd4:b0:78a:f784:e8cf with SMTP id d2e1a72fcca58-79387829619mr30057984b3a.27.1760520653790;
        Wed, 15 Oct 2025 02:30:53 -0700 (PDT)
Received: from WANGAOW-LAB01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d09aa20sm17946745b3a.39.2025.10.15.02.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 02:30:53 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
To: vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        abhinav.kumar@linux.dev, bod@kernel.org, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_qiweil@quicinc.com,
        quic_renjiang@quicinc.com, Wangao Wang <wangao.wang@oss.qualcomm.com>
Subject: [PATCH v1 4/4] media: qcom: iris: Add intra refresh support for encoder
Date: Wed, 15 Oct 2025 17:27:08 +0800
Message-ID: <20251015092708.3703-5-wangao.wang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251015092708.3703-1-wangao.wang@oss.qualcomm.com>
References: <20251015092708.3703-1-wangao.wang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX50NgQBEsiCaJ
 +mn0EWZ99u6SrrjldkFqlIgVY9C61RVxG/Q74lVZMaIvBP0nH1VrkD2uijJyga+1/i/B3FY+U1d
 Eff/tvYKwKrOeG8/sz8g5mRXoPyYZPVl0gAm99USza/GBPna0Gf+EdOaRMK7YYB4qAGULdfyxfa
 83ODywQmSRnE9x7yeg7WAIk7NrNP0qBfaxT/2K8JOK3Db9Jq3C9ZFw0MC9/WdBr+DLNIDL2OgGp
 K/0al0r3sAeyCNBzPEVc2z1o4xpsykJ7NDvLmtEs5gPjvzopVi4uN+j52bEoHcUZ98Dc/djQFRi
 biw3QOJ7XsdoYbGyFjQKeuBdQtWpwDRy5CRLAAoGg==
X-Proofpoint-GUID: x_Y6yzeKo1iEVaESNGeK0McmqsgXAeYp
X-Authority-Analysis: v=2.4 cv=PriergM3 c=1 sm=1 tr=0 ts=68ef69cf cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=l_OZQY5ESRzjHvheC7cA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: x_Y6yzeKo1iEVaESNGeK0McmqsgXAeYp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

Add support for V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD and
V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE controls.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c | 33 +++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h |  1 +
 .../qcom/iris/iris_hfi_gen2_defines.h         |  2 ++
 .../platform/qcom/iris/iris_platform_common.h |  2 ++
 .../platform/qcom/iris/iris_platform_gen2.c   | 19 +++++++++++
 5 files changed, 57 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 8f74c12f2f41..148915692473 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -104,6 +104,10 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
 		return HFLIP;
 	case V4L2_CID_VFLIP:
 		return VFLIP;
+	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE:
+		return IR_TYPE;
+	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD:
+		return IR_PERIOD;
 	default:
 		return INST_FW_CAP_MAX;
 	}
@@ -197,6 +201,10 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 		return V4L2_CID_HFLIP;
 	case VFLIP:
 		return V4L2_CID_VFLIP;
+	case IR_TYPE:
+		return V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE;
+	case IR_PERIOD:
+		return V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD;
 	default:
 		return 0;
 	}
@@ -944,6 +952,31 @@ int iris_set_flip(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 					     &hfi_val, sizeof(u32));
 }
 
+int iris_set_ir_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	struct vb2_queue *q = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
+	u32 ir_period = inst->fw_caps[cap_id].value;
+	u32 ir_type = 0;
+
+	if (inst->fw_caps[IR_TYPE].value ==
+			V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM) {
+		if (vb2_is_streaming(q))
+			return 0;
+		ir_type = HFI_PROP_IR_RANDOM_PERIOD;
+	} else if (inst->fw_caps[IR_TYPE].value ==
+			V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_CYCLIC) {
+		ir_type = HFI_PROP_IR_CYCLIC_PERIOD;
+	} else
+		return -EINVAL;
+
+	return hfi_ops->session_set_property(inst, ir_type,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_U32,
+					     &ir_period, sizeof(u32));
+}
+
 int iris_set_properties(struct iris_inst *inst, u32 plane)
 {
 	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
index 355a592049f3..9518803577bc 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.h
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
@@ -34,6 +34,7 @@ int iris_set_frame_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
 int iris_set_qp_range(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_rotation(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_flip(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_ir_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_properties(struct iris_inst *inst, u32 plane);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index 0f92468dca91..9e8fdddf2aef 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -70,6 +70,7 @@ enum hfi_rate_control {
 #define HFI_PROP_QP_PACKED			0x0300012e
 #define HFI_PROP_MIN_QP_PACKED			0x0300012f
 #define HFI_PROP_MAX_QP_PACKED			0x03000130
+#define HFI_PROP_IR_RANDOM_PERIOD		0x03000131
 #define HFI_PROP_TOTAL_BITRATE			0x0300013b
 #define HFI_PROP_MAX_GOP_FRAMES			0x03000146
 #define HFI_PROP_MAX_B_FRAMES			0x03000147
@@ -108,6 +109,7 @@ enum hfi_flip {
 #define HFI_PROP_BUFFER_MARK			0x0300016c
 #define HFI_PROP_RAW_RESOLUTION		0x03000178
 #define HFI_PROP_TOTAL_PEAK_BITRATE		0x0300017C
+#define HFI_PROP_IR_CYCLIC_PERIOD		0x0300017E
 #define HFI_PROP_COMV_BUFFER_COUNT		0x03000193
 #define HFI_PROP_END				0x03FFFFFF
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 284d6bde6d6b..30b98e769ad3 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -143,6 +143,8 @@ enum platform_inst_fw_cap_type {
 	ROTATION,
 	HFLIP,
 	VFLIP,
+	IR_TYPE,
+	IR_PERIOD,
 	INST_FW_CAP_MAX,
 };
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 5d76f638020f..35915c87c5b1 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -620,6 +620,25 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 			CAP_FLAG_DYNAMIC_ALLOWED,
 		.set = iris_set_flip,
 	},
+	{
+		.cap_id = IR_TYPE,
+		.min = V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM,
+		.max = V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_CYCLIC,
+		.step_or_mask = BIT(V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM) |
+			BIT(V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_CYCLIC),
+		.value = V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+	},
+	{
+		.cap_id = IR_PERIOD,
+		.min = 0,
+		.max = INT_MAX,
+		.step_or_mask = 1,
+		.value = 0,
+		.flags = CAP_FLAG_OUTPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_ir_period,
+	},
 };
 
 static struct platform_inst_caps platform_inst_cap_sm8550 = {
-- 
2.43.0


