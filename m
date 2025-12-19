Return-Path: <linux-media+bounces-49132-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DCBCCED36
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 08:46:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A5BB306B6A1
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 07:44:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E079B2E6CA8;
	Fri, 19 Dec 2025 07:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nd65eWls";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dPCBk7GZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE692E718F
	for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 07:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766130196; cv=none; b=a8o5TcQyiUXab2eMwr2zjvABjd3ImCjnZ2hhmmzPH2uZwvEpOI4E6Ms4UwVsIkQUe6fBln5GKUKUJHeCPFC8vVeb+qhVdqTjogLT4ztnxcKrj5mZ4qYSRwEnbmduwQG5gF1LaVKC0elLWPkwaLK15mQHbfqgtJR7IcyYsfVl+ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766130196; c=relaxed/simple;
	bh=fHQX0/QP2fJhPtUC530tRUPfr5fvxYSI+4tNhsQTpok=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XnRXtxxL2hioArtFaagA5CvxCYaD5Hagvcs7omVC2f19OqPA5rtzzKbjnQEvpl5gvcDSEcE+67s4d4ifJPeTbtTp/9qAekGzzr3WHY805IjEa9vbO6a2XXQk2WZbpsrrB7kz75g6GMVlsVH+b6SGX5boI9EzU+7wa3LUMUHv+ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nd65eWls; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dPCBk7GZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4cF1q3991947
	for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 07:43:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JhpcmPRMhznPbfr5DnNKjbK6Pv100cIR3lFbHZl0ThE=; b=nd65eWlsOJ9e2y24
	LWx4aikdzUVqV1aXRFFn9FunxpHHJEgemJIlt1g4evwZTUUPtQ1+DGfMUvaWAB6L
	3ACQkYu/iZ9abMfgOubxlc5u/uucZJocEWFyx6GKTkynvnUrN2eRMR3ZSYEA5i1B
	J/Re1NhSUlqRHGZP2r4rHsLpYRr5WSDO50ON2Sok+A8T4VRq1gV9KUsvsFIYLrc9
	MR+x24FHfWdwnvOKuQR1n1dCp+Pzmt4VcYPhAT5yE7WqH2CDAJR1liisHsZM1xcr
	vx7YWffOXXMZttKrCe/sFbeTSQ4PwE+PNRokBpge/O4tOe0pQqq/ZhWn6bu2dUDg
	pVAgCw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2d9qep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 07:43:11 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0c495fc7aso21155005ad.3
        for <linux-media@vger.kernel.org>; Thu, 18 Dec 2025 23:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766130190; x=1766734990; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JhpcmPRMhznPbfr5DnNKjbK6Pv100cIR3lFbHZl0ThE=;
        b=dPCBk7GZyjcUEtK0DWThrzGTAZ6Ba8ILbVe20ZwgZyAGfrcqaA/G00bVzV6js92Uge
         QIYRFVmo7ogC5Wb7VVdRdHWWRV3OyJiwZ/hrTyHzv4uMGh9vOSdlhttt48WPBjjZ4pYr
         r44MxNQzGFhgQne1m4IuibyWg18Z9hRofljfmke30rGxksH/1w/xkWT1hdI2fzhFTHeU
         bUY4YVywvmokKSA1Ym9F/GQUgZWNfYeSkDO0iAsQT5EffX28239LfA6t4WH2hSAvuMA0
         cjfV0F1LwD8Cgfy7peDC//upjdX7YasGdOc8ZH3gKLYVLl0LF7h5M37QXtQcMnQsuYwr
         ykwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766130190; x=1766734990;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JhpcmPRMhznPbfr5DnNKjbK6Pv100cIR3lFbHZl0ThE=;
        b=cQ1cn+7UVmUO3htGlHMy7xUk+3Vx/MykH1U27fwpBO1U7KEFLRHkg58ulI93rA9UWE
         SEBU21/DLQ+W6tTkmMvvHgC+kXdsfv2otiJiKcMd0GKABqyPITga2oYSnJ0ncQsErvcy
         eR9dpm8PsGcfDgCCnmCLB2XTAjF3uLEEojxPeoCK6qqDZIDIgOwpWxTRFbgAZWI4KWnv
         J2Dmvom5L1rWcmbSxlqLP6/l3552Rfoa5mPEA4kURNvsnWhj+1W0hne1hOgQW/iRYye4
         8rRSsiYGQYIOGAmXE7EmVEEuIIogkyCYcFyuIn5plxqXpLfkA1qCqEm+0TXvMhSwXkWT
         Epwg==
X-Forwarded-Encrypted: i=1; AJvYcCUeYAoxTo3g211yUp1UMTxc0nIC++orjwx8PgUS/OxT0OAF92KjikgBlKUctIXpvuzcxEBhxzX5r5ZkjA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw46VMx6x7umzqxgMK4sesWWaNqt4SRo9dzL4Nl9MShxNWOhkbo
	H+Nht2DIbwh0Aiu9sH+bCgxpGL0CeY4B4GptJP8MsHfNlNeYhW/Eekg4pZd14gMe2H3ecJrjg8w
	liWUHEmY5sGIsjhaSx8KIKoAgThXVlCHDm8znOgwDQ9CujRQ46QZHziyeyhx8ZD7iLz07qw6joA
	==
X-Gm-Gg: AY/fxX4m4LpM1YHNxyhTilN2UXkSb76vii3fNcXWT3fguq70+F4LYSIVdp/hHb1n6lz
	I602zy3BlbAC+KUiK3eaUv6jNueTEUl8IRL9yMzE7nYT+RqDn/FH0+mQhCD3fZQYyQH79UqGnT+
	p0v0BmB2idKiPiqhBo0UALzEvvkCCqsOnp2BaXTJnIY6WE8q+kouge3j6V5N+OjMJjqsYQQLHq4
	tWcA/8/+C0I6Wz6jB7S37MuO2WXBSyXAk1lpXziHxYpnm2GcuDkNia0Eid9/KNdGH+WN5YMO1Zd
	gSZYsJIHnZymRtGHBKI5em9ggD2emQEtTf+/VW81MtkVrTkr8yhnyKX/LeTIvv8EOI8doI7Ezcp
	adpcyk1IyDK7GMdSDRtUQcCxTYOQvlXffuAuPyWYf
X-Received: by 2002:a17:902:e541:b0:29f:1bf:6424 with SMTP id d9443c01a7336-2a2f221ff92mr21207395ad.18.1766130189467;
        Thu, 18 Dec 2025 23:43:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEiGPFK5ZZdboKnXYnv1eylTJ0qT4+uxY08hFyE0xqoem5+iOSHGFthiC9xgKwp7nIYzy4c0A==
X-Received: by 2002:a17:902:e541:b0:29f:1bf:6424 with SMTP id d9443c01a7336-2a2f221ff92mr21207125ad.18.1766130188891;
        Thu, 18 Dec 2025 23:43:08 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cb90sm14007325ad.51.2025.12.18.23.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 23:43:08 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 15:42:30 +0800
Subject: [PATCH v2 2/6] media: qcom: iris: Add Long-Term Reference support
 for encoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-batch2_iris_encoder_enhancements-v2-2-371f7fe24801@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766130176; l=16267;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=fHQX0/QP2fJhPtUC530tRUPfr5fvxYSI+4tNhsQTpok=;
 b=xzFhLeuBiUK/TjQ5caYRpgjjUTaoIh2dN4/4dLp3D5qn3s1PhU9RXPRVDJegNiXoq1lMN15R0
 GR4nkFp2WuqB74s0LGC5ewDaapqrvAO3WUuY0elKHEBpm2DTnS1Cl0n
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=AcG83nXG c=1 sm=1 tr=0 ts=6945020f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=QunbDvX0_-zBgmAapgUA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA2MiBTYWx0ZWRfX/Jt7m0QgTJ48
 gE6Rlyk/fa3Y+JD9xPNJMV9jsCLLJWzwyv2KyPGQO7iaaOWvGzJpmpR7t0kyP/3hkcxy2cVCcWp
 PhLuDxtqO3ADdltAO5KfssGpWTezJeBeU2T33eUo9x3yOpEhYK/8DBKDFZegFyn+e3PuvPYka00
 KoK3bRXNqGx0Hk6ZXMdD4I+MuJG9dwEpnlRCrtVU+qjAm4oSB5ou4kAGMduZNxcP9DcGAyazWz7
 ygVelCvwWDfwpAqWJjc9hPJajlTp6Fk+PoK8FxAZLkLLwVyI+p2xNgsTz5PDUOS3ASlj8f4Eeo8
 /E6e+Cs2c3AUf8P6L5XE9f0ywsze2VKTsFrlhWMiWJGNHtX+Y0GCfKL80y2TKX+4kWgRT2YgXgs
 W5toSTOKSJOcrgAUwXr/I8Uvnay9rbmo4G+YlIUP5uIo9k8EdxJuPiugpZAiqn+xxbcY5S8dNpw
 B6FRGElBe5UkN9DdQzQ==
X-Proofpoint-GUID: RWfCndTIS5ba5oS_Q5t8N7HgKifYrV72
X-Proofpoint-ORIG-GUID: RWfCndTIS5ba5oS_Q5t8N7HgKifYrV72
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190062

Add Long-Term Reference(LTR) frame support for both gen1 and gen2
encoders by enabling the following V4L2 controls:
V4L2_CID_MPEG_VIDEO_LTR_COUNT
V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES
V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 128 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |   5 +
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  25 ++++
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  24 ++++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   3 +
 .../platform/qcom/iris/iris_platform_common.h      |   6 +
 .../media/platform/qcom/iris/iris_platform_gen1.c  |  30 +++++
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  30 +++++
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  20 +++-
 9 files changed, 267 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index eae4fedc929e980eb001a5a6625159958d53a3d1..428203af725ab5697ee42b5adf9557c65fafd7f4 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -108,6 +108,12 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
 		return IR_TYPE;
 	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD:
 		return IR_PERIOD;
+	case V4L2_CID_MPEG_VIDEO_LTR_COUNT:
+		return LTR_COUNT;
+	case V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES:
+		return USE_LTR;
+	case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:
+		return MARK_LTR;
 	default:
 		return INST_FW_CAP_MAX;
 	}
@@ -205,6 +211,12 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 		return V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE;
 	case IR_PERIOD:
 		return V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD;
+	case LTR_COUNT:
+		return V4L2_CID_MPEG_VIDEO_LTR_COUNT;
+	case USE_LTR:
+		return V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES;
+	case MARK_LTR:
+		return V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX;
 	default:
 		return 0;
 	}
@@ -1025,6 +1037,122 @@ int iris_set_ir_period_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_ty
 					     &ir_period, sizeof(u32));
 }
 
+int iris_set_ltr_count_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	u32 ltr_count = inst->fw_caps[cap_id].value;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	struct hfi_ltr_mode ltr_mode;
+
+	if (!ltr_count)
+		return -EINVAL;
+
+	ltr_mode.count = ltr_count;
+	ltr_mode.mode = HFI_LTR_MODE_MANUAL;
+	ltr_mode.trust_mode = 1;
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_STRUCTURE,
+					     &ltr_mode, sizeof(ltr_mode));
+}
+
+int iris_set_use_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	struct vb2_queue *sq = v4l2_m2m_get_src_vq(inst->m2m_ctx);
+	struct vb2_queue *dq = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
+	u32 ltr_count = inst->fw_caps[LTR_COUNT].value;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	struct hfi_ltr_use ltr_use;
+
+	if (!vb2_is_streaming(sq) && !vb2_is_streaming(dq))
+		return -EINVAL;
+
+	if (!ltr_count)
+		return -EINVAL;
+
+	ltr_use.ref_ltr = inst->fw_caps[cap_id].value;
+	ltr_use.use_constrnt = true;
+	ltr_use.frames = 0;
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_STRUCTURE,
+					     &ltr_use, sizeof(ltr_use));
+}
+
+int iris_set_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	struct vb2_queue *sq = v4l2_m2m_get_src_vq(inst->m2m_ctx);
+	struct vb2_queue *dq = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
+	u32 ltr_count = inst->fw_caps[LTR_COUNT].value;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	struct hfi_ltr_mark ltr_mark;
+
+	if (!vb2_is_streaming(sq) && !vb2_is_streaming(dq))
+		return -EINVAL;
+
+	if (!ltr_count)
+		return -EINVAL;
+
+	ltr_mark.mark_frame = inst->fw_caps[cap_id].value;
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_STRUCTURE,
+					     &ltr_mark, sizeof(ltr_mark));
+}
+
+int iris_set_ltr_count_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	u32 ltr_count = inst->fw_caps[cap_id].value;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+
+	if (!ltr_count)
+		return -EINVAL;
+
+	if (inst->hfi_rc_type == HFI_RC_CBR_VFR ||
+	    inst->hfi_rc_type == HFI_RC_CBR_CFR ||
+	    inst->hfi_rc_type == HFI_RC_OFF) {
+		inst->fw_caps[LTR_COUNT].value = 0;
+		return -EINVAL;
+	}
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_U32,
+					     &ltr_count, sizeof(u32));
+}
+
+int iris_set_use_and_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	struct vb2_queue *sq = v4l2_m2m_get_src_vq(inst->m2m_ctx);
+	struct vb2_queue *dq = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
+	u32 ltr_count = inst->fw_caps[LTR_COUNT].value;
+	u32 hfi_val = inst->fw_caps[cap_id].value;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+
+	if (!vb2_is_streaming(sq) && !vb2_is_streaming(dq))
+		return -EINVAL;
+
+	if (!ltr_count || hfi_val == INVALID_DEFAULT_MARK_OR_USE_LTR)
+		return -EINVAL;
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_U32,
+					     &hfi_val, sizeof(u32));
+}
+
 int iris_set_properties(struct iris_inst *inst, u32 plane)
 {
 	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
index a0d5338bdc910bd30407132e8b700c333ad74e4c..996c83fdc6f492dc252771129fc1d62e8b7a7e07 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.h
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
@@ -36,6 +36,11 @@ int iris_set_rotation(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
 int iris_set_flip(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_ir_period_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_ir_period_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_ltr_count_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_ltr_count_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_use_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_use_and_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_properties(struct iris_inst *inst, u32 plane);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 4d9632ba86bc8f629cee6d726eb44efcdeba2475..139e7a9321d30d3e348671f99b0fa81afed4827e 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -693,6 +693,31 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		packet->shdr.hdr.size += sizeof(u32) + sizeof(*intra_refresh);
 		break;
 	}
+	case HFI_PROPERTY_PARAM_VENC_LTRMODE: {
+		struct hfi_ltr_mode *in = pdata, *ltr_mode = prop_data;
+
+		ltr_mode->mode = in->mode;
+		ltr_mode->count = in->count;
+		ltr_mode->trust_mode = in->trust_mode;
+		packet->shdr.hdr.size += sizeof(u32) + sizeof(*ltr_mode);
+		break;
+	}
+	case HFI_PROPERTY_CONFIG_VENC_USELTRFRAME: {
+		struct hfi_ltr_use *in = pdata, *ltr_use = prop_data;
+
+		ltr_use->frames = in->frames;
+		ltr_use->ref_ltr = in->ref_ltr;
+		ltr_use->use_constrnt = in->use_constrnt;
+		packet->shdr.hdr.size += sizeof(u32) + sizeof(*ltr_use);
+		break;
+	}
+	case HFI_PROPERTY_CONFIG_VENC_MARKLTRFRAME: {
+		struct hfi_ltr_mark *in = pdata, *ltr_mark = prop_data;
+
+		ltr_mark->mark_frame = in->mark_frame;
+		packet->shdr.hdr.size += sizeof(u32) + sizeof(*ltr_mark);
+		break;
+	}
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index 04c79ee0463d7f32a2042044fe4564718cc01561..34249fc0d047918c2463517b8303e30df3666b97 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -147,8 +147,16 @@
 #define HFI_INTRA_REFRESH_RANDOM		0x5
 
 #define HFI_PROPERTY_PARAM_VENC_INTRA_REFRESH			0x200500d
+
+#define HFI_LTR_MODE_DISABLE			0x0
+#define HFI_LTR_MODE_MANUAL			0x1
+#define HFI_LTR_MODE_PERIODIC			0x2
+
+#define HFI_PROPERTY_PARAM_VENC_LTRMODE				0x200501c
 #define HFI_PROPERTY_PARAM_VENC_MAX_NUM_B_FRAMES		0x2005020
 #define HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE			0x2006001
+#define HFI_PROPERTY_CONFIG_VENC_MARKLTRFRAME			0x2006009
+#define HFI_PROPERTY_CONFIG_VENC_USELTRFRAME			0x200600a
 #define HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER	0x2006008
 
 struct hfi_pkt_hdr {
@@ -460,6 +468,22 @@ struct hfi_intra_refresh {
 	u32 mbs;
 };
 
+struct hfi_ltr_mode {
+	u32 mode;
+	u32 count;
+	u32 trust_mode;
+};
+
+struct hfi_ltr_use {
+	u32 ref_ltr;
+	u32 use_constrnt;
+	u32 frames;
+};
+
+struct hfi_ltr_mark {
+	u32 mark_frame;
+};
+
 struct hfi_event_data {
 	u32 error;
 	u32 height;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index f6a214a6815420f299be70f80732943d02168f0c..2b8c87c25a066ead30bb1b134bdc3fe1e84e8f05 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -71,6 +71,9 @@ enum hfi_rate_control {
 #define HFI_PROP_MIN_QP_PACKED			0x0300012f
 #define HFI_PROP_MAX_QP_PACKED			0x03000130
 #define HFI_PROP_IR_RANDOM_PERIOD		0x03000131
+#define HFI_PROP_LTR_COUNT			0x03000134
+#define HFI_PROP_LTR_MARK			0x03000135
+#define HFI_PROP_LTR_USE			0x03000136
 #define HFI_PROP_TOTAL_BITRATE			0x0300013b
 #define HFI_PROP_MAX_GOP_FRAMES			0x03000146
 #define HFI_PROP_MAX_B_FRAMES			0x03000147
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index dd0a4210a2647ff4dadf8d67b71c6f4a22deb548..c48dfb6d47734fadd4f2e4123c93560f55355b86 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -29,6 +29,9 @@ struct iris_inst;
 #define MAX_QP_HEVC				63
 #define DEFAULT_QP				20
 #define BITRATE_DEFAULT			20000000
+#define INVALID_DEFAULT_MARK_OR_USE_LTR		-1
+#define MAX_LTR_FRAME_COUNT_GEN1		4
+#define MAX_LTR_FRAME_COUNT_GEN2		2
 
 enum stage_type {
 	STAGE_1 = 1,
@@ -148,6 +151,9 @@ enum platform_inst_fw_cap_type {
 	VFLIP,
 	IR_TYPE,
 	IR_PERIOD,
+	LTR_COUNT,
+	USE_LTR,
+	MARK_LTR,
 	INST_FW_CAP_MAX,
 };
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index e7645bd60eb46785e0110a34f3257f7c37bbfca5..13cee5f72a443b85136d30b41b589aeb0db8eb9a 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -249,6 +249,36 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 		.flags = CAP_FLAG_OUTPUT_PORT,
 		.set = iris_set_ir_period_gen1,
 	},
+	{
+		.cap_id = LTR_COUNT,
+		.min = 0,
+		.max = MAX_LTR_FRAME_COUNT_GEN1,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROPERTY_PARAM_VENC_LTRMODE,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_ltr_count_gen1,
+	},
+	{
+		.cap_id = USE_LTR,
+		.min = 0,
+		.max = ((1 << MAX_LTR_FRAME_COUNT_GEN1) - 1),
+		.step_or_mask = 0,
+		.value = 0,
+		.hfi_id = HFI_PROPERTY_CONFIG_VENC_USELTRFRAME,
+		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_use_ltr,
+	},
+	{
+		.cap_id = MARK_LTR,
+		.min = 0,
+		.max = (MAX_LTR_FRAME_COUNT_GEN1 - 1),
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROPERTY_CONFIG_VENC_MARKLTRFRAME,
+		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_mark_ltr,
+	},
 };
 
 static struct platform_inst_caps platform_inst_cap_sm8250 = {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 585f0aedc0eb5e80fd108929e1861101a7bab2be..99d8e1e59e6bfd5e4ab0fd2b5831f74c54b6e87d 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -637,6 +637,36 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 			CAP_FLAG_DYNAMIC_ALLOWED,
 		.set = iris_set_ir_period_gen2,
 	},
+	{
+		.cap_id = LTR_COUNT,
+		.min = 0,
+		.max = MAX_LTR_FRAME_COUNT_GEN2,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROP_LTR_COUNT,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_ltr_count_gen2,
+	},
+	{
+		.cap_id = USE_LTR,
+		.min = 0,
+		.max = ((1 << MAX_LTR_FRAME_COUNT_GEN2) - 1),
+		.step_or_mask = 0,
+		.value = 0,
+		.hfi_id = HFI_PROP_LTR_USE,
+		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_use_and_mark_ltr,
+	},
+	{
+		.cap_id = MARK_LTR,
+		.min = INVALID_DEFAULT_MARK_OR_USE_LTR,
+		.max = (MAX_LTR_FRAME_COUNT_GEN2 - 1),
+		.step_or_mask = 1,
+		.value = INVALID_DEFAULT_MARK_OR_USE_LTR,
+		.hfi_id = HFI_PROP_LTR_MARK,
+		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_use_and_mark_ltr,
+	},
 };
 
 static struct platform_inst_caps platform_inst_cap_sm8550 = {
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index 1e54ace966c74956208d88f06837b97b1fd48e17..b7413edfbc5646fbdee6139d1e6897d730e2c8d1 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -668,6 +668,19 @@ static u32 iris_vpu_enc_bin_size(struct iris_inst *inst)
 				  num_vpp_pipes, inst->hfi_rc_type);
 }
 
+static inline u32 hfi_buffer_get_recon_count(struct iris_inst *inst)
+{
+	u32 num_ref = 1;
+	u32 ltr_count;
+
+	ltr_count = inst->fw_caps[LTR_COUNT].value;
+
+	if (ltr_count)
+		num_ref = num_ref + ltr_count;
+
+	return num_ref;
+}
+
 static inline
 u32 hfi_buffer_comv_enc(u32 frame_width, u32 frame_height, u32 lcu_size,
 			u32 num_recon, u32 standard)
@@ -693,7 +706,7 @@ static u32 iris_vpu_enc_comv_size(struct iris_inst *inst)
 {
 	u32 height = iris_vpu_enc_get_bitstream_height(inst);
 	u32 width = iris_vpu_enc_get_bitstream_width(inst);
-	u32 num_recon = 1;
+	u32 num_recon = hfi_buffer_get_recon_count(inst);
 	u32 lcu_size = 16;
 
 	if (inst->codec == V4L2_PIX_FMT_HEVC) {
@@ -1402,10 +1415,9 @@ static u32 iris_vpu_enc_scratch2_size(struct iris_inst *inst)
 {
 	u32 frame_height = iris_vpu_enc_get_bitstream_height(inst);
 	u32 frame_width = iris_vpu_enc_get_bitstream_width(inst);
-	u32 num_ref = 1;
+	u32 num_ref = hfi_buffer_get_recon_count(inst);
 
-	return hfi_buffer_scratch2_enc(frame_width, frame_height, num_ref,
-				       false);
+	return hfi_buffer_scratch2_enc(frame_width, frame_height, num_ref, false);
 }
 
 static u32 iris_vpu_enc_vpss_size(struct iris_inst *inst)

-- 
2.43.0


