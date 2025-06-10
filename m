Return-Path: <linux-media+bounces-34401-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 862B8AD3179
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 11:15:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40D4A172186
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 09:15:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB54528AAFF;
	Tue, 10 Jun 2025 09:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mAwhOguK"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749CA28A73B;
	Tue, 10 Jun 2025 09:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749546831; cv=none; b=dLyarAaB/QPky5AH+vCFlyIi+qAY4cQVa85Pnmg2P/kMNTbxqM6no4S651uB62ZdIgo7mh7+nEOgc6lCxzxp/FLCnYR1KBPve//rIqv9tQ8EJi4IHzgBfou+aj38v0NP4ArulFGnNyPPJykjCpp9mcRiMSeE1K5/O/UnkIlu1Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749546831; c=relaxed/simple;
	bh=mviC3DiLTqSDHCf2Mmlx0mO/baJDlM/SKYg8G0TXZO8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=rNoVpK6vl24cG9hgWYtrdfExOm5SW8F80UrBLDJ4W/oc5ZSy5zttqCwgKMg+QAXUv5MdH0yIzHzIvu6H2zP7HDwvzTrb9VP3QKyc4Dy7zp8/1FYx2dV3/wqA8bwmo3qXgbWK2dTxVqjKczixeO5Q97fMC8Y6KbwkAGa18GHT/xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mAwhOguK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A82p6L011063;
	Tue, 10 Jun 2025 09:13:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=J2xVCfz2E9x7KccyjMbvYY
	AprZFCifNk3j8FevxZoLU=; b=mAwhOguK7um42lDBScmvy2viiI8q+tcyE9pfou
	6KkULrvp/ibTdS5ySdwa3XanrwCOLBzqwVHfG2BAuJJFpoIiZ9Cu/lxsfA01Jsjc
	qvGcRpPOchNlK6FuPhotl40l9gpEDtp+FpAyQ3LlTQQ1Fvmt+1kmAnuLVb1fu3tN
	HXRkjyV/Iyu4+z0sT+QpbxDFBfwp93Y/xWaKyh3WAz733zDU7SdAihJ5Gtfk5RdX
	yoiFeX1UNEplTGcy/adPfS0IlGUCwUSZNyZ5KYt29JHS22Z4w1aOnqna8JftQ37Q
	yoAs4n1MgdUylyLKubc6L+iQcA2Mg68KJOP9mQxC5pQoFwlA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dgxs3nk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 09:13:44 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55A9Dhmm024954
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 09:13:43 GMT
Received: from hu-renjiang-sha.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 10 Jun 2025 02:13:41 -0700
From: Renjiang Han <quic_renjiang@quicinc.com>
Date: Tue, 10 Jun 2025 14:43:34 +0530
Subject: [PATCH] media: venus: pm_helpers: use opp-table for the frequency
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250610-use_freq_with_opp_table-v1-1-7339d690fd1a@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAD33R2gC/yWN2wqDMBAFf0X2uYFcMFF/pUjYxLUG6qVJbAviv
 zfUxzkwcw5IFAMl6KoDIr1DCutSQNwq8BMuD2JhKAySy5prwdmeyI6RXvYT8mTXbbMZ3ZOYa4T
 Q0o/kHUKxt0hj+P7L9/7iYu3lIF8jOEzE/DrPIXeVk8Z7LRVx4agdSNQNJ8RWqJo3TiqDBlttF
 PTn+QPMLF50tQAAAA==
X-Change-ID: 20250610-use_freq_with_opp_table-b81162cfecba
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Renjiang Han <quic_renjiang@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749546821; l=5602;
 i=quic_renjiang@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=mviC3DiLTqSDHCf2Mmlx0mO/baJDlM/SKYg8G0TXZO8=;
 b=+AXwjIgUj5CL4bRqEIUTaQMSPYqGGLgTCwUtY6zQxJ/FYtfdkgk+yzD/RvNNY4MTdZbJOhOhg
 +TilvfwkXaNBxsaI2vrDUIROeePqlLrltPUpdQBojOjuhiw4Yp2lF7C
X-Developer-Key: i=quic_renjiang@quicinc.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: w32iXf4ihO9mnt4TUzyV7GfEHwRIq5li
X-Authority-Analysis: v=2.4 cv=HMbDFptv c=1 sm=1 tr=0 ts=6847f748 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=cOGbXxDr7hr4GsCVgbEA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: w32iXf4ihO9mnt4TUzyV7GfEHwRIq5li
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA3MCBTYWx0ZWRfX0geifC+OACpv
 QztitwhGsMwSHmhNlX8cS3q1b5sgFDz+UFtcUsVDgcqYiDSL8cSBvV9/RKmpkEMDSkhlcUWD2NG
 AmJ1uZJ0UNdtmlxGm8a5CJzobIYiNwE1hj5dVQJ5x/WnBcb4ddllmcb3ECo0LIEpl08+o4WXsmF
 y0eZqRF4v1MVCXUaZoTR/f0oK8CXqQEHdWQFVNi6GVKj+m6e3X5ciq+xQMWz+S5FJFqwlS9CLWk
 BGV0UusM1WoJEwdJUKstaQA78nNIkJhT/akGl/EMYe8AIGrqS89AzZMzJ+lBZtVQAnyqxWO8J6e
 s1ZUEqR9ufObnP5F4zVtE+b6SIWgGrJ7vkjCFZqfW/DjAlQq7+vMn94Gh0gBLK6Co0AxFNzX/eC
 Z18+RDhxAdCd4YAMeYeEC4oj6L6m/kBM5F3epmdBTzXbH0xo2IQkvc0tkQw5HC3vzY8wa3UY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_03,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100070

The frequency values in the opp-table of the device tree and the freq_tbl
in the driver are the same. So the driver can choose either table for freq
values.

However, some platforms (such as qcs615 and sc7180) use the same core but
have different frequency tables. Using the opp-table allows us to separate
the core description from the frequency data and supports the use of
fallback compatibles.

Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
---
The frequency values in the opp-table of the device tree and the freq_tbl
in the driver are the same. So the driver can choose either table for freq
values.

However, some platforms (such as qcs615 and sc7180) use the same core but
have different frequency tables. Using the opp-table allows us to separate
the core description from the frequency data and supports the use of
fallback compatibles.

Therefore, it is necessary to update pm_helpers.c to use the frequency
values from the opp-table for the v4 core.

Note:
Earlier discussion was concluded in [1] where it was agreed to rely on
opp-table for QCS615.

[1] https://lore.kernel.org/linux-arm-msm/c9b83c8b-68d1-43bc-99d6-d2d2b9e445f4@oss.qualcomm.com/
---
 drivers/media/platform/qcom/venus/pm_helpers.c | 58 +++++++++++++++-----------
 1 file changed, 34 insertions(+), 24 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index 409aa9bd0b5d099c993eedb03177ec5ed918b4a0..8dd5a9b0d060cddfeafd4da477ade0c7aeb6c390 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -41,16 +41,14 @@ static int core_clks_get(struct venus_core *core)
 static int core_clks_enable(struct venus_core *core)
 {
 	const struct venus_resources *res = core->res;
-	const struct freq_tbl *freq_tbl = core->res->freq_tbl;
-	unsigned int freq_tbl_size = core->res->freq_tbl_size;
-	unsigned long freq;
+	struct device *dev = core->dev;
+	unsigned long freq = 0;
+	struct dev_pm_opp *opp;
 	unsigned int i;
 	int ret;
 
-	if (!freq_tbl)
-		return -EINVAL;
-
-	freq = freq_tbl[freq_tbl_size - 1].freq;
+	opp = dev_pm_opp_find_freq_ceil(dev, &freq);
+	dev_pm_opp_put(opp);
 
 	for (i = 0; i < res->clks_num; i++) {
 		if (IS_V6(core)) {
@@ -636,7 +634,9 @@ static int decide_core(struct venus_inst *inst)
 	u32 min_coreid, min_load, cur_inst_load;
 	u32 min_lp_coreid, min_lp_load, cur_inst_lp_load;
 	struct hfi_videocores_usage_type cu;
-	unsigned long max_freq;
+	unsigned long max_freq = ULONG_MAX;
+	struct device *dev = core->dev;
+	struct dev_pm_opp *opp;
 	int ret = 0;
 
 	if (legacy_binding) {
@@ -659,7 +659,8 @@ static int decide_core(struct venus_inst *inst)
 	cur_inst_lp_load *= inst->clk_data.low_power_freq;
 	/*TODO : divide this inst->load by work_route */
 
-	max_freq = core->res->freq_tbl[0].freq;
+	opp = dev_pm_opp_find_freq_floor(dev, &max_freq);
+	dev_pm_opp_put(opp);
 
 	min_loaded_core(inst, &min_coreid, &min_load, false);
 	min_loaded_core(inst, &min_lp_coreid, &min_lp_load, true);
@@ -949,7 +950,10 @@ static int core_resets_get(struct venus_core *core)
 static int core_get_v4(struct venus_core *core)
 {
 	struct device *dev = core->dev;
+	const struct freq_tbl *freq_tbl = core->res->freq_tbl;
+	unsigned int num_rows = core->res->freq_tbl_size;
 	const struct venus_resources *res = core->res;
+	unsigned int i;
 	int ret;
 
 	ret = core_clks_get(core);
@@ -986,9 +990,17 @@ static int core_get_v4(struct venus_core *core)
 
 	if (core->res->opp_pmdomain) {
 		ret = devm_pm_opp_of_add_table(dev);
-		if (ret && ret != -ENODEV) {
-			dev_err(dev, "invalid OPP table in device tree\n");
-			return ret;
+		if (ret) {
+			if (ret == -ENODEV) {
+				for (i = 0; i < num_rows; i++) {
+					ret = dev_pm_opp_add(dev, freq_tbl[i].freq, 0);
+					if (ret)
+						return ret;
+				}
+			} else {
+				dev_err(dev, "invalid OPP table in device tree\n");
+				return ret;
+			}
 		}
 	}
 
@@ -1078,11 +1090,11 @@ static unsigned long calculate_inst_freq(struct venus_inst *inst,
 static int load_scale_v4(struct venus_inst *inst)
 {
 	struct venus_core *core = inst->core;
-	const struct freq_tbl *table = core->res->freq_tbl;
-	unsigned int num_rows = core->res->freq_tbl_size;
 	struct device *dev = core->dev;
 	unsigned long freq = 0, freq_core1 = 0, freq_core2 = 0;
+	unsigned long max_freq = ULONG_MAX;
 	unsigned long filled_len = 0;
+	struct dev_pm_opp *opp;
 	int i, ret = 0;
 
 	for (i = 0; i < inst->num_input_bufs; i++)
@@ -1108,20 +1120,18 @@ static int load_scale_v4(struct venus_inst *inst)
 
 	freq = max(freq_core1, freq_core2);
 
-	if (freq > table[0].freq) {
-		dev_dbg(dev, VDBGL "requested clock rate: %lu scaling clock rate : %lu\n",
-			freq, table[0].freq);
+	opp = dev_pm_opp_find_freq_floor(dev, &max_freq);
+	dev_pm_opp_put(opp);
 
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
-		}
-	}
+	opp = dev_pm_opp_find_freq_ceil(dev, &freq);
+	dev_pm_opp_put(opp);
 
 set_freq:
 

---
base-commit: b27cc623e01be9de1580eaa913508b237a7a9673
change-id: 20250610-use_freq_with_opp_table-b81162cfecba

Best regards,
-- 
Renjiang Han <quic_renjiang@quicinc.com>


