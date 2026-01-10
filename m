Return-Path: <linux-media+bounces-50354-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BA466D0DC0A
	for <lists+linux-media@lfdr.de>; Sat, 10 Jan 2026 20:42:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5727530A8882
	for <lists+linux-media@lfdr.de>; Sat, 10 Jan 2026 19:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49DAA2E03F1;
	Sat, 10 Jan 2026 19:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cM0rv2L7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dY1bRtD2"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1592C08B1
	for <linux-media@vger.kernel.org>; Sat, 10 Jan 2026 19:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768073896; cv=none; b=lJHlfAqDJ23Ophe/i27rpXsrm8BQsVvrshWXc33BYoL7DZcdtBQdrh5AOHC60dHhqajgXuvbnRjkiI0fyQfHMEC5ryqFEXGEKoBiraQ7q/7S2v2fTHuK1LlrGxUYwMlv+ixHDfXkBXXZXWcZ8n5mouOtWqizH8el/EpwkFaeSCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768073896; c=relaxed/simple;
	bh=yWAITFzIqCVqkhPtfTK3lcYC7LituzgMl9ErY9SPTQQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rDuYtMWom/sWH5Uau/ThJ+T49afZd1o0r2eYcD+90aOLIZWAPo0mqmDXZLGNz0IvkmRFLLqQAneJHnl4PmjL1HW4gzsDXhClA3BgQ/FIxVw1nQ/wfjBCbpcWbrUO78WX7VI2bh1FQ9zBOn8HletHb4zzymWUtSeEWj2drLxTBF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cM0rv2L7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dY1bRtD2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60AEwulc3511870
	for <linux-media@vger.kernel.org>; Sat, 10 Jan 2026 19:38:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hmMTvh72OFH8FK9hNkeC+EXJs6ndcsPRG+SpIhVihcQ=; b=cM0rv2L7FzHFwqx3
	5xsBMgokLqYubG/twV09VpVAINuUEz+vV6TQr6xCto2pGIxTSRegI5eQQuv5G9U7
	Of26l3Yydm/RRPmVXKgbRK4KDt7k55yv619ls1VxHlqRN9xJhpF6AIJD6jD3TF4A
	waNGPZHS7kh5EDzKH6QjCk4c8JFQpJcb66dx9PwBgSUOQtPww9zyX0sGwbVLps5G
	Rp5WeDxWROxJBUs44Ns7c6Uy8ijIKvqWRBwN9g1UnOFQ1744R2k9hoRfCnIBzTUA
	bR3k3cAkGycdV6UEIdgiiUYy/NsOyVepJsgNcAtxmOzV7olJFkhWMKTch929Ln4L
	TyDgYw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkmem0pms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 10 Jan 2026 19:38:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c2bcf21a58so1427655685a.3
        for <linux-media@vger.kernel.org>; Sat, 10 Jan 2026 11:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768073891; x=1768678691; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hmMTvh72OFH8FK9hNkeC+EXJs6ndcsPRG+SpIhVihcQ=;
        b=dY1bRtD2HRD6fw0niNkd2iW85nK6po9RArowVs5mxScgWTEcrU9n4yEu9okQbCAQlp
         Gx2bDUWcTuh2ZY28zWHYeVj1W+MnO8ci/pWU7Hk4Jyn+xMfNBzEAtM/Gdo+F+69VJ96u
         HZNokXUiIGbM2xJSC7SIBYNp+zldw/UBRo3kF5XnJucWfBHwAZubIWqVidX3iscIE6Go
         rvd63/4uahVEOHoEjmRZ7PpKm7zWUGoqqWlrSzWe2Clx26rd98kK012IeRY/iD+vP3lN
         D4x3KC6CYIiGGRbYDY4FVvE85kNugoAX28TUfVZB7QyfU98w+p1c8bNeV7+qtgnZqi/M
         jk0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768073891; x=1768678691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hmMTvh72OFH8FK9hNkeC+EXJs6ndcsPRG+SpIhVihcQ=;
        b=Xn1Kpx9eNfYMB76is4pIQ9zdPNpeg09kiMJmjLlr1cXP1BwmdSB0bYj04KFVDeIqaW
         JqYagv48Vc1xB2cl1XonkhgaMlumIutxNLo2nUkzWN7bXfk7ZtttaxnqqLGy8uoZrlME
         ieTfyWYlKlmjax6kBNUYbFN0TwpCqdFT31edEGtaL08Yk938/Z+FDbkt31+Ky1dBbb3U
         woxzcPmA5K5Hk/bPxss+AWclKDj70cWFd38a7UxcbjphcD+6vOUCywTgPgzrqWVGBSC0
         HSVton5TIfOjspAwY2jFeqyl2ZKelopQRpO4vJlP+pN+s7833ceVXubjp2F935QLZjGp
         46yA==
X-Forwarded-Encrypted: i=1; AJvYcCXuvjFHVUFF3xbBy46LYx75sgGIzkXFJL8MQxcoAYs94o5ckUSvonP/MMCEldH6PFUWs6G2Gir7eVQUEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyoYXdH0S6DkrOtZrm2ukA5QPvVGBH5mIeMVIsI9V+o5HSxxagM
	35aEZ3+AmT9KZzZ7N2Hawu7tuyCYsvJDF5AFB+grqvzYwYzgbyEruHdBbBy91sHY2WYVSl+XT2P
	1aNHMLajv3N4k0NkPsDfrpBYp8t2C4DRfiamZIIXHrebTj/Gkj8fs0Pnfb8+5YnGiPA==
X-Gm-Gg: AY/fxX6pjjJbdZsOdoufO8pIIvDbo8wy81D0AFbe6dpcVS0Z0JDrVM0jly12gEP0Ez1
	CsOTtrFDpeQ3Vh58iL0BGYyekmopEw3QvTnVXSejPEWbkevNi5Kc4B5d9f/Ah7d1WwuWt2+FLz4
	lN7yd6FuMcZi4a8I7FLk4WVMjV8cz35xVxhNN4+jba8azDXEBNqi6HgZwGveZDGurXzGkrLcMnV
	x/QRHQHw/eMP/GuwVVXvNoF+pM/xauMd9XRIxKWARFwMPFq2H0LtWdVKzhWClxz8zqywBP4XfU/
	j21QEUIep8RLoNb5JHrDwPwSBaYcz2rQg3YvdopEjk3UTNmUReDDMfrcU0l0NbdcTwSjwhxnkJJ
	RwwUwXTbMIGE0YaSnqIoCIvvJUS5FVAC6vtR48Y++i+gt1lEzZuEJkyr5ZZumhWHwaFCwwJMV1o
	kSxt/6eJfuK/qKW4kHOJAm7IQ=
X-Received: by 2002:a05:620a:1927:b0:8b2:e666:70d with SMTP id af79cd13be357-8c389408f8amr1840282085a.43.1768073891377;
        Sat, 10 Jan 2026 11:38:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFMsd7h31KX1mnTrGNWla1MwkNmRGDFHNZeJ1PT0MjzybGjjVFj5LqvVdzivB0mlUVpjdv3AQ==
X-Received: by 2002:a05:620a:1927:b0:8b2:e666:70d with SMTP id af79cd13be357-8c389408f8amr1840278785a.43.1768073890922;
        Sat, 10 Jan 2026 11:38:10 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d0f6absm3539700e87.42.2026.01.10.11.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 11:38:09 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 10 Jan 2026 21:38:01 +0200
Subject: [PATCH 09/11] media: iris: drop remnants of UBWC configuration
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260110-iris-ubwc-v1-9-dd70494dcd7b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3040;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=yWAITFzIqCVqkhPtfTK3lcYC7LituzgMl9ErY9SPTQQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpYqqUdOk1GN3B+fr9J8h//iZ8sbN9u3DK0Nfvd
 3L6vfx/WmOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWKqlAAKCRCLPIo+Aiko
 1bdCB/9sdjozx6Pz6/pggn/5UdIs4Hv+8ncK4PPaFiKEAwQoEaOogM/Lx9l4rUjddfcxllUL5RU
 7WhCAuVjAfywRtkD0x4KrNS0CZuoi7mamYGUZj/e7ThvKJvczCeGPBSwm9VporfBkQWrH0RNYn4
 XIHOpIv3KtwllwrylmYLkzMzFIRAxiVIQENxYoTBlKK9ez7bQbiA/A/FqqPq24BTWorAtJRm9MW
 7XIvyt37Z0QuSjsFg2LJyY1EAOxwdWXhakhpoW8npwKo3pqGRotjyqgiSqQwYMqAFy9WwFWv/mo
 xfKiM6nLtbrxaE5aW+/NlX1key3GFp8zh2QzYiG0MFKqPNAt
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: CWsXziYkquUI84qslaZ8zHkgvrf683z3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEwMDE3MyBTYWx0ZWRfX46e0k0jv2XdI
 XnrZXXMiXIMlKHx5suYjAkDJzWeB43/7e8XlGU81ttSipsVQP/q83Blm9wiFiM8aJmj66a0yxNL
 qImuJfyd0qA2mMPFGyHXMarhHbMQxXMq6k346vbHEjIP3P/ynf5Ejqr0etDMSCnKBhd7GDVtLYc
 qIaXgO4jm8mX/eJmwLNn+JLqXiiwP1RblYKwfOo8prx+yL9NwLJ/syDSp+Raz9LPbPJlesrG3Ja
 hQHjMy2ujw2wZ1mDRt4XuQpGk1cxdqfN2VUFk9oHRWykbgH+xWBVZ0bxj9/D/jOh2v+GuFf7xbP
 cZltc5aXs+s+yVgoNcK5chB4p95yA/hTc09ZX+XObXFFHrB/KxpukgoPfBmO4wHy7wIBF/0qQSQ
 r/85u5UFgiDQbZ9zICbKUUltMa4NdCLqyiWtmt5TbkJkqpkpjR88CTkNgWK7lBXF6ocGYqF9+MZ
 PY+GnWFL4WqcmgjZ84g==
X-Authority-Analysis: v=2.4 cv=Z7zh3XRA c=1 sm=1 tr=0 ts=6962aaa4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=1FtADzHzBfM7Pcki91sA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: CWsXziYkquUI84qslaZ8zHkgvrf683z3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-10_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601100173

Now as all UBWC configuration bits were migrated to be used or derived
from the global UBWC platform-specific data, drop the unused struct and
field definitions.

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


