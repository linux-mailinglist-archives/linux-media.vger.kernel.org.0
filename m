Return-Path: <linux-media+bounces-38303-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F20B10267
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 09:54:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FF6DAC40DD
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 07:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CF0F270EBF;
	Thu, 24 Jul 2025 07:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XSqoxeqY"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C5A2701AB;
	Thu, 24 Jul 2025 07:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753343657; cv=none; b=F6L0AwzhopcBCDRhwdAS8aUG6LUmTWLOLkBd0oqiIKewJh2sew/GpRiACZhrb9Qr7Q5FWGy7W7KLwIDN70et2Yioxwg4KjKkzd4lPX6SzziKeH7fKtee5qWKMS6LGac9JZ+FbUS1hWFMfdmLWE6cpij0RlnP33N4ipm9MS2Tfwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753343657; c=relaxed/simple;
	bh=01z5r7pzyGnwU30Kt6BGrDhM1m3MtGbY5IYkxPTylo4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=DpGeIl/dPkkqJ1UITci5GlJsY26bTdl0vp1thHCAPqWJxMfuN8afLG/KusJ9IM7Pjb9Qi+DCTd4/qAq0DmXeSTVbcpSVEJvKwrmbcIrIr8sG80YyiK4gHsGPlRMHqw8LjzoKMZnMQQv01gk2sH5CuNmShBro155ETrdPSO9zNU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XSqoxeqY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NMXTan022844;
	Thu, 24 Jul 2025 07:54:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+a9knVtomRDK4xoiMkxLuA
	MIfy1jDHEmobLdNyqhHfI=; b=XSqoxeqYH/OyEpozgI9+kFU86f66X3zZ8+Noi6
	plFurpiCdOFySpHbUZv+F6hq4ihKTpMtev9V/5o86N/xEtxObJe0GG70yqBa5T3J
	HJoihvef5t/Q5nDzeNJB5XUBj36ZFYAe6adjrVZP2DzH0Xh899hDdmkzMWFQPHCw
	/MYiC8QTYjeVO0ehiyWxBFkyNcmcXYksDaOGUaZOSD9b4qjKkRNWQweQ3+6JQqn7
	vpGvsLyZsQeQvOWO43ptZtTGHGZi2mLTCyqVm2NKxCxsLfWk9pSt/E/eiU2Qz8Ni
	OhUbtW+xpF/ytEZL/havv0vKfw5ahSD7BCyN7wdRBsEOOHeg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48313kjja9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Jul 2025 07:54:11 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56O7sAb4006049
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Jul 2025 07:54:10 GMT
Received: from hu-renjiang-sha.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 24 Jul 2025 00:54:07 -0700
From: Renjiang Han <quic_renjiang@quicinc.com>
Date: Thu, 24 Jul 2025 13:23:39 +0530
Subject: [PATCH v2] media: venus: pm_helpers: add fallback for the
 opp-table
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250724-fallback_of_opp_table-v2-1-2fc61f2407dc@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAILmgWgC/3WOQW7DIBBFr2LNulSAEzBZ5R5RZA0wNKiOccCxE
 kW+e6nTbRezeCP9p/eCQjlSgUPzgkxLLDGNFeRHA+6C4xex6CuD5HLPtRQs4DBYdN99Cn2apn5
 GOxDbEbam1SoooaFup0whPjbv6fzmTLd71c/vJ1gsxFy6XuN8aDzvlOvqkTVhbzyhci0aj6TJd
 oZ0x1FyZ+DXdYllTvm5JS9ik/3Vtf/ULYIJJjkqqXXwnvyxprg4us8aAOd1XX8At0xpAwgBAAA
 =
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
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>,
        Renjiang Han <quic_renjiang@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753343647; l=2733;
 i=quic_renjiang@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=01z5r7pzyGnwU30Kt6BGrDhM1m3MtGbY5IYkxPTylo4=;
 b=e6nbWWHQZ4qFyZ6wb8Mp6paySaRWV8zoIcUxqDLme1l4Wskr+OYhiTYF55RsYLRh55gDnyGKI
 ikqqvVa4+z8AmTKI7+i19NVPO2cMyp/1jbpdetv2vIJvcG0q9WASAsB
X-Developer-Key: i=quic_renjiang@quicinc.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA1NiBTYWx0ZWRfX7KxaXFiGuxdb
 eHTA8sJ7D462lQQU15tvoHiTN4Rk+eJKFJfbBjumeZw4RVsf2wZdYvDGIoRHLHiLOzRI2v8AVn/
 Jm6abtNP0AegPPBlVof0TrHRNyqpaxSbyehPK/Dmm41CF0X9ZzWIxtVFpZickeCdguCPBVE0J3e
 OU+ddgnO8NV4GLIAyyiY22JALe2w0ItB55LYPycZYwLNcck+LIE5deOIKIJbUDZ7mOKvA7TyoJE
 stDPcpkPN/D9Z89otNIJUE4/Hfp6OHmHiwJZhiCFsTcI5bsFX3KzvMwed7fre9pcBrC6MB+MVRJ
 WdUqIHo97GiEETdkSznNIswfsMZ8LvddNVtj9xhuyOM+gVZcDo+blfCxwBgSE700ypgetqJB2ak
 O6tMxLByms74D/IHtEhS8XkOpncOlxFvEQ7lq7sH55ExT+B8WZW7jCvaRkLqMDkifrftS39k
X-Proofpoint-ORIG-GUID: Zl4ocbwZZRtVUelQrwqnqf-76Otpd0VT
X-Proofpoint-GUID: Zl4ocbwZZRtVUelQrwqnqf-76Otpd0VT
X-Authority-Analysis: v=2.4 cv=C/TpyRP+ c=1 sm=1 tr=0 ts=6881e6a3 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=GQTSHeq3D-DV7XfM2MAA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_01,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 mlxscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=999 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507240056

Since the device trees for both HFI_VERSION_1XX and HFI_VERSION_3XX
do not include an opp-table and have not configured opp-pmdomain, they
still need to use the frequencies defined in the driver's freq_tbl.

Both core_power_v1 and core_power_v4 functions require core_clks_enable
function during POWER_ON. Therefore, in the core_clks_enable function,
if calling dev_pm_opp_find_freq_ceil to obtain the frequency fails,
it needs to fall back to the freq_tbl to retrieve the frequency.

Fixes: b179234b5e59 ("media: venus: pm_helpers: use opp-table for the frequency")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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
Changes in v2:
- 1. Update the returned error value as per the feedback.
- Link to v1: https://lore.kernel.org/r/20250723-fallback_of_opp_table-v1-1-20a6277fdded@quicinc.com
---
 drivers/media/platform/qcom/venus/pm_helpers.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index 8dd5a9b0d060cddfeafd4da477ade0c7aeb6c390..77c12273dbb9505244e260fc8fa635e4fe045236 100644
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
+			return -ENODEV;
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


