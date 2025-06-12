Return-Path: <linux-media+bounces-34568-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF46AD6595
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 04:24:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C36E27ACC27
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 02:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 747E81C1F12;
	Thu, 12 Jun 2025 02:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Kn7/h13j"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3D022094;
	Thu, 12 Jun 2025 02:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749695071; cv=none; b=LIJRAYSrdWtcYDccpTDhE/hyLoNnH9ooYDh9WKcUStvFkO3BDtC5TSdyo6Y+7gnspWl0Y7ikPDLCYvFzAIdEJauoC34qBpy0+yniTKRPWNbveq1XKLRlMQdQt3Pw193BTqueoSlYnjDj9X8tO8X9AYIh0vrfsb/DiiUHsRenNbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749695071; c=relaxed/simple;
	bh=pwJY3bhQYqgTKmXRUML7AqBhnu8390tFpj9wYBfeGkA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=ctEhV/h15loi5dMIkFgTWA3luGUpHJPbBPawQkHohAd9w8y78hxonwy+th9+fGDujaObmPSE7u5xVM8UxadFNtYa7iHId8kJqi0mnDd5NBAcYi3nnocYZ0i8BjNrTYOsQnTCUOMfmhhvJiZxVLdYyHPo2zVaBdxCca2HzAd6pwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Kn7/h13j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55BJVtag002420;
	Thu, 12 Jun 2025 02:24:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CmFo3DOd0vvq/X6onrbtTX
	HcoZMukbVRpo7J6kI4gQU=; b=Kn7/h13jGUldVmxCBEYivQOdPeIJ3uYAGDEb5E
	0GeHrOJuFcBQoT8sj0/YA6dRpqaRnq2JB/IcxTT8Ty+XcM2HwN4nysjIeO8880t8
	fRPb1QE8jbxG5KFbwsSZ3aZwqXvPYO8uEmAEFJcxwcbfn+oaA9UzI9GvrVAdhQ5C
	3EWzaa5+LfVhRKJPb1fnLMOCjuoORq5i+GE/sZ+hiLVJZ43HOWW7EMYHACHr43ac
	Edky5DYZdU+dwmWQRK8uooMJjhaOxvE3AHVK3/2ThbMsVm0uAzpJ5PY6AEEaIwVT
	j5vJlbrq8c2WHEsQho8yWNS4UtKUjx9Diuilfqwm9RbaqErA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dgxy6ub-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 02:24:26 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55C2OPAQ021350
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 02:24:25 GMT
Received: from hu-renjiang-sha.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 11 Jun 2025 19:24:23 -0700
From: Renjiang Han <quic_renjiang@quicinc.com>
Date: Thu, 12 Jun 2025 07:53:51 +0530
Subject: [PATCH v2] media: venus: pm_helpers: use opp-table for the
 frequency
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250612-use_freq_with_opp_table-v2-1-42b03648fba8@quicinc.com>
X-B4-Tracking: v=1; b=H4sIADY6SmgC/4WOQW7DIBBFr2LNulQMyGCyyj2qyAI8rkdqbBeIk
 yry3UudA3T5Rvpv3hMyJaYMp+YJiTbOvMwV1FsDcfLzJwkeKoOSqpUGpbhl6sdE3/2dy9Qv69o
 XH75IhA7RqDhSDB7qek008uMwf1xeXFe3+qC8jhB8JhGX65XLqQnKxmiUJomB3EDYdpK8d6hb2
 QWlrbfeGavhzzVxLkv6OaI3PGT/9m0oUFit3WCcHAf05xoTeY7vNQEu+77/AjB7/fkMAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749695063; l=5423;
 i=quic_renjiang@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=pwJY3bhQYqgTKmXRUML7AqBhnu8390tFpj9wYBfeGkA=;
 b=5a4WBk8hoLlLcxHN+wgD6Dl1s22pqv/c6GkGtyXxkjtfaQOyjUA4G9TAJ5GQUIOVrDfPPWz6T
 gA0Czn8pJh7Azgpe9nD13xuZQZKU2ncZvsIlArfN2wpvlm4qD5AGFbF
X-Developer-Key: i=quic_renjiang@quicinc.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: KQ28OqB1Vz-MJ12SGT-fPTXkYV6RsM5i
X-Authority-Analysis: v=2.4 cv=HMbDFptv c=1 sm=1 tr=0 ts=684a3a5a cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=pK6XJeN1Vos_nwhmKbkA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: KQ28OqB1Vz-MJ12SGT-fPTXkYV6RsM5i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDAxNyBTYWx0ZWRfX40VmionRFlIq
 vfNbW6CLOn3gmfmhR38tPpJMEHR8pSgfMy8gkkE36hbzobKHJEb/sAZU1F+ZRCsElA/1sXrBnI2
 ClUkrGle5L+U8bUwpOBDK/l74G90J2LlnbyQpMpGlF21LuqzJJ7oooTYj4VTmtMPbRJiTynGU1S
 reGmJ+zQVg+S18A/5Deow0hU5Eeswupw0QJG7szUZ39H/LaGVp30Hx5DQ1yikj2rNP7sUGZHxgI
 CM/VsGdUmV/IOF3uKfFHf3kgdaJMh+gEQbRuQQmcs+jm+AhAqCtrgQHuGPr4vzZzVUwO7d3o0HK
 PUdmeG44lqgEV9clg0XC7UmGbSlqQxQdRnooY9evTGewYXKbN13eXObWwtlkZB6RDDV/zG9U/x4
 4x6MspF/9EoXNFiTJDeknMwdyr4bLIyzqK2Il4YUnJhNl3x4Cbpdx4s9NjwxmxW0t/7xFky2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_01,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506120017

Some platforms (such as qcs615 and sc7180) use the same core but have
different frequency tables. Using the opp-table allows us to separate
the core description from the frequency data and supports the use of
fallback compatibles.

Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
---
video core in QCS615 is same as that in SC7180, while the clock frequency
corners are different. In such cases, the clock frequencies are better
represented in DT than static table in video driver. The patch make use
of OPP table in DT to choose the frequency corner to scale.

Note:
Earlier discussion was concluded in [1] where it was agreed to rely on
opp-table for QCS615.

[1] https://lore.kernel.org/linux-arm-msm/c9b83c8b-68d1-43bc-99d6-d2d2b9e445f4@oss.qualcomm.com/
---
Changes in v2:
- 1. Update message based on the review comment.
- Link to v1: https://lore.kernel.org/r/20250610-use_freq_with_opp_table-v1-1-7339d690fd1a@quicinc.com
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


