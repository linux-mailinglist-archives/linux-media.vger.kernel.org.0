Return-Path: <linux-media+bounces-50835-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AD175D2D336
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 08:29:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5F84930762B6
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 07:28:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13B6A352C2C;
	Fri, 16 Jan 2026 07:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UqFTB/gk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N+3x6eQc"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3166D34BA24
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 07:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768548470; cv=none; b=Wsd0j0CYlOACwoX9azT1W2F0Tn500/WZq4UvRdSvcuIYfMXOcgUFgKvuGF1V2xfQfQlHFbOQufOV/urR0X5xWeP5ng8qOJ1mWjuiqvjXpfbGmTeTCX2luKuOUx4Mhmt+Rl9ncPMf6/IiCBlLUXhvPzEvDmjXqHyzw3lbXRw/xsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768548470; c=relaxed/simple;
	bh=NrDJ4X9mZsaFbnaH7GQn0AlXZA75xOGKUcWuV9qGUhE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XPS/UkL0L8ShdEyC4/hRDsvftCQI+nm40hjeg9LcrsZaIDoCcm5lnF5PuLmTezYXe0upP99W2mCqOE/I+kDL57a56u9JKdRmaXYGIuTZLxs1d7NiwUglMvhqk1KiOREKTjn1OekOug9VoOE8SV0BEKNE2Fdcg3nVfUGHa9gQCy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UqFTB/gk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N+3x6eQc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FMbOsE3714330
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 07:27:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zJCnfFwC3vPDsJEo8QDX6Qy4iwhrLPmMctTCzdExcZQ=; b=UqFTB/gkSqAqa4vg
	bOMjaPzAclNHYHPxJbbrlhngh6bPPNfU1cTvy+xVuvgDgTagtCeLXrQVzo5JYUeB
	AnJXAAK2B5VOh4NtNjWgwfdFtXTywQYlGZHUtEqHjK6fHQhoOaST5lP2T6r5TWpW
	QLNDG+Vv7x7s35ZNicnEbkKxyL83CQZV5vKls9Wi2vbYEp/vCP9MyMSH1bZwQHFZ
	6Or+TgL7LIlLQh/GKtIuvJjfSzQdrn5WqT9qR/AK7MGwXaJH9xmQ9YscmU4jdBLp
	w4XqbjdPXeuFbEG9GjOsyz7SKusNESEERIv7S1PN8e/hM5sVeNmE8pa/6l5sGAkX
	xteTAw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq96p97g1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 07:27:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c52f07fbd0so786904985a.2
        for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 23:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768548467; x=1769153267; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zJCnfFwC3vPDsJEo8QDX6Qy4iwhrLPmMctTCzdExcZQ=;
        b=N+3x6eQcpisErGItsV4cFrKZSLECYwlbsQZ9p5KoLyIR50sGIaVBEE8x6BzqVEU+/U
         TnbLZJ1E0IQDw5ZAp6bpHvv/dufvLk/2oz02opgkSYh/CYnaF5TZbuL1MfIZLmTfdkZO
         8v1jW3nq5PYaMUB/ZR/JMn6PKMsjKbPyphqVAHLwDlZ2kA6xvDqB0GnzJa0fmpLtxD6C
         SCPVSfcY8FTA/04CuQbbuq+GGrv1qVeDkWPDPwMHyoL1TNc7cLFSKGUPnypoFM1Dj++O
         3VTgpu7yfUSAQrGZCY7QQbTp/R2eINl4lURzyn2D6mlCOEtJBdL3W3iVMjHHdKQF+5u9
         Go/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768548467; x=1769153267;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zJCnfFwC3vPDsJEo8QDX6Qy4iwhrLPmMctTCzdExcZQ=;
        b=OizFvebr87MOc5Ef+VD0RXQXU/86BhidZoBnS49Cr5C7Vo7FmWyPkfrQU6psJGFaJY
         Rdj2uEHTJfjcRH9+4A5rPmO+jkzeufYok0MKGV1acUJpkb2mwb/cXBBs/tmBUmDRmMLQ
         Ysr2DQOvaEt1g7eJx7V+jSmU9eRmJyoyr8lgHp78t5JulcUpp/aH1h5QVpay2jewxuqm
         nImq0w897IcUzhDSGUhvXoRiIASMZJ5tDtBwTfvOjJ3zEaRaWHq/KvwoQwoy3EgRV4Uv
         93wz+f0wNklvS59eHr8oYmdULBZwdVt3dzWemo6e5f++/kuAECI1+gA2zN9RzeDp8uMO
         T1Cg==
X-Forwarded-Encrypted: i=1; AJvYcCXUAlhF8JIeyrWOzUQwdK07WyUlADXNpqgCBFuUrdZapQN0rFHCztUrvZ82bTQK2RqRagMSczm3QZe0jQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtYEu8OmJqpS4EQ5a27ehZLJJ6RXnMHYqgddGShA8DFn0X6jAK
	N90OHRprdmUbBlc5KJNbApjHqXHezOC+9TY+SPsfzCrBOfhfcwE528/Y7jhM2r0UMugt4AXR9Wm
	EMhN+2F20rq7pGsPLKNy03aRXWzHNwCwGUhSWDVMepOMIRm7NAvFq0e9BvFiUUL1YFw==
X-Gm-Gg: AY/fxX77P3pmmmNHNRPanQOrF6HBeobu7RlpEEZPn0ZtXn11IvZViATagpdih9G49zX
	UZOxSgVh7AFFUG257JB15OHcEt0WZNlKnMELIQeVxqREwe2AJsoD61TrAAyWLqUEt8yBlQAzbXH
	aivDPD9157paMJzqe4MgNQGS3E2wqqBQ5D+Lc17yVPDxSemCiQ5Wbf324ko1d6QJC7ALOW7czxf
	oChhYqRTZPEKQxqaBI3fiClWuPvrfK+jHV9IvKcl639Z0elxyJGrdfHzhBaomaRfFcvcfqCWu6m
	kbBw94woTlFWAc1druO68Bt2NlbEqDDAi8t2fKpj7KoG+2Dw/oK9EVj8sUcMgM76nWSdTs2k8g3
	4MYJdfoX+6Z0HHgZ41j6SjeEvJD6DBkK6gS5fMAytM+xc8bIcKvi6/ySgxpAyy1RhGcwUS4kfFn
	VLbGcRE4Z+7hoZDkfOGQWcEi4=
X-Received: by 2002:a05:620a:1a94:b0:8b5:e783:933a with SMTP id af79cd13be357-8c6a69623a5mr244570985a.77.1768548467068;
        Thu, 15 Jan 2026 23:27:47 -0800 (PST)
X-Received: by 2002:a05:620a:1a94:b0:8b5:e783:933a with SMTP id af79cd13be357-8c6a69623a5mr244569685a.77.1768548466707;
        Thu, 15 Jan 2026 23:27:46 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf3976dbsm516941e87.66.2026.01.15.23.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 23:27:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 09:27:39 +0200
Subject: [PATCH v3 5/9] media: iris: don't specify highest_bank_bit in the
 source code
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-iris-ubwc-v3-5-662ac0e0761f@oss.qualcomm.com>
References: <20260116-iris-ubwc-v3-0-662ac0e0761f@oss.qualcomm.com>
In-Reply-To: <20260116-iris-ubwc-v3-0-662ac0e0761f@oss.qualcomm.com>
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
        linux-media@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2393;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=NrDJ4X9mZsaFbnaH7GQn0AlXZA75xOGKUcWuV9qGUhE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpaehpQM4ilw+6GYwUK40BKUo+N7LqRwkaFjElo
 erSoDAH75CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWnoaQAKCRCLPIo+Aiko
 1R/LB/91YhzqEwbPpRYGn/20VhZeN4fQOegNQlRPhGRZjQOErNtthcy8er5gqD06knYOtO8A8O2
 3QFIxiibB0nYOfwl5WV8Zx8T8oqZTA9Qxpl8xsRz0wT6VEg/rGv8QUCW3oVjVC0aV6OB7Vux/bM
 YIRWkLuViBKro/sDvpLzMZjdNF1EZYbEmBt1IfcMYJBVmvV0mzMQfSrfE73feNAl43/D8JpsHev
 /hEmBA4d4Iw2ryo6y/hS8Mf+v5W67zd1jYWJN6MxLK0/PneyK0UtYElwWpDgb3vRS4FUVPSs/sp
 sYkF9wKPy5EFSCLz8oE14TRRS0xgHdQgWEs8vedgvqPhXQnL
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA1NyBTYWx0ZWRfX/fUaVzEcBIbW
 pkmKkCfrW7Shu2WgI11feWO7KZlIGTS6cx7CqhKax1NjJ9azbHWh1kFATl8uiC07tvpkAbTd92p
 1MNLe3EYMDD6msCLSATBx66f4r0TvfPFeKTxhrw5+tEPE7JnbINRIcDLs9nihC3JYUySqm2pQMn
 Dsog+OD9fz1cCbmXvrSuA1n4djhb5AtPMcsWzbEaMhXWCdPvV/jzkQuHPjNTJ4QPCA9TNNTcLjl
 DjxEUuJf82FtSafc2oGCTmUu0qXenVfgHPKouswEBIsCl31kZsqUQB7jFKDMwwVHy0SANceI+X9
 K6iOpMHs0wn8Vd6FEltk2FTE1dQ31G4SV3wKIduyf8UT5vB8J5KSuKyGq2Chfv8jIPo2BMeaUi7
 d4XiwOjI+Dw8m9JZjpAFhZAHKYF6bhAk9itNStoTZRsa7sroDzPVdROshMXOqrBRy0zuU6xWH3t
 c6HR9UwvcBhXH0d2eCg==
X-Authority-Analysis: v=2.4 cv=M7ZA6iws c=1 sm=1 tr=0 ts=6969e874 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=2VIzI6ABkMI1kr12n-IA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 8Mx3o_kujtYtULwB63ELWbL7j--zkGL1
X-Proofpoint-ORIG-GUID: 8Mx3o_kujtYtULwB63ELWbL7j--zkGL1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_02,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160057

The highest_bank_bit param is specified both in the Iris driver and in
the platform UBWC config. Use the platform UBWC configuration instead of
specifying it directly in the source.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 2 +-
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 1 -
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index aa4520b27739..6dc0cbaa9c19 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -160,7 +160,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->highest_bank_bit;
+	payload = ubwc->highest_bank_bit;
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_HBB,
 				    HFI_HOST_FLAGS_NONE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 3c5f3f68b722..8421711dbe60 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -73,7 +73,6 @@ struct tz_cp_config {
 
 struct ubwc_config_data {
 	u32	max_channels;
-	u32	highest_bank_bit;
 	u32	bank_swzl_level;
 	u32	bank_swz2_level;
 	u32	bank_swz3_level;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index c70cfc2fc553..5ae996d19ffd 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -633,7 +633,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
 
 static struct ubwc_config_data ubwc_config_sm8550 = {
 	.max_channels = 8,
-	.highest_bank_bit = 16,
 	.bank_swzl_level = 0,
 	.bank_swz2_level = 1,
 	.bank_swz3_level = 1,

-- 
2.47.3


