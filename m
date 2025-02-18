Return-Path: <linux-media+bounces-26268-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E85DA39942
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 11:40:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 116CF17849A
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 10:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 804E623FC59;
	Tue, 18 Feb 2025 10:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GbRG4nLt"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B5C235361;
	Tue, 18 Feb 2025 10:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739874833; cv=none; b=t8PPNkiqmnC/C9a4ToHZc2oEXocZa0zBMpv5wkfHiDJRfPMVzPc4e1xL6n4/RWfdE8VlNFMf+yU5CyQ4JTqVde5rWbrmnShYedSfaLoaNJLJ02yTebnMjoKELH1guJyCb3sPrkQwE3UpLnPNXKJhxi+EBNMg07t8mkvdmMlTMqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739874833; c=relaxed/simple;
	bh=Fy6ZNG4LBPE4olT1UNzpSGx+U/cAvTyDASJE/N7iD7U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=iCjRRah+TOX1FCrR/U/Na/DfGNTq8QZ6i20IkWncJ0Bu7qDy8AJZBWveg/31W89bIgMOeE9I2hJa38fPpnw54BvJVTfmdXUmkq7s8JOaQbC8VYN4uW9ufk2ewpOL2TdgaaOtkVR9p1Njw1EnIFhtilDSbKL+v7qvod0Jr/J1BBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GbRG4nLt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51I1pkY3003821;
	Tue, 18 Feb 2025 10:33:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2w78vZHB5Z050k2dhf6N8y/mLa46oinhxruN411J55g=; b=GbRG4nLt03gYJtFW
	/jmH7ovCmgHtaEApOMPTE1uLH1MR5Hy/rKW06SyX9IvMIdj+wt1VowrYI0djUAI+
	Ix2uA1T+BsHlbAmB4+fUdD2UmhLa1fg0kp3LSuw3inEVOEQrcj2oFy+d17fQAV3B
	ReudoLyGaFq0gut2WCLTBG9KVg+8uM6h+Abr8zZnwPjL1fRKrtbBoJUyrywqrDym
	xKiQhFXP1iV3AjhoCuYMXy2dj9hlQ37f1JIWh6hsEt9MX2O5N+n9E+jfMBvL687H
	8TmY2qkVnXFOlmnaTPuxlmlBS4SPczpoErRIVLIpMBZ5nVRQoKU77677+nf2Wu+n
	lvNXSQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ut7s4hsj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Feb 2025 10:33:46 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51IAXjFM015373
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Feb 2025 10:33:45 GMT
Received: from hu-renjiang-sha.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 18 Feb 2025 02:33:42 -0800
From: Renjiang Han <quic_renjiang@quicinc.com>
Date: Tue, 18 Feb 2025 16:03:20 +0530
Subject: [PATCH v4 1/2] venus: pm_helpers: add compatibility for
 dev_pm_genpd_set_hwmode on V4
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250218-switch_gdsc_mode-v4-1-546f6c925ae0@quicinc.com>
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
	<quic_renjiang@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739874819; l=5019;
 i=quic_renjiang@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=Fy6ZNG4LBPE4olT1UNzpSGx+U/cAvTyDASJE/N7iD7U=;
 b=/Q3OMBEU/zxb1ovm2CSDnywTXvbDeyG2qEIhkHORqX9S33KrJATkXUp+wpRlPgbqzu35RXyek
 pChiJqzeyQ+DLd14zZw6/oDtMUtCC5DF6HOYJyVtRLVV1VJlX7aJVY6
X-Developer-Key: i=quic_renjiang@quicinc.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: g4Ea4XeTeIkjsslNqMFFMTili-_p1BXw
X-Proofpoint-ORIG-GUID: g4Ea4XeTeIkjsslNqMFFMTili-_p1BXw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-18_04,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502180082

There are two ways to switch GDSC mode. One is to write the POWER_CONTROL
register and the other is to use dev_pm_genpd_set_hwmode(). However, they
rely on different clock driver flags. dev_pm_genpd_set_hwmode() depends on
the HW_CTRL_TRIGGER flag and POWER_CONTROL register depends on the HW_CTRL
flag.

By default, the dev_pm_genpd_set_hwmode() is used to switch the GDSC mode.
If it fails and dev_pm_genpd_set_hwmode() returns -EOPNOTSUPP, it means
that the clock driver uses the HW_CTRL flag. At this time, the GDSC mode
is switched to write the POWER_CONTROL register.

Clock driver is using HW_CTRL_TRIGGER flag with V6. So hwmode_dev is
always true on using V6 platform. Conversely, if hwmode_dev is false, this
platform must be not using V6. Therefore, replace IS_V6 in poweroff_coreid
with hwmode_dev. Also, with HW_CTRL_TRIGGER flag, the vcodec gdsc gets
enabled in SW mode by default. Therefore, before disabling the GDSC, GDSC
should be switched to SW mode so that GDSC gets enabled in SW mode in the
next enable.

Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
---
 drivers/media/platform/qcom/venus/core.h       |  2 ++
 drivers/media/platform/qcom/venus/pm_helpers.c | 38 ++++++++++++++------------
 2 files changed, 23 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 43532543292280be15adf688fc0c30f44e207c7f..0ccce89d3f54cf685ecce5b339a51e44f6ea3704 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -168,6 +168,7 @@ struct venus_format {
  * @root:	debugfs root directory
  * @venus_ver:	the venus firmware version
  * @dump_core:	a flag indicating that a core dump is required
+ * @hwmode_dev:	a flag indicating that HW_CTRL_TRIGGER is used in clock driver
  */
 struct venus_core {
 	void __iomem *base;
@@ -230,6 +231,7 @@ struct venus_core {
 		u32 rev;
 	} venus_ver;
 	unsigned long dump_core;
+	bool hwmode_dev;
 };
 
 struct vdec_controls {
diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index 33a5a659c0ada0ca97eebb5522c5f349f95c49c7..409aa9bd0b5d099c993eedb03177ec5ed918b4a0 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -412,9 +412,17 @@ static int vcodec_control_v4(struct venus_core *core, u32 coreid, bool enable)
 	u32 val;
 	int ret;
 
-	if (IS_V6(core))
-		return dev_pm_genpd_set_hwmode(core->pmdomains->pd_devs[coreid], !enable);
-	else if (coreid == VIDC_CORE_ID_1) {
+	ret = dev_pm_genpd_set_hwmode(core->pmdomains->pd_devs[coreid], !enable);
+	if (ret == -EOPNOTSUPP) {
+		core->hwmode_dev = false;
+		goto legacy;
+	}
+
+	core->hwmode_dev = true;
+	return ret;
+
+legacy:
+	if (coreid == VIDC_CORE_ID_1) {
 		ctrl = core->wrapper_base + WRAPPER_VCODEC0_MMCC_POWER_CONTROL;
 		stat = core->wrapper_base + WRAPPER_VCODEC0_MMCC_POWER_STATUS;
 	} else {
@@ -450,7 +458,7 @@ static int poweroff_coreid(struct venus_core *core, unsigned int coreid_mask)
 
 		vcodec_clks_disable(core, core->vcodec0_clks);
 
-		if (!IS_V6(core)) {
+		if (!core->hwmode_dev) {
 			ret = vcodec_control_v4(core, VIDC_CORE_ID_1, false);
 			if (ret)
 				return ret;
@@ -468,7 +476,7 @@ static int poweroff_coreid(struct venus_core *core, unsigned int coreid_mask)
 
 		vcodec_clks_disable(core, core->vcodec1_clks);
 
-		if (!IS_V6(core)) {
+		if (!core->hwmode_dev) {
 			ret = vcodec_control_v4(core, VIDC_CORE_ID_2, false);
 			if (ret)
 				return ret;
@@ -491,11 +499,9 @@ static int poweron_coreid(struct venus_core *core, unsigned int coreid_mask)
 		if (ret < 0)
 			return ret;
 
-		if (!IS_V6(core)) {
-			ret = vcodec_control_v4(core, VIDC_CORE_ID_1, true);
-			if (ret)
-				return ret;
-		}
+		ret = vcodec_control_v4(core, VIDC_CORE_ID_1, true);
+		if (ret)
+			return ret;
 
 		ret = vcodec_clks_enable(core, core->vcodec0_clks);
 		if (ret)
@@ -511,11 +517,9 @@ static int poweron_coreid(struct venus_core *core, unsigned int coreid_mask)
 		if (ret < 0)
 			return ret;
 
-		if (!IS_V6(core)) {
-			ret = vcodec_control_v4(core, VIDC_CORE_ID_2, true);
-			if (ret)
-				return ret;
-		}
+		ret = vcodec_control_v4(core, VIDC_CORE_ID_2, true);
+		if (ret)
+			return ret;
 
 		ret = vcodec_clks_enable(core, core->vcodec1_clks);
 		if (ret)
@@ -811,7 +815,7 @@ static int vdec_power_v4(struct device *dev, int on)
 	else
 		vcodec_clks_disable(core, core->vcodec0_clks);
 
-	vcodec_control_v4(core, VIDC_CORE_ID_1, false);
+	ret = vcodec_control_v4(core, VIDC_CORE_ID_1, false);
 
 	return ret;
 }
@@ -856,7 +860,7 @@ static int venc_power_v4(struct device *dev, int on)
 	else
 		vcodec_clks_disable(core, core->vcodec1_clks);
 
-	vcodec_control_v4(core, VIDC_CORE_ID_2, false);
+	ret = vcodec_control_v4(core, VIDC_CORE_ID_2, false);
 
 	return ret;
 }

-- 
2.34.1


