Return-Path: <linux-media+bounces-26269-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC69A39919
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 11:36:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E15637A2DF8
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 10:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A121C24060D;
	Tue, 18 Feb 2025 10:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YkWJfixF"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF8423FC54;
	Tue, 18 Feb 2025 10:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739874836; cv=none; b=fqirhPEv8OLsX+grE6PCyiPRRkelcbhF2KuFfDHyJcIsb6MqciEOxaUKZs5pDZZdsPuXtuBJFeD3lw24TFo7srOjI8L4rP8D3w/bjhixcrZgq6O5V1WRxTmX7vBFKQ9A9PPBfcX6Vsx0tAc7/+eC7a1k3V56AEJHnMOAjPslUW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739874836; c=relaxed/simple;
	bh=eJd9f4blcegx+BISVVF5j1/hSmcvEDQUFTZlQ0zCixg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=hOejI2P9+Wef5EraaPMNBc7jgWiNf4wbWeI4tLVBG6uqyP6GqUe8H0adODfncf5QANi42u/nis5ulml9vhaFzgSd+95IimVV+5U13pM9T5Fu4TQclAw6x0UBQqiWVNi2ArMOfmvOmxOo9nERWE/p+1wxm8FPx/SfVCbDHWUO5LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YkWJfixF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51I2nhtT024167;
	Tue, 18 Feb 2025 10:33:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nYrfwJQF1pYnp6cRMoCxa+2k7wrxFiO/+p0sCHogb6Q=; b=YkWJfixFZq8K2r99
	ClLxjtPlJmILE6DRqEr9imEZC6FAzB0Ycbf0xMcv0jKgta2FeZD0LnSx2FVu74Ae
	Ei7lOdBTwsXo0oFCx25V/JUbpuE6Umj0dGaoOCBvneHz3kDbcIRAf0lV+FlA5xRH
	c2dDMbU//UmWMiZnBLFaJGudGnfiBGJsowa0nSNPAc3+Ct5xAFRnyjChz9U5pApg
	ibmBZgCXJmPRWOyrCSwqASQT1Ysvdnktme+emTCwkxzBmJyx5f7cQa4x4AhhP7Qd
	1OS3OHmHscwKKysqqAqcdfhIE7QX/vRQBrsbwLO9/diEbShkj9k8QLnx/Negq2V5
	pKI+WQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ut7ucgc4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Feb 2025 10:33:49 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51IAXmI5000318
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Feb 2025 10:33:49 GMT
Received: from hu-renjiang-sha.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 18 Feb 2025 02:33:45 -0800
From: Renjiang Han <quic_renjiang@quicinc.com>
Date: Tue, 18 Feb 2025 16:03:21 +0530
Subject: [PATCH v4 2/2] clk: qcom: videocc: Use HW_CTRL_TRIGGER flag for
 video GDSC's
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250218-switch_gdsc_mode-v4-2-546f6c925ae0@quicinc.com>
References: <20250218-switch_gdsc_mode-v4-0-546f6c925ae0@quicinc.com>
In-Reply-To: <20250218-switch_gdsc_mode-v4-0-546f6c925ae0@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Stanimir Varbanov
	<stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        Renjiang Han
	<quic_renjiang@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739874819; l=4234;
 i=quic_renjiang@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=i/sSEqB62BBrB+Tlclsq4GbdmCj1n3LXGCmyoP/p3IU=;
 b=iyc8bGbPoHfjtdjKkbijl7jXbnl7kP7/lukZzZe20uDp+aEtQGlqt4XQZUgHcB4ut1kLRPJq4
 c6NP2xjyysTDX5FC6GZhiTa1gZsJiGuQ0GpT6v7vev/OKfJWo7UjG4q
X-Developer-Key: i=quic_renjiang@quicinc.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: s_JA_P4alxuh9fGdsaJhLch95aoGWwKP
X-Proofpoint-ORIG-GUID: s_JA_P4alxuh9fGdsaJhLch95aoGWwKP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-18_04,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=690 spamscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0 adultscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502180082

From: Taniya Das <quic_tdas@quicinc.com>

The video driver will be using the newly introduced
dev_pm_genpd_set_hwmode() API to switch the video GDSC to HW and SW
control modes at runtime.
Hence use HW_CTRL_TRIGGER flag instead of HW_CTRL for video GDSC's for
Qualcomm SoC SC7180, SDM845, SM7150, SM8150 and SM8450.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
---
 drivers/clk/qcom/videocc-sc7180.c | 2 +-
 drivers/clk/qcom/videocc-sdm845.c | 4 ++--
 drivers/clk/qcom/videocc-sm7150.c | 4 ++--
 drivers/clk/qcom/videocc-sm8150.c | 4 ++--
 drivers/clk/qcom/videocc-sm8450.c | 4 ++--
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sc7180.c b/drivers/clk/qcom/videocc-sc7180.c
index d7f84548039699ce6fdd7c0f6675c168d5eaf4c1..dd2441d6aa83bd7cff17deeb42f5d011c1e9b134 100644
--- a/drivers/clk/qcom/videocc-sc7180.c
+++ b/drivers/clk/qcom/videocc-sc7180.c
@@ -166,7 +166,7 @@ static struct gdsc vcodec0_gdsc = {
 	.pd = {
 		.name = "vcodec0_gdsc",
 	},
-	.flags = HW_CTRL,
+	.flags = HW_CTRL_TRIGGER,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
diff --git a/drivers/clk/qcom/videocc-sdm845.c b/drivers/clk/qcom/videocc-sdm845.c
index f77a0777947773dc8902c92098acff71b9b8f10f..6dedc80a8b3e18eca82c08a5bcd7e1fdc374d4b5 100644
--- a/drivers/clk/qcom/videocc-sdm845.c
+++ b/drivers/clk/qcom/videocc-sdm845.c
@@ -260,7 +260,7 @@ static struct gdsc vcodec0_gdsc = {
 	},
 	.cxcs = (unsigned int []){ 0x890, 0x930 },
 	.cxc_count = 2,
-	.flags = HW_CTRL | POLL_CFG_GDSCR,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
@@ -271,7 +271,7 @@ static struct gdsc vcodec1_gdsc = {
 	},
 	.cxcs = (unsigned int []){ 0x8d0, 0x950 },
 	.cxc_count = 2,
-	.flags = HW_CTRL | POLL_CFG_GDSCR,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
diff --git a/drivers/clk/qcom/videocc-sm7150.c b/drivers/clk/qcom/videocc-sm7150.c
index 14ef7f5617537363673662adc3910ddba8ea6a4f..b6912560ef9b7a84e7fd1d9924f5aac6967da780 100644
--- a/drivers/clk/qcom/videocc-sm7150.c
+++ b/drivers/clk/qcom/videocc-sm7150.c
@@ -271,7 +271,7 @@ static struct gdsc vcodec0_gdsc = {
 	},
 	.cxcs = (unsigned int []){ 0x890, 0x9ec },
 	.cxc_count = 2,
-	.flags = HW_CTRL | POLL_CFG_GDSCR,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
@@ -282,7 +282,7 @@ static struct gdsc vcodec1_gdsc = {
 	},
 	.cxcs = (unsigned int []){ 0x8d0, 0xa0c },
 	.cxc_count = 2,
-	.flags = HW_CTRL | POLL_CFG_GDSCR,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
diff --git a/drivers/clk/qcom/videocc-sm8150.c b/drivers/clk/qcom/videocc-sm8150.c
index daab3237eec19b727d34512d3a2ba1d7bd2743d6..3024f6fc89c8b374f2ef13debc283998cb136f6b 100644
--- a/drivers/clk/qcom/videocc-sm8150.c
+++ b/drivers/clk/qcom/videocc-sm8150.c
@@ -179,7 +179,7 @@ static struct gdsc vcodec0_gdsc = {
 	.pd = {
 		.name = "vcodec0_gdsc",
 	},
-	.flags = HW_CTRL,
+	.flags = HW_CTRL_TRIGGER,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
@@ -188,7 +188,7 @@ static struct gdsc vcodec1_gdsc = {
 	.pd = {
 		.name = "vcodec1_gdsc",
 	},
-	.flags = HW_CTRL,
+	.flags = HW_CTRL_TRIGGER,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 static struct clk_regmap *video_cc_sm8150_clocks[] = {
diff --git a/drivers/clk/qcom/videocc-sm8450.c b/drivers/clk/qcom/videocc-sm8450.c
index f26c7eccb62e7eb8dbd022e2f01fa496eb570b3f..4cefcbbc020f201f19c75c20229415e0bdea2963 100644
--- a/drivers/clk/qcom/videocc-sm8450.c
+++ b/drivers/clk/qcom/videocc-sm8450.c
@@ -347,7 +347,7 @@ static struct gdsc video_cc_mvs0_gdsc = {
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.parent = &video_cc_mvs0c_gdsc.pd,
-	.flags = RETAIN_FF_ENABLE | HW_CTRL,
+	.flags = HW_CTRL_TRIGGER | RETAIN_FF_ENABLE,
 };
 
 static struct gdsc video_cc_mvs1c_gdsc = {
@@ -372,7 +372,7 @@ static struct gdsc video_cc_mvs1_gdsc = {
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.parent = &video_cc_mvs1c_gdsc.pd,
-	.flags = RETAIN_FF_ENABLE | HW_CTRL,
+	.flags = HW_CTRL_TRIGGER | RETAIN_FF_ENABLE,
 };
 
 static struct clk_regmap *video_cc_sm8450_clocks[] = {

-- 
2.34.1


