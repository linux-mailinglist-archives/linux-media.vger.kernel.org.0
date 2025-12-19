Return-Path: <linux-media+bounces-49135-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E81CCED90
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 08:52:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EBD79300AC77
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 07:51:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E20D92EC0B2;
	Fri, 19 Dec 2025 07:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XZhEDahU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FOpJegOt"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2172ED164
	for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 07:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766130210; cv=none; b=L6QWsfniEOvSajIMXiLtTWkuy7945fjNIM7MDKmp81vEbhelG8Pu5lWTz//bWAECfP4uQasnsQ9LdIYCMG0MR7qTiawpB/Q8WJH01jEr5Nvorche4ILu4y3NgpsRfch+FwALcY8P5Ut/4BZuJL6gRF49HtQ8DUXyTdJD2PB0i1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766130210; c=relaxed/simple;
	bh=PYS22VIwFP0s6+Vo8X1pkqgPgtluf+W9+be/fX023ao=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HLD0H2q2p1tOcJ6mP38oxSVT/PYLs0URcthHNp+qkFa9fggEF1I0FD7+1hQuGPAQWyfVG8Vazn/EDSJQOKH9uwtwwy0R62VJuoZr5wywHBu7ICL7npq5Bjcv9C5ooUynQp4jCJt+wiNplISebxRmckgrPxI2lNbreYAY7dtWkTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XZhEDahU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FOpJegOt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4buA43975405
	for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 07:43:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CJ+6NY3RlmXBdxBX+tLnOKNxo2p9RX/rTmakOVflSqo=; b=XZhEDahUn1l/iW1a
	gOShoI0c2Imwhj+h0ceRqiVrDTW0P0FVKZBQ245owRJB54uSrr0D2LS7FkOh+veA
	KxpV4ROd2F/vdhJ+sc53SYYT3PygQrzWDVVOGEwI/7ZCQKysWvJMHu1oBi0Y/YRO
	tYz6mAxAN2Iu57TqcgJj9ojEfkR062RPOi9H2SHb8M8cAeIAoV/Dq9x6C3IPErqk
	gqZh3pCm3TVWR9Q5aTh+DTHr1ihtl/a32vJWMw2Yn5DvoHEYN40Xc5NbBCJBUxyr
	mqPeftzRwzWYlB0ITGTZ/SehKRcbo53n8g/SIW5l5UjmBk0e1cf/qqFNVyGllN5+
	ng0kYA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2fhpms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 07:43:23 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7ba92341f38so1828425b3a.0
        for <linux-media@vger.kernel.org>; Thu, 18 Dec 2025 23:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766130202; x=1766735002; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CJ+6NY3RlmXBdxBX+tLnOKNxo2p9RX/rTmakOVflSqo=;
        b=FOpJegOt+PdpeGOhitDyyoDHzXn2GXIcCSdoaUhm3pUMNz2js/SeTJ5IgB/c5MGwh8
         fvOcFwgQY7mJ7IWOGLuqYkckSRD0oRMvQUgaIcYmcVAuYsvBNhBd6xzmQ2cgdVncjm7w
         LkSCX3t4S5DVt/Vl/0ZJWwcNe7P3Rh43IKTu4GpgQ7ZTe4gH0aPG1WtgFl2n2f4yn+rr
         Pa5PsleauQNMq4kG2i3WYF15I9a6AhMRAK7aCn3/eKo2Nv+AuRwKSMftjGfROZxjJRpn
         jYd+++rIPE1BErw6syaJaCwtPBFkTd8A1KUgHs2ozCsPfTLxcWwFTREQPBVSw05LsKxK
         a8PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766130202; x=1766735002;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CJ+6NY3RlmXBdxBX+tLnOKNxo2p9RX/rTmakOVflSqo=;
        b=oi5V4uFomyEMhasc2wr5E0esTZ+TSROsQKKYpz2FfUqyQeo7KLmXPYivhSEuRPaawi
         U4jIEVxn1k1GsUQU2GHfxfP+oNYlDr128tbCX+WkmDIVInlGqbak9u3oZw5hw7glto2U
         k6lP+eo7JE4UXvKDSMIQvmmai7SdWLJva30PecAY+Bb7qG6eDsc8r6FPvzP6cbgeMxuh
         hJI7uZMaxkOGXbMP5dSdNczucOHejfpLSkSAjP73HdLfd98+8yCUWVRltUrWyz+7b7Xe
         nCT70QBU62yPM/NSkFIxPI7I9ig8h47TTxvbsThVI1iJ03wIi9xQXcEBkqmBST1st8s7
         TJzg==
X-Forwarded-Encrypted: i=1; AJvYcCXCfpEtn0nq037J1hTCuEhPNzxaL5vdbyxkPY/mb8ZNRqBT/ZZtXH44Hvc+nqlW/msFQggnl7zPI1quKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoppU1A20HGPBb5CTWIwFGkUNm67rB2b/IozLRWjlESfIaVl6e
	Crk+h31cLd/op1G9p/nYRkoGdMjM3LL3eHtHqwXyrb7TPJSzkVGo7advjY+KduK9GiplSeZjpNN
	dp1FRg4QIIsk0TXI0lCqNQIETy8PTyoUCZncEGybkmXLRM6LM1EUXzkjnjqpf6NN1iA==
X-Gm-Gg: AY/fxX73wyUnkgRo6izdS7jws6+LKqV1kA/Nf19ZtJg8oIyHqqdFymHBr4tNdpdZ5dP
	cZY1M2xjbOSiH3ImZwH4dJ51BOJQimcEAwbT6UaBhoJJKgrI+yjvTI7ejsJzVG245iVyHCefpQH
	8YSukV2/AJi4tl9KHO+7yvFs8wS/YWS7/vEeBFGx3dzmtp1PBZVRat0w+xEKIQkI3TfIDbnT1u0
	b5yCrs9etYiPjEAD9a22K1dt+/VKPqyhBxPTlYKD3wjKsn1y24YyOKfKzTfkeMw6tKyY+h0kFSR
	uB/sQhD0p/DfCXfB87742TwAAqaa0LMBDidwPDX3G1wOL0Ho6Vs/THF+bL7TH+1E/Cc1XUpu7oc
	3f+Xc78ZAVy1HwdnvcwgbCXrMyhrHwAcvfdD+z6WC
X-Received: by 2002:a05:6a20:1611:b0:371:8e6d:27e1 with SMTP id adf61e73a8af0-376a81dbf37mr1810772637.36.1766130201791;
        Thu, 18 Dec 2025 23:43:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH0ns76M8bn+b3kHqi/JNAsuGmzOPJylqXyRJtXWTlSn9eDVqM0z5ZW5AVfZxHboWB/op0oAw==
X-Received: by 2002:a05:6a20:1611:b0:371:8e6d:27e1 with SMTP id adf61e73a8af0-376a81dbf37mr1810737637.36.1766130201200;
        Thu, 18 Dec 2025 23:43:21 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cb90sm14007325ad.51.2025.12.18.23.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 23:43:20 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 15:42:33 +0800
Subject: [PATCH v2 5/6] media: qcom: iris: Optimize
 iris_hfi_gen1_packet_session_set_property
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-batch2_iris_encoder_enhancements-v2-5-371f7fe24801@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766130176; l=9365;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=PYS22VIwFP0s6+Vo8X1pkqgPgtluf+W9+be/fX023ao=;
 b=I7vyOOFank3d2IIPBiUq/fncQ8vEqdTlCHA5+rv1rC6tIRsigJ6NgAgmee1Iocr+K5IjnfQl0
 l5r0BSuygUqDriYxrD3Fc939sYjb2lNqDEVJIpJ0w58popfx5SruMES
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=NODYOk6g c=1 sm=1 tr=0 ts=6945021b cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=7zm3FxsWSslHyZ29AF8A:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: RQwP8P_fpkwktHbDwUv-UBkLQDcNSDll
X-Proofpoint-GUID: RQwP8P_fpkwktHbDwUv-UBkLQDcNSDll
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA2MiBTYWx0ZWRfX0Zi/isLHL7VZ
 sc1Y73qElPX49Cgmqtz6l372Sy01LEfNWbeyrH3wb8H4QcxKQvz2QLBJ+080Q83tJYSJRTBc3HA
 m3guidZ5Prw3bgW0duWW/jYLb9ZvMPus7vmV3Woy54nvRHwdmUHIPTBhEIK1hoM+tyHUKwRawcO
 Sr1wmnhZtxetGYgK6UIoAtvKLv+PdbswhvSXzHHvQcXSipsEBCCzYhEW2RuCI/1j7aL7xYff7eG
 VP9K72KaT+wR2VZIE+UqLChiTMQA4pQDnR8tqdoVkHC89IzF0Kw65F+5cDpRUtE4JskfxxzSwRq
 OulnhXX6dp0FU0V4wGvDvNezAe4/iQ7tMKZobfJrznIlGOIE9f5m5wFpjqf3IRQFSDYru+xsV8s
 c1eBrOdLm6mxBwefKCN4ea+BYzx9VBc5+0ZFLmiYoYzE19XWbXNXFp5Vy9Vs7h3E/JHf7ScoiEn
 zjYKl89/wDZYPmYD+Sg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190062

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


