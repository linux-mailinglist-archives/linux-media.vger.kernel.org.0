Return-Path: <linux-media+bounces-33417-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 901ABAC46DC
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 05:33:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F18A77A2396
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 03:32:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CFD61D6DC5;
	Tue, 27 May 2025 03:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eK1TxagE"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B9B1C07F6;
	Tue, 27 May 2025 03:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748316799; cv=none; b=Cfh3I/RuPTx3K4PEZEn86DzmtyH31hLX4TJeEUH0YkYOSbxWWoOfxM8o+8ANfDFD+SmRC/LJbuyOU3DTsCk2kAtFTjAEKxTouRTkFxCZ6WXrT5uAmZTn0SjUeGBdXE/EijIoXxJ0ywruRNzQr0/FOZvKxKmVCixLNkf0g1RT/pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748316799; c=relaxed/simple;
	bh=1G+N7XFhSqHlTWFsUNVYOQRwB+DqZURPCiati1kAvrQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=QuM+x0stp22eMhFOK3D2fhG7k8S0DTlmBtkQCeS3rInEqYJ7vN8UpR72nVefU+HRj2nnjP7gmd3qv4hhQXgqAcGCnJOq0BOgb9V9EVOnpw+/WcBc37m7Cwl3EeCZlytWVaZr+aJweA3Uus62XQGXvnYgSn0Y+3JwbVi8edS915k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eK1TxagE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54QJgWiL016786;
	Tue, 27 May 2025 03:33:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0aQkkWAPT4WAXdqHo4u+o901VeUUYroSFStRn6hbNPo=; b=eK1TxagEmFS0NLF1
	HflUf8+JbAH4BdecPUQqpb89bm2h+WkoEwpQNEOFskY5PDakWCcHxRBdko/LqdIq
	qVxn8e2sXxGnZdPfQhI9uah6AnE0tZwPPu49Yu6mvLQhmklLiBFMoZywCBYFmJJ4
	fzNA32fkkUI4n5qN4NkW21eOhPmzc7J5QdlS626Twz/oB/tuuHK0dUoncEZxpwH9
	RVMTdroAju+oxr8nbjAVESQ4gHJ3cypzVmiE0F+pKT++L+Ear9XQmMpO+7fQNfXm
	tpGUGYtv4tB2WoKDQeKpRjRyyvICbv09uQl76YCMouKp+Ju8nDm7qS9pH2HssxPC
	BMOTiw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u3fq5q0m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 May 2025 03:33:13 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54R3XC3o012201
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 May 2025 03:33:12 GMT
Received: from hu-renjiang-sha.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 26 May 2025 20:33:09 -0700
From: Renjiang Han <quic_renjiang@quicinc.com>
Date: Tue, 27 May 2025 09:02:25 +0530
Subject: [PATCH v7 1/3] media: venus: pm_helpers: use opp-table for the
 frequency
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250527-add-venus-for-qcs615-v7-1-cca26e2768e3@quicinc.com>
References: <20250527-add-venus-for-qcs615-v7-0-cca26e2768e3@quicinc.com>
In-Reply-To: <20250527-add-venus-for-qcs615-v7-0-cca26e2768e3@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Renjiang Han
	<quic_renjiang@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748316786; l=3991;
 i=quic_renjiang@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=1G+N7XFhSqHlTWFsUNVYOQRwB+DqZURPCiati1kAvrQ=;
 b=Q0hOQjsUttK/JNWnz6vEqt4294llmtUkTHd+kpCC7+OK62OUn3inxl3rrSwYpC64jaHTTp0Pu
 +LLpNNb3VdbBxV5VWrC9QWGdzoA4/TopkY6luTfNwBvy27rN/LJ08yH
X-Developer-Key: i=quic_renjiang@quicinc.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: p3Jnz7DdtiuKkbPvEwZjhE5sXBlx65L3
X-Proofpoint-ORIG-GUID: p3Jnz7DdtiuKkbPvEwZjhE5sXBlx65L3
X-Authority-Analysis: v=2.4 cv=X8FSKHTe c=1 sm=1 tr=0 ts=6835327a cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=kOWA-MxIg7aVjduX2O8A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDAyNiBTYWx0ZWRfX47CWcYtfuusm
 CktRIAWesTmK2775vFKS1rVE3bcucJ6pZfE6E8AuCiLrJcNfNPs46vtS84oNG9qkBrIqkEPhnkU
 MuHb8jZEKSXEDdBglhK30DCCoSDdoyAZAmr4M6er1RqTmKoIa1fHK74biHnGL3T+S6+3Itwy7k+
 T1eohCnaYdjPbD6QU/cs/eirr2gMzJTw8LkBtorigp9oli/bOBkAK/P3+IDfI4BTxbE0KlRKyrZ
 1TdMtZG9rUOABqM7lquB38Rs+zcAeY57r78C4uJ9LQOGUGWUyLtG+MQl48BkkbgSvV8ipoxC0/G
 YTbUYX+5JM2adsraP30b4lB51edY80O47eKyYD/8XGTshN4FeQP5TO/DuhKyKSHTCYHJU18NRiY
 r9FkqbSpvsiXi6HmY3u04K2Vt9wpzBNzrxkxoDcdejBI8aVrNzcOQoJTpeOhw5ahE4lVugGs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_02,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505270026

The frequency value in the opp-table in the device tree and the freq_tbl
in the driver are the same.

Therefore, update pm_helpers.c to use the opp-table for frequency values
for the v4 core.
If getting data from the opp table fails, fall back to using the frequency
table.

Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
---
 drivers/media/platform/qcom/venus/pm_helpers.c | 53 +++++++++++++++++++-------
 1 file changed, 39 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index 409aa9bd0b5d099c993eedb03177ec5ed918b4a0..434dd66076e8faf7f3feac6c29152789f8d2f81b 100644
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
@@ -631,12 +637,15 @@ min_loaded_core(struct venus_inst *inst, u32 *min_coreid, u32 *min_load, bool lo
 
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
@@ -659,7 +668,11 @@ static int decide_core(struct venus_inst *inst)
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
@@ -1082,7 +1095,9 @@ static int load_scale_v4(struct venus_inst *inst)
 	unsigned int num_rows = core->res->freq_tbl_size;
 	struct device *dev = core->dev;
 	unsigned long freq = 0, freq_core1 = 0, freq_core2 = 0;
+	unsigned long max_freq = ULONG_MAX;
 	unsigned long filled_len = 0;
+	struct dev_pm_opp *opp;
 	int i, ret = 0;
 
 	for (i = 0; i < inst->num_input_bufs; i++)
@@ -1108,19 +1123,29 @@ static int load_scale_v4(struct venus_inst *inst)
 
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


