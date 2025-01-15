Return-Path: <linux-media+bounces-24765-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F11A11E2B
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 10:37:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F5FD3AC45A
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 09:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6887F244FA5;
	Wed, 15 Jan 2025 09:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="c5pJu79Y"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2310D2442EA;
	Wed, 15 Jan 2025 09:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736933540; cv=none; b=ZzOV2OjF3hw0+u14fI5bCr5Wrk2BmJ6P5GeAkLNbz4lL0KDNT63lDJ517U8WAPM61T9xuNa4sqATcorNlvTV/zWtayFx/JJBHCxoLuUra7mLVgnev99Nmof3Xd8tRM4/3UTnURMnfCCMga4APBL8cZAdX1isoBHcS92Zrstb35g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736933540; c=relaxed/simple;
	bh=jtOT3BkYpNrmH1/Wt1QRdW0HL0hJh6Rk9yEHeCTvgHI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=b6Ct2CTCHPXGW2zj2qXHxpt8wzbYDdALKcDEx6iJgGC37p1NTwBKtdCl/4zY5rdJqbCNCZP9gDi7eo5B1rva6SOaHLDRt7Qw5ZSwMrv6INjQMqomQIdimwRHHf94O+n7igkZBfm9sBzWauCVHLfFb5sojx/bozzJmCvBCqCKEds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=c5pJu79Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50F1Yksc007974;
	Wed, 15 Jan 2025 09:32:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5QoHl5PToS69h8PcT/Nc6FR56kg251h5LwgT5gCvqwE=; b=c5pJu79YE9DJU2yU
	leX1y2XXpp+HZrvMHNuKDs8x0NrzKUWN/GGa2XQAdJDaY7oyCX/AD8VMhoAzMDLB
	H4rtE9G7+U/vQrxX4fscIpmOjCa2EFlKDelnWxjddF6Ft8ZqHCda0KR07cLMhoc5
	tbdsy+qtwJ1qU6g5mmVJdxEyBMc9VGRIQG7uuGYUfOOGIqarw5otw0+T7KcPs39+
	UOynqQp8kzp3oktsKkvtarEm4EakPUZtjj4xsnln8lERy8zp48grNe6KFxDIdGiZ
	lhPoxK8YBhaYcd4AGAax+JcnOzz/zoEHTKAyYdbelNcmAiH0Pz+9Nh/slOetQpSw
	waiYWQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4463frs2qm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 09:32:11 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50F9WAHY030710
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 09:32:10 GMT
Received: from hu-renjiang-sha.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 15 Jan 2025 01:32:07 -0800
From: Renjiang Han <quic_renjiang@quicinc.com>
Date: Wed, 15 Jan 2025 15:00:54 +0530
Subject: [PATCH v3 3/3] venus: pm_helpers: Remove dead code and simplify
 power management
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250115-switch_gdsc_mode-v3-3-9a24d2fd724c@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736933518; l=5198;
 i=quic_renjiang@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=jtOT3BkYpNrmH1/Wt1QRdW0HL0hJh6Rk9yEHeCTvgHI=;
 b=9kdGYnWZE8MzKOGWBKZJW0ZYnn82FmN41lclkK/1T3JELaxcAlRspEN+NosRI+8Ot8HLzLG7Q
 5eITMhts4R4BsHk8Wh92kZTw96a9p4QjAp2yEj6AJlxHs/GOTuZdptZ
X-Developer-Key: i=quic_renjiang@quicinc.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _jwoo1-dxA5GmQnLxG9ruNOzPHHsniZr
X-Proofpoint-GUID: _jwoo1-dxA5GmQnLxG9ruNOzPHHsniZr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_03,2025-01-15_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 spamscore=0 suspectscore=0 priorityscore=1501
 mlxscore=0 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501150072

The functions poweron_coreid(), poweroff_coreid() and vcodec_control_v4()
are only used for v4 and v6. Remove the dead code by:
- Removing vcodec_control_v4() function
- Removing the check for !IS_V6(core) && !IS_V4(core) in poweron_coreid()
and poweroff_coreid()

Directly call dev_pm_genpd_set_hwmode() without vcodec_control_v4().

Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
---
 drivers/media/platform/qcom/venus/pm_helpers.c | 73 +++-----------------------
 1 file changed, 8 insertions(+), 65 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index a2062b366d4aedba3eb5e4be456a005847eaec0b..846aa765edbb33df0b0c39bb463dd68c16ce1b68 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -406,74 +406,29 @@ static const struct venus_pm_ops pm_ops_v3 = {
 	.load_scale = load_scale_v1,
 };
 
-static int vcodec_control_v4(struct venus_core *core, u32 coreid, bool enable)
-{
-	void __iomem *ctrl, *stat;
-	u32 val;
-	int ret;
-
-	if (IS_V6(core) || IS_V4(core))
-		return dev_pm_genpd_set_hwmode(core->pmdomains->pd_devs[coreid], !enable);
-	else if (coreid == VIDC_CORE_ID_1) {
-		ctrl = core->wrapper_base + WRAPPER_VCODEC0_MMCC_POWER_CONTROL;
-		stat = core->wrapper_base + WRAPPER_VCODEC0_MMCC_POWER_STATUS;
-	} else {
-		ctrl = core->wrapper_base + WRAPPER_VCODEC1_MMCC_POWER_CONTROL;
-		stat = core->wrapper_base + WRAPPER_VCODEC1_MMCC_POWER_STATUS;
-	}
-
-	if (enable) {
-		writel(0, ctrl);
-
-		ret = readl_poll_timeout(stat, val, val & BIT(1), 1, 100);
-		if (ret)
-			return ret;
-	} else {
-		writel(1, ctrl);
-
-		ret = readl_poll_timeout(stat, val, !(val & BIT(1)), 1, 100);
-		if (ret)
-			return ret;
-	}
-
-	return 0;
-}
-
 static int poweroff_coreid(struct venus_core *core, unsigned int coreid_mask)
 {
 	int ret;
 
 	if (coreid_mask & VIDC_CORE_ID_1) {
-		ret = vcodec_control_v4(core, VIDC_CORE_ID_1, true);
+		ret = dev_pm_genpd_set_hwmode(core->pmdomains->pd_devs[VIDC_CORE_ID_1], false);
 		if (ret)
 			return ret;
 
 		vcodec_clks_disable(core, core->vcodec0_clks);
 
-		if (!IS_V6(core) && !IS_V4(core)) {
-			ret = vcodec_control_v4(core, VIDC_CORE_ID_1, false);
-			if (ret)
-				return ret;
-		}
-
 		ret = pm_runtime_put_sync(core->pmdomains->pd_devs[1]);
 		if (ret < 0)
 			return ret;
 	}
 
 	if (coreid_mask & VIDC_CORE_ID_2) {
-		ret = vcodec_control_v4(core, VIDC_CORE_ID_2, true);
+		ret = dev_pm_genpd_set_hwmode(core->pmdomains->pd_devs[VIDC_CORE_ID_2], false);
 		if (ret)
 			return ret;
 
 		vcodec_clks_disable(core, core->vcodec1_clks);
 
-		if (!IS_V6(core) && !IS_V4(core)) {
-			ret = vcodec_control_v4(core, VIDC_CORE_ID_2, false);
-			if (ret)
-				return ret;
-		}
-
 		ret = pm_runtime_put_sync(core->pmdomains->pd_devs[2]);
 		if (ret < 0)
 			return ret;
@@ -491,17 +446,11 @@ static int poweron_coreid(struct venus_core *core, unsigned int coreid_mask)
 		if (ret < 0)
 			return ret;
 
-		if (!IS_V6(core) && !IS_V4(core)) {
-			ret = vcodec_control_v4(core, VIDC_CORE_ID_1, true);
-			if (ret)
-				return ret;
-		}
-
 		ret = vcodec_clks_enable(core, core->vcodec0_clks);
 		if (ret)
 			return ret;
 
-		ret = vcodec_control_v4(core, VIDC_CORE_ID_1, false);
+		ret = dev_pm_genpd_set_hwmode(core->pmdomains->pd_devs[VIDC_CORE_ID_1], true);
 		if (ret < 0)
 			return ret;
 	}
@@ -511,17 +460,11 @@ static int poweron_coreid(struct venus_core *core, unsigned int coreid_mask)
 		if (ret < 0)
 			return ret;
 
-		if (!IS_V6(core) && !IS_V4(core)) {
-			ret = vcodec_control_v4(core, VIDC_CORE_ID_2, true);
-			if (ret)
-				return ret;
-		}
-
 		ret = vcodec_clks_enable(core, core->vcodec1_clks);
 		if (ret)
 			return ret;
 
-		ret = vcodec_control_v4(core, VIDC_CORE_ID_2, false);
+		ret = dev_pm_genpd_set_hwmode(core->pmdomains->pd_devs[VIDC_CORE_ID_2], true);
 		if (ret < 0)
 			return ret;
 	}
@@ -802,7 +745,7 @@ static int vdec_power_v4(struct device *dev, int on)
 	if (!legacy_binding)
 		return 0;
 
-	ret = vcodec_control_v4(core, VIDC_CORE_ID_1, true);
+	ret = dev_pm_genpd_set_hwmode(core->pmdomains->pd_devs[VIDC_CORE_ID_1], false);
 	if (ret)
 		return ret;
 
@@ -811,7 +754,7 @@ static int vdec_power_v4(struct device *dev, int on)
 	else
 		vcodec_clks_disable(core, core->vcodec0_clks);
 
-	vcodec_control_v4(core, VIDC_CORE_ID_1, false);
+	dev_pm_genpd_set_hwmode(core->pmdomains->pd_devs[VIDC_CORE_ID_1], true);
 
 	return ret;
 }
@@ -847,7 +790,7 @@ static int venc_power_v4(struct device *dev, int on)
 	if (!legacy_binding)
 		return 0;
 
-	ret = vcodec_control_v4(core, VIDC_CORE_ID_2, true);
+	ret = dev_pm_genpd_set_hwmode(core->pmdomains->pd_devs[VIDC_CORE_ID_2], false);
 	if (ret)
 		return ret;
 
@@ -856,7 +799,7 @@ static int venc_power_v4(struct device *dev, int on)
 	else
 		vcodec_clks_disable(core, core->vcodec1_clks);
 
-	vcodec_control_v4(core, VIDC_CORE_ID_2, false);
+	dev_pm_genpd_set_hwmode(core->pmdomains->pd_devs[VIDC_CORE_ID_2], true);
 
 	return ret;
 }

-- 
2.34.1


