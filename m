Return-Path: <linux-media+bounces-50588-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5924AD1A7D4
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 18:01:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F07DD308C746
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 16:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9B38393416;
	Tue, 13 Jan 2026 16:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CiJRy9dc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TBFofBcD"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD19E34DCFD
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 16:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768323469; cv=none; b=jlfzIrgCiGwY2LOLcubI3gtDVwvb/Tnhqm7uRcB0XyKKEkcc1y746eHIAVAPChIok+fYLOBxU9hRzWtzg90019FE6nCSQGgWKLfkx61ifjmGkwlLssPuhDostkgi192+1itSUdTrpMNR9tfnvIZFQ9L13qD8Iqmarft9Ac2uq/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768323469; c=relaxed/simple;
	bh=h7MMn6eoIT/MLTtBQ0NByysAANWVyaCDgHBC25L6vPE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qptJzPyGJEIcGQIGO0QgQtDKAB56Jj8W50QNHhrksphv51Kc0fKmrjPM0BmsGPK8ti0r22FEZzi/2ZeJPuANg9x4F+aSd6EV0h+Wohq9IQmZyHvS1vk5+U1JcpBo4UeRrDJvuoQgpW4b943IdiZsq/pX/DPzhAH5WCWLSzbKa60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CiJRy9dc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TBFofBcD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DBDX734164854
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 16:57:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9ln+HxvUbm17UzFH53D4M7bFPebJ/beboKgAcEXWZ3Q=; b=CiJRy9dcnIbnk+bV
	stUMsfuWAJaVHkzK/H6VNN7SccgDAczR5qhRgLCTZGxqQZVJUCCLhaDANk7VttEX
	c0gtwreQi1LkwG577E0zK+IJhLHeBMwAdminnWB668LHCsJsmVqm3Y0SxooNfXYm
	3uzqaF0n23FjmhMMBmSq/IHI+SMRiatrYatE8DaZWREJfLMYH/qhyUSJzRB5D530
	36QJ3x5odjj33quKOqo5/PHN8WqAExkfs1DMbMnvw6sQrr1IhG+pvIA3HS4hbcS8
	/6HtUD0U5TsdTGoRoHwz9RuBIHLQu5RAX9GeMCzwo1iJNLrIeuX9V+7yjms8uaQA
	jEPBNQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnn06s4kx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 16:57:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52c67f65cso161689985a.1
        for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 08:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768323464; x=1768928264; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ln+HxvUbm17UzFH53D4M7bFPebJ/beboKgAcEXWZ3Q=;
        b=TBFofBcDkQ1TdMVLx/pRxAf3Kqj5EVBsSt+QmdBwuvWIqpTVXS00q8K3hWsslFvNUs
         XQMpstBzDBA1y+sg97z2GLmatEP6VPJMdzgH07u4zj/jxF/efhie6UwOqCs1Y//8D8kj
         3hqC48Mc3XlCDimH8EkfocxDQw1o79YpBI6IkfSPnDd9blb/xuO/Kjk7WJn8Z7HLdJM6
         hnfXVH5RmwGI3YF2dUB7lks0pi4V+OvkFHzxU6x4+u+mPNCGQmwQ2oyHi1rlkzwxbrq1
         rBQl2HtW3HyvFZneAjrgwfCud+dkHlvZKX++3Wj2z9oyybIx+exfLD42PRlLBPXF+hbc
         EH3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768323464; x=1768928264;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9ln+HxvUbm17UzFH53D4M7bFPebJ/beboKgAcEXWZ3Q=;
        b=RtN3xSMchHNrAz22cVobb7E5usbYIXJhoItXk6ApN9m6dzrXY+edobUXyRf0yS667a
         kS723LM4Y+HrkUQqGePDxKLYt0ppal5rFECINWQbE2kwe6fqquaDq+hlzWUh5cS2GgTy
         ng9zW6C+52ko9fC4oq926szgHmakJs8DECLTA3m0jISRiaphW6PyRxQYXdk4ZOm78T3l
         epcf5CSNd2PtFMqHZB3T4LzY9YM4lEOUxLUHDO4tqyedThqYCU2CrjdmDpze/KSrR3yX
         lwfWdnKMbc8X0wV3Y0ZYL9NrQ2c763BTfycHokuBwZVbk8HPXvR8BiXGm/s+Utwgybfg
         D/ZA==
X-Forwarded-Encrypted: i=1; AJvYcCUvKO/ejGC89LcMpE8lisVVEqcPc7lYWQUR7bEfgbR3QSiv1CJKleZZX7nqKLDssPKJLKhIOTyM6tJtdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+cYIj/di2uZttY2TgMlyNx27HgDU2oOQFHJNVsyBY/tXsVkyj
	E0DPoOJhquk6zlUg5NiHcL+adzuqaOF94OYDFZOHlTxf9WzvzWhk9iKiOxyTexyeVPqvTIDWT9i
	W+j9d7pkd1oX43nSmZ9dEHFmpw9bIZ8z84DdGVAOOxwWD5OxnBUFgLzo4bSAsklpvSQ==
X-Gm-Gg: AY/fxX4g27Ket3wy8hAGQgvLIl9bqfyA3Wh3wVJxbhg7j5uplrgG3wSWafSHvaKLndG
	9qM6PCAd6/7JEd01HpCzYSMfGEhQKq5KvXeoHhnuUocz8iv8FIxuHQNqZgy9Ot8SFES2W3Ar16T
	hTCP8rhqNqjTKd9AAUJT7b/Vawj8nLKvdefqLHgE1gMEL1xlPETpg/2AsuEAzUrrIK0+kkEjbQ9
	qNsnymZ+3Sh1eIQvwIGhVVSwclZoWDCH1OQCtJTuKBbPm/CM6dRTwLdU5bPrdUO+29cTavw3brq
	l9f0jX2o+9kEy34Mxep2t8S7tvhLBbMsBifwvfS5Ta2Ge2l+jpWko+UnZLQf6YHV8Q6q0VVxzOP
	M7M7a6lApPEYBC9xPMe3k6MSBwgAvtbAlDgudkBfvacMoPhv3X5F/HZ4TBpGJNVhfRFl3a9zhWp
	y8IW5CkGr6ZUdZYVk5ORP/Lrg=
X-Received: by 2002:a05:620a:4508:b0:891:a6b0:7cda with SMTP id af79cd13be357-8c389421ca4mr2991197485a.81.1768323464067;
        Tue, 13 Jan 2026 08:57:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGD/VzWtFUF012GOVfTS2hWslL26e4LFDs4fm8YOUqIn+Z0vpR8oG7HeQedj+KqHXV1pPkbog==
X-Received: by 2002:a05:620a:4508:b0:891:a6b0:7cda with SMTP id af79cd13be357-8c389421ca4mr2991194385a.81.1768323463585;
        Tue, 13 Jan 2026 08:57:43 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b72af5ed2sm4788677e87.58.2026.01.13.08.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 08:57:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 18:57:26 +0200
Subject: [PATCH v2 11/11] drm/msm/a6xx: use new helper to set min_acc
 length
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-iris-ubwc-v2-11-4346a6ef07a9@oss.qualcomm.com>
References: <20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com>
In-Reply-To: <20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1349;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=h7MMn6eoIT/MLTtBQ0NByysAANWVyaCDgHBC25L6vPE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpZnl0qQzEujC0Os2qq3L19Z8ETx14X5sDCLumN
 QrOk+2NC6GJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWZ5dAAKCRCLPIo+Aiko
 1QNbB/9KFj3Ho6JZZambhNWCFaRf5CMzHvKhgD6aAHu/3jrbNWTIhWCZEZ6DHPQ6+581Nfl2fBj
 ViJ8+XB6bNZOyMTaJjbOzcvjWXi30dI+b4P2hH6cuJjkyH8BPxAMbBMQ6i4bgLZzYCYGEa0lp/N
 Z6WvrkerxNaudzOyUcJwlFnoLhzy/Ehvy0bSnKIO6AMEGlWbGjGSVZBaQjd7jp7LC/j3GlGhndR
 Tn35YWUmeO+YHWngHqxDCxEWf8qZDMgq2R0JNdeNoYsZvPcfyP9+UaXIm6IDzoMJwLDeeeJGE8o
 7am1BUVE1uZ43IdeV1qn8nBJTqu+EVGZUR5LSraprkj8zXjp
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: yQppLxg1aArmaARMTc8XcEhAfy3bxv8y
X-Authority-Analysis: v=2.4 cv=ZODaWH7b c=1 sm=1 tr=0 ts=69667989 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=X-e67srwgh_QgMMAbO4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: yQppLxg1aArmaARMTc8XcEhAfy3bxv8y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE0MCBTYWx0ZWRfX9g+3fYTW+d7o
 MabfOW6Uaqo8p8LrkCOLaRpHR+pYyyhEnNkwAChPTO1HxYa3dl0XBsqqMBYJh0+vGvmH3NzTxeP
 sYWsZkUZ+rGrkA+S+HVUDshUkt3WsiwYetsT/kWhcWmtucjVF+i6ovWG/Utvwv14kVmBv7aG3I5
 DOn69YhJ5U8yYWr6oRJGBKTCahkTFKwoASo/rtHvtl22N34Tbzt8lNnrsXUrwAX1u+lAasIZuRg
 CUEEy4qNgmVo4Jf8aK3U6wEd9W2qXsgLrH2opqqLOHg9NF49UJh0arDOdMnrTiQFfewz0f9FWoy
 NpuGQUdlIuTe4qld4uBaSRcTRpcB6+SIUjlJ6/ICO6E9BAUpUQJCkEaXTxQW6zs15Rstb3S3K0N
 w3JIMEh2SP9cHk7Ctf4aAd4s9W2wWilh+9q69m6zEfD9AroXYuzyoVvt2nBbSbk9EC5aborhNdT
 S2dy+TCfn2PEPDly4sQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130140

Use freshly defined helper instead of hardcoding the checks in the
driver.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 2129d230a92b..04de4d598da0 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -820,7 +820,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	u32 level2_swizzling_dis = !(cfg->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL2);
 	bool ubwc_mode = qcom_ubwc_get_ubwc_mode(cfg);
 	bool amsbc = cfg->ubwc_enc_version >= UBWC_3_0;
-	bool min_acc_len_64b = false;
+	bool min_acc_len_64b;
 	u8 uavflagprd_inv = 0;
 	u32 hbb_hi = hbb >> 2;
 	u32 hbb_lo = hbb & 3;
@@ -828,8 +828,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	if (adreno_is_a650_family(adreno_gpu) || adreno_is_a7xx(adreno_gpu))
 		uavflagprd_inv = 2;
 
-	if (adreno_is_a610(adreno_gpu) || adreno_is_a702(adreno_gpu))
-		min_acc_len_64b = true;
+	min_acc_len_64b = qcom_ubwc_min_acc_length_64b(cfg);
 
 	gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
 		  level2_swizzling_dis << 12 |

-- 
2.47.3


