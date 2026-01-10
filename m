Return-Path: <linux-media+bounces-50355-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E79D0DC19
	for <lists+linux-media@lfdr.de>; Sat, 10 Jan 2026 20:43:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9609C30BD6C4
	for <lists+linux-media@lfdr.de>; Sat, 10 Jan 2026 19:38:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AA942EC0AA;
	Sat, 10 Jan 2026 19:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BGIbUD+g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cKuKCwdi"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124972773E5
	for <linux-media@vger.kernel.org>; Sat, 10 Jan 2026 19:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768073898; cv=none; b=AVaKX80nHsVSqw89Mt/JRIv2WcoozvITAhJK99lQkxRb2vHOcB9+UPOv/CWuqeo7/T18nAoIYEJUZDyi25q6pxiNZyKn3W0FTiWbt+ndUrq0G9WCZY2gzUOM1xdcP7/cY3orld13A8uPNAquh6/+0Em9PEg80z4jWbyy0qdi430=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768073898; c=relaxed/simple;
	bh=mAfr3Sv0Osg0wOtrPrsuwPv22YVUtw2MtmFVrPEbyq8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uMHE9McLPKj8Gzrrbm8Gf3VPEezxR1jo/iAF240raAjfHJe2ZfhLGrXk3fa/p7jBr9rPcLkqjR3W+WiXVtoLnWz7FuO3wyahimSFB+GWkKfLPcwM9JaYMUICrKoTib3JOqX4rcRNJYFCELPNHOfMCi5G+P02hioOS7VjAMdLv/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BGIbUD+g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cKuKCwdi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60AFXO353582993
	for <linux-media@vger.kernel.org>; Sat, 10 Jan 2026 19:38:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3MZnpYwI4AmU8ANsdt4IQetHLgrS69gpAaiV0A4L6G0=; b=BGIbUD+g0rST4H/0
	s+fwuFwEO+V7UWy9ZYxzanQD0tevxxu8zdc5G/CXdCLVk1bCRPK2GI1Y/f4lZ1MJ
	5TAnuANtmUMfvUmbmEFOTrVI5g4uPTVw1cuI0dL5XLqYySOgH1M1fXdKY0KJiLeW
	YMHX6jWZsrxFMs5a6TFAnolwIqs2BGtnVbarfXXLx8urJrVdKBxdxVHikPf6HApK
	jDpq0203gSs3aIfvOsiAmUJqSJU77qCRQbfEozXUpY4f2QJ1RYYCbHNzokpcZ9HZ
	288QB0F4J8VDQ/mJc3xB3Ko/1r1K8lFS9dTqA02wpP1EAl5dAtgGm28OFKRHDnoe
	vXhE0w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkmem0pmw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 10 Jan 2026 19:38:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2de6600c0so1440945885a.1
        for <linux-media@vger.kernel.org>; Sat, 10 Jan 2026 11:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768073894; x=1768678694; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3MZnpYwI4AmU8ANsdt4IQetHLgrS69gpAaiV0A4L6G0=;
        b=cKuKCwdiARzAK3qBHEpRAPnIuq6KLk7EAchk9gejJHryi2h/wKzNvPo6x5Mtn8JcvX
         f1nxAUAOuXhgnGqLJQO9ebSYNELiaqL+cJi/AO1YSsigO1PBznmyt0WP2RZZNnpuzhm4
         Yg/m8vvUVQLd2I7xBgrHdMRYJ+jUMx6StpGA8ECku0axsd6VkASjQvVxdiuNb/lofPfl
         Zb+mTcSCfx0YzMz2N2PFRZi91eIJ3j60bKdoKmPC8zUcChb+nF9RTUmdKmo9Ei3XjWnM
         IRmP94JlRluaYNq9Wwx7f7qON4V55A+8PPnmavoPN5wyRacxw06g6qCYBNFXrq4KPENH
         tPEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768073894; x=1768678694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3MZnpYwI4AmU8ANsdt4IQetHLgrS69gpAaiV0A4L6G0=;
        b=N6WD2HdCEQ4nBPSiNf2QSPEDxMXx/6G6zUizN9oyJW8j+bohrg0Q2u+6GH1+q3Q4ra
         9H9z+b3yGBKBws+iYUByjqZF9uf/dWJoJWgCyz1pLpYhVgbQaa6hi00NSTbqTKqies/N
         NL06hB5XUXDBNtL8AbOA4+5MeqJuzr2vIs9827J9J1XqGYiuEN+GIXRlJ4qFuycHi5ea
         j/acH4u3HXJxaYRY8CJMX157sbibjfjhjUt8v66Aj/RCiIJ9P2QGGaF1Ltf3kscGF7s0
         lhNbPDYviae5IBaxc/5ZpG8CNUf4n5S4ygZJTaehF2/KQ+L2o/tOg08LVYv1StwG75Na
         kSzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXK7pCigFgwG7h7uEyEGeA6+LgXHRVVo+E+cDQHM45ZUBF7u8WQJzVTHZwQ9EEGx526xVIqBDcWHZT57A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvNzizffspThkn/B+VawpcjGXH8fNS9BcpIVZlS0hx/rR1SAU+
	R+YBrr4I/tjM+tosnR+7jRMrZnceZStg5b9AdebCNPu5+fwkdRNBPJZF7k0HkLaT8t5OxH8NIdr
	LzGgIm+NjxZpT2n3ZoDof2A9pnVkwkhdMKc1OsdGYk9ImcJbJ8Y9EfdB3v2F2BAycFw==
X-Gm-Gg: AY/fxX6p+KQo3O+ykMIlXT+fMBNq7UOisej7fGI1+ITUK1rFhMSJ2lnGIDhd+1KyvfE
	OBVeR+Bkntt3XU/zQSIIqV9s+2WoTLYvJWkwrFUwwARJuzF2Zh/CTZ2gWHbcz6PomaslyqDy9UR
	YEufkhH/fTqxjslzeuZrr00GaFfa+++bqeM8KLop9NKE7yb2fKTHKmd5vK1zTEjsPke1nj36siP
	1Rq5FkeYPAEhgo5aWUSmBBM7EYPf7Q3dTo+L7V+qW9GKFCOr06qzVO4fK9OYQE6rSRv+XRPOL6C
	+B1mwc6/n7tCF9K3BtAMnNg7Ln4CBnANz+ZllfD6zayYgrnrSuW17jEyh6AQzCFaLFGrEN16WTO
	sw5OYuX9NBmjG3//wIeMUU0TK/ncOShchZscps7f1u/A1fap3hr9I/2hEDGinSjfz8qozdSWUvd
	Hf1c+0lgwG1OKnYbtspI4mksY=
X-Received: by 2002:a05:620a:4607:b0:8bb:a346:8c84 with SMTP id af79cd13be357-8c38939268amr1573221785a.30.1768073893660;
        Sat, 10 Jan 2026 11:38:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6d8vv7wylVfOWH9XQwmhfMHQFtcvp3+FKXUkq+XGELB6EtqNJ4uUpNaqA9VrR4pcXeMsvqQ==
X-Received: by 2002:a05:620a:4607:b0:8bb:a346:8c84 with SMTP id af79cd13be357-8c38939268amr1573219885a.30.1768073893190;
        Sat, 10 Jan 2026 11:38:13 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d0f6absm3539700e87.42.2026.01.10.11.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 11:38:12 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 10 Jan 2026 21:38:03 +0200
Subject: [PATCH 11/11] drm/msm/a6xx: use new helper to set min_acc length
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260110-iris-ubwc-v1-11-dd70494dcd7b@oss.qualcomm.com>
References: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
In-Reply-To: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1288;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=mAfr3Sv0Osg0wOtrPrsuwPv22YVUtw2MtmFVrPEbyq8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpYqqUQ96O3LFNjh39OwqvwVcUbZj9dUUmpcH1J
 kW0A1CPy/eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWKqlAAKCRCLPIo+Aiko
 1Q2vB/0cdBzIwbndH4UQREwf5CUHqbknV4FAHJoUp5nO2uiqTVR8KYcDVnNu/4bKaMWr9woUW8t
 bF33MrWi+KMVp1eVQm2pX1121AYflOiZrCRIvHZN2hZYrurraQMn2mDTXnhU+m1NC9KhXxBwwRv
 PudYpa2EfTtBI+yk3QITE49ai9QD4EC3nKu6S/PgWjUvvcOi70Q+jtgN5iNkPjO9XzCikktzLfT
 lhv8kOuKWh2o3wZqkIVUz6wACkmV0EWKGfSFKdv70gYqRh6UQ7CnlqC5llSFJM5IX2vdNI0B89e
 CmzEyN6Wq3HSblaiiSn6JxcgRLdg6ggEL3OfDMOpM8ZYyg3N
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: D0DwP99c8W1RZp3o9436JAujgxzRCWnV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEwMDE3MyBTYWx0ZWRfX7kiPHUTGiwNG
 DnnSsYfC1b/GCdINXKxm7Y1T0hpxkcsBisEOAnk041WxNcWt2QAbEtTtquKm9PtRv1ax32lmXpI
 CXkPsDEo1rA2/fWuUXM4ivy67AfPsPeQHF3hq3ne1l++6JgiHFEKUFzdx0gOSWAImLuF+FbQKgs
 S1HiAB3WkSX4nXiYv6UrDw8hjzJyuRfiCPqVtfOIXL/VXIuKzAv9hsRpMuQrwz7pULugkK+3SLb
 4d8bq1F82lEkkvBiSmVNjgTFbcQENmstg2f4r48mC/syTF/mrBr3p4ICDbqU0VdM1avmO3NSuF1
 +LVfBDbTGOGBu4xy7q8/FuEVACo8lT5hLCi41WY/Nrvx+OyuVfw5oEHjs9i0zY3KG8cqK+t9zD+
 oDyz93byo8O7jxXvJfLwtqzWWhwe3zkdM1OpdyEH4m4NZiJxR6UvUsan4ZpnLZb159kmD56rrYv
 ZAk/SXQiLMWdwbB2VVg==
X-Authority-Analysis: v=2.4 cv=Z7zh3XRA c=1 sm=1 tr=0 ts=6962aaa6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=F1F9tmq6QbaLjm51Hh4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: D0DwP99c8W1RZp3o9436JAujgxzRCWnV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-10_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601100173

Use freshly defined helper instead of hardcoding the checks in the
driver.

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


