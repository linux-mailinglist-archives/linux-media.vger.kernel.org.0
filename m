Return-Path: <linux-media+bounces-50604-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD461D1B38D
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 21:34:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 12C3630674F6
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 20:33:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C1CA3128D2;
	Tue, 13 Jan 2026 20:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MUNZ7PwV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yoye1ESc"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A022BD586
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 20:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768336422; cv=none; b=Q9v2YgcQXkgGEewYDMtsW1hjmXM+d1Y5XbDrn9Z5lP7S2y5zjfSCILIk/oIiWoAwmAl3LSOlCO3JPig1uE2FmAkGmxStx03l9lg6VdnscKOG3YKOQ9SVFtX6qUleu1sHxeAyE/ZFCnCsrN87xkLdl1c2CFnOwfTPDGetkiKeqgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768336422; c=relaxed/simple;
	bh=rLg1XZm7+TLU/MssBuCqd65nuhBQ9YaSkzsjTYz4VIE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z42fq9ilHjxixrEhiil9xpmrXRW3srP9CXdkpJb4TQUyfmk87Hs56dm1Yz5VLw78xIpalcU9DYFKzlLyonzwOX89Zd0qJdpZahqx71Q70xiD9xiZA/GGlLxBrtwjGDlr4gC2HxAHIyWjhmecI+q49bbDm1uiH2D028lAII0TtQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MUNZ7PwV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yoye1ESc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DG5CEl1295008
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 20:33:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0moqou0Ld4EaZmHxxSS0TZm2GMndw0nUqSIpM/AN1jg=; b=MUNZ7PwVpbrothYH
	BUkjqNgYRmexrFjjH4+DAPX5KMElW8+sJYkYNGkK3VUiJr7eQJsvDDVi8nquCS6V
	GAZ4KQn4l7i/z6r0ZgaQxndlC5RHHYaK/NQ35wciKDMGy1PgbXpCOFgYeN78/R68
	SgbT9YuPID4ew+FW+lGA9Bgc1ByItWe+clVrTBKp/dvv4dPFNd84Q5WQBQWuxcoh
	c0kSEtdfLEs5csDBKZzdHdaGWh1sQI0/qXl7lcoGNQsgvlMfkLcf9PBCeVcjj6bQ
	sKfeJXZaZR9WMHpsxY71bsk86iCwdZJMBCuIPAtpd0INhG3p6Qoi9pfz+Xaxelxl
	wKoFjA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bns8v0v96-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 20:33:39 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-11f39b00db0so864631c88.3
        for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 12:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768336419; x=1768941219; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0moqou0Ld4EaZmHxxSS0TZm2GMndw0nUqSIpM/AN1jg=;
        b=Yoye1ESc61PHcEhxRBRawSUYy0tKFN+V7sPOst7e/xNjcxaa6Lca0dtPGgP4RncjkU
         Q29rQjDTyoq6HoeAgt+9xYw5zVDyAsJXLP+oisU+lJlRUcjfrhoLyI2idVdEAQkMVXXi
         ZQcMMIKZCO+LTvXN3Tt7VJgN1u0iki0mIMn8BpXTqJ6kjUm4OHzZNoVlxQwsyZEmdi/B
         tuEusYyPpQZj8Q00a/2RXjSSwVVl51djmk1Shs8tGtTQP4LAyl+EshQuZTH6LhG2lF8y
         pDGmMEgKVCGdOM/03ZmUe+828/PUo7bugNSN/3krdfwD4XUUTB2llSKasxfMBtycV3Mz
         X9Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768336419; x=1768941219;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0moqou0Ld4EaZmHxxSS0TZm2GMndw0nUqSIpM/AN1jg=;
        b=SwT0L7OuY3zneY7SdHOTfxlNxq/nNh5aCXNi1jHMR2hEe+mqj6m3Vz/3EiGDGFiCEG
         moWT1SlNcZ7zQ1k8AowD0R/Xjjcyyu/rMiX1fzctgO1EmJz59aE+4oc0QfSnM4+t3PRm
         ArJmpJnQsDSLi7bZ+yxRYYeohi4rIGFKg4FHeeeE79/0wOnfR0rNHRmByLpdei4CUlFZ
         EOXOy46pmofzQbDRz5U2+v5Gc0ZKeN6izGul/A5lgE7/WBtn5n4UBbVo1q1BCup8FiXr
         LNTSn7RwK5RSQ4NIpqp2AVGDEH9tkiDdeY5e4h/I3ddoY/E8mkfMPqzL0qKPUfRvxmGv
         vJNw==
X-Gm-Message-State: AOJu0YzIT+swmefcOOp9lZD+MZ3GPJrlnGuEyKYfclE51S38PXpZPUPz
	ae+2QPv9xaPQy79Lu+kNq5/JkuKEuHERgy0BKFBi5BGmZKhbGQo3L0udDIzmWerh0pQBcLN1zrf
	L2CFjkd9ojogA8ph8eVvONo6t2c2Dtf8rEd9NXPJI5kx4RAKUpgDL0Xkrr8BWJjznNg==
X-Gm-Gg: AY/fxX40PTTpLagYaKLluajFGUpEZwqud9e6nGrXaLr+WVJ6zMqCGKgONW7dPbQA/Ho
	9E0l6o+8QkyjJ+Nl3zIXqO0kIq38oMKSroO4eqQThQABJI6pYlZYL/IMywJ6gSmaKqoydV7H5/G
	4Of8jPE86vRI12V3/1sPoyvNt0mluco1UtdYWMwZp91rSU7YXOnU8EeNs/Pa4OoV80o9oAOwWm1
	DHOJmeC3HQ10eS6MoTS6RnUTru1ShOUlPD+0ugh2DGVqhnDOogsRbWskrk+7YrU5asHNjPF8gqI
	PdDPbouwz84jmBRCfKJYHy1R2g/trd0ZDfgLOxi8n6ZYy1uEVlKWbjQYkJxovrwXXsLIQwaB1ac
	t96AVEko0Z9TW80kI89vk/q2R/dm9DWhat/VH0ZCA7fkfPDvr0nwswJiBJ5IlF3Z82oa27Q==
X-Received: by 2002:a05:7300:7304:b0:2ae:593b:2163 with SMTP id 5a478bee46e88-2b4870bf0dfmr137003eec.4.1768336418565;
        Tue, 13 Jan 2026 12:33:38 -0800 (PST)
X-Received: by 2002:a05:7300:7304:b0:2ae:593b:2163 with SMTP id 5a478bee46e88-2b4870bf0dfmr136981eec.4.1768336417978;
        Tue, 13 Jan 2026 12:33:37 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b170673bc0sm19157897eec.5.2026.01.13.12.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 12:33:37 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 12:33:33 -0800
Subject: [RFC PATCH 2/3] media: v4l2-core: Add support for video encoder
 ROI control
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-iris_enc_roi-v1-2-6c86eba38587@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768336416; l=3289;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=rLg1XZm7+TLU/MssBuCqd65nuhBQ9YaSkzsjTYz4VIE=;
 b=Sr4x6zEVPNeL1g0JOIj59gzmqbw6vnuMmJ9+MXMlvRMlCL+/GQlO831nKbUiYLTQ8442IVe49
 GbDXccNz63uD4pLH9V7tRAkfFKZ6xOquTS+Vy84+KLN4DuqsGldZ4nU
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Authority-Analysis: v=2.4 cv=aY5sXBot c=1 sm=1 tr=0 ts=6966ac23 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=rF52-kdUTgVHl7Ch54gA:9
 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: KOFnfxQiI-DkdGru5o6035Rw66w4W3m8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE2OCBTYWx0ZWRfXxAV98DbZX5N2
 Ul90evPT5pqEufRfGJQ/TlkZuBbWi5kJsPJMuc1K1YBcJixlP+dYn+8n00Dcf5al5ZG9DS9YtT5
 NFmH8e2ZRSzcaZRKa+M4V6+Y2EZdgb0KxoKUieHoyRNfoyw8hcfL21Qi9PYZSmF4c6afqiA4cWz
 0HeTrqCVpO7j7NHSpSHG6WP05ZQ3Nemb9A7niZjDXhSMtwGknOPeDwFi0cpCgGC+BHARwGW9V9q
 lZBlhp9M0gPN4qy12TFd9Vb9P2lMM3rL82y/w+Yg7imp39XG36k0IGWaQxINy75J7n5eeVr0qXg
 3su3PwJn4pQunyFN5m5TdG26EnKKe6AUWSxTGwoPLScBo5x8oOyH7h1u164BX/V27NlgvWxCxlo
 6Un05vkiAJGxzKkv2j7TMQIkW9zzOl79/Oh7X2Cwws9bNgeaYsurxfgu4OcdDgSGJsF8WqrWQ24
 XXMlqIn6FqB4nb0qdKw==
X-Proofpoint-GUID: KOFnfxQiI-DkdGru5o6035Rw66w4W3m8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130168

Implement V4L2_CTRL_TYPE_ENC_ROI_PARAMS control type with validation
ensuring the number of ROI regions stays within acceptable limits.

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 drivers/media/v4l2-core/v4l2-ctrls-core.c | 14 +++++++++++++-
 drivers/media/v4l2-core/v4l2-ctrls-defs.c |  5 +++++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 209bc05883bb15bc8614970e7b42595aad6dd18f..5695c96b4f2065c5d548a25ebcfd3619e7b6f4d0 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -442,6 +442,9 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
 	case V4L2_CTRL_TYPE_AV1_FILM_GRAIN:
 		pr_cont("AV1_FILM_GRAIN");
 		break;
+	case V4L2_CTRL_TYPE_ENC_ROI_PARAMS:
+		pr_cont("ENCODER_ROI");
+		break;
 	case V4L2_CTRL_TYPE_RECT:
 		pr_cont("(%d,%d)/%ux%u",
 			ptr.p_rect->left, ptr.p_rect->top,
@@ -967,6 +970,7 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 	struct v4l2_ctrl_hevc_decode_params *p_hevc_decode_params;
 	struct v4l2_area *area;
 	struct v4l2_rect *rect;
+	struct v4l2_ctrl_enc_roi_params *p_enc_roi_params;
 	void *p = ptr.p + idx * ctrl->elem_size;
 	unsigned int i;
 
@@ -1329,7 +1333,12 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 		if (!rect->width || !rect->height)
 			return -EINVAL;
 		break;
-
+	case V4L2_CTRL_TYPE_ENC_ROI_PARAMS:
+		p_enc_roi_params = p;
+		if (p_enc_roi_params->num_roi_regions > 10 ||
+		    p_enc_roi_params->num_roi_regions < 0)
+			return -EINVAL;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -2042,6 +2051,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	case V4L2_CTRL_TYPE_RECT:
 		elem_size = sizeof(struct v4l2_rect);
 		break;
+	case V4L2_CTRL_TYPE_ENC_ROI_PARAMS:
+		elem_size = sizeof(struct v4l2_ctrl_enc_roi_params);
+		break;
 	default:
 		if (type < V4L2_CTRL_COMPOUND_TYPES)
 			elem_size = sizeof(s32);
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index ad41f65374e2396f30f9798235401705af366622..7d36e387d6e9b0e5ee556ea1e48c1b4f0abd084b 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -973,6 +973,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_AVERAGE_QP:			return "Average QP Value";
 	case V4L2_CID_FWHT_I_FRAME_QP:				return "FWHT I-Frame QP Value";
 	case V4L2_CID_FWHT_P_FRAME_QP:				return "FWHT P-Frame QP Value";
+	case V4L2_CID_MPEG_VIDEO_ENC_ROI:			return "Video Encoder ROI params ";
 
 	/* VPX controls */
 	case V4L2_CID_MPEG_VIDEO_VPX_NUM_PARTITIONS:		return "VPX Number of Partitions";
@@ -1607,6 +1608,10 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:
 		*type = V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY;
 		break;
+	case V4L2_CID_MPEG_VIDEO_ENC_ROI:
+		*type = V4L2_CTRL_TYPE_ENC_ROI_PARAMS;
+		*flags |= V4L2_CTRL_FLAG_HAS_PAYLOAD;
+		break;
 	default:
 		*type = V4L2_CTRL_TYPE_INTEGER;
 		break;

-- 
2.34.1


