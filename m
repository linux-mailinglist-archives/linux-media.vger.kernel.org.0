Return-Path: <linux-media+bounces-21825-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A629D5D5A
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 11:32:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD326283686
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 10:32:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5F2A1DED7F;
	Fri, 22 Nov 2024 10:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GxHacE85"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4FD1DED45;
	Fri, 22 Nov 2024 10:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732271534; cv=none; b=Axb03JfJlw8Wh81goKU4vEozhPizlpFzys1lMbPprScX1cvJrtc9FEBlwJlDfHajJEekPKmwR4L7HZqcnysqW0oRiI+hGtyijP2uQdVmPrMube2xcbejgk/5L6Lnl+7J7LRb0pNTOH/v6he47CuOeKRY049vaI2GUIVJYr7hvYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732271534; c=relaxed/simple;
	bh=04ib/OZ4jLnDPvFtOgr+Xu8uZJUwXVFWeX2tzGy1yhY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=RmIsGIZUWgAlI6i1mR4cMeBe6IpRwom36sm26zw8B/vkz2oBlNLRNuXWeHdrnPgZdZPcvba5R0r7gUMlkpWKwPUOMjQbPufWccSQ54LI6d+lQLpr6cduLOQDgdw/Qw/RL8RMkx0dnXk0MuQmhCro9fnjXlNGvATAw3o45RHSles=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GxHacE85; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AM0XWYF019414;
	Fri, 22 Nov 2024 10:32:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XptLjK6O09rjmt0ImlQCyTz9PoWwYsZLi4WIdWsSgck=; b=GxHacE85dqZBQLq7
	8KLc7t817PZHDdWqThiasRYDLquBqJvGdwDQWhnf5Zg0EzooG6nQJnCvgQIVf4rk
	fCBNqIo4WGYvHnw4UU8ZlBgSYCjfhXggwEck0i8me5Ahu0XO7qfq/1rZyO/+iRxN
	j1f4UOdjow4pH0+Jj4oaOG+pssmSHOhCQqo6crHJpB05QD4NkuwekJ+Ki0TV0iT5
	RiQQtA9ClXPS+koa30uIWB/jEo5O/PYbvC6qDomt6GD6J2yAv6x8pb9+/cZClRJc
	pV9LcsztopHXbhI/+0E2qCuIGlOht1l/M4dUh1T7lrcc+7bJ/Y3xWEq5hEXPHwAo
	DB73Qw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431sv2mv9k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 10:32:07 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AMAW6Fh014226
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 10:32:06 GMT
Received: from hu-renjiang-sha.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 22 Nov 2024 02:32:03 -0800
From: Renjiang Han <quic_renjiang@quicinc.com>
Date: Fri, 22 Nov 2024 16:01:45 +0530
Subject: [PATCH 1/2] clk: qcom: videocc: Use HW_CTRL_TRIGGER flag for video
 GDSC's
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241122-switch_gdsc_mode-v1-1-365f097ecbb0@quicinc.com>
References: <20241122-switch_gdsc_mode-v1-0-365f097ecbb0@quicinc.com>
In-Reply-To: <20241122-switch_gdsc_mode-v1-0-365f097ecbb0@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732271519; l=1735;
 i=quic_renjiang@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=MUqdC0nCpqkpwebFi/J2nt4uPGkXTGdVM5FuF2amm+Q=;
 b=DXbGUeJgRFf0IplYk7DUm+awJlb/lJpwXJidZdhQi5YW0N3N4xsyA48q//1PSfbEdbqM+VtzQ
 1YgDoQdsWiBC9XI4sTl5EmbKYTUJoziTJVtnvpcOsDoSdHeFPVoWyOH
X-Developer-Key: i=quic_renjiang@quicinc.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: d7b7PubojC-8WRN94wHFo5PAKvkQqOVR
X-Proofpoint-ORIG-GUID: d7b7PubojC-8WRN94wHFo5PAKvkQqOVR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0
 spamscore=0 malwarescore=0 mlxscore=0 mlxlogscore=723 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411220089

From: Taniya Das <quic_tdas@quicinc.com>

The video driver will be using the newly introduced
dev_pm_genpd_set_hwmode() API to switch the video GDSC to HW and SW
control modes at runtime.
Hence use HW_CTRL_TRIGGER flag instead of HW_CTRL for video GDSC's for
Qualcomm SoC SC7180 and SDM845.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
---
 drivers/clk/qcom/videocc-sc7180.c | 2 +-
 drivers/clk/qcom/videocc-sdm845.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

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
 

-- 
2.34.1


