Return-Path: <linux-media+bounces-23997-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A2E9FABC7
	for <lists+linux-media@lfdr.de>; Mon, 23 Dec 2024 10:04:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5FE26163225
	for <lists+linux-media@lfdr.de>; Mon, 23 Dec 2024 09:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FA75194A6B;
	Mon, 23 Dec 2024 09:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZTbKp3x1"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562AA192D87;
	Mon, 23 Dec 2024 09:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734944603; cv=none; b=Qm+QzWjLN44G4i+MTjYnQ56HJyFdZU3sr532iDgtbKpta6e2qi0NJmVAM+Ru8iTM6wEeAXJ6vZhaOSZMNU0CtAd2hp86Lx7KR3jKbSCbTnB1J/S8DN2mIXg9bhrQnKvUnugAgLmDG+BJtGEQS2n4Lb3R5nQ38T0Lw41k3PzchJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734944603; c=relaxed/simple;
	bh=+/6ymI2gxodvy4p0D6VcTcHJuB8emEerX+YHB0Wuy38=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=hRnx71tPd/oR3UzcFYevbyKa3CRE2G5KwpKW2jWYUh6mg91TuGeIofV2X0PsVfDBhJyiU+quMdIR+8cLIEY808o5WclK+h2nZi8Un3IW3Ia4FOVB+lmWWL4R7F7m7/pQOCwbZ6aEDtPiqo0pRhQPKzTz0Uz9UHmhkHA0rI48phA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZTbKp3x1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BN8oZxf026653;
	Mon, 23 Dec 2024 09:03:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BA3Q4EFy5gQR7GO/ZWbGXRYPqEOGYTkutQVPdzM+ZrI=; b=ZTbKp3x199bHFyzb
	UCpaf6MkkC7QPWiFk0WpNvHK4Y92FFW3T7StuUq7mbl9ZTw7t6AU24N4oOEkrlUq
	1CD0fgXdxM5e2S080TVdKBBFcK9oFtfUpj9AgC6sQmqHnKhFpDgVKNgufrhOQznd
	WbD5N3R+fOxIYcaOA8ANcJ5jwcR4KREvdG8z836z4gyzLN1n8zEb+tyE/Lv0SBSt
	TJxv9d3l5bnC+OuyfNPKryHZXCt2/qE05CnMzt+p4/oPKFTP0jYsx2daB+vGUEXW
	6V8VIVgOUoAZxysY0lVRzF7XgCWNL1ASZiex7f4BhTQe2hur+J5yxIOKWJbkiEGV
	pC3lCg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43q4q4r1hx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 09:03:17 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BN93GkO009369
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 09:03:16 GMT
Received: from hu-renjiang-sha.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 23 Dec 2024 01:03:13 -0800
From: Renjiang Han <quic_renjiang@quicinc.com>
Date: Mon, 23 Dec 2024 14:32:42 +0530
Subject: [PATCH v2 2/2] venus: pm_helpers: Use dev_pm_genpd_set_hwmode to
 switch GDSC mode on V4
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241223-switch_gdsc_mode-v2-2-eb5c96aee662@quicinc.com>
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
	<quic_renjiang@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734944586; l=2837;
 i=quic_renjiang@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=+/6ymI2gxodvy4p0D6VcTcHJuB8emEerX+YHB0Wuy38=;
 b=TyI3NvYHi13vTyd++TgPqJQU01TDQoz8xKrPIhICHTEt0xUevJW3QwMO+FbF9y5uT3OZLkkOT
 zT/bEfHdFiDA5MXJLbV1XQbNtgmXHRZGlziKOI3reO53/ef9VQ2VzT+
X-Developer-Key: i=quic_renjiang@quicinc.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gM55BBx7lDfHfUS_qFMk0mI1VcZcnp1-
X-Proofpoint-ORIG-GUID: gM55BBx7lDfHfUS_qFMk0mI1VcZcnp1-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 mlxlogscore=999 clxscore=1015 bulkscore=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412230081

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


