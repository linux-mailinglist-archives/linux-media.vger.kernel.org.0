Return-Path: <linux-media+bounces-50270-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C822FD07A44
	for <lists+linux-media@lfdr.de>; Fri, 09 Jan 2026 08:46:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E0528305A8DA
	for <lists+linux-media@lfdr.de>; Fri,  9 Jan 2026 07:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4000B2F7AD0;
	Fri,  9 Jan 2026 07:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CYaCs9mI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jcWBDZLE"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFAB2FC891
	for <linux-media@vger.kernel.org>; Fri,  9 Jan 2026 07:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767944591; cv=none; b=mDiReUeVPgb3StirZoSZ3wxgnVXuBryxlYtJWIE36qbiNZ1vHzgpOOofS0D8nJFc01r1eE519/AJQjmVPWZJS9KW+Y3kCqXR/rW3vFErvtCqQXBFhWBgvuCi8sE7plokc8QhugifdJhmGHIY4oV/Boxd4zHjNPmW7bi+N7OKEzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767944591; c=relaxed/simple;
	bh=aRmyC1rbJb3ivyJ7IFPZ7zWbBdyiu4TYmPBr8U9HwJE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aEyXtiTVnJ3lb9qNZIsqyKiRXcYgEGkWkBAUWoTNA91ZmojgyaRExD3ReEIn6AkpHqFHHGN3Qpc1Cv5YdD+TSPRJ5LkyPE7Wi+29PdmyMkQr64juCQ0Azgnm8HA7DmXwzQI7EFbVqYy0kT3MGMt1FMWiBneFc4u2N1mqHRm9C0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CYaCs9mI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jcWBDZLE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608MmYs23214264
	for <linux-media@vger.kernel.org>; Fri, 9 Jan 2026 07:43:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7V538McHgW6Ox+rkQHRMSlJA0iMCmPeJqU27mizyjJw=; b=CYaCs9mISMgNd8cf
	Go2E76pChJSqt9fH0aM8bszveyLCH2y9KQ6XnF4L2wIFCdQmMjXlK58j2mzvHZ8F
	2t5f+7ESFFIeuGGRR4CS1SUqPuAFn9JVNsUkCS4352V1S8inTm5YjbCcNEgdoXcR
	K2qGLJHGveSI6wxF+XjjY/oTFUSEaEzKFEHxJ6vcQC8b6pmxQPjRAvB67P9slMMU
	SkQ5P9sNPMOCfNuL9qyKjwF7S6DWMjthjT4XI/jLYOQQ+mV6VQl6stDKxDTkmyys
	17KLOAAtV2lr8jfIkmwYvLV0GmM0/AL2a44F6UFBS6kJCdyZeAqpC8xeO7cuyA9l
	J0jeyw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjjt0hn6y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 09 Jan 2026 07:43:08 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0d43fcb2fso86002435ad.3
        for <linux-media@vger.kernel.org>; Thu, 08 Jan 2026 23:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767944588; x=1768549388; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7V538McHgW6Ox+rkQHRMSlJA0iMCmPeJqU27mizyjJw=;
        b=jcWBDZLEcfb0LgmzthOyN+soj/uFHicx1DU8B90QB9OqUcx2WL/f1C5pCTzzhUdreZ
         3gqQ6cnEtHJ/o9x2nIreoiDnQ03Ow6Y1VW1EUuvwyjyI/34GFzBZOzIjcyw5OJXXxJRS
         oerxXhB9WBEUFrcqdOIwzlh6+IU7Xq6DUPBSe7bYxkGYoD7xeaHU7Pg6vEOAH67PQh4N
         P3EBh3OOLPSLXh1ra7bD8DT7CV8RKNwjI4slEUd4RRgct+iGgCy7UKSpgpsIEg8V+Rnu
         Bo1U0OLttUYrPnQucb4tezzlK7annEKbQSjXTNy/B0/6Vprk26/erp93tuh85ob87jtL
         SNtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767944588; x=1768549388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7V538McHgW6Ox+rkQHRMSlJA0iMCmPeJqU27mizyjJw=;
        b=cNxSgK3HHw/HvT5vfTw3aBsgrzB1r4Zu+fZ/qJFSpQq9bzJijiKcG3YX3W4exHQ4TQ
         WEHmMpn2bP/vivFHX1AXmFz6eWbo1MliuKLCL13OFo2c90IK7hP6sNGtR/T+yROYq/+3
         kC3BYSWOQGGjm82wdjxZDol0taK9AJgfknjKr0MC5mUWthOOZnLYQN5eExC681BkDfqH
         SRb2alKq3eB+O0UnAYM9ohHhgQnekSZFk2tcYGuO9woaPsz+DR2vAi1PID8KmxiOTnVk
         zFatczenoVKCA41OMNMd/ZldJyOkPpj4vTkKLUXNMlQUUAtG+1FZTVmJ+GCvcSG0S5lP
         y8aA==
X-Forwarded-Encrypted: i=1; AJvYcCXayRkxhkXtFKU+4NacKNELXfigXgV+01wP7WHZxrVP6fARzwfdU47Ga6036JA4ZN34AZz8KnThbwOVMg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsi2jl+pAjU8zFhwSRfALM8VKwFO+5ZPaUAU/gJGhvzbAD9N5t
	MvazvLCw1UGTIU1qaSTdPHtipmO9uD0QIHNgPCg1w+mm5DKC4tWFn6e1dwzU6f+wy0A9qHT/e/l
	T4MFvJxksFeWN1ApOu9mhvx1f4DsjetYH5xeOgW2fGHsuMfBkAfiPINm7kl36EL9tQg==
X-Gm-Gg: AY/fxX54iMcejtOabdt8Mzax+CpUko9MHDpKUlGsgyfQDDE4lzR2wBerPpLSZRBLK8I
	zGz76OsUCoMVl6LZorRSgIdwL+YPzgtDNI9mNDjVAJbdAwhqcGJgJp60Ligq2qmCo0UV7JuTvvx
	97CJlvGx0hYQX2irgjfB3/ut7GodB95VSjSB5rAC6QH2Xm3uro8zdpW7vvZmK9JViSIpgjSQp00
	Fo9dAs8MpikRAeorhjgh27LBhUuISMVdJ/xabO2lb9XvR6IQiAb6zbAPs+AV9PBjm0fwgjZpiz8
	X32nlf1uw7vtNLe+wtLOYWGgPQ5bShqWJi8P+UAt1zsjz80KD9CNx7bIm9vIsIAjV2RbS409vAC
	9/GqNia4m5j2fGq2ufzZ/zKaUPltA5j0kpEdX1OfMtLfRCFEWYn0wKE5Qu/3aW1tfCYGqlVqHA4
	nx0W4iKaih
X-Received: by 2002:a17:902:f64c:b0:299:e031:16d with SMTP id d9443c01a7336-2a3ee484c7amr97653705ad.33.1767944587996;
        Thu, 08 Jan 2026 23:43:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHUA4MlT//uRZGo70UHxB6XnfEGbvccHswqpCVh7gnz2+rlhpaUi1q13wNykWcTXI9PVTajtg==
X-Received: by 2002:a17:902:f64c:b0:299:e031:16d with SMTP id d9443c01a7336-2a3ee484c7amr97653545ad.33.1767944587555;
        Thu, 08 Jan 2026 23:43:07 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd46a9sm98638195ad.93.2026.01.08.23.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 23:43:07 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Fri, 09 Jan 2026 15:42:35 +0800
Subject: [PATCH v3 6/6] media: qcom: iris: Simplify COMV size calculation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-batch2_iris_encoder_enhancements-v3-6-196855ef32ba@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767944563; l=1433;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=aRmyC1rbJb3ivyJ7IFPZ7zWbBdyiu4TYmPBr8U9HwJE=;
 b=L3MT/3AEEYdndqC+mVdhAVnYhtOMBQTi6Ul81rPU1LzFOG9WNsoXsss0tm1tfOio0VHN07W9e
 pqCJiQR3meGDqrkYYFP8EcAqQKaU/6FFePyiV03Sh3TzgvWKEnbSjmd
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: FUKXrhvmXNazNDTSIF3eE5HuvjaBUlcc
X-Authority-Analysis: v=2.4 cv=VJzQXtPX c=1 sm=1 tr=0 ts=6960b18c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ihyF2tqwNky6lgPlo9sA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: FUKXrhvmXNazNDTSIF3eE5HuvjaBUlcc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA1MyBTYWx0ZWRfX7hPud0F+cHRx
 zCcjuwgREk42ttTdSAZJvRVLHSJzj3VRszeNoNvvNzYcbRqf3vj8Gtz8ImWLupi8D3yEUg6dY2W
 8FL/xKK4tM/AK1haPs6Ah5VJkx2g7PVZki4I9Y/g5UBpDAcbFVQuJPg5DL60XLQ7raHCwG1kuj+
 Jtd9f0dle028tHnUXJptKkO5TWsndN2JVp1v1UmnDjON97EMqvGOdJixIx0tglc4DJAOogBqh9d
 9GaZv6DiqfKYFu1S8QY3TBeLgpL/FjQjJYzoYu4sSIxvWP/1TLwSX8Bl0aGqwB5yhDLZHYDpoyq
 y4WLuLICAGKpvEF6iHeG1d4eS7hqtNls44QxF5s8QxzGpCo5BlvrgT9IAkP0bJ1xVP0yS36fCfl
 QSTdWgYyOasVHmSeu34Q7S+Mt/9QSyxIXuGiYJDb8FoA1jQO3WpkaNow6kJSaeqoWBUSk2VnBW+
 qJPrK5jJQnXWJb7evWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090053

Unify AVC/HEVC handling by computing codec and lcu_size upfront.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index c962042518fceb0f82a48956df01c8f3cd26df99..621d5c6b4940e146f117e6b206421127c7cf9656 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -739,16 +739,13 @@ static u32 iris_vpu_enc_comv_size(struct iris_inst *inst)
 	u32 height = iris_vpu_enc_get_bitstream_height(inst);
 	u32 width = iris_vpu_enc_get_bitstream_width(inst);
 	u32 num_recon = hfi_buffer_get_recon_count(inst);
-	u32 lcu_size = 16;
+	u32 codec, lcu_size;
 
-	if (inst->codec == V4L2_PIX_FMT_HEVC) {
-		lcu_size = 32;
-		return hfi_buffer_comv_enc(width, height, lcu_size,
-					   num_recon + 1, HFI_CODEC_ENCODE_HEVC);
-	}
+	codec = (inst->codec == V4L2_PIX_FMT_HEVC) ?
+		HFI_CODEC_ENCODE_HEVC : HFI_CODEC_ENCODE_AVC;
+	lcu_size = (inst->codec == V4L2_PIX_FMT_HEVC) ? 32 : 16;
 
-	return hfi_buffer_comv_enc(width, height, lcu_size,
-				   num_recon + 1, HFI_CODEC_ENCODE_AVC);
+	return hfi_buffer_comv_enc(width, height, lcu_size, num_recon + 1, codec);
 }
 
 static inline

-- 
2.43.0


