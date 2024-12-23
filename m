Return-Path: <linux-media+bounces-23996-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD30E9FABC3
	for <lists+linux-media@lfdr.de>; Mon, 23 Dec 2024 10:03:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C64A71880407
	for <lists+linux-media@lfdr.de>; Mon, 23 Dec 2024 09:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3F68192D75;
	Mon, 23 Dec 2024 09:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="B46g5XsH"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C041922E5;
	Mon, 23 Dec 2024 09:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734944601; cv=none; b=AaoRrnRxU0znbYn7iIG6QoeZkYUB++k0qVkzA2+LGK3B/WUJ0GjDpmkcG6H05/zf0vMqAH17JJLLI4aSynTqkjI/MGn8VFebsW68vXCVtQeikK2G6jfKQVHX9PVXeiJm64wU6ICae9Qg2Te2Qfk4iWfIgUNFCuPoLKhajHbjQVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734944601; c=relaxed/simple;
	bh=ttzpLg0bi+9e2TOfn5CQXZyc+wn3S8U0GjM/WZmJNQ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=vBqC2HyOwKUdmjZQQVhb8Wt5wX3Kg3RLZM4bHZ2s9W+LKl2VW/teBCGpCpKMyrzyegWhXfWP6iQMqGwkcCglcH6Ar86CZ/m2AGCs070WFkkwQdPrkzSAaaf4i9tRC/Zwm5hK1sJJp6qnGaIPXjRNWVgroYT3CxvpwyvmnZoVK+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=B46g5XsH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BN86SGH015938;
	Mon, 23 Dec 2024 09:03:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UhdLIbryTSoTHAjt1G/UjhvO9MJblJDEbEZNAP27UNA=; b=B46g5XsHr61+Utxq
	d39KTtANMmh4PabWNGO2b9HYbhp3UMb1fHQ340SfUMqX7F+ihmf4thwx8uXpiyri
	Sr0KKRruS8vRS5W0EzQEJRsNwq61GunFDDSQUuSHCGC97SACHbuz0mwmQBkM2lgS
	8VEF3BLGkKFD50juSyX0kDY1cJQS+THeNPpXV8KRRDaqSZjvbLWfAxMtojvysffm
	/I56GOcv9M3j0BNJPUCzTUDxsJ6w0bXy/tFg8JuEZ26OCUYMFKNvko8N6r8BSZB9
	qSAytL7lxPHdMf+YWqt3Tu14w+y0jKW2EH9R1HO+3BUTuwB6/rLYb6Y0Y8cY/rv8
	yP8T+Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43q42g07n2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 09:03:14 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BN93D4U009045
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 09:03:13 GMT
Received: from hu-renjiang-sha.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 23 Dec 2024 01:03:10 -0800
From: Renjiang Han <quic_renjiang@quicinc.com>
Date: Mon, 23 Dec 2024 14:32:41 +0530
Subject: [PATCH v2 1/2] clk: qcom: videocc: Use HW_CTRL_TRIGGER flag for
 video GDSC's
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241223-switch_gdsc_mode-v2-1-eb5c96aee662@quicinc.com>
References: <20241223-switch_gdsc_mode-v2-0-eb5c96aee662@quicinc.com>
In-Reply-To: <20241223-switch_gdsc_mode-v2-0-eb5c96aee662@quicinc.com>
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
        Taniya Das <quic_tdas@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734944586; l=4173;
 i=quic_renjiang@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=COVRZISqydMb46UZhxsQtad2I7Z2yboPPDC+0GyVIs4=;
 b=V2xYuazjdGQiBGJecUvHiK+fcif0+SQQa3BEgnLLS5MdXLb+ggGGM1l/5NRk0nRcnPC/iCjh5
 Yg4kPUOKWcAAJTaOtUkQkdYh5QidtGg0QwCnQiwZ8aXShOXecNiyD3l
X-Developer-Key: i=quic_renjiang@quicinc.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 86CUvkPw9n33Sa2rm1NaIOLhyM48fAeU
X-Proofpoint-GUID: 86CUvkPw9n33Sa2rm1NaIOLhyM48fAeU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 bulkscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0 mlxlogscore=679
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412230081

From: Taniya Das <quic_tdas@quicinc.com>

The video driver will be using the newly introduced
dev_pm_genpd_set_hwmode() API to switch the video GDSC to HW and SW
control modes at runtime.
Hence use HW_CTRL_TRIGGER flag instead of HW_CTRL for video GDSC's for
Qualcomm SoC SC7180, SDM845, SM7150, SM8150 and SM8450.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
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


