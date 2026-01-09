Return-Path: <linux-media+bounces-50269-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A38D07A2F
	for <lists+linux-media@lfdr.de>; Fri, 09 Jan 2026 08:45:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8E950301FD54
	for <lists+linux-media@lfdr.de>; Fri,  9 Jan 2026 07:43:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75DF72FC86C;
	Fri,  9 Jan 2026 07:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eVbTxaD2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e3/fTVMS"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471D82FC000
	for <linux-media@vger.kernel.org>; Fri,  9 Jan 2026 07:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767944588; cv=none; b=bL2HtYrjpkRKvM4Lcc2nu6nB/A/65rf49K4GB+To/+L6/h1wrF+j0dV0/F3aEeguFCDQRnXP9W5Al/WjRvljLvAO5ffPf+73yFvtEfkIzxKazfJrwSUp0ZzzRqPqjIef1cMyX8OlFx5iQza3NjnIx8/3mlh71R3YX/LdpA4UpdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767944588; c=relaxed/simple;
	bh=PYS22VIwFP0s6+Vo8X1pkqgPgtluf+W9+be/fX023ao=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uEghqLjcRw861Crxq8R04i1PSnlB2fe5HVA82HacWV3+y2H4UR201Tdpdl5JEQxKjCH9AsssoNkQra1zNdyse/GXZTTkXVeu8i9beRxFEnwEdS3G/19Y1oKT6drnhTvzWMUtBRwp8glQa8trvNLfOGxe1MR3cTdUYfs9xn4Br1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eVbTxaD2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e3/fTVMS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6095fDsN2765728
	for <linux-media@vger.kernel.org>; Fri, 9 Jan 2026 07:43:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CJ+6NY3RlmXBdxBX+tLnOKNxo2p9RX/rTmakOVflSqo=; b=eVbTxaD28AyJoVT5
	YXrXES8inlHk4Nool6hKjAaGqz8YaQX8DeHps+CaZ6gja/6FEaTEYieWTeQ0+OeU
	mLcm2+rXu1OsCIlJErAPUreMNpJBordZrBTOEA8Pc/mM+zTjCHb12zd1K/6d/yR1
	GBw0CEdEqEHJfiNx6oYDFuMsI6ET/kcNpxW9No6YJ+DFIXqga+G2E5Xu95QlEuBS
	hvxQH5e9s1JSnjPmJiAXJtVj38nnDnOKhg/aM2QuR1kHTd/OOT71vI6qYECfzF68
	7pSQo5YkMc+mY5R2iOOJKcyXfJ7pvwYulLG559Fj4tIkw17Dr5JVi/w1tuoY0It7
	mll6fg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjfejtf8n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 09 Jan 2026 07:43:06 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29f1f69eec6so43925285ad.1
        for <linux-media@vger.kernel.org>; Thu, 08 Jan 2026 23:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767944585; x=1768549385; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CJ+6NY3RlmXBdxBX+tLnOKNxo2p9RX/rTmakOVflSqo=;
        b=e3/fTVMSMd19Vpm9CuRcDehCSQCcM2yyUAQABo7e5kMM0o6lUkSLLrK0QrAThTl8mL
         3i6LHA2PTx86foC34vQC8q2aYgmJbx23KBWHIOSPS4O2fQAX5hkjSO/s70hcF5lPNtnN
         DTUl3Z+DCGk3CVBTAT+jKHYKc3/ogkCg5CdMtDENZAym86PCmz+V3n5sT9n7Uqtw2KbA
         KBYlC3RZFtMMWTzKlZsHfAkIRFEZ+kHivQBAD/cqdUtdgQWuop3hVm0/5KxOSErAfTsx
         USNjWKbY70EGRNm8zSPwtQKy/11XN54EgMa8YHSX85Palc/tvHO+X7suuaL01+TqVsyY
         8iqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767944585; x=1768549385;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CJ+6NY3RlmXBdxBX+tLnOKNxo2p9RX/rTmakOVflSqo=;
        b=o9DYkt4R4q6JSFdiQbQDivv3rk7ZHwXZzWpgyiIm+xQnmKflJ6nU68GTdLDxt0sPa1
         iGOBuF/J2lxnLLMKWWrfV0XloDJiYbpcAykcpT29wvljL2StZI8U4n4YB8S5C/nDCOBT
         RUGc0WOsrqTuFUIdkHkd+g6oibX4O5bBQ1DX9ytQXBHe+yLb+zzRfF0zOdXa6Ods/mM7
         RNeV2L+E5xR8KZgSb0+npn73LwENRtdG8+SO86lc6j02WFDOG0WCiQDfP9Y8fEUExzdK
         oPmW2uPIIisYHK5HY/42K8HuMusvjI312ifaaMKi9yG1V4hMVyvWNKxmbzd0MTiRikoh
         y06Q==
X-Forwarded-Encrypted: i=1; AJvYcCWaH0Ay4u+7sYITClQWmDWbF+4of78I9EFV1mIh8iKhsf0EdC95Sw3eLkG12Woc67dipaAK3U/DNF7gfw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYveYp8dDHDgp4geNKB+zIOjzoRIxCu62koXIK4//XYPeX2wnt
	rxk0DRN2WeJfXZmkc8sA6WcmFqnrtWNeUy1slS2NDPWaBtMoRYcp7PptqpaZiPPaAK2htPnuKcb
	c2RgzQ0BWnDrD3X/ywoES2u5nxhwDYWEG94Sp8cnqGlNRQrfaW6OnZltoE8q+59isfA==
X-Gm-Gg: AY/fxX7oysySH3TOPPAVSGWkP26ejTsCVRdQqWg31uCso/dV3qRvkUKiIZ/DzfPOyJi
	sOwNKyU9FqECZnubqbY9JXpgGjR01G1sW7+vO84HgZrcUR0c20yFlsu4C1y2HpstfOBWDlOUe07
	v5J4t7HcFqq/06zlViaTiQkGcuQVFUwTuXVU+D0J3JWBZn4gnmCf+yai9tcYrXXHyBnyY/0eNhf
	QHJO12zYUXy88Mym2LXGsR9Q2FCav2z+1mOHu8SOh0NG7DjDhHqvxiSLQmGzQ1qWiy6FRmQWp4E
	8QbQVSX0cps0/sIWcWogEAiWVMcvtgEn8jT2resZBZ5mEAWtZOQQ7uwCRTeLfvcyCsrMi6EU0it
	ar9d0UJ7zrCF3A/sGCMR2Y02TyhoXrHlRrHQpNGJlH0i1XQFGPInC8klnRiD45zymSp8G9ERwoz
	MWuhnLlRbd
X-Received: by 2002:a17:903:124e:b0:2a1:3cd8:d2dc with SMTP id d9443c01a7336-2a3ee4b74a9mr95306255ad.57.1767944584768;
        Thu, 08 Jan 2026 23:43:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH68sxvQo8solxnM9LzIgq/rjUF9Q0s0Bwiqk+QtoISxH1TbxQ3cUbFrotg+m3ggMukytQGRQ==
X-Received: by 2002:a17:903:124e:b0:2a1:3cd8:d2dc with SMTP id d9443c01a7336-2a3ee4b74a9mr95305925ad.57.1767944584233;
        Thu, 08 Jan 2026 23:43:04 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd46a9sm98638195ad.93.2026.01.08.23.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 23:43:03 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Fri, 09 Jan 2026 15:42:34 +0800
Subject: [PATCH v3 5/6] media: qcom: iris: Optimize
 iris_hfi_gen1_packet_session_set_property
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-batch2_iris_encoder_enhancements-v3-5-196855ef32ba@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767944563; l=9365;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=PYS22VIwFP0s6+Vo8X1pkqgPgtluf+W9+be/fX023ao=;
 b=ZqV+ZL3OD1oEcJJnNtwSctx2EpwNbyylzAqEVHqaTnzJmA28FqYxnTeVL0cQV4Ig/XIARmajP
 66KICkTsstACOrikniyU85Ko9Sd3gNUNzHFx2/FLCjDx6GFR5ZCcHWU
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-ORIG-GUID: -fxSq-zaip7L_0atHrJgx1-BOBey4K3-
X-Proofpoint-GUID: -fxSq-zaip7L_0atHrJgx1-BOBey4K3-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA1MyBTYWx0ZWRfXz+Z2Eh05opPS
 gAXdmjDpd/TdMU96eRJGKV+5+ozvkJHDeaYXuj6JWJ7FqpG6gprVvRqD4qthSlD2u8aSkT0EkHQ
 Tazo7oJQVkqlTFNrRdtu+1nVZCBNck5IK6bZqgcg3lJE7SMNTEvKnPNaCugWmu1W9hgcnB0YRHU
 L/kD+TfjRvStg4AAnF/RjheJOQQTQQsLsTlSD+RVyTHL1Et02vK5GDXq++qhH6t+XyPQkjDCkuF
 7U9hl+2HjBmB7YpGQy67fKHAYSYXL+6p0dZg/rqDFvzaiiemt8LfvV/J0ye3s+BIk39aKv0rEMA
 5/iPyumECEQWzuPfMR7hFcH2EcA/kK7Jxfye/gD/wpj5942lIms8UzvE8NJmsqZ3hi8dsKptJAE
 hBa20dGqHSiEwgrBBGDvROTm2ChQfpiOuNsk6l+JNOVKPkvZuLtno3Zse6zbWisMXHUgiou0z2S
 bD53ytUGC7lppOrEfMA==
X-Authority-Analysis: v=2.4 cv=ZfAQ98VA c=1 sm=1 tr=0 ts=6960b18a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=7zm3FxsWSslHyZ29AF8A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090053

Modify iris_hfi_gen1_packet_session_set_property to simplify size
calculations and remove redundant code patterns.

Previously, packet->shdr.hdr.size was incremented by sizeof(u32) in
every switch case, resulting in repetitive and less maintainable
logic.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_hfi_gen1_command.c     | 50 +++++++++++-----------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 5d7d7856b35f4175225256c2aed619527aa5f2e8..08c99f9455cd6cee3244d3ca1334d478e31e1a26 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -483,7 +483,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 {
 	void *prop_data = &packet->data[1];
 
-	packet->shdr.hdr.size = sizeof(*packet);
+	packet->shdr.hdr.size = sizeof(*packet) + sizeof(ptype);
 	packet->shdr.hdr.pkt_type = HFI_CMD_SESSION_SET_PROPERTY;
 	packet->shdr.session_id = inst->session_id;
 	packet->num_properties = 1;
@@ -496,14 +496,14 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		fsize->buffer_type = in->buffer_type;
 		fsize->height = in->height;
 		fsize->width = in->width;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*fsize);
+		packet->shdr.hdr.size += sizeof(*fsize);
 		break;
 	}
 	case HFI_PROPERTY_CONFIG_VIDEOCORES_USAGE: {
 		struct hfi_videocores_usage_type *in = pdata, *cu = prop_data;
 
 		cu->video_core_enable_mask = in->video_core_enable_mask;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*cu);
+		packet->shdr.hdr.size += sizeof(*cu);
 		break;
 	}
 	case HFI_PROPERTY_PARAM_UNCOMPRESSED_FORMAT_SELECT: {
@@ -512,7 +512,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 
 		hfi->buffer_type = in->buffer_type;
 		hfi->format = in->format;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*hfi);
+		packet->shdr.hdr.size += sizeof(*hfi);
 		break;
 	}
 	case HFI_PROPERTY_PARAM_UNCOMPRESSED_PLANE_ACTUAL_CONSTRAINTS_INFO: {
@@ -531,7 +531,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 			info->plane_format[1].buffer_alignment = 256;
 		}
 
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*info);
+		packet->shdr.hdr.size += sizeof(*info);
 		break;
 	}
 	case HFI_PROPERTY_PARAM_BUFFER_COUNT_ACTUAL: {
@@ -541,7 +541,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		count->type = in->type;
 		count->count_actual = in->count_actual;
 		count->count_min_host = in->count_min_host;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*count);
+		packet->shdr.hdr.size += sizeof(*count);
 		break;
 	}
 	case HFI_PROPERTY_PARAM_VDEC_MULTI_STREAM: {
@@ -550,7 +550,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 
 		multi->buffer_type = in->buffer_type;
 		multi->enable = in->enable;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*multi);
+		packet->shdr.hdr.size += sizeof(*multi);
 		break;
 	}
 	case HFI_PROPERTY_PARAM_BUFFER_SIZE_ACTUAL: {
@@ -558,7 +558,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 
 		sz->size = in->size;
 		sz->type = in->type;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*sz);
+		packet->shdr.hdr.size += sizeof(*sz);
 		break;
 	}
 	case HFI_PROPERTY_PARAM_WORK_ROUTE: {
@@ -566,7 +566,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		u32 *in = pdata;
 
 		wr->video_work_route = *in;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*wr);
+		packet->shdr.hdr.size += sizeof(*wr);
 		break;
 	}
 	case HFI_PROPERTY_PARAM_WORK_MODE: {
@@ -574,7 +574,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		u32 *in = pdata;
 
 		wm->video_work_mode = *in;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*wm);
+		packet->shdr.hdr.size += sizeof(*wm);
 		break;
 	}
 	case HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT: {
@@ -590,7 +590,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 			/* Level not supported, falling back to 1 */
 			pl->level = 1;
 
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*pl);
+		packet->shdr.hdr.size += sizeof(*pl);
 		break;
 	}
 	case HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER: {
@@ -598,7 +598,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		u32 *in = pdata;
 
 		en->enable = *in;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*en);
+		packet->shdr.hdr.size += sizeof(*en);
 		break;
 	}
 	case HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE: {
@@ -606,7 +606,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 
 		brate->bitrate = in->bitrate;
 		brate->layer_id = in->layer_id;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*brate);
+		packet->shdr.hdr.size += sizeof(*brate);
 		break;
 	}
 	case HFI_PROPERTY_PARAM_VENC_RATE_CONTROL: {
@@ -625,7 +625,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		}
 
 		packet->data[1] = *in;
-		packet->shdr.hdr.size += sizeof(u32) * 2;
+		packet->shdr.hdr.size += sizeof(u32);
 		break;
 	}
 	case HFI_PROPERTY_PARAM_VENC_H264_ENTROPY_CONTROL: {
@@ -635,7 +635,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		entropy->entropy_mode = *in;
 		if (entropy->entropy_mode == HFI_H264_ENTROPY_CABAC)
 			entropy->cabac_model = HFI_H264_CABAC_MODEL_0;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*entropy);
+		packet->shdr.hdr.size += sizeof(*entropy);
 		break;
 	}
 	case HFI_PROPERTY_PARAM_VENC_SESSION_QP_RANGE_V2: {
@@ -660,7 +660,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 			((max_qp & 0xFF) << 16);
 		range->min_qp.enable = 7;
 		range->max_qp.enable = 7;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*range);
+		packet->shdr.hdr.size += sizeof(*range);
 		break;
 	}
 	case HFI_PROPERTY_CONFIG_FRAME_RATE: {
@@ -669,7 +669,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 
 		frate->buffer_type = in->buffer_type;
 		frate->framerate = in->framerate;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*frate);
+		packet->shdr.hdr.size += sizeof(*frate);
 		break;
 	}
 	case HFI_PROPERTY_PARAM_UNCOMPRESSED_PLANE_ACTUAL_INFO: {
@@ -681,7 +681,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		plane_actual_info->plane_format[0] = in->plane_format[0];
 		if (in->num_planes > 1)
 			plane_actual_info->plane_format[1] = in->plane_format[1];
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*plane_actual_info);
+		packet->shdr.hdr.size += sizeof(*plane_actual_info);
 		break;
 	}
 	case HFI_PROPERTY_PARAM_VENC_INTRA_REFRESH: {
@@ -689,7 +689,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 
 		intra_refresh->mode = in->mode;
 		intra_refresh->mbs = in->mbs;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*intra_refresh);
+		packet->shdr.hdr.size += sizeof(*intra_refresh);
 		break;
 	}
 	case HFI_PROPERTY_PARAM_VENC_LTRMODE: {
@@ -698,7 +698,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		ltr_mode->mode = in->mode;
 		ltr_mode->count = in->count;
 		ltr_mode->trust_mode = in->trust_mode;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*ltr_mode);
+		packet->shdr.hdr.size += sizeof(*ltr_mode);
 		break;
 	}
 	case HFI_PROPERTY_CONFIG_VENC_USELTRFRAME: {
@@ -707,14 +707,14 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		ltr_use->frames = in->frames;
 		ltr_use->ref_ltr = in->ref_ltr;
 		ltr_use->use_constrnt = in->use_constrnt;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*ltr_use);
+		packet->shdr.hdr.size += sizeof(*ltr_use);
 		break;
 	}
 	case HFI_PROPERTY_CONFIG_VENC_MARKLTRFRAME: {
 		struct hfi_ltr_mark *in = pdata, *ltr_mark = prop_data;
 
 		ltr_mark->mark_frame = in->mark_frame;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*ltr_mark);
+		packet->shdr.hdr.size += sizeof(*ltr_mark);
 		break;
 	}
 	case HFI_PROPERTY_CONFIG_VENC_INTRA_PERIOD: {
@@ -722,21 +722,21 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 
 		intra_period->pframes = in->pframes;
 		intra_period->bframes = in->bframes;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*intra_period);
+		packet->shdr.hdr.size += sizeof(*intra_period);
 		break;
 	}
 	case HFI_PROPERTY_PARAM_VENC_HIER_P_MAX_NUM_ENH_LAYER: {
 		u32 *in = pdata;
 
 		packet->data[1] = *in;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(u32);
+		packet->shdr.hdr.size += sizeof(u32);
 		break;
 	}
 	case HFI_PROPERTY_CONFIG_VENC_HIER_P_ENH_LAYER: {
 		u32 *in = pdata;
 
 		packet->data[1] = *in;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(u32);
+		packet->shdr.hdr.size += sizeof(u32);
 		break;
 	}
 	default:

-- 
2.43.0


