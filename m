Return-Path: <linux-media+bounces-49131-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CF7CCED30
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 08:45:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 963B130577FC
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 07:43:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B30382D8370;
	Fri, 19 Dec 2025 07:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pANJgTn5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SBRej+Ls"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068D52DCBE3
	for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 07:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766130190; cv=none; b=hsF5NCLvnq/RIIWW1yVYnTOU51udPhFpS7faWbLLRAPdI1Rg0TAYTYB6TKjp/ImVd7+i62X98k1DmPGaRAWELDftDwNZRTklwtg0PIPbtPW/e6ECOC9M8MsThgPeq/e83vIiln+LIT2yh1u4BHlM+FfNwfj5AT+Q8WB3nkIrzXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766130190; c=relaxed/simple;
	bh=Nrv04AtTzkKXaY2s8Htipm9Jw+ep4zOvvkaTyFf+gHs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OchW81DjfoeMbOSNf32JOtz0ibnl3QFIGA+e9Yv28jzZvM53qh8RyQxptg6UGs4ZgrF2f4IOHRr6GRMph0zEsia/SNfrhhS9sHATycdPckjbYlJ12GqDhX51nx3mT5hjFdcvnFBeD98lc1+9NYWxxZqT7x5QCfmOkFplhqYysP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pANJgTn5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SBRej+Ls; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4c5Dv3991028
	for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 07:43:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FYLirUfiEXnjgPJucKUtZpWdxDHnZDigMmZ/CKd32ek=; b=pANJgTn52bKn2ZZ9
	vvuSwHM6YWeJK0m0vqt6Y6XCoYVM/qAg0ZShfpynJocNfawRL16yzJAD+Gk+sO5D
	K7L2FZ0egc3gZEx1t28ZGdnTDT1ih4NI6FWPZvjN0m34yPL+KzCFszmlap/cywCf
	mtopi6e0klKt2NKicEZQNVwxa9cRRuwmE+TqZzXTFfLgGnQ8St/1Ghd2vYC90f6g
	r57b5U4C0Nlmrwmn0Gf81VrPHEO5H+CZIQYW3bE/qy97KViyY+8xAs/demYy0XvZ
	QTMn7GRdFKmwHugfJrm01QlI0jDAgzaq2zH9QpEEIQvQtjcozpMMxVp33wm/jDXK
	M1sHVw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2d9qdw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 07:43:06 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0f0c7a06eso28838485ad.2
        for <linux-media@vger.kernel.org>; Thu, 18 Dec 2025 23:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766130185; x=1766734985; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FYLirUfiEXnjgPJucKUtZpWdxDHnZDigMmZ/CKd32ek=;
        b=SBRej+Lshi3jpr3xPJX3cNnNcyxDWbYH/j/JVdwhjieCsKe1WbjgRRPeCNBrv3Pj3l
         2MZUnf4TjN6P3qVgV8ljx4giDBHrpWRDSpGc4//yL3/EfdpvmPxCXpdV3+QXb1T0+x4O
         W0FW9nzKk4FgXwDcOzdyHMCjmfwLa4CdKthAp6OYe6MiVB1pzLOgX6nKf7JEnQVhQiqQ
         zmx5eQj/oAaJQupFjU/4IZcG/wBnBEvuEJy8aLK7cYkMuO5ell9col2+pLw/xufa0lfn
         NCoPw8rWXdpW/2FwGaOivf29f5+q7zZeG4+P9Le+7QyHlzRk9xP1qtYLE54LLCzOcOvV
         rHjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766130185; x=1766734985;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FYLirUfiEXnjgPJucKUtZpWdxDHnZDigMmZ/CKd32ek=;
        b=Px7dwst7KZDvpgIxuoswkLXRYWSencKVqCeDquWn69s8aiol9slHYe/OnWG+wotCRZ
         zB1QzuRiq20zwAKfDlRzrZt2rLIPPrpEGOAuTSnmfOFC+Fegy0or6Ze0bwJEDaPhvhTX
         AKB/WxBxFL62FMejo5XZcgUSyyhlVS1wJoDTu605OOUT/urz4DoNKVNZU8QI3BBTD9RL
         Tm7TmZ0h/InguZNIyfPedUKSRUytuxbGt+rMqcgP6uMGIhrlA4b9L6aZ314DBr4TCqvv
         loHzcL6prqhHlesof6ryIWp+KkBt6bdWHvVE1jTlTdKjwNbaZzeqi8qdTGxzAcH+eBvY
         9nBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQXoU7uOtChpCsfjWVs/ceJqEGnydyVySTqYb22wdQDyoezrWPs4n1OxUZ0WFYxkunx3ZGxgtb9C9kUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvaYLBG2d/xrJBRy7ZGPCzhdd5iVf8yHmU2MWAqgoC1ua0jjkY
	CdP5kiHWpbv4Nl+uthmS4+bdIwnEbsw10Zy9cOgkeRW12XUSVNy8501+k88Vd0rcI22ryq4khT6
	gSoohj91mLs9cQDoQ7EpEJsITmsYpxGSuTIsvLgSdkrnGcGGAlvkNZvX1wbt26m00tQ==
X-Gm-Gg: AY/fxX4VEOMAIrY726vQMV9/6kA6913FB5yf6w/UD/BcLX8ZPqFP3A5d1zQM8crC6T1
	WEAFkBvKA5WPM2i3pDJlXKBSXyiQQj5zrB2l/ILYwpOd+zxGHQNdCCb/kBcDpmT5zhMU6RBzW6V
	GrBVJZo4STUoi3MYJkNOxHgCo4uQiW+DHDE3IVhvP+EE9pkQGJGtSuNfJsuFGBYqqqSv7EESpuP
	VPjGmg/ct4iqlcAbhOxrPav8m6Dgs5K9/f4hL6wn7OHNRflHcgb0CAJQH061Y75WcbZwFZl8xPQ
	cBBIWvNHyVi9ET8PuitoFQYukExyNAw5ETi/SW17DGh3UeUwA3xfzE5vluBYewJ8ibD8j6ZSEAh
	G+E/uKg5DcSSB+Btiht89OaExMaFVRIowD/Gvfzv7
X-Received: by 2002:a17:902:c403:b0:297:f527:a38f with SMTP id d9443c01a7336-2a2f2231764mr20232245ad.18.1766130185158;
        Thu, 18 Dec 2025 23:43:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFPzx+n2xsp2KwtdHBvU0RFQ/MfyxEjD55yf+nkGjSNvL5s5EbMYQ7NEk0kmfaj/g9zwknh6w==
X-Received: by 2002:a17:902:c403:b0:297:f527:a38f with SMTP id d9443c01a7336-2a2f2231764mr20231905ad.18.1766130184584;
        Thu, 18 Dec 2025 23:43:04 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cb90sm14007325ad.51.2025.12.18.23.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 23:43:04 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 15:42:29 +0800
Subject: [PATCH v2 1/6] media: qcom: iris: Add intra refresh support for
 gen1 encoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-batch2_iris_encoder_enhancements-v2-1-371f7fe24801@oss.qualcomm.com>
References: <20251219-batch2_iris_encoder_enhancements-v2-0-371f7fe24801@oss.qualcomm.com>
In-Reply-To: <20251219-batch2_iris_encoder_enhancements-v2-0-371f7fe24801@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766130176; l=7842;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=Nrv04AtTzkKXaY2s8Htipm9Jw+ep4zOvvkaTyFf+gHs=;
 b=CPGm2ha1RFSSGc7pvyJP+h6VvNKVXECT0qybxq7NeZfxvHwxWw5sKWrtsfMe3F06AKcmjCdap
 F0zf1XfH76ICAx88Wj0QMO1L7yWarhOYeahlIkAWJrZ0EfqHhkZz0e6
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=AcG83nXG c=1 sm=1 tr=0 ts=6945020a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=WeO3ibNpx1p7V1gMH_0A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA2MiBTYWx0ZWRfX28OAef+Doz7Q
 OzafGs/PsqwlTK8rqiykN3nKDdlzahyb6DVwzVdU4Qjwd150knYSnx8LpcNtNWzBi6/B7pb5J2J
 QOiXkd14UkUqFx6oarhv9b6XBYjQv7jpWbS1c1QwlwwadytNgB3SEGrwUYhINKtu0cVDmcyoal4
 kslzKTV4ePwje5NORyfDq3lrM3tcr97ID7xi1h43otZ8eF3uUrcylWCCpICv+YM1vMKgRPeeuH5
 KaojUidlSNW0tF5ACuFXnN8if5s0EYrCLkHc42mlDhuO5jvvDiWSsgUMc8WOyV1xNuhc8IwgUfd
 krJ6lPUK3Qeo/SszQDfTrETVB2WyeVuARS5BU/VYCZFgWbUgrorVmaz0UwUCwNG64uKzDS4qVHL
 +/L1rN+h0g/ElZ+c0qnxNAt9d1RHGUcHvbZz4ttQlyXbaJxxNB0lM8tkfiKhA2PNOmjvSOWo/mN
 vX5q8Dtj8IOBU+6cLEQ==
X-Proofpoint-GUID: 6dyD7W1mJyjyTgUIuwibXy6tg4jAVQZx
X-Proofpoint-ORIG-GUID: 6dyD7W1mJyjyTgUIuwibXy6tg4jAVQZx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190062

Add support for intra refresh configuration on gen1 encoder by enabling
V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD and
V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE controls.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 39 +++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  3 +-
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  8 +++++
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     | 13 ++++++++
 .../media/platform/qcom/iris/iris_platform_gen1.c  | 19 +++++++++++
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  4 +--
 6 files changed, 82 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 1910aa31a9b9218e9423f2916aa40b85185f0dfb..eae4fedc929e980eb001a5a6625159958d53a3d1 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -962,7 +962,44 @@ int iris_set_flip(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 					     &hfi_val, sizeof(u32));
 }
 
-int iris_set_ir_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+int iris_set_ir_period_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	struct v4l2_pix_format_mplane *fmt = &inst->fmt_dst->fmt.pix_mp;
+	u32 codec_align = inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
+	u32 ir_period = inst->fw_caps[cap_id].value;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	struct hfi_intra_refresh hfi_val;
+
+	if (!ir_period)
+		return -EINVAL;
+
+	if (inst->fw_caps[IR_TYPE].value ==
+			V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM) {
+		hfi_val.mode = HFI_INTRA_REFRESH_RANDOM;
+	} else if (inst->fw_caps[IR_TYPE].value ==
+			V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_CYCLIC) {
+		hfi_val.mode = HFI_INTRA_REFRESH_CYCLIC;
+	} else {
+		return -EINVAL;
+	}
+
+	/*
+	 * Calculate the number of macroblocks in a frame,
+	 * then determine how many macroblocks need to be
+	 * refreshed within one ir_period.
+	 */
+	hfi_val.mbs = (fmt->width / codec_align) * (fmt->height / codec_align);
+	hfi_val.mbs /= ir_period;
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_STRUCTURE,
+					     &hfi_val, sizeof(hfi_val));
+}
+
+int iris_set_ir_period_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
 	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
 	struct vb2_queue *q = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
index 9518803577bc39f5c1339a49878dd0c3e8f510ad..a0d5338bdc910bd30407132e8b700c333ad74e4c 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.h
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
@@ -34,7 +34,8 @@ int iris_set_frame_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
 int iris_set_qp_range(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_rotation(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_flip(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
-int iris_set_ir_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_ir_period_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_ir_period_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_properties(struct iris_inst *inst, u32 plane);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 52da7ef7bab08fb1cb2ac804ccc6e3c7f9677890..4d9632ba86bc8f629cee6d726eb44efcdeba2475 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -685,6 +685,14 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		packet->shdr.hdr.size += sizeof(u32) + sizeof(*plane_actual_info);
 		break;
 	}
+	case HFI_PROPERTY_PARAM_VENC_INTRA_REFRESH: {
+		struct hfi_intra_refresh *in = pdata, *intra_refresh = prop_data;
+
+		intra_refresh->mode = in->mode;
+		intra_refresh->mbs = in->mbs;
+		packet->shdr.hdr.size += sizeof(u32) + sizeof(*intra_refresh);
+		break;
+	}
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index 42226ccee3d9b9eb5f793c3be127acd8afad2138..04c79ee0463d7f32a2042044fe4564718cc01561 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -139,6 +139,14 @@
 #define HFI_PROPERTY_PARAM_VENC_H264_DEBLOCK_CONTROL		0x2005003
 #define HFI_PROPERTY_PARAM_VENC_RATE_CONTROL			0x2005004
 #define HFI_PROPERTY_PARAM_VENC_SESSION_QP_RANGE_V2		0x2005009
+
+#define HFI_INTRA_REFRESH_NONE			0x1
+#define HFI_INTRA_REFRESH_CYCLIC		0x2
+#define HFI_INTRA_REFRESH_ADAPTIVE		0x3
+#define HFI_INTRA_REFRESH_CYCLIC_ADAPTIVE	0x4
+#define HFI_INTRA_REFRESH_RANDOM		0x5
+
+#define HFI_PROPERTY_PARAM_VENC_INTRA_REFRESH			0x200500d
 #define HFI_PROPERTY_PARAM_VENC_MAX_NUM_B_FRAMES		0x2005020
 #define HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE			0x2006001
 #define HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER	0x2006008
@@ -447,6 +455,11 @@ struct hfi_framerate {
 	u32 framerate;
 };
 
+struct hfi_intra_refresh {
+	u32 mode;
+	u32 mbs;
+};
+
 struct hfi_event_data {
 	u32 error;
 	u32 height;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index 34cbeb8f52e248b6aec3e0ee911e14d50df07cce..e7645bd60eb46785e0110a34f3257f7c37bbfca5 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -230,6 +230,25 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 		.flags = CAP_FLAG_OUTPUT_PORT,
 		.set = iris_set_qp_range,
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
+		.hfi_id = HFI_PROPERTY_PARAM_VENC_INTRA_REFRESH,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_ir_period_gen1,
+	},
 };
 
 static struct platform_inst_caps platform_inst_cap_sm8250 = {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index a2025d32b3235aaff25793ba77db143000e54bae..585f0aedc0eb5e80fd108929e1861101a7bab2be 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -630,12 +630,12 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 	{
 		.cap_id = IR_PERIOD,
 		.min = 0,
-		.max = INT_MAX,
+		.max = ((4096 * 2304) >> 8),
 		.step_or_mask = 1,
 		.value = 0,
 		.flags = CAP_FLAG_OUTPUT_PORT |
 			CAP_FLAG_DYNAMIC_ALLOWED,
-		.set = iris_set_ir_period,
+		.set = iris_set_ir_period_gen2,
 	},
 };
 

-- 
2.43.0


