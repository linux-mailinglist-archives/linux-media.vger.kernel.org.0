Return-Path: <linux-media+bounces-23553-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3289F4756
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 10:23:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E816D18913F1
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 09:22:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B3BB1F1312;
	Tue, 17 Dec 2024 09:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GY+YKShX"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDD41DEFCD;
	Tue, 17 Dec 2024 09:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734427113; cv=none; b=shS4ZP5njRuZ6uDmnYMkkSVzFBYIfCHIE3LMc/H1BdbRNmmomwdEZGIDmERi5my9RqaVPQXI1TXQsfRadyuEem4EOd2m+LrDBS7dCHlDkGP1yEYKw+wjHQdRoyfThmni3BXazvzqkf3RoqPZiJzbC3xipg5iETbmPFLqUfqTQ4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734427113; c=relaxed/simple;
	bh=lbGubnC5ljfHPKTpjMM8t1KJhwu4tczHJG9CDSSHgZQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=FhhwZytMqfEg+qmDEd38aZAoohXAbwojO+VsCSZYVgvuAz791gPl4WzADbxl2Rxq05feu4BnAa8bpMG6NxYl0LclQNjE0kTeyJ/e5hf3ZRus5MynyluSTEGoOsY0VQ0/aEDnODrKBh5TUXBeKFZySaImUCeo63JKprSmSr7/fMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GY+YKShX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH95f0U023906;
	Tue, 17 Dec 2024 09:18:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jskFk3aNdibrhc0qsYRPx86ht7Uv3FtKg5xBPZs9ki8=; b=GY+YKShXOSg/skRX
	uBTaRdzCHKBDhQlyrw+FopurULRX25xNYcSl7sPbp7paZAqk74kgf5Q8wUit78Lj
	IfSJs+T8EmfICjg08t5r1/EDJWrYnKJGIef2sutmU3MoDYhjmytAIbTlfm6+lQQc
	XTfVx6rLaJiDMjMWM7VLgRJnHfJ8BEKsNmVDzVECJFnHCIRzZrVLEOWeaIJMJKdp
	XegiNNkocVCKj3Vq4n9pRrjw31li22ZOQi+CTlxW7RsXj2Q+bndiK0qYGKQOWpLT
	WnwgmbfAxUfxatj+9vDlAdUE3hwp1s9M2MpER8g0I6ayFnYJ6YU0piwuReYJMd1y
	kGkUHg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43k6c8g17h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 09:18:24 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BH9IN7M030620
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 09:18:23 GMT
Received: from hu-renjiang-sha.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 17 Dec 2024 01:18:19 -0800
From: Renjiang Han <quic_renjiang@quicinc.com>
Date: Tue, 17 Dec 2024 14:47:38 +0530
Subject: [PATCH v5 2/4] media: venus: core: use opp-table for the frequency
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241217-add-venus-for-qcs615-v5-2-747395d9e630@quicinc.com>
References: <20241217-add-venus-for-qcs615-v5-0-747395d9e630@quicinc.com>
In-Reply-To: <20241217-add-venus-for-qcs615-v5-0-747395d9e630@quicinc.com>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Stanimir
 Varbanov" <stanimir.varbanov@linaro.org>,
        Renjiang Han
	<quic_renjiang@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734427092; l=3890;
 i=quic_renjiang@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=lbGubnC5ljfHPKTpjMM8t1KJhwu4tczHJG9CDSSHgZQ=;
 b=nhkSPlCydd/6U9eKysHWqdbBT9LYOHk7Ko1qYUqsci7eitTO8R+fKiduoWu1t3L7ntVRFCIZ/
 UZ5FOZaQzkYC2QG+vywcEqZGDzp4drbt8Z88+1WbiCKSFAMRm8+srh6
X-Developer-Key: i=quic_renjiang@quicinc.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PKJbEcKJqBR0OxzduPVIUPW4nIa1mQNv
X-Proofpoint-ORIG-GUID: PKJbEcKJqBR0OxzduPVIUPW4nIa1mQNv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 mlxlogscore=999 malwarescore=0 clxscore=1015
 impostorscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412170076

Get frequency value from the opp-table of devicetree for the v4 core.
For compatibility, if getting data from the opp table fails, the data
in the frequency table will be used.

Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
---
 drivers/media/platform/qcom/venus/pm_helpers.c | 53 +++++++++++++++++++-------
 1 file changed, 39 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index 33a5a659c0ada0ca97eebb5522c5f349f95c49c7..b61c0ad152878870b7223efa274e137d3636433b 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -43,14 +43,20 @@ static int core_clks_enable(struct venus_core *core)
 	const struct venus_resources *res = core->res;
 	const struct freq_tbl *freq_tbl = core->res->freq_tbl;
 	unsigned int freq_tbl_size = core->res->freq_tbl_size;
+	struct device *dev = core->dev;
+	struct dev_pm_opp *opp;
 	unsigned long freq;
 	unsigned int i;
 	int ret;
 
-	if (!freq_tbl)
-		return -EINVAL;
-
-	freq = freq_tbl[freq_tbl_size - 1].freq;
+	opp = dev_pm_opp_find_freq_ceil(dev, &freq);
+	if (IS_ERR(opp)) {
+		if (!freq_tbl)
+			return -EINVAL;
+		freq = freq_tbl[freq_tbl_size - 1].freq;
+	} else {
+		dev_pm_opp_put(opp);
+	}
 
 	for (i = 0; i < res->clks_num; i++) {
 		if (IS_V6(core)) {
@@ -627,12 +633,15 @@ min_loaded_core(struct venus_inst *inst, u32 *min_coreid, u32 *min_load, bool lo
 
 static int decide_core(struct venus_inst *inst)
 {
+	const struct freq_tbl *freq_tbl = inst->core->res->freq_tbl;
 	const u32 ptype = HFI_PROPERTY_CONFIG_VIDEOCORES_USAGE;
 	struct venus_core *core = inst->core;
 	u32 min_coreid, min_load, cur_inst_load;
 	u32 min_lp_coreid, min_lp_load, cur_inst_lp_load;
 	struct hfi_videocores_usage_type cu;
-	unsigned long max_freq;
+	unsigned long max_freq = ULONG_MAX;
+	struct device *dev = core->dev;
+	struct dev_pm_opp *opp;
 	int ret = 0;
 
 	if (legacy_binding) {
@@ -655,7 +664,11 @@ static int decide_core(struct venus_inst *inst)
 	cur_inst_lp_load *= inst->clk_data.low_power_freq;
 	/*TODO : divide this inst->load by work_route */
 
-	max_freq = core->res->freq_tbl[0].freq;
+	opp = dev_pm_opp_find_freq_floor(dev, &max_freq);
+	if (IS_ERR(opp))
+		max_freq = freq_tbl[0].freq;
+	else
+		dev_pm_opp_put(opp);
 
 	min_loaded_core(inst, &min_coreid, &min_load, false);
 	min_loaded_core(inst, &min_lp_coreid, &min_lp_load, true);
@@ -1078,7 +1091,9 @@ static int load_scale_v4(struct venus_inst *inst)
 	unsigned int num_rows = core->res->freq_tbl_size;
 	struct device *dev = core->dev;
 	unsigned long freq = 0, freq_core1 = 0, freq_core2 = 0;
+	unsigned long max_freq = ULONG_MAX;
 	unsigned long filled_len = 0;
+	struct dev_pm_opp *opp;
 	int i, ret = 0;
 
 	for (i = 0; i < inst->num_input_bufs; i++)
@@ -1104,19 +1119,29 @@ static int load_scale_v4(struct venus_inst *inst)
 
 	freq = max(freq_core1, freq_core2);
 
-	if (freq > table[0].freq) {
-		dev_dbg(dev, VDBGL "requested clock rate: %lu scaling clock rate : %lu\n",
-			freq, table[0].freq);
+	opp = dev_pm_opp_find_freq_floor(dev, &max_freq);
+	if (IS_ERR(opp))
+		max_freq = table[0].freq;
+	else
+		dev_pm_opp_put(opp);
 
-		freq = table[0].freq;
+	if (freq > max_freq) {
+		dev_dbg(dev, VDBGL "requested clock rate: %lu scaling clock rate : %lu\n",
+			freq, max_freq);
+		freq = max_freq;
 		goto set_freq;
 	}
 
-	for (i = num_rows - 1 ; i >= 0; i--) {
-		if (freq <= table[i].freq) {
-			freq = table[i].freq;
-			break;
+	opp = dev_pm_opp_find_freq_ceil(dev, &freq);
+	if (IS_ERR(opp)) {
+		for (i = num_rows - 1 ; i >= 0; i--) {
+			if (freq <= table[i].freq) {
+				freq = table[i].freq;
+				break;
+			}
 		}
+	} else {
+		dev_pm_opp_put(opp);
 	}
 
 set_freq:

-- 
2.34.1


