Return-Path: <linux-media+bounces-24764-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 96911A11E28
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 10:36:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 569E33AD351
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 09:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59FCC244F81;
	Wed, 15 Jan 2025 09:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZQRSqHLL"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F8F2442F3;
	Wed, 15 Jan 2025 09:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736933536; cv=none; b=ZBO9Z5lUrMEbIuyYP5s2z9wZP3RRoYx0lTZ1P8PuxE7jaAJH2eRUnBvLxy3l1cd6xOTo3buWNv6ldAGvY97RsYQYvMkt00c59hmadIgm9Rk7z8NllnLXBL9FPGEiJA2ErVhfFiQa3TVsWIs13oKB2rxiZ2jx6UbQDfbnMn/+gzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736933536; c=relaxed/simple;
	bh=+/6ymI2gxodvy4p0D6VcTcHJuB8emEerX+YHB0Wuy38=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Ca2yVVRfNSdb/JUY1fxUT98WD0yCsi8uhHAzo4qq8W/YG0t17HYp/zJvIDTbmQxpMBOK8ra+Qg0R+APWZ0pU96MyXLtBKloQpl5yBRpPYVen74Zd+zfgBHqFQDnBtk+o1+/ExK5oSqlhR3Gu5J0f/1k/AJVpLgupD2ggtEZnV8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZQRSqHLL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50F4XhsN002821;
	Wed, 15 Jan 2025 09:32:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BA3Q4EFy5gQR7GO/ZWbGXRYPqEOGYTkutQVPdzM+ZrI=; b=ZQRSqHLLMgGXNhCa
	yL7UH1337GPUz9GKPqPB/5BjSphf92VirCNeYqQbN9MJudrOyqJu7Mqz9Jelxth6
	9kSa3VrIkceD9oscIfHyOw/QNwpfZVOe2SQ3pyx1zjJ6/tFfrh1HL4WVGCO100py
	kzhkCwCv6CyJOANDz6eyd6Vx5/QUZQ9xmBFSheW87qJKRGXv+rfLQB1mJIgaHEJq
	dkxt9MoxZfk8C2Yc1Q9pZgCvpiG5ZUiVLjKvktrVBUQTVBo8BgAcILu+QTRUeyO5
	OJvgQlkGA4uWgXZKBl/lvc/+Pd2QUuHGkHrYlmkIKOVbN+DBMbg7KMYv4eX1wKy2
	fJfo5A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44663sgq81-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 09:32:08 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50F9W7JZ030659
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 09:32:07 GMT
Received: from hu-renjiang-sha.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 15 Jan 2025 01:32:04 -0800
From: Renjiang Han <quic_renjiang@quicinc.com>
Date: Wed, 15 Jan 2025 15:00:53 +0530
Subject: [PATCH v3 2/3] venus: pm_helpers: Use dev_pm_genpd_set_hwmode to
 switch GDSC mode on V4
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250115-switch_gdsc_mode-v3-2-9a24d2fd724c@quicinc.com>
References: <20250115-switch_gdsc_mode-v3-0-9a24d2fd724c@quicinc.com>
In-Reply-To: <20250115-switch_gdsc_mode-v3-0-9a24d2fd724c@quicinc.com>
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
	<quic_renjiang@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736933518; l=2837;
 i=quic_renjiang@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=+/6ymI2gxodvy4p0D6VcTcHJuB8emEerX+YHB0Wuy38=;
 b=rHPzVm2FIctSOKUUsQMuWvvdVy/iq3ErV3mnCIlZY5yciExfM3skxjrzcZrxO5O3Btm9w8JcC
 WBheyKji5oOCiBw6aGyHJENLUqwhNXVWU2VinDfGd+t6oDanyzcT6wa
X-Developer-Key: i=quic_renjiang@quicinc.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: p2y_YRdd2eFDnqC_cuZPJhhHNfC7PK2d
X-Proofpoint-GUID: p2y_YRdd2eFDnqC_cuZPJhhHNfC7PK2d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_03,2025-01-15_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 phishscore=0 spamscore=0 clxscore=1015 mlxscore=0 bulkscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501150072

The POWER_CONTROL register addresses are not constant and can vary across
the variants. Also as per the HW recommendation, the GDSC mode switching
needs to be controlled from respective GDSC register and this is a uniform
approach across all the targets. Hence use dev_pm_genpd_set_hwmode() API
which controls GDSC mode switching using its respective GDSC register.

In venus v4 variants, the vcodec gdsc gets enabled in SW mode by default
with new HW_CTRL_TRIGGER flag and there is no need to switch it to SW mode
again after enable, hence add check to avoid switching gdsc to SW mode
again after gdsc enable. Similarly add check to avoid switching GDSC to HW
mode before disabling the GDSC, so GDSC gets enabled in SW mode in the
next enable.

Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
---
 drivers/media/platform/qcom/venus/pm_helpers.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index 33a5a659c0ada0ca97eebb5522c5f349f95c49c7..a2062b366d4aedba3eb5e4be456a005847eaec0b 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -412,7 +412,7 @@ static int vcodec_control_v4(struct venus_core *core, u32 coreid, bool enable)
 	u32 val;
 	int ret;
 
-	if (IS_V6(core))
+	if (IS_V6(core) || IS_V4(core))
 		return dev_pm_genpd_set_hwmode(core->pmdomains->pd_devs[coreid], !enable);
 	else if (coreid == VIDC_CORE_ID_1) {
 		ctrl = core->wrapper_base + WRAPPER_VCODEC0_MMCC_POWER_CONTROL;
@@ -450,7 +450,7 @@ static int poweroff_coreid(struct venus_core *core, unsigned int coreid_mask)
 
 		vcodec_clks_disable(core, core->vcodec0_clks);
 
-		if (!IS_V6(core)) {
+		if (!IS_V6(core) && !IS_V4(core)) {
 			ret = vcodec_control_v4(core, VIDC_CORE_ID_1, false);
 			if (ret)
 				return ret;
@@ -468,7 +468,7 @@ static int poweroff_coreid(struct venus_core *core, unsigned int coreid_mask)
 
 		vcodec_clks_disable(core, core->vcodec1_clks);
 
-		if (!IS_V6(core)) {
+		if (!IS_V6(core) && !IS_V4(core)) {
 			ret = vcodec_control_v4(core, VIDC_CORE_ID_2, false);
 			if (ret)
 				return ret;
@@ -491,7 +491,7 @@ static int poweron_coreid(struct venus_core *core, unsigned int coreid_mask)
 		if (ret < 0)
 			return ret;
 
-		if (!IS_V6(core)) {
+		if (!IS_V6(core) && !IS_V4(core)) {
 			ret = vcodec_control_v4(core, VIDC_CORE_ID_1, true);
 			if (ret)
 				return ret;
@@ -511,7 +511,7 @@ static int poweron_coreid(struct venus_core *core, unsigned int coreid_mask)
 		if (ret < 0)
 			return ret;
 
-		if (!IS_V6(core)) {
+		if (!IS_V6(core) && !IS_V4(core)) {
 			ret = vcodec_control_v4(core, VIDC_CORE_ID_2, true);
 			if (ret)
 				return ret;

-- 
2.34.1


