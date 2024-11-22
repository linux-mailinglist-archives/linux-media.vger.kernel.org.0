Return-Path: <linux-media+bounces-21826-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 624D19D5D5F
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 11:33:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5062BB2512F
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 10:33:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACF7D1DED45;
	Fri, 22 Nov 2024 10:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="E7Q1Trti"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F731DED5A;
	Fri, 22 Nov 2024 10:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732271537; cv=none; b=bD2alt+fo8o9NmLPC9nre9lFS9AVNDNj7oxcjvkBQg1TlAuTdeH4IcaB5j9xNP9bkTLpBmpirGVC6zV5uSr2j3LWbzmE1I5m8E+gNmmxIoMW0cNb/OCaKG8Ff+5W/+2o6MBSPGdCZTLTJbQPWDF3sAGkiOuP2LRLkK9KqCAjUos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732271537; c=relaxed/simple;
	bh=+/6ymI2gxodvy4p0D6VcTcHJuB8emEerX+YHB0Wuy38=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=nc2RSLbZ1xvU7a+B+r7qzMMIPhwU1iQ3hhtfGWHoWeqw3HeieW8wNy3h7zipQ+OeJFMK1bY7WugFa3jY+KRKWPoPb8N5tCuAkEwsgFIwomLNZVrKxarpSAP65fbt5TDAOEBxAK06DcCIotC5VSpFkFbUjYqgzWw9V53WNQ6iHhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=E7Q1Trti; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AM9O39t003950;
	Fri, 22 Nov 2024 10:32:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BA3Q4EFy5gQR7GO/ZWbGXRYPqEOGYTkutQVPdzM+ZrI=; b=E7Q1TrtiVHdqoCpQ
	pd1pf1FxJugJO0VPZiomMmaMnhjm8q3wB8p2M/DTzMLY9nE7BKxwmWyIH/EuFPpn
	nj8WvFFfgk2d+wtwz5vcjC6dLhG9/f0OrT6h/Vi24wo2EefA1TbjhXiDXSLL/c+/
	XLDobqtJ7g0d8wulaJ7iXkICFaZUM/Sk5qw1ymX4voWyfCn8HAPQsdA/mAnCjQGw
	vhl9mkHFS5CYfvodTSC8GABJ4s5slq76Xw73HLBXwfm9cT875iYxCWWZcSqh1Mz0
	v2Vuf0tVOrELOXddIJ/FTpS9VFiDlPKTdxWh9aysnfgXiVylCs5wGttbREdngutR
	B16yHg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431ce3f1ry-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 10:32:10 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AMAW986025645
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 10:32:09 GMT
Received: from hu-renjiang-sha.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 22 Nov 2024 02:32:06 -0800
From: Renjiang Han <quic_renjiang@quicinc.com>
Date: Fri, 22 Nov 2024 16:01:46 +0530
Subject: [PATCH 2/2] venus: pm_helpers: Use dev_pm_genpd_set_hwmode to
 switch GDSC mode on V4
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241122-switch_gdsc_mode-v1-2-365f097ecbb0@quicinc.com>
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
	<quic_renjiang@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732271519; l=2837;
 i=quic_renjiang@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=+/6ymI2gxodvy4p0D6VcTcHJuB8emEerX+YHB0Wuy38=;
 b=0x9OuHKbDiCM+9ofr80qnRwYqHSUcw6lCARacUr9j4nRNoKIEgid+ba8DGK4Dke3viH7QCkTt
 yVTYmFR8a/yD4FTYKM4Cj2UndKWEaMM0cTEPKqGh8PT/XsfRoR4MTi/
X-Developer-Key: i=quic_renjiang@quicinc.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SeERNGgbhgOSKcs7wqDCw6BemL2Qnpyb
X-Proofpoint-ORIG-GUID: SeERNGgbhgOSKcs7wqDCw6BemL2Qnpyb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 bulkscore=0 mlxscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411220089

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


