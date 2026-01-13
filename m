Return-Path: <linux-media+bounces-50589-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF08D1A7E0
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 18:01:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5FB36309454C
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 16:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 194483803D9;
	Tue, 13 Jan 2026 16:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oJoJoRDU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jlG+dVXK"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5853F34EEFC
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 16:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768323469; cv=none; b=bczOZoTm7vDkbWi8jr+1swPEXfuUoinOH+zpYCx9aHoIxTF8/WiqDPYPJehesuYIXyori1SJt4XYns0aAsPVgP9+N94ePOy5yjM2ZQ5zx5cYvfgHvOYz4I2RKPEglauTni3v0s6bCKy7dMQNzTzYlKXpK4S9AExcs2uUEAYhz5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768323469; c=relaxed/simple;
	bh=nHRSUklijPQc2jdlENh96HtWcCH+DpPknCnBLECuzqc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d6/7cILCIBO/XAeJpwn/NYGMHnFkDbm2Xpe1zNQK28nyKIW3Z/tQoGxLILY7mAqnEqYX+U8jN4PIXUu2aH6rYcOiMIYchX6ahSzd42CDq69CfhExnJNqSJ4fFDT2lq7DZ5UJoPVIZ+FRyUnNB3tJoSq7VDeHg6GUhy5FRhI+3lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oJoJoRDU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jlG+dVXK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DDD4cw3734999
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 16:57:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T3jkI5KBlBqmZ2HnDU7wrb/gTC/agtlfdGFSMyUfGxQ=; b=oJoJoRDU7g0nU9To
	pAqlFfT+VmgqzUJH5AQm19gDy6AeQePrHTsDgWCnkWVWBFMudpoQgHl4ozDbSVly
	vi7mRXPKjjF3RR8iuqnJrMq/F88ILHp7Pm3P14RqK2olxueHklf3+SZAh0+QBzmW
	oi9HSTKU/jwBhMeQnCpJwMPdwlYYCDHVdDE5j4fm6JLHNUp217U3XNwGSUUZd5y+
	zr0+qGdNwLMv9muD7hgsSkQ2x6Y7kXbMoRCd9M/WwB5PAxqewKFVpGcCId0iAdSK
	rv88DJI3VNHvISszUwN/kuuuO4Qh/6Jok9MX2rbjlww1NEA4cva30xbDsgzxQ2PG
	/PPyaQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bng87a3ev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 16:57:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b24a25cff5so2455378585a.2
        for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 08:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768323462; x=1768928262; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T3jkI5KBlBqmZ2HnDU7wrb/gTC/agtlfdGFSMyUfGxQ=;
        b=jlG+dVXK8/h5A0e114QsibyVjfmtmu5Qdl37VNpy8Y3kQN6ZvBjXiNUfsDXL4Mp9fM
         +fZJB010whrVn+3y0yqS2EvNYeJrE3MOo27oCdIMT8yLXcpcV5AwODMmtKCd8r2aVTMT
         Rk5Y/5dZLUHgEgq4Pbquk2ssM50txtxIU00uit0frciCB7LUESmkhmYnf6Ql4dbgtR5c
         yxFL6tuBzDvafdmBM5GxoeybIIvoRK0TDDqM75oLw6MA5yWOPu0yTUBIpN2tLs7IwDcC
         3+x/80mUOr7YffDrq1yNI0kw3QiCu3GEsE3Bu6PoGOpchqKy3+pKV7EU9K9TKnFmeSeg
         4HIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768323462; x=1768928262;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T3jkI5KBlBqmZ2HnDU7wrb/gTC/agtlfdGFSMyUfGxQ=;
        b=DanEqe7pLZfs09buzWl8XJDERmm5JuSifPwEqVJkaeNQQUYQbAxTVRSFzFKMdrZepH
         3txkhf84nW10tn8GuhwM9ody8iG4M7Chs394QME/mNyw/N3LSgXRm38C5OQZxKS3bB0l
         zhegOB94V4VYvIDaOkEfLUgDu1K1A5Hnx2P7bKawS61aR1S8ycaL+Iqc6jCKoia/IAP9
         b//fC5AnU2f9SBXdYEcLPMVLEW3Y7jVyBuk0OTY6fHycall9/4IirCTmW5EUCZsJ5YbD
         sJGy6ozb2SEXeIusTdAckoP0wKOLdf/E66bpY5oU4s3L4Lfn8++KdPxJ5XfDKdFdsDK4
         /dTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXH10EBnYNzZV6dapsxdahFmyhDKG3N/6EID4vsGHMLMPNZAfr07m2z1cx6nN22ZQLPe6zz3uKM+nAAQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YygEM6gCu45SI2dVYbbaRrH4OA9Y7n7QZ0Dp9FWou8kiLiMCNqU
	I/+KvU4y2yESDZljK3FK9BOBJGLg7zHzJuu7FKuB7siLcSaKrkvTPYRKF5VME28yBe1+S/rTDgh
	h9VSc5YNuuwa9HKDdD3NOuOUy0NLLs8LbQadyXijNDRV4alNG1OKKBlSAvwJY67Ynog==
X-Gm-Gg: AY/fxX5YcSPtqHae4l9TSW2gddXQ5dplNgk48mlDFoh0sh24Un6S0W/oAeuZwupTBRi
	hkMJ0ADOHyTlHvUgLlbMPhrIEDNeSWze7R/Y3ckbVf1V2yD7PZ8+lZST0EP/ETgCfbSsg0WsUwT
	8IsVj+uveEBTJurdLy1UcsYBr3ToIvvXgFsccGjppJNZb9E04TJQgtWf5Woi13sFkMRU6UVhl8P
	zUJSnei0uvhgLG2+MtFGaWtoPVu9g7lYp1IVu1XGca7Pxe0etDS3ylp9KwlKpFaoXLJsO7c6o2S
	eBg8jznuhNBY9tpc68vXb1T+LNqsMbAK7hI4JLVz4ByU+zi6QYOHgxXUCFJJbZLY2EE8/gy8p69
	msO3fvmZr71Q3fRPJPywLcPaJ7wW655SzvQQ0yLr5OHp2YLR8PTqq+NjzErMYWWUARJo/PtrDB7
	j+ur+jmKsbeqgjf2ve79CsROQ=
X-Received: by 2002:a05:620a:3192:b0:8b2:5df1:9341 with SMTP id af79cd13be357-8c38940e76cmr3076018385a.75.1768323461695;
        Tue, 13 Jan 2026 08:57:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFixxGv4qvV/C3gFxLRBxbhyay69L0agbIGsQIgfJHuYPpY2Dfb0r4yCe+MUS6dHgi/ZThQ7A==
X-Received: by 2002:a05:620a:3192:b0:8b2:5df1:9341 with SMTP id af79cd13be357-8c38940e76cmr3076013885a.75.1768323461140;
        Tue, 13 Jan 2026 08:57:41 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b72af5ed2sm4788677e87.58.2026.01.13.08.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 08:57:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 18:57:24 +0200
Subject: [PATCH v2 09/11] media: iris: drop remnants of UBWC configuration
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-iris-ubwc-v2-9-4346a6ef07a9@oss.qualcomm.com>
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
        linux-media@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3161;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=nHRSUklijPQc2jdlENh96HtWcCH+DpPknCnBLECuzqc=;
 b=owEBbAGT/pANAwAKAYs8ij4CKSjVAcsmYgBpZnl0R9mcetWZiHcOLy7ag03H0ROOXYvlfi50m
 sg8vGsT25SJATIEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWZ5dAAKCRCLPIo+Aiko
 1W2nB/j4AoOJ6aWIMhTNvzAaChzogMOBVmDThqW8wMpr38Jm3Zqp9gIhlYQR6G6tiH2Dpmd6AEE
 DVC1pO1CVJvYpHOcHlUgqOsgwgwDmutuplQSXiaeVO28KenheoO56JaZ9rkguHarBTtYYwz6t90
 PtUENrBooP3UOqZLc4lS3aRKUrfDWUcKMVsQQJxLQCxj43t3PfOFwltjRYTWmPWYeEPNI0UcnrZ
 bBfI+ZE1gaCONR1ChxhkKdGbvVfSu11Ugutnfh07dmwjH4y9OQRC5osKfD2zXoztg6g2EeCkOOG
 WleBTPbRNl3TgFfVyFdLnJoU3groM9VuEaXmetn+cAy6Xxg=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE0MCBTYWx0ZWRfX0jJ8xwG6f9HY
 GSObI4tGuhNTHocWAr9p/zyawu0stVucG7edpcXeKSuGjKJt8EX38dxJ/S1qrPSJ8Q3JaEtm4F1
 tUOPOD5txIXqG1sDO1RfTtVEEbWmbt/EYOrg9ISfMlz9pTpv0hC7tjtHMFkczOvzGBQujLJNrh8
 osfJYUwzgqNDm0MwzRKT9sMkVERmpC6cu6BYbBwZ0loNF1DyjiUn0r6mJS8xiQex6g+eruek7xB
 Uy63ljGa0UhL2yPlCQ6zDb/vMx/EQ711Ev54RKOrH43DOvd4+3qg/3vIGoe1iziDel0JJLkyz3a
 SbQxec1S/9ELI6fQBF3pGnTe2OOw3ppJqBoC5qGsMNq7eVnIM0lOMLYGhLG16EmJkvUctnL9pfC
 vmTP5CI5Mg68kxUPNUbH8jJ5aMV0MXGdLbMHOWN7qx17evIbqq2WCSm2TiTY7sf0EbYDxBU183T
 59Rw1MclRJGX3Mizybg==
X-Proofpoint-ORIG-GUID: 0cBy0hDBrPJOkYxBgGBTGaEFLXTB9MFu
X-Authority-Analysis: v=2.4 cv=IOEPywvG c=1 sm=1 tr=0 ts=69667986 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=2Ss2wluK-XfGWxNQOroA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 0cBy0hDBrPJOkYxBgGBTGaEFLXTB9MFu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130140

Now as all UBWC configuration bits were migrated to be used or derived
from the global UBWC platform-specific data, drop the unused struct and
field definitions.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_platform_common.h | 4 ----
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 7 -------
 2 files changed, 11 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 4abaf4615cea..3b0e9e3cfecb 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -71,9 +71,6 @@ struct tz_cp_config {
 	u32 cp_nonpixel_size;
 };
 
-struct ubwc_config_data {
-};
-
 struct platform_inst_caps {
 	u32 min_frame_width;
 	u32 max_frame_width;
@@ -218,7 +215,6 @@ struct iris_platform_data {
 	struct tz_cp_config *tz_cp_config_data;
 	u32 core_arch;
 	u32 hw_response_timeout;
-	struct ubwc_config_data *ubwc_config;
 	u32 num_vpp_pipe;
 	bool no_aon;
 	u32 max_session_count;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index e78cda7e307d..5c4f108c14a2 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -631,9 +631,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
 	{IRIS_HW_CLK,   "vcodec0_core" },
 };
 
-static struct ubwc_config_data ubwc_config_sm8550 = {
-};
-
 static struct tz_cp_config tz_cp_config_sm8550 = {
 	.cp_start = 0,
 	.cp_size = 0x25800000,
@@ -760,7 +757,6 @@ const struct iris_platform_data sm8550_data = {
 	.tz_cp_config_data = &tz_cp_config_sm8550,
 	.core_arch = VIDEO_ARCH_LX,
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
-	.ubwc_config = &ubwc_config_sm8550,
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
@@ -852,7 +848,6 @@ const struct iris_platform_data sm8650_data = {
 	.tz_cp_config_data = &tz_cp_config_sm8550,
 	.core_arch = VIDEO_ARCH_LX,
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
-	.ubwc_config = &ubwc_config_sm8550,
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
@@ -934,7 +929,6 @@ const struct iris_platform_data sm8750_data = {
 	.tz_cp_config_data = &tz_cp_config_sm8550,
 	.core_arch = VIDEO_ARCH_LX,
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
-	.ubwc_config = &ubwc_config_sm8550,
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
@@ -1020,7 +1014,6 @@ const struct iris_platform_data qcs8300_data = {
 	.tz_cp_config_data = &tz_cp_config_sm8550,
 	.core_arch = VIDEO_ARCH_LX,
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
-	.ubwc_config = &ubwc_config_sm8550,
 	.num_vpp_pipe = 2,
 	.max_session_count = 16,
 	.max_core_mbpf = ((4096 * 2176) / 256) * 4,

-- 
2.47.3


