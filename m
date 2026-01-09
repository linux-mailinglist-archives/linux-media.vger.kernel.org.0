Return-Path: <linux-media+bounces-50267-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0130ED07A17
	for <lists+linux-media@lfdr.de>; Fri, 09 Jan 2026 08:44:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2B7C3301BE9B
	for <lists+linux-media@lfdr.de>; Fri,  9 Jan 2026 07:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11B122C0F8C;
	Fri,  9 Jan 2026 07:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YhCaykfL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QWr6lBQU"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEAF82F3C0E
	for <linux-media@vger.kernel.org>; Fri,  9 Jan 2026 07:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767944581; cv=none; b=r/bRqJ1DtJ8Co4y7vWjeiwjEblP4kkCQL7fCPRHFy+YtvOfejuvzc0W25eqYfHJWDfiTwl8LIAQLiXK004Pkz79h2GrhA7aMUH9P/L119r92KlQ3jCdymd5bzhdXAzJ1+t5rvnq9NH9yjjiYPWPEyt+H1HnjsJ1+YQlXXULcEQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767944581; c=relaxed/simple;
	bh=eNf92h2XycwAqn6GgXBwodbBeaSwsDpdlIqrITfFu+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F0uskNJ/b0E/hImYl2tPGVKe1dUAbFxCREa/feMBTCwkLMHA4gt2Qm0Sk87IT50tQGzaqJjXbkv7VTzpywP7VEz5Sj8ghO8OmkfMvzJnbr6+anck1Dw60V7vrhwzP5ahyKYwOPv6llzo7ErHZisE/LO3F6p/0omy8b6edHNhs44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YhCaykfL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QWr6lBQU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608MoqaI3218559
	for <linux-media@vger.kernel.org>; Fri, 9 Jan 2026 07:42:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	07STIKTT7SiIjROtHnGY3zH2taK5h9biXLrShaG+TgU=; b=YhCaykfLQ5e7RHeY
	jKvEyt1kvlZTGOJucd32yAIPG0OviFXRYX2FHHbzLyibPloa+6rIOWqB+1pAh+5w
	6pDcpll8Nz1ga2PQU6GCwXO5OFTHrFqom50OBphJZFiroe/QTfRtbI5Y2C9tYyYC
	Lg6ZqSbDXtzht2ygQFRL4SIfm2Z6PPjMk9MT45cUTYTePfcN5ZnFg4po7GYzCUIi
	vvztB1YaWMMxIc+Fx1GLmICrp82lvc4iHHAyFSnB7Xrtneyz1b34bsZzfJb7vsQ4
	iiA34RvgsSOBwq2B/RQrmDICtMonk6wOTKRBW4k8EbG+EAokfNjX6gHX/LKKOBKq
	U39E/g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjjt0hn6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 09 Jan 2026 07:42:58 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29f1f79d6afso57879865ad.0
        for <linux-media@vger.kernel.org>; Thu, 08 Jan 2026 23:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767944578; x=1768549378; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=07STIKTT7SiIjROtHnGY3zH2taK5h9biXLrShaG+TgU=;
        b=QWr6lBQUkjy0Ll6joiA9FETMswMo3bYeQ2zpCNbZ5w99O0zMDL8dMKKYLPW3mljGTN
         vBbeLDwHrVe812A/1qChpmQ/LdYv5tu700b8hIFx/QCZ/ISxQ6kvjOd25656pwHxf3OF
         K9pvr5ha/v08DmLqSxtRvAWkhfo7vjErFDpYeWYDrRxNyUnD5ZhqgKG/zqlEClF44ixL
         qTiRq3c1031tIhYQ7So4u/tGMFQd02DSOt9qN58D1HeD+CAgMDdd6w+m3KW7bE0Vgkl8
         +rOS7mi1OBszYD+bM13syHYyPVfFvMTEkFszjfoOsRqCTVXp18BRa+1FLNBrQDlayW1r
         O7pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767944578; x=1768549378;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=07STIKTT7SiIjROtHnGY3zH2taK5h9biXLrShaG+TgU=;
        b=nO2jNbA4dmoVUb9xa5pnRVpiYEJXlCNfVDdy8p8RKo1lMG1yZtGfzmR+AeAAm3xz0d
         MesOfVrnJ8YhUpk2M/nwjInXENbO4OA3ynieSKgcYIqGeNSM6tMGi84ftzyYVw8hQN/9
         bxRSYwtGgFmGzEk4I3erTd1A5192Q6Ehw2h7oSzS8RRKV9vftYg9Ht86OZ5R3ZA7S9QW
         jxEexNeIFA4rRVKAB/gbhFpmJed1x5lfHvVTDU06D80b/97wpVQg+7pC31K2rPSIqml9
         amHi6uR+0zl0aE/qx40l/JVw6id4CX3jLVOVtOHLA2kW33Q4hr2cgl1UyxVPvD9WDWAw
         hgAA==
X-Forwarded-Encrypted: i=1; AJvYcCWaBEHrDJmojFRAJ3nOUS+9piKG3NbUxF27njkg5ia3uysI6vBJYwcvcZRN8D5tvBW5PU2Ul4wKIEcENA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3GmKSrE1zrualv4Rll1st4NrwC5qTZVoXylB612eluHvNGRrP
	lYHn8J3NR6ee28Ly9XpIDOBkAxG68myhD+Tu3Vfq0iwHgVd43maq4X1HwOwbBMlIK5TsOpyngB0
	ZlZ8aPOEgPh0t1RpeRfTlJleUUIlVldOQnhXmGuawT5wZEYZqagCb5cp8wztwd+gK6w==
X-Gm-Gg: AY/fxX5kKsos80M6ziqfkdOpCWDGDReO8sKTIbNIghGEuXWyhm/9StWlwa6+yHHsx+k
	PwXKmIzF9BR9nZXgUZEDB79ouI+bGxEu9QWqd62eUlxsV4MLi4QQtrQ9H0ITMK1VZmqcwsy/cRU
	f3k+4lvILouqGY/lveFf1/RzdHCG/00q+0+gjE7BPcH6UTWBcGoMgL/SQU0DF6YbT9rHJ4iUxVq
	Q0j+78ksOd/Pg7HNl6iWrS+PE0M2+kwzm1nDg8fYb4AspkF65DwrMsnMMQtPC6vFRKlSFCVMpy3
	ZsAV2V6fFjdn3y0fuETh9VJEM94sVtOHgOrSc1+Ub/GCajuqgFhrwykhTRw5OpSAW2f3vlSA/KT
	icJ3xHcZnrt+3y8Xmn6gbZJJWBdA585XgDGdX1F/1fnuQJRmq+qnkN7r5OL1hB6rSkdFPt0E9He
	VZDUWxsYSq
X-Received: by 2002:a17:903:247:b0:2a3:bf5f:926d with SMTP id d9443c01a7336-2a3ee443a50mr71564965ad.24.1767944577655;
        Thu, 08 Jan 2026 23:42:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEIWXnWTB1ETZgA5WBffjzF8zRgAs7p0APDQOqsopdFA2oc+ZeKmWwx6D6FVmIFXiZTxOnRqg==
X-Received: by 2002:a17:903:247:b0:2a3:bf5f:926d with SMTP id d9443c01a7336-2a3ee443a50mr71564775ad.24.1767944577150;
        Thu, 08 Jan 2026 23:42:57 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd46a9sm98638195ad.93.2026.01.08.23.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 23:42:56 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Fri, 09 Jan 2026 15:42:32 +0800
Subject: [PATCH v3 3/6] media: qcom: iris: Add B frames support for encoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-batch2_iris_encoder_enhancements-v3-3-196855ef32ba@oss.qualcomm.com>
References: <20260109-batch2_iris_encoder_enhancements-v3-0-196855ef32ba@oss.qualcomm.com>
In-Reply-To: <20260109-batch2_iris_encoder_enhancements-v3-0-196855ef32ba@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767944563; l=8694;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=eNf92h2XycwAqn6GgXBwodbBeaSwsDpdlIqrITfFu+M=;
 b=KsMTs5dCukBXPCu4bXDGIgsLHJHC3ejWvQwo2KtMSqJbvl57ySwTSFE2IlNQpgGTlTaY64iIP
 2OKkF4GDuGeBsEXz9QRl6FTNvZmoeh348ZS1lyLxJYxKBwfSiTSfv/h
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: G1zRgyPJZKjQ8x2wFmp-i0gKimOIVEH3
X-Authority-Analysis: v=2.4 cv=VJzQXtPX c=1 sm=1 tr=0 ts=6960b182 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=pbVt0xer8RvNRR6Ob3QA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: G1zRgyPJZKjQ8x2wFmp-i0gKimOIVEH3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA1MyBTYWx0ZWRfX908zEtfYAWRH
 w2f2usydZLXrMTITOAjbuy7cgd+J/g6+QbwzJWABcIt+6e8yjR79SSE9g0i3wYBliGj3XlDszc5
 yh5oXAHnCUZS9zsLGV89WwBUpDGVH5xb0q/wVINH+hB9tzioVxu3BR26EixHVUHF6gKeuPmJOyR
 ZDfqRutdvh0xTOXRr6DoOgpy9t2H5xWxQVdJF2bfQXiBNvO9pvOIS2sV7t6bnd2hF7fi5vpjwzf
 zenGO3kWVIqXxC9IoaV7rG52tpVPoys8stwNhMnXL+PXaO403rNqCX8hjqqhh7EIqc5zBWz2E39
 f54JUcTn0ivFnAYYgxDBsHjGnucz0UhugaZaJz922BfPjjdpUHE+mcWp0mFheqndLPXwKlLmXE8
 lM8DGNMbbZpiiwH71sYUznd5Hvbp49K+0hQ2MheNjWWcvNUhMYhr8nT78YBFMnO5vxXlb8SV7ft
 nezIIqiPvoUXNTcsrTw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090053

Add support for B-frame configuration on both gen1 and gen2 encoders by
enabling V4L2_CID_MPEG_VIDEO_B_FRAMES control.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 30 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  8 ++++++
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     | 10 ++++++++
 .../platform/qcom/iris/iris_platform_common.h      |  2 ++
 .../media/platform/qcom/iris/iris_platform_gen1.c  | 18 +++++++++++++
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 10 ++++++++
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  6 ++++-
 8 files changed, 84 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 428203af725ab5697ee42b5adf9557c65fafd7f4..02106a4c47db7a8b2e6461acb9d24a22291ff3cb 100644
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
@@ -1153,6 +1157,32 @@ int iris_set_use_and_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_
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
+	/*
+	 * intra_period represents the length of a GOP, which includes both P-frames
+	 * and B-frames. The counts of P-frames and B-frames within a GOP must be
+	 * communicated to the firmware.
+	 */
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
index 34249fc0d047918c2463517b8303e30df3666b97..4343661e86065f5623b2c02c7ee808a3c47a8c41 100644
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
@@ -484,6 +485,15 @@ struct hfi_ltr_mark {
 	u32 mark_frame;
 };
 
+struct hfi_max_num_b_frames {
+	u32 max_num_b_frames;
+};
+
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
index 6650414fd8b7f127062e95f29203a55b33a43fa2..14bb72c223dd86a0bd22d863df73159169871031 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -279,6 +279,24 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
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
index b7413edfbc5646fbdee6139d1e6897d730e2c8d1..b5fb616916e5c7bf46998fc14510af9c9341cf10 100644
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


