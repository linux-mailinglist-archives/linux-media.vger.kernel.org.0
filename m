Return-Path: <linux-media+bounces-48558-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD69CB2E82
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 13:36:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0745D30155B2
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 12:36:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 294092C17A1;
	Wed, 10 Dec 2025 12:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gUeIEOsb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eriLAXKE"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA963242DF
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 12:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765370187; cv=none; b=EumZ5VITJNihQMvRFdOo9wgET92GHDuQYsKYztLxIZiFeSp1uxAtBHyGA4HwgTsUBTk0nD6fe+niShhz/TRYz2iOkten8K6Nc2zStkUm6nMHuv+r1SB8F6JASPaBPi+mTmg0JCfOpYf6d/ZXl/K5aTajEMbIEMcMkh4I0qcZ++U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765370187; c=relaxed/simple;
	bh=4DLNhmvLINw+zP+xhiXyvIE4vnFYZhMES2ERkPWxpRE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QJ7urdjlduofdXVQ7EA4Tp0SvV5pG/t3ynAjalcd7RsuXd2f3sVKb+GlwkByEMv5bh5wD+X025s+E8uHCGio2KmV+6PGZy2i4sWWn+k7XJmr6WFIhbMKmTfPpc2PHxh9b9a3yl2Icn9wFk79KXV2Q0Pjbo7uj6YNzphUOSY3ivY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gUeIEOsb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eriLAXKE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA8eF1F2669604
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 12:36:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+DbObUao04PFyf6rjIEnEtPggBgS0Xcs0aGUUS434Lo=; b=gUeIEOsb8GPe6kQw
	GYnD1X/K//p9BTdhjlfQix8hFNVx9aieRoSHhpaWLxBS8eDjnpc5OCW4mI1iJSQ3
	uvhrd0TYsBNq8XZc0RrGZ3jBSSD7KM9TpPD82PIKgsTARvD8FSsiJfTcXt2GwvyF
	nZWKK/Wc542PITSfQ0bDeH3hJZNu4XM1NhpuuWrk0afiQhjATQFxTR1nYl3dl2c3
	9Fk4hrDM6eNom6hlH9uIBsgFq8LqdlB0QioM2aZ1LbxHv8vV+E8kPzJrPrUjH6LF
	ZRuO/X/R794q4nadQPfaQKlkxt1NU8TeHS8Pdb1RakbbPiDuQu7Ft6oWcwgTKcIe
	xhlQEQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ay4ykgssr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 12:36:24 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-297dfae179bso138749985ad.1
        for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 04:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765370182; x=1765974982; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+DbObUao04PFyf6rjIEnEtPggBgS0Xcs0aGUUS434Lo=;
        b=eriLAXKEV7IB4sHsqOllnz66NfJ1z4CVYMl/AE9Gc4i2M77v5ypKtyT24X/bWN2m3R
         mDqdqItno+IUxI2cqw0IaoiwMsQLZhvb4tu78frEk9CpM68/MCFxVkCKX8gGNvqGUcfA
         PktfnRNrUB0LUv9zwkiFqhbg088u4qIKEe0GjTn4/+AxgKZrNSDx833kIBHre3raAZKm
         NovXg2weDX1q+DmT/FNczuU0etKW21GrDeU7ml1IFSKKihXeDABEPgwvrkH6+J8+GkmO
         +WPofK/JxcRFo+cNuZ0WdiSO4Rlt9Yml0kRQrdx+d1rk343Cz4WLAJvnhFonqwf+iMVt
         4YbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765370182; x=1765974982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+DbObUao04PFyf6rjIEnEtPggBgS0Xcs0aGUUS434Lo=;
        b=r4cDfExPED0DM4X7zwrI5cnjIEi4UxWlUkflUKx40lK382DYIGSTI9GywiP7dKHOXX
         DP17LtlQC5lHjQCdAE7/Ds10nmFiQ5bTYele6WmfYo4s4SjdQIxzUTdNfcw9choqi9c8
         JIbUlJN1y7r+3uUJfVcrs2HfFKwiSFbBAOGFOrYqcL8gYcj2nJQHjZrF9QR1XH02XoAt
         5tYgT8lCfM+Z6Ikp+InJmtCWHLa1uSGn/L8qu/Lad7S3/BEC9Id3WDzOQe5Ney0uLhru
         77VcjWinb5xrcCdsQOgAgzFglu80b9xx75dDM7RB+dmJwQ+MQC73jZ9dn7xAzCqexhMJ
         YqOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxl+6TgbDcGiHOHV2amJbGoVRaTX1XxWnYcu8TvuTPvmmGE5zLlSvOjYEw/mJb3mhG3Is3wfNWJAfgjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwA9jvnbyhmvxQXulgLF0SU9OnfCUnk94ld30LRdoIk/Oefdiri
	NrPkDve9UWZlzPvo0XlBBCE0gP0LXaN7iRBBPjDjz4WYiNMSGn+18CyPepuRxAakfxOhg869Eix
	0m6BeRflpdWKzL1+GbgcApycke7X8fD4glZHjazKS/Yl0B2SVUmqo4VcwpAWzU9b59g==
X-Gm-Gg: AY/fxX74O5lEn72Tp6IG0341cJ8iGOCDmm778Oqf1nH/6ercZorg4MZm3qaJtc0roTk
	RiGtG5mKUqrLGWlAvjPYVseJ86tsgE4qPcAYb8hJtgAUSr5WPpVMNo8j7rLaTtKXjPQpsAr6cMx
	D/PztVj75oQ/dEb1axELctnhvS4g2QQekUoCULV8/1w3wxHHneLPKlCHpTn+wCW4M87OV5WPBke
	Gt5RjHh/WRn9mGsrUIXF9oC0E7L5yKHPFsKAfQi2ay2X8Do+Jj4ptkQSQcDxJijoSvltAMhogl+
	LJFfxto5por0wtEUT7a2GMm3THbT8VAB5tQOMz2lE0f9IenftVTM6TCCYr7lz5Y3FNQ/mzwV5N5
	hjdS7ockApbg67skAe8IkdptOHPrwotRDXeAvrWJz3wdl
X-Received: by 2002:a17:902:e807:b0:28e:756c:707e with SMTP id d9443c01a7336-29ec2d41b2cmr24554545ad.33.1765370182369;
        Wed, 10 Dec 2025 04:36:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG6pN8KuI+NtsaKPbSjTNpZGeaT4jntWBJo36x7kcuntFjITLQB/7NQlCCG9BXGZoLiqSHqag==
X-Received: by 2002:a17:902:e807:b0:28e:756c:707e with SMTP id d9443c01a7336-29ec2d41b2cmr24554225ad.33.1765370181815;
        Wed, 10 Dec 2025 04:36:21 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29daeaab9c0sm185434615ad.68.2025.12.10.04.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 04:36:21 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Wed, 10 Dec 2025 18:05:59 +0530
Subject: [PATCH v4 1/6] media: iris: Add support for multiple clock sources
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251210-knp_video-v4-1-8d11d840358a@oss.qualcomm.com>
References: <20251210-knp_video-v4-0-8d11d840358a@oss.qualcomm.com>
In-Reply-To: <20251210-knp_video-v4-0-8d11d840358a@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765370172; l=11220;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=4DLNhmvLINw+zP+xhiXyvIE4vnFYZhMES2ERkPWxpRE=;
 b=tTbdARkXV9r7u9D7yX8z/JmLYJqRD4x3B0H7M4H0uL8pCydtsPPUxOr8Zk4mKbKtVXt76QO5/
 qLTAjriuPUkCjDHe04W3bG+8VuMCvby5vaIYnNro787mcfyMJoxFIgy
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-ORIG-GUID: QBI97oFgVGk0tDfoHtZNP3XG1tvDaYvS
X-Authority-Analysis: v=2.4 cv=Mfthep/f c=1 sm=1 tr=0 ts=69396948 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=DuqIK-Az9VxSs3DelwgA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: QBI97oFgVGk0tDfoHtZNP3XG1tvDaYvS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDEwMCBTYWx0ZWRfXzygKz9jeW9cP
 3eEQN0mEytar1eXLzV7f0fdr98vG+ACZ+AwsQyuNMx89LL5nMOnxsNU28Cu/b5Tf3FBoHMkx4pb
 AJViaOA+NvgvAJbv/fWwAnYCj1wmJ6ET/25tBrviAd6rw9jmzx90I+cqVdDBsho7C52RYq5L+2z
 TsJddC8m+SnIYIz/yhRmD4qZDCqaDbp3fBkt/2bfnrvzsSkXpiYesIJpm3Ew+pLV7MmFP2+/JZB
 x1n8A3CgsdX61ogCcbdMgWMw+B8tI2XwjN/lkjMzctn41sFTH13NxssbF5CGyGL4oTh6LHeNVq4
 Tu5z/UBqyNDLqS+yYkgPv0k5DfScA/ePHOBShxt9Etp21aJZp6b7qfLdmXckLmMf5nPf7Gj3seG
 igS074t5/qHbBjErsTfqlvSDlaEGYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100100

vpu4 depends on more than one clock source. Thus far hardware versions
up to vpu3x have been clocked by a single source.
This adds support for multiple clocks by,
- Adding a lookup table
- Configuring OPP table for video device with different video clocks
- Setting OPP for multiple clocks during dev_pm_opp_set_opp()

This patch extends the support for multiple clocks in driver, which
would be used in subsequent patch for kaanapali, when the platform data
is prepared.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 .../media/platform/qcom/iris/iris_platform_common.h  |  1 +
 .../media/platform/qcom/iris/iris_platform_gen1.c    |  7 +++++++
 .../media/platform/qcom/iris/iris_platform_gen2.c    |  9 +++++++++
 .../media/platform/qcom/iris/iris_platform_sc7280.h  |  5 +++++
 drivers/media/platform/qcom/iris/iris_power.c        |  2 +-
 drivers/media/platform/qcom/iris/iris_probe.c        | 20 ++++++++------------
 drivers/media/platform/qcom/iris/iris_resources.c    | 16 ++++++++++++++--
 drivers/media/platform/qcom/iris/iris_resources.h    |  1 +
 drivers/media/platform/qcom/iris/iris_vpu_common.c   |  4 ++--
 9 files changed, 48 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 8d8cdb56a3c7722c06287d4d10feed14ba2b254c..f63fb58b2fa87d31407be0f14524c963edd85d68 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -209,6 +209,7 @@ struct iris_platform_data {
 	const char * const *opp_pd_tbl;
 	unsigned int opp_pd_tbl_size;
 	const struct platform_clk_data *clk_tbl;
+	const char * const *opp_clk_tbl;
 	unsigned int clk_tbl_size;
 	const char * const *clk_rst_tbl;
 	unsigned int clk_rst_tbl_size;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index 34cbeb8f52e248b6aec3e0ee911e14d50df07cce..6092667687bfe34a52f3ec4865f99eddeea435a8 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -273,6 +273,11 @@ static const struct platform_clk_data sm8250_clk_table[] = {
 	{IRIS_HW_CLK,   "vcodec0_core" },
 };
 
+static const char * const sm8250_opp_clk_table[] = {
+	"vcodec0_core",
+	NULL,
+};
+
 static struct tz_cp_config tz_cp_config_sm8250 = {
 	.cp_start = 0,
 	.cp_size = 0x25800000,
@@ -333,6 +338,7 @@ const struct iris_platform_data sm8250_data = {
 	.opp_pd_tbl_size = ARRAY_SIZE(sm8250_opp_pd_table),
 	.clk_tbl = sm8250_clk_table,
 	.clk_tbl_size = ARRAY_SIZE(sm8250_clk_table),
+	.opp_clk_tbl = sm8250_opp_clk_table,
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu-1.0/venus.mbn",
@@ -382,6 +388,7 @@ const struct iris_platform_data sc7280_data = {
 	.opp_pd_tbl_size = ARRAY_SIZE(sc7280_opp_pd_table),
 	.clk_tbl = sc7280_clk_table,
 	.clk_tbl_size = ARRAY_SIZE(sc7280_clk_table),
+	.opp_clk_tbl = sc7280_opp_clk_table,
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu/vpu20_p1.mbn",
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index c1989240c248601c34b84f508f1b72d72f81260a..65860e3f43700ddb70eba617d78971c47945d008 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -631,6 +631,11 @@ static const struct platform_clk_data sm8550_clk_table[] = {
 	{IRIS_HW_CLK,   "vcodec0_core" },
 };
 
+static const char * const sm8550_opp_clk_table[] = {
+	"vcodec0_core",
+	NULL,
+};
+
 static struct ubwc_config_data ubwc_config_sm8550 = {
 	.max_channels = 8,
 	.mal_length = 32,
@@ -755,6 +760,7 @@ const struct iris_platform_data sm8550_data = {
 	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
 	.clk_tbl = sm8550_clk_table,
 	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
+	.opp_clk_tbl = sm8550_opp_clk_table,
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu/vpu30_p4.mbn",
@@ -847,6 +853,7 @@ const struct iris_platform_data sm8650_data = {
 	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
 	.clk_tbl = sm8550_clk_table,
 	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
+	.opp_clk_tbl = sm8550_opp_clk_table,
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu/vpu33_p4.mbn",
@@ -929,6 +936,7 @@ const struct iris_platform_data sm8750_data = {
 	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
 	.clk_tbl = sm8750_clk_table,
 	.clk_tbl_size = ARRAY_SIZE(sm8750_clk_table),
+	.opp_clk_tbl = sm8550_opp_clk_table,
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu/vpu35_p4.mbn",
@@ -1015,6 +1023,7 @@ const struct iris_platform_data qcs8300_data = {
 	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
 	.clk_tbl = sm8550_clk_table,
 	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
+	.opp_clk_tbl = sm8550_opp_clk_table,
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu/vpu30_p4_s6.mbn",
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sc7280.h b/drivers/media/platform/qcom/iris/iris_platform_sc7280.h
index f1bef4d4bcfe8e58e2f18cff23c3c067f25d8bc3..0ec8f334df670c3c1548a5ee3b8907b333e34db3 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sc7280.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_sc7280.h
@@ -23,4 +23,9 @@ static const struct platform_clk_data sc7280_clk_table[] = {
 	{IRIS_HW_AHB_CLK,  "vcodec_bus"   },
 };
 
+static const char * const sc7280_opp_clk_table[] = {
+	"vcodec_core",
+	NULL,
+};
+
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_power.c b/drivers/media/platform/qcom/iris/iris_power.c
index dbca42df0910fd3c0fb253dbfabf1afa2c3d32ad..91aa21d4070ebcebbe2ed127a03e5e49b9a2bd5c 100644
--- a/drivers/media/platform/qcom/iris/iris_power.c
+++ b/drivers/media/platform/qcom/iris/iris_power.c
@@ -91,7 +91,7 @@ static int iris_set_clocks(struct iris_inst *inst)
 	}
 
 	core->power.clk_freq = freq;
-	ret = dev_pm_opp_set_rate(core->dev, freq);
+	ret = iris_opp_set_rate(core->dev, freq);
 	mutex_unlock(&core->lock);
 
 	return ret;
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 9bc9b34c2576581635fa8d87eed1965657eb3eb3..ddaacda523ecb9990af0dd0640196223fbcc2cab 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -40,8 +40,6 @@ static int iris_init_icc(struct iris_core *core)
 
 static int iris_init_power_domains(struct iris_core *core)
 {
-	const struct platform_clk_data *clk_tbl;
-	u32 clk_cnt, i;
 	int ret;
 
 	struct dev_pm_domain_attach_data iris_pd_data = {
@@ -56,6 +54,11 @@ static int iris_init_power_domains(struct iris_core *core)
 		.pd_flags = PD_FLAG_DEV_LINK_ON | PD_FLAG_REQUIRED_OPP,
 	};
 
+	struct dev_pm_opp_config iris_opp_clk_data = {
+		.clk_names = core->iris_platform_data->opp_clk_tbl,
+		.config_clks = dev_pm_opp_config_clks_simple,
+	};
+
 	ret = devm_pm_domain_attach_list(core->dev, &iris_pd_data, &core->pmdomain_tbl);
 	if (ret < 0)
 		return ret;
@@ -64,16 +67,9 @@ static int iris_init_power_domains(struct iris_core *core)
 	if (ret < 0)
 		return ret;
 
-	clk_tbl = core->iris_platform_data->clk_tbl;
-	clk_cnt = core->iris_platform_data->clk_tbl_size;
-
-	for (i = 0; i < clk_cnt; i++) {
-		if (clk_tbl[i].clk_type == IRIS_HW_CLK) {
-			ret = devm_pm_opp_set_clkname(core->dev, clk_tbl[i].clk_name);
-			if (ret)
-				return ret;
-		}
-	}
+	ret = devm_pm_opp_set_config(core->dev, &iris_opp_clk_data);
+	if (ret)
+		return ret;
 
 	return devm_pm_opp_of_add_table(core->dev);
 }
diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
index 164490c49c95ee048670981fdab014d20436ef85..773f6548370a257b8ae7332242544266cbbd61a9 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/devfreq.h>
 #include <linux/interconnect.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_opp.h>
@@ -58,11 +59,22 @@ int iris_unset_icc_bw(struct iris_core *core)
 	return icc_bulk_set_bw(core->icc_count, core->icc_tbl);
 }
 
+int iris_opp_set_rate(struct device *dev, unsigned long freq)
+{
+	struct dev_pm_opp *opp __free(put_opp);
+
+	opp = devfreq_recommended_opp(dev, &freq, 0);
+	if (IS_ERR(opp))
+		return PTR_ERR(opp);
+
+	return dev_pm_opp_set_opp(dev, opp);
+}
+
 int iris_enable_power_domains(struct iris_core *core, struct device *pd_dev)
 {
 	int ret;
 
-	ret = dev_pm_opp_set_rate(core->dev, ULONG_MAX);
+	ret = iris_opp_set_rate(core->dev, ULONG_MAX);
 	if (ret)
 		return ret;
 
@@ -77,7 +89,7 @@ int iris_disable_power_domains(struct iris_core *core, struct device *pd_dev)
 {
 	int ret;
 
-	ret = dev_pm_opp_set_rate(core->dev, 0);
+	ret = iris_opp_set_rate(core->dev, 0);
 	if (ret)
 		return ret;
 
diff --git a/drivers/media/platform/qcom/iris/iris_resources.h b/drivers/media/platform/qcom/iris/iris_resources.h
index f723dfe5bd81a9c9db22d53bde4e18743d771210..6bfbd2dc6db095ec05e53c894e048285f82446c6 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.h
+++ b/drivers/media/platform/qcom/iris/iris_resources.h
@@ -8,6 +8,7 @@
 
 struct iris_core;
 
+int iris_opp_set_rate(struct device *dev, unsigned long freq);
 int iris_enable_power_domains(struct iris_core *core, struct device *pd_dev);
 int iris_disable_power_domains(struct iris_core *core, struct device *pd_dev);
 int iris_unset_icc_bw(struct iris_core *core);
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 515dd55a3377e5d4d131e360f361a44a0a92505b..fef192a2de48fa47af421632829184c5896326cd 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -270,7 +270,7 @@ void iris_vpu_power_off_hw(struct iris_core *core)
 
 void iris_vpu_power_off(struct iris_core *core)
 {
-	dev_pm_opp_set_rate(core->dev, 0);
+	iris_opp_set_rate(core->dev, 0);
 	core->iris_platform_data->vpu_ops->power_off_hw(core);
 	core->iris_platform_data->vpu_ops->power_off_controller(core);
 	iris_unset_icc_bw(core);
@@ -368,7 +368,7 @@ int iris_vpu_power_on(struct iris_core *core)
 	freq = core->power.clk_freq ? core->power.clk_freq :
 				      (u32)ULONG_MAX;
 
-	dev_pm_opp_set_rate(core->dev, freq);
+	iris_opp_set_rate(core->dev, freq);
 
 	core->iris_platform_data->set_preset_registers(core);
 

-- 
2.34.1


