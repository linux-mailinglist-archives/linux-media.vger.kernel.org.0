Return-Path: <linux-media+bounces-33618-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A66FAC871B
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 06:03:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14C9C1BC1435
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 04:03:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5485E13B58A;
	Fri, 30 May 2025 04:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CmXEfj4P"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBF22AF1E;
	Fri, 30 May 2025 04:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748577793; cv=none; b=pI3NhPUiUqUrAo+T0xsMT9kWE+5ca8AD/UCEGS58FjwH9AhiWBaY0c4fQM+u3b5HSQq3r90FMeW11wwpjqabfh1cjw90zi0/Q3gnqqOktAuX51l3xPF+KtoiJ+0NcU2XnuUtJSx2bzOOjH1uBGl5Nwjr8kv7X2sDoGFM458ZZeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748577793; c=relaxed/simple;
	bh=ueslHsS3cZs6fgJZNQCkbVB3I9Yw+FBTMe0of5SzuK0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=DVfaAA8VT018QpuSkL8hpnwabLWJcFwOwKvOBHHzkLcn42wfSywv9/BsvrGciYdvwv2sCXYxv0BaLfPgaMgEcElIT0oEuyqynwOSxTP4hWrwElM5r7AAnJdl+toN4dLtkhcckiFBoxvKtCo5OJ5uM60VLV89uceZHHoB3SsMx18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CmXEfj4P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54U0Ht2E011636;
	Fri, 30 May 2025 04:03:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/0TVmCqgtdu4BzS3uwceYdO0gyk4w3MjOVOxBx+t0xI=; b=CmXEfj4PveUM2phW
	ViVFzCbdh2b9/BsFb7U26oI+qRA1dQZssMq7YReP3QFBMyKqmYn0Y5eWkiDiCYlg
	XT7IjbPpo1BlDENqqIH3Qkmi/2qPCQGK7q4HWlJuX4HbkRju1JCyXyOP59CHrYNP
	1je2EdBE6n7zGecwj3y3u0I6n/bixu9djL3ViJ7yAa+0nGCQUYu9dpKOIJkAkpE7
	HW4tZ/T0mo8ZXnM4Q+Yme4XGlT83LDFcOzSKKZivksiDdWojVA0fmwl+M9cCGNUH
	6xKFXLVddLLPQwPHPQG/g4xMBZlKvFxbk8NFlm7ngskCsuk3fnqeqEZIGWgsQb7o
	dfeVng==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6g97s95-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 04:03:07 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54U436di002828
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 04:03:06 GMT
Received: from hu-renjiang-sha.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 29 May 2025 21:03:03 -0700
From: Renjiang Han <quic_renjiang@quicinc.com>
Date: Fri, 30 May 2025 09:32:13 +0530
Subject: [PATCH v8 1/3] media: venus: pm_helpers: use opp-table for the
 frequency
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250530-add-venus-for-qcs615-v8-1-c0092ac616d0@quicinc.com>
References: <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
In-Reply-To: <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748577780; l=4048;
 i=quic_renjiang@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=ueslHsS3cZs6fgJZNQCkbVB3I9Yw+FBTMe0of5SzuK0=;
 b=gwWPDRJ8jjIIPg32P3Hw4RyyXVYP+vsIg6aT3l+r8uPkRYKmiY6f8UEhm63gkP/hTxZxRyOQf
 Gruk4vNVTU5Ahg7yJXsJj/4vnW8rjPUh2BmInwrYlNTnV5Ag/1wmiex
X-Developer-Key: i=quic_renjiang@quicinc.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=68392dfb cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=kOWA-MxIg7aVjduX2O8A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: FeCgZlbxoaLUg1CBy4XhGnlTKkGZzovf
X-Proofpoint-GUID: FeCgZlbxoaLUg1CBy4XhGnlTKkGZzovf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDAzMSBTYWx0ZWRfX0LCDgSBrQex4
 dUHjudIEGd9TEVjjo/53JSYtutymwPnGQ7eKesp2U0mJi1mmNy4Mbny5nsCY7wNrEcBjYnLrc94
 iHm6qRrYvvR616cDw4Z2BOS2IE2tcL8yGTrOSFflqI74rIHWi3iRoaC/gWOquCeBjJwinkJMK/F
 QSwgmivNGsamouyb7vXkytkdLltmOsSNDQmJVpRlj/KnlApixxs7AlUpZsPaCjBmubD+5gpRoFV
 2EXya7i4ko93of1LHR5lTXQ/F8HeLBqb2nrrcRYxKp7njx+rY6JDgwlts++x/CncYJxH/aNEW63
 JtyuyNi9vaH0koH4t6XuhRPH4+T6Uwn2pVSnwiNA08cc/G+YeuJDJSkXdDw+rzeulVe/MNc29+B
 QkVAjzQ+9xW2c+B2mGqodUPgwa2VKZ+Fr/msnSv4AHpznOb3CK9bF6MDjyflBf1ax+46ln+Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_01,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300031

The frequency value in the opp-table in the device tree and the freq_tbl
in the driver are the same.

Therefore, update pm_helpers.c to use the opp-table for frequency values
for the v4 core.
If getting data from the opp table fails, fall back to using the frequency
table.

Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
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


