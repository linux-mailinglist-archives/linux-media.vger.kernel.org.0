Return-Path: <linux-media+bounces-38256-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CC488B0F2AC
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 14:57:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9EB5544DB2
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 12:57:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D3812E717D;
	Wed, 23 Jul 2025 12:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jtrGZSh+"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E091928B7EA;
	Wed, 23 Jul 2025 12:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753275434; cv=none; b=DBzrsXphUvWTMLIT7gnPqGf8gYdURhjz3/io8H7eSZqvDzsKJOD88+yGhwk+Tfx/E4v/dJ76B9Xe+3STblWqB1VH12G02FXF8Z9f3+foA6GjAuGvHIK+aKGKCgruCQ4Z2Gs1YOYiimQo3CjcaWX6PvdEFZbT2ZfssFcVp0N7A8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753275434; c=relaxed/simple;
	bh=g04546v9MShDu0XsuDsQm8nO/iI8YyDGE8s9V/bpPsg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=Rj6G0dYqF5O8eJejtU9HKhXv21wE3Gc5phHSdhfTASuJxwIrw8F+XU+OMiWu+6EnKKNJ6/BHb7fS6m+Nbij9tusJ7b2U7CAHWypNofGHbz0P/R9FFgCYBx5N6WtyYCWH9ZaP7HZ16uYmo9KIA2q2HkSnsTnM7cJ+78iiNKGMgjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jtrGZSh+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9Skm1008040;
	Wed, 23 Jul 2025 12:57:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0BzxAFAQsJ/4ZXT91Vnwar
	VidJ3nIDJBcAPpeIEQEaQ=; b=jtrGZSh+KzUw7HTmgk4YUH+WSEiSkJVKHvPZ6k
	qt8giDLkYihtp7oSultpx+o81WeSA2kTgwluygOpcTAc5T9TdwmMIr9zJkJTbtXM
	YbHEo43X6IMYRaLcSCaTbRfDU5Zdmd5B80vIYm13JEKhytaE8S7ypP9+xYoToUOo
	3J/R8pnZA8wgfqyGGJ457OT8J0inwIdhF36HNNfIT+8shzUaRhtkzp4GA0hVXskg
	Af5bps64h0ZyDjQdw+JSbGKD9/xZms1U42g52L3EZUuZDYFWVGkw+OOyvsx8inuL
	lGgWOIZnxghg1QsWHimlxVOIbXZhmGg/crdge/7v/rz/vAWA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48047qd5vj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Jul 2025 12:57:08 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56NCv8bd017774
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Jul 2025 12:57:08 GMT
Received: from hu-renjiang-sha.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 23 Jul 2025 05:57:05 -0700
From: Renjiang Han <quic_renjiang@quicinc.com>
Date: Wed, 23 Jul 2025 18:26:02 +0530
Subject: [PATCH] media: venus: pm_helpers: add fallback for the opp-table
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250723-fallback_of_opp_table-v1-1-20a6277fdded@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAOHbgGgC/yWMWwqDMBQFtyL3u4EYax5upYjcxJs2VI1NbCmIe
 2+oH+djDszskCkFytBVOyT6hBziUqC+VOAeuNyJhbEwCC5arkTNPE6TRfccoh/iug4b2onYlbA
 xjZJe1gqKuyby4fvv3vqTE73eJb+dJ1jMxFyc57B11ci1dLqMrPGtGQmla9CMSIqsNqQ0R8Gdg
 f44flyN6omzAAAA
X-Change-ID: 20250721-fallback_of_opp_table-4ea39376f617
To: <quic_qiweil@quicinc.com>, <quic_wangaow@quicinc.com>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Renjiang Han <quic_renjiang@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753275425; l=2341;
 i=quic_renjiang@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=g04546v9MShDu0XsuDsQm8nO/iI8YyDGE8s9V/bpPsg=;
 b=7rmI8warF4XE56fW44wjtBBZrKsSajYLcX1DCeGzlBM6LiSCzF18ep2/HXIYQeWEOS1I16g/k
 Qn4URdFynlOCdtjdUWGWQxF/rRIrhJm2DDqMQ6SPwo4+Au5qMjRAY5o
X-Developer-Key: i=quic_renjiang@quicinc.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDExMCBTYWx0ZWRfXxNrKGMcXUEXy
 UL4jZvDAhrbZloYwgjBWq8LXBd8dzmOR9IWbVGSEPn15S6XdgfXEdhyvm495MKA6Wmuj6yktWbG
 k5lOk9Jhpd5lvZk2lnbf7QcYjcs473qVZrj7EW9ufHghONAPu5UaJDjZKIcFVYJ3zLP2L+A6kF+
 Rs8W847UfkCsxCDVyiqp2J6u6chBCgVq16u1zInj3kFs9+wjCc8rTMNQWipyTUCMjcXx0bXnuVe
 md7nKVqNp8tpLt7NJ1unboXVKcOAH4Gp0zQk6tmKnSSqzo5AW3T0sVKZRcEwKcg8FpOw72W1mSq
 YbWbesCoclILH7zXtPM926+IqqHtkCA3p66GGSEZPbkDxsWnKGxwQK7/cG2Apo5K9zAT5W5GHko
 qm3I+SSX0G0tgrOMxeOl4F6GEOQiEMtkcVMwnhomCVSWoG09ygA7tmwkc7CJUecqrYDilmTT
X-Proofpoint-ORIG-GUID: 7unnzVM4YDRXrvsuz7p2uaCEk68SrVpO
X-Proofpoint-GUID: 7unnzVM4YDRXrvsuz7p2uaCEk68SrVpO
X-Authority-Analysis: v=2.4 cv=IrMecK/g c=1 sm=1 tr=0 ts=6880dc25 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=GQTSHeq3D-DV7XfM2MAA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230110

Since the device trees for both HFI_VERSION_1XX and HFI_VERSION_3XX
do not include an opp-table and have not configured opp-pmdomain, they
still need to use the frequencies defined in the driver's freq_tbl.

Both core_power_v1 and core_power_v4 functions require core_clks_enable
function during POWER_ON. Therefore, in the core_clks_enable function,
if calling dev_pm_opp_find_freq_ceil to obtain the frequency fails,
it needs to fall back to the freq_tbl to retrieve the frequency.

Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
---
Since device trees for both HFI_VERSION_1XX and HFI_VERSION_3XX do not
contain an opp-table and have not configured opp-pmdomain, they still
need to use the frequencies defined in the driver's freq_tbl.

Therefore, if calling dev_pm_opp_find_freq_ceil to obtain the frequency
fails in the core_clks_enable, it needs to fall back to the freq_tbl to
retrieve the frequency.

Validated this series on QCS615 and msm8916.
---
 drivers/media/platform/qcom/venus/pm_helpers.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index 8dd5a9b0d060cddfeafd4da477ade0c7aeb6c390..27b033a3a26e0474c37353a0fe7627586e6416e2 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -40,6 +40,8 @@ static int core_clks_get(struct venus_core *core)
 
 static int core_clks_enable(struct venus_core *core)
 {
+	const struct freq_tbl *freq_tbl = core->res->freq_tbl;
+	unsigned int freq_tbl_size = core->res->freq_tbl_size;
 	const struct venus_resources *res = core->res;
 	struct device *dev = core->dev;
 	unsigned long freq = 0;
@@ -48,7 +50,14 @@ static int core_clks_enable(struct venus_core *core)
 	int ret;
 
 	opp = dev_pm_opp_find_freq_ceil(dev, &freq);
-	dev_pm_opp_put(opp);
+	if (IS_ERR(opp)) {
+		if (!freq_tbl)
+			return -EINVAL;
+		freq = freq_tbl[freq_tbl_size - 1].freq;
+	} else {
+		dev_pm_opp_put(opp);
+	}
+
 
 	for (i = 0; i < res->clks_num; i++) {
 		if (IS_V6(core)) {

---
base-commit: d086c886ceb9f59dea6c3a9dae7eb89e780a20c9
change-id: 20250721-fallback_of_opp_table-4ea39376f617

Best regards,
-- 
Renjiang Han <quic_renjiang@quicinc.com>


