Return-Path: <linux-media+bounces-47799-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A1223C8D2B0
	for <lists+linux-media@lfdr.de>; Thu, 27 Nov 2025 08:46:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8B0474E44BB
	for <lists+linux-media@lfdr.de>; Thu, 27 Nov 2025 07:46:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B0143242C0;
	Thu, 27 Nov 2025 07:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zk/hDTYY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KWiff5i9"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8446D321428
	for <linux-media@vger.kernel.org>; Thu, 27 Nov 2025 07:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764229514; cv=none; b=NFVkm2enW6GLgknc3QycUIg4WiiVkKt7IBA1re7V11R3P0CcdUAcmUSfl1nF2iLEzIjePFrHJFHVwY1SkNwuGRM+jnHiDviaqevUK1TFODgjY3c8pq1K3JmAjqvG9AytDMAqhm69GYualuVPsXGRBydpAcAV48KrRzknhXHP6ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764229514; c=relaxed/simple;
	bh=9PlAnVbnB0FRVWymm3NRer0xZIhQsVSzh7o3970J+kY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MV+XzE9gbZozoJTF+XCdf8abTgmtE+BH0NRgUQ4cHLF/bEKvDdlO/77wEUorZGcc58jWBfWW6+XQkiX9jUpSgMKkrIg15y6NldEL5Novgc9fPw4Qd3/HTn2ovanwVkA+WUAFXwMJMIpK02M3BFjoa0gxyHFpnfIfGO5Sn8GY/Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zk/hDTYY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KWiff5i9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AR2sxdO2356502
	for <linux-media@vger.kernel.org>; Thu, 27 Nov 2025 07:45:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kXWXhGufk2riZfRA8YuYnxjvaww7lkwIvZNf/BooBxA=; b=Zk/hDTYYLKW4SZGC
	nE6BR5o2np4l6tijV9A0ydNUsk8WIID9rF0wKu1FN2cnT38sFObM3AsVdF6ow2Nh
	KceMVcmR/3Dik++BVaFzthISjlc/I3GBL63/vb+lFiWkRrt5933tGcuVj7HTY+9F
	WHFxR3Yo5koa5bE90Mx5jwd4lf7cXrkIDe/eEEQWHFbrIKjNlJaKllMnVddtGA/1
	4Xg7xSuROK3Wct4FRBz7glrA0lDAJTB+WyK4YwOhwFrEnbQTlIYGPbUM4r0SnNPF
	RcuvXqGOyUa6Bg7WPHX+8bDFAmYsRctGuC08EQOvnn3c5+PlOaJx6F/ip645Dmd/
	PAMm2g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap3d1jg3y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 27 Nov 2025 07:45:11 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-343e262230eso673458a91.2
        for <linux-media@vger.kernel.org>; Wed, 26 Nov 2025 23:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764229510; x=1764834310; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kXWXhGufk2riZfRA8YuYnxjvaww7lkwIvZNf/BooBxA=;
        b=KWiff5i9+1LGyyUsnARfSX2AOVhEFgZ30Cp3i7vKInrileXr4RQyD3q0f0s2imqaXp
         MRo/q5cJQD0lb3kUCnEaaO9QqFJee0RXrEz0tw1VLeBMtWu8bD4fAjH7vnn/6QuBGXEI
         TaiS5Pn/b0saqMVZbHod8oubx9NgsaPCqX/f8ZVNxocjtLezA+N0g23ah9O2+79GHbLg
         gL+0g1IW+/Fxa6qQJpIZk90rrafPL7CRT5MdVdFuL/0LDGXmRUM8uMc24bvz7n1jZIBs
         NgcbqJARYMdMoYaBfAFe4ONlDh4lrGvUOynJIgWWAxzLxZLah2gDbyJdbjiWuHgmJD6g
         YV6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764229510; x=1764834310;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kXWXhGufk2riZfRA8YuYnxjvaww7lkwIvZNf/BooBxA=;
        b=Zd2rrVugKjyKeTWWV8o7kjY6H4+frcZk2HgDwiE+5Yt7V2qbY+gbBE/b0KLNCpymCh
         ZQzRXMln/uRrkRnlIRRYtzShQNYO3Z6RhgHQiWeq+iLIGaugkTB4MJmKwRrdBOuEPwHl
         SRzmW0k12VZeSYE4F87p5B6xQXbRaR1vpdZVTOK06AY4nuXf1zFjFVDf07tHJuwv+p8M
         q+jr0olf5kMoYaftRWDLXNqLJkOxdfiXhFdtkhB20T1fCqk972kHeDUVYXo8eCsR5NgT
         vaoMRfRnfkcZY6e2Hu0GVfw3vINg9f3FXY6JFHvD6Jt193f8ZJ9BFI8rxm1lbn8b3xAE
         1RBg==
X-Forwarded-Encrypted: i=1; AJvYcCUJcMfb5b+AifjwXuOHiVjgr0NoTL3qH8cJK+qoC70YnaMtg0DAoAb+d286NtEEWn9Jcb3f8+cwCDPb1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhHTEacWtTQ5TWY/cpMwS+tg81mmKXCVyWK+cFajzwo9+PwIsh
	vOl9YmCxg9iCy6VxkLkhHpeXqTZS/gMx2o5ohgRUjpVHprIekkq2RksTY4JMq0up2M/yshzPisg
	t/0m4xbS/ubvGHzDy9L7jaYEB0aFhOUjY/CA6l87nfn6Ii/PI9uJBeudOw4+C5b8ECw==
X-Gm-Gg: ASbGncvUiiiCPgYskQzrkIfUYg0j3ngIX2I88YtjfLW3U9saApMsKlHqkUT6jYKSAQe
	O8aUTPswr3BwjEaqNjYv48YxyKHDXP7Lp+cvYqp2xkbrIdZ0MqJkvR6se7GFMrOLMjabunGLN61
	Tvmkp+pU8BzxoYbgPvfLcl3DYMP6EdqUew304aMknHgxBbg8/yn4OAF56x8HL/2TwYbRKtgV13g
	ByPyhMiuYv7O5m2fnfwMp+jAiIkZzNw/7ljEtHBSuLQGPwxH8MH1q4AKks/ciA8hTbkyDdjl4Of
	IOuF8frlkIkbydm8dmlREsD3pP1xH8L5LH25Rzgi0LDzeNk8Z9Esc+TXiiljhoSO2vBfF8SoHla
	tedORjM4aSO1TRWdmRem7i4HwoeqE5JIKWfIb2lXxWGWZqHftuEqposhCOCFeus5JBF0SDFUAl/
	4a4aC1G/w42I/G
X-Received: by 2002:a17:90b:4c4f:b0:343:edb0:1012 with SMTP id 98e67ed59e1d1-3475ed508e8mr8974365a91.21.1764229510259;
        Wed, 26 Nov 2025 23:45:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE+Gs+fCJrQ0EAcFD+xI5uV5xHix7BzP9/Rih7w4y+eA6/M+NU0phq8Xw/jhFftAyNdVP2OfA==
X-Received: by 2002:a17:90b:4c4f:b0:343:edb0:1012 with SMTP id 98e67ed59e1d1-3475ed508e8mr8974326a91.21.1764229509692;
        Wed, 26 Nov 2025 23:45:09 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15f080beasm908717b3a.47.2025.11.26.23.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 23:45:09 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 15:44:34 +0800
Subject: [PATCH 3/4] media: qcom: iris: Add B frames support for encoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251127-batch2_iris_encoder_enhancements-v1-3-5ea78e2de2ae@oss.qualcomm.com>
References: <20251127-batch2_iris_encoder_enhancements-v1-0-5ea78e2de2ae@oss.qualcomm.com>
In-Reply-To: <20251127-batch2_iris_encoder_enhancements-v1-0-5ea78e2de2ae@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764229495; l=8868;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=9PlAnVbnB0FRVWymm3NRer0xZIhQsVSzh7o3970J+kY=;
 b=D9kZuB7k8xk+s+NhDwZGIsA8aWK9mC9a+Jy0MNuC9A2ZQxL3q7pcJCr/CUQJdiT5sL4ylhOVQ
 ZGRuhpHO4OwA9sqWmkF3ltCnUuZoSLGxqx10QWss/rddW79CAFM6XG0
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: heAvC8GSfz7du_MCd7B6cAQhPtDgVFZn
X-Authority-Analysis: v=2.4 cv=MIVtWcZl c=1 sm=1 tr=0 ts=69280187 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=l7a9cip_DlGZr9eDmkIA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: heAvC8GSfz7du_MCd7B6cAQhPtDgVFZn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDA1NCBTYWx0ZWRfX2W/hqsgBUiqG
 rhDEYVeSB3WovqfDaKSjjDU+7li9nfKHmkY7GQujchXikU7/BGSsNL7eLinE/XS50q0NYsxdNLz
 nlYgdWBFBfZdFSDggNz4Q+98y7/NH0E5IKiSPdUv1aonz0zuvjEfNG5J8bQWsr2jD0WUkbuleur
 +9gqTScRKMxuTYjcZCKYuf8N8ow2Xu0d2ZsgMk8Od09o0UjFE3v/+37JaNb8rPRFDJ4LaswFaXT
 VN5jLFas8S2fMLjGY3d5bwNyULc4YUi1KncEPz26xHHF6Sfl7mDl8Y4oui4g7UuiBMQSzPLj9tw
 OT8dn8IbJvJYmH3+aqov6qcV6ilfkcppnrTNru4wpiA73yUokhJ9y7U4xNWeNM8eyf91fQ8fdS9
 Njspz6JJx1U8qOt50KM5LiObaY8XSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511270054

Add support for B-frame configuration on both gen1 and gen2 encoders by
enabling V4L2_CID_MPEG_VIDEO_B_FRAMES control.

Key changes:
Added capability IDs for B-frame and intra period.
Implemented handler for GOP structure with B-frames.
Defined HFI property and structure for gen1.
Updated platform tables and buffer logic for gen2.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 25 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  8 +++++++
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  6 ++++++
 .../platform/qcom/iris/iris_platform_common.h      |  2 ++
 .../media/platform/qcom/iris/iris_platform_gen1.c  | 19 +++++++++++++++-
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 10 +++++++++
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  6 +++++-
 8 files changed, 75 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 33e104142a5bb51c952550fa45e81b3bdc723ac2..9aec8a2006e9f8e545d05e40cb68ef0ae8502f79 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -114,6 +114,8 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
 		return USE_LTR;
 	case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:
 		return MARK_LTR;
+	case V4L2_CID_MPEG_VIDEO_B_FRAMES:
+		return B_FRAME;
 	default:
 		return INST_FW_CAP_MAX;
 	}
@@ -217,6 +219,8 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 		return V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES;
 	case MARK_LTR:
 		return V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX;
+	case B_FRAME:
+		return V4L2_CID_MPEG_VIDEO_B_FRAMES;
 	default:
 		return 0;
 	}
@@ -1148,6 +1152,27 @@ int iris_set_use_and_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_
 					     &hfi_val, sizeof(u32));
 }
 
+int iris_set_intra_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	u32 gop_size = inst->fw_caps[GOP_SIZE].value;
+	u32 b_frame = inst->fw_caps[B_FRAME].value;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	struct hfi_intra_period intra_period;
+
+	if (!gop_size || b_frame >= gop_size)
+		return -EINVAL;
+
+	intra_period.pframes = (gop_size - 1) / (b_frame + 1);
+	intra_period.bframes = b_frame;
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_STRUCTURE,
+					     &intra_period, sizeof(intra_period));
+}
+
 int iris_set_properties(struct iris_inst *inst, u32 plane)
 {
 	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
index 996c83fdc6f492dc252771129fc1d62e8b7a7e07..609258c81517b71523b682ca994786cdd020b07f 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.h
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
@@ -41,6 +41,7 @@ int iris_set_ltr_count_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_ty
 int iris_set_use_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_use_and_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_intra_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_properties(struct iris_inst *inst, u32 plane);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 139e7a9321d30d3e348671f99b0fa81afed4827e..fe51eccb903be146e83a4fb2faf4b4092875dea4 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -718,6 +718,14 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		packet->shdr.hdr.size += sizeof(u32) + sizeof(*ltr_mark);
 		break;
 	}
+	case HFI_PROPERTY_CONFIG_VENC_INTRA_PERIOD: {
+		struct hfi_intra_period *in = pdata, *intra_period = prop_data;
+
+		intra_period->pframes = in->pframes;
+		intra_period->bframes = in->bframes;
+		packet->shdr.hdr.size += sizeof(u32) + sizeof(*intra_period);
+		break;
+	}
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index 34249fc0d047918c2463517b8303e30df3666b97..476177add1ec860d46d85960dd09617ad347f60a 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -155,6 +155,7 @@
 #define HFI_PROPERTY_PARAM_VENC_LTRMODE				0x200501c
 #define HFI_PROPERTY_PARAM_VENC_MAX_NUM_B_FRAMES		0x2005020
 #define HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE			0x2006001
+#define HFI_PROPERTY_CONFIG_VENC_INTRA_PERIOD			0x2006003
 #define HFI_PROPERTY_CONFIG_VENC_MARKLTRFRAME			0x2006009
 #define HFI_PROPERTY_CONFIG_VENC_USELTRFRAME			0x200600a
 #define HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER	0x2006008
@@ -484,6 +485,11 @@ struct hfi_ltr_mark {
 	u32 mark_frame;
 };
 
+struct hfi_intra_period {
+	u32 pframes;
+	u32 bframes;
+};
+
 struct hfi_event_data {
 	u32 error;
 	u32 height;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index c48dfb6d47734fadd4f2e4123c93560f55355b86..34deb32eb5be0899fee779ff99b3f4b8bd91529f 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -154,6 +154,8 @@ enum platform_inst_fw_cap_type {
 	LTR_COUNT,
 	USE_LTR,
 	MARK_LTR,
+	B_FRAME,
+	INTRA_PERIOD,
 	INST_FW_CAP_MAX,
 };
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index 13cee5f72a443b85136d30b41b589aeb0db8eb9a..b76f0ecaa721f3469bc63b7ff4ce5fc6ea19a8e1 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -177,7 +177,6 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 		.max = (1 << 16) - 1,
 		.step_or_mask = 1,
 		.value = 30,
-		.set = iris_set_u32
 	},
 	{
 		.cap_id = ENTROPY_MODE,
@@ -279,6 +278,24 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
 		.set = iris_set_mark_ltr,
 	},
+	{
+		.cap_id = B_FRAME,
+		.min = 0,
+		.max = 3,
+		.step_or_mask = 1,
+		.value = 0,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+	},
+	{
+		.cap_id = INTRA_PERIOD,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROPERTY_CONFIG_VENC_INTRA_PERIOD,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_intra_period,
+	},
 };
 
 static struct platform_inst_caps platform_inst_cap_sm8250 = {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 6ae34312f50d4a3709ca20b3aadcfee12338a2f7..7c9a71755685d195a7adc8064523e1c33a572089 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -667,6 +667,16 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
 		.set = iris_set_use_and_mark_ltr,
 	},
+	{
+		.cap_id = B_FRAME,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROP_MAX_B_FRAMES,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_u32,
+	},
 };
 
 static struct platform_inst_caps platform_inst_cap_sm8550 = {
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index 8139fefe40fe179ff7862bbca879ce94c71c1f89..4a854a4dab322eabb16a52b1cf816c18d78acc81 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -670,11 +670,15 @@ static u32 iris_vpu_enc_bin_size(struct iris_inst *inst)
 
 static inline u32 hfi_buffer_get_recon_count(struct iris_inst *inst)
 {
+	u32 bframe_count, ltr_count;
 	u32 num_ref = 1;
-	u32 ltr_count;
 
+	bframe_count = inst->fw_caps[B_FRAME].value;
 	ltr_count = inst->fw_caps[LTR_COUNT].value;
 
+	if (bframe_count)
+		num_ref = 2;
+
 	if (ltr_count)
 		num_ref = num_ref + ltr_count;
 

-- 
2.43.0


